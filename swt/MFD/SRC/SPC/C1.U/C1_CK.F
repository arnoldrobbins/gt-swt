      SUBROUTINE CKFND0(P)
      INTEGER P
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      IF((A$BUF(249-225+1).EQ.0))GOTO 10001
      IF((MEMAA0(P).NE.1))GOTO 10001
      GOTO 10000
10001   RETURN
10000 CALL CKPUU0(P,228)
      RETURN
      END
      SUBROUTINE CKFNC0(P)
      INTEGER P
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      IF((A$BUF(249-225+1).EQ.0))GOTO 10003
      IF((MEMAA0(P).NE.1))GOTO 10003
      GOTO 10002
10003   RETURN
10002 CALL CKPUU0(P,233)
      RETURN
      END
      SUBROUTINE CKPUU0(P,C)
      INTEGER P
      INTEGER C
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER I
      INTEGER AAAAA0(3)
      INTEGER AAAAB0(8)
      INTEGER AAAAC0(4)
      INTEGER AAAAD0(3)
      DATA AAAAA0/163,160,0/
      DATA AAAAB0/160,170,227,160,170,243,160,0/
      DATA AAAAC0/170,233,175,0/
      DATA AAAAD0/170,233,0/
      CALL PRINT(CKFIL0,AAAAA0)
      I=0
      GOTO 10006
10004 I=I+(1)
10006 IF((MEMAA0(MEMAA0(P+6)+I).EQ.0))GOTO 10005
      IF((I.GE.8))GOTO 10005
        CALL PUTCH(MAPDN(MEMAA0(MEMAA0(P+6)+I)),CKFIL0)
      GOTO 10004
10005 CALL PRINT(CKFIL0,AAAAB0,C,MODUL0)
      I=1
      GOTO 10009
10007 I=I+(1)
10009 IF((I.GE.LEVEL0))GOTO 10008
        CALL PRINT(CKFIL0,AAAAC0,LINEN0(I))
      GOTO 10007
10008 CALL PRINT(CKFIL0,AAAAD0,SYMLI0)
      CALL CKPUT0(MEMAA0(P+1))
      RETURN
      END
      SUBROUTINE CKFNA0(P)
      INTEGER P
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      IF((A$BUF(249-225+1).NE.0))GOTO 10010
        RETURN
10010 CALL CKPUT0(MEMAA0(P+1))
      RETURN
      END
      SUBROUTINE CKPUT0(P)
      INTEGER P
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER Q
      INTEGER AAAAE0(3)
      INTEGER AAAAF0
      INTEGER AAAAG0(4)
      INTEGER AAAAH0
      DATA AAAAE0/170,233,0/
      DATA AAAAG0/186,170,236,0/
      Q=P
      GOTO 10013
10011 Q=MEMAA0(Q)
10013 IF((Q.EQ.0))GOTO 10012
        IF((Q.NE.P))GOTO 10014
          CALL PUTCH(160,CKFIL0)
          GOTO 10015
10014     CALL PUTCH(175,CKFIL0)
10015   CALL PRINT(CKFIL0,AAAAE0,MEMAA0(Q+3))
        AAAAF0=MEMAA0(Q+3)
        GOTO 10016
10017     CALL PRINT(CKFIL0,AAAAG0,MEMAA0(Q+6))
        GOTO 10011
10016   AAAAH0=AAAAF0-10
        GOTO(10017,10019,10017,10019,10019,10017,10017),AAAAH0
10019   CONTINUE
10018 GOTO 10011
10012 RETURN
      END
      SUBROUTINE CKFNE0
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      IF((A$BUF(249-225+1).NE.0))GOTO 10020
        RETURN
10020 CALL PUTCH(138,CKFIL0)
      RETURN
      END
C ---- Long Name Map ----
C dumpsymentry                   dumpt0
C Procmode                       procm0
C declspecifiers                 decls0
C enterdefinition                entes0
C islvalue                       islva0
C outoper                        outop0
C installdefinition              insta0
C Nerrs                          nerrs0
C dumpsym                        dumps0
C entersmdecl                    entex0
C enumspecifier                  enums0
C openinclude                    openi0
C Nsymbol                        nsymb0
C Expsk                          expsk0
C enterchildmode                 enter0
C gencast                        genca0
C Dfoname                        dfona0
C checkarith                     check0
C droplitval                     dropl0
C outgoto                        outgo0
C returnstatement                retur0
C Nsymlen                        nsyml0
C Symptr                         sympt0
C ckfncall                       ckfnc0
C cleanupll                      clean0
C genmakearith                   genma0
C Outfp                          outfp0
C alloctemp                      alloe0
C forstatement                   forst0
C outinitend                     outio0
C outsize                        outsi0
C putbackstr                     putbc0
C Floatmodeptr                   float0
C createmode                     creat0
C displaymode                    displ0
C Expsp                          expsp0
C convoper                       convo0
C outexprtree                    outey0
C putback                        putba0
C structdeclaratorlist           strue0
C Nsymtext                       nsymt0
C Modelist                       model0
C Fnametable                     fname0
C genopnd                        genoq0
C isconstant                     iscon0
C isstored                       issto0
C Dirname                        dirna0
C invokemacro                    invok0
C makemode                       makem0
C notstatementstart              notsu0
C outexpr                        outex0
C structdecllist                 struf0
C Ll                             llaaa0
C Modesavelen                    modeu0
C functionheader                 funct0
C outdeclarations                outde0
C Charunsmodeptr                 charu0
C Modesavetype                   modes0
C structdeclaration              struc0
C Dfotop                         dfoto0
C ckputname                      ckpuu0
C findmode                       findm0
C refillbuffer                   refil0
C Keywdtbl                       keywd0
C declarations                   decla0
C entersiblingmode               entew0
C genoper                        genop0
C getlong                        getlo0
C typeorscspec                   typeo0
C declarator                     declb0
C ssalloc                        ssall0
C accesssym                      acces0
C declarelabel                   declc0
C ifstatement                    ifsta0
C initializer                    initj0
C isnullconv                     isnul0
C resetline                      reset0
C Charmodeptr                    charm0
C ckputmode                      ckput0
C createsavedmode                creau0
C displaysc                      dispo0
C dumpexpr                       dumpe0
C foldconst                      foldc0
C getlitval                      getli0
C initdeclarator                 initd0
C statementlabel                 statf0
C Idtbl                          idtbl0
C checkdeclaration               checl0
C enumdeclarator                 enumd0
C gentoboolean                   gento0
C isarith                        isari0
C processifdef                   procg0
C Dirtop                         dirto0
C constantexpr                   const0
C expression                     expre0
C outstmt                        outst0
C checkfunctiondeclaration       checm0
C convtype                       convt0
C dostatement                    dosta0
C enterll                        entev0
C Intmodeptr                     intmo0
C Doublemodeptr                  doubl0
C Zinitlen                       zinit0
C makesym                        makes0
C breakstatement                 break0
C expr10                         expr10
C externaldefinition             exter0
C structorunionspecifier         struh0
C Symbol                         symbo0
C Nsymline                       nsymm0
C Inbuf                          inbuf0
C Ibp                            ibpaa0
C collectquotedstring            collf0
C notstatementend                notst0
C outname                        outna0
C arrayinit                      array0
C displayoper                    dispn0
C fatalerr                       fatal0
C findsym                        finds0
C scalarinit                     scala0
C Symlen                         symle0
C Pointermodeptr                 point0
C genindex                       genin0
C Ckfile                         ckfil0
C ckfndef                        ckfnd0
C displayop                      dispm0
C enteriddecl                    entet0
C isaggregate                    isagg0
C removedefinition               remov0
C statement                      state0
C Level                          level0
C Mem                            memaa0
C Objno                          objno0
C arithexcep                     arith0
C compoundstatement              compo0
C continuestatement              conti0
C dgetsym                        dgets0
C initdeclaratorlist             inite0
C outmode                        outmo0
C processdebug                   procf0
C savemode                       savem0
C Nsymptr                        nsymp0
C Labelmodeptr                   label0
C Shortunsmodeptr                shoru0
C allocstruct                    allod0
C structinit                     strug0
C Symtext                        symte0
C cpreprocessor                  cprep0
C process                        proce0
C recordsym                      recor0
C Unsignedmodeptr                unsig0
C Longunsmodeptr                 longu0
C enterkw                        enteu0
C outproccallarg                 outps0
C allocatestorage                alloc0
C displaysymbol                  dispp0
C alignmode                      align0
C initialize                     initi0
C nextistype                     nexti0
C skipwhitespace                 skipw0
C Shortmodeptr                   short0
C Modulename                     modul0
C getactualparameters            getac0
C gotostatement                  gotos0
C switchstatement                switc0
C Outfile                        outfi0
C ckfnend                        ckfne0
C convconst                      convc0
C dumpmode                       dumpm0
C ispointer                      ispoi0
C primary                        prima0
C Infile                         infil0
C Longmodeptr                    longm0
C comparemode                    compa0
C modifyparammode                modif0
C sizeofmode                     sizeo0
C Ctlsk                          ctlsk0
C collectactualparameter         colle0
C outinitstart                   outip0
C Pptbl                          pptbl0
C Smtbl                          smtbl0
C Modesavect                     modev0
C ckfnarg                        ckfna0
C Semsk                          semsk0
C Procrtnv                       procr0
C getdefinition                  getde0
C putlong                        putlo0
C getformalparameters            getfo0
C putbacknum                     putbb0
C Ctlsp                          ctlsp0
C Modetable                      modet0
C genconvert                     genco0
C processifndef                  proch0
C structdeclarator               strud0
C abstractdeclarator             abstr0
C deallocexpr                    deall0
C gobbleuntilelseorendif         gobbl0
C outinit                        outin0
C outproc                        outpr0
C putlitval                      putli0
C ssdealloc                      ssdea0
C typename                       typen0
C whilestatement                 while0
C Symline                        symli0
C Linenumber                     linen0
C Semsp                          semsp0
C Errorsym                       error0
