# t$entr --- profiling routine called on subprogram entry

   subroutine t$entr (routine)
   integer routine

   integer numrtn, sp
   longint stack (4, 1), record (4, 1)
   common /t$prof/ numrtn, record
   common /t$stak/ sp, stack

   integer i, j
   longint cpu, diskio, reel

   if (routine == 1) {        # initializing; entering main program
      for (i = 1; i <= numrtn; i += 1)
         for (j = 1; j <= 4; j += 1)
            record (j, i) = 0
      sp = 1
      }

   if (sp > numrtn) {
      call tnou ('Stack overflow in profiler (t$entr)', 35)
      call swt
      }

   call t$time (reel, cpu, diskio)

   stack (1, sp) = routine       # routine number
   stack (2, sp) = reel          # real time clock
   stack (3, sp) = cpu           # CPU time accumulator
   stack (4, sp) = diskio        # diskio time accumulator

   record (1, routine) += 1   # number of calls

   sp += 1

   return
   end
