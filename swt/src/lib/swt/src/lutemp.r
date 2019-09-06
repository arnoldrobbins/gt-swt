# lutemp --- look up a template in the template directory

   integer function lutemp (jig, str, strlen)
   character jig (ARB), str (ARB)
   integer strlen

   include "=incl=/temp_com.r.i"
   include PRIMOS_KEYS
   include SWT_COMMON

   integer h, p, i, l, code
   integer scopy, equal, mod, length
   character tbuf (MAXPATH), dirname(MAXTREE)

   for (i = 1; jig (i) ~= EOS; i += 1)
      tbuf (i) = jig (i)
   tbuf (i) = EOS

   h = 0
   for (i = 1; i <= 4 && jig (i) ~= EOS; i += 1)
      h += tbuf (i)
   h = mod (h, MAXTEMPHASH) + 1

   for (p = Uhashtb (h); p ~= LAMBDA; p = Utempbuf (p))
      if (equal (tbuf, Utempbuf (p + 2)) == YES)
         break

   if (p ~= LAMBDA) {
      l = scopy (Utempbuf, Utempbuf (p + 1), tbuf, 1)
      if (l >= strlen)
         return (EOF)
      return (scopy (tbuf, 1, str, 1))
      }

   for (p = Hashtb (h); p ~= LAMBDA; p = Tempbuf (p))
      if (equal (tbuf, Tempbuf (p + 2)) == YES)
         break

   if (p == LAMBDA)
      return (EOF)

   select (- Tempbuf (p + 1))
      when (TEMP_DATE) {            # date
         call date (SYS_DATE, tbuf)
         tbuf (3) = tbuf (4); tbuf (4) = tbuf (5)
         tbuf (5) = tbuf (7); tbuf (6) = tbuf (8)
         tbuf (7) = EOS
         l = 6
         }
      when (TEMP_TIME) {            # time
         call date (SYS_TIME, tbuf)
         tbuf (3) = tbuf (4); tbuf (4) = tbuf (5)
         tbuf (5) = tbuf (7); tbuf (6) = tbuf (8)
         tbuf (7) = EOS
         l = 6
         }
      when (TEMP_USER) {            # user
         call date (SYS_USERID, tbuf)
         l = length (tbuf)
         while (l > 0 && tbuf (l) == ' 'c)
            l -= 1
         tbuf (l + 1) = EOS
         call mapstr (tbuf, LOWER)
         }
      when (TEMP_PID) {             # pid
         call date (SYS_PIDSTR, tbuf)
         l = length (tbuf)
         }
      when (TEMP_PASSWD) {          # passwd
         l = scopy (Passwd, 1, tbuf, 1)
         }
      when (TEMP_DAY) {             # day
         call date (SYS_DAY, tbuf)
         l = length (tbuf)
         }
      when (TEMP_HOME) {            # home
         call gpath$(KINIA, 0, tbuf, MAXPATH, i, code)
         if (code ~= 0)
            return(EOF)

         call ptoc(tbuf, EOS, dirname, i + 1)
         call mkpa$(dirname, tbuf, NO)
         l = mapstr(tbuf, LOWER)
         }
   else
      l = scopy (Tempbuf, Tempbuf (p + 1), tbuf, 1)

   if (l >= strlen)
      return (EOF)

   return (scopy (tbuf, 1, str, 1))

   end
