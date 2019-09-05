# load --- load a character onto the screen at given coordinates

   subroutine load (char, row, col)
   character char
   integer row, col

   include SE_COMMON

   character ch

   ch = char
   if (ch < ' 'c || ch >= DEL)
      ch = Unprintable

   if (row >= 1 && row <= Nrows && col >= 1 && col <= Ncols
         && Screen_image (col, row) ~= ch) {
      call position_cursor (row, col)
      Screen_image (col, row) = ch
      call send (ch)
      }

   return
   end
