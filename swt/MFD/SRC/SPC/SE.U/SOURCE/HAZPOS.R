# hazpos --- position cursor on Hazeltine 1400 and 1500 series

   subroutine hazpos (row, col)
   integer row, col

   include SE_COMMON

   if (row == Currow && iabs (col - Curcol) < 4) {  # 4 chars for abs pos
      while (Curcol < col) {
         call t1ou (Screen_image (Curcol, Currow))
         Curcol += 1
         }
      while (Curcol > col) {
         call t1ou (BS)
         Curcol -= 1
         }
      }
   else {
      call t1ou (ESC)
      call t1ou (DC1)
      call t1ou (col - 1)
      call t1ou (row - 1)
      Currow = row
      Curcol = col
      }

   return
   end
