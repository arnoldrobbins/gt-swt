# t$exit --- profiling routine called on subprogram exit

   subroutine t$exit

   integer numrtn, sp
   longint stack (4, 1), record (4, 1)
   common /t$prof/ numrtn, record
   common /t$stak/ sp, stack

   longint reel, cpu, diskio
   integer routine, i

   call t$time (reel, cpu, diskio)

   sp -= 1

   reel -= stack (2, sp)
   cpu -= stack (3, sp)
   diskio -= stack (4, sp)

   routine = stack (1, sp)
   record (2, routine) += reel
   record (3, routine) += cpu
   record (4, routine) += diskio
   for (i = sp - 1; i >= 1; i -= 1) {
      stack (2, i) += reel
      stack (3, i) += cpu
      stack (4, i) += diskio
      }

   return
   end
