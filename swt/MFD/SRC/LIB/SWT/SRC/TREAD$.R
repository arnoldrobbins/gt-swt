# tread$ --- read raw words from terminal

   integer function tread$ (buf, nw, f)
   integer buf (ARB), nw, f

   include SWT_COMMON

   integer i


   for (i = 0; i < nw; i += 1) {
      call c1in (buf (i + 1))
      if (buf (i + 1) == NEWLINE || buf (i + 1) == ETX) {
         i += 1
         break
         }
      }

   return (i)
   end
