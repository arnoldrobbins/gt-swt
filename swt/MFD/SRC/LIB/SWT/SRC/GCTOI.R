# gctoi --- convert any radix string to single precision integer

   integer function gctoi (str, i, radix)
   character str (ARB)
   integer i, radix

   integer base, v, d, j
   integer index
   character mapdn
   bool neg

   string digits "0123456789abcdef"

   v = 0
   base = radix

   SKIPBL (str, i)

   neg = (str (i) == '-'c)
   if (str (i) == '+'c || str (i) == '-'c)
      i += 1

   if (str (i + 2) == 'r'c && str (i) == '1'c && IS_DIGIT (str (i + 1))
         || str (i + 1) == 'r'c && IS_DIGIT (str (i))) {
      base = str (i) - '0'c
      j = i
      if (str (i + 1) ~= 'r'c) {
         j += 1
         base = base * 10 + (str (j) - '0'c)
         }
      if (base < 2 || base > 16)
         base = radix
      else
         i = j + 2
      }

   for (; str (i) ~= EOS; i += 1) {
      if (IS_DIGIT (str (i)))
         d = str (i) - '0'c
      else
         d = index (digits, mapdn (str (i))) - 1
      if (d < 0 || d >= base)
         break
      v = v * base + d
      }

   if (neg)
      return (-v)
   else
      return (+v)

   end
