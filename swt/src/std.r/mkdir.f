      INTEGER A$BUF(200)
      INTEGER GETARG,MKDIR$
      INTEGER DIRNAM(180)
      INTEGER USAGE(46)
      INTEGER PARSCL
      INTEGER AAAAA0(12)
      INTEGER CTOC
      INTEGER CTOC
      INTEGER AAAAB0(15)
      DATA USAGE/213,243,225,231,229,186,160,237,235,228,233,242,160,228
     *,233,242,238,225,237,160,219,173,239,160,239,247,238,229,242,221,1
     *60,219,173,238,160,238,239,238,173,239,247,238,229,242,221,0/
      DATA AAAAA0/239,188,242,243,190,160,238,188,242,243,190,0/
      DATA AAAAB0/186,160,227,225,238,167,244,160,227,242,229,225,244,22
     *9,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR(USAGE)
10000 IF((A$BUF(239-225+1).EQ.2))GOTO 10001
        A$BUF(239-225+27)=A$BUF(53)
        A$BUF(53)=A$BUF(53)+(1+CTOC(0,A$BUF(A$BUF(53)),200))
10001 IF((A$BUF(238-225+1).EQ.2))GOTO 10002
        A$BUF(238-225+27)=A$BUF(53)
        A$BUF(53)=A$BUF(53)+(1+CTOC(0,A$BUF(A$BUF(53)),200))
10002 IF((GETARG(1,DIRNAM,180).NE.-1))GOTO 10003
        CALL ERROR(USAGE)
10003 CALL MAPSTR(A$BUF(A$BUF(239-225+27)),2)
      CALL MAPSTR(A$BUF(A$BUF(238-225+27)),2)
      IF((MKDIR$(DIRNAM,A$BUF(A$BUF(239-225+27)),A$BUF(A$BUF(238-225+27)
     *)).NE.-3))GOTO 10004
        CALL PUTLIN(DIRNAM,-15)
        CALL ERROR(AAAAB0)
10004 CALL SWT
      END
C ---- Long Name Map ----
