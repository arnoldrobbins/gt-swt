# take_cmd --- take characters from a string APL-style

   subroutine take_cmd

   integer i, chars
   integer gctoi, getlin, getarg
   character arg (MAXLINE)

   if (getarg (1, arg, MAXLINE) == EOF)
      call error ("Usage: take <nchars> [ <string> ]"s)

   i = 1
   chars = gctoi (arg, i, 10)

   if (getarg (2, arg, MAXLINE) ~= EOF) {
      call stake (arg, arg, chars)
      call print (STDOUT, "*s*n"s, arg)
      }
   else {
      repeat {
         i = getlin (arg, STDIN)
         if (i == EOF)
            break
         if (arg (i) == NEWLINE)
            arg (i) = EOS
         call stake (arg, arg, chars)
         call print (STDOUT, "*s*n"s, arg)
         }
      }

   stop
   end
