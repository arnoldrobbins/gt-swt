* dgetl$ --- read one line from a disk file
*
* integer functin dgetl$ (line, length, fd)
* character line (ARB)
* integer length
* fd_struct fd

            SUBR     DGETL$   (LINE, LENGTH, FD)

            SEG
            RLIT

include "=syscom=/keys.ins.pma"
include "=syscom=/errd.ins.pma"
include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"
include "=incl=/swt_com.s.i"

            LINK
DGETL$      ECB      DGETL,,LINE,3
            DATA     6,C'DGETL$'
            PROC

            DYNM     =20,LINE(3),LENGTH(3),FD(3)
            DYNM     LFD(8),RETURN,XSAVE,NWR,BUFP(2)

UNIT        EQU      LFD+1
BUFSTART    EQU      LFD+2
BUFLEN      EQU      LFD+3
BUFEND      EQU      LFD+4
COUNT       EQU      LFD+5
BCOUNT      EQU      LFD+6
FLAGS       EQU      LFD+7

DGETL       ARGT
            ENTR     DGETL$

            EAXB     FD,*
            LDA      LENGTH,*       Get line length
            S1A                     Exclude space for EOS
            STA      LENGTH
            SUB      ='400          To allow short LB refs
            TAX
            EALB     LINE,*X        Access LINE through LB
            LDA      LENGTH
            TCA
            TAX                     LINE is indexed by X

            LDA      XB%+FDBCOUNT   Check for compressed blanks
            BLE      NOBLANKS
            TAY                     Save blank count in Y
            LDA      =BLANK
BLOOP1      STA      LB%+'400,X     Store a blank
            BDY      BUMPX1         Decrement blank count
            STY      XB%+FDBCOUNT   Count exhausted, clear FD_BCOUNT
            BIX      NOBLANKS          and bump LINE index
            JMP      STORE_EOS      End of LINE reached

BUMPX1      BIX      BLOOP1         Bump LINE index and loop back
            STY      XB%+FDBCOUNT   End of LINE reached, save count
            JMP      STORE_EOS

NOBLANKS    DFLD     XB%            Make a local copy of file descriptor
            DFST     LFD
            DFLD     XB%+4
            DFST     LFD+4

            LDY      BUFSTART       Construct pointer to buffer
            EAL      FDBUFADDR,*Y
            STL      BUFP           Save for later use by FILL_BUF
            LDA      COUNT          See of buffer is empty
            BNE      NOTEMPTY
            JSY      FILL_BUF       It is, go fill it
            JMP      LEFT_BYTE      Jump into fetch loop

NOTEMPTY    LDY      BUFEND         Make buffer addressable thru XB
            EAXB     FDBUFADDR,*Y
            TAY                     Buffer is indexed by Y
            LDA      FLAGS          See which byte to start with
            SPL                        0 => left
            JMP#     RIGHT_BYTE        1 => right

            EJCT

LEFT_BYTE   LDA      XB%,Y          Fetch word from buffer
            ICL                     Isolate left byte
            CAS      =DC1           Check for blank compression flag
            SKP
            JMP      DC1_LEFT
            STA      LB%+'400,X     Store character into LINE
            CAS      =LF            Check for NEWLINE
            SKP
            JMP#     LF_LEFT
            BIX      RIGHT_BYTE     Bump LINE index, get next byte
            JMP      END_LEFT       End of LINE reached

RIGHT_BYTE  LDA      XB%,Y          Fetch word from buffer
            CAL                     Isolate right byte
            CAS      =DC1           Check for blank compression flag
            SKP
            JMP      DC1_RIGHT
            STA      LB%+'400,X     Store character into LINE
            CAS      =LF            Check for NEWLINE
            SKP
            JMP#     LF_RIGHT
            BIX      BUMPY1         Bump LINE index
            BIY      END_RIGHT      End of LINE, bump buffer index
            JMP      END_RIGHT      End of buffer reached
BUMPY1      BIY      LEFT_BYTE      Bump buffer index, get next byte
            JSY      FILL_BUF       End of buffer reached, fill it
            JMP      LEFT_BYTE

            EJCT

DC1_LEFT    LDA      XB%,Y          Get blank count from right byte
            CAL
            STY      COUNT          Save buffer index
            TAY                     Put blank count in Y
            LDA      =BLANK
BLOOPL      STA      LB%+'400,X
            BDY      BUMPXL
            LDY      COUNT          Restore buffer index
            BIX      BUMPYL         Bump LINE index
            IRS#     3              Bump buffer index
            RCB                     Ignore end condition
            JMP      END_RIGHT      End of LINE reached
BUMPYL      BIY      LEFT_BYTE      Bump buffer index, get next byte
            JSY      FILL_BUF       Buffer empty, fill it
            JMP      LEFT_BYTE
BUMPXL      BIX      BLOOPL         Bump line index, loop back
            STY      BCOUNT         End of LINE, save residual count
            LDY      COUNT          Restore buffer index
            IRS#     3              Bump buffer index
            RCB                     Ignore end condition
            JMP      END_RIGHT

DC1_RIGHT   BIY      GET_COUNT      Bump buffer index
            JSY      FILL_BUF       Buffer is empty, fill it
GET_COUNT   LDA      XB%,Y          Get blank count from left byte
            ICL
            STY      COUNT          Save buffer index
            TAY                     Put blank count in Y
            LDA      =BLANK
BLOOPR      STA      LB%+'400,X     Store a blank in LINE
            BDY      BUMPXR         Decrement count
            LDY      COUNT          No more blanks, restore buffer index
            BIX      RIGHT_BYTE     Bump LINE index, get next byte
            JMP      END_LEFT       End of LINE
BUMPXR      BIX      BLOOPR         Bump LINE index, loop back
            STY      BCOUNT         End of LINE, save residual count
            LDY      COUNT          Restore buffer index
            JMP      END_LEFT

            EJCT

FILL_BUF    STY      RETURN         Save return address
            STX      XSAVE          Save X register across call
            PCL      PRWFADDR,*Read next chunk from disk file
            AP       =K$READ+K$CONV,S
            AP       UNIT,S
            AP       BUFP,S
            AP       BUFLEN,S
            AP       =0L,S
            AP       NWR,S
            AP       CODEADDR,*SL

            LDX      XSAVE          Restore X register
            LDA      CODEADDR,*     Test return code
            BEQ      FILL_OK
            ERA      =E$EOF         Check for end of file
            BEQ      FILL_EOF
            CRA                     Clear NWR
            STA      NWR
            LDA      =FDERR         Some other error, set bit in FLAGS
            SKP
FILL_EOF    LDA#     =FDEOF         Set EOF bit in FLAGS
            ORA      FLAGS
            STA      FLAGS

FILL_OK     LDA      NWR            See how much we got
            STA      COUNT
            BEQ      RETURN_FD
            ADD      BUFSTART       Compute new end of buffer
            STA      BUFEND
            TAY                     Construct pointer to same
            EAXB     FDBUFADDR,*Y
            LDA      NWR            Set up Y with -NWR
            TCA
            TAY
            LDA      RETURN
            STA#     7

            EXT      PRWF$$
PRWFADDR    IP       PRWF$$
FDBUFADDR   IP       FDBUF
CODEADDR    IP       ERRCOD

LF_RIGHT    EQU      *
LF_LEFT     IRX                     Bump LINE index
            RCB
            BIY      END_RIGHT      Bump buffer index
            JMP      END_RIGHT      In case buffer is empty

END_LEFT    LDA      FLAGS          Set byte indicator for right byte
            SSM
            JMP      SET_BYTE

END_RIGHT   LDA      FLAGS          Set byte indicator for left byte
            SSP

SET_BYTE    STA      FLAGS
            STY      COUNT          Save buffer count
RETURN_FD   EAXB     FD,*           Copy back local version of FD
            DFLD     LFD+4             copy only modified portion
            DFST     XB%+4
STORE_EOS   LDA      =EOS           Terminate LINE
            STA      LB%+'400,X
            TXA                     Return length of LINE
            ADD      LENGTH
            PRTN

            END
