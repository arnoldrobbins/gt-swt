# atoc --- convert address to string

   integer function atoc (ptr, xstr, size)
   integer ptr (3), size
   character xstr (ARB)

   integer i
   integer gitoc, ctoc
   character str (18)

   i = 0
   if (ptr (1) < 0) {
      i += 1
      str (i) = 'f'c
      }
   i += 1
   str (i) = and (rs (ptr (1), 13), 3) + '0'c   # insert ring number
   str (i + 1) = '.'c
   i += gitoc (and (ptr (1), 8r7777), str (i + 2), 5, 8) + 1
   str (i + 1) = '.'c
   i += gitoc (ptr (2), str (i + 2), 7, -8) + 1
   if (and (ptr (1), 8r10000) ~= 0) {
      str (i + 1) = '.'c
      i += gitoc (rs (ptr (3), 12), str (i + 2), 3, 8) + 1
      }

   return (ctoc (str, xstr, size))

   end
