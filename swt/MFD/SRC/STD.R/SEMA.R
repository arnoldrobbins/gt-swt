# sema --- manipulate user semaphores

   include PRIMOS_KEYS
   include PRIMOS_ERRD

   include ARGUMENT_DEFS
   ARG_DECL

   integer getarg, gctoi, sem$ts
   file_des open, mapfd

   integer code, semnum, i, count, argnum
   file_des fd, pfd

   character semnam (MAXPATH)

   string usage _
      "Usage: sema -(c | d | n | w | t | o [-i <int>]) (<sema> | <path>)"


   PARSE_COMMAND_LINE ("c<f>d<f>n<f>o<f>w<f>t<f>i<oi>"s, usage)

   i = 0
   if (ARG_PRESENT (c))
      i += 1
   if (ARG_PRESENT (d))
      i += 1
   if (ARG_PRESENT (n))
      i += 1
   if (ARG_PRESENT (o))
      i += 1
   if (ARG_PRESENT (t))
      i += 1
   if (ARG_PRESENT (w))
      i += 1

   if (i ~= 1)
      call error (usage)

   if (ARG_PRESENT (i))
      if (ARG_PRESENT (o))
         count = ARG_VALUE (i)
      else
         call error (usage)
   else
      count = 0

   if (count > 0) {
      call print (ERROUT, "*i: initial value greater than 0*n"s, count)
      call error (""p)
      }

   argnum = 1
   while (getarg (argnum, semnam, MAXPATH) ~= EOF) {

      semnum = 0
      if (semnam (1) == '-'c || IS_DIGIT (semnam (1))) {
         i = 1
         semnum = gctoi (semnam, i, 10)
         }

      if (ARG_PRESENT (c))
         call sem$cl (semnum, code)    # Only works for named semaphores
      if (ARG_PRESENT (d))
         call sem$dr (semnum, code)
      if (ARG_PRESENT (n))
         call sem$nf (semnum, code)
      if (ARG_PRESENT (w))
         call sem$wt (semnum, code)
      if (ARG_PRESENT (t)) {
         i = sem$ts (semnum, code)
         if (code == 0)
            call print (STDOUT, "*i*n"s, i)
         }
      if (ARG_PRESENT (o)) {
         fd = open (semnam, READ)
         if (fd ~= ERR) {
            pfd = mapfd (fd)
            if (pfd ~= ERR)
               call sem$ou (pfd, 1, semnum, count, code)
            else
               code = EFNTF
            }
         else
            code = EFNTF

         call close (fd)
         if (code == 0)
            call print (STDOUT, "*i*n"s, semnum)
         }

      if (code == EFUIU)
         call print (ERROUT, "no available semaphores*n"s)
      elif (code == EBPAR)
         call print (ERROUT, "*s: invalid semaphore name*n"s, semnam)
      elif (code == ESEMO)
         call print (ERROUT, "*s: semaphore overflow*n"s, semnam)
      elif (code == EIREM)
         call print (ERROUT, "*s: on a remote disk*n"s, semnam)
      elif (code == EFNTF)
         call print (ERROUT, "*s: file not found*n"s, semnam)
      elif (code ~= 0)
         call print (ERROUT, "*s: can't open semaphore*n"s, semnam)

      argnum += 1
      }

   stop
   end
