      INTEGER I,J,REPLY,CHOICE,BP,COST,CLIST,MAXC
      INTEGER CPTR(20,3),CCT(3)
      INTEGER GETARG,DIST,CTOC,CTOI
      INTEGER TARRAY(1200)
      INTEGER ARG(102)
      INTEGER BUF(1000)
      INTEGER LEN
      COMMON /GCOM/MAXCO0,ARG,FCW
      INTEGER MAXCO0,FCW
      COMMON /DICTP/MARKS,SIZES
      INTEGER * 4 MARKS(32)
      INTEGER SIZES(32)
      INTEGER AAAAA0(31)
      INTEGER AAAAB0(3)
      INTEGER AAAAC0(33)
      INTEGER AAAAD0(13)
      INTEGER AAAAE0(5)
      DATA AAAAA0/194,249,160,227,232,225,238,227,229,172,160,228,233,22
     *8,160,249,239,245,160,237,229,225,238,160,167,170,243,167,191,160,
     *0/
      DATA AAAAB0/170,249,0/
      DATA AAAAC0/217,239,245,160,237,245,243,244,160,228,233,230,230,22
     *9,242,229,238,244,233,225,244,229,160,225,237,239,238,231,243,244,
     *170,238,0/
      DATA AAAAD0/160,160,160,170,178,233,186,160,170,243,170,238,0/
      DATA AAAAE0/170,243,170,238,0/
      IF((GETARG(2,ARG,102).NE.-1))GOTO 10000
        MAXC=3
        GOTO 10001
10000   I=1
        MAXC=CTOI(ARG,I)
        IF((MAXC.LT.1))GOTO 10003
        IF((MAXC.GT.3))GOTO 10003
        IF((ARG(I).NE.0))GOTO 10003
        GOTO 10002
10003     MAXC=3
10002 CONTINUE
10001 LEN=GETARG(1,ARG,102)
      IF((LEN.NE.-1))GOTO 10004
        CALL BOMB
10004 CALL MAPSTR(ARG,1)
      CALL READH0(CLIST)
      BP=1
      DO 10005 I=1,3
        CCT(I)=0
10005 CONTINUE
10006 FCW=0
      MAXCO0=MAXC
      CALL GETLI0(TARRAY,LEN,CLIST)
      J=1
      GOTO 10009
10007 J=J+(LEN+1)
10009 IF((J.GT.SIZES(LEN)))GOTO 10008
        COST=DIST(TARRAY(J))
        IF((COST.GT.MAXCO0))GOTO 10011
        IF((COST.LT.1))GOTO 10011
        GOTO 10010
10011     GOTO 10007
10010     IF((COST.GE.MAXCO0))GOTO 10012
            MAXCO0=COST
10012   CONTINUE
        IF((CCT(COST).GE.20))GOTO 10013
          CCT(COST)=CCT(COST)+(1)
          CPTR(CCT(COST),COST)=BP
          BP=BP+(1+CTOC(TARRAY(J),BUF(BP),1000-BP))
10013 GOTO 10007
10008 I=1
10014 IF((I.GT.MAXCO0))GOTO 10015
        CALL GETLI0(TARRAY,LEN+I,CLIST)
        J=1
        GOTO 10018
10016   J=J+(LEN+I+1)
10018   IF((J.GT.SIZES(LEN+I)))GOTO 10017
          COST=DIST(TARRAY(J))
          IF((COST.GT.MAXCO0))GOTO 10020
          IF((COST.LT.1))GOTO 10020
          GOTO 10019
10020       GOTO 10016
10019       IF((COST.GE.MAXCO0))GOTO 10021
              MAXCO0=COST
10021     CONTINUE
          IF((CCT(COST).GE.20))GOTO 10022
            CCT(COST)=CCT(COST)+(1)
            CPTR(CCT(COST),COST)=BP
            BP=BP+(1+CTOC(TARRAY(J),BUF(BP),1000-BP))
10022   GOTO 10016
10017   IF((LEN-I.LE.0))GOTO 10023
          CALL GETLI0(TARRAY,LEN-I,CLIST)
          J=1
          GOTO 10026
10024     J=J+(LEN-I+1)
10026     IF((J.GT.SIZES(LEN-I)))GOTO 10025
            COST=DIST(TARRAY(J))
            IF((COST.GT.MAXCO0))GOTO 10028
            IF((COST.LT.1))GOTO 10028
            GOTO 10027
10028         GOTO 10024
10027         IF((COST.GE.MAXCO0))GOTO 10029
                MAXCO0=COST
10029       CONTINUE
            IF((CCT(COST).GE.20))GOTO 10030
              CCT(COST)=CCT(COST)+(1)
              CPTR(CCT(COST),COST)=BP
              BP=BP+(1+CTOC(TARRAY(J),BUF(BP),1000-BP))
10030     GOTO 10024
10025   CONTINUE
10023   I=I+(1)
      GOTO 10014
10015 CALL CLOSE(CLIST)
      I=1
      GOTO 10033
10031 I=I+(1)
10033 IF((I.GT.MAXC))GOTO 10032
      IF((CCT(I).NE.0))GOTO 10032
      GOTO 10031
10032 IF((I.GT.MAXC))GOTO 10035
      IF((CCT(I).GE.20))GOTO 10035
      GOTO 10034
10035   CALL BOMB
10034 IF((CCT(I).NE.1))GOTO 10036
        CALL PRINT(1,AAAAA0,BUF(CPTR(1,I)))
        CALL INPUT(1,AAAAB0,REPLY)
        IF((REPLY.NE.1))GOTO 10037
          CHOICE=1
          GOTO 10038
10037     CHOICE=0
10038   GOTO 10039
10036   CALL PRINT(1,AAAAC0)
        J=1
        GOTO 10042
10040   J=J+(1)
10042   IF((J.GT.CCT(I)))GOTO 10041
          CALL PRINT(1,AAAAD0,J,BUF(CPTR(J,I)))
        GOTO 10040
10041   CALL INPUT(1,'Pick a number:  *i',REPLY)
        IF((REPLY.LT.1))GOTO 10044
        IF((REPLY.GT.CCT(I)))GOTO 10044
        GOTO 10043
10044     CHOICE=0
          GOTO 10045
10043     CHOICE=REPLY
10045 CONTINUE
10039 IF((CHOICE.NE.0))GOTO 10046
        CALL SETERR(1000)
        GOTO 10047
10046   CALL PRINT(-11,AAAAE0,BUF(CPTR(CHOICE,I)))
10047 CALL SWT
      END
      INTEGER FUNCTION DIST(NAME1)
      INTEGER NAME1(102)
      COMMON /GCOM/MAXCO0,NAME2,FCW
      INTEGER NAME2(102)
      INTEGER I1,I2,COST,MAXCO0,FCW
      I1=1
      I2=1
      COST=0
      IF((NAME1(1).EQ.NAME2(1)))GOTO 10048
        COST=COST+(FCW)
10048 CALL RDIST(NAME1,I1,I2,COST)
      DIST=COST
      RETURN
      END
      SUBROUTINE READH0(CLIST)
      INTEGER CLIST
      COMMON /DICTP/MARKS,SIZES
      INTEGER * 4 MARKS(32)
      INTEGER SIZES(32)
      INTEGER OPEN
      INTEGER READF,SEEKF
      INTEGER AAAAF0(13)
      INTEGER AAAAG0(14)
      INTEGER AAAAH0(35)
      INTEGER AAAAI0(36)
      DATA AAAAF0/189,245,226,233,238,189,175,227,236,233,243,244,0/
      DATA AAAAG0/189,229,248,244,242,225,189,175,227,236,233,243,244,0/
      DATA AAAAH0/212,232,233,243,160,233,243,160,244,232,229,160,238,22
     *9,247,160,246,229,242,243,233,239,238,160,239,230,160,231,245,229,
     *243,243,170,238,0/
      DATA AAAAI0/201,160,227,225,238,238,239,244,160,247,239,242,235,16
     *0,245,238,244,233,236,160,249,239,245,160,242,245,238,160,237,235,
     *227,236,233,243,244,0/
      CLIST=OPEN(AAAAF0,1)
      IF((CLIST.NE.-3))GOTO 10049
        CLIST=OPEN(AAAAG0,1)
10049 IF((CLIST.NE.-3))GOTO 10050
        CALL BOMB
10050 IF((SEEKF(INTL(0),CLIST).NE.-3))GOTO 10051
        CALL BOMB
10051 IF((READF(MARKS,32*3,CLIST).NE.-3))GOTO 10052
        CALL BOMB
10052 IF((MARKS(1).EQ.32*3))GOTO 10053
        CALL PRINT(-15,AAAAH0)
        CALL ERROR(AAAAI0)
10053 RETURN
      END
      SUBROUTINE GETLI0(ARRAY,LIST,CLIST)
      INTEGER ARRAY(1)
      INTEGER LIST
      INTEGER CLIST
      COMMON /DICTP/MARKS,SIZES
      INTEGER * 4 MARKS(32)
      INTEGER SIZES(32)
      INTEGER READF,SEEKF
      IF((SEEKF(MARKS(LIST),CLIST).NE.-3))GOTO 10054
        CALL BOMB
10054 IF((READF(ARRAY,SIZES(LIST),CLIST).NE.-3))GOTO 10055
        CALL BOMB
10055 RETURN
      END
      SUBROUTINE BOMB
      COMMON /GCOM/MAXCO0,ARG,FCW
      INTEGER MAXCO0,FCW
      INTEGER ARG(102)
      INTEGER AAAAJ0(12)
      DATA AAAAJ0/186,160,238,239,244,160,230,239,245,238,228,0/
      CALL PUTLIN(ARG,-15)
      CALL ERROR(AAAAJ0)
      RETURN
      END
      SUBROUTINE RDIST(NAME1,I1,I2,COST)
      INTEGER I1,I2,COST
      INTEGER NAME1(102)
      COMMON /GCOM/MAXCO0,NAME2,FCW
      INTEGER NAME2(102)
      INTEGER MAXCO0,FCW
      INTEGER COSTS(96,96)
      INTEGER J1,J2,X,Y
      INTEGER COST1,COST2,COST3,COST4
      DATA COSTS/2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2
     *,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,1,1
     *,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2
     *,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2
     *,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2
     *,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2
     *,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,1,2,2,2,2,2
     *,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,1,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2
     *,2,1,1,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2
     *,2,1,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2
     *,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,1,1
     *,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,1,2,2,2,2,2
     *,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,2,2,1,2,2,1,2,2,2,2,2,2,2,2,1,2,2,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2
     *,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2
     *,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2
     *,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,1
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,1,2
     *,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2
     *,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,1,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2
     *,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2
     *,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2
     *,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2
     *,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,1,2,2,2
     *,2,2,2,2,2,2,2,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2
     *,2,2,2,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2
     *,2,1,1,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2
     *,2,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2
     *,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,1,2,1,2,2
     *,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,1,2,1,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,2,1,1,1,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2
     *,2,2,1,2,2,2,1,1,1,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2
     *,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1
     *,1,1,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1,1
     *,1,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,1,2,2,2,2,2,2,2,2,2,1,1,1,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2
     *,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2
     *,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2
     *,2,2,2,2,2,2,2,1,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2
     *,2,2,2,2,2,2,1,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,1,1,1,2,2,2,2,2
     *,1,2,2,2,1,2,1,2,1,2,2,1,2,2,2,2,2,2,2,2,1,2,2,2,1,1,1,2,2,2,2,2,1
     *,2,2,2,1,2,1,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,1,2,1,2,2,1,1,2,2
     *,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,1,2,2,2,2,1,1,2,1,2,2,1,1,2,2,2
     *,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,1,2,2,2,2
     *,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,1,2,2,2,2,2
     *,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,1,1,2,2,2,2,2,2,1,2
     *,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,1,1,2,2,2,2,2,2,1,2,2
     *,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,2,1,2,2,2,2,2,1,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,2,1,2,2,2,2,2,1,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,1
     *,1,2,1,1,2,2,2,2,2,2,2,2,2,1,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2
     *,2,2,2,2,2,2,2,2,2,1,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,1,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,1,2,2,2,2,1,1,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,2,2,2,1,1,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,1,2,1,2,2,2,2,1,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,1,1,1,2,1,2,2,1,2,2,2,2,2,2,2,2,1,1,1,2,1,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,1,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,1,2,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2
     *,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2
     *,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2
     *,1,2,1,2,2,2,1,1,2,1,2,2,2,2,2,2,1,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,1,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,1,2
     *,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,1,2,1
     *,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,1,2
     *,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,1,2,2
     *,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,1,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2
     *,2,2,2,2,2,2,2,2,1,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2
     *,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,2,2,2,2,2
     *,2,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,1,2,2,2,2,2
     *,2,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,1,2,2,2,2,2,2
     *,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,1,2,2,2,2,2,2,1,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2,1,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,1,1,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,2,2,1,2,2,2,2,2
     *,2,2,2,2,1,1,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2
     *,2,2,2,2,1,2,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,1,2
     *,1,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,1,2,1
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,2,2,1,1,1,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2
     *,2,2,2,2,2,1,2,2,2,1,1,1,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,1,2,2,2,2,2,2,2
     *,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2
     *,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,1,2,2,2,2,2,2,2,2,2,1,1
     *,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,1,1,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1
     *,1,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1
     *,2,2,2,2,2,2,2,2,2,2,1,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,2
     *,2,2,2,2,2,2,2,2,2,1,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,1,1,1,2,2
     *,2,2,2,1,2,2,2,1,2,1,2,1,2,2,1,2,2,2,2,2,2,2,2,1,2,2,2,1,1,1,2,2,2
     *,2,2,1,2,2,2,1,2,1,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,1,2,1,2,2,1
     *,1,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,1,2,2,2,2,1,1,2,1,2,2,1,1
     *,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,1,2
     *,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,1,2,2
     *,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,1,1,2,2,2,2,2
     *,2,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,1,1,2,2,2,2,2,2
     *,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,2,1,2,2,2,2,2,1,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,2,1,2,2,2,2,2,1,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2
     *,2,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2,1,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,1,2,2,2,2,2,2,2,2,2,2,2,1,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,1,2,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,2,2,2,1,1,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,1,2,2,2,2,1,1,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,1,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,1,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,1,1,1,2,1,2,2,1,2,2,2,2,2,2,2,2,1,1,1,2,1,2,2,1,2,2,2,2
     *,2,2,2,2,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2
     *,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2
     *,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,1,1,2,2,2,2,2,2,2,2
     *,2,2,2,1,2,1,2,2,2,1,1,2,1,2,2,2,2,2,2,1,2,1,1,1,2,2,2,2,2,2,2,2,2
     *,2,2,1,2,1,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2
     *,2,1,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2
     *,1,2,1,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2
     *,2,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2,2
     *,1,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2
     *,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,2,2
     *,2,2,2,2,2,2,2,1,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,1,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,1,2,2
     *,2,2,2,2,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,1,2,2,2
     *,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,1,1,2,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,1,2,2,2,2,2,2,1,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,2,1,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,1,1,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2
     *,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,1,1,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
     *,2,2,2,2,2,2,2,2,2,2,2,2,2,2/
      IF((COST.LE.MAXCO0))GOTO 10056
        RETURN
10056 IF((NAME1(I1).NE.0))GOTO 10057
      IF((NAME2(I2).NE.0))GOTO 10057
        RETURN
10057 IF((NAME1(I1).NE.NAME2(I2)))GOTO 10058
        J1=I1+1
        J2=I2+1
        CALL RDIST(NAME1,J1,J2,COST)
        RETURN
10058 IF((NAME1(I1).NE.0))GOTO 10059
        COST1=1000
        GOTO 10060
10059   J1=I1+1
        J2=I2
        COST1=COST+1
        IF((I1.NE.1))GOTO 10061
        IF((NAME1(J1).NE.NAME1(J2)))GOTO 10061
          COST1=COST1-(FCW)
10061   CALL RDIST(NAME1,J1,J2,COST1)
10060 IF((NAME2(I2).NE.0))GOTO 10062
        COST2=1000
        GOTO 10063
10062   J1=I1
        J2=I2+1
        COST2=COST+1
        IF((I1.NE.1))GOTO 10064
        IF((NAME1(J1).NE.NAME1(J2)))GOTO 10064
          COST1=COST1-(FCW)
10064   CALL RDIST(NAME1,J1,J2,COST2)
10063 IF((NAME1(I1).EQ.0))GOTO 10066
      IF((NAME2(I2).EQ.0))GOTO 10066
      GOTO 10065
10066   COST3=1000
        GOTO 10067
10065   X=NAME1(I1)-:240+1
        Y=NAME2(I2)-:240+1
        J1=I1+1
        J2=I2+1
        COST3=COST+COSTS(X,Y)
        CALL RDIST(NAME1,J1,J2,COST3)
10067 IF((NAME2(I2+1).NE.NAME1(I1)))GOTO 10068
      IF((NAME1(I1+1).NE.NAME2(I2)))GOTO 10068
        J1=I1+2
        J2=I2+2
        COST4=COST+1
        IF((I1.NE.1))GOTO 10069
          COST4=COST4-(FCW)
10069   CALL RDIST(NAME1,J1,J2,COST4)
        GOTO 10070
10068   COST4=1000
10070 COST=MIN0(COST1,COST2,COST3,COST4)
      RETURN
      END
C ---- Long Name Map ----
C getlist                        getli0
C maxcost                        maxco0
C readheader                     readh0
