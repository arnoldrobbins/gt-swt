# nbypos --- position cursor to (row, col) on NEWBURY terminals

   subroutine nbypos (row, col)
   integer row, col

   include SE_COMMON

   if (col <= 3 && row == Currow + 1) {
      Currow += 1
      Curcol = 1
      call t1ou (NEWLINE)
      }

   if (Currow ~= row || iabs (col - Curcol) > 3) {
      call t1ou (SYN)
      call t1ou (' 'c + col - 1)
      call t1ou (' 'c + row - 1)
      }
   else
      call uhcm (col)

   Curcol = col
   Currow = row

   return
   end
