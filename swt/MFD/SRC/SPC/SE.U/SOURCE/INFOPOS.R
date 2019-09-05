# infopos --- position cursor to (row, col) on Infoton 100 terminal

   subroutine infopos (row, col)
   integer row, col

   include SE_COMMON

   if (Currow ~= row || iabs (col - Curcol) > 5) {
      call t1ou (ESC)
      call t1ou ("f"c)
      call t1ou (" "c + col - 1)
      call t1ou (" "c + row - 1)
      }
   else
      call uhcm (col)

   Curcol = col
   Currow = row

   return
   end
