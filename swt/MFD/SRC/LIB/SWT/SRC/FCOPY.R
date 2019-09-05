# fcopy --- copy file 'in' to file 'out'

   subroutine fcopy (ifd, ofd)
   file_des ifd, ofd

   include SWT_COMMON

   integer f1, f2, l
   integer getlin, readf
   character buf (1024)
   filedes in, out
   filedes mapsu

   in = mapsu (ifd)
   out = mapsu (ofd)
   f1 = fd_offset (in)
   f2 = fd_offset (out)
   if (Fd_dev (f1) == DEV_DSK && Fd_dev (f2) == DEV_DSK) {
      while (Fd_bcount (f1) ~= 0 || Fd_bcount (f2) ~= 0
            || and (Fd_flags (f1), FD_BYTE) ~= 0
            || and (Fd_flags (f2), FD_BYTE) ~= 0) {
         if (getlin (buf, in, 1024) == EOF)
            return
         call putlin (buf, out)
         }
      repeat {
         l = readf (buf, 1024, in)
         if (l == EOF || l == ERR)
            break
         call writef (buf, l, out)
         }
      }
   else
      while (getlin (buf, in) ~= EOF)
         call putlin (buf, out)

   return
   end
