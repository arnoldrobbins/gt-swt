# vtterm --- initialize the common block with values for
#            the terminal type given

   integer function vtterm (term_type)
   integer term_type (MAXTERMTYPE)

   include SWT_COMMON

   integer fd, i, bp, tp, sp, f, state
   integer len_ac (MAXCOORDTYPE), len_hc (MAXCOORDTYPE), len_vc (MAXCOORDTYPE)
   integer open, length, strbsr, equal, ctoi, getlin, mntoc
   integer vt$alc, ctoc, vt$ier, gttype, gtattr
   character fname (MAXLINE)
   character buf (MAXLINE), tbuf (MAXLINE), sbuf (MAXLINE)
   character mntoc

  ###################################################################
  #   Instructions for adding new routines to vth:
  #
  #   New coordinate types
  #    1.  Increase the definition for MAXCOORDTYPE by one.
  #    2.  Add code in 'vtterm' to check the applicability
  #        of horizontal, vertical, and absolute positioning
  #        sequences.
  #    3.  Add another entry to the 'data' statements giving
  #        the length of coordinates for the three positioning
  #        sequences.
  #    4.  Add code to 'vt$pos' to correctly generate both
  #        horizontal and vertical coordinates for the new
  #        coordinate type.
  #
  #   New positioning types
  #    1.  Increase the definition for MAXPOSTYPE by one.
  #    2.  Add code in 'vtterm' to check the applicability of
  #        horizontal, vertical, and absolute positioning
  #        sequences.
  #    3.  Add code to 'vt$pos' to perform the positioning.
  #
  #   New input control functions:
  #    1.  Add a definition for the function to the definitions
  #        file.  Define it to be one greater than the integer
  #        used on the last control function definition.
  #    2.  Add the definition and the string to be used to
  #        recognize the function in the vth file
  #    3.  Add the code to perform the function to the 'select'
  #        statement in 'vt$get'.
  ###################################################################

  ### Length of absolute positioning coordinate sequences
   data len_ac /    _
            2,    #  <row> + ASCII char, <col> + ASCII char
            2,    #  <row in hex>, <col in hex>     (b200)
            6,    #  <row in BCD>, <col in BCD>     (sbee)
            3,    #  <vert pos>, <hor pos>          (adds 980)
            6,    #                                 (cg)
            6,    #  <row>y, <col>C                 (hp)
            6/    #  <row>;, <col>H                 (ansi)

  ### Length of vertical positioning coordinate sequences
   data len_vc /    _
            1,    #  <row> + ASCII char
            1,    #  <row in hex>                   (b200)
            3,    #  <row in BCD>                   (sbee)
            1,    #  <vert pos>                     (adds 980)
            3,    #                                 (cg)
            3,    #                                 (hp)
            3/    #  <row>;                         (ansi)

  ### Length of horizontal positioning coordinate sequences
   data len_hc /    _
            1,    #  <col> + ASCII char
            1,    #  <col in hex>                   (b200)
            3,    #  <col in BCD>                   (sbee)
            2,    #  <hor pos>                      (adds 980)
            3,    #                                 (cg)
            3,    #                                 (hp)
            3/    #  <col>H                         (ansi)

   string_table ipos, itext,
      / ATTN,                   "attn",
      / DEFINE,                 "define",
      / DEFINITION,             "definition",
      / VTH_ESCAPE,             "escape",
      / FIX_SCREEN,             "fix_screen",
      / FUNNY_RETURN,           "funny_return",
      / GOBBLE_LEFT,            "gobble_left",
      / GOBBLE_RIGHT,           "gobble_right",
      / GOBBLE_SCAN_LEFT,       "gobble_scan_left",
      / GOBBLE_SCAN_RIGHT,      "gobble_scan_right",
      / GOBBLE_TAB_LEFT,        "gobble_tab_left",
      / GOBBLE_TAB_RIGHT,       "gobble_tab_right",
      / INSERT_BLANK,           "insert_blank",
      / INSERT_NEWLINE,         "insert_newline",
      / INSERT_TAB,             "insert_tab",
      / KILL_ALL,               "kill_all",
      / KILL_LEFT,              "kill_left",
      / KILL_RIGHT,             "kill_right",
      / KILL_RIGHT_AND_RETURN,  "kill_right_and_return",
      / MOVE_DOWN,              "move_down",
      / MOVE_LEFT,              "move_left",
      / MOVE_RIGHT,             "move_right",
      / MOVE_UP,                "move_up",
      / PF,                     "pf",
      / RETURN,                 "return",
      / SCAN_LEFT,              "scan_left",
      / SCAN_RIGHT,             "scan_right",
      / SHIFT_CASE,             "shift_case",
      / SKIP_LEFT,              "skip_left",
      / SKIP_RIGHT,             "skip_right",
      / TAB_CLEAR,              "tab_clear",
      / TAB_LEFT,               "tab_left",
      / TAB_RESET,              "tab_reset",
      / TAB_RIGHT,              "tab_right",
      / TAB_SET,                "tab_set",
      / TOGGLE_INSERT_MODE,     "toggle_insert_mode",
      / UNDEFINE,               "undefine"

   string_table opos, otext,
      / ABS_POS,                "abs_pos",
      / CLEAR_DELAY,            "clear_delay",
      / CLEAR_SCREEN,           "clear_screen",
      / CLEAR_TO_EOL,           "clear_to_eol",
      / CLEAR_TO_EOS,           "clear_to_eos",
      / COLUMNS,                "columns",
      / COORD_TYPE,             "coord_type",
      / CURSOR_DOWN,            "cursor_down",
      / CURSOR_HOME,            "cursor_home",
      / CURSOR_LEFT,            "cursor_left",
      / CURSOR_RIGHT,           "cursor_right",
      / CURSOR_UP,              "cursor_up",
      / DELETE_LINE,            "delete_line",
      / HOR_POS,                "hor_pos",
      / INSERT_LINE,            "insert_line",
      / LINE_DELAY,             "line_delay",
      / POS_DELAY,              "pos_delay",
      / ROWS,                   "rows",
      / SHIFT_IN,               "shift_in",
      / SHIFT_OUT,              "shift_out",
      / SHIFT_TYPE,             "shift_type",
      / VERT_POS,               "vert_pos",
      / WRAP_AROUND,            "wrap_around"

   procedure getword forward
   procedure getseq forward
   procedure interpret_input forward
   procedure interpret_output forward

   define (err (msg), return (vt$ier (msg, fname, buf, fd)))


   if (gttype (term_type) == NO || gtattr (TA_VTH_USEABLE) == NO)
      return (ERR)

   call encode (fname, MAXLINE, "=vth=/*s"s, term_type)
   fd = open (fname, READ)
   if (fd == ERR)
      return (ERR)

   Last_def = 0

   Fn_used (1) = YES
   do i = 2, MAXESCAPE
      Fn_used (i) = NO
   do i = 1, CHARSETSIZE
      Fn_tab (i, 1) = EOS

   do i = 1, MAXCOLS
      Tabs (i) = NO
   do i = 1, MAXCOLS, 3
      Tabs (i) = YES

   do i = 1, MAXROWS; {
      Input_start (i) = MAXCOLS
      Input_stop (i) = 0
      }

   Maxrow = 8
   Maxcol = 32
   Tc_clear_screen (1) = EOS
   Tc_clear_to_eol (1) = EOS
   Tc_clear_to_eos (1) = EOS
   Tc_cursor_home (1) = EOS
   Tc_cursor_left (1) = EOS
   Tc_cursor_right (1) = EOS
   Tc_cursor_up (1) = EOS
   Tc_cursor_down (1) = EOS
   Tc_abs_pos (1) = EOS
   Tc_vert_pos (1) = EOS
   Tc_hor_pos (1) = EOS
   Tc_ins_line (1) = EOS
   Tc_del_line (1) = EOS
   Tc_shift_in (1) = EOS
   Tc_shift_out (1) = EOS
   Tc_coord_char = ' 'c
   Tc_shift_char = NUL
   Tc_coord_type = 0
   Tc_seq_type = 0
   Tc_clear_delay = 0
   Tc_line_delay = 0
   Tc_pos_delay = 0
   Tc_speed = 9600
   Tc_wrap_around = YES
   Tc_clr_len = 9999
   Tc_ceos_len = 9999
   Tc_ceol_len = 9999
   Tc_abs_len = 9999
   Tc_vert_len = 9999
   Tc_hor_len = 9999
   Tc_home_len = 9999
   Tc_left_len = 9999
   Tc_up_len = 9999

   state = ERR

   while (getlin (tbuf, fd) ~= EOF) {

      for ({tp = 1; bp = 1}; tbuf (tp) ~= NEWLINE && tbuf (tp) ~= EOS;
                                                    {tp += 1; bp += 1}) {
         if (tbuf (tp) == '@'c && tbuf (tp + 1) ~= EOS)
            tp += 1
         else if (tbuf (tp) == '#'c)
            break
         buf (bp) = tbuf (tp)
         }
      buf (bp) = EOS

      bp = 1
      getword
      select
         when (tbuf (1) == EOS)
            ;
         when (equal (tbuf, "input"s) == YES)
            state = READ
         when (equal (tbuf, "output"s) == YES)
            state = WRITE
      ifany
         next

      select (state)
         when (ERR)
            err ("characteristic appears before 'input' or 'output'"s)
         when (READ) {
            f = strbsr (ipos, itext, 1, tbuf)
            if (f == EOF)
               err ("unrecognized keyword"s)
            f = itext (ipos (f))
            interpret_input
            }
         when (WRITE) {
            f = strbsr (opos, otext, 1, tbuf)
            if (f == EOF)
               err ("unrecognized keyword"s)
            f = otext (opos (f))
            interpret_output
            }
      }

   call close (fd)

  ### Fill in the default characters for the first table
   for (i = 1; i < CHARSETSIZE; i += 1)
      if (Fn_tab (i, 1) == EOS)
         Fn_tab (i, 1) = i + CHARSETBASE

  ###  Check the plausibility of all control sequences
   if (Tc_clear_screen (1) == EOS) {
      call remark ("Screen clear sequence required"p)
      return (ERR)
      }
   Tc_clr_len = length (Tc_clear_screen)

   if (Tc_clear_to_eol (1) ~= EOS)
      Tc_ceol_len = length (Tc_clear_to_eol)

   if (Tc_clear_to_eos (1) ~= EOS)
      Tc_ceol_len = length (Tc_clear_to_eos)

   if (Tc_cursor_left (1) ~= EOS)
      Tc_left_len = length (Tc_cursor_left)

   if (Tc_cursor_up (1) ~= EOS)
      Tc_up_len = length (Tc_cursor_up)

   if (Tc_cursor_home (1) ~= EOS)
      Tc_home_len = length (Tc_cursor_home)

   if (Tc_coord_type < 1 || Tc_coord_type > MAXCOORDTYPE) {
      call remark ("Invalid coordinate type"p)
      return (ERR)
      }

   select (Tc_seq_type)
      when (1, 2) {
         if (Tc_abs_pos (1) == EOS) {
            call remark ("Absolute positioning sequence required"p)
            return (ERR)
            }
         Tc_abs_len = length (Tc_abs_pos) + len_ac (Tc_coord_type)
         if (Tc_vert_pos (1) ~= EOS)
            Tc_vert_len = length (Tc_vert_pos)
         if (Tc_hor_pos (1) ~= EOS)
            Tc_hor_len = length (Tc_hor_pos)
         }
      when (3) {
         if (Tc_vert_pos (1) == EOS || Tc_hor_pos (1) == EOS) {
            call remark ("Horizontal/vertical sequence missing"p)
            return (ERR)
            }
         Tc_vert_len = length (Tc_vert_pos) + len_vc (Tc_coord_type)
         Tc_hor_len = length (Tc_hor_pos) + len_hc (Tc_coord_type)
         }
      when (4) {
         if (Tc_cursor_up (1) == EOS && Tc_cursor_home (1) == EOS) {
            call remark ("Cursor_home or cursor_up must be specified"p)
            return (ERR)
            }
         if (Tc_cursor_right (1) == EOS) {
            call remark ("Cursor_right must be specified"p)
            return (ERR)
            }
         }
   else {
      call remark ("Invalid sequence type"p)
      return (ERR)
      }

DEBUG    call vt$db
DEBUG    call vt$db2

   return (OK)

   # getword --- get a "word" from 'buf'; put it in 'tbuf'

      procedure getword {

      SKIPBL (buf, bp)
      for (tp = 1; buf (bp) ~= ' 'c && buf (bp) ~= EOS; {bp += 1; tp += 1})
         tbuf (tp) = buf (bp)
      tbuf (tp) = EOS
      }

   # interpret_output --- interpret a line for an output control sequence

      procedure interpret_output {

      select (f)
         when (CLEAR_SCREEN) {
            getseq
            call ctoc (sbuf, Tc_clear_screen, SEQSIZE)
            }
         when (CLEAR_TO_EOL) {
            getseq
            call ctoc (sbuf, Tc_clear_to_eol, SEQSIZE)
            }
         when (CLEAR_TO_EOS) {
            getseq
            call ctoc (sbuf, Tc_clear_to_eos, SEQSIZE)
            }
         when (CURSOR_HOME) {
            getseq
            call ctoc (sbuf, Tc_cursor_home, SEQSIZE)
            }
         when (CURSOR_LEFT) {
            getseq
            call ctoc (sbuf, Tc_cursor_left, SEQSIZE)
            }
         when (CURSOR_RIGHT) {
            getseq
            call ctoc (sbuf, Tc_cursor_right, SEQSIZE)
            }
         when (CURSOR_UP) {
            getseq
            call ctoc (sbuf, Tc_cursor_up, SEQSIZE)
            }
         when (CURSOR_DOWN) {
            getseq
            call ctoc (sbuf, Tc_cursor_down, SEQSIZE)
            }
         when (ABS_POS) {
            getseq
            call ctoc (sbuf, Tc_abs_pos, SEQSIZE)
            }
         when (VERT_POS) {
            getseq
            call ctoc (sbuf, Tc_vert_pos, SEQSIZE)
            }
         when (HOR_POS) {
            getseq
            call ctoc (sbuf, Tc_hor_pos, SEQSIZE)
            }
         when (DELETE_LINE) {
            getseq
            call ctoc (sbuf, Tc_del_line, SEQSIZE)
            }
         when (INSERT_LINE) {
            getseq
            call ctoc (sbuf, Tc_ins_line, SEQSIZE)
            }
         when (SHIFT_IN) {
            getseq
            call ctoc (sbuf, Tc_shift_in, SEQSIZE)
            }
         when (SHIFT_OUT) {
            getseq
            call ctoc (sbuf, Tc_shift_out, SEQSIZE)
            }
         when (COORD_TYPE) {
            Tc_seq_type = ctoi (buf, bp)
            Tc_coord_type = ctoi (buf, bp)
            SKIPBL (buf, bp)
            Tc_coord_char = mntoc (buf, bp, NUL)
            }
         when (SHIFT_TYPE) {
            SKIPBL (buf, bp)
            Tc_shift_char = mntoc (buf, bp, NUL)
            }
         when (WRAP_AROUND) {
            getword
            if (equal (tbuf, "YES"s) == YES)
               Tc_wrap_around = YES
            else
               Tc_wrap_around = NO
            }
         when (CLEAR_DELAY)
            Tc_clear_delay = bound (ctoi (buf, bp), 1, 5000)
         when (LINE_DELAY)
            Tc_line_delay = bound (ctoi (buf, bp), 1, 5000)
         when (POS_DELAY)
            Tc_pos_delay = bound (ctoi (buf, bp), 1, 5000)
         when (ROWS)
            Maxrow = bound (ctoi (buf, bp), 1, MAXROWS)
         when (COLUMNS)
            Maxcol = bound (ctoi (buf, bp), 1, MAXCOLS)
      }


   # getseq --- get a control sequence from 'buf'; put it 'sbuf'

      procedure getseq {

DEBUG local i, buf; integer i, buf (4)
      sp = 0
      repeat {
         sp += 1
         getword
         if (tbuf (1) == EOS)
            break
         tp = 1
         sbuf (sp) = mntoc (tbuf, tp, EOS)
         } until (sbuf (sp) == EOS || sp >= MAXLINE)
      sbuf (sp) = EOS

DEBUG for (i = 1; i <= sp; i += 1) {
DEBUG    call ctomn (sbuf (i), buf)
DEBUG    call print (ERROUT, "*s "s, buf)
DEBUG    }
DEBUG call print (ERROUT, "*n"s)

      }


   # interpret_input --- interpret a line giving an input control sequence

      procedure interpret_input {

      local ent, tbl, pos; integer ent, tbl, pos

      if (f == CHAR) {
         getword
         f = mntoc (tbuf, 1, ' 'c)
         }
      else if (f == PF)
         f -= ctoi (buf, bp)

      getseq
      if (sp <= 1)
         err ("input control sequence must be specified"s)

      tbl = 1
      for (i = 1; i < sp - 1; i += 1) {
         ent = Fn_tab (sbuf (i) - CHARSETBASE, tbl)
         if (ent == EOS) {
            if (vt$alc (tbl, sbuf (i) - CHARSETBASE) == ERR)
               err ("too many unique sequence prefixes"s)
            }
         else if (ent > GET_NEXT_TABLE)
            tbl = ent - GET_NEXT_TABLE
         else
            err ("proper substring of another sequence is illegal"s)
         }
      pos = sbuf (i) - CHARSETBASE
      if (Fn_tab (pos, tbl) ~= EOS)
         err ("sequence previously defined"s)

      if (f == DEFINITION) {
         if (sp + 1 >= MAXDEF)
            err ("too many definitions"s)
         getseq
         Last_def += 1
         f += Last_def
         Def_buf (Last_def) = EOS
         Last_def += 1 + ctoc (sbuf, Def_buf (Last_def + 1), MAXDEF - Last_def)
         }

      Fn_tab (pos, tbl) = f
      }

   undefine (err)
   end
