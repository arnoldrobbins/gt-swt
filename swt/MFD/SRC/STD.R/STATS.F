      CALL OPTIO0
      CALL SADIS0
      CALL SWT
      END
      SUBROUTINE OPTIO0
      INTEGER PRINT0,PRINU0,PRINV0,PRINW0,PRINX0,PRINY0,PRINZ0,PRIOA0,QU
     *IET0,PRIOB0,PERCE0,PRIOC0
      COMMON /OPTCOM/PRINT0,PRINU0,PRINV0,PRINW0,PRINX0,PRINY0,PRINZ0,PR
     *IOA0,QUIET0,PRIOB0,PERCE0,PRIOC0
      REAL * 8 VALUE0(4000)
      INTEGER NAAAA0
      COMMON /VALCOM/VALUE0,NAAAA0
      INTEGER ARG(102)
      INTEGER I
      INTEGER GETARG,CTOI
      PRINT0=0
      PRINU0=1
      PRINV0=0
      PRINW0=1
      PRINX0=0
      PRINY0=0
      PRINZ0=0
      PRIOA0=0
      QUIET0=0
      PRIOB0=1
      PERCE0=50
      PRIOC0=0
      IF((GETARG(1,ARG,102).EQ.-1))GOTO 10000
      IF((ARG(1).NE.173))GOTO 10000
        PRINT0=0
        PRINU0=0
        PRINV0=0
        PRINW0=0
        PRINX0=0
        PRINY0=0
        PRINZ0=0
        PRIOA0=0
        QUIET0=0
        PRIOB0=0
        PRIOC0=0
        I=2
        GOTO 10003
10001   I=I+1
10003   IF((ARG(I).EQ.0))GOTO 10002
          IF((ARG(I).EQ.244))GOTO 10005
          IF((ARG(I).EQ.212))GOTO 10005
          GOTO 10004
10005       PRINT0=1
            GOTO 10006
10004       IF((ARG(I).EQ.225))GOTO 10008
            IF((ARG(I).EQ.193))GOTO 10008
            GOTO 10007
10008         PRINU0=1
              GOTO 10009
10007         IF((ARG(I).EQ.237))GOTO 10011
              IF((ARG(I).EQ.205))GOTO 10011
              GOTO 10010
10011           PRINV0=1
                GOTO 10012
10010           IF((ARG(I).EQ.243))GOTO 10014
                IF((ARG(I).EQ.211))GOTO 10014
                GOTO 10013
10014             PRINW0=1
                  GOTO 10015
10013             IF((ARG(I).EQ.246))GOTO 10017
                  IF((ARG(I).EQ.214))GOTO 10017
                  GOTO 10016
10017               PRINX0=1
                    GOTO 10018
10016               IF((ARG(I).EQ.232))GOTO 10020
                    IF((ARG(I).EQ.200))GOTO 10020
                    GOTO 10019
10020                 PRINY0=1
                      GOTO 10021
10019                 IF((ARG(I).EQ.236))GOTO 10023
                      IF((ARG(I).EQ.204))GOTO 10023
                      GOTO 10022
10023                   PRINZ0=1
                        GOTO 10024
10022                   IF((ARG(I).EQ.242))GOTO 10026
                        IF((ARG(I).EQ.210))GOTO 10026
                        GOTO 10025
10026                     PRIOA0=1
                          GOTO 10027
10025                     IF((ARG(I).EQ.241))GOTO 10029
                          IF((ARG(I).EQ.209))GOTO 10029
                          GOTO 10028
10029                       QUIET0=1
                            GOTO 10030
10028                       IF((ARG(I).NE.165))GOTO 10031
                              PRIOB0=1
                              I=I+1
                              PERCE0=CTOI(ARG,I)
                              IF((PERCE0.NE.0))GOTO 10032
                                PERCE0=10
10032                         I=I-1
                              GOTO 10033
10031                         IF((ARG(I).EQ.238))GOTO 10035
                              IF((ARG(I).EQ.206))GOTO 10035
                              GOTO 10034
10035                           PRIOC0=1
                                GOTO 10036
10034                           CALL ERROR('Usage:  stats [-(t|a|m|s|v|h
     *|l|r|q|n|%<int>)].')
10036                       CONTINUE
10033                     CONTINUE
10030                   CONTINUE
10027                 CONTINUE
10024               CONTINUE
10021             CONTINUE
10018           CONTINUE
10015         CONTINUE
10012       CONTINUE
10009     CONTINUE
10006   GOTO 10001
10002 CONTINUE
10000 RETURN
      END
      SUBROUTINE SADIS0
      INTEGER PRINT0,PRINU0,PRINV0,PRINW0,PRINX0,PRINY0,PRINZ0,PRIOA0,QU
     *IET0,PRIOB0,PERCE0,PRIOC0
      COMMON /OPTCOM/PRINT0,PRINU0,PRINV0,PRINW0,PRINX0,PRINY0,PRINZ0,PR
     *IOA0,QUIET0,PRIOB0,PERCE0,PRIOC0
      REAL * 8 VALUE0(4000)
      INTEGER NAAAA0
      COMMON /VALCOM/VALUE0,NAAAA0
      INTEGER I,P,OCCURS,MODEO0,INDEX,MODEI0,RANKS
      INTEGER INPUT
      LOGICAL KEEP
      REAL * 8 SUM,SUMSQ,AVERA0,VARIA0,LOW,HIGH,V
      SUM=0.0
      SUMSQ=0.0
      KEEP=(PRIOB0.NE.0.OR.PRINV0.NE.0)
      NAAAA0=1
      GOTO 10039
10037 NAAAA0=NAAAA0+(1)
10039 IF((INPUT(-10,'*f.',V).EQ.-1))GOTO 10038
        SUM=SUM+(V)
        SUMSQ=SUMSQ+(V*V)
        IF((NAAAA0.NE.1))GOTO 10040
          LOW=V
          HIGH=V
          GOTO 10041
10040     IF((V.LE.HIGH))GOTO 10042
            HIGH=V
            GOTO 10043
10042       IF((V.GE.LOW))GOTO 10044
              LOW=V
10044     CONTINUE
10043   CONTINUE
10041   IF((.NOT.KEEP))GOTO 10045
          VALUE0(NAAAA0)=V
10045 GOTO 10037
10038 NAAAA0=NAAAA0-(1)
      IF((NAAAA0.NE.0))GOTO 10046
        RETURN
10046 AVERA0=SUM/NAAAA0
      VARIA0=NAAAA0*(AVERA0**2)-2*AVERA0*SUM+SUMSQ
      IF((NAAAA0.LE.1))GOTO 10047
        VARIA0=VARIA0/(NAAAA0-1)
10047 IF((PRINT0.NE.1))GOTO 10048
        CALL LABEL('total.')
        CALL PRINT(-11,'*d*n.',SUM)
10048 IF((PRIOC0.NE.1))GOTO 10049
        CALL LABEL('size.')
        CALL PRINT(-11,'*i*n.',NAAAA0)
10049 IF((PRINU0.NE.1))GOTO 10050
        CALL LABEL('average.')
        CALL PRINT(-11,'*d*n.',AVERA0)
10050 IF((PRINZ0.NE.1))GOTO 10051
        CALL LABEL('low.')
        CALL PRINT(-11,'*d*n.',LOW)
10051 IF((PRINY0.NE.1))GOTO 10052
        CALL LABEL('high.')
        CALL PRINT(-11,'*d*n.',HIGH)
10052 IF((PRIOA0.NE.1))GOTO 10053
        CALL LABEL('range.')
        CALL PRINT(-11,'*d*n.',HIGH-LOW)
10053 IF((PRINX0.NE.1))GOTO 10054
        CALL LABEL('variance.')
        CALL PRINT(-11,'*d*n.',VARIA0)
10054 IF((PRINW0.NE.1))GOTO 10055
        CALL LABEL('std dev.')
        CALL PRINT(-11,'*d*n.',DSQRT(VARIA0))
10055 IF((PRIOB0.NE.1))GOTO 10056
        CALL SORT
        RANKS=INT(100.0/PERCE0+.5)
        P=PERCE0
        I=1
        GOTO 10059
10057   I=I+(1)
10059   IF((I.GE.RANKS))GOTO 10058
          IF((QUIET0.NE.0))GOTO 10060
            CALL PRINT(-11,'*2i%        .',P)
10060     CALL PRINT(-11,'*d*n.',VALUE0(INT((I*NAAAA0)/RANKS+.5)))
          P=P+(PERCE0)
        GOTO 10057
10058 CONTINUE
10056 IF((PRINV0.NE.1))GOTO 10061
        MODEO0=1
        MODEI0=INT(NAAAA0/2.0+.5)
        I=1
        GOTO 10064
10062   CONTINUE
10064   IF((I.GT.NAAAA0))GOTO 10063
          INDEX=I
          OCCURS=1
10065       I=I+(1)
            IF((I.GT.NAAAA0))GOTO 10067
            IF((VALUE0(I).NE.VALUE0(INDEX)))GOTO 10067
            GOTO 10066
10067         GOTO 10068
10066       OCCURS=OCCURS+(1)
          GOTO 10065
10068     IF((OCCURS.LE.MODEO0))GOTO 10069
            MODEO0=OCCURS
            MODEI0=INDEX
10069   GOTO 10062
10063   CALL LABEL('mode.')
        CALL PRINT(-11,'*d*n.',VALUE0(MODEI0))
10061 RETURN
      END
      SUBROUTINE LABEL(LAB)
      INTEGER LAB(1)
      INTEGER PRINT0,PRINU0,PRINV0,PRINW0,PRINX0,PRINY0,PRINZ0,PRIOA0,QU
     *IET0,PRIOB0,PERCE0,PRIOC0
      COMMON /OPTCOM/PRINT0,PRINU0,PRINV0,PRINW0,PRINX0,PRINY0,PRINZ0,PR
     *IOA0,QUIET0,PRIOB0,PERCE0,PRIOC0
      REAL * 8 VALUE0(4000)
      INTEGER NAAAA0
      COMMON /VALCOM/VALUE0,NAAAA0
      INTEGER BUF(102)
      INTEGER I
      INTEGER PTOC
      IF((QUIET0.NE.0))GOTO 10070
        CALL PRINT(-11,'*p.',LAB)
        I=PTOC(LAB,174,BUF,102)
        GOTO 10073
10071   I=I+(1)
10073   IF((I.GT.10))GOTO 10072
          CALL PUTCH(160,-11)
        GOTO 10071
10072 CONTINUE
10070 RETURN
      END
      SUBROUTINE SORT
      INTEGER PRINT0,PRINU0,PRINV0,PRINW0,PRINX0,PRINY0,PRINZ0,PRIOA0,QU
     *IET0,PRIOB0,PERCE0,PRIOC0
      COMMON /OPTCOM/PRINT0,PRINU0,PRINV0,PRINW0,PRINX0,PRINY0,PRINZ0,PR
     *IOA0,QUIET0,PRIOB0,PERCE0,PRIOC0
      REAL * 8 VALUE0(4000)
      INTEGER NAAAA0
      COMMON /VALCOM/VALUE0,NAAAA0
      INTEGER GAP,I,J,JG
      REAL * 8 K
      GAP=NAAAA0/2
      GOTO 10076
10074 GAP=GAP/(2)
10076 IF((GAP.LE.0))GOTO 10075
        I=GAP+1
        GOTO 10079
10077   I=I+(1)
10079   IF((I.GT.NAAAA0))GOTO 10078
          J=I-GAP
          GOTO 10082
10080     J=J-(GAP)
10082     IF((J.LE.0))GOTO 10081
            JG=J+GAP
            IF((VALUE0(J).GT.VALUE0(JG)))GOTO 10083
              GOTO 10081
10083       K=VALUE0(J)
            VALUE0(J)=VALUE0(JG)
            VALUE0(JG)=K
          GOTO 10080
10081   GOTO 10077
10078 GOTO 10074
10075 RETURN
      END
C ---- Long Name Map ----
C modeindex                      modei0
C Printsdev                      prinw0
C Printrange                     prioa0
C sadistics                      sadis0
C variance                       varia0
C Printvariance                  prinx0
C Printranks                     priob0
C Printn                         prioc0
C Printhigh                      priny0
C Printtotal                     print0
C Value                          value0
C Printmode                      prinv0
C N                              naaaa0
C modeoccurs                     modeo0
C Percentile                     perce0
C average                        avera0
C Printlow                       prinz0
C Printaverage                   prinu0
C options                        optio0
C Quiet                          quiet0
