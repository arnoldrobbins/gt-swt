# getlin --- read one line from a file

   integer function getlin (line, fd, xmax)
   character line (ARB)
   integer fd, xmax

   include SWT_COMMON

   integer off, max, f
   integer tgetl$, dgetl$, mapsu
   logical missin

   f = mapsu (fd)
   off = fd_offset (f)
   if (f < 1 || f > NFILES
         || and (Fd_flags (off), FD_READ) == 0
         || and (Fd_flags (off), FD_ERR) ~= 0) {
      line (1) = EOS
      return (EOF)
      }

   if (missin (xmax))
      max = MAXLINE
   else
      max = xmax

   if (max <= 1) {
      line (1) = EOS
      return (0)
      }

   if (LASTOP (off) ~= FD_GETLIN) {
      call flush$ (f)
      SET_LASTOP (off, FD_GETLIN)
      }

   select (Fd_dev (off))
      when (DEV_TTY)
         getlin = tgetl$ (line, max, off)
      when (DEV_DSK)
         getlin = dgetl$ (line, max, Fdesc (off))
      when (DEV_NULL)
         getlin = 0
   else
      getlin = 0

   if (getlin == 0) {
      line (1) = EOS
      return (EOF)
      }

   return
   end
