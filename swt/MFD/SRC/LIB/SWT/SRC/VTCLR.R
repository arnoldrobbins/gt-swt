# vtclr --- clear a rectangle on the screen

   subroutine vtclr (srowx, scolx, erowx, ecolx)
   integer srowx, scolx, erowx, ecolx

   include SWT_COMMON

   integer srow, scol, erow, len, i

   character blanks (MAXCOLS)
   data blanks /MAXCOLS * ' 'c/

   srow = max0 (srowx, 1)
   scol = max0 (scolx, 1)
   erow = min0 (erowx, Maxrow)
   len = min0 (ecolx, Maxcol) - scol + 1

   for (i = srow; i <= erow; i += 1)
      call vt$put (blanks, i, scol, len)

   return
   end
