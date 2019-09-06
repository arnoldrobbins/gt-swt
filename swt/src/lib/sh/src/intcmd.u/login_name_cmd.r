# login_name_cmd --- output login_name

   subroutine login_name_cmd

   character value (MAXLINE)

   call date (SYS_USERID, value)
   call print (STDOUT, "*s*n"s, value)

   stop
   end
