      INTEGER FUNCTION FLOWGT(EXPR,REGS,COND,LABEL)
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
      INTEGER SEQ,GENMR,GENBR0,LD,ST,REACH,LOAD,VOID
      INTEGER SUBTR0,BRANCH,OPSIZE,LRES,RRES,LAD(5),RAD(5),TAD(5)
      INTEGER LREGS,RREGS,OPREG
      LOGICAL SAFE
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER LEFTOP,RIGHT0
      INTEGER AAAAD0
      INTEGER AAAAE0
      INTEGER AAAAF0
      INTEGER AAAAG0
      LEFTOP=TMEMA0(EXPR+2)
      RIGHT0=TMEMA0(EXPR+3)
      AAAAD0=TMEMA0(EXPR+1)
      GOTO 10003
10004   IF((TMEMA0(RIGHT0).NE.9))GOTO 10005
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10005
          IF((.NOT.COND))GOTO 10006
            FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(19,LABEL))
            RETURN
10006       FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(22,LABEL))
            RETURN
10005   IF((TMEMA0(LEFTOP).NE.9))GOTO 10007
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10007
          IF((.NOT.COND))GOTO 10008
            FLOWGT=SEQ(LOAD(RIGHT0,REGS),GENBR0(31,LABEL))
            RETURN
10008       FLOWGT=SEQ(LOAD(RIGHT0,REGS),GENBR0(18,LABEL))
            RETURN
10007   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10009
10010   IF((TMEMA0(RIGHT0).NE.9))GOTO 10011
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10011
          IF((.NOT.COND))GOTO 10012
            FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(38,LABEL))
            RETURN
10012       FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(11,LABEL))
            RETURN
10011   IF((TMEMA0(LEFTOP).NE.9))GOTO 10013
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10013
          IF((.NOT.COND))GOTO 10014
            FLOWGT=VOID(RIGHT0,REGS)
            RETURN
10014       TAD(1)=10
            TAD(3)=LABEL
            FLOWGT=SEQ(VOID(RIGHT0,REGS),GENMR(32,TAD))
            RETURN
10013   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10009
10015   IF((TMEMA0(RIGHT0).NE.9))GOTO 10016
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10016
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10016
          IF((.NOT.COND))GOTO 10017
            FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(25,LABEL))
            RETURN
10017       FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(26,LABEL))
            RETURN
10016   IF((TMEMA0(LEFTOP).NE.9))GOTO 10018
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10018
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10018
          IF((.NOT.COND))GOTO 10019
            FLOWGT=SEQ(LOAD(RIGHT0,REGS),GENBR0(27,LABEL))
            RETURN
10019       FLOWGT=SEQ(LOAD(RIGHT0,REGS),GENBR0(24,LABEL))
            RETURN
10018   SUBTR0=46
        OPREG=:001000
        OPSIZE=2
      GOTO 10009
10020   IF((TMEMA0(RIGHT0).NE.9))GOTO 10021
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10021
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10021
          IF((.NOT.COND))GOTO 10022
            FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(28,LABEL))
            RETURN
10022       FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(23,LABEL))
            RETURN
10021   IF((TMEMA0(LEFTOP).NE.9))GOTO 10023
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10023
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10023
          IF((.NOT.COND))GOTO 10024
            FLOWGT=VOID(RIGHT0,REGS)
            RETURN
10024       TAD(1)=10
            TAD(3)=LABEL
            FLOWGT=SEQ(VOID(RIGHT0,REGS),GENMR(32,TAD))
            RETURN
10023   SUBTR0=46
        OPREG=:001000
        OPSIZE=2
      GOTO 10009
10025   IF((TMEMA0(RIGHT0).NE.9))GOTO 10026
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10026
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10026
          IF((.NOT.COND))GOTO 10027
            FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(14,LABEL))
            RETURN
10027       FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(15,LABEL))
            RETURN
10026   IF((TMEMA0(LEFTOP).NE.9))GOTO 10028
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10028
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10028
          IF((.NOT.COND))GOTO 10029
            FLOWGT=SEQ(LOAD(RIGHT0,REGS),GENBR0(16,LABEL))
            RETURN
10029       FLOWGT=SEQ(LOAD(RIGHT0,REGS),GENBR0(13,LABEL))
            RETURN
10028   SUBTR0=28
        OPREG=:000400
        OPSIZE=2
      GOTO 10009
10030   IF((TMEMA0(RIGHT0).NE.9))GOTO 10031
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10031
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10031
        IF((TMEMA0(RIGHT0+5).NE.0))GOTO 10031
        IF((TMEMA0(RIGHT0+6).NE.0))GOTO 10031
          IF((.NOT.COND))GOTO 10032
            FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(14,LABEL))
            RETURN
10032       FLOWGT=SEQ(LOAD(LEFTOP,REGS),GENBR0(15,LABEL))
            RETURN
10031   IF((TMEMA0(LEFTOP).NE.9))GOTO 10033
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10033
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10033
        IF((TMEMA0(LEFTOP+5).NE.0))GOTO 10033
        IF((TMEMA0(LEFTOP+6).NE.0))GOTO 10033
          IF((.NOT.COND))GOTO 10034
            FLOWGT=SEQ(LOAD(RIGHT0,REGS),GENBR0(16,LABEL))
            RETURN
10034       FLOWGT=SEQ(LOAD(RIGHT0,REGS),GENBR0(13,LABEL))
            RETURN
10033   SUBTR0=13
        OPREG=:000200
        OPSIZE=4
      GOTO 10009
10003 GOTO(10004,10015,10010,10020,10025,10030),AAAAD0
        CALL PANIC('*i: bad flow GT data mode*n.',TMEMA0(EXPR+1))
10009 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10035
10036   AAAAA0=1
        GOTO 10000
10039   AAAAB0=1
        GOTO 10001
10041   AAAAA0=2
        GOTO 10000
10035 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10043
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10043
      GOTO 10036
10043 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10044
      IF(SAFE(OPREG,RREGS))GOTO 10044
      GOTO 10039
10044 IF(SAFE(OPREG,LREGS))GOTO 10045
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10045
      GOTO 10041
10045 CONTINUE
        AAAAC0=1
        GOTO 10002
10046 CONTINUE
10038 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10000 AAAAE0=TMEMA0(EXPR+1)
      GOTO 10047
10048   IF((.NOT.COND))GOTO 10049
          BRANCH=3
          GOTO 10051
10049     BRANCH=4
10050 GOTO 10051
10052   IF((.NOT.COND))GOTO 10053
          BRANCH=34
          GOTO 10051
10053     BRANCH=35
10054 GOTO 10051
10055   IF((.NOT.COND))GOTO 10056
          BRANCH=14
          GOTO 10051
10056     BRANCH=15
10057 GOTO 10051
10047 GOTO(10048,10048,10052,10052,10055,10055),AAAAE0
10051 FLOWGT=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(SUBTR0,RAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10058
10001 AAAAF0=TMEMA0(EXPR+1)
      GOTO 10059
10060   IF((.NOT.COND))GOTO 10061
          BRANCH=5
          GOTO 10063
10061     BRANCH=2
10062 GOTO 10063
10064   IF((.NOT.COND))GOTO 10065
          BRANCH=36
          GOTO 10063
10065     BRANCH=33
10066 GOTO 10063
10067   IF((.NOT.COND))GOTO 10068
          BRANCH=16
          GOTO 10063
10068     BRANCH=13
10069 GOTO 10063
10059 GOTO(10060,10060,10064,10064,10067,10067),AAAAF0
10063 FLOWGT=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(SUBTR0,LAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10038
10002 AAAAG0=TMEMA0(EXPR+1)
      GOTO 10071
10072   IF((.NOT.COND))GOTO 10073
          BRANCH=3
          GOTO 10075
10073     BRANCH=4
10074 GOTO 10075
10076   IF((.NOT.COND))GOTO 10077
          BRANCH=34
          GOTO 10075
10077     BRANCH=35
10078 GOTO 10075
10079   IF((.NOT.COND))GOTO 10080
          BRANCH=14
          GOTO 10075
10080     BRANCH=15
10081 GOTO 10075
10071 GOTO(10072,10072,10076,10076,10079,10079),AAAAG0
10075 FLOWGT=SEQ(R,LD(OPREG,RRES,RAD))
      FLOWGT=SEQ(FLOWGT,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(SUBTR0,
     *TAD),GENBR0(BRANCH,LABEL))
      GOTO 10046
10058 GOTO(10038,10038),AAAAA0
      GOTO 10058
      END
      INTEGER FUNCTION FLOWLE(EXPR,REGS,COND,LABEL)
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
      INTEGER SEQ,GENMR,GENBR0,LD,ST,REACH,LOAD,VOID
      INTEGER SUBTR0,BRANCH,OPSIZE,LRES,RRES,LAD(5),RAD(5),TAD(5)
      INTEGER LREGS,RREGS,OPREG
      LOGICAL SAFE
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0
      INTEGER LEFTOP,RIGHT0
      INTEGER AAAAK0
      INTEGER AAAAL0
      INTEGER AAAAM0
      INTEGER AAAAN0
      LEFTOP=TMEMA0(EXPR+2)
      RIGHT0=TMEMA0(EXPR+3)
      AAAAK0=TMEMA0(EXPR+1)
      GOTO 10086
10087   IF((TMEMA0(RIGHT0).NE.9))GOTO 10088
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10088
          IF((.NOT.COND))GOTO 10089
            FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(22,LABEL))
            RETURN
10089       FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(19,LABEL))
            RETURN
10088   IF((TMEMA0(LEFTOP).NE.9))GOTO 10090
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10090
          IF((.NOT.COND))GOTO 10091
            FLOWLE=SEQ(LOAD(RIGHT0,REGS),GENBR0(18,LABEL))
            RETURN
10091       FLOWLE=SEQ(LOAD(RIGHT0,REGS),GENBR0(31,LABEL))
            RETURN
10090   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10092
10093   IF((TMEMA0(RIGHT0).NE.9))GOTO 10094
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10094
          IF((.NOT.COND))GOTO 10095
            FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(11,LABEL))
            RETURN
10095       FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(38,LABEL))
            RETURN
10094   IF((TMEMA0(LEFTOP).NE.9))GOTO 10096
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10096
          IF((.NOT.COND))GOTO 10097
            TAD(1)=10
            TAD(3)=LABEL
            FLOWLE=SEQ(VOID(RIGHT0,REGS),GENMR(32,TAD))
            RETURN
10097       FLOWLE=VOID(RIGHT0,REGS)
            RETURN
10096   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10092
10098   IF((TMEMA0(RIGHT0).NE.9))GOTO 10099
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10099
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10099
          IF((.NOT.COND))GOTO 10100
            FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(26,LABEL))
            RETURN
10100       FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(25,LABEL))
            RETURN
10099   IF((TMEMA0(LEFTOP).NE.9))GOTO 10101
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10101
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10101
          IF((.NOT.COND))GOTO 10102
            FLOWLE=SEQ(LOAD(RIGHT0,REGS),GENBR0(24,LABEL))
            RETURN
10102       FLOWLE=SEQ(LOAD(RIGHT0,REGS),GENBR0(27,LABEL))
            RETURN
10101   SUBTR0=46
        OPREG=:001000
        OPSIZE=2
      GOTO 10092
10103   IF((TMEMA0(RIGHT0).NE.9))GOTO 10104
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10104
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10104
          IF((.NOT.COND))GOTO 10105
            FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(23,LABEL))
            RETURN
10105       FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(28,LABEL))
            RETURN
10104   IF((TMEMA0(LEFTOP).NE.9))GOTO 10106
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10106
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10106
          IF((.NOT.COND))GOTO 10107
            TAD(1)=10
            TAD(3)=LABEL
            FLOWLE=SEQ(VOID(RIGHT0,REGS),GENMR(32,TAD))
            RETURN
10107       FLOWLE=VOID(RIGHT0,REGS)
            RETURN
10106   SUBTR0=46
        OPREG=:001000
        OPSIZE=2
      GOTO 10092
10108   IF((TMEMA0(RIGHT0).NE.9))GOTO 10109
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10109
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10109
          IF((.NOT.COND))GOTO 10110
            FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(15,LABEL))
            RETURN
10110       FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(14,LABEL))
            RETURN
10109   IF((TMEMA0(LEFTOP).NE.9))GOTO 10111
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10111
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10111
          IF((.NOT.COND))GOTO 10112
            FLOWLE=SEQ(LOAD(RIGHT0,REGS),GENBR0(13,LABEL))
            RETURN
10112       FLOWLE=SEQ(LOAD(RIGHT0,REGS),GENBR0(16,LABEL))
            RETURN
10111   SUBTR0=28
        OPREG=:000400
        OPSIZE=2
      GOTO 10092
10113   IF((TMEMA0(RIGHT0).NE.9))GOTO 10114
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10114
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10114
        IF((TMEMA0(RIGHT0+5).NE.0))GOTO 10114
        IF((TMEMA0(RIGHT0+6).NE.0))GOTO 10114
          IF((.NOT.COND))GOTO 10115
            FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(15,LABEL))
            RETURN
10115       FLOWLE=SEQ(LOAD(LEFTOP,REGS),GENBR0(14,LABEL))
            RETURN
10114   IF((TMEMA0(LEFTOP).NE.9))GOTO 10116
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10116
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10116
        IF((TMEMA0(LEFTOP+5).NE.0))GOTO 10116
        IF((TMEMA0(LEFTOP+6).NE.0))GOTO 10116
          IF((.NOT.COND))GOTO 10117
            FLOWLE=SEQ(LOAD(RIGHT0,REGS),GENBR0(13,LABEL))
            RETURN
10117       FLOWLE=SEQ(LOAD(RIGHT0,REGS),GENBR0(16,LABEL))
            RETURN
10116   SUBTR0=13
        OPREG=:000200
        OPSIZE=4
      GOTO 10092
10086 GOTO(10087,10098,10093,10103,10108,10113),AAAAK0
        CALL PANIC('*i: bad flow LE data mode*n.',TMEMA0(EXPR+1))
10092 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10118
10119   AAAAH0=1
        GOTO 10083
10122   AAAAI0=1
        GOTO 10084
10124   AAAAH0=2
        GOTO 10083
10118 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10126
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10126
      GOTO 10119
10126 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10127
      IF(SAFE(OPREG,RREGS))GOTO 10127
      GOTO 10122
10127 IF(SAFE(OPREG,LREGS))GOTO 10128
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10128
      GOTO 10124
10128 CONTINUE
        AAAAJ0=1
        GOTO 10085
10129 CONTINUE
10121 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10083 AAAAL0=TMEMA0(EXPR+1)
      GOTO 10130
10131   IF((.NOT.COND))GOTO 10132
          BRANCH=4
          GOTO 10134
10132     BRANCH=3
10133 GOTO 10134
10135   IF((.NOT.COND))GOTO 10136
          BRANCH=35
          GOTO 10134
10136     BRANCH=34
10137 GOTO 10134
10138   IF((.NOT.COND))GOTO 10139
          BRANCH=15
          GOTO 10134
10139     BRANCH=14
10140 GOTO 10134
10130 GOTO(10131,10131,10135,10135,10138,10138),AAAAL0
10134 FLOWLE=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(SUBTR0,RAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10141
10084 AAAAM0=TMEMA0(EXPR+1)
      GOTO 10142
10143   IF((.NOT.COND))GOTO 10144
          BRANCH=2
          GOTO 10146
10144     BRANCH=5
10145 GOTO 10146
10147   IF((.NOT.COND))GOTO 10148
          BRANCH=33
          GOTO 10146
10148     BRANCH=36
10149 GOTO 10146
10150   IF((.NOT.COND))GOTO 10151
          BRANCH=13
          GOTO 10146
10151     BRANCH=16
10152 GOTO 10146
10142 GOTO(10143,10143,10147,10147,10150,10150),AAAAM0
10146 FLOWLE=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(SUBTR0,LAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10121
10085 AAAAN0=TMEMA0(EXPR+1)
      GOTO 10154
10155   IF((.NOT.COND))GOTO 10156
          BRANCH=4
          GOTO 10158
10156     BRANCH=3
10157 GOTO 10158
10159   IF((.NOT.COND))GOTO 10160
          BRANCH=35
          GOTO 10158
10160     BRANCH=34
10161 GOTO 10158
10162   IF((.NOT.COND))GOTO 10163
          BRANCH=15
          GOTO 10158
10163     BRANCH=14
10164 GOTO 10158
10154 GOTO(10155,10155,10159,10159,10162,10162),AAAAN0
10158 FLOWLE=SEQ(R,LD(OPREG,RRES,RAD))
      FLOWLE=SEQ(FLOWLE,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(SUBTR0,
     *TAD),GENBR0(BRANCH,LABEL))
      GOTO 10129
10141 GOTO(10121,10121),AAAAH0
      GOTO 10141
      END
      INTEGER FUNCTION FLOWLT(EXPR,REGS,COND,LABEL)
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
      INTEGER SEQ,GENMR,GENBR0,LD,ST,REACH,LOAD,VOID
      INTEGER SUBTR0,BRANCH,OPSIZE,LRES,RRES,LAD(5),RAD(5),TAD(5)
      INTEGER LREGS,RREGS,OPREG
      LOGICAL SAFE
      INTEGER AAAAO0
      INTEGER AAAAP0
      INTEGER AAAAQ0
      INTEGER LEFTOP,RIGHT0
      INTEGER AAAAR0
      INTEGER AAAAS0
      INTEGER AAAAT0
      INTEGER AAAAU0
      LEFTOP=TMEMA0(EXPR+2)
      RIGHT0=TMEMA0(EXPR+3)
      AAAAR0=TMEMA0(EXPR+1)
      GOTO 10169
10170   IF((TMEMA0(RIGHT0).NE.9))GOTO 10171
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10171
          IF((.NOT.COND))GOTO 10172
            FLOWLT=SEQ(LOAD(LEFTOP,REGS),GENBR0(31,LABEL))
            RETURN
10172       FLOWLT=SEQ(LOAD(LEFTOP,REGS),GENBR0(18,LABEL))
            RETURN
10171   IF((TMEMA0(LEFTOP).NE.9))GOTO 10173
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10173
          IF((.NOT.COND))GOTO 10174
            FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(19,LABEL))
            RETURN
10174       FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(22,LABEL))
            RETURN
10173   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10175
10176   IF((TMEMA0(RIGHT0).NE.9))GOTO 10177
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10177
          IF((.NOT.COND))GOTO 10178
            FLOWLT=VOID(LEFTOP,REGS)
            RETURN
10178       TAD(1)=10
            TAD(3)=LABEL
            FLOWLT=SEQ(VOID(LEFTOP,REGS),GENMR(32,TAD))
            RETURN
10177   IF((TMEMA0(LEFTOP).NE.9))GOTO 10179
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10179
          IF((.NOT.COND))GOTO 10180
            FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(38,LABEL))
            RETURN
10180       FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(11,LABEL))
            RETURN
10179   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10175
10181   IF((TMEMA0(RIGHT0).NE.9))GOTO 10182
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10182
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10182
          IF((.NOT.COND))GOTO 10183
            FLOWLT=SEQ(LOAD(LEFTOP,REGS),GENBR0(27,LABEL))
            RETURN
10183       FLOWLT=SEQ(LOAD(LEFTOP,REGS),GENBR0(24,LABEL))
            RETURN
10182   IF((TMEMA0(LEFTOP).NE.9))GOTO 10184
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10184
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10184
          IF((.NOT.COND))GOTO 10185
            FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(25,LABEL))
            RETURN
10185       FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(26,LABEL))
            RETURN
10184   SUBTR0=46
        OPREG=:001000
        OPSIZE=2
      GOTO 10175
10186   IF((TMEMA0(RIGHT0).NE.9))GOTO 10187
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10187
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10187
          IF((.NOT.COND))GOTO 10188
            FLOWLT=VOID(LEFTOP,REGS)
            RETURN
10188       TAD(1)=10
            TAD(3)=LABEL
            FLOWLT=SEQ(VOID(LEFTOP,REGS),GENMR(32,TAD))
            RETURN
10187   IF((TMEMA0(LEFTOP).NE.9))GOTO 10189
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10189
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10189
          IF((.NOT.COND))GOTO 10190
            FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(28,LABEL))
            RETURN
10190       FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(23,LABEL))
            RETURN
10189   SUBTR0=46
        OPREG=:001000
        OPSIZE=2
      GOTO 10175
10191   IF((TMEMA0(RIGHT0).NE.9))GOTO 10192
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10192
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10192
          IF((.NOT.COND))GOTO 10193
            FLOWLT=SEQ(LOAD(LEFTOP,REGS),GENBR0(16,LABEL))
            RETURN
10193       FLOWLT=SEQ(LOAD(LEFTOP,REGS),GENBR0(13,LABEL))
            RETURN
10192   IF((TMEMA0(LEFTOP).NE.9))GOTO 10194
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10194
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10194
          IF((.NOT.COND))GOTO 10195
            FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(14,LABEL))
            RETURN
10195       FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(15,LABEL))
            RETURN
10194   SUBTR0=28
        OPREG=:000400
        OPSIZE=2
      GOTO 10175
10196   IF((TMEMA0(RIGHT0).NE.9))GOTO 10197
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10197
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10197
        IF((TMEMA0(RIGHT0+5).NE.0))GOTO 10197
        IF((TMEMA0(RIGHT0+6).NE.0))GOTO 10197
          IF((.NOT.COND))GOTO 10198
            FLOWLT=SEQ(LOAD(LEFTOP,REGS),GENBR0(16,LABEL))
            RETURN
10198       FLOWLT=SEQ(LOAD(LEFTOP,REGS),GENBR0(13,LABEL))
            RETURN
10197   IF((TMEMA0(LEFTOP).NE.9))GOTO 10199
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10199
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10199
        IF((TMEMA0(LEFTOP+5).NE.0))GOTO 10199
        IF((TMEMA0(LEFTOP+6).NE.0))GOTO 10199
          IF((.NOT.COND))GOTO 10200
            FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(14,LABEL))
            RETURN
10200       FLOWLT=SEQ(LOAD(RIGHT0,REGS),GENBR0(15,LABEL))
            RETURN
10199   SUBTR0=13
        OPREG=:000200
        OPSIZE=4
      GOTO 10175
10169 GOTO(10170,10181,10176,10186,10191,10196),AAAAR0
        CALL PANIC('*i: bad flow LT data mode*n.',TMEMA0(EXPR+1))
10175 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10201
10202   AAAAO0=1
        GOTO 10166
10205   AAAAP0=1
        GOTO 10167
10207   AAAAO0=2
        GOTO 10166
10201 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10209
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10209
      GOTO 10202
10209 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10210
      IF(SAFE(OPREG,RREGS))GOTO 10210
      GOTO 10205
10210 IF(SAFE(OPREG,LREGS))GOTO 10211
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10211
      GOTO 10207
10211 CONTINUE
        AAAAQ0=1
        GOTO 10168
10212 CONTINUE
10204 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10166 AAAAS0=TMEMA0(EXPR+1)
      GOTO 10213
10214   IF((.NOT.COND))GOTO 10215
          BRANCH=5
          GOTO 10217
10215     BRANCH=2
10216 GOTO 10217
10218   IF((.NOT.COND))GOTO 10219
          BRANCH=36
          GOTO 10217
10219     BRANCH=33
10220 GOTO 10217
10221   IF((.NOT.COND))GOTO 10222
          BRANCH=16
          GOTO 10217
10222     BRANCH=13
10223 GOTO 10217
10213 GOTO(10214,10214,10218,10218,10221,10221),AAAAS0
10217 FLOWLT=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(SUBTR0,RAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10224
10167 AAAAT0=TMEMA0(EXPR+1)
      GOTO 10225
10226   IF((.NOT.COND))GOTO 10227
          BRANCH=3
          GOTO 10229
10227     BRANCH=4
10228 GOTO 10229
10230   IF((.NOT.COND))GOTO 10231
          BRANCH=34
          GOTO 10229
10231     BRANCH=35
10232 GOTO 10229
10233   IF((.NOT.COND))GOTO 10234
          BRANCH=14
          GOTO 10229
10234     BRANCH=15
10235 GOTO 10229
10225 GOTO(10226,10226,10230,10230,10233,10233),AAAAT0
10229 FLOWLT=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(SUBTR0,LAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10204
10168 AAAAU0=TMEMA0(EXPR+1)
      GOTO 10237
10238   IF((.NOT.COND))GOTO 10239
          BRANCH=5
          GOTO 10241
10239     BRANCH=2
10240 GOTO 10241
10242   IF((.NOT.COND))GOTO 10243
          BRANCH=36
          GOTO 10241
10243     BRANCH=33
10244 GOTO 10241
10245   IF((.NOT.COND))GOTO 10246
          BRANCH=16
          GOTO 10241
10246     BRANCH=13
10247 GOTO 10241
10237 GOTO(10238,10238,10242,10242,10245,10245),AAAAU0
10241 FLOWLT=SEQ(R,LD(OPREG,RRES,RAD))
      FLOWLT=SEQ(FLOWLT,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(SUBTR0,
     *TAD),GENBR0(BRANCH,LABEL))
      GOTO 10212
10224 GOTO(10204,10204),AAAAO0
      GOTO 10224
      END
      INTEGER FUNCTION FLOWNE(EXPR,REGS,COND,LABEL)
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
      INTEGER AAAAV0
      INTEGER AAAAW0
      INTEGER AAAAX0
      INTEGER AAAAY0
      INTEGER AAAAZ0
      INTEGER AAABA0
      INTEGER AAABB0
      LEFTOP=TMEMA0(EXPR+2)
      RIGHT0=TMEMA0(EXPR+3)
      AAAAY0=TMEMA0(EXPR+1)
      GOTO 10252
10253   IF((TMEMA0(RIGHT0).NE.9))GOTO 10254
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10254
          FLOWNE=FLOW(LEFTOP,REGS,COND,LABEL)
          RETURN
10254   IF((TMEMA0(LEFTOP).NE.9))GOTO 10255
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10255
          FLOWNE=FLOW(RIGHT0,REGS,COND,LABEL)
          RETURN
10255   SUBTR0=52
        OPREG=:002000
        OPSIZE=1
      GOTO 10256
10257   IF((TMEMA0(RIGHT0).NE.9))GOTO 10258
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10258
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10258
          FLOWNE=FLOW(LEFTOP,REGS,COND,LABEL)
          RETURN
10258   IF((TMEMA0(LEFTOP).NE.9))GOTO 10259
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10259
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10259
          FLOWNE=FLOW(RIGHT0,REGS,COND,LABEL)
          RETURN
10259   SUBTR0=46
        OPREG=:001000
        OPSIZE=2
      GOTO 10256
10260   IF((TMEMA0(RIGHT0).NE.9))GOTO 10261
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10261
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10261
          FLOWNE=FLOW(LEFTOP,REGS,COND,LABEL)
          RETURN
10261   IF((TMEMA0(LEFTOP).NE.9))GOTO 10262
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10262
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10262
          FLOWNE=FLOW(RIGHT0,REGS,COND,LABEL)
          RETURN
10262   SUBTR0=28
        OPREG=:000400
        OPSIZE=2
      GOTO 10256
10263   IF((TMEMA0(RIGHT0).NE.9))GOTO 10264
        IF((TMEMA0(RIGHT0+3).NE.0))GOTO 10264
        IF((TMEMA0(RIGHT0+4).NE.0))GOTO 10264
        IF((TMEMA0(RIGHT0+5).NE.0))GOTO 10264
        IF((TMEMA0(RIGHT0+6).NE.0))GOTO 10264
          FLOWNE=FLOW(LEFTOP,REGS,COND,LABEL)
          RETURN
10264   IF((TMEMA0(LEFTOP).NE.9))GOTO 10265
        IF((TMEMA0(LEFTOP+3).NE.0))GOTO 10265
        IF((TMEMA0(LEFTOP+4).NE.0))GOTO 10265
        IF((TMEMA0(LEFTOP+5).NE.0))GOTO 10265
        IF((TMEMA0(LEFTOP+6).NE.0))GOTO 10265
          FLOWNE=FLOW(RIGHT0,REGS,COND,LABEL)
          RETURN
10265   SUBTR0=13
        OPREG=:000200
        OPSIZE=4
      GOTO 10256
10252 GOTO(10253,10257,10253,10257,10260,10263),AAAAY0
        CALL PANIC('*i: bad flow NE data mode*n.',TMEMA0(EXPR+1))
10256 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10266
10267   AAAAV0=1
        GOTO 10249
10270   AAAAW0=1
        GOTO 10250
10272   AAAAV0=2
        GOTO 10249
10266 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10274
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10274
      GOTO 10267
10274 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10275
      IF(SAFE(OPREG,RREGS))GOTO 10275
      GOTO 10270
10275 IF(SAFE(OPREG,LREGS))GOTO 10276
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10276
      GOTO 10272
10276 CONTINUE
        AAAAX0=1
        GOTO 10251
10277 CONTINUE
10269 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RETURN
10249 AAAAZ0=TMEMA0(EXPR+1)
      GOTO 10278
10279   IF((.NOT.COND))GOTO 10280
          BRANCH=6
          GOTO 10282
10280     BRANCH=1
10281 GOTO 10282
10283   IF((.NOT.COND))GOTO 10284
          BRANCH=37
          GOTO 10282
10284     BRANCH=32
10285 GOTO 10282
10286   IF((.NOT.COND))GOTO 10287
          BRANCH=17
          GOTO 10282
10287     BRANCH=12
10288 GOTO 10282
10278 GOTO(10279,10279,10283,10283,10286,10286),AAAAZ0
10282 FLOWNE=SEQ(L,LD(OPREG,LRES,LAD),R,GENMR(SUBTR0,RAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10289
10250 AAABA0=TMEMA0(EXPR+1)
      GOTO 10290
10291   IF((.NOT.COND))GOTO 10292
          BRANCH=6
          GOTO 10294
10292     BRANCH=1
10293 GOTO 10294
10295   IF((.NOT.COND))GOTO 10296
          BRANCH=37
          GOTO 10294
10296     BRANCH=32
10297 GOTO 10294
10298   IF((.NOT.COND))GOTO 10299
          BRANCH=17
          GOTO 10294
10299     BRANCH=12
10300 GOTO 10294
10290 GOTO(10291,10291,10295,10295,10298,10298),AAABA0
10294 FLOWNE=SEQ(R,LD(OPREG,RRES,RAD),L,GENMR(SUBTR0,LAD),GENBR0(BRANCH,
     *LABEL))
      GOTO 10269
10251 AAABB0=TMEMA0(EXPR+1)
      GOTO 10302
10303   IF((.NOT.COND))GOTO 10304
          BRANCH=6
          GOTO 10306
10304     BRANCH=1
10305 GOTO 10306
10307   IF((.NOT.COND))GOTO 10308
          BRANCH=37
          GOTO 10306
10308     BRANCH=32
10309 GOTO 10306
10310   IF((.NOT.COND))GOTO 10311
          BRANCH=17
          GOTO 10306
10311     BRANCH=12
10312 GOTO 10306
10302 GOTO(10303,10303,10307,10307,10310,10310),AAABB0
10306 FLOWNE=SEQ(R,LD(OPREG,RRES,RAD))
      FLOWNE=SEQ(FLOWNE,ST(OPREG,TAD),L,LD(OPREG,LRES,LAD),GENMR(SUBTR0,
     *TAD),GENBR0(BRANCH,LABEL))
      GOTO 10277
10289 GOTO(10269,10269),AAAAV0
      GOTO 10289
      END
      INTEGER FUNCTION FLOWN0(EXPR,REGS,COND,LABEL)
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
      INTEGER FLOW
      FLOWN0=FLOW(TMEMA0(EXPR+2),REGS,.NOT.COND,LABEL)
      RETURN
      END
      INTEGER FUNCTION FLOWF0(EXPR,REGS,COND,LABEL)
      INTEGER EXPR
      INTEGER REGS
      LOGICAL COND
      INTEGER LABEL
      INTEGER FLFIE0
      FLOWF0=FLFIE0(EXPR,REGS,COND,LABEL)
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
