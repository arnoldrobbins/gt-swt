# chkif --- process an if command

   subroutine chkif (buf)
   character buf (ARB)

   integer i, negcond, cond, j
   character mac (MAXLINE), delim
   integer ctoi

   ### get the condition value, 0 = false
   i = 1
   SKIPCM (buf, i)

   SKIPBL (buf, i)

   if (buf (i) == NEWLINE || buf (i) == EOS)    # empty .if command
      return

   if (buf (i) == '~'c) {
      negcond = YES
      i += 1
      }
   else
      negcond = NO
   cond = ctoi (buf, i)

   ### check condition
   if ((negcond == YES && cond == 0) || (negcond == NO && cond ~= 0)) {
      ### process true command
      SKIPBL (buf, i)
      delim = buf (i)
      i += 1
      SKIPBL (buf, i)
      for (j = 1; buf (i) ~= delim && buf (i) ~= EOS; {i += 1; j += 1})
         mac (j) = buf (i)
      mac (j) = EOS
      call processline (mac)
      }
   else {  # process false command
      SKIPBL (buf, i)
      delim = buf (i)
      for (i += 1; buf (i) ~= delim && buf (i) ~= EOS; i += 1) ;
      i += 1
      SKIPBL (buf, i)
      if (buf (i) ~= NEWLINE && buf (i) ~= EOS && buf (i) ~= delim) {
         # there is an else part
         for (j = 1; buf (i) ~= delim && buf (i) ~= EOS; {i += 1; j += 1})
            mac (j) = buf (i)
         mac (j) = EOS
         call processline (mac)
         }
      }

   return
   end



# ctoi --- local ctoi which is better than the one in swtlib

   integer function ctoi (str, i)
   character str (ARB)
   integer i

   integer gctoi  # use version which knows about negative numbers

   return (gctoi (str, i, 10))
   end


# esc --- map  array (i)  into escaped character if appropriate

   character function esc (array, i)
   character array (ARB)
   integer i

   if (array (i) ~= ESCAPE)
      esc = array (i)
   elif (array (i+1) == EOS)   # \*a not special at end
      esc = ESCAPE
   else {
      i += 1
      if (array (i) == 'n'c)
         esc = NEWLINE
      else if (array (i) == 't'c)
         esc = TAB
      else
         esc = array (i)
      }

   return
   end



# getstr --- get string following a command

   integer function getstr (buf, str, size)
   integer size
   character buf (ARB), str (size)

   integer i, j
   integer ctoc

   i = 1
   SKIPCM (buf, i)
   j = ctoc (buf (i), str, size)
   if (j > 0 && str (j) == NEWLINE) {
      str (j) = EOS
      j -= 1
      }

   return (j)

   end



# getsc --- get single character parameter after command

   subroutine getsc (buf, param, defalt)
   character buf (ARB), param, defalt

   integer i

   i = 1
   SKIPCM (buf, i)
   if (buf (i) == NEWLINE)
      param = defalt
   else
      param = buf (i)

   return
   end



# getval --- evaluate optional numeric argument

   integer function getval (buf, argtyp)
   character buf (MAXLINE)
   integer argtyp

   integer i
   integer ctoi

   i = 1
   SKIPCM (buf, i)
   argtyp = buf (i)
   if (argtyp == '+'c || argtyp == '-'c)
      i += 1

   getval = ctoi (buf, i)

   return
   end



# mktl --- make 'title' from three-part-title in 'buf'

   subroutine mktl (buf, pageno, title, size)
   integer pageno, size
   character buf (ARB), title (size)

   include FMT_COMMON

   character lpart (MAXLINE), cpart (MAXLINE), rpart (MAXLINE), delim
   integer lw, cw, rw, i, numsp, p, size_minus_1
   integer mvpart, ctoc

   if (buf (1) == EOS) {
      title (1) = NEWLINE
      title (2) = EOS
      return
      }

   i = 1
   delim = buf (1)
   size_minus_1 = size - 1

   lw = mvpart (buf, i, delim, pageno, lpart, MAXLINE)
   cw = mvpart (buf, i, delim, pageno, cpart, MAXLINE)
   rw = mvpart (buf, i, delim, pageno, rpart, MAXLINE)

   p = ctoc (lpart, title, size_minus_1) + 1

   numsp = (Tiwidth / 2) - lw - cw / 2
   if (numsp < 1)
      numsp = 1

   for (i = 1; i <= numsp && p < size_minus_1; {p += 1; i += 1})
      title (p) = ' 'c

   p += ctoc (cpart, title (p), size - p)

   numsp = Tiwidth - (lw + numsp + cw + rw)
   if (numsp < 1)
      numsp = 1

   for (i = 1; i <= numsp && p < size_minus_1; {p += 1; i += 1})
      title (p) = ' 'c

   p += ctoc (rpart, title (p), size - p)

   title (p) = NEWLINE
   title (p + 1) = EOS

   return
   end



# mvpart --- move part of a three-part title to a buffer

   integer function mvpart (buf, i, delim, pageno, part, size)
   integer i, pageno, size
   character buf (ARB), delim, part (size)

   integer j
   integer itoc, width

   if (buf (i) ~= delim) {
      part (1) = EOS
      return (0)
      }

   i += 1
   j = 1
   while (j < size && buf (i) ~= delim
         && buf (i) ~= NEWLINE && buf (i) ~= EOS) {
      if (buf (i) == ESCAPE) {
         if (buf (i + 1) ~= PAGENUM)
            part (j) = ESCAPE
         else {
            part (j) = PAGENUM
            i += 1
            }
         j += 1
         }
      elif (buf (i) ~= PAGENUM) {
         part (j) = buf (i)
         j += 1
         }
      else
         j += itoc (pageno, part (j), size - j + 1)
      i += 1
      }

   part (j) = EOS

   return (width (part))

   end



# skip --- output  n  blank lines

   subroutine skip (n)
   integer n

   include FMT_COMMON

   integer i

   CHECK_PAGE_RANGE
   for (i = 1; i <= n; i += 1)
      call putch (NEWLINE, STDOUT)

   return
   end



# tailbl --- delete trailing blanks from buf

   subroutine tailbl (buf)
   character buf (ARB)
   integer i
   integer length

   i = length (buf)
   if (i > 0 && buf (i) == NEWLINE)
      i -= 1
   for ( ; i > 0 && buf (i) == ' 'c; i -= 1)
      ;

   buf (i + 1) = NEWLINE
   buf (i + 2) = EOS

   return
   end



# width --- compute width of character string

   integer function width (buf)
   character buf (MAXLINE)

   integer i

   width = 0
   for (i = 1; buf (i) ~= EOS; i += 1)
      select
         when (or (buf (i), 8r200) == BACKSPACE)
            width -= 1
         when (or (buf (i), 8r200) >= ' 'c && or (buf (i), 8r200) < DEL)
            width += 1

   return
   end
