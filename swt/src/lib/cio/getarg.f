      INTEGER FUNCTION GETARG(ARGNUM,EOSBUF,BUFLEN)
      INTEGER ARGNUM,BUFLEN
      INTEGER EOSBUF(BUFLEN)
      INTEGER INFO(8),BUFFER(80),CODE,I
      INTEGER PTOC,EQUAL
      INTEGER AAAAA0(2)
      INTEGER AAAAB0(4)
      DATA AAAAA0/242,0/
      DATA AAAAB0/243,229,231,0/
      CALL RDTK$$(3,INFO,BUFFER,80,CODE)
      CALL RDTK$$(2,INFO,BUFFER,80,CODE)
      CALL PTOC(BUFFER,160,EOSBUF,80)
      CALL MAPSTR(EOSBUF,1)
      IF((EQUAL(EOSBUF,AAAAA0).EQ.1))GOTO 10001
      IF((EQUAL(EOSBUF,AAAAB0).EQ.1))GOTO 10001
      GOTO 10000
10001   CALL RDTK$$(2,INFO,BUFFER,80,CODE)
10000 I=0
      GOTO 10004
10002 I=I+(1)
10004 IF((I.GE.ARGNUM))GOTO 10003
      IF((INFO(1).EQ.6))GOTO 10003
        CALL RDTK$$(2,INFO,BUFFER,80,CODE)
      GOTO 10002
10003 IF((INFO(1).NE.6))GOTO 10005
        GETARG=-1
        RETURN
10005 GETARG=PTOC(BUFFER,160,EOSBUF,80)
      RETURN
      END
C ---- Long Name Map ----