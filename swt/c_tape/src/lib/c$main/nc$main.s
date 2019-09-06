* nc$main --- C language runtime startoff routine
*             collects arguments, and initializes environment
*
*             special version for bare primos
*
            SEG
            SYML
            RLIT

            SUBR     C$MAIN
            EXT      MAIN
            EXT      ENVIRON
            EXT      ENVINIT

            LINK
C$MAIN      ECB      L1
            DATA     7,C'nc$main'
            PROC

MAXARGV     EQU      256
MAXBUF      EQU      1024
EOF         EQU      -1

            DYNM     =20
            DYNM     BUFPTR(2),BUFSIZ,BC,LEN
            DYNM     ARGC,ARGV(MAXARGV*2+2),BUF(MAXBUF),ENVP(2)

L1          EQU      *
            EAL      C$MAIN         make trace information
            STL      SB% + 18       available
            LDA      ='4000
            STA      SB% + 0

            CALL     ICOMN$         initialize swt common blocks
            PCL      ENVINIT        Set up environment
            EAXB     MAIN
            LDA      XB%+5          Check argument count
            BNE      L2
            PCL      MAIN           Not expecting arguments
            CALL     EXIT
            AP       =0,SL          Exit will close all files and do STOP$

L2          EQU      *              Copy args, construct ARGV & ARGC

            CRA
            STA      BC
            JMP      L3

LOOP        EQU      *
            LDA      ARGC
            A1A
L3          EQU      *
            STA      ARGC
            CAS      =MAXARGV       too many args?
            JMP#     CALL_MAIN      yep
            JMP#     CALL_MAIN
            LDA      BC             nope
            CAS      =MAXBUF        filled up arg buffer yet?
            JMP#     CALL_MAIN      yep
            JMP#     CALL_MAIN
            TAX                     nope
            EAL      BUF,X          keep getting args
            FLX      ARGC
            STL      ARGV,X
            STL      BUFPTR
            LDA      =MAXBUF
            SUB      BC
            STA      BUFSIZ
            CALL     GETARG
            AP       ARGC,S
            AP       BUFPTR,*S
            AP       BUFSIZ,SL
            STA      LEN
            ERA      =EOF           out of args?
            BEQ      CALL_MAIN      yep

            LDA      LEN            no, increase count, get next
            A1A
            ADD      BC
            STA      BC
            TAX
            CRA
            STA      BUF-1,X
            JMP      LOOP

CALL_MAIN   EQU      *
            FLX      ARGC
            CRL
            STL      ARGV,X         stick NULL pointer at end of argv

            LDL      ENVIRON        initialized by envinit
            STL      ENVP

            EAXB     MAIN
            LDA      XB% + 5        check arg count
            STA      BC

            CGT
            DATA     3
            DAC      CALL1
            DAC      CALL2

CALL3       EQU      *              call main with 3 args
            PCL      MAIN
            AP       ARGC,S
            AP       ARGV,S
            AP       ENVP,*SL       indirect, to pass pointer by value
*                                   like the rest of C

            CALL     EXIT
            AP       =0,SL

CALL2       EQU      *              call main with 2 args
            PCL      MAIN
            AP       ARGC,S
            AP       ARGV,SL

            CALL     EXIT
            AP       =0,SL

CALL1       EQU      *              call main with only 1 arg
            PCL      MAIN
            AP       ARGC,SL

            CALL     EXIT
            AP       =0,SL

            END      C$MAIN
