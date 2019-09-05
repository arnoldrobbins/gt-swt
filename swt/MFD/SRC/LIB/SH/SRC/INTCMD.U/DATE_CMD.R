# date_cmd --- output date

   subroutine date_cmd

   character value (MAXLINE)

   call date (SYS_DATE, value)
   call print (STDOUT, "*s*n"s, value)

   stop
   end
