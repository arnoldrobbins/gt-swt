# gltoc --- convert double precision integer to any radix string

   integer function gltoc (int, str, size, base)
   longint int
   integer size, base
   character str (size)

   longint n
   integer carry, d, i, radix
   bool unsigned
   string digits "0123456789ABCDEF"

   str (1) = EOS  # digit string is generated backwards, then reversed
   if (size <= 1)
      return (0)

   radix = iabs (base)        # get actual conversion radix
   if (radix < 2 || radix > 16)
      radix = 10
   unsigned = (base < 0)      # negative radices mean unsigned conversion
   if (unsigned) {
      n = rs (int, 1)         # make pos. but keep high-order bits intact
      carry = and (int, 1)    # get initial carry
      }
   else
      n = int

   i = 1
   repeat {
      d = iabs (mod (n, radix))  # generate next digit
      if (unsigned) {      # this is only half of actual digit value
         d = 2 * d + carry    # get actual digit value
         if (d >= radix) {    # check for generated carry
            d -= radix
            carry = 1
            }
         else
            carry = 0
         }
      i += 1
      str (i) = digits (d + 1)   # convert to character and store
      n /= radix
      } until (n == 0 || i >= size)

   if (unsigned) {
      if (carry ~= 0 && i < size) {    # check for final carry
         i += 1
         str (i) = '1'c
         }
      }
   elif (int < 0 && i < size) {     # add sign if needed
      i += 1
      str (i) = '-'c
      }

   gltoc = i - 1     # will return length of string

   for (d = 1; d < i; {d += 1; i -= 1}) {     # reverse digits
      carry = str (d)
      str (d) = str (i)
      str (i) = carry
      }

   return
   end
