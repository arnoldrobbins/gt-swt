*  LAST  ==> HIGH SPEED LAST N LINES LIST
*
*   3/9/80    EUGENE SPAFFORD
*   1/29/81    MODIFIED
*

            SUBR     LAST

            SEG
            RLIT
            SYML

include "=syscom=/keys.ins.pma"

            LINK
LAST        ECB      START,,FUNIT,2
            DATA     4,C'LAST'
            PROC

            LINK
BUFFER      BSS      1024
IP_BUFF     IP       BUFFER
GARBAGE     COMM     PLACE('170000)
            PROC

            DYNM     ERCODE, POS(2), NW, COUNT(2)
            DYNM     PCOUNT, FUNIT(3), NLINES(3)

START       ARGT
            LDA      NLINES,*
            SPL
            LT
            A1A
            STA      NLINES
            ALS      1
            TXA
            LDL      =1L
            STL      POS
            CRL
            STL      COUNT
            STL      PLACE
            STA      PCOUNT
ZZ          STA      PLACE - 2,X
            BDX      ZZ
*
*
LOOP        CALL     PRWF$$
            AP       =K$READ+K$PRER+K$CONV,S
            AP       FUNIT,*S
            AP       IP_BUFF,S
            AP       =1024,S
            AP       =0L,S
            AP       NW,S
            AP       ERCODE,SL
*
*
            LDA      NW
            BEQ      DONE
            TAX
            TCA
            TAY
            EAXB     BUFFER + 0,X
            TXA
            PIDA
            ADL      POS
            STL      POS
*
LOOP2       LDA      XB% + 0,Y
            ERA      ='105212
            TAB
            CAR
            BEQ      INCR
RCHAR       TBA
            CAL
            BNE      NXTWRD
INCR        IRS#     COUNT + 1
            JMP#     * + 2
            IRS#     COUNT
            LDA      PCOUNT
            A1A
            CAS      NLINES
            RCB
            CRA
            STA      PCOUNT
            FLX      PCOUNT
            TYA
            PIDA
            ADL      POS
            STL      PLACE,X
NXTWRD      BIY      LOOP2
            JMP      LOOP
*
*
*   OKAY, TELL HOW MANY LINES WE HAVE AND PRINT THE LAST LINES...
*
DONE        LDA      PCOUNT
            A1A
            CAS      NLINES
            RCB
            CRA
            STA      PCOUNT
            FLX      PCOUNT
            LDL      PLACE,X
            STL      POS
*
            CALL     PRWF$$
            AP       =K$POSN+K$PREA,S
            AP       FUNIT,*S
            AP       =0,S
            AP       =0,S
            AP       POS,S
            AP       NW,S
            AP       ERCODE,SL
*
            LDA      ERCODE
            BEQ      L2
            LDA      =-1L
            PRTN
*
L2          LDL      COUNT
            PRTN
*
            END
