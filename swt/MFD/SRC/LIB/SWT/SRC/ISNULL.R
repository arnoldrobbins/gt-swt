# isnull --- determine if a file descriptor refers to the bit bucket

   integer function isnull (fd)
   file_des fd

   include SWT_COMMON

   integer f
   filedes mapsu

   f = fd_offset (mapsu (fd))

   if (Fd_dev (f) == DEV_NULL)
      return (YES)
   else
      return (NO)

   end
