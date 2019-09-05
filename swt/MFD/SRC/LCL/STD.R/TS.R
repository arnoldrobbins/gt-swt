# ts --- time sheet maintenance program

define(TIMESIZE,6)
define(DATESIZE,6)

   character arg1 (MAXLINE)

   integer getarg, equal

   if (getarg (1, arg1, MAXLINE) == EOF)
      call print_ts
   elif (equal (arg1, "in"s) == YES || equal (arg1, "out"s) == YES)
      call punch (arg1)
   elif (equal (arg1, "-p"s) == YES)
      call print_ts
   else
      call remark ("Usage: ts [in|out|-p] [hh:mm [mm/dd]]"p)

   stop
   end



# punch --- punch the user's time card at the specified time (default: now)

   subroutine punch (inout)
   character inout (ARB)

   character tim (TIMESIZE), dat (DATESIZE)

   integer tsf

   call open_tsfile (tsf)
   call get_time (tim, dat)
   call wind (tsf)
   call print (tsf, "*s *s *s*n"p, dat, tim, inout)
   call close (tsf)

   return
   end



# open_tsfile --- open user's time sheet file for READWRITE

   subroutine open_tsfile (fd)
   integer fd

   integer open

   fd = open ("=varsdir=/.ts"s, READWRITE)
   if (fd == ERR)
      call error ("can't open time sheet file"p)

   return
   end



# get_time --- get time (specified or default) for clocking in or out

   subroutine get_time (tim, dat)
   character tim (TIMESIZE), dat (DATESIZE)

   character arg (MAXLINE)

   integer hour, minute, i
   integer getarg, ctoi

   if (getarg (2, arg, MAXLINE) == EOF)
      call date (SYS_TIME, arg)
   arg (6) = EOS
   call scopy (arg, 1, tim, 1)

   if (getarg (3, arg, MAXLINE) == EOF)
      call date (SYS_DATE, arg)
   arg (6) = EOS
   call scopy (arg, 1, dat, 1)

   # adjust time to nearest quarter-hour. ignore pathological cases
   i = 1
   hour = ctoi (tim, i)
   i = 4
   minute = ctoi (tim, i)

   if (minute >= 53)
      hour = hour + 1
   minute = 15 * (mod (minute + 7, 60) / 15)

   call encode (tim (1), 3, "*2,,0i"s, hour)
   call encode (tim (4), 3, "*2,,0i"s, minute)
   tim (3) = ':'c
   tim (6) = EOS

   return
   end



# print_ts --- print out a semi-readable timesheet

   subroutine print_ts

   character dat (9)    # mm/dd/yy
   character line (MAXLINE)

   integer dow, mlen (12), i, month, day, year, cur_month, cur_year,
      cur_day, tsf, read_month, read_day, entries
   integer get_dow, ctoi, getlin

   real m_total, w_total, p_start, p_total, d_total
   data mlen /31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31/

   call open_tsfile (tsf)

   call date (SYS_DATE, dat)
   i = 1
   month = ctoi (dat, i)
   i = 4
   day = ctoi (dat, i)
   i = 7
   year = ctoi (dat, i)

   if (mod (year, 4) == 0)
      mlen (2) = 29

   cur_year = year
   cur_month = month - 1
   if (cur_month < 1) {
      cur_month = 12
      cur_year -= 1
      }
   cur_day = 18      # pay periods start on the 18th (usually...)
   dow = get_dow (cur_month, cur_day, cur_year)

   m_total = 0
   w_total = 0

   if (getlin (line, tsf) == EOF) {
      call remark ("monthly total = 0 hours*n"p)
      call close (tsf)
      return
      }

   i = 1
   read_month = ctoi (line, i)
   i = 4
   read_day = ctoi (line, i)

   repeat {       # for each day from 18th the last to today
      d_total = 0
      entries = 0
      call print (STDOUT, "*2i/*2i   "p, cur_month, cur_day)
      while (read_month == cur_month && read_day == cur_day) {
         if (line (13) == 'i'c) {
            i = 7
            p_start = ctoi (line, i)
            i = 10
            p_start = p_start + float (ctoi (line, i)) / 60.0
            line (12) = EOS
            call print (STDOUT, "   *s"p, line (7))
            }
         else {   # punched out
            i = 7
            p_total = ctoi (line, i)
            i = 10
            p_total = p_total + float (ctoi (line, i)) / 60.0 - p_start
            d_total = d_total + p_total
            w_total = w_total + p_total
            m_total = m_total + p_total
            line (12) = EOS
            call print (STDOUT, " *s"p, line (7))
            entries += 1
            }
         if (getlin (line, tsf) == EOF)
            break 2        # end of timesheet; print monthly total
         i = 1
         read_month = ctoi (line, i)
         i = 4
         read_day = ctoi (line, i)
         }
      for (; entries <= 3; entries += 1)
         call print (STDOUT, "              "p)
      call print (STDOUT, "      *i.*i*n"p, int (d_total),
         int (100 * (d_total - int (d_total))))
      cur_day = mod (cur_day, mlen (cur_month)) + 1
      if (cur_day == 1)
         cur_month = mod (cur_month, 12) + 1
      dow = mod (dow, 7) + 1
      if (dow == 7) {   # Saturday? if so, print weekly total
         call print (STDOUT, "*nWeekly total: *i.*i*n*n"p,
            int (w_total), int (100 * (w_total - int (w_total))))
         w_total = 0
         }
      } until (cur_day == day && cur_month == month)

   if (w_total ~= 0)
      call print (STDOUT, "*nWeekly total: *i.*i*n*n"p,
         int (w_total), int (100 * (w_total - int (w_total))))
   call print (STDOUT, "*n*n*nMonthly total: *i.*i*n"p,
      int (m_total), int (100 * (m_total - int (m_total))))

   call close (tsf)
   return
   end



# get_dow --- get day-of-week corresponding to month,day,year

   integer function get_dow (month, day, year)
   integer month, day, year

   integer lmonth, lday, lyear

   lmonth = month - 2
   lday = day
   lyear = year

   if (lmonth <= 0) {
      lmonth += 12
      lyear -= 1
      }

   get_dow = mod (lday + (26 * lmonth - 2) / 10 + lyear + lyear / 4 - 34,
       7) + 1

   return
   end
