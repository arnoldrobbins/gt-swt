      INTEGER FUNCTION REACH(TREE,REGS,RES,AD)
      INTEGER TREE
      INTEGER REGS
      INTEGER RES,AD(5)
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
      INTEGER REACI0,REACL0,REACJ0,REACM0,REACK0,LOAD,REACN0,REACH0
      INTEGER AAAAA0
      INTEGER AAAAB0
      IF((TREE.NE.0))GOTO 10000
        REACH=0
        REGS=0
        RES=1
        AD(1)=1
        AD(2)=:000000
        AD(3)=0
        RETURN
10000 AAAAA0=TMEMA0(TREE)
      GOTO 10001
10002   REACH=REACI0(TREE,REGS,RES,AD)
      GOTO 10003
10004   REACH=REACL0(TREE,REGS,RES,AD)
      GOTO 10003
10005   REACH=REACJ0(TREE,REGS,RES,AD)
      GOTO 10003
10006   REACH=REACM0(TREE,REGS,RES,AD)
      GOTO 10003
10007   REACH=REACK0(TREE,REGS,RES,AD)
      GOTO 10003
10008   REACH=REACN0(TREE,REGS,RES,AD)
      GOTO 10003
10009   REACH=REACH0(TREE,REGS,RES,AD)
      GOTO 10003
10001 AAAAB0=AAAAA0-4
      GOTO(10009,10010,10010,10010,10002,10010,10010,10010,10010,10010, 
     *    10005,10010,10010,10010,10010,10010,10010,10010,10010,10010,  
     *   10007),AAAAB0
      IF(AAAAA0.EQ.40)GOTO 10004
      AAAAB0=AAAAA0-57
      GOTO(10006,10008),AAAAB0
10010   REACH=LOAD(TREE,REGS)
        RES=1
10003 RETURN
      END
      INTEGER FUNCTION REACI0(TREE,REGS,RES,AD)
      INTEGER TREE
      INTEGER REGS
      INTEGER RES,AD(5)
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
      INTEGER SEQ,GENDA0,GENGE0
      INTEGER I
      INTEGER AAAAC0
      REGS=0
      RES=0
      AAAAC0=TMEMA0(TREE+1)
      GOTO 10011
10012   AD(1)=6
        AD(2)=TMEMA0(TREE+3)
        REACI0=0
      GOTO 10013
10014   AD(1)=7
        AD(2)=TMEMA0(TREE+3)
        AD(3)=TMEMA0(TREE+4)
        REACI0=0
      GOTO 10013
10015   AD(1)=8
        AD(2)=TMEMA0(TREE+3)
        AD(3)=TMEMA0(TREE+4)
        REACI0=0
      GOTO 10013
10016   AD(1)=9
        AD(2)=TMEMA0(TREE+3)
        AD(3)=TMEMA0(TREE+4)
        AD(4)=TMEMA0(TREE+5)
        AD(5)=TMEMA0(TREE+6)
        REACI0=0
      GOTO 10013
10017   AD(1)=1
        AD(2)=:000002
        AD(3)=RSVLI0(TMEMA0(TREE+2))
        REACI0=GENGE0(53)
        I=1
        GOTO 10020
10018   I=I+(1)
10020   IF((I.GT.TMEMA0(TREE+2)))GOTO 10019
          REACI0=SEQ(REACI0,GENDA0(TMEMA0(TREE+2+I)))
        GOTO 10018
10019   REACI0=SEQ(REACI0,GENGE0(69))
      GOTO 10013
10011 GOTO(10012,10014,10012,10014,10015,10016,10017),AAAAC0
        CALL PANIC('reach_const: bad constant mode (*i)*n.',TMEMA0(TREE+
     *1))
10013 RETURN
      END
      INTEGER FUNCTION REACL0(TREE,REGS,RES,AD)
      INTEGER TREE
      INTEGER REGS
      INTEGER RES,AD(5)
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
      INTEGER LOOKX0
      REGS=0
      RES=0
      IF((LOOKX0(TMEMA0(TREE+2),AD).NE.0))GOTO 10021
        AD(1)=10
        AD(3)=TMEMA0(TREE+2)
10021 REACL0=0
      RETURN
      END
      INTEGER FUNCTION REACJ0(TREE,REGS,RES,AD)
      INTEGER TREE
      INTEGER REGS
      INTEGER RES,AD(5)
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
      INTEGER PR
      INTEGER REACH,SEQ,GENMR
      INTEGER PREGS
      INTEGER PRES,PAD(5),TAD(5)
      IF((TMEMA0(TMEMA0(TREE+2)).NE.51))GOTO 10022
        REACJ0=REACH(TMEMA0(TMEMA0(TREE+2)+2),REGS,RES,AD)
        RETURN
10022 PR=REACH(TMEMA0(TREE+2),PREGS,PRES,PAD)
      IF((PRES.NE.1))GOTO 10023
        TAD(1)=1
        TAD(2)=:000000
        TAD(3)=:17
        REACJ0=SEQ(PR,GENMR(49,TAD))
        AD(1)=1
        AD(2)=:000003
        AD(3)=0
        REGS=OR(:000003,PREGS)
        GOTO 10024
10023   IF((PAD(1).NE.1))GOTO 10025
          AD(1)=3
          AD(2)=PAD(2)
          AD(3)=PAD(3)
          REGS=PREGS
          REACJ0=PR
          GOTO 10026
10025     IF((PAD(1).NE.2))GOTO 10027
            AD(1)=5
            AD(2)=PAD(2)
            AD(3)=PAD(3)
            REGS=PREGS
            REACJ0=PR
            GOTO 10028
10027       REACJ0=SEQ(PR,GENMR(19,PAD))
            AD(1)=3
            AD(2)=:000003
            AD(3)=0
            REGS=OR(:000003,PREGS)
10028   CONTINUE
10026 CONTINUE
10024 RES=0
      RETURN
      END
      INTEGER FUNCTION REACM0(TREE,REGS,RES,AD)
      INTEGER TREE
      INTEGER REGS
      INTEGER RES,AD(5)
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
      INTEGER BR
      INTEGER REACH,SEQ,GENMR
      INTEGER BAD(5),FAD(5),BRES
      INTEGER BREGS
      BR=REACH(TMEMA0(TREE+3),BREGS,BRES,BAD)
      IF((BRES.NE.1))GOTO 10029
        FAD(1)=1
        FAD(2)=:000000
        FAD(3)=:17
        REACM0=SEQ(BR,GENMR(49,FAD))
        REGS=OR(:000003,BREGS)
        AD(1)=1
        AD(2)=:000003
        AD(3)=TMEMA0(TREE+2)
        GOTO 10030
10029   IF((TMEMA0(TREE+2).NE.0))GOTO 10031
          REGS=BREGS
          RES=0
          CALL ADCOPY(BAD,AD)
          REACM0=BR
          RETURN
10031   IF((BAD(1).EQ.1))GOTO 10033
        IF((BAD(1).EQ.2))GOTO 10033
        GOTO 10032
10033     REACM0=BR
          REGS=BREGS
          AD(1)=BAD(1)
          AD(2)=BAD(2)
          AD(3)=BAD(3)+TMEMA0(TREE+2)
          GOTO 10034
10032     IF((BAD(1).NE.3))GOTO 10035
            FAD(1)=6
            FAD(2)=TMEMA0(TREE+2)
            REACM0=SEQ(BR,GENMR(40,FAD))
            REGS=OR(:000100,BREGS)
            AD(1)=4
            AD(2)=BAD(2)
            AD(3)=BAD(3)
            GOTO 10036
10035       REACM0=SEQ(BR,GENMR(19,BAD))
            REGS=OR(:000003,BREGS)
            AD(1)=1
            AD(2)=:000003
            AD(3)=TMEMA0(TREE+2)
10036   CONTINUE
10034 CONTINUE
10030 RES=0
      RETURN
      END
      INTEGER FUNCTION REACK0(TREE,REGS,RES,AD)
      INTEGER TREE
      INTEGER REGS
      INTEGER RES,AD(5)
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
      INTEGER AREGS,IREGS
      INTEGER ARES,IRES,AAD(5),IAD(5),TAD(5)
      INTEGER AR,IR
      INTEGER REACH,SEQ,GENMR,GENGE0,MULABY
      INTEGER AAAAD0
      RES=0
      AR=REACH(TMEMA0(TREE+2),AREGS,ARES,AAD)
      IR=REACH(TMEMA0(TREE+3),IREGS,IRES,IAD)
      IF((IRES.NE.1))GOTO 10038
        IR=SEQ(IR,MULABY(TMEMA0(TREE+4)),GENGE0(95))
        GOTO 10039
10038   IF((IAD(1).NE.6))GOTO 10040
          IF((IAD(2).NE.0))GOTO 10041
            CALL ADCOPY(AAD,AD)
            REGS=AREGS
            REACK0=AR
            RETURN
10041     IF((AAD(1).EQ.1))GOTO 10043
          IF((AAD(1).EQ.2))GOTO 10043
          GOTO 10042
10043       AD(1)=AAD(1)
            AD(2)=AAD(2)
            AD(3)=AAD(3)+IAD(2)*TMEMA0(TREE+4)
            REGS=AREGS
            REACK0=AR
            RETURN
10042     IAD(2)=IAD(2)*(TMEMA0(TREE+4))
          IR=GENMR(40,IAD)
          GOTO 10044
10040     IF((IAD(1).EQ.1))GOTO 10046
          IF((IAD(1).EQ.3))GOTO 10046
          GOTO 10045
10046       IF((TMEMA0(TREE+4).NE.1))GOTO 10047
              IR=SEQ(IR,GENMR(40,IAD))
              GOTO 10053
10047         IF((TMEMA0(TREE+4).NE.2))GOTO 10049
                IR=SEQ(IR,GENMR(26,IAD))
                GOTO 10050
10049           IF((TMEMA0(TREE+4).NE.4))GOTO 10051
                  IR=SEQ(IR,GENMR(11,IAD))
                  GOTO 10052
10051             IR=SEQ(IR,GENMR(37,IAD),MULABY(TMEMA0(TREE+4)),GENGE0(
     *95))
                  IREGS=OR(IREGS,:002000)
10052         CONTINUE
10050       CONTINUE
10048       GOTO 10053
10045       IR=SEQ(IR,GENMR(37,IAD),MULABY(TMEMA0(TREE+4)),GENGE0(95))
            IREGS=OR(IREGS,:002000)
10053   CONTINUE
10044 CONTINUE
10039 IF((ARES.NE.0))GOTO 10054
        IF((AAD(1).NE.1))GOTO 10055
          IF((AAD(2).NE.:000003))GOTO 10056
          IF((AND(IREGS,:000003).EQ.0))GOTO 10056
            AAAAD0=1
            GOTO 10037
10056       REACK0=SEQ(AR,IR)
            REGS=OR(:000100,OR(AREGS,IREGS))
            AD(1)=2
            AD(2)=AAD(2)
            AD(3)=AAD(3)
10058     GOTO 10068
10055     IF((AAD(1).NE.3))GOTO 10060
            IF((AAD(2).NE.:000003))GOTO 10061
            IF((AND(IREGS,:000003).EQ.0))GOTO 10061
              AAAAD0=2
              GOTO 10037
10061         REACK0=SEQ(AR,IR)
              REGS=OR(:000100,OR(AREGS,IREGS))
              AD(1)=4
              AD(2)=AAD(2)
              AD(3)=AAD(3)
10063       GOTO 10064
10060       IF((AND(IREGS,:000003).EQ.0))GOTO 10065
              AAAAD0=3
              GOTO 10037
10065         REACK0=SEQ(AR,GENMR(19,AAD),IR)
              REGS=OR(:000100,OR(:000003,OR(AREGS,IREGS)))
              AD(1)=2
              AD(2)=:000003
              AD(3)=0
10067     CONTINUE
10064   CONTINUE
10059   GOTO 10068
10054   IF((AND(IREGS,:000003).NE.0))GOTO 10069
          TAD(1)=1
          TAD(2)=:000000
          TAD(3)=:17
          REACK0=SEQ(AR,GENMR(49,TAD),IR)
          REGS=OR(:000100,OR(:000003,OR(AREGS,IREGS)))
          AD(1)=2
          AD(2)=:000003
          AD(3)=0
          GOTO 10070
10069     CALL ALLOC0(2,TAD)
          REACK0=SEQ(AR,GENMR(48,TAD),IR)
          TAD(1)=4
          REACK0=SEQ(REACK0,GENMR(19,TAD))
          CALL FREET0(TAD)
          REGS=OR(:000100,OR(:000003,OR(AREGS,IREGS)))
          AD(1)=1
          AD(2)=:000003
          AD(3)=0
10070 CONTINUE
10068 RETURN
10037 CALL ALLOC0(2,TAD)
      REACK0=SEQ(AR,GENMR(17,AAD),GENMR(48,TAD),IR)
      TAD(1)=4
      REACK0=SEQ(REACK0,GENMR(19,TAD))
      CALL FREET0(TAD)
      REGS=OR(:000100,OR(:000003,OR(AREGS,IREGS)))
      AD(1)=1
      AD(2)=:000003
      AD(3)=0
      GOTO 10071
10071 GOTO(10068,10064,10067),AAAAD0
      GOTO 10071
      END
      INTEGER FUNCTION REACN0(TREE,REGS,RES,AD)
      INTEGER TREE
      INTEGER REGS
      INTEGER RES,AD(5)
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
      INTEGER LREGS
      INTEGER VOID,REACH,SEQ
      IF((TMEMA0(TREE+2).NE.0))GOTO 10072
        REACN0=REACH(TMEMA0(TREE+1),REGS,RES,AD)
        GOTO 10073
10072   REACN0=SEQ(VOID(TMEMA0(TREE+1),LREGS),REACH(TMEMA0(TREE+2),REGS,
     *RES,AD))
        REGS=OR(REGS,LREGS)
10073 RETURN
      END
      INTEGER FUNCTION REACH0(EXPR,REGS,RES,AD)
      INTEGER EXPR
      INTEGER REGS
      INTEGER RES,AD(5)
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
      INTEGER LRES,RRES,LAD(5),RAD(5),TAD(5),OPSIZE,LISTE0,RISTE0,LTEMP0
     *(5),RTEMP0(5)
      INTEGER L,R
      INTEGER SEQ,LD,ST,REACH,LOAD,STFIE0,GENMR,GENCO0
      INTEGER MESG(15)
      INTEGER AAAAE0
      INTEGER AAAAF0
      INTEGER AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0
      INTEGER AAAAK0
      INTEGER AAAAL0
      DATA MESG/242,229,225,227,232,223,225,243,243,233,231,238,186,160,
     *0/
      IF((TMEMA0(TMEMA0(EXPR+2)).NE.69))GOTO 10077
        REACH0=LOAD(TMEMA0(EXPR+3),RREGS)
        AAAAH0=TMEMA0(EXPR+1)
        GOTO 10078
10079     CALL ALLOC0(1,TAD)
          REACH0=SEQ(REACH0,GENMR(47,TAD),STFIE0(TMEMA0(EXPR+2),LREGS),G
     *ENMR(37,TAD))
          CALL FREET0(TAD)
          REGS=OR(LREGS,RREGS)
          RES=1
          RETURN
10080     CALL ALLOC0(2,TAD)
          REACH0=SEQ(REACH0,GENMR(48,TAD),STFIE0(TMEMA0(EXPR+2),LREGS),G
     *ENMR(38,TAD))
          CALL FREET0(TAD)
          REGS=OR(LREGS,RREGS)
          RES=1
          RETURN
10078   GOTO(10079,10080,10079,10080),AAAAH0
          CALL WARNI0('*sbad data mode in bit field *i*n.',MESG,TMEMA0(E
     *XPR+1))
          REACH0=0
          RETURN
10077 AAAAI0=TMEMA0(EXPR+1)
      GOTO 10081
10082   OPREG=:002000
        OPSIZE=1
      GOTO 10083
10084   OPREG=:001000
        OPSIZE=2
      GOTO 10083
10085   OPREG=:000400
        OPSIZE=2
      GOTO 10083
10086   OPREG=:000200
        OPSIZE=4
      GOTO 10083
10087   AAAAJ0=TMEMA0(EXPR+4)
        GOTO 10088
10089     OPREG=:002000
          OPSIZE=1
        GOTO 10083
10091     OPREG=:001000
          OPSIZE=2
        GOTO 10083
10092     OPREG=:000200
          OPSIZE=4
        GOTO 10083
10088   GOTO(10089,10091,10093,10092),AAAAJ0
10093     CALL ALLOC0(2,LTEMP0)
          CALL ALLOC0(2,RTEMP0)
          L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
          IF((LRES.EQ.0))GOTO 10094
            CALL WARNI0('*sleft struct op not lvalue*n.',MESG)
            REACH0=0
            RETURN
10094     AAAAK0=LAD(1)
          GOTO 10095
10096       LISTE0=0
          GOTO 10097
10098       IF((LAD(2).EQ.:000001))GOTO 10100
            IF((LAD(2).EQ.:000002))GOTO 10100
            GOTO 10099
10100         LISTE0=0
              GOTO 10097
10099         LISTE0=1
10101     GOTO 10097
10102       LISTE0=1
          GOTO 10097
10097       IF((LISTE0.NE.1))GOTO 10104
              L=SEQ(L,GENMR(17,LAD))
              CALL ADCOPY(LTEMP0,LAD)
              L=SEQ(L,GENMR(48,LAD))
              LAD(1)=3
10103     GOTO 10104
10095     GOTO(10098,10102,10098,10102,10102,10096,10096,10096,10096,   
     *  10096),AAAAK0
            CALL WARNI0('*sbad left op addr mode *i*n.',MESG,LAD(1))
            REACH0=0
            RETURN
10104     R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
          IF((RRES.EQ.0))GOTO 10105
            CALL WARNI0('*sright struct op not lvalue*n.',MESG)
            REACH0=0
            RETURN
10105     AAAAL0=RAD(1)
          GOTO 10106
10107       RISTE0=0
          GOTO 10108
10109       IF((LAD(2).EQ.:000001))GOTO 10111
            IF((LAD(2).EQ.:000002))GOTO 10111
            GOTO 10110
10111         RISTE0=0
              GOTO 10108
10110         RISTE0=1
10112     GOTO 10108
10113       RISTE0=1
          GOTO 10108
10108       IF((RISTE0.NE.1))GOTO 10115
              R=SEQ(R,GENMR(17,RAD))
              CALL ADCOPY(RTEMP0,RAD)
              R=SEQ(R,GENMR(48,RAD))
              RAD(1)=3
10114     GOTO 10115
10106     GOTO(10109,10113,10109,10113,10113,10107,10107,10107,10107,   
     *  10107),AAAAL0
            CALL WARNI0('*sbad right op addr mode *i*n.',MESG,RAD(1))
            REACH0=0
            RETURN
10115     REGS=:003703
          REACH0=SEQ(L,R,GENCO0(RAD,LAD,TMEMA0(EXPR+4)))
          IF((RISTE0.NE.1))GOTO 10116
            CALL FREET0(RTEMP0)
10116     CALL ADCOPY(LAD,AD)
          RES=0
          RETURN
10081 GOTO(10082,10084,10082,10084,10085,10086,10087),AAAAI0
        CALL PANIC('*sbad data mode *i*n.',MESG,TMEMA0(EXPR+1))
10083 R=REACH(TMEMA0(EXPR+3),RREGS,RRES,RAD)
      CALL ALLOC0(OPSIZE,TAD)
      L=REACH(TMEMA0(EXPR+2),LREGS,LRES,LAD)
      GOTO 10117
10118   AAAAE0=1
        GOTO 10074
10121   AAAAE0=2
        GOTO 10074
10123   IF((.NOT.SAFE(LREGS,RREGS)))GOTO 10124
          AAAAF0=1
          GOTO 10075
10124     AAAAG0=1
          GOTO 10076
10127   CONTINUE
10126 GOTO 10120
10117 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10128
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10128
      GOTO 10118
10128 IF((.NOT.SAFE(OPREG,LREGS)))GOTO 10129
      IF(SAFE(OPREG,RREGS))GOTO 10129
      GOTO 10121
10129 IF(SAFE(OPREG,LREGS))GOTO 10130
      IF((.NOT.SAFE(OPREG,RREGS)))GOTO 10130
      GOTO 10123
10130 CONTINUE
        AAAAG0=2
        GOTO 10076
10131 CONTINUE
10120 CALL FREET0(TAD)
      REGS=OR(OPREG,OR(LREGS,RREGS))
      RES=1
      RETURN
10074 REACH0=SEQ(R,LD(OPREG,RRES,RAD),L,ST(OPREG,LAD))
      GOTO 10132
10075 REACH0=SEQ(L,R,LD(OPREG,RRES,RAD),ST(OPREG,LAD))
      GOTO 10120
10076 REACH0=SEQ(R,LD(OPREG,RRES,RAD))
      REACH0=SEQ(REACH0,ST(OPREG,TAD),L,LD(OPREG,0,TAD),ST(OPREG,LAD))
      GOTO 10134
10132 GOTO(10120,10120),AAAAE0
      GOTO 10132
10134 GOTO(10127,10131),AAAAG0
      GOTO 10134
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
C ltempad                        ltemp0
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
C rtempad                        rtemp0
C loadconst                      loadk0
C loadmul                        loaeb0
C loadpostinc                    loaek0
C otg$ecb                        otg$g0
C putbranch                      putbr0
C resolvelit                     reson0
C voidfieldasgop                 voidf0
C Tmem                           tmema0
C EmitPMA                        emitp0
C pathological                   patho0
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
C listemp                        liste0
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
C ristemp                        riste0
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
