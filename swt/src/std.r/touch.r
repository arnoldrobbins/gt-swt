# touch --- change modification time on a file

   include ARGUMENT_DEFS

   integer gfnarg, sfdata, parstm, parsdt

   ARG_DECL
   character path (MAXPATH), temp (MAXLINE)
   integer state (4), curtime (6), attach, i, day ,month, year
   long_int time
   equivalence (curtime (1), year),
               (curtime (2), month),
               (curtime (3), day)

   string usage "Usage: touch [-d <date>] [-t <time>] {<pathname>}"


   PARSE_COMMAND_LINE ("d<rs>t<rs>n<ign>"s, usage)

   call date (SYS_DATE, temp)
   ARG_DEFAULT_STR (d, temp)
   call date (SYS_TIME, temp)
   ARG_DEFAULT_STR (t, temp)

   i = 1
   if (parsdt (ARG_TEXT (d), i, month, day, year) ~= OK)
      call error ("invalid format in date argument"s)

   i = 1
   if (parstm (ARG_TEXT (t), i, time) ~= OK)
      call error ("invalid format in time argument"s)

   curtime (4) = time / 3600
   time -= curtime (4) * intl(3600)
   curtime (5) = time / 60
   curtime (6) = time - curtime (5) * 60


   state (1) = 1
   repeat {
      select (gfnarg (path, state))
         when (EOF)
            break
         when (ERR)
            call error (usage)
      else
         if (sfdata (FILE_TIMMOD, path, curtime, attach, temp) == ERR)
            call print (ERROUT, "*s: can't ""touch""*n"s, path)
      }

   stop
   end
