# markf --- read the position of a file

   filemark function markf (fd)
   filedes fd

   include SWT_COMMON

   integer f, off
   integer mapsu
   longint tmark$, dmark$

   f = mapsu (fd)
   off = fd_offset (f)
   if (f < 1 || f > NFILES
         || and (Fd_flags (off), FD_ERR) ~= 0
         || Fd_flags (off) == 0)
      return (ERR)

   if (LASTOP (off) ~= FD_INITIAL) {
      call flush$ (f)
      SET_LASTOP (off, FD_INITIAL)
      }

   select (Fd_dev (off))
      when (DEV_TTY)
         return (tmark$ (off))
      when (DEV_DSK)
         return (dmark$ (off))
      when (DEV_NULL)
         return (0)

   return (ERR)

   end
