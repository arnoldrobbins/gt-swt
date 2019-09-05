* move$ --- move blocks of memory around quickly
*
*  subroutine move$ (from, to, count)
*  integer from (ARB), to (ARB), count
*
*  integer i
*
*  for (i = 1; i <= count; i += 1)
*     to (i) = from (i)
*
*  return
*  end

            SUBR     MOVE$

            SEG
            RLIT

include "=incl=/lib_def.s.i"

            LINK
MOVE$       ECB      MOVE,,FROM_PTR,3
            DATA     5,C'MOVE$'
            PROC

            DYNM     =20,FROM_PTR(3),TO_PTR(3),COUNT_PTR(3)

MOVE        ARGT
            ENTR     MOVE$

            LDA      COUNT_PTR,*
            SNZ
            PRTN
            TAX
            EAXB     FROM_PTR,*X
            EALB     TO_PTR,*X
            TCA
            TAX
            SLN
            JMP      L1
            LDA      XB%,X
            STA      LB%,X
            BIX      *+3
            PRTN
            TXA
L1          SAS      15
            JMP      L2
            LDL      XB%,X
            STL      LB%,X
            IRX
            BIX      *+3
            PRTN
            TXA
L2          SAS      14
            JMP      L3
            DFLD     XB%,X
            DFST     LB%,X
            ADD      =4
            SNZ
            PRTN
            TAX
L3          SAS      13
            JMP      L4
            DFLD     XB%,X
            DFST     LB%,X
            DFLD     XB%+4,X
            DFST     LB%+4,X
            ADD      =8
            SNZ
            PRTN
            TAX
L4          DFLD     XB%,X
            DFST     LB%,X
            DFLD     XB%+4,X
            DFST     LB%+4,X
            DFLD     XB%+8,X
            DFST     LB%+8,X
            DFLD     XB%+12,X
            DFST     LB%+12,X
            ADD      =16
            BNE      L4-1
            PRTN

            END
