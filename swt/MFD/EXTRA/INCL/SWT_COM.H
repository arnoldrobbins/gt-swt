/*  swt_com.h --- Software Tools Subsystem common block definition */
/*             Version 9 -- 10/10/84 */

#ifndef _SWT_COM__
#define _SWT_COM__      1

#include <swt.h>
#include <lib_def.h>

extern
   struct swt$cm {
      /* I/O related areas (pages 1-3) */
int   Termbuf [MAXTERMBUF],         /* Terminal input buffer */
      Termcp,                       /* Terminal input pointer */
      Termcount,                    /* Terminal input count */
      Echar,                        /* Erase character */
      Kchar,                        /* Kill character */
      Nlchar,                       /* Newline character */
      Eofchar,                      /* End of file character */
      Escchar,                      /* Escape character */
      Rtchar,                       /* Retype character */
      Isphantom,                    /* True if process is a phantom */
      Cputype,                      /* Processor model number */
      Errcod,                       /* File system error code */
      Stdporttbl [MAXSTDPORTS],     /* Standard port map */
      Kill_resp [MAXKILLRESP];      /* Line kill response */
      struct fdmem {
         int Fddev;
         int Fdunit;
         int Fdbufstart;
         int Fdbuflen;
         int Fdbufend;
         int Fdcount;
         int Fdbcount;
         int Fdflags;
         int Fdvcstat1;
         int Fdvcstat2;
         int Fdopstat1;
         int Fdopstat2;
         int Fdopstat3;
         int _garbage_[3];          /* extremely ugly, but will work */
         } Fdmem [NFILES];          /* Array of file descriptors */
int   Reserved_io [846],            /* Force a page boundary */

      /* I/O buffers (pages 4-19) */
      Fdbuf [MAXFDBUF],             /* Space for file buffers */

      /* File open areas (pages 20-24) */
      Passwd [7],                   /* Password of vars directory */
      Bplabel [4],                  /* Bad password label */
      Utemptop,                     /* User template free pointer */
      Fdlastfd,                     /* Last fd allocated */
      Prt_dest [MAXPRTDEST],        /* Destination for printer output */
      Prt_form [MAXPRTFORM],        /* Form for printer output */
      Uhashtb [MAXTEMPHASH],        /* User template hash table */
      Utempbuf [MAXTEMPBUF],        /* User template buffer */
      Reserved_open [985],          /* Force a page boundary */

      /* Program initiation/shell areas (pages 25-41) */
      Cmdstat,                      /* Command return status */
      Comunit,                      /* Cominput unit number */
      Rtlabel [4],                  /* Target label for rtn$$ */
      Firstuse,                     /* Initialization indicator */
      Argc,                         /* Argument count */
      Argv [MAXARGV],               /* Argument pointer vector */
      Termattr [MAXTERMATTR],       /* Terminal attributes */
      Termtype [MAXTERMTYPE],       /* Terminal type */
      Lword,                        /* Saved terminal configuration */
      Lsho,                         /* Linked string high water mark */
      Lstop,                        /* Linked string maximum space */
      Lsna,                         /* Linked string next available */
      Lsref [MAXLSBUF],             /* Linked string buffer */
      Reserved_shell [743],         /* Force a page boundary */

      /* Tscan$ common block (pages 42-43) */
      Ts_state,                     /* Current state */
      Ts_gt,                        /* YES if Ga. Tech Primos */
      Ts_at,                        /* YES if reattach done on this call */
      Ts_eos,                       /* intermediate EOS position */
      Ts_un [MAXLEV],               /* file unit stack */
      Ts_ps [MAXLEV],               /* end of path stack */
      Ts_bf [MAXLEV][MAXDIRENTRY],  /* directory buffer stack */
      Ts_pw [MAXLEV][3],            /* directory password stack */
      Ts_path [MAXPATH],            /* original pathname */
      Reserved_tscan[680],          /* force page boundary */

      /* Vth screen buffers (pages 44-53) */
      Newscr [MAXROWS][MAXCOLS],    /* the future terminal screen */
      Reserved_newscr [785],        /* force page boundary */

      Curscr [MAXROWS][MAXCOLS],    /* the current terminal screen */
      Reserved_curscr [785],        /* force page boundary */

      /* Vth control sequences plus miscellaneous (pages 54-59) */
      Tc_clear_screen [SEQSIZE],    /* characters to clear screen */
      Tc_clear_to_eol [SEQSIZE],    /* characters to clear to end of line */
      Tc_clear_to_eos [SEQSIZE],    /* characters to clear to end of screen */
      Tc_cursor_home [SEQSIZE],     /* characters to move cursor to home */
      Tc_cursor_left [SEQSIZE],     /* characters to move cursor left */
      Tc_cursor_right [SEQSIZE],    /* characters to move cursor right */
      Tc_cursor_up [SEQSIZE],       /* characters to move cursor up */
      Tc_cursor_down [SEQSIZE],     /* characters to move cursor down */
      Tc_abs_pos [SEQSIZE],         /* characters to start abs position */
                                    /* sequence */
      Tc_vert_pos [SEQSIZE],        /* characters to start vertical position */
                                    /* sequence */
      Tc_hor_pos [SEQSIZE],         /* characters to start horizontal */
                                    /* position sequence */
      Tc_ins_line [SEQSIZE],        /* characters to insert a line */
      Tc_del_line [SEQSIZE],        /* characters to delete a line */
      Tc_ins_char [SEQSIZE],        /* characters to insert a character */
      Tc_del_char [SEQSIZE],        /* characters to delete a character */
      Tc_ins_str [SEQSIZE],         /* characters to insert a string */
      Tc_shift_in [SEQSIZE],        /* characters to turn on escape */
      Tc_shift_out [SEQSIZE],       /* characters to turn off escape */
      Tc_coord_char,                /* used in coordinate calculation */
      Tc_shift_char,                /* used in shift-out display */
      Tc_coord_type,                /* type of coordinate calculation for */
                                    /* this terminal */
      Tc_seq_type,                  /* type of sequence for this terminal */
                                    /* 1 == abschars, row, col */
                                    /* 2 == abschars, col, row */
                                    /* 3 == verticalchars, row */
                                    /*      horizontalchars, col */
      Tc_delay_time,                /* amount of time to wait after special */
                                    /* sequence output */
      Tc_wrap_around,               /* terminal has wrap_around (YES/NO) */
      Tc_clr_len,                   /* clear screen length */
      Tc_ceos_len,                  /* clear to end-of-string length */
      Tc_ceol_len,                  /* clear to end-of-line length */
      Tc_abs_len,                   /* absolute positioning length */
      Tc_vert_len,                  /* vertical positioning length */
      Tc_hor_len,                   /* horizontal positioning length */

      Unprintable_char,             /* current unprintable representation */
      Col_chg_start [MAXROWS],      /* column where changes start */
      Col_chg_stop [MAXROWS],       /* column where changes stop */
      Row_chg_start,                /* row where changes start */
      Row_chg_stop,                 /* row where changes stop */
      Last_char [MAXROWS],          /* last character on a row */
      Maxrow,                       /* number of rows on screen */
      Maxcol,                       /* number of columns on screen */
      Currow,                       /* current row curser position */
      Curcol,                       /* current column cursor position */
      Msg_row,                      /* current message row position */
      Msg_owner [MAXCOLS],          /* 'type'ed chars in message row */
      Pad_row,
      Pad_col,
      Pad_len,
      Display_time,                 /* display time on the message row ? */
      Fn_tab [MAXESCAPE][CHARSETSIZE],
      Last_fn,
      Tabs [MAXCOLS],               /* current tab settings */
      Input_start [MAXROWS],        /* input area start */
      Input_stop [MAXROWS],         /* input area stop */
      Inbuf [MAXCOLS],              /* input line buffer */
      Last_char_scanned,            /* saved scan character */
      Insert_mode,                  /* insert mode on ? */
      Invert_case,                  /* change case ? */
      Duplex,                       /* saved duplex */
      Input_wait,                   /* timed wait on */
      Pb_buf [MAXPB],               /* pushback buffer (macro's) */
      Pb_ptr,                       /* pushback pointer */
      Fn_used [MAXESCAPE],
      Def_buf [MAXDEF],             /* macro definition buffer */
      Last_def,
      Nesting_count,                /* macro nesting count */
      Reserved_vthmisc [417];       /* force a page boundary */
      } swt$cm;
#endif
