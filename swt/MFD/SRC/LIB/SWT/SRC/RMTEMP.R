# rmtemp --- rewind, truncate, and close a temporary made by mktemp

   integer function rmtemp (fd)
   integer fd

   integer close

   call rewind (fd)
   call trunc (fd)
   if (close (fd) == ERR)
      rmtemp = ERR
   else
      rmtemp = OK

   return
   end
