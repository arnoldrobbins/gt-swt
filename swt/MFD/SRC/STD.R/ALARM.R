# alarm --- sleep for specified interval, display clock, then beep

   define (SECS_PER_DAY,86400)

   integer i, j, clock
   integer ctoi, parstm, equal, equis, getarg

   longint value, now, then
   longint time_of_day, curtime, goal
   integer hrs, min, sec

   character arg (MAXARG)

   i = 1
   if (getarg (i, arg, MAXARG) == EOF)
      value = 0
   else if (equal (arg, "at"s) == YES) {
      i += 1
      j = 1
      if (getarg (i, arg, MAXARG) == EOF || parstm (arg, j, then) == ERR)
         call usage
      now = time_of_day (now)
      value = then - now
      if (value < 0)
         value += SECS_PER_DAY
      }
   else {
      if (equal (arg, "in"s) == YES) {
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

   call break$ (DISABLE)               # disable break key

   curtime = time_of_day (value)
   goal = curtime + value
   if (goal >= SECS_PER_DAY)
      goal -= SECS_PER_DAY

   hrs = goal / 3600
   min = mod ((goal / 60), 60)
   sec = goal - hrs * 3600 - min * 60

   call print (ERROUT, "Alarm set for *2,,0i:*2,,0i:*2,,0i*n"s,
         hrs, min, sec)
   call print (ERROUT, " Current time "s)

   call clock (value)

   call break$ (ENABLE)
   stop
   end



# usage --- print usage diagnostic and die

   subroutine usage

   call error ("Usage: alarm ([in] <value> [<units>] | at <time>).")
   end



# time_of_day --- return number of seconds since midnight

   longint function time_of_day (time)
   longint time

   integer td (5)

   call timdat (td, 5)     # Primos call

   return (intl (td (4)) * intl (60) + intl (td (5)))
   end



# clock --- running time-of-day clock

   subroutine clock (seconds)
   longint seconds

   logical flag
   logical tquit$
   character time (9), prev
   character backup (9)
   integer check, alarm
   longint goal, curtime, time_of_day
   data backup / 8 * BS, EOS /

   prev = ' 'c                         # not a digit
   check = YES
   alarm = NO

   curtime = time_of_day (time)
   goal = curtime + seconds
   if (goal > SECS_PER_DAY) {          # if wraparound, set flag
      goal -= SECS_PER_DAY             # for no checking until after
      check = NO                       # time wraps around midnight
      }

   repeat {
      repeat {
         call date (SYS_TIME, time)
         if (time (8) ~= prev)         # seconds' ones position
            break
         call sleep$ (intl (100))      # minimal interval
         }
      prev = time (8)
      call putlin (time, ERROUT)
      if (alarm == YES)
         call t1ou (BELL)
      if (tquit$ (flag))
         break
      if (alarm == NO) {
         curtime = time_of_day (time)
         if (check == NO && curtime < goal)  # to handle wrap around
            check = YES
         if (check == YES && curtime >= goal)
            alarm = YES
         }
      call sleep$ (intl (900))         # milliseconds
      call putlin (backup, ERROUT)
      }

   call t1ou (NEWLINE)

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
