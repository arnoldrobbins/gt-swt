# strlsr --- perform a linear search of a string table

   integer function strlsr (pos, tab, offs, object)
   integer pos (ARB), offs
   character tab (ARB), object (ARB)

   integer i, j
   integer strcmp

   j = pos (1) + 1            # length is first entry in position array
   for (i = 2; i <= j; i += 1)
      if (strcmp (object, tab (pos (i) + offs)) == 2)
         return (i)

   return (EOF)
   end
