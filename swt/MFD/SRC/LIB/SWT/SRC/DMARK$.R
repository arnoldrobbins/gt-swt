# dmark$ --- return the position of a disk file

   file_mark function dmark$ (f)
   file_des f

   include SWT_COMMON

   integer junk

   call prwf$$ (KRPOS, Fd_unit (f), intl (0), 0,
         dmark$, junk, Errcod)
   if (Errcod ~= 0)
      return (ERR)

   return
   end
