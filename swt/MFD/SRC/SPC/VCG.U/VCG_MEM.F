      INTEGER FUNCTION IALLOC(SIZE)
      INTEGER SIZE
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
      IF((RT(INTL(SIZE),16)+RT(INTL(NEXTI0),16).LE.65530))GOTO 10000
        CALL PANIC('out of instr storage memory*n.')
10000 IALLOC=NEXTI0
      NEXTI0=NEXTI0+(SIZE)
      RETURN
      END
      INTEGER FUNCTION TALLOC(SIZE)
      INTEGER SIZE
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
      IF((RT(INTL(SIZE),16)+RT(INTL(NEXTT0),16).LE.INTL(65000)))GOTO    
     *  10001
        CALL PANIC('out of tree storage memory*n.')
10001 TALLOC=NEXTT0
      NEXTT0=NEXTT0+(SIZE)
      RETURN
      END
      SUBROUTINE CLEAT0
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
      NEXTI0=1
      RETURN
      END
      SUBROUTINE CLEAZ0
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
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
      INTEGER STRSA0
      NEXTS0=1
      RETURN
      END
      SUBROUTINE CLEBA0
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
      NEXTT0=1
      RETURN
      END
      SUBROUTINE IFREE(NODE)
      INTEGER NODE
      RETURN
      END
      SUBROUTINE TFREE(NODE)
      INTEGER NODE
      RETURN
      END
      INTEGER FUNCTION STRSA0(STR)
      INTEGER STR(1)
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
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
      INTEGER LEN
      INTEGER LENGTH
      LEN=LENGTH(STR)
      IF((NEXTS0+LEN+1.LE.32767))GOTO 10002
        CALL PANIC('out of string storage memory*n.')
10002 CALL SCOPY(STR,1,SMEMA0,NEXTS0)
      STRSA0=NEXTS0
      NEXTS0=NEXTS0+(LEN+1)
      RETURN
      END
      SUBROUTINE CLEAX0
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
      INTEGER I
      I=1
      GOTO 10005
10003 I=I+(1)
10005 IF((I.GT.43))GOTO 10004
        OMEMA0(I)=0
      GOTO 10003
10004 OFREE0=0
      ONEXT0=43+1
      RETURN
      END
      SUBROUTINE ENTEV0(OBJ,AD)
      INTEGER OBJ,AD(5)
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
      INTEGER LOC,PRED
      INTEGER I
      INTEGER MEM$01
      IF((MEM$01(OBJ,LOC,PRED).NE.0))GOTO 10006
        IF((OFREE0.EQ.0))GOTO 10007
          LOC=OFREE0
          OFREE0=OMEMA0(OFREE0)
          GOTO 10008
10007     IF((ONEXT0+2+5.LE.32767))GOTO 10009
            CALL PANIC('enter_obj: out of space*nincrease MAX_OBJ_MEMORY
     * in vcg_def@.i*n.')
10009     LOC=ONEXT0
          ONEXT0=ONEXT0+(2+5)
10008   OMEMA0(LOC)=0
        OMEMA0(LOC+1)=OBJ
        OMEMA0(PRED)=LOC
10006 LOC=LOC+(2)
      I=1
      GOTO 10012
10010 I=I+(1)
      LOC=LOC+(1)
10012 IF((I.GT.5))GOTO 10011
        OMEMA0(LOC)=AD(I)
      GOTO 10010
10011 RETURN
      END
      INTEGER FUNCTION MEM$01(OBJ,LOC,PRED)
      INTEGER OBJ
      INTEGER LOC,PRED
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
      PRED=MOD(IABS(OBJ),43)+1
      LOC=OMEMA0(PRED)
10013 IF((LOC.EQ.0))GOTO 10014
      IF((OMEMA0(LOC+1).EQ.OBJ))GOTO 10014
        PRED=LOC
        LOC=OMEMA0(LOC)
      GOTO 10013
10014 IF((LOC.NE.0))GOTO 10015
        MEM$01=0
        RETURN
10015   MEM$01=1
        RETURN
      END
      INTEGER FUNCTION LOOKX0(OBJ,AD)
      INTEGER OBJ,AD(5)
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
      INTEGER I
      INTEGER MEM$01
      INTEGER LOC,PRED
      IF((MEM$01(OBJ,LOC,PRED).NE.0))GOTO 10016
        LOOKX0=0
        RETURN
10016   LOC=LOC+(2)
        I=1
        GOTO 10019
10017   I=I+(1)
        LOC=LOC+(1)
10019   IF((I.GT.5))GOTO 10018
          AD(I)=OMEMA0(LOC)
        GOTO 10017
10018   LOOKX0=1
        RETURN
      END
      SUBROUTINE DELEW0(OBJ)
      INTEGER OBJ
      INTEGER NEXTI0
      INTEGER NEXTT0
      INTEGER NEXTS0
      INTEGER OMEMA0(32767)
      INTEGER OFREE0,ONEXT0
      COMMON /MEMCOM/NEXTI0,NEXTT0,NEXTS0,OMEMA0,OFREE0,ONEXT0
      INTEGER MEM$01
      INTEGER LOC,PRED
      IF((MEM$01(OBJ,LOC,PRED).NE.1))GOTO 10020
        OMEMA0(PRED)=OMEMA0(LOC)
        OMEMA0(LOC)=OFREE0
        OFREE0=LOC
10020 RETURN
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
C Onext                          onext0
C alloctemp                      alloc0
C loadcheckupper                 loadi0
C loadwhileloop                  loafe0
C geniprtr                       geniq0
C loadrshiftaa                   loaet0
C loadseq                        loaex0
C voidswitch                     voidt0
C Omem                           omema0
C initializelabels               initi0
C loadsub                        loafa0
C clearobj                       cleax0
C deleteext                      delet0
C loadundefinedynm               loafd0
C reachindex                     reack0
C simplify                       simpl0
C stfield                        stfie0
C Nexts                          nexts0
C lfieldmask                     lfiel0
C loadoraa                       loaei0
C otg$dac                        otg$e0
C otg$mref                       otg$m0
C putmoduletrailer               putmp0
C resolveent                     resol0
C Nextt                          nextt0
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
C Ofree                          ofree0
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
C Nexti                          nexti0
