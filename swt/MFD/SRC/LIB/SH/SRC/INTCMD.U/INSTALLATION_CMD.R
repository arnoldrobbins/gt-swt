# installation_cmd --- output installation

   subroutine installation_cmd

   integer fd
   integer open

   fd = open ("=installation="s, READ)
   if (fd ~= ERR) {
      call fcopy (fd, STDOUT)
      call close (fd)
      }
   else
      call putch (NEWLINE, STDOUT)

   stop
   end
