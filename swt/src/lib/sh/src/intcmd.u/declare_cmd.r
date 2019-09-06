# declare_cmd --- declare a shell variable at current lexic level

   subroutine declare_cmd

   character var (MAXLINE), val (MAXLINE), junk (3)

   integer i
   integer getarg

   for (i = 1; getarg (i, var, MAXLINE) ~= EOF; i += 1) {
      if (getarg (i + 1, junk, 3) ~= EOF
            && junk (1) == '='c && junk (2) == EOS
            && getarg (i + 2, val, MAXLINE) ~= EOF)
         i += 2
      else
         val (1) = EOS
      call svmake (var, val)
      }

   stop
   end
