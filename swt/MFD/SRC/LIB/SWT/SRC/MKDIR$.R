# mkdir$ --- create a subdirectory

   integer function mkdir$ (name, owner, non_owner)
   character name (ARB), owner (ARB), non_owner (ARB)

   integer newdir (16), opw (3), npw (3), attach, code, i, junk (3)
   integer getto, findf$, ctop

   mkdir$ = ERR
   do i = 1, 3; {
      opw (i) = "  "
      npw (i) = "  "
      }
   i = 1
   if (ctop (owner, i, opw, 3) == 0)
      opw (1) = 0
   i = 1
   if (ctop (non_owner, i, npw, 3) == 0)
      npw (1) = 0
   if (getto (name, newdir, junk, attach) ~= ERR
         && findf$ (newdir) == NO) {
      call crea$$ (newdir, 32, opw, npw, code)
      call satr$$ (KPROT, newdir, 32, 16r07010000, junk)
      if (code == 0)
         mkdir$ = OK
      }

   if (attach ~= NO)
      call at$hom (code)

   return
   end
