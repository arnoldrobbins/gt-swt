# t$time --- profiling routine called to obtain current clock readings

   subroutine t$time (reel, cpu, diskio)
   longint reel, cpu, diskio

   integer time (28)

   call timdat (time, 28)        # get various times from system

   reel = intl (time (4)) * 60 * time (11) + _
          intl (time (5)) * time (11) + _
          time (6)
   cpu = intl (time (7)) * time (11) + _
         time (8)
   diskio = intl (time (9)) * time (11) + _
            time (10)

   return
   end
