      INTEGER FUNCTION MAKEI0(NODE,TYPE,PORT,PATH,SOPDE)
      INTEGER NODE,TYPE,PORT,SOPDE
      INTEGER PATH
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER I
      I=NEXTI0(NODE)
      IF((I.LE.3))GOTO 10000
        CALL SYNERR('too many input ports.')
        MAKEI0=-3
        RETURN
10000 NEXTI0(NODE)=NEXTI0(NODE)+(1)
      IPDAA0(1,I,NODE)=TYPE
      IPDAA0(2,I,NODE)=PORT
      IPDAA0(3,I,NODE)=PATH
      IPDAA0(4,I,NODE)=SOPDE
      IPDAA0(5,I,NODE)=1
      MAKEI0=-2
      RETURN
      END
      INTEGER FUNCTION MAKEO0(NODE,TYPE,PORT,PATH,DPORT)
      INTEGER NODE,TYPE,PORT,DPORT
      INTEGER PATH
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER I
      I=NEXTO0(NODE)
      IF((I.LE.3))GOTO 10001
        CALL SYNERR('too many output ports.')
        MAKEO0=-3
        RETURN
10001 NEXTO0(NODE)=NEXTO0(NODE)+(1)
      OPDAA0(1,I,NODE)=TYPE
      OPDAA0(2,I,NODE)=PORT
      OPDAA0(3,I,NODE)=PATH
      OPDAA0(4,I,NODE)=DPORT
      OPDAA0(5,I,NODE)=1
      MAKEO0=-2
      RETURN
      END
      SUBROUTINE INITP0
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER I
      DO 10002 I=1,10
        NEXTI0(I)=1
        NEXTO0(I)=1
10002 CONTINUE
10003 RETURN
      END
      SUBROUTINE CLRPO0
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER I,J
      DO 10004 I=1,10
        J=1
        GOTO 10008
10006   J=J+(1)
10008   IF((J.GE.NEXTI0(I)))GOTO 10007
          IF((IPDAA0(1,J,I).NE.7))GOTO 10006
            CALL LSFREE(IPDAA0(3,J,I),10000)
10009   GOTO 10006
10007   NEXTI0(I)=1
        J=1
        GOTO 10012
10010   J=J+(1)
10012   IF((J.GE.NEXTO0(I)))GOTO 10011
          IF((OPDAA0(1,J,I).EQ.8))GOTO 10014
          IF((OPDAA0(1,J,I).EQ.9))GOTO 10014
          GOTO 10010
10014       CALL LSFREE(OPDAA0(3,J,I),10000)
10013   GOTO 10010
10011   NEXTO0(I)=1
10004 CONTINUE
10005 RETURN
      END
      INTEGER FUNCTION ASSII0(STATUS)
      INTEGER STATUS
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER NODE
      INTEGER ASSIH0,ASSIG0
      NODE=1
      GOTO 10017
10015 NODE=NODE+(1)
10017 IF((NODE.GT.CURNO0))GOTO 10016
        IF((ASSIH0(NODE).NE.-3))GOTO 10015
          STATUS=-3
          ASSII0=STATUS
          RETURN
10016 NODE=1
      GOTO 10021
10019 NODE=NODE+(1)
10021 IF((NODE.GT.CURNO0))GOTO 10020
        IF((ASSIG0(NODE).NE.-3))GOTO 10019
          STATUS=-3
          ASSII0=STATUS
          RETURN
10020 STATUS=-2
      ASSII0=STATUS
      RETURN
      END
      INTEGER FUNCTION ASSIH0(NODE)
      INTEGER NODE
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER CIFIL0,CIFDA0(10),CIERR0,CITRA0,CICNO0(10)
      INTEGER CIBUF0(10),CIQUO0,CISEA0,CIQUP0,CIERS0,CIPRO0,CIHEL0,CIDEF
     *0
      INTEGER CIREC0
      INTEGER * 4 CIMDA0,CIMSI0,CICHE0
      COMMON /CICOM/CIQUO0,CISEA0,CIQUP0,CIPRO0,CIHEL0,CIERS0,CIDEF0,CIF
     *IL0,CITRA0,CIREC0,CIERR0,CIFDA0,CICNO0,CIBUF0,CIMDA0,CIMSI0,CICHE0
      INTEGER CONNE0(10,10)
      COMMON /EXECCM/CONNE0
      INTEGER I,LIST(3),PORT,DNODE
      INTEGER RESER0,MAKEI0,SELEC0
      CALL MAKEP0(LIST,3)
      I=1
      GOTO 10025
10023 I=I+(1)
10025 IF((I.GE.NEXTO0(NODE)))GOTO 10024
        IF((OPDAA0(2,I,NODE).EQ.0))GOTO 10023
          IF((RESER0(OPDAA0(2,I,NODE),LIST,3).NE.-3))GOTO 10027
            ASSIH0=-3
            RETURN
10027   CONTINUE
10026 GOTO 10023
10024 I=1
      GOTO 10030
10028 I=I+(1)
10030 IF((I.GE.NEXTO0(NODE)))GOTO 10029
        IF((OPDAA0(2,I,NODE).NE.0))GOTO 10031
          PORT=SELEC0(LIST,3)
          IF((PORT.NE.-3))GOTO 10032
            ASSIH0=PORT
            RETURN
10032     OPDAA0(2,I,NODE)=PORT
10031   IF((OPDAA0(1,I,NODE).NE.3))GOTO 10028
          IF((OPDAA0(3,I,NODE).LE.CURNO0))GOTO 10034
            CALL SEMERR('pipe destination not found.')
            ASSIH0=-3
            RETURN
10034     DNODE=OPDAA0(3,I,NODE)
          IF((MAKEI0(DNODE,3,OPDAA0(4,I,NODE),NODE,I).NE.-3))GOTO 10035
            ASSIH0=-3
            RETURN
10035     CONNE0(NODE,DNODE)=1
10033 GOTO 10028
10029 ASSIH0=-2
      RETURN
      END
      INTEGER FUNCTION ASSIG0(NODE)
      INTEGER NODE
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER I,LIST(3),PORT,SNODE,SOPDE
      INTEGER RESER0,SELEC0
      CALL MAKEP0(LIST,3)
      I=1
      GOTO 10038
10036 I=I+(1)
10038 IF((I.GE.NEXTI0(NODE)))GOTO 10037
        IF((IPDAA0(2,I,NODE).EQ.0))GOTO 10036
          IF((RESER0(IPDAA0(2,I,NODE),LIST,3).NE.-3))GOTO 10040
            ASSIG0=-3
            RETURN
10040   CONTINUE
10039 GOTO 10036
10037 I=1
      GOTO 10043
10041 I=I+(1)
10043 IF((I.GE.NEXTI0(NODE)))GOTO 10042
        IF((IPDAA0(1,I,NODE).NE.3))GOTO 10041
        IF((IPDAA0(2,I,NODE).NE.0))GOTO 10041
        IF((IPDAA0(3,I,NODE).GE.NODE))GOTO 10041
          PORT=SELEC0(LIST,3)
          IF((PORT.NE.-3))GOTO 10045
            ASSIG0=-3
            RETURN
10045     IPDAA0(2,I,NODE)=PORT
          SNODE=IPDAA0(3,I,NODE)
          SOPDE=IPDAA0(4,I,NODE)
          OPDAA0(4,SOPDE,SNODE)=PORT
10044 GOTO 10041
10042 I=1
      GOTO 10048
10046 I=I+(1)
10048 IF((I.GE.NEXTI0(NODE)))GOTO 10047
        IF((IPDAA0(2,I,NODE).NE.0))GOTO 10046
          PORT=SELEC0(LIST,3)
          IF((PORT.NE.-3))GOTO 10050
            ASSIG0=PORT
            RETURN
10050     IPDAA0(2,I,NODE)=PORT
          IF((IPDAA0(1,I,NODE).NE.3))GOTO 10051
            SNODE=IPDAA0(3,I,NODE)
            SOPDE=IPDAA0(4,I,NODE)
            OPDAA0(4,SOPDE,SNODE)=PORT
10051   CONTINUE
10049 GOTO 10046
10047 ASSIG0=-2
      RETURN
      END
      SUBROUTINE MAKEP0(LIST,MAXPO0)
      INTEGER MAXPO0,LIST(MAXPO0)
      INTEGER I
      DO 10052 I=1,MAXPO0
        LIST(I)=I
10052 CONTINUE
10053 RETURN
      END
      INTEGER FUNCTION RESER0(PORTNO,LIST,MAXPO0)
      INTEGER PORTNO,MAXPO0,LIST(MAXPO0)
      IF((PORTNO.LE.MAXPO0))GOTO 10054
        CALL SEMERR('illegal port number.')
        RESER0=-3
        GOTO 10055
10054   IF((LIST(PORTNO).NE.0))GOTO 10056
          CALL SEMERR('port referenced more than once.')
          RESER0=-3
          GOTO 10057
10056     LIST(PORTNO)=0
          RESER0=-2
10057 CONTINUE
10055 RETURN
      END
      INTEGER FUNCTION SELEC0(LIST,MAXPO0)
      INTEGER MAXPO0,LIST(MAXPO0)
      INTEGER I
      DO 10058 I=1,MAXPO0
        IF((LIST(I).EQ.0))GOTO 10060
          SELEC0=LIST(I)
          LIST(I)=0
          RETURN
10060   CONTINUE
10058 CONTINUE
10059 CALL SEMERR('too many ports referenced.')
      SELEC0=-3
      RETURN
      END
      INTEGER FUNCTION SETUQ0(N)
      INTEGER N
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER CIFIL0,CIFDA0(10),CIERR0,CITRA0,CICNO0(10)
      INTEGER CIBUF0(10),CIQUO0,CISEA0,CIQUP0,CIERS0,CIPRO0,CIHEL0,CIDEF
     *0
      INTEGER CIREC0
      INTEGER * 4 CIMDA0,CIMSI0,CICHE0
      COMMON /CICOM/CIQUO0,CISEA0,CIQUP0,CIPRO0,CIHEL0,CIERS0,CIDEF0,CIF
     *IL0,CITRA0,CIREC0,CIERR0,CIFDA0,CICNO0,CIBUF0,CIMDA0,CIMSI0,CICHE0
      COMMON /SWT$CM/TERMB0(128),TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFC
     *H0,ESCCH0,RTCHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0(6),KILLR0(33),FDMEM0(
     *16,128),RESES0(846),FDBUF0(16384),PASSW0(7),BPLAB0(4),UTEMP0,FDLAS
     *0,PRTDE0(17),PRTFO0(9),UHASH0(37),UTEMQ0(4059),RESET0(985),CMDST0,
     *COMUN0,RTLAB0(4),FIRST0,ARGCA0,ARGVA0(256),TERMA0(6),TERMT0(7),LWO
     *RD0,LSHOA0,LSTOP0,LSNAA0,LSREF0(16384),RESEU0(743),TSSTA0,TSGTA0,T
     *SATA0,TSEOS0,TSUNA0(32),TSPSA0(32),TSBFA0(32,32),TSPWA0(3,32),TSPA
     *T0(180),RESEV0(680),NEWSC0(85,51),RESEW0(785),CURSC0(85,51),RESEX0
     *(785),TCCLE0(10),TCCLF0(10),TCCLG0(10),TCCUR0(10),TCCUS0(10),TCCUT
     *0(10),TCCUU0(10),TCCUV0(10),TCABS0(10),TCVER0(10),TCHOR0(10),TCINS
     *0(10),TCDEL0(10),TCSHI0(10),TCSHJ0(10),TCCOO0,TCSHK0,TCCOP0,TCSEQ0
     *,TCSPE0,TCCLH0,TCLIN0,TCPOS0,TCWRA0,TCCLR0,TCCEO0,TCCEP0,TCABT0,TC
     *VES0,TCHOS0,TCHOM0,TCLEF0,TCUPL0,UNPRI0,COLCH0(51),COLCI0(51),ROWC
     *H0,ROWCI0,LASTC0(51),MAXRO0,MAXCO0,CURRO0,CURCO0,MSGRO0,MSGOW0(85)
     *,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0(128,20),LASTF0,TABSA0(85),INPU
     *T0(51),INPUU0(51),INBUF0(85),LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PB
     *BUF0(400),PBPTR0,FNUSE0(20),DEFBU0(1000),LASTE0,NESTI0,RESEY0(1)
      INTEGER TERMB0,TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFCH0,ESCCH0,RT
     *CHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0,FDMEM0,RESES0,FDBUF0,PASSW0,BPLAB
     *0,UTEMP0,UHASH0,UTEMQ0,RESET0,CMDST0,COMUN0,RTLAB0,FIRST0,ARGCA0,A
     *RGVA0,TERMA0,TERMT0,LSHOA0,LSTOP0,LSNAA0,LSREF0,RESEU0,FDLAS0,KILL
     *R0,PRTDE0,PRTFO0,LWORD0,TSSTA0,TSGTA0,TSATA0,TSEOS0,TSUNA0,TSPSA0,
     *TSBFA0,TSPWA0,TSPAT0,RESEV0,NEWSC0,RESEW0,CURSC0,RESEX0,TCCLE0,TCC
     *LF0,TCCLG0,TCCUR0,TCCUS0,TCCUT0,TCCUU0,TCCUV0,TCABS0,TCVER0,TCHOR0
     *,TCINS0,TCDEL0,TCCLH0,TCLIN0,TCPOS0,TCSHI0,TCSHJ0,TCCOO0,TCSHK0,TC
     *COP0,TCSEQ0,TCDEM0,TCWRA0,TCCLR0,TCSPE0,TCCEO0,TCCEP0,TCABT0,TCVES
     *0,TCHOS0,UNPRI0,COLCH0,COLCI0,ROWCH0,ROWCI0,LASTC0,MAXRO0,MAXCO0,C
     *URRO0,CURCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0,LAST
     *F0,TABSA0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,
     *PBBUF0,PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,TCHOM0,TCLEF0,TCUPL0,RES
     *EY0
      INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
     *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
     *PT0(1),FDOPU0(1)
      INTEGER I,FD,P,SN
      INTEGER OPEN,CREATE,MKTEMP
      INTEGER PATHN0(102)
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      SETUQ0=-3
      DO 10061 I=1,6
        STDPO0(I)=DEFAU0(I)
10061 CONTINUE
10062 I=1
      GOTO 10065
10063 I=I+(1)
10065 IF((I.GE.NEXTI0(N)))GOTO 10064
        AAAAA0=IPDAA0(1,I,N)
        GOTO 10066
10067     FD=CIFDA0(CIFIL0)
        GOTO 10068
10069     CALL LSEXTR(IPDAA0(3,I,N),PATHN0,102)
          FD=OPEN(PATHN0,1)
          IF((FD.NE.-3))GOTO 10068
            CALL PUTLIN(PATHN0,1)
            CALL SEMERR(': can''t open.')
            RETURN
10071     P=IPDAA0(4,I,N)
          SN=IPDAA0(3,I,N)
          FD=OPDAA0(5,P,SN)
          CALL REWIND(FD)
        GOTO 10068
10066   AAAAB0=AAAAA0-2
        GOTO(10071,10072,10072,10067,10069),AAAAB0
10072   CONTINUE
10068   IPDAA0(5,I,N)=FD
        P=2*IPDAA0(2,I,N)-1
        STDPO0(P)=FD
      GOTO 10063
10064 I=1
      GOTO 10075
10073 I=I+(1)
10075 IF((I.GE.NEXTO0(N)))GOTO 10074
        AAAAC0=OPDAA0(1,I,N)
        GOTO 10076
10077     CALL LSEXTR(OPDAA0(3,I,N),PATHN0,102)
          FD=CREATE(PATHN0,2)
          IF((FD.NE.-3))GOTO 10079
            CALL PUTLIN(PATHN0,1)
            CALL SEMERR(': can''t create.')
            RETURN
10080     CALL LSEXTR(OPDAA0(3,I,N),PATHN0,102)
          FD=OPEN(PATHN0,3)
          IF((FD.NE.-3))GOTO 10081
            CALL PUTLIN(PATHN0,1)
            CALL SEMERR(': can''t open.')
            RETURN
10081     CALL WIND(FD)
        GOTO 10079
10082     FD=MKTEMP(3)
          IF((FD.NE.-3))GOTO 10079
            CALL SEMERR('can''t open pipe temporary.')
            RETURN
10076   AAAAD0=AAAAC0-2
        GOTO(10082,10084,10084,10084,10084,10077,10080),AAAAD0
10084   CONTINUE
10079   OPDAA0(5,I,N)=FD
        P=2*OPDAA0(2,I,N)
        STDPO0(P)=FD
      GOTO 10073
10074 SETUQ0=-2
      RETURN
      END
      SUBROUTINE CLEAN0(N)
      INTEGER N
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      COMMON /SWT$CM/TERMB0(128),TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFC
     *H0,ESCCH0,RTCHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0(6),KILLR0(33),FDMEM0(
     *16,128),RESES0(846),FDBUF0(16384),PASSW0(7),BPLAB0(4),UTEMP0,FDLAS
     *0,PRTDE0(17),PRTFO0(9),UHASH0(37),UTEMQ0(4059),RESET0(985),CMDST0,
     *COMUN0,RTLAB0(4),FIRST0,ARGCA0,ARGVA0(256),TERMA0(6),TERMT0(7),LWO
     *RD0,LSHOA0,LSTOP0,LSNAA0,LSREF0(16384),RESEU0(743),TSSTA0,TSGTA0,T
     *SATA0,TSEOS0,TSUNA0(32),TSPSA0(32),TSBFA0(32,32),TSPWA0(3,32),TSPA
     *T0(180),RESEV0(680),NEWSC0(85,51),RESEW0(785),CURSC0(85,51),RESEX0
     *(785),TCCLE0(10),TCCLF0(10),TCCLG0(10),TCCUR0(10),TCCUS0(10),TCCUT
     *0(10),TCCUU0(10),TCCUV0(10),TCABS0(10),TCVER0(10),TCHOR0(10),TCINS
     *0(10),TCDEL0(10),TCSHI0(10),TCSHJ0(10),TCCOO0,TCSHK0,TCCOP0,TCSEQ0
     *,TCSPE0,TCCLH0,TCLIN0,TCPOS0,TCWRA0,TCCLR0,TCCEO0,TCCEP0,TCABT0,TC
     *VES0,TCHOS0,TCHOM0,TCLEF0,TCUPL0,UNPRI0,COLCH0(51),COLCI0(51),ROWC
     *H0,ROWCI0,LASTC0(51),MAXRO0,MAXCO0,CURRO0,CURCO0,MSGRO0,MSGOW0(85)
     *,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0(128,20),LASTF0,TABSA0(85),INPU
     *T0(51),INPUU0(51),INBUF0(85),LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PB
     *BUF0(400),PBPTR0,FNUSE0(20),DEFBU0(1000),LASTE0,NESTI0,RESEY0(1)
      INTEGER TERMB0,TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFCH0,ESCCH0,RT
     *CHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0,FDMEM0,RESES0,FDBUF0,PASSW0,BPLAB
     *0,UTEMP0,UHASH0,UTEMQ0,RESET0,CMDST0,COMUN0,RTLAB0,FIRST0,ARGCA0,A
     *RGVA0,TERMA0,TERMT0,LSHOA0,LSTOP0,LSNAA0,LSREF0,RESEU0,FDLAS0,KILL
     *R0,PRTDE0,PRTFO0,LWORD0,TSSTA0,TSGTA0,TSATA0,TSEOS0,TSUNA0,TSPSA0,
     *TSBFA0,TSPWA0,TSPAT0,RESEV0,NEWSC0,RESEW0,CURSC0,RESEX0,TCCLE0,TCC
     *LF0,TCCLG0,TCCUR0,TCCUS0,TCCUT0,TCCUU0,TCCUV0,TCABS0,TCVER0,TCHOR0
     *,TCINS0,TCDEL0,TCCLH0,TCLIN0,TCPOS0,TCSHI0,TCSHJ0,TCCOO0,TCSHK0,TC
     *COP0,TCSEQ0,TCDEM0,TCWRA0,TCCLR0,TCSPE0,TCCEO0,TCCEP0,TCABT0,TCVES
     *0,TCHOS0,UNPRI0,COLCH0,COLCI0,ROWCH0,ROWCI0,LASTC0,MAXRO0,MAXCO0,C
     *URRO0,CURCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0,LAST
     *F0,TABSA0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,
     *PBBUF0,PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,TCHOM0,TCLEF0,TCUPL0,RES
     *EY0
      INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
     *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
     *PT0(1),FDOPU0(1)
      INTEGER I
      INTEGER AAAAE0
      INTEGER AAAAF0
      INTEGER AAAAG0
      INTEGER AAAAH0
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      I=1
      GOTO 10087
10085 I=I+(1)
10087 IF((I.GE.NEXTI0(N)))GOTO 10086
        AAAAE0=IPDAA0(1,I,N)
        GOTO 10088
10089     CALL CLOSE(IPDAA0(5,I,N))
        GOTO 10085
10091     CALL RMTEMP(IPDAA0(5,I,N))
        GOTO 10085
10088   AAAAF0=AAAAE0-2
        GOTO(10091,10092,10092,10092,10089),AAAAF0
10092   CONTINUE
10090 GOTO 10085
10086 I=1
      GOTO 10095
10093 I=I+(1)
10095 IF((I.GE.NEXTO0(N)))GOTO 10094
        AAAAG0=OPDAA0(1,I,N)
        GOTO 10096
10097     CALL CLOSE(OPDAA0(5,I,N))
        GOTO 10093
10096   AAAAH0=AAAAG0-7
        GOTO(10097,10097),AAAAH0
10098 GOTO 10093
10094 DO 10099 I=1,6
        STDPO0(I)=DEFAU0(I)
10099 CONTINUE
10100 RETURN
      END
      SUBROUTINE DUMPP0(NODE)
      INTEGER NODE
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      COMMON /SWT$CM/TERMB0(128),TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFC
     *H0,ESCCH0,RTCHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0(6),KILLR0(33),FDMEM0(
     *16,128),RESES0(846),FDBUF0(16384),PASSW0(7),BPLAB0(4),UTEMP0,FDLAS
     *0,PRTDE0(17),PRTFO0(9),UHASH0(37),UTEMQ0(4059),RESET0(985),CMDST0,
     *COMUN0,RTLAB0(4),FIRST0,ARGCA0,ARGVA0(256),TERMA0(6),TERMT0(7),LWO
     *RD0,LSHOA0,LSTOP0,LSNAA0,LSREF0(16384),RESEU0(743),TSSTA0,TSGTA0,T
     *SATA0,TSEOS0,TSUNA0(32),TSPSA0(32),TSBFA0(32,32),TSPWA0(3,32),TSPA
     *T0(180),RESEV0(680),NEWSC0(85,51),RESEW0(785),CURSC0(85,51),RESEX0
     *(785),TCCLE0(10),TCCLF0(10),TCCLG0(10),TCCUR0(10),TCCUS0(10),TCCUT
     *0(10),TCCUU0(10),TCCUV0(10),TCABS0(10),TCVER0(10),TCHOR0(10),TCINS
     *0(10),TCDEL0(10),TCSHI0(10),TCSHJ0(10),TCCOO0,TCSHK0,TCCOP0,TCSEQ0
     *,TCSPE0,TCCLH0,TCLIN0,TCPOS0,TCWRA0,TCCLR0,TCCEO0,TCCEP0,TCABT0,TC
     *VES0,TCHOS0,TCHOM0,TCLEF0,TCUPL0,UNPRI0,COLCH0(51),COLCI0(51),ROWC
     *H0,ROWCI0,LASTC0(51),MAXRO0,MAXCO0,CURRO0,CURCO0,MSGRO0,MSGOW0(85)
     *,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0(128,20),LASTF0,TABSA0(85),INPU
     *T0(51),INPUU0(51),INBUF0(85),LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PB
     *BUF0(400),PBPTR0,FNUSE0(20),DEFBU0(1000),LASTE0,NESTI0,RESEY0(1)
      INTEGER TERMB0,TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFCH0,ESCCH0,RT
     *CHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0,FDMEM0,RESES0,FDBUF0,PASSW0,BPLAB
     *0,UTEMP0,UHASH0,UTEMQ0,RESET0,CMDST0,COMUN0,RTLAB0,FIRST0,ARGCA0,A
     *RGVA0,TERMA0,TERMT0,LSHOA0,LSTOP0,LSNAA0,LSREF0,RESEU0,FDLAS0,KILL
     *R0,PRTDE0,PRTFO0,LWORD0,TSSTA0,TSGTA0,TSATA0,TSEOS0,TSUNA0,TSPSA0,
     *TSBFA0,TSPWA0,TSPAT0,RESEV0,NEWSC0,RESEW0,CURSC0,RESEX0,TCCLE0,TCC
     *LF0,TCCLG0,TCCUR0,TCCUS0,TCCUT0,TCCUU0,TCCUV0,TCABS0,TCVER0,TCHOR0
     *,TCINS0,TCDEL0,TCCLH0,TCLIN0,TCPOS0,TCSHI0,TCSHJ0,TCCOO0,TCSHK0,TC
     *COP0,TCSEQ0,TCDEM0,TCWRA0,TCCLR0,TCSPE0,TCCEO0,TCCEP0,TCABT0,TCVES
     *0,TCHOS0,UNPRI0,COLCH0,COLCI0,ROWCH0,ROWCI0,LASTC0,MAXRO0,MAXCO0,C
     *URRO0,CURCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0,LAST
     *F0,TABSA0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,
     *PBBUF0,PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,TCHOM0,TCLEF0,TCUPL0,RES
     *EY0
      INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
     *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
     *PT0(1),FDOPU0(1)
      INTEGER I,J,P,SN
      INTEGER AAAAI0
      INTEGER AAAAJ0
      INTEGER AAAAK0
      INTEGER AAAAL0
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      DO 10101 I=1,3
        CALL PRINT(1,'STDIN*i   .',I)
        IF((STDPO0(2*I-1).NE.1))GOTO 10103
          CALL PRINT(1,'TTY  .')
          GOTO 10104
10103     CALL PRINT(1,'*3i  .',STDPO0(2*I-1))
10104   J=1
        GOTO 10107
10105   J=J+(1)
10107   IF((J.GE.NEXTI0(NODE)))GOTO 10106
          IF((IPDAA0(2,J,NODE).NE.I))GOTO 10105
            AAAAI0=IPDAA0(1,J,NODE)
            GOTO 10109
10110         CALL PRINT(1,'command source*n.')
            GOTO 10101
10112         CALL PRINT(1,'from .')
              CALL LSPUTF(IPDAA0(3,J,NODE),1)
              CALL PUTCH(138,1)
            GOTO 10101
10113         SN=IPDAA0(3,J,NODE)
              P=IPDAA0(4,J,NODE)
              CALL PRINT(1,'pipe from node *i port *i*n.',SN,OPDAA0(2,P,
     *SN))
            GOTO 10101
10109       AAAAJ0=AAAAI0-2
            GOTO(10113,10114,10114,10110,10112),AAAAJ0
10114       CONTINUE
10111       GOTO 10101
10106   CALL PRINT(1,'defaulted*n.')
10101 CONTINUE
10102 DO 10115 I=1,3
        CALL PRINT(1,'STDOUT*i  .',I)
        IF((STDPO0(2*I).NE.1))GOTO 10117
          CALL PRINT(1,'TTY  .')
          GOTO 10118
10117     CALL PRINT(1,'*3i  .',STDPO0(2*I))
10118   J=1
        GOTO 10121
10119   J=J+(1)
10121   IF((J.GE.NEXTO0(NODE)))GOTO 10120
          IF((OPDAA0(2,J,NODE).NE.I))GOTO 10119
            AAAAK0=OPDAA0(1,J,NODE)
            GOTO 10123
10124         CALL PRINT(1,'toward .')
              CALL LSPUTF(OPDAA0(3,J,NODE),1)
              CALL PUTCH(138,1)
            GOTO 10115
10126         CALL PRINT(1,'append to .')
              CALL LSPUTF(OPDAA0(3,J,NODE),1)
              CALL PUTCH(138,1)
            GOTO 10115
10127         CALL PRINT(1,'pipe to node *i port *i*n.',OPDAA0(3,J,NODE)
     *,OPDAA0(4,J,NODE))
            GOTO 10115
10123       AAAAL0=AAAAK0-2
            GOTO(10127,10128,10128,10128,10128,10124,10126),AAAAL0
10128       CONTINUE
10125       GOTO 10115
10120   CALL PRINT(1,'defaulted*n.')
10115 CONTINUE
10116 RETURN
      END
C ---- Long Name Map ----
C forgetcmd                      forge0
C installationcmd                insta0
C Cimdate                        cimda0
C Fdflags                        fdfla0
C setupports                     setuq0
C singlestep                     singl0
C timecmd                        timec0
C Eofchar                        eofch0
C Inputstart                     input0
C reserveport                    reser0
C searchfor                      searc0
C Escchar                        escch0
C Invertcase                     inver0
C loginnamecmd                   logio0
C Symiport                       symip0
C Tccoordchar                    tccoo0
C Tabs                           tabsa0
C Fdbufstart                     fdbug0
C whencmd                        whenc0
C Citrace                        citra0
C Rtchar                         rtcha0
C Prtdest                        prtde0
C Tcdelline                      tcdel0
C Colchgstop                     colci0
C Rowchgstart                    rowch0
C Maxcol                         maxco0
C executenode                    execv0
C putbackcommand                 putba0
C results                        resul0
C Echar                          echar0
C Tseos                          tseos0
C Tclinedelay                    tclin0
C Fnused                         fnuse0
C getneta                        getne0
C initports                      initp0
C lookuplabel                    looku0
C Termcount                      termd0
C Reservedio                     reses0
C Tsstate                        tssta0
C Tccursorright                  tccut0
C Tcabspos                       tcabs0
C Tcposdelay                     tcpos0
C Tchorlen                       tchos0
C dropcmd                        dropc0
C Symstr                         symst0
C Cierrorflag                    cierr0
C Reservedopen                   reset0
C Lsna                           lsnaa0
C Tcseqtype                      tcseq0
C Unprintablechar                unpri0
C Fdesc                          fdesc0
C checklabels                    check0
C dumpcmd                        dumpc0
C dumpports                      dumpp0
C histinit                       histi0
C selectport                     selec0
C Cputype                        cputy0
C Prtform                        prtfo0
C Tsbf                           tsbfa0
C Curcol                         curco0
C Lastfn                         lastf0
C Insertmode                     inser0
C argstocmd                      argst0
C histlook                       histl0
C makeportlist                   makep0
C Symoport                       symop0
C Cihello                        cihel0
C Fdbuf                          fdbuf0
C Argv                           argva0
C Lstop                          lstop0
C Tcceollen                      tccep0
C cleanupports                   clean0
C getnexttoken                   getng0
C histcmd                        histc0
C initconnect                    initc0
C nextunquotedchar               nextu0
C nextwhiletoken                 nextw0
C Cmdptr                         cmdpt0
C Tcshiftchar                    tcshk0
C Inputwait                      inpuv0
C Fdunit                         fduni0
C createlabel                    creat0
C gotocmd                        gotoc0
C Cibuf                          cibuf0
C Termcp                         termc0
C Kchar                          kchar0
C Fdmem                          fdmem0
C Fddev                          fddev0
C Fdvcstat1                      fdvcs0
C clrargs                        clrar0
C enterlabel                     enter0
C exitcmd                        exitd0
C loginfo                        login0
C shtracecmd                     shtra0
C Lastdef                        laste0
C Tcdelaytime                    tcdem0
C Fdvcstat2                      fdvct0
C Cidefaultsr                    cidef0
C Killresp                       killr0
C Tccleardelay                   tcclh0
C Padrow                         padro0
C Fntab                          fntab0
C varscmd                        varsc0
C Reservednewscr                 resew0
C Reservedcurscr                 resex0
C restorestate                   resto0
C vpsdcmd                        vpsdc0
C Cmd                            cmdaa0
C Utempbuf                       utemq0
C Rtlabel                        rtlab0
C Lsho                           lshoa0
C Tcvertpos                      tcver0
C Tcwraparound                   tcwra0
C Tchomelen                      tchom0
C assigniports                   assig0
C histarg                        hista0
C Tcceoslen                      tcceo0
C Fdbufend                       fdbui0
C execute                        execu0
C findlabel                      findl0
C makeiport                      makei0
C symboltrace                    symbo0
C Tcspeed                        tcspe0
C Tcleftlen                      tclef0
C Pbbuf                          pbbuf0
C Fdopstat1                      fdops0
C Nextiport                      nexti0
C Passwd                         passw0
C Newscr                         newsc0
C Curscr                         cursc0
C Duplex                         duple0
C Fdopstat2                      fdopt0
C indexcmd                       index0
C primoscmd                      primo0
C Connect                        conne0
C Tccursorhome                   tccur0
C Fdopstat3                      fdopu0
C whilecmd                       while0
C Tspath                         tspat0
C clrports                       clrpo0
C initlabels                     initl0
C savestate                      saves0
C Ciprompt                       cipro0
C Tsat                           tsata0
C Tccursorleft                   tccus0
C Colchgstart                    colch0
C pathname                       pathn0
C assignoports                   assih0
C histget                        histh0
C nargscmd                       nargs0
C Reservedshell                  reseu0
C Inbuf                          inbuf0
C Nestingcount                   nesti0
C makeoport                      makeo0
C Cifile                         cifil0
C Cierrorcontext                 ciers0
C Reservedtscan                  resev0
C Defbuf                         defbu0
C getelement                     getel0
C stopcmd                        stopc0
C Nextoport                      nexto0
C Ipd                            ipdaa0
C Symlen                         symle0
C Uhashtb                        uhash0
C Fdbuflen                       fdbuh0
C casecmd                        casec0
C stoplogging                    stopl0
C Curnode                        curno0
C Symtype                        symty0
C Cmdstat                        cmdst0
C Tchorpos                       tchor0
C Tcinsline                      tcins0
C Msgowner                       msgow0
C invokevar                      invom0
C Cifd                           cifda0
C Cicnodes                       cicno0
C Cisearchrule                   cisea0
C Fdlastfd                       fdlas0
C Termattr                       terma0
C datecmd                        datec0
C Ciquoteopt                     ciqup0
C Tsgt                           tsgta0
C Tcshiftout                     tcshj0
C Inputstop                      inpuu0
C accessarg                      acces0
C echocmd                        echoc0
C invokeint                      invol0
C substrcmd                      subst0
C Symtext                        symte0
C Firstuse                       first0
C Tcshiftin                      tcshi0
C Displaytime                    displ0
C Fdcount                        fdcou0
C declarecmd                     decla0
C nettrace                       nettr0
C Cirecord                       cirec0
C Cimsize                        cimsi0
C getnetlabel                    getnf0
C Opd                            opdaa0
C Cicheck                        ciche0
C Termbuf                        termb0
C Lsref                          lsref0
C Tcabslen                       tcabt0
C Rowchgstop                     rowci0
C Maxrow                         maxro0
C Padcol                         padco0
C Lastcharscanned                lastd0
C Msgrow                         msgro0
C Padlen                         padle0
C histfind                       histf0
C histsub                        hists0
C Defaultporttable               defau0
C Stdporttbl                     stdpo0
C exitcasecmd                    exitc0
C histfree                       histg0
C histque                        histq0
C redirector                     redir0
C Argc                           argca0
C Termtype                       termt0
C Tccleartoeol                   tcclf0
C invokeext                      invok0
C takecmd                        takec0
C Cmdcursor                      cmdcu0
C Tccursordown                   tccuv0
C Currow                         curro0
C context                        conte0
C histexp                        histe0
C setupargs                      setup0
C Ciquote                        ciquo0
C Nlchar                         nlcha0
C Isphantom                      ispha0
C Tsun                           tsuna0
C Tsps                           tspsa0
C Reservedvthmisc                resey0
C clrlabels                      clrla0
C Tcuplen                        tcupl0
C Lastchar                       lastc0
C evalcmd                        evalc0
C evalnetsep                     evaln0
C linecmd                        linec0
C repeatcmd                      repea0
C Utemptop                       utemp0
C elsecmd                        elsec0
C removecn                       remov0
C Bplabel                        bplab0
C nodesepr                       nodes0
C Tspw                           tspwa0
C Tcclearscreen                  tccle0
C Tccoordtype                    tccop0
C Tcvertlen                      tcves0
C Fdbcount                       fdbco0
C initargs                       inita0
C initializeeverything           initi0
C processhello                   proce0
C Symnode                        symno0
C Comunit                        comun0
C Tccleartoeos                   tcclg0
C Tccursorup                     tccuu0
C assignports                    assii0
C filetype                       filet0
C quotecmd                       quote0
C maxport                        maxpo0
C Tcclrlen                       tcclr0
C argscmd                        argsc0
C argument                       argum0
C declaredcmd                    declb0
C startlogging                   start0
C Errcod                         errco0
C Lword                          lword0
C Pbptr                          pbptr0
