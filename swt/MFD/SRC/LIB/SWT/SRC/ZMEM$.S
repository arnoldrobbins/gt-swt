* zmem$ --- clear uninitialized part of a segment for ldseg$

            SUBR     ZMEM$   (symbol_table_node)

            SEG
            RLIT

include "=incl=/lib_def.s.i"

            LINK
ZMEM$       ECB      START,,NODE,1
            DATA     5,C'ZMEM$'
            PROC

            DYNM     =20,NODE(3),PTR(2)

ST_SEGNUM   EQU      XB%+1
ST_LOW      EQU      XB%+3
ST_HIGH     EQU      XB%+4

START       ARGT
            ENTR     ZMEM$

            EAXB     NODE,*
            LDA      ST_SEGNUM
            STA      PTR
            LDA      ST_LOW
            STA      PTR+1
            TCA
            A1A
            ADD      ST_HIGH
            TAX
            EAXB     PTR,*
            CRA
LOOP        STA      XB%,X
            BDX      LOOP
            PRTN

            END
