# mktemp --- open a temporary file and return its unit number

   filedes function mktemp (mode)
   integer mode

   integer i, fd
   character tempf (15)
   integer create

   for (i = 1; i <= 999; i += 1) {
      call encode (tempf, 15, "=temp=/tm*i"s, i)
      fd = create (tempf, mode)
      if (fd ~= ERR)
         return (fd)
      }

   return (ERR)
   end
