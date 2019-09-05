# recv_mesg --- receive a message from another user

   subroutine recv_mesg

   include SE_COMMON

   integer fd, tfd
   integer open, create, mktemp, display_message
   character path (MAXLINE)

   call scopy ("=gossip=/=user="s, 1, path, 1)
   fd = open (path, READ)
   if (fd == ERR) {
      call scopy ("=gossip=/*=pid="s, 1, path, 1)
      fd = open (path, READ)
      }

   if (fd == ERR)
      call mesg ("No messages"s, REMARK_MSG)
   else if (display_message (fd) == EOF) {
      call close (fd)
      call remove (path)
      }
   else {
      tfd = mktemp (READWRITE)
      call fcopy (fd, tfd)
      call rewind (tfd)
      call close (fd)
      fd = create (path, READWRITE)
      if (fd ~= ERR) {
         call fcopy (tfd, fd)
         call close (fd)
         }
      call rmtemp (tfd)
      }

   return
   end
