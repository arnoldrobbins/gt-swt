# cgcoord --- output a decimal coordinate for Chromatics CG

   subroutine cgcoord (i)
   integer i

   integer units, tens, hundreds

   units = mod (i, 10)
   i /= 10
   tens = mod (i, 10)
   i /= 10
   hundreds = mod (i, 10)

   call t1ou (" "c + 16 + hundreds)
   call t1ou (" "c + 16 + tens)
   call t1ou (" "c + 16 + units)

   return
   end
