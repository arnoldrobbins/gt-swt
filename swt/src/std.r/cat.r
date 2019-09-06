# cat --- concatenate files onto standard output

   integer fd, hflag, sflag
   integer state (4)
   integer open, gfnarg, mapdn
   character name (MAXLINE)

   hflag = NO
   sflag = NO
   state (1) = 1

   repeat
      select (gfnarg (name, state))
         when (EOF)
            break
         when (OK) {
            fd = open (name, READ)
            if (fd ~= ERR) {
               if (hflag == YES)
                  call print (STDOUT, "*20,,=x *s *20,,=x*n"s, name)
               call fcopy (fd, STDOUT)
               call close (fd)
               }
            else if (sflag == NO)
               call print (ERROUT, "*s: can't open*n"s, name)
            }
         when (ERR) {
            if (name (1) == '-'c)
               if (mapdn (name (2)) == 'h'c)
                  hflag = YES
               elif (mapdn (name (2)) == 's'c)
                  sflag = YES
            }

   stop
   end
