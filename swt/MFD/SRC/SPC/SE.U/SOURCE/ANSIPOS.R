# ansipos --- position cursor for terminal with ANSI cursor movement

   subroutine ansipos (row, col)
   integer row, col


   include SE_COMMON

   integer units, tens

   call t1ou (ESC)
   call t1ou ('['c)
   units = mod (row, 10)
   tens = row / 10
   if (tens ~= 0)
      call t1ou (tens + '0'c)
   call t1ou (units + '0'c)
   call t1ou (';'c)
   units = mod (col, 10)
   tens = col / 10
   if (tens ~= 0)
      call t1ou (tens + '0'c)
   call t1ou (units + '0'c)
   call t1ou ('H'c)

   Curcol = col
   Currow = row

   return
   end
