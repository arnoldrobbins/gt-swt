      SUBROUTINE SETUR0(TEXT,TYPE,TEMPV0)
      INTEGER TEXT
      INTEGER TYPE
      INTEGER TEMPV0(1)
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
      INTEGER LENGTH
      INTEGER Q,R
      INTEGER EXPRS0,DSGET,MAKET0
      INTEGER * 4 N
      INTEGER * 4 GCTOL
      IF((MEMAA0(TEXT+0).NE.1024))GOTO 10000
        Q=MEMAA0(TEXT+3)
        IF((Q.EQ.0))GOTO 10001
          R=MEMAA0(Q+0)
          GOTO 10002
10003       I=1
            N=GCTOL(MEMAA0(Q+2),I,10)
          GOTO 10004
10005       I=1
            N=GCTOL(MEMAA0(R+2),I,8)
            IF((N.LE.32767))GOTO 10006
            IF((N.GE.65536))GOTO 10006
              N=N-(65536)
10006       CALL DSFREE(R)
          GOTO 10004
10007       I=1
            N=-GCTOL(MEMAA0(R+2),I,10)
            CALL DSFREE(R)
          GOTO 10004
10004       CALL DSFREE(Q)
            CALL DSFREE(TEXT)
            TEXT=N
            IF((N.EQ.TEXT))GOTO 10008
              CALL SYNERR('Select alternative must be a short integer.')
10008       TYPE=1032
            RETURN
10002     IF((MEMAA0(Q+1).NE.1032))GOTO 10009
          IF((R.NE.0))GOTO 10009
          GOTO 10003
10009     IF((MEMAA0(Q+1).NE.186))GOTO 10010
          IF((MEMAA0(R+1).NE.1032))GOTO 10010
          IF((MEMAA0(R+0).NE.0))GOTO 10010
          GOTO 10005
10010     IF((MEMAA0(Q+1).NE.173))GOTO 10011
          IF((MEMAA0(R+1).NE.1032))GOTO 10011
          IF((MEMAA0(R+0).NE.0))GOTO 10011
          GOTO 10007
10011     CONTINUE
10001 CONTINUE
10000 TYPE=1024
      Q=DSGET(3+LENGTH(TEMPV0))
      MEMAA0(Q+0)=0
      MEMAA0(Q+1)=1024
      CALL SCOPY(TEMPV0,1,MEMAA0,Q+2)
      CALL EXPRT0(TEXT)
      CALL EXPRT0(MAKET0(0,0,1024,Q))
      CALL ENTEU0(1001)
      TEXT=EXPRS0(TEXT)
      RETURN
      END
      SUBROUTINE GENSE0(SC,SLAB,STEXT,STYPE,TEMPV0)
      INTEGER SC,SLAB(1),STYPE(1)
      INTEGER STEXT(1)
      INTEGER TEMPV0(1)
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
      INTEGER I,J,K,JG,GAP,SLB,GOODA0,ELSEL0
      INTEGER STR(10)
      INTEGER * 4 LN
      INTEGER AAAAA0
      ELSEL0=0
      SLTAA0=0
      I=1
      GOTO 10014
10012 I=I+(1)
10014 IF((I.GT.SC))GOTO 10013
        AAAAA0=STYPE(I)
        GOTO 10015
10016     CALL GENIF(STEXT(I),SLAB(I))
        GOTO 10012
10018     SLTAA0=SLTAA0+(1)
          SCLAB0(SLTAA0)=SLAB(I)
          SCVAL0(SLTAA0)=STEXT(I)
        GOTO 10012
10015   IF(AAAAA0.EQ.1024)GOTO 10016
        IF(AAAAA0.EQ.1032)GOTO 10018
          CALL FATAL0('in gen_select_code: can''t happen.')
10017 GOTO 10012
10013 IF((SLTAA0.GE.2))GOTO 10019
        CALL GENSF0(1,SLTAA0,TEMPV0,ELSEL0)
        CALL OUTNUM(ELSEL0,3)
        RETURN
10019 GAP=SLTAA0/2
      GOTO 10022
10020 GAP=GAP/(2)
10022 IF((GAP.LE.0))GOTO 10021
        I=GAP+1
        GOTO 10025
10023   I=I+(1)
10025   IF((I.GT.SLTAA0))GOTO 10020
          J=I-GAP
          GOTO 10028
10026     J=J-(GAP)
10028     IF((J.LE.0))GOTO 10023
            JG=J+GAP
            IF((SCVAL0(J).GT.SCVAL0(JG)))GOTO 10029
              GOTO 10023
10029       K=SCVAL0(J)
            SCVAL0(J)=SCVAL0(JG)
            SCVAL0(JG)=K
            K=SCLAB0(J)
            SCLAB0(J)=SCLAB0(JG)
            SCLAB0(JG)=K
          GOTO 10026
10021 I=1
      GOTO 10032
10030 I=I+(1)
10032 IF((I.GE.SLTAA0))GOTO 10031
        IF((SCVAL0(I).NE.SCVAL0(I+1)))GOTO 10030
          CALL ITOC(SCVAL0(I),STR,10)
          CALL CTOC(STR,ERROR0,200)
          CALL SYNERR('Identical constants in ''select'' alternatives.')
10033 GOTO 10030
10031 RESUL0(1)=0
      SLB=1
      GOTO 10036
10034 SLB=I+1
10036 IF((SLB.GT.SLTAA0))GOTO 10035
        GOODA0=1
        I=SLB
        GOTO 10039
10037   I=I+(1)
10039   IF((I.GE.SLTAA0))GOTO 10038
          LN=INTL(SCVAL0(I+1))-INTL(SCVAL0(SLB))
          IF((LN.GT.GOODA0*7))GOTO 10038
          IF((LN.GT.500))GOTO 10038
          GOTO 10040
10040     GOODA0=GOODA0+(1)
        GOTO 10037
10038   CALL GENSF0(SLB,I,TEMPV0,ELSEL0)
      GOTO 10034
10035 CALL OUTNUM(ELSEL0,3)
      RETURN
      END
      SUBROUTINE GENSF0(LO,HI,TEMPV0,OUTLAB)
      INTEGER LO,HI,OUTLAB
      INTEGER TEMPV0(1)
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
      INTEGER J
      INTEGER LABGEN
      INTEGER VAR(10)
      INTEGER AAAAB0(4)
      INTEGER AAAAC0(5)
      INTEGER AAAAD0(7)
      INTEGER AAAAE0(4)
      INTEGER AAAAF0(11)
      INTEGER AAAAG0(5)
      INTEGER AAAAH0(6)
      DATA AAAAB0/201,198,168,0/
      DATA AAAAC0/174,197,209,174,0/
      DATA AAAAD0/169,199,207,212,207,160,0/
      DATA AAAAE0/201,198,168,0/
      DATA AAAAF0/174,199,212,174,176,174,193,206,196,174,0/
      DATA AAAAG0/174,204,197,174,0/
      DATA AAAAH0/199,207,212,207,168,0/
      GOTO 10042
10045   CALL OUTTAB(3)
        CALL OUTSTR(AAAAB0,3)
        CALL OUTSTR(TEMPV0,3)
        CALL OUTSTR(AAAAC0,3)
        CALL OUTNUM(SCVAL0(LO),3)
        CALL OUTSTR(AAAAD0,3)
        CALL OUTGO0(SCLAB0(LO))
        CALL OUTDON(3)
      GOTO 10044
10042 IF((HI-LO.LT.0))GOTO 10044
      IF((HI-LO.LT.1))GOTO 10045
        IF((SCVAL0(LO).NE.1))GOTO 10046
          CALL SCOPY(TEMPV0,1,VAR,1)
          GOTO 10047
10046     IF((RESUL0(1).NE.0))GOTO 10048
            CALL VARGEN(RESUL0)
            CALL GENIN0(RESUL0,0)
10048     CALL OUTTAB(3)
          CALL OUTSTR(RESUL0,3)
          CALL OUTCH(189,3)
          CALL OUTSTR(TEMPV0,3)
          IF((SCVAL0(LO).GE.1))GOTO 10049
            CALL OUTCH(171,3)
            CALL OUTNUM(1-SCVAL0(LO),3)
            GOTO 10050
10049       CALL OUTCH(173,3)
            CALL OUTNUM(SCVAL0(LO)-1,3)
10050     CALL OUTDON(3)
          CALL SCOPY(RESUL0,1,VAR,1)
10047   CALL OUTTAB(3)
        IF((A$BUF(246-225+1).EQ.0))GOTO 10051
          CALL OUTSTR(AAAAE0,3)
          CALL OUTSTR(VAR,3)
          CALL OUTSTR(AAAAF0,3)
          CALL OUTSTR(VAR,3)
          CALL OUTSTR(AAAAG0,3)
          CALL OUTNUM(SCVAL0(HI)-SCVAL0(LO)+1,3)
          CALL OUTCH(169,3)
10051   CALL OUTSTR(AAAAH0,3)
        CALL OUTGO0(SCLAB0(LO))
        LO=LO+(1)
        J=SCVAL0(LO-1)+1
        GOTO 10054
10052   J=J+(1)
10054   IF((J.GT.SCVAL0(HI)))GOTO 10053
          CALL OUTCH(172,3)
          IF((J.LT.SCVAL0(LO)))GOTO 10055
            CALL OUTGO0(SCLAB0(LO))
            LO=LO+(1)
            GOTO 10052
10055       IF((OUTLAB.NE.0))GOTO 10057
              OUTLAB=LABGEN(1)
10057       CALL OUTGO0(OUTLAB)
10056   GOTO 10052
10053   CALL OUTCH(169,3)
        CALL OUTCH(172,3)
        CALL OUTSTR(VAR,3)
        CALL OUTDON(3)
10044 RETURN
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
C tempvar                        tempv0
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
C elselab                        elsel0
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
C goodalts                       gooda0
C genselgoto                     gensf0
C Exprstack                      expru0
C copytreenode                   copyt0
C enterscope                     entew0
C savesym                        saves0
C whilestmt                      while0
C Lastvar                        lastv0
C Scopesp                        scope0
C createprocscopecreat0
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
