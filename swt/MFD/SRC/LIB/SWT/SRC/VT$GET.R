# vt$get --- get and edit a single line from input

   integer function vt$get (row, ccol, start, len)
   integer row, ccol, start, len

   include SWT_COMMON

   integer tab_pos, scan_pos, tbl, col, new_col, gobble, insert
   integer i, j, pos, status, last_status
   integer vt$idf, vt$def, vt$ndf
   character c, ci, termination, store

   procedure scan_for_char (char, wrap) forward
   procedure scan_for_tab (char) forward
   procedure update forward
   procedure get_char forward

   termination = EOS   # not yet terminated
   col = ccol - start
   last_status = ERR
   status = OK

   while (termination == EOS) {

      col = bound (col, 1, len)

      if (status == ERR)
         send_char (BEL)
      else if (last_status == ERR) {
         call vtmsg (EOS, CHAR_MSG)
         call vtupd (NO)
         }

      last_status = status
      status = OK

      call vtmove (row, col + start - 1)      # position the cursor

      get_char

      new_col = col
      store = EOF
      gobble = 0
      insert = Insert_mode    # assuming YES = 1 and NO = 0!!!!!!!

      select (c)

      ### Leftward cursor functions:
         when (MOVE_LEFT)
            new_col -= 1
         when (TAB_LEFT) {
            scan_for_tab (TAB_LEFT)
            new_col = tab_pos
            }
         when (SKIP_LEFT)
            new_col = 1
         when (SCAN_LEFT) {
            scan_for_char (c, YES)
            if (scan_pos <= 0) {
               status = ERR
               next
               }
            new_col = scan_pos
            }
         when (GOBBLE_LEFT) {
            new_col -= 1
            gobble = 1
            }
         when (GOBBLE_TAB_LEFT) {
            scan_for_tab (TAB_LEFT)
            new_col = tab_pos
            gobble = col - tab_pos
            }
         when (KILL_LEFT) {
            gobble = new_col - 1
            new_col = 1
            }
         when (GOBBLE_SCAN_LEFT) {
            scan_for_char (c, NO)
            if (scan_pos <= 0) {
               status = ERR
               next
               }
            new_col = scan_pos
            gobble = col - scan_pos
            }

      ### Rightward cursor functions:
         when (MOVE_RIGHT)
            new_col += 1
         when (TAB_RIGHT) {
            scan_for_tab (TAB_RIGHT)
            new_col = tab_pos
            }
         when (SKIP_RIGHT) {
            for (i = len; i > 0 && Inbuf (i) == ' 'c; i -= 1)
               ;
            new_col = i + 1
            }
         when (SCAN_RIGHT) {
            scan_for_char (c, YES)
            if (scan_pos <= 0) {
               status = ERR
               next
               }
            new_col = scan_pos
            }
         when (GOBBLE_RIGHT)
            gobble = 1
         when (GOBBLE_TAB_RIGHT) {
            scan_for_tab (TAB_RIGHT)
            gobble = tab_pos - col
            }
         when (KILL_RIGHT)
            gobble = len - col + 1
         when (GOBBLE_SCAN_RIGHT) {
            scan_for_char (c, NO)
            if (scan_pos <= 0) {
               status = ERR
               next
               }
            gobble = scan_pos - col
            }

      ### Line termination functions:
         when (RETURN)
            termination = ENTER
         when (KILL_RIGHT_AND_RETURN) {
            termination = ENTER
            gobble = len - col + 1
            }
         when (FUNNY_RETURN, MOVE_UP, MOVE_DOWN)
            termination = c

      ### Character insertion functions:
         when (INSERT_BLANK) {
            insert = 1
            store = ' 'c
            }
         when (INSERT_TAB) {
            scan_for_tab (TAB_RIGHT)
            insert = tab_pos - col
            store = ' 'c
            }
         when (INSERT_NEWLINE) {
            new_col += 1
            insert = 1
            store = NEWLINE
            }

      ### Tab related functions:
         when (TABSET) {
            Tabs (col) = YES
            next
            }
         when (TABRESET) {
            Tabs (col) = NO
            next
            }
         when (TABCLEAR) {
            do i = 1, MAXCOLS
               Tabs (i) = NO
            next
            }

      ### Miscellaneous control functions:
         when (TOGGLE_INSERT_MODE) {
            if (Insert_mode == YES) {
               Insert_mode = NO
               call vtmsg (EOS, INS_MSG)
               call vtupd (NO)
               }
            else {
               Insert_mode = YES
               call vtmsg ("INSERT"s, INS_MSG)
               call vtupd (NO)
               }
            next
            }
         when (SHIFT_CASE) {
            if (Invert_case == YES) {
               Invert_case = NO
               call vtmsg (EOS, CASE_MSG)
               call vtupd (NO)
               }
            else {
               Invert_case = YES
               call vtmsg ("CASE"s, CASE_MSG)
               call vtupd (NO)
               }
            next
            }
         when (KILL_ALL) {
            gobble = len
            new_col = 1
            }
         when (FIX_SCREEN) {
            call vtupd (YES)
            next
            }
         when (VTH_ESCAPE) {
            call c1in (store)
            new_col += 1
            }
         when (DEFINE) {
            status = vt$def (c)
            next
            }
         when (UNDEFINE) {
            status = vt$ndf (c)
            next
            }

      else if (c >= ' 'c && c < DEL) {
         new_col += 1
         store = c
         if (Invert_case == YES && IS_LETTER (c))
            store ^= 8r40
         }

      else if (c < EOS) {       # it's a termination of some sort
         termination = c
         next
         }

      else if (c >= DEFINITION) {
         status = vt$idf (c)
         next
         }

      else {
         call vt$err ("GARBAGE"s)
         status = ERR
         next
         }

      if (new_col < 1 || new_col > len) {  # insure in range
         call vt$err ("MARGIN"s)
         status = ERR
         next
         }

      if (store ~= EOF) {  # there is a character to store
         if (insert > 0) {
            for ({i = len - insert; j = len}; i >= col; {j -= 1; i -= 1})
               Inbuf (j) = Inbuf (i)
            for ( ; j > i; j -= 1)
               Inbuf (j) = store
            update
            }
         else {
            pos = col + start - 1
            call vtmove (row, pos)   # make sure the cursor is in place
            if (store ~= ' 'c && Last_char (row) < pos)
               Last_char (row) = pos
            call vt$out (store)
            vt$pk (store, Curscr, row, pos)
            vt$pk (store, Newscr, row, pos)
            Inbuf (col) = store
            }
         }

      else if (gobble > 0) {
         for ({i = new_col; j = new_col + gobble}; j <= len;  {i += 1; j += 1})
            Inbuf (i) = Inbuf (j)
         for (; i <= len; i += 1)
            Inbuf (i) = ' 'c
         update
         }

      col = new_col

DEBUG call vtprt (1, 1, "*i (*,8i) col=*i, lc=*i"s, c, c, col, Last_char (row))
DEBUG call vtpad (50)
DEBUG call vtupd (NO)
      }

   ccol = start + col
   return (termination)


   # scan_for_char --- scan current line for a character

      procedure scan_for_char (char, wrap) {
      character char
      integer wrap

      local inc; integer inc

      get_char
      if (Invert_case == YES && IS_LETTER (c))
         c ^= 8r40         # toggle case
      if (c == char)
         c = Last_char_scanned
      Last_char_scanned = c

      if (char == SCAN_LEFT || char == GOBBLE_SCAN_LEFT)
         inc = -1
      else
         inc = +1

      scan_pos = col
      repeat {
         if (scan_pos < 1)
            if (wrap == NO)
               break
            else
               scan_pos = len
         elif (scan_pos > len)
            if (wrap == NO)
               break
            else
               scan_pos = 1
         else
            scan_pos += inc
         if (0 < scan_pos && scan_pos < len && Inbuf (scan_pos) == c)
            break
         } until (scan_pos == col)
      if (scan_pos <= 0 || scan_pos >= len || Inbuf (scan_pos) ~= c)
         scan_pos = 0

      }


   # scan_for_tab --- find the next or previous tab stop

      procedure scan_for_tab (char) {
      character char

      local inc; integer inc

      inc = -1
      tab_pos = col - 1
      if (char == TAB_LEFT) {
         inc = -1
         tab_pos = col - 1
         }
      else {
         inc = +1
         tab_pos = col + 1
         }

      for ( ; 0 < tab_pos && tab_pos <= Maxcol; tab_pos += inc)
         if (Tabs (tab_pos) ~= NO)
            break

      }


   # update --- update the current input field on the screen

      procedure update {

      call vt$put (Inbuf, row, start, len)
      call vtupd (NO)

      }


   # get_char --- get an input character sequence; put result it 'c'

      procedure get_char {

      tbl = 1
      repeat {

         if (Pb_ptr <= 0) {
            Nesting_count = 0
            call c1in (ci)
            }
         else {
            ci = Pb_buf (Pb_ptr)
            Pb_ptr -= 1
            }

         c = Fn_tab (ci - CHARSETBASE, tbl)
         if (c < GET_NEXT_TABLE)
            break
         tbl = c - GET_NEXT_TABLE
         }
      }


   end
