# append --- append lines after "line" (modified for screen editor)

   integer function append (line, str)
   integer line
   character str (ARB)

   include SE_COMMON

   character lin (MAXLINE), termination
   integer len, i
   integer inject, hwinsdel
   integer dpos, dotseen
   integer k, gettxt

   Curln = line

   if (str (1) == ':'c)      # text to be added is in the command line
      append = inject (str (2))

   else {   # enter append mode
      Cmdrow = Toprow + (Curln - Topln) + 1  # 1 below Curln
      lin (1) = EOS
#     len = 0
      if (Indent > 0 || line <= 0)
         len = max (0, Indent - 1)
      else {
         k = gettxt (line)
         for (len = 1; Txt (len) == ' 'c; len += 1)
            ;
         }
      dpos = len     # postion for terminating '.'

      for (append = NOSTATUS; append == NOSTATUS; ) {
         if (hwinsdel (0) == NO) {  # do it the old, slow way
            if (Cmdrow > Botrow) {
               Cmdrow = Toprow + 1
               call cprow (Botrow, Toprow)
               call adjust_window (Curln, Curln)
               if (First_affected > Topln)
                  First_affected = Topln
               }
            call clrrow (Cmdrow)
            if (Cmdrow < Botrow)
               call clrrow (Cmdrow + 1)
            }
         else {                     # try to do it faster
            if (Cmdrow > Botrow) {
               Cmdrow -= 1
               call dellines (Toprow, 1)
               call inslines (Cmdrow, 1)
               Topln += 1
               }
            else {
               call dellines (Botrow, 1)
               call inslines (Cmdrow, 1)
               }
            }
         call prompt ("apd>"s)
         repeat
            call getcmd (lin, Firstcol, len, termination)
            until (termination ~= CURSOR_UP && termination ~= CURSOR_DOWN
                  && termination ~= CURSOR_SAME)

         dotseen = NO

         if (lin (1) == "."c && lin (2) == NEWLINE && lin (3) == EOS)
            dotseen = YES

         for (i = 1; i < dpos && lin (i) == ' 'c; i += 1)
            ;

         if (i == dpos && lin (dpos) == '.'c && lin (dpos+1) == NEWLINE
               && lin (dpos+2) == EOS)
            dotseen = YES

         if (dotseen == YES) {
            if (hwinsdel (0) == YES) {
               call dellines (Cmdrow, 1)
               call inslines (Botrow, 1)
               }
            append = OK
            }
         elif (inject (lin) == ERR)
            append = ERR
         else                    # inject occured
            call prompt (EOS)    # erase prompt
         Cmdrow += 1
         if (termination ~= FUNNY) {
#           len = 0
            if (Indent > 0)
               len = Indent - 1;
            else {   # do auto indent
               for (len = 1; lin (len) == ' 'c; len += 1)
                  ;
               }
            dpos = len
            lin (1) = EOS
            }
         }

      Cmdrow = Nrows - 1   # reset command row
      if (hwinsdel (0) == YES) {          # Since we know the screen is
         Sctop = Topln                    # contiguous, make sure that
         for (i = 1; i <= Sclen; i += 1)  # fixscreen knows it, too.
            if (Sctop + i - 1 <= Lastln)
               Scline (i) = i
            else
               Scline (i) = -1
         }
      }

   if (Curln == 0 && Lastln > 0)  # for "0a" or "1i" followed by "."
      Curln = 1

   if (First_affected > line)
      First_affected = line

   return
   end
