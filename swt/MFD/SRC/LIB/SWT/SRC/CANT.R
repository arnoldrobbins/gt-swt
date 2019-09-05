# cant --- print cant open file message

   subroutine cant (str)
   character str (ARB)

   call putlin (str, ERROUT)
   call error (": can't open.")

   return
   end
