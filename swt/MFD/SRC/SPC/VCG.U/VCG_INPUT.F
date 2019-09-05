      SUBROUTINE GETTR0(ROOT)
      INTEGER ROOT
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
      INTEGER POSN(73)
      INTEGER INFO(415)
      INTEGER OP,P,P2,SIZE,WORD,SP
      INTEGER T
      INTEGER TALLOC
      INTEGER STRSA0
      INTEGER STR(102)
      SAVE STR
      INTEGER AAAAA0
      INTEGER AAAAB0
      DATA INFO/1,4,1,3,3,5,2,4,1,3,3,5,3,4,1,3,3,5,4,4,1,3,3,5,5,5,1,3,
     *3,1,5,6,2,1,5,7,4,3,3,3,5,8,3,1,3,5,9,0,4,5,10,4,1,1,3,5,11,3,1,6,
     *5,12,3,3,3,5,13,4,1,3,2,5,14,4,1,3,2,5,15,3,1,3,5,16,4,1,3,3,5,17,
     *4,1,3,3,5,18,3,3,3,5,19,4,1,3,3,5,20,5,3,3,3,3,5,21,4,1,3,3,5,22,2
     *,1,5,23,4,1,3,3,5,24,5,1,3,3,3,5,25,5,1,3,3,2,5,26,4,1,3,3,5,27,2,
     *1,5,28,4,1,3,3,5,29,4,1,3,3,5,30,4,1,3,3,5,31,4,1,3,3,5,32,1,4,5,3
     *3,4,1,3,3,5,34,4,1,3,3,5,35,3,1,3,5,36,2,1,5,37,4,1,3,3,5,38,3,1,3
     *,5,39,1,4,5,40,3,1,1,5,41,4,1,3,3,5,42,4,1,3,3,5,43,4,1,3,3,5,44,4
     *,1,3,3,5,45,4,1,3,3,5,46,4,1,3,3,5,47,4,1,3,3,5,48,4,1,3,3,5,49,6,
     *1,1,1,1,3,5,50,6,1,1,6,3,3,5,51,3,1,3,5,52,4,1,3,3,5,53,4,1,3,3,5,
     *54,2,3,5,55,4,1,3,3,5,56,4,1,3,3,5,57,4,1,3,3,5,58,4,1,1,3,5,59,3,
     *3,3,5,60,4,1,3,3,5,61,4,1,3,3,5,62,4,1,3,3,5,63,4,1,3,3,5,64,2,1,5
     *,65,3,3,3,5,66,4,1,3,3,5,67,4,1,3,3,5,68,3,2,3,5,69,5,1,1,1,3,5,70
     *,6,1,3,3,3,1,5,71,5,1,3,3,1,5,72,5,1,3,3,1,5/
      DATA POSN/72,1,7,13,19,25,32,36,42,47,51,57,62,67,73,79,84,90,96,1
     *01,107,114,120,124,130,137,144,150,154,160,166,172,178,182,188,194
     *,199,203,209,214,218,223,229,235,241,247,253,259,265,271,279,287,2
     *92,298,304,308,314,320,326,332,337,343,349,355,361,365,370,376,382
     *,387,394,402,409/
      CALL GET(OP)
      IF((OP.LT.1))GOTO 10001
      IF((OP.GT.72))GOTO 10001
      GOTO 10000
10001   CALL PANIC('in get_tree:  bad operator (*i)*n.',OP)
10000 AAAAA0=OP
      GOTO 10002
10003   CALL GET(WORD)
        CALL GET(SIZE)
        T=TALLOC(3+SIZE)
        ROOT=T
        TMEMA0(T)=9
        TMEMA0(T+1)=WORD
        TMEMA0(T+2)=SIZE
        T=T+(3)
        GOTO 10006
10004   SIZE=SIZE-(1)
        T=T+(1)
10006   IF((SIZE.LE.0))GOTO 10005
          CALL GET(TMEMA0(T))
        GOTO 10004
10005   RETURN
10007   ROOT=0
        RETURN
10002 IF(AAAAA0.EQ.9)GOTO 10003
      IF(AAAAA0.EQ.39)GOTO 10007
      P=POSN(OP+1)
      IF((INFO(P).EQ.OP))GOTO 10008
        CALL PANIC('in get_tree:  table inconsistency at *i*n.',OP)
10008 SIZE=INFO(P+1)
      T=TALLOC(SIZE)
      ROOT=T
      TMEMA0(T)=OP
      T=T+(1)
      P2=P+2
      GOTO 10011
10009 P2=P2+(1)
10011 IF((INFO(P2).EQ.5))GOTO 10010
        AAAAB0=INFO(P2)
        GOTO 10012
10013     CALL GET(TMEMA0(T))
          T=T+(1)
        GOTO 10009
10015     CALL GETTR0(TMEMA0(T))
          T=T+(1)
        GOTO 10009
10016     CALL GET(SIZE)
          SIZE=SIZE+(1)
          IF((SIZE.LT.0))GOTO 10018
          IF((SIZE.GT.102))GOTO 10018
          GOTO 10017
10018       CALL PANIC('in get_tree:  string to long to handle*n.')
10017     SP=1
          GOTO 10021
10019     SP=SP+(1)
10021     IF((SP.GE.SIZE))GOTO 10020
            CALL GET(STR(SP))
          GOTO 10019
10020     STR(SIZE)=0
          TMEMA0(T)=STRSA0(STR)
          T=T+(1)
        GOTO 10009
10012   GOTO(10013,10013,10015,10022,10022,10016),AAAAB0
10022     CALL PANIC('bad table element in get_tree*n.')
10014 GOTO 10009
10010 RETURN
      END
      INTEGER FUNCTION GET(WORD)
      INTEGER WORD
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
      INTEGER READF
      IF((READF(WORD,1,INFIL0).NE.-1))GOTO 10023
        CALL WARNI0('unexpected EOF in input stream*n.')
        WORD=39
        GET=39
        RETURN
10023 GET=WORD
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
