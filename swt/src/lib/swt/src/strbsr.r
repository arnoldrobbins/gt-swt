# strbsr --- perform a binary search of a string table

   integer function strbsr (pos, tab, offs, object)
   integer pos (ARB), offs
   character tab (ARB), object (ARB)

   integer i, j, k
   integer strcmp

   i = 2
   j = pos (1) + 1            # length is first entry in position array
   repeat {
      k = (i + j) / 2

      select (strcmp (tab (pos (k) + offs), object))
         when (1) i = k + 1   # LESS
         when (2) return (k)  # EQUALS
         when (3) j = k - 1   # GREATER

      } until (i > j)

   return (EOF)
   end
