      INTEGER C,IBUF(134),OBUF(804)
      INTEGER I,IBP,OBP,NEWLI0,OVERP0,TOPBUF,TOPCH0,PAGES0,LINEC0
      INTEGER GETLIN
      INTEGER A$BUF(200)
      INTEGER AAAAA0
      INTEGER AAAAC0
      INTEGER AAAAE0
      INTEGER PARSCL
      INTEGER AAAAF0(15)
      INTEGER AAAAG0(36)
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0,AAAAK0
      INTEGER AAAAB0
      INTEGER AAAAL0
      INTEGER AAAAD0
      INTEGER AAAAM0,AAAAN0
      DATA AAAAF0/173,236,188,242,229,241,160,233,238,244,190,160,173,24
     *8,0/
      DATA AAAAG0/213,243,225,231,229,186,160,239,243,160,251,160,173,23
     *6,160,188,240,225,231,229,160,236,229,238,231,244,232,190,160,252,
     *160,173,248,160,253,0/
      IF((PARSCL(AAAAF0,A$BUF).NE.-3))GOTO 10003
        CALL ERROR(AAAAG0)
10003 IF((A$BUF(236-225+1).EQ.2))GOTO 10004
        A$BUF(236-225+27)=66
10004 PAGES0=A$BUF(236-225+27)
      LINEC0=PAGES0
      NEWLI0=1
      OVERP0=0
      TOPBUF=0
      TOPCH0=0
      IBP=0
      IBUF(1)=0
      DO 10005 I=1,804
        OBUF(I)=160
10005 CONTINUE
10006 CONTINUE
10007   OBP=0
10008     IBP=IBP+(1)
          C=IBUF(IBP)
10009     IF((C.NE.0))GOTO 10010
            IF((GETLIN(IBUF,-10,134).NE.-1))GOTO 10011
              GOTO 10012
10011       IBP=1
            C=IBUF(1)
          GOTO 10009
10010     AAAAH0=C
          GOTO 10013
10014       GOTO 10015
10016       AAAAA0=1
            GOTO 10000
10017       LINEC0=PAGES0
          GOTO 10018
10019       OBP=OBP-(1)
          GOTO 10018
10020       OBP=OBP+(1)
          GOTO 10018
10013     AAAAI0=AAAAH0-7
          GOTO(10019,10021,10021,10021,10016),AAAAI0
          IF(AAAAH0.EQ.32)GOTO 10020
          AAAAI0=AAAAH0-135
          GOTO(10019,10021,10014,10021,10016),AAAAI0
          IF(AAAAH0.EQ.160)GOTO 10020
10021       IF((OR(C,128).LT.160))GOTO 10022
              OBP=OBP+(1)
              IF((0.GE.OBP))GOTO 10023
              IF((OBP.GE.134))GOTO 10023
                GOTO 10024
10025             OBUF(OBP)=C
                  I=1
                GOTO 10026
10027             IF((OBUF(OBP).NE.223))GOTO 10028
                    OBUF(OBP+134)=223
                    OBUF(OBP)=C
                    I=2
                    GOTO 10029
10028               IF((C.NE.223))GOTO 10030
                      OBUF(OBP+134)=C
                      I=2
                      GOTO 10031
10030                 I=1
10031             CONTINUE
10029           GOTO 10026
10032             OBUF(OBP+134)=C
                  I=2
                GOTO 10026
10033             OBUF(OBP+268)=C
                  I=3
                GOTO 10026
10034             OBUF(OBP+402)=C
                  I=4
                GOTO 10026
10035             OBUF(OBP+536)=C
                  I=5
                GOTO 10026
10036             OBUF(OBP+670)=C
                  I=6
                GOTO 10026
10026             IF((TOPBUF.GE.I))GOTO 10037
                    TOPBUF=I
10037           GOTO 10038
10024           IF((OBUF(OBP).EQ.160))GOTO 10025
                IF((A$BUF(248-225+1).NE.0))GOTO 10027
                IF((OBUF(OBP+134).EQ.160))GOTO 10032
                IF((OBUF(OBP+268).EQ.160))GOTO 10033
                IF((OBUF(OBP+402).EQ.160))GOTO 10034
                IF((OBUF(OBP+536).EQ.160))GOTO 10035
                IF((OBUF(OBP+670).EQ.160))GOTO 10036
                  AAAAA0=2
                  GOTO 10000
10039             OVERP0=1
                  OBUF(OBP)=C
                  TOPBUF=1
10038           IF((TOPCH0.GE.OBP))GOTO 10040
                  TOPCH0=OBP
10040         CONTINUE
10023       CONTINUE
10022     CONTINUE
10018   CONTINUE
        GOTO 10008
10015   AAAAA0=3
        GOTO 10000
10041 CONTINUE
      GOTO 10007
10012 CALL SWT
10000 IF((OVERP0.NE.0))GOTO 10042
        LINEC0=LINEC0+(1)
        IF((LINEC0.LE.PAGES0))GOTO 10043
          IF((NEWLI0.LE.0))GOTO 10044
            CALL PUTCH(177,-11)
            CALL PUTCH(138,-11)
            NEWLI0=0
            OVERP0=1
10044     LINEC0=1
10043   IF((TOPBUF.GT.0))GOTO 10045
          NEWLI0=NEWLI0+(1)
10045 CONTINUE
10042 IF((TOPBUF.LE.0))GOTO 10046
        GOTO 10049
10047   NEWLI0=NEWLI0-(1)
10049   IF((NEWLI0.LE.0))GOTO 10048
          CALL PUTCH(160,-11)
          CALL PUTCH(138,-11)
        GOTO 10047
10048   IF((OVERP0.NE.0))GOTO 10050
          CALL PUTCH(160,-11)
          GOTO 10051
10050     CALL PUTCH(171,-11)
10051   AAAAK0=0
        AAAAB0=AAAAK0
        AAAAC0=1
        GOTO 10001
10052   CALL PUTLIN(OBUF(AAAAK0+1),-11)
        AAAAD0=AAAAK0
        AAAAE0=1
        GOTO 10002
10053   AAAAJ0=1
        AAAAK0=AAAAK0+(134)
        GOTO 10056
10054   AAAAJ0=AAAAJ0+(1)
        AAAAK0=AAAAK0+(134)
10056   IF((AAAAJ0.GE.TOPBUF))GOTO 10055
          AAAAB0=AAAAK0
          AAAAC0=2
          GOTO 10001
10057     CALL PUTCH(171,-11)
          CALL PUTLIN(OBUF(AAAAK0+1),-11)
          AAAAD0=AAAAK0
          AAAAE0=2
          GOTO 10002
10058   GOTO 10054
10055 CONTINUE
10046 TOPBUF=0
      TOPCH0=0
      OVERP0=0
      GOTO 10059
10001 AAAAL0=AAAAB0+134-2
      IF((AAAAL0.LE.AAAAB0+TOPCH0))GOTO 10060
        AAAAL0=AAAAB0+TOPCH0
10060 GOTO 10063
10061 AAAAL0=AAAAL0-(1)
10063 IF((AAAAL0.LE.AAAAB0))GOTO 10062
        IF((OBUF(AAAAL0).EQ.160))GOTO 10064
          GOTO 10062
10064 GOTO 10061
10062 OBUF(AAAAL0+1)=138
      OBUF(AAAAL0+2)=0
      GOTO 10065
10002 AAAAN0=AAAAD0+134
      AAAAM0=AAAAD0+1
      GOTO 10068
10066 AAAAM0=AAAAM0+(1)
10068 IF((AAAAM0.GE.AAAAN0))GOTO 10067
      IF((OBUF(AAAAM0).EQ.0))GOTO 10067
        OBUF(AAAAM0)=160
      GOTO 10066
10067 OBUF(AAAAM0)=160
      GOTO 10069
10069 GOTO(10053,10058),AAAAE0
      GOTO 10069
10059 GOTO(10017,10039,10041),AAAAA0
      GOTO 10059
10065 GOTO(10052,10057),AAAAC0
      GOTO 10065
      END
C ---- Long Name Map ----
C newlines                       newli0
C overprint                      overp0
C topchar                        topch0
C linectr                        linec0
C clearbuffer                    clear0
C dumpbuffer                     dumpb0
C pagesize                       pages0
C trimbuffer                     trimb0
