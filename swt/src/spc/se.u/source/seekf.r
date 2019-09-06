# seekf --- position file open on  fd  to  pos

   integer function seekf (pos, fd)
   longint pos
   integer fd

   integer code

   call prwf$$ (KPOSN + KPREA, fd, loc (0), 0, pos, 0, code)
   if (code ~= 0)
      call error ("Fatal scratch file seek error"p)

   return (OK)

   end
