# netpos --- position cursor on Netron terminal

   subroutine netpos (row, col)
   integer row, col

   include SE_COMMON


   call t1ou (ESC)
   call t1ou ('='c)
   call t1ou (row - 1)
   call t1ou (col - 1)
   Currow = row
   Curcol = col

   return
   end
