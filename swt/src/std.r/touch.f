      INTEGER GFNARG,SFDATA,PARSTM,PARSDT
      INTEGER A$BUF(200)
      INTEGER PATH(180),TEMP(102)
      INTEGER STATE(4),CURTI0(6),ATTACH,I,DAY,MONTH,YEAR
      INTEGER * 4 TIME
      INTEGER USAGE(50)
      INTEGER PARSCL
      INTEGER AAAAA0(17)
      INTEGER CTOC
      INTEGER CTOC
      INTEGER AAAAB0(32)
      INTEGER AAAAC0(32)
      INTEGER AAAAD0
      INTEGER AAAAE0
      INTEGER AAAAF0(18)
      EQUIVALENCE (CURTI0(1),YEAR),(CURTI0(2),MONTH),(CURTI0(3),DAY)
      DATA USAGE/213,243,225,231,229,186,160,244,239,245,227,232,160,219
     *,173,228,160,188,228,225,244,229,190,221,160,219,173,244,160,188,2
     *44,233,237,229,190,221,160,251,188,240,225,244,232,238,225,237,229
     *,190,253,0/
      DATA AAAAA0/228,188,242,243,190,244,188,242,243,190,238,188,233,23
     *1,238,190,0/
      DATA AAAAB0/233,238,246,225,236,233,228,160,230,239,242,237,225,24
     *4,160,233,238,160,228,225,244,229,160,225,242,231,245,237,229,238,
     *244,0/
      DATA AAAAC0/233,238,246,225,236,233,228,160,230,239,242,237,225,24
     *4,160,233,238,160,244,233,237,229,160,225,242,231,245,237,229,238,
     *244,0/
      DATA AAAAF0/170,243,186,160,227,225,238,167,244,160,244,239,245,22
     *7,232,170,238,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR(USAGE)
10000 CALL DATE(1,TEMP)
      IF((A$BUF(228-225+1).EQ.2))GOTO 10001
        A$BUF(228-225+27)=A$BUF(53)
        A$BUF(53)=A$BUF(53)+(1+CTOC(TEMP,A$BUF(A$BUF(53)),200))
10001 CALL DATE(2,TEMP)
      IF((A$BUF(244-225+1).EQ.2))GOTO 10002
        A$BUF(244-225+27)=A$BUF(53)
        A$BUF(53)=A$BUF(53)+(1+CTOC(TEMP,A$BUF(A$BUF(53)),200))
10002 I=1
      IF((PARSDT(A$BUF(A$BUF(228-225+27)),I,MONTH,DAY,YEAR).EQ.-2))GOTO 
     *10003
        CALL ERROR(AAAAB0)
10003 I=1
      IF((PARSTM(A$BUF(A$BUF(244-225+27)),I,TIME).EQ.-2))GOTO 10004
        CALL ERROR(AAAAC0)
10004 CURTI0(4)=TIME/3600
      TIME=TIME-(CURTI0(4)*INTL(3600))
      CURTI0(5)=TIME/60
      CURTI0(6)=TIME-CURTI0(5)*60
      STATE(1)=1
10005   AAAAD0=GFNARG(PATH,STATE)
        GOTO 10006
10007     GOTO 10008
10009     CALL ERROR(USAGE)
        GOTO 10010
10006   AAAAE0=AAAAD0+4
        GOTO(10009,10011,10007),AAAAE0
10011     IF((SFDATA(5,PATH,CURTI0,ATTACH,TEMP).NE.-3))GOTO 10012
            CALL PRINT(-15,AAAAF0,PATH)
10012   CONTINUE
10010 CONTINUE
      GOTO 10005
10008 CALL SWT
      END
C ---- Long Name Map ----
C curtime                        curti0