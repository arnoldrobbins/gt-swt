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
      INTEGER AP,I,INFD,STATE(4)
      INTEGER OPEN,CREATE,GFNARG,LENGTH,GETARG,CTOC
      INTEGER INF(102),OUTF(102),FNAME(102),ARG(128)
      INTEGER MAPDN
      INTEGER VERSI0(5)
      INTEGER PARSCL
      INTEGER AAAAA0(29)
      INTEGER AAAAB0(5)
      INTEGER AAAAC0(6)
      INTEGER AAAAD0(8)
      DATA VERSI0/214,177,174,177,0/
      DATA AAAAA0/219,173,225,230,231,245,249,221,160,219,173,228,188,23
     *3,231,238,190,221,160,219,173,233,188,233,231,238,190,221,0/
      DATA AAAAB0/170,243,174,227,0/
      DATA AAAAC0/170,243,174,227,235,0/
      DATA AAAAD0/170,243,174,227,244,170,233,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR('Usage: cc [-afguy] { -I<dir> | -D<name>[=<val>] } <i
     *nf>.')
10000 DIRTO0=0
      AP=1
      GOTO 10003
10001 AP=AP+(1)
10003 IF((GETARG(AP,ARG,128).EQ.-1))GOTO 10002
        IF((ARG(1).NE.173))GOTO 10001
        IF((MAPDN(ARG(2)).NE.233))GOTO 10001
          IF((ARG(3).EQ.0))GOTO 10005
            DIRTO0=DIRTO0+(1+CTOC(ARG(3),DIRNA0(DIRTO0+1),300-DIRTO0))
            IF((DIRTO0.LT.300))GOTO 10006
              CALL ERROR('Too many -I directories!.')
10006       CALL DELARG(AP)
            AP=AP-(1)
            GOTO 10007
10005       CALL DELARG(AP)
            IF((GETARG(AP,ARG,128).NE.-1))GOTO 10008
              CALL ERROR('Directory name expected.')
10008       DIRTO0=DIRTO0+(1+CTOC(ARG(1),DIRNA0(DIRTO0+1),300-DIRTO0))
            IF((DIRTO0.LT.300))GOTO 10009
              CALL ERROR('Too many -I directories!.')
10009       CALL DELARG(AP)
            AP=AP-(1)
10007   CONTINUE
10004 GOTO 10001
10002 DFOTO0=0
      AP=1
      GOTO 10012
10010 AP=AP+(1)
10012 IF((GETARG(AP,ARG,128).EQ.-1))GOTO 10011
        IF((ARG(1).NE.173))GOTO 10010
        IF((MAPDN(ARG(2)).NE.228))GOTO 10010
          IF((ARG(3).EQ.0))GOTO 10014
            DFOTO0=DFOTO0+(1+CTOC(ARG(3),DFONA0(DFOTO0+1),300-DFOTO0))
            IF((DFOTO0.LT.300))GOTO 10015
              CALL ERROR('Too many -D arguments!.')
10015       CALL DELARG(AP)
            AP=AP-(1)
            GOTO 10016
10014       CALL DELARG(AP)
            IF((GETARG(AP,ARG,128).NE.-1))GOTO 10017
              CALL ERROR('Identifier expected after -D.')
10017       DFOTO0=DFOTO0+(1+CTOC(ARG(1),DFONA0(DFOTO0+1),300-DFOTO0))
            IF((DFOTO0.LT.300))GOTO 10018
              CALL ERROR('Too many -D arguments!.')
10018       CALL DELARG(AP)
            AP=AP-(1)
10016   CONTINUE
10013 GOTO 10010
10011 STATE(1)=1
10019 IF((GFNARG(FNAME,STATE).EQ.-1))GOTO 10020
        CALL MAPSTR(FNAME,1)
        I=LENGTH(FNAME)-1
        IF((FNAME(I).NE.174))GOTO 10021
        IF((FNAME(I+1).NE.227))GOTO 10021
        IF((FNAME(I+2).NE.0))GOTO 10021
          FNAME(I)=0
10021   IF((FNAME(1).NE.175))GOTO 10022
        IF((FNAME(2).NE.228))GOTO 10022
        IF((FNAME(3).NE.229))GOTO 10022
        IF((FNAME(4).NE.246))GOTO 10022
        IF((FNAME(5).NE.175))GOTO 10022
          CALL CTOC(FNAME,INF,102)
          FNAME(1)=0
          GOTO 10023
10022     CALL ENCODE(INF,102,AAAAB0,FNAME)
10023   INFD=OPEN(INF,1)
        IF((INFD.NE.-3))GOTO 10024
          CALL PRINT(-15,'*s: can''t open*n.',INF)
          GOTO 10019
10024   IF((A$BUF(249-225+1).EQ.0))GOTO 10025
          CALL ENCODE(OUTF,102,AAAAC0,FNAME)
          CKFIL0=CREATE(OUTF,2)
          IF((CKFIL0.NE.-3))GOTO 10026
            CALL CLOSE(INFD)
            CALL PRINT(-15,'*s: can''t open*n.',OUTF)
            GOTO 10019
10026   CONTINUE
10025   OUTFP0=1
        GOTO 10029
10027   OUTFP0=OUTFP0+(1)
10029   IF((OUTFP0.GT.3))GOTO 10028
          CALL ENCODE(OUTF,102,AAAAD0,FNAME,OUTFP0)
          OUTFI0(OUTFP0)=CREATE(OUTF,2)
          IF((OUTFI0(OUTFP0).NE.-3))GOTO 10027
            CALL PRINT(-15,'*s: can''t open*n.',OUTF)
            OUTFP0=OUTFP0-(1)
            GOTO 10033
10031       OUTFP0=OUTFP0-(1)
10033       IF((OUTFP0.LE.0))GOTO 10032
              CALL CLOSE(OUTFI0(OUTFP0))
            GOTO 10031
10032       IF((A$BUF(249-225+1).EQ.0))GOTO 10034
              CALL CLOSE(CKFIL0)
10034       CALL CLOSE(INFD)
            GOTO 10019
10028   CALL INITI0
        CALL CTOC(INF,MODUL0,200)
        CALL PROCE0(INFD)
        IF((A$BUF(225-225+1).EQ.0))GOTO 10035
        IF((NERRS0.LE.0))GOTO 10035
          CALL SETERR(1000)
10035   CALL CLOSE(INFD)
        IF((A$BUF(249-225+1).EQ.0))GOTO 10036
          CALL CLOSE(CKFIL0)
10036   OUTFP0=3
        CALL OUTOP0(39)
        OUTFP0=1
        CALL OUTOP0(39)
        OUTFP0=2
        CALL OUTOP0(39)
        I=1
        GOTO 10039
10037   I=I+(1)
10039   IF((I.GT.3))GOTO 10019
          CALL CLOSE(OUTFI0(OUTFP0))
        GOTO 10037
10020 CALL SWT
      END
      SUBROUTINE PROCE0(FIN)
      INTEGER FIN
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
      INTEGER STATE
      INTEGER AAAAE0(8)
      INTEGER AAAAF0(10)
      DATA AAAAE0/189,227,228,229,230,243,189,0/
      DATA AAAAF0/163,233,238,227,236,245,228,229,160,0/
      IF((A$BUF(230-225+1).NE.0))GOTO 10040
        CALL PUTBA0(138)
        CALL PUTBA0(167)
        CALL PUTBC0(AAAAE0)
        CALL PUTBA0(167)
        CALL PUTBC0(AAAAF0)
10040 LEVEL0=1
      INFIL0(LEVEL0)=FIN
      LINEN0(LEVEL0)=0
      CALL GETSYM
      CALL GETSYM
10041 IF((SYMBO0.NE.187))GOTO 10042
        CALL GETSYM
      GOTO 10041
10042 OUTFP0=3
      CALL OUTOP0(32)
      OUTFP0=1
      CALL OUTOP0(32)
      OUTFP0=2
      CALL OUTOP0(32)
10043   CALL EXTER0(STATE)
        IF((STATE.NE.2))GOTO 10044
          CALL SYNERR('Parser failure.',0)
10044   CONTINUE
10045   IF((SYMBO0.NE.187))GOTO 10046
          CALL GETSYM
        GOTO 10045
10046 CONTINUE
      IF((SYMBO0.NE.-1))GOTO 10043
      CALL OUTDE0
      OUTFP0=3
      CALL OUTOP0(39)
      OUTFP0=1
      CALL OUTOP0(39)
      OUTFP0=2
      CALL OUTOP0(39)
      CALL CLEAN0
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
C Version                        versi0
C ckfncall                       ckfnc0
C cleanupll                      clean0
C genmakearith                   genma0
C Outfp                          outfp0
C alloctempalloe0
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
