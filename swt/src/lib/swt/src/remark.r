# remark --- print quoted string on ERROUT

   subroutine remark (msg)
   integer msg (ARB)

   if (and (msg (1), :177400) == 0 || msg (1) == EOS)    # unpacked?
      call putlin (msg, ERROUT)
   else
      call putlit (msg, '.'c, ERROUT)
   call putch (NEWLINE, ERROUT)

   return
   end
