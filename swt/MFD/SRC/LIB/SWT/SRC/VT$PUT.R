# vt$put --- copy string into terminal buffer

   subroutine vt$put (str, row, col, clen)
   integer row, col, clen
   character str (ARB)

   include SWT_COMMON

   integer i, len
   character c

   len = clen

DEBUG call print (ERROUT, "In vt$put('*,#s', *i, *i, *i)*n"s,
DEBUG    clen, str, row, col, clen)

   if (row > Maxrow || row < 1 || col < 1) {
      Pad_row = 1
      Pad_col = Maxcol
      Pad_len = 0
      return
      }

   # check for running off visible screen boundary
   if (col + len - 1 > Maxcol)
      len = Maxcol - col + 1

   # update change boundaries
   if (row < Row_chg_start)
      Row_chg_start = row
   if (row > Row_chg_stop)
      Row_chg_stop = row
   if (col < Col_chg_start (row))
      Col_chg_start (row) = col
   if (col + len - 1 > Col_chg_stop (row))
      Col_chg_stop (row) = col + len - 1

   if (col + len - 1 < Last_char (row))   ### Subsequent code uses
      for (i = len - 1; i >= 0; i -= 1)   ### zero based array addressing
         vt$pk (str (i + 1), Newscr, row, col + i)
   else {
      for (i = len - 1; i >= 0 && str (i + 1) == ' 'c; i -= 1)
         vt$pk (' 'c, Newscr, row, col + i)
      if (i >= 0) {                       # some characters in the string
         Last_char (row) = col + i
         for (; i >= 0; i -= 1)
            vt$pk (str (i + 1), Newscr, row, col + i)
         }
      else {                              # the string is empty
         for (i = col; i > 0; i -= 1) {
            vt$upk (c, Newscr, row, i)
            if (c ~= ' 'c)
               break
            }
         Last_char (row) = i
         }
      }

   Pad_row = row
   Pad_col = col + len
   Pad_len = len

   return
   end
