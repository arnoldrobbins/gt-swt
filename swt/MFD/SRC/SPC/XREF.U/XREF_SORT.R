# sort --- external sort of text lines

   subroutine sort (ifd, ofd)
   filedes ifd, ofd

   define(MERGEORDER,7)
   define(MERGETEXT,900)
   define(NAMESIZE,30)
   define(MAXTEXT,32768)
   define(MAXPTR,4096)
   define(LOGPTR,12)

   character linbuf (MAXTEXT), name (NAMESIZE)
   integer infil (MERGEORDER), linptr (MAXPTR),
         nlines, high, lim, low, t
   integer gtext
   filedes outfd
   filedes makfil, open

   high = 0
   repeat {         # initial formation of runs
      t = gtext (linptr, nlines, linbuf, ifd)
      call quick (linptr, nlines, linbuf)
      if (t ~= EOF || high > 0) {   # do only if more than 1 run required
         high += 1
         outfd = makfil (high)
         call ptext (linptr, nlines, linbuf, outfd)
         call close (outfd)
         }
      } until (t == EOF)

   if (high == 0) {     # everything fit in the first run
      call ptext (linptr, nlines, linbuf, ofd)
      call rewind (ofd)
      return
      }

   for (low = 1; low < high; low += MERGEORDER) {  # merge
      lim = min0 (low + MERGEORDER - 1, high)
      call gopen (infil, low, lim)
      if (lim >= high )       # final merge phase
         call merge (infil, lim - low + 1, ofd)
      else {
         high += 1
         outfd = makfil (high)
         call merge (infil, lim - low + 1, outfd)
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

   call encode (name, NAMESIZE, "=temp=/xt=pid=*i"s, n)

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

   subroutine merge (infil, nfiles, outfil)
   filedes infil (MERGEORDER), outfil
   integer nfiles

   character linbuf (MERGETEXT)
   integer getlin
   integer i, inf, lbp, lp1, nf, linptr (MERGEORDER)

   lbp = 1
   nf = 0
   for (i = 1; i <= nfiles; i += 1)    # get one line from each file
      if (getlin (linbuf (lbp), infil (i)) ~= EOF) {
         nf += 1
         linptr (nf) = lbp
         lbp += MAXLINE                # room for largest line
         }
   call quick (linptr, nf, linbuf)     # make initial heap
   while (nf > 0) {
      lp1 = linptr (1)
      call putlin (linbuf (lp1), outfil)
      inf = lp1 / MAXLINE + 1          # compute file index
      if (getlin (linbuf (lp1), infil (inf)) == EOF) {
         linptr (1) = linptr (nf)
         nf -= 1
         }
      call reheap (linptr, nf, linbuf)
      }

   return
   end



# reheap --- propagate linbuf (linptr (1)) to proper place in heap

   subroutine reheap (linptr, nf, linbuf)
   integer linptr (ARB), nf
   character linbuf (MAXTEXT)

   integer i, j
   integer compare

   for (i = 1; 2 * i <= nf; i = j) {
      j = 2 * i
      if (j < nf)       # find smaller child
         if (compare (linptr (j), linptr (j + 1), linbuf) > 0)
            j += 1
      if (compare (linptr (i), linptr (j), linbuf) <= 0)
         break          # proper position found
      call exchan (linptr (i), linptr (j), linbuf)    # percolate
      }

   return
   end



# gtext --- get text lines into linbuf

   integer function gtext (linptr, nlines, linbuf, infile)
   integer linptr (MAXPTR), nlines
   character linbuf (MAXTEXT)
   filedes infile

   integer lbp, len
   integer getlin

   nlines = 0
   lbp = 1
   repeat {
      len = getlin (linbuf (lbp), infile)
      if (len == EOF)
         break
      nlines += 1
      linptr (nlines) = lbp
      lbp += len + 1          # "1" = room for EOS
      } until (lbp >= MAXTEXT - MAXLINE || nlines >= MAXPTR)

   gtext = len

   return
   end



# ptext --- output text lines from linbuf

   subroutine ptext (linptr, nlines, linbuf, outfil)
   integer linptr (MAXPTR), nlines
   character linbuf (MAXTEXT)
   filedes outfil

   integer i, j

   for (i = 1; i <= nlines; i += 1) {
      j = linptr (i)
      call putlin (linbuf (j), outfil)
      }

   return
   end



# compare --- compare linbuf (lp1) with linbuf (lp2)

   integer function compare (lp1, lp2, linbuf)
   integer lp1, lp2
   character linbuf (ARB)

   character c1, c2, uc1, uc2
   character mapup
   integer i, j

   i = lp1
   j = lp2
   repeat {
      c1 = linbuf (i)
      c2 = linbuf (j)
      if (c1 ~= c2)
         break
      if (c1 == EOS)
         return (0)
      i += 1
      j += 1
      }
   uc1 = mapup (c1)
   uc2 = mapup (c2)
   select
      when (uc1 < uc2)
         compare = -1
      when (uc1 > uc2)
         compare = +1
      when (IS_LOWER (c1))
         compare = -1
   else
      compare = +1

   return
   end



# exchan --- exchange linbuf (lp1) with linbuf (lp2)

   subroutine exchan (lp1, lp2, linbuf)
   integer lp1, lp2
   character linbuf (ARB)

   integer k

   k = lp1
   lp1 = lp2
   lp2 = k

   return
   end



# quick --- quicksort for character lines

   subroutine quick (linptr, nlines, linbuf)
   integer linptr (ARB), nlines
   character linbuf (ARB)

   integer i, j, lv (LOGPTR), p, pivlin, uv (LOGPTR)
   integer compare

   lv (1) = 1
   uv (1) = nlines
   p = 1
   while (p > 0)
      if (lv (p) >= uv (p))      # only one element in this subset
         p -= 1                  # pop stack
      else {
         i = lv (p) - 1
         j = uv (p)
         pivlin = linptr (j)     # pivot line
         while (i < j) {
            for (i+=1; compare (linptr (i), pivlin, linbuf) < 0; i+=1)
               ;
            for (j -= 1; j > i; j -= 1)
               if (compare (linptr (j), pivlin, linbuf) <= 0)
                  break
            if (i < j)           # out of order pair
               call exchan (linptr (i), linptr (j), linbuf)
            }
         j = uv (p)              # move pivot to position i
         call exchan (linptr (i), linptr (j), linbuf)
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
