# writef --- write raw words to a file

   integer function writef (buf, nw, fd)
   integer buf (ARB), nw, fd

   include SWT_COMMON

   integer off, f
   integer mapsu, twrit$, dwrit$

   f = mapsu (fd)
   off = fd_offset (f)
   if (f < 1 || f > NFILES
         || and (Fd_flags (off), FD_WRITE) == 0
         || and (Fd_flags (off), FD_ERR) ~= 0)
      return (ERR)

   if (nw <= 0)
      return (0)

   select (Fd_dev (off))
      when (DEV_TTY) {
         if (LASTOP (off) ~= FD_WRITEF) {
            call flush$ (f)
            SET_LASTOP (off, FD_WRITEF)
            }
         writef = twrit$ (buf, nw, off)
         }

      when (DEV_DSK) {
         if (LASTOP (off) ~= FD_WRITEF) {
            call flush$ (f)
            Fd_count (off) = -Fd_buflen (off)
            Fd_bufend (off) = Fd_bufstart (off) + Fd_buflen (off)
            SET_LASTOP (off, FD_WRITEF)
            }
         writef = dwrit$ (buf, nw, off)
         }

      when (DEV_NULL) {
         if (LASTOP (off) ~= FD_WRITEF) {
            call flush$ (f)
            SET_LASTOP (off, FD_WRITEF)
            }
         writef = EOF
         }

   else
      writef = ERR

   return
   end
