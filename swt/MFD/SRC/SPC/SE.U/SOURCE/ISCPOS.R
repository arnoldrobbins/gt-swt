# iscpos --- position cursor for ISC 8001 color terminal

   subroutine iscpos (row, col)
   integer row, col

   include SE_COMMON

   if (row == 1 && col == 1)
      call t1ou (BS)
   else {
      call t1ou (ETX)
      call t1ou (col - 1)
      call t1ou (row - 1)
      }

   Currow = row
   Curcol = col

   return
   end
