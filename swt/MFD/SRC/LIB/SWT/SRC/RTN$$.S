* rtn$$ --- return to frame indicated in RTLABEL

            SUBR     RTN$$

            SEG
            RLIT

include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"
include "=incl=/swt_com.s.i"
include "=incl=/temp_com.s.i"

            LINK
RTN$$       ECB      RTN0
            DATA     5,C'RTN$$'
            PROC

            DYNM     =20

CLDATA$FLAGS EQU     XB% + 6

RTN0        EAXB     CLDATAPTR
            EAXB     XB%,*
            LDA      CLDATA$FLAGS
            ANA      ='020000       Was I run by DBG?
            BNE      MUSTEXIT       If I was I must exit

            CALL     PL1$NL         Not run by DBG
            AP       RTLABEL,SL     just return to the shell

MUSTEXIT    CALL     EXIT

            END
