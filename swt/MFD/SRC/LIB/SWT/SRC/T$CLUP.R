# t$clup --- profiling routine called on program exit

   subroutine t$clup

   integer numrtn, sp
   longint record (4, 1), stack (4, 1)
   common /t$prof/ numrtn, record
   common /t$stak/ sp, stack

   integer i, code, fd
   integer create

   string profile "_profile"

   while (sp > 1)
      call t$exit             # clean up in case exit was not from main

   call at$hom (code)         # attach to home directory

   fd = create (profile, WRITE)
   if (fd == ERR)
      call cant (profile)

   for (i = 1; i <= numrtn; i += 1)
      call writef (record (1, i), 8, fd)

   call close (fd)

   return
   end
