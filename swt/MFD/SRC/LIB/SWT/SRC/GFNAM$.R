# gfnam$ --- get pathname for an open file

   integer function gfnam$ (fd, path, size)
   filedes fd
   character path (ARB)
   integer size

   include SWT_COMMON

   filedes f
   filedes mapsu
   integer off, code, len, buf (MAXPATH)
   integer mkpa$, ctoc
   character name (MAXPATH)

   path (1) = EOS

   f = mapsu (fd)
   off = fd_offset (f)
   if (f < 1 || f > NFILES || Fd_flags (off) == 0)
      return (ERR)

   select (Fd_dev (off))
      when (DEV_TTY)
         return (ctoc ("/dev/tty"s, path, size))
      when (DEV_NULL)
         return (ctoc ("/dev/null"s, path, size))
      when (DEV_DSK) {
         call gpath$ (KUNIT, Fd_unit (off), buf, MAXPATH, len, code)
         if (code == 0) {
            call ptoc (buf, EOS, name, min0 (size, len + 1))
            return (mkpa$ (name, path, NO))
            }
         path (1) = EOS
         return (ERR)
         }

   return (ERR)
   end
