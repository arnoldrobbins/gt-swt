include ARGUMENT_DEFS
include NET_DEFS

   define(NAMESIZE,3)
   define(SETTIME,4)

   define(BUFFSIZE,137)
   define(INFOSIZE,15)

   define(SUCCEEDED,7)
   define(FAILED,8)

   define(REQUEST,1)
   define(MONTH,2)
   define(DATE,3)
   define(YEAR,4)
   define(HOUR,5)
   define(MINUTE,6)

   ARG_DECL

   external cleanup
   integer ctop

   character line(MAXLINE)
   integer vcstat(2), buff(BUFFSIZE), info(INFOSIZE)

   integer size, vcid, i, j, k
   longint temp

   string usage "Usage: setime [-d mmddyy] [-t hhmm]"

   string_table month_index, month_value,
      /  31, "January" _
      /  28, "February" _
      /  31, "March" _
      /  30, "April" _
      /  31, "May" _
      /  30, "June" _
      /  31, "July" _
      /  31, "August" _
      /  30, "September" _
      /  31, "October" _
      /  30, "November" _
      /  31, "December"

   PARSE_COMMAND_LINE("d<rs>t<rs>"s, usage)

   buff(REQUEST) = SETTIME

   if (ARG_PRESENT(d))
   {
      i = 1
      if (ctop(ARG_TEXT(d), i, buff(MONTH), 3) ~= 6)
         call error(usage)

      i = buff(MONTH) - "00"
      j = buff(DATE) - "00"
      k = buff(YEAR) - "00"
      i = rs(i, 8) * 10 + rt(i, 8)
      j = rs(j, 8) * 10 + rt(j, 8)
      k = rs(k, 8) * 10 + rt(k, 8)

      if (j < 1)
         call error("The first day of the month must be at least 1"p)

      if (mod(k, 4) == 0 && (mod(k, 100) ~= 0 || mod(k, 400) == 0))
         if (i == 2)
         {
            j -= 1
            k = 1
         }
         else
            k = 0
      else
         k = 0

      if (i >= 1 && i <= month_index(1))
      {
         i = month_index(1 + i)

         if (j > month_value(i))
         {
            call print(ERROUT, "*s has only *i days*n"s,
               month_value(i + 1), month_value(i) + k)

            stop
         }
      }
      else
      {
         call print(ERROUT, "The month must be between 1 and *i (inclusive)*n"s,
            month_index(1))

         stop
      }
   }
   else
      if (~ARG_PRESENT(t))
         call error(usage)

   if (ARG_PRESENT(t))
   {
      i = 1
      if (ctop(ARG_TEXT(t), i, buff(HOUR), 2) ~= 4)
         call error(usage)

      i = buff(HOUR) - "00"
      j = buff(MINUTE) - "00"
      i = rs(i, 8) * 10 + rt(i, 8)
      j = rs(j, 8) * 10 + rt(j, 8)

      if (i < 0 || i > 23)
         call error("The hour must be between 0 and 23 (inclusive)"p)

      if (j < 0 || j > 59)
         call error("The minute must be between 0 and 59 (inclusive)"p)
   }

   call ring$c(vcid, vcstat, line)

   if (line(1) == EOS)
      call mkon$f("CLEANUP$", 8, cleanup)
   else
      call error(line)

   if (~ARG_PRESENT(d))
   {
      call timdat(info, INFOSIZE)

      i = MONTH
      do j = 1, 3
      {
         buff(i) = info(j)
         i += 1
      }
   }

   if (~ARG_PRESENT(t))
   {
      call timdat(info, INFOSIZE)

      temp = mod(intl(info(4)) * intl(60) + intl(info(5)), intl(60))
      call sleep$((intl(60) - temp) * intl(1000))

      call timdat(info, INFOSIZE)

      call encode(line, MAXLINE, "*2,,0i*2,,0i"s,
         info(4) / 60, mod(info(4), 60))

      i = 1
      call ctop(line, i, buff(HOUR), 2)
   }

   size = MINUTE

   call ring$t(vcid, vcstat, buff, size, line)

   if (line(1) == EOS)
   {
      i = 2
      j = size - NAMESIZE - 1

      while (i < j)
      {
         select (buff(i + NAMESIZE))
            when (SUCCEEDED)
               call print(STDOUT, "The time has been reset on system *,#h*n"s,
                  2 * NAMESIZE, buff(i))

            when (FAILED)
               call print(STDOUT, "Setime request failed on system *,#h*n"s,
                  2 * NAMESIZE, buff(i))

         i += NAMESIZE + 2
      }
   }
   else
      call error(line)

   stop
   end


   subroutine cleanup(cp)

   longint cp

   call x$clra

   return
   end
