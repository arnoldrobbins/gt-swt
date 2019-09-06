# sort --- external sort of text lines

   define(MERGEORDER,6)
   define(MERGETEXT,900)
   define(NAMESIZE,30)
   define(MAXTEXT,16384)
   define(MAXPTR,2048)
   define(LOGPTR,20)

   character linbuf (MAXTEXT), name (NAMESIZE), keybuf (MAXTEXT)
   integer gtext, makfil, open, nextfile
   integer infil (MERGEORDER), keyptr (MAXPTR), nlines
   integer high, lim, low, outfd, t, argp, ifd

   call optarg (argp)   # process optional arguments
   if (nextfile (argp, ifd) == EOF) # check for file names
      ifd = STDIN                   #   none, use STDIN
   high = 0
   repeat {
      repeat {         # initial formation of runs
         t = gtext (keyptr, nlines, keybuf, linbuf, ifd)
         call quick (keyptr, nlines, keybuf)
         high += 1
         outfd = makfil (high)
         call ptext (keyptr, nlines, keybuf, linbuf, outfd)
         call close (outfd)
         } until (t == EOF)
      if (ifd ~= STDIN)
         call close (ifd)
      } until (nextfile (argp, ifd) == EOF)

   for (low = 1; low < high; low += MERGEORDER) {   # merge
      lim = min0 (low+MERGEORDER-1, high)
      call gopen (infil, low, lim)
      high += 1
      outfd = makfil (high)
      call merge (infil, lim-low+1, outfd)
      call close (outfd)
      call gremov (infil, low, lim)
      }

   call gname (high, name)   # final cleanup
   outfd = open (name, READ)
   if (outfd == ERR)
      call cant (name)
   call fcopy (outfd, STDOUT)
   call close (outfd)
   call remove (name)

   stop
   end

# gname --- make unique name for file id  n

   subroutine gname (n, name)
   character name (NAMESIZE)
   integer n

   call encode (name, NAMESIZE, "=temp=/st$=pid=*i"s, n)

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

   for (i = 1; i <= lim-low+1; i += 1) {
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

   for (i = 1; i <= lim-low+1; i += 1) {
      call close (infil (i))
      call gname (low+i-1, name)
      call remove (name)
      }

   return
   end

# merge --- merge infil (1) ... infil (nfiles) onto outfil

   subroutine merge (infil, nfiles, outfil)
   character linbuf (MERGETEXT), keybuf (MERGETEXT)
   integer getlin
   integer i, inf, lbp, kbp, lp1, kp1, nf, nfiles, outfil
   integer infil (MERGEORDER), keyptr (MERGEORDER)

   lbp = 1
   kbp = 1
   nf = 0
   for (i = 1; i <= nfiles; i += 1)      # get one line from each file
      if (getlin (linbuf (lbp), infil (i)) ~= EOF) {
         call make_key (keybuf (kbp + 1), linbuf (lbp))
         keybuf (kbp) = lbp   # save pointer to text of line
         nf += 1
         keyptr (nf) = kbp + 1
         lbp += MAXLINE        # room for largest line
         kbp += MAXLINE        # room for largest key
         }
   call quick (keyptr, nf, keybuf)         # make initial heap
   while (nf > 0) {
      lp1 = keybuf (keyptr (1) - 1)
      call putlin (linbuf (lp1), outfil)
      inf = lp1 / MAXLINE + 1      # compute file index
      if (getlin (linbuf (lp1), infil (inf)) == EOF) {
         keyptr (1) = keyptr (nf)
         nf -= 1
         }
      else {
         kp1 = keyptr (1)
         call make_key (keybuf (kp1), linbuf (lp1))
         }
      call reheap (keyptr, nf, keybuf)
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
            j += 1
      if (compare (linptr (i), linptr (j), linbuf) <= 0)
         break      # proper position found
      call exchan (linptr (i), linptr (j), linbuf)   # percolate
      }

   return
   end

# gtext --- get text lines into linbuf

   integer function gtext (keyptr, nlines, keybuf, linbuf, infile)
   character linbuf (MAXTEXT), keybuf (MAXTEXT)
   integer getlin, make_key
   integer infile, lbp, kbp, llen, klen, keyptr (MAXPTR), nlines

   nlines = 0
   lbp = 1
   kbp = 1
   repeat {
      llen = getlin (linbuf (lbp), infile)
      if (llen == EOF)
         break
      klen = make_key (keybuf (kbp + 1), linbuf (lbp))
      keybuf (kbp) = lbp
      nlines += 1
      keyptr (nlines) = kbp + 1
      lbp += llen + 1       # "1" = room for EOS
      kbp += klen + 2       # "2" = room for pointer and EOS
      } until (lbp >= MAXTEXT-MAXLINE | nlines >= MAXPTR)

   gtext = llen

   return
   end

# ptext --- output text lines from linbuf

   subroutine ptext (keyptr, nlines, keybuf, linbuf, outfil)
   character linbuf (MAXTEXT), keybuf (MAXTEXT)
   integer i, j, keyptr (MAXPTR), nlines, outfil

   for (i = 1; i <= nlines; i += 1) {
      j = keybuf (keyptr (i) - 1)
      call putlin (linbuf (j), outfil)
      }

   return
   end

# compare --- compare linbuf (lp1) with linbuf (lp2)

   integer function compare (lp1, lp2, linbuf)
   character linbuf (ARB)
   integer i, j, lp1, lp2

   include "sort_com.r.i"

   i = lp1
   j = lp2
   while (linbuf (i) == linbuf (j)) {
      if (linbuf (i) == EOS) {
         compare = 0
         return
         }
      i += 1
      j += 1
      }
   if (linbuf (i) < linbuf (j))
      compare = - direction
   else
      compare = direction

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


# optarg --- process optional arguments
   subroutine optarg (argp)
   integer argp
   integer getarg

   character arg (MAXARG)

   include "sort_com.r.i"

   direction = 1  # default sort direction is ascending
   dictionary = NO   # default to ASCII collating sequence

   for (argp = 1; getarg (argp, arg, MAXARG) ~= EOF; argp = argp + 1)
      if (arg (1) == '-'c)
         if (arg (2) == 'r'c | arg (2) == 'R'c)    # reverse sort
            direction = -1
         else if (arg (2) == 'd'c | arg (2) == 'D'c)  # dictionary order
            dictionary = YES
         else  # not a recognizable option, assume its a file name
            break
      else  # not an option
         break

   return
   end


# nextfile --- check argument list for next input file
   integer function nextfile (argp, fd)
   integer argp, fd

   integer getarg, open

   character arg (MAXARG)

   repeat {
      if (getarg (argp, arg, MAXARG) == EOF) {
         nextfile = EOF
         return
         }
      argp = argp + 1
      if (arg (1) == '-'c & arg (2) == EOS)
         fd = STDIN
      else {
         fd = open (arg, READ)
         if (fd == ERR)
            call print (ERROUT, "*s: can't open*n.", arg)
         }
      } until (fd ~= ERR)

   return
   end

# make_key --- construct sort key

   integer function make_key (keybuf, linbuf)
   character keybuf (MAXLINE), linbuf (MAXLINE)

   integer i, j
   character t
   character type, mapup

   include "sort_com.r.i"

   j = 1
   for (i = 1; linbuf (i) ~= EOS & linbuf (i) ~= NEWLINE; i = i + 1) {
      if (dictionary == YES) {
         t = type (linbuf (i))
         if (t == LETTER | t == DIGIT | t == ' 'c) {
            keybuf (j) = mapup (linbuf (i))
            j = j + 1
            }
         }
      else {
         keybuf (j) = linbuf (i)
         j = j + 1
         }
      }
   keybuf (j) = EOS
   make_key = j - 1

   return
   end
