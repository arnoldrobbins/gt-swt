* dputl$ --- put one line on a disk file

            SUBR     DPUTL$    (LINE, FD)

            SEG
            RLIT

include "=syscom=/keys.ins.pma"
include "=syscom=/errd.ins.pma"
include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"
include "=incl=/swt_com.s.i"

            LINK
DPUTL$      ECB      DPUTL,,LINE,2
            DATA     6,C'DPUTL$'
            PROC

            DYNM     =20,LINE(3),FD(3)
            DYNM     LFD(8),XSAVE,LSAVE(2),BUFP(2),RETURN(2),TEMP,JUNK

UNIT        EQU      LFD+1
BUFSTART    EQU      LFD+2
BUFLEN      EQU      LFD+3
BUFEND      EQU      LFD+4
COUNT       EQU      LFD+5
BCOUNT      EQU      LFD+6
FLAGS       EQU      LFD+7

DPUTL       ARGT
            ENTR     DPUTL$

            EAXB     FD,*
            DFLD     XB%
            DFST     LFD
            DFLD     XB%+4
            DFST     LFD+4

            EAL      *
            STA      RETURN

            LDX      BUFSTART
            EAL      FDBUFADDR,*X
            STL      BUFP
            LDX      BUFLEN
            EAXB     BUFP,*X
            LDY      COUNT
            LDX      =-'400
            EALB     LINE,*X
            LDX      =0

            LDA      FLAGS
            CSA
            LDA      BCOUNT
            BEQ      NOBLANKS
            BCR      BLANK_L
            LDA      XB%,Y
            STA      TEMP
            JMP      BLANK_R
NOBLANKS    BCR      LEFT_BYTE
            LDA      XB%,Y
            STA      TEMP
            JMP      RIGHT_BYTE

            EJCT

LEFT_BYTE   LDA      LB%+'400,X
            CAS      =BLANK
            SKP
            JMP#     BLANK_LEFT
            CAS      =EOS
            SKP
            JMP#     END_LEFT
STORE_LEFT  ICR
            CAS      =NEWLINE.LS.8
            SKP
            JMP#     STORE_RIGHT
            STA      TEMP
            BIX      RIGHT_BYTE
            JMP      END_LEFT

RIGHT_BYTE  LDA      LB%+'400,X
            CAS      =BLANK
            SKP
            JMP#     BLANK_RIGHT
            CAS      =EOS
            SKP
            JMP      END_RIGHT
            CAL
            ERA      TEMP
STORE_RIGHT STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            BIX      LEFT_BYTE
            JMP      END_RIGHT

            EJCT

BLANK_LEFT  IRS      BCOUNT
            RCB
            BIX      BLANK_L
            JMP#     PUTBL_LEFT
BLANK_L     LDA      LB%+'400,X
            CAS      =BLANK
            SKP
            JMP#     BLANK_LEFT
            CAS      =EOS
            SKP
            JMP#     END_LEFT
PUTBL_LEFT  IMA      BCOUNT
PUTBL_L     BLE      COMP_LEFT
            CAS      =2
            JMP#     COMP_LEFT
            JMP#     TWO_LEFT
            CRA
            IMA      BCOUNT
            CAL
            ERA      =BLANK.LS.8
            JMP      STORE_RIGHT
TWO_LEFT    LDA      =(BLANK.LS.8)+BLANK
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            CRA
            IMA      BCOUNT
            JMP      STORE_LEFT
COMP_LEFT   TAB
            CAS      =0
            CAS#     =256
            LDA#     =255
            LDA#     =255
            ERA      =DC1.LS.8
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            CAL
            IAB
            SUB#     2
            BNE      PUTBL_L
            IMA      BCOUNT
            JMP      STORE_LEFT

            EJCT

BLANK_RIGHT IRS      BCOUNT
            RCB
            BIX      BLANK_R
            JMP#     PUTBL_RIGHT
BLANK_R     LDA      LB%+'400,X
            CAS      =BLANK
            SKP
            JMP#     BLANK_RIGHT
            CAS      =EOS
            SKP
            JMP#     END_RIGHT
PUTBL_RIGHT IMA      BCOUNT
PUTBL_R     BLE      COMP_RIGHT
            CAS      =2
            JMP#     COMP_RIGHT
            JMP#     TWO_RIGHT
            CRA
            IMA      BCOUNT
            ICR
            IMA      TEMP
            ERA      =BLANK
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            LDA      TEMP
            CAS      =NEWLINE.LS.8
            SKP
            JMP#     STORE_RIGHT
            BIX      RIGHT_BYTE
            JMP      END_LEFT
TWO_RIGHT   LDA      TEMP
            ERA      =BLANK
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            CRA
            IMA      BCOUNT
            CAL
            ERA      =BLANK.LS.8
            JMP      STORE_RIGHT
COMP_RIGHT  TAB
            LDA      TEMP
            ERA      =DC1
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            TBA
            CAS      =0
            CAS#     =256
            LDA#     =255
            LDA      =255
            ICR
            STA      TEMP
            ICL
            IAB
            SUB#     2
            BNE      PUTBL_R
            IMA      BCOUNT
            CAL
            ERA      TEMP
            JMP      STORE_RIGHT

            EJCT

EMPTY_BUF   STL      LSAVE
            STX      XSAVE
            STY      RETURN+1
            PCL      PRWFADDR,*
            AP       =K$WRIT,S
            AP       UNIT,S
            AP       BUFP,S
            AP       BUFLEN,S
            AP       =0L,S
            AP       JUNK,S
            AP       CODEADDR,*SL

            LDA      CODEADDR,*
            BNE      EMPTY_ERR
            LDA      BUFLEN
            TAY
            EAXB     BUFP,*Y
            TCA
            TAY
            LDX      XSAVE
            LDL      LSAVE
            JMP%     RETURN,*

EMPTY_ERR   LDA      =FDERR
            ORA      FLAGS
            STA      FLAGS
            LDA      =ERR
            JMP      RETURN_FD

            EXT      PRWF$$
PRWFADDR    IP       PRWF$$
FDBUFADDR   IP       FDBUF
CODEADDR    IP       ERRCOD

            EJCT

END_LEFT    LDA      FLAGS
            SSP
            JMP      SET_FLAGS

END_RIGHT   LDA      TEMP
            STA      XB%,Y
            LDA      FLAGS
            SSM

SET_FLAGS   STA      FLAGS
            STY      COUNT
            TXA

RETURN_FD   EAXB     FD,*
            DFLD     LFD+4
            DFST     XB%+4
            PRTN

            END
