# remove_definition --- delete a previous definition

   subroutine remove_definition

   include "rp_com.i"

   integer skip_whitespace, lookup
   character id (MAXTOK), text (MAXTOK)
   untyped info (SYMINFOSIZE)

   if (skip_whitespace (id) ~= IDSYM) {
      SYNERR ("Identifier must follow 'undefine'"p)
      return
      }
   call delete_underscores (id, id)

   if (skip_whitespace (text) ~= ')'c) {
      SYNERR ("Right paren must follow identifier in 'undefine'"p)
      return
      }

   if (lookup (id, info, Id_table) == NO
            || info (SYMBOLTYPE) ~= DEFID_SYMBOLTYPE)
      return

   call dsfree (info (SYMBOLDATA))

   call delete (id, Id_table)

   return
   end



# invoke_macro --- process invocation of a macro

   subroutine invoke_macro (info)
   untyped info (SYMINFOSIZE)

   include "rp_com.i"

   integer i, np, j
   integer ctoc
   character defn (MAXDEF)
   pointer table (MAXPARAMS)

   np = 0

   if (info (SYMBOLVAL) > 0)     # this define requires parameters
      call get_actual_parameters (table, np)

DEBUG call print (ERROUT, "invoke_macro: *i actual parameters*n"p, np)

   j = 1
   for (i = info (SYMBOLDATA); Mem (i) ~= EOS; i += 1) {
      if (Mem (i) ~= IDSYM) {
         defn (j) = Mem (i)
         j += 1
         }
      else {
         i += 1
         if (np >= Mem (i))      # if it was specified
            j += ctoc (Mem (table (Mem (i))), defn (j), MAXDEF - j + 1)
         }
      if (j >= MAXDEF - 1) {
         SYNERR ("result of define invocation too long"p)
         break
         }
      }
   defn (j) = EOS

DEBUG call print (ERROUT, "invoke_macro: define string: '*s'*n"p, defn)

   call putback_str (defn)

   for (i = 1; i <= np; i += 1)
      call dsfree (table (i))

   return
   end



# enter_definition --- enter name and definition of macro

   subroutine enter_definition

   include "rp_com.i"

   character id (MAXTOK), text (MAXTOK)

   integer t, np
   integer skip_whitespace, get_formal_parameters, lookup
   pointer params, p
   pointer get_definition

   untyped info (SYMINFOSIZE)

   t = skip_whitespace (id)
   if (t ~= IDSYM) {
      SYNERR ("only identifiers may be defined"p)
      return
      }
   call delete_underscores (id, id)

   t = skip_whitespace (text)
   if (t == '('c) {              # are there formal parameters?
      if (get_formal_parameters (params, np) == ERR)
         return
      t = skip_whitespace (text)
      }
   else {
      np = 0
      params = 0
      }

DEBUG call print (ERROUT, "enter_definition: *i formal parameters*n"p, np)

   if (t ~= ','c) {
      SYNERR ("define identifer must be followed by a comma"p)
      if (params ~= 0)
         call rmtabl (params)
      return
      }

   p = get_definition (params)
   if (p == ERR)                 # he found an error
      return

   if (lookup (id, info, Id_table) == YES     # deallocate old definition
          && info (SYMBOLTYPE) == DEFID_SYMBOLTYPE)
      call dsfree (info (SYMBOLDATA))

   info (SYMBOLTYPE) = DEFID_SYMBOLTYPE
   info (SYMBOLVAL) = np
   info (SYMBOLDATA) = p

DEBUG call print (ERROUT, "enter_definition: entered: *s, *i, *i*n"p,
DEBUG                      id, np, p)

   call enter (id, info, Id_table)

   return
   end



# dgetsym --- get a symbol for the define processor

   character function dgetsym (text)
   character text (ARB)

   integer tl
   character c

   include "rp_com.i"

   ngetch (c)
   if (IS_LETTER (c)) {
      text (1) = c
      tl = 1
      ngetch (c)
      while (IS_LETTER (c) || IS_DIGIT (c) || c == '_'c || c == '$'c) {
         if (tl >= MAXTOK) {
            SYNERR ("token too long"p)
            break
            }
         text (tl + 1) = c
         tl += 1
         ngetch (c)
         }
      text (tl + 1) = EOS
      call putback (c)
DEBUG call print (ERROUT, "dgetsym: returning *i '*s'*n"p, IDSYM, text)
      return (IDSYM)
      }

   text (1) = c
   text (2) = EOS

DEBUG call print (ERROUT, "dgetsym: returning *i '*s'*n"p, c, text)
   return (c)
   end



# get_formal_parameters --- place the formal parameter list in a table

   integer function get_formal_parameters (table, number)
   pointer table
   integer number

   integer t
   integer skip_whitespace
   character text (MAXTOK)
   pointer mktabl

   untyped info (SYMINFOSIZE)

   table = mktabl (SYMINFOSIZE)
   number = 0
   repeat {
      t = skip_whitespace (text)
      if (t ~= IDSYM) {
         SYNERR ("define formal parameters must be identifiers"p)
         call rmtabl (table)
         return (ERR)
         }
      call delete_underscores (text, text)

      number += 1
      info (SYMBOLVAL) = number       # put it in the table
      call enter (text, info, table)

      t = skip_whitespace (text)
      if (t ~= ','c && t ~= ')'c) {
         SYNERR ("commas must separate define formal parameters"p)
         call rmtabl (table)
         return (ERR)
         }
      } until (t == ')'c)

   return (OK)
   end



# skip_whitespace --- get next symbol and skip NEWLINES & blanks
   integer function skip_whitespace (text)
   character text (ARB)

   integer t
   integer dgetsym

   repeat
      t = dgetsym (text)
      until (t ~= NEWLINE && t ~= ' 'c)

   return (t)
   end



# get_definition --- collect a definition & stuff it into dynamic storage

   pointer function get_definition (table)
   pointer table

   include "rp_com.i"

   integer nlpar, buflen, l
   integer dgetsym, lookup, length
   character defn (MAXDEF), text (MAXTOK), id (MAXTOK), inquote
   pointer sdupl

   untyped info (SYMINFOSIZE)

   nlpar = 0
   inquote = ' 'c
   buflen = 1
   defn (1) = EOS
   repeat {
      select (dgetsym (text))
      when ('('c)
         if (inquote == ' 'c)
            nlpar += 1
      when (')'c)
         if (inquote == ' 'c) {
            nlpar -= 1
            if (nlpar < 0)
               break
            }
      when ('"'c) {
         if (inquote == ' 'c)
            inquote = '"'c
         else if (inquote == '"'c)
            inquote = ' 'c
         }
      when ("'"c) {
         if (inquote == ' 'c)
            inquote = "'"c
         else if (inquote == "'"c)
            inquote = ' 'c
         }
      when (EOF) {
         SYNERR ("Missing right paren or EOF in define text"p)
         break
         }
      when (IDSYM) {
         call delete_underscores (text, id)
         if (table ~= 0 && lookup (id, info, table) == YES) {
            text (1) = IDSYM
            text (2) = info (SYMBOLVAL)
            text (3) = EOS
            }
         }

      l = length (text)
      if (buflen + l >= MAXDEF) {
         SYNERR ("definition too long"p)
         break
         }
      call scopy (text, 1, defn, buflen)
      buflen += l

      }  # end repeat

   if (table ~= 0)
      call rmtabl (table)

DEBUG call print (ERROUT, "get_definition: text: '"p)
DEBUG for (l = 1; defn (l) ~= EOS; l += 1)
DEBUG    if (defn (l) ~= IDSYM)
DEBUG       call putch (defn (l), ERROUT)
DEBUG    else {
DEBUG       l += 1
DEBUG       call print (ERROUT, "[*i]"p, defn (l))
DEBUG       }
DEBUG call print (ERROUT, "'*n"p)

   return (sdupl (defn))
   end



# get_actual_parameters --- collect an actual parameter list

   subroutine get_actual_parameters (table, np)
   pointer table (MAXPARAMS)
   integer np

   integer t
   integer dgetsym, collect_actual_parameter
   character buf (MAXDEF), text (MAXTOK)
   pointer sdupl

   repeat
      t = dgetsym (text)
      until (t ~= ' 'c)

   if (t ~= '('c) {
      np = 0
      call putback_str (text)
      return                  # this is legal, but frowned upon
      }                       # (possible shouldn't be legal)

   for (np = 1; np <= MAXPARAMS; np += 1) {
      t = collect_actual_parameter (buf)
      table (np) = sdupl (buf)
      if (t == EOF)
         return
      }
   SYNERR ("Too many actual parameters specified"p)
   np = MAXPARAMS

   return
   end



# collect_actual_parameter --- collect a single actual parameter;
#                              returns EOF *and* a string on last call

   integer function collect_actual_parameter (buf)
   character buf (MAXDEF)

   integer i, nlpar
   character c, inquote

   include "rp_com.i"

   i = 1
   inquote = ' 'c
   nlpar = 0
   repeat {
      ngetch (c)
      select (c)
         when ('('c)
            if (inquote == ' 'c)
               nlpar += 1
         when (')'c)
            if (inquote == ' 'c) {
               nlpar -= 1
               if (nlpar < 0)
                  break
               }
         when ('"'c) {
            if (inquote == ' 'c)
               inquote = '"'c
            else if (inquote == '"'c)
               inquote = ' 'c
            }
         when ("'"c) {
            if (inquote == ' 'c)
               inquote = "'"c
            else if (inquote == "'"c)
               inquote = ' 'c
            }
         when (','c)
            if (inquote == ' 'c && nlpar <= 0)
               break
         when (EOF) {
            SYNERR ("unbalanced paren or EOF in define actual parameter list"p)
            break    # don't give up; upper routine up cleans up table for us
            }
      buf (i) = c
      i += 1
      if (i >= MAXDEF) {
         SYNERR ("define actual parameter too long"p)
         break
         }
      }  # end of repeat
   buf (i) = EOS

DEBUG call print (ERROUT, "collect_actual_parameter: '*s'*n"p, buf)

   if (c == ','c)
      return (OK)
   return (EOF)
   end



# delete_underscores --- remove underscores from an identifier
#                        ('in' and 'out' can be the same string)

   subroutine delete_underscores (in, out)
   character in (ARB), out (ARB)

   include "rp_com.i"

   integer i, j
   integer mapdn

   j = 1
   for (i = 1; in (i) ~= EOS; i += 1) {
      if (in (i) ~= '_'c) {
         if (ARG_PRESENT (m))
            out (j) = mapdn (in (i))
         else
            out (j) = in (i)
         j += 1
         }
      }
   out (j) = EOS

   return
   end
