# swt_def.r.i --- standard definitions for all Subsystem programs
#    Software Tools Subsystem, Version 9


# ASCII control character definitions:

define(NUL,8r200)
define(CTRL_A,8r201)   define(SOH,8r201)
define(CTRL_B,8r202)   define(STX,8r202)
define(CTRL_C,8r203)   define(ETX,8r203)
define(CTRL_D,8r204)   define(EOT,8r204)
define(CTRL_E,8r205)   define(ENQ,8r205)
define(CTRL_F,8r206)   define(ACK,8r206)
define(CTRL_G,8r207)   define(BEL,8r207)
define(CTRL_H,8r210)   define(BS,8r210)
define(CTRL_I,8r211)   define(HT,8r211)
define(CTRL_J,8r212)   define(LF,8r212)
define(CTRL_K,8r213)   define(VT,8r213)
define(CTRL_L,8r214)   define(FF,8r214)
define(CTRL_M,8r215)   define(CR,8r215)
define(CTRL_N,8r216)   define(SO,8r216)
define(CTRL_O,8r217)   define(SI,8r217)
define(CTRL_P,8r220)   define(DLE,8r220)
define(CTRL_Q,8r221)   define(DC1,8r221)
define(CTRL_R,8r222)   define(DC2,8r222)
define(CTRL_S,8r223)   define(DC3,8r223)
define(CTRL_T,8r224)   define(DC4,8r224)
define(CTRL_U,8r225)   define(NAK,8r225)
define(CTRL_V,8r226)   define(SYN,8r226)
define(CTRL_W,8r227)   define(ETB,8r227)
define(CTRL_X,8r230)   define(CAN,8r230)
define(CTRL_Y,8r231)   define(EM,8r231)
define(CTRL_Z,8r232)   define(SUB,8r232)
define(CTRL_LBRACK,8r233)      define(ESC,8r233)
define(CTRL_BACKSLASH,8r234)   define(FS,8r234)
define(CTRL_RBRACK,8r235)      define(GS,8r235)
define(CTRL_CARET,8r236)       define(RS,8r236)
define(CTRL_UNDERLINE,8r237)   define(US,8r237)
define(SP,8r240)
define(DEL,8r377)


# Synonyms for important non-printing characters:

define(BACKSPACE,BS)
define(TAB,HT)
define(BELL,BEL)
define(NEWLINE,LF)
define(RHT,DC1)
define(RUBOUT,DEL)


# Ratfor language extensions:

define(ARB,1)     # for dimensioning parameter arrays
define(ARGUMENT_DEFS,"=incl=/arg_def.r.i")
define(bits,integer)
define(bool,logical)
define(character,integer)
define(CHARACTER_DEFS,"=incl=/char_def.r.i")
define(elif,else if)
define(FALSE,.false.)
define(filedes,integer)
define(filemark,integer*4)
define(floating,real*8)
define(fpchar(s,i,c),{
if(and(i,1)==0) c=rs(s(rs(i,1)+1),8)
else c=rt(s(rs(i,1)+1),8)
i+=1})
define(spchar(s,i,c),{
if(and(i,1)==0) s(rs(i,1)+1)=xor(ls(c,8),rt(s(rs(i,1)+1),8))
else s(rs(i,1)+1)=xor(lt(s(rs(i,1)+1),8),c)
i+=1})
define(getc(c),getch(c,STDIN))
define(IS_DIGIT(d),('0'c<=d&&d<='9'c))
define(IS_LETTER(l),(IS_UPPER(l)||IS_LOWER(l)))
define(IS_LOWER(l),('a'c<=l&&l<='z'c))
define(IS_UPPER(l),('A'c<=l&&l<='Z'c))
define(LIBRARY_DEFS,"=incl=/lib_def.r.i")
define(longint,integer*4)
define(longreal,real*8)
define(NETWORK_DEFS,"=incl=/x$keys.r.i")
define(NET_DEFS,"=incl=/net_def.r.i")
define(pointer,integer)
define(PRIMOS_ERRD,"=incl=/errd.r.i")
define(PRIMOS_KEYS,"=incl=/keys.r.i")
define(putc(c),putch(c,STDOUT))
define(SET_OF_UPPER_CASE,'A'c,'B'c,'C'c,'D'c,'E'c,'F'c,'G'c,'H'c,'I'c,
'J'c,'K'c,'L'c,'M'c,'N'c,'O'c,'P'c,'Q'c,'R'c,'S'c,'T'c,'U'c,'V'c,'W'c,
'X'c,'Y'c,'Z'c)
define(SET_OF_LOWER_CASE,'a'c,'b'c,'c'c,'d'c,'e'c,'f'c,'g'c,'h'c,'i'c,
'j'c,'k'c,'l'c,'m'c,'n'c,'o'c,'p'c,'q'c,'r'c,'s'c,'t'c,'u'c,'v'c,'w'c,
'x'c,'y'c,'z'c)
define(SET_OF_LETTERS,SET_OF_UPPER_CASE,SET_OF_LOWER_CASE)
define(SET_OF_DIGITS,'0'c,'1'c,'2'c,'3'c,'4'c,'5'c,'6'c,'7'c,'8'c,'9'c)
define(SET_OF_CONTROL_CHAR,NUL,SOH,STX,ETX,EOT,ENQ,ACK,BEL,BS,HT,LF,
VT,FF,CR,SO,SI,DLE,DC1,DC2,DC3,DC4,NAK,SYN,ETB,CAN,EM,SUB,ESC,FS,
GS,RS,US)
define(SET_OF_SPECIAL_CHAR,' 'c,'!'c,'"'c,'#'c,'$'c,'%'c,'&'c,"'"c,'('c,
')'c,'*'c,'+'c,','c,'-'c,'.'c,'/'c,':'c,';'c,'<'c,'='c,'>'c,'?'c,'@'c,
'['c,'\'c,']'c,'^'c,'_'c,'`'c,'{'c,'|'c,'}'c,'~'c)
define(SET_OF_GRAPHICS,SET_OF_LETTERS,SET_OF_DIGITS,SET_OF_SPECIAL_CHAR)
define(SKIPBL(s,i),while(s(i)==' 'c)i+=1)
define(SWT_COMMON,"=incl=/swt_com.r.i")
define(TRUE,.true.)
define(DS_DECL(a,s),integer a(s);common/ds$mem/a)
define(USER_TYPES,"=incl=/user_types.r.i")
define(ACL_COMMON,"=incl=/acl_com.r.i")


# Status and action symbols:

define(ABS,0)        # 'seekf': absolute positioning
define(REL,1)        # 'seekf': relative positioning

define(DIGIT,'0'c)   # returned by 'type'
define(LETTER,'a'c)

define(LOWER,1)      # 'mapstr': map to lower case
define(UPPER,2)      # 'mapstr': map to upper case

define(READ,1)       # 'open': open file for reading
define(WRITE,2)      # 'open': open file for writing
define(READWRITE,3)  # 'open': open file for reading and writing

define(EOF,-1)       # end of file
define(OK,-2)        # non-error status
define(ERR,-3)       # error status

define(EOS,0)        # end of string

define(LAMBDA,0)     # end of list marker

define(NO,0)
define(YES,1)

define(PG_END,1)           # If set, 'page' returns after last page
define(PG_VTH,2)           # If set, 'page' uses VTH for the display

define(SYS_DATE,1)         # 'date': return current date
define(SYS_TIME,2)         # 'date': return current time
define(SYS_USERID,3)       # 'date': return user's login name
define(SYS_PIDSTR,4)       # 'date': process id as a string
define(SYS_DAY,5)          # 'date': current day of week
define(SYS_PID,6)          # 'date': user's process id
define(SYS_LDATE,7)        # 'date': current day of week, month, day, year
define(SYS_MINUTES,8)      # 'date': minutes past midnight in str (1..2)
define(SYS_SECONDS,9)      # 'date': seconds past midnight in str (1..2)
define(SYS_MSEC,10)        # 'date': msec. past midnight in str (1..2)

define(TA_SE_USEABLE,1)    # 'gtattr': does 'se' support terminal?
define(TA_VTH_USEABLE,2)   # 'gtattr': does 'vth' support terminal?
define(TA_UPPER_ONLY,3)    # 'gtattr': is terminal upper case only?


# Standard port definitions:

define(STDIN1,-10)
define(STDOUT1,-11)
define(STDIN2,-12)
define(STDOUT2,-13)
define(STDIN3,-14)
define(STDOUT3,-15)
define(STDIN,STDIN1)
define(STDOUT,STDOUT1)
define(ERRIN,STDIN3)
define(ERROUT,STDOUT3)
define(TTY,1)              # always references the terminal


# Limit definitions:

define(CHARS_PER_WORD,2)   # number of characters per machine word
define(MAXINT,8r77777)     # maximum single precision integer value
define(MAXARG,128)         # maximum size of an argument array
define(MAXCARD,101)        # maximum string length (excluding EOS)
define(MAXDECODE,200)      # maximum size of decoded string
define(MAXDIRENTRY,32)     # maximum size of an entry from dir$rd
define(MAXFNAME,33)        # maximum size of a filename array
define(MAXPACKEDFNAME,16)  # (MAXFNAME-1)/2 for fortran holleriths
define(MAXVARYFNAME,17)    # (MAXFNAME-1)/2+1 for pl/i strings
define(MAXLINE,102)        # should be one more than MAXCARD
define(MAXPAT,256)         # maximum size of a pattern array
define(MAXPATH,180)        # maximum size of a pathname array
define(MAXPRINT,300)       # maximum size of output from 'print'
define(MAXSTR,100)
define(MAXTERMATTR,6)      # number of terminal attributes
define(MAXTERMTYPE,7)      # maximum size of terminal type
define(MAXTREE,256)        # maximum number of characters in a treename
define(MAXUSERNAME,33)     # maximum size of user name string
define(MAXPACKEDUSERNAME,16)  # (MAXUSERNAME-1)/2 for hollerith strings
define(MAXACLLIST,200)     # maximum size of an acl input list


# Miscellaneous definitions:

define(ESCAPE,'@'c)        # Subsystem escape character
define(NOT,'~'c)
define(DISABLE,1)          # Primos break$: disable breaks
define(ENABLE,0)           # Primos break$: enable breaks


#  vth subroutine parameter definitions

define (STATUS_ROW,1)            # 'vtopt': enable status row
define (INPUT_WAIT,2)            # 'vtopt': 
define (DISPLAY_TIME,3)          # 'vtopt': display time of day
define (UNPRINTABLE_CHAR,4)      # 'vtopt': enable unprintable replacement
define (SET_TABS,5)              # 'vtopt': set tab stops

define (VT_MAXRC,1)              # 'vtinfo': return max row/col
define (VT_WRAP,2)               # 'vtinfo': terminal wraps
define (VT_HWINS,3)              # 'vtinfo': terminal hardware insert
define (VT_HWDEL,4)              # 'vtinfo': terminal hardware delete
define (VT_HWCEL,5)              # 'vtinfo': terminal hardware clear eol
define (VT_BAUD,6)               # 'vtinfo': retrieve baud rate

define (CHAR, -1)                # 'vt$get'/'vtread': 
define (TIMEOUT, -2)             # 'vt$get'/'vtread': timed-out while waiting for input
define (ATTN, -3)                # 'vt$get'/'vtread': attention
define (ENTER, -4)               # 'vt$get'/'vtread': normal return
define (PF, -5)                  # 'vt$get'/'vtread': perform function


#  acl control definitions

define(FILE_UFDQUOTA,1)
define(FILE_TYPE,2)
define(FILE_DMBITS,3)
define(FILE_RWLOCK,4)
define(FILE_TIMMOD,5)
define(FILE_ACL,6)
define(FILE_ACCESS,7)
define(FILE_PRIORITYACL,8)
define(FILE_DELSWITCH,9)
define(FILE_SIZE,10)
define(FILE_FULLINFO,20)

define(FILE_PROTECTION,50)    #  these keys will not be supported at
define(FILE_PASSWORDS,51)     # some future revision
