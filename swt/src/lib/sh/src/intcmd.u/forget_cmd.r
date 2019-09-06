# forget_cmd --- delete shell variables

   subroutine forget_cmd

   character var (MAXLINE)
   integer i
   integer getarg

   for (i = 1; getarg (i, var, MAXLINE) ~= EOF; i += 1)
      call svdel (var)

   stop
   end
