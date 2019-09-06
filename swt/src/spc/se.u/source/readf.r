# readf --- read count words from fd into buf

   integer function readf (buf, count, fd)
   integer buf (ARB), count, fd

   integer nwr, code

   call prwf$$ (KREAD, fd, loc (buf), count, intl (0), nwr, code)
   if (code ~= 0 || nwr ~= count)
      call error ("Fatal scratch file read error"p)

   return (nwr)

   end
