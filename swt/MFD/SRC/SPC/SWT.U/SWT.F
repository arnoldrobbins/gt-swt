      SUBROUTINE MAIN
      COMMON /SWT$CM/TERMB0(128),TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFC
     *H0,ESCCH0,RTCHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0(6),KILLR0(33),FDMEM0(
     *16,128),RESER0(846),FDBUF0(16384),PASSW0(7),BPLAB0(4),UTEMP0,FDLAS
     *0,PRTDE0(17),PRTFO0(9),UHASH0(37),UTEMQ0(4059),RESES0(985),CMDST0,
     *COMUN0,RTLAB0(4),FIRST0,ARGCA0,ARGVA0(256),TERMA0(6),TERMT0(7),LWO
     *RD0,LSHOA0,LSTOP0,LSNAA0,LSREF0(16384),RESET0(743),TSSTA0,TSGTA0,T
     *SATA0,TSEOS0,TSUNA0(32),TSPSA0(32),TSBFA0(32,32),TSPWA0(3,32),TSPA
     *T0(180),RESEU0(680),NEWSC0(85,51),RESEV0(785),CURSC0(85,51),RESEW0
     *(785),TCCLE0(10),TCCLF0(10),TCCLG0(10),TCCUR0(10),TCCUS0(10),TCCUT
     *0(10),TCCUU0(10),TCCUV0(10),TCABS0(10),TCVER0(10),TCHOR0(10),TCINS
     *0(10),TCDEL0(10),TCSHI0(10),TCSHJ0(10),TCCOO0,TCSHK0,TCCOP0,TCSEQ0
     *,TCSPE0,TCCLH0,TCLIN0,TCPOS0,TCWRA0,TCCLR0,TCCEO0,TCCEP0,TCABT0,TC
     *VES0,TCHOS0,TCHOM0,TCLEF0,TCUPL0,UNPRI0,COLCH0(51),COLCI0(51),ROWC
     *H0,ROWCI0,LASTC0(51),MAXRO0,MAXCO0,CURRO0,CURCO0,MSGRO0,MSGOW0(85)
     *,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0(128,20),LASTF0,TABSA0(85),INPU
     *T0(51),INPUU0(51),INBUF0(85),LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PB
     *BUF0(400),PBPTR0,FNUSE0(20),DEFBU0(1000),LASTE0,NESTI0,RESEX0(1)
      INTEGER TERMB0,TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFCH0,ESCCH0,RT
     *CHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0,FDMEM0,RESER0,FDBUF0,PASSW0,BPLAB
     *0,UTEMP0,UHASH0,UTEMQ0,RESES0,CMDST0,COMUN0,RTLAB0,FIRST0,ARGCA0,A
     *RGVA0,TERMA0,TERMT0,LSHOA0,LSTOP0,LSNAA0,LSREF0,RESET0,FDLAS0,KILL
     *R0,PRTDE0,PRTFO0,LWORD0,TSSTA0,TSGTA0,TSATA0,TSEOS0,TSUNA0,TSPSA0,
     *TSBFA0,TSPWA0,TSPAT0,RESEU0,NEWSC0,RESEV0,CURSC0,RESEW0,TCCLE0,TCC
     *LF0,TCCLG0,TCCUR0,TCCUS0,TCCUT0,TCCUU0,TCCUV0,TCABS0,TCVER0,TCHOR0
     *,TCINS0,TCDEL0,TCCLH0,TCLIN0,TCPOS0,TCSHI0,TCSHJ0,TCCOO0,TCSHK0,TC
     *COP0,TCSEQ0,TCDEM0,TCWRA0,TCCLR0,TCSPE0,TCCEO0,TCCEP0,TCABT0,TCVES
     *0,TCHOS0,UNPRI0,COLCH0,COLCI0,ROWCH0,ROWCI0,LASTC0,MAXRO0,MAXCO0,C
     *URRO0,CURCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0,LAST
     *F0,TABSA0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,
     *PBBUF0,PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,TCHOM0,TCLEF0,TCUPL0,RES
     *EX0
      INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
     *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
     *PT0(1),FDOPU0(1)
      INTEGER CINAME(102)
      INTEGER I,CODE,CMD(2),INFO(8),FNAME(16),JUNK(3),FIRST
      INTEGER GETTO,FINDF$,FILTST,CALL$$,DUPLX$
      INTEGER FD
      INTEGER OPEN,CREATE
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0
      INTEGER AAAAE0(9)
      INTEGER AAAAF0(11)
      INTEGER AAAAG0(50)
      INTEGER AAAAH0(47)
      INTEGER AAAAI0(34)
      INTEGER AAAAJ0(6)
      INTEGER AAAAK0(44)
      INTEGER AAAAL0(42)
      INTEGER AAAAM0(9)
      INTEGER AAAAN0(13)
      INTEGER AAAAO0(29)
      INTEGER AAAAP0(14)
      INTEGER AAAAQ0(14)
      INTEGER AAAAR0(14)
      INTEGER AAAAS0(23)
      INTEGER AAAAT0(14)
      INTEGER AAAAU0(16)
      INTEGER AAAAV0(19)
      INTEGER AAAAW0(102),AAAAX0(102)
      INTEGER AAAAY0,AAAAZ0
      INTEGER EXPAND,EQUAL,DUPLX$,GETLIN,CHKSTR,GFDATA
      INTEGER AAABA0(10)
      INTEGER AAABB0(10)
      INTEGER AAABC0(7)
      INTEGER TTYP$R,TTYP$V,TTYP$F,TTYP$Q
      INTEGER AAABD0(6)
      INTEGER AAABI0(102)
      INTEGER AAABF0,AAABG0
      INTEGER GETLIN,STRLSR
      INTEGER AAABE0
      INTEGER OPEN
      INTEGER AAABJ0(11)
      INTEGER AAABK0(83)
      INTEGER AAABL0(6)
      INTEGER AAABM0(44)
      INTEGER AAABN0(42)
      INTEGER AAABO0,AAABQ0,AAABP0
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      DATA AAAAE0/189,226,233,238,189,175,243,232,0/
      DATA AAAAF0/189,246,225,242,243,230,233,236,229,189,0/
      DATA AAAAG0/217,239,245,160,237,245,243,244,160,232,225,246,229,16
     *0,225,160,240,242,239,230,233,236,229,160,228,233,242,229,227,244,
     *239,242,249,160,233,238,160,244,232,229,160,214,193,210,211,160,24
     *5,230,228,0/
      DATA AAAAH0/244,239,160,242,245,238,160,244,232,229,160,211,245,22
     *6,243,249,243,244,229,237,174,160,160,208,236,229,225,243,229,160,
     *232,225,246,229,160,249,239,245,242,160,243,249,243,244,229,237,0/
      DATA AAAAI0/225,228,237,233,238,233,243,244,242,225,244,239,242,16
     *0,227,242,229,225,244,229,160,239,238,229,160,230,239,242,160,249,
     *239,245,174,0/
      DATA AAAAJ0/174,246,225,242,243,0/
      DATA AAAAK0/195,225,238,167,244,160,239,240,229,238,160,174,214,19
     *3,210,211,160,233,238,160,249,239,245,242,160,240,242,239,230,233,
     *236,229,160,228,233,242,229,227,244,239,242,249,174,0/
      DATA AAAAL0/208,236,229,225,243,229,160,227,232,229,227,235,160,24
     *9,239,245,242,160,240,225,243,243,247,239,242,228,160,225,238,228,
     *160,244,242,249,160,225,231,225,233,238,174,0/
      DATA AAAAM0/170,243,170,238,170,243,170,238,0/
      DATA AAAAN0/223,243,229,225,242,227,232,223,242,245,236,229,0/
      DATA AAAAO0/222,233,238,244,172,222,246,225,242,172,166,172,189,23
     *6,226,233,238,189,175,166,172,189,226,233,238,189,175,166,0/
      DATA AAAAP0/189,229,248,244,242,225,189,175,238,245,237,243,231,0/
      DATA AAAAQ0/189,237,225,233,236,189,175,189,245,243,229,242,189,0/
      DATA AAAAR0/217,239,245,160,232,225,246,229,160,237,225,233,236,0/
      DATA AAAAS0/189,238,229,247,243,189,175,228,229,236,233,246,229,24
     *2,249,175,189,245,243,229,242,189,0/
      DATA AAAAT0/212,232,229,242,229,160,233,243,160,238,229,247,243,0/
      DATA AAAAU0/170,243,186,160,238,239,244,160,230,239,245,238,228,17
     *0,238,0/
      DATA AAAAV0/170,243,186,160,227,225,238,167,244,160,233,238,246,23
     *9,235,229,170,238,0/
      DATA AAABA0/189,246,225,242,243,228,233,242,189,0/
      DATA AAABB0/208,225,243,243,247,239,242,228,186,0/
      DATA AAABD0/226,225,244,227,232,0/
      DATA AAABK0/223,227,233,223,238,225,237,229,0,223,229,239,230,0,22
     *3,229,242,225,243,229,0,223,229,243,227,225,240,229,0,223,235,233,
     *236,236,0,223,238,229,247,236,233,238,229,0,223,242,229,244,249,24
     *0,229,0,223,235,233,236,236,223,242,229,243,240,0,223,240,242,244,
     *223,228,229,243,244,0,223,240,242,244,223,230,239,242,237,0/
      DATA AAABJ0/10,1,10,15,22,30,36,45,53,64,74/
      DATA AAABL0/174,246,225,242,243,0/
      DATA AAABM0/195,225,238,167,244,160,239,240,229,238,160,174,214,19
     *3,210,211,160,233,238,160,249,239,245,242,160,240,242,239,230,233,
     *236,229,160,228,233,242,229,227,244,239,242,249,174,0/
      DATA AAABN0/208,236,229,225,243,229,160,227,232,229,227,235,160,24
     *9,239,245,242,160,240,225,243,243,247,239,242,228,160,225,238,228,
     *160,244,242,249,160,225,231,225,233,238,174,0/
      CALL FIXLIB
      CALL ICOMN$
      CALL FIRST$(FIRST)
      CALL RDTK$$(1,INFO,CMD,2,CODE)
      IF((INFO(1).NE.1))GOTO 10004
      IF((AND(INFO(3),8192).EQ.0))GOTO 10004
      IF((AND(INFO(3),:100000).EQ.0))GOTO 10004
        COMUN0=-INFO(4)
        GOTO 10005
10004   CALL COMI$$('PAUSE',5,0,CODE)
        AAAAA0=1
        GOTO 10000
10006 CONTINUE
10005 CALL UTYPE$(I)
      IF(((I.LT.1).OR.(I.GT.6)))GOTO 10007
        ISPHA0=0
        GOTO 10008
10007   IF(((I.LT.65).OR.(I.GT.70)))GOTO 10009
          ISPHA0=1
          GOTO 10010
10009     ISPHA0=1
10010 CONTINUE
10008 AAAAB0=1
      GOTO 10001
10011 AAAAD0=1
      GOTO 10003
10012 CALL LDTMP$
      CALL SCOPY(AAAAE0,1,CINAME,1)
      IF((GETTO(AAAAF0,FNAME,JUNK,JUNK).NE.-3))GOTO 10013
        CALL REMARK(AAAAG0)
        CALL REMARK(AAAAH0)
        CALL REMARK(AAAAI0)
        RETURN
10013 IF((FINDF$(FNAME).NE.1))GOTO 10014
        AAAAC0=1
        GOTO 10002
10014   FD=CREATE(AAAAJ0,2)
        IF((FD.NE.-3))GOTO 10017
          CALL REMARK(AAAAK0)
          CALL REMARK(AAAAL0)
          RETURN
10017   CALL PRINT(FD,AAAAM0,AAAAN0,AAAAO0)
        CALL CLOSE(FD)
        FD=OPEN(AAAAP0,1)
        IF((FD.EQ.-3))GOTO 10018
          CALL FCOPY(FD,1)
          CALL CLOSE(FD)
10018 CONTINUE
10016 CALL FOLLOW(0,0)
      IF((FILTST(AAAAQ0,0,0,1,0,0,0,0).NE.1))GOTO 10019
        CALL REMARK(AAAAR0)
10019 IF((FILTST(AAAAS0,0,0,1,0,0,0,0).NE.1))GOTO 10020
        CALL REMARK(AAAAT0)
10020 IF((GETTO(CINAME,FNAME,JUNK,JUNK).EQ.-3))GOTO 10022
      IF((FINDF$(FNAME).EQ.0))GOTO 10022
      GOTO 10021
10022   CALL PRINT(1,AAAAU0,CINAME)
        RETURN
10021 IF((CALL$$(FNAME,32).NE.-3))GOTO 10023
        CALL PRINT(1,AAAAV0,CINAME)
        GOTO 10024
10023   CALL PUTCH(138,1)
10024 RETURN
10001 IF((GFDATA(6,AAABA0,AAAAW0,AAAAY0,AAAAX0).EQ.-3))GOTO 10025
        PASSW0(1)=0
        GOTO 10011
10025   IF((FIRST.EQ.1))GOTO 10028
        IF((CHKSTR(PASSW0,7).EQ.0))GOTO 10028
        GOTO 10027
10028     AAAAZ0=DUPLX$(-1)
          CALL DUPLX$(OR(AAAAZ0,:140000))
          CALL PRINT(1,AAABB0)
          AAAAY0=GETLIN(AAAAW0,1)
          CALL PUTCH(138,1)
          CALL DUPLX$(AAAAZ0)
          IF((AAAAY0.EQ.-1))GOTO 10029
            AAAAW0(AAAAY0)=0
10029     CALL MAPSTR(AAAAW0,2)
          CALL CTOC(AAAAW0,PASSW0,7)
10027 CONTINUE
10026 GOTO 10011
10003 IF((ISPHA0.NE.1))GOTO 10031
        CALL TTYP$V(AAABD0)
        GOTO 10012
10031   IF((FIRST.NE.0))GOTO 10033
        IF((TTYP$R(AAABC0).NE.1))GOTO 10033
        IF((TTYP$V(AAABC0).NE.1))GOTO 10033
          GOTO 10034
10033     IF((TTYP$F(AAABC0).NE.1))GOTO 10035
            GOTO 10036
10035       CALL TTYP$Q(AAABC0,1)
10036   CONTINUE
10034 CONTINUE
10032 GOTO 10012
10002 AAABE0=OPEN(AAABL0,1)
      IF((AAABE0.NE.-3))GOTO 10038
        CALL REMARK(AAABM0)
        CALL REMARK(AAABN0)
        RETURN
10038 CONTINUE
10039   AAABG0=GETLIN(AAABI0,AAABE0)
        IF((AAABG0.NE.-1))GOTO 10040
          GOTO 10041
10040   IF((AAABG0.LE.0))GOTO 10042
          AAABI0(AAABG0)=0
10042   AAABF0=STRLSR(AAABJ0,AAABK0,0,AAABI0)
        AAABG0=GETLIN(AAABI0,AAABE0)
        IF((AAABG0.LE.0))GOTO 10043
          AAABI0(AAABG0)=0
10043   CALL INITV0(AAABF0,AAABI0,CINAME)
      GOTO 10039
10041 CALL CLOSE(AAABE0)
      GOTO 10016
10000 AAABO0=0
10045   AAABO0=AAABO0+(1)
        IF((AAABO0.NE.COMUN0))GOTO 10046
          GOTO 10047
10046   CALL SRCH$$(4,0,0,AAABO0,AAABP0,AAABQ0)
10047 IF((AAABQ0.NE.29))GOTO 10045
      GOTO 10006
      END
      SUBROUTINE INITV0(I,STR,CINAME)
      INTEGER I
      INTEGER STR(1),CINAME(1)
      COMMON /SWT$CM/TERMB0(128),TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFC
     *H0,ESCCH0,RTCHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0(6),KILLR0(33),FDMEM0(
     *16,128),RESER0(846),FDBUF0(16384),PASSW0(7),BPLAB0(4),UTEMP0,FDLAS
     *0,PRTDE0(17),PRTFO0(9),UHASH0(37),UTEMQ0(4059),RESES0(985),CMDST0,
     *COMUN0,RTLAB0(4),FIRST0,ARGCA0,ARGVA0(256),TERMA0(6),TERMT0(7),LWO
     *RD0,LSHOA0,LSTOP0,LSNAA0,LSREF0(16384),RESET0(743),TSSTA0,TSGTA0,T
     *SATA0,TSEOS0,TSUNA0(32),TSPSA0(32),TSBFA0(32,32),TSPWA0(3,32),TSPA
     *T0(180),RESEU0(680),NEWSC0(85,51),RESEV0(785),CURSC0(85,51),RESEW0
     *(785),TCCLE0(10),TCCLF0(10),TCCLG0(10),TCCUR0(10),TCCUS0(10),TCCUT
     *0(10),TCCUU0(10),TCCUV0(10),TCABS0(10),TCVER0(10),TCHOR0(10),TCINS
     *0(10),TCDEL0(10),TCSHI0(10),TCSHJ0(10),TCCOO0,TCSHK0,TCCOP0,TCSEQ0
     *,TCSPE0,TCCLH0,TCLIN0,TCPOS0,TCWRA0,TCCLR0,TCCEO0,TCCEP0,TCABT0,TC
     *VES0,TCHOS0,TCHOM0,TCLEF0,TCUPL0,UNPRI0,COLCH0(51),COLCI0(51),ROWC
     *H0,ROWCI0,LASTC0(51),MAXRO0,MAXCO0,CURRO0,CURCO0,MSGRO0,MSGOW0(85)
     *,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0(128,20),LASTF0,TABSA0(85),INPU
     *T0(51),INPUU0(51),INBUF0(85),LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PB
     *BUF0(400),PBPTR0,FNUSE0(20),DEFBU0(1000),LASTE0,NESTI0,RESEX0(1)
      INTEGER TERMB0,TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFCH0,ESCCH0,RT
     *CHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0,FDMEM0,RESER0,FDBUF0,PASSW0,BPLAB
     *0,UTEMP0,UHASH0,UTEMQ0,RESES0,CMDST0,COMUN0,RTLAB0,FIRST0,ARGCA0,A
     *RGVA0,TERMA0,TERMT0,LSHOA0,LSTOP0,LSNAA0,LSREF0,RESET0,FDLAS0,KILL
     *R0,PRTDE0,PRTFO0,LWORD0,TSSTA0,TSGTA0,TSATA0,TSEOS0,TSUNA0,TSPSA0,
     *TSBFA0,TSPWA0,TSPAT0,RESEU0,NEWSC0,RESEV0,CURSC0,RESEW0,TCCLE0,TCC
     *LF0,TCCLG0,TCCUR0,TCCUS0,TCCUT0,TCCUU0,TCCUV0,TCABS0,TCVER0,TCHOR0
     *,TCINS0,TCDEL0,TCCLH0,TCLIN0,TCPOS0,TCSHI0,TCSHJ0,TCCOO0,TCSHK0,TC
     *COP0,TCSEQ0,TCDEM0,TCWRA0,TCCLR0,TCSPE0,TCCEO0,TCCEP0,TCABT0,TCVES
     *0,TCHOS0,UNPRI0,COLCH0,COLCI0,ROWCH0,ROWCI0,LASTC0,MAXRO0,MAXCO0,C
     *URRO0,CURCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0,LAST
     *F0,TABSA0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,
     *PBBUF0,PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,TCHOM0,TCLEF0,TCUPL0,RES
     *EX0
      INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
     *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
     *PT0(1),FDOPU0(1)
      INTEGER K
      INTEGER MNTOC
      INTEGER AAABR0
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      K=1
      AAABR0=I-1
      GOTO 10049
10050   CALL CTOC(STR,CINAME,102)
      GOTO 10051
10052   EOFCH0=MNTOC(STR,K,131)
      GOTO 10051
10053   ECHAR0=MNTOC(STR,K,136)
      GOTO 10051
10054   ESCCH0=MNTOC(STR,K,155)
      GOTO 10051
10055   KCHAR0=MNTOC(STR,K,255)
      GOTO 10051
10056   NLCHA0=MNTOC(STR,K,138)
      GOTO 10051
10057   RTCHA0=MNTOC(STR,K,146)
      GOTO 10051
10058   CALL CTOC(STR,KILLR0,33)
      GOTO 10051
10059   CALL CTOC(STR,PRTDE0,17)
      GOTO 10051
10060   CALL CTOC(STR,PRTFO0,9)
      GOTO 10051
10049 GOTO(10050,10052,10053,10054,10055,10056,10057,10058,10059,10060),
     *AAABR0
10051 RETURN
      END
C ---- Long Name Map ----
C Fdflags                        fdfla0
C Eofchar                        eofch0
C Inputstart                     input0
C Escchar                        escch0
C Invertcase                     inver0
C Tccoordchar                    tccoo0
C Tabs                           tabsa0
C Fdbufstart                     fdbug0
C Rtchar                         rtcha0
C Prtdest                        prtde0
C Tcdelline                      tcdel0
C Colchgstop                     colci0
C Rowchgstart                    rowch0
C Maxcol                         maxco0
C Echar                          echar0
C Tseos                          tseos0
C Tclinedelay                    tclin0
C Fnused                         fnuse0
C Termcount                      termd0
C Reservedio                     reser0
C Tsstate                        tssta0
C Tccursorright                  tccut0
C Tcabspos                       tcabs0
C Tcposdelay                     tcpos0
C Tchorlen                       tchos0
C Reservedopen                   reses0
C Lsna                           lsnaa0
C Tcseqtype                      tcseq0
C Unprintablechar                unpri0
C Fdesc                          fdesc0
C Cputype                        cputy0
C Prtform                        prtfo0
C Tsbf                           tsbfa0
C Curcol                         curco0
C Lastfn                         lastf0
C Insertmode                     inser0
C Fdbuf                          fdbuf0
C Argv                           argva0
C Lstop                          lstop0
C Tcceollen                      tccep0
C Tcshiftchar                    tcshk0
C Inputwait                      inpuv0
C Fdunit                         fduni0
C Termcp                         termc0
C Kchar                          kchar0
C Fdmem                          fdmem0
C Fddev                          fddev0
C Fdvcstat1                      fdvcs0
C Lastdef                        laste0
C Tcdelaytime                    tcdem0
C Fdvcstat2                      fdvct0
C Killresp                       killr0
C Tccleardelay                   tcclh0
C Padrow                         padro0
C Fntab                          fntab0
C Reservednewscr                 resev0
C Reservedcurscr                 resew0
C Utempbuf                       utemq0
C Rtlabel                        rtlab0
C Lsho                           lshoa0
C Tcvertpos                      tcver0
C Tcwraparound                   tcwra0
C Tchomelen                      tchom0
C Tcceoslen                      tcceo0
C Fdbufend                       fdbui0
C Tcspeed                        tcspe0
C Tcleftlen                      tclef0
C Pbbuf                          pbbuf0
C Fdopstat1                      fdops0
C Passwd                         passw0
C Newscr                         newsc0
C Curscr                         cursc0
C Duplex                         duple0
C Fdopstat2                      fdopt0
C Tccursorhome                   tccur0
C Fdopstat3                      fdopu0
C Tspath                         tspat0
C Tsat                           tsata0
C Tccursorleft                   tccus0
C Colchgstart                    colch0
C Reservedshell                  reset0
C Inbuf                          inbuf0
C Nestingcount                   nesti0
C Reservedtscan                  reseu0
C Defbuf                         defbu0
C closefiles                     close0
C loadvariables                  loadv0
C Uhashtb                        uhash0
C Fdbuflen                       fdbuh0
C Cmdstat                        cmdst0
C Tchorpos                       tchor0
C Tcinsline                      tcins0
C Msgowner                       msgow0
C Fdlastfd                       fdlas0
C Termattr                       terma0
C Tsgt                           tsgta0
C Tcshiftout                     tcshj0
C Inputstop                      inpuu0
C initvar                        initv0
C Firstuse                       first0
C Tcshiftin                      tcshi0
C Displaytime                    displ0
C Fdcount                        fdcou0
C savelword                      savel0
C Termbuf                        termb0
C Lsref                          lsref0
C Tcabslen                       tcabt0
C Rowchgstop                     rowci0
C Maxrow                         maxro0
C Padcol                         padco0
C Lastcharscanned                lastd0
C Msgrow                         msgro0
C Padlen                         padle0
C getpassword                    getpa0
C Stdporttbl                     stdpo0
C Argc                           argca0
C Termtype                       termt0
C Tccleartoeol                   tcclf0
C Tccursordown                   tccuv0
C Currow                         curro0
C Nlchar                         nlcha0
C Isphantom                      ispha0
C Tsun                           tsuna0
C Tsps                           tspsa0
C Reservedvthmisc                resex0
C Tcuplen                        tcupl0
C Lastchar                       lastc0
C Utemptop                       utemp0
C Bplabel                        bplab0
C gettermtype                    gette0
C Tspw                           tspwa0
C Tcclearscreen                  tccle0
C Tccoordtype                    tccop0
C Tcvertlen                      tcves0
C Fdbcount                       fdbco0
C Comunit                        comun0
C Tccleartoeos                   tcclg0
C Tccursorup                     tccuu0
C Tcclrlen                       tcclr0
C Errcod                         errco0
C Lword                          lword0
C Pbptr                          pbptr0
