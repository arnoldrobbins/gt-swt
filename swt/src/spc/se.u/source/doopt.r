define(no_unix,1)    # labels
define(yes_unix,2)

# doopt --- interpret option command (modified for screen editor)

   integer function doopt (lin, i)
   character lin (ARB)
   integer i

   include SE_COMMON

   integer temp, line, stat, df
   integer ctoi, getnum, settab, dosopt, send_mesg
   integer delete, ckchar
   character tempstr (4), name (MAXLINE)

   i = i + 1
   doopt = ERR

   select (lin (i))

      when ('g'c, 'G'c) {
         if (lin (i + 1) == NEWLINE) {
            doopt = OK
            Globals = YES + NO - Globals
            if (Globals == YES)
               call remark ("failed global substitutes continue"p)
            else
               call remark ("failed global substitutes stop"p)
            }
         }

      when ('k'c, 'K'c) {
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i + 1) == NEWLINE) {
            doopt = OK
            if (Buffer_changed == YES)
               call remark ("not saved"p)
            else
               call remark ("saved"p)
            }
         }

      when ('m'c, 'M'c) {
         i += 1
         if (lin (i) == NEWLINE) {
            if (Nlines ~= 0)
               Errcode = EBADLNR
            else {
               call recv_mesg
               doopt = OK
               }
            }
         else if (ckchar (UCDELCOM, DELCOM, lin, i, df, temp) == OK
               && lin (i) == ' 'c) {
            call getwrd (lin, i, name, MAXLINE)
            if (lin (i) == NEWLINE) {
               doopt = send_mesg (name, Line1, Line2)
               if (doopt == OK && df == NO)
                  doopt = delete (Line1, Line2, temp)
               }
            }
         }

      when ('p'c, 'P'c) {
         doopt = OK
         select (lin (i+1))

            when (NEWLINE, EOS)     # toggle
               if (Unix_mode == YES)
                  goto no_unix
               else
                  goto yes_unix

            when ('s'c, 'S'c) {
         no_unix  Unix_mode = NO
               BACKSCAN = '\'c
               NOTINCCL = '~'c
               XMARK = '!'c
               ESCAPE = '@'c
               }

            when ('u'c, 'U'c) {
         yes_unix Unix_mode = YES
               BACKSCAN = '?'c
               NOTINCCL = '^'c
               XMARK = '~'c
               ESCAPE = '\'c
               }

            ifany {
               call setpat (Unix_mode)
               if (Unix_mode == YES)
                  call mesg ("UNIX"s, MODE_MSG)
               else
                  call mesg (""s, MODE_MSG)
               }

            else {
               Errcode = EOWHAT
               doopt = ERR
               }
         }

      when ('t'c, 'T'c) {
         i += 1
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i) == NEWLINE) {
            call mesg (Tabstr, REMARK_MSG)
            doopt = OK
            }
         else {
            doopt = settab (lin (i))
            if (doopt == OK)
               call scopy (lin, i, Tabstr, 1)
            else  # defaults were set
               call scopy ("+3"s, 1, Tabstr, 1)
            }
         }

      when ('w'c, 'W'c) {
         i += 1
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i) == NEWLINE) {
            call saynum (Warncol)
            doopt = OK
            }
         else {
            temp = ctoi (lin, i)
            if (lin (i) == NEWLINE)
               if (temp > 0 && temp < MAXLINE - 3) {
                  doopt = OK
                  Warncol = temp
                  }
               else
                  Errcode = ENONSENSE
            }
         }

      when ('h'c, 'H'c) {
         i += 1
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i) == NEWLINE) {
            call saynum (Tspeed)
            doopt = OK
            }
         else {
            temp = ctoi (lin, i)
            if (lin (i) == NEWLINE)
               if (temp >= 50 && temp <= 19200) {
                  doopt = OK
                  Tspeed = temp
                  }
               else
                  Errcode = ENONSENSE
            }
         }

      when ('-'c) {
         i += 1
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (getnum (lin, i, line, stat) == EOF) {
            call mesg (""s, HELP_MSG)
            if (Toprow > 1) {
               Topln = max (1, Topln - (Toprow - 1))
               Toprow = 1
               First_affected = Topln
               }
            doopt = OK
            }
         elif (stat ~= ERR && lin (i) == NEWLINE)
            if (Toprow + (line - Topln + 1) < Cmdrow
                  && line - Topln + 1 >= 1) {
               Toprow += line - Topln + 1
               Topln = line + 1
               do temp = 1, Ncols
                  call load ('-'c, Toprow - 1, temp)
               if (Topln > Lastln)
                  call adjust_window (1, Lastln)
               if (Curln < Topln)
                  Curln = min (Topln, Lastln)
               doopt = OK
               }
            else
               Errcode = EORANGE
         }

      when ('a'c, 'A'c) {
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i + 1) == NEWLINE) {
            Absnos = YES + NO - Absnos
            doopt = OK
            }
         }

      when ('c'c, 'C'c) {
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i + 1) == NEWLINE) {
            doopt = OK
            Invert_case = YES + NO - Invert_case
            if (Rel_a == 'A'c) {
               Rel_a = 'a'c
               Rel_z = 'z'c
               }
            else {
               Rel_a = 'A'c
               Rel_z = 'Z'c
               }
            }
         }

      when ('d'c, 'D'c) {
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i + 1) == NEWLINE) {
            if (Ddir == FORWARD)
               call remark (">"p)
            else
               call remark ("<"p)
            doopt = OK
            }
         elif (lin (i + 2) ~= NEWLINE)
            Errcode = EODLSSGTR
         elif (lin (i + 1) == '>'c) {
            doopt = OK
            Ddir = FORWARD
            }
         elif (lin (i + 1) == '<'c) {
            doopt = OK
            Ddir = BACKWARD
            }
         else
            Errcode = EODLSSGTR
         }

      when ('v'c, 'V'c) {
         i += 1
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i) == NEWLINE) {
            if (Overlay_col == 0)
               call remark ("$"p)
            else
               call saynum (Overlay_col)
            doopt = OK
            }
         else {
            if (lin (i) == '$'c && lin (i + 1) == NEWLINE) {
               Overlay_col = 0
               doopt = OK
               }
            else {
               temp = ctoi (lin, i)
               if (lin (i) == NEWLINE)
                  if (temp > 0 && temp < MAXLINE) {
                     Overlay_col = temp
                     doopt = OK
                     }
                  else
                     Errcode = ENONSENSE
               }
            }
         }

      when ('u'c, 'U'c) {
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i + 1) == NEWLINE) {
            doopt = OK
            tempstr (1) = '"'c
            tempstr (2) = Unprintable
            tempstr (3) = '"'c
            tempstr (4) = EOS
            call mesg (tempstr, REMARK_MSG)
            }
         elif (lin (i + 2) == NEWLINE) {
            if (lin (i + 1) < ' 'c || lin (i + 1) >= DEL)
               Errcode = ENONSENSE
            else {
               doopt = OK
               if (Unprintable ~= lin (i + 1)) {
                  Unprintable = lin (i + 1)
                  First_affected = Topln
                  }
               }
            }
         }

      when ('l'c, 'L'c) {
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i + 1) == NEWLINE) {
            Nchoise = EOS
            doopt = OK
            }
         elif (lin (i + 2) == NEWLINE &&
               (lin (i + 1) == CURLINE || lin (i + 1) == LASTLINE ||
                  lin (i + 1) == TOPLINE)) {
            Nchoise = lin (i + 1)
            doopt = OK
            }
         elif (lin (i + 1) == 'm'c || lin (i + 1) == 'M'c) {
            i += 1
            if (lin (i + 1) == NEWLINE) {
               call saynum (Firstcol)
               doopt = OK
               }
            else {
               i += 1
               temp = ctoi (lin, i)
               if (lin (i) == NEWLINE)
                  if (temp > 0 && temp < MAXLINE) {
                     First_affected = Topln
                     Firstcol = temp
                     doopt = OK
                     }
                  else
                     Errcode = ENONSENSE
               }
            }
         }

      when ('f'c, 'F'c) {
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else if (lin (i + 1) == NEWLINE) {
            doopt = OK                    # Fortran option package
            Rel_a = 'a'c
            Rel_z = 'z'c
            Invert_case = YES
            call scopy ("7+3"s, 1, Tabstr, 1)
            call settab (Tabstr)
            Warncol = 72
            }
         }

#     when ('y'c, 'Y'c)
#        doopt = chttyp (lin (i + 1))

      when ('s'c, 'S'c) {
         if (Nlines ~= 0)
            Errcode = EBADLNR
         else
            doopt = dosopt (lin (i + 1))
         }

      when ('i'c, 'I'c) {     # indent
         i += 1
         if (lin (i) == NEWLINE)
            doopt = OK
         else if ((lin (i) == 'a'c || lin (i) == 'A'c) && lin (i + 1) == NEWLINE) {
            Indent = 0
            doopt = OK
            }
         else {
            temp = ctoi (lin, i)
            if (lin (i) == NEWLINE || lin (i) == EOS)
               if (temp > 0 && temp < MAXLINE - 2) {
                  doopt = OK
                  Indent = temp
                  }
               else
                  Errcode = ENONSENSE
            }
         if (doopt == OK)
            if (Indent > 0)
               call saynum (Indent)
            else
               call remark ("auto"p)
         }

   else  # doopt is ERR
      Errcode = EOWHAT

   if (Invert_case == YES)
      call mesg ("CASE"s, CASE_MSG)
   else
      call mesg (EOS, CASE_MSG)

   return
   end
