* tolower --- make sure arg in 'A'..'Z' and then change it's case
*
            SEG
            SYML
            RLIT
            SUBR     TOLOWER

            LINK
TOLOWER     ECB      START,,ARG
            DATA     7,C'tolower'

            DYNM     =20,ARG(3)

            PROC
START       ARGT
            EAL      TOLOWER
            STL      SB% + 18
            LDA      ='4000
            STA      SB% + 0

            LDA      ARG,*
            CAS      =R'A'-1
            CAS#     =R'Z'+1
            JMP#     *+3
            JMP#     *+2

            ERA#     ='40

            PRTN
            END
