# regentpos --- position cursor on ADDS Regent 100

   subroutine regentpos (row, col)
   integer row, col

   include SE_COMMON

   if (iabs (Curcol - col) > 4 || Currow ~= row) {
      call t1ou (ESC)
      call t1ou ('Y'c)
      call t1ou (' 'c - 1 + row)
      call t1ou (' 'c - 1 + col)
      Currow = row
      Curcol = col
      }
   else {
      while (row < Currow) {
         call t1ou (SUB)            # cursor up
         Currow -= 1
         }
      while (row > Currow ) {
         call t1ou (NEWLINE)
         Currow += 1
         Curcol = 1
         }
      if (col > Curcol)
         while (col ~= Curcol) {
            call t1ou (Screen_image (Curcol, Currow))
            Curcol += 1
            }
      elif ((Curcol - col) * 2 > Ncols)
         while (col ~= Curcol) {
            call t1ou (ACK)        # cursor right
            if (Curcol == Ncols)
               Curcol = 1
            else
               Curcol += 1
            }
      else
         while (col ~= Curcol) {
            call t1ou (BS)
            Curcol -= 1
            }
      }

   return
   end
