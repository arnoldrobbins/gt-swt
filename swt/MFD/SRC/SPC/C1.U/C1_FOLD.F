      INTEGER FUNCTION ISNUL0(P)
      INTEGER P
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER CONVT0
      IF((CONVT0(MEMAA0(MEMAA0(P+4)+1),MEMAA0(P+1)).NE.0))GOTO 10000
        ISNUL0=1
        RETURN
10000 ISNUL0=0
      RETURN
      END
      SUBROUTINE GENCA0(MP)
      INTEGER MP
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      CALL GENMA0
      CALL CONVO0(MP)
      RETURN
      END
      SUBROUTINE GENCO0(M2)
      INTEGER M2
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER MT
      INTEGER V
      INTEGER AAAAA0
      INTEGER AAAAB0
      MT=MEMAA0(M2+3)
      CALL ESTOP(V)
      AAAAA0=MEMAA0(MEMAA0(V+1)+3)
      GOTO 10001
10002   IF((MT.EQ.3))GOTO 10004
        IF((MT.EQ.1))GOTO 10004
        IF((MT.EQ.6))GOTO 10004
        IF((MT.EQ.4))GOTO 10004
        IF((MT.EQ.7))GOTO 10004
        GOTO 10005
10004     CALL SYNERR('Pointer will be truncated in conversion.',1)
10003 GOTO 10005
10006   IF((MT.EQ.9))GOTO 10005
        IF((MT.EQ.10))GOTO 10005
          CALL SYNERR('''Double'' will be truncated in conversion.',1)
10007 GOTO 10005
10001 AAAAB0=AAAAA0-9
      GOTO(10006,10008,10002),AAAAB0
10008 CONTINUE
10005 CALL CONVO0(M2)
      RETURN
      END
      SUBROUTINE CONVO0(M2)
      INTEGER M2
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER CTYPE,CI(4),RI(4),I
      INTEGER CONVT0
      INTEGER P,Q,M1
      INTEGER ESPOP,DSGET
      P=ESPOP(P)
      M1=MEMAA0(P+1)
      CTYPE=CONVT0(M1,M2)
      IF((CTYPE.NE.-1))GOTO 10009
        CALL SYNERR('Illegal type conversion.',0)
10009 IF((CTYPE.NE.0))GOTO 10010
      IF((MEMAA0(P).NE.3))GOTO 10010
        MEMAA0(P+1)=M2
        CALL ESPUSH(P)
        GOTO 10011
10010   IF((MEMAA0(P).NE.3))GOTO 10013
        IF((CTYPE.EQ.-2))GOTO 10013
        IF((CTYPE.EQ.-1))GOTO 10013
        GOTO 10012
10013     Q=DSGET(6)
          MEMAA0(Q)=8
          MEMAA0(Q+3)=0
          MEMAA0(Q+4)=P
          MEMAA0(Q+1)=M2
          MEMAA0(Q+2)=10
          CALL ESPUSH(Q)
          GOTO 10014
10012     I=1
          GOTO 10017
10015     I=I+(1)
10017     IF((I.GT.MEMAA0(MEMAA0(P+6))))GOTO 10016
            CI(I)=MEMAA0(MEMAA0(P+6)+I)
          GOTO 10015
10016     CALL CONVC0(CTYPE,CI,RI)
          MEMAA0(P+1)=M2
          CALL DROPL0(P)
          CALL PUTLI0(P,M2,RI)
          CALL ESPUSH(P)
10014 CONTINUE
10011 RETURN
      END
      INTEGER FUNCTION CONVT0(M1,M2)
      INTEGER M1,M2
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER CTYPE
      INTEGER ISAGG0
      INTEGER * 4 SIZEO0
      INTEGER CONVU0(15,15)
      DATA CONVU0/0,0,0,0,13,0,0,13,8,3,-1,13,-1,0,-1,0,0,0,0,13,0,0,13,
     *9,4,-1,13,-1,0,-1,0,0,0,0,13,0,0,13,8,3,-1,13,-1,0,-1,0,0,0,0,13,0
     *,0,13,8,3,-1,13,-1,0,-1,16,20,16,16,0,20,20,0,7,2,-1,0,-1,16,-1,0,
     *0,0,0,13,0,0,13,9,4,-1,13,-1,0,-1,0,0,0,0,13,0,0,13,9,4,-1,13,-1,0
     *,-1,17,21,17,17,0,21,21,0,10,5,-1,0,-1,17,-1,15,19,15,15,12,19,19,
     *23,0,1,-1,23,-1,15,-1,14,18,14,14,11,18,18,22,6,0,-1,22,-1,14,-1,-
     *1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,17,21,17,17,0,21,21,0,
     *-1,-1,-1,0,-2,17,-2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-2,0,-1,-1,0,
     *0,0,0,13,0,0,13,8,3,-1,13,-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
     *,-2,-1,-1,0/
      IF((M1.NE.M2))GOTO 10018
        CTYPE=0
        GOTO 10019
10018   IF((ISAGG0(M1).NE.1))GOTO 10020
        IF((ISAGG0(M2).NE.1))GOTO 10020
        IF((SIZEO0(M1).NE.SIZEO0(M2)))GOTO 10020
          CTYPE=0
          GOTO 10021
10020     IF((MEMAA0(M1+3).LT.1))GOTO 10023
          IF((MEMAA0(M1+3).GT.15))GOTO 10023
          IF((MEMAA0(M2+3).LT.1))GOTO 10023
          IF((MEMAA0(M2+3).GT.15))GOTO 10023
          GOTO 10022
10023       CTYPE=-1
            GOTO 10024
10022       CTYPE=CONVU0(MEMAA0(M1+3),MEMAA0(M2+3))
10024   CONTINUE
10021 CONTINUE
10019 CONVT0=CTYPE
      RETURN
      END
      SUBROUTINE CONVC0(CTYPE,CP,RP)
      INTEGER CTYPE,CP(4),RP(4)
      INTEGER I
      INTEGER CI(4),RI(4)
      INTEGER * 4 CL(2),RL(2)
      REAL CF(2),RF(2)
      REAL * 8 CD(1),RD(1)
      SHORTCALL MKONU$(18)
      EXTERNAL ARITH0
      INTEGER AAAAC0(4)
      INTEGER AAAAD0
      INTEGER AAAAE0(11)
      EQUIVALENCE (CI,CL,CF,CD),(RI,RL,RF,RD)
      DATA AAAAC0/6,-15918,-13868,-14172/
      DATA AAAAE0/227,244,249,240,229,189,170,233,170,238,0/
      CALL MKONU$(AAAAC0,LOC(ARITH0))
      DO 10025 I=1,4
        CI(I)=CP(I)
10025 CONTINUE
10026 AAAAD0=CTYPE
      GOTO 10027
10028   RF(1)=CD(1)
      GOTO 10029
10030   RL(1)=CD(1)
      GOTO 10029
10031   RI(1)=CD(1)
      GOTO 10029
10032   RL(1)=DABS(CD(1))
        RI(1)=RI(2)
      GOTO 10029
10033   RL(1)=DABS(CD(1))
      GOTO 10029
10034   RD(1)=CF(1)
      GOTO 10029
10035   RL(1)=CF(1)
      GOTO 10029
10036   RI(1)=CF(1)
      GOTO 10029
10037   RL(1)=ABS(CF(1))
        RI(1)=RI(2)
      GOTO 10029
10038   RL(1)=ABS(CF(1))
      GOTO 10029
10039   RD(1)=CL(1)
      GOTO 10029
10040   RF(1)=CL(1)
      GOTO 10029
10041   RI(1)=CL(1)
      GOTO 10029
10042   RD(1)=CI(1)
      GOTO 10029
10043   RF(1)=CI(1)
      GOTO 10029
10044   RL(1)=CI(1)
      GOTO 10029
10045   RI(1)=0
        RI(2)=CI(1)
      GOTO 10029
10046   CI(2)=CI(1)
        CI(1)=0
        RD(1)=CL(1)
      GOTO 10029
10047   CI(2)=CI(1)
        CI(1)=0
        RF(1)=CL(1)
      GOTO 10029
10048   RI(1)=0
        RI(2)=CI(1)
      GOTO 10029
10049   RI(1)=0
        RI(2)=CI(1)
      GOTO 10029
10050   RD(1)=IABS(CL(1))
      GOTO 10029
10051   RF(1)=IABS(CL(1))
      GOTO 10029
10027 GOTO(10028,10030,10031,10032,10033,10034,10035,10036,10037,10038, 
     *    10039,10040,10041,10042,10043,10044,10045,10046,10047,10048,  
     *   10049,10050,10051),AAAAD0
        CALL PRINT(-15,AAAAE0,CTYPE)
        CALL FATAL0('in conv_const: bogus value in conv_tbl.')
10029 DO 10052 I=1,4
        RP(I)=RI(I)
10052 CONTINUE
10053 RETURN
      END
      INTEGER FUNCTION GETLI0(P,V,MAXV)
      INTEGER P
      INTEGER V(1),MAXV
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER I
      I=1
      GOTO 10056
10054 I=I+(1)
10056 IF((I.GT.MAXV))GOTO 10055
      IF((I.GT.MEMAA0(MEMAA0(P+6))))GOTO 10055
        V(I)=MEMAA0(MEMAA0(P+6)+I)
      GOTO 10054
10055 GETLI0=I-1
      RETURN
      END
      SUBROUTINE PUTLI0(P,MP,V)
      INTEGER P,MP
      INTEGER V(4)
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER LEN,I
      INTEGER WSIZE
      INTEGER DSGET
      INTEGER * 4 SIZEO0
      LEN=WSIZE(SIZEO0(MP))
      MEMAA0(P+6)=DSGET(LEN+1)
      MEMAA0(MEMAA0(P+6))=LEN
      DO 10057 I=1,LEN
        MEMAA0(MEMAA0(P+6)+I)=V(I)
10057 CONTINUE
10058 RETURN
      END
      SUBROUTINE DROPL0(P)
      INTEGER P
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      IF((MEMAA0(P+6).EQ.0))GOTO 10059
        CALL DSFREE(MEMAA0(P+6))
10059 RETURN
      END
      SUBROUTINE FOLDC0(V,LE,RE)
      INTEGER V,LE,RE
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      LOGICAL VB
      INTEGER VI,LI,RI
      INTEGER * 4 VL,LL,RL
      REAL * 8 VD,LD,RD
      SHORTCALL MKONU$(18)
      EXTERNAL ARITH0
      INTEGER AAAAF0
      INTEGER AAAAG0(4)
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0
      INTEGER AAAAK0
      INTEGER AAAAL0
      INTEGER AAAAM0
      INTEGER AAAAN0
      INTEGER AAAAO0
      INTEGER AAAAP0
      INTEGER AAAAQ0
      INTEGER AAAAR0
      INTEGER AAAAS0(13)
      EQUIVALENCE (VB,VI,VL,VD),(LI,LL,LD),(RI,RL,RD)
      DATA AAAAG0/6,-15918,-13868,-14172/
      DATA AAAAS0/240,189,170,233,172,160,237,189,170,233,170,238,0/
      CALL MKONU$(AAAAG0,LOC(ARITH0))
      CALL GETLI0(LE,LI,4)
      IF((RE.EQ.0))GOTO 10061
        CALL GETLI0(RE,RI,4)
10061 AAAAH0=MEMAA0(MEMAA0(V+1)+3)
      GOTO 10062
10063   AAAAI0=MEMAA0(V+2)
        GOTO 10064
10065     VI=LI+RI
        GOTO 10092
10067     VI=AND(LI,RI)
        GOTO 10092
10068     VI=NOT(LI)
        GOTO 10092
10069     VI=LI/RI
        GOTO 10092
10070     VB=LI.EQ.RI
        GOTO 10092
10071     VB=LI.GE.RI
        GOTO 10092
10072     VB=LI.GT.RI
        GOTO 10092
10073     VB=LI.LE.RI
        GOTO 10092
10074     VI=LS(LI,RI)
        GOTO 10092
10075     VB=LI.LT.RI
        GOTO 10092
10076     VI=LI*RI
        GOTO 10092
10077     VI=-LI
        GOTO 10092
10078     VB=LI.NE.RI
        GOTO 10092
10079     VB=.FALSE.
          IF((LI.NE.0))GOTO 10092
            VB=.TRUE.
10080   GOTO 10092
10081     VI=OR(LI,RI)
        GOTO 10092
10082     VI=MOD(LI,RI)
        GOTO 10092
10083     VI=RS(LI,RI)
        GOTO 10092
10084     VB=.FALSE.
          IF((LI.EQ.0))GOTO 10092
          IF((RI.EQ.0))GOTO 10092
            VB=.TRUE.
10085   GOTO 10092
10086     VB=.TRUE.
          IF((LI.NE.0))GOTO 10092
          IF((RI.NE.0))GOTO 10092
            VB=.FALSE.
10087   GOTO 10092
10088     VI=LI-RI
        GOTO 10092
10089     VI=XOR(LI,RI)
        GOTO 10092
10064   AAAAJ0=AAAAI0-1
        GOTO(10065,10090,10067,10090,10090,10090,10068,10090,10090,10090
     *,10090,10090,10090,10090,10090,10069,10090,10070,10090,10071,10090
     *,10072,10090,10090,10090,10090,10073,10090,10074,10075,10090,10090
     *,10076,10077,10090,10078,10079,10090,10090,10090,10081,10090,10090
     *,10090,10090,10090,10090,10090,10090,10090,10090,10082,10090,10090
     *,10083,10084,10090,10090,10086,10090,10088,10090,10090,10090,10090
     *,10089),AAAAJ0
10090     AAAAF0=1
          GOTO 10060
10091   CONTINUE
10066 GOTO 10092
10093   AAAAK0=MEMAA0(V+2)
        GOTO 10094
10095     VI=LI+RI
        GOTO 10092
10097     VI=AND(LI,RI)
        GOTO 10092
10098     VI=NOT(LI)
        GOTO 10092
10099     VI=RT(INTL(LI),16)/RI
        GOTO 10092
10100     VB=LI.EQ.RI
        GOTO 10092
10101     VB=RT(INTL(LI),16).GE.RT(INTL(RI),16)
        GOTO 10092
10102     VB=RT(INTL(LI),16).GT.RT(INTL(RI),16)
        GOTO 10092
10103     VB=RT(INTL(LI),16).LE.RT(INTL(RI),16)
        GOTO 10092
10104     VI=LS(LI,RI)
        GOTO 10092
10105     VB=RT(INTL(LI),16).LT.RT(INTL(RI),16)
        GOTO 10092
10106     VI=LI*RI
        GOTO 10092
10107     VI=-LI
        GOTO 10092
10108     VB=LI.NE.RI
        GOTO 10092
10109     VB=.FALSE.
          IF((LI.NE.0))GOTO 10092
            VB=.TRUE.
10110   GOTO 10092
10111     VI=OR(LI,RI)
        GOTO 10092
10112     VI=MOD(RT(INTL(LI),16),RI)
        GOTO 10092
10113     VI=RS(LI,RI)
        GOTO 10092
10114     VB=.FALSE.
          IF((LI.EQ.0))GOTO 10092
          IF((RI.EQ.0))GOTO 10092
            VB=.TRUE.
10115   GOTO 10092
10116     VB=.TRUE.
          IF((LI.NE.0))GOTO 10092
          IF((RI.NE.0))GOTO 10092
            VB=.FALSE.
10117   GOTO 10092
10118     VI=LI-RI
        GOTO 10092
10119     VI=XOR(LI,RI)
        GOTO 10092
10094   AAAAL0=AAAAK0-1
        GOTO(10095,10120,10097,10120,10120,10120,10098,10120,10120,10120
     *,10120,10120,10120,10120,10120,10099,10120,10100,10120,10101,10120
     *,10102,10120,10120,10120,10120,10103,10120,10104,10105,10120,10120
     *,10106,10107,10120,10108,10109,10120,10120,10120,10111,10120,10120
     *,10120,10120,10120,10120,10120,10120,10120,10120,10112,10120,10120
     *,10113,10114,10120,10120,10116,10120,10118,10120,10120,10120,10120
     *,10119),AAAAL0
10120     AAAAF0=2
          GOTO 10060
10121   CONTINUE
10096 GOTO 10092
10122   AAAAM0=MEMAA0(V+2)
        GOTO 10123
10124     VL=LL+RL
        GOTO 10092
10126     VL=AND(LL,RL)
        GOTO 10092
10127     VL=NOT(LL)
        GOTO 10092
10128     VL=LL/RL
        GOTO 10092
10129     VB=LL.EQ.RL
        GOTO 10092
10130     VB=LL.GE.RL
        GOTO 10092
10131     VB=LL.GT.RL
        GOTO 10092
10132     VB=LL.LE.RL
        GOTO 10092
10133     VL=LS(LL,RI)
        GOTO 10092
10134     VB=LL.LT.RL
        GOTO 10092
10135     VL=LL*RL
        GOTO 10092
10136     VL=-LL
        GOTO 10092
10137     VB=LL.NE.RL
        GOTO 10092
10138     VB=.FALSE.
          IF((LL.NE.0))GOTO 10092
            VB=.TRUE.
10139   GOTO 10092
10140     VL=OR(LL,RL)
        GOTO 10092
10141     VL=MOD(LL,RL)
        GOTO 10092
10142     VL=RS(LL,RI)
        GOTO 10092
10143     VB=.FALSE.
          IF((LL.EQ.0))GOTO 10092
          IF((RL.EQ.0))GOTO 10092
            VB=.TRUE.
10144   GOTO 10092
10145     VB=.TRUE.
          IF((LL.NE.0))GOTO 10092
          IF((RL.NE.0))GOTO 10092
            VB=.FALSE.
10146   GOTO 10092
10147     VL=LL-RL
        GOTO 10092
10148     VL=XOR(LL,RL)
        GOTO 10092
10123   AAAAN0=AAAAM0-1
        GOTO(10124,10149,10126,10149,10149,10149,10127,10149,10149,10149
     *,10149,10149,10149,10149,10149,10128,10149,10129,10149,10130,10149
     *,10131,10149,10149,10149,10149,10132,10149,10133,10134,10149,10149
     *,10135,10136,10149,10137,10138,10149,10149,10149,10140,10149,10149
     *,10149,10149,10149,10149,10149,10149,10149,10149,10141,10149,10149
     *,10142,10143,10149,10149,10145,10149,10147,10149,10149,10149,10149
     *,10148),AAAAN0
10149     AAAAF0=3
          GOTO 10060
10150   CONTINUE
10125 GOTO 10092
10151   AAAAO0=MEMAA0(V+2)
        GOTO 10152
10153     VL=LL+RL
        GOTO 10092
10155     VL=AND(LL,RL)
        GOTO 10092
10156     VL=NOT(LL)
        GOTO 10092
10157     VL=LL/RL
        GOTO 10092
10158     VB=LL.EQ.RL
        GOTO 10092
10159     VB=LL.GE.RL
        GOTO 10092
10160     VB=LL.GT.RL
        GOTO 10092
10161     VB=LL.LE.RL
        GOTO 10092
10162     VL=LS(LL,RI)
        GOTO 10092
10163     VB=LL.LT.RL
        GOTO 10092
10164     VL=LL*RL
        GOTO 10092
10165     VL=-LL
        GOTO 10092
10166     VB=LL.NE.RL
        GOTO 10092
10167     VB=.FALSE.
          IF((LL.NE.0))GOTO 10092
            VB=.TRUE.
10168   GOTO 10092
10169     VL=OR(LL,RL)
        GOTO 10092
10170     VL=MOD(LL,RL)
        GOTO 10092
10171     VL=RS(LL,RI)
        GOTO 10092
10172     VB=.FALSE.
          IF((LL.EQ.0))GOTO 10092
          IF((RL.EQ.0))GOTO 10092
            VB=.TRUE.
10173   GOTO 10092
10174     VB=.TRUE.
          IF((LL.NE.0))GOTO 10092
          IF((RL.NE.0))GOTO 10092
            VB=.FALSE.
10175   GOTO 10092
10176     VL=LL-RL
        GOTO 10092
10177     VL=XOR(LL,RL)
        GOTO 10092
10152   AAAAP0=AAAAO0-1
        GOTO(10153,10178,10155,10178,10178,10178,10156,10178,10178,10178
     *,10178,10178,10178,10178,10178,10157,10178,10158,10178,10159,10178
     *,10160,10178,10178,10178,10178,10161,10178,10162,10163,10178,10178
     *,10164,10165,10178,10166,10167,10178,10178,10178,10169,10178,10178
     *,10178,10178,10178,10178,10178,10178,10178,10178,10170,10178,10178
     *,10171,10172,10178,10178,10174,10178,10176,10178,10178,10178,10178
     *,10177),AAAAP0
10178     AAAAF0=4
          GOTO 10060
10179   CONTINUE
10154 GOTO 10092
10180   AAAAQ0=MEMAA0(V+2)
        GOTO 10181
10182     VD=LD+RD
        GOTO 10092
10184     VD=LD/RD
        GOTO 10092
10185     VB=LD.EQ.RD
        GOTO 10092
10186     VB=LD.GE.RD
        GOTO 10092
10187     VB=LD.GT.RD
        GOTO 10092
10188     VB=LD.LE.RD
        GOTO 10092
10189     VB=LD.LT.RD
        GOTO 10092
10190     VD=LD*RD
        GOTO 10092
10191     VD=-LD
        GOTO 10092
10192     VB=LD.NE.RD
        GOTO 10092
10193     VB=.FALSE.
          IF((LD.NE.0))GOTO 10092
            VB=.TRUE.
10194   GOTO 10092
10195     VD=AMOD(LD,RD)
        GOTO 10092
10196     VB=.FALSE.
          IF((LD.EQ.0))GOTO 10092
          IF((RD.EQ.0))GOTO 10092
            VB=.TRUE.
10197   GOTO 10092
10198     VB=.TRUE.
          IF((LD.NE.0))GOTO 10092
          IF((RD.NE.0))GOTO 10092
            VB=.FALSE.
10199   GOTO 10092
10200     VD=LD-RD
        GOTO 10092
10181   IF(AAAAQ0.EQ.2)GOTO 10182
        AAAAR0=AAAAQ0-16
        GOTO(10184,10201,10185,10201,10186,10201,10187,10201,10201,10201
     *,10201,10188,10201,10201,10189,10201,10201,10190,10191,10201,10192
     *,10193,10201,10201,10201,10201,10201,10201,10201,10201,10201,10201
     *,10201,10201,10201,10201,10195,10201,10201,10201,10196,10201,10201
     *,10198,10201,10200),AAAAR0
10201     AAAAF0=5
          GOTO 10060
10202   CONTINUE
10183 GOTO 10092
10062 GOTO(10063,10063,10063,10063,10122,10093,10093,10151,10203,10180, 
     *    10203,10151,10203,10063),AAAAH0
10203   CALL PRINT(-15,AAAAS0,V,MEMAA0(V+1))
        CALL FATAL0('in fold_const: bogus mode encountered.')
10092 CALL DROPL0(LE)
      CALL PUTLI0(LE,MEMAA0(V+1),VI)
      MEMAA0(LE+1)=MEMAA0(V+1)
      RETURN
10060 CALL SYNERR('Operation is not legal on specified data types.',0)
      GOTO 10204
10204 GOTO(10091,10121,10150,10179,10202),AAAAF0
      GOTO 10204
      END
      SUBROUTINE ARITH0(X)
      INTEGER X
      CALL SYNERR('Arithmetic exception occured in constant operation.',
     *0)
      RETURN
      END
C ---- Long Name Map ----
C dumpsymentry                   dumpt0
C Procmode                       procm0
C declspecifiers                 decls0
C enterdefinition                entes0
C islvalue                       islva0
C outoper                        outop0
C installdefinition              insta0
C Nerrs                          nerrs0
C dumpsym                        dumps0
C entersmdecl                    entex0
C enumspecifier                  enums0
C openinclude                    openi0
C Nsymbol                        nsymb0
C Expsk                          expsk0
C enterchildmode                 enter0
C gencast                        genca0
C Dfoname                        dfona0
C checkarith                     check0
C droplitval                     dropl0
C outgoto                        outgo0
C returnstatement                retur0
C Nsymlen                        nsyml0
C Symptr                         sympt0
C ckfncall                       ckfnc0
C cleanupll                      clean0
C genmakearith                   genma0
C Outfp                          outfp0
C alloctemp                      alloe0
C forstatement                   forst0
C outinitend                     outio0
C outsize                        outsi0
C putbackstr                     putbc0
C Floatmodeptr                   float0
C createmode                     creat0
C displaymode                    displ0
C Expsp                          expsp0
C convoper                       convo0
C outexprtree                    outey0
C putback                        putba0
C structdeclaratorlist           strue0
C Nsymtext                       nsymt0
C Modelist                       model0
C Fnametable                     fname0
C genopnd                        genoq0
C isconstant                     iscon0
C isstored                       issto0
C Dirname                        dirna0
C invokemacro                    invok0
C makemode                       makem0
C notstatementstart              notsu0
C outexpr                        outex0
C structdecllist                 struf0
C Ll                             llaaa0
C Modesavelen                    modeu0
C functionheader                 funct0
C outdeclarations                outde0
C Charunsmodeptr                 charu0
C Modesavetype                   modes0
C structdeclaration              struc0
C Dfotop                         dfoto0
C ckputname                      ckpuu0
C findmode                       findm0
C refillbuffer                   refil0
C Keywdtbl                       keywd0
C declarations                   decla0
C entersiblingmode               entew0
C genoper                        genop0
C getlong                        getlo0
C typeorscspec                   typeo0
C declarator                     declb0
C ssalloc                        ssall0
C accesssym                      acces0
C declarelabel                   declc0
C ifstatement                    ifsta0
C initializer                    initj0
C isnullconv                     isnul0
C resetline                      reset0
C Charmodeptr                    charm0
C ckputmode                      ckput0
C createsavedmode                creau0
C displaysc                      dispo0
C dumpexpr                       dumpe0
C foldconst                      foldc0
C getlitval                      getli0
C initdeclarator                 initd0
C statementlabel                 statf0
C Idtbl                          idtbl0
C checkdeclaration               checl0
C enumdeclarator                 enumd0
C gentoboolean                   gento0
C isarith                        isari0
C processifdef                   procg0
C Dirtop                         dirto0
C constantexpr                   const0
C expression                     expre0
C outstmt                        outst0
C checkfunctiondeclaration       checm0
C convtype                       convt0
C dostatement                    dosta0
C enterll                        entev0
C Intmodeptr                     intmo0
C Doublemodeptr                  doubl0
C Zinitlen                       zinit0
C makesym                        makes0
C breakstatement                 break0
C expr10                         expr10
C externaldefinition             exter0
C structorunionspecifier         struh0
C Symbol                         symbo0
C Nsymline                       nsymm0
C Inbuf                          inbuf0
C Ibp                            ibpaa0
C convtbl                        convu0
C collectquotedstring            collf0
C notstatementend                notst0
C outname                        outna0
C arrayinit                      array0
C displayoper                    dispn0
C fatalerr                       fatal0
C findsym                        finds0
C scalarinit                     scala0
C Symlen                         symle0
C Pointermodeptr                 point0
C genindex                       genin0
C Ckfile                         ckfil0
C ckfndef                        ckfnd0
C displayop                      dispm0
C enteriddecl                    entet0
C isaggregate                    isagg0
C removedefinition               remov0
C statement                      state0
C Level                          level0
C Mem                            memaa0
C Objno                          objno0
C arithexcep                     arith0
C compoundstatement              compo0
C continuestatement              conti0
C dgetsym                        dgets0
C initdeclaratorlist             inite0
C outmode                        outmo0
C processdebug                   procf0
C savemode                       savem0
C Nsymptr                        nsymp0
C Labelmodeptr                   label0
C Shortunsmodeptr                shoru0
C allocstruct                    allod0
C structinit                     strug0
C Symtext                        symte0
C cpreprocessor                  cprep0
C process                        proce0
C recordsym                      recor0
C Unsignedmodeptr                unsig0
C Longunsmodeptr                 longu0
C bogusop                        bogus0
C enterkw                        enteu0
C outproccallarg                 outps0
C allocatestorage                alloc0
C displaysymbol                  dispp0
C alignmode                      align0
C initialize                     initi0
C nextistype                     nexti0
C skipwhitespace                 skipw0
C Shortmodeptr                   short0
C Modulename                     modul0
C getactualparameters            getac0
C gotostatement                  gotos0
C switchstatement                switc0
C Outfile                        outfi0
C ckfnend                        ckfne0
C convconst                      convc0
C dumpmode                       dumpm0
C ispointer                      ispoi0
C primary                        prima0
C Infile                         infil0
C Longmodeptr                    longm0
C comparemode                    compa0
C modifyparammode                modif0
C sizeofmode                     sizeo0
C Ctlsk                          ctlsk0
C collectactualparameter         colle0
C outinitstart                   outip0
C Pptbl                          pptbl0
C Smtbl                          smtbl0
C Modesavect                     modev0
C ckfnarg                        ckfna0
C Semsk                          semsk0
C Procrtnv                       procr0
C getdefinition                  getde0
C putlong                        putlo0
C getformalparameters            getfo0
C putbacknum                     putbb0
C Ctlsp                          ctlsp0
C Modetable                      modet0
C genconvert                     genco0
C processifndef                  proch0
C structdeclarator               strud0
C abstractdeclarator             abstr0
C deallocexpr                    deall0
C gobbleuntilelseorendif         gobbl0
C outinit                        outin0
C outproc                        outpr0
C putlitval                      putli0
C ssdealloc                      ssdea0
C typename                       typen0
C whilestatement                 while0
C Symline                        symli0
C Linenumber                     linen0
C Semsp                          semsp0
C Errorsym                       error0
