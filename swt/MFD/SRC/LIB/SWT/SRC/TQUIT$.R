# tquit$ --- routine to interrogate break flag and dump buffer

   logical function tquit$ (flag)
   logical flag

   integer code

   call quit$ (flag)
   if (flag) {
      call tty$rs (:140000, code)
      call t1ou (NEWLINE)
      }
   tquit$ = flag

   return
   end
