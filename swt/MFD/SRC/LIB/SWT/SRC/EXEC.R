# exec --- execute pathname

   subroutine exec (path)
   character path (ARB)

   integer file (16), j1 (3), j2
   integer getto, findf$

   if (getto (path, file, j1, j2) ~= ERR && findf$ (file) == YES)
      call resu$$ (file, 32)

   return
   end
