# ckglob --- if global prefix, mark lines to be affected

   integer function ckglob (lin, i, status)
   character lin (MAXLINE)
   integer i, status

   include SE_COMMON

   integer line, usepat, usemark, tmp
   integer defalt, match, optpat, getkn
   pointer k
   logical intrpt, brkflag

   status = OK
   usepat = EOF
   usemark = EOF

   if (lin (i) == GMARK || lin (i) == XMARK) {   # global markname prefix?
      if (lin (i) == GMARK)   # tag lines with the specified markname
         usemark = YES
      else                    # tag lines without the specified markname
         usemark = NO
      i += 1
      status = getkn (lin, i, Savknm, Savknm)
      }

   if (status == OK)          # check for a pattern prefix too
      select (lin (i))
         when (GLOBAL, UCGLOBAL)
            usepat = YES
         when (EXCLUDE, UCEXCLUDE)
            usepat = NO
         ifany {
            i += 1
            if (optpat (lin, i) == ERR)
               status = ERR
            else
               i += 1
            }

   if (status == OK && usepat == EOF && usemark == EOF)
      status = EOF
   elif (status == OK)
      call defalt (1, Lastln)

   if (status == OK) {     # no errors so far, safe to proceed

      call mesg ("GLOB"s, REMARK_MSG)

      k = Line0            # mark all lines preceeding global range
      for (line = 0; line < Line1; line += 1) {
         Globmark (k) = NO
         k = Nextline (k)
         }

      for ( ; line <= Line2; line += 1) {    # mark lines in range
         if (intrpt (brkflag)) {    # check for an interrupt
            status = ERR
            return (status)
            }
         tmp = NO
         if (usemark == EOF
               || usemark == YES && Markname (k) == Savknm
               || usemark == NO  && Markname (k) ~= Savknm) {
            if (usepat == EOF)      # no global pattern to look for
               tmp = YES
            else {            # there is also a pattern to look for
               call gtxt (k)
               if (match (Txt, Pat) == usepat)
                  tmp = YES
               }
            }
         Globmark (k) = tmp
         k = Nextline (k)
         }

      for ( ; k ~= Line0; k = Nextline (k))  # mark remaining lines
         Globmark (k) = NO

      call mesg (EOS, REMARK_MSG)
      }

   return (status)

   end
