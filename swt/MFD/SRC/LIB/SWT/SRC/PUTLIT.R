# putlit --- write literal string on specified unit

   subroutine putlit (msg, delim, unit)
   integer msg (ARB), unit
   character delim

   character str (MAXLINE)

   call ptoc (msg, delim, str, MAXLINE)
   call putlin (str, unit)

   return
   end
