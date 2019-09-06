# cal --- print a calendar on standard output

   integer i, month, year, days (12)
   integer ctoi, getarg, is_month, is_year, wkday
   character arg (MAXARG)

   string_table mpos, mtxt,
      / "January"    / "February"   / "March"      / "April" _
      / "May"        / "June"       / "July"       / "August" _
      / "September"  / "October"    / "November"   / "December"

               # Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
   data days   /  31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 /

   define (UNDEFINED,-1)
   define (IS_LEAP_YEAR (year), mod (year, 4) == 0)

   month = UNDEFINED
   year = UNDEFINED

   do i = 1, 2; {
      if (getarg (i, arg, MAXARG) == EOF)
         break
      if (is_year (arg, year) == ERR
            && is_month (arg, month, mpos, mtxt) == ERR)
         call error ("Usage: cal [<month>] [<year>]"s)
      }

   if (year == UNDEFINED) {   # no year specified; use current one
      call date (SYS_DATE, arg)
      i = 7
      year = ctoi (arg, i)
      if (month == UNDEFINED) {  # month unspecified too; use current one
         i = 1
         month = ctoi (arg, i)
         }
      }

   if (IS_LEAP_YEAR (year))
      days (2) = 29
   else
      days (2) = 28

   if (month ~= UNDEFINED)
      call pcal (mtxt (mpos (month + 1)), days (month),
         wkday (month, 1, year), year)
   else
      do month = 1, 12
         call pcal (mtxt (mpos (month + 1)), days (month),
            wkday (month, 1, year), year)

   stop
   end


# pcal --- print calendar for one month

   subroutine pcal (month, days, first, year)
   character month (ARB)
   integer days, first, year

   integer dow, day, line

   call print (STDOUT, "*n  *s*15t *4i*n*n"s, month, year + 1900)
   call print (STDOUT, "Su Mo Tu We Th Fr Sa*n*n"s)
   call print (STDOUT, "*#x"s, (first - 1) * 3)
   for ({line = 0; dow = first; day = 1}; day <= days;
                                             {dow += 1; day += 1}) {
      call print (STDOUT, "*2i"s, day)
      if (dow < 7)
         call putch (' 'c, STDOUT)
      else {
         dow = 0
         call putch (NEWLINE, STDOUT)
         line += 1
         }
      }

   for ( ; line < 6; line += 1)
      call putch (NEWLINE, STDOUT)

   return
   end


# is_year --- see if str is a valid year

   integer function is_year (str, year)
   character str (ARB)
   integer year

   integer i, temp
   integer ctoi

   is_year = ERR
   if (year ~= UNDEFINED)
      return
   i = 1
   temp = ctoi (str, i)
   if (str (i) ~= EOS || temp < 0 || temp >= 2000
         || temp >= 100 && temp < 1900)
      return
   if (temp >= 1900)
      temp -= 1900
   year = temp

   return (OK)
   end


# is_month --- see if str is the name of a month

   integer function is_month (str, month, pos, txt)
   character str (ARB), txt (ARB)
   integer month, pos (ARB)

   integer i
   integer equis
   character mapup

   is_month = ERR
   if (month ~= UNDEFINED)
      return
   call mapstr (str, LOWER)
   str (1) = mapup (str (1))
   do i = 1, 12
      if (equis (str, txt (pos (i + 1))) ~= NO) {
         month = i
         return (OK)
         }

   return
   end


# equis --- determine if s1 is an initial substring of s2

   integer function equis (s1, s2)
   character s1 (ARB), s2 (ARB)

   integer i

   for (i = 1; s1 (i) ~= EOS; i += 1)
      if (s1 (i) ~= s2 (i))
         return (NO)

   return (YES)
   end
