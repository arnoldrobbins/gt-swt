# c_preprocessor --- handle the C preprocessor statements

   subroutine c_preprocessor

   include "c1_com.r.i"

   integer t
   integer skip_whitespace, lookup, dgetsym
   character text (MAXTOK)
   untyped info (IDSIZE)

   repeat
      t = dgetsym (text)
      until (t ~= ' 'c && t ~= '#'c)

   if (t == NEWLINE)
      return

   if (t ~= IDSYM || lookup (text, info, Pp_tbl) == NO) {
      SYNERR ("Unrecognized # statement"p)
      return
      }

   select (IDPTR (info))
      when (UNDEFSYM)
         call remove_definition
      when (DEFINESYM)
         call enter_definition
      when (INCLUDESYM)
         call open_include
      when (IFDEFSYM)
         call process_ifdef
      when (IFNDEFSYM)
         call process_ifndef
      when (ELSESYM)
         call gobble_until_else_or_endif
      when (ENDIFSYM)
         ;
      when (IFSYM)
         SYNERR ("#if not implemented"p)     # not implemented yet
      when (LINESYM)
         call reset_line
DB    when (DEBUGSYM)
DB       call process_debug
   else
      FATAL ("Bogus IDPTR in Pp_tbl entry"p)

   if (skip_whitespace (text) ~= NEWLINE)
      SYNERR ("Garbage following preprocessor statement"p)

   return
   end



# process_ifdef --- handle the preprocessor #ifdef statement

   subroutine process_ifdef

   include "c1_com.r.i"

   integer t
   integer lookup, dgetsym
   character text (MAXTOK)
   untyped info (IDSIZE)

   repeat
      t = dgetsym (text)
      until (t ~= ' 'c)

   if (t ~= IDSYM)
      SYNERR ("Only identifiers may appear after #ifdef"p)
   else {
      if (lookup (text, info, Keywd_tbl) == NO)
         call gobble_until_else_or_endif
      }

   return
   end



# process_ifndef --- handle the processor #ifndef command

   subroutine process_ifndef

   include "c1_com.r.i"

   integer t
   integer lookup, dgetsym
   character text (MAXTOK)
   untyped info (IDSIZE)

   repeat
      t = dgetsym (text)
      until (t ~= ' 'c)

   if (t ~= IDSYM)
      SYNERR ("Only identifiers may appear after #ifndef"p)
   else {
      if (lookup (text, info, Keywd_tbl) == YES)
         call gobble_until_else_or_endif
      }

   return
   end



# gobble_until_else_or_endif --- skip over stuff

   subroutine gobble_until_else_or_endif

   include "c1_com.r.i"

   integer t, nl
   integer lookup, dgetsym
   character text (MAXTOK)
   untyped info (IDSIZE)

   t = dgetsym (text)
   nl = 0

   repeat {
      while (t ~= '#'c) {     # gobble until next '#'
         if (t == EOF) {
            SYNERR ("Unmatched #if... statement"p)
            return
            }
         t = dgetsym (text)
         }
                              # found a '#'... gobble multiple '#'s
                              # and blanks
      while (t == '#'c || t == ' 'c)
         t = dgetsym (text)

      if (t ~= IDSYM || lookup (text, info, Pp_tbl) == NO)
         ;  # skip this symbol
      else if ((IDPTR (info) == ENDIFSYM || IDPTR (info) == ELSESYM)
               && nl == 0)
         break
      else if (IDPTR (info) == IFSYM || IDPTR (info) == IFDEFSYM
            || IDPTR (info) == IFNDEFSYM)
         nl += 1
      else if (IDPTR (info) == ENDIFSYM)
         nl -= 1

      DBG (41, call print (ERROUT, "gobble...: nl=*i*n"p, nl))
      t = dgetsym (text)
      }

   return
   end



# reset_line --- reset the current line number

   subroutine reset_line

   include "c1_com.r.i"

   integer t, i, k
   integer ctoi, ctoc, skip_whitespace
   character text (MAXTOK), c

   t = skip_whitespace (text)

   if (t ~= SHORTLITSYM)
      SYNERR ("Integer required after #line"p)
   else {
      i = 1
      k = ctoi (text, i)
      if (text (i) ~= EOS)
         SYNERR ("Integer required after #line"p)
      else if (Level > 0)
         Line_number (Level) = k
      }

   t = skip_whitespace (text)
   if (t == NEWLINE)
      call putback (NEWLINE)
   else if (t == STRLITSYM) {
      i = ctoc (text (2), Module_name, MAXTOK)
      Module_name (i) = EOS         # Kill the closing quote
      }
   else if (t == '"'c) {
      for (i = 1; i <= MAXTOK; i += 1) {
         ngetch (c)
         if (c == '"'c || c == NEWLINE || c == EOF)
            break
         Module_name (i) = c
         }
      Module_name (i) = EOS
      if (c ~= '"'c)
         SYNERR ("Missing ending bracket in #line"p)
      }
   else
      SYNERR ("File name must follow integer in #line"p)

   return
   end



# process_debug --- process a #debug statement

DB subroutine process_debug

DB include "c1_com.r.i"

DB integer newflag, v, i
DB integer equal, ctoi

DB newflag = YES
DB call gettok
DB if (Nsymbol == IDSYM)
DB    if (equal (Nsymtext, "on"s) == YES) {
DB       newflag = YES
DB       call gettok
DB       }
DB    else if (equal (Nsymtext, "off"s) == YES) {
DB       newflag = NO
DB       call gettok
DB       }

DB if (Nsymbol ~= SHORTLITSYM) {
DB    SYNERR ("Illegal #debug flag"p)
DB    return
DB    }

DB i = 1
DB v = ctoi (Nsymtext, i)
DB if (v < 1 || v > MAXDBFLAG)
DB    SYNERR ("#Debug flag out of range"p)
DB else
DB    Dbg_flag (v) = newflag

DB return
DB end



# open_include --- find the name and open the #include file

   subroutine open_include

   include "c1_com.r.i"

   integer curok, t, fp
   integer follow, skip_whitespace, length, ctoc
   file_des fd
   file_des open
   character text (MAXTOK), filename (MAXPATH), c, term
   pointer sdupl

   if (Level >= MAXLEVEL)
      FATAL ("#Includes nested too deeply"p)

   t = skip_whitespace (text)
   if (t == '<'c || t == '"'c || t == "'"c) {
      if (t == '<'c) {
         term = '>'c
         curok = NO
         }
      else {
         term = t
         curok = YES
         }
      for (fp = 1; fp <= MAXTOK; fp += 1) {
         ngetch (c)
         if (c == term || c == NEWLINE || c == EOF)
            break
         filename (fp) = c
         }
      filename (fp) = EOS
      if (c ~= term)
         SYNERR ("Missing ending bracket in #include"p)
      }
   else if (t == STRLITSYM) {
      curok = YES
      fp = ctoc (text (2), filename, MAXPATH)
      filename (fp) = EOS     # clobber the ending quote
      }
   else {
      SYNERR ("File name must follow #include"p)
      return
      }

   DBG (43, call print (ERROUT, "open_include: nm='*s', dirs=:"p, filename)
   DB       for (fp = 1; fp < Dir_top; fp += 1 + length (Dir_name (fp)))
   DB          call print (ERROUT, "*s:"s, Dir_name (fp))
   DB       call print (ERROUT, "*n"s))

   fd = ERR
   if (curok == YES)
      fd = open (filename, READ)
   for (fp = 1; fd == ERR && fp < Dir_top; fp += length (Dir_name (fp)) + 1)
      if (follow (Dir_name (fp), 0) == OK) {
         fd = open (filename, READ)
         call follow (EOS, 0)
         }
   if (fd == ERR && follow ("=incl="s, 0) == OK) {
      fd = open (filename, READ)
      call follow (EOS, 0)
      }

   if (fd == ERR) {
      ERROR_SYMBOL (filename)
      SYNERR ("Can't open #include file"p)
      return
      }

   Fname_table (Level) = sdupl (Module_name)    # stash current module
   call ctoc (filename, Module_name, MAXPATH)   # name & get new one
                                                # for fancier error msgs

   Level += 1
   Line_number (Level) = 0
   Infile (Level) = fd

   return
   end



# remove_definition --- delete a previous definition

   subroutine remove_definition

   include "c1_com.r.i"

   integer t
   integer skip_whitespace, lookup
   character id (MAXTOK), text (MAXTOK)
   untyped info (IDSIZE)

   if (skip_whitespace (id) ~= IDSYM) {
      SYNERR ("Identifier must follow '#undef'"p)
      return
      }

   if (lookup (id, info, Keywd_tbl) == NO
            || IDTYPE (info) ~= DEFIDTYPE)
      return

   call dsfree (IDPTR (info))

   call delete (id, Keywd_tbl)

   return
   end


# invoke_macro --- process invocation of a macro

   subroutine invoke_macro (info)
   untyped info (IDSIZE)

   include "c1_com.r.i"

   integer i, np, j, l
   integer ctoc
   character defn (MAXDEF)
   pointer n
   pointer table (MAXPARAMS)

   if (IDVAL (info) == LINEIDVAL) {
      call encode (defn, MAXDEF, "*i"s, Symline)
      call putback_str (defn)
      return
      }
   else if (IDVAL (info) == FILEIDVAL) {
      call encode (defn, MAXDEF, '"*s"'s, Module_name)
      call putback_str (defn)
      return
      }

   np = 0

   if (IDVAL (info) > -1)     # this define requires parameters
      call get_actual_parameters (table, np)

   DBG (8, call print (ERROUT, "invoke_macro: *i actual parameters*n"p,
   DB         np))

   j = 1
   for (i = IDPTR (info); Mem (i) ~= EOS; i += 1) {
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

   DBG (9,  call print (ERROUT, "invoke_macro: define string: '*s'*n"p,
   DB          defn))

   call putback_str (defn)

   for (i = 1; i <= np; i += 1)
      call dsfree (table (i))

   return
   end



# enter_definition --- enter name and definition of macro

   subroutine enter_definition

   include "c1_com.r.i"

   character id (MAXTOK), defn (MAXDEF), text (MAXTOK)

   integer i, t, np
   integer skip_whitespace, get_formal_parameters, dgetsym
   pointer params, p
   pointer get_definition, mktabl

   t = skip_whitespace (id)
   if (t ~= IDSYM) {
      SYNERR ("only identifiers may be defined"p)
      return
      }

   t = dgetsym (text)
   if (t == '('c) {              # are there formal parameters?
      if (get_formal_parameters (params, np) == ERR)
         return
      t = skip_whitespace (text)
      }
   else {
      np = -1
      params = 0
      }
   call putback_str (text)

   DBG (10, call print (ERROUT,
   DB         "enter_definition: *i formal parameters*n"p, np))

   p = get_definition (params)
   if (p == ERR)                 # he found an error
      return

   call install_definition (id, np, p)

   call putback (NEWLINE)

   return
   end


# install_definition --- put a macro definition in the table

   subroutine install_definition (id, np, p)
   character id (MAXLINE)
   integer np
   pointer p

   include "c1_com.r.i"

   untyped info (IDSIZE)
   integer lookup

   if (lookup (id, info, Keywd_tbl) == YES     # deallocate old definition
          && IDTYPE (info) == DEFIDTYPE)
      call dsfree (IDPTR (info))

   IDTYPE (info) = DEFIDTYPE
   IDVAL (info) = np
   IDPTR (info) = p

   DBG (11, call print (ERROUT, "install_definition: entered: *s, *i, *i*n"p,
   DB                      id, np, p))

   call enter (id, info, Keywd_tbl)

   return
   end


# dgetsym --- get a symbol for the define processor

   character function dgetsym (text)
   character text (ARB)

   integer tl
   character c

   include "c1_com.r.i"

   repeat {
      ngetch (c)
      select (c)
         when (SET_OF_LETTERS, '$'c, '_'c) {
            text (1) = c
            tl = 2
            ngetch (c)
            while (IS_LETTER (c) || IS_DIGIT (c) || c == '$'c || c == '_'c) {
               text (tl) = c
               tl = tl + 1
               if (tl >= MAXTOK) {
                  SYNERR ("token too long"p)
                  break
                  }
               ngetch (c)
               }
            text (tl) = EOS
            call putback (c)
            DBG (12, call print (ERROUT, "dgetsym: returning *i '*s'*n"p,
            DB          IDSYM, text))
            return (IDSYM)
            }
#        when ('"'c, "'"c) {
#           text (1) = c
#           tl = 2
#           ngetch (c)
#           while (tl < MAXTOK - 2 && c ~= NEWLINE && c ~= text (1)) {
#              if (c == '\'c) {
#                 text (tl) = '\'c
#                 tl += 1
#                 ngetch (c)
#                 }
#              text (tl) = c
#              tl += 1
#              ngetch (c)
#              }
#           text (tl) = text (1)
#           text (tl + 1) = EOS
#           if (c == NEWLINE)
#              SYNERR ("Missing closing quote"p)
#           else if (tl >= MAXTOK - 2)
#              SYNERR ("Quoted literal too long"p)
#           DBG (12, call print (ERROUT, "dgetsym: returning *i '*s'*n"p,
#           DB          STRLITSYM, text))
#           return (STRLITSYM)
#           }
         when (SET_OF_DIGITS) {
            text (1) = c
            tl = 2
            ngetch (c)
            while (IS_DIGIT (c)) {
               text (tl) = c
               tl += 1
               if (tl >= MAXTOK) {
                  SYNERR ("Token too long"p)
                  break
                  }
               ngetch (c)
               }
            text (tl) = EOS
            call putback (c)
            DBG (12, call print (ERROUT, "dgetsym: returning *i '*s'*n"p,
            DB       SHORTLITSYM, text))
            return (SHORTLITSYM)
            }
         when ('\'c) {
            ngetch (c)
            if (c == NEWLINE)
               next
            text (1) = '\'c
            text (2) = c
            text (3) = EOS
            DBG (12, call print (ERROUT, "dgetsym: returning *i '*s'*n"p,
            DB       SHORTLITSYM, text))
            return (STRLITSYM)
            }
         when ('/'c) {
            ngetch (c)
            if (c == '*'c) {
               ngetch (c)
               repeat {
                  while (c ~= '*'c && c ~= EOF)
                     ngetch (c)
                  if (c == EOF) {
                     SYNERR ("missing trailing comment delimiter"p)
                     break
                     }
                  ngetch (c)
                  } until (c == '/'c)
               next
               }
            call putback (c)
            c = '/'c
            break
            }
      else
         break
      }

   text (1) = c
   text (2) = EOS

   DBG (12, call print (ERROUT, "dgetsym: returning *i '*s'*n"p, c, text))

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

   untyped info (IDSIZE)

   table = mktabl (IDSIZE)
   number = 0
   repeat {
      t = skip_whitespace (text)
      if (number == 0 && t == ')'c)
         return (OK)
      else if (t ~= IDSYM) {
         SYNERR ("define formal parameters must be identifiers"p)
         call rmtabl (table)
         return (ERR)
         }

      number = number + 1
      IDVAL (info) = number       # put it in the table
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
      until (t ~= ' 'c && t ~= HT)

   return (t)
   end



# get_definition --- collect a definition & stuff it into dynamic storage

   pointer function get_definition (table)
   pointer table

   include "c1_com.r.i"

   integer buflen, l
   integer dgetsym, lookup, length
   character defn (MAXDEF), text (MAXTOK)
   pointer sdupl

   untyped info (IDSIZE)

   buflen = 1
   defn (1) = EOS
   repeat {
      select (dgetsym (text))
#        when ('\'c) {
#           if (dgetsym (text) == NEWLINE)
#              next
#           call putback_str (text)
#           text (1) = '\'c
#           text (2) = EOS
#           }
         when (NEWLINE)
            break
         when (EOF) {
            SYNERR ("Missing right paren or EOF in define text"p)
            break
            }
         when (IDSYM) {
            if (table ~= 0 && lookup (text, info, table) == YES) {
               text (1) = IDSYM
               text (2) = IDVAL (info)
               text (3) = EOS
               }
         }

      l = length (text)
      if (buflen + l >= MAXDEF) {
         SYNERR ("definition too long"p)
         break
         }
      call scopy (text, 1, defn, buflen)
      buflen = buflen + l

      }  # end repeat

   if (table ~= 0)
      call rmtabl (table)

   DBG (13,
   DB call print (ERROUT, "get_definition: text: '"p)
   DB for (l = 1; defn (l) ~= EOS; l = l + 1)
   DB    if (defn (l) ~= IDSYM)
   DB       call putch (defn (l), ERROUT)
   DB    else {
   DB       l = l + 1
   DB       call print (ERROUT, "[*i]"p, defn (l))
   DB       }
   DB call print (ERROUT, "'*n"p)
   DB )

   return (sdupl (defn))
   end



# get_actual_parameters --- collect an actual parameter list

   subroutine get_actual_parameters (table, np)
   pointer table (MAXPARAMS)
   integer np

   integer np, t
   integer dgetsym, collect_actual_parameter
   character buf (MAXDEF), text (MAXTOK)
   pointer sdupl

   repeat
      t = dgetsym (text)
      until (t ~= ' 'c && t ~= HT)

   if (t ~= '('c) {
      np = 0
      call putback_str (text)
      return                  # this is legal, but frowned upon
      }                       # (possibly shouldn't be legal)

   for (np = 1; np <= MAXPARAMS; np = np + 1) {
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

   integer i, nlpar, l
   integer length, dgetsym
   character inquote
   character text (MAXTOK)

   include "c1_com.r.i"

   i = 1
   buf (1) = EOS
   nlpar = 0
   inquote = ' 'c
   repeat {
      select (dgetsym (text))
         when ('('c)
            if (inquote == ' 'c)
               nlpar = nlpar + 1
         when (')'c)
            if (inquote == ' 'c) {
               nlpar = nlpar - 1
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
      l = length (text)
      if (i + l >= MAXDEF) {
         SYNERR ("define actual parameter too long"p)
         break
         }
      call scopy (text, 1, buf, i)
      i += l
      }  # end of repeat

   DBG (14, call print (ERROUT, "collect_actual_parameter: '*s'*n"p, buf))

   if (text (1) == ','c)
      return (OK)
   return (EOF)
   end
