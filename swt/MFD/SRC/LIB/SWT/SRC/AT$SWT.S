* at$swt --- bad-password-proof interlude to atch$$

            SUBR     AT$SWT

            SEG
            RLIT

include "=syscom=/errd.ins.pma"
include "=incl=/lib_def.s.i"

            LINK
AT$SWT      ECB      AT$0,,NAME,6,66
            DATA     6,C'AT$SWT'
            PROC

            DYNM     =38,NAME(3),NAMEL(3),LDISK(3),PWD(3),KEY(3),CODE(3)
            DYNM     ARGS(6),DESCR(4)

            EXT      MKONU$

AT$0        ARGT
            ENTR     AT$SWT

            EAL      BP_UNIT
            STL      DESCR+0
            EAL      SB%
            STL      DESCR+2
            EAL      CNAME
            STL      ARGS+0
            EAL      DESCR
            STL      ARGS+3
            EAL      ARGS
            JSXB     MKONU$

            CALL     ATCH$$
            AP       NAME,*S
            AP       NAMEL,*S
            AP       LDISK,*S
            AP       PWD,*S
            AP       KEY,*S
            AP       CODE,*SL
            PRTN

BP          LDA      =E$BPAS
            STA      CODE,*
            PRTN

CNAME       DATA     13,C'BAD_PASSWORD$'
            EJCT
* bp_unit --- on-unit for the BAD_PASSWORD$ condition

            DYNM     =20,CP(3),LABEL(4)

            LINK
BP_UNIT     ECB      BP_UNIT0,,CP,1,28
            DATA     11,C'AT$.BP_UNIT'
            PROC

BP_UNIT0    ARGT
            STL      LABEL+2
            EAL      BP
            IAB
            STL      LABEL+0
            CALL     PL1$NL
            AP       LABEL,SL

            END
