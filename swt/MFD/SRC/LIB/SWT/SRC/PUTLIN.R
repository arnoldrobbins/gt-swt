# putlin --- put a line on a file

   integer function putlin (line, fd)
   character line (ARB)
   filedes fd

   include SWT_COMMON

   integer f, off
   integer dputl$, tputl$, mapsu

   f = mapsu (fd)
   off = fd_offset (f)
   if (f < 1 || f > NFILES
         || and (Fd_flags (off), FD_WRITE) == 0
         || and (Fd_flags (off), FD_ERR) ~= 0)
      return (ERR)

   select (Fd_dev (off))
      when (DEV_TTY) {
         if (LASTOP (off) ~= FD_PUTLIN) {
            call flush$ (f)
            SET_LASTOP (off, FD_PUTLIN)
            }
         return (tputl$ (line, off))
         }
      when (DEV_DSK) {
         if (LASTOP (off) ~= FD_PUTLIN) {
            call flush$ (f)
            Fd_count (off) = -Fd_buflen (off)
            SET_LASTOP (off, FD_PUTLIN)
            }
         return (dputl$ (line, Fdesc (off)))
         }
      when (DEV_NULL) {
         if (LASTOP (off) ~= FD_PUTLIN) {
            call flush$ (f)
            SET_LASTOP (off, FD_PUTLIN)
            }
         return (0)
         }
   else
      return (ERR)

   end
