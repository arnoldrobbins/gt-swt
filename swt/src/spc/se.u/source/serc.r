# serc --- read in commands from =home=/.serc and execute them

   subroutine serc

   ### note that se's special control characters are NOT processed
   ### and therefore should NOT be used in one's .serc file

   include SE_COMMON

   character lin (MAXLINE)
   file_des fd, open
   integer status, len, cursav, getlin
   integer getlst, ckglob

   fd = open ("=home=/.serc"s, READ)
   if (fd == ERR)
      return      # don't complain, no file there

   status = ENOERR

   while (getlin (lin, fd, MAXLINE) ~= EOF && status ~= EOF) { # ??
      if (lin (1) == '#'c || lin (1) == NEWLINE)
         next  # comment in .serc file

      # most of this code stolen from edit
      len = 1
      cursav = Curln
      if (getlst (lin, len, status) == OK) {
         if (ckglob (lin, len, status) == OK)
            call doglob (lin, len, cursav, status)
         else
            call docmd (lin, len, NO, status)
         }

      if (status == ERR) {
         call printverboseerrormessage
         Curln = min (cursav, Lastln)
         }
      }

   call close (fd)

   return
   end
