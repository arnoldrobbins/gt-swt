# cof$ --- close files opened by the last user program

   subroutine cof$ (state)
   integer state (MAXFILESTATE)

   include SWT_COMMON

   integer i

   for (i = 1; state (i) ~= ERR; i += 1)
      if (Fd_flags (fd_offset (state (i))) ~= 0)
         call close (state (i))

   for (i += 1; state (i) ~= ERR; i += 1)
      call srch$$ (KCLOS, 0, 0, state (i), 0, Errcod)

   Term_cp = 1
   Term_buf (Term_cp) = EOS

   Term_count = 0

   return
   end
