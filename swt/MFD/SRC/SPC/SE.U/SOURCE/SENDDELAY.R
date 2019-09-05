# senddelay --- send a delay of at least n milliseconds

   subroutine senddelay (n)
   integer n

   include SE_COMMON

   integer n1
   integer nulls (5)
   data nulls /5 * 0/

   n1 = intl (n) * Tspeed / 10000
   while (n1 > 10) {
      call tnoua (nulls, 10)
      n1 -= 10
      }

   if (n1 > 0)
      call tnoua (nulls, n1)

   return
   end
