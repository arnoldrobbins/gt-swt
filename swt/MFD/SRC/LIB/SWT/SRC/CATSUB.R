# catsub --- add replacement text to end of  new

   subroutine catsub (lin, from, to, sub, new, k, maxnew)
   integer from (10), to (10), k, maxnew
   character lin (MAXLINE), new (maxnew), sub (MAXPAT)

   integer addset
   integer i, j, junk, ri

   for (i = 1; sub (i) ~= EOS; i += 1)
      if (sub (i) == PAT_DITTO) {
         i += 1
         ri = sub (i) + 1 - PAT_MARK
         for (j = from (ri); j < to (ri); j += 1)
            junk = addset (lin (j), new, k, maxnew)
         }
      else
         junk = addset (sub (i), new, k, maxnew)

   return
   end
