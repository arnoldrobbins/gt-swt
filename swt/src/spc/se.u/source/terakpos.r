# terakpos --- position cursor to (row, col) on Terak micro

   subroutine terakpos (row, col)
   integer row, col

   include SE_COMMON

   if (Currow ~= row || iabs (col - Curcol) > 3) {
      call t1ou (RS)
      call t1ou (" "c + col - 1)
      call t1ou (" "c + row - 1)
      }
   else
      call uhcm (col)

   Curcol = col
   Currow = row

   return
   end
