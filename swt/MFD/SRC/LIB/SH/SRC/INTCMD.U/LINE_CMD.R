# line_cmd --- output line

   subroutine line_cmd

   character value (MAXLINE)

   call date (SYS_PIDSTR, value)
   call print (STDOUT, "*s*n"s, value)

   stop
   end
