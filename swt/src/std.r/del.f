      INTEGER A$BUF(200)
      INTEGER I,L,JUNK,LEVEL,ENTRY(32),MAXLE0,STATE(4),AT
      INTEGER INFBUF(200),AUX(180),FPROT(180)
      INTEGER GETARG,GETLIN,TSCAN$,FOLLOW,REMOVE,VERIFY
      INTEGER PATH(180),SPATH(180)
      INTEGER EQUAL,GFNARG,GFDATA,FILTST
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER PARSCL
      INTEGER AAAAD0(15)
      INTEGER AAAAE0(52)
      INTEGER AAAAF0(13)
      INTEGER AAAAG0(12)
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0
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
      INTEGER AAAAK0(2)
      INTEGER AAAAL0
      INTEGER AAAAM0(20)
      INTEGER AAAAN0(10)
      INTEGER AAAAO0(7)
      INTEGER AAAAP0(17)
      INTEGER AAAAQ0(10)
      INTEGER AAAAR0
      INTEGER AAAAS0(13)
      INTEGER AAAAU0(200),AAAAV0(180)
      INTEGER AAAAT0
      INTEGER AAAAW0(38)
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      DATA AAAAD0/228,230,246,243,188,239,233,190,238,188,233,231,238,19
     *0,0/
      DATA AAAAE0/213,243,225,231,229,186,160,228,229,236,160,251,160,17
     *3,168,228,252,230,252,243,219,188,236,229,246,229,236,243,190,221,
     *252,246,169,160,253,160,251,160,173,238,160,252,160,188,240,225,24
     *4,232,190,160,253,0/
      DATA AAAAF0/189,245,243,229,242,189,171,189,189,228,236,245,0/
      DATA AAAAG0/175,228,229,246,175,243,244,228,233,238,177,0/
      DATA AAAAK0/225,0/
      DATA AAAAM0/238,239,238,173,229,237,240,244,249,160,228,233,242,22
     *9,227,244,239,242,249,0/
      DATA AAAAN0/240,242,239,244,229,227,244,229,228,0/
      DATA AAAAO0/233,238,160,245,243,229,0/
      DATA AAAAP0/228,229,236,229,244,229,160,240,242,239,244,229,227,24
     *4,229,228,0/
      DATA AAAAQ0/238,239,244,160,230,239,245,238,228,0/
      DATA AAAAS0/227,225,238,167,244,160,228,229,236,229,244,229,0/
      DATA AAAAW0/228,229,236,229,244,229,160,227,245,242,242,229,238,24
     *4,160,228,233,242,229,227,244,239,242,249,160,226,249,160,238,225,
     *237,229,160,239,238,236,249,0/
      IF((PARSCL(AAAAD0,A$BUF).NE.-3))GOTO 10003
        CALL ERROR(AAAAE0)
10003 IF((A$BUF(243-225+1).EQ.2))GOTO 10004
        A$BUF(243-225+27)=:77777
10004 MAXLE0=A$BUF(243-225+27)
      IF((A$BUF(230-225+1).EQ.0))GOTO 10005
        CALL EXPAND(AAAAF0,FPROT,180)
10005 STATE(1)=1
10006 IF((GFNARG(PATH,STATE).EQ.-1))GOTO 10007
        IF((EQUAL(PATH,AAAAG0).NE.1))GOTO 10008
          PATH(1)=0
10008   AAAAA0=1
        GOTO 10000
10009 GOTO 10006
10007 CALL SWT
10002 LEVEL=0
10010   AAAAH0=TSCAN$(PATH,ENTRY,LEVEL,MAXLE0,4+1)
        GOTO 10011
10012     GOTO 10013
10014     CALL AT$HOM(JUNK)
          AAAAB0=1
          GOTO 10001
10015   GOTO 10016
10011   AAAAI0=AAAAH0+3
        GOTO(10014,10012),AAAAI0
10016 CONTINUE
      GOTO 10010
10013 GOTO 10017
10001 IF((A$BUF(246-225+1).EQ.0))GOTO 10019
      IF((VERIFY(PATH).NE.0))GOTO 10019
      GOTO 10018
10019   AAAAJ0=0
        IF((A$BUF(230-225+1).EQ.0))GOTO 10020
          IF((GFDATA(6,PATH,INFBUF,AT,AUX).NE.-2))GOTO 10021
            AAAAJ0=1
            CALL SFDATA(6,AUX(2),FPROT,AT,0)
            GOTO 10022
10021       CALL SPROT$(PATH,AAAAK0)
10022   CONTINUE
10020   IF((REMOVE(PATH).NE.-3))GOTO 10023
          AAAAL0=ERRCO0
          GOTO 10024
10025       CALL ERRMSG(PATH,AAAAM0)
          GOTO 10026
10027       CALL ERRMSG(PATH,AAAAN0)
          GOTO 10026
10028       CALL ERRMSG(PATH,AAAAO0)
          GOTO 10026
10029       CALL ERRMSG(PATH,AAAAP0)
          GOTO 10026
10030       CALL ERRMSG(PATH,AAAAQ0)
          GOTO 10026
10024     AAAAR0=AAAAL0-4
          GOTO(10028,10031,10031,10031,10031,10027,10031,10031,10031,100
     *31,10030,10031,10031,10031,10025),AAAAR0
          IF(AAAAL0.EQ.181)GOTO 10029
10031       CALL ERRMSG(PATH,AAAAS0)
10026   CONTINUE
10023   IF((AAAAJ0.NE.1))GOTO 10032
        IF((FILTST(PATH,0,0,1,0,0,0,0).NE.1))GOTO 10032
          CALL SFDATA(6,AUX(2),INFBUF,JUNK,0)
10032 CONTINUE
10018 GOTO 10033
10000 IF((A$BUF(230-225+1).EQ.0))GOTO 10034
      IF((GFDATA(6,PATH,AAAAU0,AT,AAAAV0).EQ.-3))GOTO 10034
        CALL SFDATA(6,AAAAV0(2),FPROT,AT,0)
10034 IF((PATH(1).NE.0))GOTO 10035
      IF((A$BUF(246-225+1).NE.0))GOTO 10035
        CALL REMARK(AAAAW0)
        GOTO 10036
10035   IF((A$BUF(243-225+1).EQ.0))GOTO 10037
        IF((FOLLOW(PATH,0).EQ.-3))GOTO 10037
          AAAAT0=1
          AAAAC0=1
          GOTO 10002
10038     CALL AT$HOM(JUNK)
          GOTO 10039
10037     AAAAT0=0
10039   IF((PATH(1).EQ.0))GOTO 10040
          IF((AAAAT0.EQ.0))GOTO 10042
          IF((A$BUF(228-225+1).NE.0))GOTO 10042
          GOTO 10041
10042       AAAAB0=2
            GOTO 10001
10043     CONTINUE
10041   CONTINUE
10040   IF((A$BUF(230-225+1).EQ.0))GOTO 10044
        IF((AAAAT0.EQ.0))GOTO 10045
        IF((A$BUF(228-225+1).EQ.0))GOTO 10045
        GOTO 10044
10045     IF((FILTST(PATH,0,0,1,0,0,0,0).NE.1))GOTO 10046
            CALL SFDATA(6,AAAAV0(2),AAAAU0,AT,0)
10046   CONTINUE
10044 CONTINUE
10036 GOTO 10047
10017 GOTO 10038
10033 GOTO(10015,10043),AAAAB0
      GOTO 10033
10047 GOTO 10009
      END
      INTEGER FUNCTION VERIFY(STR)
      INTEGER STR(1)
      INTEGER GETLIN
      INTEGER LINE(102)
      INTEGER AAAAX0(6)
      DATA AAAAX0/170,243,160,191,160,0/
      CALL PRINT(-15,AAAAX0,STR)
      IF((GETLIN(LINE,-14).EQ.-1))GOTO 10048
      IF((LINE(1).EQ.249))GOTO 10049
      IF((LINE(1).EQ.217))GOTO 10049
      GOTO 10048
10049   VERIFY=1
        GOTO 10050
10048   VERIFY=0
10050 RETURN
      END
      SUBROUTINE ERRMSG(PATH,MSG)
      INTEGER PATH(1),MSG(1)
      CALL PRINT(-15,'*s: *s*n.',PATH,MSG)
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
C aclflag                        aclfl0
C Tccursorhome                   tccur0
C Fdopstat3                      fdopu0
C Tspath                         tspat0
C Tsat                           tsata0
C Tccursorleft                   tccus0
C Colchgstart                    colch0
C maxlevels                      maxle0
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
C Fdlastfd                       fdlas0
C Termattr                       terma0
C Tsgt                           tsgta0
C Tcshiftout                     tcshj0
C Inputstop                      inpuu0
C Firstuse                       first0
C Tcshiftin                      tcshi0
C Displaytime                    displ0
C Fdcount                        fdcou0
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
C Tcuplen                        tcupl0
C Lastchar                       lastc0
C Utemptop                       utemp0
C Bplabel                        bplab0
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
