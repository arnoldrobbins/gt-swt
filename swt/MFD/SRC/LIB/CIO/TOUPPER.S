* toupper --- make sure arg in 'a'..'z' and then change it's case
*
            SEG
            SYML
            RLIT
            SUBR     TOUPPER

            LINK
TOUPPER     ECB      START,,ARG
            DATA     7,C'toupper'

            DYNM     =20,ARG(3)

            PROC
START       ARGT
            EAL      TOUPPER
            STL      SB% + 18
            LDA      ='4000
            STA      SB% + 0

            LDA      ARG,*
            CAS      =R'a'-1
            CAS#     =R'z'+1
            JMP#     *+3
            JMP#     *+2

            ERA#     ='40

            PRTN
            END
