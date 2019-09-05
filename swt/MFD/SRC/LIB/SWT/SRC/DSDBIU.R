# dsdbiu --- dump contents of block-in-use

   subroutine dsdbiu (b, form)
   pointer b
   character form

   integer Mem (1)
   common /ds$mem/ Mem

   integer l, s, lmax

   call print (ERROUT, "*5i   *i words in use*n.", b, Mem (b + DS_SIZE))

   l = 0
   s = b + Mem (b + DS_SIZE)
   if (form == DIGIT)
      lmax = 5
   else
      lmax = 50

   for (b += DS_OHEAD; b < s; b += 1) {
      if (l == 0)
         call print (ERROUT, "          .")
      if (form == DIGIT)
         call print (ERROUT, " *10i.", Mem (b))
      elif (form == LETTER)
         call print (ERROUT, "*c.", Mem (b))
      l += 1
      if (l >= lmax) {
         l = 0
         call print (ERROUT, "*n.")
         }
      }

   if (l ~= 0)
      call print (ERROUT, "*n.")

   return
   end
