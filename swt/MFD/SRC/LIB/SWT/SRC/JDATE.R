# jdate --- take month, day, and year and return day-of-year

   integer function jdate (m, d, y)
   integer m, d, y

   integer i, mdays (12)

   data mdays /31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31/

   jdate = d
   for (i = 1; i < m; i += 1)
      jdate += mdays (i)

   if (m > 2) {
      if (mod (y, 400) == 0)
         jdate += 1
      else if (mod (y, 100) == 0)
         ;
      else if (mod (y, 4) == 0)
         jdate += 1
      }

   return
   end
