# maksub --- make substitution string in sub

   integer function maksub (arg, from, delim, sub)
   character arg (ARB), delim, sub (MAXPAT)
   integer from

   character esc, type
   integer addset
   integer i, j, junk

   j = 1
   for (i = from; arg (i) ~= delim && arg (i) ~= EOS; i += 1)
      if (arg (i) == PAT_AND) {
         junk = addset (PAT_DITTO, sub, j, MAXPAT)
         junk = addset (0 + PAT_MARK, sub, j, MAXPAT)
         }
      else if (arg (i) == ESCAPE && type (arg (i + 1)) == DIGIT) {
         i += 1
         junk = addset (PAT_DITTO, sub, j, MAXPAT)
         junk = addset (arg (i) - '0'c + PAT_MARK, sub, j, MAXPAT)
         }
      else
         junk = addset (esc (arg, i), sub, j, MAXPAT)
   if (arg (i) ~= delim)   # missing delimiter
      maksub = ERR
   else if (addset (EOS, sub, j, MAXPAT) == NO)   # no room
      maksub = ERR
   else
      maksub = i

   return
   end
