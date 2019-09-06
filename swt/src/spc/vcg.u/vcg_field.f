      INTEGER FUNCTION LDFIE0(FLD,REGS)
      INTEGER FLD
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
      INTEGER LENGTH,OFFSET,BAD(5),RES,AMASK
      INTEGER * 4 LMASK
      INTEGER C
      INTEGER REACH,SEQ,GENMR,RSHIG0,LSHIG0,RSHIF0,ANDAW0,ANDLW0
      LENGTH=TMEMA0(FLD+3)
      OFFSET=TMEMA0(FLD+2)
      C=REACH(TMEMA0(FLD+4),REGS,RES,BAD)
      IF((RES.EQ.0))GOTO 10000
        CALL WARNI0('ld_field: bit field base must be in memory*n.')
        LDFIE0=0
        RETURN
10000 IF((OFFSET+LENGTH.LE.16))GOTO 10001
        C=SEQ(C,GENMR(38,BAD))
        IF((LENGTH.LE.16))GOTO 10002
          CALL LFIEL0(LENGTH,32-LENGTH,LMASK)
          C=SEQ(C,RSHIG0(32-(OFFSET+LENGTH)))
          IF((OFFSET.EQ.0))GOTO 10004
            C=SEQ(C,ANDLW0(LMASK))
10003     GOTO 10004
10002     CALL AFIEL0(LENGTH,16-LENGTH,AMASK)
          C=SEQ(C,LSHIG0(OFFSET-(16-LENGTH)))
          IF((OFFSET.EQ.0))GOTO 10005
            C=SEQ(C,ANDAW0(AMASK))
10005   CONTINUE
10004   REGS=OR(REGS,:001000)
        GOTO 10006
10001   CALL AFIEL0(LENGTH,16-LENGTH,AMASK)
        C=SEQ(C,GENMR(37,BAD),RSHIF0(16-(OFFSET+LENGTH)))
        IF((OFFSET.EQ.0))GOTO 10007
          C=SEQ(C,ANDAW0(AMASK))
10007   REGS=OR(REGS,:002000)
10006 LDFIE0=C
      RETURN
      END
      INTEGER FUNCTION STFIE0(FLD,REGS)
      INTEGER FLD
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
      INTEGER C
      INTEGER GENMR,SEQ,REACH,RSHIG0,LSHIG0,LSHIF0,ANDAW0,ANDLW0
      INTEGER LENGTH,OFFSET
      INTEGER TAD(5),BAD(5),RES,AMASK
      INTEGER * 4 LMASK
      INTEGER MESG(37)
      DATA MESG/243,244,223,230,233,229,236,228,186,160,230,233,229,236,
     *228,160,226,225,243,229,160,225,228,228,242,160,238,239,244,160,23
     *6,246,225,236,245,229,0/
      LENGTH=TMEMA0(FLD+3)
      OFFSET=TMEMA0(FLD+2)
      IF((OFFSET+LENGTH.LE.16))GOTO 10008
        IF((LENGTH.GT.16))GOTO 10009
          C=RSHIG0(OFFSET+LENGTH-16)
          GOTO 10010
10009     C=LSHIG0(32-(OFFSET+LENGTH))
10010   CALL LFIEL0(LENGTH,OFFSET,LMASK)
        IF((OFFSET.EQ.0))GOTO 10011
          C=SEQ(C,ANDLW0(LMASK))
10011   CALL ALLOC0(2,TAD)
        C=SEQ(C,GENMR(48,TAD),REACH(TMEMA0(FLD+4),REGS,RES,BAD))
        IF((RES.EQ.0))GOTO 10012
          CALL WARNI0('*s*n.',MESG)
          STFIE0=0
          RETURN
10012   C=SEQ(C,GENMR(38,BAD),ANDLW0(NOT(LMASK)),GENMR(21,TAD),GENMR(48,
     *BAD))
        CALL FREET0(TAD)
        REGS=OR(REGS,:001000)
        GOTO 10013
10008   C=LSHIF0(16-(OFFSET+LENGTH))
        CALL AFIEL0(LENGTH,OFFSET,AMASK)
        CALL ALLOC0(1,TAD)
        IF((OFFSET.EQ.0))GOTO 10014
          C=SEQ(C,ANDAW0(AMASK))
10014   C=SEQ(C,GENMR(47,TAD),REACH(TMEMA0(FLD+4),REGS,RES,BAD))
        IF((RES.EQ.0))GOTO 10015
          CALL WARNI0('*s*n.',MESG)
          STFIE0=0
          RETURN
10015   C=SEQ(C,GENMR(37,BAD),ANDAW0(NOT(AMASK)),GENMR(20,TAD),GENMR(47,
     *BAD))
        CALL FREET0(TAD)
        REGS=OR(REGS,:002000)
10013 STFIE0=C
      RETURN
      END
      SUBROUTINE AFIEL0(LENGTH,OFFSET,AMASK)
      INTEGER LENGTH,OFFSET,AMASK
      INTEGER MASKS(16)
      INTEGER MESG(29)
      DATA MASKS/:100000,:140000,:160000,:170000,:174000,:176000,:177000
     *,:177400,:177600,:177700,:177740,:177760,:177770,:177774,:177776,:
     *177777/
      DATA MESG/225,223,230,233,229,236,228,223,237,225,243,235,186,160,
     *226,225,228,160,226,233,244,160,230,233,229,236,228,160,0/
      IF((LENGTH.LT.1))GOTO 10017
      IF((LENGTH.GT.16))GOTO 10017
      GOTO 10016
10017   CALL PANIC('*slength *i*n.',MESG,LENGTH)
10016 IF((OFFSET.LT.0))GOTO 10019
      IF((OFFSET.GT.15))GOTO 10019
      GOTO 10018
10019   CALL PANIC('*soffset *i*n.',MESG,OFFSET)
10018 AMASK=RS(MASKS(LENGTH),OFFSET)
      RETURN
      END
      SUBROUTINE LFIEL0(LENGTH,OFFSET,LMASK)
      INTEGER LENGTH,OFFSET
      INTEGER * 4 LMASK
      INTEGER * 4 MASKS(32)
      INTEGER MESG(29)
      DATA MASKS/:20000000000,:30000000000,:34000000000,:36000000000,:37
     *000000000,:37400000000,:37600000000,:37700000000,:37740000000,:377
     *60000000,:37770000000,:37774000000,:37776000000,:37777000000,:3777
     *7400000,:37777600000,:37777700000,:37777740000,:37777760000,:37777
     *770000,:37777774000,:37777776000,:37777777000,:37777777400,:377777
     *77600,:37777777700,:37777777740,:37777777760,:37777777770,:3777777
     *7774,:37777777776,:37777777777/
      DATA MESG/236,223,230,233,229,236,228,223,237,225,243,235,186,160,
     *226,225,228,160,226,233,244,160,230,233,229,236,228,160,0/
      IF((LENGTH.LT.1))GOTO 10021
      IF((LENGTH.GT.32))GOTO 10021
      GOTO 10020
10021   CALL PANIC('*slength *i*n.',MESG,LENGTH)
10020 IF((OFFSET.LT.0))GOTO 10023
      IF((OFFSET.GT.31))GOTO 10023
      GOTO 10022
10023   CALL PANIC('*soffset *i*n.',MESG,OFFSET)
10022 LMASK=RS(MASKS(LENGTH),OFFSET)
      RETURN
      END
      INTEGER FUNCTION ANDAW0(MASK)
      INTEGER MASK
      INTEGER GENMR,GENGE0
      INTEGER AD(5)
      INTEGER AAAAA0
      INTEGER AAAAB0
      AAAAA0=MASK
      GOTO 10024
10025   ANDAW0=GENGE0(9)
        RETURN
10026   ANDAW0=GENGE0(4)
        RETURN
10027   ANDAW0=GENGE0(5)
        RETURN
10028   ANDAW0=0
        RETURN
10024 IF(AAAAA0.EQ.-256)GOTO 10027
      AAAAB0=AAAAA0+2
      GOTO(10028,10025),AAAAB0
      IF(AAAAA0.EQ.255)GOTO 10026
        AD(1)=6
        AD(2)=MASK
        ANDAW0=GENMR(3,AD)
        RETURN
      END
      INTEGER FUNCTION ANDLW0(MASK)
      INTEGER * 4 MASK
      INTEGER GENMR,GENGE0,SEQ
      INTEGER AD(5)
      GOTO 10029
10030   ANDLW0=GENGE0(9)
        RETURN
10031   ANDLW0=GENGE0(10)
        RETURN
10032   ANDLW0=GENGE0(12)
        RETURN
10033   ANDLW0=0
        RETURN
10034   ANDLW0=GENGE0(4)
        RETURN
10035   ANDLW0=GENGE0(5)
        RETURN
10036   AD(1)=6
        AD(2)=RS(MASK,16)
        ANDLW0=GENMR(3,AD)
        RETURN
10037   AD(1)=6
        AD(2)=RS(MASK,16)
        ANDLW0=SEQ(GENGE0(10),GENMR(3,AD))
        RETURN
10029 IF((MASK.EQ.:00000177777))GOTO 10030
      IF((MASK.EQ.:37777600000))GOTO 10031
      IF((MASK.EQ.0))GOTO 10032
      IF((MASK.EQ.:37777777777))GOTO 10033
      IF((MASK.EQ.:00077777777))GOTO 10034
      IF((MASK.EQ.:37700177777))GOTO 10035
      IF((RT(MASK,16).EQ.:00000177777))GOTO 10036
      IF((RT(MASK,16).EQ.0))GOTO 10037
      AD(1)=7
      AD(2)=RS(MASK,16)
      AD(3)=RT(MASK,16)
      ANDLW0=GENMR(4,AD)
      RETURN
      END
      INTEGER FUNCTION LOADU0(EXPR,REGS)
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
      INTEGER C
      INTEGER REACH,LOAD,GENMR,SEQ
      INTEGER FIELD,BASE,ASGNO0,OPNODE,REVNO0,OBJNO0
      INTEGER TALLOC
      INTEGER FREGS
      INTEGER FRES,BAD(5),TAD(5),OBJID,OP
      INTEGER MKLAB0
      INTEGER MESG(20)
      INTEGER AAAAC0
      INTEGER AAAAD0
      DATA MESG/236,239,225,228,223,230,233,229,236,228,223,225,243,231,
     *223,239,240,186,160,0/
      FIELD=TMEMA0(EXPR+2)
      C=REACH(TMEMA0(FIELD+4),FREGS,FRES,BAD)
      IF((FRES.EQ.0))GOTO 10038
        CALL WARNI0('*sfield base addr must be lvalue*n.',MESG)
        LOADU0=0
        RETURN
10038 OBJID=0
      IF((C.EQ.0))GOTO 10039
        CALL ALLOC0(2,TAD)
        OBJID=MKLAB0(1)
        CALL ENTEV0(OBJID,TAD)
        C=SEQ(C,GENMR(17,BAD),GENMR(48,TAD))
        BASE=TALLOC(3)
        TMEMA0(BASE)=15
        TMEMA0(BASE+1)=7
        OBJNO0=TALLOC(3)
        TMEMA0(OBJNO0)=40
        TMEMA0(OBJNO0+1)=4
        TMEMA0(OBJNO0+2)=OBJID
        TMEMA0(BASE+2)=OBJNO0
        TMEMA0(FIELD+4)=BASE
10039 ASGNO0=TALLOC(5)
      TMEMA0(ASGNO0)=5
      TMEMA0(ASGNO0+1)=TMEMA0(EXPR+1)
      TMEMA0(ASGNO0+2)=FIELD
      OPNODE=TALLOC(4)
      AAAAC0=TMEMA0(EXPR)
      GOTO 10040
10041   OP=2
      GOTO 10042
10043   OP=4
      GOTO 10042
10044   OP=17
      GOTO 10042
10045   OP=30
      GOTO 10042
10046   OP=34
      GOTO 10042
10047   OP=42
      GOTO 10042
10048   OP=53
      GOTO 10042
10049   OP=56
      GOTO 10042
10050   OP=62
      GOTO 10042
10051   OP=67
      GOTO 10042
10040 GOTO(10041,10052,10043),AAAAC0
      IF(AAAAC0.EQ.16)GOTO 10044
      AAAAD0=AAAAC0-28
      GOTO(10045,10052,10052,10052,10046,10052,10052,10052,10052,10052, 
     *    10052,10052,10047,10052,10050,10041,10050,10041,10052,10052,  
     *   10052,10052,10052,10048,10052,10052,10049,10052,10052,10052,   
     *  10052,10052,10050,10052,10052,10052,10052,10051),AAAAD0
10052   CALL WARNI0('*sbad field assg op *i*n.',MESG,TMEMA0(EXPR))
        LOADU0=0
        RETURN
10042 TMEMA0(OPNODE)=OP
      TMEMA0(OPNODE+1)=TMEMA0(EXPR+1)
      TMEMA0(OPNODE+2)=FIELD
      TMEMA0(OPNODE+3)=TMEMA0(EXPR+3)
      TMEMA0(ASGNO0+3)=OPNODE
      TMEMA0(ASGNO0+4)=0
      IF((TMEMA0(EXPR).EQ.44))GOTO 10054
      IF((TMEMA0(EXPR).EQ.43))GOTO 10054
      GOTO 10053
10054   REVNO0=TALLOC(4)
        IF((TMEMA0(EXPR).NE.44))GOTO 10055
          TMEMA0(REVNO0)=62
          GOTO 10056
10055     TMEMA0(REVNO0)=2
10056   TMEMA0(REVNO0+1)=TMEMA0(EXPR+1)
        TMEMA0(REVNO0+2)=ASGNO0
        TMEMA0(REVNO0+3)=TMEMA0(EXPR+3)
        C=SEQ(C,LOAD(REVNO0,REGS))
        GOTO 10057
10053   C=SEQ(C,LOAD(ASGNO0,REGS))
10057 REGS=OR(REGS,FREGS)
      IF((OBJID.EQ.0))GOTO 10058
        CALL FREET0(TAD)
        CALL DELEW0(OBJID)
10058 LOADU0=C
      RETURN
      END
      INTEGER FUNCTION VOIDF0(EXPR,REGS)
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
      INTEGER C
      INTEGER REACH,LOAD,GENMR,SEQ,VOID
      INTEGER FIELD,BASE,ASGNO0,OPNODE,REVNO0,OBJNO0
      INTEGER TALLOC
      INTEGER FREGS
      INTEGER FRES,BAD(5),TAD(5),OBJID,OP
      INTEGER MESG(20)
      INTEGER AAAAE0
      INTEGER AAAAF0
      DATA MESG/246,239,233,228,223,230,233,229,236,228,223,225,243,231,
     *223,239,240,186,160,0/
      FIELD=TMEMA0(EXPR+2)
      C=REACH(TMEMA0(FIELD+4),FREGS,FRES,BAD)
      IF((FRES.EQ.0))GOTO 10059
        CALL WARNI0('*sfield base addr must be lvalue*n.',MESG)
        VOIDF0=0
        RETURN
10059 OBJID=0
      IF((C.EQ.0))GOTO 10060
        CALL ALLOC0(2,TAD)
        OBJID=MKLAB0(1)
        CALL ENTEV0(OBJID,TAD)
        C=SEQ(C,GENMR(17,BAD),GENMR(48,TAD))
        BASE=TALLOC(3)
        TMEMA0(BASE)=15
        TMEMA0(BASE+1)=7
        OBJNO0=TALLOC(3)
        TMEMA0(OBJNO0)=40
        TMEMA0(OBJNO0+1)=4
        TMEMA0(OBJNO0+2)=OBJID
        TMEMA0(BASE+2)=OBJNO0
        TMEMA0(FIELD+4)=BASE
10060 ASGNO0=TALLOC(5)
      TMEMA0(ASGNO0)=5
      TMEMA0(ASGNO0+1)=TMEMA0(EXPR+1)
      TMEMA0(ASGNO0+2)=FIELD
      OPNODE=TALLOC(4)
      AAAAE0=TMEMA0(EXPR)
      GOTO 10061
10062   OP=2
      GOTO 10063
10064   OP=4
      GOTO 10063
10065   OP=17
      GOTO 10063
10066   OP=30
      GOTO 10063
10067   OP=34
      GOTO 10063
10068   OP=42
      GOTO 10063
10069   OP=53
      GOTO 10063
10070   OP=56
      GOTO 10063
10071   OP=62
      GOTO 10063
10072   OP=67
      GOTO 10063
10061 GOTO(10062,10073,10064),AAAAE0
      IF(AAAAE0.EQ.16)GOTO 10065
      AAAAF0=AAAAE0-28
      GOTO(10066,10073,10073,10073,10067,10073,10073,10073,10073,10073, 
     *    10073,10073,10068,10073,10071,10062,10071,10062,10073,10073,  
     *   10073,10073,10073,10069,10073,10073,10070,10073,10073,10073,   
     *  10073,10073,10071,10073,10073,10073,10073,10072),AAAAF0
10073   CALL WARNI0('*sbad field assg op *i*n.',MESG,TMEMA0(EXPR))
        VOIDF0=0
        RETURN
10063 TMEMA0(OPNODE)=OP
      TMEMA0(OPNODE+1)=TMEMA0(EXPR+1)
      TMEMA0(OPNODE+2)=FIELD
      TMEMA0(OPNODE+3)=TMEMA0(EXPR+3)
      TMEMA0(ASGNO0+3)=OPNODE
      TMEMA0(ASGNO0+4)=0
      C=SEQ(C,VOID(ASGNO0,REGS))
      REGS=OR(REGS,FREGS)
      IF((OBJID.EQ.0))GOTO 10074
        CALL FREET0(TAD)
        CALL DELEW0(OBJID)
10074 VOIDF0=C
      RETURN
      END
      INTEGER FUNCTION FLFIE0(EXPR,REGS,COND,LABEL)
      INTEGER EXPR
      INTEGER REGS
      LOGICAL COND
      INTEGER LABEL
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
      INTEGER LENGTH,OFFSET,BAD(5),RES,AMASK
      INTEGER * 4 LMASK
      INTEGER C
      INTEGER REACH,SEQ,GENMR,ANDAW0,ANDLW0,GENBR0
      LENGTH=TMEMA0(EXPR+3)
      OFFSET=TMEMA0(EXPR+2)
      C=REACH(TMEMA0(EXPR+4),REGS,RES,BAD)
      IF((RES.EQ.0))GOTO 10075
        CALL WARNI0('fl_field: bit field base not addressable*n.')
        FLFIE0=0
        RETURN
10075 IF((OFFSET+LENGTH.LE.16))GOTO 10076
        C=SEQ(C,GENMR(38,BAD))
        CALL LFIEL0(LENGTH,OFFSET,LMASK)
        C=SEQ(C,ANDLW0(LMASK))
        IF((.NOT.COND))GOTO 10077
          C=SEQ(C,GENBR0(28,LABEL))
          GOTO 10078
10077     C=SEQ(C,GENBR0(23,LABEL))
10078   REGS=OR(REGS,:001000)
        GOTO 10079
10076   C=SEQ(C,GENMR(37,BAD))
        CALL AFIEL0(LENGTH,OFFSET,AMASK)
        C=SEQ(C,ANDAW0(AMASK))
        IF((.NOT.COND))GOTO 10080
          C=SEQ(C,GENBR0(38,LABEL))
          GOTO 10081
10080     C=SEQ(C,GENBR0(11,LABEL))
10081   REGS=OR(REGS,:002000)
10079 FLFIE0=C
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
C revnode                        revno0
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
C asgnode                        asgno0
C objnode                        objno0
