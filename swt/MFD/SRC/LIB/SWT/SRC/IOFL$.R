# iofl$ --- initialize open file list

   subroutine iofl$ (state)
   integer state (MAXFILESTATE)

   include SWT_COMMON

   integer fd, sp
   integer junk2, code
   longint junk1

   sp = 1
   do fd = 1, NFILES
      if (Fd_flags (fd_offset (fd)) == 0) {
         state (sp) = fd
         sp += 1
         }
   state (sp) = ERR
   sp += 1

   do fd = 1, 128; {
      call prwf$$ (KRPOS, fd, intl (0), 0, junk1, junk2, code)
      if (code ~= 0 && code ~= EBUNT) {
         state (sp) = fd
         sp += 1
         }
       }
   state (sp) = ERR

   return
   end
