# seekf --- position a file to a designated word

   integer function seekf (pos, fd, xra)
   filemark pos
   filedes fd
   integer xra

   include SWT_COMMON

   filedes f
   filedes mapsu
   integer off, ra
   integer tseek$, dseek$
   logical missin

   f = mapsu (fd)
   off = fd_offset (f)
   if (f < 1 || f > NFILES
         || and (Fd_flags (off), FD_ERR) ~= 0
         || Fd_flags (off) == 0)
      return (ERR)

   if (missin (xra))
      ra = ABS
   else
      ra = xra

   call flush$ (f)
   Fd_flags (off) &= not (FD_EOF)

   select (Fd_dev (off))
      when (DEV_TTY)
         return (tseek$ (pos, off, ra))
      when (DEV_DSK)
         return (dseek$ (pos, off, ra))
      when (DEV_NULL)
         return (EOF)

   return (ERR)

   end
