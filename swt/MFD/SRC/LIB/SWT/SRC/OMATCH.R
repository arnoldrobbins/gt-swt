# omatch --- try to match a single pattern at pat (j)

   integer function omatch (lin, i, pat, j)
   character lin (ARB), pat (MAXPAT)
   integer i, j

   integer locate
   integer bump

   omatch = NO
   if (lin (i) == EOS)
      return
   bump = -1
   select (pat (j))
      when (PAT_CHAR) {
         if (lin (i) == pat (j + 1))
            bump = 1
         }
      when (PAT_BOL) {
         if (i == 1)
            bump = 0
         }
      when (PAT_ANY) {
         if (lin (i) ~= NEWLINE)
            bump = 1
         }
      when (PAT_EOL) {
         if (lin (i) == NEWLINE)
            bump = 0
         }
      when (PAT_CCL) {
         if (locate (lin (i), pat, j + 1) == YES)
            bump = 1
         }
      when (PAT_NCCL) {
         if (lin (i) ~= NEWLINE && locate (lin (i), pat, j + 1) == NO)
            bump = 1
         }
   else
      call error ("in omatch: can't happen"s)

   if (bump >= 0) {
      i += bump
      omatch = YES
      }

   return
   end
