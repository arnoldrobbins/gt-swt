* setjmp --- create a PL/I label for the current location
*
            SEG
            SYML
            RLIT
            SUBR     SETJMP1

            LINK
SETJMP1     ECB      START,,ENV,1
            DATA     7,C'setjmp1'
            PROC

            DYNM     =20
            DYNM     ENV(3)

START       ARGT
            EAL      SETJMP1        set debug name
            STL      SB%+18
            LDA      ='4000
            STA      SB%+0

            EAXB     ENV,*          XB% points to the ENV variable
            LDL      SB%+2          Grab the return pointer
            IAB                     Screw it up royally
            STL      XB%            And save it in the variable
            LDL      SB%+4          Grab the previous frame address
            STL      XB%+2          And store the previous frame address
            CRA                     0 return status
            STA      XB%+4
            PRTN                    And return

            END
