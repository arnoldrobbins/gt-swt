# dwrit$ --- write raw words to disk

   integer function dwrit$ (buf, nw, f)
   integer buf (ARB), nw, f

   include SWT_COMMON

   integer i, bp, n, ip, nwr, ct, bstart, bsize, thresh

   n = nw                     # number of words to write
   ip = 0                     # input buffer pointer

   ct = - Fd_count (f)        # number of words left in buffer
   bp = Fd_bufend (f) - ct    # index (0 based) of next buffer word
   bsize = Fd_buflen (f)      # length of file buffer
   bstart = Fd_bufstart (f)   # index (0 based) of first buffer word
   thresh = bsize / 2

   Errcod = 0
   if (nw >= thresh) {  # write directly from user's buffer
      if (bsize - ct > 0) {
         call prwf$$ (KWRIT, Fd_unit (f),
               loc (Fd_buf (bstart + 1)), bsize - ct,
               intl (0), nwr, Errcod)
         bp = bstart
         ct = bsize
         }
      if (Errcod == 0)
         call prwf$$ (KWRIT, Fd_unit (f), loc (buf (ip + 1)), n,
               intl (0), nwr, Errcod)
      if (Errcod == 0)
         ip += nwr
      }
   else {
      while (n > 0) {
         if (ct <= 0) {
            call prwf$$ (KWRIT, Fd_unit (f),
                  loc (Fd_buf (bstart + 1)), bsize,
                  intl (0), nwr, Errcod)
            if (Errcod ~= 0)
               break
            bp = bstart
            ct = bsize
            }
         i = n
         if (i > ct)
            i = ct
         call move$ (buf (ip + 1), Fd_buf (bp + 1), i)
         ip += i
         bp += i
         n -= i
         ct -= i
         }
      }

   Fd_count (f) = -ct

   if (Errcod ~= 0) {
      Fd_flags (f) |= FD_ERR
      return (EOF)
      }

   return (ip)
   end
