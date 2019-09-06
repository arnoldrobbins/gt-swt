define(docopy,1)     # labels
define(translit,2)
define(shellcom,3)

# docmd --- handle all commands except globals

   integer function docmd (lin, i, glob, status)
   character lin (ARB)
   integer i, glob, status

   include SE_COMMON

   character file (MAXLINE), sub (MAXPAT)
   integer gflag, line3, pflag, flag, fflag, junk, kname, allbut
   integer append, ckchar, ckp, ckupd, copy, delete, domark,
      doopt, doprnt, doread, dotlit, doundo, dowrit, getfn,
      getkn, getone, getrange, getrhs, getstr, join, makset,
      move, nextln, optpat, prevln, subst, draw_box, doshell
   logical intrpt, brkflag
   integer j, missing_delim

   status = ERR

   if (intrpt (brkflag))   # check for an interrupt
      ;

   else

      select (lin (i))
         when (APPENDCOM, UCAPPENDCOM) {
            if (lin (i + 1) == NEWLINE || lin (i + 1) == ':'c) {
               call defalt (Curln, Curln)
               if (lin (i + 1) == NEWLINE) { # avoid updating with inline insertion
                  call adjust_window (Line1, Line2)
                  call updscreen
                  }
               status = append (Line2, lin (i + 1))
               }
            }

         when (PRINTCUR) {
            if (lin (i + 1) == NEWLINE) {
               call defalt (Curln, Curln)
               call saynum (Line2)
               status = OK
               }
            }

         when (OVERLAYCOM, UCOVERLAYCOM) {
            call defalt (Curln, Curln)
            if (lin (i + 1) == NEWLINE)
               call overlay (status)
            }

         when (CHANGE, UCCHANGE) {
            call defalt (Curln, Curln)
            if (Line1 <= 0)
               Errcode = EORANGE
            elif (lin (i + 1) == NEWLINE || lin (i + 1) == ':'c) {
               if (lin (i + 1) == NEWLINE) { # avoid updating with inline insertion
                  call adjust_window (Line2, Line2)
                  call updscreen
                  }
               First_affected = min (First_affected, Line1)
               if (First_affected > Line1)
                  First_affected = Line1
               if (lin (i + 1) == NEWLINE)
                  call warn_deleted (Line1, Line2)
               status = append (Line2, lin (i + 1))
               if (status ~= ERR) {
                  line3 = Curln
                  call delete (Line1, Line2, status)
                  Curln = line3 - (Line2 - Line1 + 1) # adjust for deleted lines
                  }
               }
            }

         when (DELCOM, UCDELCOM) {
            if (ckp (lin, i + 1, pflag, status) == OK) {
               call defalt (Curln, Curln)
               if (delete (Line1, Line2, status) == OK
                     && Ddir == FORWARD
                     && nextln (Curln) ~= 0)
                  Curln = nextln (Curln)
               }
            }

         when (INSERT, UCINSERT) {
            call defalt (Curln, Curln)
            if (Line1 <= 0)
               Errcode = EORANGE
            elif (lin (i + 1) == NEWLINE || lin (i + 1) == ':'c) {
               if (lin (i + 1) == NEWLINE) { # avoid updating with inline insertion
                  call adjust_window (Line1, Line2)
                  call updscreen
                  }
               status = append (prevln (Line2), lin (i + 1))
               }
            }

         when (MOVECOM, UCMOVECOM) {
            i += 1
            if (getone (lin, i, line3, status) == EOF)
               status = ERR
            if (status == OK && ckp (lin, i, pflag, status) == OK) {
               call defalt (Curln, Curln)
               status = move (line3)
               }
            }

         when (COPYCOM, UCCOPYCOM) {
            if (Unix_mode == YES)
               goto translit        # UNIX uses 'y' for translit
            # else
               # fall through and act normally
      docopy _
            i += 1
            if (getone (lin, i, line3, status) == EOF)
               status = ERR
            if (status == OK && ckp (lin, i, pflag, status) == OK) {
               call defalt (Curln, Curln)
               status = copy (line3)
               }
            }

         when (SUBSTITUTE, UCSUBSTITUTE) {
            i += 1
            if (lin (i) == NEWLINE) {
               lin (i + 0) = '/'c
               lin (i + 1) = '/'c
               if (Unix_mode == NO)
                  lin (i + 2) = '&'c
               else
                  lin (i + 2) = '%'c
               lin (i + 3) = '/'c
               lin (i + 4) = NEWLINE
               lin (i + 5) = EOS
               Peekc = SKIP_RIGHT
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


                  # supply trialing delim
                  lin (j) = lin (i)
                  lin (j + 1) = NEWLINE
                  lin (j + 2) = EOS
                  Peekc = SKIP_RIGHT
                  # rest of the routines will continue to fix up
                  }
               }

            if (optpat (lin, i) == OK
                  && getrhs (lin, i, sub, gflag) == OK
                  && ckp (lin, i + 1, pflag, status) == OK) {
               call defalt (Curln, Curln)
               status = subst (sub, gflag, glob)
               }
            }

         when (TLITCOM, UCTLITCOM) {
            if (Unix_mode == YES)
               goto docopy       # UNIX uses 't' for copying
           # else
               # fall through and act normally
      translit _
            i += 1
            if (lin (i) == NEWLINE) {   # turn "y NEWLINE" into "y//&/<NEWLINE>"
               lin (i + 0) = '/'c
               lin (i + 1) = '/'c
               if (Unix_mode == NO)
                  lin (i + 2) = '&'c
               else
                  lin (i + 2) = '%'c
               lin (i + 3) = '/'c
               lin (i + 4) = NEWLINE
               lin (i + 5) = EOS
               Peekc = SKIP_RIGHT
               }
            else {   # try to handle "y/stuff<NEWLINE>"
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


                  # supply trialing delim
                  lin (j) = lin (i)
                  lin (j + 1) = NEWLINE
                  lin (j + 2) = EOS
                  Peekc = SKIP_RIGHT
                  # rest of the routines will continue to fix up
                  }
               }

            if (getrange (lin, i, Tlpat, MAXPAT, allbut) == OK
                  && makset (lin, i, sub, MAXPAT) == OK
                  && ckp (lin, i + 1, pflag, status) == OK) {
               call defalt (Curln, Curln)
               status = dotlit (sub, allbut)
               }
            }

         when (JOINCOM, UCJOINCOM) {
            i += 1
            if (getstr (lin, i, sub, MAXPAT) == OK
                  && ckp (lin, i + 1, pflag, status) == OK) {
               call defalt (prevln (Curln), Curln)
               status = join (sub)
               }
            }

         when (UNDOCMD, UCUNDOCMD) {
            i += 1
            call defalt (Curln, Curln)
            if (ckchar (UCDELCOM, DELCOM, lin, i, flag, status) == OK
                  && ckp (lin, i, pflag, status) == OK)
               status = doundo (flag, status)
            }

         when (ENTER, UCENTER) {
            i += 1
            if (Nlines ~= 0)
               Errcode = EBADLNR
            elif (ckupd (lin, i, ENTER, status) == OK)
               if (getfn (lin, i - 1, file) == OK) {
                  call scopy (file, 1, Savfil, 1)
                  call mesg (file, FILE_MSG)
                  call clrbuf
                  call setbuf
                  status = doread (0, file)
                  First_affected = 0
                  Curln = min (1, Lastln) # in case file was empty
                  Buffer_changed = NO
                  }
               else
                  status = ERR
            }

         when (PRINTFIL, UCPRINTFIL) {
            if (Nlines ~= 0)
               Errcode = EBADLNR
            elif (getfn (lin, i, file) == OK) {
               call scopy (file, 1, Savfil, 1)
               call mesg (file, FILE_MSG)
               status = OK
               }
            }

         when (READCOM, UCREADCOM) {
            if (getfn (lin, i, file) == OK) {
               call defalt (Curln, Curln)
               status = doread (Line2, file)
               }
            }

         when (WRITECOM, UCWRITECOM) {
            i += 1
            flag = NO
            fflag = NO
            call ckchar ('+'c, '>'c, lin, i, flag, junk)
            if (flag == NO)
               call ckchar ('!'c, '!'c, lin, i, fflag, junk)
            if (getfn (lin, i - 1, file) == OK) {
               call defalt (1, Lastln)
               status = dowrit (Line1, Line2, file, flag, fflag)
               }
            }

         when (PRINT, UCPRINT) {
            if (lin (i + 1) == NEWLINE) {
               call defalt (1, Topln)
               status = doprnt (Line1, Line2)
               }
            }

         when (PAGECOM) {
            call defalt (1, min (Lastln, Botrow - Toprow + Topln))
            if (Line1 <= 0)
               Errcode = EORANGE
            elif (lin (i + 1) == NEWLINE) {
               Topln = Line2
               Curln = Line2
               First_affected = Line2
               status = OK
               }
            }

         when (NAMECOM, UCNAMECOM) {
            i += 1
            if (getkn (lin, i, kname, DEFAULTNAME) ~= ERR
                  && lin (i) == NEWLINE)
               call uniquely_name (kname, status)
            }

         when (MARKCOM, UCMARKCOM) {
            i += 1
            if (getkn (lin, i, kname, DEFAULTNAME) ~= ERR
                  && lin (i) == NEWLINE) {
               call defalt (Curln, Curln)
               status = domark (kname)
               }
            }

         when (NEWLINE) {
            line3 = nextln (Curln)
            call defalt (line3, line3)
            status = doprnt (Line2, Line2)
            }

         when (LOCATECMD, UCLOCATECMD) {
            if (lin (i + 1) == NEWLINE) {
               call whereami
               status = OK
               }
            }

         when (OPTCOM, UCOPTCOM) {
            call defalt (Curln, Curln)
            status = doopt (lin, i)
            }

         when (QUIT, UCQUIT) {
            i += 1
            if (Nlines ~= 0)
               Errcode = EBADLNR
            elif (ckupd (lin, i, QUIT, status) == OK)
               if (lin (i) == NEWLINE)
                  status = EOF
               else
                  status = ERR
            }

         when (HELP, UCHELP) {
            i += 1
            if (Nlines == 0)
               call dohelp (lin, i, status)
            else
               Errcode = EBADLNR
            }

         when (MISCCOM, UCMISCCOM) {
            i += 1
            select (lin (i))
               when ('b'c, 'B'c) {
                  call defalt (Curln, Curln)
                  i += 1
                  status = draw_box (lin, i)
                  }
            else
               Errcode = EWHATZAT
            }

         when (SHELLCOM) {
            if (Unix_mode == YES)
               call error ("in docmd: can't happen"p)
         shellcom _
            i += 1
            call defalt (Curln, Curln)
            status = doshell (lin, i)
            }

         when ('!'c) {
            if (Unix_mode == YES)
               goto shellcom
            else
               Errcode = EWHATZAT
            }

      else     # command not recognized
         Errcode = EWHATZAT

   if (status == OK)
      Probation = NO

   return (status)

   end
