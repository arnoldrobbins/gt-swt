# dmpfd$ --- dump the contents of a file descriptor

   subroutine dmpfd$ (fd, ofd)
   filedes fd, ofd

   include SWT_COMMON

   filedes mfd
   filedes mapsu
   character name (MAXPATH)
   integer f, junk
   integer gfnam$
   longint pos

   procedure display_buffer (f) forward

   mfd = mapsu (fd)
   f = fd_offset (mfd)
   call print (ofd, "Dump of file descriptor *i at *,2a:*n"s,
         mfd, loc (Fdesc (f)))
   if (gfnam$ (mfd, name, MAXPATH) ~= ERR) {
      call putlin (name, ofd)
      if (Fd_dev (f) == DEV_DSK) {
         call prwf$$ (KRPOS, Fd_unit (f), loc (0), 0, pos, 0, junk)
         call print (ofd, " at word *l*n"s, pos)
         }
      else
         call putch (NEWLINE, ofd)
      }
   call print (ofd,
      "*3xDev:  *3i*3xBufstart: *6i*3xBufend: *6i*3xBcount: *3i*n"s,
      Fd_dev (f), Fd_bufstart (f), Fd_bufend (f), Fd_bcount (f))
   call print (ofd,
      "*3xUnit: *3,8i*3xBuflen:   *6i*3xCount:  *6i*3xFlags:  *6,-8,0i*n"s,
      Fd_unit (f), Fd_buflen (f), Fd_count (f), Fd_flags (f))
   call print (ofd, "   Last file system return code was *i*n"s, Errcod)
   if (LASTOP (f) ~= FD_INITIAL && Fd_dev (f) == DEV_DSK)
      display_buffer (f)

   return


   # display_buffer --- print contents of file buffer if appropriate

      procedure display_buffer (f) {
      integer f

      local i, last, lb, rb
      integer i, last, lb, rb

      i = Fd_bufstart (f)
      call print (ofd, "Buffer (at *,2a) contains:*n"s,
            loc (Fd_buf (i + 1)))
      select (LASTOP (f))
         when (FD_READF, FD_GETLIN)
            last = Fd_bufend (f)
         when (FD_WRITEF, FD_PUTLIN)
            last = i + Fd_buflen (f) + Fd_count (f)
      else
         last = 0
      for ( ; i < last; i += 1) {
         lb = rs (Fd_buf (i + 1), 8)
         rb = rt (Fd_buf (i + 1), 8)
         if (lb >= ' 'c && lb < DEL)
            call putch (lb, ofd)
         else
            call print (ofd, "<*3,8,0i>"s, lb)
         if (rb >= ' 'c && rb < DEL)
            call putch (rb, ofd)
         else
            call print (ofd, "<*3,8,0i>"s, rb)
         }
      call putch (NEWLINE, ofd)

      }

   end
