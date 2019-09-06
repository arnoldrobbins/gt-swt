# dopen$ --- open a disk file for reading and/or writing

   integer function dopen$ (path, fd, mode, ftype, delay)
   character path (ARB)
   filedes fd
   integer mode, ftype, delay

   include SWT_COMMON

   integer at, c, d, f, m, t, u, junk (3), fname (16)
   integer getto
   logical missin


   if (getto (path, fname, junk, at) == ERR) {
      call at$hom (c)
      return (ERR)      # file could not be reached for some reason
      }

   if (missin (delay))
      d = 0
   else
      d = delay

   f = fd_offset (fd)
   m = or (mode, KGETU)

   call srch$$ (m, fname, 32, u, t, c)
   while (d ~= 0 && c == EFIUS) {
      call sleep$ (intl (500))
      call srch$$ (m, fname, 32, u, t, c)
      if (d ~= -1)
         d -= 1
      }
   Errcod = c
   if (c ~= 0) {
      if (at == YES)
         call at$hom (c)
      return (ERR)      # Primos couldn't open the file
      }

   if (~missin (ftype))
      ftype = t

   if (at == YES)
      call at$hom (c)

   Fd_unit (f) = u
   Fd_flags (f) |= FD_COMP + ls (rt (t, 3), 6)

   return (fd)
   end
