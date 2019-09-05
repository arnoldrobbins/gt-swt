# remark --- display error message on screen

   subroutine remark (lit)
   integer lit (ARB)

   call litmesg (lit, REMARK_MSG)

   return
   end
