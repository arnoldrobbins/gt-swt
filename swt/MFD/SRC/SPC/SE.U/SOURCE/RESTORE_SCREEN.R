# restore_screen --- screen has been garbaged; fix

   subroutine restore_screen

   include SE_COMMON

   integer row, col

   call clrscreen
   do row = 1, Nrows
      do col = 1, Ncols
         if (Screen_image (col, row) ~= ' 'c) {
         call position_cursor (row, col)
         call send (Screen_image (col, row))
         }

   return
   end
