      SUBROUTINE CLEAY0
      INTEGER OBSAA0,OBSTA0(100),NEXTL0
      INTEGER FSIZE0,OBSIZ0(100)
      COMMON /FRAME0/OBSAA0,OBSTA0,FSIZE0,OBSIZ0,NEXTL0
      OBSAA0=0
      FSIZE0=34
      RETURN
      END
      SUBROUTINE CLEAV0
      INTEGER OBSAA0,OBSTA0(100),NEXTL0
      INTEGER FSIZE0,OBSIZ0(100)
      COMMON /FRAME0/OBSAA0,OBSTA0,FSIZE0,OBSIZ0,NEXTL0
      NEXTL0=:400
      RETURN
      END
      INTEGER FUNCTION RSVST0(SIZE)
      INTEGER SIZE
      INTEGER OBSAA0,OBSTA0(100),NEXTL0
      INTEGER FSIZE0,OBSIZ0(100)
      COMMON /FRAME0/OBSAA0,OBSTA0,FSIZE0,OBSIZ0,NEXTL0
      INTEGER I,J
      INTEGER OFFSET
      OFFSET=34
      I=1
      GOTO 10002
10000 I=I+(1)
10002 IF((I.GT.OBSAA0))GOTO 10001
        IF((OBSTA0(I).NE.1))GOTO 10003
          IF((OBSIZ0(I).NE.SIZE))GOTO 10004
            OBSTA0(I)=0
            RSVST0=OFFSET
            RETURN
10004       IF((RT(INTL(OBSIZ0(I)),16).LE.RT(INTL(SIZE),16)))GOTO 10005
              J=OBSAA0+1
              GOTO 10008
10006         J=J-(1)
10008         IF((J.LE.I))GOTO 10007
                OBSIZ0(J)=OBSIZ0(J-1)
                OBSTA0(J)=OBSTA0(J-1)
              GOTO 10006
10007         OBSAA0=OBSAA0+(1)
              OBSTA0(I)=0
              OBSIZ0(I)=SIZE
              OBSIZ0(I+1)=OBSIZ0(I+1)-(SIZE)
              RSVST0=OFFSET
              RETURN
10005     CONTINUE
10003   OFFSET=OFFSET+(OBSIZ0(I))
      GOTO 10000
10001 IF((OBSAA0.EQ.0))GOTO 10009
      IF((OBSTA0(OBSAA0).NE.1))GOTO 10009
        OFFSET=OFFSET-(OBSIZ0(OBSAA0))
        FSIZE0=FSIZE0+(SIZE-OBSIZ0(OBSAA0))
        OBSIZ0(OBSAA0)=SIZE
        OBSTA0(OBSAA0)=0
        RSVST0=OFFSET
        RETURN
10009 IF((OBSAA0.LT.100))GOTO 10010
        CALL WARNI0('too many objects allocated in stack frame*n.')
        RSVST0=0
        RETURN
10010 IF((RT(INTL(OFFSET),16)+RT(INTL(SIZE),16).LE.65535))GOTO 10011
        CALL WARNI0('stack frame too small to meet storage request*n.')
        RSVST0=0
        RETURN
10011 OBSAA0=OBSAA0+(1)
      FSIZE0=FSIZE0+(SIZE)
      OBSIZ0(OBSAA0)=SIZE
      OBSTA0(OBSAA0)=0
      RSVST0=OFFSET
      RETURN
      END
      INTEGER FUNCTION RSVLI0(SIZE)
      INTEGER SIZE
      INTEGER OBSAA0,OBSTA0(100),NEXTL0
      INTEGER FSIZE0,OBSIZ0(100)
      COMMON /FRAME0/OBSAA0,OBSTA0,FSIZE0,OBSIZ0,NEXTL0
      IF((RT(INTL(NEXTL0),16)+RT(INTL(SIZE),16).LE.65535))GOTO 10012
        CALL WARNI0('link frame too small to meet storage request*n.')
        RSVLI0=0
        RETURN
10012 RSVLI0=NEXTL0
      NEXTL0=NEXTL0+(SIZE)
      RETURN
      END
      INTEGER FUNCTION STACK0(SIZE)
      INTEGER SIZE
      INTEGER OBSAA0,OBSTA0(100),NEXTL0
      INTEGER FSIZE0,OBSIZ0(100)
      COMMON /FRAME0/OBSAA0,OBSTA0,FSIZE0,OBSIZ0,NEXTL0
      SIZE=FSIZE0
      STACK0=FSIZE0
      RETURN
      END
      INTEGER FUNCTION LINKS0(SIZE)
      INTEGER SIZE
      INTEGER OBSAA0,OBSTA0(100),NEXTL0
      INTEGER FSIZE0,OBSIZ0(100)
      COMMON /FRAME0/OBSAA0,OBSTA0,FSIZE0,OBSIZ0,NEXTL0
      SIZE=NEXTL0-:400
      LINKS0=SIZE
      RETURN
      END
      SUBROUTINE FREES0(OBJ)
      INTEGER OBJ
      INTEGER OBSAA0,OBSTA0(100),NEXTL0
      INTEGER FSIZE0,OBSIZ0(100)
      COMMON /FRAME0/OBSAA0,OBSTA0,FSIZE0,OBSIZ0,NEXTL0
      INTEGER I,J
      INTEGER OFFSET
      OFFSET=34
      I=1
      GOTO 10015
10013 I=I+(1)
10015 IF((I.GT.OBSAA0))GOTO 10014
        IF((OFFSET.NE.OBJ))GOTO 10016
          OBSTA0(I)=1
          IF((I.GE.OBSAA0))GOTO 10017
          IF((OBSTA0(I+1).NE.1))GOTO 10017
            OBSIZ0(I)=OBSIZ0(I)+(OBSIZ0(I+1))
            J=I+1
            GOTO 10020
10018       J=J+(1)
10020       IF((J.GE.OBSAA0))GOTO 10019
              OBSIZ0(J)=OBSIZ0(J+1)
              OBSTA0(J)=OBSTA0(J+1)
            GOTO 10018
10019       OBSAA0=OBSAA0-(1)
10017     IF((I.LE.1))GOTO 10021
          IF((OBSTA0(I-1).NE.1))GOTO 10021
            OBSIZ0(I-1)=OBSIZ0(I-1)+(OBSIZ0(I))
            J=I
            GOTO 10024
10022       J=J+(1)
10024       IF((J.GE.OBSAA0))GOTO 10023
              OBSIZ0(J)=OBSIZ0(J+1)
              OBSTA0(J)=OBSTA0(J+1)
            GOTO 10022
10023       OBSAA0=OBSAA0-(1)
10021     RETURN
10016   OFFSET=OFFSET+(OBSIZ0(I))
      GOTO 10013
10014 CALL WARNI0('attempt to free bogus local object at *,-10i*n.',OBJ)
      RETURN
      END
      SUBROUTINE ALLOC0(SIZE,AD)
      INTEGER SIZE
      INTEGER AD(5)
      INTEGER RSVST0
      AD(1)=1
      AD(2)=:000001
      AD(3)=RSVST0(SIZE)
      AD(4)=1
      RETURN
      END
      SUBROUTINE FREET0(AD)
      INTEGER AD(5)
      CALL FREES0(AD(3))
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
C loadconst                      loadk0
C loadmul                        loaeb0
C loadpostinc                    loaek0
C otg$ecb                        otg$g0
C putbranch                      putbr0
C resolvelit                     reson0
C voidfieldasgop                 voidf0
C Obsize                         obsiz0
C flowswitch                     flowv0
C loadconvert                    loadl0
C loadforloop                    loadv0
C loadsand                       loaev0
C optimize                       optim0
C rsvstack                       rsvst0
C voidaddaa                      voida0
C Obstat                         obsta0
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
C Nextlink                       nextl0
C clearent                       clear0
C loadbreak                      loadf0
C loaddivaa                      loadr0
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
C clearext                       cleas0
C flfield                        flfie0
C flowseq                        flowt0
C freetemp                       freet0
C genshift                       gensh0
C otg$orglb                      otg$o0
C otgpseudo                      otgps0
C reachassign                    reach0
C Obs                            obsaa0
C enterobj                       entev0
C loadgoto                       loadw0
C loadmulaa                      loaec0
C loadswitch                     loafc0
C putlabel                       putla0
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
C Fsize                          fsize0
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
