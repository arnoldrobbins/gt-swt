      INTEGER FUNCTION MULABY(CONST0)
      INTEGER CONST0
      INTEGER GENSH0,GENGE0,SEQ,GENMR,LSHIF0
      INTEGER AD(5)
      INTEGER AAAAA0
      INTEGER AAAAB0
      AAAAA0=CONST0
      GOTO 10000
10001   MULABY=GENGE0(98)
        RETURN
10002   MULABY=GENGE0(9)
        RETURN
10003   MULABY=0
        RETURN
10004   MULABY=LSHIF0(1)
        RETURN
10005   MULABY=LSHIF0(2)
        RETURN
10006   MULABY=LSHIF0(3)
        RETURN
10007   MULABY=LSHIF0(4)
        RETURN
10008   MULABY=LSHIF0(5)
        RETURN
10009   MULABY=LSHIF0(6)
        RETURN
10010   MULABY=LSHIF0(7)
        RETURN
10011   MULABY=LSHIF0(8)
        RETURN
10012   MULABY=LSHIF0(9)
        RETURN
10013   MULABY=LSHIF0(10)
        RETURN
10014   MULABY=LSHIF0(11)
        RETURN
10015   MULABY=LSHIF0(12)
        RETURN
10016   MULABY=LSHIF0(13)
        RETURN
10017   MULABY=LSHIF0(14)
        RETURN
10000 AAAAB0=AAAAA0+2
      GOTO(10001,10002,10003,10004,10018,10005,10018,10018,10018,10006, 
     *    10018,10018,10018,10018,10018,10018,10018,10007,10018,10018,  
     *   10018,10018,10018,10018,10018,10018,10018,10018,10018,10018,   
     *  10018,10018,10018,10008),AAAAB0
      IF(AAAAA0.EQ.64)GOTO 10009
      IF(AAAAA0.EQ.128)GOTO 10010
      IF(AAAAA0.EQ.256)GOTO 10011
      IF(AAAAA0.EQ.512)GOTO 10012
      IF(AAAAA0.EQ.1024)GOTO 10013
      IF(AAAAA0.EQ.2048)GOTO 10014
      IF(AAAAA0.EQ.4096)GOTO 10015
      IF(AAAAA0.EQ.8192)GOTO 10016
      IF(AAAAA0.EQ.16384)GOTO 10017
10018   IF((CONST0.NE.:100000))GOTO 10019
          MULABY=LSHIF0(15)
          RETURN
10019     AD(1)=6
          AD(2)=CONST0
          MULABY=SEQ(GENMR(43,AD),GENGE0(106))
          RETURN
      END
      INTEGER FUNCTION MULLBY(AMOUNT)
      INTEGER * 4 AMOUNT
      INTEGER LSHIG0,GENGE0,SEQ,GENMR
      INTEGER AD(5),POWER
      INTEGER * 4 KLUGE
      INTEGER * 4 POWER0(32)
      COMMON /PWR$CM/POWER0
      EQUIVALENCE (KLUGE,AD(2))
      POWER=0
      GOTO 10022
10020 POWER=POWER+(1)
10022 IF((POWER.GT.31))GOTO 10021
        IF((AMOUNT.NE.POWER0(POWER+1)))GOTO 10020
          MULLBY=LSHIG0(POWER)
          RETURN
10021 IF((AMOUNT.NE.-1))GOTO 10024
        MULLBY=GENGE0(99)
        RETURN
10024   IF((AMOUNT.NE.0))GOTO 10025
          MULLBY=GENGE0(12)
          RETURN
10025     AD(1)=7
          KLUGE=AMOUNT
          MULLBY=SEQ(GENMR(42,AD),GENGE0(33))
          RETURN
      END
      INTEGER FUNCTION DIVABY(AMOUNT,MODE)
      INTEGER AMOUNT
      INTEGER MODE
      INTEGER RSHIF0,SEQ,GENGE0,GENMR
      INTEGER AD(5)
      INTEGER AAAAC0
      INTEGER AAAAD0
      INTEGER AAAAE0
      INTEGER AAAAF0
      AAAAC0=AMOUNT
      GOTO 10026
10027   DIVABY=GENGE0(98)
        RETURN
10028   CALL WARNI0('divide by zero in input*n.')
        DIVABY=0
        RETURN
10029   DIVABY=0
        RETURN
10026 AAAAD0=AAAAC0+2
      GOTO(10027,10028,10029),AAAAD0
      IF((MODE.NE.3))GOTO 10030
        AAAAE0=AMOUNT
        GOTO 10031
10032     DIVABY=RSHIF0(1)
          RETURN
10033     DIVABY=RSHIF0(2)
          RETURN
10034     DIVABY=RSHIF0(3)
          RETURN
10035     DIVABY=RSHIF0(4)
          RETURN
10036     DIVABY=RSHIF0(5)
          RETURN
10037     DIVABY=RSHIF0(6)
          RETURN
10038     DIVABY=RSHIF0(7)
          RETURN
10039     DIVABY=RSHIF0(8)
          RETURN
10040     DIVABY=RSHIF0(9)
          RETURN
10041     DIVABY=RSHIF0(10)
          RETURN
10042     DIVABY=RSHIF0(11)
          RETURN
10043     DIVABY=RSHIF0(12)
          RETURN
10044     DIVABY=RSHIF0(13)
          RETURN
10045     DIVABY=RSHIF0(14)
          RETURN
10046     DIVABY=RSHIF0(15)
          RETURN
10031   IF(AAAAE0.EQ.-32768)GOTO 10046
        AAAAF0=AAAAE0-1
        GOTO(10032,10047,10033,10047,10047,10047,10034,10047,10047,10047
     *,10047,10047,10047,10047,10035),AAAAF0
        IF(AAAAE0.EQ.32)GOTO 10036
        IF(AAAAE0.EQ.64)GOTO 10037
        IF(AAAAE0.EQ.128)GOTO 10038
        IF(AAAAE0.EQ.256)GOTO 10039
        IF(AAAAE0.EQ.512)GOTO 10040
        IF(AAAAE0.EQ.1024)GOTO 10041
        IF(AAAAE0.EQ.2048)GOTO 10042
        IF(AAAAE0.EQ.4096)GOTO 10043
        IF(AAAAE0.EQ.8192)GOTO 10044
        IF(AAAAE0.EQ.16384)GOTO 10045
10047   CONTINUE
10030 AD(1)=6
      AD(2)=AMOUNT
      IF((MODE.NE.1))GOTO 10048
        DIVABY=SEQ(GENGE0(65),GENMR(15,AD))
        RETURN
10048   DIVABY=SEQ(GENGE0(105),GENMR(15,AD))
        RETURN
      END
      INTEGER FUNCTION DIVLBY(AMOUNT,MODE)
      INTEGER * 4 AMOUNT
      INTEGER MODE
      INTEGER RSHIG0,GENGE0,SEQ,GENMR
      INTEGER AD(5),POWER
      INTEGER * 4 KLUGE
      INTEGER * 4 POWER0(32)
      COMMON /PWR$CM/POWER0
      EQUIVALENCE (KLUGE,AD(2))
      IF((MODE.NE.3))GOTO 10049
        POWER=0
        GOTO 10052
10050   POWER=POWER+(1)
10052   IF((POWER.GT.31))GOTO 10051
          IF((AMOUNT.NE.POWER0(POWER+1)))GOTO 10050
            DIVLBY=RSHIG0(POWER)
            RETURN
10051 CONTINUE
10049 IF((AMOUNT.NE.-1))GOTO 10054
        DIVLBY=GENGE0(99)
        RETURN
10054   IF((AMOUNT.NE.0))GOTO 10055
          CALL WARNI0('divide by zero in input*n.')
          DIVLBY=0
          RETURN
10055     IF((AMOUNT.NE.1))GOTO 10056
            DIVLBY=0
            RETURN
10056       AD(1)=7
            KLUGE=AMOUNT
            IF((MODE.NE.1))GOTO 10057
              DIVLBY=SEQ(GENGE0(66),GENMR(16,AD))
              RETURN
10057       DIVLBY=SEQ(GENGE0(33),GENGE0(12),GENMR(16,AD))
            RETURN
      END
      INTEGER FUNCTION LSHIF0(AMOUNT)
      INTEGER AMOUNT
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
      INTEGER GENSH0,GENGE0,SEQ
      INTEGER AAAAG0
      INTEGER AAAAH0
      IF((AMOUNT.LE.15))GOTO 10058
        LSHIF0=GENGE0(9)
        RETURN
10058 IF((AMOUNT.GE.0))GOTO 10059
        CALL WARNI0('lshift_a_by: shift count < 0*n.')
        LSHIF0=0
        RETURN
10059 AAAAG0=AMOUNT
      GOTO 10060
10061   LSHIF0=0
        RETURN
10062   LSHIF0=GENSH0(3,AMOUNT)
        RETURN
10063   LSHIF0=GENGE0(32)
        RETURN
10064   LSHIF0=SEQ(GENGE0(32),GENSH0(3,AMOUNT-8))
        RETURN
10060 AAAAH0=AAAAG0+1
      GOTO(10061,10062,10062,10062,10062,10062,10062,10062,10063,10064, 
     *    10064,10064,10064,10064,10064,10064),AAAAH0
        CALL PANIC('lshift_a_by: shift count > 15*n.')
      END
      INTEGER FUNCTION LSHIG0(AMOUNT)
      INTEGER AMOUNT
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
      INTEGER GENSH0,GENGE0,SEQ
      INTEGER AAAAI0
      INTEGER AAAAJ0
      IF((AMOUNT.LE.31))GOTO 10065
        LSHIG0=GENGE0(12)
        RETURN
10065 IF((AMOUNT.GE.0))GOTO 10066
        CALL WARNI0('lshift_l_by: shift count < 0*n.')
        LSHIG0=0
        RETURN
10066 AAAAI0=AMOUNT
      GOTO 10067
10068   LSHIG0=0
        RETURN
10069   LSHIG0=GENSH0(8,AMOUNT)
        RETURN
10070   LSHIG0=GENGE0(106)
        RETURN
10071   LSHIG0=SEQ(GENGE0(106),GENSH0(3,AMOUNT-16))
        RETURN
10072   LSHIG0=SEQ(GENGE0(106),GENGE0(32))
        RETURN
10073   LSHIG0=SEQ(GENGE0(106),GENGE0(32),GENSH0(3,AMOUNT-24))
        RETURN
10067 AAAAJ0=AAAAI0+1
      GOTO(10068,10069,10069,10069,10069,10069,10069,10069,10069,10069, 
     *    10069,10069,10069,10069,10069,10069,10070,10071,10071,10071,  
     *   10071,10071,10071,10071,10072,10073,10073,10073,10073,10073,   
     *  10073,10073),AAAAJ0
        CALL PANIC('lshift_l_by: shift count > 31*n.')
      END
      INTEGER FUNCTION RSHIF0(AMOUNT)
      INTEGER AMOUNT
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
      INTEGER GENSH0,GENGE0,SEQ
      INTEGER AAAAK0
      INTEGER AAAAL0
      IF((AMOUNT.LE.15))GOTO 10074
        RSHIF0=GENGE0(9)
        RETURN
10074 IF((AMOUNT.GE.0))GOTO 10075
        CALL WARNI0('rshift_a_by: shift count < 0*n.')
        RSHIF0=0
        RETURN
10075 AAAAK0=AMOUNT
      GOTO 10076
10077   RSHIF0=0
        RETURN
10078   RSHIF0=GENSH0(9,AMOUNT)
        RETURN
10079   RSHIF0=GENGE0(31)
        RETURN
10080   RSHIF0=SEQ(GENGE0(31),GENSH0(9,AMOUNT-8))
        RETURN
10076 AAAAL0=AAAAK0+1
      GOTO(10077,10078,10078,10078,10078,10078,10078,10078,10079,10080, 
     *    10080,10080,10080,10080,10080,10080),AAAAL0
        CALL PANIC('rshift_a_by: shift count > 15*n.')
      END
      INTEGER FUNCTION RSHIG0(AMOUNT)
      INTEGER AMOUNT
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
      INTEGER GENSH0,GENGE0,SEQ
      INTEGER AAAAM0
      INTEGER AAAAN0
      IF((AMOUNT.LE.31))GOTO 10081
        RSHIG0=GENGE0(12)
        RETURN
10081 IF((AMOUNT.GE.0))GOTO 10082
        CALL WARNI0('rshift_l_by: shift count < 0*n.')
        RSHIG0=0
        RETURN
10082 AAAAM0=AMOUNT
      GOTO 10083
10084   RSHIG0=0
        RETURN
10085   RSHIG0=GENSH0(10,AMOUNT)
        RETURN
10086   RSHIG0=GENGE0(105)
        RETURN
10087   RSHIG0=SEQ(GENGE0(105),GENSH0(10,AMOUNT-16))
        RETURN
10083 AAAAN0=AAAAM0+1
      GOTO(10084,10085,10085,10085,10085,10085,10085,10085,10085,10085, 
     *    10085,10085,10085,10085,10085,10085,10086,10087,10087,10087,  
     *   10087,10087,10087,10087,10087,10087,10087,10087,10087,10087,   
     *  10087,10087),AAAAN0
        CALL PANIC('rshift_l_by: shift count > 31*n.')
      END
      INTEGER FUNCTION ARSHI0(AMOUNT)
      INTEGER AMOUNT
      INTEGER GENSH0
      IF((AMOUNT.LT.0))GOTO 10089
      IF((AMOUNT.GT.16))GOTO 10089
      GOTO 10088
10089   CALL WARNI0('arshift_a_by: shift count out of range*n.')
        ARSHI0=0
        RETURN
10088 IF((AMOUNT.NE.0))GOTO 10090
        ARSHI0=0
        RETURN
10090 ARSHI0=GENSH0(15,AMOUNT)
      RETURN
      END
      INTEGER FUNCTION ARSHJ0(AMOUNT)
      INTEGER AMOUNT
      INTEGER GENSH0
      IF((AMOUNT.LT.0))GOTO 10092
      IF((AMOUNT.GT.32))GOTO 10092
      GOTO 10091
10092   CALL WARNI0('arshift_l_by: shift count out of range*n.')
        ARSHJ0=0
        RETURN
10091 IF((AMOUNT.NE.0))GOTO 10093
        ARSHJ0=0
        RETURN
10093 ARSHJ0=GENSH0(16,AMOUNT)
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
C constant                       const0
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
C powersoftwo                    power0
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
