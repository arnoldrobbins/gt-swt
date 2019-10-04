      INTEGER BUF(102)
      INTEGER GETLIN
      CALL READD0
10000 IF((GETLIN(BUF,-10).EQ.-1))GOTO 10001
        CALL PUTROT(BUF,-11)
      GOTO 10000
10001 CALL SWT
      END
      SUBROUTINE PUTROT(BUF,OUTFIL)
      INTEGER BUF(1)
      INTEGER OUTFIL
      INTEGER I,OUTFIL
      INTEGER DISCA0
      I=1
      GOTO 10004
10002 CONTINUE
10004 IF((BUF(I).EQ.138))GOTO 10003
      IF((BUF(I).EQ.0))GOTO 10003
        IF((BUF(I).EQ.160))GOTO 10005
        IF((BUF(I).EQ.137))GOTO 10005
          IF((DISCA0(BUF(I)).NE.0))GOTO 10006
            CALL ROTATE(BUF,I,OUTFIL)
10006     CONTINUE
10007       I=I+(1)
          IF((BUF(I).EQ.160))GOTO 10008
          IF((BUF(I).EQ.137))GOTO 10008
          IF((BUF(I).EQ.138))GOTO 10008
          IF((BUF(I).EQ.0))GOTO 10008
          GOTO 10007
10008     CONTINUE
10005   CONTINUE
10009   IF((BUF(I).EQ.160))GOTO 10011
        IF((BUF(I).EQ.137))GOTO 10011
        GOTO 10010
10011     I=I+(1)
        GOTO 10009
10010 GOTO 10002
10003 RETURN
      END
      SUBROUTINE ROTATE(BUF,N,OUTFIL)
      INTEGER BUF(1)
      INTEGER I,N,OUTFIL
      I=N
      GOTO 10014
10012 I=I+(1)
10014 IF((BUF(I).EQ.138))GOTO 10013
      IF((BUF(I).EQ.0))GOTO 10013
        CALL PUTCH(BUF(I),OUTFIL)
      GOTO 10012
10013 CALL PUTCH(:140,OUTFIL)
      I=1
      GOTO 10017
10015 I=I+(1)
10017 IF((I.GE.N))GOTO 10016
        CALL PUTCH(BUF(I),OUTFIL)
      GOTO 10015
10016 CALL PUTCH(138,OUTFIL)
      RETURN
      END
      INTEGER FUNCTION DISCA0(BUF)
      INTEGER BUF(1)
      INTEGER WORD(102)
      INTEGER I
      INTEGER SEARCH
      I=1
      GOTO 10020
10018 I=I+1
10020 IF((BUF(I).EQ.160))GOTO 10019
      IF((BUF(I).EQ.137))GOTO 10019
      IF((BUF(I).EQ.0))GOTO 10019
      IF((BUF(I).EQ.138))GOTO 10019
      IF((I.GE.102))GOTO 10019
        WORD(I)=BUF(I)
      GOTO 10018
10019 WORD(I)=0
      CALL MAPSTR(WORD,1)
      IF((SEARCH(WORD).NE.-1))GOTO 10021
        DISCA0=0
        GOTO 10022
10021   DISCA0=1
10022 RETURN
      END
      INTEGER FUNCTION SEARCH(WORD)
      INTEGER WORD(1)
      INTEGER I,J,K
      INTEGER COMPA0
      COMMON /KWDCOM/KWDPOS,KWDTE0,NUMKW0
      INTEGER KWDPOS(200)
      INTEGER KWDTE0(2048)
      INTEGER NUMKW0
      INTEGER AAAAA0
      I=1
      J=NUMKW0
      IF((I.GT.J))GOTO 10023
10024     K=(I+J)/2
          AAAAA0=COMPA0(KWDTE0(KWDPOS(K)),WORD)
          GOTO 10025
10026       I=K+1
          GOTO 10027
10028       SEARCH=KWDPOS(K)
            RETURN
10029       J=K-1
          GOTO 10027
10025     GOTO(10026,10028,10029),AAAAA0
10027   CONTINUE
        IF((I.LE.J))GOTO 10024
10023 SEARCH=-1
      RETURN
      END
      INTEGER FUNCTION COMPA0(STR1,STR2)
      INTEGER STR1(1),STR2(1)
      INTEGER I
      I=1
      GOTO 10032
10030 I=I+1
10032 IF((STR1(I).NE.STR2(I)))GOTO 10031
        IF(((STR1(I).NE.0).AND.(STR2(I).NE.0)))GOTO 10033
          GOTO 10031
10033 GOTO 10030
10031 IF((STR1(I).NE.STR2(I)))GOTO 10034
        COMPA0=2
        GOTO 10035
10034   IF((STR1(I).EQ.0))GOTO 10037
        IF(((STR1(I).LT.STR2(I)).AND.(STR2(I).NE.0)))GOTO 10037
        GOTO 10036
10037     COMPA0=1
          GOTO 10038
10036     IF((STR2(I).EQ.0))GOTO 10040
          IF(((STR2(I).LT.STR1(I)).AND.(STR1(I).NE.0)))GOTO 10040
          GOTO 10039
10040       COMPA0=3
            GOTO 10041
10039       CALL ERROR('in compare: can''t happen.')
10041   CONTINUE
10038 CONTINUE
10035 RETURN
      END
      SUBROUTINE READD0
      INTEGER I,L,FD
      INTEGER GETLI0,GETLIN
      INTEGER LINE(102)
      COMMON /KWDCOM/KWDPOS,KWDTE0,NUMKW0
      INTEGER KWDPOS(200)
      INTEGER KWDTE0(2048)
      INTEGER NUMKW0
      NUMKW0=0
      IF((GETLI0(FD).NE.-3))GOTO 10042
        RETURN
10042 I=1
      L=GETLIN(LINE,FD)
10043 IF((L.EQ.-1))GOTO 10044
        IF((LINE(L).NE.138))GOTO 10045
          LINE(L)=0
          L=L-1
10045   IF((2048-I.LE.L))GOTO 10046
        IF((NUMKW0.GE.200))GOTO 10046
          NUMKW0=NUMKW0+1
          KWDPOS(NUMKW0)=I
          CALL SCOPY(LINE,1,KWDTE0,I)
          I=I+L+1
          GOTO 10047
10046     CALL PRINT(-15,'*s: discard list too long*n.',LINE)
          GOTO 10044
10047   L=GETLIN(LINE,FD)
      GOTO 10043
10044 IF((FD.EQ.-12))GOTO 10048
        CALL CLOSE(FD)
10048 RETURN
      END
      INTEGER FUNCTION GETLI0(FD)
      INTEGER FD
      INTEGER ARG(128)
      INTEGER GETARG,OPEN
      IF((GETARG(1,ARG,128).EQ.-1))GOTO 10049
        IF((ARG(1).NE.173))GOTO 10050
        IF(((ARG(2).NE.228).AND.(ARG(2).NE.196)))GOTO 10050
          IF((GETARG(2,ARG,128).EQ.-1))GOTO 10051
            FD=OPEN(ARG,1)
            IF((FD.NE.-3))GOTO 10052
              CALL CANT(ARG)
10052       GOTO 10053
10051       FD=-12
10053     GOTO 10054
10050     CALL ERROR('Usage: kwic [ -d [ <discard_list> ] ].')
10054   GOTO 10055
10049   FD=-3
10055 GETLI0=FD
      RETURN
      END
C ---- Long Name Map ----
C compare                        compa0
C getlist                        getli0
C discard                        disca0
C numkwds                        numkw0
C readdiscards                   readd0
C kwdtext                        kwdte0