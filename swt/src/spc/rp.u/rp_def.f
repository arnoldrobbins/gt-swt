      SUBROUTINE REMOV0
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER SKIPW0,LOOKUP
      INTEGER ID(200),TEXT(200)
      INTEGER INFO(3)
      IF((SKIPW0(ID).EQ.1024))GOTO 10000
        CALL SYNERR('Identifier must follow ''undefine''.')
        RETURN
10000 CALL DELET0(ID,ID)
      IF((SKIPW0(TEXT).EQ.169))GOTO 10001
        CALL SYNERR('Right paren must follow identifier in ''undefine''.
     *')
        RETURN
10001 IF((LOOKUP(ID,INFO,IDTAB0).EQ.0))GOTO 10003
      IF((INFO(1).NE.3))GOTO 10003
      GOTO 10002
10003   RETURN
10002 CALL DSFREE(INFO(3))
      CALL DELETE(ID,IDTAB0)
      RETURN
      END
      SUBROUTINE INVOK0(INFO)
      INTEGER INFO(3)
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER I,NP,J
      INTEGER CTOC
      INTEGER DEFN(400)
      INTEGER TABLE(32)
      NP=0
      IF((INFO(2).LE.0))GOTO 10004
        CALL GETAC0(TABLE,NP)
10004 J=1
      I=INFO(3)
      GOTO 10007
10005 I=I+(1)
10007 IF((MEMAA0(I).EQ.0))GOTO 10006
        IF((MEMAA0(I).EQ.1024))GOTO 10008
          DEFN(J)=MEMAA0(I)
          J=J+(1)
          GOTO 10009
10008     I=I+(1)
          IF((NP.LT.MEMAA0(I)))GOTO 10010
            J=J+(CTOC(MEMAA0(TABLE(MEMAA0(I))),DEFN(J),400-J+1))
10010   CONTINUE
10009   IF((J.LT.400-1))GOTO 10005
          CALL SYNERR('result of define invocation too long.')
          GOTO 10006
10006 DEFN(J)=0
      CALL PUTBC0(DEFN)
      I=1
      GOTO 10014
10012 I=I+(1)
10014 IF((I.GT.NP))GOTO 10013
        CALL DSFREE(TABLE(I))
      GOTO 10012
10013 RETURN
      END
      SUBROUTINE ENTER0
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER ID(200),TEXT(200)
      INTEGER T,NP
      INTEGER SKIPW0,GETFO0,LOOKUP
      INTEGER PARAMS,P
      INTEGER GETDE0
      INTEGER INFO(3)
      T=SKIPW0(ID)
      IF((T.EQ.1024))GOTO 10015
        CALL SYNERR('only identifiers may be defined.')
        RETURN
10015 CALL DELET0(ID,ID)
      T=SKIPW0(TEXT)
      IF((T.NE.168))GOTO 10016
        IF((GETFO0(PARAMS,NP).NE.-3))GOTO 10017
          RETURN
10017   T=SKIPW0(TEXT)
        GOTO 10018
10016   NP=0
        PARAMS=0
10018 IF((T.EQ.172))GOTO 10019
        CALL SYNERR('define identifer must be followed by a comma.')
        IF((PARAMS.EQ.0))GOTO 10020
          CALL RMTABL(PARAMS)
10020   RETURN
10019 P=GETDE0(PARAMS)
      IF((P.NE.-3))GOTO 10021
        RETURN
10021 IF((LOOKUP(ID,INFO,IDTAB0).NE.1))GOTO 10022
      IF((INFO(1).NE.3))GOTO 10022
        CALL DSFREE(INFO(3))
10022 INFO(1)=3
      INFO(2)=NP
      INFO(3)=P
      CALL ENTER(ID,INFO,IDTAB0)
      RETURN
      END
      INTEGER FUNCTION DGETS0(TEXT)
      INTEGER TEXT(1)
      INTEGER TL
      INTEGER C
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      IF((INBUF0(IBPAA0).EQ.0))GOTO 10023
        C=INBUF0(IBPAA0)
        IBPAA0=IBPAA0+(1)
        GOTO 10024
10023   CALL REFIL0(C)
10024 IF((193.GT.C))GOTO 10027
      IF((C.GT.218))GOTO 10027
      GOTO 10026
10027 IF((225.GT.C))GOTO 10025
      IF((C.GT.250))GOTO 10025
      GOTO 10026
10026   TEXT(1)=C
        TL=1
        IF((INBUF0(IBPAA0).EQ.0))GOTO 10029
          C=INBUF0(IBPAA0)
          IBPAA0=IBPAA0+(1)
          GOTO 10030
10029     CALL REFIL0(C)
10030   CONTINUE
10031   IF((193.GT.C))GOTO 10034
        IF((C.GT.218))GOTO 10034
        GOTO 10033
10034   IF((225.GT.C))GOTO 10035
        IF((C.GT.250))GOTO 10035
        GOTO 10033
10035   IF((176.GT.C))GOTO 10036
        IF((C.GT.185))GOTO 10036
        GOTO 10033
10036   IF((C.EQ.223))GOTO 10033
        IF((C.EQ.164))GOTO 10033
        GOTO 10032
10033     IF((TL.LT.200))GOTO 10037
            CALL SYNERR('token too long.')
            GOTO 10032
10037     TEXT(TL+1)=C
          TL=TL+(1)
          IF((INBUF0(IBPAA0).EQ.0))GOTO 10038
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10031
10038       CALL REFIL0(C)
10039   GOTO 10031
10032   TEXT(TL+1)=0
        CALL PUTBA0(C)
        DGETS0=1024
        RETURN
10025 TEXT(1)=C
      TEXT(2)=0
      DGETS0=C
      RETURN
      END
      INTEGER FUNCTION GETFO0(TABLE,NUMBER)
      INTEGER TABLE
      INTEGER NUMBER
      INTEGER T
      INTEGER SKIPW0
      INTEGER TEXT(200)
      INTEGER MKTABL
      INTEGER INFO(3)
      TABLE=MKTABL(3)
      NUMBER=0
10040   T=SKIPW0(TEXT)
        IF((T.EQ.1024))GOTO 10041
          CALL SYNERR('define formal parameters must be identifiers.')
          CALL RMTABL(TABLE)
          GETFO0=-3
          RETURN
10041   CALL DELET0(TEXT,TEXT)
        NUMBER=NUMBER+(1)
        INFO(2)=NUMBER
        CALL ENTER(TEXT,INFO,TABLE)
        T=SKIPW0(TEXT)
        IF((T.EQ.172))GOTO 10042
        IF((T.EQ.169))GOTO 10042
          CALL SYNERR('commas must separate define formal parameters.')
          CALL RMTABL(TABLE)
          GETFO0=-3
          RETURN
10042 CONTINUE
      IF((T.NE.169))GOTO 10040
      GETFO0=-2
      RETURN
      END
      INTEGER FUNCTION SKIPW0(TEXT)
      INTEGER TEXT(1)
      INTEGER T
      INTEGER DGETS0
10043   T=DGETS0(TEXT)
      IF((T.EQ.138))GOTO 10043
      IF((T.EQ.160))GOTO 10043
      SKIPW0=T
      RETURN
      END
      INTEGER FUNCTION GETDE0(TABLE)
      INTEGER TABLE
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER NLPAR,BUFLEN,L
      INTEGER DGETS0,LOOKUP,LENGTH
      INTEGER DEFN(400),TEXT(200),ID(200),INQUO0
      INTEGER SDUPL
      INTEGER INFO(3)
      INTEGER AAAAA0
      INTEGER AAAAB0
      NLPAR=0
      INQUO0=160
      BUFLEN=1
      DEFN(1)=0
10044   AAAAA0=DGETS0(TEXT)
        GOTO 10045
10046     IF((INQUO0.NE.160))GOTO 10048
            NLPAR=NLPAR+(1)
10047   GOTO 10048
10049     IF((INQUO0.NE.160))GOTO 10048
            NLPAR=NLPAR-(1)
            IF((NLPAR.GE.0))GOTO 10051
              GOTO 10052
10051     CONTINUE
10050   GOTO 10048
10053     IF((INQUO0.NE.160))GOTO 10054
            INQUO0=162
            GOTO 10048
10054       IF((INQUO0.NE.162))GOTO 10056
              INQUO0=160
10056     CONTINUE
10055   GOTO 10048
10057     IF((INQUO0.NE.160))GOTO 10058
            INQUO0=167
            GOTO 10048
10058       IF((INQUO0.NE.167))GOTO 10060
              INQUO0=160
10060     CONTINUE
10059   GOTO 10048
10061     CALL SYNERR('Missing right paren or EOF in define text.')
          GOTO 10052
10062     CALL DELET0(TEXT,ID)
          IF((TABLE.EQ.0))GOTO 10048
          IF((LOOKUP(ID,INFO,TABLE).NE.1))GOTO 10048
            TEXT(1)=1024
            TEXT(2)=INFO(2)
            TEXT(3)=0
10063   GOTO 10048
10045   IF(AAAAA0.EQ.-1)GOTO 10061
        AAAAB0=AAAAA0-161
        GOTO(10053,10064,10064,10064,10064,10057,10046,10049),AAAAB0
        IF(AAAAA0.EQ.1024)GOTO 10062
10064   CONTINUE
10048   L=LENGTH(TEXT)
        IF((BUFLEN+L.LT.400))GOTO 10065
          CALL SYNERR('definition too long.')
          GOTO 10052
10065   CALL SCOPY(TEXT,1,DEFN,BUFLEN)
        BUFLEN=BUFLEN+(L)
      GOTO 10044
10052 IF((TABLE.EQ.0))GOTO 10066
        CALL RMTABL(TABLE)
10066 GETDE0=SDUPL(DEFN)
      RETURN
      END
      SUBROUTINE GETAC0(TABLE,NP)
      INTEGER TABLE(32)
      INTEGER NP
      INTEGER T
      INTEGER DGETS0,COLLE0
      INTEGER BUF(400),TEXT(200)
      INTEGER SDUPL
10067   T=DGETS0(TEXT)
      IF((T.EQ.160))GOTO 10067
      IF((T.EQ.168))GOTO 10068
        NP=0
        CALL PUTBC0(TEXT)
        RETURN
10068 NP=1
      GOTO 10071
10069 NP=NP+(1)
10071 IF((NP.GT.32))GOTO 10070
        T=COLLE0(BUF)
        TABLE(NP)=SDUPL(BUF)
        IF((T.NE.-1))GOTO 10069
          RETURN
10070 CALL SYNERR('Too many actual parameters specified.')
      NP=32
      RETURN
      END
      INTEGER FUNCTION COLLE0(BUF)
      INTEGER BUF(400)
      INTEGER I,NLPAR
      INTEGER C,INQUO0
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER AAAAC0
      INTEGER AAAAD0
      I=1
      INQUO0=160
      NLPAR=0
10073   IF((INBUF0(IBPAA0).EQ.0))GOTO 10074
          C=INBUF0(IBPAA0)
          IBPAA0=IBPAA0+(1)
          GOTO 10075
10074     CALL REFIL0(C)
10075   AAAAC0=C
        GOTO 10076
10077     IF((INQUO0.NE.160))GOTO 10079
            NLPAR=NLPAR+(1)
10078   GOTO 10079
10080     IF((INQUO0.NE.160))GOTO 10079
            NLPAR=NLPAR-(1)
            IF((NLPAR.GE.0))GOTO 10082
              GOTO 10083
10082     CONTINUE
10081   GOTO 10079
10084     IF((INQUO0.NE.160))GOTO 10085
            INQUO0=162
            GOTO 10079
10085       IF((INQUO0.NE.162))GOTO 10087
              INQUO0=160
10087     CONTINUE
10086   GOTO 10079
10088     IF((INQUO0.NE.160))GOTO 10089
            INQUO0=167
            GOTO 10079
10089       IF((INQUO0.NE.167))GOTO 10091
              INQUO0=160
10091     CONTINUE
10090   GOTO 10079
10092     IF((INQUO0.NE.160))GOTO 10079
          IF((NLPAR.GT.0))GOTO 10079
            GOTO 10083
10094     CALL SYNERR('unbalanced paren or EOF in define actual paramete
     *r list.')
          GOTO 10083
10076   IF(AAAAC0.EQ.-1)GOTO 10094
        AAAAD0=AAAAC0-161
        GOTO(10084,10095,10095,10095,10095,10088,10077,10080,10095,10095
     *,10092),AAAAD0
10095   CONTINUE
10079   BUF(I)=C
        I=I+(1)
        IF((I.LT.400))GOTO 10096
          CALL SYNERR('define actual parameter too long.')
          GOTO 10083
10096 CONTINUE
      GOTO 10073
10083 BUF(I)=0
      IF((C.NE.172))GOTO 10097
        COLLE0=-2
        RETURN
10097 COLLE0=-1
      RETURN
      END
      SUBROUTINE DELET0(IN,OUT)
      INTEGER IN(1),OUT(1)
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER I,J
      INTEGER MAPDN
      J=1
      I=1
      GOTO 10100
10098 I=I+(1)
10100 IF((IN(I).EQ.0))GOTO 10099
        IF((IN(I).EQ.223))GOTO 10098
          IF((A$BUF(237-225+1).EQ.0))GOTO 10102
            OUT(J)=MAPDN(IN(I))
            GOTO 10103
10102       OUT(J)=IN(I)
10103     J=J+(1)
10101 GOTO 10098
10099 OUT(J)=0
      RETURN
      END
C ---- Long Name Map ----
C boolterm                       boolt0
C callstmt                       calls0
C casestmt                       cases0
C returnstmt                     retus0
C Xgofrom                        xgofr0
C booloperand                    boolo0
C collectbalancedstring          collf0
C dataother                      datao0
C deleteunderscores              delet0
C enterdefinition                enter0
C codeother                      codeo0
C endmodule                      endmo0
C enterlongname                  entet0
C forstmt                        forst0
C Fortfile                       fortf0
C Tlitchar                       tlitc0
C Tliteos                        tlite0
C Indent                         inden0
C Slt                            sltaa0
C otherstmt                      other0
C cleanup                        clean0
C convertstringconstant          conve0
C putbackstr                     putbc0
C simpleboolexpr                 simpl0
C Breaklab                       breal0
C boolexpr                       boole0
C generateexprcode               gener0
C putback                        putba0
C Xgoto                          xgoto0
C Lgostmt                        lgost0
C copylefthandside               copyl0
C genchardata                    gench0
C maketreenode                   maket0
C obufcom                        obufc0
C genprocentry                   genpt0
C invokemacro                    invok0
C linkagedecl                    linka0
C setupprochead                  setuq0
C Dispatchflag                   dispa0
C Spnum                          spnum0
C Codelinenum                    codel0
C genintdecl                     genin0
C selectstmt                     selec0
C checklastforboolean            check0
C loadtranstable                 loadt0
C repeatstmt                     repea0
C Proctable                      proct0
C Lastdispatchflag               lastd0
C begindecl                      begin0
C refillbuffer                   refil0
C exprstackpop                   exprs0
C strtabledecl                   strta0
C equivother                     equiv0
C stopmodule                     stopm0
C strdecl                        strde0
C returnmodule                   retur0
C genproccontroldecl             genps0
C beginstmt                      begip0
C breakstmt                      break0
C genparam                       genpa0
C savemodulename                 savem0
C genprocgoto                    genpu0
C genselectcode                  gense0
C includedecl                    inclu0
C listlongnames                  listl0
C localdecl                      local0
C Lgoline                        lgoli0
C Lgopos                         lgopo0
C Outbuf                         outbu0
C Firststmt                      first0
C Symbol                         symbo0
C Inbuf                          inbuf0
C Ibp                            ibpaa0
C compoundstmt                   compo0
C genexpr                        genex0
C loopcom                        loopc0
C ratforcode                     ratfo0
C replacetreenode                repla0
C Unametable                     uname0
C Nextlab                        nextl0
C enddecl                        endde0
C fatalerr                       fatal0
C Symlen                         symle0
C Prochead                       proch0
C boolfactor                     boolf0
C exitscope                      exits0
C gendataitem                    gendb0
C parboolexpr                    parbo0
C propagatenots                  propa0
C removedefinition               remov0
C statement                      state0
C Symlongtext                    symlo0
C Level                          level0
C Mem                            memaa0
C dgetsym                        dgets0
C gettranschar                   gettr0
C Falsebranch                    false0
C Scopetable                     scopf0
C Profdictfile                   profd0
C boolprimary                    boolp0
C Symtext                        symte0
C Scvalue                        scval0
C declaration                    decla0
C endprogram                     endpr0
C enteroperator                  enteu0
C gotostmt                       gotos0
C process                        procg0
C Loopsp                         loops0
C codegen                        codeg0
C enterkw                        entes0
C setuplocalid                   setup0
C Modulelongname                 modum0
C enterprocparam                 entev0
C proceduredecl                  proce0
C Result                         resul0
C Bracecount                     brace0
C initialize                     initi0
C restoresym                     resto0
C skipwhitespace                 skipw0
C Exprstackptr                   exprv0
C Lgolp                          lgolp0
C Modulename                     modul0
C genproccall                    genpr0
C genprocreturn                  genpv0
C getactualparameters            getac0
C Outp                           outpa0
C Outfile                        outfi0
C beginmodule                    begio0
C Infile                         infil0
C makeunique                     makeu0
C nextstmt                       nexts0
C inquote                        inquo0
C collectactualparameter         colle0
C gendataend                     genda0
C negatechildren                 negat0
C outgolab                       outgo0
C procedurestmt                  procf0
C Curlab                         curla0
C genselgoto                     gensf0
C Exprstack                      expru0
C copytreenode                   copyt0
C enterscope                     entew0
C savesym                        saves0
C whilestmt                      while0
C Lastvar                        lastv0
C Scopesp                        scope0
C createprocscope                creat0
C escapestmt                     escap0
C getdefinition                  getde0
C exprstackpush                  exprt0
C getformalparameters            getfo0
C getlongname                    getlo0
C putbacknum                     putbb0
C setupwhen                      setur0
C cleanupgotos                   cleao0
C Idtable                        idtab0
C declother                      declo0
C stopstmt                       stops0
C Linenumber                     linen0
C Sclabel                        sclab0
C Errorsym                       error0
C Lastnumout                     lastn0
