# profile --- print Ratfor execution profile

   include PRIMOS_KEYS

   define(MAXROUTINES,200)

   character prof (MAXLINE), name (MAXLINE), dict (MAXLINE)

   integer numrtn, junk, code, fd, i, dict_fd, time (15)
   longint record (4, MAXROUTINES), real_total,
      cpu_total, diskio_total, ticks
   integer open, mapfd

   call timdat (time, 15)
   ticks = time (11)

   call optarg (prof, dict)   # check for optional arguments
   fd = open (prof, READ)
   if (fd == ERR)
      call cant (prof)

   for (numrtn = 1; numrtn <= MAXROUTINES; numrtn += 1) {
      call prwf$$ (KREAD, mapfd (fd), loc (record (1, numrtn)), 8,
      intl (0), junk, code)
      if (code ~= 0)
         break
      }
   numrtn -= 1
   call close (fd)

   real_total = 0
   cpu_total = 0
   diskio_total = 0
   for (i = 1; i <= numrtn; i += 1) {
      real_total = real_total + record (2, i)
      cpu_total = cpu_total + record (3, i)
      diskio_total = diskio_total + record (4, i)
      }

   dict_fd = open (dict, READ)
   if (dict_fd == ERR)
      call cant (dict)

   call print (STDOUT,
      "  Real            CPU           Disk      Count    Routine*n.")
   call print (STDOUT,
      " Sec  %     Sec  %  ms/call    Sec  %               Name*n.")
   call print (STDOUT,
      "---- ---   ---- --- -------   ---- ---   -------   ----------*n*n.")

   for (i = 1; i <= numrtn; i += 1) {
      call print (STDOUT, "*4l.", record (2, i) / ticks)
      if (real_total ~= 0)
         call print (STDOUT, " *3l.", (100 * record (2, i)) / real_total)
      else
         call print (STDOUT, "   0.")
      call print (STDOUT, "   *4l.", record (3, i) / ticks)
      if (cpu_total ~= 0)
         call print (STDOUT, " *3l.", (100 * record (3, i)) / cpu_total)
      else
         call print (STDOUT, "   0.")
      if (record (1, i) ~= 0)
         call print (STDOUT, " *7l.",
            ((1000 * record (3, i)) / ticks) / record (1, i))
      else
         call print (STDOUT, "       0.")
      call print (STDOUT, "   *4l.", record (4, i) / ticks)
      if (diskio_total ~= 0)
         call print (STDOUT, " *3l.", (100 * record (4, i)) / diskio_total)
      else
         call print (STDOUT, "   0.")
      call print (STDOUT, "   *7l.", record (1, i))
      call getlin (name, dict_fd)
      call print (STDOUT, "   *s.", name)
      }

   call print (STDOUT, "*n*nTotal real: *l   CPU: *l   Disk: *l*n.",
      real_total / ticks, cpu_total / ticks, diskio_total / ticks)

   call close (dict_fd)

   stop
   end


# optarg --- check for optional arguments

   subroutine optarg (prof, dict)
   character prof (MAXLINE), dict (MAXLINE)

   integer i
   integer getarg

   character arg (MAXLINE)

   string default_prof "_profile"
   string default_dict "timer_dictionary"

   call scopy (default_prof, 1, prof, 1)
   call scopy (default_dict, 1, dict, 1)
   for (i = 1; getarg (i, arg, MAXLINE) ~= EOF; i += 1) {
      if (arg (1) == '-'c
       && (arg (2) == 'd'c | arg (2) == 'D'c)) {
         i += 1
         if (getarg (i, dict, MAXARG) == EOF)
            call error ( _
               "Usage: profile [ -d <dictionary> ] [ <profile> ].")
         }
      else
         call scopy (arg, 1, prof, 1)
      }

   return
   end
