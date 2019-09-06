      INTEGER FUNCTION VOID(EXPR,REGS)
      INTEGER EXPR
      INTEGER REGS
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
      INTEGER LOAD,VOIDA0,VOIDP0,VOIDQ0,VOIDS0,VOIDR0,VOIDB0,VOIDIF,VOID
     *T0,SEQ,GENGE0
      INTEGER AAAAA0
      INTEGER AAAAB0
      IF((EXPR.NE.0))GOTO 10000
        VOID=0
        REGS=0
        RETURN
10000 AAAAA0=TMEMA0(EXPR)
      GOTO 10001
10002   VOID=VOIDA0(EXPR,REGS)
      GOTO 10003
10004   VOID=VOIDB0(EXPR,REGS)
      GOTO 10003
10005   VOID=VOIDIF(EXPR,REGS)
      GOTO 10003
10006   VOID=VOIDP0(EXPR,REGS)
      GOTO 10003
10007   VOID=VOIDQ0(EXPR,REGS)
      GOTO 10003
10008   VOID=VOIDR0(EXPR,REGS)
      GOTO 10003
10009   VOID=VOIDS0(EXPR,REGS)
      GOTO 10003
10010   VOID=VOIDT0(EXPR,REGS)
      GOTO 10003
10011   VOID=SEQ(GENGE0(53),LOAD(EXPR,REGS),GENGE0(69))
      GOTO 10003
10001 GOTO(10002,10012,10012,10012,10004,10012,10012,10012,10012,10012, 
     *    10012,10012,10012,10011),AAAAA0
      IF(AAAAA0.EQ.24)GOTO 10005
      AAAAB0=AAAAA0-42
      GOTO(10006,10007,10012,10008,10012,10012,10012,10012,10012,10012, 
     *    10012,10012,10012,10012,10012,10012,10009,10012,10012,10012,  
     *   10010),AAAAB0
10012   VOID=LOAD(EXPR,REGS)
10003 RETURN
      END
      INTEGER FUNCTION VOIDA0(EXPR,REGS)
      INTEGER EXPR
      INTEGER REGS
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
      INTEGER GENMR,GENGE0,LOAD,SEQ,REACH,VOIDF0
      INTEGER RES,AD(5)
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10013
        VOIDA0=VOIDF0(EXPR,REGS)
        RETURN
10013 IF((TMEMA0(EXPR+1).NE.1))GOTO 10014
      IF((TMEMA0(TMEMA0(EXPR+3)).NE.9))GOTO 10014
      IF((TMEMA0(TMEMA0(EXPR+3)+3).NE.1))GOTO 10014
        VOIDA0=REACH(TMEMA0(EXPR+2),REGS,RES,AD)
        IF((RES.EQ.0))GOTO 10015
          CALL WARNI0('ADDAA left operand is not an lvalue*n.')
          VOIDA0=0
          RETURN
10015   VOIDA0=SEQ(VOIDA0,GENMR(31,AD),GENGE0(71))
        RETURN
10014 VOIDA0=LOAD(EXPR,REGS)
      RETURN
      END
      INTEGER FUNCTION VOIDB0(EXPR,REGS)
      INTEGER EXPR
      INTEGER REGS
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
      INTEGER LREGS,RREGS
      INTEGER STFIE0,LOAD,SEQ
      INTEGER AAAAC0
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10016
        AAAAC0=TMEMA0(EXPR+1)
        GOTO 10017
10018     VOIDB0=SEQ(LOAD(TMEMA0(EXPR+3),RREGS),STFIE0(TMEMA0(EXPR+2),LR
     *EGS))
          REGS=OR(LREGS,RREGS)
          RETURN
10017   GOTO(10018,10018,10018,10018),AAAAC0
          CALL WARNI0('*i:  bad data mode used with bit field*n.',TMEMA0
     *(EXPR+1))
          VOIDB0=0
          RETURN
10016 VOIDB0=LOAD(EXPR,REGS)
      RETURN
      END
      INTEGER FUNCTION VOIDIF(EXPR,REGS)
      INTEGER EXPR
      INTEGER REGS
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
      INTEGER VOID,FLOW,GENGE0,GENMR,GENLA0,SEQ
      INTEGER ELSEL0,EXITL0,AD(5)
      INTEGER MKLAB0
      INTEGER CREGS,TREGS,EREGS
      IF((TMEMA0(EXPR+4).NE.0))GOTO 10019
        EXITL0=MKLAB0(1)
        VOIDIF=FLOW(TMEMA0(EXPR+2),CREGS,.FALSE.,EXITL0)
        VOIDIF=SEQ(VOIDIF,VOID(TMEMA0(EXPR+3),TREGS),GENLA0(EXITL0))
        EREGS=0
        GOTO 10020
10019   IF((TMEMA0(EXPR+3).NE.0))GOTO 10021
          EXITL0=MKLAB0(1)
          VOIDIF=FLOW(TMEMA0(EXPR+2),CREGS,.TRUE.,EXITL0)
          VOIDIF=SEQ(VOIDIF,VOID(TMEMA0(EXPR+4),EREGS),GENLA0(EXITL0))
          TREGS=0
          GOTO 10022
10021     ELSEL0=MKLAB0(1)
          EXITL0=MKLAB0(1)
          AD(1)=10
          AD(3)=EXITL0
          VOIDIF=FLOW(TMEMA0(EXPR+2),CREGS,.FALSE.,ELSEL0)
          VOIDIF=SEQ(VOIDIF,VOID(TMEMA0(EXPR+3),TREGS),GENMR(32,AD),GENG
     *E0(19),GENLA0(ELSEL0))
          VOIDIF=SEQ(VOIDIF,VOID(TMEMA0(EXPR+4),EREGS),GENLA0(EXITL0))
10022 CONTINUE
10020 REGS=OR(CREGS,OR(TREGS,EREGS))
      RETURN
      END
      INTEGER FUNCTION VOIDP0(EXPR,REGS)
      INTEGER EXPR
      INTEGER REGS
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
      INTEGER LREGS,RREGS,OPREG
      INTEGER L,R
      INTEGER SEQ,LD,ST,GENMR,REACH,VOIDF0
      INTEGER LRES,RRES,LAD(5),RAD(5),OPINS
      INTEGER AAAAD0
      INTEGER AAAAE0
      INTEGER AAAAF0
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10023
        VOIDP0=VOIDF0(EXPR,REGS)
        RETURN
10023 AAAAD0=TMEMA0(EXPR+1)
      GOTO 10024
10025   OPREG=:002000
        OPINS=52
      GOTO 10026
10027   OPREG=:001000
        OPINS=46
      GOTO 10026
10028   OPREG=:000400
        OPINS=28
      GOTO 10026
10029   OPREG=:000200
        OPINS=13
      GOTO 10026
10024 GOTO(10025,10027,10025,10027,10028,10029),AAAAD0
        CALL WARNI0('*i: bad POSTDEC data mode*n.',TMEMA0(EXPR+1))
        REGS=0
        VOIDP0=0
        RETURN
10026 L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      IF((RRES.NE.1))GOTO 10030
        CALL WARNI0('right POSTDEC operand is not constant*n.')
        REGS=0
        VOIDP0=0
        RETURN
10030 AAAAE0=RAD(1)
      GOTO 10031
10031 AAAAF0=AAAAE0-5
      GOTO(10033,10033,10033,10033),AAAAF0
        CALL WARNI0('right POSTDEC operand is not constant*n.')
        REGS=0
        VOIDP0=0
        RETURN
10033 IF((LRES.NE.1))GOTO 10034
        CALL WARNI0('left POSTDEC operand is not an lvalue*n.')
        REGS=0
        VOIDP0=0
        RETURN
10034 VOIDP0=SEQ(L,LD(OPREG,LRES,LAD),GENMR(OPINS,RAD),ST(OPREG,LAD))
      REGS=OR(OPREG,LREGS)
      RETURN
      END
      INTEGER FUNCTION VOIDQ0(EXPR,REGS)
      INTEGER EXPR
      INTEGER REGS
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
      INTEGER LREGS,RREGS,OPREG
      INTEGER L,R
      INTEGER SEQ,LD,ST,GENMR,REACH,GENGE0,VOIDF0
      INTEGER LRES,RRES,LAD(5),RAD(5),OPINS
      INTEGER AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAI0
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10035
        VOIDQ0=VOIDF0(EXPR,REGS)
        RETURN
10035 AAAAG0=TMEMA0(EXPR+1)
      GOTO 10036
10037   OPREG=:002000
        OPINS=1
      GOTO 10038
10039   OPREG=:001000
        OPINS=2
      GOTO 10038
10040   OPREG=:000400
        OPINS=22
      GOTO 10038
10041   OPREG=:000200
        OPINS=7
      GOTO 10038
10036 GOTO(10037,10039,10037,10039,10040,10041),AAAAG0
        CALL WARNI0('*i: bad POSTINC data mode*n.',TMEMA0(EXPR+1))
        REGS=0
        VOIDQ0=0
        RETURN
10038 L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      IF((RRES.NE.1))GOTO 10042
        CALL WARNI0('right POSTINC operand is not constant*n.')
        REGS=0
        VOIDQ0=0
        RETURN
10042 AAAAH0=RAD(1)
      GOTO 10043
10043 AAAAI0=AAAAH0-5
      GOTO(10045,10045,10045,10045),AAAAI0
        CALL WARNI0('right POSTINC operand is not constant*n.')
        REGS=0
        VOIDQ0=0
        RETURN
10045 IF((LRES.NE.1))GOTO 10046
        CALL WARNI0('left POSTINC operand is not an lvalue*n.')
        REGS=0
        VOIDQ0=0
        RETURN
10046 IF((TMEMA0(EXPR+1).NE.1))GOTO 10047
      IF((RAD(2).NE.1))GOTO 10047
        REGS=LREGS
        VOIDQ0=SEQ(L,GENMR(31,LAD),GENGE0(71))
        RETURN
10047 VOIDQ0=SEQ(L,LD(OPREG,LRES,LAD),GENMR(OPINS,RAD),ST(OPREG,LAD))
      REGS=OR(OPREG,LREGS)
      RETURN
      END
      INTEGER FUNCTION VOIDS0(EXPR,REGS)
      INTEGER EXPR
      INTEGER REGS
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
      INTEGER VOID,SEQ
      INTEGER LREGS,RREGS
      VOIDS0=VOID(TMEMA0(EXPR+1),LREGS)
      VOIDS0=SEQ(VOIDS0,VOID(TMEMA0(EXPR+2),RREGS))
      REGS=OR(LREGS,RREGS)
      RETURN
      END
      INTEGER FUNCTION VOIDR0(EXPR,REGS)
      INTEGER EXPR
      INTEGER REGS
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
      INTEGER LOAD,SEQ,GENGE0,GENMR,REACH,VOIDF0
      INTEGER RES,AD(5)
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10048
        VOIDR0=VOIDF0(EXPR,REGS)
        RETURN
10048 IF((TMEMA0(EXPR+1).NE.1))GOTO 10049
      IF((TMEMA0(TMEMA0(EXPR+3)).NE.9))GOTO 10049
      IF((TMEMA0(TMEMA0(EXPR+3)+3).NE.1))GOTO 10049
        VOIDR0=REACH(TMEMA0(EXPR+2),REGS,RES,AD)
        IF((RES.EQ.0))GOTO 10050
          CALL WARNI0('PREINC left operand is not an lvalue*n.')
          VOIDR0=0
          RETURN
10050   VOIDR0=SEQ(VOIDR0,GENMR(31,AD),GENGE0(71))
        RETURN
10049 VOIDR0=LOAD(EXPR,REGS)
      RETURN
      END
      INTEGER FUNCTION VOIDT0(EXPR,REGS)
      INTEGER EXPR
      INTEGER REGS
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
      INTEGER VOID,SEQ,GENLA0,GENSW0
      INTEGER CC
      INTEGER CN
      INTEGER CLABS(256),DEFLAB
      INTEGER CREGS
      VOIDT0=GENSW0(EXPR,CLABS,DEFLAB,REGS)
      CN=0
      CC=TMEMA0(EXPR+3)
10051 IF((CC.EQ.0))GOTO 10052
        IF((TMEMA0(CC).NE.7))GOTO 10053
          CN=CN+(1)
          VOIDT0=SEQ(VOIDT0,GENLA0(CLABS(CN)),VOID(TMEMA0(CC+2),CREGS))
          REGS=OR(REGS,CREGS)
          CC=TMEMA0(CC+3)
          GOTO 10051
10053     VOIDT0=SEQ(VOIDT0,GENLA0(DEFLAB),VOID(TMEMA0(CC+1),CREGS))
          REGS=OR(REGS,CREGS)
          CC=TMEMA0(CC+2)
10054 GOTO 10051
10052 VOIDT0=SEQ(VOIDT0,GENLA0(BREAL0(BREAK0)))
      BREAK0=BREAK0-(1)
      RETURN
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
C exitlab                        exitl0
C initializelabels               initi0
C loadsub                        loafa0
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
C elselab                        elsel0
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
