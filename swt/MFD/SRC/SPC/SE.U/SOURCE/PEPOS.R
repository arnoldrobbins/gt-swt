# pepos --- position cursor on Perkin-Elmer 550 & 1100 terminals

   subroutine pepos (row, col)
   integer row, col

   include SE_COMMON

   # Get on correct row first
   if (Currow == row)
      ;     # already on correct row; nothing to do
   elif (row == Currow - 1) {
      call t1ou (ESC)
      call t1ou ('A'c)     # cursor up
      Currow -= 1
      }
   elif (row == Currow + 1) {
      call t1ou (ESC)
      call t1ou ('B'c)     # cursor down
      Currow += 1
      }
   else {
      call t1ou (ESC)
      call t1ou ('X'c)       # vertical absolute positioning
      call t1ou (row + ' 'c - 1)
      Currow = row
      }

   # Now, perform horizontal motion
   if (iabs (col - Curcol) > 3) { # do absolute horizontal positioning
      call t1ou (ESC)
      call t1ou ('Y'c)
      call t1ou (col + ' 'c - 1)
      Curcol = col
      }
   else
      call uhcm (col)

   return
   end
