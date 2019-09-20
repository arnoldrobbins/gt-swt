* fabs --- return absolute value of floating point number
*
            SEG
            SYML
            RLIT
            SUBR     FABS

            LINK
FABS        ECB      START,,ARG
            DATA     4,C'fabs'

            DYNM     =20,ARG(3)

            PROC
START       ARGT
            EAL      FABS
            STL      SB% + 18
            LDA      ='4000
            STA      SB% + 0

            DFLD     ARG,*
            BFGE     RETURN
            DFCM                    change sign
RETURN      PRTN
            END
