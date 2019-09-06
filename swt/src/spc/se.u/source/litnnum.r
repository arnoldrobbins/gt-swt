# litnnum --- display literal and number in message area

   subroutine litnnum (lit, num, type)
   integer lit (ARB), num, type

   character str (MAXCOLS)
   integer l
   integer ptoc

   l = ptoc (lit, '.'c, str, MAXCOLS)    # returns length of string
   call itoc (num, str (l + 1), 10)
   call mesg (str, type)

   return
   end
