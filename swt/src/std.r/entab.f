      INTEGER GETCH
      INTEGER C,TABCH
      INTEGER TABPOS
      INTEGER COL,NEWCOL,TABS(102)
      CALL SETTAB(TABS,TABCH)
      COL=1
10000   NEWCOL=COL
10001     IF((GETCH(C,-10).NE.TABCH))GOTO 10002
10003         NEWCOL=NEWCOL+1
            IF((TABPOS(NEWCOL,TABS).NE.1))GOTO 10003
            CALL PUTCH(TABCH,-11)
            COL=NEWCOL
            GOTO 10004
10002       IF((C.NE.160))GOTO 10005
              NEWCOL=NEWCOL+1
              IF((TABPOS(NEWCOL,TABS).NE.1))GOTO 10006
                CALL PUTCH(TABCH,-11)
                COL=NEWCOL
10006         GOTO 10007
10005         GOTO 10008
10007     CONTINUE
10004   CONTINUE
        GOTO 10001
10008   GOTO 10011
10009   COL=COL+1
10011   IF((COL.GE.NEWCOL))GOTO 10010
          CALL PUTCH(160,-11)
        GOTO 10009
10010   IF((C.NE.-1))GOTO 10012
          GOTO 10013
10012   CALL PUTCH(C,-11)
        IF((C.NE.138))GOTO 10014
          COL=1
          GOTO 10015
10014     COL=COL+1
10015 CONTINUE
      GOTO 10000
10013 CALL SWT
      END
      INTEGER FUNCTION TABPOS(COL,TABS)
      INTEGER COL,TABS(102)
      IF((COL.LT.1))GOTO 10017
      IF((COL.GE.102))GOTO 10017
      GOTO 10016
10017   TABPOS=1
        GOTO 10018
10016   TABPOS=TABS(COL)
10018 RETURN
      END
      SUBROUTINE SETTAB(TABS,TABCH)
      INTEGER TABS(102)
      INTEGER TABCH
      INTEGER I,J,N,MAX,LAST
      INTEGER GETARG,CTOI
      INTEGER ARG(128)
      I=1
      GOTO 10021
10019 I=I+1
10021 IF((I.GT.102))GOTO 10020
        TABS(I)=0
      GOTO 10019
10020 TABCH=137
      MAX=0
      LAST=1
      I=1
      GOTO 10024
10022 I=I+1
10024 IF((GETARG(I,ARG,128).EQ.-1))GOTO 10023
        IF((ARG(1).NE.173))GOTO 10025
          IF((ARG(2).EQ.244))GOTO 10027
          IF((ARG(2).EQ.212))GOTO 10027
          GOTO 10026
10027       I=I+1
            IF((GETARG(I,ARG,2).NE.-1))GOTO 10028
              CALL USAGE
10028       TABCH=ARG(1)
10026     GOTO 10029
10025     IF((ARG(1).NE.171))GOTO 10030
            J=2
            N=CTOI(ARG,J)
            IF((N.LE.0))GOTO 10031
            IF((ARG(J).NE.0))GOTO 10031
              J=LAST+N
              GOTO 10034
10032         J=J+N
10034         IF((J.GE.102))GOTO 10033
                TABS(J)=1
                MAX=MAX0(J,MAX)
              GOTO 10032
10033         LAST=1
              GOTO 10035
10031         CALL USAGE
10035       GOTO 10036
10030       J=1
            N=CTOI(ARG,J)
            IF((N.LE.0))GOTO 10037
            IF((N.GE.102))GOTO 10037
            IF((ARG(J).NE.0))GOTO 10037
              TABS(N)=1
              LAST=N
              MAX=MAX0(N,MAX)
              GOTO 10038
10037         CALL USAGE
10038     CONTINUE
10036   CONTINUE
10029 GOTO 10022
10023 IF((MAX.NE.0))GOTO 10039
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
      SUBROUTINE USAGE
      CALL ERROR('Usage: entab { -t <tab char> | <col> | +<inc> }.')
      END
C ---- Long Name Map ----
