# addset --- put  c  in  set (j)  if it fits,  increment  j

   integer function addset (c, set, j, maxsiz)
   integer j, maxsiz
   character c, set (maxsiz)

   if (j > maxsiz)
      addset = NO
   else {
      set (j) = c
      j += 1
      addset = YES
      }

   return
   end
