# getsym --- get next symbol from input stream

   subroutine getsym

   include "link_com.i"

   integer radix, i
   integer index, ctoi
   longint val
   longint ctol
   character c, quote
   character mapdn

   integer anyupper
   integer lookup, scopy

   untyped info (SYMINFOSIZE)

   procedure skip_blanks_and_comments forward

   repeat {    # until a symbol is found
      Symlen = 0
      Symtext (1) = EOS

      ngetch (c)
      skip_blanks_and_comments

      select (c)
      when ('a'c, 'b'c, 'c'c, 'd'c, 'e'c, 'f'c, 'g'c, 'h'c, 'i'c,
            'j'c, 'k'c, 'l'c, 'm'c, 'n'c, 'o'c, 'p'c, 'q'c, 'r'c,
            's'c, 't'c, 'u'c, 'v'c, 'w'c, 'x'c, 'y'c, 'z'c,
            'A'c, 'B'c, 'C'c, 'D'c, 'E'c, 'F'c, 'G'c, 'H'c, 'I'c,
            'J'c, 'K'c, 'L'c, 'M'c, 'N'c, 'O'c, 'P'c, 'Q'c, 'R'c,
            'S'c, 'T'c, 'U'c, 'V'c, 'W'c, 'X'c, 'Y'c, 'Z'c, '$'c) {

         anyupper = NO

         repeat {
            select
               when ('a'c <= c && c <= 'z'c
                       || '0'c <= c && c <= '9'c || c == '$'c) {
                  Symlen += 1
                  Symtext (Symlen) = c
                  }
               when ('A'c <= c && c <= 'Z'c) {
                  Symlen += 1
                  Symtext (Symlen) = c
                  anyupper = YES
                  }
               when (c == '_'c)
                  ;
            else
               break
            ngetch (c)
            }
         call putback (c)
         Symtext (Symlen + 1) = EOS

         if (ARG_PRESENT (m)) {
            anyupper = NO
            call mapstr (Symtext, LOWER)
            }

         Sym_long_text (1) = EOS     # conspiracy so that all id's don't
                                     # have to be saved to access long name

         for (i = Scope_sp; i > 0; i = i - 1) {
            if (Scope_table (i) ~= 0
              && lookup (Symtext, info, Scope_table (i)) == YES) {
               call scopy (Symtext, 1, Sym_long_text, 1)
               Symlen = scopy (Mem, info (SYMBOLDATA), Symtext, 1)
               Symbol = IDSYM
               break 2
               }
            }

         if (Proc_table ~= 0
           && lookup (Symtext, info, Proc_table) == YES) {
            Proc_head = info (SYMBOLDATA)
            Symbol = PROCIDSYM
            break
            }

         if (lookup (Symtext, info, Idtable) == NO) {
            if (Symlen > MAXIDLENGTH
              || anyupper == YES
              || (Symtext (MAXIDLENGTH) == UFCHAR & Symlen == MAXIDLENGTH)) {
               call scopy (Symtext, 1, Sym_long_text, 1)
               call enter_long_name       # must be uniqued
               }
            Symbol = IDSYM
            break
            }

         select (info (SYMBOLTYPE))
         when (KEYWD_SYMBOLTYPE) {  # Ratfor or Fortran Keywords:
            Symbol = info (SYMBOLVAL)
            break
            }
         when (LNAME_SYMBOLTYPE) {  # Long Names:
            call scopy (Symtext, 1, Sym_long_text, 1)
            Symlen = scopy (Mem, info (SYMBOLDATA), Symtext, 1)
            Symbol = IDSYM
            break
            }
         when (DEFID_SYMBOLTYPE) {  # Defined Identifiers:
            call invoke_macro (info)
            next  # go back for next real symbol
            }
         else
            FATAL ("in getsym/id:  can't happen (bad symtype)"p)

         }  # end of identifier processing

      when ('0'c, '1'c, '2'c, '3'c, '4'c,          # Integer
            '5'c, '6'c, '7'c, '8'c, '9'c) {

         while ('0'c <= c & c <= '9'c) {
            Symtext (Symlen + 1) = c   # Strange order for efficiency
            Symlen += 1
            ngetch (c)
            }
         Symtext (Symlen + 1) = EOS
         if (c == 'r'c) {        # radix specified
            i = 1
            radix = ctoi (Symtext, i)
            if (radix < 2 | radix > 16) {
               SYNERR ("Radix must be between 2 and 16"p)
               radix = 16
               }
            val = 0
            repeat {
               ngetch (c)
               if ('0'c <= c && c <= '9'c)
                  i = c - '0'c
               else
                  i = index ("0123456789abcdef"s, mapdn (c)) - 1
               if (i < 0 || i >= radix)
                  break
               val = val * radix + i
               }
            Symlen = ltoc (val, Symtext, MAXTOK)
            }
         call putback (c)

         Symbol = NUMBERSYM
         break

         }  # end of integer processing

      when ('"'c, "'"c) {                       # quoted strings
         Symbol = STRCONSTANTSYM    # may be changed within
         repeat {                   #      convert_string_constant
            quote = c
            repeat {
               ngetch (c)
               if (c == quote)
                  break
               Symlen += 1
               if (Symlen >= MAXTOK) {
                  SYNERR ("Quoted literal too long"p)
                  break 2
                  }
               Symtext (Symlen) = c
               if (c == NEWLINE) {
                  SYNERR ("Unmatched quote"p)
                  break
                  }
               }
            Symtext (Symlen + 1) = EOS
            ngetch (c)
            skip_blanks_and_comments
            } until (c ~= '"'c && c ~= "'"c)
         if ('a'c <= c && c <= 'z'c)
            call convert_string_constant (c)
         else
            call putback (c)
         break
         }

      when ('&'c) {              # .and. 'andif' and '&='
         ngetch (c)
         if (c == '&'c)
            Symbol = ANDIFSYM
         else if (c == '='c)
            Symbol = ANDABSYM
         else {
            call putback (c)
            Symlen = scopy (".AND."s, 1, Symtext, 1)
            Symbol = '&'c
            }
         break
         }

      when ('|'c) {              # .or. 'orif' and '|='
         ngetch (c)
         if (c == '|'c)
            Symbol = ORIFSYM
         else if (c == '='c)
            Symbol = ORABSYM
         else {
            call putback (c)
            Symlen = scopy (".OR."s, 1, Symtext, 1)
            Symbol = '|'c
            }
         break
         }

      when ('='c) {              # = and .eq.
         ngetch (c)
         if (c == '='c) {
            Symlen = scopy (".EQ."s, 1, Symtext, 1)
            Symbol = EQSYM
            }
         else {
            call putback (c)
            Symtext (1) = '='c
            Symtext (2) = EOS
            Symlen = 1
            Symbol = '='c
            }
         break
         }

      when ('<'c) {              # .lt. and .le.
         ngetch (c)
         if (c == '='c) {
            Symbol = LESYM
            Symlen = scopy (".LE."s, 1, Symtext, 1)
            }
         else {
            call putback (c)
            Symlen = scopy (".LT."s, 1, Symtext, 1)
            Symbol = LTSYM
            }
         break
         }

      when ('>'c) {              # .gt. and .ge.
         ngetch (c)
         if (c == '='c) {
            Symbol = GESYM
            Symlen = scopy (".GE."s, 1, Symtext, 1)
            }
         else {
            Symbol = GTSYM
            Symlen = scopy (".GT."s, 1, Symtext, 1)
            call putback (c)
            }
         break
         }

      when ('~'c) {              # .not. and .ne.
         ngetch (c)
         if (c == '='c) {
            Symbol = NESYM
            Symlen = scopy (".NE."s, 1, Symtext, 1)
            }
         else {
            Symbol = NOTSYM
            Symlen = scopy (".NOT."s, 1, Symtext, 1)
            call putback (c)
            }
         break
         }

      when ('+'c, '-'c, '*'c, '/'c, '%'c, '^'c) {
         Symbol = c
         ngetch (c)
         if (c ~= '='c) {
            Symtext (1) = Symbol
            Symtext (2) = EOS
            Symlen = 1
            call putback (c)
            }
         else
            select (Symbol)
               when ('+'c)
                  Symbol = PLUSABSYM
               when ('-'c)
                  Symbol = MINUSABSYM
               when ('*'c)
                  Symbol = TIMESABSYM
               when ('/'c)
                  Symbol = DIVABSYM
               when ('%'c)
                  Symbol = MODABSYM
               when ('^'c)
                  Symbol = XORABSYM
         break
         }

      when (','c) {
         Symbol = c
         Symtext (1) = c
         Symtext (2) = EOS
         Symlen = 1
         call putback ('_'c)   # feign continuation
         break
         }

      else {   # single_character symbol
         Symbol = c
         Symtext (1) = c
         Symtext (2) = EOS
         Symlen = 1
         break
         }

      }  # repeat until a symbol is found

DEBUG call print (ERROUT, "Symbol = *i *s*n"p, Symbol, Symtext)
   return


   # skip_blanks_and_comments --- handle comments, continuations, skip blanks

   procedure skip_blanks_and_comments {

      repeat {
         while (c == ' 'c)
            ngetch (c)
         select (c)
         when ('_'c) {
            repeat {
               ngetch (c)
               if (c == '#'c)
                  repeat
                     ngetch (c)
                     until (c == NEWLINE)
               } until (c ~= ' 'c && c ~= NEWLINE && c ~= '_'c)
            }
          when ('#'c) {
            repeat
               ngetch (c)
               until (c == NEWLINE)
            }
         } until (c ~= ' 'c)

      }

   end



# convert_string_constant (c) --- convert a constant to a special format

   subroutine convert_string_constant (c)
   character c

   include "link_com.i"

   integer v, i, j
   integer itoc, scopy
   character text (MAXTOK)

   select (c)
   when ('c'c, 'C'c) {     # character constant
      if (Symlen == 1) {
         v = Symtext (1)
         Symlen = itoc (v, Symtext, MAXTOK)
         Symbol = NUMBERSYM
         }
      else
         SYNERR ("Only one character allowed in a character constant.")
      }

   when ('p'c, 'P'c) {    # period-terminated packed
      call scopy (Symtext, 1, text, 1)
      j = 0
      for (i = 1; text (i) ~= EOS; i = i + 1) {
         j = j + 1
         if (j >= MAXTOK - 1) {
            SYNERR ("Packed string constant too long"p)
            break
            }
         if (text (i) == '.'c) {
            Symtext (j) = '@'c
            j = j + 1
            }
         Symtext (j) = text (i)
         }
      Symtext (j + 1) = '.'c
      Symtext (j + 2) = EOS
      Symlen = j + 1
      Symbol = STRCONSTANTSYM
      }

   when ('s'c, 'S'c) {     # EOS-terminated string
      if (Outp (DATA) ~= 0 | Outp (DECL) ~= 0) {
         SYNERR ("EOS-terminated string not allowed in this context"p)
         return
         }
      call vargen (text)

#      call outtab (DECL)                       # output INTEGER X(n)
#      call outstr ("INTEGER "s, DECL)
#      call outstr (text, DECL)
#      call outch ('('c, DECL)
#      call outnum (Symlen + 1, DECL)
#      call outch (')'c, DECL)
#      call outdon (DECL)
#
#      call outtab (DATA)                      # output DATA X/i,i,i,EOS/
#      call outstr ("DATA "s, DATA)
#      call outstr (text, DATA)
#      call outch ('/'c, DATA)
#      for (i = 1; Symtext (i) ~= EOS; i = i + 1) {
#         call outnum (Symtext (i), DATA)
#         call outch (','c, DATA)
#         }
#      call outnum (EOS, DATA)
#      call outch ('/'c, DATA)
#      call outdon (DATA)

      Symlen = scopy (text, 1, Symtext, 1)
      Symbol = IDSYM
      }

   when ('v'c, 'V'c) {     # PL/I character varying
      if (Outp (DATA) ~= 0 | Outp (DECL) ~= 0) {
         SYNERR ("Varying string not allowed in this context.")
         return
         }
      call vargen (text)
#
#      call outtab (DECL)                    # output INTEGER X(n)
#      call outstr ("INTEGER "s, DECL)
#      call outstr (text, DECL)
#      call outch ('('c, DECL)
#      call outnum ((Symlen + 1) / 2 + 1, DECL)
#      call outch (')'c, DECL)
#      call outdon (DECL)
#
#      call outtab (DATA)                 # output DATA X/n,'cc','cc'.../
#      call outstr ("DATA "s, DATA)
#      call outstr (text, DATA)
#      call outch ('/'c, DATA)
#      call outnum (Symlen, DATA)
#     for (i = 1; i <= Symlen; i = i + 2) {
#         call outstr (",'"s, DATA)
#         call outch (Symtext (i), DATA)
#         if (i < Symlen)
#            call outch (Symtext (i + 1), DATA)
#         else
#            call outch (' 'c, DATA)
#         call outch ("'"c, DATA)
#         }
#      call outch ('/'c, DATA)
#      call outdon (DATA)

      Symlen = scopy (text, 1, Symtext, 1)
      Symbol = IDSYM
      }

   else
      SYNERR ("Unrecognizable string format indicator"p)

   return
   end



# refill_buffer --- refill the input buffer and return first character

   subroutine refill_buffer (c)
   character c

   include "link_com.i"

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
         break
         }
      call close (Infile (Level))
      Level = Level - 1
      }
   c = Inbuf (PBLIMIT)
   Ibp = PBLIMIT + 1

   return
   end




# putback --- push character back onto input

   subroutine putback (c)
   character c

   include "link_com.i"

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

   include "link_com.i"

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



