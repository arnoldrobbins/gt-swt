# ibmpos --- position cursor on IBM 3101 terminal

   subroutine ibmpos (row, col)
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
      call t1ou ('Y'c)
      call t1ou (' 'c - 1 + row)
      call t1ou (' 'c - 1 + col)
      Currow = row
      Curcol = col
      }

   return
   end
