# putch --- put a character on a file

   integer function putch (c, fd)
   character c
   filedes fd

   integer putlin
   character buf (2)

   buf (1) = c; buf (2) = EOS
   return (putlin (buf, fd))

   end
