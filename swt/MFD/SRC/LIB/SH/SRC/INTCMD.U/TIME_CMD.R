# time_cmd --- output time

   subroutine time_cmd

   character value (MAXLINE)

   call date (SYS_TIME, value)
   call print (STDOUT, "*s*n"s, value)

   stop
   end
