# isatty --- determine if a file descriptor refers to a terminal

   integer function isatty (fd)
   file_des fd

   include SWT_COMMON

   integer f
   filedes mapsu

   f = fd_offset (mapsu (fd))
   if (Fd_dev (f) == DEV_TTY)
      return (YES)
   else
      return (NO)

   end
