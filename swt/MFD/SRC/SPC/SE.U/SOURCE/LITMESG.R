# litmesg --- display literal message

   subroutine litmesg (lit, type)
   integer lit (ARB), type

   character msg (MAXCOLS)

   call ptoc (lit, '.'c, msg, MAXCOLS)
   call mesg (msg, type)

   return
   end
