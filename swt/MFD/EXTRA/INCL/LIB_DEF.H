/* lib_def.h --- Software Tools Subsytem Library definitions */
/*                     Version 9 */

#ifndef __LIB_DEF__
#define __LIB_DEF__     1

/* Defines for I/O routines: */
#define MAXFILESTATE    258     /* NFILES + Primos funits + 2 */
#define MAXLSBUF        16384
#define MAXFDBUF        16384
#define MAXTERMBUF      128
#define MAXSTDPORTS     6
#define MAXARGV         256
#define MAXKILLRESP     33
#define MAXPRTDEST      17
#define MAXPRTFORM      9
#define NFILES          128
#define BUFSIZE         128
#define FDSIZE          16
#define DEVTTY          1
#define DEVDSK          2
#define DEVNULL         3
#define FDBYTE          0100000
#define FDREAD          0040000
#define FDWRITE         0020000
#define FDEOF           0010000
#define FDERR           0004000
#define FDCOMP          0002000
#define FDOPENED        0001000
#define FDFTYPE         0000700
#define FDMBZ           0000060
#define FDLASTOP        0000017
#define FDINITIAL       0
#define FDREADF         1
#define FDWRITEF        2
#define FDGETLIN        3
#define FDPUTLIN        4

/* Defines for 'lopen$': */
#define FTN     0100000
#define EXP     040000
#define LNR     020000
#define NHD     010000
#define NEJ     04000
#define RAW     02000
#define DEF     0400
#define LOC     0200
#define ATL     0100
#define COP     020

/* Defines for 'print' and 'input': */
#define FORMATFLAG      '*'
#define ADDRFORM        'a'
#define BOOLFORM        'b'
#define CHARFORM        'c'
#define DOUBLEFORM      'd'
#define FLOATFORM       'f'
#define GOTOFORM        'g'
#define HOLLERITHFORM   'h'
#define INTFORM         'i'
#define RCINTFORM       'j'
#define SKIPFORM        'k'
#define LONGINTFORM     'l'
#define RCLONGINTFORM   'm'
#define NLINE           'n'
#define PACKEDSTRINGFORM        'p'
#define REALFORM        'r'
#define STRINGFORM      's'
#define TABFORM         't'
#define DEFAULTFORM     'u'
#define VARYINGFORM     'v'
#define FILLFORM        'x'
#define YESNOFORM       'y'

/* Defines for memory management routines: */
#define DS_MEMEND       1
#define DS_AVAIL        2
#define DS_CLOSE        8
#define DS_LINK         1
#define DS_SIZE         0
#define DS_OHEAD        2

/* Defines for symbol table routines: */
#define ST_LINK         0
#define ST_DATA         1
#define ST_HTABSIZE     43

/* Defines for template expander: */
#define MAXTEMPHASH     37
#define MAXTEMPBUF      (4096 - MAXTEMPHASH)
#define TEMP_DATE       1
#define TEMP_TIME       2
#define TEMP_USER       3
#define TEMP_PID        4
#define TEMP_PASSWD     5
#define TEMP_DAY        6
#define TEMP_HOME       7

/* Defines for 'tscan$' */
#define REATTACH        1
#define PREORDER        2
#define POSTORDER       4
#define EODPAUSE        8
#define EOD             0       /* must be different from EOF, ERR, OK */
#define MAXLEV          32
#define DESCEND         1
#define COULDNT_DESCEND 2
#define GET_NEXT_ENTRY  3
#define ASCEND          4
#define ATEOD           5

/* defines for 'ldseg$' */
#define SG_SEGNUM       1
#define SG_FLAGS        0
#define SG_NODESIZE     9
#define SG_CHAIN        8
#define SG_NULL         0100000

/* Definitions used only for pattern matching */
#define PAT_AND         '&'
#define PAT_ANY         '?'
#define PAT_BOL         '%'
#define PAT_CCL         '['
#define PAT_CCLEND      ']'
#define PAT_CHAR        'a'
#define PAT_CLOSIZE     4
#define PAT_CLOSURE     '*'
#define PAT_COUNT       1
#define PAT_DASH        '-'
#define PAT_DITTO       -3
#define PAT_EOL         '$'
#define PAT_MARK        -10     /* to different than any digit */
#define PAT_NCCL        'n'
#define PAT_NOT         '~'
#define PAT_PREVCL      2
#define PAT_START       3
#define PAT_START_TAG   '{'
#define PAT_STOP_TAG    '}'

/* Miscellaneous definitions: */
#define MAX_NAME        7
#define MAXINTEGER      077777
#define CHARS_PER_WORD  2
#define NOTEXECUTABLE   1
#define ISCIFILE        -4
#define NOTFOUND        0
#define FOUND           1
#define DAM             1
#define SAM             0

/*  VTH library definitions */

#define MAXSCREEN       4335
#define MAXCOORDTYPE    6
#define MAXSEQTYPE      4
#define MAXROWS         51
#define MAXCOLS         85
#define MAXSEQ          12
#define MAXPB           400
#define MAXDEF          1000
#define MAXNEST         20
#define MAXESCAPE       20
#define untyped         integer
#define SEQSIZE         10      /* character sequence size for cursor control */
#define send_str(s) do { auto int i; for (i = 0; s[i] != EOS; i++) \
        tnoua (s[i] << 8, 1); } while (0)
#define send_char(c)   tnoua ( c << 8, 1)
#define vt$pk(c, scr, row, col)         (scr [row][col] = c)
#define vt$upk(c, scr, row, col)        (c = scr [row][col])

#define CHARSETSIZE     128
#define CHARSETBASE     127

#define DEFINITION      4000
#define GET_NEXT_TABLE  5000

#define MOVE_LEFT       1000
#define TAB_LEFT        1001
#define SKIP_LEFT       1002
#define SCAN_LEFT       1003
#define GOBBLE_LEFT     1004
#define GOBBLE_TAB_LEFT 1005
#define KILL_LEFT       1006
#define GOBBLE_SCAN_LEFT        1007
#define MOVE_RIGHT      1008
#define TAB_RIGHT       1009
#define SKIP_RIGHT      1010
#define SCAN_RIGHT      1011
#define GOBBLE_RIGHT    1012
#define GOBBLE_TAB_RIGHT        1013
#define KILL_RIGHT      1014
#define GOBBLE_SCAN_RIGHT       1015
#define RETURN          1016
#define KILL_RIGHT_AND_RETURN   1017
#define FUNNY_RETURN    1018
#define MOVE_UP         1019
#define MOVE_DOWN       1020
#define INSERT_BLANK    1021
#define INSERT_TAB      1022
#define INSERT_NEWLINE  1023
#define TOGGLE_INSERT_MODE      1024
#define SHIFT_CASE      1025
#define KILL_ALL        1026
#define FIX_SCREEN      1027
#define VTH_ESCAPE      1028
#define DEFINE          1029
#define UNDEFINE        1030
#define TABSET          1031
#define TABRESET        1032
#define TABCLEAR        1033

#define CLEAR_SCREEN    1
#define CLEAR_TO_EOL    2
#define CLEAR_TO_EOS    3
#define CURSOR_HOME     4
#define CURSOR_LEFT     5
#define CURSOR_RIGHT    6
#define CURSOR_UP       7
#define CURSOR_DOWN     8
#define ABS_POS         9
#define VERT_POS        10
#define HOR_POS         11
#define COORD_TY+E      12
#define DELAY_TIME      13
#define ROWS            14
#define COLUMNS         15
#define SHIFT_IN        16
#define SHIFT_OUT       17
#define SHIFT_TYPE      18
#define WRAP_AROUND     19
#define INSERT_LINE     20
#define DELETE_LINE     21
#define INSERT_CHAR     22
#define DELETE_CHAR     23
#define INSERT_STRING   24

#define NOMSG           0       /* values for message owner */
#define TIME_MSG        -1
#define CHAR_MSG        -2
#define INS_MSG         -3
#define CASE_MSG        -4

#define min (a, b)      ((a) > (b) ? (a) : (b))
#define max (a, b)      ((a) < (b) ? (a) : (b))
#define bound(a, b, c)  max (b , min (a, c))
#endif
