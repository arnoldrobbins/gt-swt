      SUBROUTINE CLEAW0
      INTEGER LMEMA0(4096)
      INTEGER LFREE0,LNEXT0
      COMMON /LITCOM/LMEMA0,LFREE0,LNEXT0
      INTEGER I
      I=1
      GOTO 10002
10000 I=I+(1)
10002 IF((I.GT.43))GOTO 10001
        LMEMA0(I)=0
      GOTO 10000
10001 LFREE0=0
      LNEXT0=43+1
      RETURN
      END
      SUBROUTINE ENTEU0(LIT,AD)
      INTEGER LIT(5),AD(5)
      INTEGER LMEMA0(4096)
      INTEGER LFREE0,LNEXT0
      COMMON /LITCOM/LMEMA0,LFREE0,LNEXT0
      INTEGER PTR,PRED
      INTEGER I,J,LIT$01
      IF((LIT$01(LIT,PTR,PRED).NE.0))GOTO 10003
        IF((LFREE0.EQ.0))GOTO 10004
          PTR=LFREE0
          LFREE0=LMEMA0(LFREE0)
          GOTO 10005
10004     IF((LNEXT0+1+2*5.LE.4096))GOTO 10006
            CALL PANIC('enter_lit: out of space*nincrease MAX_LIT_MEMORY
     * in otg_def@.r@.i*n.')
10006     PTR=LNEXT0
          LNEXT0=LNEXT0+(1+2*5)
10005   LMEMA0(PTR)=0
        LMEMA0(PRED)=PTR
        J=PTR+1
        I=1
        GOTO 10009
10007   I=I+(1)
        J=J+(1)
10009   IF((I.GT.5))GOTO 10008
          LMEMA0(J)=LIT(I)
        GOTO 10007
10008 CONTINUE
10003 J=PTR+5+1
      I=1
      GOTO 10012
10010 I=I+(1)
      J=J+(1)
10012 IF((I.GT.5))GOTO 10011
        LMEMA0(J)=AD(I)
      GOTO 10010
10011 RETURN
      END
      INTEGER FUNCTION LIT$01(LIT,PTR,PRED)
      INTEGER LIT(5)
      INTEGER PTR,PRED
      INTEGER LMEMA0(4096)
      INTEGER LFREE0,LNEXT0
      COMMON /LITCOM/LMEMA0,LFREE0,LNEXT0
      INTEGER HASH
      HASH=LIT(2)+LIT(3)
      PRED=MOD(IABS(HASH),43)+1
      PTR=LMEMA0(PRED)
10013 IF((PTR.EQ.0))GOTO 10014
        IF((LMEMA0(PTR+1).NE.LIT(1)))GOTO 10016
        IF((LMEMA0(PTR+2).NE.LIT(2)))GOTO 10016
        IF((LMEMA0(PTR+3).NE.LIT(3)))GOTO 10016
        IF((LMEMA0(PTR+4).NE.LIT(4)))GOTO 10016
        IF((LMEMA0(PTR+5).NE.LIT(5)))GOTO 10016
        GOTO 10014
10016     PRED=PTR
          PTR=LMEMA0(PTR)
          GOTO 10013
10014 IF((PTR.NE.0))GOTO 10018
        LIT$01=0
        RETURN
10018   LIT$01=1
        RETURN
      END
      INTEGER FUNCTION LOOKW0(LIT,AD)
      INTEGER LIT(5),AD(5)
      INTEGER LMEMA0(4096)
      INTEGER LFREE0,LNEXT0
      COMMON /LITCOM/LMEMA0,LFREE0,LNEXT0
      INTEGER I,J
      INTEGER LIT$01
      INTEGER PTR,PRED
      IF((LIT$01(LIT,PTR,PRED).NE.0))GOTO 10019
        LOOKW0=0
        RETURN
10019   J=PTR+1+5
        I=1
        GOTO 10022
10020   I=I+(1)
        J=J+(1)
10022   IF((I.GT.5))GOTO 10021
          AD(I)=LMEMA0(J)
        GOTO 10020
10021   LOOKW0=1
        RETURN
      END
      SUBROUTINE DELEV0(LIT)
      INTEGER LIT(5)
      INTEGER LMEMA0(4096)
      INTEGER LFREE0,LNEXT0
      COMMON /LITCOM/LMEMA0,LFREE0,LNEXT0
      INTEGER LIT$01
      INTEGER PTR,PRED
      IF((LIT$01(LIT,PTR,PRED).NE.1))GOTO 10023
        LMEMA0(PRED)=LMEMA0(PTR)
        LMEMA0(PTR)=LFREE0
        LFREE0=PTR
10023 RETURN
      END
      INTEGER FUNCTION RESON0(LIT,AD)
      INTEGER LIT(5),AD(5)
      INTEGER LMEMA0(4096)
      INTEGER LFREE0,LNEXT0
      COMMON /LITCOM/LMEMA0,LFREE0,LNEXT0
      INTEGER I,J,PTR
      J=1
      GOTO 10026
10024 J=J+(1)
10026 IF((J.GT.43))GOTO 10025
        PTR=LMEMA0(J)
10027   IF((PTR.EQ.0))GOTO 10028
        IF((LMEMA0(PTR+9).NE.1))GOTO 10028
          PTR=LMEMA0(PTR)
        GOTO 10027
10028   IF((PTR.EQ.0))GOTO 10024
          LMEMA0(PTR+9)=1
          PTR=PTR+(1)
          I=1
          GOTO 10032
10030     I=I+(1)
          PTR=PTR+(1)
10032     IF((I.GT.5))GOTO 10031
            LIT(I)=LMEMA0(PTR)
          GOTO 10030
10031     I=1
          GOTO 10035
10033     I=I+(1)
          PTR=PTR+(1)
10035     IF((I.GT.5))GOTO 10034
            AD(I)=LMEMA0(PTR)
          GOTO 10033
10034     RESON0=1
          RETURN
10025 RESON0=0
      RETURN
      END
      SUBROUTINE GETLI0(LITDE0,ADDR,FWDREF,REACH)
      INTEGER LITDE0(5),ADDR(5),REACH
      LOGICAL FWDREF
      INTEGER BLOCK0(64)
      INTEGER FDAAA0
      INTEGER * 4 MARKA0,PROCS0,ENDMA0
      INTEGER EMITP0,EMITO0,PBHER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      COMMON /OTGCOM/BLOCK0,FDAAA0,MARKA0,PROCS0,ENDMA0,EMITP0,EMITO0,PB
     *HER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      INTEGER LAD(5)
      FWDREF=.FALSE.
      IF((LOOKW0(LITDE0,LAD).NE.0))GOTO 10036
        LAD(1)=1
        LAD(2)=:000000
        LAD(3)=PBHER0
        IF((REACH.NE.:777))GOTO 10037
          LAD(3)=LAD(3)+(1)
10037   LAD(4)=0
        ADDR(3)=0
        FWDREF=.TRUE.
        CALL ENTEU0(LITDE0,LAD)
        GOTO 10038
10036   IF((LAD(4).NE.0))GOTO 10039
          CALL DELEV0(LITDE0)
          ADDR(3)=LAD(3)
          LAD(3)=PBHER0
          IF((REACH.NE.:777))GOTO 10040
            LAD(3)=LAD(3)+(1)
10040     FWDREF=.TRUE.
          CALL ENTEU0(LITDE0,LAD)
          GOTO 10041
10039     ADDR(3)=LAD(3)
10041 CONTINUE
10038 ADDR(2)=:000000
      ADDR(1)=1
      RETURN
      END
      SUBROUTINE CLEAS0
      INTEGER NNEXT0,NFREE0
      INTEGER NMEMA0(2048)
      COMMON /EXTCOM/NNEXT0,NFREE0,NMEMA0
      INTEGER I
      I=1
      GOTO 10044
10042 I=I+(1)
10044 IF((I.GT.29))GOTO 10043
        NMEMA0(I)=0
      GOTO 10042
10043 NFREE0=0
      NNEXT0=29+1
      RETURN
      END
      SUBROUTINE ENTES0(NAME,ADDR)
      INTEGER NAME(1)
      INTEGER ADDR(1)
      INTEGER NNEXT0,NFREE0
      INTEGER NMEMA0(2048)
      COMMON /EXTCOM/NNEXT0,NFREE0,NMEMA0
      INTEGER I,J,EXT$01,PRED,PTR,LENGTH,LEN
      IF((EXT$01(NAME,PTR,PRED).NE.0))GOTO 10045
        IF((NFREE0.EQ.0))GOTO 10046
          PTR=NFREE0
          NFREE0=NMEMA0(NFREE0)
          GOTO 10047
10046     IF((NNEXT0+1+33+5.LE.2048))GOTO 10048
            CALL PANIC('enter_ext: out of space*nincrease MAX_EXT_MEMORY
     * in otg_def@.r@.i*n.')
10048     PTR=NNEXT0
          NNEXT0=NNEXT0+(1+33+5)
10047   LEN=LENGTH(NAME)+1
        J=PTR+1
        I=1
        GOTO 10051
10049   I=I+(1)
        J=J+(1)
10051   IF((I.GT.LEN))GOTO 10050
          NMEMA0(J)=NAME(I)
        GOTO 10049
10050   J=PTR+1+33
        I=1
        GOTO 10054
10052   I=I+(1)
        J=J+(1)
10054   IF((I.GT.5))GOTO 10053
          NMEMA0(J)=ADDR(I)
        GOTO 10052
10053   NMEMA0(PTR)=0
        NMEMA0(PRED)=PTR
10045 RETURN
      END
      SUBROUTINE DELET0(NAME)
      INTEGER NAME(1)
      INTEGER NNEXT0,NFREE0
      INTEGER NMEMA0(2048)
      COMMON /EXTCOM/NNEXT0,NFREE0,NMEMA0
      INTEGER EXT$01
      INTEGER PTR,PRED
      IF((EXT$01(NAME,PTR,PRED).NE.1))GOTO 10055
        NMEMA0(PRED)=NMEMA0(PTR)
        NMEMA0(PTR)=NFREE0
        NFREE0=PTR
10055 RETURN
      END
      INTEGER FUNCTION EXT$01(NAME,PTR,PRED)
      INTEGER NAME(1)
      INTEGER PRED,PTR
      INTEGER NNEXT0,NFREE0
      INTEGER NMEMA0(2048)
      COMMON /EXTCOM/NNEXT0,NFREE0,NMEMA0
      INTEGER I,HASH,MOD,STRCMP
      HASH=0
      I=1
      GOTO 10058
10056 I=I+(1)
10058 IF((NAME(I).EQ.0))GOTO 10057
        HASH=MOD((HASH+NAME(I)),29)+1
      GOTO 10056
10057 PRED=HASH
      PTR=NMEMA0(HASH)
10059 IF((PTR.EQ.0))GOTO 10060
        IF((STRCMP(NAME,NMEMA0(PTR+1)).EQ.2))GOTO 10060
          PRED=PTR
          PTR=NMEMA0(PTR)
          GOTO 10059
10060 IF((PTR.NE.0))GOTO 10063
        EXT$01=0
        RETURN
10063   EXT$01=1
        RETURN
      END
      INTEGER FUNCTION LOOKU0(NAME,AD)
      INTEGER NAME(1)
      INTEGER AD(5)
      INTEGER NNEXT0,NFREE0
      INTEGER NMEMA0(2048)
      COMMON /EXTCOM/NNEXT0,NFREE0,NMEMA0
      INTEGER EXT$01,PRED,PTR,LENGTH,I
      IF((EXT$01(NAME,PTR,PRED).NE.0))GOTO 10064
        LOOKU0=0
        RETURN
10064   PTR=PTR+(1+33)
        I=1
        GOTO 10067
10065   I=I+(1)
        PTR=PTR+(1)
10067   IF((I.GT.5))GOTO 10066
          AD(I)=NMEMA0(PTR)
        GOTO 10065
10066   LOOKU0=1
        RETURN
      END
      INTEGER FUNCTION RESOM0(NAME,ADDR)
      INTEGER NAME(1),ADDR(5)
      INTEGER NNEXT0,NFREE0
      INTEGER NMEMA0(2048)
      COMMON /EXTCOM/NNEXT0,NFREE0,NMEMA0
      INTEGER I,J,PTR
      J=1
      GOTO 10070
10068 J=J+(1)
10070 IF((J.GT.29))GOTO 10069
        PTR=NMEMA0(J)
10071   IF((PTR.EQ.0))GOTO 10072
        IF((NMEMA0(PTR+1+33+3).NE.1))GOTO 10072
          PTR=NMEMA0(PTR)
        GOTO 10071
10072   IF((PTR.EQ.0))GOTO 10068
          I=1
          J=PTR+1
          GOTO 10076
10074     I=I+(1)
          J=J+(1)
10076     IF((I.GT.33))GOTO 10075
            NAME(I)=NMEMA0(J)
          GOTO 10074
10075     PTR=PTR+(1+33)
          NMEMA0(PTR+3)=1
          I=1
          GOTO 10079
10077     I=I+(1)
          PTR=PTR+(1)
10079     IF((I.GT.5))GOTO 10078
            ADDR(I)=NMEMA0(PTR)
          GOTO 10077
10078     RESOM0=1
          RETURN
10069 RESOM0=0
      RETURN
      END
      SUBROUTINE GETEX0(NAME,ADDR,FWDREF)
      INTEGER NAME(1),ADDR(5)
      LOGICAL FWDREF
      INTEGER BLOCK0(64)
      INTEGER FDAAA0
      INTEGER * 4 MARKA0,PROCS0,ENDMA0
      INTEGER EMITP0,EMITO0,PBHER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      COMMON /OTGCOM/BLOCK0,FDAAA0,MARKA0,PROCS0,ENDMA0,EMITP0,EMITO0,PB
     *HER0,LBHER0,CURRE0,RESOO0,ECBST0,DATAP0
      INTEGER AD(5)
      FWDREF=.FALSE.
      IF((LOOKU0(NAME,AD).NE.0))GOTO 10080
        AD(1)=3
        AD(2)=:000002
        AD(3)=PBHER0
        AD(4)=0
        ADDR(3)=0
        FWDREF=.TRUE.
        CALL ENTES0(NAME,AD)
        GOTO 10081
10080   IF((AD(4).NE.0))GOTO 10082
          CALL DELET0(NAME)
          ADDR(3)=AD(3)
          AD(3)=PBHER0
          FWDREF=.TRUE.
          CALL ENTES0(NAME,AD)
          GOTO 10083
10082     ADDR(3)=AD(3)
10083 CONTINUE
10081 ADDR(2)=:000002
      ADDR(1)=3
      RETURN
      END
      SUBROUTINE CLEAR0
      INTEGER ENEXT0
      INTEGER EMEMA0(4096)
      COMMON /ENTCOM/ENEXT0,EMEMA0
      EMEMA0(1)=0
      ENEXT0=2
      RETURN
      END
      SUBROUTINE ENTER0(NAME,OBJID)
      INTEGER NAME(1)
      INTEGER OBJID
      INTEGER ENEXT0
      INTEGER EMEMA0(4096)
      COMMON /ENTCOM/ENEXT0,EMEMA0
      INTEGER I,J,ENT$01,PRED,PTR,LENGTH,LEN
      IF((ENT$01(NAME,PRED).NE.0))GOTO 10084
        IF((ENEXT0+1+33+1.LE.4096))GOTO 10085
          CALL PANIC('enter_ent: out of space*nincrease MAX_ENT_MEMORY i
     *n otg_def@.r@.i*n.')
10085   PTR=ENEXT0
        ENEXT0=ENEXT0+(1+33+1)
        LEN=LENGTH(NAME)+1
        J=PTR+1
        I=1
        GOTO 10088
10086   I=I+(1)
        J=J+(1)
10088   IF((I.GT.LEN))GOTO 10087
          EMEMA0(J)=NAME(I)
        GOTO 10086
10087   EMEMA0(PTR+1+33)=OBJID
        EMEMA0(PTR)=0
        EMEMA0(PRED)=PTR
10084 RETURN
      END
      INTEGER FUNCTION ENT$01(NAME,PRED)
      INTEGER NAME(1)
      INTEGER PRED
      INTEGER ENEXT0
      INTEGER EMEMA0(4096)
      COMMON /ENTCOM/ENEXT0,EMEMA0
      INTEGER STRCMP,PTR,I
      PRED=1
      PTR=EMEMA0(1)
10089 IF((PTR.EQ.0))GOTO 10090
        IF((STRCMP(NAME,EMEMA0(PTR+1)).EQ.2))GOTO 10090
          PRED=PTR
          PTR=EMEMA0(PTR)
          GOTO 10089
10090 IF((PTR.NE.0))GOTO 10093
        ENT$01=0
        RETURN
10093   ENT$01=1
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
C Lnext                          lnext0
C enterlit                       enteu0
C generatestaticstuff            geneu0
C loadchecklower                 loadg0
C loaddefinestat                 loado0
C loadreturn                     loaer0
C setupswitch                    setuq0
C Lmem                           lmema0
C Mark                           marka0
C Nnext                          nnext0
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
C litdesc                        litde0
C Nmem                           nmema0
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
C Lfree                          lfree0
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
C Nfree                          nfree0
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
C LBhere                         lbher0
C Emem                           emema0
C loadpostdec                    loaej0
C otg$uii                        otg$v0
C afieldmask                     afiel0
C flowsor                        flowu0
C generateentries                gener0
C loaddefinedynm                 loadn0
