# ctod --- convert string to double precision real

   longreal function ctod (str, i)
   character str (ARB)
   integer i

   define (MAXDIG,16)

   integer j, s, pe (28)
   integer gctoi
   longreal v, e, pv (28)
   character dig (MAXDIG)
   bool neg

   data pv  / 1d    1, 1d    2, 1d    4, 1d    8, 1d   16,
              1d   32, 1d   64, 1d  128, 1d  256, 1d  512,
              1d 1024, 1d 2048, 1d 4096, 1d 8192,

              1d   -1, 1d   -2, 1d   -4, 1d   -8, 1d  -16,
              1d  -32, 1d  -64, 1d -128, 1d -256, 1d -512,
              1d-1024, 1d-2048, 1d-4096, 1d-8192 /

   data pe  /       1,       2,       4,       8,      16,
                   32,      64,     128,     256,     512,
                 1024,    2048,    4096,    8192,

                   -1,      -2,      -4,      -8,     -16,
                  -32,     -64,    -128,    -256,    -512,
                -1024,   -2048,   -4096,   -8192 /


   SKIPBL (str, i)      # ignore leading blanks

   neg = (str (i) == '-'c)    # check for sign
   if (str (i) == '+'c || str (i) == '-'c)
      i += 1

   while (str (i) == '0'c)    # ignore high-order zeros
      i += 1

   for (j = 1; j < MAXDIG && IS_DIGIT (str (i)); {j += 1; i += 1})
      dig (j) = str (i)       # collect significant integral digits

   for (s = 0; IS_DIGIT (str (i)); {s += 1; i += 1})
      ;                       # ignore the rest, adjusting scale factor

   if (str (i) == '.'c) {     # check for a fraction
      i += 1
      if (j == 1)    # special case to accurately handle 0.000ddd etc.
         while (str (i) == '0'c) {
            i += 1
            s -= 1
            }
      for (; j < MAXDIG && IS_DIGIT (str (i)); {j += 1; i += 1}) {
         dig (j) = str (i)
         s -= 1      # adjust scale factor
         }
      while (IS_DIGIT (str (i)))    # discard insig. fractional digits
         i += 1
      }

   while (j > 1 && dig (j - 1) == '0'c) {    # truncate trailing zeros
      s += 1   # increment the scale factor (multiply by 10)
      j -= 1   # truncate one trailing zero (divide by 10)
      }

   dig (j) = EOS     # terminate the digit string

   if (str (i) == 'e'c || str (i) == 'E'c) {    # check for exponent
      i += 1
      s += gctoi (str, i, 10)
      }

   v = 0.0           # now convert the mantissa bits
   for (j = 1; dig (j) ~= EOS; j += 1)
      v = v * 10.0 + (dig (j) - '0'c)

   e = 1.0
   select
      when (s > 0)
         for (j = 14; j > 0; j -= 1) {
            if (s >= pe (j)) {
               s -= pe (j)
               e *= pv (j)
               }
            }
      when (s < 0)
         for (j = 28; j > 14; j -= 1) {
            if (s <= pe (j)) {
               s -= pe (j)
               e *= pv (j)
               }
            }
   ifany
      ctod = v * e
   else
      ctod = v

   if (neg)
      ctod = -ctod

   return

   undefine (MAXDIG)

   end
