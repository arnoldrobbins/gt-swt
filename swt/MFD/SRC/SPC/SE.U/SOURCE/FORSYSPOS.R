# forsyspos ---  position cursor on Fortune System terminal

   subroutine forsyspos (row, col)
   integer row, col

   include SE_COMMON


   call t1ou (FS)
   call t1ou ('C'c)
   call t1ou (row - 1 + ' 'c)
   call t1ou (col - 1 + ' 'c)
   Currow = row
   Curcol = col

   return
   end
