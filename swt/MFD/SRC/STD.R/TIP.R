# tip --- check for terminal input pending

   logical flag, chkinp

   if (chkinp (flag))
      call putch ('1'c, STDOUT)
   else
      call putch ('0'c, STDOUT)

   call putch (NEWLINE, STDOUT)
   stop
   end
