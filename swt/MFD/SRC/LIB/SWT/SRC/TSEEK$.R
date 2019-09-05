# tseek$ --- seek on a terminal device (??)

   integer function tseek$ (pos, f, ra)
   longint pos
   integer f, ra

   include SWT_COMMON

   integer i
   character junk

   if (ra == ABS || pos < 0)
      return (ERR)         # can't do this for a terminal

   for (i = 1; i <= pos; i += 1)
      call c1in (junk)

   return (OK)
   end
