# mswait --- message waiting subroutine

   subroutine mswait

   integer fd
   integer follow, open

   if (follow ("=gossip= "s, 0) ~= ERR) {
      fd = open ("=user="s, READ)
      if (fd == ERR)
         fd = open ("*=pid="s, READ)
      call follow (EOS, 0)
      if (fd ~= ERR) {
         call close (fd)
         call mesg ("Message"s, MESSAGE_MSG)
         return
         }
      }

   call mesg (EOS, MESSAGE_MSG)


   return
   end
