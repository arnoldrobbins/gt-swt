# to --- send messages to other users

   define (MAXPROCESSES,128)

   character dofw (10), pid (4), time (9), fname (42),
         line (MAXLINE), to_name (MAXUSERNAME), from_name (MAXUSERNAME)
   character mapup
   filedes fd, tmp
   filedes open, mktemp
   integer i, id
   integer getarg, vfyusr, ctoi

   if (getarg (1, to_name, MAXUSERNAME) == EOF)  # determine the recipient
      call error ("Usage: to (<user name> | <user number>) [<message>]"p)

   i = 1
   id = ctoi (to_name, i)     # is it a user number ?
   if (i ~= 1) {
      if (id > MAXPROCESSES || id < 1)
         call error ("bad user number"p)
      call encode (fname, 9 + MAXUSERNAME, "=gossip=/***3,,0i"s, id)
      }
   elif (vfyusr (to_name) == ERR)
      call error ("bad user name"p)
   else
      call encode (fname, 9 + MAXUSERNAME, "=gossip=/*s"s, to_name)

   call date (SYS_USERID, from_name)
   call date (SYS_TIME, time)
   call date (SYS_PIDSTR, pid)
   call date (SYS_DAY, dofw)
   dofw (1) = mapup (dofw (1))

   tmp = mktemp (READWRITE)
   if (tmp == ERR)
      call error ("can't open temporary file"p)

   call print (tmp, "*2nFrom *s (*s) at *,5s on *s.*2n"p,
         from_name, pid, time, dofw)

   for (i = 2; getarg (i, line, MAXLINE) ~= EOF; i += 1)
      call print (tmp, "*s "p, line)
   if (i ~= 2)
      call putch (NEWLINE, tmp)
   else
      call fcopy (STDIN, tmp)

   call rewind (tmp)
   for (i = 0; i < 10; i += 1) {    # We try opening for 5 seconds worth
      fd = open (fname, WRITE)
      if (fd ~= ERR) {
         call wind (fd)
         call fcopy (tmp, fd)
         call close (fd)
         call rmtemp (tmp)
         stop
         }
      else
         call sleep$ (intl (500))
      }

   call rmtemp (tmp)
   call error ("User is busy. Try later."p)

   end
