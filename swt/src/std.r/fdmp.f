      INTEGER MODE,NEXTA0,BUF(102),FD,COUNT,PERLI0
      INTEGER GETARG,OPEN,SEEKF,GETOP0,READF
      INTEGER * 4 END,SEQ,START
      INTEGER ARG(128)
      LOGICAL JUNK
      LOGICAL TQUIT$
      NEXTA0=GETOP0(MODE,START,END,PERLI0)
      IF((GETARG(NEXTA0,ARG,128).EQ.-1))GOTO 10000
        FD=OPEN(ARG,1)
        IF((FD.NE.-3))GOTO 10001
          CALL CANT(ARG)
10001   GOTO 10002
10000   FD=-10
10002 CALL BREAK$(1)
      IF((SEEKF(START,FD,0).EQ.-3))GOTO 10003
        SEQ=START
        GOTO 10006
10004   SEQ=SEQ+(COUNT)
10006   IF((END.EQ.0))GOTO 10007
        IF((SEQ.LE.END))GOTO 10007
        GOTO 10005
10007     COUNT=READF(BUF,PERLI0,FD)
          IF((COUNT.NE.-1))GOTO 10008
            GOTO 10005
10008     CALL PUT(MODE,BUF,SEQ,COUNT)
          IF((.NOT.TQUIT$(JUNK)))GOTO 10009
            GOTO 10005
10009   GOTO 10004
10005 CONTINUE
10003 CALL BREAK$(0)
      CALL CLOSE(FD)
      CALL SWT
      END
      INTEGER FUNCTION GETOP0(MODE,START0,ENDAD0,PERLI0)
      INTEGER MODE,PERLI0
      INTEGER * 4 START0,ENDAD0
      INTEGER AP,I
      INTEGER GETARG,CTOI
      INTEGER * 4 GCTOL
      INTEGER ARG(128)
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0
      INTEGER AAAAE0
      INTEGER AAAAF0(66)
      DATA AAAAF0/213,243,225,231,229,186,160,230,228,237,240,160,251,16
     *0,173,226,227,228,232,239,160,252,160,173,247,188,247,233,228,244,
     *232,190,160,252,160,171,188,243,244,225,242,244,190,160,252,160,17
     *3,188,229,238,228,190,160,253,160,219,160,188,230,233,236,229,190,
     *160,221,0/
      START0=0
      ENDAD0=0
      MODE=0
      PERLI0=8
      AP=1
      GOTO 10013
10011 AP=AP+(1)
10013 IF((GETARG(AP,ARG,128).EQ.-1))GOTO 10012
        AAAAB0=ARG(1)
        GOTO 10014
10015     I=2
          START0=GCTOL(ARG,I,10)
          IF((I.EQ.2))GOTO 10017
          IF((ARG(I).NE.0))GOTO 10017
          GOTO 10016
10017       AAAAA0=1
            GOTO 10010
10018     CONTINUE
10016   GOTO 10019
10020     I=2
          GOTO 10023
10021     I=I+(1)
10023     IF((ARG(I).EQ.0))GOTO 10022
            AAAAC0=ARG(I)
            GOTO 10024
10025         MODE=OR(MODE,1)
            GOTO 10026
10027         MODE=OR(MODE,2)
            GOTO 10026
10028         MODE=OR(MODE,4)
            GOTO 10026
10029         MODE=OR(MODE,8)
            GOTO 10026
10030         MODE=OR(MODE,16)
            GOTO 10026
10031         I=I+(1)
              PERLI0=CTOI(ARG,I)
              I=I-(1)
              IF((PERLI0.LT.1))GOTO 10033
              IF((PERLI0.GT.102))GOTO 10033
              GOTO 10032
10033           PERLI0=8
10032       GOTO 10026
10024       AAAAD0=AAAAC0-193
            GOTO(10025,10027,10028,10034,10034,10034,10029,10034,10034,1
     *0034,10034,10034,10034,10030,10034,10034,10034,10034,10034,10034,1
     *0034,10031,10034,10034,10034,10034,10034,10034,10034,10034,10034,1
     *0034,10025,10027,10028,10034,10034,10034,10029,10034,10034,10034,1
     *0034,10034,10034,10030,10034,10034,10034,10034,10034,10034,10034,1
     *0031),AAAAD0
10034         I=2
              ENDAD0=GCTOL(ARG,I,10)
              IF((I.EQ.2))GOTO 10036
              IF((ARG(I).NE.0))GOTO 10036
              GOTO 10035
10036           AAAAA0=2
                GOTO 10010
10037         CONTINUE
10035         GOTO 10022
10026     GOTO 10021
10022   GOTO 10019
10014   AAAAE0=AAAAB0-170
        GOTO(10015,10038,10020),AAAAE0
10038     GOTO 10012
10019 GOTO 10011
10012 IF((MODE.NE.0))GOTO 10039
        MODE=16
10039 GETOP0=AP
      RETURN
10010 CALL ERROR(AAAAF0)
      GOTO 10040
10040 GOTO(10018,10037),AAAAA0
      GOTO 10040
      END
      SUBROUTINE PUT(MODE,BUF,SEQ,COUNT)
      INTEGER MODE,BUF(1),COUNT
      INTEGER * 4 SEQ
      INTEGER I,LB,RB,LC,RC
      INTEGER MAPDN
      INTEGER AAAAI0
      INTEGER AAAAJ0(13)
      INTEGER AAAAK0(13)
      INTEGER AAAAL0(11)
      INTEGER * 4 AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAM0(10)
      DATA AAAAJ0/160,160,170,227,170,227,160,160,170,227,170,227,0/
      DATA AAAAK0/160,170,179,172,184,233,160,170,179,172,184,233,0/
      DATA AAAAL0/160,160,170,182,172,173,184,172,176,233,0/
      DATA AAAAM0/170,177,177,172,163,172,176,236,160,0/
      IF((AND(MODE,2).EQ.0))GOTO 10042
        AAAAG0=SEQ
        AAAAH0=8
        AAAAI0=1
        GOTO 10041
10043   DO 10044 I=1,COUNT
          LB=OR(RS(BUF(I),8),128)
          RB=OR(RT(BUF(I),8),128)
          IF((LB.GE.160))GOTO 10046
            LC=222
            LB=MAPDN(LB+64)
            GOTO 10047
10046       IF((LB.NE.255))GOTO 10048
              LC=222
              LB=160
              GOTO 10049
10048         LC=160
10049     CONTINUE
10047     IF((RB.GE.160))GOTO 10050
            RC=222
            RB=MAPDN(RB+64)
            GOTO 10051
10050       IF((RB.NE.255))GOTO 10052
              RC=222
              RB=160
              GOTO 10053
10052         RC=160
10053     CONTINUE
10051     CALL PRINT(-11,AAAAJ0,LC,LB,RC,RB)
10044   CONTINUE
10045   CALL PUTCH(138,-11)
10042 IF((AND(MODE,1).EQ.0))GOTO 10054
        AAAAG0=SEQ
        AAAAH0=8
        AAAAI0=2
        GOTO 10041
10055   DO 10056 I=1,COUNT
          CALL PRINT(-11,AAAAK0,RS(BUF(I),8),RT(BUF(I),8))
10056   CONTINUE
10057   CALL PUTCH(138,-11)
10054 IF((AND(MODE,16).EQ.0))GOTO 10058
        AAAAG0=SEQ
        AAAAH0=8
        AAAAI0=3
        GOTO 10041
10059   DO 10060 I=1,COUNT
          CALL PRINT(-11,AAAAL0,BUF(I))
10060   CONTINUE
10061   CALL PUTCH(138,-11)
10058 IF((AND(MODE,4).EQ.0))GOTO 10062
        AAAAG0=SEQ
        AAAAH0=10
        AAAAI0=4
        GOTO 10041
10063   DO 10064 I=1,COUNT
          CALL PRINT(-11,'  *6i.',BUF(I))
10064   CONTINUE
10065   CALL PUTCH(138,-11)
10062 IF((AND(MODE,8).EQ.0))GOTO 10066
        AAAAG0=SEQ
        AAAAH0=16
        AAAAI0=5
        GOTO 10041
10067   DO 10068 I=1,COUNT
          CALL PRINT(-11,'    *4,-16,0i.',BUF(I))
10068   CONTINUE
10069   CALL PUTCH(138,-11)
10066 GOTO 10070
10041 CALL PRINT(-11,AAAAM0,-AAAAH0,AAAAG0)
      GOTO 10071
10070 RETURN
10071 GOTO(10043,10055,10059,10063,10067),AAAAI0
      GOTO 10071
      END
C ---- Long Name Map ----
C putaddress                     putad0
C perline                        perli0
C startaddr                      start0
C getoptions                     getop0
C nextarg                        nexta0
C endaddr                        endad0