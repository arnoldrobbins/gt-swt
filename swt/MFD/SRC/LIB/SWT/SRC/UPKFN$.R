# upkfn$ --- unpack a file name; escape slashes

   integer function upkfn$ (name, len, str, max)
   integer name (ARB), len, max
   character str (ARB)

   integer l, cp
   character c
   character mapdn

   for ({l = 1; cp = 0}; l < max && cp < len; l += 1) {
      fpchar (name, cp, c)
      if (c == ' 'c)
         break
      if (c == '/'c || c == ESCAPE || c == '='c) {
         if (c == '='c)
            str (l) = c
         else
            str (l) = ESCAPE
         l += 1
         if (l >= max)
            break
         }
      str (l) = mapdn (c)
      }
   str (l) = EOS

   return (l - 1)

   end
