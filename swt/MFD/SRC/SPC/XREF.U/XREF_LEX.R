# getsym --- get next symbol from input stream

   subroutine getsym

   include XREF_COMMON

   integer radix, i
   integer index
   character c, quote
   character ngetch

   repeat {    # until a symbol is found
      Symlen = 0
      Symtext (1) = EOS
      Sym_name (1) = EOS

      call ngetch (c)
      call skip_blanks_and_comments (c)

      select (c)
         when (SET_OF_LETTERS) {
            i = 0
            repeat {
               Symlen += 1
               Symtext (Symlen) = c
               if (c ~= '_'c) {
                  i += 1
                  Sym_name (i) = c
                  }
               call ngetch (c)
               } until (~IS_LETTER (c) && ~IS_DIGIT (c)
                                       && c ~= '_'c && c ~= '$'c)
            call putback (c)
            Symtext (Symlen + 1) = EOS
            Sym_name (i + 1) = EOS
            Symbol = IDSYM
            break
            }  # end of identifier processing

         when (SET_OF_DIGITS) {     # Integer
            while (IS_DIGIT (c)) {
               Symlen += 1
               Symtext (Symlen) = c
               call ngetch (c)
               }
            if (c == 'r'c) {        # radix specified
               Symlen += 1
               Symtext (Symlen) = 'r'c
               while (index ("0123456789abcdefABCDEF"s, ngetch (c)) ~= 0) {
                  Symlen += 1
                  Symtext (Symlen) = c
                  }
               }
            Symtext (Symlen + 1) = EOS
            call putback (c)
            Symbol = NUMBERSYM
            break
            }  # end of integer processing

         when ('"'c, "'"c) {
            Symbol = STRCONSTANTSYM
            quote = c
            repeat {
               Symlen += 1
               if (Symlen >= MAXTOK) {
                  SYNERR ("Quoted literal too long"p)
                  break 2
                  }
               Symtext (Symlen) = c
               if (c == NEWLINE) {
                  SYNERR ("Unmatched quote"p)
                  call putback (c)
                  c = quote
                  break
                  }
               } until (ngetch (c) == quote)
            Symlen += 1
            Symtext (Symlen) = c
            if ('a'c <= ngetch (c) && c <= 'z') {  # check for format letter
               Symlen += 1
               Symtext (Symlen) = c
               }
            call putback (c)
            Symtext (Symlen + 1) = EOS
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

DB call print (ERROUT, "Symbol = *i, "p, Symbol)
DB call print (ERROUT, "text='*s'*n"p, Sym_text)
   return
   end



# skip_blanks_and_comments --- handle comments, continuations, skip blanks

   subroutine skip_blanks_and_comments (c)
   character c

   repeat {
      while (c == ' 'c) {
         call outch (c)
         call ngetch (c)
         }
       if (c == '#'c) {
         repeat {
            call outch (c)
            call ngetch (c)
            } until (c == NEWLINE)
         }
      } until (c ~= ' 'c)

   return
   end



# ngetch --- get a (possibly pushed back) input character

   character function ngetch (c)
   character c

   include XREF_COMMON

   integer getlin

   if (Inbuf (Ibp) ~= EOS) {
      ngetch = Inbuf (Ibp)
      Ibp = Ibp + 1
      }
   else {
      repeat {
         if (Level < 1) {
            ngetch = EOF
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
      ngetch = Inbuf (PBLIMIT)
      Ibp = PBLIMIT + 1
      }

   c = ngetch

   return
   end




# putback --- push character back onto input

   subroutine putback (c)
   character c

   include XREF_COMMON

   Ibp = Ibp - 1
   if (Ibp >= 1)
      Inbuf (Ibp) = c
   else
      call error ("too many characters pushed back"p)

   return
   end



# putback_str --- push string back onto input

   subroutine putback_str (str)
   character str (ARB)

   include XREF_COMMON

   integer i
   integer length

   for (i = length (str); i > 0; i = i - 1)
      call putback (str (i))

   return
   end
