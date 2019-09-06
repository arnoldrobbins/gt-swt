# dtoc --- convert double precision real to string

   integer function dtoc (val, out, w, d)
   longreal val
   character out (ARB)
   integer w, d

   define(DEBUG1,#)  # list output and flags
   define(DEBUG2,#)  # list scaling operations
   define(MAX_DIGITS,14)

   longreal v, pv (26), round (MAX_DIGITS)
   integer pe (26), i, e, j, len, no_digits, max_size
   bool neg, small, exp_format, BASIC_format
   character digits (17)
   string dig "0123456789"

   integer itoc

   data pv /            1d    2, 1d    4, 1d    8, 1d   16,
               1d   32, 1d   64, 1d  128, 1d  256, 1d  512,
               1d 1024, 1d 2048, 1d 4096, 1d 8192,

                        1d   -2, 1d   -4, 1d   -8, 1d  -16,
               1d  -32, 1d  -64, 1d -128, 1d -256, 1d -512,
               1d-1024, 1d-2048, 1d-4096, 1d-8192/

   data pe /                  2,       4,       8,      16,
                    32,      64,     128,     256,     512,
                  1024,    2048,    4096,    8192,

                             -2,      -4,      -8,     -16,
                   -32,     -64,    -128,    -256,    -512,
                 -1024,   -2048,   -4096,   -8192/

   data round /                .05d0,
                              .005d0,
                             .0005d0,
                            .00005d0,
                           .000005d0,
                          .0000005d0,
                         .00000005d0,
                        .000000005d0,
                       .0000000005d0,
                      .00000000005d0,
                     .000000000005d0,
                    .0000000000005d0,
                   .00000000000005d0,
                  .000000000000005d0/


DEBUG2 write (1, 1) val; 1 format ("input value ", E25.15)


   ### set flags indicating whether the number is greater or
   ### less that zero, and whether its absolute value is
   ### greater or less than 1

   v = dabs (val)
   neg = (val < 0.0)
   small = (v < 0.1)


   ### scale number to 0.01 <= v < 10.0

   e = -1
   if (small) {      # number is less than 0.1
      for (i = 26; i > 13; i -= 1)
         if (v < pv (i)) {
            v /= pv (i)
            e += pe (i)
DEBUG2      write (1, 2) e, v; 2 format ("scale ", I6, E25.15)
            }
      }
   else {
      for (i = 13; i > 0; i -= 1)
         if (v >= pv (i) / 10.0) {
            v /= pv (i)
            e += pe (i)
DEBUG2      write (1, 3) e, v; 3 format ("scale ", I6, E25.15)
            }
      }


   ### scale number so that 0.1 <= v < 1.0

DEBUG2 write (1, 4) e, v; 4 format ("before last scale ", I6, E25.15)

   if (v >= 1.0) {   # be sure 0.1 <= v < 1.0
      v /= 10.0
      e += 1
      }
   elif (v < 0.1) {
      v *= 10.0
      e -= 1
      }

   if (v == 0.0)       # not likely, but possible
      e = 0

DEBUG2 write (1, 5) e, v; 5 format ("after last scale ", I6, E25.15)


   ### start tally for the maximum size of the number to
   ### determine if an error should be returned.

   if (neg)
      max_size = 1
   else
      max_size = 0


   ### determine exact format for printing

   BASIC_format = (d > MAX_DIGITS)
   if (BASIC_format) {                 # BASIC-like format
      exp_format = (e > 5 | e < -2)
      if (exp_format) {
         no_digits = 6
         max_size = max_size + 1 + 1 +   5   + 1 + 1 +  4
                    #          9   .   99999   e   +   9999
         }
      else {
         no_digits = 6 + min0 (0, e)   # in case e is negative
         max_size = max_size + 1 + 1 +   5
                    #          9   .   99999
         }
      }

   elif (d >= 0) {                     # Fortran 'F' format
      exp_format = (w < 1 + max0 (e, 1) + 1 + d)
      #                 +   eee...        .   ddd...
      if (exp_format) {    # is there too little space?
         no_digits = max0 (1, w - 1 - 1 -   6)
                     #            + 9 .  e+9999
         max_size = max_size + 1 + no_digits + 6
                    #          .    nnnnnn    e+9999
         }
      else {
         no_digits = e + d + 1   #  negative e is OK here
         max_size = max_size + max0 (e, 0) + 1 +   d
                    #            eee...      .   ddd...
         }
      }

   else {  # d < 0                     # Fortran 'E' format
      exp_format = TRUE
      no_digits = min0 (MAX_DIGITS, -d)  # remember, d < 0
      max_size = max_size + 1 + no_digits +  6
                 #          .    ddd...    e+9999
      }


   ### be sure the number of digits is in range

   no_digits = min0 (max0 (1, no_digits), MAX_DIGITS)


   ### round the number at digit (no_digits+ 1)

   v += round (no_digits)


   ### handle the unusual situation of rounding from .999...
   ### up to 1.000...

   if (v >= 1.0) {
      v /= 10.0
      e += 1
      if (~ exp_format) {
         max_size += 1
         no_digits = min0 (MAX_DIGITS, no_digits + 1)
         }
      }


   ### see if the number will fit in 'w' characters

   if (max_size > w) {
      out (1) = '?'c
      out (2) = EOS
      dtoc = 1
DEBUG1 call print (ERROUT, "dtoc:*2i out:*s*n.", dtoc, out)
      return
      }

DEBUG2 write (1, 6) v; 6 format ("after rounding ", E25.15)


   ### extract the first <no_digits> digits

   do i = 1, no_digits; {
      v *= 10.0d0
      j = v    # truncate to integer
      v -= j   # lop off the integral part
      digits (i) = dig (j + 1)
      }


DEBUG1 integer db1
DEBUG1 call print (ERROUT, "w:*2i d:*2i .", w, d)
DEBUG1 call putlit ("small:.", '.'c, ERROUT)
DEBUG1 if (small)
DEBUG1    call putlit ("YES .", '.'c, ERROUT)
DEBUG1 else
DEBUG1    call putlit ("NO  .", '.'c, ERROUT)
DEBUG1 call putlit ("neg:.", '.'c, ERROUT)
DEBUG1 if (neg)
DEBUG1    call putlit ("YES .", '.'c, ERROUT)
DEBUG1 else
DEBUG1    call putlit ("NO  .", '.'c, ERROUT)
DEBUG1 call putlit ("exp_format:.", '.'c, ERROUT)
DEBUG1 if (exp_format)
DEBUG1    call putlit ("YES .", '.'c, ERROUT)
DEBUG1 else
DEBUG1    call putlit ("NO  .", '.'c, ERROUT)
DEBUG1 call print (ERROUT, "e:*6i no_digits:*2i .", e, no_digits)
DEBUG1 call putlit ("digits:.", '.'c, ERROUT)
DEBUG1 for (db1 = 1; db1 <= no_digits; db1 += 1)
DEBUG1    call putch (digits (db1), ERROUT)
DEBUG1 call putch (BLANK, ERROUT)


   ### take digit string and exponent and arrange into
   ### desired format, depending on 'exp_format' and 'BASIC_format'

   len = 1
   if (neg) {
      out (1) = '-'c
      len += 1
      }

   if (exp_format) {             # set up exponential format
      out (len) = digits (1)
      out (len + 1) = '.'c
      len += 2
      for (i = 2; i <= no_digits; i += 1) {
         out (len) = digits (i)
         len += 1
         }
      if (BASIC_format)          # if BASIC, skip trailing zeroes
         while (len > 2) {
            len -= 1
            if (out (len) == '.'c)
               break
            else if (out (len) ~= '0'c) {
               len += 1          # non-digit -- keep it
               break
               }
            }
      out (len) = 'e'c
      len += 1
      if (e < 0) {
         out (len) = '-'c
         len += 1
         e = -e
         }
      len += itoc (e, out (len), w - len)
      }
   elif (e < 0) {    # handle fixed numbers < 1
      ### special case numbers from .5000... to .9999...
      if (d == 0 && e == -1 && digits (1) >= '5'c)
         out (len) = '1'c
      else
         out (len) = '0'c
      out (len + 1) = '.'c
      len += 2
      for (i = 1; i < -e && i <= d; i += 1) {
         out (len) = '0'c
         len += 1
         }
      for (j = 1; j <= no_digits && i <= d; j += 1) {
         out (len) = digits (j)
         len += 1
         i += 1
         }
      if (BASIC_format)             # if BASIC, skip trailing zeroes
         while (len > 2) {
            len -= 1
            if (out (len) == '.'c)
               break
            else if (out (len) ~= '0'c) {
               len += 1             # non-digit -- keep it
               break
               }
            }
      else
         for  (i = 1; i < d + e - no_digits && i <= d; i += 1) {
            out (len) = '0'c
            len += 1
            }
      }
   elif (e >= no_digits) {    # handle numbers >= 1 with dp after figures
      for (i = 1; i <= no_digits; i += 1) {
         out (len) = digits (i)
         len += 1
         }
      for (i = no_digits; i <= e; i += 1) {
         out (len) = '0'c
         len += 1
         }
      if (~ BASIC_format) {         # no trailing dp or zeroes in BASIC
         out (len) = '.'c
         len += 1
         for (i = 1; i <= d; i += 1) {
            out (len) = '0'c
            len += 1
            }
         }
      }
   else {      # handle numbers > 1 with dp inside figures
      e += 1
      for (i = 1; i <= e; i += 1) {
         out (len) = digits (i)
         len += 1
         }
      out (len) = '.'c
      len += 1
      for (j = 1; i <= no_digits && j <= d; j += 1) {
         out (len) = digits (i)
         i += 1
         len += 1
         }
      if (BASIC_format)             # if BASIC, skip trailing zeroes
         while (len > 2) {
            len -= 1
            if (out (len) == '.'c)
               break
            elif (out (len) ~= '0'c) {
               len += 1             # non-digit -- keep it
               break
               }
            }
      else
         for (i = 1; i <= e + d - no_digits && i <= d; i += 1) {
            out (len) = '0'c
            len += 1
            }
      }

   out (len) = EOS
   dtoc = len - 1
DEBUG1 call print (ERROUT, "dtoc:*2i out:*s*n.", dtoc, out)

   return

   undefine (DEBUG1)
   undefine (DEBUG2)
   undefine (MAX_DIGITS)

   end
