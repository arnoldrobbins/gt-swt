# closef --- close a file

   subroutine closef (fd)
   integer fd

   integer junk

   call srch$$ (KCLOS, 0, 0, fd, junk, junk)

   return
   end
