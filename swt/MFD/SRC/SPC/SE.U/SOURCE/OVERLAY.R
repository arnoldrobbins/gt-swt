# overlay --- let user edit lines directly

   subroutine overlay (status)
   integer status

   include SE_COMMON

   character termination, savtxt (MAXLINE), empty (2)
   integer lng, kname, vcol, lcurln, scurln
   integer inject, nextln, equal
   pointer indx
   pointer getind, gettxt

   data empty / NEWLINE, EOS /

   status = OK

   if (Line1 == 0) {
      Curln = 0
      status = inject (empty)
      if (status == ERR)
         return
      First_affected = 1
      Line1 = 1
      Line2 += 1
      }

   for (lcurln = Line1; lcurln <= Line2; lcurln += 1) {
      Curln = lcurln
      vcol = Overlay_col
      repeat {
         call adjust_window (Curln, Curln)
         call updscreen
         Cmdrow = Curln - Topln + Toprow
         indx = gettxt (Curln)
         lng = Lineleng (indx)
         if (Txt (lng - 1) == NEWLINE)    # clobber newline, if there
            lng -= 1
         if (vcol <= 0)
            vcol = lng
         while (lng < vcol) {
            Txt (lng) = ' 'c
            lng += 1
            }
         Txt (lng) = NEWLINE
         Txt (lng + 1) = EOS
         call move$ (Txt, savtxt, lng + 1)   # make a copy of the line
         call getcmd (Txt, Firstcol, vcol, termination)
         if (First_affected > Curln)
            First_affected = Curln
         if (termination == FUNNY)
            break 2
         if (equal (Txt, savtxt) == NO) {    # was the line changed?
            kname = Markname (indx)
            call delete (Curln, Curln, status)
            scurln = Curln
            if (status == OK)
               status = inject (Txt)
            if (status == ERR)
               break 2
            indx = getind (nextln (scurln))
            Markname (indx) = kname
            }
         select (termination)
            when (CURSOR_UP)
               if (Curln > 1)
                  Curln -= 1
               else
                  Curln = Lastln
            when (CURSOR_DOWN)
               if (Curln < Lastln)
                  Curln += 1
               else
                  Curln = min (1, Lastln)
            when (CURSOR_SAME)
               vcol = 1
         } until (termination ~= CURSOR_UP
                  && termination ~= CURSOR_DOWN
                  && termination ~= CURSOR_SAME)
      }

   Cmdrow = Nrows - 1

   return
   end
