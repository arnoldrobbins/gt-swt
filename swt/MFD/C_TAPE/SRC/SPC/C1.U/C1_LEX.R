# getsym --- get a symbol from the input

   subroutine getsym

   include "c1_com.r.i"

   untyped info (IDSIZE)
   integer lookup

   Symbol = Nsymbol
   Symptr = Nsymptr
   Symlen = Nsymlen
   Symline = Nsymline
   if (Nsymlen > 0)
      call scopy (Nsymtext, 1, Symtext, 1)
   else
      Symtext (1) = EOS

   repeat {
      call gettok

      if (Nsymbol == '#'c) {
         call c_preprocessor
         next
         }

      if (Nsymbol == IDSYM && lookup (Nsymtext, info, Keywd_tbl) == YES)
         if (IDTYPE (info) == DEFIDTYPE) {
            call invoke_macro (info)
            next
            }
         else if (IDTYPE (info) == KEYWDIDTYPE)
            Nsymbol = IDPTR (info)
         else
            FATAL ("Undefined IDTYPE in Nsymbol"p)

      break
      }

   DBG (1, call display_symbol (" Symbol='*s'"s, Symbol)
   DB call print (ERROUT, " ^*i '*s'(*i)*n"p, Symptr, Symtext, Symlen))
   return
   end



# gettok --- get next token from input stream

   subroutine gettok

   include "c1_com.r.i"

   integer i
   integer ctoi, gctoi, index, mapdn
   longint val
   longint gctol
   character c

   procedure analyze_number forward
   procedure check_becomes_op (c, sym) forward
   procedure check_double_op (c, sym1, sym2) forward

   Nsymptr = LAMBDA

   repeat {    # until a symbol is found
      Nsymlen = 0
      Nsymtext (1) = EOS
      Nsymline = Line_number (Level)

      repeat
         ngetch (c)
         until (c ~= ' 'c && c ~= HT)

      select (c)
      when (SET_OF_LETTERS, '_'c, '$'c) {

         while (IS_LETTER (c) || IS_DIGIT (c) || c == '$'c || c == '_'c) {
            Nsymlen += 1
            Nsymtext (Nsymlen) = c
            ngetch (c)
            }
         call putback (c)
         Nsymtext (Nsymlen + 1) = EOS

         if (ARG_PRESENT (m))
            call mapstr (Nsymtext, LOWER)

         Nsymbol = IDSYM
         break

         }  # end of identifier processing

      when (SET_OF_DIGITS) {                       # Number

         analyze_number
         break

         }  # end of number processing

      when ('.'c) {                                # Number  or  .

         ngetch (c)
         if (IS_DIGIT (c)) {
            call putback (c)
            c = '.'c
            analyze_number
            }
         else {
            call putback (c)
            Nsymbol = '.'c
            }
         break
         }

      when ('"'c, "'"c) {                          # quoted strings
         if (c == '"'c)
            Nsymbol = STRLITSYM
         else
            Nsymbol = CHARLITSYM

         call collect_quoted_string (c, Nsymtext, Nsymlen)

         break
         }

      when ('>'c) {              # >  ><  >=  >>  >>=
         ngetch (c)
         if (c == '<'c)
            Nsymbol = NESYM
         else if (c == '='c)
            Nsymbol = GESYM
         else if (c == '>'c) {
            ngetch (c)
            if (c == '='c)
               Nsymbol = RSHIFTAASYM
            else {
               Nsymbol = RSHIFTSYM
               call putback (c)
               }
            }
         else {
            Nsymbol = '>'c
            call putback (c)
            }
         break
         }

      when ('<'c) {              # <  <>  <=  <<  <<=
         ngetch (c)
         if (c == '>'c)
            Nsymbol = NESYM
         else if (c == '='c)
            Nsymbol = LESYM
         else if (c == '<'c) {
            ngetch (c)
            if (c == '='c)
               Nsymbol = LSHIFTAASYM
            else {
               Nsymbol = LSHIFTSYM
               call putback (c)
               }
            }
         else {
            Nsymbol = '<'c
            call putback (c)
            }
         break
         }

      when ('='c) {              # =  ==
         check_becomes_op ('='c, EQSYM)
         break
         }

      when ('!'c) {              # !  !=
         check_becomes_op ('!'c, NESYM)
         break
         }

      when ('/'c) {              # /* */  /  /=
         ngetch (c)
         if (c == '*'c) {
            ngetch (c)
            repeat {
               while (c ~= '*'c && c ~= EOF)
                  ngetch (c)
               if (c == EOF) {
                  SYNERR ("Missing trailing comment delimiter"p)
                  break
                  }
               ngetch (c)
               } until (c == '/'c)
            next
            }
         call putback (c)
         check_becomes_op ('/'c, DIVAASYM)
         break
         }

      when ('-'c) {              # ->  -  --  -=
         ngetch (c)
         if (c == '>'c)
            Nsymbol = POINTSTOSYM
         else {
            call putback (c)
            check_double_op ('-'c, DECSYM, SUBAASYM)
            }
         break
         }

      when ('+'c) {              # +  ++  +=
         check_double_op ('+'c, INCSYM, ADDAASYM)
         break
         }

      when ('&'c) {              # &  &&  &=
         check_double_op ('&'c, SANDSYM, ANDAASYM)
         break
         }

      when ('|'c) {              # |  ||  |=
         check_double_op ('|'c, SORSYM, ORAASYM)
         break
         }

      when ('*'c) {              # *  *=
         check_becomes_op ('*'c, MULAASYM)
         break
         }

      when ('%'c) {              # %  %=
         check_becomes_op ('%'c, REMAASYM)
         break
         }

      when ('^'c) {              # ^  ^=
         check_becomes_op ('^'c, XORAASYM)
         break
         }

      when (NEWLINE)
         next

      else {   # single_character symbol

#         if (c == '\'c) { # check if '\' at end of line
#            ngetch (c)
#            if (c == NEWLINE)
#               next
#            call putback (c)
#            c = '\'c
#            }

         Nsymbol = c
         Nsymtext (1) = c
         Nsymtext (2) = EOS
         Nsymlen = 1
         break
         }

      }  # repeat until a symbol is found

   DBG (2, call display_symbol ("Nsymbol='*s'"s, Nsymbol)
   DB call print (ERROUT, " ^*i '*s'(*i)*n"p, Nsymptr, Nsymtext, Nsymlen))

   return


   # collect_integer --- collect the digits of an integer

      procedure collect_integer (radix) {

      integer radix
      local x; integer x

      repeat {
         if (radix <= 10)
            x = c - '0'c + 1
         else
            x = index ("0123456789abcdef"s, mapdn (c))
         if (1 > x || x > radix)
            break
         Nsymtext (Nsymlen + 1) = c   # Strange order for efficiency
         Nsymlen += 1
         ngetch (c)
         }
      Nsymtext (Nsymlen + 1) = EOS
      }


   # convert_integer --- convert an integer symbol to the specified radix

      procedure convert_integer (radix) {

      integer radix
      local i; integer i

      i = 1
      val = gctol (Nsymtext, i, radix)
      if (Nsymtext (i) ~= EOS)
         SYNERR ("Illegal character in integer constant"p)
      }


   # return_integer --- convert 'val' back to characters and determine
   #                    data type

      procedure return_integer (radix) {

      integer radix

      if (c == 'l'c || c == 'L'c) {
         Nsymbol = LONGLITSYM
         ngetch (c)
         }
      else if (c == 's'c || c == 'L'c) {
         Nsymbol = SHORTLITSYM
         ngetch (c)
         }
      else if (radix == 10)
         if (val > MAXSHORT)
            Nsymbol = LONGLITSYM
         else
            Nsymbol = SHORTLITSYM
      else
         if (val > MAXUNSIGNED)
            Nsymbol = LONGLITSYM
         else
            Nsymbol = SHORTLITSYM

      call ltoc (val, Nsymtext, MAXTOK)

      }



   # analyze_number --- collect an integer/real number

      procedure analyze_number {

      collect_integer (10)

      select (c)
         when ('r'c, 'R'c) {                    # radix specified
            convert_integer (10)
            if (val < 2 | val > 16) {
               SYNERR ("Radix must be between 2 and 16"p)
               val = 16
               }
            ngetch (c)
            Nsymlen = 0
            collect_integer (val)
            convert_integer (val)
            return_integer (16)
            }
         when ('x'c, 'X'c) {
            if (Nsymtext (1) == '0'c && Nsymtext (2) == EOS) {
               ngetch (c)
               Nsymlen = 0
               collect_integer (16)
               convert_integer (16)
               }
            else {
               SYNERR ("Illegal hexadecimal constant"p)
               convert_integer (10)
               }
            return_integer (16)
            }
         when ('.'c, 'e'c, 'E'c) {
            if (c == '.'c) {
               Nsymtext (Nsymlen + 1) = '.'c
               Nsymlen += 1
               ngetch (c)
               collect_integer (10)
               }
            if (c == 'e'c || c == 'E'c) {
               Nsymtext (Nsymlen + 1) = 'e'c
               Nsymlen += 1
               ngetch (c)
               if (c == '-'c || c == '+'c) {
                  Nsymtext (Nsymlen + 1) = c
                  Nsymlen += 1
                  ngetch (c)
                  }
               collect_integer (10)
               }
            Nsymbol = DOUBLELITSYM
            }
         else
            if (Nsymtext (1) == '0'c) {
               convert_integer (8)
               return_integer (8)
               }
            else {
               convert_integer (10)
               return_integer (10)
               }

      call putback (c)
      }


   # check_becomes_op --- check for a single-character OP or OP=

      procedure check_becomes_op (c, sym) {

      character c
      integer sym
      local d; character d

      ngetch (d)
      if (d == '='c)
         Nsymbol = sym
      else {
         call putback (d)
         Nsymbol = c
         }
      }


   # check_double_op --- check for a single character OP, OPOP, or OP=

      procedure check_double_op (c, sym1, sym2) {

      character c
      integer sym1, sym2

      local d; character d

      ngetch (d)
      if (d == c)
         Nsymbol = sym1
      else if (d == '='c)
         Nsymbol = sym2
      else {
         Nsymbol = c
         call putback (d)
         }
      }


   end



# refill_buffer --- refill the input buffer and return first character

   subroutine refill_buffer (c)
   character c

   include "c1_com.r.i"

   integer getlin

   repeat {
      if (Level < 1) {
         c = EOF
         Inbuf (PBLIMIT) = EOS
         Ibp = PBLIMIT
         return
         }
      if (getlin (Inbuf (PBLIMIT), Infile (Level)) ~= EOF) {
         Line_number (Level) = Line_number (Level) + 1
         DBG (17, call print (ERROUT, "....*s"s, Inbuf (PBLIMIT)))
         break
         }
      call close (Infile (Level))
      Level = Level - 1
      if (Level >= 1) { # restore the name of the module that  #
                        # included the one we just finished    #

         call scopy (Mem, Fname_table (Level), Module_name, 1)
         call dsfree (Fname_table (Level))

                        # and reset the line number to prevent #
                        # screwy error message numbering       #
         Symline = Line_number (Level)
         }
      }
   c = Inbuf (PBLIMIT)
   Ibp = PBLIMIT + 1

   return
   end




# putback --- push character back onto input

   subroutine putback (c)
   character c

   include "c1_com.r.i"

   Ibp = Ibp - 1
   if (Ibp >= 1)
      Inbuf (Ibp) = c
   else
      FATAL ("too many characters pushed back"p)

   return
   end



# putback_str --- push string back onto input

   subroutine putback_str (str)
   character str (ARB)

   include "c1_com.r.i"

   integer i
   integer length

   for (i = length (str); i > 0; i = i - 1)
      call putback (str (i))

   return
   end



# putback_num --- push decimal number back onto input

   subroutine putback_num (n)
   integer n

   integer len
   integer itoc

   character chars (MAXLINE)

   len = itoc (n, chars, MAXLINE)
   chars (len + 1) = EOS
   call putback_str (chars)

   return
   end



# collect_quoted_string --- obtain a quoted string from input

   subroutine collect_quoted_string (quote, text, tl)
   character quote, text (ARB)
   integer tl

   include "c1_com.r.i"

   integer gctoi
   character c

   procedure analyze_escape forward

   ngetch (c)
   while (tl < MAXTOK && c ~= NEWLINE && c ~= quote) {
      if (c == '\'c)
         analyze_escape
      else {
         text (tl + 1) = c
         tl += 1
         }
      ngetch (c)
      }
   if (c == NEWLINE)
      SYNERR ("Missing closing quote"p)
   else if (tl >= MAXTOK)
      SYNERR ("Quoted literal too long"p)
   text (tl + 1) = EOS

   return


   # analyze_escape --- convert an escaped character in a quoted string

      procedure analyze_escape {

      local i; integer i
      local str; character str (5)

      ngetch (c)
      select (c)
         when (NEWLINE)
            c = EOF
         when ('n'c)
            c = NEWLINE
         when ('t'c)
            c = HT
         when ('b'c)
            c = BS
         when ('r'c)
            c = CR
         when ('f'c)
            c = FF
         when ('0'c, '1'c, '2'c, '3'c, '4'c, '5'c, '6'c, '7'c) {
            for (i = 1; i <= 3 && '0'c <= c && c <= '7'c; i += 1) {
               str (i) = c
               ngetch (c)
               }
            str (i) = EOS
            call putback (c)
            i = 1
            c = gctoi (str, i, 8)
            }

      if (c ~= EOF) {
         text (tl + 1) = c
         tl += 1
         }
      }

   end
