# xindex --- invert condition returned by index

   integer function xindex (array, c, allbut, lastto)
   character array (ARB), c
   integer allbut, lastto

   integer index

   if (c == EOS)
      xindex = 0
   elif (allbut == NO)
      xindex = index (array, c)
   elif (index (array, c) > 0)
      xindex = 0
   else
      xindex = lastto + 1

   return
   end
