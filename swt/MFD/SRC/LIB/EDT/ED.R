# ed --- editor with Georgia Tech extensions

include "ed_def.r.i"

# edit --- main routine

   subroutine edit (filenm, fdin, fdout)
   character filenm (ARB)
   integer fdin, fdout

   include "ed_com.r.i"

   character lin(MAXLINE)

   integer ckglob, docmd, doglob, doread, getlin, getlst
   integer cursav, i, status

   logical intrpt, brkflag

   external dologout
   shortcall mkonu$ (22)

   call break$ (DISABLE)            # disable break key

   Fdin = fdin
   Fdout = fdout

   probation = 0
   saverrcode = ENOERR
   errcode = ENOERR
   prompt(1) = EOS
   pat(1) = EOS
   tlpat(1) = EOS
   subs(1) = EOS
   savfil(1) = EOS
   savknm = DEFAULTNAME
   nldef(1) = EOS
   ddir = FORWARD
   tune = 0
   globals = NO
   call setlog(MAKE_LOG_FILE)
   call setbuf
   curln = 0
   if (filenm (1) ~= EOS) {
      call ctoc (filenm, savfil, MAXLINE)
      if (doread(0, savfil) == ERR)
         call remark("?"p)
      else
         curln = min0 (1, lastln)
      }
   saverrcode = errcode   # in case of error above
   updflg = NO
   call mkonu$ ("LOGOUT$"v, loc (dologout))  # catch logouts
   while (getlin(lin, Fdin) ~= EOF) {
      if (intrpt(brkflag))
         status = ERR
      else {
         i = 1
         errcode = EEGARB  # default error code for garbage at end
         cursav = curln
         call log(lin)
         if (getlst(lin, i, status) == OK) {
            if (ckglob(lin, i, status) == OK)
               status = doglob(lin, i, cursav, status)
            else if (status ~= ERR)
               status = docmd(lin, i, NO, status)
            # else error, do nothing
            }
         }
      if (status == ERR) {
         call remark("?"p)
         if (cursav <= lastln) {
            curln = cursav
            call putdec(curln, 0, safety_logfile)
            call putch(NEWLINE, safety_logfile)
            }
         saverrcode = errcode
         }
      else if (status == EOF)
         break
      # else status is OK
      call putlin(prompt, Fdout)
#      call idle # tell file primitives we aren't especially busy
      if (intrpt(brkflag))
         ; # too late to worry about it
      }
   call clrbuf
   if (updflg == NO)
      call setlog(UNMAKE_LOG_FILE)
   else
      call close(safety_logfile)
   call break$ (ENABLE)                # enable break key
   return
   end



# append --- append lines after "line"

   integer function append(line, glob)
   integer line, glob

   include "ed_com.r.i"

   character lin(MAXLINE)

   integer getlin, inject

   if (glob == YES) {
      append = ERR
      errcode = EGLOBA
      }
   else {
      curln = line
      for (append = NOSTATUS; append == NOSTATUS; ) {
         if (getlin(lin, Fdin) == EOF)
            append = EOF
         else if (lin(1) == '.'c && lin(2) == NEWLINE)
            append = OK
         else if (inject(lin) == ERR)
            append = ERR
         else
            updflg = YES
         call log(lin)
         }
      }
   return
   end



# bump --- advance line number and corresponding index simultaneously

   subroutine bump(line, ix, way)
   integer line, ix, way

   include "ed_com.r.i"

   integer getind

   if (way == FORWARD) {
      ix = buf(ix + NEXT)
      if (ix == line0)
         line = 0
      else
         line += 1
      }
   else { # way is BACKWARD
      if (ix == line0)
         line = lastln
      else
         line -= 1
      ix = buf(ix + PREV)
      }
#   if (getind(line) ~= ix) call error("in bump: can't happen.")
   return
   end



# catlin --- concatenate lin onto new; delete any NEWLINE at the end

   subroutine catlin(lin, new, i, maxnew)
   character lin(ARB), new(maxnew)
   integer i, maxnew

   integer f

   for (f = 1; lin(f) ~= EOS && lin(f) ~= NEWLINE; f += 1) {
      if (i > maxnew)
         break  # no error status needed; i > maxnew.
      new(i) = lin(f)
      i += 1
      }
   return
   end



# ckchar --- look for flag character of ch or altch on lin at i, set flag

   integer function ckchar(ch, altch, lin, i, flag, status)
   integer lin(ARB), i, flag, status
   character ch, altch

   if (lin(i) == ch || lin(i) == altch) {
      i += 1
      flag = YES
      }
   else
      flag = NO
   status = OK # always
   ckchar = OK
   return
   end



# ckglob --- if global prefix, mark lines to be affected
#            return EOF iff no global prefix

   integer function ckglob(lin, i, status)
   character lin(MAXLINE)
   integer i, status

   include "ed_com.r.i"

   integer k, line, usepat, usemark, tmp
   integer defalt, match, optpat, getkn

   logical intrpt, brkflag

   status = OK
   usepat = EOF
   usemark = EOF
   if (lin(i) == GMARK || lin(i) == XMARK) {
      if (lin(i) == GMARK)
         usemark = YES
       else
         usemark = NO
      i += 1
      if (getkn(lin, i, savknm, savknm) == ERR)
         status = ERR
      }
   if (lin(i) == GLOBAL || lin(i) == EXCLUDE || lin(i) == UCGLOBAL
      || lin(i) == UCEXCLUDE) {
      if (lin(i) == GLOBAL || lin(i) == UCGLOBAL)
         usepat = YES
      else
         usepat = NO
      i += 1
      if (optpat(lin, i) == ERR)
         status = ERR
      else
         i += 1
      }
   if (status == OK && usepat == EOF && usemark == EOF)
      status = EOF
   else if (status == OK)
      status = defalt(1, lastln, status)
   if (status == OK) {
      k = line0
      for (line = 0; line < line1; line += 1) {
         buf(k + MARK) = NO
         k = buf(k + NEXT)
         }
      for ( ; line <= line2; line += 1) {
         if (intrpt(brkflag)) {
            ckglob = ERR
            status = ERR
            return
            }
         tmp = NO
         if (usemark == EOF || usemark == YES && buf(k + NAME) == savknm
           || usemark == NO && buf(k + NAME) ~= savknm)
            if (usepat == EOF)
               tmp = YES
            else {
               call gtxt(k)
               if (match(txt, pat) == usepat)
                  tmp = YES
               }
         buf(k + MARK) = tmp
         k = buf(k + NEXT)
         }
      for ( ; k ~= line0; k = buf(k + NEXT))
         buf(k + MARK) = NO
      }
   ckglob = status
   return
   end



# ckp --- check for "p" after command

   integer function ckp(lin, i, pflag, status)
   character lin(MAXLINE)
   integer i, pflag, status

   integer j

   j = i
   if (lin(j) == PRINT || lin(j) == UCPRINT) {
      j += 1
      pflag = YES
      }
   else
      pflag = NO
   if (lin(j) == NEWLINE)
      status = OK
   else
      status = ERR
   ckp = status
   return
   end



# ckupd --- make sure it is ok to destroy the buffer

   integer function ckupd(lin, i, status)
   integer i, status
   character lin(ARB)

   include "ed_com.r.i"

   integer flag
   integer ckchar

   status = ckchar ('!'c, '!'c, lin, i, flag, status) # "!" for NOW!
   if (flag == NO && updflg == YES && probation == NO) {
      status = ERR
      errcode = ESTUPID
      call remark("(not saved)"p)
      probation = YES   # if very next command calls us, we'll keep silent
      }
   ckupd = status
   return
   end



# copy --- copy line1 through line2 after line3

   integer function copy (line3)
   integer line3

   include "ed_com.r.i"

   integer i, k, ptr3, after3
   integer inject, getind

   copy = OK
   ptr3 = getind (line3)
   after3 = buf (ptr3 + NEXT)
   if (line1 <= 0 ) {
      copy = ERR
      errcode = ELINE1
      }
   else {
      curln = line3
      k = getind (line1)
      for (i = line1; i <= line2; i += 1) {
         call gtxt (k)
         if (inject(txt) == ERR) {
            copy = ERR
            break
            }
         if (k == ptr3)
            k = after3
         else
            k = buf (k + NEXT)
         }
      }
   return
   end



# defalt --- set defaulted line numbers

   integer function defalt(def1, def2, status)
   integer def1, def2, status

   include "ed_com.r.i"

   if (nlines == 0) {
      line1 = def1
      line2 = def2
      }
   if (line1 > line2) {
      status = ERR
      errcode = EBACKWARD
      }
   else if (line1 <= 0) {
      status = ERR
      errcode = ELINE1
      }
   else
      status = OK
   defalt = status
   return
   end



# delete --- delete lines from through to

   integer function delete(pfrom, pto, status)
   integer pfrom, pto, status

   include "ed_com.r.i"

   integer k1, k2, j1, j2, l1, l2, from, to
   integer getind, nextln, prevln

   from = pfrom
   to = pto

   if (from <= 0) {
      status = ERR
      errcode = ELINE1
      }

# The following lines of commented-out code, when they were in,
# caused the v command to fail if there was only one line in the
# buffer and no modifications had been made.  Things would get
# horribly confused.  I don't know the reason for the bug, but
# getting rid of the following "improvement" fixed it.  WJW
#   else if (from == 1 & to == lastln & updflg == NO) {
#      call clrbuf
#      call setbuf
#      status = OK
#      }
   else {
      k1 = getind(prevln(from))
      j1 = getind(from)
      j2 = getind(to)
      k2 = getind(nextln(to))
      lastln -= to - from + 1
      curln = prevln(from)
      call relink(k1, k2, k1, k2)
      if (limbo ~= NOMORE) { # put it on free list
         l1 = limbo
         l2 = buf(l1 + PREV)
         buf(l1 + PREV) = free
         free = l2
         }
      limbo = j1       # put what we just deleted in limbo
      limcnt = to - from + 1 # number of lines "deleted"
      call relink(j2, j1, j2, j1) # close the ring
      status = OK
      updflg = YES
      }
   delete = status
   return
   end



# docmd --- handle all commands except globals

   integer function docmd(lin, i, glob, status)
   character lin (MAXLINE)
   integer i, glob, status

   include "ed_com.r.i"

   integer gflag, line3, pflag, flag, junk, kname, allbut
   integer append, delete, doprnt, doread, dowrit, move, subst,
      domark, prntkn, getkn, doopt, ckchar, ckupd, getstr, makset,
      getrange, dotlit,ckp, defalt, getfn, getone, getrhs, nextln,
      optpat, prevln, doundo, copy, eval, join, doshell, getpstr

   character file(MAXLINE), sub(MAXPAT)

   logical intrpt, brkflag
   integer j, missing_delim

   pflag = NO      # may be set by d, m, s, u, y
   status = ERR
   if (intrpt(brkflag))
      ;
   else
   select (lin (i))
   when ('?'c) {
      if (lin(i + 1) == NEWLINE) {
         status = OK
         call printverboseerrormessage
         }
      }
   when (APPENDCOM, UCAPPENDCOM) {
      if (lin(i + 1) == NEWLINE)
         status = append(line2, glob)
      }
   when (OVERLAYCOM, UCOVERLAYCOM) {
      if (lin(i + 1) == NEWLINE
        && defalt(curln, curln, status) == OK)
         call extend(status)
         }
   when (CHANGE, UCCHANGE) {
      if (lin(i + 1) == NEWLINE
        && defalt(curln, curln, status) == OK
        && delete(line1, line2, status) == OK)
         status = append(prevln(line1), glob)
      }
   when (DELCOM, UCDELCOM) {
      if (ckp(lin, i + 1, pflag, status) == OK
        && defalt(curln, curln, status) == OK
        && delete(line1, line2, status) == OK
        && ddir == FORWARD
        && nextln(curln) ~= 0)
         curln = nextln(curln)
      }
   when (INSERT, UCINSERT) {
      if (lin(i + 1) == NEWLINE)
         status = append(prevln(line2), glob)
      }
   when (PRINTCUR) {
      if (ckp(lin, i + 1, pflag, status) == OK) {
         call putdec(line2, 1, Fdout)
         call putch(NEWLINE,Fdout)
         }
      }
   when (MOVECOM, UCMOVECOM) {
      i += 1
      if (getone(lin, i, line3, status) == EOF)
         status = ERR
      if (status == OK
        && ckp(lin, i, pflag, status) == OK
        && defalt(curln, curln, status) == OK)
         status = move(line3)
      }
   when (COPYCOM, UCCOPYCOM) {
      i += 1
      if (getone(lin, i, line3, status) == EOF)
         status = ERR
      if (status == OK
        && ckp(lin, i, pflag, status) == OK
        && defalt(curln, curln, status) == OK)
         status = copy (line3)
      }
   when (SUBSTITUTE, UCSUBSTITUTE) {
      i += 1
      if (lin (i) == NEWLINE) {
         lin (i + 0) = '/'c
         lin (i + 1) = '/'c
         lin (i + 2) = '&'c
         lin (i + 3) = '/'c
         lin (i + 4) = 'p'c
         lin (i + 5) = NEWLINE
         lin (i + 6) = EOS
         }
      else {   # try to handle "s/stuff<NEWLINE>"
         missing_delim = YES

         for (j = i + 1; lin (j) ~= EOS; j += 1)
            if (lin (j) == ESCAPE && lin (j + 1) == lin (i))
               j += 1   # skip esc, loop will skip char
            else if (lin (j) == lin (i)) {
               missing_delim = NO
               break # for
               }

         if (missing_delim == YES) {
            for (; lin (j) ~= EOS; j += 1)
               ;
            j -= 1   # j now at NEWLINE

            # now supply trailing delimiter
            lin (j) = lin (i)
            lin (j + 1) = NEWLINE
            lin (j + 2) = EOS
            # rest of routines will continue to fix it up
            }
         }

      if (optpat(lin, i) == OK
        && getrhs(lin, i, sub, gflag) == OK
        && ckp(lin, i + 1, pflag, status) == OK
        && defalt(curln, curln, status) == OK)
         status = subst(sub, gflag, glob)
      }
   when (TLITCOM, UCTLITCOM) {
      i += 1
      if (lin (i) == NEWLINE) {
         lin (i + 0) = '/'c
         lin (i + 1) = '/'c
         lin (i + 2) = '&'c
         lin (i + 3) = '/'c
         lin (i + 4) = 'p'c
         lin (i + 5) = NEWLINE
         lin (i + 6) = EOS
         }
      else {   # try to handle "t/stuff<NEWLINE>"
         missing_delim = YES

         for (j = i + 1; lin (j) ~= EOS; j += 1)
            if (lin (j) == ESCAPE && lin (j + 1) == lin (i))
               j += 1   # skip esc, loop will skip char
            else if (lin (j) == lin (i)) {
               missing_delim = NO
               break # for
               }

         if (missing_delim == YES) {
            for (; lin (j) ~= EOS; j += 1)
               ;
            j -= 1   # j now at NEWLINE

            # now supply trailing delimiter
            lin (j) = lin (i)
            lin (j + 1) = NEWLINE
            lin (j + 2) = EOS
            # rest of routines will continue to fix it up
            }
         }

      if (getrange (lin, i, tlpat, MAXPAT, allbut) == OK
      && makset (lin, i, sub, MAXPAT) == OK
      && ckp (lin, i + 1, pflag, status) == OK
      && defalt (curln, curln, status) == OK)
         status = dotlit (sub, allbut)
      }
   when (JOINCOM, UCJOINCOM) {
      i += 1
      if (getstr(lin, i, sub, MAXPAT) == OK
        && ckp(lin, i + 1, pflag, status) == OK
        && defalt(prevln(curln), curln, status) == OK)
         status = join(sub)
      }
   when (UNDOCMD, UCUNDOCMD) {
      i += 1
      junk = defalt(curln, curln, junk)
      if (ckchar(UCDELCOM, DELCOM, lin, i, flag, status) == OK
        && ckp(lin, i, pflag, status) == OK)
         status = doundo(flag, status)
      }
   when (ENTER, UCENTER) {
      i += 1
      if (nlines == 0
        && ckupd(lin, i, status) == OK)
         if (getfn(lin, i - 1, file) == OK) {
            call scopy(file, 1, savfil, 1)
            call clrbuf
            call setbuf
            status = doread(0, file)
            if (status == ERR)
               curln = 0
            else
               curln = 1
            updflg = NO
            }
         else
            status = ERR
      }
   when (PRINTFIL, UCPRINTFIL) {
      if (nlines == 0
        && getfn(lin, i, file) == OK) {
         call scopy(file, 1, savfil, 1)
         call putlin(savfil, Fdout)
         call putch(NEWLINE, Fdout)
         status = OK
         }
      }
   when (READCOM, UCREADCOM) {
      if (getfn(lin, i, file) == OK)
         status = doread(line2, file)
      }
   when (WRITECOM, UCWRITECOM) {
      i += 1
      if (ckchar ('+'c, '>'c, lin, i, flag, junk) == OK
        && getfn(lin, i - 1, file) == OK
        && defalt(1, lastln, status) == OK)
         status = dowrit(line1, line2, file, flag)
      }
   when (PRINT, UCPRINT) {
      if (lin(i + 1) == NEWLINE
        && defalt(curln, curln, status) == OK)
         status = doprnt(line1, line2)
      }
   when (PAGECOM) {
      if (lin (i + 1) == NEWLINE) {
         status = defalt (nextln (curln), lastln, status)
         if (nlines == 1)
            line2 = lastln
         if (status == OK) {
            status = doprnt (line1, min (line2, line1 + 22))
            }
         }
      }
   when (NAMECOM, UCNAMECOM) {
      if (lin(i + 1) == NEWLINE) {
         if (defalt(curln, curln, status) == OK)
            status = prntkn(line1, line2)
         }
      else { # uniquely name the line, rather than printing its name
        i += 1
        if (getkn(lin, i, kname, DEFAULTNAME) == OK
          && lin(i) == NEWLINE)
           call uniquely_name(kname, status)
        }
      }
   when (MARKCOM, UCMARKCOM) {
      i += 1
      if (getkn(lin, i, kname, DEFAULTNAME) == OK
        && lin(i) == NEWLINE
        && defalt(curln, curln, status) == OK)
         status = domark(kname)
      }
   when (NEWLINE) {
      status = OK
      if (nlines == 0)
#        if (nldef(1) == EOS) # this test only for speed
            line2 = nextln(curln)
#        else
#           line2 = eval(nldef, status)
      if (status == OK)
         status = doprnt(line2, line2)
      }
   when (LOCATECMD, UCLOCATECMD) {
      call whereami
      status = OK
      }
   when (OPTCOM, UCOPTCOM)
      status = doopt(lin,i)
   when (QUIT, UCQUIT) {
      i += 1
      if (nlines == 0
        && ckupd(lin, i, status) == OK)
         if (lin(i) == NEWLINE)
            status = EOF
         else
            status = ERR
      }
   when (SHELLCOM) {
      i += 1
      if (defalt (curln, curln, status) == OK)
         status = doshell (lin, i)
      }

   else # command not recognized
      errcode = EWHATZAT

   if (status == OK) {
      if (pflag == YES)
         status = doprnt(curln, curln)
      probation = NO
      }
   docmd = status
   return
   end



# doglob --- do command at lin(i) on all marked lines

   integer function doglob(lin, i, cursav, status)
   character lin(MAXLINE)
   integer i, cursav, status

   include "ed_com.r.i"

   integer istart, k, line
   integer docmd, getlst

   logical intrpt, brkflag

   status = OK
   istart = i
   k = line0
   line = 0
   repeat {
      line += 1
      k = buf(k + NEXT)
      if (buf(k+MARK) == YES) {
         buf(k+MARK) = NO
         curln = line
         cursav = curln
         i = istart
         if (getlst(lin, i, status) == OK)
           status = docmd(lin, i, YES, status)
         line = 0
         k = line0
         }
      if (intrpt(brkflag))
         status = ERR
      } until (line > lastln || status ~= OK)
   doglob = status
   return
   end



# domark --- name lines line1 through line2 kname

   integer function domark(kname)
   integer kname

   include "ed_com.r.i"

   integer k, line
   integer getind

   logical intrpt, brkflag

   if (line1 <= 0) {
      errcode = ELINE1
      domark = ERR
      }
   else {
      k = getind(line1)
      for (line = line1; line <= line2; line += 1) {
         buf(k + NAME) = kname
         if (intrpt(brkflag)) {
            domark = ERR
            return
            }
         k = buf(k + NEXT)
         }
      domark = OK
      }
   return
   end



# whereami --- print out machine location

   subroutine whereami
   integer fd, open, getlin, length
   integer i
   character place (MAXLINE)
   string unknown "unknown"

   include "ed_com.r.i"

   fd = open ("=installation="s, READ)
   if (fd == ERR)
      call scopy (unknown, 1, place, 1)
   else {
      i = getlin (place, fd, MAXLINE)
      if (i == ERR || i == EOF)
         call scopy (unknown, 1, place, 1)
      call close (fd)
      }
   i = length (place)
   if (place (i) == NEWLINE)
      place (i) = EOS

   call print (Fdout, "*s*n"s, place)

   return
   end



# doopt --- interpret option command

   integer function doopt(lin, i)
   character lin(ARB)
   integer i

   include "ed_com.r.i"

   integer j
   integer ctoi, eval, doprnt, getstr, getpstr

   i += 1
   doopt = ERR

   select (lin (i))

   when ('g'c, 'G'c) {
      i += 1
      if (lin (i) == NEWLINE) {
         doopt = OK
         globals = YES + NO - globals
         if (globals == YES)
            call remark ("failed global substitutes continue"p)
         else
            call remark ("failed global substitutes stop"p)
         }
      }

   when ('p'c, 'P'c) {
      i += 1
      if (lin(i) == NEWLINE) {
         if (prompt(1) == EOS) {
            prompt(1) = '*'c
            prompt(2) = ' 'c
            prompt(3) = EOS
            }
         else
            prompt(1) = EOS
         doopt = OK
         }
      else if (getpstr(lin, i, prompt, MAXLINE) == OK
         && lin(i + 1) == NEWLINE)
            doopt = OK
      }
#  when ('n'c, 'N'c) {
#     i += 1
#     for (j = 1; lin(i) != NEWLINE; i += 1) {
#        nldef(j) = lin(i)
#        j += 1
#        }
#     nldef(j) = EOS
#     line2 = eval(nldef, doopt)
#     if (doopt == OK)
#        doopt = doprnt(line2, line2)
#     }
   when ('k'c, 'K'c) {
      if (lin(i + 1) == NEWLINE) {
         doopt = OK
         if (updflg == YES)
            call remark("not saved"p)
         else
            call remark("saved"p)
         }
      }
   when ('d'c, 'D'c) {
      if (lin(i + 1) == NEWLINE) {
         if (ddir == FORWARD)
            call putch('>'c, Fdout)
         else
            call putch('<'c, Fdout)
         call putch(NEWLINE, Fdout)
         doopt = OK
         }
      else if (lin(i + 2) ~= NEWLINE)
         errcode = EODLSSGTR
      else if (lin(i + 1) == '>'c) {
         doopt = OK
         ddir = FORWARD
         }
      else if (lin(i + 1) == '<'c) {
         doopt = OK
         ddir = BACKWARD
         }
      else
         errcode = EODLSSGTR
      }
T  when ('t'c, 'T'c) {
T     if (lin(i + 1) == NEWLINE) {
T        doopt = OK
T        call putdec(tune, 0, Fdout)
T        call putch(NEWLINE, Fdout)
T        }
T     else {
T        i += 1
T        j = ctoi(lin, i)
T        if (lin(i) == NEWLINE) {
T           doopt = OK
T           tune = j
T           }
T        }
T     }
   else # doopt = ERR
      errcode = EOWHAT
   return
   end



# doprnt --- print lines from through to

   integer function doprnt(from, to)
   integer from, to

   include "ed_com.r.i"

   integer i, j
   integer getind

   logical intrpt, brkflag

   if (from <= 0) {
      doprnt = ERR
      errcode = ELINE1
      }
   else {
      j = getind(from)
      for (i = from; i <= to; i += 1) {
         call gtxt(j)
         call putlin(txt, Fdout)
         if (intrpt(brkflag)) {
            doprnt = ERR
            curln = i # for now, this is negated by edit
            return
            }
         j = buf(j + NEXT)
         }
      curln = to
      doprnt = OK
      }
   return
   end



# dologout --- save things when a LOGOUT$ happens

   subroutine dologout (cp)
   long_int cp    # condition pointer, not used

   integer junk, i, length
   character newfile (MAXLINE), arg_zero (MAXLINE)

   include "ed_com.r.i"

   call getarg (0, arg_zero, MAXLINE)
   for (i = length (arg_zero); i > 1; i -= 1)
      if (arg_zero (i) == '/'c) {
         i += 1
         break
         }

   call encode (newfile, MAXLINE, "=home=/*s.logout"s, arg_zero (i))

   call remark ("saving buffer because of pending logout"p)
   call dowrit (1, lastln, newfile, NO)

   call clrbuf

   call cnsig$ (junk)         # continue the signal

   return
   end



# doread --- read "file" after "line"

   integer function doread(line, file)
   character file (MAXLINE)
   integer line

   include "ed_com.r.i"

   character lin(MAXLINE)

   integer count, fd
   integer getlin, inject, open

   logical intrpt, brkflag

   fd = open(file, READ)
   if (fd == ERR) {
      doread = ERR
      errcode = ECANTREAD
      }
   else {
      curln = line
      doread = OK
      for (count = 0; getlin(lin, fd) ~= EOF; count += 1) {
         doread = inject(lin)
         if (doread == ERR)
            break
         else
            updflg = YES # not needed since inject sets it
         if (intrpt(brkflag)) {
            doread = ERR
            break
            }
         }
      call close(fd)
      call putdec(count, 1, Fdout)
      call putch(NEWLINE,Fdout)
      }
   return
   end



# doshell --- escape to the shell to run one or more SWT commands

#  emulate USG Unix 5.0 ed: a ! as the first character is
#  replaced by the previous shell command; an unescaped % is replaced
#  by the saved file name.  The expanded command is echoed.

   integer function doshell (lin, in_i)
   character lin (ARB)
   integer in_i

   include "ed_com.r.i"

   character c
   integer i, j, k
   integer interactive, expanded
   character new_command (MAXLINE)
   character sav_com (MAXLINE)
   integer return_code, shell, subsys

   data sav_com (1) /EOS/      # to make static

   expanded = NO

   if (nlines == 0) {   # use normal 'ed' behavior
      if (lin (in_i) == NEWLINE)
         interactive = YES
      else
         interactive = NO

      # build command, checking for leading !, and % anywhere
      if (lin (in_i) == '!'c) {
         if (sav_com (1) ~= EOS) {
            for (j = 1; sav_com (j) ~= EOS; j += 1)
               new_command (j) = sav_com (j)
            if (new_command (j-1) == NEWLINE)
               j -= 1
            in_i += 1
            expanded = YES
            }
         else {
            errcode = ENOCMD
            return (ERR)
            }
         }
      else
         j = 1

      for (i = in_i; lin (i) ~= EOS; i += 1) {
         if (lin (i) == ESCAPE) {
            if (lin (i+1) ~= '%'c) {
               new_command (j) = ESCAPE
               new_command (j+1) = lin (i+1)
               j += 2
               i += 1      # will be incremented again by for loop
               }
            else {
               i += 1
               new_command (j) = lin (i)
               j += 1
               }
            }
         else if (lin (i) == '%'c) {
            for (k = 1; savfil (k) ~= EOS; k += 1) {
               new_command (j) = savfil (k)
               j += 1
               }
            expanded = YES
            }
         else {
            new_command (j) = lin (i)
            j += 1
            }
         }

      if (new_command (j-1) == NEWLINE)
         j -= 1
      new_command (j) = EOS

      call scopy (new_command, 1, sav_com, 1)   # save it

      if (interactive == YES)    # no command line supplied
         return_code = shell (STDIN)
      else {
         if (expanded == YES)
            call print (STDOUT, "*s*n"s, new_command) # echo it
         return_code = subsys (new_command)
         }

      call print (STDOUT, "*c*n"s, SHELLCOM)

      if (return_code == ERR) { # OK and EOF are allright
        errcode = ENOSHELL
        return (ERR)
        }
      else
        return (OK)
      }
   else
      call remark ("Not implemented"p)

   return (OK)

   end




# dotlit --- transliterate characters

   integer function dotlit (sub, allbut)
   character sub (ARB)
   integer allbut

   include "ed_com.r.i"

   character new (MAXLINE)

   integer collap, x, i, j, line, lastsub, inx, kname, status
   integer length, xindex, inject, getind, gettxt

   logical brkflag, intrpt

   dotlit = ERR
   if (line1 <= 0) {
      errcode = ELINE1
      return
      }
   lastsub = length (sub)
   if (length (tlpat) > lastsub || allbut == YES)
      collap = YES
   else
      collap = NO
   for (line = line1; line <= line2; line += 1) {
      if (intrpt (brkflag)) {
         dotlit = ERR
         return
         }
      inx = gettxt (line)
      j = 1
      for (i = 1; txt (i) ~= EOS; i += 1) {
         x = xindex (tlpat, txt (i), allbut, lastsub)
         if (collap == YES && x >= lastsub && lastsub > 0) { # collapse
            new (j) = sub (lastsub)
            j += 1
            for (i += 1; txt (i) ~= EOS; i += 1) {
               x = xindex (tlpat, txt (i), allbut, lastsub)
               if (x < lastsub)
                  break
               }
            }
         if (txt (i) == EOS)
            break
         if (x > 0 && lastsub > 0) {   # tranlsiterate
            new (j) = sub (x)
            j += 1
            }
         else if (x == 0) {   # copy
            new (j) = txt (i)
            j += 1
            }
                              # else delete
         }
      new (j) = EOS
      kname = buf (inx + NAME)
      call delete (line, line, status)
      dotlit = inject (new)
      if (dotlit == ERR)
         break
      inx = getind (curln)
      buf (inx + NAME) = kname
      dotlit = OK
      updflg = YES  # not needed as delete and inject both set it
      }
   return
   end



# doundo --- restore last set of lines deleted

   integer function doundo (dflg, status)
   integer status, dflg

   include "ed_com.r.i"

   integer k1, k2, l1, l2, oldcnt
   integer nextln, getind

   status = ERR
   if (dflg == NO && line1 <= 0)
      errcode = ELINE1
   else if (limbo == NOMORE)
      errcode = ENOLIMBO
   else if (line1 > line2)
      errcode = EBACKWARD
   else if (line2 > lastln)
      errcode = ELINE2
   else {
      status = OK
      curln = line2
      k1 = getind(line2)
      k2 = getind(nextln(line2))
      l1 = limbo
      l2 = buf(l1 + PREV)
      call relink(k1, l1, l2, k2)
      call relink(l2, k2, k1, l1)
      oldcnt = limcnt
      limcnt = 0
      limbo = NOMORE
      lastln += oldcnt
      if (dflg == NO)
         call delete(line1, line2, status)
      curln += oldcnt
      }
   doundo = status
   return
   end



# dowrit --- write "from" through "to" into file

   integer function dowrit(from, to, file, aflag)
   integer from, to
   character file(MAXLINE)
   integer aflag # append to end of file

   include "ed_com.r.i"

   integer fd, k, line
   integer create, getind, open

   logical intrpt, brkflag

   if (aflag == YES)
      fd = open (file, READWRITE)
   else
      fd = create (file, WRITE)
   if (fd == ERR) {
      dowrit = ERR
      errcode = ECANTWRITE
      }
   else {
      dowrit = OK
      if (aflag == YES)
         call wind (fd)
      k = getind(from)
      for (line = from; line <= to; line += 1) {
         if (intrpt(brkflag)) {
            dowrit = ERR
            break
            } # else continue...
         call gtxt(k)
         call putlin(txt, fd)
         k = buf(k + NEXT)
         }
      call close(fd)
      call putdec(line - from, 1, Fdout)
      call putch(NEWLINE,Fdout)
      if (from == 1 && line - 1 == lastln) {
         call setlog(UNMAKE_LOG_FILE)
         call setlog(MAKE_LOG_FILE)
         updflg = NO
         }
      }
   return
   end



# eval --- evaluate line number expression

   integer function eval(str, status)
   character str(ARB)
   integer status

   include "ed_com.r.i"

   integer i
   integer getone, nextln

   i = 1
   if (str(1) == EOS) {
      status = OK
      eval = nextln(curln)
      }
   else if (getone(str, i, eval, status) == EOF)
      status = ERR
   return
   end



# extend --- let user type onto end of lines

   subroutine extend(status)
   integer status

   include "ed_com.r.i"

   character new(MAXLINE)

   integer lng, junk, lngnew
   integer getlin, gettxt, inject, length

   for (curln = line1; curln <= line2; curln += 1) {
      junk = gettxt(curln)
      lng = length(txt)
      txt(lng) = EOS       # Clobber the newline character
      call putlin(txt, Fdout)
      lngnew = getlin(new, Fdin)
      if (lngnew == EOF) {
         status = EOF
         return
         }
      if (new(1) == '.'c && new(2) == NEWLINE) {
         status = OK
         return
         }
      if (new(1) == NEWLINE)
         next
      status = ERR
      if (lng + lngnew >= MAXLINE) {
         errcode = E2LONG
         return
         }
      call scopy(new, 1, txt, lng)
      call delete(curln, curln, status)
      if (status == OK)
         status = inject(txt)
      if (status == ERR)
         return
      }
   curln = line2
   return
   end



# getfn --- get file name from lin(i)...

   integer function getfn(lin, i, file)
   character lin(MAXLINE), file(MAXLINE)
   integer i

   include "ed_com.r.i"

   integer j, k

   getfn = ERR
   if (lin(i + 1) == ' 'c) {
      j = i + 2      # get new file name
      call skipbl(lin, j)
      for (k = 1; lin(j) ~= NEWLINE; k += 1) {
         file(k) = lin(j)
         j += 1
         }
      file(k) = EOS
      if (k > 1)
         getfn = OK
      }
   else if (lin(i + 1) == NEWLINE && savfil(1) ~= EOS) {
      call scopy(savfil, 1, file, 1)   # or old name
      getfn = OK
      }
   else # error
      if (lin(i + 1) == NEWLINE)
         errcode = ENOFN
      else
         errcode = EFILEN
   if (getfn == OK & savfil(1) == EOS)
      call scopy(file, 1, savfil, 1)   # save if no old one
   return
   end



# getind --- locate line index in buffer

   integer function getind(line)
   integer line

   include "ed_com.r.i"

   integer j, k

   k = line0
   for (j = 0; j < line; j += 1)
      k = buf(k + NEXT)
   getind = k
   return
   end



# getkn --- get mark name from lin(i), increment i

   integer function getkn(lin, i, kname, dfltnm)
   character lin(ARB)
   integer i, kname, dfltnm

   if (lin(i) == NEWLINE || lin(i) == EOS)
      kname = dfltnm
   else {
      kname = lin(i)
      i += 1
      }
   getkn = OK
   return
   end



# getlst --- collect line numbers (if any) at lin(i), increment i

   integer function getlst(lin, i, status)
   character lin(MAXLINE)
   integer i, status

   include "ed_com.r.i"

   integer num
   integer getone, min

   line2 = 0
   for (nlines = 0; getone(lin, i, num, status) == OK; ) {
      line1 = line2
      line2 = num
      nlines += 1
      if (lin(i) ~= ','c && lin(i) ~= ';'c)
         break
      if (lin(i) == ';'c)
         curln = num
      i += 1
      }
   nlines = min(nlines, 2)
   if (nlines == 0)
      line2 = curln
   if (nlines <= 1)
      line1 = line2
   if (status ~= ERR)
      status = OK
   getlst = status
   return
   end



# getnum --- convert one term to line number

   integer function getnum(lin, i, pnum, status)
   character lin(MAXLINE)
   integer i, pnum, status

   include "ed_com.r.i"

   integer j
   integer missing_delim, k
   integer ctoi, optpat, ptscan, knscan, getkn

   getnum = OK
   SKIPBL (lin ,i)

   select (lin (i))
   when ('0'c, '1'c, '2'c, '3'c, '4'c, '5'c, '6'c, '7'c, '8'c, '9'c) {
      pnum = ctoi(lin, i)
      i -= 1      # move back; to be advanced at the end
      }
   when (CURLINE)
      pnum = curln
   when (LASTLINE)
      pnum = lastln
   when (PREVLINE, PREVLINE2)
      pnum = curln - 1
   when (SCAN, BACKSCAN) {
      missing_delim = YES

      # see if trailing delim supplied, since command can follow pattern
      for (k = i + 1; lin (k) ~= EOS; k += 1)
         if (lin (k) == ESCAPE && lin (k+1) == lin (i))
            k += 1   # will skip esc, loop will skip escaped char
         else if (lin (k) == lin (i)) {
            missing_delim = NO
            break
            }

      if (missing_delim == YES) {
         for (; lin (k) ~= EOS; k += 1)
            ;
         k -= 1   # k now at NEWLINE

         # supply trailing delimiter
         lin (k) = lin (i)
         lin (k + 1) = NEWLINE
         lin (k + 2) = EOS
         }

      if (optpat(lin, i) == ERR)   # build the pattern
         getnum = ERR
      else if (lin(i) == SCAN)
         getnum = ptscan(FORWARD, pnum)
      else
         getnum = ptscan(BACKWARD, pnum)
      }
   when (SEARCH, BACKSEARCH) {
      j = i
      i += 1
      if (getkn(lin, i, savknm, savknm) == ERR)
         getnum = ERR
      else if (lin(j) == SEARCH)
         getnum = knscan(FORWARD, pnum)
      else
         getnum = knscan(BACKWARD, pnum)
         i -= 1    # undone below
      }
   else
      getnum = EOF

   if (getnum == OK)
      i += 1      # point at next character to be examined
   status = getnum
   return
   end



# getone --- evaluate one line number expression

   integer function getone(lin, i, num, status)
   character lin(MAXLINE)
   integer i, num, status

   include "ed_com.r.i"

   integer istart, mul, pnum, porm
   integer getnum

   istart = i
   num = 0
   call skipbl(lin, i)
   if (getnum(lin, i, num, status) == OK)   # first term
      repeat {            # + or - terms
         porm = NO
         call skipbl(lin, i)
         if (lin(i) == '-'c) {
            mul = -1
            porm = YES
            i += 1
            }
         else {
            if (lin(i) == '+'c) {
               i += 1
               porm = YES
               }
            mul = +1
            }
         call skipbl(lin, i)
         if (getnum(lin, i, pnum, status) == OK) {
            num += mul * pnum
            }
         if (status == EOF
           && porm == YES)
              status = ERR
         } until (status ~= OK)
   if (num < 0 || num > lastln) {
      status = ERR
      errcode = EORANGE
      }
   if (status == ERR)
      getone = ERR
   else if (i <= istart)
      getone = EOF
   else
      getone = OK
   status = getone
   return
   end



# getpstr --- get string from lin at i, copy to dst, bump i

### this routine is a modified version of the original 'getstr', used
### for getting the prompt string for the 'op' command.

   integer function getpstr (lin, i, dst, maxdst)
   character lin (MAXLINE), dst (maxdst)
   integer i, maxdst

   include "ed_com.r.i"

   character delim
   character esc
   integer j, k, d

   j = i
   getpstr = ERR
   errcode = EBADSTR

   delim = lin (j)

   if (delim == NEWLINE) {
      lin (j) = '/'c
      lin (j + 1) = '/'c
      lin (j + 2) = NEWLINE
      lin (j + 3) = EOS
      delim = lin (j)
      # now fall thru

      # return  # old way
      }
   else if ((delim == 'p'c || delim == 'P'c) && lin (j + 1) == NEWLINE) { # jp
      lin (j) = '/'c
      lin (j + 1) = '/'c
      lin (j + 2) = delim    # 'p' or 'P'
      lin (j + 3) = NEWLINE
      lin (j + 4) = EOS
      delim = lin (j)
      # now fall thru
      }

   if (lin (j + 1) == NEWLINE) { # treat "j/" same as "j//"
      dst (1) = EOS
      errcode = ENOERR
      return (OK)

      # return    # old way
      }

   for (k = j + 1; lin (k) ~= NEWLINE; k += 1)
      ;  # find end

   k -= 1   # k points to char before newline

   if (lin (k) == 'p'c || lin (k) == 'P'c) {
      k -= 1
      if (lin (k) == delim &&
            (lin (k-1) ~= ESCAPE || lin (k-2) == ESCAPE))
         ;  # it's ok, leave it alone
      else {
         # ESCAPE delim p NEWLINE is the join string
         # supply  missing delim
         k += 2
         lin (k) = delim
         lin (k + 1) = NEWLINE
         lin (k + 2) = EOS
         }
      }
   else if (lin (k) ~= delim           # no delim, and no p
            || (lin (k-1) == ESCAPE    # or last char is escaped delim
               && lin (k - 2) ~= ESCAPE)) {
      # simply missing trailing delimiter
      # supply it
      k += 1
      lin (k) = delim
      lin (k + 1) = NEWLINE
      lin (k + 2) = EOS
      }
   # else
      # delim is there
      # leave well enough alone

   for (k = j + 1; lin (k) ~= delim; k += 1) {  # find end
      if (lin (k) == NEWLINE || lin (k) == EOS)
         if (delim == ' 'c)
            break
         else
            return
      call esc (lin, k)
      }

   if (k - j > maxdst)  # string is too long for dst
      return

   for ({d = 1; j += 1}; j < k; {d += 1; j += 1})
      dst (d) = esc (lin, j)
   dst (d) = EOS

   i = j
   errcode = EEGARB     # the default

   return (OK)

   end



# getrange --- get  from  range for tlit command

   integer function getrange (array, k, set, size, allbut)
   character array (ARB), set (ARB)
   integer k, size, allbut

   include "ed_com.r.i"

   integer i, j
   integer addset

   errcode = EBADLIST
   i = k + 1
   if (array (i) == '~'c) {
      allbut = YES
      i += 1
      }
   else
      allbut = NO
   j = 1
   getrange = ERR
   call filset (array (k), array, i, set, j, size)
   if (array (i) ~= array (k)) {
      set (1) = EOS
      return
      }
   if (set (1) == EOS) {
      errcode = ENOLIST
      return
      }
   if (j > 1 && addset (EOS, set, j, size) == NO) {
      set (1) = EOS
      return
      }
   k = i
   getrange = OK
   errcode = EEGARB
   return
   end



# getrhs --- get substitution string for "s" command

   integer function getrhs (lin, i, sub, gflag)
   character lin (MAXLINE), sub (MAXPAT)
   integer gflag, i

   include "ed_com.r.i"

   integer maksub
   integer j

   errcode = EBADSUB
   getrhs = ERR

   if (lin (i) == EOS)  # missing the middle delimiter
      return

   if (lin (i + 1) == '&'c && (lin (i + 2) == lin (i)
                               || lin (i + 2) == NEWLINE)) {
###
### s//&/ --- should mean do the same thing as I did last time
###           even if I deleted something. So we comment out these lines.
###
#     if (Subs (1) == EOS) {
#        Errcode = ENOSUB
#        return
#        }
#
      call ctoc (subs, sub, MAXPAT)
      i += 2
      if (lin (i) == NEWLINE) {
         # fix it up for pattern macthing routines
         lin (i) = lin (i - 2)
         lin (i + 1) = 'p'c
         lin (i + 2) = NEWLINE
         lin (i + 3) = EOS
         }
      }

   else {
      if (lin (i + 1) == NEWLINE) {
         # missing the trailing delimiter
         # pattern was empty
         lin (i + 1) = lin (i)   # supply trailing delmiter
         lin (i + 2) = 'p'c
         lin (i + 3) = NEWLINE
         lin (i + 4) = EOS
         # return (ERR)    # original action
         }
      else {      # stuff in pattern, check end of line
         for (j = i; lin (j) ~= EOS; j += 1)
            ;
         j -= 2   # j now points to char before NEWLINE

         if (lin (j) == 'p'c || lin (j) == 'P'c) {
            j -= 1
            if (lin (j) == GLOBAL || lin (j) == UCGLOBAL) {
               if (j > i + 1 && lin (j - 1) == lin (i) &&
                     (lin (j - 2) ~= ESCAPE || lin (j - 3) == ESCAPE))
                  ;  # leave alone
               else {
                  # @<delim>gp@n is the pattern
                  # supply trailing delim
                  j += 2   # j now at NEWLINE
                  lin (j) = lin (i)
                  lin (j + 1) = 'p'c
                  lin (j + 2) = NEWLINE
                  lin (j + 3) = EOS
                  }
               }
            else if (j > i + 1 && lin (j) == lin (i) &&
                  (lin (j-1) ~= ESCAPE || lin (j - 2) == ESCAPE))
               ;  # leave alone
            else {
               # @<delim>p@n is the pattern
               # supply trailing delim
               j += 2
               lin (j) = lin (i)
               lin (j + 1) = 'p'c
               lin (j + 2) = NEWLINE
               lin (j + 3) = EOS
               }
            }
         else if (lin (j) == GLOBAL || lin (j) == UCGLOBAL) {
            j -= 1
            if (j > i + 1 && lin (j) == lin (i) &&
                  (lin (j - 1) ~= ESCAPE || lin (j - 2) == ESCAPE))
               ; # leave alone
            else {
               # @<delim>g@n is the pattern
               # supply trailing deliim
               j += 2   # j now at NEWLINE
               lin (j) = lin (i)
               lin (j + 1) = 'p'c
               lin (j + 2) = NEWLINE
               lin (j + 3) = EOS
               }
            }
         else if (lin (j) ~= lin (i) ||
                  (lin (j) == lin (i) && lin (j-1) == ESCAPE &&
                  lin (j-2) ~= ESCAPE)) {
            # escaped delimiter, missing final one
            # or simply missing final delimiter
            # supply it
            j += 1
            lin (j) = lin (i)
            lin (j + 1) = 'p'c
            lin (j + 2) = NEWLINE
            lin (j + 3) = EOS
            }
         # else
            # delim is there, leave well enough alone
         }

      i = maksub (lin, i + 1, lin (i), sub)
      if (i == ERR)
         return

      call ctoc (sub, subs, MAXPAT) # save pattern for later
      }

   if (lin (i + 1) == GLOBAL || lin (i + 1) == UCGLOBAL) {
      i += 1
      gflag = YES
      }
   else
      gflag = NO

   errcode = EEGARB     # the default

   return (OK)

   end



# getstr --- get string from lin at i, copy to dst, bump i

### this routine called just for join.  It used to be called for the
### op command (setting the prompt).  Instead, that one calls a new
### routine 'getpstr', which is just this routine without the stuff
### to default to blank.

   integer function getstr (lin, i, dst, maxdst)
   character lin (MAXLINE), dst (maxdst)
   integer i, maxdst

   include "ed_com.r.i"

   character delim
   character esc
   integer j, k, d

   j = i
   getstr = ERR
   errcode = EBADSTR

   delim = lin (j)

   if (delim == NEWLINE) {
      lin (j) = '/'c
      lin (j + 1) = ' 'c     # join lines with a single blank
      lin (j + 2) = '/'c
      lin (j + 3) = 'p'c
      lin (j + 4) = NEWLINE
      lin (j + 5) = EOS
      delim = lin (j)
      # now fall thru

      # return  # old way
      }
   else if ((delim == 'p'c || delim == 'P'c) && lin (j + 1) == NEWLINE) { # jp
      lin (j) = '/'c
      lin (j + 1) = ' 'c     # join lines with a single blank
      lin (j + 2) = '/'c
      lin (j + 3) = delim    # 'p' or 'P'
      lin (j + 4) = NEWLINE
      lin (j + 5) = EOS
      delim = lin (j)
      # now fall thru
      }

   if (lin (j + 1) == NEWLINE) { # treat "j/" same as "j//"
      dst (1) = EOS
      errcode = ENOERR
      return (OK)

      # return    # old way
      }

   for (k = j + 1; lin (k) ~= NEWLINE; k += 1)
      ;  # find end

   k -= 1   # k points to char before newline

   if (lin (k) == 'p'c || lin (k) == 'P'c) {
      k -= 1
      if (lin (k) == delim &&
            (lin (k-1) ~= ESCAPE || lin (k-2) == ESCAPE))
         ;  # it's ok, leave it alone
      else {
         # ESCAPE delim p NEWLINE is the join string
         # supply  missing delim
         k += 2
         lin (k) = delim
         lin (k + 1) = 'p'c
         lin (k + 2) = NEWLINE
         lin (k + 3) = EOS
         }
      }
   else if (lin (k) ~= delim           # no delim, and no p
            || (lin (k-1) == ESCAPE    # or last char is escaped delim
               && lin (k-2) ~= ESCAPE)) {
      # simply missing trailing delimiter
      # supply it
      k += 1
      lin (k) = delim
      lin (k + 1) = 'p'c
      lin (k + 2) = NEWLINE
      lin (k + 3) = EOS
      }
   # else
      # delim is there
      # leave well enough alone

   for (k = j + 1; lin (k) ~= delim; k += 1) {  # find end
      if (lin (k) == NEWLINE || lin (k) == EOS)
         if (delim == ' 'c)
            break
         else
            return
      call esc (lin, k)
      }

   if (k - j > maxdst)  # string is too long for dst
      return

   for ({d = 1; j += 1}; j < k; {d += 1; j += 1})
      dst (d) = esc (lin, j)
   dst (d) = EOS

   i = j
   errcode = EEGARB     # the default

   return (OK)

   end



# gettxt --- locate text for line, copy to txt

   integer function gettxt(line)
   integer line

   integer k
   integer getind

   k = getind(line)
   call gtxt(k)
   gettxt = k
   return
   end



# join --- join a group of lines into a single line

   integer function join(sub)
   character sub (MAXPAT)

   include "ed_com.r.i"

   character new(MAXLINE)

   integer t, line, k
   integer inject, delete, getind

   logical intrpt, brkflag

   join = ERR
   if (line1 <= 0)
      errcode = ELINE1
   else {
      t = 1
      line = line1
      k = getind(line)
      repeat {
         if (intrpt(brkflag))
            return
         call gtxt(k)
         call catlin(txt, new, t, MAXLINE)
         if (line >= line2)
            break
         call catlin(sub, new, t, MAXLINE)
         line += 1
         k = buf(k + NEXT)
         } # forever
      if (t + 2 > MAXLINE)
         errcode = E2LONG
      else {
         new(t) = NEWLINE
         new(t + 1) = EOS
         join = delete(line1, line2, join)
         if (join == OK)
            join = inject(new)
         }
      }
   return
   end



# knscan --- scan for a line with given mark name

   integer function knscan(way, num)
   integer way, num

   include "ed_com.r.i"

   integer k
   integer getind

   logical intrpt, brkflag

   num = curln
   k = getind(num)
   repeat {
      call bump(num, k, way)
      if (buf(k + NAME) == savknm) {
         knscan = OK
         return
         }
      } until (num == curln || intrpt(brkflag))
   knscan = ERR
   if (errcode == EEGARB)
      errcode = EKNOTFND
   return
   end



# log --- write a line to the safety logfile

   subroutine log(stuff)
   character stuff(ARB)

   include "ed_com.r.i"

   call putlin(stuff, safety_logfile)

   return
   end



# makset --- make set from array (k) in set

   integer function makset (array, k, set, size)
   character array (ARB), set (ARB)
   integer k, size

   include "ed_com.r.i"

   integer i, j, l
   integer addset

   makset = ERR
   errcode = EBADLIST

   # try to allow missing delimiter for translit command

   if (array (k) == EOS)
      return

   if (array (k+1) == '&'c && (array (k+2) == array (k)
                                    || array (k+2) == NEWLINE)) {
      call ctoc (tset, set, MAXPAT)
      k += 2
      if (array (k) == NEWLINE) {
         # fix it up for the rest of the routines
         array (k) = array (k-2)
         array (k+1) = 'p'c
         array (k+2) = NEWLINE
         array (k+3) = EOS
         }
      }
   else {
      for (l = k; array (l) ~= EOS; l += 1)
         ;

      l -= 2      # l now points to char before NEWLINE

      if (l == k) {  # "t/.../NEWLINE"
         array (k + 1) = array (k)  # add delimiter
         array (k + 2) = 'p'c
         array (k + 3) = NEWLINE
         array (k + 4) = EOS
         }
      else if (array (l) == 'p'c || array (l) == 'P'c) {
         l -= 1
         if (l >= k + 1 && array (l) == array (k) &&
               (array (l - 1) ~= ESCAPE || array (l - 2) == ESCAPE))
            ;  # leave alone
         else {
            # ESCAPE <delim> p NEWLINE is the set
            # supply trailing delim
            l += 2
            array (l) = array (k)
            array (l + 1) = 'p'c
            array (l + 2) = NEWLINE
            array (l + 3) = EOS
            }
         }
      else if (array (l) ~= array (k)        # no delim, and no p
               || (array (l - 1) == ESCAPE   # or last char is escaped delim
                  && array (l - 2) ~= ESCAPE)) {
         # simply missing trailing delimiter
         # supply it
         l += 1
         array (l) = array (k)
         array (l + 1) = 'p'c
         array (l + 2) = NEWLINE
         array (l + 3) = EOS
         }
      # else
         # delim is there
         # leave well enough alon

      # end inserted code to kludge trailing delimiters

      j = 1
      i = k + 1
      call filset (array (k), array, i, set, j, size)

      if (array (i) ~= array (k))
         return

      if (addset (EOS, set, j, size) == NO)
         return

      call ctoc (set, tset, MAXPAT) # save for later

      k = i
      }

   errcode = EEGARB

   return (OK)

   end



# move --- move line1 through line2 after line3

   integer function move(line3)
   integer line3

   include "ed_com.r.i"

   integer k0, k1, k2, k3, k4, k5
   integer getind, nextln, prevln

   move = ERR
   if (line1 <= 0)
      errcode = ELINE1
   else if (line1 <= line3 & line3 <= line2)
      errcode = EINSIDEOUT
   else {
      k0 = getind(prevln(line1))
      k3 = getind(nextln(line2))
      k1 = getind(line1)
      k2 = getind(line2)
      call relink(k0, k3, k0, k3)
      if (line3 > line1) {
         curln = line3
         line3 -= line2 - line1 + 1
         }
      else
         curln = line3 + (line2 - line1 + 1)
      k4 = getind(line3)
      k5 = getind(nextln(line3))
      call relink(k4, k1, k2, k5)
      call relink(k2, k5, k4, k1)
      move = OK
      updflg = YES
      }
   return
   end



# nextln --- get line after "line"

   integer function nextln(line)
   integer line

   include "ed_com.r.i"

   nextln = line + 1
   if (nextln > lastln)
      nextln = 0
   return
   end



# optpat --- make pattern if specified at lin(i)

   integer function optpat(lin, i)
   character lin(MAXLINE)
   integer i

   include "ed_com.r.i"

   integer makpat

   if (lin(i) == EOS || lin (i + 1) == EOS)
      i = ERR
   else if (lin(i + 1) == lin(i))   # repeated delimiter
      i += 1            # leave existing pattern alone
   else
      i = makpat(lin, i + 1, lin(i), pat)
   if (pat(1) == EOS) {
      optpat = ERR
      errcode = ENOPAT
      }
   else if (i == ERR) {
      pat(1) = EOS
      optpat = ERR
      errcode = EBADPAT
      }
   else
      optpat = OK
   return
   end



# prevln --- get line before "line"

   integer function prevln(line)
   integer line

   include "ed_com.r.i"

   prevln = line - 1
   if (prevln < 0)
      prevln = lastln
   return
   end



# printverboseerrormessage --- print verbose error message

   subroutine printverboseerrormessage

   include "ed_com.r.i"

   select (saverrcode)
   when (EBACKWARD)
      call remark("Line numbers in backward order"p)
   when (ECANTINJECT)
      call remark("Can't inject new line!"p)
   when (EBADPAT)
      call remark("Bad syntax in pattern"p)
   when (EBADSTR)
      call remark("Bad syntax in string parameter"p)
   when (EBADSUB)
      call remark("Bad syntax in substitution string"p)
   when (ECANTREAD)
      call remark("Can't open file to read"p)
   when (ECANTWRITE)
      call remark("Can't open file to write"p)
   when (EEGARB)
      call remark("There seems to be garbage after your command"p)
   when (EFILEN)
      call remark("Bad syntax in file name"p)
   when (EGLOBA)
      call remark("You can't append in a global operation"p)
   when (EINSIDEOUT)
      call remark("I'm sure you don't want to move a group into itself"p)
   when (EKNOTFND)
      call remark("I can't find a line with that mark name"p)
   when (ELINE1)
      call remark("At end or beginning"p)
   when (E2LONG)
      call remark("Resulting line too long to handle"p)
   when (ENOMATCH)
      call remark("No match for pattern"p)
   when (ENOERR)
      call remark("No error to report"p)
   when (ENOLIMBO)
      call remark("No lines have been deleted since last undelete"p)
   when (EODLSSGTR)
      call remark("Expected '<', '>', or nothing after 'od'"p)
   when (EORANGE)
      call remark("Line number out of range (< 0 or > $)"p)
   when (EOWHAT)
      call remark("Can't recognize option after 'o'"p)
   when (EPNOTFND)
      call remark("No line matching that pattern could be found"p)
   when (ESTUPID)
      call remark("Changes have been made since last 'w' command"p)
   when (EWHATZAT)
      call remark("No command recognized"p)
   when (ELINE2)
      call remark("The last in your list of line numbers is > $"p)
   when (EBREAK)
      call remark("You interrupted me"p)
   when (ENOPAT)
      call remark("No saved pattern -- sorry"p)
   when (ENOLIST)
      call remark ("No saved character list -- sorry"p)
   when (ENOFN)
      call remark("No saved filename"p)
   when (EBADLIST)
      call remark("Bad syntax in character list"p)
   when (ENOSUB)
      call remark("No saved replacement --- sorry"p)
   when (ENOSHELL)
      call remark ("Shell returned ERR"p)
   when (ENOCMD)
      call remark ("No saved shell command -- sorry"p)
   else
      call remark("In printverboseerrormessage: can't happen"p)
   saverrcode = ENOERR
   return
   end



# prntkn --- print mark names of lines from through to

   integer function prntkn(from, to)
   integer from, to

   include "ed_com.r.i"

   integer i, j
   integer getind

   logical intrpt, brkflag

   if (from <= 0) {
      prntkn = ERR
      errcode = ELINE1
      }
   else {
      for (i = from; i <= to; i += 1) {
         if (intrpt(brkflag)) {
            prntkn = ERR
            return
            }
         j = getind(i)
         call putch(buf(j + NAME), Fdout)
         call putch(NEWLINE, Fdout)
         }
      curln = to
      prntkn = OK
      }
   return
   end



# ptscan --- scan for next occurrence of pattern

   integer function ptscan(way, num)
   integer way, num

   include "ed_com.r.i"

   integer k
   integer match, getind

   logical intrpt, brkflag

   num = curln
   k = getind(num)
   repeat {
      call bump(num, k, way)
      call gtxt(k)
      if (match(txt, pat) == YES) {
         ptscan = OK
         return
         }
      } until (num == curln || intrpt(brkflag))
   ptscan = ERR
   if (errcode == EEGARB)
      errcode = EPNOTFND
   return
   end



# relink --- rewrite two half links

   subroutine relink(a, x, y, b)
   integer a, b, x, y

   include "ed_com.r.i"

   buf(x + PREV) = a
   buf(y + NEXT) = b
   return
   end



# setlog --- initiate or terminate safety logfile

   subroutine setlog(action)
   integer action

   include "ed_com.r.i"

   integer junk
   integer create, remove

   string filename "=temp=/scriptxxxx"

   if (action == MAKE_LOG_FILE) {
      call date(SYS_PIDSTR, filename(14))
      safety_logfile = create(filename, WRITE)
      if (safety_logfile == ERR)
         call error("Cannot create safety logfile"p)
      if (savfil(1) ~= EOS) { # Log an 'e' command on the file
         call putch(ENTER, safety_logfile)
         call putch(' 'c, safety_logfile)
         call putlin(savfil, safety_logfile)
         call putch(NEWLINE, safety_logfile)
         }
      }
    else  {   # action is UNMAKE_LOG_FILE
      call close(safety_logfile)
      junk = remove(filename)
      }
   return
   end



# skipbl --- skip blanks and tabs at lin(i)...

   subroutine skipbl(lin, i)
   character lin(ARB)
   integer i

   while (lin(i) == ' 'c || lin(i) == TAB)
      i += 1
   return
   end



# subst --- substitute "sub" for occurrences of pattern

   integer function subst(sub, gflag, glob)
   character sub (MAXPAT)
   integer gflag, glob

   include "ed_com.r.i"

   character new(MAXLINE)

   integer j, junk, k, lastm, line, m, status, subbed, inx,
      kname, tagbeg (10), tagend (10)
   integer addset, amatch, gettxt, inject, getind

   logical intrpt, brkflag

   if (globals == YES && glob == YES)
      subst = OK
   else
      subst = ERR

   if (line1 <= 0) {
      errcode = ELINE1
      return
      }
   for (line = line1; line <= line2; line += 1) {
      if (intrpt(brkflag)) {
         subst = ERR
         return
         }
      j = 1
      subbed = NO
      inx = gettxt(line)
      lastm = 0
      for (k = 1; txt(k) ~= EOS; ) {
         do m = 2, 10; {
            tagbeg (m) = 0
            tagend (m) = 0
            }
         if (gflag == YES || subbed == NO)
            m = amatch(txt, k, pat, tagbeg (2), tagend (2))
         else
            m = 0
         if (m > 0 && lastm ~= m) {   # replace matched text
            tagbeg (1) = k
            tagend (1) = m
            subbed = YES
            call catsub(txt, tagbeg, tagend, sub, new, j, MAXLINE)
            lastm = m
            }
         if (m == 0 || m == k) {   # no match or null match
            junk = addset(txt(k), new, j, MAXLINE)
            k += 1
            }
         else            # skip matched text
            k = m
         }
      if (subbed == YES) {
         if (addset(EOS, new, j, MAXLINE) == NO) {
            subst = ERR
            errcode = E2LONG
            break
            }
         kname = buf (inx + NAME)
         call delete(line, line, status)   # remembers dot
         subst = inject(new)
         if (subst == ERR)
            break
         inx = getind(curln)
         buf(inx + NAME) = kname
         subst = OK
         updflg = YES # not needed as delete and inject both set it
         }
      else  # subbed equals NO
         errcode = ENOMATCH
      }
   return
   end



# uniquely_name --- mark-name line; make sure no other line named same

   subroutine uniquely_name(kname, status)
   integer kname, status

   include "ed_com.r.i"

   integer k, line
   integer defalt

   if (defalt(curln, curln, status) ~= OK)
      return
   if (line2 <= 0) {
      status = ERR
      errcode = ELINE1
      return
      }
   status = OK
   line = 0
   k = line0
   repeat {
      line += 1
      k = buf(k + NEXT)
      if (line == line2)
         buf(k + NAME) = kname
      else if (buf(k + NAME) == kname)
         buf(k + NAME) = DEFAULTNAME
      } until (line >= lastln)
   return
   end



# xindex --- invert condition returned by index

   integer function xindex (array, c, allbut, lastto)
   character array (ARB), c
   integer allbut, lastto

   integer index

   if (c == EOS)
      xindex = 0
   else if (allbut == NO)
      xindex = index (array, c)
   else if (index (array, c) > 0)
      xindex = 0
   else
      xindex = lastto + 1
   return
   end



###########################################################

# File primitives for ed - the Georgia Tech version of edit
#
#   note: gettxt is no longer considered a file primitive, and it
#      has been moved up to the editor proper.  Gettxt is now written
#      in terms of the new primitive gtxt, which uses an index, rather
#      than a line number.
#
#   This section includes gtxt, inject, and all the routines below them
#      in the calling hierarchy.

# definitions used only in this section:
include PRIMOS_KEYS     # for KNDAM, KPOSN, KPREA, KREAD, KWRIT
define(WRITTEN,2)
define(WORD,2)
define(RECNO,0)
define(RECLENG,880)
define(REC,1)
define(POOP,3)
define(NODESIZE,(RECLENG + 3))
define(MAXPRI,16000)
define(FENCEMARGIN,1000) # Must be several RECLENG's less than MAXBUF
define(BOGUSRECNO,-2)
# There are other definitions used only in this section,
# but they are of
# fields of line pointer nodes, and those have been kept together.



# gtxt --- (scratch file) locate text for index k, copy to txt

   subroutine gtxt(k)
   integer k

   include "ed_com.r.i"

   integer j

   call seekv(buf(k + SEEKADR))
   call readv(txt, buf(k + LENG))
   j = buf(k + LENG) + 1
   if (j > 1)
      txt(j - 1) = NEWLINE
   txt(j) = EOS
   return
   end



# inject --- (scratch file) insert lin after curln, write scratch

   integer function inject(lin)
   character lin(MAXLINE)

   include "ed_com.r.i"

   integer i, k1, k2, k3
   integer getind, maklin, nextln

   for (i = 1; lin(i) ~= EOS; ) {
      i = maklin(lin, i, k3)
      if (i == ERR) {
         inject = ERR
         errcode = ECANTINJECT
         break
         }
      k1 = getind(curln)
      k2 = getind(nextln(curln))
      call relink(k1, k3, k3, k2)
      call relink(k3, k2, k1, k3)
      curln += 1
      lastln += 1
      inject = OK
      }
   return
   end



# readf --- read raw text from scratch file

   subroutine readf(buffer, count, fd)
   integer buffer(ARB), count, fd

   integer junk, code
   integer mapfd

   call prwf$$ (KREAD, mapfd (fd), loc (buffer), count, intl (0),
      junk, code)
   if (code == 0)
      return
   call errpr$ (0, code, "fatal scratch file error", 24, "readf", 5)
   end



# writef --- write raw text onto scratch file

   subroutine writef(buffer, count, fd)
   integer buffer(ARB), count, fd

   integer junk, code
   integer mapfd

   call prwf$$ (KWRIT, mapfd (fd), loc (buffer), count, intl (0),
      junk, code)
   if (code == 0)
      return

   call errpr$ (0, code, "fatal scratch file error", 24, "writef", 6)
   end



# seek --- position file to offset

   subroutine seek(offset, fd)
   integer offset(2), fd

   include "ed_com.r.i"

   integer junk, code
   integer mapfd

   longint pos

   pos = intl (offset (1)) * intl (RECLENG) + intl (offset (2))
   call prwf$$ (KPOSN + KPREA, mapfd (fd), loc (0), 0, pos, junk, code)
   if (code == 0)
      return
   call errpr$ (0, code, "fatal scratch file error", 24, "seek", 4)
   end



# maklin --- (scratch file) make new line entry, copy text to scratch

   integer function maklin(lin, i, newind)
   character lin(MAXLINE)
   integer i, newind

   include "ed_com.r.i"

   integer j, k, junk, txtend
   integer addset, length, mkroom

   maklin = ERR
   if (free == NOMORE) {
      newind = lastbf
      while (lastbf + BUFENT > fence)
         if (mkroom(junk) == ERR)
            return # no room for new line entry
      lastbf = lastbf + BUFENT
      }
   else {
      newind = free
      free = buf(free + PREV)
      }
   txtend = 1
   for (j = i; lin(j) ~= EOS; ) {
      junk = addset(lin(j), txt, txtend, MAXLINE)
      j += 1
      if (lin(j - 1) == NEWLINE)
         break
      }
   if (addset(EOS, txt, txtend, MAXLINE) == NO)
      return
   call seekv(scrend)       # add line to end of virtual scratch file
   buf(newind + SEEKREC) = scrend(REC)
   buf(newind + SEEKWORD) = scrend(WORD)
   k = length(txt)
   buf(newind + LENG) = k
   call writev(txt, k)
   scrend(WORD) += k
   while (scrend(WORD) >= RECLENG) {
      scrend(WORD) -= RECLENG
      scrend(REC)  += 1
      }
   buf(newind + MARK) = NO
   buf(newind + NAME) = DEFAULTNAME
   updflg = YES
   maklin = j         # next character to be examined in lin
   return
   end



# setbuf --- create virtual scratch file, set up line 0

   subroutine setbuf

   include "ed_com.r.i"

   integer i, k, junk
   integer create, maklin

   string null ""
   string stemp "=temp=/edxxxx"

   call scopy(stemp, 1, scrfil, 1)
   call date(SYS_PIDSTR, scrfil(10))
   scr = create (scrfil, READWRITE + KNDAM)
   if (scr == ERR)
      call error("Can't open scratch file"p)
   scrend(REC) = 0
   scrend(WORD) = 0
   truend = 0
   for (i = MAXBUF + 1 - NODESIZE; i > FENCEMARGIN; i -= NODESIZE) {
      buf(i + RECNO) = BOGUSRECNO
      buf(i + WRITTEN) = YES
      fence = i
      }
   curbuf = fence
   robin = fence              # Arbitrary.
   line0 = 1 # to stay that way
   lastbf = line0
   free = NOMORE                 # make empty free list
   limbo = NOMORE
   limcnt = 0
   junk = maklin(null, 1, k)   # create empty line 0
   call relink(k, k, k, k)   # establish initial linked list
   buf(k + NAME) = EOS       # prevent mark name matches with line 0
   curln = 0              # .
   lastln = 0             # $
   return
   end



# clrbuf --- dispose of scratch file

   subroutine clrbuf

   include "ed_com.r.i"

   call close(scr)
   call remove(scrfil)
   return
   end



# idle --- do something useful while user ponders next move

   subroutine idle
   return
   end



# seekv --- seek in virtual scratch file

   subroutine seekv(addr)
   integer addr(2)

   include "ed_com.r.i"

   vaddr(REC) = addr(REC)
   vaddr(WORD) = addr(WORD)
   return
   end



# mkroom --- increase size of pointer buffer at expense of file buffer

   integer function mkroom(status)
   integer status

   include "ed_com.r.i"

   integer b

   if (tune > 0)
      call remark("(mkroom)"p)
   b = fence
   if (fence + NODESIZE > MAXBUF)
      status = ERR                   # no more room
   else {
      if (curbuf == fence)
         curbuf = MAXBUF + 1 - NODESIZE # arbitrary
      if (buf(fence + RECNO) <= truend && buf(fence + WRITTEN) == NO)
         call wout(fence)
      fence += NODESIZE
      if (buf(b + WRITTEN) == NO) {
         # This will occour iff buf(fence + RECNO) > truend.
         vaddr(WORD) = 0
         vaddr(REC) = buf(b + RECNO)
         call writev(buf(b + POOP), RECLENG)
         if (tune > 0)
            call remark("(shuffle)"p)
         }
      status = OK
      }
   mkroom = status
   return
   end



# wout --- write out buffer b to file, set WRITTEN

   subroutine wout(b)
   integer b

   include "ed_com.r.i"

   integer ix, addr(2)

   addr(REC) = buf(b + RECNO)
   addr(WORD) = 0
   call seek(addr, scr)
   ix = b + POOP
   call writef(buf(ix), RECLENG, scr)
T  call debug(b, "w"p)
   if (addr(REC) == truend)
      truend = addr(REC) + 1
   else if (addr(REC) > truend)
      call error("in wout: can't happen"p)
   # else leave truend alone
   buf(b + WRITTEN) = YES
   return
   end



# writev --- write virtual scratch file

   subroutine writev(ubuf, nwords)
   integer ubuf(ARB), nwords

   include "ed_com.r.i"

   integer p, t, tgt

   call findbf(tgt)
   for (p = 1; p <= nwords; p += 1) {
      t = vaddr(WORD) + tgt
      buf(t) = ubuf(p)
      vaddr(WORD) += 1
      if (vaddr(WORD) >= RECLENG) {
         buf(curbuf + WRITTEN) = NO
         vaddr(WORD) = 0
         vaddr(REC) += 1
         call findbf(tgt)
         }
      }
   buf(curbuf + WRITTEN) = NO
   return
   end



# readv --- read virtual scratch file

   subroutine readv(ubuf, nwords)
   integer ubuf(ARB), nwords

   include "ed_com.r.i"

   integer p, t, tgt

   call findbf(tgt)
   for (p = 1; p <= nwords; p += 1) {
      t = vaddr(WORD) + tgt
      ubuf(p) = buf(t)
      vaddr(WORD) += 1
      if (vaddr(WORD) >= RECLENG) {
         vaddr(WORD) = 0
         vaddr(REC) += 1
         call findbf(tgt)
         }
      }
   return
   end



# findbf --- "find" core buffer associated with vaddr(REC)
#          store its location in tgt

   subroutine findbf(tgt)
   integer tgt

   include "ed_com.r.i"

   integer b, addr(2), a, lasta

   data lasta/0/   # data statement forces static storage

   b = curbuf
   a = vaddr(REC)  # and stays that way
   if (buf(b + RECNO) == a && b >= fence) {
      tgt = b + POOP
      return
      }
   for (b = fence; b < MAXBUF; b += NODESIZE)
      if (buf(b + RECNO) == a) {
T        if (tune > 2)
T           call debug(b, "in mem"p)
         break
         }
   if (b > MAXBUF) { # search failed, is not in primary memory
      call decide(b)
      if (buf(b + RECNO) > a && a > lasta
        || buf(b + RECNO) < a && a < lasta)
         call decide(b)    # Just fishing for a better candidate
      lasta = a
T     if (tune >= 4)
T         call debug(b, "axed"p)
      if (buf(b + WRITTEN) == NO)
         call wout(b)
      buf(b + RECNO) = a
      if (buf(b + RECNO) < truend) { # needs to be read
         addr(REC) = buf(b + RECNO)
         addr(WORD) = 0
         call seek(addr, scr)
         call readf(buf(b + POOP), RECLENG, scr)
T        call debug(b, "r"p)
         }
T     else if (tune > 2)
T        call debug(b, "alloc"p)
      }
   tgt = b + POOP
   curbuf = b
   return
   end



# decide --- determine buffer to roll out; store its index in 'b'

   subroutine decide(b)
   integer b

   include "ed_com.r.i"

   repeat
      if (robin >= MAXBUF + 1 - NODESIZE)
         robin = fence
      else
         robin = robin + NODESIZE
      until (buf(robin + RECNO) <= truend ||
         buf(robin + WRITTEN) == YES)
   b = robin
   return
   end



# debug --- output debugging information about a buffer node

T  subroutine debug(node, message)
T  integer node, message(ARB)

T  include "ed_com.r.i"

T  if (tune < 2)
T     return
T  call putdec(node, 5, ERROUT)
T  call putdec(buf(node + RECNO), 4, ERROUT)
T  call putch(' 'c, ERROUT)
T  call remark(message)
T  return
T  end
# tune >= 0        no tuning output
# tune >= 1        (mkroom), (shuffle), etc.
# tune >= 2        scratch I/O
# tune >= 3        in memory
# tune >= 4        axings (de-allocating)



# intrpt --- see if there has been an interrupt from terminal

   logical function intrpt(arg)
   logical arg

   include "ed_com.r.i"

   logical tquit$

   intrpt = tquit$ (arg)
   if (intrpt) {
      errcode = EBREAK
      call wind(Fdin)
      }
   return
   end
