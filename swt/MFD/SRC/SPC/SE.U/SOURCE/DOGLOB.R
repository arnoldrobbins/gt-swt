# doglob --- do command at lin (i) on all marked lines

   integer function doglob (lin, i, cursav, status)
   character lin (MAXLINE)
   integer i, cursav, status

   include SE_COMMON

   integer istart, line
   integer docmd, getlst
   pointer k
   logical intrpt, brkflag

   status = OK
   istart = i
   k = Line0
   line = 0

   repeat {
      line += 1
      k = Nextline (k)
      if (Globmark (k) == YES) {    # line is marked
         Globmark (k) = NO          # unmark the line
         Curln = line
         cursav = Curln             # remember where we are
         i = istart
         if (getlst (lin, i, status) == OK)
            call docmd (lin, i, YES, status)
         line = 0                   # lines may have been moved by docmd
         k = Line0
         }
      if (intrpt (brkflag))
         status = ERR
      } until (line > Lastln || status ~= OK)

   return (status)

   end
