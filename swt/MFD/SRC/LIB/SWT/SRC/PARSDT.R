# parsdt --- parse a date in mm/dd/yy format

   integer function parsdt (str, i, month, day, year)
   character str (ARB)
   integer i, month, day, year

   integer j, days (12)
   integer ctoi
   character today (9)

             # Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec #
   data days /  31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 /

   SKIPBL (str, i)
   if (~IS_DIGIT (str (i)))
      return (ERR)
   month = ctoi (str, i)
   if (str (i) == '/'c) {
      i += 1
      day = ctoi (str, i)
      if (str (i) == '/'c) {
         i += 1
         year = ctoi (str, i)
         }
      else {
         call date (SYS_DATE, today)
         j = 7
         year = ctoi (today, j)
         }
      }
   else {
      day = month
      call date (SYS_DATE, today)
      j = 1
      month = ctoi (today, j)
      j = 7
      year = ctoi (today, j)
      }

   if (1 <= month && month <= 12
         && 1 <= day && day <= days (month)
         && 0 <= year && year <= 99)
      parsdt = OK
   else
      parsdt = ERR

   return
   end
