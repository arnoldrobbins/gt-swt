# date --- pick up useful information about the time of day

#  Argument 1 is a switch, to select the data returned.
#     SYS_DATE   => date, in format mm/dd/yy
#     SYS_TIME   => time, in format hh:mm:ss
#     SYS_USERID => login name
#     SYS_PIDSTR => user number
#     SYS_DAY    => day of the week
#     SYS_PID    => numeric user number in str (1)
#     SYS_LDATE  => name of day, name of month, day, and year
#     SYS_MINUTES=> number of minutes past midnight in str (1..2)
#     SYS_SECONDS=> number of seconds past midnight in str (1..2)
#     SYS_MSEC   => number of msec past midnight in str (1..2)

#  Argument 2 is a string to receive data specified by
#     argument 1.

#  Length of string is returned as function value.

   integer function date (item, str)
   integer item
   character str (ARB)

   integer td (28), day, month, year
   integer encode, ptoc, wkday, mapup

   integer snum (2)
   longint lnum
   equivalence (snum, lnum)

   string_table ix, days _
      / "sun"   / "mon"   / "tues"  / "wednes" _
      / "thurs" / "fri"   / "satur"

   string_table iy, months _
      / "January"  / "February"  / "March"     _
      / "April"    / "May"       / "June"      _
      / "July"     / "August"    / "September" _
      / "October"  / "November"  / "December"

   if (item < SYS_DATE || item > SYS_MSEC) {
      str (1) = EOS
      return (0)
      }

   call timdat (td, 12 + MAXPACKEDUSERNAME)

   select (item)

      when (SYS_DATE)      # date, in format mm/dd/yy
         return (encode (str, 9, "*,2p/*,2p/*,2p"s,
                     td (1), td (2), td (3)))

      when (SYS_TIME)      # time, in format hh:mm:ss
         return (encode (str, 9, "*2,,0i:*2,,0i:*2,,0i"s,
            td (4) / 60, mod (td (4), 60), td (5)))

      when (SYS_USERID)    # login name
         return (ptoc (td (13), ' 'c, str, MAXUSERNAME))

      when (SYS_PIDSTR)    # user number
         return (encode (str, 4, "*3,,0i"s, td (12)))

      when (SYS_DAY) {     # day of week
         td (1) = td (1) - '00'
         td (2) = td (2) - '00'
         td (3) = td (3) - '00'
         day = rs (td (2), 8) * 10 + rt (td (2), 8)
         month = rs (td (1), 8) * 10 + rt (td (1), 8)
         year = rs (td (3), 8) * 10 + rt (td (3), 8)
         return (encode (str, 20, "*sday"s,
                  days (ix (wkday (month, day, year) + 1))))
         }

      when (SYS_PID) {     # numeric user number in str (1)
         str (1) = td (12)
         return (0)
         }

      when (SYS_LDATE) {   # name of day, name of month, day, and year
         td (1) = td (1) - '00'
         td (2) = td (2) - '00'
         td (3) = td (3) - '00'
         day = rs (td (2), 8) * 10 + rt (td (2), 8)
         month = rs (td (1), 8) * 10 + rt (td (1), 8)
         year = rs (td (3), 8) * 10 + rt (td (3), 8)
         date = encode (str, 50, "*sday, *s *i, 19*i"s,
            days (ix (wkday (month, day, year) + 1)),
            months (iy (month + 1)), day, year)
         str (1) = mapup (str (1))
         return
         }

      when (SYS_MINUTES) { # minutes past midnight
         lnum = td (4)
         str (1) = snum (1)
         str (2) = snum (2)
         return (0)
         }

      when (SYS_SECONDS) { # seconds past midnight
         lnum = intl (td (4)) * 60 + td (5)
         str (1) = snum (1)
         str (2) = snum (2)
         return (0)
         }

      when (SYS_MSEC)    { # milliseconds past midnight
         lnum = (intl (td (4)) * 60 + td (5)) * 1000 _
                + (td (6) * 1000) / td (11)
         str (1) = snum (1)
         str (2) = snum (2)
         return (0)
         }

   return (0)
   end
