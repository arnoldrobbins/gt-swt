* FIXP --- DO DIRTY WORK OF PARITY AND BLANK COMPRESSION, ET AL

           SUBR    FIXP
           SEG
           RLIT

FIXP       ECB     START,,IN_FD,6
           DYNM    IN_FD(3),OUT_FD(3),CASE(3),CNTRL(3),CRLF(3),NULL(3)
           DYNM    TEMP,COUNT,LEN,REGSAV(27)
BUFFER     BSS     1024                    MORE EFFICIENT AS 1K
OBUF       BSS     1024
*
START      ARGT
           LDA     NULL,*                  REMOVE NULLS ?
           BNE     DROP_NULL
           LDA     ='100000                UNCONDITIONAL SKIP
           STA     NULL_SK
DROP_NULL  LDA     CNTRL,*
           BNE     DROP_CTRL0
           LDA     ='1                     NOP
           STA     CNTRL_1
           JMP     DROP_CTRL
DROP_CTRL0 LDA     =1
           STA     CNTRL_2
DROP_CTRL  LDA     CASE,*
           STA     CASE                    LOCALIZE REFERENCE
           LDA     CRLF,*
           STA     CRLF
*
           LFLI    1,2048
           EAFA    1,OBUF
           CRA
           STA     COUNT
           TAX
           JST     READIN
           JMP     ORIT
*
LOOP       LDC     0
           BCNE    ORIT
           JST     READIN
NULL_SK    EQU     *
ORIT       SNZ
           JMP#    LOOP
           CAS     ='221           ALREADY HAVE BLANK COMPRESSION ?
           JMP#    ORIT2
           SKP
           JMP#    ORIT2
           LDC     0               SET OUR COMPRESSION COUNT
           BCNE    * + 3
           JST#    READIN
           ADD     COUNT
           STA     COUNT
           BIX     LOOP
*
ORIT2      ORA     ='200           SET PARITY ON
           CAS     ='240
           JMP#    LETTER
           JMP#    BLANK
*
           CAS     ='212           IS IT A NEW LINE ?
           JMP#    CRCHECK
           JMP#    IS_NL
           JMP#    LETTER - 1
           TFLL    0               CHECK FOR PADDING NULL
           LRR     1
           BCR     IS_NL           EVEN WORD BOUNDRY
           LDC     0               DISCARD THE PAD CHAR
           JMP     IS_NL
*
CRCHECK    CAS     ='215           IS IT A CARRIAGE RETURN ?
           JMP#    LETTER -1       NOPE
           SKP
           JMP#    LETTER - 1      NOPE
           LDA     CRLF            WHAT ARE WE TO DO ?
           CGT
           DEC     3
           DAC     IS_NL           TRANSLATE INTO NEW LINE
           DAC     LOOP            DROP IT
           LDA     ='215
           JMP     LETTER - 1
*
IS_NL      TXA
           SZE
           JST#    COMP
*
EOL        LDA     ='212
           STC     1
           BCNE    * + 3
           JST#    DUMP
           TFLL    1
           LRS     1
           BCR     LOOP
           CRA
           STC     1
           BCNE    LOOP
           JST     DUMP
           JMP     LOOP
*
BLANK      IRS     COUNT
           BIX     LOOP
*
CNTRL_1    EQU     *
           JMP#    LOOP
LETTER     STA     TEMP
           TXA
           BEQ     * + 3
           JST#    COMP
           LDA     CASE                    SEE IF WE DO A CASE MAP
           CGT
           DEC     3
           DAC     TO_LOWER
           DAC     TO_UPPER
           LDA     TEMP
LET_STORE  STC     1
           BCNE    LOOP
           JST     DUMP
           JMP     LOOP
*
TO_LOWER   LDA     TEMP
           CAS     =R'A'-1
           CAS#    =R'Z'+1
           JMP#    LET_STORE
           JMP#    LET_STORE
           ORA     ='40
           JMP     LET_STORE
*
TO_UPPER   LDA     TEMP
           CAS     =R'a'-1
           CAS#    =R'z'+1
           JMP#    LET_STORE
           JMP#    LET_STORE
           ERA     ='40
           JMP     LET_STORE
*
*
*
**** START OF INTERNAL ROUTINES ****
*
*
COMP       DAC     **
           LDA     COUNT
           CAS     =2              SEE IF IT'S WORTH IT
CNTRL_2    EQU     *
           JMP#    DOCM            YUP
           NOP                     NOPE
           LDX     COUNT
           LDA     ='240
OUTSP      STC     1
           BCNE    OUTSPN
           JST     DUMP
OUTSPN     BDX     OUTSP
RESET      CRA
           STA     COUNT
           TAX
           JMP#    COMP,*
*
DOCM       LDA     ='221           COMPRESSION CHARACTER
           STC     1
           BCNE    DOCM2
           JST     DUMP
DOCM2      LDA     COUNT
           STC     1
           BCNE    RESET
           JST     DUMP
           JMP     RESET
*
*
READIN     DAC     **
           RSAV    REGSAV
           CALL    READF
           AP      BUFFER,S
           AP      =1024,S
           AP      IN_FD,*SL
           STA     TEMP
           RRST    REGSAV
           LDA     TEMP
           BGT     NOT_DONE
           JST#    DUMP
           LDA     TEMP
           PRTN
*
NOT_DONE   XCA
           LLL     1
           TLFL    0
           EAFA    0,BUFFER
           LDC     0
           JMP#    READIN,*
*
*
DUMP       DAC     **
           RSAV    REGSAV
           TFLL    1
           XCB
           SUB     =2049
           TCA
           ARS     1
           STA     LEN
           CALL    WRITEF
           AP      OBUF,S
           AP      LEN,S
           AP      OUT_FD,*SL
           RRST    REGSAV
           EAFA    1,OBUF
           LFLI    1,2048
           STC     1
           JMP#    DUMP,*
*
           END     FIXP
