# trspos --- position cursor on TRS80 Mod 1

   subroutine trspos (row, col)

   integer row, col

   include SE_COMMON

   while (Currow ~= row) {
      if (Currow > row) {
         call t1ou (ESC)
         Currow -= 1
         }
      else {
         call t1ou (SUB)
         Currow += 1
         }
      }

   if (Curcol ~= col) {
      if (col > Curcol)
         while (col > Curcol) {
            call t1ou (EM)
            Curcol += 1
            }
      elif (col < Curcol/2) {
         call t1ou (GS)
         Curcol = 1
         while (Curcol < col) {
            call t1ou (EM)
            Curcol += 1
            }
         }
      else
         while (col < Curcol) {
            call t1ou (CAN)
            Curcol -= 1
            }
      }

   return
   end
