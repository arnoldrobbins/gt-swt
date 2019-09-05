      INTEGER FUNCTION LOAEZ0(EXPR,REGS)
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
      INTEGER AAAAA0
      LAB=MKLAB0(1)
      L=LOAD(TMEMA0(EXPR+2),LREGS)
      R=LOAD(TMEMA0(EXPR+3),RREGS)
      AAAAA0=TMEMA0(EXPR+1)
      GOTO 10000
10001   BRANCH=38
      GOTO 10002
10003   BRANCH=28
      GOTO 10002
10004   BRANCH=17
      GOTO 10002
10000 GOTO(10001,10003,10001,10003,10004,10004),AAAAA0
        CALL PANIC('load_sor: bad data mode*i*n.',TMEMA0(EXPR+1))
10002 LOAEZ0=SEQ(L,GENBR0(BRANCH,LAB),R,GENLA0(LAB))
      REGS=OR(LREGS,RREGS)
      RETURN
      END
      INTEGER FUNCTION LOAFB0(EXPR,REGS)
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
      INTEGER LREGS,RREGS,OPREG
      INTEGER L,R
      INTEGER SEQ,LD,ST,GENMR,REACH,GENGE0,LOADU0
      INTEGER LRES,RRES,LAD(5),RAD(5),OPSIZE,OPINS,TAD(5),COMPI0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0
      INTEGER AAAAE0
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10008
        LOAFB0=LOADU0(EXPR,REGS)
        RETURN
10008 AAAAE0=TMEMA0(EXPR+1)
      GOTO 10009
10010   OPREG=:002000
        OPSIZE=1
        OPINS=52
        COMPI0=98
      GOTO 10011
10012   OPREG=:001000
        OPSIZE=2
        OPINS=46
        COMPI0=99
      GOTO 10011
10013   OPREG=:000400
        OPSIZE=2
        OPINS=28
        COMPI0=17
      GOTO 10011
10014   OPREG=:000200
        OPSIZE=4
        OPINS=13
        COMPI0=15
      GOTO 10011
10009 GOTO(10010,10012,10010,10012,10013,10014),AAAAE0
        CALL PANIC('load_subaa: bad data mode *i*n.',TMEMA0(EXPR+1))
10011 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10015
10016   IF((.NOT.SAFE(LREGS,RREGS)))GOTO 10017
          AAAAB0=1
          GOTO 10005
10017     AAAAC0=1
          GOTO 10006
10020   CONTINUE
10019 GOTO 10021
10022   IF((.NOT.SAFE(LREGS,RREGS)))GOTO 10023
          AAAAB0=2
          GOTO 10005
10023     AAAAD0=1
          GOTO 10007
10026   CONTINUE
10025 GOTO 10021
10027   AAAAC0=2
        GOTO 10006
10015 IF((.NOT.SAFE(LREGS,OPREG)))GOTO 10029
      IF((.NOT.SAFE(RREGS,OPREG)))GOTO 10029
      GOTO 10016
10029 IF(SAFE(LREGS,OPREG))GOTO 10030
      IF((.NOT.SAFE(RREGS,OPREG)))GOTO 10030
      GOTO 10022
10030 IF((.NOT.SAFE(LREGS,OPREG)))GOTO 10031
      IF(SAFE(RREGS,OPREG))GOTO 10031
      GOTO 10027
10031 CONTINUE
        AAAAD0=2
        GOTO 10007
10032 CONTINUE
10021 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10005 LOAFB0=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(OPINS,RAD),ST(OPREG,LAD))
      GOTO 10033
10006 LOAFB0=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(OPINS,LAD),GENGE0(COMPI0),
     *ST(OPREG,LAD))
      GOTO 10034
10007 LOAFB0=SEQ(R,LD(OPREG,RRES,RAD))
      LOAFB0=SEQ(LOAFB0,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(OPINS,T
     *AD),ST(OPREG,LAD))
      GOTO 10035
10033 GOTO(10021,10021),AAAAB0
      GOTO 10033
10034 GOTO(10020,10021),AAAAC0
      GOTO 10034
10035 GOTO(10026,10032),AAAAD0
      GOTO 10035
      END
      INTEGER FUNCTION LOAFA0(EXPR,REGS)
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
      LOGICAL SAFE,OPHAS0
      INTEGER LREGS,RREGS,OPREG
      INTEGER L,R
      INTEGER SEQ,LD,ST,GENMR,REACH,GENGE0,LOAD
      INTEGER LRES,RRES,LAD(5),RAD(5),OPSIZE,OPINS,TAD(5),COMPI0,I
      INTEGER AAAAF0
      INTEGER AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAI0
      AAAAI0=TMEMA0(EXPR+1)
      GOTO 10039
10040   OPREG=:002000
        OPSIZE=1
        OPINS=52
        COMPI0=98
      GOTO 10041
10042   OPREG=:001000
        OPSIZE=2
        OPINS=46
        COMPI0=99
      GOTO 10041
10043   OPREG=:000400
        OPSIZE=2
        OPINS=28
        COMPI0=17
      GOTO 10041
10044   OPREG=:000200
        OPSIZE=4
        OPINS=13
        COMPI0=15
      GOTO 10041
10039 GOTO(10040,10042,10040,10042,10043,10044),AAAAI0
        CALL PANIC('load_sub: bad data mode *i*n.',TMEMA0(EXPR+1))
10041 IF((.NOT.OPHAS0(TMEMA0(EXPR+3),0)))GOTO 10045
        LOAFA0=LOAD(TMEMA0(EXPR+2),REGS)
        RETURN
10045 IF((.NOT.OPHAS0(TMEMA0(EXPR+2),0)))GOTO 10046
        LOAFA0=SEQ(LOAD(TMEMA0(EXPR+3),REGS),GENGE0(COMPI0))
        RETURN
10046 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10047
10048   AAAAF0=1
        GOTO 10036
10051   AAAAG0=1
        GOTO 10037
10053   AAAAF0=2
        GOTO 10036
10047 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10055
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10055
      GOTO 10048
10055 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10056
      IF(SAFE(OPREG,RREGS))GOTO 10056
      GOTO 10051
10056 IF(SAFE(OPREG,LREGS))GOTO 10057
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10057
      GOTO 10053
10057 CONTINUE
        AAAAH0=1
        GOTO 10038
10058 CONTINUE
10050 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10036 LOAFA0=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(OPINS,RAD))
      GOTO 10059
10037 LOAFA0=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(OPINS,LAD),GENGE0(COMPI0))
      GOTO 10050
10038 LOAFA0=SEQ(R,LD(OPREG,RRES,RAD))
      LOAFA0=SEQ(LOAFA0,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(OPINS,T
     *AD))
      GOTO 10058
10059 GOTO(10050,10050),AAAAF0
      GOTO 10059
      END
      INTEGER FUNCTION LOAFC0(EXPR,REGS)
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
      INTEGER LOAD,SEQ,GENLA0,GENSW0
      INTEGER CC
      INTEGER CN
      INTEGER CLABS(256),DEFLAB
      INTEGER CREGS
      LOAFC0=GENSW0(EXPR,CLABS,DEFLAB,REGS)
      CN=0
      CC=TMEMA0(EXPR+3)
10062 IF((CC.EQ.0))GOTO 10063
        IF((TMEMA0(CC).NE.7))GOTO 10064
          CN=CN+(1)
          LOAFC0=SEQ(LOAFC0,GENLA0(CLABS(CN)),LOAD(TMEMA0(CC+2),CREGS))
          REGS=OR(REGS,CREGS)
          CC=TMEMA0(CC+3)
          GOTO 10062
10064     LOAFC0=SEQ(LOAFC0,GENLA0(DEFLAB),LOAD(TMEMA0(CC+1),CREGS))
          REGS=OR(REGS,CREGS)
          CC=TMEMA0(CC+2)
10065 GOTO 10062
10063 LOAFC0=SEQ(LOAFC0,GENLA0(BREAL0(BREAK0)))
      BREAK0=BREAK0-(1)
      RETURN
      END
      INTEGER FUNCTION LOAFD0(EXPR,REGS)
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
      INTEGER AD(5)
      INTEGER LOOKX0
      IF((LOOKX0(TMEMA0(EXPR+1),AD).NE.1))GOTO 10066
        CALL FREES0(AD(3))
        CALL DELEW0(TMEMA0(EXPR+1))
        GOTO 10067
10066   CALL WARNI0('load_undefine_dynm: bad object *i*n.',TMEMA0(EXPR+1
     *))
10067 LOAFD0=0
      REGS=0
      RETURN
      END
      INTEGER FUNCTION LOAFE0(EXPR,REGS)
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
      INTEGER CAD(5),BODYL0
      INTEGER MKLAB0
      INTEGER SEQ,GENLA0,GENMR,GENGE0,VOID,FLOW,CODE
      INTEGER CREGS
      IF((BREAK0+1.LE.10))GOTO 10068
        CALL PANIC('while loops nested too deeply: break stack overflow*
     *n.')
10068 BREAK0=BREAK0+(1)
      BREAL0(BREAK0)=MKLAB0(1)
      IF((CONTI0+1.LE.10))GOTO 10069
        CALL PANIC('while loops nested too deeply: continue stack overfl
     *ow*n.')
10069 CONTI0=CONTI0+(1)
      CONTJ0(CONTI0)=MKLAB0(1)
      BODYL0=MKLAB0(1)
      CAD(1)=10
      CAD(3)=CONTJ0(CONTI0)
      LOAFE0=SEQ(GENMR(32,CAD),GENGE0(19),GENLA0(BODYL0))
      LOAFE0=SEQ(LOAFE0,VOID(TMEMA0(EXPR+2),REGS),GENLA0(CONTJ0(CONTI0))
     *)
      LOAFE0=SEQ(LOAFE0,FLOW(TMEMA0(EXPR+1),CREGS,.TRUE.,BODYL0),GENLA0(
     *BREAL0(BREAK0)))
      REGS=OR(REGS,CREGS)
      BREAK0=BREAK0-(1)
      CONTI0=CONTI0-(1)
      RETURN
      END
      INTEGER FUNCTION LOAFG0(EXPR,REGS)
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
      INTEGER LREGS,RREGS,OPREG
      INTEGER LRES,RRES,LAD(5),RAD(5),OPINS,OPSIZE,TAD(5)
      INTEGER L,R
      INTEGER SEQ,GENMR,LD,ST,REACH,LOADU0
      INTEGER AAAAJ0
      INTEGER AAAAK0
      INTEGER AAAAL0
      INTEGER AAAAM0
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10073
        LOAFG0=LOADU0(EXPR,REGS)
        RETURN
10073 AAAAM0=TMEMA0(EXPR+1)
      GOTO 10074
10075   OPREG=:002000
        OPINS=20
        OPSIZE=1
      GOTO 10076
10077   OPREG=:001000
        OPINS=21
        OPSIZE=2
      GOTO 10076
10074 GOTO(10075,10077,10075,10077),AAAAM0
        CALL PANIC('load_xoraa: bad data mode *i*n.',TMEMA0(EXPR+1))
10076 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10078
10079   IF((.NOT.SAFE(LREGS,RREGS)))GOTO 10080
          AAAAJ0=1
          GOTO 10070
10080     AAAAK0=1
          GOTO 10071
10083   CONTINUE
10082 GOTO 10084
10085   IF((.NOT.SAFE(LREGS,RREGS)))GOTO 10086
          AAAAJ0=2
          GOTO 10070
10086     AAAAL0=1
          GOTO 10072
10089   CONTINUE
10088 GOTO 10084
10090   AAAAK0=2
        GOTO 10071
10078 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10092
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10092
      GOTO 10079
10092 IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10093
      IF(SAFE(OPREG,LREGS))GOTO 10093
      GOTO 10085
10093 IF(SAFE(OPREG,RREGS))GOTO 10094
      IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10094
      GOTO 10090
10094 CONTINUE
        AAAAL0=2
        GOTO 10072
10095 CONTINUE
10084 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10070 LOAFG0=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(OPINS,RAD),ST(OPREG,LAD))
      GOTO 10096
10071 LOAFG0=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(OPINS,LAD),ST(OPREG,LAD))
      GOTO 10097
10072 LOAFG0=SEQ(R,LD(OPREG,RRES,RAD))
      LOAFG0=SEQ(LOAFG0,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(OPINS,T
     *AD),ST(OPREG,LAD))
      GOTO 10098
10096 GOTO(10084,10084),AAAAJ0
      GOTO 10096
10097 GOTO(10083,10084),AAAAK0
      GOTO 10097
10098 GOTO(10089,10095),AAAAL0
      GOTO 10098
      END
      INTEGER FUNCTION LOAFF0(EXPR,REGS)
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
      INTEGER LREGS,RREGS,OPREG
      INTEGER LRES,RRES,LAD(5),RAD(5),OPINS,OPSIZE,TAD(5)
      INTEGER L,R
      INTEGER SEQ,GENMR,LD,ST,REACH
      INTEGER AAAAN0
      INTEGER AAAAO0
      INTEGER AAAAP0
      INTEGER AAAAQ0
      AAAAQ0=TMEMA0(EXPR+1)
      GOTO 10102
10103   OPREG=:002000
        OPINS=20
        OPSIZE=1
      GOTO 10104
10105   OPREG=:001000
        OPINS=21
        OPSIZE=2
      GOTO 10104
10102 GOTO(10103,10105,10103,10105),AAAAQ0
        CALL PANIC('load_xor: bad data mode *i*n.',TMEMA0(EXPR+1))
10104 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10106
10107   AAAAN0=1
        GOTO 10099
10110   AAAAO0=1
        GOTO 10100
10112   AAAAN0=2
        GOTO 10099
10106 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10114
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10114
      GOTO 10107
10114 IF(SAFE(OPREG,RREGS))GOTO 10115
      IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10115
      GOTO 10110
10115 IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10116
      IF(SAFE(OPREG,LREGS))GOTO 10116
      GOTO 10112
10116 CONTINUE
        AAAAP0=1
        GOTO 10101
10117 CONTINUE
10109 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10099 LOAFF0=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(OPINS,RAD))
      GOTO 10118
10100 LOAFF0=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(OPINS,LAD))
      GOTO 10109
10101 LOAFF0=SEQ(R,LD(OPREG,RRES,RAD))
      LOAFF0=SEQ(LOAFF0,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(OPINS,T
     *AD))
      GOTO 10117
10118 GOTO(10109,10109),AAAAN0
      GOTO 10118
      END
      INTEGER FUNCTION LOADH0(EXPR,REGS)
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
      INTEGER I,L,U
      INTEGER LOAD,REACH,SEQ,LD,ST,LOAEU0,GENDA0,GENMR
      INTEGER LAD(5),UAD(5),RTRAD(5),TEMPS0,LRES,URES,OPSIZE,RTR,RTRID,J
     *UNK,LOOKX0
      INTEGER LREGS,UREGS,OPREG
      INTEGER AAAAR0
      INTEGER AAAAS0
      AAAAR0=TMEMA0(EXPR+1)
      GOTO 10121
10122   OPSIZE=1
        OPREG=:002000
      GOTO 10123
10124   OPSIZE=2
        OPREG=:001000
      GOTO 10123
10121 GOTO(10122,10124,10122,10124),AAAAR0
        CALL WARNI0('load_check_range: bad data mode *i*n.',TMEMA0(EXPR+
     *1))
        LOADH0=0
        RETURN
10123 L=REACH(TMEMA0(EXPR+3),LREGS,LRES,LAD)
      U=REACH(TMEMA0(EXPR+4),UREGS,URES,UAD)
      IF((LRES.NE.0))GOTO 10126
      IF((URES.NE.0))GOTO 10126
      IF((LAD(1).EQ.6))GOTO 10127
      IF((LAD(1).EQ.7))GOTO 10127
      GOTO 10126
10127 IF((UAD(1).EQ.6))GOTO 10125
      IF((UAD(1).EQ.7))GOTO 10125
      GOTO 10126
10126   TEMPS0=1
        L=SEQ(L,LD(OPREG,LRES,LAD))
        CALL ALLOC0(OPSIZE,LAD)
        L=SEQ(L,ST(OPREG,LAD))
        U=SEQ(U,LD(OPREG,URES,UAD))
        CALL ALLOC0(OPSIZE,UAD)
        U=SEQ(U,ST(OPREG,UAD))
        GOTO 10129
10125   TEMPS0=0
10129 AAAAS0=TMEMA0(EXPR+1)
      GOTO 10130
10131   IF((TEMPS0.NE.0))GOTO 10132
          RTR=30
          RTRID=RTRID0(23)
          GOTO 10134
10132     RTR=29
          RTRID=RTRID0(24)
10133 GOTO 10134
10135   IF((TEMPS0.NE.0))GOTO 10136
          RTR=28
          RTRID=RTRID0(25)
          GOTO 10134
10136     RTR=27
          RTRID=RTRID0(26)
10137 GOTO 10134
10138   IF((TEMPS0.NE.0))GOTO 10139
          RTR=26
          RTRID=RTRID0(27)
          GOTO 10134
10139     RTR=25
          RTRID=RTRID0(28)
10140 GOTO 10134
10141   IF((TEMPS0.NE.0))GOTO 10142
          RTR=24
          RTRID=RTRID0(29)
          GOTO 10134
10142     RTR=23
          RTRID=RTRID0(30)
10143 GOTO 10134
10130 GOTO(10131,10138,10135,10141),AAAAS0
10134 I=SEQ(L,LOAD(TMEMA0(EXPR+2),REGS),LOAEU0(RTR,RTRID))
      JUNK=LOOKX0(RTRID,RTRAD)
      I=SEQ(I,GENMR(35,RTRAD))
      IF((TEMPS0.NE.1))GOTO 10144
        I=SEQ(I,GENDA0(LAD(3)),GENDA0(UAD(3)))
        CALL FREET0(LAD)
        CALL FREET0(UAD)
        GOTO 10145
10144   IF((TMEMA0(EXPR+1).EQ.1))GOTO 10147
        IF((TMEMA0(EXPR+1).EQ.3))GOTO 10147
        GOTO 10146
10147     I=SEQ(I,GENDA0(LAD(2)),GENDA0(UAD(2)))
          GOTO 10148
10146     I=SEQ(I,GENDA0(LAD(2)),GENDA0(LAD(3)),GENDA0(UAD(2)),GENDA0(UA
     *D(3)))
10148 CONTINUE
10145 I=SEQ(I,GENDA0(TMEMA0(EXPR+5)))
      REGS=:003703
      LOADH0=I
      RETURN
      END
      INTEGER FUNCTION LOADI0(EXPR,REGS)
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
      INTEGER I,U
      INTEGER LOAD,REACH,SEQ,LD,ST,LOAEU0,GENDA0,GENMR
      INTEGER UAD(5),RTRAD(5),TEMPS0,URES,OPSIZE,RTR,JUNK,RTRID,LOOKX0
      INTEGER UREGS,OPREG
      INTEGER AAAAT0
      INTEGER AAAAU0
      AAAAT0=TMEMA0(EXPR+1)
      GOTO 10149
10150   OPSIZE=1
        OPREG=:002000
      GOTO 10151
10152   OPSIZE=2
        OPREG=:001000
      GOTO 10151
10149 GOTO(10150,10152,10150,10152),AAAAT0
        CALL WARNI0('load_check_upper: bad data mode *i*n.',TMEMA0(EXPR+
     *1))
        LOADI0=0
        RETURN
10151 U=REACH(TMEMA0(EXPR+3),UREGS,URES,UAD)
      IF((URES.NE.0))GOTO 10154
      IF((UAD(1).EQ.6))GOTO 10153
      IF((UAD(1).EQ.7))GOTO 10153
      GOTO 10154
10154   TEMPS0=1
        U=SEQ(U,LD(OPREG,URES,UAD))
        CALL ALLOC0(OPSIZE,UAD)
        U=SEQ(U,ST(OPREG,UAD))
        GOTO 10156
10153   TEMPS0=0
10156 AAAAU0=TMEMA0(EXPR+1)
      GOTO 10157
10158   IF((TEMPS0.NE.0))GOTO 10159
          RTRID=RTRID0(15)
          RTR=22
          GOTO 10161
10159     RTRID=RTRID0(16)
          RTR=21
10160 GOTO 10161
10162   IF((TEMPS0.NE.0))GOTO 10163
          RTRID=RTRID0(17)
          RTR=20
          GOTO 10161
10163     RTRID=RTRID0(18)
          RTR=19
10164 GOTO 10161
10165   IF((TEMPS0.NE.0))GOTO 10166
          RTRID=RTRID0(19)
          RTR=18
          GOTO 10161
10166     RTRID=RTRID0(20)
          RTR=17
10167 GOTO 10161
10168   IF((TEMPS0.NE.0))GOTO 10169
          RTRID=RTRID0(21)
          RTR=16
          GOTO 10161
10169     RTRID=RTRID0(22)
          RTR=15
10170 GOTO 10161
10157 GOTO(10158,10165,10162,10168),AAAAU0
10161 I=SEQ(U,LOAD(TMEMA0(EXPR+2),REGS),LOAEU0(RTR,RTRID))
      JUNK=LOOKX0(RTRID,RTRAD)
      I=SEQ(I,GENMR(35,RTRAD))
      IF((TEMPS0.NE.1))GOTO 10171
        I=SEQ(I,GENDA0(UAD(3)))
        CALL FREET0(UAD)
        GOTO 10172
10171   IF((TMEMA0(EXPR+1).EQ.1))GOTO 10174
        IF((TMEMA0(EXPR+1).EQ.3))GOTO 10174
        GOTO 10173
10174     I=SEQ(I,GENDA0(UAD(2)))
          GOTO 10175
10173     I=SEQ(I,GENDA0(UAD(2)),GENDA0(UAD(3)))
10175 CONTINUE
10172 I=SEQ(I,GENDA0(TMEMA0(EXPR+4)))
      REGS=:003703
      LOADI0=I
      RETURN
      END
      INTEGER FUNCTION LOADG0(EXPR,REGS)
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
      INTEGER I,L
      INTEGER LOAD,REACH,SEQ,LD,ST,LOAEU0,GENDA0,GENMR
      INTEGER LAD(5),RTRAD(5),RTRID,TEMPS0,LRES,OPSIZE,RTR,JUNK,LOOKX0
      INTEGER LREGS,OPREG
      INTEGER AAAAV0
      INTEGER AAAAW0
      AAAAV0=TMEMA0(EXPR+1)
      GOTO 10176
10177   OPSIZE=1
        OPREG=:002000
      GOTO 10178
10179   OPSIZE=2
        OPREG=:001000
      GOTO 10178
10176 GOTO(10177,10179,10177,10179),AAAAV0
        CALL WARNI0('load_check_lower: bad data mode *i*n.',TMEMA0(EXPR+
     *1))
        LOADG0=0
        RETURN
10178 L=REACH(TMEMA0(EXPR+3),LREGS,LRES,LAD)
      IF((LRES.NE.0))GOTO 10181
      IF((LAD(1).EQ.6))GOTO 10180
      IF((LAD(1).EQ.7))GOTO 10180
      GOTO 10181
10181   TEMPS0=1
        L=SEQ(L,LD(OPREG,LRES,LAD))
        CALL ALLOC0(OPSIZE,LAD)
        L=SEQ(L,ST(OPREG,LAD))
        GOTO 10183
10180   TEMPS0=0
10183 AAAAW0=TMEMA0(EXPR+1)
      GOTO 10184
10185   IF((TEMPS0.NE.0))GOTO 10186
          RTRID=RTRID0(7)
          RTR=14
          GOTO 10188
10186     RTRID=RTRID0(8)
          RTR=13
10187 GOTO 10188
10189   IF((TEMPS0.NE.0))GOTO 10190
          RTRID=RTRID0(9)
          RTR=12
          GOTO 10188
10190     RTRID=RTRID0(10)
          RTR=11
10191 GOTO 10188
10192   IF((TEMPS0.NE.0))GOTO 10193
          RTRID=RTRID0(11)
          RTR=10
          GOTO 10188
10193     RTRID=RTRID0(12)
          RTR=9
10194 GOTO 10188
10195   IF((TEMPS0.NE.0))GOTO 10196
          RTRID=RTRID0(13)
          RTR=8
          GOTO 10188
10196     RTRID=RTRID0(14)
          RTR=7
10197 GOTO 10188
10184 GOTO(10185,10192,10189,10195),AAAAW0
10188 I=SEQ(L,LOAD(TMEMA0(EXPR+2),REGS),LOAEU0(RTR,RTRID))
      JUNK=LOOKX0(RTRID,RTRAD)
      I=SEQ(I,GENMR(35,RTRAD))
      IF((TEMPS0.NE.1))GOTO 10198
        I=SEQ(I,GENDA0(LAD(3)))
        CALL FREET0(LAD)
        GOTO 10199
10198   IF((TMEMA0(EXPR+1).EQ.1))GOTO 10201
        IF((TMEMA0(EXPR+1).EQ.3))GOTO 10201
        GOTO 10200
10201     I=SEQ(I,GENDA0(LAD(2)))
          GOTO 10202
10200     I=SEQ(I,GENDA0(LAD(2)),GENDA0(LAD(3)))
10202 CONTINUE
10199 I=SEQ(I,GENDA0(TMEMA0(EXPR+4)))
      REGS=:003703
      LOADG0=I
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
C compins                        compi0
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
C tempsused                      temps0
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
C bodylab                        bodyl0
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
