# quote_cmd --- surround special characters with quotes

   subroutine quote_cmd

   integer state, anything
   integer getch
   character ch

   procedure Clear forward

   state = EOS
   anything = NO

   for (; getch (ch, STDIN) ~= EOF; ) {
      if (ch == NEWLINE) {    # make sure empty strings get quoted
         if (anything == NO && state == EOS) {
            state = '"'c
            call putch (state, STDOUT)
            }
         anything = NO
         }
      else                    # not newline
         anything = YES

      if (ch == NEWLINE)
         Clear
      elif ((ch == '"'c || ch == "'"c) && (state == ch || state == EOS)) {
         Clear
         if (ch == '"'c)
            state = "'"c
         else
            state = '"'c
         call putch (state, STDOUT)
         }
      elif (~ IS_LETTER (ch) && ~ IS_DIGIT (ch)) {    # special character
         if (state == EOS) {
            state = '"'c
            call putch (state, STDOUT)
            }
         }
      # else is letter or number, don't worry about it

      call putch (ch, STDOUT)
      }
   Clear

   stop


   procedure Clear {

      if (state ~= EOS)
         call putch (state, STDOUT)
      state = EOS

      }

   end
