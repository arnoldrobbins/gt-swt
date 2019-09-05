# sort --- sort a relation externally

   subroutine sort (rd, keys, orders, ifd, ofd)
   relation_des rd (RDSIZE)
   integer keys (MAXKEYS), orders (MAXKEYS)
   filedes ifd, ofd

   define(MERGEORDER,7)
   define(MERGETEXT,900)
   define(NAMESIZE,30)
   define(MAXTEXT,32768)
   define(MAXPTR,4096)
   define(LOGPTR,12)

   character rowbuf (MAXTEXT), name (NAMESIZE)
   integer infil (MERGEORDER), rowptr (MAXPTR),
         nrows, high, lim, low, t, i
   integer gtext
   filedes outfd
   filedes makfil, open

   high = 0
   repeat {         # initial formation of runs
      t = gtext (rd, rowptr, nrows, rowbuf, ifd)
      call quick (rd, keys, orders, rowptr, nrows, rowbuf)
      if (t ~= EOF || high > 0) {   # do only if more than 1 run required
         high += 1
         outfd = makfil (high)
         call ptext (rd, rowptr, nrows, rowbuf, outfd)
         call close (outfd)
         }
      } until (t == EOF)

   if (high == 0) {     # everything fit in the first run
      call ptext (rd, rowptr, nrows, rowbuf, ofd)
      call rewind (ofd)
      return
      }

   for (low = 1; low < high; low += MERGEORDER) {  # merge
      lim = min0 (low + MERGEORDER - 1, high)
      call gopen (infil, low, lim)
      if (lim >= high )       # final merge phase
         call merge (rd, keys, orders, infil, lim - low + 1, ofd)
      else {
         high += 1
         outfd = makfil (high)
         call merge (rd, keys, orders, infil, lim - low + 1, outfd)
         call close (outfd)
         }
      call gremov (infil, low, lim)
      }

   call rewind (ofd)

   return
   end



# gname --- make unique name for file id  n

   subroutine gname (n, name)
   integer n
   character name (NAMESIZE)

   call encode (name, NAMESIZE, "=temp=/rs=pid=*i"s, n)

   return
   end



# makfil --- make new file for number  n

   filedes function makfil (n)
   integer n

   character name (NAMESIZE)
   filedes create

   call gname (n, name)
   makfil = create (name, READWRITE)
   if (makfil == ERR)
      call cant (name)

   return
   end



# gopen --- open group of files low ... lim

   subroutine gopen (infil, low, lim)
   filedes infil (MERGEORDER)
   integer low, lim

   character name (NAMESIZE)
   integer i
   filedes open

   for (i = 1; i <= lim - low + 1; i += 1) {
      call gname (low + i - 1, name)
      infil (i) = open (name, READ)
      if (infil (i) == ERR)
         call cant (name)
      }

   return
   end



# gremov --- remove group of files  low ... lim

   subroutine gremov (infil, low, lim)
   filedes infil (MERGEORDER)
   integer low, lim

   character name (NAMESIZE)
   integer i

   for (i = 1; i <= lim - low + 1; i += 1) {
      call close (infil (i))
      call gname (low + i - 1, name)
      call remove (name)
      }

   return
   end



# merge --- merge infil (1) ... infil (nfiles) onto outfil

   subroutine merge (rd, keys, orders, infil, nfiles, outfil)
   relation_des rd (RDSIZE)
   integer keys (MAXKEYS), orders (MAXKEYS)
   filedes infil (MERGEORDER), outfil
   integer nfiles

   character rowbuf (MERGETEXT)
   integer getrow
   integer i, inf, rbp, rp1, nf, rowptr (MERGEORDER)

   rbp = 1
   nf = 0
   for (i = 1; i <= nfiles; i += 1)    # get one line from each file
      if (getrow (rd, infil (i), rowbuf (rbp)) ~= EOF) {
         nf += 1
         rowptr (nf) = rbp
         rbp += RDROWLEN (rd)
         }
   call quick (rd, keys, orders, rowptr, nf, rowbuf)     # make initial heap
   while (nf > 0) {
      rp1 = rowptr (1)
      call putrow (rd, outfil, rowbuf (rp1))
      inf = rp1 / RDROWLEN (rd) + 1          # compute file index
      if (getrow (rd, infil (inf), rowbuf (rp1)) == EOF) {
         rowptr (1) = rowptr (nf)
         nf -= 1
         }
      call reheap (rd, keys, orders, rowptr, nf, rowbuf)
      }

   return
   end



# reheap --- propagate linbuf (linptr (1)) to proper place in heap

   subroutine reheap (rd, keys, orders, rowptr, nf, rowbuf)
   relation_des rd (RDSIZE)
   integer keys (MAXKEYS), orders (MAXKEYS)
   integer rowptr (ARB), nf
   character rowbuf (MAXTEXT)

   integer i, j
   integer compare

   for (i = 1; 2 * i <= nf; i = j) {
      j = 2 * i
      if (j < nf)       # find smaller child
         if (compare (rd, keys, orders, rowptr (j), rowptr (j + 1), rowbuf) > 0)
            j += 1
      if (compare (rd, keys, orders, rowptr (i), rowptr (j), rowbuf) <= 0)
         break          # proper position found
      call exchan (rowptr (i), rowptr (j), rowbuf)    # percolate
      }

   return
   end



# gtext --- get text lines into linbuf

   integer function gtext (rd, rowptr, nrows, rowbuf, infile)
   relation_des rd (RDSIZE)
   integer rowptr (MAXPTR), nrows, i
   character rowbuf (MAXTEXT)
   filedes infile, outfile

   integer rbp, len
   integer getrow


   nrows = 0
   rbp = 1
   repeat {
      if (getrow (rd, infile, rowbuf (rbp)) == EOF)
         return (EOF)
      nrows += 1
      rowptr (nrows) = rbp
      rbp += RDROWLEN (rd)
      } until (rbp >= MAXTEXT - MAXLINE || nrows >= MAXPTR)

   return (OK)
   end



# ptext --- output text lines from rowbuf

   subroutine ptext (rd, rowptr, nrows, rowbuf, outfil)
   relation_des rd (RDSIZE)
   integer rowptr (MAXPTR), nrows
   character rowbuf (MAXTEXT)
   filedes outfil

   integer i, j

   for (i = 1; i <= nrows; i += 1) {
      j = rowptr (i)
      call putrow (rd, outfil, rowbuf (j))
      }

   return
   end



# compare --- compare linbuf (lp1) with linbuf (lp2)

   integer function compare (rd, keys, orders, rp1, rp2, rowbuf)
   relation_des rd (RDSIZE)
   integer keys (MAXKEYS), orders(MAXKEYS)
# orders = +1 for ascending, -1 for descending
   integer rp1, rp2
   character rowbuf (ARB)

   integer k, r, kp
   integer buf1 (RDATASIZE), buf2 (RDATASIZE)
   integer compare_field

   for (kp = 1; keys (kp) ~= 0; kp += 1) {
      k = keys (kp)
      call get_data (rd, k, rowbuf (rp1), buf1)
      call get_data (rd, k, rowbuf (rp2), buf2)
      r = compare_field (RFTYPE (rd, k), buf1, buf2)
      if (r ~= 2)
         return ((r - 2) * orders(kp))
      }

   return (0)
   end



# exchan --- exchange rowbuf (rp1) with rowbuf (rp2)

   subroutine exchan (rp1, rp2, rowbuf)
   integer rp1, rp2
   character rowbuf (ARB)

   integer k

   k = rp1
   rp1 = rp2
   rp2 = k

   return
   end



# quick --- quicksort for relation rows

   subroutine quick (rd, keys, orders, rowptr, nrows, rowbuf)
   relation_des rd (RDSIZE)
   integer keys (MAXKEYS), orders (MAXKEYS)
   integer rowptr (ARB), nrows
   character rowbuf (ARB)

   integer i, j, lv (LOGPTR), p, pivrow, uv (LOGPTR)
   integer compare

   lv (1) = 1
   uv (1) = nrows
   p = 1
   while (p > 0)
      if (lv (p) >= uv (p))      # only one element in this subset
         p -= 1                  # pop stack
      else {
         i = lv (p) - 1
         j = uv (p)
         pivrow = rowptr (j)     # pivot line
         while (i < j) {
            for (i+=1; compare (rd, keys, orders, rowptr (i), pivrow, rowbuf) < 0; i+=1)
               ;
            for (j -= 1; j > i; j -= 1)
               if (compare (rd, keys, orders, rowptr (j), pivrow, rowbuf) <= 0)
                  break
            if (i < j)           # out of order pair
               call exchan (rowptr (i), rowptr (j), rowbuf)
            }
         j = uv (p)              # move pivot to position i
         call exchan (rowptr (i), rowptr (j), rowbuf)
         if (i - lv (p) < uv (p) - i) {   # stack so shorter done first
            lv (p + 1) = lv (p)
            uv (p + 1) = i - 1
            lv (p) = i + 1
            }
         else {
            lv (p + 1) = i + 1
            uv (p + 1) = uv (p)
            uv (p) = i - 1
            }
         p += 1                  # push onto stack
         }

   return
   end
