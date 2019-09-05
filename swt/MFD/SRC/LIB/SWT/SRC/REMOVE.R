# remove --- remove a file, return status

   integer function remove (path)
   character path (ARB)

   integer fname (16), attach, j1 (3), code
   integer getto, rmfil$

   remove = ERR
   if (getto (path, fname, j1, attach) ~= ERR)
      remove = rmfil$ (fname)

   if (attach == YES)
      call at$hom (code)

   return
   end
