# parstm --- convert time-of-day to number of seconds since midnight

   integer function parstm (str, i, val)
   character str (ARB)
   integer i
   longint val

   define (TWELVE_HOURS,43200)

   integer ctoi
   character mapdn

   SKIPBL (str, i)
   if (~IS_DIGIT (str (i)))
      return (ERR)

   val = ctoi (str, i)                    # get hours
   if (str (i) == ':'c)
      i += 1
   val = val * intl (60) + ctoi (str, i)  # get minutes, if present
   if (str (i) == ':'c)
      i += 1
   val = val * intl (60) + ctoi (str, i)  # get seconds, if present

   if (val >= TWELVE_HOURS * 2)     # only so many seconds in a day
      return (ERR)

   SKIPBL (str, i)
   select (mapdn (str (i)))
      when ('p'c)
         if (val < TWELVE_HOURS)    # if it's AM, add 12 hours
            val += TWELVE_HOURS
      when ('a'c)
         if (val >= TWELVE_HOURS)   # if it's PM, subtract 12 hours
            val -= TWELVE_HOURS
      ifany {
         i += 1
         if (mapdn (str (i)) == 'm'c)
            i += 1
         }

   return (OK)

   undefine (TWELVE_HOURS)

   end
