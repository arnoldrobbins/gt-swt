#  cron --- start up commands for people at the right time

include "cron_def.r.i"

   subroutine main

   shortcall mkonu$
   external phant_catch


   call mkonu$("PH_LOGO$"v, loc(phant_catch))

   repeat {
      call dispatch
      call wait
      }

   end



#  wait --- pause until the next dispatch period

   subroutine wait

   integer time, td (5)

   call timdat (td, 5)
   time = (PERIOD * 60) - (mod (td (4), PERIOD) * 60 + td (5))
   call sleep$ (intl (time) * 1000)

   return
   end



#  dispatch --- scan the list and check for any ready programs

   subroutine dispatch

   file_des open
   file_des fd
   integer wkday, getto, decode, length, getlin, ctop, ctoi, sys$$
   integer cmin, chrs, cday, cdate, cmonth, cyear
   integer min (MAXMIN), hrs (MAXHRS), day (MAXDAY)
   integer date (MAXDATE), month (MAXMONTH)
   integer minc, hrsc, dayc, datec, monthc
   character user (MAXUSERNAME), file (MAXPATH), proj(MAXUSERNAME)
   character groups(MAXLINE)
   character puser (MAXPACKEDUSERNAME), pfile (MAXLINE)
   integer ulen, flen, td (4), pwd (3), pid, code, i
   character buf (MAXLINE)

   procedure parse_line forward

   call timdat (td, 4)
   cmonth = td (1) - '00'
   cdate  = td (2) - '00'
   cyear  = td (3) - '00'

   cmonth = rs (cmonth, 8) * 10 + rt (cmonth, 8)
   cdate  = rs (cdate,  8) * 10 + rt (cdate,  8)
   cyear  = rs (cyear,  8) * 10 + rt (cyear,  8)
   cday   = wkday (cmonth, cdate, cyear)

   chrs   = td (4) / 60
   cmin   = mod (td (4), 60)

   fd = open (CRONFILE, READ)
   if (fd == ERR) {
      call print(ERROUT, "can't open *s at *i:*2,,0i*n"s,
                                 CRONFILE, chrs, cmin)
      return
      }

   while (getlin (buf, fd) ~= EOF) {

      if (buf (1) == COMMENT)     # check for comments
         next

      buf (length (buf)) = EOS    # kill newline
      parse_line                  # split up the fields

      for (i = 1; i <= minc; i += 1)
         if (cmin >= min (i) && cmin - min (i) < PERIOD)
            break
      if (minc ~= 0 && i > minc)
         next

      for (i = 1; i <= hrsc; i += 1)
         if (hrs (i) == chrs)
            break
      if (hrsc ~= 0 && i > hrsc)
         next

      for (i = 1; i <= dayc; i += 1)
         if (day (i) == cday)
            break
      if (dayc ~= 0 && i > dayc)
         next

      for (i = 1; i <= datec; i += 1)
         if (date (i) == cdate)
            break
      if (datec ~= 0 && i > datec)
         next

      for (i = 1; i <= monthc; i += 1)
         if (month (i) == cmonth)
            break
      if (monthc ~= 0 && i > monthc)
         next

      call phantom(user, proj, file, groups)
      }

   call close (fd)
   return



#  parse --- parse the input command line into parts

   procedure parse_line {
   local i, j; integer i, j

      i = 1
      SKIPBL (buf, i)

      minc = 0
      if (buf (i) ~= '*'c)
         while (buf (i) >= '0'c && buf (i) <= '9'c) {
            minc += 1
            min (minc) = ctoi (buf, i)
DB          call print (TTY, "min (*i) = *i*n"s, minc, min (minc))
            SKIPBL (buf, i)
            if (buf (i) ~= ','c)
               break
            i += 1
            }
      else {
         i += 1
         SKIPBL (buf, i)
         }

      hrsc = 0
      if (buf (i) ~= '*'c)
         while (buf (i) >= '0'c && buf (i) <= '9'c) {
            hrsc += 1
            hrs (hrsc) = ctoi (buf, i)
DB          call print (TTY, "hrs (*i) = *i*n"s, hrsc, hrs (hrsc))
            SKIPBL (buf, i)
            if (buf (i) ~= ','c)
               break
            i += 1
            }
      else {
         i += 1
         SKIPBL (buf, i)
         }

      dayc = 0
      if (buf (i) ~= '*'c)
         while (buf (i) >= '0'c && buf (i) <= '9'c) {
            dayc += 1
            day (dayc) = ctoi (buf, i)
DB          call print (TTY, "day (*i) = *i*n"s, dayc, day (dayc))
            SKIPBL (buf, i)
            if (buf (i) ~= ','c)
               break
            i += 1
            }
      else {
         i += 1
         SKIPBL (buf, i)
         }

      datec = 0
      if (buf (i) ~= '*'c)
         while (buf (i) >= '0'c && buf (i) <= '9'c) {
            datec += 1
            date (datec) = ctoi (buf, i)
DB          call print (TTY, "date (*i) = *i*n"s, datec, date (datec))
            SKIPBL (buf, i)
            if (buf (i) ~= ','c)
               break
            i += 1
            }
      else {
         i += 1
         SKIPBL (buf, i)
         }

      monthc = 0
      if (buf (i) ~= '*'c)
         while (buf (i) >= '0'c && buf (i) <= '9'c) {
            monthc += 1
            month (monthc) = ctoi (buf, i)
DB          call print (TTY, "month (*i) = *i*n"s, monthc, month (monthc))
            SKIPBL (buf, i)
            if (buf (i) ~= ','c)
               break
            i += 1
            }
      else {
         i += 1
         SKIPBL (buf, i)
         }

      for (j = 1; buf (i) ~= ' 'c && buf (i) ~= EOS && j < MAXUSERNAME; {j += 1; i += 1})
         user (j) = buf (i)

      user (j) = EOS
DB    call print (TTY, "user = *s*n"s, user)

      SKIPBL (buf, i)
      for (j = 1; buf (i) ~= ' 'c && buf (i) ~= EOS && j < MAXUSERNAME; {j += 1; i += 1})
         proj (j) = buf (i)

      proj (j) = EOS
DB    call print (TTY, "proj = *s*n"s, proj)

      SKIPBL (buf, i)
      for (j = 1; buf (i) ~= ' 'c && buf (i) ~= EOS && j < MAXPATH; {j += 1; i += 1})
         file (j) = buf (i)

      file (j) = EOS
DB    call print (TTY, "file = *s*n"s, file)

      SKIPBL (buf, i)
      for (j = 1; buf (i) ~= EOS && j < MAXLINE; {j += 1; i += 1})
         groups(j) = buf (i)

      groups (j) = EOS
DB    call print (TTY, "groups are *s*n"s, groups)
      }

   end


#  phantom --- fire up a process for the requesting user

   subroutine phantom(u, p, f, g)
   character u(ARB), p(ARB), f(ARB), g(ARB)

   integer cnt
   integer sequence
   file_des fd, fd2
   character combuf(MAXLINE)
   character ct(MAXLINE), tree(MAXPATH)

   file_des create, open

   data sequence / 0 /


   fd = open(f, READ)
   if (fd == ERR) {
      call print(ERROUT, "can't open *s*n"s, f)
      return
      }

   for ({cnt = 99; fd2 = ERR}; fd2 == ERR && cnt >= 0; cnt -= 1) {
      call encode(combuf, MAXLINE, CRONTEMP, sequence)
      call expand(combuf, ct, MAXLINE)
      call mktr$(ct, tree)
      sequence += 1

      fd2 = create(ct, WRITE)
      }

   if (fd2 == ERR) {
      call print(ERROUT, "can't create *s*n"s, ct)
      call close(fd)
      return
      }

   call print(fd2, "swt -6*n"s)
   call fcopy(fd, fd2)

   call print(fd2, "stop -*n"s)

   call close(fd);
   call close(fd2);
   call encode(combuf, MAXLINE, "sac *s *s:r -nq"s, tree, u)
   call sys$$(combuf, ERR)

   call print(ERROUT, "*n*s for *s(*s) with *s*n"s, f, u, p, g)
   call encode(combuf, MAXLINE, "sph *s -u *s -p *s -g *s"s, tree, u, p, g)
   call sys$$(combuf, ERR)

   return
   end



#  phant_catch --- catch any phantom signals and ignore them

   subroutine phant_catch(cp)
   longint cp

   integer msg(8), more, code

   call lon$r(loc(msg), 8, more, code)
   return
   end
