# addspos --- position cursor to (row, col) on ADDS Consul 980

   subroutine addspos (row, col)
   integer row, col

   include SE_COMMON

   integer ntabs, where

   if (Currow ~= row || col < Curcol - 7) {
      call t1ou (VT)
      call t1ou ('@'c - 1 + row)
      Currow = row
      Curcol = 1
      }

   if (col > Curcol + 2) {
      ntabs = (col + 1) div 5       # from beginning
      where = ntabs * 5 + 1
      ntabs -= (Curcol - 1) div 5   # from Curcol
      if (ntabs + iabs (where - col) <= 4) {
         for (; ntabs > 0; ntabs -= 1)
            call t1ou (HT)
         Curcol = where
         }
      }

   if (col > Curcol + 4) {
      where = col - Curcol
      call t1ou (ESC)
      call t1ou (ENQ)
      call t1ou ('0'c + (where div 10))
      call t1ou ('0'c + mod (where, 10))
      Curcol = col
      }

   while (Curcol < col) {
      call t1ou (Screen_image (Curcol, Currow))
      Curcol += 1
      }

   while (Curcol > col) {
      call t1ou (BS)
      Curcol -= 1
      }

   return
   end
