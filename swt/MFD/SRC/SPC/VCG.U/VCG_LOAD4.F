      INTEGER FUNCTION LOAEK0(EXPR,REGS)
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
      INTEGER SEQ,LD,ST,GENMR,REACH,LOADU0
      INTEGER LRES,RRES,LAD(5),RAD(5),OPINS,INVINS
      INTEGER MESG(15)
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      DATA MESG/236,239,225,228,223,240,239,243,244,233,238,227,186,160,
     *0/
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10000
        LOAEK0=LOADU0(EXPR,REGS)
        RETURN
10000 AAAAA0=TMEMA0(EXPR+1)
      GOTO 10001
10002   OPREG=:002000
        OPINS=1
        INVINS=52
      GOTO 10003
10004   OPREG=:001000
        OPINS=2
        INVINS=46
      GOTO 10003
10005   OPREG=:000400
        OPINS=22
        INVINS=28
      GOTO 10003
10006   OPREG=:000200
        OPINS=7
        INVINS=13
      GOTO 10003
10001 GOTO(10002,10004,10002,10004,10005,10006),AAAAA0
        CALL WARNI0('*sbad data mode *i*n.',MESG,TMEMA0(EXPR+1))
        REGS=0
        LOAEK0=0
        RETURN
10003 L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      IF((RRES.NE.1))GOTO 10007
        CALL WARNI0('*sright op not a constant*n.',MESG)
        REGS=0
        LOAEK0=0
        RETURN
10007 AAAAB0=RAD(1)
      GOTO 10008
10008 AAAAC0=AAAAB0-5
      GOTO(10010,10010,10010,10010),AAAAC0
        CALL WARNI0('*sright op not a constant*n.',MESG)
        REGS=0
        LOAEK0=0
        RETURN
10010 IF((LRES.NE.1))GOTO 10011
        CALL WARNI0('*sleft op not an lvalue*n.',MESG)
        REGS=0
        LOAEK0=0
        RETURN
10011 LOAEK0=SEQ(L,LD(OPREG,LRES,LAD),GENMR(OPINS,RAD),ST(OPREG,LAD),GEN
     *MR(INVINS,RAD))
      REGS=OR(OPREG,LREGS)
      RETURN
      END
      INTEGER FUNCTION LOAEL0(EXPR,REGS)
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
      INTEGER SEQ,LD,ST,GENMR,REACH,LOADU0
      INTEGER LRES,RRES,LAD(5),RAD(5),OPINS
      INTEGER MESG(14)
      INTEGER AAAAD0
      INTEGER AAAAE0
      INTEGER AAAAF0
      DATA MESG/236,239,225,228,223,240,242,229,228,229,227,186,160,0/
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10012
        LOAEL0=LOADU0(EXPR,REGS)
        RETURN
10012 AAAAD0=TMEMA0(EXPR+1)
      GOTO 10013
10014   OPREG=:002000
        OPINS=52
      GOTO 10015
10016   OPREG=:001000
        OPINS=46
      GOTO 10015
10017   OPREG=:000400
        OPINS=28
      GOTO 10015
10018   OPREG=:000200
        OPINS=13
      GOTO 10015
10013 GOTO(10014,10016,10014,10016,10017,10018),AAAAD0
        CALL WARNI0('*sbad data mode *i*n.',MESG,TMEMA0(EXPR+1))
        REGS=0
        LOAEL0=0
        RETURN
10015 L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      IF((RRES.NE.1))GOTO 10019
        CALL WARNI0('*sright op not a constant*n.',MESG)
        REGS=0
        LOAEL0=0
        RETURN
10019 AAAAE0=RAD(1)
      GOTO 10020
10020 AAAAF0=AAAAE0-5
      GOTO(10022,10022,10022,10022),AAAAF0
        CALL WARNI0('*sright op not a constant*n.',MESG)
        REGS=0
        LOAEL0=0
        RETURN
10022 IF((LRES.NE.1))GOTO 10023
        CALL WARNI0('*sleft op not an lvalue*n.',MESG)
        REGS=0
        LOAEL0=0
        RETURN
10023 LOAEL0=SEQ(L,LD(OPREG,LRES,LAD),GENMR(OPINS,RAD),ST(OPREG,LAD))
      REGS=OR(OPREG,LREGS)
      RETURN
      END
      INTEGER FUNCTION LOAEM0(EXPR,REGS)
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
      INTEGER SEQ,LD,ST,GENMR,REACH,LOADU0
      INTEGER LRES,RRES,LAD(5),RAD(5),OPINS
      INTEGER MESG(14)
      INTEGER AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAI0
      DATA MESG/236,239,225,228,223,240,242,229,228,229,227,186,160,0/
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10024
        LOAEM0=LOADU0(EXPR,REGS)
        RETURN
10024 AAAAG0=TMEMA0(EXPR+1)
      GOTO 10025
10026   OPREG=:002000
        OPINS=1
      GOTO 10027
10028   OPREG=:001000
        OPINS=2
      GOTO 10027
10029   OPREG=:000400
        OPINS=22
      GOTO 10027
10030   OPREG=:000200
        OPINS=7
      GOTO 10027
10025 GOTO(10026,10028,10026,10028,10029,10030),AAAAG0
        CALL WARNI0('*sbad data mode *i*n.',MESG,TMEMA0(EXPR+1))
        REGS=0
        LOAEM0=0
        RETURN
10027 L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      IF((RRES.NE.1))GOTO 10031
        CALL WARNI0('*sright op not a constant*n.',MESG)
        REGS=0
        LOAEM0=0
        RETURN
10031 AAAAH0=RAD(1)
      GOTO 10032
10032 AAAAI0=AAAAH0-5
      GOTO(10034,10034,10034,10034),AAAAI0
        CALL WARNI0('*sright op not a constant*n.',MESG)
        REGS=0
        LOAEM0=0
        RETURN
10034 IF((LRES.NE.1))GOTO 10035
        CALL WARNI0('*sleft op not an lvalue*n.',MESG)
        REGS=0
        LOAEM0=0
        RETURN
10035 LOAEM0=SEQ(L,LD(OPREG,LRES,LAD),GENMR(OPINS,RAD),ST(OPREG,LAD))
      REGS=OR(OPREG,LREGS)
      RETURN
      END
      INTEGER FUNCTION LOAEN0(EXPR,REGS)
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
      INTEGER ARGLI0(5,100),ISTEMP(100),PAD(5),I,NARGS,OPSIZE,RES
      INTEGER LOOKX0
      INTEGER PC,RA
      INTEGER SEQ,GENMR,GENAP,LD,ST,REACH
      INTEGER ARG
      LOGICAL SAFE
      INTEGER OPREG
      INTEGER AAAAJ0
      PC=0
      NARGS=0
      ARG=TMEMA0(EXPR+3)
      GOTO 10038
10036 ARG=TMEMA0(ARG+3)
10038 IF((ARG.EQ.0))GOTO 10037
        NARGS=NARGS+(1)
        RA=REACH(TMEMA0(ARG+2),REGS,RES,ARGLI0(1,NARGS))
        OPSIZE=0
        AAAAJ0=TMEMA0(ARG+1)
        GOTO 10039
10040     OPSIZE=1
          OPREG=:002000
        GOTO 10041
10042     OPSIZE=2
          OPREG=:001000
        GOTO 10041
10043     OPSIZE=2
          OPREG=:000400
        GOTO 10041
10044     OPSIZE=4
          OPREG=:000200
        GOTO 10041
10039   GOTO(10040,10042,10040,10042,10043,10044),AAAAJ0
10041   IF((RES.NE.1))GOTO 10045
          CALL ALLOC0(OPSIZE,ARGLI0(1,NARGS))
          ISTEMP(NARGS)=1
          PC=SEQ(PC,RA,ST(OPREG,ARGLI0(1,NARGS)))
          GOTO 10036
10045     IF(SAFE(REGS,OR(:002000,OR(:000400,OR(:000100,:000003)))))GOTO
     * 10047
            PC=SEQ(PC,RA,GENMR(17,ARGLI0(1,NARGS)))
            CALL ALLOC0(2,ARGLI0(1,NARGS))
            PC=SEQ(PC,GENMR(48,ARGLI0(1,NARGS)))
            ARGLI0(1,NARGS)=3
            ISTEMP(NARGS)=1
            GOTO 10048
10047       PC=SEQ(PC,RA)
            ISTEMP(NARGS)=0
10048   CONTINUE
10046 GOTO 10036
10037 IF((TMEMA0(EXPR+2).EQ.0))GOTO 10049
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.40))GOTO 10049
      IF((LOOKX0(TMEMA0(TMEMA0(EXPR+2)+2),PAD).NE.0))GOTO 10049
        PAD(1)=10
        PAD(3)=TMEMA0(TMEMA0(EXPR+2)+2)
        PC=SEQ(PC,GENMR(45,PAD))
        GOTO 10050
10049   PC=SEQ(PC,REACH(TMEMA0(EXPR+2),REGS,RES,PAD))
        IF((RES.NE.1))GOTO 10051
          CALL ALLOC0(2,PAD)
          PC=SEQ(PC,ST(:001000,PAD))
          PAD(1)=3
          PC=SEQ(PC,GENMR(45,PAD))
          CALL FREET0(PAD)
          GOTO 10052
10051     PC=SEQ(PC,GENMR(45,PAD))
10052 CONTINUE
10050 I=1
      GOTO 10055
10053 I=I+(1)
10055 IF((I.GE.NARGS))GOTO 10054
        PC=SEQ(PC,GENAP(ARGLI0(1,I),1,0))
        IF((ISTEMP(I).NE.1))GOTO 10053
          CALL FREET0(ARGLI0(1,I))
10056 GOTO 10053
10054 IF((I.GT.NARGS))GOTO 10057
        PC=SEQ(PC,GENAP(ARGLI0(1,I),1,1))
        IF((ISTEMP(I).NE.1))GOTO 10058
          CALL FREET0(ARGLI0(1,I))
10058 CONTINUE
10057 REGS=:003703
      LOAEN0=PC
      RETURN
      END
      INTEGER FUNCTION LOAEO0(EXPR,REGS)
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
      INTEGER RES,AD(5)
      INTEGER REACH,GENMR,SEQ
      LOAEO0=REACH(TMEMA0(EXPR+2),REGS,RES,AD)
      IF((RES.NE.1))GOTO 10059
        CALL WARNI0('load_refto: expression must be lvalue*n.')
        REGS=0
        LOAEO0=0
        RETURN
10059 LOAEO0=SEQ(LOAEO0,GENMR(17,AD))
      REGS=OR(REGS,:001000)
      RETURN
      END
      INTEGER FUNCTION LOAEQ0(EXPR,REGS)
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
      LOGICAL SAFE
      INTEGER AAAAK0
      INTEGER AAAAL0
      INTEGER PREP,L,R,POST
      INTEGER GENGE0,GENMR,LD,ST,REACH,SEQ,LOADU0
      INTEGER OPREG,LREGS,RREGS
      INTEGER LRES,RRES,LAD(5),RAD(5),TAD(5),OPSIZE,OPINS
      INTEGER AAAAM0
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10062
        LOAEQ0=LOADU0(EXPR,REGS)
        RETURN
10062 AAAAM0=TMEMA0(EXPR+1)
      GOTO 10063
10064   OPREG=:002000
        PREP=GENGE0(65)
        POST=GENGE0(97)
        OPSIZE=1
        OPINS=15
      GOTO 10065
10066   OPREG=:002000
        PREP=GENGE0(105)
        POST=GENGE0(97)
        OPSIZE=1
        OPINS=15
      GOTO 10065
10067   OPREG=:001000
        PREP=GENGE0(66)
        POST=GENGE0(33)
        OPSIZE=2
        OPINS=16
      GOTO 10065
10068   OPREG=:001000
        PREP=SEQ(GENGE0(33),GENGE0(12))
        POST=GENGE0(33)
        OPSIZE=2
        OPINS=16
      GOTO 10065
10063 GOTO(10064,10067,10066,10068),AAAAM0
        CALL PANIC('load_remaa: bad op mode *i*n.',TMEMA0(EXPR+1))
10065 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10069
10070   IF((.NOT.SAFE(LREGS,RREGS)))GOTO 10071
          AAAAK0=1
          GOTO 10060
10071     AAAAL0=1
          GOTO 10061
10074   CONTINUE
10073 GOTO 10075
10076   AAAAL0=2
        GOTO 10061
10078   IF((.NOT.SAFE(LREGS,RREGS)))GOTO 10079
          AAAAK0=2
          GOTO 10060
10079     AAAAL0=3
          GOTO 10061
10082   CONTINUE
10081 GOTO 10075
10069 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10083
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10083
      GOTO 10070
10083 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10084
      IF(SAFE(OPREG,RREGS))GOTO 10084
      GOTO 10076
10084 IF(SAFE(OPREG,LREGS))GOTO 10085
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10085
      GOTO 10078
10085 CONTINUE
        AAAAL0=4
        GOTO 10061
10086 CONTINUE
10075 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10060 LOAEQ0=SEQ(L,LD(OPREG,LRES,LAD),PREP,R,GENMR(OPINS,RAD),POST,ST(OP
     *REG,LAD))
      GOTO 10087
10061 LOAEQ0=SEQ(R,LD(OPREG,RRES,RAD))
      LOAEQ0=SEQ(LOAEQ0,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),PREP,GENMR(OP
     *INS,TAD),POST,ST(OPREG,LAD))
      GOTO 10088
10087 GOTO(10075,10075),AAAAK0
      GOTO 10087
10088 GOTO(10074,10075,10082,10086),AAAAL0
      GOTO 10088
      END
      INTEGER FUNCTION LOAEP0(EXPR,REGS)
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
      LOGICAL SAFE
      INTEGER AAAAN0
      INTEGER AAAAO0
      INTEGER PREP,L,R,POST
      INTEGER GENGE0,GENMR,LD,ST,REACH,SEQ
      INTEGER OPREG,LREGS,RREGS
      INTEGER LRES,RRES,LAD(5),RAD(5),TAD(5),OPSIZE,OPINS
      INTEGER AAAAP0
      AAAAP0=TMEMA0(EXPR+1)
      GOTO 10091
10092   OPREG=:002000
        PREP=GENGE0(65)
        POST=GENGE0(97)
        OPSIZE=1
        OPINS=15
      GOTO 10093
10094   OPREG=:002000
        PREP=GENGE0(105)
        POST=GENGE0(97)
        OPSIZE=1
        OPINS=15
      GOTO 10093
10095   OPREG=:001000
        PREP=GENGE0(66)
        POST=GENGE0(33)
        OPSIZE=2
        OPINS=16
      GOTO 10093
10096   OPREG=:001000
        PREP=SEQ(GENGE0(33),GENGE0(12))
        POST=GENGE0(33)
        OPSIZE=2
        OPINS=16
      GOTO 10093
10091 GOTO(10092,10095,10094,10096),AAAAP0
        CALL PANIC('load_rem: bad op mode *i*n.',TMEMA0(EXPR+1))
10093 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10097
10098   AAAAN0=1
        GOTO 10089
10101   AAAAO0=1
        GOTO 10090
10103   AAAAN0=2
        GOTO 10089
10097 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10105
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10105
      GOTO 10098
10105 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10106
      IF(SAFE(OPREG,RREGS))GOTO 10106
      GOTO 10101
10106 IF(SAFE(OPREG,LREGS))GOTO 10107
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10107
      GOTO 10103
10107 CONTINUE
        AAAAO0=2
        GOTO 10090
10108 CONTINUE
10100 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10089 LOAEP0=SEQ(L,LD(OPREG,LRES,LAD),PREP,R,GENMR(OPINS,RAD),POST)
      GOTO 10109
10090 LOAEP0=SEQ(R,LD(OPREG,RRES,RAD))
      LOAEP0=SEQ(LOAEP0,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),PREP,GENMR(OP
     *INS,TAD),POST)
      GOTO 10110
10109 GOTO(10100,10100),AAAAN0
      GOTO 10109
10110 GOTO(10100,10108),AAAAO0
      GOTO 10110
      END
      INTEGER FUNCTION LOAER0(EXPR,REGS)
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
      INTEGER GENGE0,LOAD,SEQ
      LOAER0=SEQ(LOAD(TMEMA0(EXPR+1),REGS),GENGE0(70))
      RETURN
      END
      INTEGER FUNCTION LOAET0(EXPR,REGS)
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
      INTEGER RTRPOS(32),RTRTE0(281)
      COMMON /RTR$CM/RTRPOS,RTRTE0
      INTEGER L,R
      INTEGER GENGE0,GENMR,REACH,LD,ST,SEQ,RSHIF0,RSHIG0,ARSHI0,ARSHJ0,L
     *OADU0,LOAEU0
      INTEGER TAD(5),CAD(5),RAD(5),OPREG,OPSIZE,RES,RRES,LAD(5),LOOKX0,S
     *HIFT,JUNK
      INTEGER RREGS
      INTEGER SHIFT0
      INTEGER LEFTOP,RIGHT0
      INTEGER MESG(16)
      INTEGER AAAAQ0
      DATA MESG/236,239,225,228,223,242,243,232,233,230,244,225,225,186,
     *160,0/
      LEFTOP=TMEMA0(EXPR+2)
      RIGHT0=TMEMA0(EXPR+3)
      IF((TMEMA0(LEFTOP).NE.69))GOTO 10111
        LOAET0=LOADU0(EXPR,REGS)
        RETURN
10111 AAAAQ0=TMEMA0(EXPR+1)
      GOTO 10112
10113   IF((TMEMA0(RIGHT0).NE.9))GOTO 10114
          L=REACH(LEFTOP,REGS,RES,TAD)
          REGS=OR(REGS,:002000)
          LOAET0=SEQ(L,LD(:002000,RES,TAD),ARSHI0(TMEMA0(RIGHT0+3)),ST(:
     *002000,TAD))
          RETURN
10114   OPREG=:002000
        SHIFT0=RTRID0(1)
        SHIFT=3
      GOTO 10115
10116   IF((TMEMA0(RIGHT0).NE.9))GOTO 10117
          L=REACH(LEFTOP,REGS,RES,TAD)
          REGS=OR(REGS,:002000)
          LOAET0=SEQ(L,LD(:002000,RES,TAD),RSHIF0(TMEMA0(RIGHT0+3)),ST(:
     *002000,TAD))
          RETURN
10117   OPREG=:002000
        SHIFT0=RTRID0(3)
        SHIFT=5
      GOTO 10115
10118   IF((TMEMA0(RIGHT0).NE.9))GOTO 10119
          L=REACH(LEFTOP,REGS,RES,TAD)
          REGS=OR(REGS,:001000)
          LOAET0=SEQ(L,LD(:001000,RES,TAD),ARSHJ0(TMEMA0(RIGHT0+3)),ST(:
     *001000,TAD))
          RETURN
10119   OPREG=:001000
        SHIFT0=RTRID0(2)
        SHIFT=4
      GOTO 10115
10120   IF((TMEMA0(RIGHT0).NE.9))GOTO 10121
          L=REACH(LEFTOP,REGS,RES,TAD)
          REGS=OR(REGS,:001000)
          LOAET0=SEQ(L,LD(:001000,RES,TAD),RSHIG0(TMEMA0(RIGHT0+3)),ST(:
     *001000,TAD))
          RETURN
10121   OPREG=:001000
        SHIFT0=RTRID0(4)
        SHIFT=6
      GOTO 10115
10112 GOTO(10113,10118,10116,10120),AAAAQ0
        CALL PANIC('*sbad data mode *i*n.',MESG,TMEMA0(EXPR+1))
10115 R=LOAEU0(SHIFT,SHIFT0)
      R=SEQ(R,REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD))
      IF((RRES.NE.0))GOTO 10122
        R=SEQ(R,GENMR(40,RAD))
        GOTO 10123
10122   R=SEQ(R,GENGE0(95))
10123 JUNK=LOOKX0(SHIFT0,TAD)
      L=REACH(TMEMA0(EXPR+2),REGS,RES,LAD)
      REGS=OR(REGS,RREGS)
      L=SEQ(L,LD(OPREG,RES,LAD),GENMR(35,TAD),ST(OPREG,LAD))
      REGS=OR(REGS,:002000)
      LOAET0=SEQ(R,L)
      RETURN
      END
      INTEGER FUNCTION LOAES0(EXPR,REGS)
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
      INTEGER RTRPOS(32),RTRTE0(281)
      COMMON /RTR$CM/RTRPOS,RTRTE0
      INTEGER L,R
      INTEGER GENGE0,GENMR,REACH,LD,ST,SEQ,LOAD,RSHIF0,RSHIG0,ARSHI0,ARS
     *HJ0,LOAEU0
      INTEGER TAD(5),CAD(5),RAD(5),OPREG,OPSIZE,RES,RRES,LAD(5),LOOKY0,S
     *HIFT,JUNK
      INTEGER SHIFT0
      INTEGER RREGS
      INTEGER LEFTOP,RIGHT0
      INTEGER MESG(14)
      INTEGER AAAAR0
      DATA MESG/236,239,225,228,223,242,243,232,233,230,244,186,160,0/
      LEFTOP=TMEMA0(EXPR+2)
      RIGHT0=TMEMA0(EXPR+3)
      AAAAR0=TMEMA0(EXPR+1)
      GOTO 10124
10125   IF((TMEMA0(RIGHT0).NE.9))GOTO 10126
          LOAES0=SEQ(LOAD(LEFTOP,REGS),ARSHI0(TMEMA0(RIGHT0+3)))
          RETURN
10126   OPREG=:002000
        SHIFT0=RTRID0(1)
        SHIFT=3
      GOTO 10127
10128   IF((TMEMA0(RIGHT0).NE.9))GOTO 10129
          LOAES0=SEQ(LOAD(LEFTOP,REGS),RSHIF0(TMEMA0(RIGHT0+3)))
          RETURN
10129   OPREG=:002000
        SHIFT0=RTRID0(3)
        SHIFT=5
      GOTO 10127
10130   IF((TMEMA0(RIGHT0).NE.9))GOTO 10131
          LOAES0=SEQ(LOAD(LEFTOP,REGS),ARSHJ0(TMEMA0(RIGHT0+3)))
          RETURN
10131   OPREG=:001000
        SHIFT0=RTRID0(2)
        SHIFT=4
      GOTO 10127
10132   IF((TMEMA0(RIGHT0).NE.9))GOTO 10133
          LOAES0=SEQ(LOAD(LEFTOP,REGS),RSHIG0(TMEMA0(RIGHT0+3)))
          RETURN
10133   OPREG=:001000
        SHIFT0=RTRID0(4)
        SHIFT=6
      GOTO 10127
10124 GOTO(10125,10130,10128,10132),AAAAR0
        CALL PANIC('*sbad data mode *i*n.',MESG,TMEMA0(EXPR+1))
10127 R=LOAEU0(SHIFT,SHIFT0)
      R=SEQ(R,REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD))
      IF((RRES.NE.0))GOTO 10134
        R=SEQ(R,GENMR(40,RAD))
        GOTO 10135
10134   R=SEQ(R,GENGE0(95))
10135 JUNK=LOOKX0(SHIFT0,TAD)
      L=REACH(TMEMA0(EXPR+2),REGS,RES,LAD)
      REGS=OR(REGS,RREGS)
      L=SEQ(L,LD(OPREG,RES,LAD),GENMR(35,TAD))
      REGS=OR(REGS,:002000)
      LOAES0=SEQ(R,L)
      RETURN
      END
      INTEGER FUNCTION LOAEU0(NAME,RTRID)
      INTEGER NAME
      INTEGER RTRID
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
      INTEGER RSVLI0
      INTEGER AD(5),LOOKX0
      INTEGER SEQ,GENEX0,GENLA0,GENIQ0,GENGE0
      IF((LOOKX0(RTRID,AD).NE.0))GOTO 10136
        AD(1)=3
        AD(2)=:000002
        AD(3)=RSVLI0(2)
        AD(4)=1
        CALL ENTEV0(RTRID,AD)
        LOAEU0=SEQ(GENGE0(53),GENEX0(NAME),GENLA0(RTRID),GENIQ0(NAME),GE
     *NGE0(69))
        GOTO 10137
10136   LOAEU0=0
10137 RETURN
      END
      INTEGER FUNCTION LOAEV0(EXPR,REGS)
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
      INTEGER L,R
      INTEGER SEQ,LOAD,GENBR0,GENLA0
      INTEGER LAB,BRANCH
      INTEGER MKLAB0
      INTEGER RREGS,LREGS
      INTEGER AAAAS0
      LAB=MKLAB0(1)
      L=LOAD(TMEMA0(EXPR+2),LREGS)
      R=LOAD(TMEMA0(EXPR+3),RREGS)
      AAAAS0=TMEMA0(EXPR+1)
      GOTO 10138
10139   BRANCH=11
      GOTO 10140
10141   BRANCH=23
      GOTO 10140
10142   BRANCH=12
      GOTO 10140
10138 GOTO(10139,10141,10139,10141,10142,10142),AAAAS0
        CALL PANIC('load_sand: bad data mode*i*n.',TMEMA0(EXPR+1))
10140 LOAEV0=SEQ(L,GENBR0(BRANCH,LAB),R,GENLA0(LAB))
      REGS=OR(LREGS,RREGS)
      RETURN
      END
      INTEGER FUNCTION LOAEW0(EXPR,REGS)
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
      INTEGER REACH,SEQ,GENMR
      INTEGER RES,AD(5),OPINS
      INTEGER MESG(14)
      INTEGER AAAAT0
      DATA MESG/236,239,225,228,223,243,229,236,229,227,244,186,160,0/
      LOAEW0=REACH(EXPR,REGS,RES,AD)
      IF((RES.NE.0))GOTO 10143
        AAAAT0=TMEMA0(EXPR+1)
        GOTO 10144
10145     OPINS=37
          REGS=OR(REGS,:002000)
        GOTO 10146
10147     OPINS=38
          REGS=OR(REGS,:001000)
        GOTO 10146
10148     OPINS=25
          REGS=OR(REGS,:000400)
        GOTO 10146
10149     OPINS=10
          REGS=OR(REGS,:000200)
        GOTO 10146
10144   GOTO(10145,10147,10145,10147,10148,10149),AAAAT0
          CALL WARNI0('*sbad data mode*i*n.',MESG,TMEMA0(EXPR+1))
          LOAEW0=0
          RETURN
10146   LOAEW0=SEQ(LOAEW0,GENMR(OPINS,AD))
        GOTO 10150
10143   CALL WARNI0('*sstruct field returned in accumulator*n.',MESG)
        LOAEW0=0
        RETURN
10150 RETURN
      END
      INTEGER FUNCTION LOAEX0(EXPR,REGS)
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
      INTEGER LOAD,VOID,SEQ
      INTEGER LREGS
      IF((TMEMA0(EXPR+2).EQ.0))GOTO 10151
        LOAEX0=VOID(TMEMA0(EXPR+1),LREGS)
        LOAEX0=SEQ(LOAEX0,LOAD(TMEMA0(EXPR+2),REGS))
        REGS=OR(REGS,LREGS)
        GOTO 10152
10151   LOAEX0=LOAD(TMEMA0(EXPR+1),REGS)
10152 RETURN
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
C shiftid                        shift0
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
C rtrtext                        rtrte0
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
C arglist                        argli0
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
C rightop                        right0
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
C lookupobject                   looky0
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
