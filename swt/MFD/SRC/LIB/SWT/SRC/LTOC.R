# ltoc --- convert double precision integer to decimal string

   integer function ltoc (int, str, size)
   longint int
   integer size
   character str (size)

   longint intval
   integer d, i, j, k

   string digits "0123456789"

   intval = int
   str (1) = EOS
   i = 1
   repeat {                            # generate digits
      i += 1
      d = iabs (mod (intval, 10))
      str (i) = digits (d + 1)
      intval /= 10
      } until (intval == 0 || i >= size)

   if (int < 0 && i < size) {          # then sign
      i += 1
      str (i) = '-'c
      }

   ltoc = i - 1
   for (j = 1; j < i; j += 1) {        # then reverse
      k = str (i)
      str (i) = str (j)
      str (j) = k
      i -= 1
      }

   return
   end
