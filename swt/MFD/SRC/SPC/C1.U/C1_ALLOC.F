      SUBROUTINE ENTET0(ID,MODE,XSC,PARAMS,ARG,BODY)
      INTEGER ID
      INTEGER MODE
      INTEGER XSC
      INTEGER PARAMS
      INTEGER ARG
      INTEGER BODY
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
      INTEGER SC,OBJ
      INTEGER FINDS0,COMPA0,NEWOBJ,NEWSYM,OLDSYM
      INTEGER Q,NP
      INTEGER MAKES0
      INTEGER INFO(3)
      IF((ID.NE.0))GOTO 10000
        RETURN
10000 Q=PARAMS
      GOTO 10003
10001 Q=MEMAA0(Q)
10003 IF((Q.EQ.0))GOTO 10002
        IF((MEMAA0(Q+1).EQ.0))GOTO 10001
          CALL CTOC(MEMAA0(MEMAA0(Q+1)),ERROR0,200)
          CALL SYNERR('Named parameters not allowed in this declaration.
     *',0)
10004 GOTO 10001
10002 SC=XSC
      NP=ID
      IF((ARG.NE.1))GOTO 10005
        IF((SC.EQ.1))GOTO 10006
        IF((SC.EQ.4))GOTO 10006
          CALL CTOC(MEMAA0(ID),ERROR0,200)
          CALL SYNERR('Illegal storage class for a parameter.',0)
          SC=1
10006   IF((MEMAA0(MODE+3).NE.15))GOTO 10007
          CALL CTOC(MEMAA0(ID),ERROR0,200)
          CALL SYNERR('Functions cannot be passed as parameters.',0)
          CALL CREAT0(MODE,12,0)
10007   CALL MODIF0(MODE)
10005 IF((MEMAA0(MODE+3).NE.15))GOTO 10008
        MODE=MEMAA0(MODE)
        CALL MODIF0(MODE)
        CALL CREAT0(MODE,15,0)
10008 IF((SC.NE.6))GOTO 10009
        IF((FINDS0(MEMAA0(NP),Q,1).NE.1))GOTO 10010
        IF((MEMAA0(Q+3).NE.LLAAA0))GOTO 10010
          CALL SYNERR('Identifier defined twice.',0)
10010   ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,0,1)
        GOTO 10011
10009   IF((LLAAA0.NE.1))GOTO 10012
          IF((MEMAA0(MODE+3).NE.15))GOTO 10013
          IF((BODY.NE.1))GOTO 10013
            IF((SC.EQ.4))GOTO 10015
            IF((SC.EQ.2))GOTO 10015
            IF((SC.EQ.3))GOTO 10015
            GOTO 10014
10015         CALL CTOC(MEMAA0(NP),ERROR0,200)
              CALL SYNERR('Invalid storage class on a function definitio
     *n.',0)
              SC=1
10014       IF((FINDS0(MEMAA0(NP),Q,1).NE.0))GOTO 10016
              ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,NEWOBJ(0),1)
              GOTO 10054
10016         IF((MEMAA0(Q+7).NE.1))GOTO 10018
                CALL CTOC(MEMAA0(NP),ERROR0,200)
                CALL SYNERR('Function defined twice in this file.',0)
                ID=OLDSYM(Q,SC,MODE,1)
                GOTO 10019
10018           IF((COMPA0(MODE,MEMAA0(Q+1)).NE.0))GOTO 10020
                  CALL SYNERR('Declaration conflicts with previous decla
     *ration.',1)
10020           IF((SC.NE.1))GOTO 10021
                  SC=MEMAA0(Q+2)
                  GOTO 10022
10021             IF((MEMAA0(Q+2).NE.3))GOTO 10023
                    CALL SYNERR('EXTERN function may not be redeclared S
     *TATIC.',1)
10023           CONTINUE
10022           IF((MEMAA0(Q+5).NE.0))GOTO 10024
                  MEMAA0(Q+5)=NEWOBJ(0)
10024           ID=OLDSYM(Q,SC,MODE,1)
10019       CONTINUE
10017       GOTO 10054
10013       IF((MEMAA0(MODE+3).NE.15))GOTO 10026
              IF((SC.EQ.4))GOTO 10028
              IF((SC.EQ.2))GOTO 10028
              IF((SC.EQ.5))GOTO 10028
              GOTO 10027
10028           CALL CTOC(MEMAA0(NP),ERROR0,200)
                CALL SYNERR('Invalid storage class on a function declara
     *tion.',0)
                SC=1
10027         IF((FINDS0(MEMAA0(NP),Q,1).NE.0))GOTO 10029
                ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,0,0)
                MEMAA0(ID+8)=PARAMS
                PARAMS=0
                GOTO 10036
10029           IF((MEMAA0(Q+7).NE.1))GOTO 10031
                  CALL CTOC(MEMAA0(NP),ERROR0,200)
                  CALL SYNERR('Function defined twice in this file.',0)
                  ID=OLDSYM(Q,SC,MODE,1)
                  GOTO 10032
10031             IF((COMPA0(MODE,MEMAA0(Q+1)).NE.0))GOTO 10033
                    CALL SYNERR('Declaration conflicts with previous dec
     *laration.',1)
10033             IF((SC.NE.1))GOTO 10034
                    SC=MEMAA0(Q+2)
10034             ID=OLDSYM(Q,SC,MODE,MEMAA0(Q+7))
                  IF((MEMAA0(ID+8).NE.0))GOTO 10035
                    MEMAA0(ID+8)=PARAMS
                    PARAMS=0
10035           CONTINUE
10032         CONTINUE
10030         GOTO 10036
10026         IF((SC.EQ.4))GOTO 10038
              IF((SC.EQ.2))GOTO 10038
              GOTO 10037
10038           CALL CTOC(MEMAA0(NP),ERROR0,200)
                CALL SYNERR('Invalid storage class on an external declar
     *ation.',1)
                SC=1
10037         IF((FINDS0(MEMAA0(NP),Q,1).NE.0))GOTO 10039
                IF((SC.NE.3))GOTO 10040
                  ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,0,0)
                  GOTO 10044
10040             IF((SC.NE.5))GOTO 10042
                    ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,NEWOBJ(0),5)
                    GOTO 10043
10042               ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,NEWOBJ(0),1)
10043           CONTINUE
10041           GOTO 10044
10039           IF((COMPA0(MODE,MEMAA0(Q+1)).NE.0))GOTO 10045
                  CALL CTOC(MEMAA0(NP),ERROR0,200)
                  CALL SYNERR('Declaration conflicts with previous decla
     *ration.',1)
10045           IF((SC.NE.3))GOTO 10046
                  ID=OLDSYM(Q,SC,MODE,MEMAA0(Q+7))
                  GOTO 10047
10046             IF((MEMAA0(Q+2).NE.3))GOTO 10049
                  IF((MEMAA0(Q+2).NE.3))GOTO 10048
                  IF((MEMAA0(Q+7).EQ.0))GOTO 10048
                  GOTO 10049
10049               CALL CTOC(MEMAA0(NP),ERROR0,200)
                    CALL SYNERR('Identifier defined twice.',0)
10048             IF((MEMAA0(Q+5).NE.0))GOTO 10051
                    MEMAA0(Q+5)=NEWOBJ(0)
10051             IF((SC.NE.5))GOTO 10052
                    ID=OLDSYM(Q,SC,MODE,5)
                    GOTO 10053
10052               ID=OLDSYM(Q,SC,MODE,1)
10053           CONTINUE
10047         CONTINUE
10044       CONTINUE
10036     CONTINUE
10025     GOTO 10054
10012     IF((MEMAA0(MODE+3).NE.15))GOTO 10055
            IF((SC.EQ.4))GOTO 10057
            IF((SC.EQ.2))GOTO 10057
            IF((SC.EQ.5))GOTO 10057
            GOTO 10056
10057         CALL CTOC(MEMAA0(NP),ERROR0,200)
              CALL SYNERR('Invalid storage class on a function declarati
     *on.',0)
              SC=1
10056       IF((FINDS0(MEMAA0(NP),Q,1).NE.0))GOTO 10058
              ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,1,0,0)
              ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,0,0)
              MEMAA0(ID+8)=PARAMS
              PARAMS=0
              GOTO 10069
10058         IF((MEMAA0(Q+3).NE.LLAAA0))GOTO 10060
                CALL CTOC(MEMAA0(NP),ERROR0,200)
                CALL SYNERR('Function defined twice.',0)
                GOTO 10061
10060           IF((FINDS0(MEMAA0(NP),Q,1,1).NE.1))GOTO 10062
                  IF((COMPA0(MODE,MEMAA0(Q+1)).NE.0))GOTO 10063
                    CALL SYNERR('Declaration conflicts with previous dec
     *laration.',1)
10063             IF((SC.NE.1))GOTO 10064
                    SC=MEMAA0(Q+2)
                    GOTO 10065
10064               IF((MEMAA0(Q+2).NE.5))GOTO 10066
                      CALL SYNERR('STATIC function may not be redeclared
     * EXTERN.',1)
10066             CONTINUE
10065             ID=OLDSYM(Q,SC,MODE,MEMAA0(Q+7))
                  IF((MEMAA0(ID+8).NE.0))GOTO 10068
                    MEMAA0(ID+8)=PARAMS
                    PARAMS=0
10067             GOTO 10068
10062             CALL FATAL0('Function declared at level other than 1.'
     *)
10068         CONTINUE
10061       CONTINUE
10059       GOTO 10069
10055       IF((SC.NE.1))GOTO 10070
              SC=2
10070       IF((FINDS0(MEMAA0(NP),Q,1).NE.0))GOTO 10071
              IF((SC.NE.3))GOTO 10072
                ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,1,0,0)
                ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,0,0)
                GOTO 10074
10072           ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,NEWOBJ(0),0)
10073         GOTO 10074
10071         IF((MEMAA0(Q+3).NE.LLAAA0))GOTO 10075
                CALL CTOC(MEMAA0(NP),ERROR0,200)
                CALL SYNERR('Identifier defined twice at current level.'
     *,0)
                GOTO 10076
10075           IF((SC.NE.3))GOTO 10077
                IF((FINDS0(MEMAA0(NP),Q,1,1).NE.1))GOTO 10077
                  IF((COMPA0(MODE,MEMAA0(Q+1)).NE.0))GOTO 10079
                    CALL CTOC(MEMAA0(NP),ERROR0,200)
                    CALL SYNERR('Declaration conflicts with previous dec
     *laration.',1)
10078             GOTO 10079
10077             IF((SC.NE.3))GOTO 10080
                    ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,1,0,0)
                    ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,0,0)
                    GOTO 10081
10080               ID=NEWSYM(MEMAA0(NP),MODE,SC,ARG,LLAAA0,NEWOBJ(0),0)
10081           CONTINUE
10079         CONTINUE
10076       CONTINUE
10074     CONTINUE
10069   CONTINUE
10054 CONTINUE
10011 CALL DSFREE(NP)
10082 IF((PARAMS.EQ.0))GOTO 10083
        IF((MEMAA0(PARAMS+1).EQ.0))GOTO 10084
          CALL DSFREE(MEMAA0(PARAMS+1))
10084   Q=MEMAA0(PARAMS)
        CALL DSFREE(PARAMS)
        PARAMS=Q
      GOTO 10082
10083 RETURN
      END
      SUBROUTINE ENTEX0(ID,MODE,PARAMS,LOC)
      INTEGER ID,MODE,PARAMS
      INTEGER * 4 LOC
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
      INTEGER FINDS0,COMPA0
      INTEGER Q
      INTEGER MAKES0
      INTEGER * 4 GETLO0
      INTEGER INFO(3)
      INTEGER AAAAA0
      INTEGER AAAAB0
      IF((ID.NE.0))GOTO 10085
        RETURN
10085 IF((MEMAA0(MODE+3).NE.15))GOTO 10086
        CALL SYNERR('Functions cannot be part of a ''struct''.',0)
        CALL CREAT0(MODE,12,0)
10086 IF((PARAMS.EQ.0))GOTO 10087
        CALL SYNERR('Parameters not allowed in struct member.',0)
10088   IF((PARAMS.EQ.0))GOTO 10089
          Q=MEMAA0(PARAMS)
          CALL DSFREE(PARAMS)
          PARAMS=Q
        GOTO 10088
10089 CONTINUE
10087 IF((FINDS0(MEMAA0(ID),Q,2).NE.1))GOTO 10090
      IF((MEMAA0(Q+3).NE.LLAAA0))GOTO 10090
        AAAAA0=MEMAA0(Q)
        GOTO 10091
10092     CALL CTOC(MEMAA0(ID),ERROR0,200)
          CALL SYNERR('Identifier already defined as struct tag.',0)
        GOTO 10093
10094     IF((GETLO0(LOC).NE.GETLO0(MEMAA0(Q+8))))GOTO 10096
          IF((COMPA0(MODE,MEMAA0(Q+1)).EQ.0))GOTO 10096
          GOTO 10093
10096       CALL CTOC(MEMAA0(ID),ERROR0,200)
            CALL SYNERR('Struct member conflicts with previous definitio
     *n.',0)
10095   GOTO 10093
10091   AAAAB0=AAAAA0-1
        GOTO(10094,10097,10092),AAAAB0
10097   CONTINUE
10093   CALL DSFREE(ID)
        ID=Q
        RETURN
10090 Q=ID
      ID=MAKES0(MEMAA0(ID),2,LLAAA0)
      CALL DSFREE(Q)
      MEMAA0(ID+1)=MODE
      MEMAA0(ID+4)=-1
      MEMAA0(ID+2)=1
      MEMAA0(ID+5)=0
      CALL PUTLO0(MEMAA0(ID+8),LOC)
      RETURN
      END
      SUBROUTINE DECLC0(FLAG)
      INTEGER FLAG
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
      INTEGER FINDS0,MAKES0,NEWOBJ
      IF((FINDS0(SYMTE0,SYMPT0,1).EQ.0))GOTO 10099
      IF((MEMAA0(SYMPT0+3).LE.1))GOTO 10099
      GOTO 10098
10099   SYMPT0=MAKES0(SYMTE0,1,2)
        MEMAA0(SYMPT0+2)=5
        MEMAA0(SYMPT0+1)=LABEL0
        MEMAA0(SYMPT0+4)=FLAG
        MEMAA0(SYMPT0+5)=NEWOBJ(0)
        RETURN
10098 IF((MEMAA0(SYMPT0+1).EQ.LABEL0))GOTO 10100
        CALL SYNERR('Label already declared but not as label.',0)
        RETURN
10100 IF((MEMAA0(SYMPT0+4).NE.1))GOTO 10101
      IF((FLAG.NE.1))GOTO 10101
        CALL SYNERR('Label already declared.',0)
10101 IF((FLAG.NE.1))GOTO 10102
        MEMAA0(SYMPT0+4)=1
10102 RETURN
      END
      SUBROUTINE CHECL0(CLASS)
      INTEGER CLASS
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
      INTEGER FINDS0,NEWOBJ
      INTEGER Q
      IF((FINDS0(SYMTE0,SYMPT0,CLASS).NE.0))GOTO 10103
        CALL SYNERR('Identifier not declared.',0)
        CALL GENINT(0)
        GOTO 10104
10103   IF((MEMAA0(SYMPT0).NE.6))GOTO 10105
          CALL GENINT(MEMAA0(SYMPT0+5))
          GOTO 10106
10105     IF((MEMAA0(SYMPT0).EQ.1))GOTO 10107
          IF((MEMAA0(SYMPT0).EQ.2))GOTO 10107
            CALL SYNERR('Identifier is not a variable.',0)
            CALL GENINT(0)
            GOTO 10108
10107       IF((MEMAA0(SYMPT0).NE.1))GOTO 10109
            IF((MEMAA0(SYMPT0+5).NE.0))GOTO 10109
              MEMAA0(SYMPT0+5)=NEWOBJ(0)
              IF((MEMAA0(SYMPT0+3).LE.1))GOTO 10110
              IF((FINDS0(SYMTE0,Q,CLASS,1).NE.1))GOTO 10110
              IF((MEMAA0(Q+5).NE.0))GOTO 10110
                MEMAA0(Q+5)=MEMAA0(SYMPT0+5)
10110       CONTINUE
10109       CALL GENOQ0(SYMPT0)
10108   CONTINUE
10106 CONTINUE
10104 RETURN
      END
      SUBROUTINE CLEAN0
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
      INTEGER ACCES0
      INTEGER STR(200)
      P=0
      Q=ACCES0(LLAAA0,STR,P,1)
      GOTO 10113
10111 Q=ACCES0(LLAAA0,STR,P,1)
10113 IF((Q.EQ.0))GOTO 10112
        IF((MEMAA0(Q+1).NE.LABEL0))GOTO 10114
        IF((MEMAA0(Q+4).NE.0))GOTO 10114
          CALL CTOC(STR,ERROR0,200)
          CALL SYNERR('Undefined label.',0)
10114   IF((MEMAA0(Q+4).NE.0))GOTO 10115
          CALL CTOC(STR,ERROR0,200)
          CALL SYNERR('Declared as parameter but not in parameter list.'
     *,0)
10115   IF((MEMAA0(Q).NE.5))GOTO 10111
        IF((MEMAA0(MEMAA0(Q+1)+5).NE.0))GOTO 10111
          CALL CTOC(STR,ERROR0,200)
          CALL SYNERR('''Enum'' referenced but not defined.',0)
10116 GOTO 10111
10112 P=0
      Q=ACCES0(LLAAA0,STR,P,2)
      GOTO 10119
10117 Q=ACCES0(LLAAA0,STR,P,2)
10119 IF((Q.EQ.0))GOTO 10118
        IF((MEMAA0(Q).NE.4))GOTO 10117
        IF((MEMAA0(MEMAA0(Q+1)+5).NE.0))GOTO 10117
          CALL CTOC(STR,ERROR0,200)
          CALL SYNERR('''Struct'' referenced but not defined.',0)
10120 GOTO 10117
10118 RETURN
      END
      SUBROUTINE CHECM0
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
      INTEGER FINDS0,NEWOBJ
      INTEGER Q
      INTEGER MODE
      INTEGER SDUPL
      MODE=INTMO0
      CALL CREAT0(MODE,15,0)
      IF((FINDS0(SYMTE0,SYMPT0,1).NE.0))GOTO 10121
        SYMPT0=SDUPL(SYMTE0)
        CALL ENTET0(SYMPT0,MODE,3,0,0,0)
        GOTO 10122
10121   IF((MEMAA0(MEMAA0(SYMPT0+1)+3).NE.15))GOTO 10123
          GOTO 10124
10123     IF((MEMAA0(SYMPT0+3).NE.LLAAA0))GOTO 10125
            CALL SYNERR('Usage conflicts with previous declaration.',0)
            GOTO 10126
10125       SYMPT0=SDUPL(SYMTE0)
            CALL ENTET0(SYMPT0,MODE,3,0,0,0)
10126   CONTINUE
10124 CONTINUE
10122 IF((MEMAA0(SYMPT0+5).NE.0))GOTO 10127
        MEMAA0(SYMPT0+5)=NEWOBJ(0)
        IF((MEMAA0(SYMPT0+3).LE.1))GOTO 10128
        IF((FINDS0(SYMTE0,Q,1,1).NE.1))GOTO 10128
        IF((MEMAA0(Q+5).NE.0))GOTO 10128
          MEMAA0(Q+5)=MEMAA0(SYMPT0+5)
10128 CONTINUE
10127 CALL GENOQ0(SYMPT0)
      RETURN
      END
      SUBROUTINE ALLOC0(ID)
      INTEGER ID
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
      INTEGER ISSTO0
      INTEGER * 4 SZ
      INTEGER * 4 SIZEO0
      IF((ISSTO0(ID).NE.0))GOTO 10129
        RETURN
10129 SZ=SIZEO0(MEMAA0(ID+1))
      IF((SZ.NE.0))GOTO 10130
        CALL SYNERR('Data object may not have zero size.',0)
        GOTO 10131
10130   IF((SZ.LT.(INTL(65535)+1)*8))GOTO 10132
          CALL SYNERR('Data object may not be larger than 65535 words.',
     *0)
10132 CONTINUE
10131 RETURN
      END
      SUBROUTINE ALLOD0(MP,LEN)
      INTEGER MP
      INTEGER * 4 LEN
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
      IF((MEMAA0(MP+3).NE.16))GOTO 10133
        CALL PUTLO0(MEMAA0(MP+6),GETLO0(MEMAA0(MP+6))+LEN)
        GOTO 10134
10133   IF((GETLO0(MEMAA0(MP+6)).GE.LEN))GOTO 10135
          CALL PUTLO0(MEMAA0(MP+6),LEN)
10135 CONTINUE
10134 RETURN
      END
      INTEGER FUNCTION WSIZE(B)
      INTEGER * 4 B
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
      WSIZE=(B+15)/16
      RETURN
      END
      INTEGER FUNCTION ALLOE0(MP)
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
      INTEGER OBJ
      INTEGER NEWOBJ
      INTEGER STR(20)
      INTEGER P
      INTEGER NEWSYM
      INTEGER AAAAC0(8)
      DATA AAAAC0/163,244,229,237,240,170,233,0/
      OBJ=NEWOBJ(0)
      CALL ENCODE(STR,20,AAAAC0,OBJ)
      P=NEWSYM(STR,MP,2,0,LLAAA0,OBJ,0)
      CALL OUTVAR(P)
      CALL OUTOP0(39)
      CALL OUTSI0(MEMAA0(P+1))
      ALLOE0=P
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
