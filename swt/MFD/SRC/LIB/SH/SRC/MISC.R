#  subsys --- execute a subsystem command

   integer function subsys (cmd)
   character cmd (ARB)

   filedes mktemp
   integer shell

   filedes fd
   integer rc


   fd = mktemp (READWRITE)
   if (fd == ERR)
      return (EOF)

   call print (fd, "*s*n"s, cmd)
   call rewind (fd)

   rc = shell (fd)
   call rmtemp (fd)

   return (rc)
   end
