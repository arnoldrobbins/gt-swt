      SUBROUTINE INITI0
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
      INTEGER I
      INTEGER FD
      INTEGER CREATE,OPEN,MKTEMP
      INTEGER MKTABL
      INTEGER AAAAA0(17)
      INTEGER AAAAB0(29)
      INTEGER AAAAC0(7)
      INTEGER AAAAD0(7)
      INTEGER AAAAE0(7)
      INTEGER AAAAF0(12)
      INTEGER AAAAG0(8)
      INTEGER AAAAH0(10)
      INTEGER AAAAI0(10)
      INTEGER AAAAJ0(8)
      INTEGER AAAAK0(6)
      INTEGER AAAAL0(3)
      INTEGER AAAAM0(5)
      INTEGER AAAAN0(4)
      INTEGER AAAAO0(6)
      INTEGER AAAAP0(7)
      INTEGER AAAAQ0(6)
      INTEGER AAAAR0(5)
      INTEGER AAAAS0(3)
      INTEGER AAAAT0(7)
      INTEGER AAAAU0(6)
      INTEGER AAAAV0(5)
      INTEGER AAAAW0(5)
      INTEGER AAAAX0(5)
      INTEGER AAAAY0(5)
      INTEGER AAAAZ0(4)
      INTEGER AAABA0(8)
      INTEGER AAABB0(7)
      INTEGER AAABC0(9)
      INTEGER AAABD0(7)
      INTEGER AAABE0(5)
      INTEGER AAABF0(6)
      INTEGER AAABG0(9)
      INTEGER AAABH0(8)
      INTEGER AAABI0(8)
      INTEGER AAABJ0(9)
      INTEGER AAABK0(10)
      INTEGER AAABL0(9)
      INTEGER AAABM0(10)
      INTEGER AAABN0(8)
      INTEGER AAABO0(12)
      INTEGER AAABP0(9)
      INTEGER AAABQ0(11)
      INTEGER AAABR0(7)
      INTEGER AAABS0(5)
      INTEGER AAABT0(6)
      INTEGER AAABU0(5)
      INTEGER AAABV0(5)
      INTEGER AAABW0(16)
      INTEGER AAABX0(10)
      INTEGER AAABY0(12)
      INTEGER AAABZ0(10)
      INTEGER AAACA0(9)
      DATA AAAAA0/244,233,237,229,242,223,228,233,227,244,233,239,238,22
     *5,242,249,0/
      DATA AAAAB0/170,243,186,160,227,225,238,167,244,160,239,240,229,23
     *8,160,244,242,225,238,243,160,244,225,226,236,229,170,238,0/
      DATA AAAAC0/174,237,225,233,238,174,0/
      DATA AAAAD0/174,237,225,233,238,174,0/
      DATA AAAAE0/243,244,242,233,238,231,0/
      DATA AAAAF0/243,244,242,233,238,231,244,225,226,236,229,0/
      DATA AAAAG0/236,233,238,235,225,231,229,0/
      DATA AAAAH0/240,242,239,227,229,228,245,242,229,0/
      DATA AAAAI0/242,229,227,245,242,243,233,246,229,0/
      DATA AAAAJ0/230,239,242,247,225,242,228,0/
      DATA AAAAK0/236,239,227,225,236,0/
      DATA AAAAL0/233,230,0/
      DATA AAAAM0/229,236,243,229,0/
      DATA AAAAN0/230,239,242,0/
      DATA AAAAO0/247,232,233,236,229,0/
      DATA AAAAP0/242,229,240,229,225,244,0/
      DATA AAAAQ0/245,238,244,233,236,0/
      DATA AAAAR0/227,225,243,229,0/
      DATA AAAAS0/228,239,0/
      DATA AAAAT0/242,229,244,245,242,238,0/
      DATA AAAAU0/226,242,229,225,235,0/
      DATA AAAAV0/238,229,248,244,0/
      DATA AAAAW0/243,244,239,240,0/
      DATA AAAAX0/231,239,244,239,0/
      DATA AAAAY0/227,225,236,236,0/
      DATA AAAAZ0/229,238,228,0/
      DATA AAABA0/233,238,227,236,245,228,229,0/
      DATA AAABB0/228,229,230,233,238,229,0/
      DATA AAABC0/245,238,228,229,230,233,238,229,0/
      DATA AAABD0/243,229,236,229,227,244,0/
      DATA AAABE0/247,232,229,238,0/
      DATA AAABF0/233,230,225,238,249,0/
      DATA AAABG0/227,239,238,244,233,238,245,229,0/
      DATA AAABH0/227,239,237,240,236,229,248,0/
      DATA AAABI0/236,239,231,233,227,225,236,0/
      DATA AAABJ0/233,237,240,236,233,227,233,244,0/
      DATA AAABK0/240,225,242,225,237,229,244,229,242,0/
      DATA AAABL0/229,248,244,229,242,238,225,236,0/
      DATA AAABM0/228,233,237,229,238,243,233,239,238,0/
      DATA AAABN0/233,238,244,229,231,229,242,0/
      DATA AAABO0/229,241,245,233,246,225,236,229,238,227,229,0/
      DATA AAABP0/230,245,238,227,244,233,239,238,0/
      DATA AAABQ0/243,245,226,242,239,245,244,233,238,229,0/
      DATA AAABR0/227,239,237,237,239,238,0/
      DATA AAABS0/228,225,244,225,0/
      DATA AAABT0/244,242,225,227,229,0/
      DATA AAABU0/243,225,246,229,0/
      DATA AAABV0/242,229,225,236,0/
      DATA AAABW0/228,239,245,226,236,229,240,242,229,227,233,243,233,23
     *9,238,0/
      DATA AAABX0/226,236,239,227,235,228,225,244,225,0/
      DATA AAABY0/243,244,225,227,235,232,229,225,228,229,242,0/
      DATA AAABZ0/243,232,239,242,244,227,225,236,236,0/
      DATA AAACA0/243,244,237,244,230,245,238,227,0/
      IF((A$BUF(240-225+1).EQ.0))GOTO 10000
        PROFD0=CREATE(AAAAA0,2)
        IF((PROFD0.NE.-3))GOTO 10001
          CALL REMARK('timer_dictionary:  can''t create*n.')
10001 CONTINUE
10000 TLITE0=0
      I=1
      GOTO 10004
10002 I=I+(1)
10004 IF((I.GT.256))GOTO 10003
        TLITC0(I)=I-1
      GOTO 10002
10003 IF((A$BUF(248-225+1).EQ.0))GOTO 10005
        FD=OPEN(A$BUF(A$BUF(248-225+27)),1)
        IF((FD.NE.-3))GOTO 10006
          CALL PRINT(-15,AAAAB0,A$BUF(A$BUF(248-225+27)))
          GOTO 10007
10006     CALL LOADT0(FD)
          CALL CLOSE(FD)
10007 CONTINUE
10005 FIRST0=0
      SCOPE0=0
      PROCT0=0
      SPNUM0=0
      ERROR0(1)=0
      IBPAA0=400
      INBUF0(400)=0
      DO 10008 I=1,4
        OUTPA0(I)=0
10008 CONTINUE
10009 DO 10010 I=2,4
        OUTFI0(I)=MKTEMP(3)
10010 CONTINUE
10011 LOOPS0=0
      EXPRV0=0
      CURLA0=10000
      BRACE0=0
      DISPA0=0
      LASTD0=0
      IF((A$BUF(231-225+1).EQ.0))GOTO 10012
        DO 10013 I=1,407
          XGOFR0(I)=0
          XGOTO0(I)=0
10013   CONTINUE
10014 CONTINUE
10012 LGOLP0=1
      INDEN0=0
      CALL SCOPY(AAAAC0,1,MODUL0,1)
      CALL SCOPY(AAAAD0,1,MODUM0,1)
      CALL DSINIT(32767)
      IDTAB0=MKTABL(3)
      UNAME0=MKTABL(0)
      LASTV0(1)=0
      CODEL0=1
      CALL ENTES0(AAAAE0,1042)
      CALL ENTES0(AAAAF0,1043)
      CALL ENTES0(AAAAG0,1028)
      CALL ENTES0(AAAAH0,1034)
      CALL ENTES0(AAAAI0,1035)
      CALL ENTES0(AAAAJ0,1021)
      CALL ENTES0(AAAAK0,1029)
      CALL ENTES0(AAAAL0,1026)
      CALL ENTES0(AAAAM0,1016)
      CALL ENTES0(AAAAN0,1019)
      CALL ENTES0(AAAAO0,1049)
      CALL ENTES0(AAAAP0,1036)
      CALL ENTES0(AAAAQ0,1047)
      CALL ENTES0(AAAAR0,1012)
      CALL ENTES0(AAAAS0,1015)
      CALL ENTES0(AAAAT0,1037)
      CALL ENTES0(AAAAU0,1010)
      CALL ENTES0(AAAAV0,1031)
      CALL ENTES0(AAAAW0,1040)
      CALL ENTES0(AAAAX0,1023)
      CALL ENTES0(AAAAY0,1011)
      CALL ENTES0(AAAAZ0,1018)
      CALL ENTES0(AAABA0,1027)
      CALL ENTES0(AAABB0,1014)
      CALL ENTES0(AAABC0,1046)
      CALL ENTES0(AAABD0,1038)
      CALL ENTES0(AAABE0,1048)
      CALL ENTES0(AAABF0,1025)
      CALL ENTES0(AAABG0,1020)
      CALL ENTES0(AAABH0,1045)
      CALL ENTES0(AAABI0,1045)
      CALL ENTES0(AAABJ0,1030)
      CALL ENTES0(AAABK0,1030)
      CALL ENTES0(AAABL0,1030)
      CALL ENTES0(AAABM0,1030)
      CALL ENTES0(AAABN0,1045)
      CALL ENTES0(AAABO0,1017)
      CALL ENTES0(AAABP0,1022)
      CALL ENTES0(AAABQ0,1044)
      CALL ENTES0(AAABR0,1030)
      CALL ENTES0(AAABS0,1013)
      CALL ENTES0(AAABT0,1020)
      CALL ENTES0(AAABU0,1030)
      CALL ENTES0(AAABV0,1045)
      CALL ENTES0(AAABW0,1045)
      CALL ENTES0(AAABX0,1009)
      CALL ENTES0(AAABY0,1030)
      CALL ENTES0(AAABZ0,1030)
      CALL ENTES0(AAACA0,1039)
      RETURN
      END
      SUBROUTINE ENTES0(KW,VAL)
      INTEGER KW(1)
      INTEGER VAL
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
      INTEGER INFO(3)
      INFO(1)=1
      INFO(2)=VAL
      CALL ENTER(KW,INFO,IDTAB0)
      RETURN
      END
      SUBROUTINE CLEAN0
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
      INTEGER I
      DO 10015 I=2,4
        CALL RMTEMP(OUTFI0(I))
10015 CONTINUE
10016 IF((A$BUF(240-225+1).EQ.0))GOTO 10017
        CALL CLOSE(PROFD0)
10017 RETURN
      END
      SUBROUTINE LOADT0(FD)
      INTEGER FD
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
      INTEGER I
      INTEGER GETLIN,EQUAL
      INTEGER C1,C2
      INTEGER STR(128),WORD(128)
      INTEGER GETTR0
      INTEGER AAACB0(4)
      INTEGER AAACC0(4)
      INTEGER AAACD0(26)
      DATA AAACB0/197,207,211,0/
      DATA AAACC0/229,239,243,0/
      DATA AAACD0/226,225,228,160,244,242,225,238,243,160,244,225,226,23
     *6,229,160,229,238,244,242,249,186,160,170,243,0/
10018 IF((GETLIN(STR,FD).EQ.-1))GOTO 10019
        I=1
        CALL GETWRD(STR,I,WORD)
        IF((EQUAL(WORD,AAACB0).EQ.1))GOTO 10021
        IF((EQUAL(WORD,AAACC0).EQ.1))GOTO 10021
        GOTO 10020
10021     CALL GETWRD(STR,I,WORD)
          TLITE0=GETTR0(WORD)
          GOTO 10018
10020     C1=GETTR0(WORD)
          CALL GETWRD(STR,I,WORD)
          C2=GETTR0(WORD)
          IF((C1.LT.0))GOTO 10024
          IF((C1.GE.256))GOTO 10024
          IF((C2.LT.0))GOTO 10024
          IF((C2.GE.256))GOTO 10024
          GOTO 10023
10024       CALL PRINT(-15,AAACD0,STR)
            GOTO 10025
10023       TLITC0(C1+1)=C2
10025   CONTINUE
10022 GOTO 10018
10019 RETURN
      END
      INTEGER FUNCTION GETTR0(WORD)
      INTEGER WORD(1)
      INTEGER I
      INTEGER MNTOC,GCTOI
      INTEGER C
      I=1
      C=MNTOC(WORD,I,256)
      IF((C.NE.256))GOTO 10026
        I=1
        C=GCTOI(WORD,I,10)
        IF((WORD(I).EQ.0))GOTO 10027
          C=256
10027 CONTINUE
10026 GETTR0=C
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
