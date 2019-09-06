# gt40pos --- position cursor to (row, col) on DEC GT40 with Waugh software

   subroutine gt40pos (row, col)
   integer row, col

   include SE_COMMON

   if (row ~= Currow && col ~= Curcol) {
      call t1ou (ESC)               # absolute positioning
      call t1ou (row + ' 'c - 1)
      call t1ou (col + ' 'c - 1)
      Currow = row
      Curcol = col
      }
   elif (row ~= Currow) {        # col must = Curcol
      call t1ou (ACK)               # vertical positioning
      call t1ou (row + ' 'c - 1)
      Currow = row
      }
   elif (iabs (col - Curcol) < 2)
      call uhcm (col)
   else {
      call t1ou (NAK)
      call t1ou (col + ' 'c - 1)
      Curcol = col
      }

   return
   end
