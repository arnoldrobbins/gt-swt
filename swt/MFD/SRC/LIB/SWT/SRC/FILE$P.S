* file$p --- connect SWT i/o to a Pascal file
*
*    declaration:
*
*             type name = array [1..7] of char;
*
*             procedure file$p (var f: text; n: name);
*                       extern;
*
*    calling sequence:
*
*             file$p (pascal_file_variable, 'swt_file');
*
*    entry    (arg 1) = address of Pascal file block.
*             (arg 2) = string containing SWT file name.
*
*    exit     file connected.

            SUBR     FILE$P

            SEG
            RLIT

include "=syscom=/keys.ins.pma"
include "=syscom=/errd.ins.pma"
include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"

            LINK
FILE$P      ECB      CONNECT,,FILE,2
            DATA     6,C'FILE$P'
            PROC

            DYNM     =20,FILE(3),NAME(3),CODE,ADDR(2),INDEX,UNIT
            DYNM     SUNIT,PUNIT,I,PATH(MAXPATH),TREE(MAXPATH)

FCB_FLAG          EQU   XB%+0
FCB_CUR_POS_PTR   EQU   XB%+1
FCB_BUF_SIZE      EQU   XB%+4
FCB_UNIT_NUM      EQU   XB%+6
FCB_NUM_OBJ       EQU   XB%+7
FCB_OBJ_SIZE      EQU   XB%+8
FCB_FILE_NAME     EQU   XB%+10
FCB_TOTAL_OBJ     EQU   XB%+74
FCB_BUFFER        EQU   XB%+75

CONNECT     ARGT                    transfer arguments
            ENTR     FILE$P

            EAL      CONNECTA       set address of first file name
            STL      ADDR

            LDX      =10            get number of SWT file names
            LDY      =2             get offset halfway through name

CONNECT1    LDL      ADDR,*         check first 4 characters of name
            SBL      NAME,*
            BCNE     CONNECT2       if not a match

            LDL      ADDR,*Y        check remainder of name
            ERL      NAME,*Y
            ANL      =-256L         clear last character
            BLEQ     CONNECT3       if a match

CONNECT2    LDL      ADDR           advance address to next entry
            ADL      =4L
            STL      ADDR
            BDX      CONNECT1       continue search

            CALL     ERRPR$         signal bad file name error
            AP       =K$NRTN,S
            AP       =E$BNAM,S
            AP       =0,S
            AP       =0,S
            AP       =C'FILE$P',S
            AP       =6,SL

CONNECT3    STX      INDEX          save loop index
            LDA      =10            calculate index into units
            SUB      INDEX          0 = STDIN, 1 = STDIN1, etc.
            TAX

            LDA      CONNECTB,X     set requested unit number
            STA      UNIT

            CALL     MAPSU          convert unit to SWT unit number
            AP       UNIT,SL
            STA      SUNIT

            CALL     FLUSH$         flush file buffer
            AP       SUNIT,SL

            CALL     MAPFD          convert unit to PRIMOS unit number
            AP       UNIT,SL
            STA      PUNIT

            BLE      CONNECT7       if file is not on disk

            CALL     ATTDEV         attach requested file
            AP       PUNIT,S
            AP       =7,S           select compressed disk file
            AP       PUNIT,S
            AP       =128,SL        buffer is 128 words

            EAXB     FILE,*         get address of file control block

            LDA      INDEX          see if file is input or output
            SUB      =6
            BCLT     CONNECT4       if file is a standard output

            LDA      =B'1110010000000000'    set input file values
            STA      FCB_FLAG

            CRA                     clear number of objects
            STA      FCB_NUM_OBJ

            JMP      CONNECT6

CONNECT4    LDA      =B'0111010000000000'    set output file values
            STA      FCB_FLAG

            LDA      =1             set number of objects to 1
            STA      FCB_NUM_OBJ

            LDA      =C'  '         blank fill the buffer
            LDX      =128
CONNECT5    STA      FCB_BUFFER-1,X
            BDX      CONNECT5

CONNECT6    LDA      PUNIT          set file unit number
            STA      FCB_UNIT_NUM

            JMP      CONNECT11

CONNECT7    EAXB     FILE,*         get address of file control block

            LDA      INDEX          see if file in input or output
            SUB      =6
            BCLT     CONNECT8       if file is a standard output

            LDA      =B'1110011000000000'    set input file value
            STA      FCB_FLAG

            CRA                     clear number of objects
            STA      FCB_NUM_OBJ

            JMP      CONNECT10

CONNECT8    LDA      =B'0111011000000000'    set output file values
            STA      FCB_FLAG

            LDA      =1             set number of objects
            STA      FCB_NUM_OBJ

            LDA      =C'  '         blank fill the buffer
            LDX      =128
CONNECT9    STA      FCB_BUFFER-1,X
            BDX      CONNECT9

CONNECT10   LDA      =1             set terminal file unit
            STA      FCB_UNIT_NUM


CONNECT11   EAL      FCB_BUFFER     get a pointer to the buffer
            STL      FCB_CUR_POS_PTR
            CRA                     clear bit offset
            STA      FCB_CUR_POS_PTR+2

            LDA      =256           initialize the buffer size
            STA      FCB_TOTAL_OBJ
            XCA
            STL      FCB_BUF_SIZE

            LDL      =1L            set object size to 1 byte
            STL      FCB_OBJ_SIZE

CLEAR_FNAME LDA      =C'  '         blank out the file name
            LDX      =64
CONNECT12   STA      FCB_FILE_NAME-1,X
            BDX      CONNECT12

GET_FNAME   CALL     GFNAM$         get the name of the file
            AP       UNIT,S
            AP       PATH,S
            AP       =MAXPATH,SL

            CAS      =ERR           did we get it?
            SKP
            JMP#     STORE_BAD_PATH    nope, store bad pathname

CHECK_TTY   CALL     PTOC           is the file
            AP       DEV_TTY,S      is connected to the
            AP       =PERIOD,S      terminal device ("/dev/tty") ?
            AP       TREE,S
            AP       =MAXPATH,SL

            CALL     EQUAL
            AP       PATH,S
            AP       TREE,SL

            CAS      =YES
            SKP
            JMP#     STORE_TTY

CHECK_NULL  CALL     PTOC           is the file
            AP       DEV_NULL,S     connected to the
            AP       =PERIOD,S      null device ("/dev/null") ?
            AP       TREE,S
            AP       =MAXPATH,SL

            CALL     EQUAL
            AP       PATH,S
            AP       TREE,SL

            CAS      =YES           Yes it is, Pascal doesn't
            SKP                     support I/O to /dev/null
            JMP#     STORE_TTY      use /dev/tty as filename


            CALL     MKTR$          it is a valid disk file
            AP       PATH,S
            AP       TREE,SL

            LDA      =1             store the file name into
            STA      I              the Pascal file control
            CALL     CTOP           block
            AP       TREE,S
            AP       I,S
            AP       FILE,*
            AP       FCB_FILE_NAME,S
            AP       =64,SL

            PRTN

STORE_TTY   CALL     MOVE$          store the TTY name into
            AP       TTY_PATH,S     the Pascal file control
            AP       FILE,*         block
            AP       FCB_FILE_NAME,S
            AP       =2,SL

            PRTN

STORE_BAD_PATH CALL  MOVE$          store the Bad Pathname message
            AP       BAD_PATH,S     into the Pascal file control
            AP       FILE,*         block
            AP       FCB_FILE_NAME,S
            AP       =9,SL

            PRTN

            LINK

CONNECTA    BCI      'STDIN  '      table of SWT file names
            BCI      'STDIN1 '
            BCI      'STDIN2 '
            BCI      'STDIN3 '
            BCI      'ERRIN  '
            BCI      'STDOUT '
            BCI      'STDOUT1'
            BCI      'STDOUT2'
            BCI      'STDOUT3'
            BCI      'ERROUT '

CONNECTB    DATA     STDIN          table of corresponding units
            DATA     STDIN1
            DATA     STDIN2
            DATA     STDIN3
            DATA     ERRIN
            DATA     STDOUT
            DATA     STDOUT1
            DATA     STDOUT2
            DATA     STDOUT3
            DATA     ERROUT

DEV_NULL    BCI      '/dev/null.'

DEV_TTY     BCI      '/dev/tty.'

BAD_PATH    BCI      'path unobtainable '

TTY_PATH    BCI      'TTY '

            END
