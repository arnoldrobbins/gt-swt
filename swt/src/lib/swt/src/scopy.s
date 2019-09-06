* scopy --- copy a string at from(i) to to(j)
*
*   integer function scopy (from, i, to, j)
*   character from (ARB), to (ARB)
*   integer i, j

            SUBR     SCOPY

            SEG
            RLIT

include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"

            LINK
SCOPY       ECB      SCOPY$,,FROM,4
            DATA     5,C'SCOPY'
            PROC

            DYNM     =20,FROM(3),I(3),TO(3),J(3)

SCOPY$      ARGT
            ENTR     SCOPY

            LDX      I,*            XB := FROM+I-1
            EAXB     FROM,*X

            LDX      J,*            LB := TO+J-1
            EALB     TO,*X

            LDX      =0

LOOP        LDA      XB%-1,X        (SB+x)^ := (LB+X)^
            STA      LB%-1,X
            CAS      =EOS           if (LB+X)^ = EOS then
            JMP      *+2               goto OUT
            JMP      OUT
            BIX      LOOP           X := X + 1; goto LOOP

OUT         TXA                     return X

            PRTN

            END
