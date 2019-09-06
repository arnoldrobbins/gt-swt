# dotlit --- transliterate characters

   integer function dotlit (sub, allbut)
   character sub (ARB)
   integer allbut

   include SE_COMMON

   character new (MAXLINE), kname
   integer collap, x, i, j, line, lastsub, status
   integer length, xindex, inject
   pointer inx
   pointer getind, gettxt
   logical brkflag, intrpt

   dotlit = ERR
   if (Line1 <= 0) {
      Errcode = EORANGE
      return
      }

   if (First_affected > Line1)
      First_affected = Line1

   lastsub = length (sub)
   if (length (Tlpat) > lastsub || allbut == YES)
      collap = YES
   else
      collap = NO

   for (line = Line1; line <= Line2; line += 1) {
      if (intrpt (brkflag))   # check for interrupts
         return (ERR)
      inx = gettxt (line)     # get text of line into txt, return index
      j = 1
      for (i = 1; Txt (i) ~= EOS && Txt (i) ~= NEWLINE; i += 1) {
         x = xindex (Tlpat, Txt (i), allbut, lastsub)
         if (collap == YES && x >= lastsub && lastsub > 0) {   # collapse
            new (j) = sub (lastsub)
            j += 1
            for (i += 1; Txt (i) ~= EOS && Txt (i) ~= NEWLINE; i += 1) {
               x = xindex (Tlpat, Txt (i), allbut, lastsub)
               if (x < lastsub)
                  break
               }
            }
         if (Txt (i) == EOS || Txt (i) == NEWLINE)
            break
         if (x > 0 && lastsub > 0) {   # tranlsiterate
            new (j) = sub (x)
            j += 1
            }
         elif (x == 0) {   # copy
            new (j) = Txt (i)
            j += 1
            }
                              # else delete
         }

      if (Txt (i) == NEWLINE) {  # add a newline, if necessary
         new (j) = NEWLINE
         j += 1
         }
      new (j) = EOS              # add the EOS

      kname = Markname (inx)     # save the mark name
      call delete (line, line, status)
      dotlit = inject (new)
      if (dotlit == ERR)
         break
      inx = getind (Curln)
      Markname (inx) = kname     # set markname
      dotlit = OK
      Buffer_changed = YES
      }

   return
   end
