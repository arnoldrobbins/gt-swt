# getnum --- convert one term to line number

   integer function getnum (lin, i, pnum, status)
   character lin (MAXLINE)
   integer i, pnum, status

   include SE_COMMON

   integer j
   integer missing_delim, k
   integer ctoi, optpat, ptscan, knscan, getkn

   getnum = OK
   SKIPBL (lin, i)
   select
      when (lin (i) >= Rel_a && lin (i) <= Rel_z && Absnos == NO)
         pnum = Topln - Toprow + 1 + lin (i) - Rel_a
      when (lin (i) == CURLINE)
         pnum = Curln
      when (lin (i) == PREVLINE || lin (i) == PREVLINE2)
         pnum = Curln - 1
      when (lin (i) == LASTLINE)
         pnum = Lastln
      when (lin (i) == SCAN || lin (i) == BACKSCAN) {
         missing_delim = YES

         # see if trailing delim supplied, since command can follow pattern
         for (k = i + 1; lin (k) ~= EOS; k += 1)
            if (lin (k) == ESCAPE && lin (k+1) == lin (i))
               k += 1   # skip esc, loop will skip escaped char
            else if (lin (k) == lin (i)) {
               missing_delim = NO
               break
               }

         if (missing_delim == YES) {
            for(; lin (k) ~= EOS; k += 1)
               ;
            k -= 1      # now at NEWLINE

            # supply trailing delim
            lin (k) = lin (i)
            lin (k + 1) = NEWLINE
            lin (k + 2) = EOS
            Peekc = SKIP_RIGHT
            }

         if (optpat (lin, i) == ERR)   # build the pattern
            getnum = ERR
         elif (lin (i) == SCAN)
            getnum = ptscan (FORWARD, pnum)
         else
            getnum = ptscan (BACKWARD, pnum)
         }
      when (lin (i) == SEARCH || lin (i) == BACKSEARCH) {
         j = i;
         i += 1
         if (getkn (lin, i, Savknm, Savknm) == ERR)
            getnum = ERR
         elif (lin (j) == SEARCH)
            getnum = knscan (FORWARD, pnum)
         else
            getnum = knscan (BACKWARD, pnum)
         i -= 1
         }
      when (IS_DIGIT (lin (i))) {  # is there a digit here ?
         pnum = ctoi (lin, i)
         i -= 1   # backup; to be advanced at the end
         }
      when (lin (i) == TOPLINE)
         pnum = Topln
   else
      getnum = EOF

   if (getnum == OK)
      i += 1

   status = getnum
   return

   end
