
# this is the sort for subsystem command "link"

   subroutine sort (ifd, outfd)
   integer ifd, outfd

   define(MERGEORDER,6)
   define(MERGETEXT,900)
   define(NAMESIZE,30)
   define(MAXTEXT,16384)
   define(MAXPTR,2048)
   define(LOGPTR,20)

   character linbuf (MAXTEXT), name (NAMESIZE)
   integer gtext, makfil, open
   integer infil (MERGEORDER), linptr (MAXPTR), nlines
   integer high, lim, low, t

   high = 0
   repeat {         # initial formation of runs
      t = gtext (linptr, nlines, linbuf, ifd)
      call quick (linptr, nlines, linbuf)
      high = high + 1
      outfd = makfil (high)
      call ptext (linptr, nlines, linbuf, outfd)
      call close (outfd)
      } until (t == EOF)

   for (low = 1; low < high; low = low + MERGEORDER) {   # merge
      lim = min0 (low + MERGEORDER - 1, high)
      call gopen (infil, low, lim)
      high = high + 1
      outfd = makfil (high)
      call merge (infil, lim - low + 1, outfd)
      call close (outfd)
      call gremov (infil, low, lim)
      }

   call gname (high, name)   # final cleanup
   outfd = open (name, READ)

   return

   end

# gname --- make unique name for file id  n

   subroutine gname (n, name)
   character name (NAMESIZE)
   integer itoc, scopy
   integer i, junk, n

   i = 1 + scopy ("=temp=/xt=pid="s, 1, name, 1)
   junk = itoc (n, name (i), NAMESIZE - i)

   return
   end

# makfil --- make new file for number  n

   integer function makfil (n)
   character name (NAMESIZE)
   integer create
   integer n

   call gname (n, name)
   makfil = create (name, READWRITE)
   if (makfil == ERR)
      call cant (name)

   return
   end

# gopen --- open group of files low ... lim

   subroutine gopen (infil, low, lim)
   character name (NAMESIZE)
   integer i, infil (MERGEORDER), lim, low
   integer open

   for (i = 1; i <= lim-low+1; i = i + 1) {
      call gname (low+i-1, name)
      infil (i) = open (name, READ)
      if (infil (i) == ERR)
         call cant (name)
      }

   return
   end

# gremov --- remove group of files  low ... lim

   subroutine gremov (infil, low, lim)
   character name (NAMESIZE)
   integer i, infil (MERGEORDER), lim, low

   for (i = 1; i <= lim - low + 1; i = i + 1) {
      call close (infil (i))
      call gname (low + i - 1, name)
      call remove (name)
      }

   return
   end

# merge --- merge infil (1) ... infil (nfiles) onto outfil

   subroutine merge (infil, nfiles, outfil)
   character linbuf (MERGETEXT)
   integer getlin
   integer i, inf, lbp, lp1, nf, nfiles, outfil
   integer infil (MERGEORDER), linptr (MERGEORDER)

   lbp = 1
   nf = 0
   for (i = 1; i <= nfiles; i = i + 1)   # get one line from each file
      if (getlin (linbuf (lbp), infil (i)) ~= EOF) {
         nf = nf + 1
         linptr (nf) = lbp
         lbp = lbp + MAXLINE   # room for largest line
         }
   call quick (linptr, nf, linbuf)         # make initial heap
   while (nf > 0) {
      lp1 = linptr (1)
      call putlin (linbuf (lp1), outfil)
      inf = lp1 / MAXLINE + 1      # compute file index
      if (getlin (linbuf (lp1), infil (inf)) == EOF) {
         linptr (1) = linptr (nf)
         nf = nf - 1
         }
      call reheap (linptr, nf, linbuf)
      }

   return
   end

# reheap --- propagate linbuf (linptr (1)) to proper place in heap

   subroutine reheap (linptr, nf, linbuf)
   character linbuf (MAXTEXT)
   integer compare
   integer i, j, nf, linptr (nf)

   for (i = 1; 2 * i <= nf; i = j) {
      j = 2 * i
      if (j < nf)      # find smaller child
         if (compare (linptr (j), linptr (j+1), linbuf) > 0)
            j = j + 1
      if (compare (linptr (i), linptr (j), linbuf) <= 0)
         break      # proper position found
      call exchan (linptr (i), linptr (j), linbuf)   # percolate
      }

   return
   end

# gtext --- get text lines into linbuf

   integer function gtext (linptr, nlines, linbuf, infile)
   character linbuf (MAXTEXT)
   integer getlin
   integer infile, lbp, len, linptr (MAXPTR), nlines

   nlines = 0
   lbp = 1
   repeat {
      len = getlin (linbuf (lbp), infile)
      if (len == EOF)
         break
      nlines = nlines + 1
      linptr (nlines) = lbp
      lbp = lbp + len + 1  # "1" = room for EOS
      } until (lbp >= MAXTEXT - MAXLINE | nlines >= MAXPTR)

   gtext = len

   return
   end

# ptext --- output text lines from linbuf

   subroutine ptext (linptr, nlines, linbuf, outfil)
   character linbuf (MAXTEXT)
   integer i, j, linptr (MAXPTR), nlines, outfil

   for (i = 1; i <= nlines; i = i + 1) {
      j = linptr (i)
      call putlin (linbuf (j), outfil)
      }

   return
   end

# compare --- compare linbuf (lp1) with linbuf (lp2)

   integer function compare (lp1, lp2, linbuf)
   character linbuf (ARB)
   integer i, j, lp1, lp2

   i = lp1
   j = lp2
   while (linbuf (i) == linbuf (j)) {
      if (linbuf (i) == EOS) {
         compare = 0
         return
         }
      i = i + 1
      j = j + 1
      }
   if (linbuf (i) < linbuf (j))
      compare = -1
   else
      compare = 1

   return
   end

# exchan --- exchange linbuf (lp1) with linbuf (lp2)

   subroutine exchan (lp1, lp2, linbuf)
   character linbuf (ARB)
   integer k, lp1, lp2

   k = lp1
   lp1 = lp2
   lp2 = k

   return
   end

# quick --- quicksort for character lines
   subroutine quick (linptr, nlines, linbuf)
   character linbuf (ARB)
   integer compare
   integer i, j, linptr (ARB), lv (LOGPTR), nlines, p, pivlin, uv (LOGPTR)
   lv (1) = 1
   uv (1) = nlines
   p = 1
   while (p > 0)
      if (lv (p) >= uv (p))      # only one element in this subset
         p = p - 1      # pop stack
      else {
         i = lv (p) - 1
         j = uv (p)
         pivlin = linptr (j)   # pivot line
         while (i < j) {
            for (i=i+1; compare (linptr (i), pivlin, linbuf) < 0; i=i+1)
               ;
            for (j = j - 1; j > i; j = j - 1)
               if (compare (linptr (j), pivlin, linbuf) <= 0)
                  break
            if (i < j)      # out of order pair
               call exchan (linptr (i), linptr (j), linbuf)
            }
         j = uv (p)         # move pivot to position i
         call exchan (linptr (i), linptr (j), linbuf)
         if (i-lv (p) < uv (p)-i) {   # stack so shorter done first
            lv (p+1) = lv (p)
            uv (p+1) = i - 1
            lv (p) = i + 1
            }
         else {
            lv (p+1) = i + 1
            uv (p+1) = uv (p)
            uv (p) = i - 1
            }
         p = p + 1         # push onto stack
         }

   return
   end


