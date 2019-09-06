# vtpad --- pad the rest of a field with blanks

   subroutine vtpad (len)
   integer len

   include SWT_COMMON

   integer i
   character blanks (MAXCOLS)
   data blanks / MAXCOLS * ' 'c /

   i = min0 (80, Pad_col - Pad_len + len - 1)

   if (Pad_row < Row_chg_start)
      Row_chg_start = Pad_row
   if (Pad_row > Row_chg_stop)
      Row_chg_stop = Pad_row
   if (Pad_col < Col_chg_start (Pad_row))
      Col_chg_start (Pad_row) = Pad_col
   if (i > Col_chg_stop (Pad_row))
      Col_chg_stop (Pad_row) = i

   call vt$put (blanks, Pad_row, Pad_col, i - Pad_col + 1)

   return
   end
