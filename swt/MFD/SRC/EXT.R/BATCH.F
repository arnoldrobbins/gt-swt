      INTEGER GETARG
      INTEGER ARG(102)
      INTEGER AAAAA0
      INTEGER AAAAB0
      IF((GETARG(1,ARG,102).NE.-1))GOTO 10000
        CALL START0
        GOTO 10001
10000   IF((ARG(1).EQ.173))GOTO 10002
          CALL START0
          GOTO 10003
10002     AAAAA0=ARG(2)
          GOTO 10004
10005       CALL JOBST0(ARG)
          GOTO 10006
10007       CALL CANCE0(ARG)
          GOTO 10006
10008       CALL MODIF0
          GOTO 10006
10004     AAAAB0=AAAAA0-192
          GOTO(10007,10009,10007,10005,10009,10009,10009,10009,10009,100
     *09,10009,10009,10008,10009,10009,10009,10009,10007,10005,10009,100
     *09,10009,10009,10009,10009,10009,10009,10009,10009,10009,10009,100
     *09,10007,10009,10007,10005,10009,10009,10009,10009,10009,10009,100
     *09,10009,10008,10009,10009,10009,10009,10007,10005),AAAAB0
10009       CALL START0
10006   CONTINUE
10003 CONTINUE
10001 CALL SWT
      END
      SUBROUTINE START0
      INTEGER COMMA0(102),HOMED0(102),ACCOU0(102),QUEUE(102)
      INTEGER CPTIME,ETIME,PRIOR0,RESTA0,FUNIT,SPOOL0
      INTEGER BFD,IFD,STATUS,I
      INTEGER GETARG,OPEN,CREATE,GETLIN,GETSEQ
      INTEGER EXPAND,EQUAL,INDEX,LENGTH
      INTEGER ARG(102),BUF(102),TEMPF0(102)
      INTEGER AAAAC0
      INTEGER AAAAD0
      INTEGER AAAAE0(26)
      INTEGER AAAAF0(12)
      INTEGER AAAAG0(10)
      INTEGER AAAAH0(5)
      INTEGER AAAAI0(10)
      INTEGER AAAAJ0(15)
      INTEGER AAAAK0(11)
      INTEGER AAAAL0(28)
      INTEGER AAAAM0(10)
      INTEGER AAAAN0(7)
      INTEGER AAAAO0(5)
      INTEGER AAAAP0(7)
      INTEGER AAAAQ0(9)
      INTEGER AAAAR0(12)
      INTEGER AAAAS0(12)
      INTEGER AAAAT0(10)
      INTEGER AAAAU0(11)
      INTEGER AAAAV0(12)
      INTEGER AAAAW0(14)
      INTEGER AAAAX0(11)
      INTEGER AAAAY0(13)
      INTEGER AAAAZ0(14)
      INTEGER AAABA0(14)
      INTEGER AAABB0(11)
      INTEGER AAABC0(3)
      INTEGER AAABD0(9)
      INTEGER AAABE0(4)
      INTEGER AAABF0(14)
      INTEGER AAABG0(37)
      DATA AAAAE0/189,246,225,242,243,228,233,242,189,175,189,245,243,22
     *9,242,189,174,189,240,233,228,189,174,170,233,0/
      DATA AAAAF0/164,164,160,202,207,194,160,170,243,170,238,0/
      DATA AAAAG0/243,247,244,160,173,170,233,170,238,0/
      DATA AAAAH0/170,243,170,238,0/
      DATA AAAAI0/227,239,240,249,239,245,244,170,238,0/
      DATA AAAAJ0/189,233,238,243,244,225,236,236,225,244,233,239,238,18
     *9,0/
      DATA AAAAK0/170,238,170,238,163,160,170,243,170,238,0/
      DATA AAAAL0/163,160,194,225,244,227,232,160,234,239,226,160,243,22
     *7,232,229,228,245,236,229,228,160,239,238,160,170,243,0/
      DATA AAAAM0/160,225,244,160,170,243,174,170,238,0/
      DATA AAAAN0/170,238,170,238,170,238,0/
      DATA AAAAO0/170,243,170,238,0/
      DATA AAAAP0/243,244,239,240,170,238,0/
      DATA AAAAQ0/202,207,194,160,167,170,243,167,0/
      DATA AAAAR0/160,173,193,195,195,212,160,167,170,243,167,0/
      DATA AAAAS0/160,173,200,207,205,197,160,167,170,243,167,0/
      DATA AAAAT0/160,173,200,207,205,197,160,170,243,0/
      DATA AAAAU0/160,173,209,213,197,213,197,160,170,243,0/
      DATA AAAAV0/160,173,195,208,212,201,205,197,160,170,233,0/
      DATA AAAAW0/160,173,195,208,212,201,205,197,160,206,207,206,197,0/
      DATA AAAAX0/160,173,197,212,201,205,197,160,170,233,0/
      DATA AAAAY0/160,173,197,212,201,205,197,160,206,207,206,197,0/
      DATA AAAAZ0/160,173,208,210,201,207,210,201,212,217,160,170,233,0/
      DATA AAABA0/160,173,210,197,211,212,193,210,212,160,217,197,211,0/
      DATA AAABB0/160,173,198,213,206,201,212,160,170,233,0/
      DATA AAABC0/170,238,0/
      DATA AAABD0/189,199,225,212,229,227,232,189,0/
      DATA AAABE0/249,229,243,0/
      DATA AAABF0/196,197,204,197,212,197,160,167,170,243,167,170,238,0/
      DATA AAABG0/195,207,205,207,160,173,206,212,212,217,170,238,196,19
     *7,204,197,212,197,160,167,170,243,167,170,238,195,207,205,207,160,
     *173,212,212,217,170,238,0/
      STATUS=-2
      COMMA0(1)=0
      ACCOU0(1)=0
      QUEUE(1)=0
      HOMED0(1)=0
      CPTIME=0
      ETIME=0
      PRIOR0=0
      RESTA0=0
      FUNIT=0
      SPOOL0=1
      I=1
      GOTO 10012
10010 I=I+(1)
10012 IF(((GETARG(I,ARG,102).EQ.-1).OR.(STATUS.NE.-2)))GOTO 10011
        IF((ARG(1).EQ.173))GOTO 10013
          IF((LENGTH(COMMA0).EQ.0))GOTO 10014
            STATUS=-3
10014     CALL SCOPY(ARG,1,COMMA0,1)
          GOTO 10015
10013     IF((ARG(3).EQ.0))GOTO 10016
            STATUS=-3
            GOTO 10017
10016       AAAAC0=ARG(2)
            GOTO 10018
10019         IF((LENGTH(COMMA0).EQ.0))GOTO 10020
                STATUS=-3
10020         I=I+1
              IF((GETARG(I,COMMA0,102).NE.-1))GOTO 10021
                STATUS=-3
10021       GOTO 10022
10023         SPOOL0=0
            GOTO 10022
10024         RESTA0=1
            GOTO 10022
10025         CALL GRABS0(I,HOMED0,STATUS)
            GOTO 10022
10026         CALL GRABS0(I,ACCOU0,STATUS)
            GOTO 10022
10027         CALL GRABN0(I,CPTIME,STATUS)
            GOTO 10022
10028         CALL GRABN0(I,ETIME,STATUS)
            GOTO 10022
10029         CALL GRABN0(I,PRIOR0,STATUS)
            GOTO 10022
10030         CALL GRABS0(I,QUEUE,STATUS)
            GOTO 10022
10031         CALL GRABN0(I,FUNIT,STATUS)
            GOTO 10022
10018       AAAAD0=AAAAC0-192
            GOTO(10026,10032,10032,10032,10028,10031,10032,10025,10032,1
     *0032,10019,10032,10032,10023,10032,10029,10030,10024,10032,10027,1
     *0032,10032,10032,10032,10032,10032,10032,10032,10032,10032,10032,1
     *0032,10026,10032,10032,10032,10028,10031,10032,10025,10032,10032,1
     *0019,10032,10032,10023,10032,10029,10030,10024,10032,10027),AAAAD0
10032         STATUS=-3
10022     CONTINUE
10017   CONTINUE
10015 GOTO 10010
10011 IF((STATUS.EQ.-2))GOTO 10033
        CALL USAGE0
10033 CALL ENCODE(TEMPF0,102,AAAAE0,GETSEQ(BUF))
      BFD=CREATE(TEMPF0,3)
      IF((BFD.NE.-3))GOTO 10034
        CALL ERROR('can''t create batch file.')
10034 IF((FUNIT.NE.0))GOTO 10035
        FUNIT=6
10035 CALL DATE(3,BUF)
      CALL PRINT(BFD,AAAAF0,BUF)
      CALL EXPAND(TEMPF0,BUF,102)
      CALL MKTR$(BUF,TEMPF0)
      CALL PRINT(BFD,AAAAG0,FUNIT)
      CALL GETPA0(BUF)
      CALL PRINT(BFD,AAAAH0,BUF)
      IF((SPOOL0.NE.1))GOTO 10036
        CALL PRINT(BFD,AAAAI0)
10036 IFD=OPEN(AAAAJ0,1)
      IF((IFD.NE.-3))GOTO 10037
        BUF(1)=0
        GOTO 10038
10037   I=GETLIN(BUF,IFD)
        IF((I.NE.-1))GOTO 10039
          BUF(1)=0
          GOTO 10040
10039     BUF(I)=0
10040   CALL CLOSE(IFD)
10038 CALL PRINT(BFD,AAAAK0,BUF)
      CALL DATE(7,BUF)
      CALL PRINT(BFD,AAAAL0,BUF)
      CALL DATE(2,BUF)
      CALL PRINT(BFD,AAAAM0,BUF)
      CALL PRINT(BFD,AAAAN0)
      IF((LENGTH(COMMA0).NE.0))GOTO 10041
        CALL FCOPY(-10,BFD)
        GOTO 10042
10041   CALL PRINT(BFD,AAAAO0,COMMA0)
10042 CALL PRINT(BFD,AAAAP0)
      CALL CLOSE(BFD)
      CALL PRINT(-11,AAAAQ0,TEMPF0)
      IF((LENGTH(ACCOU0).EQ.0))GOTO 10043
        CALL PRINT(-11,AAAAR0,ACCOU0)
10043 IF((LENGTH(HOMED0).EQ.0))GOTO 10044
        CALL MKTR$(HOMED0,BUF)
        IF((INDEX(BUF,160).EQ.0))GOTO 10045
          CALL PRINT(-11,AAAAS0,BUF)
          GOTO 10046
10045     CALL PRINT(-11,AAAAT0,BUF)
10046 CONTINUE
10044 IF((LENGTH(QUEUE).EQ.0))GOTO 10047
        CALL PRINT(-11,AAAAU0,QUEUE)
10047 IF((CPTIME.LE.0))GOTO 10048
        CALL PRINT(-11,AAAAV0,CPTIME)
        GOTO 10049
10048   IF((CPTIME.GE.0))GOTO 10050
          CALL PRINT(-11,AAAAW0)
10050 CONTINUE
10049 IF((ETIME.LE.0))GOTO 10051
        CALL PRINT(-11,AAAAX0,ETIME)
        GOTO 10052
10051   IF((ETIME.GE.0))GOTO 10053
          CALL PRINT(-11,AAAAY0)
10053 CONTINUE
10052 IF((PRIOR0.LE.0))GOTO 10054
        CALL PRINT(-11,AAAAZ0,PRIOR0)
10054 IF((RESTA0.NE.1))GOTO 10055
        CALL PRINT(-11,AAABA0)
10055 IF((FUNIT.EQ.6))GOTO 10056
      IF((FUNIT.LE.0))GOTO 10056
        CALL PRINT(-11,AAABB0,FUNIT)
10056 CALL PRINT(-11,AAABC0)
      IF((EXPAND(AAABD0,BUF,102).EQ.-3))GOTO 10057
      IF((EQUAL(BUF,AAABE0).NE.1))GOTO 10057
        CALL PRINT(-11,AAABF0,TEMPF0)
        GOTO 10058
10057   CALL PRINT(-11,AAABG0,TEMPF0)
10058 RETURN
      END
      SUBROUTINE GETPA0(STR)
      INTEGER STR(1)
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
     *0(10),TCDEL0(10),TCINT0(10),TCDEM0(10),TCINU0(10),TCSHI0(10),TCSHJ
     *0(10),TCCOO0,TCSHK0,TCCOP0,TCSEQ0,TCDEN0,TCWRA0,TCCLR0,TCCEO0,TCCE
     *P0,TCABT0,TCVES0,TCHOS0,UNPRI0,COLCH0(51),COLCI0(51),ROWCH0,ROWCI0
     *,LASTC0(51),MAXRO0,MAXCO0,CURRO0,CURCO0,MSGRO0,MSGOW0(85),PADRO0,P
     *ADCO0,PADLE0,DISPL0,FNTAB0(128,20),LASTF0,TABSA0(85),INPUT0(51),IN
     *PUU0(51),INBUF0(85),LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PBBUF0(400)
     *,PBPTR0,FNUSE0(20),DEFBU0(1000),LASTE0,NESTI0,RESEX0(417)
      INTEGER TERMB0,TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFCH0,ESCCH0,RT
     *CHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0,FDMEM0,RESER0,FDBUF0,PASSW0,BPLAB
     *0,UTEMP0,UHASH0,UTEMQ0,RESES0,CMDST0,COMUN0,RTLAB0,FIRST0,ARGCA0,A
     *RGVA0,TERMA0,TERMT0,LSHOA0,LSTOP0,LSNAA0,LSREF0,RESET0,FDLAS0,KILL
     *R0,PRTDE0,PRTFO0,LWORD0,TSSTA0,TSGTA0,TSATA0,TSEOS0,TSUNA0,TSPSA0,
     *TSBFA0,TSPWA0,TSPAT0,RESEU0,NEWSC0,RESEV0,CURSC0,RESEW0,TCCLE0,TCC
     *LF0,TCCLG0,TCCUR0,TCCUS0,TCCUT0,TCCUU0,TCCUV0,TCABS0,TCVER0,TCHOR0
     *,TCINS0,TCDEL0,TCINT0,TCDEM0,TCINU0,TCSHI0,TCSHJ0,TCCOO0,TCSHK0,TC
     *COP0,TCSEQ0,TCDEN0,TCWRA0,TCCLR0,TCCEO0,TCCEP0,TCABT0,TCVES0,TCHOS
     *0,UNPRI0,COLCH0,COLCI0,ROWCH0,ROWCI0,LASTC0,MAXRO0,MAXCO0,CURRO0,C
     *URCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0,LASTF0,TABS
     *A0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PBBUF0,
     *PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,RESEX0
      INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
     *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
     *PT0(1),FDOPU0(1)
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      CALL SCOPY(PASSW0,1,STR,1)
      RETURN
      END
      INTEGER FUNCTION GETSEQ(STR)
      INTEGER STR(102)
      INTEGER I,FD,T
      INTEGER GETLIN,CREATE,OPEN,CTOI
      INTEGER BUF(102)
      INTEGER BATCH0(21)
      INTEGER AAABH0(5)
      DATA BATCH0/189,246,225,242,243,228,233,242,189,175,174,226,225,24
     *4,227,232,223,243,229,241,0/
      DATA AAABH0/170,233,170,238,0/
      I=1
      GOTO 10061
10059 I=I+(1)
10061 IF((I.GT.5))GOTO 10060
        FD=OPEN(BATCH0,3)
        IF((FD.EQ.-3))GOTO 10062
          GOTO 10060
10062   CALL SLEEP$(INTL(500))
      GOTO 10059
10060 IF((I.LE.5))GOTO 10063
        FD=CREATE(BATCH0,3)
        IF((FD.NE.-3))GOTO 10064
          CALL CANT(BATCH0)
10064   T=1
        GOTO 10065
10063   IF((GETLIN(BUF,FD).NE.-1))GOTO 10066
          T=1
          GOTO 10067
10066     I=1
          T=CTOI(BUF,I)
10067 CONTINUE
10065 CALL REWIND(FD)
      CALL TRUNC(FD)
      CALL PRINT(FD,AAABH0,T+1)
      CALL CLOSE(FD)
      GETSEQ=T
      RETURN
      END
      SUBROUTINE GRABS0(I,STR,STATUS)
      INTEGER I,STATUS
      INTEGER STR(1)
      INTEGER GETARG,LENGTH
      IF((LENGTH(STR).EQ.0))GOTO 10068
        STATUS=-3
10068 I=I+(1)
      IF((GETARG(I,STR,102).NE.-1))GOTO 10069
        STATUS=-3
10069 IF((STR(1).NE.173))GOTO 10070
        STATUS=-3
10070 RETURN
      END
      SUBROUTINE GRABN0(I,NUM,STATUS)
      INTEGER I,NUM,STATUS
      INTEGER J
      INTEGER GETARG,CTOI
      INTEGER STR(102)
      IF((NUM.EQ.0))GOTO 10071
        STATUS=-3
10071 J=GETARG(I+1,STR,102)
      IF((J.EQ.-1))GOTO 10073
      IF((J.EQ.0))GOTO 10073
      IF((STR(1).EQ.173))GOTO 10073
      GOTO 10072
10073   NUM=-1
        GOTO 10074
10072   J=1
        NUM=CTOI(STR,J)
        IF((STR(J).EQ.0))GOTO 10075
          STATUS=-3
10075   I=I+(1)
10074 RETURN
      END
      SUBROUTINE USAGE0
      INTEGER AAABI0(37)
      INTEGER AAABJ0(32)
      INTEGER AAABK0(38)
      INTEGER AAABL0(42)
      INTEGER AAABM0(40)
      INTEGER AAABN0(55)
      INTEGER AAABO0(50)
      DATA AAABI0/213,243,225,231,229,186,160,226,225,244,227,232,160,17
     *3,168,243,252,228,169,219,225,252,244,221,160,219,188,234,239,226,
     *238,225,237,229,190,221,0/
      DATA AAABJ0/160,160,160,160,160,160,160,226,225,244,227,232,160,17
     *3,168,227,252,225,252,242,169,160,188,234,239,226,238,225,237,229,
     *190,0/
      DATA AAABK0/160,160,160,160,160,160,160,226,225,244,227,232,160,17
     *3,237,160,188,234,239,226,238,225,237,229,190,160,251,188,239,240,
     *244,233,239,238,243,190,253,0/
      DATA AAABL0/160,160,160,160,160,160,160,226,225,244,227,232,160,21
     *9,219,173,235,221,160,188,227,239,237,237,225,238,228,190,221,160,
     *251,188,239,240,244,233,239,238,243,190,253,0/
      DATA AAABM0/160,160,160,160,188,239,240,244,233,239,238,243,190,16
     *0,186,186,189,160,173,225,160,188,225,227,227,244,190,160,252,160,
     *173,242,160,252,160,173,238,160,252,0/
      DATA AAABN0/160,160,160,160,160,160,160,160,173,232,160,188,232,23
     *9,237,229,160,228,233,242,190,160,252,160,173,244,160,188,227,240,
     *245,160,244,233,237,229,190,160,252,160,173,229,160,188,229,236,22
     *5,240,243,229,228,190,160,252,0/
      DATA AAABO0/160,160,160,160,160,160,160,160,173,240,160,188,240,24
     *2,233,239,242,233,244,249,190,160,252,160,173,241,160,188,241,245,
     *229,245,229,190,160,160,160,160,252,160,173,230,160,188,245,238,23
     *3,244,190,0/
      CALL REMARK(AAABI0)
      CALL REMARK(AAABJ0)
      CALL REMARK(AAABK0)
      CALL REMARK(AAABL0)
      CALL REMARK(AAABM0)
      CALL REMARK(AAABN0)
      CALL ERROR(AAABO0)
      END
      SUBROUTINE JOBST0(ARG)
      INTEGER ARG(1)
      INTEGER NAME(102)
      INTEGER MAPDN
      INTEGER AAABP0(15)
      INTEGER AAABQ0(16)
      INTEGER AAABR0(28)
      INTEGER AAABS0(5)
      INTEGER AAABT0(7)
      DATA AAABP0/202,207,194,160,170,243,160,173,211,212,193,212,213,21
     *1,0/
      DATA AAABQ0/202,207,194,160,170,243,160,173,196,201,211,208,204,19
     *3,217,0/
      DATA AAABR0/233,238,160,234,239,226,223,243,244,225,244,245,243,18
     *6,160,227,225,238,167,244,160,232,225,240,240,229,238,0/
      DATA AAABS0/160,193,204,204,0/
      DATA AAABT0/160,212,207,196,193,217,0/
      CALL GETJO0(2,NAME)
      IF((MAPDN(ARG(2)).NE.243))GOTO 10076
        CALL PRINT(-11,AAABP0,NAME)
        GOTO 10077
10076   IF((MAPDN(ARG(2)).NE.228))GOTO 10078
          CALL PRINT(-11,AAABQ0,NAME)
          GOTO 10079
10078     CALL ERROR(AAABR0)
10079 CONTINUE
10077 IF((ARG(3).NE.0))GOTO 10080
        CALL PRINT(-11,AAABS0)
        GOTO 10081
10080   IF((MAPDN(ARG(3)).NE.225))GOTO 10082
          GOTO 10083
10082     IF((MAPDN(ARG(3)).NE.244))GOTO 10084
            CALL PRINT(-11,AAABT0)
            GOTO 10085
10084       CALL USAGE0
10085   CONTINUE
10083 CONTINUE
10081 CALL PUTCH(138,-11)
      RETURN
      END
      SUBROUTINE CANCE0(ARG)
      INTEGER ARG(1)
      INTEGER NAME(102)
      INTEGER LENGTH,MAPDN
      INTEGER AAABU0(8)
      INTEGER AAABV0(9)
      INTEGER AAABW0(10)
      INTEGER AAABX0(11)
      INTEGER AAABY0(28)
      DATA AAABU0/202,207,194,160,170,243,160,0/
      DATA AAABV0/173,193,194,207,210,212,170,238,0/
      DATA AAABW0/173,195,193,206,195,197,204,170,238,0/
      DATA AAABX0/173,210,197,211,212,193,210,212,170,238,0/
      DATA AAABY0/233,238,160,227,225,238,227,229,236,223,234,239,226,18
     *6,160,227,225,238,167,244,160,232,225,240,240,229,238,0/
      CALL GETJO0(2,NAME)
      IF((LENGTH(NAME).GT.0))GOTO 10086
        CALL USAGE0
10086 CALL PRINT(-11,AAABU0,NAME)
      IF((MAPDN(ARG(2)).NE.225))GOTO 10087
        CALL PRINT(-11,AAABV0)
        GOTO 10088
10087   IF((MAPDN(ARG(2)).NE.227))GOTO 10089
          CALL PRINT(-11,AAABW0)
          GOTO 10090
10089     IF((MAPDN(ARG(2)).NE.242))GOTO 10091
            CALL PRINT(-11,AAABX0)
            GOTO 10092
10091       CALL ERROR(AAABY0)
10092   CONTINUE
10090 CONTINUE
10088 RETURN
      END
      SUBROUTINE MODIF0
      CALL ERROR('Sorry, job modification not implemented.')
      RETURN
      END
      SUBROUTINE GETJO0(AP,STR)
      INTEGER AP
      INTEGER STR(102)
      INTEGER I
      INTEGER GETARG
      INTEGER ARG(102)
      IF((GETARG(AP,ARG,102).NE.-1))GOTO 10093
        STR(1)=0
        GOTO 10094
10093   IF((ARG(1).NE.173))GOTO 10095
          CALL USAGE0
          GOTO 10096
10095     I=1
          CALL CTOI(ARG,I)
          IF((ARG(I).NE.0))GOTO 10097
            STR(1)=163
            CALL SCOPY(ARG,1,STR,2)
            GOTO 10098
10097       CALL SCOPY(ARG,1,STR,1)
10098   CONTINUE
10096 CONTINUE
10094 RETURN
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
C startjob                       start0
C accountinfo                    accou0
C Echar                          echar0
C Tseos                          tseos0
C Fnused                         fnuse0
C homedir                        homed0
C Termcount                      termd0
C Reservedio                     reser0
C Tsstate                        tssta0
C Tccursorright                  tccut0
C Tcabspos                       tcabs0
C Tchorlen                       tchos0
C Reservedopen                   reses0
C Lsna                           lsnaa0
C Tcseqtype                      tcseq0
C Unprintablechar                unpri0
C Fdesc                          fdesc0
C modifyjob                      modif0
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
C grabnum                        grabn0
C Tcshiftchar                    tcshk0
C Inputwait                      inpuv0
C Fdunit                         fduni0
C getjobname                     getjo0
C Termcp                         termc0
C Kchar                          kchar0
C Fdmem                          fdmem0
C Fddev                          fddev0
C Fdvcstat1                      fdvcs0
C Tcdelaytime                    tcden0
C Lastdef                        laste0
C Fdvcstat2                      fdvct0
C Killresp                       killr0
C Padrow                         padro0
C Fntab                          fntab0
C Reservednewscr                 resev0
C Reservedcurscr                 resew0
C Utempbuf                       utemq0
C Rtlabel                        rtlab0
C Lsho                           lshoa0
C Tcvertpos                      tcver0
C Tcinschar                      tcint0
C Tcwraparound                   tcwra0
C Tcceoslen                      tcceo0
C Fdbufend                       fdbui0
C canceljob                      cance0
C Pbbuf                          pbbuf0
C Fdopstat1                      fdops0
C Passwd                         passw0
C Newscr                         newsc0
C Curscr                         cursc0
C Duplex                         duple0
C Fdopstat2                      fdopt0
C batchseq                       batch0
C grabstr                        grabs0
C Tccursorhome                   tccur0
C Fdopstat3                      fdopu0
C Tspath                         tspat0
C Tsat                           tsata0
C Tccursorleft                   tccus0
C Colchgstart                    colch0
C Reservedshell                  reset0
C Inbuf                          inbuf0
C Nestingcount                   nesti0
C getpasswd                      getpa0
C Reservedtscan                  reseu0
C Defbuf                         defbu0
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
C Firstuse                       first0
C Tcshiftin                      tcshi0
C Displaytime                    displ0
C Fdcount                        fdcou0
C tempfile                       tempf0
C priority                       prior0
C Termbuf                        termb0
C Lsref                          lsref0
C Tcabslen                       tcabt0
C Rowchgstop                     rowci0
C Maxrow                         maxro0
C Padcol                         padco0
C Lastcharscanned                lastd0
C Msgrow                         msgro0
C Padlen                         padle0
C Stdporttbl                     stdpo0
C spoolout                       spool0
C Argc                           argca0
C Termtype                       termt0
C Tccleartoeol                   tcclf0
C Tcinsstr                       tcinu0
C Tccursordown                   tccuv0
C Currow                         curro0
C restart                        resta0
C usagemsg                       usage0
C Nlchar                         nlcha0
C Isphantom                      ispha0
C Tsun                           tsuna0
C Tsps                           tspsa0
C Reservedvthmisc                resex0
C jobstatus                      jobst0
C Lastchar                       lastc0
C Utemptop                       utemp0
C Tcdelchar                      tcdem0
C Bplabel                        bplab0
C Tspw                           tspwa0
C Tcclearscreen                  tccle0
C Tccoordtype                    tccop0
C Tcvertlen                      tcves0
C Fdbcount                       fdbco0
C command                        comma0
C Comunit                        comun0
C Tccleartoeos                   tcclg0
C Tccursorup                     tccuu0
C Tcclrlen                       tcclr0
C Errcod                         errco0
C Lword                          lword0
C Pbptr                          pbptr0
