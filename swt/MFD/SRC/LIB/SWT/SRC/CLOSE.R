# close --- close out an open file

   integer function close (fd)
   filedes fd

   include SWT_COMMON

   integer f

   if (fd == STDIN1 || fd == STDOUT1 || # ignore closes on standard ports
       fd == STDIN2 || fd == STDOUT2 ||
       fd == STDIN3 || fd == STDOUT3)
      return (OK)

   if (fd < 1 || fd > NFILES)
      return (ERR)            # not a legal file descriptor

   f = fd_offset (fd)

   if (Fd_flags (f) == 0)     # file is not open
      return (ERR)

   if (LASTOP (f) ~= FD_INITIAL)
      call flush$ (fd)

   select (Fd_dev (f))
      when (DEV_DSK) {
         call srch$$ (KCLOS, 0, 0, Fd_unit (f), 0, Errcod)
         Fd_flags (f) = 0
         if (Errcod == 0)
            return (OK)
         }

      when (DEV_TTY) {
         if (fd ~= 1)         # never close file #1
            Fd_flags (f) = 0
         return (OK)
         }

      when (DEV_NULL) {
         Fd_flags (f) = 0
         return (OK)
         }

   return (ERR)               # bad srch$$ or attempt to undefined device
   end
