# swt_com.r.i --- Software Tools Subsystem common block definition
#            Version 9.1 -- 11/06/84

   common /swt$cm/ _

     ### I/O related areas (pages 1-3)
      Termbuf (MAX_TERMBUF),        # Terminal input buffer
      Termcp,                       # Terminal input pointer
      Termcount,                    # Terminal input count
      Echar,                        # Erase character
      Kchar,                        # Kill character
      Nlchar,                       # Newline character
      Eofchar,                      # End of file character
      Escchar,                      # Escape character
      Rtchar,                       # Retype character
      Isphantom,                    # True if process is a phantom
      Cputype,                      # Processor model number
      Errcod,                       # File system error code
      Stdporttbl (MAX_STD_PORTS),   # Standard port map
      Kill_resp (MAXKILLRESP),      # Line kill response
      Fdmem (FDSIZE, NFILES),       # Array of file descriptors
      Reserved_io (846),            # Force a page boundary

     ### I/O buffers (pages 4-19)
      Fdbuf (MAXFDBUF),             # Space for file buffers

     ### File open areas (pages 20-24)
      Passwd (7),                   # Password of vars directory
      Bplabel (4),                  # Bad password label
      Utemptop,                     # User template free pointer
      Fdlastfd,                     # Last fd allocated
      Prt_dest (MAXPRTDEST),        # Destination for printer output
      Prt_form (MAXPRTFORM),        # Form for printer output
      Uhashtb (MAXTEMPHASH),        # User template hash table
      Utempbuf (MAXTEMPBUF),        # User template buffer
      Reserved_open (985),          # Force a page boundary

     ### Program initiation/shell areas (pages 25-41)
      Cmdstat,                      # Command return status
      Comunit,                      # Cominput unit number
      Rtlabel (4),                  # Target label for rtn$$
      Firstuse,                     # Initialization indicator
      Argc,                         # Argument count
      Argv (MAX_ARGV),              # Argument pointer vector
      Termattr (MAX_TERMATTR),      # Terminal attributes
      Termtype (MAX_TERMTYPE),      # Terminal type
      Lword,                        # Saved terminal configuration
      Lsho,                         # Linked string high water mark
      Lstop,                        # Linked string maximum space
      Lsna,                         # Linked string next available
      Lsref (MAXLSBUF),             # Linked string buffer
      Reserved_shell (743),         # Force a page boundary

     ### Tscan$ common block (pages 42-43)
      Ts_state,                     # Current state
      Ts_gt,                        # YES if Ga. Tech Primos
      Ts_at,                        # YES if reattach done on this call
      Ts_eos,                       # intermediate EOS position
      Ts_un (MAXLEV),               # file unit stack
      Ts_ps (MAXLEV),               # end of path stack
      Ts_bf (MAXDIRENTRY, MAXLEV),  # directory buffer stack
      Ts_pw (3, MAXLEV),            # directory password stack
      Ts_path (MAXPATH),            # original pathname
      Reserved_tscan(680),          # force page boundary

     ### Vth screen buffers (pages 44-53)
      Newscr (MAXCOLS, MAXROWS),    # the future terminal screen
      Reserved_newscr(785),         # force page boundary

      Curscr (MAXCOLS, MAXROWS),    # the current terminal screen
      Reserved_curscr(785),         # force page boundary

     ### Vth control sequences plus miscellaneous (pages 54-59)
      Tc_clear_screen (SEQSIZE),    # characters to clear screen
      Tc_clear_to_eol (SEQSIZE),    # characters to clear to end of line
      Tc_clear_to_eos (SEQSIZE),    # characters to clear to end of screen
      Tc_cursor_home (SEQSIZE),     # characters to move cursor to home
      Tc_cursor_left (SEQSIZE),     # characters to move cursor left
      Tc_cursor_right (SEQSIZE),    # characters to move cursor right
      Tc_cursor_up (SEQSIZE),       # characters to move cursor up
      Tc_cursor_down (SEQSIZE),     # characters to move cursor down
      Tc_abs_pos (SEQSIZE),         # characters to start abs position
                                    # sequence
      Tc_vert_pos (SEQSIZE),        # characters to start vertical position
                                    # sequence
      Tc_hor_pos (SEQSIZE),         # characters to start horizontal
                                    # position sequence
      Tc_ins_line (SEQSIZE),        # characters to insert a line
      Tc_del_line (SEQSIZE),        # characters to delete a line
      Tc_shift_in (SEQSIZE),        # characters to turn on escape
      Tc_shift_out (SEQSIZE),       # characters to turn off escape
      Tc_coord_char,                # used in coordinate calculation
      Tc_shift_char,                # used in shift-out display
      Tc_coord_type,                # type of coordinate calculation for
                                    # this terminal
      Tc_seq_type,                  # type of sequence for this terminal
                                    # 1 == abschars, row, col
                                    # 2 == abschars, col, row
                                    # 3 == verticalchars, row
                                    #      horizontalchars, col
      Tc_speed,                     # terminal speed (default 9600)
      Tc_clear_delay,               # amount of delay after clear screen
      Tc_line_delay,                # amount of time after ins/del line
      Tc_pos_delay,                 # amount of time after cursor pos
      Tc_wrap_around,               # terminal has wrap_around (YES/NO)
      Tc_clr_len,                   # clear screen length
      Tc_ceos_len,                  # clear to end-of-string length
      Tc_ceol_len,                  # clear to end-of-line length
      Tc_abs_len,                   # absolute positioning length
      Tc_vert_len,                  # vertical positioning length
      Tc_hor_len,                   # horizontal positioning length
      Tc_home_len,                  # cursor home positioning length
      Tc_left_len,                  # cursor left positioning length
      Tc_up_len,                    # cursor up positioning length

      Unprintable_char,             # current unprintable representation
      Col_chg_start (MAXROWS),      # column where changes start
      Col_chg_stop (MAXROWS),       # column where changes stop
      Row_chg_start,                # row where changes start
      Row_chg_stop,                 # row where changes stop
      Last_char (MAXROWS),          # last character on a row
      Maxrow,                       # number of rows on screen
      Maxcol,                       # number of columns on screen
      Currow,                       # current row curser position
      Curcol,                       # current column cursor position
      Msg_row,                      # current message row position
      Msg_owner (MAXCOLS),          # 'type'ed chars in message row
      Pad_row,
      Pad_col,
      Pad_len,
      Display_time,                 # display time on the message row ?
      Fn_tab (CHARSETSIZE, MAXESCAPE),
      Last_fn,
      Tabs (MAXCOLS),               # current tab settings
      Input_start (MAXROWS),        # input area start
      Input_stop (MAXROWS),         # input area stop
      Inbuf (MAXCOLS),              # input line buffer
      Last_char_scanned,            # saved scan character
      Insert_mode,                  # insert mode on ?
      Invert_case,                  # change case ?
      Duplex,                       # saved duplex
      Input_wait,                   # timed wait on
      Pb_buf (MAXPB),               # pushback buffer (macro's)
      Pb_ptr,                       # pushback pointer
      Fn_used (MAXESCAPE),
      Def_buf (MAXDEF),             # macro definition buffer
      Last_def,
      Nesting_count,                # macro nesting count
      Reserved_vthmisc (1)          # force a page boundary



   integer _
      Termbuf, Termcp, Termcount, Echar, Kchar, Nlchar, Eofchar,
      Escchar, Rtchar, Isphantom, Cputype, Errcod, Stdporttbl,
      Fdmem, Reserved_io, Fdbuf, Passwd, Bplabel, Utemptop,
      Uhashtb, Utempbuf, Reserved_open, Cmdstat, Comunit, Rtlabel,
      Firstuse, Argc, Argv, Termattr, Termtype, Lsho, Lstop,
      Lsna, Lsref, Reserved_shell, Fdlastfd, Kill_resp,
      Prt_dest, Prt_form, Lword, Ts_state, Ts_gt, Ts_at,
      Ts_eos, Ts_un, Ts_ps, Ts_bf, Ts_pw, Ts_path, Reserved_tscan,
      Newscr, Reserved_newscr, Curscr, Reserved_curscr, Tc_clear_screen,
      Tc_clear_to_eol, Tc_clear_to_eos, Tc_cursor_home, Tc_cursor_left,
      Tc_cursor_right, Tc_cursor_up, Tc_cursor_down, Tc_abs_pos,
      Tc_vert_pos, Tc_hor_pos, Tc_ins_line, Tc_del_line, Tc_clear_delay,
      Tc_line_delay, Tc_pos_delay, Tc_shift_in, Tc_shift_out,
      Tc_coord_char, Tc_shift_char, Tc_coord_type, Tc_seq_type,
      Tc_delay_time, Tc_wrap_around, Tc_clr_len, Tc_speed,
      Tc_ceos_len, Tc_ceol_len, Tc_abs_len, Tc_vert_len, Tc_hor_len,
      Unprintable_char, Col_chg_start, Col_chg_stop, Row_chg_start,
      Row_chg_stop, Last_char, Maxrow, Maxcol, Currow, Curcol, Msg_row,
      Msg_owner, Pad_row, Pad_col, Pad_len, Display_time, Fn_tab,
      Last_fn, Tabs, Input_start, Input_stop, Inbuf, Last_char_scanned,
      Insert_mode, Invert_case, Duplex, Input_wait, Pb_buf, Pb_ptr,
      Fn_used, Def_buf, Last_def, Nesting_count, Tc_home_len,
      Tc_left_len, Tc_up_len, Reserved_vthmisc

   integer Fdesc (FDSIZE), Fddev (1), Fdunit (1), Fdbufstart (1),
         Fdbuflen (1), Fdbufend (1), Fdcount (1), Fdbcount (1),
         Fdflags (1), Fdvcstat1 (1), Fdvcstat2 (1), Fdopstat1 (1),
         Fdopstat2 (1), Fdopstat3 (1)

   equivalence _
      (Fdmem, Fdesc),
      (Fddev, Fdesc (1)),
      (Fdunit, Fdesc (2)),
      (Fdbufstart, Fdesc (3)),
      (Fdbuflen, Fdesc (4)),
      (Fdbufend, Fdesc (5)),
      (Fdcount, Fdesc (6)),
      (Fdbcount, Fdesc (7)),
      (Fdflags, Fdesc (8)),
      (Fdvcstat1, Fdesc (9)),
      (Fdvcstat2, Fdesc (10)),
      (Fdopstat1, Fdesc (11)),
      (Fdopstat2, Fdesc (12)),
      (Fdopstat3, Fdesc (13))
