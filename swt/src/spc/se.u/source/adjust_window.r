# adjust_window --- position window to include lines from through to

   subroutine adjust_window (from, to)
   integer from, to

   include SE_COMMON

   integer i, l1, l2, hw
   integer hwinsdel

   if (from < Topln || to > Topln + (Botrow - Toprow)) {

     # Find the first and last lines on the screen
      for (i = 1; i <= Sclen && Scline (i) == -1; i += 1)
         ;
      if (i <= Sclen)
         l1 = Scline (i) + Sctop - 1
      else
         l1 = Lastln + 1
      for (i = Sclen; i > 0 && Scline (i) == -1; i -= 1)
         ;
      if (i > 0)
         l2 = Scline (i) + Sctop - 1
      else
         l2 = 0

     # See if we have hardware to help us out
      hw = hwinsdel (0)

     # Pick the best placement for the screen
      if (to - from > Botrow - Toprow)
         Topln = to - (Botrow - Toprow)          # show last part
      else if (hw == YES && from >= l1 && to <= l2)
         Topln = (l1 + l2 + Toprow - Botrow) / 2 # center around l1 & l2
      else if (hw == YES && from < l1 && l1 - from < (Botrow - Toprow + 1) / 2)
         Topln = from                            # slide screen down
      else if (hw == YES && to > l2 && to - l2 < (Botrow - Toprow + 1) / 2)
         Topln = to - (Botrow - Toprow)          # slide screen up
      else
         Topln = (from + to + Toprow - Botrow) / 2 # center range on screen
      if (hw == YES && Topln + (Botrow - Toprow) > Lastln)
         Topln = Lastln - (Botrow - Toprow)
      if (Topln < 1)
         Topln = 1
      if (First_affected > Topln)
         First_affected = Topln
      }

   return
   end
