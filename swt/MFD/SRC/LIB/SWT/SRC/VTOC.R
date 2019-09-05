# vtoc --- convert varying string to EOS-terminated string

   integer function vtoc (var, str, len)
   integer var (ARB), len
   character str (ARB)

   integer cp, max, i

   cp = CHARS_PER_WORD
   max = var (1) + 1
   if (len < max)
      max = len

   for (i = 1; i < max; i += 1)
      fpchar (var, cp, str (i))

   str (i) = EOS

   return (i - 1)

   end
