define (SE_COMMON,"se_com.r.i")

# keys
define(FULL,0) define(NOECHO,:140000)  # for duplx$
define(KREAD,1)
define(KWRIT,2)
define(KRDWR,3)
define(KPOSN,3)
define(KCLOS,4)
define(KDELE,5)
define(KPREA,8)
define(KGETU,:40000)
define(KNDAM,:2000)
define(EFNTF,15)
define(CLEAR_INPUT,:40000)

# arbitrary definitions
define(BACKWARD,-1)
define(FORWARD,0)
define(NOSTATUS,1)      # must be different from EOF, ERR, and OK
define(NOMORE,-1)

# dimensions and other limit values
define(MAXBUF,65520)
define(TBUFSIZE,512)
define(MAXCHARS,10)
define(MAXROWS,51)
define(MINROWS,16)
define(MAXCOLS,128)
define(MAXLINE,512)
define(BUFENT,7)     # number of entries in each node in buf
define(GARBAGE_FACTOR,2)   # allowable fraction of garbage in scratch file
define(GARBAGE_THRESHOLD,2000) # min garbage lines before garbage collection
define(READ_WRITE_COUNT_MODULUS,100)

# message classes for status line at bottom of screen
define(NOMSG,0)
define(REMARK_MSG,1)
define(CHAR_MSG,2)
define(CASE_MSG,3)
define(INS_MSG,4)
define(TIME_MSG,5)
define(FILE_MSG,6)
define(MESSAGE_MSG,7)
define(COL_MSG,8)
define(LINE_MSG,9)
define(HELP_MSG,10)
define(MODE_MSG,11)

# characters typed by the user
define(ANYWAY,'!'c)
define(UCANYWAY,'!'c)
define(APPENDCOM,'a'c)
define(UCAPPENDCOM,'A'c)
define(BACKSEARCH,'<'c)
define(CHANGE,'c'c)
define(UCCHANGE,'C'c)
define(UCCOPYCOM,'Y'c)
define(COPYCOM,'y'c)
define(CURLINE,'.'c)
define(DEFAULTNAME,' 'c)
define(DELCOM,'d'c)
define(UCDELCOM,'D'c)
define(ENTER,'e'c)
define(UCENTER,'E'c)
define(EXCLUDE,'x'c)
define(UCEXCLUDE,'X'c)
define(GLOBAL,'g'c)
define(UCGLOBAL,'G'c)
define(GMARK,"'"c)
define(HELP,'h'c)
define(UCHELP,'H'c)
define(INSERT,'i'c)
define(UCINSERT,'I'c)
define(JOINCOM,'j'c)
define(UCJOINCOM,'J'c)
define(LOCATECMD,'l'c)
define(UCLOCATECMD,'L'c)
define(LASTLINE,'$'c)
define(MARKCOM,'k'c)
define(UCMARKCOM,'K'c)
define(MISCCOM,'z'c)
define(UCMISCCOM,'Z'c)
define(MOVECOM,'m'c)
define(UCMOVECOM,'M'c)
define(NAMECOM,'n'c)
define(UCNAMECOM,'N'c)
define(OPTCOM,'o'c)
define(UCOPTCOM,'O'c)
define(OVERLAYCOM,'v'c)
define(UCOVERLAYCOM,'V'c)
define(PAGECOM,':'c)
define(PREVLINE,'^'c)
define(PREVLINE2,'-'c)
define(PRINT,'p'c)
define(UCPRINT,'P'c)
define(PRINTCUR,'='c)
define(PRINTFIL,'f'c)
define(UCPRINTFIL,'F'c)
define(QUIT,'q'c)
define(UCQUIT,'Q'c)
define(READCOM,'r'c)
define(UCREADCOM,'R'c)
define(SCAN,'/'c)
define(SEARCH,'>'c)
define(SUBSTITUTE,'s'c)
define(UCSUBSTITUTE,'S'c)
define(TLITCOM,'t'c)
define(UCTLITCOM,'T'c)
define(TOPLINE,'#'c)
define(UNDOCMD,'u'c)
define(UCUNDOCMD,'U'c)
define(WRITECOM,'w'c)
define(UCWRITECOM,'W'c)
define(SHELLCOM,'~'c)
define(DEFAULT_UNPRINTABLE_CHAR,' 'c)
define(DEFAULT_TSPEED,9600)

# definitions that make the language more self-documenting
define(max,max0)
define(min,min0)
define(div,/)              # used to indicate integer divide

# error message numbers.  Arbitrary so long as they are different.
define(EBACKWARD,1)        define(ENOPAT,2)
define(EBADPAT,3)          define(EBADSTR,4)
define(EBADSUB,5)          define(ECANTREAD,6)
define(EEGARB,7)           define(EFILEN,8)
define(EBADTABS,9)         define(EINSIDEOUT,10)
define(EKNOTFND,11)        define(ELINE1,12)
define(E2LONG,13)          define(ENOERR,14)
define(ENOLIMBO,15)        define(EODLSSGTR,16)
define(EORANGE,17)         define(EOWHAT,18)
define(EPNOTFND,19)        define(ESTUPID,20)
define(EWHATZAT,21)        define(EBREAK,22)
define(ELINE2,23)          define(ECANTWRITE,24)
define(ECANTINJECT,25)     define(ENOMATCH,26)
define(ENOFN,27)           define(EBADLIST,28)
define(ENOLIST,29)         define(ENONSENSE,30)
define(ENOHELP,31)         define(EBADLNR,32)
define(EFEXISTS,33)        define(EBADCOL,34)
define(ENOLANG,35)         define(ENOSUB,36)
define(EBADUSER,37)        define(EBUSYUSER,38)
define(ENOSHELL,39)        define(ENOCMD,40)


# terminal types
define(NOTERM,0)     # terminal type not yet known
define(ADDS980,1)    # Applied Digital Data Systems Consul 980
define(ADDS100,2)    # Applied Digital Data Systems Regent 100
define(FOX,3)        # Perkin-Elmer 1100
define(TVT,4)        # Allen's SWTPC T. V. Typewriter II
define(GT40,5)       # DEC GT40 with Waugh terminal program
define(B150,6)       # Beehive 150
define(B200,7)       # Beehive 200
define(SBEE,8)       # Beehive Super-Bee
define(SOL,9)        # Sol emulating Beehive 200 (smaller screen)
define(HZ1510,10)    # Hazeltine 1510
define(CG,11)        # Chromatics CG
define(ISC8001,12)   # Intelligent System 8001 Color terminal
define(ADM3A,13)     # Lear-Siegler ADM 3A
define(IBM,14)       # IBM 3101 terminal
define(ANP,15)       # Allen & Paul model 1
define(NETRON,16)    # Netronics
define(H19,17)       # Heath H19
define(TRS80,18)     # Radio Shack TRS80 with Brad Isley's terminal program
define(HP2621,19)    # Hewlett Packard 2621A/P
define(ADM31,20)     # Lear-Siegler ADM-31
define(TVI,21)       # Televideo 912/920
define(Z19,22)       # Zenith Z19 (same as H19)
define(VI200,23)     # Visual 200 (native mode)
define(VC4404,24)    # Volker-Craig VC4404 (ADM3A mode)
define(TS1,25)       # Falco TS-1 (native mode)
define(HP9845,26)    # Hewlett Packard 9845C Color Computer
define(HZ1421,27)    # Hazeltine 1421 (native mode)
define(BANTAM,28)    # Perkin-Elmer 550
define(HP2626,29)    # Hewlett Packard 2626A
define(MICROB,30)    # Beehive Micro B/DM1A
define(PT45,31)      # Pr1me PT45
define(NBY,32)       # Newbury 7009
define(PST100,33)    # PST 100
define(VT100,34)     # DEC VT100
define(FORSYS,35)    # Fortune System
define(ADM5,36)      # Lear-Siegler ADM5
define(VIEWPT,37)    # ADDS Viewpoint 3+
define(INFO,38)      # Infoton 100
define(HP2648,39)    # Hewlett Packard 264x
define(TERAK,40)     # Terak microcomputer
define(HZ1420,41)    # Hazeltine 1420
define(VIEWPT90,42)  # ADDS Viewpoint 90
define(ADM42,43)     # Lear-Siegler ADM-42
define(BEE2,44)      # Beehive model 2
define(BEE,100)      # nonspecific Beehive

# screen design
define(NAMECOL,6)    # column to put mark name in
define(BARCOL,7)     # column for "|" divider
define(POOPCOL,8)    # column text begins in

# control characters

# Leftward cursor motion:
define(CURSOR_LEFT,CTRL_H)       # left one column
define(TAB_LEFT,CTRL_E)          # left one tab stop
define(SKIP_LEFT,CTRL_W)         # go to beginning of line.
define(SCAN_LEFT,CTRL_L)         # scan left for a character
define(GOBBLE_LEFT,CTRL_U)       # erase character to left and close
define(GOBBLE_TAB_LEFT,FS)       # erase to previous tab stop and close
define(KILL_LEFT,CTRL_Y)         # erase everything to left and close
define(GOBBLE_SCAN_LEFT,CTRL_N)  # scan left, erase and close

# Rightward cursor motion:
define(CURSOR_RIGHT,CTRL_G)      # right one column
define(TAB_RIGHT,CTRL_I)         # right one tab stop
define(SKIP_RIGHT,CTRL_O)        # go to end of line
define(SCAN_RIGHT,CTRL_S)        # scan right for a character
define(GOBBLE_RIGHT,CTRL_R)      # erase over cursor; close from right
define(GOBBLE_TAB_RIGHT,RS)      # erase to next tab stop and close
define(KILL_RIGHT,CTRL_T)        # erase from cursor to end of line
define(GOBBLE_SCAN_RIGHT,CTRL_B) # scan right, erase and close

# Line termination:
define(SKIP_RIGHT_AND_TERMINATE,CTRL_V)   # skip to end  and terminate
define(KILL_RIGHT_AND_TERMINATE,NEWLINE)
define(FUNNY,CTRL_F)             # take funny return with entire line
define(CURSOR_UP,CTRL_D)         # move cursor up one line
define(CURSOR_DOWN,CTRL_K)       # move cursor down one line
define(CURSOR_SAME,CTRL_M)       # leave cursor on same line

# Insertion:
define(INSERT_BLANK,CTRL_C)      # insert one blank at current column
define(INSERT_TAB,CTRL_X)        # insert blanks to next tab stop
define(INSERT_NEWLINE,US)        # insert a newline at current column

# Miscellany:
define(TOGGLE_INSERT_MODE,CTRL_A)   # toggle insert mode flag
define(SHIFT_CASE,CTRL_Z)        # toggle case mapping flag
define(KILL_ALL,DEL)             # erase entire line
define(FIX_SCREEN,CTRL_Q)        # clear and restore screen

# For user by send_message
define(MAXPROCESSES, 128)

# ESCAPE can now vary with UNIX or SWT modes:
undefine(ESCAPE)
