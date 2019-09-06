# send_mesg --- send some lines in the buffer to another user

   integer function send_mesg (to_name, from, to)
   character to_name (MAXLINE)
   integer from, to

   include SE_COMMON

   character dofw (10), pid (4), time (9), fname (42),
         from_name (MAXUSERNAME)
   character mapup
   filedes fd, tmp
   filedes open, create
   integer i, id
   integer vfyusr, ctoi, dowrit
   string tmpname "=temp=/se.ms=pid="

   if (from <= 0) {
      Errcode = EORANGE
      return (ERR)
      }

   i = 1
   id = ctoi (to_name, i)     # is it a user number ?
   if (i ~= 1) {
      if (id > MAXPROCESSES || id < 1) {
         Errcode = EBADUSER
         return (ERR)
         }
      call encode (fname, 9 + MAXUSERNAME, "=gossip=/***3,,0i"s, id)
      }
   elif (vfyusr (to_name) == ERR) {
      Errcode = EBADUSER
      return (ERR)
      }
   else
      call encode (fname, 9 + MAXUSERNAME, "=gossip=/*s"s, to_name)

   call date (SYS_USERID, from_name)
   call date (SYS_TIME, time)
   call date (SYS_PIDSTR, pid)
   call date (SYS_DAY, dofw)
   dofw (1) = mapup (dofw (1))

   tmp = create (tmpname, READWRITE)
   if (tmp == ERR)
      return (ERR)
   call print (tmp, "*2nFrom *s (*s) at *,5s on *s.*2n"p,
         from_name, pid, time, dofw)
   call close (tmp)

   if (dowrit (from, to, tmpname, YES, NO) ~= OK) {
      call remove (tmpname)
      return (ERR)
      }

   tmp = open (tmpname, READ)
   if (tmp == ERR)
      return (ERR)
   for (i = 0; i < 10; i += 1) {    # We try opening for 5 seconds worth
      fd = open (fname, WRITE)
      if (fd ~= ERR) {
         call wind (fd)
         call fcopy (tmp, fd)
         call close (fd)
         call close (tmp)
         call remove (tmpname)
         return (OK)
         }
      else
         call sleep$ (intl (500))
      }

   call close (tmp)
   call remove (tmpname)
   Errcode = EBUSYUSER
   return (ERR)

   end
