      SUBROUTINE BEGIN0
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
      IF((FIRST0.NE.0))GOTO 10000
        FIRST0=1
        CALL BEGIO0
10000 RETURN
      END
      SUBROUTINE BEGIP0
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
      INTEGER AAAAA0(13)
      DATA AAAAA0/227,225,236,236,160,227,164,233,238,227,242,168,0/
      IF((FIRST0.NE.0))GOTO 10001
        FIRST0=1
        CALL BEGIO0
10001 IF((A$BUF(227-225+1).EQ.0))GOTO 10002
        CALL OUTTAB(3)
        CALL OUTSTR(AAAAA0,3)
        CALL OUTNUM(LINEN0(1),3)
        CALL OUTCH(169,3)
        CALL OUTDON(3)
10002 RETURN
      END
      SUBROUTINE BEGIO0
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
      INTEGER EQUAL,LENGTH
      INTEGER AAAAB0(7)
      INTEGER AAAAC0(7)
      INTEGER AAAAD0(12)
      INTEGER AAAAE0(13)
      INTEGER AAAAF0(7)
      INTEGER AAAAG0(7)
      INTEGER AAAAH0(17)
      INTEGER AAAAI0(27)
      INTEGER AAAAJ0(15)
      INTEGER AAAAK0(3)
      INTEGER AAAAL0(7)
      INTEGER AAAAM0(12)
      DATA AAAAB0/174,228,225,244,225,174,0/
      DATA AAAAC0/174,237,225,233,238,174,0/
      DATA AAAAD0/227,225,236,236,160,244,164,233,238,233,244,0/
      DATA AAAAE0/227,225,236,236,160,244,164,229,238,244,242,168,0/
      DATA AAAAF0/174,228,225,244,225,174,0/
      DATA AAAAG0/174,237,225,233,238,174,0/
      DATA AAAAH0/227,225,236,236,160,244,164,244,242,225,227,168,179,17
     *2,176,169,0/
      DATA AAAAI0/227,225,236,236,160,244,164,244,242,225,227,168,177,17
     *2,185,232,192,174,237,225,233,238,192,174,174,169,0/
      DATA AAAAJ0/227,225,236,236,160,244,164,244,242,225,227,168,177,17
     *2,0/
      DATA AAAAK0/174,169,0/
      DATA AAAAL0/174,237,225,233,238,174,0/
      DATA AAAAM0/227,225,236,236,160,227,164,233,238,233,244,0/
      SPNUM0=SPNUM0+(1)
      IF((A$BUF(240-225+1).EQ.0))GOTO 10003
      IF((EQUAL(AAAAB0,MODUM0).NE.0))GOTO 10003
        CALL PUTLIN(MODUM0,PROFD0)
        CALL PUTCH(138,PROFD0)
        IF((EQUAL(MODUM0,AAAAC0).NE.1))GOTO 10004
          CALL OUTTAB(3)
          CALL OUTSTR(AAAAD0,3)
          CALL OUTDON(3)
10004   CALL OUTTAB(3)
        CALL OUTSTR(AAAAE0,3)
        CALL OUTNUM(SPNUM0,3)
        CALL OUTCH(169,3)
        CALL OUTDON(3)
10003 IF((A$BUF(244-225+1).EQ.0))GOTO 10005
      IF((EQUAL(AAAAF0,MODUM0).NE.0))GOTO 10005
        IF((EQUAL(MODUM0,AAAAG0).NE.1))GOTO 10006
          CALL OUTTAB(3)
          CALL OUTSTR(AAAAH0,3)
          CALL OUTDON(3)
          CALL OUTTAB(3)
          CALL OUTSTR(AAAAI0,3)
          CALL OUTDON(3)
          GOTO 10007
10006     CALL OUTTAB(3)
          CALL OUTSTR(AAAAJ0,3)
          CALL OUTNUM(LENGTH(MODUM0)+1,3)
          CALL OUTCH(200,3)
          CALL OUTSTR(MODUM0,3)
          CALL OUTSTR(AAAAK0,3)
          CALL OUTDON(3)
10007 CONTINUE
10005 IF((A$BUF(227-225+1).EQ.0))GOTO 10008
        IF((EQUAL(MODUM0,AAAAL0).NE.1))GOTO 10009
          CALL OUTTAB(3)
          CALL OUTSTR(AAAAM0,3)
          CALL OUTDON(3)
10009 CONTINUE
10008 RETURN
      END
      SUBROUTINE ENDMO0
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
      FIRST0=0
      RETURN
      END
      SUBROUTINE STOPM0
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
      INTEGER AAAAN0(12)
      INTEGER AAAAO0(17)
      INTEGER AAAAP0(11)
      DATA AAAAN0/227,225,236,236,160,244,164,227,236,245,240,0/
      DATA AAAAO0/227,225,236,236,160,244,164,244,242,225,227,168,178,17
     *2,176,169,0/
      DATA AAAAP0/227,225,236,236,160,227,164,229,238,228,0/
      IF((A$BUF(240-225+1).EQ.0))GOTO 10010
        CALL OUTTAB(3)
        CALL OUTSTR(AAAAN0,3)
        CALL OUTDON(3)
10010 IF((A$BUF(244-225+1).EQ.0))GOTO 10011
        CALL OUTTAB(3)
        CALL OUTSTR(AAAAO0,3)
        CALL OUTDON(3)
10011 IF((A$BUF(227-225+1).EQ.0))GOTO 10012
        CALL OUTTAB(3)
        CALL OUTSTR(AAAAP0,3)
        CALL OUTDON(3)
10012 RETURN
      END
      SUBROUTINE RETUR0
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
      INTEGER AAAAQ0(12)
      INTEGER AAAAR0(17)
      DATA AAAAQ0/227,225,236,236,160,244,164,229,248,233,244,0/
      DATA AAAAR0/227,225,236,236,160,244,164,244,242,225,227,168,178,17
     *2,176,169,0/
      IF((A$BUF(240-225+1).EQ.0))GOTO 10013
        CALL OUTTAB(3)
        CALL OUTSTR(AAAAQ0,3)
        CALL OUTDON(3)
10013 IF((A$BUF(244-225+1).EQ.0))GOTO 10014
        CALL OUTTAB(3)
        CALL OUTSTR(AAAAR0,3)
        CALL OUTDON(3)
10014 RETURN
      END
      SUBROUTINE ENDPR0
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
      INTEGER LN
      IF((A$BUF(240-225+1).EQ.0))GOTO 10015
        CALL PRINT(FORTF0,'      SUBROUTINE T$INIT*n.')
        CALL PRINT(FORTF0,'      INTEGER**2 SP,NUMRTN*n.')
        CALL PRINT(FORTF0,'      INTEGER**4 RECORD*n.')
        CALL PRINT(FORTF0,'      INTEGER**4 STACK*n.')
        CALL PRINT(FORTF0,'      COMMON /T$PROF/NUMRTN,RECORD(4,*i)*n.',
     *SPNUM0)
        CALL PRINT(FORTF0,'      COMMON /T$STAK/SP,STACK(4,*i)*n.',SPNUM
     *0)
        CALL PRINT(FORTF0,'      NUMRTN=*i*n.',SPNUM0)
        CALL PRINT(FORTF0,'      RETURN*n.')
        CALL PRINT(FORTF0,'      END*n.')
10015 IF((A$BUF(227-225+1).EQ.0))GOTO 10016
        LN=LINEN0(1)
        CALL PRINT(FORTF0,'      SUBROUTINE C$INIT*n.')
        CALL PRINT(FORTF0,'      INTEGER LIMIT*n.')
        CALL PRINT(FORTF0,'      INTEGER**4 COUNT*n.')
        CALL PRINT(FORTF0,'      COMMON /C$STC/ LIMIT,COUNT(*i)*n.',LN)
        CALL PRINT(FORTF0,'      INTEGER I*n.')
        CALL PRINT(FORTF0,'      DO 1 I=1,*i*n.',LN)
        CALL PRINT(FORTF0,'    1   COUNT(I)=0*n.')
        CALL PRINT(FORTF0,'      LIMIT=*i*n.',LN)
        CALL PRINT(FORTF0,'      RETURN*n.')
        CALL PRINT(FORTF0,'      END*n.')
10016 RETURN
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
