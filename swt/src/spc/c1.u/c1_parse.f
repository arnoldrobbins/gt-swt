      SUBROUTINE EMPTY(STATE)
      INTEGER STATE
      STATE=3
      RETURN
      END
      SUBROUTINE TYPEO0(STATE)
      INTEGER STATE
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
      INTEGER FINDS0
      INTEGER AAAAA0
      INTEGER AAAAB0
      AAAAA0=SYMBO0
      GOTO 10000
10001   STATE=3
      GOTO 10002
10000 AAAAB0=AAAAA0-1027
      GOTO(10001,10003,10003,10001,10003,10003,10003,10003,10003,10001, 
     *    10003,10003,10003,10001,10001,10001,10003,10003,10003,10003,  
     *   10003,10003,10003,10001,10003,10001,10001,10003,10001,10003,   
     *  10001,10001,10003,10001,10003,10001,10001),AAAAB0
10003   IF((SYMBO0.NE.1023))GOTO 10004
        IF((FINDS0(SYMTE0,SYMPT0,1).NE.1))GOTO 10004
        IF((MEMAA0(SYMPT0+2).NE.6))GOTO 10004
          STATE=3
          GOTO 10005
10004     STATE=1
10005 CONTINUE
10002 RETURN
      END
      SUBROUTINE NOTSU0(STATE)
      INTEGER STATE
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
      INTEGER FINDS0
      INTEGER AAAAC0
      INTEGER AAAAD0
      AAAAC0=SYMBO0
      GOTO 10006
10007   STATE=1
      GOTO 10008
10006 IF(AAAAC0.EQ.-1)GOTO 10007
      AAAAD0=AAAAC0-160
      GOTO(10007,10009,10009,10009,10009,10007,10009,10007,10009,10007, 
     *    10007,10009,10007),AAAAD0
      AAAAD0=AAAAC0-250
      GOTO(10007,10009,10007,10007),AAAAD0
      AAAAD0=AAAAC0-1001
      GOTO(10007,10009,10009,10009,10007),AAAAD0
      AAAAD0=AAAAC0-1028
      GOTO(10007,10007,10009,10007,10009,10007,10009,10007,10009,10009, 
     *    10009,10009,10009,10009,10009,10007,10009,10007,10009,10009,  
     *   10007,10009,10009,10009,10009,10009,10007,10009,10009,10009,   
     *  10009,10007,10009,10009,10009,10009,10007),AAAAD0
10009   IF((SYMBO0.NE.1023))GOTO 10010
          IF((FINDS0(SYMTE0,SYMPT0,1).NE.1))GOTO 10011
          IF((MEMAA0(SYMPT0+2).NE.6))GOTO 10011
            STATE=3
            GOTO 10013
10011       STATE=1
10012     GOTO 10013
10010     STATE=3
10013 CONTINUE
10008 RETURN
      END
      SUBROUTINE NOTST0(STATE)
      INTEGER STATE
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
      IF((SYMBO0.EQ.253))GOTO 10015
      IF((SYMBO0.EQ.-1))GOTO 10015
      GOTO 10014
10015   STATE=1
        GOTO 10016
10014   STATE=3
10016 RETURN
      END
      SUBROUTINE INITJ0(STATE)
      INTEGER STATE
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
      INTEGER BC,RC,SFLAG
      INTEGER ISSTO0
      INTEGER ID
      ID=SEMSK0(SEMSP0-1)
      IF((MEMAA0(ID+2).EQ.5))GOTO 10018
      IF((MEMAA0(ID+2).EQ.3))GOTO 10018
      IF((MEMAA0(ID+2).NE.1))GOTO 10017
      IF((MEMAA0(ID+3).NE.1))GOTO 10017
      GOTO 10018
10018   SFLAG=1
        GOTO 10020
10017   SFLAG=0
10020 BC=0
      RC=0
      IF((ISSTO0(ID).NE.0))GOTO 10021
        CALL CTOC(MEMAA0(MEMAA0(ID+6)),ERROR0,200)
        CALL SYNERR('Identifier cannot be initalized.',0)
10021 CALL OUTIP0
      CALL INITR(MEMAA0(ID+1),BC,RC,SFLAG)
      CALL OUTIO0
      STATE=3
      RETURN
      END
      SUBROUTINE INITR(MODE,BC,RC,SFLAG)
      INTEGER MODE
      INTEGER BC,RC,SFLAG
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
      INTEGER STATE,LDIFF
      INTEGER WSIZE
      INTEGER T
      INTEGER * 4 SIZEO0
      INTEGER AAAAE0(2)
      DATA AAAAE0/176,0/
      RC=RC+(1)
      IF((MEMAA0(MODE+3).NE.13))GOTO 10022
        IF((SYMBO0.NE.251))GOTO 10023
          CALL GETSYM
          BC=BC+(1)
          CALL ARRAY0(MODE,BC,RC,SFLAG)
          IF((SYMBO0.EQ.253))GOTO 10024
            CALL SYNERR('Right brace required.',0)
            GOTO 10025
10024       CALL GETSYM
10025     BC=BC-(1)
          GOTO 10027
10023     CALL ARRAY0(MODE,BC,RC,SFLAG)
10026   GOTO 10027
10022   IF((MEMAA0(MODE+3).NE.16))GOTO 10028
          IF((SYMBO0.NE.251))GOTO 10029
            CALL GETSYM
            BC=BC+(1)
            CALL STRUG0(MODE,BC,RC,SFLAG)
            IF((SYMBO0.EQ.253))GOTO 10030
              CALL SYNERR('Right brace required.',0)
              GOTO 10031
10030         CALL GETSYM
10031       BC=BC-(1)
            GOTO 10033
10029       CALL STRUG0(MODE,BC,RC,SFLAG)
10032     GOTO 10033
10028     IF((MEMAA0(MODE+3).NE.17))GOTO 10034
            T=MEMAA0(MODE+5)
            IF((T.NE.0))GOTO 10035
              CALL SYNERR('Can''t initialize union with no members.',0)
              GOTO 10039
10035         CALL INITR(MEMAA0(MEMAA0(T+1)+1),BC,RC,SFLAG)
              LDIFF=WSIZE(SIZEO0(MODE))-WSIZE(SIZEO0(MEMAA0(MEMAA0(T+1)+
     *1)))
10037         IF((LDIFF.LE.0))GOTO 10038
                CALL GENLIT(1025,AAAAE0,0)
                CALL OUTIN0(SHORT0)
                LDIFF=LDIFF-(1)
              GOTO 10037
10038       CONTINUE
10036       GOTO 10039
10034       IF((MEMAA0(MODE+3).NE.11))GOTO 10040
              CALL SYNERR('Fields cannot be initialized.',0)
              GOTO 10041
10040         IF((MEMAA0(MODE+3).NE.15))GOTO 10042
                CALL SYNERR('Functions cannot be initialized.',0)
                GOTO 10043
10042           IF((SYMBO0.NE.251))GOTO 10044
                  CALL GETSYM
                  BC=BC+(1)
                  CALL SCALA0(MODE,BC,RC,SFLAG)
                  IF((SYMBO0.EQ.253))GOTO 10045
                    CALL SYNERR('Right brace required.',0)
                    GOTO 10046
10045               CALL GETSYM
10046             BC=BC-(1)
                  GOTO 10047
10044             CALL SCALA0(MODE,BC,RC,SFLAG)
10047         CONTINUE
10043       CONTINUE
10041     CONTINUE
10039   CONTINUE
10033 CONTINUE
10027 IF((SYMBO0.NE.172))GOTO 10048
      IF((BC.LE.0))GOTO 10048
        CALL GETSYM
10048 RC=RC-(1)
      RETURN
      END
      SUBROUTINE SCALA0(MODE,BC,RC,SFLAG)
      INTEGER MODE
      INTEGER BC,RC,SFLAG
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
      INTEGER STATE,P
      INTEGER ISCON0
      INTEGER AAAAF0(2)
      INTEGER AAAAG0(2)
      DATA AAAAF0/176,0/
      DATA AAAAG0/176,0/
      IF((SYMBO0.NE.253))GOTO 10049
        CALL GENLIT(1025,AAAAF0,0)
        GOTO 10050
10049   CALL EXPR0(STATE)
        IF((STATE.NE.3))GOTO 10052
        IF((SYMBO0.EQ.172))GOTO 10051
        IF((SYMBO0.EQ.253))GOTO 10051
        IF((SYMBO0.EQ.187))GOTO 10051
        GOTO 10052
10052     CALL SYNERR('Illegal token in initializer.',0)
10051   IF((STATE.EQ.3))GOTO 10054
          CALL GENLIT(1025,AAAAG0,0)
10054 CONTINUE
10050 CALL GENMA0
      CALL GENCO0(MODE)
      IF((SFLAG.NE.1))GOTO 10055
        CALL ESTOP(P)
10056   IF((MEMAA0(P).NE.8))GOTO 10057
        IF((MEMAA0(P+2).NE.10))GOTO 10057
        IF((MEMAA0(MEMAA0(P+1)+3).NE.12))GOTO 10058
        IF((MEMAA0(MEMAA0(MEMAA0(P+4)+1)+3).EQ.13))GOTO 10057
        IF((MEMAA0(MEMAA0(MEMAA0(P+4)+1)+3).EQ.15))GOTO 10057
        GOTO 10058
10058     P=MEMAA0(P+4)
        GOTO 10056
10057   IF((ISCON0(P).NE.0))GOTO 10060
          IF((MEMAA0(P).NE.8))GOTO 10061
          IF((MEMAA0(P+2).NE.10))GOTO 10061
          IF((MEMAA0(MEMAA0(P+1)+3).NE.12))GOTO 10061
          IF((MEMAA0(MEMAA0(MEMAA0(P+4)+1)+3).EQ.13))GOTO 10062
          IF((MEMAA0(MEMAA0(MEMAA0(P+4)+1)+3).EQ.15))GOTO 10062
          GOTO 10061
10062     IF((MEMAA0(MEMAA0(P+4)).EQ.1))GOTO 10064
          IF((MEMAA0(MEMAA0(P+4)).EQ.3))GOTO 10064
          GOTO 10061
10061       IF((MEMAA0(P).NE.8))GOTO 10066
            IF((MEMAA0(P+2).NE.51))GOTO 10066
            IF((MEMAA0(MEMAA0(P+4)).EQ.1))GOTO 10065
            IF((MEMAA0(MEMAA0(P+4)).EQ.3))GOTO 10065
            GOTO 10066
10066         CALL SYNERR('SEG only allows ''&object'' and const exprs a
     *s static inits.',0)
10065     CONTINUE
10064   CONTINUE
10060 CONTINUE
10055 CALL OUTIN0(MODE)
      RETURN
      END
      SUBROUTINE ARRAY0(MODE,BC,RC,SFLAG)
      INTEGER MODE
      INTEGER BC,RC,SFLAG
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
      INTEGER P,Q
      INTEGER IC,LLEN,FLEN,I
      INTEGER CTOP,CTOC,WSIZE
      INTEGER CBUF(200)
      INTEGER * 4 ML
      INTEGER * 4 SIZEO0,GETLO0
      INTEGER AAAAH0(2)
      DATA AAAAH0/176,0/
      ML=GETLO0(MEMAA0(MODE+6))
      IF((ML.NE.0))GOTO 10068
      IF((RC.LE.1))GOTO 10068
        CALL SYNERR('Only the first array bound may be omitted.',0)
10068 P=MEMAA0(MODE)
      IF((MEMAA0(P+3).EQ.1))GOTO 10070
      IF((MEMAA0(P+3).EQ.3))GOTO 10070
      IF((MEMAA0(P+3).EQ.2))GOTO 10070
      IF((MEMAA0(P+3).EQ.7))GOTO 10070
      IF((MEMAA0(P+3).EQ.4))GOTO 10070
      IF((MEMAA0(P+3).EQ.6))GOTO 10070
      GOTO 10069
10070 IF((SYMBO0.NE.1021))GOTO 10072
      IF((SYMLE0.LE.1))GOTO 10072
      GOTO 10071
10072 IF((SYMBO0.EQ.1026))GOTO 10071
      GOTO 10069
10071   CALL GENLIT(SYMBO0,SYMTE0,SYMLE0)
        CALL ESTOP(Q)
        LLEN=WSIZE(SIZEO0(MEMAA0(Q+1)))
        IF((ML.NE.0))GOTO 10073
        IF((RC.GT.1))GOTO 10073
          MODE=MEMAA0(MODE)
          CALL CREAT0(MODE,13,LLEN)
          GOTO 10074
10073     IF((ML.GE.LLEN))GOTO 10075
            CALL SYNERR('String constant too large for array.',0)
10075   CONTINUE
10074   CALL OUTIN0(MODE)
        FLEN=WSIZE(SIZEO0(MODE))
10076   IF((FLEN.LE.LLEN))GOTO 10077
          CALL GENLIT(1025,AAAAH0,0)
          CALL OUTIN0(SHORT0)
          LLEN=LLEN+(WSIZE(SIZEO0(SHORT0)))
        GOTO 10076
10077   CALL GETSYM
        GOTO 10078
10069   IC=0
        GOTO 10081
10079   IC=IC+(1)
10081   IF((IC.LT.ML))GOTO 10082
        IF((ML.NE.0))GOTO 10080
        IF((SYMBO0.EQ.253))GOTO 10080
        IF((SYMBO0.EQ.187))GOTO 10080
        GOTO 10082
10082     CALL INITR(MEMAA0(MODE),BC,RC,SFLAG)
        GOTO 10079
10080   IF((ML.NE.0))GOTO 10084
        IF((RC.GT.1))GOTO 10084
          MODE=MEMAA0(MODE)
          CALL CREAT0(MODE,13,IC)
10084 CONTINUE
10078 RETURN
      END
      SUBROUTINE STRUG0(MODE,BC,RC,SFLAG)
      INTEGER MODE
      INTEGER BC,RC,SFLAG
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
      INTEGER T
      T=MEMAA0(MODE+5)
      GOTO 10087
10085 T=MEMAA0(T)
10087 IF((T.EQ.0))GOTO 10086
        CALL INITR(MEMAA0(MEMAA0(T+1)+1),BC,RC,SFLAG)
      GOTO 10085
10086 RETURN
      END
      INTEGER FUNCTION NEXTI0(D)
      INTEGER D
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
      INTEGER FINDS0
      INTEGER AAAAI0
      INTEGER AAAAJ0
      AAAAI0=NSYMB0
      GOTO 10088
10089   NEXTI0=1
        RETURN
10088 AAAAJ0=AAAAI0-1030
      GOTO(10089,10090,10090,10090,10090,10090,10089,10090,10090,10090, 
     *    10089,10090,10089,10090,10090,10090,10090,10090,10090,10090,  
     *   10089,10090,10089,10090,10090,10089,10090,10090,10089,10090,   
     *  10090,10090,10089,10089),AAAAJ0
10090   IF((NSYMB0.NE.1023))GOTO 10091
        IF((FINDS0(NSYMT0,NSYMP0,1).NE.1))GOTO 10091
        IF((MEMAA0(NSYMP0+2).NE.6))GOTO 10091
          NEXTI0=1
          RETURN
10091 CONTINUE
      NEXTI0=0
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
