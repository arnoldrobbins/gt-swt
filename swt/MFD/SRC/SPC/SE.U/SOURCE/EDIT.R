# edit --- main routine (modified for screen editor)

   subroutine edit

   include SE_COMMON

   character lin (MAXLINE), termination
   integer cursav, status, len, cursor
   integer ckglob, docmd, doglob, doread, getarg, getlst, doopt, length
   logical intrpt, brkflag
   external dologout
   shortcall mkonu$ (22)

   call watch  # display time of day

   call serc            # execute commands in =home=/.serc, if possible

   status = OK
   while (status == OK && getarg (Argno, lin, MAXLINE - 3) ~= EOF) {
      call loadstr (lin, Argno, POOPCOL, Ncols)
      Nlines = 0
      if (lin (1) == "-"c) {
         len = length (lin) + 1
         lin (len) = NEWLINE
         lin (len + 1) = EOS
         len = 1
         status = doopt (lin, len)
         }
      else
         status = doread (Lastln, lin)
      Argno += 1
      }

   if (status == ERR)
      call printverboseerrormessage
   else
      Curln = min (1, Lastln)

   Buffer_changed = NO
   First_affected = 1   # henceforth maintained by updscreen & commands
   call updscreen

   if (status ~= ERR)   # leave offending file name or option
      lin (1) = EOS
   cursor = 0

   call mkonu$ ("LOGOUT$"v, loc (dologout))  # catch LOGOUT$ signals

   repeat {
      call intrpt (brkflag)   # discard pending breaks
      if (Lost_lines > GARBAGE_THRESHOLD
            && (Lastln + Limcnt) div Lost_lines <= GARBAGE_FACTOR)
         call garbage_collect

      call mswait    # check for pending messages
      Cmdrow = Nrows - 1   # reset the command line location
      call prompt ("cmd>"s)
      call getcmd (lin, 1, cursor, termination)
      call mesg (EOS, REMARK_MSG)   # clear out any error messages

      while (termination == CURSOR_UP
            || termination == CURSOR_DOWN
            || termination == CURSOR_SAME) {
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
            ifany {
               call adjust_window (Curln, Curln)
               call updscreen
               }
         call getcmd (lin, 1, cursor, termination)
         }

      call prompt (EOS)    # remove prompt

      cursav = Curln    # remember it in case of an error
      Errcode = EEGARB  # default error code for garbage at end

      len = 1
      if (getlst (lin, len, status) == OK) {
         if (ckglob (lin, len, status) == OK)
            call doglob (lin, len, cursav, status)
         elif (status ~= ERR)
            call docmd (lin, len, NO, status)
         }
      if (status == ERR) {
         call printverboseerrormessage
         Curln = min (cursav, Lastln)
         }
      elif (termination ~= FUNNY) {
         cursor = 0
         lin (1) = EOS
         }

      call adjust_window (Curln, Curln)
      call updscreen

      } until (status == EOF)

   call clrscreen
   call clrbuf

   return
   end
