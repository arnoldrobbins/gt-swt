# dodash --- expand array (i-1) - array (i+1) into set (j)... from valid

   subroutine dodash (valid, array, i, set, j, maxset)
   integer i, j, maxset
   character array (ARB), set (maxset), valid (ARB)

   character esc
   integer addset, index
   integer junk, k, limit

   i += 1
   j -= 1
   limit = index (valid, esc (array, i))
   for (k = index (valid, set (j)); k <= limit; k += 1)
      junk = addset (valid (k), set, j, maxset)

   return
   end
