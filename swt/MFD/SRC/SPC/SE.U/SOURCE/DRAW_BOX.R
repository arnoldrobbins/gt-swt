# draw_box --- draw or erase a box at coordinates in command line

   integer function draw_box (lin, i)
   character lin (ARB)
   integer i

   include SE_COMMON

   integer left, right, col, len, junk
   integer ctoi, equal, inject, delete

   pointer index, getind, gettxt

   character text (MAXLINE), kname, ch

   left = ctoi (lin, i)
   if (left <= 0 || left >= MAXLINE - 2) {
      Errcode = EBADCOL
      return (ERR)
      }

   if (lin (i) == ','c) {
      i += 1
      SKIPBL (lin, i)
      right = ctoi (lin, i)
      if (right <= 0 || right >= MAXLINE - 2 || left > right) {
         Errcode = EBADCOL
         return (ERR)
         }
      }
   else
      right = left

   SKIPBL (lin, i)
   if (lin (i) == NEWLINE)
      ch = ' 'c
   else {
      ch = lin (i)
      i += 1
      }

   if (lin (i) ~= NEWLINE) {
      Errcode = EEGARB
      return (ERR)
      }

   if (Line1 <= 0) {
      Errcode = EORANGE
      return (ERR)
      }

   for (Curln = Line1; Curln <= Line2; Curln += 1) {
      index = gettxt (Curln)
      len = Lineleng (index)
      call move$ (Txt, text, len)

      if (text (len - 1) == NEWLINE)
         col = len - 1
      else
         col = len
      while (col <= right) {
         text (col) = ' 'c
         col += 1
         }
      text (col) = NEWLINE
      text (col + 1) = EOS

      if (Curln == Line1 || Curln == Line2)
         for (col = left; col <= right; col += 1)
            text (col) = ch
      else {
         text (left) = ch
         text (right) = ch
         }

      if (equal (text, Txt) == NO) {
         kname = Markname (index)
         if (delete (Curln, Curln, junk) == ERR
          || inject (text) == ERR)
            return (ERR)
         index = getind (Curln)
         Markname (index) = kname
         Buffer_changed = YES
         }

      }  # for

   Curln = Line1        # move to top of box
   if (First_affected > Curln)
      First_affected = Curln
   call adjust_window (Curln, Curln)
   call updscreen

   return (OK)
   end
