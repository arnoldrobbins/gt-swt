# finfo$ --- return information about a file

   integer function finfo$ (path, entry, attach)
   character path (ARB)
   integer entry (ARB), attach

   integer code, fd, junk (3)
   character name (MAXPACKEDFNAME), vname (MAXVARYFNAME)
   integer getto

   finfo$ = ERR
   if (getto (path, name, junk, attach) == ERR)
      return

   call srch$$ (KREAD + KGETU, KCURR, 0, fd, junk, code)
   if (code ~= 0)
      return

   call ptov (name, ' 'c, vname, MAXVARYFNAME)
   call ent$rd (fd, vname, loc(entry), MAXDIRENTRY, code)
   call srch$$ (KCLOS, 0, 0, fd, 0, junk)
   if (code == 0)
      finfo$ = OK

   return
   end
