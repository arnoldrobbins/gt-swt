# ptoc --- convert packed string to EOS-terminated string

   integer function ptoc (pstr, term, str, len)
   integer pstr (ARB), len
   character term, str (ARB)

   integer cp, i

   cp = 0
   for (i = 1; i < len; i += 1) {
      fpchar (pstr, cp, str (i))
      if (str (i) == ESCAPE)
         fpchar (pstr, cp, str (i))
      elif (str (i) == term)
         break
      }

   str (i) = EOS

   return (i - 1)

   end
