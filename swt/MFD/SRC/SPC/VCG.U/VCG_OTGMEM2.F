      INTEGER FUNCTION RESOL0(NAME,BASE,OFFSET)
      INTEGER NAME(1),BASE,OFFSET
      INTEGER ENEXT0
      INTEGER EMEMA0(4096)
      COMMON /ENTCOM/ENEXT0,EMEMA0
      INTEGER PTR,I,J,OBJID,LOOKV0,AD(5)
      PTR=EMEMA0(1)
      IF((PTR.EQ.0))GOTO 10000
        I=1
        J=PTR+1
        GOTO 10003
10001   I=I+(1)
        J=J+(1)
10003   IF((I.GT.33))GOTO 10002
          NAME(I)=EMEMA0(J)
        GOTO 10001
10002   OBJID=EMEMA0(PTR+1+33)
        IF((LOOKV0(OBJID,AD).NE.0))GOTO 10004
          CALL PANIC('resolve_ent: obj *i not found*n.',OBJID)
10004   BASE=AD(2)
        OFFSET=AD(3)
        EMEMA0(1)=EMEMA0(PTR)
        RESOL0=1
        RETURN
10000 RESOL0=0
      RETURN
      END
      SUBROUTINE CLEAU0
      INTEGER LBNEX0
      INTEGER LBNEY0
      INTEGER LBNEZ0
      INTEGER LBMEM0(8192)
      INTEGER LBFRE0,LBNFA0
      COMMON /LABCOM/LBNEX0,LBNEY0,LBNEZ0,LBMEM0,LBFRE0,LBNFA0
      INTEGER I
      I=1
      GOTO 10007
10005 I=I+(1)
10007 IF((I.GT.43))GOTO 10006
        LBMEM0(I)=0
      GOTO 10005
10006 LBFRE0=0
      LBNFA0=43+1
      RETURN
      END
      SUBROUTINE ENTET0(LAB,AD)
      INTEGER LAB,AD(5)
      INTEGER LBNEX0
      INTEGER LBNEY0
      INTEGER LBNEZ0
      INTEGER LBMEM0(8192)
      INTEGER LBFRE0,LBNFA0
      COMMON /LABCOM/LBNEX0,LBNEY0,LBNEZ0,LBMEM0,LBFRE0,LBNFA0
      INTEGER LOC,PRED
      INTEGER I
      INTEGER LAB$01
      IF((LAB$01(LAB,LOC,PRED).NE.0))GOTO 10008
        IF((LBFRE0.EQ.0))GOTO 10009
          LOC=LBFRE0
          LBFRE0=LBMEM0(LBFRE0)
          GOTO 10010
10009     IF((LBNFA0+2+5.LE.8192))GOTO 10011
            CALL PANIC('enter_lab: out of space*nincrease MAX_LAB_MEMORY
     * in vcg_def@.i*n.')
10011     LOC=LBNFA0
          LBNFA0=LBNFA0+(2+5)
10010   LBMEM0(LOC)=0
        LBMEM0(LOC+1)=LAB
        LBMEM0(PRED)=LOC
10008 LOC=LOC+(2)
      I=1
      GOTO 10014
10012 I=I+(1)
      LOC=LOC+(1)
10014 IF((I.GT.5))GOTO 10013
        LBMEM0(LOC)=AD(I)
      GOTO 10012
10013 RETURN
      END
      INTEGER FUNCTION LAB$01(LAB,LOC,PRED)
      INTEGER LAB
      INTEGER LOC,PRED
      INTEGER LBNEX0
      INTEGER LBNEY0
      INTEGER LBNEZ0
      INTEGER LBMEM0(8192)
      INTEGER LBFRE0,LBNFA0
      COMMON /LABCOM/LBNEX0,LBNEY0,LBNEZ0,LBMEM0,LBFRE0,LBNFA0
      PRED=MOD(IABS(LAB),43)+1
      LOC=LBMEM0(PRED)
10015 IF((LOC.EQ.0))GOTO 10016
      IF((LBMEM0(LOC+1).EQ.LAB))GOTO 10016
        PRED=LOC
        LOC=LBMEM0(LOC)
      GOTO 10015
10016 IF((LOC.NE.0))GOTO 10017
        LAB$01=0
        RETURN
10017   LAB$01=1
        RETURN
      END
      INTEGER FUNCTION LOOKV0(LAB,AD)
      INTEGER LAB,AD(5)
      INTEGER LBNEX0
      INTEGER LBNEY0
      INTEGER LBNEZ0
      INTEGER LBMEM0(8192)
      INTEGER LBFRE0,LBNFA0
      COMMON /LABCOM/LBNEX0,LBNEY0,LBNEZ0,LBMEM0,LBFRE0,LBNFA0
      INTEGER I
      INTEGER LAB$01
      INTEGER LOC,PRED
      IF((LAB$01(LAB,LOC,PRED).NE.0))GOTO 10018
        LOOKV0=0
        RETURN
10018   LOC=LOC+(2)
        I=1
        GOTO 10021
10019   I=I+(1)
        LOC=LOC+(1)
10021   IF((I.GT.5))GOTO 10020
          AD(I)=LBMEM0(LOC)
        GOTO 10019
10020   LOOKV0=1
        RETURN
      END
      SUBROUTINE DELEU0(LAB)
      INTEGER LAB
      INTEGER LBNEX0
      INTEGER LBNEY0
      INTEGER LBNEZ0
      INTEGER LBMEM0(8192)
      INTEGER LBFRE0,LBNFA0
      COMMON /LABCOM/LBNEX0,LBNEY0,LBNEZ0,LBMEM0,LBFRE0,LBNFA0
      INTEGER LAB$01
      INTEGER LOC,PRED
      IF((LAB$01(LAB,LOC,PRED).NE.1))GOTO 10022
        LBMEM0(PRED)=LBMEM0(LOC)
        LBMEM0(LOC)=LBFRE0
        LBFRE0=LOC
10022 RETURN
      END
      SUBROUTINE GETLA0(LDESC,ADDR,FWDREF,ONEWO0)
      INTEGER LDESC(5),ADDR(5),ONEWO0
      LOGICAL FWDREF,MISSIN
      INTEGER BLOCK0(64)
      INTEGER FDAAA0
      INTEGER * 4 MARKA0,PROCS0,ENDMA0
      INTEGER EMITP0,EMITO0,PBHER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      COMMON /OTGCOM/BLOCK0,FDAAA0,MARKA0,PROCS0,ENDMA0,EMITP0,EMITO0,PB
     *HER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      INTEGER LAD(5),LBASE,LABEL0,FWDOF0
      FWDREF=.FALSE.
      IF(MISSIN(ONEWO0))GOTO 10024
      IF((ONEWO0.EQ.0))GOTO 10024
      GOTO 10023
10024   FWDOF0=1
        GOTO 10025
10023   FWDOF0=0
10025 LBASE=LDESC(2)
      IF((LBASE.EQ.:000001))GOTO 10027
      IF((LBASE.EQ.:000003))GOTO 10027
      GOTO 10026
10027   CALL PANIC('get_label_addr: bad base reg@.*n.')
10026 LABEL0=LDESC(3)
      IF((LOOKV0(LABEL0,LAD).NE.0))GOTO 10028
        LAD(1)=1
        LAD(2)=LBASE
        LAD(3)=PBHER0+FWDOF0
        LAD(4)=0
        ADDR(3)=0
        FWDREF=.TRUE.
        CALL ENTET0(LABEL0,LAD)
        GOTO 10029
10028   IF((LAD(4).NE.0))GOTO 10030
          CALL DELEU0(LABEL0)
          ADDR(3)=LAD(3)
          LAD(3)=PBHER0+FWDOF0
          FWDREF=.TRUE.
          CALL ENTET0(LABEL0,LAD)
          GOTO 10031
10030     ADDR(3)=LAD(3)
10031 CONTINUE
10029 ADDR(2)=LAD(2)
      ADDR(1)=LAD(1)
      RETURN
      END
C ---- Long Name Map ----
C loadcompl                      loadj0
C loadxoraa                      loafg0
C Resolveproc                    resoo0
C deletelit                      delev0
C enterent                       enter0
C flowfield                      flowf0
C geniplabel                     genip0
C genlabel                       genla0
C loaddiv                        loadq0
C loadlshiftaa                   loaea0
C loadpredec                     loael0
C otg$aentpb                     otg$a0
C PBhere                         pbher0
C loadrem                        loaep0
C putmoduleheader                putmo0
C enterlit                       enteu0
C generatestaticstuff            geneu0
C loadchecklower                 loadg0
C loaddefinestat                 loado0
C loadreturn                     loaer0
C setupswitch                    setuq0
C Mark                           marka0
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
C Procstart                      procs0
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
C Endmark                        endma0
C loadconst                      loadk0
C loadmul                        loaeb0
C loadpostinc                    loaek0
C otg$ecb                        otg$g0
C putbranch                      putbr0
C resolvelit                     reson0
C voidfieldasgop                 voidf0
C EmitPMA                        emitp0
C flowswitch                     flowv0
C loadconvert                    loadl0
C loadforloop                    loadv0
C loadsand                       loaev0
C optimize                       optim0
C rsvstack                       rsvst0
C voidaddaa                      voida0
C Lbnext                         lbnfa0
C Block                          block0
C fwdoffset                      fwdof0
C gettree                        gettr0
C loadselect                     loaew0
C lookuplab                      lookv0
C otg$endlb                      otg$h0
C otg$rentlb                     otg$r0
C loadnot                        loaef0
C loadpreinc                     loaem0
C otg$rorglb                     otg$t0
C Lbmem                          lbmem0
C loadlabel                      loady0
C voidpostdec                    voidp0
C framecom                       frame0
C generateprocedures             genet0
C genswitch                      gensw0
C loaddeclarestat                loadm0
C otglabel                       otgla0
C reachobject                    reacl0
C rshiftaby                      rshif0
C deletelab                      deleu0
C getlitaddr                     getli0
C loadadd                        loada0
C loadcheckrange                 loadh0
C loadsor                        loaez0
C otg$endpb                      otg$i0
C gencopy                        genco0
C loadassign                     loade0
C reachseq                       reacn0
C enterlab                       entet0
C generateproc                   genes0
C initshfttableids               inits0
C loadfield                      loadt0
C otg$proc                       otg$p0
C otgmisc                        otgmi0
C resolveext                     resom0
C warning                        warni0
C clearent                       clear0
C loadbreak                      loadf0
C loaddivaa                      loadr0
C ECBstart                       ecbst0
C loadderef                      loadp0
C loadremaa                      loaeq0
C loadrtrip                      loaeu0
C lshiftlby                      lshig0
C otg$brnch                      otg$d0
C stacksize                      stack0
C labelid                        label0
C andawith                       andaw0
C clearlit                       cleaw0
C gensjtolab                     gensk0
C loadxor                        loaff0
C overlap                        overl0
C genbranch                      genbr0
C loadlshift                     loadz0
C reachconst                     reaci0
C voidseq                        voids0
C Dataptr                        datap0
C getextaddr                     getex0
C lookupobj                      lookx0
C otg$rorg                       otg$s0
C reachselect                    reacm0
C arshiftaby                     arshi0
C getlabeladdr                   getla0
C loaddoloop                     loads0
C otg$blk                        otg$c0
C Lbfree                         lbfre0
C initotg                        inito0
C loadand                        loadc0
C loadsubaa                      loafb0
C otg$gen                        otg$l0
C rshiftlby                      rshig0
C oneword                        onewo0
C gendata                        genda0
C ldfield                        ldfie0
C loadshiftins                   loaey0
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
C Lbnexti                        lbnex0
C enterobj                       entev0
C loadgoto                       loadw0
C loadmulaa                      loaec0
C loadswitch                     loafc0
C putlabel                       putla0
C CurrentBase                    curre0
C gensjforward                   gensj0
C mklabel                        mklab0
C setupframeowner                setup0
C voidpreinc                     voidr0
C andlwith                       andlw0
C loadnull                       loaeg0
C otg$entpb                      otg$k0
C reachderef                     reacj0
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
C Enext                          enext0
C clearstr                       cleaz0
C cleartree                      cleba0
C flownot                        flown0
C otg$rslv                       otg$u0
C rsvlink                        rsvli0
C zerolit                        zerol0
C Fd                             fdaaa0
C clearlab                       cleau0
C freestack                      frees0
C genextrtr                      genex0
C loadindex                      loadx0
C lookuplit                      lookw0
C otgbranch                      otgbr0
C Emem                           emema0
C LBhere                         lbher0
C loadpostdec                    loaej0
C otg$uii                        otg$v0
C Lbnexts                        lbnez0
C afieldmask                     afiel0
C flowsor                        flowu0
C generateentries                gener0
C loaddefinedynm                 loadn0
C Lbnextt                        lbney0
