# prompt --- load str into margin of command line

   subroutine prompt (str)
   character str (ARB)

   include SE_COMMON

   call loadstr (str, Cmdrow, 1, BARCOL - 1)

   return
   end
