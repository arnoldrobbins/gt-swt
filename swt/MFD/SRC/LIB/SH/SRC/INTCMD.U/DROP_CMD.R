# drop_cmd --- drop characters from a string APL-style

   subroutine drop_cmd

   integer i, chars
   integer gctoi, getlin, getarg
   character arg (MAXLINE)

   if (getarg (1, arg, MAXLINE) == EOF)
      call error ("Usage: drop <nchars> [ <string> ]"s)

   i = 1
   chars = gctoi (arg, i, 10)

   if (getarg (2, arg, MAXLINE) ~= EOF) {
      call sdrop (arg, arg, chars)
      call print (STDOUT, "*s*n"s, arg)
      }
   else {
      repeat {
         i = getlin (arg, STDIN)
         if (i == EOF)
            break
         if (arg (i) == NEWLINE)
            arg (i) = EOS
         call sdrop (arg, arg, chars)
         call print (STDOUT, "*s*n"s, arg)
         }
      }

   stop
   end
