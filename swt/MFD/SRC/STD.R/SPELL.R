# spell --- check for possible spelling errors

   include ARGUMENT_DEFS

   define(MEMSIZE,32767)

   file_des in, text, words, swords
   file_des mktemp, open

   pointer misspellings
   pointer mktabl

   integer state (4), include_fmt_commands, verbose
   integer gfnarg

   character fname (MAXPATH)

   ARG_DECL

   DS_DECL (Mem, MEMSIZE)

   PARSE_COMMAND_LINE ("v<f>f<f>n<ign>"s,
      "Usage:  spell [-{v|f}] {file}"p)
   if (ARG_PRESENT (v))
      verbose = YES
   else
      verbose = NO
   if (ARG_PRESENT (f))
      include_fmt_commands = YES
   else
      include_fmt_commands = NO

   text = mktemp (READWRITE)
   if (text == ERR)
      call error ("can't create temporary file.")

   state (1) = 1
   repeat {
      select (gfnarg (fname, state))
         when (EOF)
            break
         when (ERR)
            call print (ERROUT, "*s:  can't open*n"p, fname)
         when (OK) {
            in = open (fname, READ)
            if (in == ERR)
               call print (ERROUT, "*s:  can't open*n"p, fname)
            else {
               call fcopy (in, text)
               call close (in)
               }
            }
      }

   words = mktemp (READWRITE)
   if (words == ERR)
      call error ("can't open temporary file.")
   call rewind (text)
   call separate (text, words, include_fmt_commands)

   swords = mktemp (READWRITE)
   if (swords == ERR)
      call error ("can't open temporary file.")
   call rewind (words)
   call sort (words, swords)
   call rmtemp (words)

   call rewind (swords)
   call dsinit (MEMSIZE)
   misspellings = mktabl (0)
   call find_misspellings (swords, misspellings)
   if (verbose == YES) {
      call rewind (text)
      call highlight_misspellings (text, misspellings, STDOUT,
         include_fmt_commands)
      }
   else
      call report_misspellings (misspellings, STDOUT, include_fmt_commands)

   call rmtemp (text)
   call rmtemp (swords)
   stop
   end



# separate --- break lines of text into one-word-per-line

   subroutine separate (text, words, ifc)
   file_des text, words
   integer ifc    # "include formatter commands"

   character line (MAXLINE), word (MAXLINE)

   integer i, first, last
   integer get_word, getlin

   while (getlin (line, text) ~= EOF) {
      if (ifc == NO && line (1) == "."c)
         next
      i = 1
      while (get_word (word, line, i, first, last) ~= EOF) {
         call putlin (word, words)
         call putch (NEWLINE, words)
         }
      }

   return
   end



# get_word --- get next "word" from a line of text

   integer function get_word (word, line, i, first, last)
   character word (MAXLINE), line (MAXLINE)
   integer i, first, last

   integer j

   repeat {             # until we get a non-zero length word
      repeat {          # skip non-word characters
         if (line (i) == EOS)
            return (EOF)
         if (IS_LETTER (line (i)))
            break
         i += 1
         }

      j = 1
      first = i
      while (line (i) == "'"c || IS_LETTER (line (i))) {
         word (j) = line (i)
         if (IS_UPPER (word (j)))
            word (j) = word (j) - 'A'c + 'a'c      # ASCII DEPENDENT!!
         j += 1
         i += 1
         }

      if (word (j - 1) == "'"c) {      # throw away trailing apostrophes
         j -= 1
         last = i - 2
         }
      else
         last = i - 1
      word (j) = EOS
      }  until (j > 1)

   return (j - 1)          # return word length
   end



# find_misspellings --- find possibly misspelled words by dictionary lookup

   subroutine find_misspellings (swords, misspellings)
   file_des swords
   pointer misspellings

   character word (MAXLINE), dword (MAXLINE)

   file_des dictionary
   file_des open

   integer i
   integer strcmp, getlin
   integer length

   dictionary = open ("=dictionary="s, READ)
   if (dictionary == ERR)
      call error ("=dictionary=:  can't open"p)

   if (getlin (dword, dictionary) == EOF)
      call error ("dictionary is empty!"p)
   if (getlin (word, swords) == EOF)
      return

   repeat {

      # check for 's at end of a word
      i = length (word)
      if (word (i - 2) == "'"c && word (i - 1) == 's'c) {   # earlier made lower case
         i -= 2
         word (i) = NEWLINE
         word (i + 1) = EOS
         }

      select (strcmp (word, dword))
         when (1) {     # word precedes current dictionary word
            for (i = 1; word (i) ~= NEWLINE; i += 1)
               ;
            word (i) = EOS
            call enter (word, 0, misspellings)
            if (getlin (word, swords) == EOF)
               break
            }
         when (2) {     # word matches current dictionary word
            if (getlin (word, swords) == EOF)
               break
            }
         when (3) {     # need to skip some dictionary words
            if (getlin (dword, dictionary) == EOF) {
               repeat { # enter remaining words in misspellings list
                  for (i = 1; word (i) ~= NEWLINE; i += 1)
                     ;
                  word (i) = EOS
                  call enter (word, 0, misspellings)
                  } until (getlin (word, swords) == EOF)
               break
               }
            }
      }

   call close (dictionary)
   return
   end



# highlight_misspellings --- indicate misspelled words, somehow

   subroutine highlight_misspellings (text, misspellings, out, ifc)
   file_des text, out
   pointer misspellings
   integer ifc    # "include formatter commands"

   integer junk, i, first, last, j, limit
   integer get_word, lookup, getlin

   character line (MAXLINE), word (MAXLINE), highlighter (MAXLINE)

   do j = 1, MAXLINE
      highlighter (j) = ' 'c

   while (getlin (line, text) ~= EOF) {
      call putch (' 'c, out)
      call putlin (line, out)
      if (ifc == NO && line (1) == "."c)
         next
      limit = 0
      i = 1
      while (get_word (word, line, i, first, last) ~= EOF)
         if (lookup (word, junk, misspellings) == YES) {
            do j = first, last
               highlighter (j) = line (j)
            limit = last
            }
      if (limit > 0) {
         highlighter (limit + 1) = NEWLINE
         highlighter (limit + 2) = EOS
         call putch ('+'c, out)
         call putlin (highlighter, out)
         for (j = 1; j <= limit + 2; j += 1)
            highlighter (j) = ' 'c
         }
      }

   return
   end



# report_misspellings --- list possibly misspelled words

   subroutine report_misspellings (misspellings, out, ifc)
   pointer misspellings
   file_des out
   integer ifc

   pointer posn

   integer junk
   integer sctabl
   integer expand, new_words, open

   character word (MAXLINE)
   character new_stuff (MAXLINE)
   logical save_bad_words

   save_bad_words = (expand ("=new_words="s, new_stuff, MAXLINE) ~= ERR)
   if (save_bad_words) {
      new_words = open (new_stuff, READWRITE)
      if (new_words == ERR)
         save_bad_words = FALSE
      else
         call wind (new_words)
      }

   posn = 0
   while (sctabl (misspellings, word, junk, posn) ~= EOF) {
      call putlin (word, out)
      call putch (NEWLINE, out)
      if (save_bad_words) {
         call putlin (word, new_words)
         call putch (NEWLINE, new_words)
         }
      }

   return
   end



# sort --- external sort of text lines

   subroutine sort (ifd, ofd)
   filedes ifd, ofd

   define(MERGEORDER,7)
   define(MERGETEXT,900)
   define(NAMESIZE,30)
   define(MAXTEXT,32767)
   define(MAXPTR,4096)
   define(LOGPTR,12)

   character linbuf (MAXTEXT)
   integer infil (MERGEORDER), linptr (MAXPTR),
         nlines, high, lim, low, t
   integer gtext
   filedes outfd
   filedes makfil

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

   call encode (name, NAMESIZE, "=temp=/sp=pid=*i"s, n)

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
