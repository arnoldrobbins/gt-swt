      SUBROUTINE INITI0
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
      INTEGER I,J
      INTEGER NM(102)
      INTEGER MKTABL,ENTEW0,SDUPL
      INTEGER AAAAA0(1)
      INTEGER AAAAB0(4)
      INTEGER AAAAC0(5)
      INTEGER AAAAD0(6)
      INTEGER AAAAE0(5)
      INTEGER AAAAF0(5)
      INTEGER AAAAG0(9)
      INTEGER AAAAH0(8)
      INTEGER AAAAI0(3)
      INTEGER AAAAJ0(7)
      INTEGER AAAAK0(5)
      INTEGER AAAAL0(6)
      INTEGER AAAAM0(5)
      INTEGER AAAAN0(7)
      INTEGER AAAAO0(6)
      INTEGER AAAAP0(4)
      INTEGER AAAAQ0(8)
      INTEGER AAAAR0(5)
      INTEGER AAAAS0(3)
      INTEGER AAAAT0(4)
      INTEGER AAAAU0(5)
      INTEGER AAAAV0(9)
      INTEGER AAAAW0(7)
      INTEGER AAAAX0(6)
      INTEGER AAAAY0(7)
      INTEGER AAAAZ0(7)
      INTEGER AAABA0(7)
      INTEGER AAABB0(7)
      INTEGER AAABC0(8)
      INTEGER AAABD0(6)
      INTEGER AAABE0(9)
      INTEGER AAABF0(6)
      INTEGER AAABG0(7)
      INTEGER AAABH0(6)
      INTEGER AAABI0(8)
      INTEGER AAABJ0(5)
      INTEGER AAABK0(3)
      INTEGER AAABL0(6)
      INTEGER AAABM0(7)
      INTEGER AAABN0(5)
      INTEGER AAABO0(6)
      INTEGER AAABP0(9)
      INTEGER AAABQ0(1)
      INTEGER AAABR0(9)
      INTEGER AAABS0(1)
      INTEGER AAABT0(2)
      DATA AAAAA0/0/
      DATA AAAAB0/225,243,237,0/
      DATA AAAAC0/225,245,244,239,0/
      DATA AAAAD0/226,242,229,225,235,0/
      DATA AAAAE0/227,225,243,229,0/
      DATA AAAAF0/227,232,225,242,0/
      DATA AAAAG0/227,239,238,244,233,238,245,229,0/
      DATA AAAAH0/228,229,230,225,245,236,244,0/
      DATA AAAAI0/228,239,0/
      DATA AAAAJ0/228,239,245,226,236,229,0/
      DATA AAAAK0/229,236,243,229,0/
      DATA AAAAL0/229,238,244,242,249,0/
      DATA AAAAM0/229,238,245,237,0/
      DATA AAAAN0/229,248,244,229,242,238,0/
      DATA AAAAO0/230,236,239,225,244,0/
      DATA AAAAP0/230,239,242,0/
      DATA AAAAQ0/230,239,242,244,242,225,238,0/
      DATA AAAAR0/231,239,244,239,0/
      DATA AAAAS0/233,230,0/
      DATA AAAAT0/233,238,244,0/
      DATA AAAAU0/236,239,238,231,0/
      DATA AAAAV0/242,229,231,233,243,244,229,242,0/
      DATA AAAAW0/242,229,244,245,242,238,0/
      DATA AAAAX0/243,232,239,242,244,0/
      DATA AAAAY0/243,233,250,229,239,230,0/
      DATA AAAAZ0/243,244,225,244,233,227,0/
      DATA AAABA0/243,244,242,245,227,244,0/
      DATA AAABB0/243,247,233,244,227,232,0/
      DATA AAABC0/244,249,240,229,228,229,230,0/
      DATA AAABD0/245,238,233,239,238,0/
      DATA AAABE0/245,238,243,233,231,238,229,228,0/
      DATA AAABF0/247,232,233,236,229,0/
      DATA AAABG0/228,229,230,233,238,229,0/
      DATA AAABH0/245,238,228,229,230,0/
      DATA AAABI0/233,238,227,236,245,228,229,0/
      DATA AAABJ0/236,233,238,229,0/
      DATA AAABK0/233,230,0/
      DATA AAABL0/233,230,228,229,230,0/
      DATA AAABM0/233,230,238,228,229,230,0/
      DATA AAABN0/229,236,243,229,0/
      DATA AAABO0/229,238,228,233,230,0/
      DATA AAABP0/223,223,204,201,206,197,223,223,0/
      DATA AAABQ0/0/
      DATA AAABR0/223,223,198,201,204,197,223,223,0/
      DATA AAABS0/0/
      DATA AAABT0/177,0/
      SYMLE0=0
      SYMTE0(1)=0
      SYMLI0=0
      NSYML0=0
      NSYMT0(1)=0
      NSYMM0=0
      ERROR0(1)=0
      NERRS0=0
      IBPAA0=1000
      INBUF0(IBPAA0)=0
      CALL SCOPY(AAAAA0,1,MODUL0,1)
      CALL DSINIT(30000)
      KEYWD0=MKTABL(3)
      IDTBL0(1)=0
      SMTBL0(1)=0
      PPTBL0=MKTABL(3)
      CALL ENTEU0(KEYWD0,AAAAB0,1027)
      CALL ENTEU0(KEYWD0,AAAAC0,1028)
      CALL ENTEU0(KEYWD0,AAAAD0,1029)
      CALL ENTEU0(KEYWD0,AAAAE0,1030)
      CALL ENTEU0(KEYWD0,AAAAF0,1031)
      CALL ENTEU0(KEYWD0,AAAAG0,1032)
      CALL ENTEU0(KEYWD0,AAAAH0,1034)
      CALL ENTEU0(KEYWD0,AAAAI0,1036)
      CALL ENTEU0(KEYWD0,AAAAJ0,1037)
      CALL ENTEU0(KEYWD0,AAAAK0,1038)
      CALL ENTEU0(KEYWD0,AAAAL0,1040)
      CALL ENTEU0(KEYWD0,AAAAM0,1041)
      CALL ENTEU0(KEYWD0,AAAAN0,1042)
      CALL ENTEU0(KEYWD0,AAAAO0,1043)
      CALL ENTEU0(KEYWD0,AAAAP0,1044)
      CALL ENTEU0(KEYWD0,AAAAQ0,1045)
      CALL ENTEU0(KEYWD0,AAAAR0,1046)
      CALL ENTEU0(KEYWD0,AAAAS0,1049)
      CALL ENTEU0(KEYWD0,AAAAT0,1051)
      CALL ENTEU0(KEYWD0,AAAAU0,1053)
      CALL ENTEU0(KEYWD0,AAAAV0,1054)
      CALL ENTEU0(KEYWD0,AAAAW0,1055)
      CALL ENTEU0(KEYWD0,AAAAX0,1056)
      CALL ENTEU0(KEYWD0,AAAAY0,1057)
      CALL ENTEU0(KEYWD0,AAAAZ0,1058)
      CALL ENTEU0(KEYWD0,AAABA0,1059)
      CALL ENTEU0(KEYWD0,AAABB0,1060)
      CALL ENTEU0(KEYWD0,AAABC0,1061)
      CALL ENTEU0(KEYWD0,AAABD0,1063)
      CALL ENTEU0(KEYWD0,AAABE0,1064)
      CALL ENTEU0(KEYWD0,AAABF0,1065)
      CALL ENTEU0(PPTBL0,AAABG0,1035)
      CALL ENTEU0(PPTBL0,AAABH0,1062)
      CALL ENTEU0(PPTBL0,AAABI0,1050)
      CALL ENTEU0(PPTBL0,AAABJ0,1052)
      CALL ENTEU0(PPTBL0,AAABK0,1049)
      CALL ENTEU0(PPTBL0,AAABL0,1047)
      CALL ENTEU0(PPTBL0,AAABM0,1048)
      CALL ENTEU0(PPTBL0,AAABN0,1038)
      CALL ENTEU0(PPTBL0,AAABO0,1039)
      CALL INSTA0(AAABP0,-2,SDUPL(AAABQ0))
      CALL INSTA0(AAABR0,-3,SDUPL(AAABS0))
      I=1
      GOTO 10002
10000 I=I+(LENGTH(DFONA0(I))+1)
10002 IF((I.GE.DFOTO0))GOTO 10001
        J=I
        GOTO 10005
10003   J=J+(1)
10005   IF((DFONA0(J).EQ.189))GOTO 10004
        IF((DFONA0(J).EQ.0))GOTO 10004
        GOTO 10003
10004   IF((DFONA0(J).EQ.189))GOTO 10006
          CALL INSTA0(DFONA0(I),-1,SDUPL(AAABT0))
          GOTO 10000
10006     CALL CTOC(DFONA0(I),NM,J-I+1)
          CALL INSTA0(NM,-1,SDUPL(DFONA0(J+1)))
10007 GOTO 10000
10001 SEMSP0=1
      CTLSP0=1
      EXPSP0=1
      OBJNO0=1
      LLAAA0=1
      MODEV0=1
      MODEL0=0
      MODET0=MAKEM0(3,0)
      MEMAA0(MODET0)=0
      MEMAA0(MODET0+1)=0
      MEMAA0(MODET0+2)=0
      INTMO0=MODET0
      CHARM0=ENTEW0(MODET0,1,0)
      CHARU0=ENTEW0(MODET0,2,0)
      SHORT0=ENTEW0(MODET0,4,0)
      LONGM0=ENTEW0(MODET0,5,0)
      UNSIG0=ENTEW0(MODET0,6,0)
      FLOAT0=ENTEW0(MODET0,9,0)
      DOUBL0=ENTEW0(MODET0,10,0)
      LABEL0=ENTEW0(MODET0,18,0)
      SHORU0=ENTEW0(MODET0,7,0)
      LONGU0=ENTEW0(MODET0,8,0)
      POINT0=INTMO0
      CALL CREAT0(POINT0,12,0)
      RETURN
      END
      SUBROUTINE ENTEU0(TBL,KW,VAL)
      INTEGER TBL
      INTEGER KW(1)
      INTEGER VAL
      INTEGER INFO(3)
      INFO(1)=2
      INFO(2)=VAL
      INFO(3)=0
      CALL ENTER(KW,INFO,TBL)
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
