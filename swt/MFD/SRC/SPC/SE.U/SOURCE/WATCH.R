# watch --- keep time displayed on screen for users without watch

   subroutine watch

   character face (10)

   call date (SYS_TIME, face)
   face (6) = EOS             # chop off seconds
   call mesg (face, TIME_MSG)

   return
   end
