# error --- print fatal error message, then die

   subroutine error (buf)
   integer buf (ARB)

   call remark (buf)
   call seterr (1000)

   stop
   end
