# makpat --- make pattern from arg (from), terminate at delim

   integer function makpat (arg, from, delim, pat)
   character arg (MAXARG), delim, pat (MAXPAT)
   integer from

   character esc
   integer addset, getccl, stclos
   integer i, j, junk, lastcl, lastj, lj,
      tag_nest, tag_num, tag_stack (9)

   j = 1      # pat index
   lastj = 1
   lastcl = 0
   tag_num = 0
   tag_nest = 0
   for (i = from; arg (i) ~= delim && arg (i) ~= EOS; i += 1) {
      lj = j
      if (arg (i) == PAT_ANY)
         junk = addset (PAT_ANY, pat, j, MAXPAT)
      else if (arg (i) == PAT_BOL && i == from)
         junk = addset (PAT_BOL, pat, j, MAXPAT)
      else if (arg (i) == PAT_EOL && arg (i + 1) == delim)
         junk = addset (PAT_EOL, pat, j, MAXPAT)
      else if (arg (i) == PAT_CCL) {
         if (getccl (arg, i, pat, j) == ERR) {
            makpat = ERR
            return
            }
         }
      else if (arg (i) == PAT_CLOSURE && i > from) {
         lj = lastj
         if (pat (lj) == PAT_BOL || pat (lj) == PAT_EOL || pat (lj) == PAT_CLOSURE ||
               pat (lj) == PAT_START_TAG || pat (lj) == PAT_STOP_TAG)
            break
         lastcl = stclos (pat, j, lastj, lastcl)
         }
      else if (arg (i) == PAT_START_TAG) {
         if (tag_num >= 9)    # too many tagged sub-patterns
            break
         tag_num += 1
         tag_nest += 1
         tag_stack (tag_nest) = tag_num
         junk = addset (PAT_START_TAG, pat, j, MAXPAT)
         junk = addset (tag_num, pat, j, MAXPAT)
         }
      else if (arg (i) == PAT_STOP_TAG && tag_nest > 0) {
         junk = addset (PAT_STOP_TAG, pat, j, MAXPAT)
         junk = addset (tag_stack (tag_nest), pat, j, MAXPAT)
         tag_nest -= 1
         }
      else {
         junk = addset (PAT_CHAR, pat, j, MAXPAT)
         junk = addset (esc (arg, i), pat, j, MAXPAT)
         }
      lastj = lj
      }
   if (arg (i) ~= delim)   # terminated early
      makpat = ERR
   else if (addset (EOS, pat, j, MAXPAT) == NO)   # no room
      makpat = ERR
   else if (tag_nest ~= 0)
      makpat = ERR
   else
      makpat = i

   return
   end
