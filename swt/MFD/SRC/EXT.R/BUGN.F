      INTEGER A$BUF(200)
      INTEGER LINE(102)
      INTEGER I,MODE,N
      INTEGER CTOI
      INTEGER FD
      INTEGER OPEN
      INTEGER BUGNU0(8)
      INTEGER PARSCL
      INTEGER AAAAA0(3)
      DATA BUGNU0/189,226,245,231,189,175,164,0/
      DATA AAAAA0/173,233,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR('Usage: bugn [-i].')
10000 IF((A$BUF(233-225+1).EQ.0))GOTO 10001
        MODE=3
        GOTO 10002
10001   MODE=1
10002 FD=OPEN(BUGNU0,MODE)
      IF((FD.NE.-3))GOTO 10003
        CALL CANT(BUGNU0)
10003 CALL GETLIN(LINE,FD)
      I=1
      N=CTOI(LINE,I)
      IF((A$BUF(233-225+1).EQ.0))GOTO 10004
        N=N+(1)
        CALL REWIND(FD)
        CALL PRINT(FD,'*3,,0i*n.',N)
10004 CALL CLOSE(FD)
      CALL PRINT(-11,'*3,,0i*n.',N)
      CALL SWT
      END
C ---- Long Name Map ----
C bugnumber                      bugnu0
