# twrit$ --- write raw words to terminal

   integer function twrit$ (buf, nw, f)
   integer buf (ARB), nw, f

   include SWT_COMMON

   integer i

   for (i = 0; i < nw; i += 1)
      call t1ou (buf (i + 1))

   return (i)
   end
