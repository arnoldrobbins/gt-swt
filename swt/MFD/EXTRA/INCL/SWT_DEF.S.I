* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
