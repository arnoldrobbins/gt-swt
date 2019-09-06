# synerr --- report syntax error

   subroutine synerr (message)
   packed_char message (ARB)

   include "rp_com.i"

   integer i, nl, el, ml
   integer encode, ctoc, ptoc, length
   character nums (MAXLINE), msg (MAXLINE)

  # Build error location string
   nl = 1
   for (i = 1; i <= Level; i += 1)
      nl += encode (nums (nl), MAXLINE - nl, "*5i"s, Line_number (i))
   nl += encode (nums (nl), MAXLINE - nl, " (*s): "s, Module_long_name)

  # Unpack message
   ml = ptoc (message, '.'c, msg, MAXLINE)

  # Try to get the error context
   el = length (Error_sym)
   if (el == 0)
      if (Symbol == IDSYM) {
         call get_long_name (Error_sym)
         el = length (Error_sym)
         }
      else if (Symbol == NEWLINE)
         el = ctoc ("<NEWLINE>"s, Error_sym, MAXTOK)
      else if (Symbol == EOF)
         el = ctoc ("<EOF>"s, Error_sym, MAXTOK)
      else if (Symtext (Symlen + 1) == EOS)
         el = ctoc (Symtext, Error_sym, MAXTOK)

  # Try to print the message
   if (el == 0)
      call print (ERROUT, "*s*s.*n"s, nums, msg)
   else if (el + nl + ml <= 73)
      call print (ERROUT, "*s'*s' *s.*n"s, nums, Error_sym, msg)
   else
      call print (ERROUT, "*s'*s'*n*10x*s.*n"s, nums, Error_sym, msg)

  # put the error message in the Fortran
   call outdon (CODE)
   call outtab (CODE)
   call outstr ("Ratfor error at "s, CODE)
   for (i = 1; i <= Level; i += 1) {
      call outnum (Line_number (i), CODE)
      call outch (' 'c, CODE)
      }
   call outstr (msg, CODE)
   call outdon (CODE)

   Error_sym (1) = EOS

  # See if we should abort at the end of the run
   if (ARG_PRESENT (a))
      call seterr (1)

   return
   end



# fatalerr --- report fatal error and die

   subroutine fatalerr (msg)
   integer msg (ARB)

   SYNERR (msg)
   call cleanup
   call error ("program terminated"p)

   return
   end



# sdupl --- duplicate a string in dynamic storage space

   pointer function sdupl (str)
   character str (ARB)

   include "rp_com.i"

   integer length

   pointer dsget

   sdupl = dsget (length (str) + 1)
   call scopy (str, 1, Mem, sdupl)

   return
   end



# enter_long_name --- make a long identifier unique

   subroutine enter_long_name

   include "rp_com.i"

   integer make_unique
   integer scopy

   character unique_name (MAXTOK)

   pointer sdupl

   untyped info (SYMINFOSIZE)

   if (make_unique (Symtext, unique_name) == YES) {
      info (SYMBOLTYPE) = LNAME_SYMBOLTYPE
      info (SYMBOLDATA) = sdupl (unique_name)
      call enter (Symtext, info, Id_table)
      call enter (unique_name, 0, Uname_table)
      Symlen = scopy (unique_name, 1, Symtext, 1)
      }
   else
      SYNERR ("identifier cannot be made unique.")

   return
   end



# make_unique --- convert an identifier to one not yet seen

   integer function make_unique (id, uid)
   character id (MAXTOK), uid (MAXTOK)

   include "rp_com.i"

   integer i, junk
   integer lookup

  # copy over first part of identifier:
   for (i = 1; i <= MAXIDLENGTH && id (i) ~= EOS; i += 1) {
      if ('A'c <= id (i) && id (i) <= 'Z'c)
         uid (i) = id (i) - 'A'c + 'a'c
      else
         uid (i) = id (i)
      }

  # pad out to MAXIDLENGTH characters with 'a'c's:
   for (; i <= MAXIDLENGTH; i += 1)
      uid (i) = 'a'c
   uid (MAXIDLENGTH + 1) = EOS

  # insert "unique fill" character:
   uid (MAXIDLENGTH) = UFCHAR

   while (lookup (uid, junk, Uname_table) == YES) {
      for (i = MAXIDLENGTH - 1; i > 1; i -= 1)
         if ('a'c <= uid (i) && uid (i) < 'z'c) {
            uid (i) += 1
            for (i += 1; i <= MAXIDLENGTH - 1; i += 1)
               uid (i) = 'a'c
            break
            }

      if (i == 1) {
         make_unique = NO
         return
         }
      }

   make_unique = YES
   return
   end



# labgen --- generate 'n' consecutive labels

   integer function labgen (n)
   integer n

   include "rp_com.i"

   labgen = Curlab
   Curlab += n

   return
   end



# vargen --- generate a unique variable name

   subroutine vargen (name)
   character name (ARB)

   include "rp_com.i"

   integer make_unique

   if (make_unique (Last_var, name) == YES) {
      call enter (name, 0, Uname_table)
      call ctoc (name, Last_var, MAXTOK)
      }
   else {
      SYNERR ("in vargen:  cannot generate new variable"p)
      name (1) = EOS
      }

   return
   end



# save_module_name --- squirrel away a module name

   subroutine save_module_name

   include "rp_com.i"

   call scopy (Symtext, 1, Module_name, 1)
   call get_long_name (Module_long_name)

   return
   end



# get_long_name --- return the long identifier for the current symbol
#                   (uphold the conspiracy to avoid a lot of copying)

   subroutine get_long_name (str)
   character str (ARB)

   include "rp_com.i"

   if (Sym_long_text (1) == EOS)
      call scopy (Symtext, 1, str, 1)
   else
      call scopy (Sym_long_text, 1, str, 1)

   return
   end



# gen_char_data --- generate a character for a Fortran DATA declaration

   subroutine gen_char_data (var, index, value)
   character var (ARB)
   integer index, value

   integer tlit

   call gen_data_item (var, index, tlit (value))

   return
   end



# gen_data_item --- generate an item in a Fortran DATA declaration

   subroutine gen_data_item (var, index, value)
   character var (ARB)
   integer index, value

   include "rp_com.i"

   if (ARG_PRESENT (v)) {
      call outtab (DATA)
      call outstr ("DATA "s, DATA)
      call outstr (var, DATA)
      call outch ('('c, DATA)
      call outnum (index, DATA)
      call outstr (")/"s, DATA)
      call outnum (value, DATA)
      call outch ('/'c, DATA)
      call outdon (DATA)
      }
   else {
      if (index == 1) {
         call outtab (DATA)
         call outstr ("DATA "s, DATA)
         call outstr (var, DATA)
         call outch ('/'c, DATA)
         }
      else
         call outch (','c, DATA)
      call outnum (value, DATA)
      }

   return
   end



# gen_data_end --- generate end of Fortran DATA statement

   subroutine gen_data_end

   include "rp_com.i"

   if (~ ARG_PRESENT (v)) {
      call outch ('/'c, DATA)
      call outdon (DATA)
      }

   return
   end



# gen_int_decl --- generate a Fortran INTEGER declaration

   subroutine gen_int_decl (var, sub)
   character var (ARB)
   integer sub

   call outtab (DECL)
   call outstr ("INTEGER "s, DECL)
   call outstr (var, DECL)
   if (sub > 0) {
      call outch ('('c, DECL)
      call outnum (sub, DECL)
      call outch (')'c, DECL)
      }
   call outdon (DECL)

   return
   end



# tlit --- convert a character to the output character set

   integer function tlit (c)
   character c

   include "rp_com.i"

   if (c == EOS)
      return (Tlit_eos)

   if (c < 0 || c >= MAXCHARVAL)
      return (0)

   return (Tlit_char (c + 1))
   end
