# yesno --- get yes no answers from the terminal about a list
#   ehs 1982

   integer getlin, getarg, equal

   character input_line (MAXLINE), response (MAXLINE)
   logical flag, det, default_response, is_default
   integer i, j
   string usage "Usage: yesno [-yes | -no]"

   is_default = TRUE

   if (getarg (1, input_line, MAXLINE) == EOF)
      is_default = FALSE
   elif (equal (input_line, "-yes"s) == YES)
      default_response = TRUE
   elif (equal (input_line, "-no"s) == YES)
      default_response = FALSE
   else
      call error (usage)

   if (getarg (2, input_line, MAXLINE) ~= EOF)
      call error (usage)

   repeat {
      j = getlin (input_line, STDIN, MAXLINE)

      if (j == EOF)
         break

      input_line(j) = EOS     # remove trailing linefeed

      repeat {
         call print (TTY, '"*s" ? 's, input_line)
         i = getlin (response, TTY, MAXLINE)

         if (i == EOF)
            break 2

         response (i) = EOS
         call mapstr (response, LOWER)

         select (i - 1)
         when (0) {
            det = default_response
            flag = is_default
            }

         when (1) {
            if (response (1) == "y"c) {
               det = TRUE
               flag = TRUE
               }
            elif (response (1) == "n"c) {
               det = FALSE
               flag = TRUE
               }
            else
               flag = FALSE
            }

         when (2) {
            if ((response (1) == "y"c && response (2) == "e"c) ||
                (response (1) == "o"c && response (2) == "k"c)) {
               det = TRUE
               flag = TRUE
               }
            elif (response (1) == "n"c && response (2) == "o"c) {
               det = FALSE
               flag = TRUE
               }
            else
               flag = FALSE
            }

         when (3) {
            if (response (1) == "y"c && response (2) == "e"c &&
                response (3) == "s"c) {
               det = TRUE
               flag = TRUE
               }
            else
               flag = FALSE
            }
         else
            flag = FALSE

         if (~flag)
            call print (TTY, "answer YES or NO.*n"s)
         } until (flag)

      if (det)
         call print (STDOUT, "*s*n"s, input_line)
      }

   stop
   end
