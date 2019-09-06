# mapfd --- convert fd to Primos funit

   integer function mapfd (fd)
   filedes fd

   include SWT_COMMON

   integer off, f
   integer mapsu

   f = mapsu (fd)
   if (f < 1 || f > NFILES)
      return (ERR)

   off = fd_offset (f)

   if (Fd_dev (off) == DEV_DSK)
      return (Fd_unit (off))
   else
      return (ERR)

   end
