# stclos --- insert closure entry at pat (j)

   integer function stclos (pat, j, lastj, lastcl)
   character pat (MAXPAT)
   integer j, lastj, lastcl

   integer addset
   integer jp, jt, junk

   for (jp = j - 1; jp >= lastj; jp -= 1) {   # make a hole
      jt = jp + PAT_CLOSIZE
      junk = addset (pat (jp), pat, jt, MAXPAT)
      }
   j += PAT_CLOSIZE
   stclos = lastj
   junk = addset (PAT_CLOSURE, pat, lastj, MAXPAT)   # put closure in it
   junk = addset (0, pat, lastj, MAXPAT)      # PAT_COUNT
   junk = addset (lastcl, pat, lastj, MAXPAT)   # PAT_PREVCL
   junk = addset (0, pat, lastj, MAXPAT)      # PAT_START

   return
   end
