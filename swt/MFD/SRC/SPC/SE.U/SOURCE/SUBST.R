# subst --- substitute "sub" for occurrences of pattern

   integer function subst (sub, gflag, glob)
   character sub (MAXPAT)
   integer gflag, glob

   include SE_COMMON

   character new (MAXLINE), kname
   integer j, k, junk, lastm, line, m, status, subbed, inx,
      tagbeg (10), tagend (10)
   integer addset, amatch, gettxt, inject
   pointer inx
   pointer getind
   logical intrpt, brkflag

   if (Globals == YES && glob == YES)
      subst = OK
   else
      subst = ERR

   if (Line1 <= 0) {
      Errcode = EORANGE
      return
      }

   if (index (Pat, NEWLINE) ~= 0) { # temp kluge to prevent deleting NL
      Errcode = EBADPAT
      return
      }

   for (line = Line1; line <= Line2; line += 1) {
      if (intrpt (brkflag))
         return (ERR)
      j = 1
      subbed = NO
      inx = gettxt (line)
      lastm = 0
      for (k = 1; Txt (k) ~= EOS; ) {
         do m = 2, 10; {
            tagbeg (m) = 0
            tagend (m) = 0
            }
         if (gflag == YES || subbed == NO)
            m = amatch (Txt, k, Pat, tagbeg (2), tagend (2))
         else
            m = 0
         if (m > 0 && lastm ~= m) {   # replace matched text
            subbed = YES
            tagbeg (1) = k
            tagend (1) = m
            call catsub (Txt, tagbeg, tagend, sub, new, j, MAXLINE)
            lastm = m
            }
         if (m == 0 || m == k) {   # no match or null match
            junk = addset (Txt (k), new, j, MAXLINE)
            k += 1
            }
         else            # skip matched text
            k = m
         }
      if (subbed == YES) {
         if (addset (EOS, new, j, MAXLINE) == NO) {
            subst = ERR
            Errcode = E2LONG
            break
            }
         kname = Markname (inx)
         call delete (line, line, status)   # remembers dot
         subst = inject (new)
         if (First_affected > Curln)
            First_affected = Curln
         if (subst == ERR)
            break
         inx = getind (Curln)
         Markname (inx) = kname
         subst = OK
         Buffer_changed = YES
         }
      else  # subbed equals NO
         Errcode = ENOMATCH
      }

   return
   end
