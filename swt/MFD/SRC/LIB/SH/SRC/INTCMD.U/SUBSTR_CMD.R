# substr_cmd --- take a substring from a string

   subroutine substr_cmd

   integer i, first, chars
   integer getarg, gctoi, getlin
   character sfirst (10), schars (10), arg (MAXLINE)

   if (getarg (1, sfirst, 10) == EOF
         || getarg (2, schars, 10) == EOF)
      call error ("Usage: substr <start> <length> [ <string> ]"s)

   i = 1
   first = gctoi (sfirst, i, 10)
   i = 1
   chars = gctoi (schars, i, 10)

   if (getarg (3, arg, MAXLINE) ~= EOF) {
      call substr (arg, arg, first, chars)
      call print (STDOUT, "*s*n"s, arg)
      }
   else
      repeat {
         i = getlin (arg, STDIN)
         if (i == EOF)
            break
         if (arg (i) == NEWLINE)
            arg (i) = EOS
         call substr (arg, arg, first, chars)
         call print (STDOUT, "*s*n"s, arg)
         }

   stop
   end
