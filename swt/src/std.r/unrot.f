      INTEGER LINE(102),ARG(128)
      INTEGER GETLIN,GETARG,CTOI
      INTEGER I,MAXOUT,MIDDLE
      MAXOUT=65
      IF((GETARG(1,ARG,128).EQ.-1))GOTO 10000
        IF((ARG(1).NE.173))GOTO 10001
        IF(((ARG(2).NE.247).AND.(ARG(2).NE.215)))GOTO 10001
          IF((GETARG(2,ARG,128).EQ.-1))GOTO 10002
            I=1
            MAXOUT=CTOI(ARG,I)
            GOTO 10003
10002       CALL ERROR('Usage: unrot [ -w <width> ].')
10003     GOTO 10004
10001     CALL ERROR('Usage: unrot [ -w <width> ].')
10004 CONTINUE
10000 MAXOUT=MIN0(MAX0(0,MAXOUT),152-2)
      MIDDLE=MAXOUT/2
      MAXOUT=MAXOUT+2
10005 IF((GETLIN(LINE,-10).EQ.-1))GOTO 10006
        CALL UNROT0(LINE,MIDDLE,MAXOUT,-11)
      GOTO 10005
10006 CALL SWT
      END
      SUBROUTINE UNROT0(BUF,MIDDLE,MAXOUT,FD)
      INTEGER MIDDLE,MAXOUT,FD
      INTEGER BUF(1)
      INTEGER OUTBUF(152)
      INTEGER I,J,K,L,LASTW0
      INTEGER LENGTH,INDEX
      I=1
      GOTO 10009
10007 I=I+1
10009 IF((I.GE.MAXOUT))GOTO 10008
        OUTBUF(I)=160
      GOTO 10007
10008 L=MIDDLE+1
      K=1
      GOTO 10012
10010 K=K+1
10012 IF((((BUF(K).EQ.:140).OR.(BUF(K).EQ.138)).OR.(BUF(K).EQ.0)))GOTO 1
     *0011
        IF(((BUF(K).NE.160).AND.(BUF(K).NE.137)))GOTO 10013
          LASTW0=K
10013   IF((L.LT.MAXOUT-1))GOTO 10014
          GOTO 10017
10015     K=K-1
10017     IF((K.LE.LASTW0))GOTO 10016
            L=L-1
            OUTBUF(L)=160
          GOTO 10015
10016     CONTINUE
10018     IF(((BUF(K).NE.160).AND.(BUF(K).NE.137)))GOTO 10019
            K=K+1
          GOTO 10018
10019     L=MAXOUT-1
          GOTO 10011
10014   OUTBUF(L)=BUF(K)
        L=L+1
      GOTO 10010
10011 I=INDEX(BUF,138)-1
      IF((I.GT.0))GOTO 10020
        I=LENGTH(BUF)
10020 CONTINUE
10021 IF(((BUF(I).NE.160).AND.(BUF(I).NE.137)))GOTO 10022
        IF((I.LT.K))GOTO 10023
          I=I-1
          GOTO 10024
10023     GOTO 10022
10024 GOTO 10021
10022 J=MIDDLE-2
      GOTO 10027
10025 I=I-1
10027 IF(((I.LT.K).OR.(BUF(I).EQ.:140)))GOTO 10026
        IF(((BUF(I).NE.160).AND.(BUF(I).NE.137)))GOTO 10028
          LASTW0=I
10028   IF((J.GE.1))GOTO 10029
          GOTO 10032
10030     I=I+1
10032     IF((I.GE.LASTW0))GOTO 10031
            J=J+1
            OUTBUF(J)=160
          GOTO 10030
10031     CONTINUE
10033     IF(((BUF(I).NE.160).AND.(BUF(I).NE.137)))GOTO 10034
            I=I-1
          GOTO 10033
10034     J=0
          GOTO 10026
10029   OUTBUF(J)=BUF(I)
        J=J-1
      GOTO 10025
10026 IF(((BUF(K).NE.:140).OR.(K.GE.I)))GOTO 10035
        IF((L.GE.MAXOUT-3))GOTO 10036
          OUTBUF(L)=174
          OUTBUF(L+1)=174
          OUTBUF(L+2)=174
          L=L+3
          K=K+1
          GOTO 10039
10037     K=K+1
10039     IF((K.GT.I))GOTO 10038
            IF((L.GE.MAXOUT-1))GOTO 10040
              OUTBUF(L)=BUF(K)
              L=L+1
              GOTO 10041
10040         GOTO 10038
10041     GOTO 10037
10038   CONTINUE
10036   GOTO 10042
10035   IF(((BUF(I).NE.:140).OR.(I.LE.K)))GOTO 10043
          IF((J.LE.2))GOTO 10044
            OUTBUF(J)=174
            OUTBUF(J-1)=174
            OUTBUF(J-2)=174
            J=J-3
            I=I-1
            GOTO 10047
10045       I=I-1
10047       IF((I.LT.K))GOTO 10046
              IF((J.LE.0))GOTO 10048
                OUTBUF(J)=BUF(I)
                J=J-1
                GOTO 10049
10048           GOTO 10046
10049       GOTO 10045
10046     CONTINUE
10044   CONTINUE
10043 CONTINUE
10042 OUTBUF(MAXOUT-1)=138
      OUTBUF(MAXOUT)=0
      CALL PUTLIN(OUTBUF,FD)
      RETURN
      END
C ---- Long Name Map ----
C unrotateline                   unrot0
C lastwhite                      lastw0
