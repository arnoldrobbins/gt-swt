# vt$err --- display an error message and reset pushback pointer

   subroutine vt$err (msg)
   character msg (ARB)

   include SWT_COMMON

   call vtmsg (msg, CHAR_MSG)
   call vtupd (NO)
   Pb_ptr = 0
   call t1ou (BEL)

   return
   end
