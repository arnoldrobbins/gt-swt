# bee2pos --- position cursor to (row, col) on Beehive model 2 terminal

   subroutine bee2pos (row, col)
   integer row, col

   include SE_COMMON

   integer i

   if (Currow > row)
      for (i = Currow; i > row; i -= 1)
         call t1ou (CTRL_R)
   else if (Currow < row)
      for (i = Currow; i < row; i += 1)
         call t1ou (LF)

   Currow = row
   if (col == 1)
      call t1ou (CTRL_M)
   else
      call uhcm (col)

   Curcol = col

   return
   end
