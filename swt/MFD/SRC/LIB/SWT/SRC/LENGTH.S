* length --- returns length of a string
*
*  integer function length (str)
*  character str (ARB)

            SUBR     LENGTH

            SEG
            RLIT

include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"

            LINK
LENGTH      ECB      LENGTH$,,STR,1
            DATA     6,C'LENGTH'
            PROC

            DYNM     =20,STR(3)

LENGTH$     ARGT
            ENTR     LENGTH

            EAXB     STR,*          XB := STR
            LDX      =0             X := 0
            LDA      =EOS

LOOP        CAS      XB%,X          if (XB+X)^ = EOS then
            JMP      *+2               goto OUT
            JMP      OUT
            BIX      LOOP           X := X + 1; goto LOOP

OUT         TXA                     return X
            PRTN

            END
