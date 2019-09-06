# bugfm --- generate a bug report

   character ldate (32), time (9), userid (MAXUSERNAME), uname (MAXLINE),
         pname (MAXLINE), ename (MAXLINE)

   integer input

   if (input (STDIN, "Your name: *,,`s"p, uname) == EOF
         ||  input (STDIN, "Name of problem software: *,,`s"p,
                  pname) == EOF
         || input (STDIN, "Name of example file (<CR> if none): *s"p,
                  ename) == EOF) {
      call seterr (1000)   # make our caller abort
      stop
      }

   call date (SYS_LDATE, ldate)
   call date (SYS_TIME, time)
   call date (SYS_USERID, userid)

   call print (STDOUT, "*s at *s*2n"p, ldate, time)
   call print (STDOUT, "By: *s (*s)*n"p, uname, userid)
   call print (STDOUT, "Re: *s*n"p, pname)
   if (ename (1) ~= EOS)
      call print (STDOUT, "Ex: *s*n"p, ename)

   call remark ("Description of bug (end with ctrl\c in column 1)"p)
   call print (STDOUT, "*nDescription:*2n"p)
   call fcopy (STDIN, STDOUT)

   stop
   end
