# fixscreen --- try to repair the screen using line insert/delete

   subroutine fixscreen

   include SE_COMMON

   integer oi, ni, dc, ic, ul, p
   integer wline (MAXROWS)
   integer hwinsdel

  # If the screen length has changed or we have no hardware
  # insert/delete, we'll bail out while we can.
   if (Botrow - Toprow + 1 ~= Sclen || hwinsdel (0) == NO)
      return

  # Mark out (set to -1) all old lines that do not appear on
  # the new screen and scale the rest relative to Topln.
   for (oi = 1; oi <= Sclen; oi += 1)
      if (Scline (oi) == -1
            || Scline (oi) + Sctop - 1 < Topln
            || Scline (oi) + Sctop - 1 > Topln + (Botrow - Toprow))
         Scline (oi) = -1
      else
         Scline (oi) += Sctop - Topln

  # Enter only those lines in the new screen that are left in
  # the old screen; put -1 everywhere else.
   oi = 1
   for (ni = 1; ni <= Sclen; ni += 1) {
      while (oi <= Sclen && Scline (oi) == -1)
         oi += 1
      if (oi <= Sclen && Scline (oi) == ni) {
         wline (ni) = ni
         oi += 1
         }
      else
         wline (ni) = -1
      }


  # Now see if repair is still worthwhile:  If the number of
  # of lines that must be redisplayed without using insert/delete
  # is less than 2 + the number of lines that must be redisplayed
  # on the new screen, we should bail out.  (This is a rather
  # dumb heuristic, but it handles most cases well enough.)
   ul = 0
   ni = 0
   for (oi = 1; oi <= Sclen; oi += 1) {
      if (Scline (oi) ~= wline (oi) || Scline (oi) == -1)
         ul += 1
      if (wline (oi) == -1)
         ni += 1
      }
   if (ul < ni + 2)
      return

  # Passing through screens backward, output line-deletes for
  # each block of deletions and each block of changes that have
  # fewer new lines than old lines.
   oi = Sclen
   ni = Sclen
   while (oi > 0 || ni > 0) {
      for (dc = 0; oi > 0 && Scline (oi) == -1; dc += 1)
         oi -= 1
      for (ic = 0; ni > 0 && wline (ni) == -1; ic += 1)
         ni -= 1
      if (dc > ic)
         call dellines (oi + Toprow + ic, dc - ic)
      while (oi > 0 && Scline (oi) ~= -1
            && ni > 0 && wline (ni) == Scline (oi)) {
         oi -= 1
         ni -= 1
         }
      }

  # Finally, passing through the screens forward, output line-inserts
  # for each block of insertions and each block of changes that have
  # fewer new lines than old lines.
   oi = 1
   ni = 1
   while (oi <= Sclen || ni <= Sclen) {
      p = ni
      for (dc = 0; oi <= Sclen && Scline (oi) == -1; dc += 1)
         oi += 1
      for (ic = 0; ni <= Sclen && wline (ni) == -1; ic += 1)
         ni += 1
      if (ic > dc)
         call inslines (p - 1 + Toprow + dc, ic - dc)
      while (oi <= Sclen && Scline (oi) ~= -1
            && ni <= Sclen && wline (ni) == Scline (oi)) {
         oi += 1
         ni += 1
         }
      }

   return
   end
