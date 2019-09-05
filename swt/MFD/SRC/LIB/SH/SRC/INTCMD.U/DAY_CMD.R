# day_cmd --- output day

   subroutine day_cmd

   integer i, day, month, year
   integer getarg, parsdt, wkday
   character arg (10)

   string_table pos, text _
      / "Sun"     / "Mon"     / "Tues"    / "Wednes" _
      / "Thurs"   / "Fri"     / "Satur"   / "day"

   if (getarg (1, arg, 10) == EOF)  # no argument, use default
      call date (SYS_DATE, arg)

   i = 1
   if (parsdt (arg, i, month, day, year) == ERR)
      call error ("Usage: day [ dd | mm/dd | mm/dd/yy ]"s)
   else
      call print (STDOUT, "*s*s*n"s,
            text (pos (wkday (month, day, year) + 1)),
            text (pos (9)))

   stop
   end
