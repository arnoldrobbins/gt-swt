      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER A$BUF(200)
      INTEGER WORD
      INTEGER FROMS0
      INTEGER GETLIN,GET
      INTEGER LINE(102),FILEN0(180),MODUL0(102)
      INTEGER OPEN,OBJFI0
      INTEGER PARSCL
      INTEGER AAAAA0(25)
      INTEGER AAAAB0(5)
      INTEGER CTOC
      INTEGER AAAAC0(5)
      INTEGER CTOC
      INTEGER CTOC
      INTEGER AAAAD0(13)
      INTEGER AAAAE0(13)
      INTEGER AAAAF0(7)
      INTEGER AAAAG0(7)
      INTEGER AAAAH0(7)
      INTEGER AAAAI0(5)
      INTEGER AAAAJ0(13)
      DATA AAAAA0/219,173,237,188,242,243,190,221,219,173,243,188,239,24
     *3,190,221,219,173,226,188,239,243,190,221,0/
      DATA AAAAB0/170,243,174,243,0/
      DATA AAAAC0/170,243,174,226,0/
      DATA AAAAD0/175,228,229,246,175,243,244,228,239,245,244,177,0/
      DATA AAAAE0/175,228,229,246,175,243,244,228,239,245,244,177,0/
      DATA AAAAF0/170,243,174,227,244,177,0/
      DATA AAAAG0/170,243,174,227,244,178,0/
      DATA AAAAH0/170,243,174,227,244,179,0/
      DATA AAAAI0/170,243,174,226,0/
      DATA AAAAJ0/175,228,229,246,175,243,244,228,239,245,244,177,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR('Usage: vcg [-m <file_basename>] [-b [<obj_file>]] [-
     *s [<asm_file>]].')
10000 IF((A$BUF(237-225+1).NE.0))GOTO 10001
      IF((A$BUF(243-225+1).NE.0))GOTO 10001
      IF((A$BUF(226-225+1).NE.0))GOTO 10001
        CALL ERROR('Vcg: input is STDIN, but no object file named@..')
10001 IF((A$BUF(237-225+1).EQ.0))GOTO 10002
        CALL CTOC(A$BUF(A$BUF(237-225+27)),MODUL0,102)
        FROMS0=0
        IF((A$BUF(243-225+1).EQ.0))GOTO 10003
          CALL ENCODE(FILEN0,102,AAAAB0,MODUL0)
          IF((A$BUF(243-225+1).EQ.2))GOTO 10004
            A$BUF(243-225+27)=A$BUF(53)
            A$BUF(53)=A$BUF(53)+(1+CTOC(FILEN0,A$BUF(A$BUF(53)),200))
10004   CONTINUE
10003   IF((A$BUF(226-225+1).EQ.0))GOTO 10005
          CALL ENCODE(FILEN0,102,AAAAC0,MODUL0)
          IF((A$BUF(226-225+1).EQ.2))GOTO 10006
            A$BUF(226-225+27)=A$BUF(53)
            A$BUF(53)=A$BUF(53)+(1+CTOC(FILEN0,A$BUF(A$BUF(53)),200))
10006   CONTINUE
10005   FILEN0(1)=0
        GOTO 10007
10002   FROMS0=1
        IF((A$BUF(226-225+1).EQ.0))GOTO 10008
          CALL CTOC(A$BUF(A$BUF(226-225+27)),FILEN0,102)
          IF((FILEN0(1).NE.0))GOTO 10009
            CALL ERROR('Vcg: input is STDIN, but no object file named@..
     *')
10009   CONTINUE
10008   IF((A$BUF(243-225+1).EQ.0))GOTO 10010
          IF((A$BUF(243-225+1).EQ.2))GOTO 10011
            A$BUF(243-225+27)=A$BUF(53)
            A$BUF(53)=A$BUF(53)+(1+CTOC(AAAAD0,A$BUF(A$BUF(53)),200))
10011   CONTINUE
10010 CONTINUE
10007 ERROR0=0
      EMITO0=1
      IF((A$BUF(243-225+1).EQ.0))GOTO 10012
        EMITP0=1
        EMITO0=0
10012 IF((A$BUF(226-225+1).EQ.0))GOTO 10013
        EMITO0=1
10013 IF((FROMS0.NE.1))GOTO 10014
        STREA0=-10
        STREB0=-12
        STREC0=-14
        IF((EMITO0.NE.1))GOTO 10015
          CALL CTOC(A$BUF(A$BUF(226-225+27)),FILEN0,102)
          OBJFI0=OPEN(FILEN0,2)
          IF((OBJFI0.NE.-3))GOTO 10016
            CALL CANT(FILEN0)
10016     CALL TRUNC(OBJFI0)
          CALL INITO0(OBJFI0)
10015   IF((EMITP0.NE.1))GOTO 10021
          IF((EQUAL(A$BUF(A$BUF(243-225+27)),AAAAE0).NE.1))GOTO 10018
            OUTFI0=-11
            GOTO 10019
10018       CALL CTOC(A$BUF(A$BUF(243-225+27)),FILEN0,102)
            OUTFI0=OPEN(FILEN0,2)
            IF((OUTFI0.NE.-3))GOTO 10020
              CALL CANT(FILEN0)
10020       CALL TRUNC(OUTFI0)
10019   CONTINUE
10017   GOTO 10021
10014   CALL ENCODE(FILEN0,102,AAAAF0,MODUL0)
        STREA0=OPEN(FILEN0,1)
        IF((STREA0.NE.-3))GOTO 10022
          CALL CANT(FILEN0)
10022   CALL ENCODE(FILEN0,102,AAAAG0,MODUL0)
        STREB0=OPEN(FILEN0,1)
        IF((STREB0.NE.-3))GOTO 10023
          CALL CANT(FILEN0)
10023   CALL ENCODE(FILEN0,102,AAAAH0,MODUL0)
        STREC0=OPEN(FILEN0,1)
        IF((STREC0.NE.-3))GOTO 10024
          CALL CANT(FILEN0)
10024   IF((EMITO0.NE.1))GOTO 10025
          IF((A$BUF(226-225+1).EQ.0))GOTO 10026
            CALL CTOC(A$BUF(A$BUF(226-225+27)),FILEN0,102)
            GOTO 10027
10026       CALL ENCODE(FILEN0,102,AAAAI0,MODUL0)
10027     OBJFI0=OPEN(FILEN0,2)
          IF((OBJFI0.NE.-3))GOTO 10028
            CALL CANT(FILEN0)
10028     CALL TRUNC(OBJFI0)
          CALL INITO0(OBJFI0)
10025   IF((EMITP0.NE.1))GOTO 10029
          IF((A$BUF(243-225+1).EQ.0))GOTO 10031
          IF((EQUAL(A$BUF(A$BUF(243-225+27)),AAAAJ0).EQ.1))GOTO 10031
          GOTO 10030
10031       OUTFI0=-11
            GOTO 10032
10030       CALL CTOC(A$BUF(A$BUF(243-225+27)),FILEN0,102)
            OUTFI0=OPEN(FILEN0,2)
            IF((OUTFI0.NE.-3))GOTO 10033
              CALL CANT(FILEN0)
10033       CALL TRUNC(OUTFI0)
10032   CONTINUE
10029 CONTINUE
10021 INFIL0=STREA0
10034 IF((GET(WORD).NE.32))GOTO 10035
        CALL MODULE
        INFIL0=STREA0
      GOTO 10034
10035 IF((WORD.EQ.0))GOTO 10036
      IF((WORD.EQ.39))GOTO 10036
        CALL WARNI0('expected MODULE in ENT stream, found *i*n.',WORD)
10036 IF((GETLIN(LINE,STREA0).EQ.-1))GOTO 10037
        CALL WARNI0('Not all of IMF consumed*n.')
10037 IF((ERROR0.EQ.0))GOTO 10038
        CALL ERROR('Code generation terminated abnormally.')
10038 CALL SWT
      END
C ---- Long Name Map ----
C loadcompl                      loadj0
C loadxoraa                      loafg0
C deletelit                      delev0
C enterent                       enter0
C flowfield                      flowf0
C geniplabel                     genip0
C genlabel                       genla0
C loaddiv                        loadq0
C loadlshiftaa                   loaea0
C loadpredec                     loael0
C otg$aentpb                     otg$a0
C Imem                           imema0
C loadrem                        loaep0
C putmoduleheader                putmo0
C enterlit                       enteu0
C generatestaticstuff            geneu0
C loadchecklower                 loadg0
C loaddefinestat                 loado0
C loadreturn                     loaer0
C setupswitch                    setuq0
C Objfile                        objfi0
C gengeneric                     genge0
C linksize                       links0
C loadandaa                      loadd0
C loadobject                     loaeh0
C loadproccall                   loaen0
C loadrefto                      loaeo0
C lookupext                      looku0
C alloctemp                      alloc0
C loadcheckupper                 loadi0
C loadwhileloop                  loafe0
C geniprtr                       geniq0
C loadrshiftaa                   loaet0
C loadseq                        loaex0
C voidswitch                     voidt0
C initializelabels               initi0
C loadsub                        loafa0
C filename                       filen0
C clearobj                       cleax0
C deleteext                      delet0
C loadundefinedynm               loafd0
C reachindex                     reack0
C simplify                       simpl0
C stfield                        stfie0
C lfieldmask                     lfiel0
C loadoraa                       loaei0
C otg$dac                        otg$e0
C otg$mref                       otg$m0
C putmoduletrailer               putmp0
C resolveent                     resol0
C clearstack                     cleay0
C enterext                       entes0
C lshiftaby                      lshif0
C putstartdata                   putst0
C Smem                           smema0
C loadconst                      loadk0
C loadmul                        loaeb0
C loadpostinc                    loaek0
C otg$ecb                        otg$g0
C putbranch                      putbr0
C resolvelit                     reson0
C voidfieldasgop                 voidf0
C Tmem                           tmema0
C EmitPMA                        emitp0
C flowswitch                     flowv0
C loadconvert                    loadl0
C loadforloop                    loadv0
C loadsand                       loaev0
C optimize                       optim0
C rsvstack                       rsvst0
C voidaddaa                      voida0
C gettree                        gettr0
C loadselect                     loaew0
C lookuplab                      lookv0
C otg$endlb                      otg$h0
C otg$rentlb                     otg$r0
C loadnot                        loaef0
C loadpreinc                     loaem0
C otg$rorglb                     otg$t0
C loadlabel                      loady0
C voidpostdec                    voidp0
C framecom                       frame0
C generateprocedures             genet0
C genswitch                      gensw0
C loaddeclarestat                loadm0
C otglabel                       otgla0
C reachobject                    reacl0
C rshiftaby                      rshif0
C Breaksp                        break0
C Stream1                        strea0
C deletelab                      deleu0
C getlitaddr                     getli0
C loadadd                        loada0
C loadcheckrange                 loadh0
C loadsor                        loaez0
C otg$endpb                      otg$i0
C Stream2                        streb0
C gencopy                        genco0
C loadassign                     loade0
C reachseq                       reacn0
C Stream3                        strec0
C enterlab                       entet0
C generateproc                   genes0
C initshfttableids               inits0
C loadfield                      loadt0
C otg$proc                       otg$p0
C otgmisc                        otgmi0
C resolveext                     resom0
C warning                        warni0
C Breakstack                     breal0
C clearent                       clear0
C loadbreak                      loadf0
C loaddivaa                      loadr0
C modulename                     modul0
C loadderef                      loadp0
C loadremaa                      loaeq0
C loadrtrip                      loaeu0
C lshiftlby                      lshig0
C otg$brnch                      otg$d0
C stacksize                      stack0
C Continuesp                     conti0
C andawith                       andaw0
C clearlit                       cleaw0
C gensjtolab                     gensk0
C loadxor                        loaff0
C overlap                        overl0
C genbranch                      genbr0
C loadlshift                     loadz0
C reachconst                     reaci0
C Rtrids                         rtrid0
C voidseq                        voids0
C Continuestack                  contj0
C getextaddr                     getex0
C lookupobj                      lookx0
C otg$rorg                       otg$s0
C reachselect                    reacm0
C arshiftaby                     arshi0
C getlabeladdr                   getla0
C loaddoloop                     loads0
C otg$blk                        otg$c0
C fromstdin                      froms0
C initotg                        inito0
C loadand                        loadc0
C loadsubaa                      loafb0
C otg$gen                        otg$l0
C rshiftlby                      rshig0
C gendata                        genda0
C ldfield                        ldfie0
C loadshiftins                   loaey0
C Errors                         error0
C deleteobj                      delew0
C loadrshift                     loaes0
C otg$entlb                      otg$j0
C voidpostinc                    voidq0
C EmitObj                        emito0
C clearext                       cleas0
C flfield                        flfie0
C flowseq                        flowt0
C freetemp                       freet0
C genshift                       gensh0
C otg$orglb                      otg$o0
C otgpseudo                      otgps0
C reachassign                    reach0
C enterobj                       entev0
C loadgoto                       loadw0
C loadmulaa                      loaec0
C loadswitch                     loafc0
C putlabel                       putla0
C gensjforward                   gensj0
C mklabel                        mklab0
C setupframeowner                setup0
C voidpreinc                     voidr0
C Outfile                        outfi0
C andlwith                       andlw0
C loadnull                       loaeg0
C otg$entpb                      otg$k0
C reachderef                     reacj0
C Infile                         infil0
C loadneg                        loaed0
C putmisc                        putmi0
C otg$apins                      otg$b0
C putgeneric                     putge0
C clearinstr                     cleat0
C clearlink                      cleav0
C flowconvert                    flowc0
C flowsand                       flows0
C loadfieldasgop                 loadu0
C otg$data                       otg$f0
C otg$xtip                       otg$x0
C putinstr                       putin0
C voidassign                     voidb0
C adequal                        adequ0
C arshiftlby                     arshj0
C loadaddaa                      loadb0
C loadnext                       loaee0
C ophasvalue                     ophas0
C strsave                        strsa0
C clearstr                       cleaz0
C cleartree                      cleba0
C flownot                        flown0
C otg$rslv                       otg$u0
C rsvlink                        rsvli0
C zerolit                        zerol0
C clearlab                       cleau0
C freestack                      frees0
C genextrtr                      genex0
C loadindex                      loadx0
C lookuplit                      lookw0
C otgbranch                      otgbr0
C loadpostdec                    loaej0
C otg$uii                        otg$v0
C afieldmask                     afiel0
C flowsor                        flowu0
C generateentries                gener0
C loaddefinedynm                 loadn0
