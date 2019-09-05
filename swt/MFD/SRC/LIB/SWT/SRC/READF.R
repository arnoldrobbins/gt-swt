# readf --- read raw words from a file

   integer function readf (buf, nw, fd)
   integer buf (ARB), nw
   filedes fd

   include SWT_COMMON

   integer off, f
   integer mapsu, tread$, dread$

   f = mapsu (fd)
   off = fd_offset (f)
   if (f < 1 || f > NFILES
         || and (Fd_flags (off), FD_READ) == 0
         || and (Fd_flags (off), FD_ERR) ~= 0)
      return (ERR)

   if (nw <= 0)
      return (0)

   if (LASTOP (off) ~= FD_READF) {
      call flush$ (f)
      SET_LASTOP (off, FD_READF)
      }

   select (Fd_dev (off))
      when (DEV_TTY)
         readf = tread$ (buf, nw, off)
      when (DEV_DSK)
         readf = dread$ (buf, nw, off)
      when (DEV_NULL)
         readf = EOF
   else
      readf = ERR

   return
   end
