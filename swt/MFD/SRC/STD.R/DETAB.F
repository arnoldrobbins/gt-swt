      INTEGER LINE(102),TABCH,REPSTR(128)
      INTEGER GETRC
      INTEGER COL,I,TABS(102),RSCOL
      INTEGER TABPOS,GETLIN
      CALL SETTAB(TABS,TABCH,REPSTR)
      COL=1
      RSCOL=1
10000 IF((GETLIN(LINE,-10).EQ.-1))GOTO 10001
        I=1
        GOTO 10004
10002   I=I+1
10004   IF((LINE(I).EQ.0))GOTO 10003
          IF((LINE(I).NE.TABCH))GOTO 10005
10006         CALL PUTCH(GETRC(REPSTR,RSCOL),-11)
              COL=COL+1
            IF((TABPOS(COL,TABS).NE.1))GOTO 10006
            GOTO 10007
10005       RSCOL=1
            CALL PUTCH(LINE(I),-11)
            IF((LINE(I).NE.138))GOTO 10008
              COL=1
              GOTO 10009
10008         COL=COL+1
10009     CONTINUE
10007   GOTO 10002
10003 GOTO 10000
10001 CALL SWT
      END
      INTEGER FUNCTION TABPOS(COL,TABS)
      INTEGER COL,TABS(102)
      IF((COL.LT.1))GOTO 10011
      IF((COL.GE.102))GOTO 10011
      GOTO 10010
10011   TABPOS=1
        GOTO 10012
10010   TABPOS=TABS(COL)
10012 RETURN
      END
      SUBROUTINE SETTAB(TABS,TABCH,REPSTR)
      INTEGER TABS(102)
      INTEGER TABCH,REPSTR(128)
      INTEGER I,J,N,MAX,LAST
      INTEGER GETARG,CTOI
      INTEGER ARG(128)
      I=1
      GOTO 10015
10013 I=I+1
10015 IF((I.GT.102))GOTO 10014
        TABS(I)=0
      GOTO 10013
10014 TABCH=137
      REPSTR(1)=160
      REPSTR(2)=0
      MAX=0
      LAST=1
      I=1
      GOTO 10018
10016 I=I+1
10018 IF((GETARG(I,ARG,128).EQ.-1))GOTO 10017
        IF((ARG(1).NE.173))GOTO 10019
          IF((ARG(2).EQ.244))GOTO 10021
          IF((ARG(2).EQ.212))GOTO 10021
          GOTO 10020
10021       I=I+1
            IF((GETARG(I,ARG,2).NE.-1))GOTO 10022
              CALL USAGE
10022       TABCH=ARG(1)
            GOTO 10023
10020       IF((ARG(2).EQ.242))GOTO 10025
            IF((ARG(2).EQ.210))GOTO 10025
            GOTO 10024
10025         I=I+1
              IF((GETARG(I,REPSTR,128).EQ.-1))GOTO 10027
              IF((REPSTR(1).EQ.0))GOTO 10027
              GOTO 10026
10027           CALL USAGE
10026       CONTINUE
10024     CONTINUE
10023     GOTO 10028
10019     IF((ARG(1).NE.171))GOTO 10029
            J=2
            N=CTOI(ARG,J)
            IF((N.LE.0))GOTO 10030
            IF((ARG(J).NE.0))GOTO 10030
              J=LAST+N
              GOTO 10033
10031         J=J+N
10033         IF((J.GE.102))GOTO 10032
                TABS(J)=1
                MAX=MAX0(J,MAX)
              GOTO 10031
10032         LAST=1
              GOTO 10034
10030         CALL USAGE
10034       GOTO 10035
10029       J=1
            N=CTOI(ARG,J)
            IF((N.LE.0))GOTO 10036
            IF((N.GE.102))GOTO 10036
            IF((ARG(J).NE.0))GOTO 10036
              TABS(N)=1
              LAST=N
              IF((N.LE.MAX))GOTO 10037
                MAX=N
10037         GOTO 10038
10036         CALL USAGE
10038     CONTINUE
10035   CONTINUE
10028 GOTO 10016
10017 IF((MAX.NE.0))GOTO 10039
        I=5
        GOTO 10042
10040   I=I+4
10042   IF((I.GE.102))GOTO 10041
          TABS(I)=1
        GOTO 10040
10041   MAX=I-4
10039 I=MAX+1
      GOTO 10045
10043 I=I+1
10045 IF((I.GE.102))GOTO 10044
        TABS(I)=1
      GOTO 10043
10044 RETURN
      END
      INTEGER FUNCTION GETRC(STR,I)
      INTEGER STR(1)
      INTEGER I
      IF((STR(I).NE.0))GOTO 10046
        I=1
10046 GETRC=STR(I)
      I=I+1
      RETURN
      END
      SUBROUTINE USAGE
      CALL ERROR('Usage: detab { -t <tab char> | -r <repl str> | <col> |
     * +<inc> }.')
      END
C ---- Long Name Map ----
