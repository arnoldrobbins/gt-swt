# writef --- write count words from buf onto fd

   integer function writef (buf, count, fd)
   integer buf (ARB), count, fd

   integer nwr, code

   call prwf$$ (KWRIT, fd, loc (buf), count, intl (0), nwr, code)
   if (code ~= 0 || nwr ~= count)
      call error ("Fatal scratch file write error"p)

   return (nwr)

   end
