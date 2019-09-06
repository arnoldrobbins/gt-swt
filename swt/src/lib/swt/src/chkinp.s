* chkinp --- check for terminal input availability
*
*  logical function chkinp (flag)
*  logical flag

            SUBR     CHKINP

            SEG
            RLIT

include "=incl=/lib_def.s.i"

            LINK
CHKINP      ECB      START,,FLAG,1
            DATA     6,C'CHKINP'
            PROC

            DYNM     =20,FLAG(3)

START       ARGT
            ENTR     CHKINP

            LT
            E64R
            D64R
            SKS      '704
            CRA
            E64V
            D64V
            STA      FLAG,*
            PRTN

            END
