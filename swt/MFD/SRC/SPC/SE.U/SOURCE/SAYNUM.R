# saynum --- display a number in message area

   subroutine saynum (n)
   integer n

   integer itoc
   character s (10)

   call itoc (n, s, 10)
   call mesg (s, REMARK_MSG)

   return
   end
