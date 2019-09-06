# match --- find match anywhere on line

   integer function match (lin, pat)
   character lin (ARB), pat (MAXPAT)

   integer amatch
   integer i, junk (9)

   for (i = 1; lin (i) ~= EOS; i += 1)
      if (amatch (lin, i, pat, junk, junk) > 0)
         return (YES)

   return (NO)

   end
