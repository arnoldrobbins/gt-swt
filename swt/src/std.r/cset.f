      INTEGER A$BUF(200)
      INTEGER GETARG,EQUAL
      INTEGER CH,FIRST,LAST,FORMAT
      INTEGER ARG(4),MN(4,128),ST(3),KC(3,128)
      INTEGER PARSCL
      INTEGER AAAAA0(21)
      INTEGER AAAAB0(67)
      INTEGER AAAAC0(67)
      INTEGER AAAAD0(67)
      INTEGER AAAAE0(67)
      INTEGER AAAAF0(67)
      INTEGER AAAAG0
      INTEGER AAAAH0(5)
      INTEGER AAAAI0(5)
      INTEGER AAAAJ0(5)
      INTEGER AAAAK0(70)
      DATA AAAAA0/233,188,242,233,190,235,188,242,243,190,237,188,242,24
     *3,190,239,188,242,243,190,0/
      DATA AAAAB0/213,243,225,231,229,186,160,227,243,229,244,160,219,17
     *3,233,160,188,233,238,244,190,160,252,160,173,235,160,188,235,229,
     *249,190,160,252,160,173,237,160,188,237,238,229,237,239,238,233,22
     *7,190,221,160,219,173,239,160,168,233,160,252,160,235,160,252,160,
     *237,169,221,0/
      DATA AAAAC0/213,243,225,231,229,186,160,227,243,229,244,160,219,17
     *3,233,160,188,233,238,244,190,160,252,160,173,235,160,188,235,229,
     *249,190,160,252,160,173,237,160,188,237,238,229,237,239,238,233,22
     *7,190,221,160,219,173,239,160,168,233,160,252,160,235,160,252,160,
     *237,169,221,0/
      DATA AAAAD0/213,243,225,231,229,186,160,227,243,229,244,160,219,17
     *3,233,160,188,233,238,244,190,160,252,160,173,235,160,188,235,229,
     *249,190,160,252,160,173,237,160,188,237,238,229,237,239,238,233,22
     *7,190,221,160,219,173,239,160,168,233,160,252,160,235,160,252,160,
     *237,169,221,0/
      DATA AAAAE0/213,243,225,231,229,186,160,227,243,229,244,160,219,17
     *3,233,160,188,233,238,244,190,160,252,160,173,235,160,188,235,229,
     *249,190,160,252,160,173,237,160,188,237,238,229,237,239,238,233,22
     *7,190,221,160,219,173,239,160,168,233,160,252,160,235,160,252,160,
     *237,169,221,0/
      DATA AAAAF0/213,243,225,231,229,186,160,227,243,229,244,160,219,17
     *3,233,160,188,233,238,244,190,160,252,160,173,235,160,188,235,229,
     *249,190,160,252,160,173,237,160,188,237,238,229,237,239,238,233,22
     *7,190,221,160,219,173,239,160,168,233,160,252,160,235,160,252,160,
     *237,169,221,0/
      DATA AAAAH0/170,233,170,238,0/
      DATA AAAAI0/170,243,170,238,0/
      DATA AAAAJ0/170,243,170,238,0/
      DATA AAAAK0/160,170,233,160,228,229,227,233,237,225,236,172,160,17
     *0,172,184,233,160,239,227,244,225,236,172,160,170,172,177,182,233,
     *160,232,229,248,174,160,160,235,229,249,227,239,228,229,160,189,16
     *0,170,173,178,243,172,160,237,238,229,237,239,238,233,227,160,189,
     *160,170,243,174,170,238,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR(AAAAB0)
10000 IF((A$BUF(233-225+1).EQ.0))GOTO 10001
        IF((A$BUF(235-225+1).NE.0))GOTO 10003
        IF((A$BUF(237-225+1).NE.0))GOTO 10003
        GOTO 10002
10003     CALL ERROR(AAAAC0)
10002   GOTO 10004
10001   IF((A$BUF(235-225+1).EQ.0))GOTO 10005
          IF((A$BUF(237-225+1).EQ.0))GOTO 10006
            CALL ERROR(AAAAD0)
10006     GOTO 10007
10005     IF((GETARG(1,ARG,2).EQ.-1))GOTO 10008
            CALL ERROR(AAAAE0)
10008   CONTINUE
10007 CONTINUE
10004 IF((A$BUF(239-225+1).EQ.0))GOTO 10009
        CALL CTOC(A$BUF(A$BUF(239-225+27)),ARG,2)
        CALL MAPSTR(ARG,1)
        IF((ARG(1).NE.233))GOTO 10010
          FORMAT=1
          GOTO 10011
10010     IF((ARG(1).NE.235))GOTO 10012
            FORMAT=2
            GOTO 10013
10012       IF((ARG(1).NE.237))GOTO 10014
              FORMAT=3
              GOTO 10015
10014         CALL ERROR(AAAAF0)
10015     CONTINUE
10013   CONTINUE
10011   GOTO 10016
10009   FORMAT=4
10016 DO 10017 CH=128,255
        CALL CTOMN(CH,MN(1,CH-127))
        IF((CH.LT.160))GOTO 10020
        IF((CH.EQ.255))GOTO 10020
        GOTO 10019
10020     ST(1)=222
          IF((CH.NE.255))GOTO 10021
            ST(2)=163
            GOTO 10022
10021       ST(2)=CH+192-128
10022     ST(3)=0
          GOTO 10023
10019     ST(1)=CH
          ST(2)=0
10023   CALL SCOPY(ST,1,KC(1,CH-127),1)
10017 CONTINUE
10018 IF((A$BUF(233-225+1).EQ.0))GOTO 10024
        FIRST=A$BUF(233-225+27)
        IF((FIRST.LT.0))GOTO 10025
        IF((FIRST.GE.128))GOTO 10025
          FIRST=FIRST+(128)
10025   LAST=FIRST
        IF((FIRST.LT.128))GOTO 10027
        IF((FIRST.GT.255))GOTO 10027
        GOTO 10026
10027     FIRST=128
          LAST=FIRST-1
10026   GOTO 10028
10024   IF((A$BUF(235-225+1).EQ.0))GOTO 10029
          CALL CTOC(A$BUF(A$BUF(235-225+27)),ARG,3)
          IF((ARG(1).NE.222))GOTO 10030
            CALL MAPSTR(ARG,2)
10030     FIRST=128
          LAST=FIRST-1
          DO 10031 CH=128,255
            IF((EQUAL(ARG,KC(1,CH-127)).NE.1))GOTO 10033
              FIRST=CH
              LAST=CH
              GOTO 10032
10033       CONTINUE
10031     CONTINUE
10032     GOTO 10034
10029     IF((A$BUF(237-225+1).EQ.0))GOTO 10035
            CALL CTOC(A$BUF(A$BUF(237-225+27)),ARG,4)
            CALL MAPSTR(ARG,2)
            FIRST=128
            LAST=FIRST-1
            DO 10036 CH=128,255
              IF((EQUAL(ARG,MN(1,CH-127)).NE.1))GOTO 10038
                FIRST=CH
                LAST=CH
                GOTO 10037
10038         CONTINUE
10036       CONTINUE
10037       GOTO 10039
10035       FIRST=128
            LAST=255
10039   CONTINUE
10034 CONTINUE
10028 AAAAG0=FORMAT
      GOTO 10040
10041   CH=FIRST
        GOTO 10044
10042   CH=CH+(1)
10044   IF((CH.GT.LAST))GOTO 10043
          CALL PRINT(-11,AAAAH0,CH)
        GOTO 10042
10043 GOTO 10045
10046   CH=FIRST
        GOTO 10049
10047   CH=CH+(1)
10049   IF((CH.GT.LAST))GOTO 10048
          CALL PRINT(-11,AAAAI0,KC(1,CH-127))
        GOTO 10047
10048 GOTO 10045
10050   CH=FIRST
        GOTO 10053
10051   CH=CH+(1)
10053   IF((CH.GT.LAST))GOTO 10052
          CALL PRINT(-11,AAAAJ0,MN(1,CH-127))
        GOTO 10051
10052 GOTO 10045
10054   CH=FIRST
        GOTO 10057
10055   CH=CH+(1)
10057   IF((CH.GT.LAST))GOTO 10056
          CALL PRINT(-11,AAAAK0,CH,CH,CH,KC(1,CH-127),MN(1,CH-127))
        GOTO 10055
10056 GOTO 10045
10040 GOTO(10041,10046,10050,10054),AAAAG0
10045 CALL SWT
      END
C ---- Long Name Map ----