# flush$ --- flush out a file's buffer

   integer function flush$ (fd)
   filedes fd

   include SWT_COMMON

   integer f, junk
   character zerostr (2)
   data zerostr / 0, EOS /

   if (fd < 1 || fd > NFILES)
      return (ERR)

   f = fd_offset (fd)

   if (Fd_flags (f) == 0 || and (Fd_flags (f), FD_ERR) ~= 0)
      return (ERR)

   Errcod = 0

   call break$ (DISABLE)

   select (Fd_dev (f))
      when (DEV_DSK) {
         select (LASTOP (f))
            when (FD_PUTLIN) {
               if (Fd_bcount (f) ~= 0) # flush blanks
                  call dputl$ (zerostr, Fdesc (f))
               elif (and (Fd_flags (f), FD_BYTE) ~= 0)
                  Fd_count (f) += 1
               if (Fd_count (f) + Fd_buflen (f) > 0)
                  call prwf$$ (KWRIT, Fd_unit (f),
                     loc (Fd_buf (Fd_bufstart (f) + 1)),
                     Fd_count (f) + Fd_buflen (f),
                     intl (0), junk, Errcod)
               }
            when (FD_GETLIN) {
               if (and (Fd_flags (f), FD_BYTE) ~= 0)
                  Fd_count (f) += 1
               if (Fd_count (f) < 0)
                  call prwf$$ (KPOSN + KPRER, Fd_unit (f), intl (0), 0,
                     intl (Fd_count (f)), junk, Errcod)
               }
            when (FD_WRITEF) {
               if (Fd_count (f) + Fd_buflen (f) ~= 0) {
                  call prwf$$ (KWRIT, Fd_unit (f),
                     loc (Fd_buf (Fd_bufstart (f) + 1)),
                     Fd_count (f) + Fd_buflen (f),
                     intl (0), junk, Errcod)
                  }
               }
            when (FD_READF) {
               if (Fd_count (f) < 0)
                  call prwf$$ (KPOSN + KPRER, Fd_unit (f), intl (0), 0,
                     intl (Fd_count (f)), junk, Errcod)
               }
         }  # when (DEV_DSK)

   Fd_bufend (f) = 0
   Fd_count (f) = 0
   Fd_bcount (f) = 0
   Fd_flags (f) &= not (FD_BYTE)
   SET_LASTOP (f, FD_INITIAL)

   call break$ (ENABLE)

   if (Errcod ~= 0) {
      Fd_flags (f) |= FD_ERR
      return (ERR)
      }

   return (OK)
   end
