* alloc --- call PL/I storage allocator from VCG created programs
*
            SEG
            SYML
            RLIT

            SUBR     ALLOC

            LINK
ALLOC       ECB      ALLOC$,,SIZEP,1
            DATA     5,C'alloc'
            PROC

            DYNM     =20
            DYNM     SIZEP(3)

ALLOC$      ARGT
            EAL      ALLOC          set debug name
            STL      SB%+18
            LDA      ='4000
            STA      SB%+0

            LDA      SIZEP,*
            BEQ      QUIT           asked for 0 words
            CALL     P$ALC          get storage from PL/I routines
            PRTN

QUIT        CRL                     return null on error
            PRTN
            END
