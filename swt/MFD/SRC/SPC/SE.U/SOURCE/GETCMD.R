# getcmd --- read a line from the terminal for se

   subroutine getcmd (lin, col1, curpos, termchar)
   character lin (MAXLINE), termchar
   integer col1, curpos

   include SE_COMMON

   integer cursor, nlpos, prev_cursor, prev_status, status,
            scan_pos, tab_pos, first
   integer length
   character c
   string smargin "MARGIN"

   procedure scan_for_char (char, wrap) forward
   procedure scan_for_tab (char) forward
   procedure gobble (len) forward
   procedure insert (len) forward
   procedure set_cursor (pos) forward

   nlpos = length (lin)
   if (nlpos <= 0 || lin (nlpos) ~= NEWLINE)
      nlpos += 1

   select
      when (curpos < 1)
         cursor = 1
      when (curpos >= MAXLINE)
         cursor = nlpos
   else
      set_cursor (curpos)
   prev_cursor = cursor

   call watch     # display time of day

   select (Nchoise)     # update the line number display
      when (CURLINE)
         call litnnum ("line "p, Curln, LINE_MSG)
      when (LASTLINE)
         call litnnum ("$="p, Lastln, LINE_MSG)
      when (TOPLINE)
         call litnnum ("#="p, Topln, LINE_MSG)
   else
      call mesg (EOS, LINE_MSG)

   if (cursor < Warncol)   # erase the column display
      call mesg (EOS, COL_MSG)

   termchar = 0   # not yet terminated
   status = OK
   prev_status = ERR
   first = col1

   while (termchar == 0) {

      lin (nlpos) = EOS    # make sure the line has an EOS
      if (status == ERR)   # last iteration generated an error
         call t1ou (BEL)
      elif (prev_status == ERR)  # last one OK but one before had error
         call mesg (EOS, CHAR_MSG)

      prev_status = status
      status = OK

      select      # do horizontal scrolling if needed
         when (first > cursor)
            first = cursor
         when (first < cursor - Ncols + POOPCOL)
            first = cursor - Ncols + POOPCOL

      select      # indicate whether line is shifted horizontally
         when (first == col1)
            call load ('|'c, Cmdrow, BARCOL)
         when (first > col1)
            call load ('<'c, Cmdrow, BARCOL)
         when (first < col1)
            call load ('>'c, Cmdrow, BARCOL)
      call loadstr (lin (first), Cmdrow, POOPCOL, Ncols)

      if (cursor == Warncol && prev_cursor < Warncol)
         call t1ou (BEL)
      if (cursor >= Warncol)
         call litnnum ("col "p, cursor, COL_MSG)
      elif (prev_cursor >= Warncol)
         call mesg (EOS, COL_MSG)

      call position_cursor (Cmdrow, cursor + POOPCOL - first)
      prev_cursor = cursor

      if (Peekc == EOS)
         call c1in (c)  # get a character
      else {
         c = Peekc
         Peekc = EOS
         }

      select (c)     # branch on character value

      ### Literal characters:
         when (ESC, SET_OF_GRAPHICS) {
            if (c == ESC)  # take next character literally
               call c1in (c)
            elif (Invert_case ~= NO && IS_LETTER (c))
               c ^= 8r40   # toggle ASCII upper/lower case bit
            if (Insert_mode ~= NO)
               insert (1)
            elif (cursor >= MAXLINE - 1) {
               status = ERR
               call mesg (smargin, CHAR_MSG)
               }
            if (status ~= ERR) {
               lin (cursor) = c
               cursor += 1
               if (nlpos < cursor)
                  nlpos = cursor
               if (c == NEWLINE)
                  termchar = CURSOR_SAME
               }
            }

      ### Leftward cursor functions:
         when (CURSOR_LEFT)
            set_cursor (cursor - 1)
         when (TAB_LEFT) {
            scan_for_tab (TAB_LEFT)
            if (status ~= ERR)
               cursor = tab_pos
            }
         when (SKIP_LEFT)
            cursor = 1
         when (SCAN_LEFT) {
            scan_for_char (c, YES)
            if (status ~= ERR)
               cursor = scan_pos
            }
         when (GOBBLE_LEFT) {
            set_cursor (cursor - 1)
            if (status ~= ERR)
               gobble (1)
            }
         when (GOBBLE_TAB_LEFT) {
            scan_for_tab (TAB_LEFT)
            if (status ~= ERR) {
               cursor = tab_pos
               gobble (prev_cursor - tab_pos)
               }
            }
         when (KILL_LEFT) {
            cursor = 1
            gobble (prev_cursor - 1)
            }
         when (GOBBLE_SCAN_LEFT) {
            scan_for_char (c, NO)
            if (status ~= ERR) {
               cursor = scan_pos
               gobble (prev_cursor - scan_pos)
               }
            }

      ### Rightward cursor functions:
         when (CURSOR_RIGHT)
            set_cursor (cursor + 1)
         when (TAB_RIGHT) {
            scan_for_tab (TAB_RIGHT)
            if (status ~= ERR)
               set_cursor (tab_pos)
            }
         when (SKIP_RIGHT) {
            cursor = nlpos
            first = col1      # force proper alignment
            }
         when (SCAN_RIGHT) {
            scan_for_char (c, YES)
            if (status ~= ERR)
               cursor = scan_pos
            }
         when (GOBBLE_RIGHT)
            gobble (1)
         when (GOBBLE_TAB_RIGHT) {
            scan_for_tab (TAB_RIGHT)
            if (status ~= ERR)
               gobble (tab_pos - cursor)
            }
         when (KILL_RIGHT)
            gobble (nlpos - cursor)
         when (GOBBLE_SCAN_RIGHT) {
            scan_for_char (c, NO)
            if (status ~= ERR)
               gobble (scan_pos - cursor)
            }

      ### Line termination functions:
         when (SKIP_RIGHT_AND_TERMINATE) {
            cursor = nlpos
            termchar = c
            }
         when (KILL_RIGHT_AND_TERMINATE) {
            nlpos = cursor
            termchar = c
            }
         when (FUNNY, CURSOR_UP, CURSOR_DOWN)
            termchar = c

      ### Insertion functions:
         when (INSERT_BLANK) {
            insert (1)
            if (status ~= ERR)
               lin (cursor) = ' 'c
            }
         when (INSERT_NEWLINE) {
            insert (1)
            if (status ~= ERR) {
               lin (cursor) = NEWLINE
               termchar = CURSOR_UP
               }
            }
         when (INSERT_TAB) {
            SKIPBL (lin, cursor)
            scan_for_tab (TAB_RIGHT)
            if (status ~= ERR)
               insert (tab_pos - cursor)
            if (status ~= ERR)
               for ( ; cursor < tab_pos; cursor += 1)
                  lin (cursor) = ' 'c
            cursor = prev_cursor
            }

      ### Miscellaneous control functions:
         when (TOGGLE_INSERT_MODE) {
            Insert_mode = YES + NO - Insert_mode
            if (Insert_mode == NO)
               call mesg (EOS, INS_MSG)
            else
               call mesg ("INSERT"s, INS_MSG)
            }
         when (SHIFT_CASE) {
            Invert_case = YES + NO - Invert_case
            if (Invert_case == NO)
               call mesg (EOS, CASE_MSG)
            else
               call mesg ("CASE"s, CASE_MSG)
            }
         when (KILL_ALL) {
            nlpos = 1
            cursor = 1
            }
         when (FIX_SCREEN)
            call restore_screen

      else {
         status = ERR
         call mesg ("WHA?"s, CHAR_MSG)
         }

      }  # while (termchar == 0)

   lin (nlpos) = NEWLINE
   lin (nlpos + 1) = EOS

   call load ('|'c, Cmdrow, BARCOL)
   if (nlpos <= col1)
      call loadstr (EOS, Cmdrow, POOPCOL, Ncols)
   else
      call loadstr (lin (col1), Cmdrow, POOPCOL, Ncols)
   if (cursor >= Warncol)
      call litnnum ("col "p, cursor, COL_MSG)
   elif (prev_cursor >= Warncol)
      call mesg (EOS, COL_MSG)

   curpos = cursor   # return the cursor position

   return


   # scan_for_char --- scan current line for a character

      procedure scan_for_char (char, wrap) {
      character char
      integer wrap

      local c, inc
      character c
      integer inc

      call c1in (c)
      if (Invert_case ~= NO && IS_LETTER (c))
         c ^= 8r40         # toggle case
      if (c == char)
         c = Last_char_scanned
      Last_char_scanned = c

      if (char == SCAN_LEFT || char == GOBBLE_SCAN_LEFT)
         inc = -1
      else
         inc = +1

      ### NOTE: modify this code AT YOUR OWN RISK!
      scan_pos = cursor
      repeat {
         if (scan_pos < 1)
            if (wrap == NO)
               break
            else
               scan_pos = nlpos
         elif (scan_pos > nlpos)
            if (wrap == NO)
               break
            else
               scan_pos = 1
         else
            scan_pos += inc
         if (0 < scan_pos && scan_pos < nlpos && lin (scan_pos) == c)
            break
         } until (scan_pos == cursor)

      if (scan_pos <= 0 || scan_pos >= nlpos || lin (scan_pos) ~= c) {
         status = ERR
         call mesg ("NOCHAR"s, CHAR_MSG)
         }

      }


   # scan_for_tab --- find the next or previous tab stop

      procedure scan_for_tab (char) {
      character char

      local inc
      integer inc

      if (char == TAB_LEFT) {
         inc = -1
         tab_pos = cursor - 1
         }
      else {
         inc = +1
         tab_pos = cursor + 1
         }

      for ( ; 0 < tab_pos && tab_pos <= MAXLINE; tab_pos += inc)
         if (Tabstops (tab_pos) ~= NO)
            break
      if (tab_pos < 1 || tab_pos >= MAXLINE) {
         status = ERR
         call mesg (smargin, CHAR_MSG)
         }

      }


   # gobble --- delete characters starting at the current cursor

      procedure gobble (len) {
      integer len

      if (cursor + len > nlpos) {
         status = ERR
         call mesg (smargin, CHAR_MSG)
         }
      elif (len > 0) {
         call scopy (lin, cursor + len, lin, cursor)
         nlpos -= len
         }

      }


   # insert --- shift characters right starting at the current cursor

      procedure insert (len) {
      integer len

      local fr, to
      integer fr, to

      if (nlpos + len >= MAXLINE) {
         status = ERR
         call mesg (smargin, CHAR_MSG)
         }
      else {
         for ({fr = nlpos; to = nlpos + len}; fr >= cursor;
               {fr -= 1; to -= 1})
            lin (to) = lin (fr)
         nlpos += len
         }

      }


   # set_cursor --- move the cursor, extend line if necessary

      procedure set_cursor (pos) {
      integer pos

      if (pos < 1 || pos >= MAXLINE) {
         status = ERR
         call mesg (smargin, CHAR_MSG)
         }
      else {
         cursor = pos
         for ( ; nlpos < cursor; nlpos += 1)
            lin (nlpos) = ' 'c
         }

      }

   end
