# ctoa --- convert from character to address

   longint function ctoa (str, i)
   character str (ARB)
   integer i

   longint fault, ring, seg, word, bit
   longint gctol

   SKIPBL (str, i)
   if (str (i) == 'f'c || str (i) == 'F'c) {
      i += 1
      fault = :20000000000
      }
   else
      fault = 0
   ring = ls (rt (gctol (str, i, 8), 2), 28)
   if (str (i) == '.'c)
      i += 1
   seg = ls (rt (gctol (str, i, 8), 12), 16)
   if (str (i) == '.'c)
      i += 1
   word = rt (gctol (str, i, 8), 16)
   if (str (i) == '.'c)    # skip over bit number if present
      bit = gctol (str, i, 8)

   return (xor (fault, ring, seg, word))

   end
