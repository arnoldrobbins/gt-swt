#  gtod --- get today's date.
#
#     gtod determines the day of the week using
#  an algorithm that will be accurate until the
#  year 4000 AD,  and displays it in a readable
#  time and date format.

   define (CENTURY,1900)      # must be changed for the year 2000

   character month_names (10, 12), day_names (10, 7), a_or_pm

   integer times (4)

   longint base_day,base_year, days_per_year, days_per_4_years,
      days_per_100_years, days_per_400_years, day, month, year,
      day_of_week, hours, minutes

   data month_names _
      /"J"c, "a"c, "n"c, "u"c, "a"c, "r"c, "y"c,  EOS,    0,    0,
       "F"c, "e"c, "b"c, "r"c, "u"c, "a"c, "r"c, "y"c,  EOS,    0,
       "M"c, "a"c, "r"c, "c"c, "h"c,  EOS,    0,    0,    0,    0,
       "A"c, "p"c, "r"c, "i"c, "l"c,  EOS,    0,    0,    0,    0,
       "M"c, "a"c, "y"c,  EOS,    0,    0,    0,    0,    0,    0,
       "J"c, "u"c, "n"c, "e"c,  EOS,    0,    0,    0,    0,    0,
       "J"c, "u"c, "l"c, "y"c,  EOS,    0,    0,    0,    0,    0,
       "A"c, "u"c, "g"c, "u"c, "s"c, "t"c,  EOS,    0,    0,    0,
       "S"c, "e"c, "p"c, "t"c, "e"c, "m"c, "b"c, "e"c, "r"c,  EOS,
       "O"c, "c"c, "t"c, "o"c, "b"c, "e"c, "r"c,  EOS,    0,    0,
       "N"c, "o"c, "v"c, "e"c, "m"c, "b"c, "e"c, "r"c,  EOS,    0,
       "D"c, "e"c, "c"c, "e"c, "m"c, "b"c, "e"c, "r"c,  EOS,    0/
   data day_names _
      /"S"c, "u"c, "n"c, "d"c, "a"c, "y"c,  EOS,    0,    0,    0,
       "M"c, "o"c, "n"c, "d"c, "a"c, "y"c,  EOS,    0,    0,    0,
       "T"c, "u"c, "e"c, "s"c, "d"c, "a"c, "y"c,  EOS,    0,    0,
       "W"c, "e"c, "d"c, "n"c, "e"c, "s"c, "d"c, "a"c, "y"c,  EOS,
       "T"c, "h"c, "u"c, "r"c, "s"c, "d"c, "a"c, "y"c,  EOS,    0,
       "F"c, "r"c, "i"c, "d"c, "a"c, "y"c,  EOS,    0,    0,    0,
       "S"c, "a"c, "t"c, "u"c, "r"c, "d"c, "a"c, "y"c,  EOS,    0/

   base_day = 0
   base_year = 1976 - CENTURY
   days_per_year = 365
   days_per_4_years = 4 * days_per_year + 1
   days_per_100_years = 25 * days_per_4_years - 1
   days_per_400_years = 4 * days_per_100_years + 1

   call timdat(times,4)

   times(1) -= '00'
   times(2) -= '00'
   times(3) -= '00'
   times(1) = rs(times(1), 8) * 10 + rt(times(1), 8)
   times(2) = rs(times(2), 8) * 10 + rt(times(2), 8)
   times(3) = rs(times(3), 8) * 10 + rt(times(3), 8)

   hours = times(4) / 60
   minutes = times(4) - hours * 60
   month = times(1)
   day = times(2)
   year = CENTURY + times(3)

   if (hours < 12)
   {
      a_or_pm = "AM"
      if (hours == 0)
         hours = 12
   }
   else
   {
      a_or_pm = "PM"
      if (hours > 12)
         hours -= 12
   }

   if (times(1) < 3)
   {
      times(1) += 9
      times(3) -= base_year + 1
   }
   else
   {
      times(1) -= 3
      times(3) -= base_year
   }

   day_of_week = base_day

   day_of_week = day_of_week + (times(3) / 400) * days_per_400_years
   times(3) %= 400

   day_of_week = day_of_week + (times(3) / 100) * days_per_100_years
   times(3) %= 100

   day_of_week = day_of_week + (times(3) / 4) * days_per_4_years
   times(3) %= 4

   day_of_week = day_of_week + times(3) * days_per_year

   day_of_week = day_of_week + (153 * times(1) + 2) / 5

   day_of_week = mod(day_of_week + times(2), 7) + 1

   call print(STDOUT, "*2l:*2,,0l *,2p, *s, *s *l, *l.*n"s, hours,
      minutes, a_or_pm, day_names(1, day_of_week), month_names(1, month),
      day, year)

   stop
   end
