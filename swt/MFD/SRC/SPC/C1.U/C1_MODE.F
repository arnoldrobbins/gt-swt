      SUBROUTINE ALIGN0(MODE,CURLOC)
      INTEGER MODE
      INTEGER * 4 CURLOC
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
      INTEGER * 4 T
      INTEGER * 4 GETLO0
      IF((MEMAA0(MODE+3).EQ.11))GOTO 10000
        T=(CURLOC+15)/16
        CURLOC=T*16
        GOTO 10001
10000   IF((GETLO0(MEMAA0(MODE+6)).LE.16))GOTO 10002
          T=MOD(CURLOC,16)
          IF((T+GETLO0(MEMAA0(MODE+6)).LE.32))GOTO 10003
            T=(CURLOC+15)/16
            CURLOC=T*16
10003   CONTINUE
10002 CONTINUE
10001 RETURN
      END
      INTEGER * 4 FUNCTION SIZEO0(MP)
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
      INTEGER * 4 SIZE
      INTEGER * 4 GETLO0
      INTEGER AAAAB0(20)
      INTEGER AAAAC0
      INTEGER AAAAA0
      INTEGER AAAAD0
      AAAAC0=1
      SIZE=1
      AAAAA0=MP
      AAAAB0(AAAAC0)=1
      GOTO 10004
10005 SIZEO0=SIZE
      RETURN
10004 IF(AAAAC0.GE.20)CALL ERROR(23HCONTROL STACK OVERFLOW.)
      AAAAC0=AAAAC0+1
      AAAAD0=MEMAA0(AAAAA0+3)
      GOTO 10006
10007   SIZE=0
      GOTO 10017
10009   SIZE=SIZE*(16)
      GOTO 10017
10010   SIZE=SIZE*(32)
      GOTO 10017
10011   SIZE=SIZE*(64)
      GOTO 10017
10012   SIZE=SIZE*(GETLO0(MEMAA0(AAAAA0+6)))
      GOTO 10017
10013   SIZE=SIZE*(GETLO0(MEMAA0(AAAAA0+6)))
      GOTO 10017
10014   SIZE=SIZE*(GETLO0(MEMAA0(AAAAA0+6)))
        AAAAA0=MEMAA0(AAAAA0)
        AAAAB0(AAAAC0)=2
        GOTO 10004
10016   SIZE=SIZE*(GETLO0(MEMAA0(AAAAA0+6)))
      GOTO 10017
10006 GOTO(10009,10009,10009,10009,10010,10009,10009,10010,10010,10011, 
     *    10016,10010,10014,10009,10007,10012,10013,10007,10007,10007),A
     *AAAD0
10008 GOTO 10017
10017 AAAAC0=AAAAC0-1
      IF (AAAAC0.LE.0)CALL ERROR(24HCONTROL STACK UNDERFLOW.)
      GOTO(10005,10017),AAAAB0(AAAAC0)
      GOTO 10017
      END
      INTEGER FUNCTION MAKEM0(T,SIZE)
      INTEGER T,SIZE
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
      INTEGER Q
      INTEGER DSGET
      Q=DSGET(8)
      MEMAA0(Q+4)=MODEL0
      MODEL0=Q
      MEMAA0(Q+3)=T
      CALL PUTLO0(MEMAA0(Q+6),INTL(SIZE))
      MEMAA0(Q)=0
      MEMAA0(Q+1)=0
      MEMAA0(Q+2)=0
      MEMAA0(Q+5)=0
      MAKEM0=Q
      RETURN
      END
      INTEGER FUNCTION ENTEW0(P,T,SIZE)
      INTEGER P
      INTEGER T,SIZE
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
      INTEGER Q
      INTEGER MAKEM0
      Q=MAKEM0(T,SIZE)
      MEMAA0(Q)=MEMAA0(P)
      MEMAA0(Q+2)=0
      MEMAA0(Q+1)=MEMAA0(P+1)
      MEMAA0(P+1)=Q
      ENTEW0=Q
      RETURN
      END
      INTEGER FUNCTION ENTER0(P,T,SIZE)
      INTEGER P
      INTEGER T,SIZE
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
      INTEGER Q
      INTEGER MAKEM0
      Q=MAKEM0(T,SIZE)
      MEMAA0(Q)=P
      MEMAA0(Q+2)=0
      MEMAA0(Q+1)=MEMAA0(P+2)
      MEMAA0(P+2)=Q
      ENTER0=Q
      RETURN
      END
      INTEGER FUNCTION FINDM0(P,T,SIZE)
      INTEGER P
      INTEGER T,SIZE
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
      INTEGER Q
      INTEGER * 4 GETLO0
      Q=P
      GOTO 10020
10018 Q=MEMAA0(Q+1)
10020 IF((Q.EQ.0))GOTO 10019
        IF((MEMAA0(Q+3).NE.T))GOTO 10018
        IF((GETLO0(MEMAA0(Q+6)).NE.SIZE))GOTO 10018
          FINDM0=Q
          RETURN
10019 FINDM0=0
      RETURN
      END
      SUBROUTINE CREAT0(P,T,SIZE)
      INTEGER P
      INTEGER T,SIZE
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
      INTEGER Q
      INTEGER FINDM0,ENTER0,ENTEW0
      IF((MEMAA0(P+2).NE.0))GOTO 10022
        P=ENTER0(P,T,SIZE)
        GOTO 10023
10022   Q=MEMAA0(P+2)
        P=FINDM0(Q,T,SIZE)
        IF((P.NE.0))GOTO 10024
          P=ENTEW0(Q,T,SIZE)
10024 CONTINUE
10023 RETURN
      END
      INTEGER FUNCTION COMPA0(M1,M2)
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
      INTEGER * 4 GETLO0
      INTEGER AAAAG0(20)
      INTEGER AAAAH0
      INTEGER AAAAE0,AAAAF0
      AAAAH0=1
      AAAAE0=M1
      AAAAF0=M2
      AAAAG0(AAAAH0)=1
      GOTO 10025
10026 COMPA0=0
      RETURN
10025 IF(AAAAH0.GE.20)CALL ERROR(23HCONTROL STACK OVERFLOW.)
      AAAAH0=AAAAH0+1
      GOTO 10027
10028   COMPA0=1
        RETURN
10029   COMPA0=0
        RETURN
10030   COMPA0=0
        RETURN
10031   COMPA0=1
        RETURN
10032   COMPA0=0
        RETURN
10027 IF((AAAAE0.EQ.AAAAF0))GOTO 10028
      IF((AAAAE0.EQ.0))GOTO 10029
      IF((AAAAF0.EQ.0))GOTO 10029
      IF((MEMAA0(AAAAE0+3).NE.MEMAA0(AAAAF0+3)))GOTO 10030
      IF((MEMAA0(AAAAE0+3).EQ.14))GOTO 10031
      IF((MEMAA0(AAAAE0+3).EQ.13))GOTO 10034
      IF((MEMAA0(AAAAE0+3).EQ.16))GOTO 10034
      IF((MEMAA0(AAAAE0+3).EQ.17))GOTO 10034
      GOTO 10033
10034 IF((GETLO0(MEMAA0(AAAAE0+6)).EQ.GETLO0(MEMAA0(AAAAF0+6))))GOTO    
     *  10033
      GOTO 10032
10033 CONTINUE
        AAAAE0=MEMAA0(AAAAE0)
        AAAAF0=MEMAA0(AAAAF0)
        AAAAG0(AAAAH0)=2
        GOTO 10025
10035 CONTINUE
      GOTO 10036
10036 AAAAH0=AAAAH0-1
      IF (AAAAH0.LE.0)CALL ERROR(24HCONTROL STACK UNDERFLOW.)
      GOTO(10026,10035),AAAAG0(AAAAH0)
      GOTO 10036
      END
      SUBROUTINE SAVEM0(MT,SZ)
      INTEGER MT,SZ
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
      IF((MODEV0.LE.20))GOTO 10037
        CALL FATAL0('Modes nested too deeply.')
10037 MODES0(MODEV0)=MT
      MODEU0(MODEV0)=SZ
      MODEV0=MODEV0+(1)
      RETURN
      END
      SUBROUTINE CREAU0(MP)
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
      INTEGER I
      I=MODEV0-1
      GOTO 10040
10038 I=I-(1)
10040 IF((I.LE.0))GOTO 10039
        CALL CREAT0(MP,MODES0(I),MODEU0(I))
      GOTO 10038
10039 MODEV0=1
      RETURN
      END
      SUBROUTINE MODIF0(MP)
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
      INTEGER AAAAI0
      INTEGER AAAAJ0
      AAAAI0=MEMAA0(MP+3)
      GOTO 10041
10042   MP=MEMAA0(MP)
        CALL CREAT0(MP,12,0)
      GOTO 10043
10044   MP=INTMO0
      GOTO 10043
10045   MP=DOUBL0
      GOTO 10043
10041 IF(AAAAI0.EQ.1)GOTO 10044
      AAAAJ0=AAAAI0-8
      GOTO(10045,10046,10046,10046,10042),AAAAJ0
10046 CONTINUE
10043 RETURN
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
