      SUBROUTINE MODULE
      CALL CLEAZ0
      CALL CLEAV0
      CALL CLEAX0
      CALL INITI0
      CALL PUTMO0
      CALL GENER0
      CALL GENEU0
      CALL GENET0
      CALL PUTMP0
      RETURN
      END
      SUBROUTINE GENER0
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
      INTEGER EXTNA0(102)
      INTEGER OBJEC0,NAMEL0,I,OP
      INTEGER GET
      INFIL0=STREA0
10000 IF((GET(OP).NE.59))GOTO 10001
        CALL GET(OBJEC0)
        CALL GET(NAMEL0)
        I=1
        GOTO 10004
10002   I=I+(1)
10004   IF((I.GT.NAMEL0))GOTO 10003
          CALL GET(EXTNA0(I))
        GOTO 10002
10003   EXTNA0(I)=0
        CALL MAPSTR(EXTNA0,2)
        CALL PUTENT(EXTNA0,OBJEC0)
      GOTO 10000
10001 CALL PUTST0
      IF((OP.EQ.0))GOTO 10005
      IF((OP.EQ.39))GOTO 10005
        CALL WARNI0('missing SEQ between ENT ops in stream 1*n.')
10005 RETURN
      END
      SUBROUTINE GENEU0
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
      INTEGER OP
      INTEGER GET
      INTEGER CODE
      INTEGER LOAD
      INTEGER GENGE0
      INTEGER DECLO0
      INTEGER REGS
      INFIL0=STREB0
      IF((GET(OP).EQ.32))GOTO 10006
        CALL PANIC('missing MODULE in static data stream*n.')
10006 CALL PUTIN0(GENGE0(53))
10007 IF((GET(OP).NE.59))GOTO 10008
        CALL CLEBA0
        CALL GETTR0(DECLO0)
        CALL CLEAT0
        CODE=LOAD(DECLO0,REGS)
        CALL PUTIN0(CODE)
      GOTO 10007
10008 CALL PUTIN0(GENGE0(69))
      IF((OP.EQ.0))GOTO 10009
      IF((OP.EQ.39))GOTO 10009
        CALL WARNI0('missing SEQ between static data decls/defns*n.')
10009 RETURN
      END
      SUBROUTINE GENET0
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
      INTEGER OP
      INTEGER GET
      INTEGER PROC
      INTEGER CODE
      INTEGER GENES0
      INFIL0=STREC0
      IF((GET(OP).EQ.32))GOTO 10010
        CALL PANIC('missing MODULE in procedure definition stream*n.')
10010 CONTINUE
10011 IF((GET(OP).NE.59))GOTO 10012
        CALL CLEBA0
        CALL GETTR0(PROC)
        CALL CLEAT0
        CODE=GENES0(PROC)
        CALL OPTIM0(CODE)
        CALL PUTIN0(CODE)
      GOTO 10011
10012 IF((OP.EQ.0))GOTO 10013
      IF((OP.EQ.39))GOTO 10013
        CALL WARNI0('missing SEQ between procedure definitions*n.')
10013 RETURN
      END
      INTEGER FUNCTION GENES0(TREE)
      INTEGER TREE
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
      INTEGER AD(5),ARGN,TAD(5),VNAME(102),I,J
      INTEGER CTOV
      INTEGER ARGDI0,JUNK,START0
      INTEGER RSVST0,STACK0,MKLAB0,RSVLI0
      INTEGER LC,CA
      INTEGER GENENT,GENECB,GENGE0,GENMR,LOAD,SEQ,GENLA0,VOID,GENCO0,SET
     *UP0,GENDA0
      INTEGER REGS
      INTEGER AAAAA0
      CALL CLEAY0
      BREAK0=1
      CONTI0=1
      START0=MKLAB0(1)
      LC=SEQ(GENGE0(69),GENLA0(START0))
      IF((TMEMA0(TREE+2).LE.0))GOTO 10014
        LC=SEQ(LC,GENGE0(3))
10014 LC=SEQ(LC,SETUP0(TMEMA0(TREE+1)))
      ARGDI0=0
      IF((TMEMA0(TREE+2).LE.0))GOTO 10015
        ARGDI0=RSVST0(3)
        ARGN=2
        GOTO 10018
10016   ARGN=ARGN+(1)
10018   IF((ARGN.GT.TMEMA0(TREE+2)))GOTO 10017
          JUNK=RSVST0(3)
        GOTO 10016
10017   AD(2)=:000001
        AD(4)=1
        CA=TMEMA0(TREE+4)
        ARGN=0
10019   IF((CA.EQ.0))GOTO 10020
          AD(1)=1
          AD(3)=ARGDI0+ARGN*3
          IF((TMEMA0(CA+3).NE.0))GOTO 10021
            AD(1)=3
            AAAAA0=TMEMA0(CA+4)
            GOTO 10022
10023         LC=SEQ(LC,GENMR(37,AD))
              CALL FREES0(ARGDI0+ARGN*3)
              AD(1)=1
              AD(3)=RSVST0(1)
              LC=SEQ(LC,GENMR(47,AD))
            GOTO 10024
10025         LC=SEQ(LC,GENMR(38,AD))
              CALL FREES0(ARGDI0+ARGN*3)
              AD(1)=1
              AD(3)=RSVST0(2)
              LC=SEQ(LC,GENMR(48,AD))
            GOTO 10024
10026         LC=SEQ(LC,GENMR(10,AD))
              CALL FREES0(ARGDI0+ARGN*3)
              AD(1)=1
              AD(3)=RSVST0(4)
              LC=SEQ(LC,GENMR(14,AD))
            GOTO 10024
10022       GOTO(10023,10025,10027,10026),AAAAA0
10027         TAD(1)=1
              TAD(2)=:000001
              TAD(3)=RSVST0(TMEMA0(CA+4))
              LC=SEQ(LC,GENCO0(AD,TAD,TMEMA0(CA+4)))
              AD(1)=1
              AD(3)=TAD(3)
10024     CONTINUE
10021     CALL ENTEV0(TMEMA0(CA+1),AD)
          ARGN=ARGN+(1)
          CA=TMEMA0(CA+5)
        GOTO 10019
10020 CONTINUE
10015 LC=SEQ(LC,VOID(TMEMA0(TREE+5),REGS))
      LC=SEQ(LC,GENGE0(70))
      GENES0=SEQ(LC,GENGE0(53),GENECB(TMEMA0(TREE+1),START0,ARGDI0,TMEMA
     *0(TREE+2),STACK0(JUNK)))
      JUNK=RSVLI0(16)
      AD(1)=1
      AD(2)=:000002
      AD(3)=JUNK
      AD(4)=1
      CALL ENTEV0(TMEMA0(TREE+1),AD)
      I=TMEMA0(TREE+3)
      J=CTOV(SMEMA0,I,VNAME,102)
      I=J+2
      IF((AND(I,1).NE.0))GOTO 10028
        VNAME(RS(I,1)+1)=XOR(LS(0,8),RT(VNAME(RS(I,1)+1),8))
        GOTO 10029
10028   VNAME(RS(I,1)+1)=XOR(LT(VNAME(RS(I,1)+1),8),0)
10029 I=I+(1)
      J=1+(J+1)/2
      I=1
      GOTO 10032
10030 I=I+(1)
10032 IF((I.GT.J))GOTO 10031
        GENES0=SEQ(GENES0,GENDA0(VNAME(I)))
        JUNK=RSVLI0(1)
      GOTO 10030
10031 CA=TMEMA0(TREE+4)
      GOTO 10035
10033 CA=TMEMA0(CA+5)
10035 IF((CA.EQ.0))GOTO 10034
        CALL DELEW0(TMEMA0(CA+1))
      GOTO 10033
10034 RETURN
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
C declordefn                     declo0
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
C argdisp                        argdi0
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
C objectid                       objec0
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
C extname                        extna0
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
C startlab                       start0
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
C namelen                        namel0
C afieldmask                     afiel0
C flowsor                        flowu0
C generateentries                gener0
C loaddefinedynm                 loadn0
