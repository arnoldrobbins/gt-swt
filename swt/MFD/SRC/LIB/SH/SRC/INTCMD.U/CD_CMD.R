# cd_cmd --- change home directory

   subroutine cd_cmd

   character pname (MAXLINE)
   integer pwd
   integer getarg, follow, equal

   pwd = NO
   if (getarg (1, pname, MAXLINE) == EOF)    # change to login directory
      call scopy ("=home="s, 1, pname, 1)
   elif (equal ("-p"s, pname) ~= NO) {
      pwd = YES
      call getarg (2, pname, MAXLINE)
      }

   if (pwd == YES) {
      if (follow (pname, 0) == ERR)
         call error ("bad pathname"s)
      else {
         call gcdir$ (pname)
         call print (STDOUT, "*s*n"p, pname)
         call follow (EOS, 0)
         }
      }
   elif (follow (pname, 1) == ERR)
      call error ("bad pathname"p)

   stop
   end
