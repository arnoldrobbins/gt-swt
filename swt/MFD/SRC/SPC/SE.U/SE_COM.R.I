# Software Tools Subsystem Screen Editor Common Definitions


# Concerning line numbers:

   common /clines/ Line1, Line2, Nlines, Curln, Lastln

   integer Line1,                # first line number
           Line2,                # second line number
           Nlines,               # number of line numbers specified
           Curln,                # current line: value of dot
           Lastln                # last line: value of $


# Concerning Patterns:

   common /cpat/ Pat (MAXPAT), Tlpat (MAXPAT), Subs (MAXPAT), Tset (MAXPAT)

   character Pat,                # saved pattern for 'g', 'x' and 's' commands
             Tlpat,              # saved character list for 't' command
             Subs,               # saved substitution string for 's'
             Tset                # saved dest set for 't' command


# Concerning the text of lines:

   common /ctxt/ Txt (MAXLINE)

   character Txt                 # text of current line


# Concerning file names:

   common /cfile/ Savfil (MAXLINE)

   character Savfil              # remembered file name


# Concerning line descriptors:
#
#  Note:  The definitions of line descriptor fields that follow
#        rely on the fact that subscripts on arrays that are
#        allocated in a common block whose six-character name
#        ends with a dollar sign are treated as word numbers
#        (where a word is 16 bits) within the array instead of
#        being treated as normal subscripts.  This allows the
#        'Seekaddr' array to be referenced by a subscript that
#        corresponds to the offset in 'buf' of a line descriptor
#        structure.

   common /cbufr$/ Lastbf, Fence, Free, Line0, Buf (MAXBUF)

   pointer   Lastbf,             # last pointer used in Buf
             Fence,              # first file Buffer used in Buf
             Free,               # head of free list
             Line0               # head of list of line descriptors
   character Buf                 # buffer space for line descriptors

   # Definition of fields of a line descriptor structure:
   #  (Equivalenced to offsets in 'Buf'.)

      pointer   Prevline (1),    # link to descriptor of previous line
                Nextline (1)     # link to descriptor of next line
      integer   Globmark (1),    # mark for global commands
                Lineleng (1)     # length of line, including NEWLINE and EOS
      longint   Seekaddr (1)     # scratch file seek address for text of line
      character Markname (1)     # mark name associated with line

      equivalence _
         (Prevline (1), Buf (1)),
         (Nextline (1), Buf (2)),
         (Globmark (1), Buf (3)),
         (Seekaddr (1), Buf (4)),
         (Lineleng (1), Buf (6)),
         (Markname (1), Buf (7))


# Concerning the 'undo' (u) command:

   common /cundo/ Limbo, Limcnt

   integer Limbo,                # head of limbo list for undo
           Limcnt                # number of lines in limbo list


# Concerning the scratch file:

   common /cscrat/ Scr, Scrend, Scrname (MAXLINE), Lost_lines

   filedes   Scr                 # scratch file descriptor
   longint   Scrend              # end of info on scratch file
   character Scrname             # name of scratch file
   integer   Lost_lines          # number of garbage lines in scratch file


# Concerning miscellaneous variables:

   common /cmisc/ Buffer_changed, Errcode, Saverrcode, Probation, Argno,
      Last_char_scanned, Peekc, Sav_com

   integer Buffer_changed,       # YES if buffer changed since last write
           Errcode,              # cause of most recent error
           Saverrcode,           # cause of previous error
           Probation,            # YES if unsaved buffer can be destroyed
           Argno,                # command line argument pointer
           Last_char_scanned     # last char scanned with ctrl-s or -l
   character Peekc,              # push a SKIP_RIGHT if adding delimiters
           Sav_com (MAXLINE)     # saved previous shell command


# Concerning marknames:

   common /cmark/ Savknm

   character Savknm              # saved mark name for < and >


# Concerning options:

   common /copt/ Tabstops (MAXLINE), Tabstr (MAXLINE), Unprintable,
      Ddir, Absnos, Nchoise, Overlay_col, Warncol, Firstcol, Tspeed,
      Indent, Globals

   character Tabstops,           # array of tab stops
             Tabstr,             # string representation of tab stops
             Unprintable         # char to print for Unprintable chars
   integer   Ddir,               # delete direction
             Absnos,             # use absolute line numbers in margin
             Nchoise,            # choice of line number for continuous display
             Overlay_col,        # initial cursor column for 'v' command
             Warncol,            # where to turn on column number warning
             Firstcol,           # leftmost column to display
             Tspeed,             # terminal line speed
             Indent,             # indent col; 0 = same as last
             Globals             # failed substitutes in globals continue


# Concerning the terminal type:

   common /cterm/ Term_type

   integer   Term_type           # terminal type


# Concerning the screen format:

   common /cscrn/ Screen_image (MAXCOLS, MAXROWS), Msgalloc (MAXCOLS),
      Nrows, Ncols, Currow, Curcol, Toprow, Botrow, Cmdrow, Topln,
      Insert_mode, Invert_case, First_affected, Rel_a, Rel_z,
      Sclen, Sctop, Scline

   character Screen_image        # virtual screen image
   integer   Msgalloc,           # column allocation of status line
             Nrows,              # number of rows on screen
             Ncols,              # number of columns on screen
             Currow,             # vertical cursor co-ordinate
             Curcol,             # horizontal cursor co-ordinate
             Toprow,             # top row of window field on screen
             Botrow,             # bottom row of window field on screen
             Cmdrow,             # row number of command line
             Topln,              # line number of first line on screen
             Insert_mode,        # flag to specify character insertion
             Invert_case,        # flag for case mapping on input
             First_affected,     # number of first line affected by cmd
             Rel_a,              # char to use for first alpha line number
             Rel_z,              # char to use for last alpha line number
             Sclen,              # number of lines of text on screen
             Sctop,              # number of first text line on screen
             Scline(MAXROWS)     # text line number offset from Sctop

# Concerning Unix and SWT compatibility:

   common /cunixswt/ Unix_mode, BACKSCAN, NOTINCCL, XMARK, ESCAPE

   integer Unix_mode             # Unix mode in effect
   character BACKSCAN,           # \ or ?
             NOTINCCL,           # ~ or ^
             XMARK,              # ! or ~
             ESCAPE              # @ or \

# Concerning tty state:
   common /ctty/ Tty_state
   integer Tty_state             # tty state used by duplx$
