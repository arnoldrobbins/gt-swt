# length --- compute and return the length of the first argument


   integer getarg, length, getlin
   character arg (MAXLINE)

   if (getarg (1, arg, MAXLINE) == EOF)
      while (getlin (arg, STDIN) ~= EOF)
         call print (STDOUT, "*i*n"s, length (arg) - 1)
   else
      call print (STDOUT, "*i*n"s, length (arg))

   stop
   end
