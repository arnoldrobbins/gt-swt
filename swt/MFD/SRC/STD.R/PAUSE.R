# pause --- sleep for specified interval

   define (SECS_PER_DAY,86400)

   integer i, j
   integer ctoi, parstm, equal, equis, getarg
   longint value, now, then
   character arg (MAXARG)

   i = 1
   if (getarg (i, arg, MAXARG) == EOF)
      call usage
   if (equal (arg, "until"s) == YES) {
      i += 1
      j = 1
      if (getarg (i, arg, MAXARG) == EOF || parstm (arg, j, then) == ERR)
         call usage
      call time_of_day (now)
      value = then - now
      if (value < 0)
         value += SECS_PER_DAY
      }
   else {
      if (equal (arg, "for"s) == YES) {
         i += 1
         if (getarg (i, arg, MAXARG) == EOF)
            call usage
         }
      j = 1
      value = intl (ctoi (arg, j))
      if (j == 1)
         call usage
      select
         when (arg (j) ~= EOS)
            ;
         when (getarg (i + 1, arg, MAXARG) ~= EOF) {
            i += 1
            j = 1
            }
         ifany
            select
               when (equis (arg (j), "seconds"s) ~= NO)
                  ;
               when (equis (arg (j), "minutes"s) ~= NO)
                  value *= 60
               when (equis (arg (j), "hours"s) ~= NO)
                  value *= 3600
            else
               call usage
      }

   if (getarg (i + 1, arg, 1) ~= EOF)
      call usage

   call sleep$ (value * intl (1000))

   stop
   end



# usage --- print usage diagnostic and die

   subroutine usage

   call error ("Usage: pause ([for] <value> [<units>] | until <time>)"p)

   end



# time_of_day --- return number of seconds since midnight

   subroutine time_of_day (time)
   longint time

   integer td (5)

   call timdat (td, 5)     # Primos call
   time = intl (td (4)) * 60 + intl (td (5))

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
