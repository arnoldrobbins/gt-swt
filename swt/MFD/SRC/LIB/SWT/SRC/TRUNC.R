# trunc --- truncate a file

   integer function trunc (fd)
   filedes fd

   include SWT_COMMON

   filedes f
   filedes mapsu
   integer off

   f = mapsu (fd)
   if (f < 1 || f > NFILES)
      return (ERR)

   off = fd_offset (f)
   if (and (Fd_flags (off), FD_WRITE) == 0
         || and (Fd_flags (off), FD_ERR) ~= 0)
      return (ERR)

   call flush$ (f)
   select (Fd_dev (off))
      when (DEV_TTY)
         return (OK)
      when (DEV_DSK) {
         call prwf$$ (KTRNC, Fd_unit (off), loc (0), 0,
               intl (0), 0, Errcod)
         if (Errcod == 0)
            return (OK)
         }
      when (DEV_NULL)
         return (OK)

   return (ERR)
   end
