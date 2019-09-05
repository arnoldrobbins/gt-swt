* index --- find character  c  in string  str
*
*   integer function index (str, c)
*   character c, str (ARB)
*
*   for (index = 1; str (index) ~= EOS; index += 1)
*      if (str (index) == c)
*         return
*   index = 0
*   return
*   end

            SUBR     INDEX

            SEG
            RLIT

include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"

            LINK
INDEX       ECB      INDEX$,,STR,2
            DATA     5,C'INDEX'
            PROC

            DYNM     =20,STR(3),C(3)

INDEX$      ARGT
            ENTR     INDEX

            EAXB     STR,*          XB := STR
            LDX      =0             X := 0

LOOP        LDA      XB%+0,X        if (XB+X)^ = C then

            CAS      =EOS           if (XB+X)^ = EOS then
            JMP      *+2               go to NE
            JMP      NE

            CAS      C,*            if (XB+X)^ = C then
            JMP      *+2              go to EQ
            JMP      EQ

            BIX      LOOP           X := X + 1; goto LOOP

EQ          TXA                     return X + 1
            A1A
            PRTN

NE          CRA                     return 0
            PRTN

            END
