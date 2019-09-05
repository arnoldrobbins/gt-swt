# gklarg --- parse a single key-letter argument

   integer function gklarg (args, str)
   integer args (26)
   character str (ARB)

   integer i, k
   integer mapdn

   if (str (1) ~= '-'c)
      return (ERR)

   for (i = 2; str (i) ~= EOS; i += 1) {
      k = mapdn (str (i)) - 'a'c + 1
      if (k < 1 || k > 26 || args (k) < 0)
         return (ERR)
      args (k) = 1
      }

   return (OK)
   end
