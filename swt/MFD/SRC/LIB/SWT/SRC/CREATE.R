# create --- create a new file and open it

   file_des function create (path, mode)
   character path (ARB)
   integer mode

   integer fd
   integer open, trunc

   fd = open (path, mode)
   if (fd ~= ERR)
      if (trunc (fd) ~= ERR)
         return (fd)
      else
         call close (fd)

   return (ERR)
   end
