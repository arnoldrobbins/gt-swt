* equal --- compare str1 to str2; return YES if equal
*
*   integer function equal (str1, str2)
*   character str1 (ARB), str2 (ARB)

            SUBR     EQUAL

            SEG
            RLIT

include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"

            LINK
EQUAL       ECB      EQUAL$,,STR1,2
            DATA     5,C'EQUAL'
            PROC

            DYNM     =20,STR1(3),STR2(3)

EQUAL$      ARGT
            ENTR     EQUAL

            EAXB     STR1,*         XB := STR1
            EALB     STR2,*         LB := STR2
            LDX      =0             X := 0

LOOP        LDA      XB%+0,X        if (XB+X)^ <> (LB+X)^ then
            CAS      LB%+0,X           goto NE
            JMP      NE
            JMP      *+2
            JMP      NE
            CAS      =EOS           if (XB+X)^ = EOS then
            JMP      *+2               go to EQ
            JMP      EQ
            BIX      LOOP           X := X + 1; goto LOOP

EQ          LDA      =YES           return YES
            PRTN

NE          LDA      =NO            return NO
            PRTN

            END
