      INTEGER FIRST0
      INTEGER MEMAA0(32700)
      COMMON /DS$MEM/MEMAA0
      COMMON /CTSORT/FIRST0
      INTEGER A$BUF(200)
      INTEGER T,I,J
      INTEGER DSGET,INDEX
      INTEGER INPUT
      INTEGER PRECE0(102),FOLLO0(102)
      LOGICAL FOUND
      LOGICAL PRESE0,ANYPR0
      INTEGER PARSCL
      INTEGER AAAAA0(2)
      INTEGER AAAAB0(20)
      INTEGER AAAAC0(5)
      INTEGER AAAAD0(22)
      INTEGER AAAAE0(5)
      DATA AAAAA0/246,0/
      DATA AAAAB0/213,243,225,231,229,186,160,244,243,239,242,244,160,21
     *9,160,173,246,160,221,0/
      DATA AAAAC0/170,243,170,243,0/
      DATA AAAAD0/162,170,243,172,170,243,162,160,233,238,240,245,244,16
     *0,229,242,242,239,242,170,238,0/
      DATA AAAAE0/170,243,170,238,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR(AAAAB0)
10000 CALL DSINIT(32700)
      FIRST0=DSGET(5)
      MEMAA0(FIRST0+0)=0
      MEMAA0(FIRST0+1)=0
      MEMAA0(MEMAA0(FIRST0+2))=0
      MEMAA0(FIRST0+3)=1
      MEMAA0(FIRST0+4)=0
10001   IF((INPUT(-10,AAAAC0,PRECE0,FOLLO0).NE.-1))GOTO 10002
          GOTO 10003
10002   IF((PRECE0(1).EQ.0))GOTO 10005
        IF((FOLLO0(1).EQ.0))GOTO 10005
        GOTO 10004
10005     CALL PRINT(-15,AAAAD0,PRECE0,FOLLO0)
          GOTO 10006
10004   I=INDEX(PRECE0)
        J=INDEX(FOLLO0)
        MEMAA0(I+4)=1
        IF((I.EQ.J))GOTO 10008
        IF(PRESE0(I,J))GOTO 10008
        GOTO 10007
10008     GOTO 10006
10007   T=DSGET(2)
        MEMAA0(T+0)=MEMAA0(J+1)
        MEMAA0(T+1)=I
        MEMAA0(J+1)=T
10006 GOTO 10001
10003 CONTINUE
10009   FOUND=.FALSE.
        I=FIRST0
        GOTO 10012
10010   I=MEMAA0(I+0)
10012   IF((MEMAA0(I+0).EQ.0))GOTO 10011
          IF((MEMAA0(I+3).NE.2))GOTO 10013
            FOUND=.TRUE.
            IF(ANYPR0(I))GOTO 10014
              GOTO 10011
10014     CONTINUE
10013   GOTO 10010
10011   IF(FOUND)GOTO 10015
          GOTO 10016
10015   IF((MEMAA0(I+0).NE.0))GOTO 10017
          CALL FINDL0(I)
10017   IF((A$BUF(246-225+1).NE.0))GOTO 10019
        IF((MEMAA0(I+4).EQ.1))GOTO 10019
        GOTO 10018
10019     CALL PRINT(-11,AAAAE0,MEMAA0(MEMAA0(I+2)))
10018   MEMAA0(I+3)=1
      GOTO 10009
10016 CALL SWT
      END
      LOGICAL FUNCTION PRESE0(I,J)
      INTEGER I,J
      INTEGER FIRST0
      INTEGER MEMAA0(32700)
      COMMON /DS$MEM/MEMAA0
      COMMON /CTSORT/FIRST0
      INTEGER T
      T=MEMAA0(J+1)
      GOTO 10022
10020 T=MEMAA0(T+0)
10022 IF((T.EQ.0))GOTO 10021
        IF((MEMAA0(T+1).NE.I))GOTO 10023
          PRESE0=.TRUE.
          RETURN
10023 GOTO 10020
10021 PRESE0=.FALSE.
      RETURN
      END
      LOGICAL FUNCTION ANYPR0(I)
      INTEGER I
      INTEGER FIRST0
      INTEGER MEMAA0(32700)
      COMMON /DS$MEM/MEMAA0
      COMMON /CTSORT/FIRST0
      INTEGER T
      T=MEMAA0(I+1)
      GOTO 10026
10024 T=MEMAA0(T+0)
10026 IF((T.EQ.0))GOTO 10025
        IF((MEMAA0(MEMAA0(T+1)+3).NE.2))GOTO 10027
          ANYPR0=.TRUE.
          RETURN
10027 GOTO 10024
10025 ANYPR0=.FALSE.
      RETURN
      END
      INTEGER FUNCTION INDEX(S)
      INTEGER S(1)
      INTEGER FIRST0
      INTEGER MEMAA0(32700)
      COMMON /DS$MEM/MEMAA0
      COMMON /CTSORT/FIRST0
      INTEGER I,T
      INTEGER DSGET
      INTEGER LENGTH,EQUAL
      I=FIRST0
      GOTO 10030
10028 I=MEMAA0(I+0)
10030 IF((MEMAA0(I+0).EQ.0))GOTO 10029
        IF((EQUAL(S,MEMAA0(MEMAA0(I+2))).NE.1))GOTO 10031
          INDEX=I
          RETURN
10031 GOTO 10028
10029 T=DSGET(LENGTH(S)+1)
      MEMAA0(I+0)=DSGET(5)
      MEMAA0(I+2)=T
      MEMAA0(I+3)=2
      MEMAA0(MEMAA0(I+0)+0)=0
      MEMAA0(MEMAA0(I+0)+1)=0
      MEMAA0(MEMAA0(I+0)+3)=1
      CALL CTOC(S,MEMAA0(MEMAA0(I+2)),102)
      INDEX=I
      RETURN
      END
      SUBROUTINE FINDL0(PTR)
      INTEGER PTR
      INTEGER FIRST0
      INTEGER MEMAA0(32700)
      COMMON /DS$MEM/MEMAA0
      COMMON /CTSORT/FIRST0
      INTEGER I,J,P
      INTEGER AAAAF0(26)
      INTEGER AAAAG0(8)
      INTEGER AAAAH0(4)
      INTEGER AAAAI0(8)
      DATA AAAAF0/227,249,227,236,229,160,168,233,238,160,242,229,246,22
     *9,242,243,229,160,239,242,228,229,242,169,186,0/
      DATA AAAAG0/229,242,242,239,242,160,177,0/
      DATA AAAAH0/160,170,243,0/
      DATA AAAAI0/229,242,242,239,242,160,178,0/
      I=FIRST0
      GOTO 10034
10032 I=MEMAA0(I+0)
10034 IF((MEMAA0(I+0).EQ.0))GOTO 10033
        IF((MEMAA0(I+3).NE.2))GOTO 10035
          GOTO 10033
10035 GOTO 10032
10033 CALL PRINT(-15,AAAAF0)
10036 IF((MEMAA0(I+3).NE.2))GOTO 10037
        MEMAA0(I+3)=3
        P=MEMAA0(I+1)
        GOTO 10040
10038   P=MEMAA0(P+0)
10040     IF((P.NE.0))GOTO 10041
            CALL ERROR(AAAAG0)
10041     I=MEMAA0(P+1)
          IF((MEMAA0(I+3).EQ.1))GOTO 10042
            GOTO 10039
10042   GOTO 10038
10039 GOTO 10036
10037 CONTINUE
10043 IF((MEMAA0(I+3).NE.3))GOTO 10044
        MEMAA0(I+3)=4
        CALL PRINT(-15,AAAAH0,MEMAA0(MEMAA0(I+2)))
        P=MEMAA0(I+1)
        GOTO 10047
10045   P=MEMAA0(P+0)
10047     IF((P.NE.0))GOTO 10048
            CALL ERROR(AAAAI0)
10048     I=MEMAA0(P+1)
          IF((MEMAA0(I+3).EQ.1))GOTO 10049
            GOTO 10046
10049   GOTO 10045
10046 GOTO 10043
10044 CALL PUTCH(138,-15)
      J=FIRST0
      GOTO 10052
10050 J=MEMAA0(J+0)
10052 IF((MEMAA0(J+0).EQ.0))GOTO 10051
        IF((MEMAA0(J+3).EQ.1))GOTO 10053
          MEMAA0(J+3)=2
10053 GOTO 10050
10051 PTR=I
      RETURN
      END
C ---- Long Name Map ----
C anypred                        anypr0
C precedes                       prece0
C firstnode                      first0
C Mem                            memaa0
C present                        prese0
C findloop                       findl0
C follows                        follo0
