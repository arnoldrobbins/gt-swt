# vtstop --- restore the user's terminal before quitting

   subroutine vtstop

   include SWT_COMMON

   call vtmove (Maxrow, 1)
   call duplx$ (Duplex)

   return
   end
