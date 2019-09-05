      SUBROUTINE SORT(IFD,OUTFD)
      INTEGER IFD,OUTFD
      INTEGER LINBUF(16384),NAME(30)
      INTEGER GTEXT,MAKFIL,OPEN
      INTEGER INFIL(6),LINPTR(2048),NLINES
      INTEGER HIGH,LIM,LOW,T
      HIGH=0
10000   T=GTEXT(LINPTR,NLINES,LINBUF,IFD)
        CALL QUICK(LINPTR,NLINES,LINBUF)
        HIGH=HIGH+1
        OUTFD=MAKFIL(HIGH)
        CALL PTEXT(LINPTR,NLINES,LINBUF,OUTFD)
        CALL CLOSE(OUTFD)
      IF((T.NE.-1))GOTO 10000
      LOW=1
      GOTO 10003
10001 LOW=LOW+6
10003 IF((LOW.GE.HIGH))GOTO 10002
        LIM=MIN0(LOW+6-1,HIGH)
        CALL GOPEN(INFIL,LOW,LIM)
        HIGH=HIGH+1
        OUTFD=MAKFIL(HIGH)
        CALL MERGE(INFIL,LIM-LOW+1,OUTFD)
        CALL CLOSE(OUTFD)
        CALL GREMOV(INFIL,LOW,LIM)
      GOTO 10001
10002 CALL GNAME(HIGH,NAME)
      OUTFD=OPEN(NAME,1)
      RETURN
      END
      SUBROUTINE GNAME(N,NAME)
      INTEGER NAME(30)
      INTEGER ITOC,SCOPY
      INTEGER I,JUNK,N
      INTEGER AAAAA0(15)
      DATA AAAAA0/189,244,229,237,240,189,175,248,244,189,240,233,228,18
     *9,0/
      I=1+SCOPY(AAAAA0,1,NAME,1)
      JUNK=ITOC(N,NAME(I),30-I)
      RETURN
      END
      INTEGER FUNCTION MAKFIL(N)
      INTEGER NAME(30)
      INTEGER CREATE
      INTEGER N
      CALL GNAME(N,NAME)
      MAKFIL=CREATE(NAME,3)
      IF((MAKFIL.NE.-3))GOTO 10004
        CALL CANT(NAME)
10004 RETURN
      END
      SUBROUTINE GOPEN(INFIL,LOW,LIM)
      INTEGER NAME(30)
      INTEGER I,INFIL(6),LIM,LOW
      INTEGER OPEN
      I=1
      GOTO 10007
10005 I=I+1
10007 IF((I.GT.LIM-LOW+1))GOTO 10006
        CALL GNAME(LOW+I-1,NAME)
        INFIL(I)=OPEN(NAME,1)
        IF((INFIL(I).NE.-3))GOTO 10008
          CALL CANT(NAME)
10008 GOTO 10005
10006 RETURN
      END
      SUBROUTINE GREMOV(INFIL,LOW,LIM)
      INTEGER NAME(30)
      INTEGER I,INFIL(6),LIM,LOW
      I=1
      GOTO 10011
10009 I=I+1
10011 IF((I.GT.LIM-LOW+1))GOTO 10010
        CALL CLOSE(INFIL(I))
        CALL GNAME(LOW+I-1,NAME)
        CALL REMOVE(NAME)
      GOTO 10009
10010 RETURN
      END
      SUBROUTINE MERGE(INFIL,NFILES,OUTFIL)
      INTEGER LINBUF(900)
      INTEGER GETLIN
      INTEGER I,INF,LBP,LP1,NF,NFILES,OUTFIL
      INTEGER INFIL(6),LINPTR(6)
      LBP=1
      NF=0
      I=1
      GOTO 10014
10012 I=I+1
10014 IF((I.GT.NFILES))GOTO 10013
        IF((GETLIN(LINBUF(LBP),INFIL(I)).EQ.-1))GOTO 10015
          NF=NF+1
          LINPTR(NF)=LBP
          LBP=LBP+102
10015 GOTO 10012
10013 CALL QUICK(LINPTR,NF,LINBUF)
10016 IF((NF.LE.0))GOTO 10017
        LP1=LINPTR(1)
        CALL PUTLIN(LINBUF(LP1),OUTFIL)
        INF=LP1/102+1
        IF((GETLIN(LINBUF(LP1),INFIL(INF)).NE.-1))GOTO 10018
          LINPTR(1)=LINPTR(NF)
          NF=NF-1
10018   CALL REHEAP(LINPTR,NF,LINBUF)
      GOTO 10016
10017 RETURN
      END
      SUBROUTINE REHEAP(LINPTR,NF,LINBUF)
      INTEGER LINBUF(16384)
      INTEGER COMPA0
      INTEGER I,J,NF,LINPTR(NF)
      I=1
      GOTO 10021
10019 I=J
10021 IF((2*I.GT.NF))GOTO 10020
        J=2*I
        IF((J.GE.NF))GOTO 10022
          IF((COMPA0(LINPTR(J),LINPTR(J+1),LINBUF).LE.0))GOTO 10023
            J=J+1
10023   CONTINUE
10022   IF((COMPA0(LINPTR(I),LINPTR(J),LINBUF).GT.0))GOTO 10024
          GOTO 10020
10024   CALL EXCHAN(LINPTR(I),LINPTR(J),LINBUF)
      GOTO 10019
10020 RETURN
      END
      INTEGER FUNCTION GTEXT(LINPTR,NLINES,LINBUF,INFILE)
      INTEGER LINBUF(16384)
      INTEGER GETLIN
      INTEGER INFILE,LBP,LEN,LINPTR(2048),NLINES
      NLINES=0
      LBP=1
10025   LEN=GETLIN(LINBUF(LBP),INFILE)
        IF((LEN.NE.-1))GOTO 10026
          GOTO 10027
10026   NLINES=NLINES+1
        LINPTR(NLINES)=LBP
        LBP=LBP+LEN+1
      IF(((LBP.LT.16384-102).AND.(NLINES.LT.2048)))GOTO 10025
10027 GTEXT=LEN
      RETURN
      END
      SUBROUTINE PTEXT(LINPTR,NLINES,LINBUF,OUTFIL)
      INTEGER LINBUF(16384)
      INTEGER I,J,LINPTR(2048),NLINES,OUTFIL
      I=1
      GOTO 10030
10028 I=I+1
10030 IF((I.GT.NLINES))GOTO 10029
        J=LINPTR(I)
        CALL PUTLIN(LINBUF(J),OUTFIL)
      GOTO 10028
10029 RETURN
      END
      INTEGER FUNCTION COMPA0(LP1,LP2,LINBUF)
      INTEGER LINBUF(1)
      INTEGER I,J,LP1,LP2
      I=LP1
      J=LP2
10031 IF((LINBUF(I).NE.LINBUF(J)))GOTO 10032
        IF((LINBUF(I).NE.0))GOTO 10033
          COMPA0=0
          RETURN
10033   I=I+1
        J=J+1
      GOTO 10031
10032 IF((LINBUF(I).GE.LINBUF(J)))GOTO 10034
        COMPA0=-1
        GOTO 10035
10034   COMPA0=1
10035 RETURN
      END
      SUBROUTINE EXCHAN(LP1,LP2,LINBUF)
      INTEGER LINBUF(1)
      INTEGER K,LP1,LP2
      K=LP1
      LP1=LP2
      LP2=K
      RETURN
      END
      SUBROUTINE QUICK(LINPTR,NLINES,LINBUF)
      INTEGER LINBUF(1)
      INTEGER COMPA0
      INTEGER I,J,LINPTR(1),LV(20),NLINES,P,PIVLIN,UV(20)
      LV(1)=1
      UV(1)=NLINES
      P=1
10036 IF((P.LE.0))GOTO 10037
        IF((LV(P).LT.UV(P)))GOTO 10038
          P=P-1
          GOTO 10039
10038     I=LV(P)-1
          J=UV(P)
          PIVLIN=LINPTR(J)
10040     IF((I.GE.J))GOTO 10041
            I=I+1
            GOTO 10044
10042       I=I+1
10044       IF((COMPA0(LINPTR(I),PIVLIN,LINBUF).GE.0))GOTO 10043
            GOTO 10042
10043       J=J-1
            GOTO 10047
10045       J=J-1
10047       IF((J.LE.I))GOTO 10046
              IF((COMPA0(LINPTR(J),PIVLIN,LINBUF).GT.0))GOTO 10048
                GOTO 10046
10048       GOTO 10045
10046       IF((I.GE.J))GOTO 10049
              CALL EXCHAN(LINPTR(I),LINPTR(J),LINBUF)
10049     GOTO 10040
10041     J=UV(P)
          CALL EXCHAN(LINPTR(I),LINPTR(J),LINBUF)
          IF((I-LV(P).GE.UV(P)-I))GOTO 10050
            LV(P+1)=LV(P)
            UV(P+1)=I-1
            LV(P)=I+1
            GOTO 10051
10050       LV(P+1)=I+1
            UV(P+1)=UV(P)
            UV(P)=I-1
10051     P=P+1
10039 GOTO 10036
10037 RETURN
      END
C ---- Long Name Map ----
C getlinkid                      getli0
C deleteunderscores              delet0
C enterdefinition                enter0
C enterlongname                  entet0
C compare                        compa0
C cleanup                        clean0
C convertstringconstant          conve0
C putbackstr                     putbc0
C putback                        putba0
C obufcom                        obufc0
C invokemacro                    invok0
C refillbuffer                   refil0
C savemodulename                 savem0
C loopcom                        loopc0
C fatalerr                       fatal0
C removedefinition               remov0
C dgetsym                        dgets0
C codegen                        codeg0
C enterkw                        entes0
C initialize                     initi0
C skipwhitespace                 skipw0
C getactualparameters            getac0
C makeunique                     makeu0
C collectactualparameter         colle0
C getdefinition                  getde0
C getformalparameters            getfo0
C getlongname                    getlo0
C putbacknum                     putbb0
