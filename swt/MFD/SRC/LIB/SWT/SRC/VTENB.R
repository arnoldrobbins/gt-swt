# vtenb --- enable input on a line

   subroutine vtenb (row, col, len)
   integer row, col, len

   include SWT_COMMON

   if (row > Maxrow || row < 1)
      return
   Input_start (row) = bound (col, 1, Maxcol)
   Input_stop (row) = bound (col + len - 1, 1, Maxcol)

   return
   end
