# page --- display a file on a CRT terminal one page at a time.

define (BOUND(v,l,h),min0(max0(v,l),h))

define (BREAKLN,1)      # Line number for processing QUIT$
define (MAXLNPP,64)     # Maximum number of lines per page
define (MAXPAGE,10000)  # Maximum number of pages
define (MSCREEN,86)     # Maximum screen width + 1

define (FORWARD,0)      # Key to search forward
define (BACKWARD,1)     # Key to search backward

   integer function page (fdin, promptin, epromptin, linesin, fdout, options)

   character promptin (ARB), epromptin (ARB)
   file_des fdin, fdout
   integer linesin, options

   external pg$brk
   file_des open
   file_mark markf
   integer isatty, vtinit, vtprt, vtgetl, getlin, ctoi, makpat,
           match, scopy
   logical missin

   character term (MAXTERMTYPE), screen (MSCREEN, MAXLNPP),
             input (MAXLINE), line (MAXLINE), temp (MAXLINE),
             prompt (MAXLINE), eprompt (MAXLINE),
             message (MAXLINE), emessage (MAXLINE)
   file_mark pages (MAXPAGE)
   integer vthrc (2), tempat (MAXPAT), pattern (MAXPAT)
   integer label (4)

   file_des ifd, ofd, tifd, tofd
   integer pg, last, index, lines, columns, size, first, start,
           begin, clear, i, j, k, l, m, missing_delim
   logical pause, vthout, error, noread, nopat, found

   string_table help_index, help_source,
         "The following commands (upper or lower case) are available:" _
      /  "      D <int>       Display <int> continuous pages" _
      /  "      E <path>      Begin examining the file named <path>" _
      /  "      E             Begin examining the original file" _
      /  "      H or ?        Display this command summary" _
      /  "      M <int>       Change left margin of display" _
      /  "      N             Stop paging, normal status" _
      /  "      P or ^        Display the previous page" _
      /  '      Q             Same as "N"' _
      /  "      S <int>       Change page size to <int>" _
      /  "      W <path>      Write a copy of the file into <path>" _
      /  "      X             Stop paging, EOF status" _
      /  "      Y or :        Go to the next page" _
      /  '      <ctrl-c>      Same as "X", does not work with vth' _
      /  '      <return>      Same as "Y"' _
      /  "      <int>         Display page <int>" _
      /  "      - <int>       Display current page - <int>" _
      /  "      .             Redisplay the current page" _
      /  "      + <int>       Display current page + <int>" _
      /  "      $             Display the last page" _
      /  "      /<pat>[/]     Display next page containing <pat>" _
      /  "      \<pat>[\]     Display previous page containing <pat>"

include SWT_COMMON

   procedure read_page (num) forward
   procedure display_page forward
   procedure find_page (direction) forward
   procedure exit (val) forward

   ifd = fdin
   ofd = fdout

   if (isatty (ofd) == NO) {
      call fcopy (ifd, ofd)

      return (OK)
      }

   call ctoc (promptin, prompt, MAXLINE)
   call ctoc (epromptin, eprompt, MAXLINE)

   if (missin (options)) {
      pause = TRUE
      vthout = FALSE
      }
   else {
      pause = and (options, PG_END) == 0
      vthout = and (options, PG_VTH) ~= 0
      }

   call break$ (DISABLE)

   do i = 1, 4
      label (i) = Rtlabel (i)
   call mklb$f ($ BREAKLN, Rtlabel)
   call mkon$f ("QUIT$", 5, pg$brk)

   if (vthout) {
      vthout = vtinit (term) == OK

      if (vthout) {
         call vtinfo (VT_MAXRC, vthrc)
         lines = vthrc (1) - 1
         columns = vthrc (2)

         call vtupd (YES)
         }
      }

   if (~vthout) {
      lines = BOUND (linesin, 1, MAXLNPP)
      columns = 80
      }

   pg = 0
   last = MAXPAGE - 1

   size = 0
   index = 0
   first = 1

   pages (1) = intl (0)
   do i = 2, MAXPAGE
      pages (i) = intl (-1)

   input (1) = EOS
   line (1) = EOS

   error = FALSE

   read_page (1)
   noread = TRUE

   nopat = TRUE

   call break$ (ENABLE)

   repeat {
      if (error) {
         error = FALSE
         clear = NO

         if (pg ~= last)
            if (vthout) {
               start = 1 + vtprt (vthrc (1), 1, message, pg)
               begin = start + vtprt (vthrc (1), start, "*s"s, input) + 1
               }
            else
               call print (TTY, message, pg)
         else
            if (vthout) {
               start = 1 + vtprt (vthrc (1), 1, emessage, pg)
               begin = start + vtprt (vthrc (1), start, "*s"s, input) + 1
               }
            else
               call print (TTY, emessage, pg)
         }
      else {
         clear = YES

         if (noread)
            noread = FALSE
         else
            read_page (pg + 1)

         display_page

         if (pg == last) {
            if (index == 0 || ifd == fdin && ~pause) {
               if (ifd ~= fdin)
                  call close (ifd)

               exit (OK)
               }

            if (vthout) {
               start = 1 + vtprt (vthrc (1), 1, eprompt, pg)
               begin = start
               }
            else
               call print (TTY, eprompt, pg)
            }
         else
            if (vthout) {
               start = 1 + vtprt (vthrc (1), 1, prompt, pg)
               begin = start
               }
            else
               call print (TTY, prompt, pg)
         }

      input (1) = EOS

      if (vthout) {
         call vtenb (vthrc (1), start, vthrc (2) - start + 1)
         call vtread (vthrc (1), begin, clear)
         call vtenb (vthrc (1), start, 0)

         size = vtgetl (input, vthrc (1), start, vthrc (2) - start + 1)

         call vtclr (vthrc (1), 1, vthrc (1), vthrc (2))
         call vtupd (NO)
         }
      else {
         size = getlin (input, TTY)

         if (size == EOF) {
            call putch (NEWLINE, TTY)

            if (ifd ~= fdin)
               call close (ifd)

            exit (EOF)
            }

         if (input (size) == NEWLINE)
            input (size) = EOS
         }

      call strim (input)

      i = 1
      SKIPBL (input, i)

      select (input (i))
         when ("d"c, "D"c) {
            i += 1
            j = BOUND (ctoi (input, i), 1, MAXPAGE - pg - 1)

            for (k = 1; k < j && pg ~= last; k += 1) {
               read_page (pg + 1)

               if (pg ~= last) {
                  display_page

                  if (vthout)
                     call vtupd (NO)
                  }
               }

            if (pg == last)
               noread = TRUE
            }

         when ("e"c, "E"c) {
            i += 1
            SKIPBL (input, i)

            if (input (i) ~= EOS) {
               tifd = open (input (i), READ)

               if (tifd ~= ERR) {
                  if (ifd ~= fdin)
                     call close (ifd)

                  ifd = tifd

                  for (j = 1; input (i) ~= EOS; i += 1)
                     if (j < MAXLINE - 1) {
                        line (j) = input (i)
                        if (line (j) == '*'c) {
                           line (j + 1) = '*'c
                           j += 1
                           }
                        j += 1
                        }
                  line (j) = EOS
                  call encode (prompt, MAXLINE, "*s [**i+]? "s, line)
                  call encode (eprompt, MAXLINE, "*s [**i$]? "s, line)
                  }
               else {
                  call encode (message, MAXLINE, "*s: can't open [**i+]? "s,
                     input (i))
                  call encode (emessage, MAXLINE, "*s: can't open [**i$]? "s,
                     input (i))

                  error = TRUE
                  }
               }
            else {
               if (ifd ~= fdin)
                  call close (ifd)

               ifd = fdin

               call ctoc (promptin, prompt, MAXLINE)
               call ctoc (epromptin, eprompt, MAXLINE)
               }

            if (~error) {
               last = MAXPAGE - 1

               do j = 2, MAXPAGE
                  pages (j) = intl (-1)

               read_page (1)
               noread = TRUE
               }
            }

         when ("h"c, "H"c, "?"c) {
            if (vthout)
               call vtclr (1, 1, lines, vthrc (2))

            for (i = 1; i <= help_index (1); i += 1)
               if (vthout)
                  call vtputl (help_source (help_index (i + 1)), i, 1)
               else
                  call print (ofd, "*s*n"s, help_source (help_index (i + 1)))

            input (1) = EOS

            call ctoc (prompt, message, MAXLINE)
            call ctoc (eprompt, emessage, MAXLINE)

            error = TRUE
            }

         when ("m"c, "M"c) {
            i += 1
            first = max0 (ctoi (input, i), 1)

            read_page (pg)
            noread = TRUE
            }

         when ("n"c, "N"c, "q"c, "Q"c) {
            if (ifd ~= fdin)
               call close (ifd)

            exit (OK)
            }

         when ("p"c, "P"c, "^"c) {
            read_page (pg - 1)
            noread = TRUE
            }

         when ("s"c, "S"c) {
            if (~vthout) {
               i += 1
               lines = BOUND (ctoi (input, i), 1, MAXLNPP)

               do j = 2, MAXPAGE
                  pages (j) = intl (-1)

               read_page (1)
               }

            noread = TRUE
            }

         when ("w"c, "W"c) {
            i += 1
            SKIPBL (input, i)

            if (input (i) ~= EOS) {
               tofd = open (input (i), READ)

               if (tofd == ERR) {
                  tofd = open (input (i), WRITE)

                  if (tofd ~= ERR) {
                     call seekf (pages (1), ifd)
                     call fcopy (ifd, tofd)
                     call seekf (pages (pg + 1), ifd)
                     call close (tofd)

                     input (1) = EOS

                     call ctoc (prompt, message, MAXLINE)
                     call ctoc (eprompt, emessage, MAXLINE)

                     error = TRUE
                     }
                  else {
                     call encode (message, MAXLINE, "*s: can't open [**i+]? "s,
                        input (i))
                     call encode (emessage, MAXLINE, "*s: can't open [**i$]? "s,
                        input (i))

                     error = TRUE
                     }
                  }
               else {
                  call close (tofd)

                  call ctoc ("File already exists [*i+]? "s, message, MAXLINE)
                  call ctoc ("File already exists [*i$]? "s, emessage, MAXLINE)

                  error = TRUE
                  }
               }
            else {
               call ctoc ("Path name missing [*i+]? "s, message, MAXLINE)
               call ctoc ("Path name missing [*i$]? "s, emessage, MAXLINE)

               error = TRUE
               }
            }

         when ("x"c, "X"c) {
            if (ifd ~= fdin)
               call close (ifd)

            exit (EOF)
            }

         when ("y"c, "Y"c, ":"c, EOS)
            if (pg == last) {
               if (ifd ~= fdin)
                  call close (ifd)

               exit (OK)
               }

         when ("."c)
            noread = TRUE

         when ("$"c) {
            read_page (MAXPAGE - 1)
            noread = TRUE
            }

         when (SET_OF_DIGITS) {
            read_page (BOUND (ctoi (input, i), 1, MAXPAGE - 1))
            noread = TRUE
            }

         when ("+"c) {
            i += 1
            read_page (pg + BOUND (ctoi (input, i), 1, MAXPAGE - pg - 1))
            noread = TRUE
            }

         when ("-"c) {
            i += 1
            read_page (pg - max0 (ctoi (input, i), 1))
            noread = TRUE
            }

         when ("/"c) {
            if (nopat && (input (i + 1) == "/"c || input (i + 1) == EOS)) {
               call ctoc ("No saved pattern [*i+]? "s, message, MAXLINE)
               call ctoc ("No saved pattern [*i$]? "s, emessage, MAXLINE)

               error = TRUE
               next
               }

            if (input (i + 1) == EOS) {
               input (i + 1) = input (i)
               input (i + 2) = EOS
               }
            else if (input (i + 1) ~= "/"c) {
               missing_delim = YES

               for (l = i + 1; input (l) ~= EOS; l += 1)
                  if (input (l) == ESCAPE && input (l+1) == input (i))
                     l += 1
                  else if (input (l) == input (i)) {
                     missing_delim = NO
                     break
                     }

               if (missing_delim == YES) {
                  for (; input (l) ~= EOS; l += 1)
                     ;
                  input (l) = input (i)
                  input (l + 1) = EOS
                  }

               if (makpat (input, i+1, input (i), tempat) == ERR) {
                  call ctoc ("Syntax error in pattern [*i+]? "s, message, MAXLINE)
                  call ctoc ("Syntax error in pattern [*i$]? "s, emessage, MAXLINE)

                  error = TRUE
                  next
                  }
               else {
                  do j = 1, MAXPAT
                     pattern (j) = tempat (j)

                  nopat = FALSE
                  }
               }

            find_page (FORWARD)
            if (~found) {
               call ctoc ("Pattern not found [*i+]? "s, message, MAXLINE)
               call ctoc ("Pattern not found [*i$]? "s, emessage, MAXLINE)

               error = TRUE
               }
            else
               noread = TRUE
            }

         when ("\"c) {
            if (nopat && (input (i + 1) == "\"c || input (i + 1) == EOS)) {
               call ctoc ("No saved pattern [*i+]? "s, message, MAXLINE)
               call ctoc ("No saved pattern [*i$]? "s, emessage, MAXLINE)

               error = TRUE
               next
               }

            if (input (i + 1) == EOS) {
               input (i + 1) = input (i)
               input (i + 2) = EOS
               }
            else if (input (i + 1) ~= "\"c) {
               missing_delim = YES

               for (l = i + 1; input (l) ~= EOS; l += 1)
                  if (input (l) == ESCAPE && input (l+1) == input (i))
                     l += 1
                  else if (input (l) == input (i)) {
                     missing_delim = NO
                     break
                     }

               if (missing_delim == YES) {
                  for (; input (l) ~= EOS; l += 1)
                     ;
                  input (l) = input (i)
                  input (l + 1) = EOS
                  }

               if (makpat (input, i+1, input (i), tempat) == ERR) {
                  call ctoc ("Syntax error in pattern [*i+]? "s, message, MAXLINE)
                  call ctoc ("Syntax error in pattern [*i$]? "s, emessage, MAXLINE)

                  error = TRUE
                  next
                  }
               else {
                  do j = 1, MAXPAT
                     pattern (j) = tempat (j)

                  nopat = FALSE
                  }
               }

            find_page (BACKWARD)
            if (~found) {
               call ctoc ("Pattern not found [*i+]? "s, message, MAXLINE)
               call ctoc ("Pattern not found [*i$]? "s, emessage, MAXLINE)

               error = TRUE
               }
            else
               noread = TRUE
            }

         when (CR) { # Kludge for QUIT$ onunit
 BREAKLN    if (index < lines)
               read_page (pg)

            call ctoc (prompt, message, MAXLINE)
            call ctoc (eprompt, emessage, MAXLINE)

            error = TRUE
            }

      else {
         call ctoc ("Unknown command, enter '?' for help [*i+]? "s, message, MAXLINE)
         call ctoc ("Unknown command, enter '?' for help [*i$]? "s, emessage, MAXLINE)

         error = TRUE
         }
      }

# read_page --- read the requested page from the file into the buffer.

   procedure read_page {
      integer num

      local i, flag
      integer i
      logical flag

      num = BOUND (num, 1, MAXPAGE - 1)

      if (num ~= pg + 1) {
         if (pages (num) == intl (-1))
            for (pg -= 1; pages (pg + 2) ~= intl (-1); pg += 1)
               ;
         else
            pg = num - 1

         call seekf (pages (pg + 1), ifd)

         line (1) = EOS
         size = 0
         }

      while (pg < num) {
         index = 0

         if (line (1) ~= EOS) {
            size = scopy (line, 1, screen (1, index + 1), 1)
            line (1) = EOS

            if (screen (size, index + 1) == NEWLINE)
               screen (size, index + 1) = EOS

            index += 1
            }

         while (index < lines && size ~= EOF) {
            flag = TRUE

            for (i = first; i > 1; i -= size) {
               size = getlin (temp, ifd, min0 (i, MSCREEN))

               if (size == EOF || temp (size) == NEWLINE) {
                  flag = FALSE
                  break
                  }
               }

            if (flag)
               size = getlin (screen (1, index + 1), ifd, columns)
            else
               if (size ~= EOF) {
                  screen (1, index + 1) = NEWLINE
                  screen (2, index + 1) = EOS
                  size = 1
                  }
               else
                  screen (1, index + 1) = EOS

            if (size ~= EOF) {
               if (screen (size, index + 1) ~= NEWLINE)
                  repeat
                     i = getlin (temp, ifd, MSCREEN)
                  until (i == EOF || temp (i) == NEWLINE)
               else
                  screen (size, index + 1) = EOS

               index += 1
               }
            }

         pg += 1

         if (size ~= EOF) {
            if (pg + 1 < MAXPAGE && pages (pg + 1) == intl (-1))
               pages (pg + 1) = markf (ifd)

            flag = TRUE

            for (i = first; i > 1; i -= size) {
               size = getlin (temp, ifd, min0 (i, MSCREEN))

               if (size == EOF || temp (size) == NEWLINE) {
                  flag = FALSE
                  break
                  }
               }

            if (flag)
               size = getlin (line, ifd, columns)
            else
               if (size ~= EOF) {
                  line (1) = NEWLINE
                  line (2) = EOS
                  size = 1
                  }
               else
                  line (1) = EOS

            if (size ~= EOF) {
               if (line (size) ~= NEWLINE)
                  repeat
                     i = getlin (temp, ifd, MSCREEN)
                  until (i == EOF || temp (i) == NEWLINE)
               }
            else
               pages (pg + 1) = intl (-1)
            }

         if (size == EOF) {
            last = pg
            break
            }
         }
      }

# display_page --- display buffer on screen.

   procedure display_page {
      local i
      integer i

      if (vthout)
         call vtclr (1, 1, lines, vthrc (2))

      for (i = 1; i <= index; i += 1)
         if (vthout)
            call vtputl (screen (1, i), i, 1)
         else
            call print (ofd, "*s*n"s, screen (1, i))
      }

# find_page --- find next page (circularly) that contains "pattern".

   procedure find_page {
      integer direction

      local i, j
      integer i, j

      i = pg
      found = FALSE

      repeat {
         if (direction == BACKWARD)
            if (pg == 1)
               read_page (MAXPAGE - 1)
            else
               read_page (pg - 1)
         else {
            read_page (pg + 1)

            if (pg == last && index == 0)
               read_page (1)
            }

         for (j = 1; j <= index && ~found; j += 1)
            if (match (screen (1, j), pattern) == YES)
               found = TRUE
         } until (found || pg == i)
      }

#  exit --- stop vth if applicable and return from page.

   procedure exit {
      integer val

      if (vthout) {
         call vtupd (NO)
         call vtstop
         }

      do i = 1, 4
         Rtlabel (i) = label (i)

      return (val)
      }

   end

   subroutine pg$brk (cp)
   longint cp

   include SWT_COMMON

   call pl1$nl (Rtlabel)

   return
   end

undefine(BOUND)

undefine(BREAKLN)
undefine(MAXLNPP)
undefine(MAXPAGE)
undefine(MSCREEN)

undefine(FORWARD)
undefine(BACKWARD)
