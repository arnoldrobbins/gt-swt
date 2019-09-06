* calloc --- call PL/I storage allocator from C programs
*
* char *calloc (n, size)
* int n, size;
* {}

            SEG
            RLIT
            SYML

            SUBR     CALLOC

            LINK
CALLOC      ECB      ALLOC$,,NUMP,2
            DATA     6,C'calloc'
            PROC

            DYNM     =20
            DYNM     NUMP(3),SIZEP(3),WORDS

ALLOC$      ARGT
            EAL      CALLOC         set debug name
            STL      SB%+18
            LDA      ='4000
            STA      SB%+0
            LDA      NUMP,*
            MPY      SIZEP,*
            BNE      PUNT           requested more than 64K
            XCB
            BEQ      PUNT           requested 0 words
            STA      WORDS

            CALL     P$ALC          get storage from PL/I routines
            STLR     PB%+'17

            LDX      WORDS
            CRA
CLEAR       EQU      *              zero out the block of memory
            STA      XB%-1,X
            BDX      CLEAR
            EAL      XB%            return pointer to block
            PRTN

PUNT        EQU      *
            CRL
            PRTN

            END
