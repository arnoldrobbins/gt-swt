# findf$ --- does file exist in current directory

   integer function findf$ (file)
   integer file (16)

   integer junk, rc

   call srch$$ (KEXST, file, 32, 16, junk, rc)
   if (rc == EFNTF)
      findf$ = NO
   else
      findf$ = YES

   return
   end
