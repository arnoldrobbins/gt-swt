* longjmp --- take a PL/I return pointer and status and go there
*
            SEG
            SYML
            RLIT
            SUBR     LONGJMP

            LINK
LONGJMP     ECB      START,,ENV,2
            DATA     7,C'longjmp'
            PROC

            DYNM     =20
            DYNM     ENV(3),VAL(3)

START       ARGT
            EAL      LONGJMP        set debug name
            STL      SB%+18
            LDA      ='4000
            STA      SB%+0

            EAXB     ENV,*          Make ENV accessible in XB%
            LDA      VAL            Check if VAL given
            BLT      LONGJMP1       No...

            LDA      VAL,*          Given so load the value
            SKP                     Skip the clear
LONGJMP1    CRA                     No value, so clear status
            STA      XB%+4          Save status in the ENV

            CALL     PL1$NL         Peel it brother
            AP       ENV,*SL

            CALL     ERROR          Should never return
            AP       =C'in longjmp!: cant happen.',SL

            END
