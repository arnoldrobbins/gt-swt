* abs --- return absolute value of number
*
            SEG
            SYML
            RLIT
            SUBR     ABS

            LINK
ABS         ECB      START,,ARG
            DATA     3,C'abs'

            DYNM     =20,ARG(3)

            PROC
START       ARGT
            EAL      ABS
            STL      SB% + 18
            LDA      ='4000
            STA      SB% + 0

            LDA      ARG,*
            SPL
            TCA
            PRTN
            END
