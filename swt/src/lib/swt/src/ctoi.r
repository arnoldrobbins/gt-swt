# ctoi --- convert decimal string to single precision integer

   integer function ctoi (str, i)
   character str (ARB)
   integer i

   SKIPBL (str, i)

   for (ctoi = 0; IS_DIGIT (str (i)); i += 1)
      ctoi = 10 * ctoi + (str (i) - '0'c)

   return
   end
