* malloc --- call PL/I storage allocator from C programs
* alloc --- call PL/I storage allocator from C programs (old name)
*
*  char *malloc (n)  |  char *alloc (n)
*  int n;            |  int n;

            SEG
            SYML
            RLIT

            SUBR     MALLOC
            SUBR     ALLOC

            LINK
MALLOC      ECB      ALLOC$,,SIZEP,1
            DATA     6,C'malloc'
ALLOC       ECB      ALLOC$,,SIZEP,1
            DATA     5,C'alloc'
            PROC

            DYNM     =20
            DYNM     SIZEP(3)

ALLOC$      ARGT
            EAL      MALLOC         set debug name
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
