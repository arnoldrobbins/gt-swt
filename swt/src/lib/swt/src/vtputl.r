# vtputl --- put line into terminal screen buffer

   subroutine vtputl (str, row, col)
   integer row, col
   character str (ARB)

   include SWT_COMMON

   integer length

   call vt$put (str, row, col, length (str))

   return
   end
