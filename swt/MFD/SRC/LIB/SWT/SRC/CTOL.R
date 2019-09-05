# ctol --- convert decimal string to double precision integer

   longint function ctol (str, i)
   character str (ARB)
   integer i

   SKIPBL (str, i)

   for (ctol = 0; IS_DIGIT (str (i)); i += 1)
      ctol = 10 * ctol + (str (i) - '0'c)

   return
   end
