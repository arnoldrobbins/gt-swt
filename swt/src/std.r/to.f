      INTEGER DOFW(10),PID(4),TIME(9),FNAME(42),LINE(102),TONAME(33),FRO
     *MN0(33)
      INTEGER MAPUP
      INTEGER FD,TMP
      INTEGER OPEN,MKTEMP
      INTEGER I,ID
      INTEGER GETARG,VFYUSR,CTOI
      INTEGER AAAAA0(18)
      INTEGER AAAAB0(12)
      DATA AAAAA0/189,231,239,243,243,233,240,189,175,170,170,170,179,17
     *2,172,176,233,0/
      DATA AAAAB0/189,231,239,243,243,233,240,189,175,170,243,0/
      IF((GETARG(1,TONAME,33).NE.-1))GOTO 10000
        CALL ERROR('Usage: to (<user name> | <user number>) [<message>].
     *')
10000 I=1
      ID=CTOI(TONAME,I)
      IF((I.EQ.1))GOTO 10001
        IF((ID.GT.128))GOTO 10003
        IF((ID.LT.1))GOTO 10003
        GOTO 10002
10003     CALL ERROR('bad user number.')
10002   CALL ENCODE(FNAME,9+33,AAAAA0,ID)
        GOTO 10004
10001   IF((VFYUSR(TONAME).NE.-3))GOTO 10005
          CALL ERROR('bad user name.')
          GOTO 10006
10005     CALL ENCODE(FNAME,9+33,AAAAB0,TONAME)
10006 CONTINUE
10004 CALL DATE(3,FROMN0)
      CALL DATE(2,TIME)
      CALL DATE(4,PID)
      CALL DATE(5,DOFW)
      DOFW(1)=MAPUP(DOFW(1))
      TMP=MKTEMP(3)
      IF((TMP.NE.-3))GOTO 10007
        CALL ERROR('can''t open temporary file.')
10007 CALL PRINT(TMP,'*2nFrom *s (*s) at *,5s on *s@.*2n.',FROMN0,PID,TI
     *ME,DOFW)
      I=2
      GOTO 10010
10008 I=I+(1)
10010 IF((GETARG(I,LINE,102).EQ.-1))GOTO 10009
        CALL PRINT(TMP,'*s .',LINE)
      GOTO 10008
10009 IF((I.EQ.2))GOTO 10011
        CALL PUTCH(138,TMP)
        GOTO 10012
10011   CALL FCOPY(-10,TMP)
10012 CALL REWIND(TMP)
      I=0
      GOTO 10015
10013 I=I+(1)
10015 IF((I.GE.10))GOTO 10014
        FD=OPEN(FNAME,2)
        IF((FD.EQ.-3))GOTO 10016
          CALL WIND(FD)
          CALL FCOPY(TMP,FD)
          CALL CLOSE(FD)
          CALL RMTEMP(TMP)
          CALL SWT
10016     CALL SLEEP$(INTL(500))
      GOTO 10013
10014 CALL RMTEMP(TMP)
      CALL ERROR('User is busy@. Try later@..')
      END
C ---- Long Name Map ----
C fromname                       fromn0
