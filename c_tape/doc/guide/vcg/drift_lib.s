* RUN-TIME SUPPORT FOR 'DRIFT'
*           UNFORTUNATELY, EX$IN MUST BE WRITTEN IN ASSEMBLER SINCE
*           FORTRAN DOESN'T ALLOW FUNCTIONS WITHOUT ARGUMENTS.
*           AN ALTERNATIVE WOULD BE TO HAVE THE COMPILER GENERATE
*           A DUMMY ARGUMENT ON THE CALL; THEN EX$IN AND EX$OUT
*           COULD BE WRITTEN IN RATFOR, PASCAL, OR WHAT HAVE YOU.


* EX$IN --- READ A LINE FROM STANDARD INPUT, CONVERT FROM CHARACTER
*           TO REAL, AND RETURN VALUE

            SEG
            RLIT
            SYML

            SUBR     EX$IN

EX$IN       ECB      EX$IN$

            DYNM     LINE(100),I

EX$IN$      EQU      *
            CALL     GETLIN         READ NEXT INPUT LINE
            AP       LINE,S
            AP       =-10,SL
            BGT      CVT_IN         IF WE HIT EOF,
            CALL     SWT               JUST QUIT
CVT_IN      EQU      *
            LT                      OTHERWISE,
            STA      I
            CALL     CTOR              CONVERT TO REAL
            AP       LINE,S
            AP       I,SL
            PRTN                       AND RETURN WITH VALUE IN F

            END


* EX$OUT --- WRITE REAL VALUE TO STANDARD OUTPUT, RETURN VALUE UNCHANGED

            SEG
            RLIT
            SYML

            SUBR     EX$OUT
EX$OUT      ECB      EX$OUT$,,VAL,1

            DYNM     VAL(3)

EX$OUT$     EQU      *
            ARGT
            CALL     PRINT          JUST USE SWT I/O TO OUTPUT VALUE
            AP       =-11,S            ON STDOUT
            AP       =C'*r*n.',S
            AP       VAL,*SL
            FLD      VAL,*          RETURN VALUE IN F SO THIS FUNCTION
            PRTN                       BEHAVES LIKE A PSEUDO-VARIABLE

            END
