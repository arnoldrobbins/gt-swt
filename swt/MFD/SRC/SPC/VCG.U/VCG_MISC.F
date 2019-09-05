      SUBROUTINE INITI0
      INTEGER NEXTL0
      COMMON /MISCOM/NEXTL0
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
      INTEGER MKLAB0
      NEXTL0=0
      RTRID0(5)=MKLAB0(1)
      RTRID0(6)=MKLAB0(1)
      RTRID0(1)=MKLAB0(1)
      RTRID0(2)=MKLAB0(1)
      RTRID0(3)=MKLAB0(1)
      RTRID0(4)=MKLAB0(1)
      RTRID0(7)=MKLAB0(1)
      RTRID0(8)=MKLAB0(1)
      RTRID0(9)=MKLAB0(1)
      RTRID0(10)=MKLAB0(1)
      RTRID0(11)=MKLAB0(1)
      RTRID0(12)=MKLAB0(1)
      RTRID0(13)=MKLAB0(1)
      RTRID0(14)=MKLAB0(1)
      RTRID0(15)=MKLAB0(1)
      RTRID0(16)=MKLAB0(1)
      RTRID0(17)=MKLAB0(1)
      RTRID0(18)=MKLAB0(1)
      RTRID0(19)=MKLAB0(1)
      RTRID0(20)=MKLAB0(1)
      RTRID0(21)=MKLAB0(1)
      RTRID0(22)=MKLAB0(1)
      RTRID0(23)=MKLAB0(1)
      RTRID0(24)=MKLAB0(1)
      RTRID0(25)=MKLAB0(1)
      RTRID0(26)=MKLAB0(1)
      RTRID0(27)=MKLAB0(1)
      RTRID0(28)=MKLAB0(1)
      RTRID0(29)=MKLAB0(1)
      RTRID0(30)=MKLAB0(1)
      RTRID0(31)=MKLAB0(1)
      RETURN
      END
      INTEGER FUNCTION MKLAB0(NUMLA0)
      INTEGER NUMLA0
      INTEGER NEXTL0
      COMMON /MISCOM/NEXTL0
      NEXTL0=NEXTL0-(NUMLA0)
      MKLAB0=NEXTL0
      RETURN
      END
      LOGICAL FUNCTION SAFE(R1,R2)
      INTEGER R1,R2
      INTEGER LR1,LR2
      LR1=R1
      LR2=R2
      IF((AND(LR1,LR2).EQ.0))GOTO 10000
        SAFE=.FALSE.
        RETURN
10000 IF((AND(LR1,:002000).EQ.0))GOTO 10001
        LR1=OR(LR1,:001000)
10001 IF((AND(LR1,:001000).EQ.0))GOTO 10002
        LR1=OR(LR1,:002000)
10002 IF((AND(LR1,:000400).EQ.0))GOTO 10003
        LR1=OR(LR1,:000200)
10003 IF((AND(LR1,:000200).EQ.0))GOTO 10004
        LR1=OR(LR1,:000400)
10004 IF((AND(LR2,:002000).EQ.0))GOTO 10005
        LR2=OR(LR2,:001000)
10005 IF((AND(LR2,:001000).EQ.0))GOTO 10006
        LR2=OR(LR2,:002000)
10006 IF((AND(LR2,:000400).EQ.0))GOTO 10007
        LR2=OR(LR2,:000200)
10007 IF((AND(LR2,:000200).EQ.0))GOTO 10008
        LR2=OR(LR2,:000400)
10008 IF((AND(LR1,LR2).EQ.0))GOTO 10009
        SAFE=.FALSE.
        GOTO 10010
10009   SAFE=.TRUE.
10010 RETURN
      END
      LOGICAL FUNCTION OPHAS0(EXPR,VAL)
      INTEGER EXPR
      INTEGER VAL
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
      INTEGER J
      INTEGER I(4)
      INTEGER * 4 L(2)
      REAL R(2)
      REAL * 8 F(1)
      INTEGER AAAAA0
      EQUIVALENCE (I(1),L(1),R(1),F(1))
      IF((TMEMA0(EXPR).EQ.9))GOTO 10011
        OPHAS0=.FALSE.
        RETURN
10011 J=0
      GOTO 10014
10012 J=J+(1)
10014 IF((J.GE.TMEMA0(EXPR+2)))GOTO 10013
        I(1+J)=TMEMA0(EXPR+3+J)
      GOTO 10012
10013 AAAAA0=TMEMA0(EXPR+1)
      GOTO 10015
10016   IF((I(1).NE.VAL))GOTO 10018
          OPHAS0=.TRUE.
          RETURN
10019   IF((L(1).NE.VAL))GOTO 10018
          OPHAS0=.TRUE.
          RETURN
10021   IF((R(1).NE.VAL))GOTO 10018
          OPHAS0=.TRUE.
          RETURN
10023   IF((F(1).NE.VAL))GOTO 10018
          OPHAS0=.TRUE.
          RETURN
10015 GOTO(10016,10019,10016,10019,10021,10023),AAAAA0
10018 OPHAS0=.FALSE.
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
C numlabs                        numla0
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
C Nextlab                        nextl0
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
