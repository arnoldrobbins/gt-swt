      SUBROUTINE INITO0(FD)
      INTEGER FD
      INTEGER BLOCK0(64)
      INTEGER FDAAA0
      INTEGER * 4 MARKA0,PROCS0,ENDMA0
      INTEGER EMITP0,EMITO0,PBHER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      COMMON /OTGCOM/BLOCK0,FDAAA0,MARKA0,PROCS0,ENDMA0,EMITP0,EMITO0,PB
     *HER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      FDAAA0=FD
      DATAP0=0
      PBHER0=0
      LBHER0=0
      CURRE0=:000000
      RESOO0=0
      CALL CLEAU0
      CALL CLEAW0
      CALL CLEAS0
      CALL CLEAR0
      RETURN
      END
      SUBROUTINE OTG(INSTR0,ADDRD0,OPCODE,EXTRA)
      INTEGER INSTR0,ADDRD0(5),OPCODE,EXTRA
      LOGICAL MISSIN
      INTEGER AAAAA0
      AAAAA0=INSTR0
      GOTO 10000
10001   IF((.NOT.MISSIN(EXTRA)))GOTO 10002
          CALL PANIC('otg: missin parm*n.')
10002   CALL OTGBR0(OPCODE,ADDRD0,EXTRA)
      GOTO 10003
10004   CALL OTGMR(OPCODE,ADDRD0)
      GOTO 10003
10005   CALL OTGLA0(ADDRD0)
      GOTO 10003
10006   IF((.NOT.MISSIN(OPCODE)))GOTO 10007
          CALL PANIC('otg: missin parm*n.')
10007   CALL OTG$L0(OPCODE)
      GOTO 10003
10008   IF((.NOT.MISSIN(EXTRA)))GOTO 10009
          CALL OTGMI0(OPCODE,ADDRD0)
          GOTO 10003
10009     CALL OTGMI0(OPCODE,ADDRD0,EXTRA)
10010 GOTO 10003
10011   IF((.NOT.MISSIN(OPCODE)))GOTO 10012
          CALL PANIC('otg: missin parm*n.')
10012   CALL OTGPS0(OPCODE)
      GOTO 10003
10000 GOTO(10001,10004,10005,10006,10008,10011),AAAAA0
        CALL PANIC('otg: bad instr type *i*n.',INSTR0)
10003 RETURN
      END
      SUBROUTINE OTGBR0(BRCODE,ADDR,REACH)
      INTEGER BRCODE,ADDR(5),REACH
      INTEGER BLOCK0(64)
      INTEGER FDAAA0
      INTEGER * 4 MARKA0,PROCS0,ENDMA0
      INTEGER EMITP0,EMITO0,PBHER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      COMMON /OTGCOM/BLOCK0,FDAAA0,MARKA0,PROCS0,ENDMA0,EMITP0,EMITO0,PB
     *HER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      INTEGER BRAD(5),BROFF0
      LOGICAL FWDREF
      IF((ADDR(1).NE.10))GOTO 10014
      IF((ADDR(2).NE.:000000))GOTO 10014
      GOTO 10013
10014   CALL PANIC('otg_branch: bad addr descr*n.')
10013 IF((REACH.NE.:111))GOTO 10015
        CALL GETLA0(ADDR,BRAD,FWDREF,1)
        CALL OTG$M0(BRCODE,:100000,:000000,BRAD(3),FWDREF)
        GOTO 10016
10015   CALL GETLA0(ADDR,BRAD,FWDREF)
        CALL OTG$D0(BRCODE,BRAD(3),FWDREF)
10016 RETURN
      END
      SUBROUTINE OTGLA0(ADDR)
      INTEGER ADDR(5)
      INTEGER BLOCK0(64)
      INTEGER FDAAA0
      INTEGER * 4 MARKA0,PROCS0,ENDMA0
      INTEGER EMITP0,EMITO0,PBHER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      COMMON /OTGCOM/BLOCK0,FDAAA0,MARKA0,PROCS0,ENDMA0,EMITP0,EMITO0,PB
     *HER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      INTEGER LABEL0
      INTEGER LAD(5),LOOKV0,LABEM0
      INTEGER AAAAB0
      IF((ADDR(1).EQ.10))GOTO 10018
        CALL PANIC('otg_label: bad addr descr*n.')
10018 LABEL0=ADDR(3)
      LABEM0=CURRE0
      IF((LOOKV0(LABEL0,LAD).NE.0))GOTO 10019
        LAD(1)=1
        LAD(2)=LABEM0
        AAAAB0=1
        GOTO 10017
10020   LAD(4)=1
        CALL ENTET0(LABEL0,LAD)
        GOTO 10021
10019   IF((LAD(4).NE.0))GOTO 10022
          CALL OTG$U0(LAD(2),LAD(3))
          CALL DELEU0(LABEL0)
          AAAAB0=2
          GOTO 10017
10023     LAD(4)=1
          CALL ENTET0(LABEL0,LAD)
          GOTO 10024
10022   CONTINUE
10024 CONTINUE
10021 RETURN
10017 IF((LABEM0.NE.:000000))GOTO 10025
        LAD(3)=PBHER0
        GOTO 10027
10025   LAD(3)=LBHER0
10026 GOTO 10027
10027 GOTO(10020,10023),AAAAB0
      GOTO 10027
      END
      SUBROUTINE OTGMR(OPCODE,ADDR)
      INTEGER OPCODE,ADDR(5)
      INTEGER BLOCK0(64)
      INTEGER FDAAA0
      INTEGER * 4 MARKA0,PROCS0,ENDMA0
      INTEGER EMITP0,EMITO0,PBHER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      COMMON /OTGCOM/BLOCK0,FDAAA0,MARKA0,PROCS0,ENDMA0,EMITP0,EMITO0,PB
     *HER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      INTEGER MROFF0,MRBASE,MODE,LOOKW0,MRAD(5)
      LOGICAL FWDREF
      INTEGER AAAAC0
      MROFF0=ADDR(3)
      MRBASE=ADDR(2)
      FWDREF=.FALSE.
      AAAAC0=ADDR(1)
      GOTO 10028
10029   MODE=:000000
      GOTO 10030
10031   MODE=:020000
      GOTO 10030
10032   MODE=:040000
      GOTO 10030
10033   MODE=:060000
      GOTO 10030
10034   MODE=:070000
      GOTO 10030
10035   MODE=:000000
        MRBASE=:000000
        CALL ZEROL0(ADDR)
        CALL GETLI0(ADDR,MRAD,FWDREF,:777)
        MROFF0=MRAD(3)
      GOTO 10030
10036   MODE=:000000
        CALL GETLA0(ADDR,MRAD,FWDREF)
        MRBASE=MRAD(2)
        MROFF0=MRAD(3)
      GOTO 10030
10028 GOTO(10029,10031,10032,10033,10034,10035,10035,10035,10035,10036),
     *AAAAC0
10030 IF((.NOT.FWDREF))GOTO 10037
      IF((MRBASE.NE.:000002))GOTO 10037
        MRBASE=:000000
10037 CALL OTG$M0(OPCODE,MODE,MRBASE,MROFF0,FWDREF)
      RETURN
      END
      SUBROUTINE OTGMI0(OPCODE,INSTS0,EXTRA)
      INTEGER OPCODE,INSTS0(5),EXTRA
      INTEGER BLOCK0(64)
      INTEGER FDAAA0
      INTEGER * 4 MARKA0,PROCS0,ENDMA0
      INTEGER EMITP0,EMITO0,PBHER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      COMMON /OTGCOM/BLOCK0,FDAAA0,MARKA0,PROCS0,ENDMA0,EMITP0,EMITO0,PB
     *HER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      INTEGER AD(5),LOOKU0,LOOKV0,BASE,LAD(5)
      LOGICAL FWDREF
      INTEGER AAAAD0
      INTEGER AAAAE0
      INTEGER AAAAF0
      AAAAD0=OPCODE
      GOTO 10038
10039   IF((EXTRA.NE.:707))GOTO 10040
          IF((LOOKU0(INSTS0,AD,FWDREF).NE.0))GOTO 10041
            CALL PANIC('otg_misc: IP to undef EXT name*n.')
            GOTO 10042
10041       CALL DELET0(INSTS0)
10042     CALL OTGPS0(1)
          CALL OTG$X0(INSTS0)
          GOTO 10047
10040     IF((INSTS0(1).EQ.10))GOTO 10044
            CALL PANIC('otg_misc: IP to bad obj descr*n.')
10044     CALL GETLA0(INSTS0,AD,FWDREF)
          IF((AD(2).NE.:000000))GOTO 10045
            CALL OTG$IP(AD(3),:47)
            GOTO 10046
10045       CALL OTG$IP(AD(3),:50)
10046   CONTINUE
10043 GOTO 10047
10048   ECBST0=LBHER0
        LAD(1)=10
        LAD(2)=:000000
        LAD(3)=INSTS0(1)
        CALL GETLA0(LAD,AD,FWDREF)
        CALL OTG$G0(AD(3),INSTS0(2),INSTS0(3),INSTS0(4),INSTS0(5),EXTRA)
      GOTO 10047
10049   CALL OTG$L0(OPCODE+AND(-EXTRA,:000077))
      GOTO 10047
10050   IF((LOOKV0(EXTRA,AD).NE.0))GOTO 10051
          CALL ENTER0(INSTS0,EXTRA)
          CALL OTG$J0(INSTS0,0)
          GOTO 10047
10051     CALL OTG$J0(INSTS0,AD(3))
10052 GOTO 10047
10053   AD(1)=3
        AD(2)=:000002
        AD(3)=LBHER0
        CALL ENTES0(INSTS0,AD)
      GOTO 10047
10054   AAAAE0=INSTS0(1)
        GOTO 10055
10056     CALL ZEROL0(INSTS0)
          CALL GETLI0(INSTS0,AD,FWDREF,:777)
          CALL OTG$AP(EXTRA,AD(2),AD(3),0,FWDREF)
        GOTO 10047
10058     CALL GETLA0(INSTS0,AD,FWDREF)
          CALL OTG$AP(EXTRA,AD(2),AD(3),0,FWDREF)
        GOTO 10047
10055   AAAAF0=AAAAE0-5
        GOTO(10056,10056,10056,10056,10058),AAAAF0
          CALL OTG$AP(EXTRA,INSTS0(2),INSTS0(3))
10057 GOTO 10047
10059   CALL OTG$F0(EXTRA,1)
      GOTO 10047
10060   CALL OTG$F0(0,EXTRA)
      GOTO 10047
10061   CALL GETLA0(INSTS0,AD,FWDREF,1)
        IF((AD(2).EQ.:000000))GOTO 10062
          CALL PANIC('otg_misc: bad DAC base*n.')
10062   CALL OTG$E0(AD(3),FWDREF)
      GOTO 10047
10063   CALL OTG$M0(:0001,:100000,:000000,PBHER0+EXTRA,.FALSE.)
      GOTO 10047
10064   CALL GETEX0(INSTS0,AD,FWDREF)
        CALL OTG$M0(:0214,:040000,AD(2),AD(3),FWDREF)
      GOTO 10047
10065   CALL GETEX0(INSTS0,AD,FWDREF)
        CALL OTG$M0(:0210,:040000,AD(2),AD(3),FWDREF)
      GOTO 10047
10038 GOTO(10050,10048,10066,10039,10053,10059,10060,10066,10066,10066, 
     *    10054,10063,10066,10061,10066,10066,10066,10064),AAAAD0
      IF(AAAAD0.EQ.136)GOTO 10065
      IF(AAAAD0.EQ.16384)GOTO 10049
      IF(AAAAD0.EQ.16448)GOTO 10049
      IF(AAAAD0.EQ.16640)GOTO 10049
      IF(AAAAD0.EQ.16704)GOTO 10049
      IF(AAAAD0.EQ.16896)GOTO 10049
      IF(AAAAD0.EQ.17152)GOTO 10049
10066   CALL PANIC('otg_misc: bad instr opcode *,-8i*n.',OPCODE)
10047 RETURN
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
C addrdesc                       addrd0
C loadrem                        loaep0
C putmoduleheader                putmo0
C mroffset                       mroff0
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
C instrclass                     instr0
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
C labelbase                      labem0
C loadconst                      loadk0
C loadmul                        loaeb0
C loadpostinc                    loaek0
C otg$ecb                        otg$g0
C putbranch                      putbr0
C resolvelit                     reson0
C voidfieldasgop                 voidf0
C EmitPMA                        emitp0
C getoffset                      getof0
C flowswitch                     flowv0
C loadconvert                    loadl0
C loadforloop                    loadv0
C loadsand                       loaev0
C optimize                       optim0
C rsvstack                       rsvst0
C voidaddaa                      voida0
C Block                          block0
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
C initotg                        inito0
C loadand                        loadc0
C loadsubaa                      loafb0
C otg$gen                        otg$l0
C rshiftlby                      rshig0
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
C instrinfo                      insts0
C andlwith                       andlw0
C loadnull                       loaeg0
C otg$entpb                      otg$k0
C reachderef                     reacj0
C broffset                       broff0
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
C Fd                             fdaaa0
C clearlab                       cleau0
C freestack                      frees0
C genextrtr                      genex0
C loadindex                      loadx0
C lookuplit                      lookw0
C otgbranch                      otgbr0
C LBhere                         lbher0
C loadpostdec                    loaej0
C otg$uii                        otg$v0
C afieldmask                     afiel0
C flowsor                        flowu0
C generateentries                gener0
C loaddefinedynm                 loadn0
