* free --- call PL/I storage free-er from C programs
* cfree --- call PL/I storage free-er from C programs (old name)
*
*  free (ptr)        |  cfree (ptr)
*  char *ptr;        |  char *ptr;

            SEG
            RLIT
            SYML

            SUBR     FREE
            SUBR     CFREE

            LINK
FREE        ECB      FREE$,,PTR,1
            DATA     4,C'free'
CFREE       ECB      FREE$,,PTR,1
            DATA     5,C'cfree'
            PROC

            DYNM     =20
            DYNM     PTR(3)

FREE$       ARGT
            EAL      FREE
            STL      SB%+18
            LDA      ='4000
            STA      SB%+0
*
*  The compiler always passes a pointer by value:
*  PTR contains the actual pointer argument rather
*  than a pointer to the pointer argument - so we
*  load it directly
*
            LDL      PTR
            CALL     P$FREE

            PRTN
            END
