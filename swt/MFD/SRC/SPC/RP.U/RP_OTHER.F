      SUBROUTINE OTHER0(STATE)
      INTEGER STATE
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
      INTEGER LHS(100)
      INTEGER LHSLEN,STRIN0
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0
      INTEGER AAAAE0(5)
      INTEGER AAAAF0(4)
      INTEGER AAAAG0(5)
      INTEGER AAAAH0(5)
      INTEGER AAAAI0
      INTEGER AAAAJ0
      DATA AAAAE0/193,206,196,168,0/
      DATA AAAAF0/207,210,168,0/
      DATA AAAAG0/216,207,210,168,0/
      DATA AAAAH0/205,207,196,168,0/
      IF((SYMBO0.EQ.187))GOTO 10001
      IF((SYMBO0.EQ.253))GOTO 10001
      IF((SYMBO0.EQ.-1))GOTO 10001
      GOTO 10000
10001   STATE=1
        RETURN
10000 IF((SYMBO0.EQ.138))GOTO 10002
        CALL BEGIP0
10002 CALL COPYL0(LHS,LHSLEN,STRIN0)
      AAAAA0=SYMBO0
      GOTO 10003
10004   CALL OUTCH(189,3)
        CALL OUTSTR(LHS,3)
        AAAAB0=SYMBO0
        GOTO 10005
10006     CALL OUTCH(171,3)
        GOTO 10007
10008     CALL OUTCH(173,3)
        GOTO 10007
10009     CALL OUTCH(170,3)
        GOTO 10007
10010     CALL OUTCH(175,3)
        GOTO 10007
10005   AAAAC0=AAAAB0-1049
        GOTO(10006,10008,10009,10010),AAAAC0
10007   CALL OUTCH(168,3)
      GOTO 10011
10012   CALL OUTCH(189,3)
        AAAAD0=SYMBO0
        GOTO 10013
10014     CALL OUTSTR(AAAAE0,3)
        GOTO 10015
10016     CALL OUTSTR(AAAAF0,3)
        GOTO 10015
10017     CALL OUTSTR(AAAAG0,3)
        GOTO 10015
10018     CALL OUTSTR(AAAAH0,3)
        GOTO 10015
10013   AAAAI0=AAAAD0-1053
        GOTO(10018,10017,10014,10016),AAAAI0
10015   CALL OUTSTR(LHS,3)
        CALL OUTCH(172,3)
      GOTO 10011
10011   CALL GETSYM
        CALL OTHER(STATE,3)
        CALL OUTCH(169,3)
        IF((STATE.NE.1))GOTO 10019
          CALL SYNERR('Missing right-hand side of assignment.')
10019   IF((LHSLEN.LT.100))GOTO 10020
          CALL SYNERR('left-hand side of assignment too long.')
10020   IF((STRIN0.NE.1))GOTO 10022
          CALL SYNERR('String illegal on left-hand side of assignment.')
10021 GOTO 10022
10003 AAAAJ0=AAAAA0-1049
      GOTO(10004,10004,10004,10004,10012,10012,10012,10012),AAAAJ0
10022 CALL OUTDON(3)
      STATE=3
      RETURN
      END
      SUBROUTINE DECLO0(STATE)
      INTEGER STATE
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
      IF((SYMBO0.EQ.187))GOTO 10024
      IF((SYMBO0.EQ.253))GOTO 10024
      IF((SYMBO0.EQ.-1))GOTO 10024
      GOTO 10023
10024   STATE=1
        RETURN
10023 CALL OTHER(STATE,1)
      CALL OUTDON(1)
      RETURN
      END
      SUBROUTINE EQUIV0(STATE)
      INTEGER STATE
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
      IF((SYMBO0.EQ.187))GOTO 10026
      IF((SYMBO0.EQ.253))GOTO 10026
      IF((SYMBO0.EQ.-1))GOTO 10026
      GOTO 10025
10026   STATE=1
        RETURN
10025 CALL OTHER(STATE,4)
      CALL OUTDON(4)
      RETURN
      END
      SUBROUTINE DATAO0(STATE)
      INTEGER STATE
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
      IF((SYMBO0.EQ.187))GOTO 10028
      IF((SYMBO0.EQ.253))GOTO 10028
      IF((SYMBO0.EQ.-1))GOTO 10028
      GOTO 10027
10028   STATE=1
        RETURN
10027 CALL OTHER(STATE,2)
      CALL OUTDON(2)
      RETURN
      END
      SUBROUTINE CODEO0(STATE)
      INTEGER STATE
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
      IF((SYMBO0.EQ.187))GOTO 10030
      IF((SYMBO0.EQ.253))GOTO 10030
      IF((SYMBO0.EQ.-1))GOTO 10030
      GOTO 10029
10030   STATE=1
        RETURN
10029 CALL OTHER(STATE,3)
      CALL OUTDON(3)
      RETURN
      END
      SUBROUTINE OTHER(STATE,STREAM)
      INTEGER STATE
      INTEGER STREAM
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
      INTEGER NLPAR
      INTEGER AAAAK0
      INTEGER AAAAL0
      NLPAR=0
10031   AAAAK0=SYMBO0
        GOTO 10032
10035     CALL SYNERR('unexpected EOF.')
          GOTO 10034
10036     NLPAR=NLPAR+(1)
        GOTO 10037
10038     NLPAR=NLPAR-(1)
          IF((NLPAR.GE.0))GOTO 10037
            GOTO 10034
10032   IF(AAAAK0.EQ.-1)GOTO 10035
        IF(AAAAK0.EQ.138)GOTO 10034
        AAAAL0=AAAAK0-167
        GOTO(10036,10038),AAAAL0
        IF(AAAAK0.EQ.187)GOTO 10034
        IF(AAAAK0.EQ.253)GOTO 10034
10037   CALL OUTTAB(STREAM)
        IF((SYMBO0.NE.1041))GOTO 10040
          CALL OUTLIT(SYMTE0,SYMLE0,STREAM)
          GOTO 10041
10040     CALL OUTSTR(SYMTE0,STREAM)
10041   CALL GETSYM
      IF((NLPAR.GE.0))GOTO 10031
10034 IF((NLPAR.LE.0))GOTO 10042
        CALL SYNERR('missing right parenthesis.')
10042 STATE=3
      RETURN
      END
      SUBROUTINE COPYL0(LHS,LHSLEN,STRIN0)
      INTEGER LHS(1)
      INTEGER LHSLEN,STRIN0
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
      INTEGER NLPAR
      INTEGER SCOPY
      INTEGER AAAAM0
      INTEGER AAAAN0
      NLPAR=0
      LHSLEN=0
      STRIN0=0
10043   AAAAM0=SYMBO0
        GOTO 10044
10047     CALL SYNERR('unexpected EOF.')
          GOTO 10046
10048     NLPAR=NLPAR+(1)
        GOTO 10049
10050     NLPAR=NLPAR-(1)
          IF((NLPAR.GE.0))GOTO 10049
            GOTO 10046
10044   IF(AAAAM0.EQ.-1)GOTO 10047
        IF(AAAAM0.EQ.138)GOTO 10046
        AAAAN0=AAAAM0-167
        GOTO(10048,10050),AAAAN0
        IF(AAAAM0.EQ.187)GOTO 10046
        IF(AAAAM0.EQ.253)GOTO 10046
        AAAAN0=AAAAM0-1049
        GOTO(10046,10046,10046,10046,10046,10046,10046,10046),AAAAN0
10049   CALL OUTTAB(3)
        IF((SYMBO0.NE.1041))GOTO 10052
          CALL OUTLIT(SYMTE0,SYMLE0,3)
          STRIN0=1
          GOTO 10053
10052     CALL OUTSTR(SYMTE0,3)
10053   IF((SYMLE0.GE.100-LHSLEN))GOTO 10054
          LHSLEN=LHSLEN+(SCOPY(SYMTE0,1,LHS,LHSLEN+1))
          GOTO 10055
10054     LHSLEN=100
10055   CALL GETSYM
      IF((NLPAR.GE.0))GOTO 10043
10046 IF((LHSLEN.GE.100))GOTO 10056
        LHS(LHSLEN+1)=0
        GOTO 10057
10056   LHS(1)=0
10057 IF((NLPAR.LE.0))GOTO 10058
        CALL SYNERR('unbalanced parentheses.')
10058 RETURN
      END
      SUBROUTINE ESCAP0(STATE)
      INTEGER STATE
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
      INTEGER STREAM,I
      INTEGER DGETS0
      INTEGER TEXT(128)
      INTEGER AAAAO0
      INTEGER AAAAP0
      AAAAO0=DGETS0(TEXT)
      GOTO 10059
10060   STREAM=1
      GOTO 10061
10062   STREAM=2
      GOTO 10061
10063   STREAM=3
      GOTO 10061
10061   CALL DGETS0(TEXT)
      GOTO 10064
10059 AAAAP0=AAAAO0-176
      GOTO(10060,10062,10063),AAAAP0
        STREAM=3
10064 IF((STREAM.NE.3))GOTO 10065
        CALL BEGIP0
        GOTO 10066
10065   CALL BEGIN0
10066 CALL OUTNUM(0,STREAM)
      IF((TEXT(1).NE.165))GOTO 10067
10068   IF((DGETS0(TEXT).EQ.138))GOTO 10073
          I=1
          GOTO 10072
10070     I=I+(1)
10072     IF((TEXT(I).EQ.0))GOTO 10068
            CALL OUTCH(TEXT(I),STREAM)
          GOTO 10070
10067   CALL OUTTAB(STREAM)
        IF((TEXT(1).NE.166))GOTO 10074
          OUTBU0(6,STREAM)=164
          CALL DGETS0(TEXT)
10074   OUTPA0(STREAM)=6
10075   IF((TEXT(1).NE.160))GOTO 10076
          CALL DGETS0(TEXT)
        GOTO 10075
10076   CONTINUE
10077   IF((TEXT(1).EQ.138))GOTO 10078
          CALL OUTSTR(TEXT,STREAM)
          CALL DGETS0(TEXT)
        GOTO 10077
10078 CONTINUE
10073 CALL OUTDON(STREAM)
      STATE=3
      CALL GETSYM
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
C stringseen                     strin0
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
