      SUBROUTINE GENOQ0(P)
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
      CALL ESPUSH(P)
      RETURN
      END
      SUBROUTINE GENINT(I)
      INTEGER I
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
      INTEGER STR(20)
      CALL ITOC(I,STR,20)
      CALL GENLIT(1025,STR,0)
      RETURN
      END
      SUBROUTINE GENLIT(TYPE,TEXT,TLEN)
      INTEGER TYPE
      INTEGER TEXT(1)
      INTEGER TLEN
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
      INTEGER P,Q,R
      INTEGER DSGET
      INTEGER GCTOI,CTOC,CTOP
      INTEGER * 4 GCTOL
      REAL * 8 CTOD
      INTEGER CBUF(200)
      INTEGER CC(200)
      INTEGER CI
      INTEGER * 4 CL
      REAL * 8 CD
      INTEGER AAAAA0
      INTEGER AAAAB0
      EQUIVALENCE (CBUF,CC,CI,CL,CD)
      P=DSGET(10)
      MEMAA0(P)=3
      MEMAA0(P+2)=5
      MEMAA0(P+3)=1
      MEMAA0(P+4)=-1
      MEMAA0(P+5)=0
      MEMAA0(P+6)=0
      I=1
      AAAAA0=TYPE
      GOTO 10000
10001   MEMAA0(P+1)=SHORT0
        CI=GCTOI(TEXT,I,10)
      GOTO 10002
10003   MEMAA0(P+1)=LONGM0
        CL=GCTOL(TEXT,I,10)
      GOTO 10002
10004   MEMAA0(P+1)=DOUBL0
        CD=CTOD(TEXT,I)
      GOTO 10002
10005   IF((A$BUF(245-225+1).EQ.0))GOTO 10006
          I=1
          GOTO 10009
10007     I=I+(1)
10009     IF((I.GT.TLEN))GOTO 10008
            TEXT(I)=AND(TEXT(I),127)
          GOTO 10007
10008   CONTINUE
10006   I=1
        GOTO 10012
10010   I=I+(1)
10012   IF((I.GT.TLEN))GOTO 10011
        IF((I.GT.200-1))GOTO 10011
          CC(I)=TEXT(I)
        GOTO 10010
10011   CC(I)=0
        MEMAA0(P+1)=CHARM0
        CALL CREAT0(MEMAA0(P+1),13,I)
      GOTO 10002
10013   IF((A$BUF(245-225+1).EQ.0))GOTO 10014
          I=1
          GOTO 10017
10015     I=I+(1)
10017     IF((I.GT.TLEN))GOTO 10016
            TEXT(I)=AND(TEXT(I),127)
          GOTO 10015
10016   CONTINUE
10014   IF((TLEN.GT.0))GOTO 10018
          MEMAA0(P+1)=INTMO0
          CALL SYNERR('Character literal must have at least 1 character.
     *',0)
          CC(1)=0
          GOTO 10002
10018     IF((TLEN.NE.1))GOTO 10020
            MEMAA0(P+1)=INTMO0
            CC(1)=TEXT(1)
            GOTO 10021
10020       I=0
            GOTO 10024
10022       CONTINUE
10024       IF((I.GE.TLEN))GOTO 10023
              IF((AND(I,1).NE.0))GOTO 10025
                CC(RS(I,1)+1)=XOR(LS(TEXT(I+1),8),RT(CC(RS(I,1)+1),8))
                GOTO 10026
10025           CC(RS(I,1)+1)=XOR(LT(CC(RS(I,1)+1),8),TEXT(I+1))
10026         I=I+(1)
            GOTO 10022
10023       IF((MOD(I,2).NE.1))GOTO 10027
              IF((AND(I,1).NE.0))GOTO 10028
                CC(RS(I,1)+1)=XOR(LS(160,8),RT(CC(RS(I,1)+1),8))
                GOTO 10029
10028           CC(RS(I,1)+1)=XOR(LT(CC(RS(I,1)+1),8),160)
10029         I=I+(1)
10027       MEMAA0(P+1)=INTMO0
            CALL CREAT0(MEMAA0(P+1),13,I/2)
10021   CONTINUE
10019 GOTO 10002
10000 AAAAB0=AAAAA0-1020
      GOTO(10013,10004,10030,10003,10001,10005),AAAAB0
10030   CALL FATAL0('in gen_lit: bogus type passed.')
10002 CALL PUTLI0(P,MEMAA0(P+1),CBUF)
      CALL ESPUSH(P)
      RETURN
      END
      SUBROUTINE GENIN0
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
      INTEGER MT1,MT2
      INTEGER P,Q,MP,T
      INTEGER ESPOP
      INTEGER * 4 SIZEO0
      P=ESPOP(P)
      Q=ESPOP(Q)
      MT1=MEMAA0(MEMAA0(Q+1)+3)
      MT2=MEMAA0(MEMAA0(P+1)+3)
      IF((MT1.EQ.12))GOTO 10032
      IF((MT1.EQ.13))GOTO 10032
      GOTO 10031
10032   IF((MT2.EQ.12))GOTO 10034
        IF((MT2.EQ.13))GOTO 10034
        GOTO 10035
10034     CALL SYNERR('Arrays may not be indexed by pointers.',0)
10033   GOTO 10035
10031   IF((MT2.EQ.12))GOTO 10037
        IF((MT2.EQ.13))GOTO 10037
        GOTO 10036
10037     CALL SYNERR('Only arrays and pointers can be indexed.',0)
          GOTO 10038
10036     T=Q
          Q=P
          P=T
          T=MT1
          MT1=MT2
          MT2=T
10038 CONTINUE
10035 IF((MT2.EQ.5))GOTO 10040
      IF((MT2.EQ.8))GOTO 10040
      GOTO 10039
10040   CALL ESPUSH(P)
        CALL ESPUSH(Q)
        CALL GENOP0(2)
        CALL GENOP0(15)
        GOTO 10041
10039   IF((MT1.EQ.12))GOTO 10043
        IF((MEMAA0(Q).NE.8))GOTO 10043
        IF((MEMAA0(Q+2).NE.25))GOTO 10043
        GOTO 10042
10043     CALL ESPUSH(Q)
          IF((MT1.NE.12))GOTO 10044
            T=MEMAA0(MEMAA0(Q+1))
            CALL CREAT0(T,13,0)
            CALL GENCO0(T)
10044     CALL ESPUSH(P)
          CALL GENOP0(25)
          CALL ESTOP(T)
          MEMAA0(T+1)=MEMAA0(MEMAA0(Q+1))
          GOTO 10045
10042     CALL ESPUSH(MEMAA0(Q+4))
          CALL ESPUSH(MEMAA0(Q+3))
          CALL GENINT(INTS(SIZEO0(MEMAA0(Q+1))/SIZEO0(MEMAA0(MEMAA0(Q+1)
     *))))
          CALL GENOP0(34)
          CALL ESPUSH(P)
          CALL GENOP0(2)
          CALL GENOP0(25)
          CALL ESTOP(T)
          MEMAA0(T+1)=MEMAA0(MEMAA0(Q+1))
          CALL DSFREE(Q)
10045 CONTINUE
10041 RETURN
      END
      SUBROUTINE GENOP0(OP)
      INTEGER OP
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
      INTEGER I,BT,ET,L
      INTEGER BOGUS0,BOGUT0
      INTEGER ISLVA0,ISARI0,ISINT,ISPOI0,WSIZE
      INTEGER LS,RS,M,V,LM,RM,T
      INTEGER DSGET,ESPOP
      INTEGER * 4 SIZEO0
      INTEGER OPOS(73)
      INTEGER OTXT(420)
      INTEGER AAAAC0
      INTEGER AAAAD0(12)
      INTEGER AAAAE0(12)
      INTEGER AAAAF0(12)
      INTEGER AAAAG0(2)
      INTEGER AAAAH0(26)
      DATA OTXT/1,3,31,34,7,29,30,26,17,12,2,3,31,34,29,30,26,22,12,5,11
     *,3,3,31,34,7,6,13,17,12,4,3,31,34,6,13,22,5,12,11,5,3,31,34,7,17,1
     *2,6,7,8,9,31,6,17,4,9,10,11,12,13,14,15,9,31,19,8,18,16,3,31,34,7,
     *23,24,17,12,17,3,31,34,23,24,22,12,5,11,18,19,3,31,34,22,12,5,15,3
     *8,11,20,21,3,31,34,22,12,5,15,38,11,22,23,3,31,34,22,12,5,15,38,11
     *,24,25,3,19,1,26,27,28,3,31,34,22,12,5,15,38,11,29,3,31,34,7,6,13,
     *17,1,30,3,31,34,6,13,17,1,11,31,3,31,34,22,12,5,15,38,11,32,33,3,3
     *1,34,23,24,7,17,12,34,3,31,34,23,24,22,12,5,11,35,9,31,23,17,4,36,
     *37,3,31,34,22,12,5,15,38,11,38,9,31,29,36,15,4,39,10,40,41,3,31,34
     *,7,13,6,17,42,3,31,34,6,13,22,5,12,11,43,9,28,31,7,29,24,27,17,12,
     *44,9,28,31,7,29,24,26,17,12,45,9,28,31,7,29,24,27,17,12,46,9,28,31
     *,7,29,24,26,17,12,47,3,34,35,21,12,25,48,3,2,49,50,51,9,7,33,20,52
     *,3,31,34,7,6,13,17,12,53,3,31,34,6,13,22,12,5,11,54,55,3,31,34,7,1
     *3,6,17,5,1,56,3,31,34,6,13,17,5,1,11,57,3,31,34,30,29,36,37,15,11,
     *58,3,31,7,19,21,59,3,21,60,3,31,34,30,29,36,37,15,11,61,3,31,34,7,
     *29,30,27,17,12,62,3,31,34,29,30,27,22,12,5,11,63,64,65,66,3,31,34,
     *7,13,6,17,12,67,3,31,34,31,34,13,6,22,5,12,11,68,69,9,32,19,70,3,3
     *1,29,36,21,6,71,3,31,34,22,12,5,0/
      DATA OPOS/72,1,11,22,31,41,48,49,50,56,57,58,59,60,61,62,68,77,87,
     *88,98,99,109,110,120,121,125,126,127,137,146,155,165,166,175,185,1
     *91,192,202,209,211,212,220,230,240,250,260,270,277,280,281,282,287
     *,296,306,307,317,327,337,343,346,356,366,377,378,379,380,389,401,4
     *02,406,413,420/
      DATA AAAAD0/177,182,242,176,230,230,230,230,230,230,230,0/
      DATA AAAAE0/177,182,242,176,230,230,230,230,230,230,230,0/
      DATA AAAAF0/177,182,242,176,230,230,230,230,230,230,230,0/
      DATA AAAAG0/176,0/
      DATA AAAAH0/194,239,231,245,243,160,229,238,244,242,249,160,233,23
     *8,160,239,244,225,226,186,160,170,233,170,238,0/
      BOGUS0=0
      I=OP+1
      BT=OPOS(I)
      ET=OPOS(I+1)
      V=DSGET(6)
      MEMAA0(V)=8
      MEMAA0(V+5)=0
      MEMAA0(V+4)=0
      MEMAA0(V+3)=0
      MEMAA0(V+1)=0
      MEMAA0(V+2)=OP
      I=BT+1
      GOTO 10048
10046 I=I+(1)
10048 IF((I.GE.ET))GOTO 10047
        AAAAC0=OTXT(I)
        GOTO 10049
10050     MEMAA0(V+3)=ESPOP(RS)
          RM=MEMAA0(RS+1)
          MEMAA0(V+4)=ESPOP(LS)
          LM=MEMAA0(LS+1)
          CALL ESPUSH(V)
        GOTO 10046
10052     RS=0
          RM=0
          MEMAA0(V+4)=ESPOP(LS)
          LM=MEMAA0(LS+1)
          CALL ESPUSH(V)
        GOTO 10046
10053     RS=0
          RM=0
          LS=0
          LM=0
          CALL ESPUSH(V)
        GOTO 10046
10054     IF((MEMAA0(LS).NE.3))GOTO 10046
            CALL ESPOP(V)
            CALL FOLDC0(V,LS,0)
            CALL DSFREE(V)
            CALL ESPUSH(LS)
10055   GOTO 10046
10056     IF((MEMAA0(LS).NE.3))GOTO 10046
          IF((MEMAA0(RS).NE.3))GOTO 10046
            CALL ESPOP(V)
            CALL FOLDC0(V,LS,RS)
            CALL DEALL0(RS)
            CALL DSFREE(V)
            CALL ESPUSH(LS)
10057   GOTO 10046
10058     IF((LM.EQ.MEMAA0(V+1)))GOTO 10046
            CALL ESPUSH(LS)
            CALL GENCO0(MEMAA0(V+1))
            MEMAA0(V+4)=ESPOP(LS)
            LM=MEMAA0(V+1)
10059   GOTO 10046
10060     IF((ISARI0(LS).NE.0))GOTO 10046
            CALL ESPUSH(LS)
            CALL GENMA0
            MEMAA0(V+4)=ESPOP(LS)
            LM=MEMAA0(LS+1)
10061   GOTO 10046
10062     CALL ESPUSH(LS)
          CALL GENTO0
          MEMAA0(V+4)=ESPOP(LS)
          LM=MEMAA0(LS+1)
        GOTO 10046
10063     IF((ISARI0(LS).NE.0))GOTO 10046
            CALL SYNERR('Left operand must have an arithmetic mode.',0)
10064   GOTO 10046
10065     IF((ISPOI0(LS).NE.0))GOTO 10046
          IF((ISARI0(LS).NE.0))GOTO 10046
            CALL SYNERR('Left operand must be a pointer or arithmetic mo
     *de.',0)
10066   GOTO 10046
10067     IF((ISINT(LS).NE.0))GOTO 10046
            CALL SYNERR('Left operand must be an integer type.',0)
10068   GOTO 10046
10069     IF((ISLVA0(LS).NE.0))GOTO 10046
            CALL SYNERR('Left operand must be an lvalue.',0)
10070   GOTO 10046
10071     IF((MEMAA0(LS+3).NE.13))GOTO 10072
            CALL SYNERR('& of array is not allowed.',0)
            GOTO 10046
10072       IF((MEMAA0(LS+3).NE.15))GOTO 10074
              CALL SYNERR('& of function is not allowed.',0)
              GOTO 10075
10074         IF((MEMAA0(LS).NE.1))GOTO 10076
              IF((MEMAA0(LS+2).NE.4))GOTO 10076
                CALL SYNERR('& of register variable not allowed.',0)
                GOTO 10077
10076           IF((MEMAA0(LS+3).NE.11))GOTO 10078
                  CALL SYNERR('& of field is not allowed.',0)
                  GOTO 10079
10078             IF((MEMAA0(LS+3).NE.18))GOTO 10080
                    CALL SYNERR('& of label is not allowed.',0)
10080           CONTINUE
10079         CONTINUE
10077       CONTINUE
10075     CONTINUE
10073   GOTO 10046
10081     IF((ISPOI0(LS).NE.0))GOTO 10046
            CALL SYNERR('Left operand must be a pointer.',0)
10082   GOTO 10046
10083     IF((MEMAA0(RM+3).NE.12))GOTO 10046
            CALL ESPUSH(RS)
            CALL GENOP0(15)
            MEMAA0(V+3)=ESPOP(RS)
            RM=MEMAA0(RS+1)
10084   GOTO 10046
10085     IF((RM.EQ.INTMO0))GOTO 10046
            CALL ESPUSH(RS)
            CALL GENCO0(INTMO0)
            MEMAA0(V+3)=ESPOP(RS)
            RM=MEMAA0(RS+1)
10086   GOTO 10046
10087     M=RM
          CALL MODIF0(M)
          IF((M.EQ.RM))GOTO 10046
            CALL ESPUSH(RS)
            CALL GENCO0(M)
            MEMAA0(V+3)=ESPOP(RS)
            RM=MEMAA0(RS+1)
10088   GOTO 10046
10089     IF((RM.EQ.MEMAA0(V+1)))GOTO 10046
            CALL ESPUSH(RS)
            CALL GENCO0(MEMAA0(V+1))
            MEMAA0(V+3)=ESPOP(RS)
            RM=MEMAA0(V+1)
10090   GOTO 10046
10091     IF((ISARI0(RS).NE.0))GOTO 10046
            CALL ESPUSH(RS)
            CALL GENMA0
            MEMAA0(V+3)=ESPOP(RS)
            RM=MEMAA0(RS+1)
10092   GOTO 10046
10093     CALL ESPUSH(RS)
          CALL GENTO0
          MEMAA0(V+3)=ESPOP(RS)
          RM=MEMAA0(RS+1)
        GOTO 10046
10094     CALL GENINT(1)
          MEMAA0(V+3)=ESPOP(RS)
          RM=MEMAA0(RS+1)
        GOTO 10046
10095     IF((ISARI0(RS).NE.0))GOTO 10046
            CALL SYNERR('Right operand must have an arithmetic mode.',0)
10096   GOTO 10046
10097     IF((ISPOI0(RS).NE.0))GOTO 10046
          IF((ISARI0(RS).NE.0))GOTO 10046
            CALL SYNERR('Right operand must be a pointer or arithmetic m
     *ode.',0)
10098   GOTO 10046
10099     IF((ISINT(RS).NE.0))GOTO 10046
            CALL SYNERR('Right operand must be an integer type.',0)
10100   GOTO 10046
10101     IF((ISLVA0(RS).NE.0))GOTO 10046
            CALL SYNERR('Right operand must be an lvalue.',0)
10102   GOTO 10046
10103     IF((ISPOI0(LS).NE.1))GOTO 10104
          IF((ISPOI0(RS).NE.1))GOTO 10104
            CALL SYNERR('Addition of two pointers is not defined.',0)
            GOTO 10046
10104       IF((ISPOI0(LS).NE.1))GOTO 10106
              CALL ESPUSH(RS)
              CALL GENCO0(LONGM0)
              CALL GENINT(WSIZE(SIZEO0(MEMAA0(LM))))
              CALL GENCO0(LONGM0)
              CALL GENOP0(34)
              MEMAA0(V+3)=ESPOP(RS)
              RM=MEMAA0(RS+1)
              GOTO 10107
10106         IF((ISPOI0(RS).NE.1))GOTO 10108
                CALL ESPUSH(LS)
                CALL GENCO0(LONGM0)
                CALL GENINT(WSIZE(SIZEO0(MEMAA0(RM))))
                CALL GENCO0(LONGM0)
                CALL GENOP0(34)
                MEMAA0(V+4)=ESPOP(LS)
                LM=MEMAA0(LS+1)
10108       CONTINUE
10107     CONTINUE
10105   GOTO 10046
10109     IF((ISPOI0(RS).NE.1))GOTO 10046
          IF((ISPOI0(LS).NE.1))GOTO 10046
            IF((MEMAA0(V+2).EQ.19))GOTO 10112
            IF((MEMAA0(V+2).EQ.37))GOTO 10112
            GOTO 10111
10112         CALL ESPUSH(LS)
              CALL GENCO0(LONGU0)
              CALL ESPUSH(RS)
              CALL GENCO0(LONGU0)
              CALL GENOP0(62)
              CALL GENLIT(1024,AAAAD0,0)
              CALL GENCO0(LONGU0)
              CALL GENOP0(4)
              GOTO 10113
10111         CALL ESPUSH(LS)
              CALL GENCO0(LONGM0)
              CALL GENLIT(1024,AAAAE0,0)
              CALL GENOP0(4)
              CALL ESPUSH(RS)
              CALL GENCO0(LONGM0)
              CALL GENLIT(1024,AAAAF0,0)
              CALL GENOP0(4)
              CALL GENOP0(62)
10113       MEMAA0(V+4)=ESPOP(LS)
            LM=MEMAA0(LS+1)
            CALL GENLIT(1024,AAAAG0,0)
            MEMAA0(V+3)=ESPOP(RS)
            RM=MEMAA0(RS+1)
10110   GOTO 10046
10114     IF((ISPOI0(LS).NE.1))GOTO 10115
          IF((ISPOI0(RS).NE.1))GOTO 10115
            BOGUS0=1
            BOGUT0=WSIZE(SIZEO0(MEMAA0(LM)))
            GOTO 10046
10115       IF((ISPOI0(LS).NE.1))GOTO 10117
              CALL ESPUSH(RS)
              CALL GENCO0(LONGM0)
              CALL GENINT(WSIZE(SIZEO0(MEMAA0(LM))))
              CALL GENCO0(LONGM0)
              CALL GENOP0(34)
              MEMAA0(V+3)=ESPOP(RS)
              RM=MEMAA0(RS+1)
              GOTO 10118
10117         IF((ISPOI0(RS).NE.1))GOTO 10119
                CALL SYNERR('Pointers may not be subtracted from integer
     *s.',0)
10119       CONTINUE
10118     CONTINUE
10116   GOTO 10046
10120     IF((MEMAA0(LM+3).NE.15))GOTO 10121
            MEMAA0(V+1)=MEMAA0(LM)
            GOTO 10046
10121       MEMAA0(V+1)=LM
10122   GOTO 10046
10123     MEMAA0(V+1)=INTMO0
        GOTO 10046
10124     IF((MEMAA0(LM+3).NE.11))GOTO 10125
            MEMAA0(V+1)=MEMAA0(LM)
            GOTO 10046
10125       MEMAA0(V+1)=LM
10126   GOTO 10046
10127     IF((ISPOI0(LS).NE.1))GOTO 10128
            MEMAA0(V+1)=MEMAA0(LM)
            CALL CREAT0(MEMAA0(V+1),12,0)
            GOTO 10046
10128       MEMAA0(V+1)=LM
10129   GOTO 10046
10130     IF((ISPOI0(LS).NE.1))GOTO 10131
            MEMAA0(V+1)=MEMAA0(LM)
            GOTO 10046
10131       MEMAA0(V+1)=LM
10132   GOTO 10046
10133     MEMAA0(V+5)=1
        GOTO 10046
10134     M=LM
          CALL CREAT0(M,12,0)
          MEMAA0(V+1)=M
        GOTO 10046
10135     IF((ISPOI0(RS).NE.1))GOTO 10136
            MEMAA0(V+1)=MEMAA0(RM)
            CALL CREAT0(MEMAA0(V+1),12,0)
            GOTO 10046
10136       MEMAA0(V+1)=RM
10137   GOTO 10046
10138     IF((LM.EQ.FLOAT0))GOTO 10140
          IF((LM.EQ.DOUBL0))GOTO 10140
          IF((RM.EQ.FLOAT0))GOTO 10140
          IF((RM.EQ.DOUBL0))GOTO 10140
          GOTO 10139
10140       MEMAA0(V+1)=DOUBL0
            GOTO 10046
10139       IF((MEMAA0(LM+3).NE.12))GOTO 10142
              MEMAA0(V+1)=LM
              GOTO 10143
10142         IF((MEMAA0(RM+3).NE.12))GOTO 10144
                MEMAA0(V+1)=RM
                GOTO 10145
10144           IF((LM.EQ.LONGU0))GOTO 10147
                IF((RM.EQ.LONGU0))GOTO 10147
                GOTO 10146
10147             MEMAA0(V+1)=LONGU0
                  GOTO 10148
10146             IF((LM.EQ.LONGM0))GOTO 10150
                  IF((RM.EQ.LONGM0))GOTO 10150
                  GOTO 10149
10150               MEMAA0(V+1)=LONGM0
                    GOTO 10151
10149               IF((LM.EQ.UNSIG0))GOTO 10153
                    IF((RM.EQ.UNSIG0))GOTO 10153
                    GOTO 10152
10153                 MEMAA0(V+1)=UNSIG0
                      GOTO 10154
10152                 IF((LM.EQ.INTMO0))GOTO 10156
                      IF((RM.EQ.INTMO0))GOTO 10156
                      GOTO 10155
10156                   MEMAA0(V+1)=INTMO0
                        GOTO 10157
10155                   IF((LM.EQ.SHORU0))GOTO 10159
                        IF((RM.EQ.SHORU0))GOTO 10159
                        IF((LM.EQ.CHARU0))GOTO 10159
                        IF((RM.EQ.CHARU0))GOTO 10159
                        GOTO 10158
10159                     MEMAA0(V+1)=SHORU0
                          GOTO 10160
10158                     MEMAA0(V+1)=SHORT0
10160                 CONTINUE
10157               CONTINUE
10154             CONTINUE
10151           CONTINUE
10148         CONTINUE
10145       CONTINUE
10143     CONTINUE
10141   GOTO 10046
10049   GOTO(10085,10120,10050,10054,10058,10067,10069,10081,10052,10053
     *,10056,10089,10099,10101,10123,10161,10127,10130,10133,10134,10135
     *,10138,10063,10095,10083,10103,10114,10094,10065,10097,10060,10124
     *,10071,10091,10087,10062,10093,10109),AAAAC0
10161     CALL PRINT(-15,AAAAH0,OTXT(I))
10051 GOTO 10046
10047 IF((BOGUS0.NE.1))GOTO 10162
        CALL GENCO0(LONGU0)
        CALL GENINT(BOGUT0)
        CALL GENOP0(17)
10162 RETURN
      END
      SUBROUTINE GENMA0
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
      INTEGER V,M
      INTEGER AAAAI0
      INTEGER AAAAJ0
      CALL ESTOP(V)
      AAAAI0=MEMAA0(MEMAA0(V+1)+3)
      GOTO 10163
10164   M=MEMAA0(MEMAA0(V+1))
        CALL CREAT0(M,12,0)
        CALL CONVO0(M)
      GOTO 10165
10166   M=MEMAA0(V+1)
        CALL CREAT0(M,12,0)
        CALL CONVO0(M)
      GOTO 10165
10167   CALL GENOP0(69)
      GOTO 10165
10163 AAAAJ0=AAAAI0-10
      GOTO(10167,10168,10164,10168,10166),AAAAJ0
10168 CONTINUE
10165 RETURN
      END
      SUBROUTINE CHECK0
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
      INTEGER V
      INTEGER ISARI0
      CALL ESTOP(V)
      IF((ISARI0(V).NE.0))GOTO 10169
        CALL SYNERR('Expression must have an arithmetic mode.',0)
10169 RETURN
      END
      SUBROUTINE GENTO0
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
      INTEGER ISINT
      INTEGER P
      CALL ESTOP(P)
      IF((ISINT(P).EQ.0))GOTO 10171
      IF((MEMAA0(P).NE.8))GOTO 10171
      IF((MEMAA0(P+2).EQ.37))GOTO 10170
      IF((MEMAA0(P+2).EQ.19))GOTO 10170
      IF((MEMAA0(P+2).EQ.23))GOTO 10170
      IF((MEMAA0(P+2).EQ.28))GOTO 10170
      IF((MEMAA0(P+2).EQ.21))GOTO 10170
      IF((MEMAA0(P+2).EQ.31))GOTO 10170
      IF((MEMAA0(P+2).EQ.38))GOTO 10170
      IF((MEMAA0(P+2).EQ.57))GOTO 10170
      IF((MEMAA0(P+2).EQ.60))GOTO 10170
      GOTO 10171
10171   CALL GENINT(0)
        CALL GENOP0(37)
10170 RETURN
      END
      SUBROUTINE DEALL0(P)
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
      INTEGER AAAAK0
      INTEGER AAAAL0(38)
      DATA AAAAL0/233,238,160,228,229,225,236,236,239,227,223,229,248,24
     *0,242,186,160,226,239,231,245,243,160,238,239,228,229,160,168,170,
     *233,169,160,170,233,170,238,0/
      IF((P.NE.0))GOTO 10173
        RETURN
10173 AAAAK0=MEMAA0(P)
      GOTO 10174
10175   CALL DEALL0(MEMAA0(P+4))
        CALL DEALL0(MEMAA0(P+3))
        CALL DSFREE(P)
      GOTO 10176
10178   IF((MEMAA0(P+6).EQ.0))GOTO 10179
          CALL DSFREE(MEMAA0(P+6))
10179   CALL DSFREE(P)
      GOTO 10176
10174 GOTO(10176,10176,10178,10180,10180,10180,10180,10175),AAAAK0
10180   CALL PRINT(-15,AAAAL0,P,MEMAA0(P))
10176 RETURN
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
C bogusdivisor                   bogut0
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
C bogusdivisionrequired          bogus0
C breakstatement                 break0
C expr10                         expr10
C externaldefinition             exter0
C structorunionspecifier         struh0
C Symbol                         symbo0
C Nsymline                       nsymm0
C Inbuf                          inbuf0
C Ibp                            ibpaa0
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
