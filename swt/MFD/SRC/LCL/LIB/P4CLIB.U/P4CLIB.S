*           P-Code Interpreter Runtime Package

*           This module contains the following routines:

*           P$FJP       False jump
*           P$XJP       Indexed jump
*           P$CUP       Call user procedure
*           P$RET       Return from procedure
*           P$BOMB      Handle exceptional conditions
*           P$SPC       Store packed character
*           P$LPC       Load packed character

            SEG
            RLIT

            ENT         P$FJP,FJPECB
            ENT         P$XJP,XJPECB
            ENT         P$CUP,CUPECB
            ENT         P$RET,RETECB
            ENT         P$BOMB,BOMBECB
            ENT         P$SPC,SPCECB
            ENT         P$LPC,LPCECB

            EXT         CSTORE
            EXT         SP
            EXT         MP
            EXT         EP
            EXT         NP
CSTORE      COMM        STOREX

            DYNM        P(3),Q(3),ERRADR
F_ARG       EQU         P
ERROUT      EQU         -15

            EJCT
* p$fjp --- False jump instruction processor

P$FJP       ARGT                    Q
            FLX         SP
            LDL         STOREX,X    Get top of stack
            BLNE        RTN         Ignore if TRUE
            LDA         F_ARG,*     Pick up branch address
            STA         SB%+3       Modify return address

RTN         LDA         SP          Pop stack
            S1A
            STA         SP
            PRTN


            LINK
FJPECB      ECB         P$FJP,,F_ARG,1
            PROC
            EJCT
* p$xjp --- Indexed jump instruction processor

P$XJP       ARGT                    Q
            FLX         SP
            LDA         STOREX+1,X  Pick up index value
            ADD         F_ARG,*     Compute effective address
            STA         SB%+3       Modify return address

            LDA         SP          Pop stack
            S1A
            STA         SP
            PRTN

            LINK
XJPECB      ECB         P$XJP,,F_ARG,1
            PROC
            EJCT
* p$cup --- Call user procedure instruction processor

P$CUP       ARGT                    P
            LDA         P,*         P is number of locations for parameters
            ADD         =5-1        Plus 5 locations for mark information
            TCA
            ADD         SP
            STA         MP          Update Mark Pointer
            PRTN

            LINK
CUPECB      ECB         P$CUP,,P,1
            PROC
            EJCT
* p$ret --- Return instruction processor

P$RET       ARGT
            LDA         P,*         Get P field
            LEQ
            ARL         1           Set C-bit if P was zero
            LDA         MP
            SRC                     Skip if P was non-zero
            S1A
            STA         SP          Restore stack pointer
            FLX         MP
            LDA         STOREX+7,X  Get saved EP register
            STA         EP
            LDA         STOREX+5,X  Get saved mark pointer
            STA         MP
            PRTN


            LINK
RETECB      ECB         P$RET,,P,1
            PROC
            EJCT
* p$bomb --- Handle exceptional conditions (i.e. give up)

P$BOMB      ARGT                    Message
            CALL        PUTCH       Print a NEWLINE
            AP          ='212,S
            AP          =-15,SL

            CALL        REMARK      Print caller's message
            AP          F_ARG,*SL

            CALL        PRINT       Print register contents
            AP          =-15,S
            AP          FMT,S
            AP          MP,S
            AP          SP,S
            AP          EP,S
            AP          NP,SL

            CALL        P$WALK      Print procedure walkback
            CALL        SWT         Bomb out to SWT shell


            LINK
BOMBECB     ECB         P$BOMB,,F_ARG,1
FMT         BCI         "mp = *i, sp = *i, ep = *i, np = *i*n*n."
            PROC
            EJCT
* p$spc --- Store packed character

P$SPC       LDA         SP
            SUB         =3          Pop stack
            STA         SP
            A1A
            ALL         1
            TAX
            EAXB        STOREX,X    Point to new top of stack + 1
            LDL         XB%         Get store index of string
            LLL         2           Convert to byte index
            ADL         XB%+2       Add position within string
            LRL         1           Word index, set c-bit if odd byte
            TBA
            TAX
            LDA         STOREX,X    Get destination word
            SSC                     Skip if we're storing odd byte
            ICA                     Swap bytes
            CAR
            ERA         XB%+5       Insert new character
            SSC
            ICA                     Put bytes back in right order
            STA         STOREX,X
            PRTN
            LINK
SPCECB      ECB         P$SPC
            PROC
            EJCT
* p$lpc --- Load packed character

P$LPC       LDA         SP
            S1A                     Pop stack
            STA         SP
            ALL         1
            TAX
            EAXB        STOREX,X    Point to new top of stack
            LDL         XB%         Get store index of string
            LLL         2           Convert to byte index
            ADL         XB%+2       Add position within string
            LRL         1           Word index, set c-bit if odd byte
            TBA
            TAX
            LDA         STOREX,X
            SSC                     Skip if we're getting odd byte
            ICL                     Swap bytes, even byte is now on right
            CAL                     Zero left byte
            XCA                     Convert to long integer
            STL         XB%         Put character on stack
            PRTN

            LINK
LPCECB      ECB         P$LPC
            PROC

            END
* p$walk --- Walk back through the stack

            SEG
            RLIT

            SUBR  P$WALK
            EXT   PRINT

            DYNM  REGISTERS(28), LASTFRAME

START       E64V
            RSAV  REGISTERS

            PCL   PRINTP,*    PRINT HEADING
            AP    =-15,S
            AP    HEADING,SL

            EALB  SB%         POINT TO CURRENT FRAME

LOOP        LDL   LB%+4       CHECK SAVED STACK REGISTER
            BLEQ  EXITLOOP      IT'S ZERO, NO CALLER
            STL   LASTFRAME
            EAL   LB%
            ANA   ='7777      MASK OUT RING NUMBER
            CLS   LASTFRAME   CHECK NEXT FRAME SAME AS THIS ONE
            SKP                 NO
            JMP   EXITLOOP      YES

            PCL   PRINTP,*
            AP    =-15,S
            AP    LINEFMT,S
            AP    LB%+12,S    LINE NUMBER
            AP    LB%+2,S     SAVED PBH
            AP    LB%+3,S     SAVED PBL
            AP    LB%+4,S     SAVED SBH
            AP    LB%+5,S     SAVED SBL
            AP    LB%+6,S     SAVED LBH
            AP    LB%+7,SL    SAVED LBL

            EALB  LB%+4,*     POINT TO CALLER'S FRAME
            JMP   LOOP

EXITLOOP    RRST  REGISTERS   RESTORE GENERAL REGISTERS

            PRTN

PRINTP      IP    PRINT

HEADING     BCI   '  LINE        PB%             SB%             LB%     '
            BCI   '   ROUTINE*n*n.'

LINEFMT     BCI   ' *5i   *6,8i/*6,-8i   *6,8i/*6,-8i   *6,8i/*6,-8i*n.'

P$WALK      ECB   START
            END
* movs2s --- Move blocks of memory around quickly

            SUBR  MOVE2S

            SEG
            RLIT

            DYNM  FROM_PTR(3),TO_PTR(3),NUM_WRDS(3)

            LINK
MOVE2S      ECB   MOVE,,FROM_PTR,3
            PROC

MOVE        ARGT
            LDL   FROM_PTR,*
            STL   FROM_PTR
            LDL   TO_PTR,*
            STL   TO_PTR
            LDA   NUM_WRDS,*
            SNZ
            PRTN
            TAX
            EAXB  FROM_PTR,*X
            EALB  TO_PTR,*X
            TCA
            TAX
            SLN
            JMP   L1
            LDA   XB%,X
            STA   LB%,X
            BIX   *+3
            PRTN
            TXA
L1          SAS   15
            JMP   L2
            LDL   XB%,X
            STL   LB%,X
            IRX
            BIX   *+3
            PRTN
            TXA
L2          SAS   14
            JMP   L3
            DFLD  XB%,X
            DFST  LB%,X
            ADD   =4
            SNZ
            PRTN
            TAX
L3          SAS   13
            JMP   L4
            DFLD  XB%,X
            DFST  LB%,X
            DFLD  XB%+4,X
            DFST  LB%+4,X
            ADD   =8
            SNZ
            PRTN
            TAX
L4          DFLD  XB%,X
            DFST  LB%,X
            DFLD  XB%+4,X
            DFST  LB%+4,X
            DFLD  XB%+8,X
            DFST  LB%+8,X
            DFLD  XB%+12,X
            DFST  LB%+12,X
            ADD   =16
            BNE   L4-1
            PRTN
            END
