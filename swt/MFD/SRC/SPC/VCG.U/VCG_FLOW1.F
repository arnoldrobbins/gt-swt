      INTEGER FUNCTION FLOW(EXPR,REGS,COND,LABEL)
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
      INTEGER AD(5),BRANCH
      INTEGER SEQ,GENMR,LOAD,FLOWT0,FLOWIF,FLOWC0,FLOWV0,GENBR0,FLOWS0,F
     *LOWU0,FLOWEQ,FLOWGE,FLOWGT,FLOWLE,FLOWLT,FLOWNE,FLOWN0,FLOWF0
      INTEGER AAAAA0
      INTEGER AAAAB0
      IF((EXPR.NE.0))GOTO 10000
        FLOW=0
        REGS=0
        RETURN
10000 AAAAA0=TMEMA0(EXPR)
      GOTO 10001
10002   FLOW=FLOWC0(EXPR,REGS,COND,LABEL)
      GOTO 10003
10004   FLOW=FLOWEQ(EXPR,REGS,COND,LABEL)
      GOTO 10003
10005   FLOW=FLOWGE(EXPR,REGS,COND,LABEL)
      GOTO 10003
10006   FLOW=FLOWGT(EXPR,REGS,COND,LABEL)
      GOTO 10003
10007   FLOW=FLOWLE(EXPR,REGS,COND,LABEL)
      GOTO 10003
10008   FLOW=FLOWLT(EXPR,REGS,COND,LABEL)
      GOTO 10003
10009   FLOW=FLOWNE(EXPR,REGS,COND,LABEL)
      GOTO 10003
10010   FLOW=FLOWN0(EXPR,REGS,COND,LABEL)
      GOTO 10003
10011   FLOW=FLOWIF(EXPR,REGS,COND,LABEL)
      GOTO 10003
10012   FLOW=FLOWS0(EXPR,REGS,COND,LABEL)
      GOTO 10003
10013   FLOW=FLOWT0(EXPR,REGS,COND,LABEL)
      GOTO 10003
10014   FLOW=FLOWU0(EXPR,REGS,COND,LABEL)
      GOTO 10003
10015   FLOW=FLOWV0(EXPR,REGS,COND,LABEL)
      GOTO 10003
10016   FLOW=FLOWF0(EXPR,REGS,COND,LABEL)
      GOTO 10003
10017   CALL WARNI0('*i: questionable operator in flow context*n.',TMEMA
     *0(EXPR))
        FLOW=LOAD(EXPR,REGS)
        AD(1)=10
        AD(3)=LABEL
        FLOW=SEQ(FLOW,GENMR(32,AD))
      GOTO 10003
10018   FLOW=LOAD(EXPR,REGS)
        AAAAB0=TMEMA0(EXPR+1)
        GOTO 10019
10020     IF((.NOT.COND))GOTO 10021
            BRANCH=38
            GOTO 10023
10021       BRANCH=11
10022   GOTO 10023
10024     IF((.NOT.COND))GOTO 10025
            BRANCH=28
            GOTO 10023
10025       BRANCH=23
10026   GOTO 10023
10027     IF((.NOT.COND))GOTO 10028
            BRANCH=17
            GOTO 10023
10028       BRANCH=12
10029   GOTO 10023
10019   GOTO(10020,10024,10020,10024,10027,10027),AAAAB0
          CALL PANIC('*i: bogus operator data mode*n.',TMEMA0(EXPR+1))
10023   FLOW=SEQ(FLOW,GENBR0(BRANCH,LABEL))
      GOTO 10003
10001 GOTO(10018,10018,10018,10018,10018,10017,10030,10018,10018,10002, 
     *    10017,10030,10017,10017,10018,10018,10018,10017,10004,10017,  
     *   10005,10017,10006,10011,10018,10030,10017,10007,10018,10018,   
     *  10008,10030,10018,10018,10018,10017,10009,10010,10017,10018,    
     * 10018,10018,10018,10018,10018,10018,10030,10018,10030,10030,10018
     *,10018,10018,10017,10018,10018,10012,10018,10013,10014,10018,10018
     *,10015,10017,10017,10018,10018,10030,10016),AAAAA0
10030   CALL PANIC('*i:  bogus operator in flow*n.',TMEMA0(EXPR))
10003 RETURN
      END
      INTEGER FUNCTION FLOWC0(EXPR,REGS,COND,LABEL)
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
      INTEGER LOAD,GENBR0,SEQ
      INTEGER BRANCH
      INTEGER AAAAC0
      FLOWC0=LOAD(EXPR,REGS)
      AAAAC0=TMEMA0(EXPR+2)
      GOTO 10031
10032   IF((.NOT.COND))GOTO 10033
          BRANCH=38
          GOTO 10035
10033     BRANCH=11
10034 GOTO 10035
10036   IF((.NOT.COND))GOTO 10037
          BRANCH=28
          GOTO 10035
10037     BRANCH=23
10038 GOTO 10035
10039   IF((.NOT.COND))GOTO 10040
          BRANCH=17
          GOTO 10035
10040     BRANCH=12
10041 GOTO 10035
10031 GOTO(10032,10036,10032,10036,10039,10039),AAAAC0
        CALL PANIC('*i:  bad convert destination mode in flow*n.',TMEMA0
     *(EXPR+2))
10035 FLOWC0=SEQ(FLOWC0,GENBR0(BRANCH,LABEL))
      RETURN
      END
      INTEGER FUNCTION FLOWIF(EXPR,REGS,COND,LABEL)
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
      INTEGER FLOW,FLOW,GENGE0,GENMR,GENLA0,SEQ
      INTEGER ELSEL0,EXITL0,AD(5)
      INTEGER MKLAB0
      INTEGER CREGS,TREGS,EREGS
      IF((TMEMA0(EXPR+4).NE.0))GOTO 10042
        EXITL0=MKLAB0(1)
        FLOWIF=SEQ(FLOW(TMEMA0(EXPR+2),CREGS,.FALSE.,EXITL0),FLOW(TMEMA0
     *(EXPR+3),TREGS,COND,LABEL),GENLA0(EXITL0))
        EREGS=0
        GOTO 10043
10042   IF((TMEMA0(EXPR+3).NE.0))GOTO 10044
          EXITL0=MKLAB0(1)
          FLOWIF=SEQ(FLOW(TMEMA0(EXPR+2),CREGS,.TRUE.,EXITL0),FLOW(TMEMA
     *0(EXPR+4),EREGS,COND,LABEL),GENLA0(EXITL0))
          TREGS=0
          GOTO 10045
10044     ELSEL0=MKLAB0(1)
          EXITL0=MKLAB0(1)
          AD(1)=10
          AD(3)=EXITL0
          FLOWIF=SEQ(FLOW(TMEMA0(EXPR+2),CREGS,.FALSE.,ELSEL0),FLOW(TMEM
     *A0(EXPR+3),TREGS,COND,LABEL),GENMR(32,AD),GENGE0(19),GENLA0(ELSEL0
     *),FLOW(TMEMA0(EXPR+4),EREGS,COND,LABEL),GENLA0(EXITL0))
10045 CONTINUE
10043 REGS=OR(CREGS,OR(TREGS,EREGS))
      RETURN
      END
      INTEGER FUNCTION FLOWS0(EXPR,REGS,COND,LABEL)
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
      INTEGER FLOW,SEQ,GENLA0
      INTEGER LAB
      INTEGER MKLAB0
      INTEGER LREGS,RREGS
      IF((.NOT.COND))GOTO 10046
        LAB=MKLAB0(1)
        FLOWS0=FLOW(TMEMA0(EXPR+2),LREGS,.FALSE.,LAB)
        FLOWS0=SEQ(FLOWS0,FLOW(TMEMA0(EXPR+3),RREGS,.TRUE.,LABEL),GENLA0
     *(LAB))
        GOTO 10047
10046   FLOWS0=FLOW(TMEMA0(EXPR+2),LREGS,.FALSE.,LABEL)
        FLOWS0=SEQ(FLOWS0,FLOW(TMEMA0(EXPR+3),RREGS,.FALSE.,LABEL))
10047 REGS=OR(LREGS,RREGS)
      RETURN
      END
      INTEGER FUNCTION FLOWT0(EXPR,REGS,COND,LABEL)
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
      INTEGER VOID,FLOW,SEQ
      INTEGER LREGS,RREGS
      IF((TMEMA0(EXPR+2).EQ.0))GOTO 10048
        FLOWT0=VOID(TMEMA0(EXPR+1),LREGS)
        FLOWT0=SEQ(FLOWT0,FLOW(TMEMA0(EXPR+2),RREGS,COND,LABEL))
        REGS=OR(LREGS,RREGS)
        GOTO 10049
10048   FLOWT0=FLOW(TMEMA0(EXPR+1),REGS,COND,LABEL)
10049 RETURN
      END
      INTEGER FUNCTION FLOWU0(EXPR,REGS,COND,LABEL)
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
      INTEGER FLOW,SEQ,GENLA0
      INTEGER LAB
      INTEGER MKLAB0
      INTEGER LREGS,RREGS
      IF((.NOT.COND))GOTO 10050
        FLOWU0=FLOW(TMEMA0(EXPR+2),LREGS,.TRUE.,LABEL)
        FLOWU0=SEQ(FLOWU0,FLOW(TMEMA0(EXPR+3),RREGS,.TRUE.,LABEL))
        GOTO 10051
10050   LAB=MKLAB0(1)
        FLOWU0=FLOW(TMEMA0(EXPR+2),LREGS,.TRUE.,LAB)
        FLOWU0=SEQ(FLOWU0,FLOW(TMEMA0(EXPR+3),RREGS,.FALSE.,LABEL),GENLA
     *0(LAB))
10051 REGS=OR(LREGS,RREGS)
      RETURN
      END
      INTEGER FUNCTION FLOWV0(EXPR,REGS,COND,LABEL)
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
      INTEGER LOAD,SEQ
      INTEGER BRANCH
      INTEGER AAAAD0
      FLOWV0=LOAD(EXPR,REGS)
      AAAAD0=TMEMA0(EXPR+1)
      GOTO 10052
10053   IF((.NOT.COND))GOTO 10054
          BRANCH=38
          GOTO 10056
10054     BRANCH=11
10055 GOTO 10056
10057   IF((.NOT.COND))GOTO 10058
          BRANCH=28
          GOTO 10056
10058     BRANCH=23
10059 GOTO 10056
10060   IF((.NOT.COND))GOTO 10061
          BRANCH=17
          GOTO 10056
10061     BRANCH=12
10062 GOTO 10056
10052 GOTO(10053,10057,10053,10057,10060,10060),AAAAD0
        CALL PANIC('*i:  bad switch data mode in flow*n.',TMEMA0(EXPR+2)
     *)
10056 FLOWV0=SEQ(FLOWV0,GENBR0(BRANCH,LABEL))
      RETURN
      END
      INTEGER FUNCTION FLOWEQ(EXPR,REGS,COND,LABEL)
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
      INTEGER L,R
      INTEGER SEQ,GENMR,GENBR0,LD,ST,REACH,FLOW
      INTEGER RIGHT0,LEFTOP
      INTEGER SUBTR0,BRANCH,OPSIZE,LRES,RRES,LAD(5),RAD(5),TAD(5)
      INTEGER LREGS,RREGS,OPREG
      LOGICAL SAFE
      INTEGER AAAAE0
      INTEGER AAAAF0
      INTEGER AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0
      INTEGER AAAAK0
      LEFTOP=TMEMA0(EXPR+2)
      RIGHT0=TMEMA0(EXPR+3)
      AAAAH0=TMEMA0(EXPR+1)
      GOTO 10066
10067   IF((TMEMA0(RIGHT0).NE.9))GOTO 10068
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10068
          FLOWEQ=FLOW(LEFTOP,REGS,.NOT.COND,LABEL)
          RETURN
10068   IF((TMEMA0(LEFTOP).NE.9))GOTO 10069
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10069
          FLOWEQ=FLOW(RIGHT0,REGS,.NOT.COND,LABEL)
          RETURN
10069   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10070
10071   IF((TMEMA0(RIGHT0).NE.9))GOTO 10072
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10072
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10072
          FLOWEQ=FLOW(LEFTOP,REGS,.NOT.COND,LABEL)
          RETURN
10072   IF((TMEMA0(LEFTOP).NE.9))GOTO 10073
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10073
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10073
          FLOWEQ=FLOW(RIGHT0,REGS,.NOT.COND,LABEL)
          RETURN
10073   SUBTR0=46
        OPREG=:001000
        OPSIZE=2
      GOTO 10070
10074   IF((TMEMA0(RIGHT0).NE.9))GOTO 10075
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10075
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10075
          FLOWEQ=FLOW(LEFTOP,REGS,.NOT.COND,LABEL)
          RETURN
10075   IF((TMEMA0(LEFTOP).NE.9))GOTO 10076
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10076
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10076
          FLOWEQ=FLOW(RIGHT0,REGS,.NOT.COND,LABEL)
          RETURN
10076   SUBTR0=28
        OPREG=:000400
        OPSIZE=2
      GOTO 10070
10077   IF((TMEMA0(RIGHT0).NE.9))GOTO 10078
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10078
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10078
        IF((TMEMA0(RIGHT0+5).NE.0))GOTO 10078
        IF((TMEMA0(RIGHT0+6).NE.0))GOTO 10078
          FLOWEQ=FLOW(LEFTOP,REGS,.NOT.COND,LABEL)
          RETURN
10078   IF((TMEMA0(LEFTOP).NE.9))GOTO 10079
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10079
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10079
        IF((TMEMA0(LEFTOP+5).NE.0))GOTO 10079
        IF((TMEMA0(LEFTOP+6).NE.0))GOTO 10079
          FLOWEQ=FLOW(RIGHT0,REGS,.NOT.COND,LABEL)
          RETURN
10079   SUBTR0=13
        OPREG=:000200
        OPSIZE=4
      GOTO 10070
10066 GOTO(10067,10071,10067,10071,10074,10077),AAAAH0
        CALL PANIC('*i: bad flow EQ data mode*n.',TMEMA0(EXPR+1))
10070 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10080
10081   AAAAE0=1
        GOTO 10063
10084   AAAAF0=1
        GOTO 10064
10086   AAAAE0=2
        GOTO 10063
10080 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10088
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10088
      GOTO 10081
10088 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10089
      IF(SAFE(OPREG,RREGS))GOTO 10089
      GOTO 10084
10089 IF(SAFE(OPREG,LREGS))GOTO 10090
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10090
      GOTO 10086
10090 CONTINUE
        AAAAG0=1
        GOTO 10065
10091 CONTINUE
10083 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10063 AAAAI0=TMEMA0(EXPR+1)
      GOTO 10092
10093   IF((.NOT.COND))GOTO 10094
          BRANCH=1
          GOTO 10096
10094     BRANCH=6
10095 GOTO 10096
10097   IF((.NOT.COND))GOTO 10098
          BRANCH=32
          GOTO 10096
10098     BRANCH=37
10099 GOTO 10096
10100   IF((.NOT.COND))GOTO 10101
          BRANCH=12
          GOTO 10096
10101     BRANCH=17
10102 GOTO 10096
10092 GOTO(10093,10093,10097,10097,10100,10100),AAAAI0
10096 FLOWEQ=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(SUBTR0,RAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10103
10064 AAAAJ0=TMEMA0(EXPR+1)
      GOTO 10104
10105   IF((.NOT.COND))GOTO 10106
          BRANCH=1
          GOTO 10108
10106     BRANCH=6
10107 GOTO 10108
10109   IF((.NOT.COND))GOTO 10110
          BRANCH=32
          GOTO 10108
10110     BRANCH=37
10111 GOTO 10108
10112   IF((.NOT.COND))GOTO 10113
          BRANCH=12
          GOTO 10108
10113     BRANCH=17
10114 GOTO 10108
10104 GOTO(10105,10105,10109,10109,10112,10112),AAAAJ0
10108 FLOWEQ=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(SUBTR0,LAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10083
10065 AAAAK0=TMEMA0(EXPR+1)
      GOTO 10116
10117   IF((.NOT.COND))GOTO 10118
          BRANCH=1
          GOTO 10120
10118     BRANCH=6
10119 GOTO 10120
10121   IF((.NOT.COND))GOTO 10122
          BRANCH=32
          GOTO 10120
10122     BRANCH=37
10123 GOTO 10120
10124   IF((.NOT.COND))GOTO 10125
          BRANCH=12
          GOTO 10120
10125     BRANCH=17
10126 GOTO 10120
10116 GOTO(10117,10117,10121,10121,10124,10124),AAAAK0
10120 FLOWEQ=SEQ(R,LD(OPREG,RRES,RAD))
      FLOWEQ=SEQ(FLOWEQ,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(SUBTR0,
     *TAD),GENBR0(BRANCH,LABEL))
      GOTO 10091
10103 GOTO(10083,10083),AAAAE0
      GOTO 10103
      END
      INTEGER FUNCTION FLOWGE(EXPR,REGS,COND,LABEL)
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
      INTEGER L,R
      INTEGER SEQ,GENMR,GENBR0,LD,ST,REACH,FLOW,LOAD,VOID
      INTEGER SUBTR0,BRANCH,OPSIZE,LRES,RRES,LAD(5),RAD(5),TAD(5)
      INTEGER LREGS,RREGS,OPREG
      LOGICAL SAFE
      INTEGER RIGHT0,LEFTOP
      INTEGER AAAAL0
      INTEGER AAAAM0
      INTEGER AAAAN0
      INTEGER AAAAO0
      INTEGER AAAAP0
      INTEGER AAAAQ0
      INTEGER AAAAR0
      LEFTOP=TMEMA0(EXPR+2)
      RIGHT0=TMEMA0(EXPR+3)
      AAAAO0=TMEMA0(EXPR+1)
      GOTO 10131
10132   IF((TMEMA0(RIGHT0).NE.9))GOTO 10133
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10133
          IF((.NOT.COND))GOTO 10134
            FLOWGE=SEQ(LOAD(LEFTOP,REGS),GENBR0(18,LABEL))
            RETURN
10134       FLOWGE=SEQ(LOAD(LEFTOP,REGS),GENBR0(31,LABEL))
            RETURN
10133   IF((TMEMA0(LEFTOP).NE.9))GOTO 10135
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10135
          IF((.NOT.COND))GOTO 10136
            FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(22,LABEL))
            RETURN
10136       FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(19,LABEL))
            RETURN
10135   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10137
10138   IF((TMEMA0(RIGHT0).NE.9))GOTO 10139
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10139
          IF((.NOT.COND))GOTO 10140
            TAD(1)=10
            TAD(3)=LABEL
            FLOWGE=SEQ(VOID(LEFTOP,REGS),GENMR(32,TAD))
            RETURN
10140       FLOWGE=VOID(LEFTOP,REGS)
            RETURN
10139   IF((TMEMA0(LEFTOP).NE.9))GOTO 10141
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10141
          IF((.NOT.COND))GOTO 10142
            FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(11,LABEL))
            RETURN
10142       FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(38,LABEL))
            RETURN
10141   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10137
10143   IF((TMEMA0(RIGHT0).NE.9))GOTO 10144
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10144
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10144
          IF((.NOT.COND))GOTO 10145
            FLOWGE=SEQ(LOAD(LEFTOP,REGS),GENBR0(24,LABEL))
            RETURN
10145       FLOWGE=SEQ(LOAD(LEFTOP,REGS),GENBR0(27,LABEL))
            RETURN
10144   IF((TMEMA0(LEFTOP).NE.9))GOTO 10146
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10146
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10146
          IF((.NOT.COND))GOTO 10147
            FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(26,LABEL))
            RETURN
10147       FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(25,LABEL))
            RETURN
10146   SUBTR0=46
        OPREG=:001000
        OPSIZE=2
      GOTO 10137
10148   IF((TMEMA0(RIGHT0).NE.9))GOTO 10149
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10149
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10149
          IF((.NOT.COND))GOTO 10150
            TAD(1)=10
            TAD(3)=LABEL
            FLOWGE=SEQ(VOID(LEFTOP,REGS),GENMR(32,TAD))
            RETURN
10150       FLOWGE=VOID(LEFTOP,REGS)
            RETURN
10149   IF((TMEMA0(LEFTOP).NE.9))GOTO 10151
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10151
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10151
          IF((.NOT.COND))GOTO 10152
            FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(23,LABEL))
            RETURN
10152       FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(28,LABEL))
            RETURN
10151   SUBTR0=46
        OPREG=:001000
        OPSIZE=1
      GOTO 10137
10153   IF((TMEMA0(RIGHT0).NE.9))GOTO 10154
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10154
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10154
          IF((.NOT.COND))GOTO 10155
            FLOWGE=SEQ(LOAD(LEFTOP,REGS),GENBR0(13,LABEL))
            RETURN
10155       FLOWGE=SEQ(LOAD(LEFTOP,REGS),GENBR0(16,LABEL))
            RETURN
10154   IF((TMEMA0(LEFTOP).NE.9))GOTO 10156
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10156
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10156
          IF((.NOT.COND))GOTO 10157
            FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(15,LABEL))
            RETURN
10157       FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(14,LABEL))
            RETURN
10156   SUBTR0=28
        OPREG=:000400
        OPSIZE=2
      GOTO 10137
10158   IF((TMEMA0(RIGHT0).NE.9))GOTO 10159
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10159
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10159
        IF((TMEMA0(RIGHT0+5).NE.0))GOTO 10159
        IF((TMEMA0(RIGHT0+6).NE.0))GOTO 10159
          IF((.NOT.COND))GOTO 10160
            FLOWGE=SEQ(LOAD(LEFTOP,REGS),GENBR0(13,LABEL))
            RETURN
10160       FLOWGE=SEQ(LOAD(LEFTOP,REGS),GENBR0(16,LABEL))
            RETURN
10159   IF((TMEMA0(LEFTOP).NE.9))GOTO 10161
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10161
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10161
        IF((TMEMA0(LEFTOP+5).NE.0))GOTO 10161
        IF((TMEMA0(LEFTOP+6).NE.0))GOTO 10161
          IF((.NOT.COND))GOTO 10162
            FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(15,LABEL))
            RETURN
10162       FLOWGE=SEQ(LOAD(RIGHT0,REGS),GENBR0(14,LABEL))
            RETURN
10161   SUBTR0=13
        OPREG=:000200
        OPSIZE=4
      GOTO 10137
10131 GOTO(10132,10143,10138,10148,10153,10158),AAAAO0
        CALL PANIC('*i: bad flow GE data mode*n.',TMEMA0(EXPR+1))
10137 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10163
10164   AAAAL0=1
        GOTO 10128
10167   AAAAM0=1
        GOTO 10129
10169   AAAAL0=2
        GOTO 10128
10163 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10171
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10171
      GOTO 10164
10171 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10172
      IF(SAFE(OPREG,RREGS))GOTO 10172
      GOTO 10167
10172 IF(SAFE(OPREG,LREGS))GOTO 10173
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10173
      GOTO 10169
10173 CONTINUE
        AAAAN0=1
        GOTO 10130
10174 CONTINUE
10166 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10128 AAAAP0=TMEMA0(EXPR+1)
      GOTO 10175
10176   IF((.NOT.COND))GOTO 10177
          BRANCH=2
          GOTO 10179
10177     BRANCH=5
10178 GOTO 10179
10180   IF((.NOT.COND))GOTO 10181
          BRANCH=33
          GOTO 10179
10181     BRANCH=36
10182 GOTO 10179
10183   IF((.NOT.COND))GOTO 10184
          BRANCH=13
          GOTO 10179
10184     BRANCH=16
10185 GOTO 10179
10175 GOTO(10176,10176,10180,10180,10183,10183),AAAAP0
10179 FLOWGE=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(SUBTR0,RAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10186
10129 AAAAQ0=TMEMA0(EXPR+1)
      GOTO 10187
10188   IF((.NOT.COND))GOTO 10189
          BRANCH=4
          GOTO 10191
10189     BRANCH=3
10190 GOTO 10191
10192   IF((.NOT.COND))GOTO 10193
          BRANCH=35
          GOTO 10191
10193     BRANCH=34
10194 GOTO 10191
10195   IF((.NOT.COND))GOTO 10196
          BRANCH=15
          GOTO 10191
10196     BRANCH=14
10197 GOTO 10191
10187 GOTO(10188,10188,10192,10192,10195,10195),AAAAQ0
10191 FLOWGE=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(SUBTR0,LAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10166
10130 AAAAR0=TMEMA0(EXPR+1)
      GOTO 10199
10200   IF((.NOT.COND))GOTO 10201
          BRANCH=2
          GOTO 10203
10201     BRANCH=5
10202 GOTO 10203
10204   IF((.NOT.COND))GOTO 10205
          BRANCH=33
          GOTO 10203
10205     BRANCH=36
10206 GOTO 10203
10207   IF((.NOT.COND))GOTO 10208
          BRANCH=13
          GOTO 10203
10208     BRANCH=16
10209 GOTO 10203
10199 GOTO(10200,10200,10204,10204,10207,10207),AAAAR0
10203 FLOWGE=SEQ(R,LD(OPREG,RRES,RAD))
      FLOWGE=SEQ(FLOWGE,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(SUBTR0,
     *TAD),GENBR0(BRANCH,LABEL))
      GOTO 10174
10186 GOTO(10166,10166),AAAAL0
      GOTO 10186
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
C subtract                       subtr0
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
C exitlab                        exitl0
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
C elselab                        elsel0
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
