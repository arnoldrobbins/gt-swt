# dseek$ --- seek on a disk device

   integer function dseek$ (pos, f, ra)
   filemark pos
   integer f, ra

   include SWT_COMMON

   integer junk

   select (ra)
      when (ABS) {
         if (pos < 0)
            return (ERR)
         call prwf$$ (KPOSN + KPREA, Fd_unit (f), intl (0),
               0, pos, junk, Errcod)
         if (Errcod ~= 0)
            return (EOF)
         }
      when (REL) {
         call prwf$$ (KPOSN + KPRER, Fd_unit (f), intl (0),
               0, pos, junk, Errcod)
         if (Errcod ~= 0)
            return (EOF)
         }
   else
      return (ERR)

   return (OK)
   end
