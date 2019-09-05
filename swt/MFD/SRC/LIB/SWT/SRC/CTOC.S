* ctoc --- convert EOS-terminated string to EOS-terminated string

            SUBR     CTOC

            SEG
            RLIT

include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"

            LINK
CTOC        ECB      CTOC0,,FROM,3
            DATA     4,C'CTOC'
            PROC

            DYNM     =20,FROM(3),TO(3),LEN(3)

CTOC0       ARGT
            ENTR     CTOC

            LDX      =0
            LDA      LEN,*
            BEQ      OUT
            TAY
            EAXB     FROM,*
            EALB     TO,*
LOOP        LDA      XB%,X
            STA      LB%,X
            ERA      =EOS
            BEQ      OUT
            IRX
            BDY      LOOP
            DRX
            RCB
            LDA      =EOS
            STA      LB%,X
OUT         TXA
            PRTN

            END
