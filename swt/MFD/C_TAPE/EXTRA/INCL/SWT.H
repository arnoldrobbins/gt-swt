/* swt.h --- defines for using the Subsystem */

#ifndef _SWT_
#define _SWT_           1

/* C language extensions (Ratfor extensions adapted to C) */

#define bits            int
#define bool            short
#define logical         short
#define elif            else if
#define filedes         int
#define file_des        filedes
#define filemark        long
#define file_mark       filemark

/* define macros for use in switchs: */

#define SET_OF_UPPER_CASE \
'A': case 'B': case 'C': case 'D': case 'E': case 'F': case 'G': \
case 'H': case 'I': case 'J': case 'K': case 'L': case 'M': case 'N': \
case 'O': case 'P': case 'Q': case 'R': case 'S': case 'T': case 'U': \
case 'V': case 'W': case 'X': case 'Y': case 'Z'

#define SET_OF_LOWER_CASE \
'a': case 'b': case 'c': case 'd': case 'e': case 'f': case 'g': \
case 'h': case 'i': case 'j': case 'k': case 'l': case 'm': case 'n': \
case 'o': case 'p': case 'q': case 'r': case 's': case 't': case 'u': \
case 'v': case 'w': case 'x': case 'y': case 'z'

#define SET_OF_LETTERS SET_OF_UPPER_CASE: case SET_OF_LOWER_CASE

#define SET_OF_DIGITS \
'0': case '1': case '2': case '3': case '4': \
case '5': case '6': case '7': case '8': case '9'

#define SET_OF_CONTROL_CHAR \
NUL: case SOH: case STX: case ETX: case EOT: case ENQ: case ACK: \
case BEL: case BS: case HT: case LF: case VT: case FF: case CR: \
case SO: case SI: case DLE: case DC1: case DC2: case DC3: case DC4: \
case NAK: case SYN: case ETB: case CAN: case EM: case SUB: case ESC: \
case FS: case GS: case RS: case US

#define SET_OF_SPECIAL_CHAR \
' ': case '!': case '"': case '#': case '$': case '%': case '&': \
case '\'': case '(': case ')': case '*': case '+': case ',': case '-': \
case '.': case '/': case ':': case ';': case '<': case '=': case '>': \
case '?': case '@': case '[': case '\\': case ']': case '^': case '_': \
case '`': case '{': case '|': case '}': case '~'

#define SET_OF_GRAPHICS SET_OF_LETTERS: case SET_OF_DIGITS: case SET_OF_SPECIAL_CHAR

/* Status and action symbols */

#define ABS             0       /* 'seekf': absolute positioning */
#define REL             1       /* 'seekf': relative positioning */

#define DIGIT           '0'     /* returned by 'type' */
#define LETTER          'a'

#define UPPER           2       /* for use by 'mapstr' */
#define LOWER           1

#define READ            1       /* 'open': open file for reading */
#define WRITE           2       /* 'open': open file for writing */
#define READWRITE       3       /* 'open': open file for reading and writing */

#ifndef EOF
#define EOF             (-1)    /* end of file */
#endif
#define OK              (-2)    /* everything is alright */
#define ERR             (-3)    /* error return on some functions */

#define EOS             '\0'

#define YES             1       /* function return on some functions */
#define NO              0

#define PG_END          1       /* If set, 'page' returns after last page */
#define PG_VTH          2       /* If set, 'page' uses VTH for the display */

#define SYS_DATE        1       /* 'date': return current date */
#define SYS_TIME        2       /* 'date': return current date */
#define SYS_USERID      3       /* 'date': return user's login name */
#define SYS_PIDSTR      4       /* 'date': process id as a string */
#define SYS_DAY         5       /* 'date': current day of the week */
#define SYS_PID         6       /* 'date': user's process id */
#define SYS_LDATE       7       /* 'date': current day of week, month, day, year */
#define SYS_MINUTES     8       /* 'date': minutes past midnight in str[0..1] */
#define SYS_SECONDS     9       /* 'date': seconds past midnight in str[0..1] */
#define SYS_MSEC        10      /* 'date': msec. past midnight in str[0..1] */

#define TA_SE_USABLE    1       /* 'gtattr': does 'se' support terminal? */
#define TA_VTH_USABLE   2       /* 'gtattr': does 'vth' support terminal? */
#define TA_UPPER_ONLY   3       /* 'gtattr': is terminal upper case only? */

/* Standard port definitions */

#define STDIN1          -10
#define STDOUT1         -11
#define STDIN2          -12
#define STDOUT2         -13
#define STDIN3          -14
#define STDOUT3         -15
#define STDIN           STDIN1
#define STDOUT          STDOUT1
#define ERRIN           STDIN3
#define ERROUT          STDOUT3
#define STDERR          ERROUT          /* added for C */
#define TTY             1

/* Limit definitions */

#define CHARS_PER_WORD  2       /* number of characters per machine word */
#define MAXINT          077777  /* maximum single precision integer value */
#define MAXARG          128     /* maximum size of an argument array */
#define MAXARGV         256     /* maximum number of arguments */
#define MAXDECODE       200     /* maximum size of decoded string */
#define MAXDIRENTRY     32      /* maximum size of an entry from dir$rd */
#define MAXFNAME        33      /* maximum size of a filename array */
#define MAXPACKEDFNAME  16      /* (MAXFNAME-1)/2 for fortran holleriths */
#define MAXVARYFNAME    17      /* (MAXFNAME-1)/2+1 for pl/i strings */
#define MAXLINE         102     /* maximum standard line length */
#define MAXPAT          256     /* maximum size of a pattern array */
#define MAXPATH         180     /* maximum size of a pathname array */
#define MAXPRINT        300     /* maximum size of output from 'print' */
#define MAXSTR          100
#define MAXTERMATTR     6       /* number of terminal attributes */
#define MAXTERMTYPE     7       /* maximum size of terminal type */
#define MAXTREE         256     /* maximum number of characters in a treename */
#define MAXUSERNAME     33      /* maximum size of user name string */
#define MAXPACKEDUSERNAME       ((MAXUSERNAME-1)/2)     /* for hollerith strings */

/* Miscellaneous definitions: */

#define ESCAPE          '@'     /* Subsystem escape character */
#define NOT             '~'
#define DISABLE         1       /* Primos break$: disable breaks */
#define ENABLE          0       /* Primos break$: enable breaks */

#endif
