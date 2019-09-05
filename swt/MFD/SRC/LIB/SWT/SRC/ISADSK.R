# isadsk --- determine if a file descriptor refers to a terminal

   integer function isadsk (fd)
   file_des fd

   include SWT_COMMON

   integer f
   filedes mapsu

   f = fd_offset (mapsu (fd))
   if (Fd_dev (f) == DEV_DSK)
      return (YES)
   else
      return (NO)

   end
