# common block for Virtual Terminal Handler (vth)

integer Maxrow,                     # number of rows on screen
        Maxcol                      # number of columns on screen
character Tc_clear_screen (SEQSIZE),# characters to clear screen
          Tc_clear_to_eol (SEQSIZE),# characters to clear to end of line
          Tc_clear_to_eos (SEQSIZE),# characters to clear to end of screen
          Tc_cursor_home (SEQSIZE), # characters to move cursor to home
          Tc_cursor_left (SEQSIZE), # characters to move cursor left
          Tc_cursor_right (SEQSIZE),# characters to move cursor right
          Tc_cursor_up (SEQSIZE),   # characters to move cursor up
          Tc_cursor_down (SEQSIZE), # characters to move cursor down
          Tc_abs_pos (SEQSIZE),     # characters to start abs position
                                    # sequence
          Tc_vert_pos (SEQSIZE),    # characters to start vertical position
                                    # sequence
          Tc_hor_pos (SEQSIZE),     # characters to start horizontal
                                    # position sequence
          Tc_ins_line (SEQSIZE),    # characters to insert a line
          Tc_del_line (SEQSIZE),    # characters to delete a line
          Tc_ins_char (SEQSIZE),    # characters to insert a character
          Tc_del_char (SEQSIZE),    # characters to delete a character
          Tc_ins_str (SEQSIZE),     # characters to insert a string
          Tc_shift_in (SEQSIZE),    # characters to turn on escape
          Tc_shift_out (SEQSIZE),   # characters to turn off escape
          Tc_coord_char,            # used in coordinate calculation
          Tc_shift_char             # used in shift-out display

integer Tc_coord_type,              # type of coordinate calculation for
                                    # this terminal
        Tc_seq_type,                # type of sequence for this terminal
                                    # 1 == abschars, row, col
                                    # 2 == abschars, col, row
                                    # 3 == verticalchars, row
                                    #      horizontalchars, col
        Tc_delay_time,              # amount of time to wait after special
                                    # sequence output
        Tc_wrap_around,             # terminal has wrap_around (YES/NO)
        Tc_clr_len,
        Tc_ceos_len,
        Tc_ceol_len,
        Tc_abs_len,
        Tc_vert_len,
        Tc_hor_len
                                 # screen clearing, positioning, etc.

character Newscr (MAXCOLS, MAXROWS),
          Curscr (MAXCOLS, MAXROWS),
          Unprintable_char

integer Col_chg_start (MAXROWS),
        Col_chg_stop (MAXROWS),
        Row_chg_start,
        Row_chg_stop,
        Last_char (MAXROWS),
        Currow,
        Curcol,
        Msg_row,
        Msg_owner (MAXCOLS),
        Pad_row,
        Pad_col,
        Pad_len,
        Display_time

integer Fn_tab (CHARSETSIZE, MAXESCAPE),
        Last_fn,
        Tabs (MAXCOLS),
        Input_start (MAXROWS),
        Input_stop (MAXROWS),
        Inbuf (MAXCOLS),
        Last_char_scanned,
        Insert_mode,
        Invert_case,
        Duplex,
        Input_wait,
        Pb_buf (MAXPB),
        Pb_ptr,
        Fn_used (MAXESCAPE),
        Def_buf (MAXDEF),
        Last_def,
        Nesting_count

common /vth$cm/ Maxrow, Maxcol, Tc_clear_screen, Tc_clear_to_eol,
   Tc_clear_to_eos, Tc_cursor_home, Tc_cursor_left, Tc_cursor_right,
   Tc_cursor_up, Tc_cursor_down, Tc_abs_pos, Tc_vert_pos, Tc_hor_pos,
   Tc_shift_in, Tc_shift_out, Tc_coord_char, Tc_shift_char, Tc_coord_type,
   Tc_seq_type, Tc_delay_time, Tc_wrap_around, Tc_clr_len, Tc_ceos_len,
   Tc_ceol_len, Tc_abs_len, Tc_vert_len, Tc_hor_len, Tc_ins_line,
   Tc_del_line, Tc_ins_char, Tc_del_char, Tc_ins_str, Newscr, Curscr,
   Col_chg_start, Col_chg_stop, Row_chg_start, Row_chg_stop, Last_char,
   Currow, Curcol, Msg_row, Msg_owner, Pad_row, Pad_col, Pad_len,
   Display_time, Unprintable_char, Fn_tab, Last_fn, Tabs, Input_start,
   Input_stop, Inbuf, Last_char_scanned, Insert_mode, Invert_case,
   Duplex, Input_wait, Pb_buf, Pb_ptr, Fn_used, Def_buf, Last_def,
   Nesting_count
