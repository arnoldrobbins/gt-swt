# log --- make an entry in a personal log

# Usage:
#      log logname
#         Standard input is appended to the file logname in the user's
#         variables storage directory, preceded by the date and time.
#         If logname is unspecified, the file "u.log" is used.

   character lognam (MAXLINE), tim (9), dat (9), dow (10)

   integer fd, e
   integer open, getarg, scopy

   e = scopy ("=varsdir=/"s, 1, lognam, 1) + 1
   if (getarg (1, lognam (e), MAXLINE - e) == EOF)
      call scopy ("u.log"s, 1, lognam, e)

   fd = open (lognam, READWRITE)
   if (fd == ERR)
      call cant (lognam)

   call wind (fd)

   call date (SYS_DATE, dat)
   call date (SYS_TIME, tim)
   call date (SYS_DAY, dow)
   call print (fd, "*n*n*s  *s  *s*n"p, tim, dat, dow)

   call fcopy (STDIN, fd)

   call close (fd)
   stop
   end
