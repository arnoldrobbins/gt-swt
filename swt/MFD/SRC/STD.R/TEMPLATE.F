      INTEGER A$BUF(200)
      LOGICAL LISTU0,LISTS0
      INTEGER USAGE(48)
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0
      INTEGER AAAAE0
      INTEGER PARSCL
      INTEGER AAAAF0(7)
      INTEGER AAAAG0
      INTEGER GETARG
      INTEGER AAAAI0(102),AAAAH0(180)
      INTEGER AAAAJ0(5)
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
      INTEGER HASHT0(37),TEMPT0,CLDAT0(2)
      INTEGER TEMPB0(4059)
      COMMON /SWT$TP/TEMPT0,HASHT0,TEMPB0,CLDAT0
      INTEGER AAAAK0(20)
      INTEGER AAAAL0(22)
      INTEGER AAAAM0,AAAAN0
      INTEGER OPEN,MKTEMP
      INTEGER AAAAO0
      INTEGER GETLIN,GETARG,GTEMP,TARG
      INTEGER AAAAP0(102),AAAAQ0(128),AAAAR0(128)
      INTEGER AAAAS0(12)
      INTEGER AAAAT0,AAAAU0,AAAAV0
      INTEGER GETARG,EQUAL,INDEX
      INTEGER AAAAW0(128),AAAAX0(128)
      INTEGER AAAAY0(26)
      INTEGER AAAAZ0(25)
      INTEGER AAABA0(21)
      INTEGER AAABB0(17)
      INTEGER AAABC0,AAABD0
      INTEGER OPEN,MKTEMP
      INTEGER AAABE0
      INTEGER GETLIN,GTEMP,TARG,GETARG
      INTEGER AAABF0(102),AAABG0(128),AAABH0(128)
      INTEGER AAABI0(12)
      INTEGER AAABJ0(27)
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      DATA USAGE/213,243,225,231,229,186,160,244,229,237,240,236,225,244
     *,229,160,219,173,225,252,173,242,221,160,219,173,236,251,245,243,2
     *46,253,221,160,160,251,160,188,243,244,242,233,238,231,190,160,253
     *,0/
      DATA AAAAF0/225,236,242,243,245,246,0/
      DATA AAAAJ0/170,243,170,238,0/
      DATA AAAAK0/170,238,213,243,229,242,160,212,229,237,240,236,225,24
     *4,229,243,186,170,238,0/
      DATA AAAAL0/170,238,211,249,243,244,229,237,160,212,229,237,240,23
     *6,225,244,229,243,186,170,238,0/
      DATA AAAAS0/189,245,244,229,237,240,236,225,244,229,189,0/
      DATA AAAAY0/170,243,186,160,237,225,249,160,238,239,244,160,227,23
     *9,238,244,225,233,238,160,167,189,167,170,238,0/
      DATA AAAAZ0/170,243,186,160,237,233,243,243,233,238,231,160,228,22
     *9,230,233,238,233,244,233,239,238,170,238,0/
      DATA AAABA0/170,243,186,160,228,245,240,236,233,227,225,244,229,16
     *0,238,225,237,229,170,238,0/
      DATA AAABB0/230,233,236,229,160,238,239,244,160,225,236,244,229,24
     *2,229,228,0/
      DATA AAABI0/189,245,244,229,237,240,236,225,244,229,189,0/
      DATA AAABJ0/170,243,186,160,238,239,244,160,233,238,160,244,229,23
     *7,240,236,225,244,229,160,230,233,236,229,170,238,0/
      IF((PARSCL(AAAAF0,A$BUF).NE.-3))GOTO 10005
        CALL ERROR(USAGE)
10005 LISTU0=(A$BUF(245-225+1).NE.0)
      LISTS0=(A$BUF(243-225+1).NE.0)
      IF(LISTU0)GOTO 10006
      IF(LISTS0)GOTO 10006
        LISTU0=.TRUE.
10006 IF((A$BUF(225-225+1).EQ.0))GOTO 10007
      IF((A$BUF(242-225+1).EQ.0))GOTO 10007
        CALL ERROR(USAGE)
10007 IF((A$BUF(225-225+1).EQ.0))GOTO 10008
        AAAAA0=1
        GOTO 10000
10009   GOTO 10010
10008   IF((A$BUF(242-225+1).EQ.0))GOTO 10011
          AAAAB0=1
          GOTO 10001
10012     GOTO 10013
10011     IF((A$BUF(236-225+1).NE.0))GOTO 10014
            AAAAD0=1
            GOTO 10003
10015     CONTINUE
10014   CONTINUE
10013 CONTINUE
10010 IF((A$BUF(236-225+1).EQ.0))GOTO 10016
        AAAAE0=1
        GOTO 10004
10017 CONTINUE
10016 CALL SWT
10003 AAAAG0=1
      GOTO 10020
10018 AAAAG0=AAAAG0+(1)
10020 IF((GETARG(AAAAG0,AAAAI0,102).EQ.-1))GOTO 10019
        CALL EXPAND(AAAAI0,AAAAH0,180)
        CALL PRINT(-11,AAAAJ0,AAAAH0)
      GOTO 10018
10019 GOTO 10021
10004 IF((.NOT.LISTU0))GOTO 10022
        IF((A$BUF(246-225+1).EQ.0))GOTO 10023
          CALL PRINT(-11,AAAAK0)
10023   CALL PRINT0(UHASH0,UTEMQ0)
10022 IF((.NOT.LISTS0))GOTO 10024
        IF((A$BUF(246-225+1).EQ.0))GOTO 10025
          CALL PRINT(-11,AAAAL0)
10025   CALL PRINT0(HASHT0,TEMPB0)
10024 GOTO 10026
10000 AAAAC0=1
      GOTO 10002
10027 AAAAM0=OPEN(AAAAS0,3)
      IF((AAAAM0.NE.-3))GOTO 10028
        CALL ERROR('can''t open user template file.')
10028 AAAAN0=MKTEMP(3)
      IF((AAAAN0.NE.-3))GOTO 10029
        CALL ERROR('can''t create temporary file.')
10029 CONTINUE
10030 IF((GETLIN(AAAAP0,AAAAM0).EQ.-1))GOTO 10031
        IF((GTEMP(AAAAP0,AAAAQ0,AAAAR0).EQ.-1))GOTO 10033
        IF((TARG(AAAAO0,AAAAQ0,2).EQ.-1))GOTO 10033
        GOTO 10032
10033     CALL PUTLIN(AAAAP0,AAAAN0)
          GOTO 10034
10032     CALL GETARG(AAAAO0+1,AAAAR0,128)
          CALL PTEMP(AAAAQ0,AAAAR0,AAAAN0)
          CALL DELARG(AAAAO0)
          CALL DELARG(AAAAO0)
10034 GOTO 10030
10031 CALL REWIND(AAAAM0)
      CALL REWIND(AAAAN0)
      CALL FCOPY(AAAAN0,AAAAM0)
      CALL RMTEMP(AAAAN0)
      AAAAO0=1
      GOTO 10037
10035 AAAAO0=AAAAO0+(2)
10037 IF((GETARG(AAAAO0,AAAAQ0,128).EQ.-1))GOTO 10036
        CALL GETARG(AAAAO0+1,AAAAR0,128)
        CALL PTEMP(AAAAQ0,AAAAR0,AAAAM0)
      GOTO 10035
10036 CALL TRUNC(AAAAM0)
      CALL CLOSE(AAAAM0)
      CALL LDTMP$
      GOTO 10038
10002 AAAAV0=0
      AAAAT0=1
      GOTO 10041
10039 AAAAT0=AAAAT0+(2)
10041 IF((GETARG(AAAAT0,AAAAW0,128).EQ.-1))GOTO 10040
        IF((INDEX(AAAAW0,189).EQ.0))GOTO 10042
          CALL PRINT(-15,AAAAY0,AAAAW0)
          AAAAV0=AAAAV0+(1)
10042   IF((GETARG(AAAAT0+1,AAAAX0,1).NE.-1))GOTO 10043
          CALL PRINT(-15,AAAAZ0,AAAAW0)
          AAAAV0=AAAAV0+(1)
10043   AAAAU0=AAAAT0+2
        GOTO 10046
10044   AAAAU0=AAAAU0+(2)
10046   IF((GETARG(AAAAU0,AAAAX0,128).EQ.-1))GOTO 10045
          IF((EQUAL(AAAAW0,AAAAX0).EQ.0))GOTO 10047
            CALL PRINT(-15,AAABA0,AAAAW0)
            AAAAV0=AAAAV0+(1)
10047   GOTO 10044
10045 GOTO 10039
10040 IF((AAAAV0.EQ.0))GOTO 10048
        CALL ERROR(AAABB0)
10048 GOTO 10049
10001 AAABC0=OPEN(AAABI0,3)
      IF((AAABC0.NE.-3))GOTO 10050
        CALL ERROR('can''t open user template file.')
10050 AAABD0=MKTEMP(3)
      IF((AAABD0.NE.-3))GOTO 10051
        CALL ERROR('can''t open temporary file.')
10051 CONTINUE
10052 IF((GETLIN(AAABF0,AAABC0).EQ.-1))GOTO 10053
        IF((GTEMP(AAABF0,AAABG0,AAABH0).NE.-1))GOTO 10054
          CALL PUTLIN(AAABF0,AAABD0)
          GOTO 10055
10054     IF((TARG(AAABE0,AAABG0,1).NE.-1))GOTO 10056
            CALL PUTLIN(AAABF0,AAABD0)
            GOTO 10057
10056       CALL DELARG(AAABE0)
10057   CONTINUE
10055 GOTO 10052
10053 CALL REWIND(AAABD0)
      CALL REWIND(AAABC0)
      CALL TRUNC(AAABC0)
      CALL FCOPY(AAABD0,AAABC0)
      CALL RMTEMP(AAABD0)
      CALL CLOSE(AAABC0)
      CALL LDTMP$
      AAABE0=1
      GOTO 10060
10058 AAABE0=AAABE0+(1)
10060 IF((GETARG(AAABE0,AAABF0,128).EQ.-1))GOTO 10059
        CALL PRINT(-15,AAABJ0,AAABF0)
      GOTO 10058
10059 GOTO 10061
10021 GOTO 10015
10049 GOTO 10027
10038 GOTO 10009
10026 GOTO 10017
10061 GOTO 10012
      END
      SUBROUTINE PRINT0(HASHTB,TEMPC0)
      INTEGER HASHTB(1)
      INTEGER TEMPC0(1)
      INTEGER H
      INTEGER P
      DO 10062 H=1,37
        P=HASHTB(H)
        GOTO 10066
10064   P=TEMPC0(P)
10066   IF((P.EQ.0))GOTO 10065
          IF((TEMPC0(P+1).LE.0))GOTO 10067
            CALL PTEMP(TEMPC0(P+2),TEMPC0(TEMPC0(P+1)),-11)
10067   GOTO 10064
10065   CONTINUE
10062 CONTINUE
10063 RETURN
      END
      SUBROUTINE PTEMP(JIG,REP,FD)
      INTEGER JIG(1),REP(1)
      INTEGER FD
      INTEGER L
      INTEGER LENGTH
      INTEGER AAABK0(13)
      DATA AAABK0/160,160,160,170,243,170,163,244,170,243,170,238,0/
      L=MAX0(LENGTH(JIG)+1,15)
      L=L-MOD(L,3)+4
      CALL PRINT(FD,AAABK0,JIG,L,REP)
      RETURN
      END
      INTEGER FUNCTION TARG(ARG,JIG,CMD)
      INTEGER ARG,CMD
      INTEGER JIG(1)
      INTEGER BUMP
      INTEGER GETARG,EQUAL
      INTEGER STR(128)
      IF((CMD.NE.2))GOTO 10068
        BUMP=2
        GOTO 10069
10068   BUMP=1
10069 ARG=1
      GOTO 10072
10070 ARG=ARG+(BUMP)
10072 IF((GETARG(ARG,STR,128).EQ.-1))GOTO 10071
        IF((EQUAL(JIG,STR).EQ.0))GOTO 10073
          TARG=ARG
          RETURN
10073 GOTO 10070
10071 TARG=-1
      RETURN
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
C Temptop                        tempt0
C listusers                      listu0
C Cputype                        cputy0
C Prtform                        prtfo0
C Tsbf                           tsbfa0
C Curcol                         curco0
C Lastfn                         lastf0
C Insertmode                     inser0
C expandtemplates                expan0
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
C printtemplates                 print0
C Reservednewscr                 resev0
C Reservedcurscr                 resew0
C Utempbuf                       utemq0
C Rtlabel                        rtlab0
C Lsho                           lshoa0
C Tcvertpos                      tcver0
C Tcwraparound                   tcwra0
C Tchomelen                      tchom0
C Cldataptr                      cldat0
C checkarguments                 check0
C Tcceoslen                      tcceo0
C Fdbufend                       fdbui0
C Tcspeed                        tcspe0
C Tcleftlen                      tclef0
C Pbbuf                          pbbuf0
C Fdopstat1                      fdops0
C tempbuf                        tempc0
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
C Uhashtb                        uhash0
C Fdbuflen                       fdbuh0
C Cmdstat                        cmdst0
C Tchorpos                       tchor0
C Tcinsline                      tcins0
C Msgowner                       msgow0
C changetemplates                chang0
C Fdlastfd                       fdlas0
C Termattr                       terma0
C Tsgt                           tsgta0
C Tcshiftout                     tcshj0
C Inputstop                      inpuu0
C Firstuse                       first0
C Tcshiftin                      tcshi0
C Displaytime                    displ0
C Fdcount                        fdcou0
C Tempbuf                        tempb0
C listtemplates                  listt0
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
C listsystem                     lists0
C Tcuplen                        tcupl0
C Lastchar                       lastc0
C Utemptop                       utemp0
C Hashtb                         hasht0
C Bplabel                        bplab0
C deletetemplates                delet0
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
