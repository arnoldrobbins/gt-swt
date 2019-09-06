#  vtdlin --- delete 'cnt' lines at 'row'
#
#  Warning --- This routine knows the format of the screen buffers

   integer function vtdlin (row, cnt)
   integer row, cnt

   include SWT_COMMON

   logical missin
   integer i, j, count
   character blanks (MAXCOLS)

   data blanks / MAXCOLS * ' 'c /


   count = 1
   if (~ missin (cnt))
      count = cnt
   if (row < 1 || row > Maxrow || count < 1)
      return (ERR)
   if (count + row - 1 > Maxrow)
      count = Maxrow - row + 1

   call vtmove (row, 1)
   if (Tc_del_line (1) ~= EOS)
      for (i = 1; i <= count; i += 1) {
         send_str (Tc_del_line)
         call vt$del(Tc_line_delay)
         }
   else {
      for (i = row + count; i <= Maxrow; i += 1) {
         for (j = 1; j <= Last_char (i); j += 1)
            if (Curscr (j, i) ~= Curscr (j, i - count)) {
               call vtmove (i - count, j)
               call vt$out (Curscr (j, i))
               }
         if (Last_char (i - count) > Last_char (i))
            if (Tc_clear_to_eol (1) ~= EOS) {
               call vtmove (i - count, j)
               send_str (Tc_clear_to_eol)
               }
            else
               for (; j <= Last_char (i - count); j += 1)
                  if (Curscr (j, i - count) ~= ' 'c) {
                     call vtmove (i - count, j)
                     call vt$out (' 'c)
                     }
         }

      for (i = Maxrow - count + 1; i <= Maxrow; i += 1)
         if (Tc_clear_to_eol (1) ~= EOS) {
            call vtmove (i, 1)
            send_str (Tc_clear_to_eol)
            }
         else
            for (j = 1; j <= Last_char (i); j += 1)
               if (Curscr (j, i) ~= ' 'c) {
                  call vtmove (i, j)
                  call vt$out (' 'c)
                  }
      }

   for (i = row; i + count <= Maxrow; i += 1) {
      call move$ (Curscr (1, i + count), Curscr (1, i), Maxcol)
      call move$ (Newscr (1, i + count), Newscr (1, i), Maxcol)
      Last_char (i) = Last_char (i + count)
      Col_chg_stop (i) = Col_chg_stop (i + count)
      Col_chg_start (i) = Col_chg_start (i + count)
      }

   for (; i <= Maxrow; i += 1) {
      call move$ (blanks, Curscr (1, i), Maxcol)
      call move$ (blanks, Newscr (1, i), Maxcol)
      Last_char (i) = 0
      Col_chg_stop (i) = 0
      Col_chg_start (i) = MAXCOLS
      }

   if (row < Row_chg_stop)
      Row_chg_stop -= count
   if (row < Row_chg_start)
      Row_chg_start -= count
   if (Row_chg_stop < 0)
      Row_chg_stop = 0
   if (Row_chg_start < 0)
      Row_chg_start = 0

   return (OK)
   end
