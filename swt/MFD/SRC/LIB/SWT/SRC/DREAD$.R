# dread$ --- read raw words from disk

   integer function dread$ (buf, nw, f)
   integer buf (ARB), nw, f

   include SWT_COMMON

   integer bp, bsize, bstart, ct, n, nwr, op, thresh, u

   n = nw                     # number of words left to read
   op = 0                     # number of words already read

   u = Fd_unit (f)
   ct = -Fd_count (f)         # number of words in file buffer
   bp = Fd_bufend (f) - ct    # index (0 based) of current buffer word
   bsize = Fd_buflen (f)      # size of file buffer
   bstart = Fd_bufstart (f)   # index (0 based) of first buffer word
   thresh = bsize / 2

   Errcod = 0
   select
      when (ct >= n) {  # enough words already in file buffer
         call move$ (Fd_buf (bp + 1), buf, n)
         ct -= n
         op = n
         n = 0
         }
      when (ct > 0) {   # empty file buffer into user's buffer
         call move$ (Fd_buf (bp + 1), buf, ct)
         op = ct
         n -= ct
         ct = 0
         }
   select
      when (n >= thresh) { # read directly into user's buffer
         call prwf$$ (KREAD, u, loc (buf (op + 1)), n,
               intl (0), nwr, Errcod)
         if (Errcod == 0 || Errcod == EEOF)
            op += nwr
         }
      when (n > 0) {       # read into file buffer, then copy
         call prwf$$ (KREAD, u, loc (Fd_buf (bstart + 1)), bsize,
               intl (0), ct, Errcod)
         if (Errcod ~= 0 && Errcod ~= EEOF)
            ct = 0
         Fd_bufend (f) = bstart + ct   # update end-of-buffer index
         if (n > ct)
            n = ct
         call move$ (Fd_buf (bstart + 1), buf (op + 1), n)
         ct -= n
         op += n
         }

   Fd_count (f) = -ct      # update file descriptor

   if (Errcod == EEOF)
      Fd_flags (f) |= FD_EOF
   elif (Errcod ~= 0)
      Fd_flags (f) |= FD_ERR

   if (op > 0)
      return (op)

   return (EOF)
   end
