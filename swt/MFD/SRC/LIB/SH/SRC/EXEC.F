      INTEGER FUNCTION EXECU0(STATUS)
      INTEGER STATUS
      INTEGER CONNE0(10,10)
      COMMON /EXECCM/CONNE0
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER ASSII0,ORDER,EXECV0
      INTEGER EXECW0(10),I,NODES
      CALL INITC0
      IF((ASSII0(STATUS).NE.-3))GOTO 10000
        EXECU0=STATUS
        RETURN
10000 NODES=CURNO0
      IF((ORDER(CONNE0,NODES,EXECW0).EQ.-3))GOTO 10001
        DO 10002 I=1,NODES
          CURNO0=EXECW0(I)
          STATUS=EXECV0(CURNO0)
          IF((STATUS.EQ.-2))GOTO 10004
            GOTO 10005
10004     CONTINUE
10002   CONTINUE
10003   GOTO 10005
10001   CALL SEMERR('net is not serially executable.')
        STATUS=-3
10005 EXECU0=STATUS
      RETURN
      END
      SUBROUTINE INITC0
      INTEGER CONNE0(10,10)
      COMMON /EXECCM/CONNE0
      INTEGER I,J
      DO 10006 I=1,10
        DO 10008 J=1,10
          CONNE0(I,J)=0
10008   CONTINUE
10009   CONTINUE
10006 CONTINUE
10007 RETURN
      END
      INTEGER FUNCTION EXECV0(N)
      INTEGER N
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
      INTEGER I,J,LEN,RP,STATUS
      INTEGER CTOC,GETARG,GETEL0,INVOK0,INVOL0,INVOM0,SETUP0,SETUQ0,SVGE
     *T
      INTEGER CMD(102),CMD2(102),ELEM(102),SR(102)
      LOGICAL TRACE
      INTEGER AAAAA0(9)
      INTEGER AAAAB0(17)
      INTEGER AAAAC0(13)
      INTEGER AAAAD0(29)
      INTEGER AAAAE0(19)
      INTEGER AAAAF0(2)
      INTEGER AAAAG0(5)
      INTEGER AAAAH0(2)
      INTEGER AAAAI0(5)
      INTEGER AAAAJ0(5)
      INTEGER AAAAK0(14)
      INTEGER AAAAL0(5)
      INTEGER AAAAM0(16)
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      DATA AAAAA0/219,170,178,233,174,170,233,221,0/
      DATA AAAAB0/189,244,229,237,240,189,175,227,238,189,240,233,228,18
     *9,170,243,0/
      DATA AAAAC0/223,243,229,225,242,227,232,223,242,245,236,229,0/
      DATA AAAAD0/222,233,238,244,172,222,246,225,242,172,166,172,189,23
     *6,226,233,238,189,175,166,172,189,226,233,238,189,175,166,0/
      DATA AAAAE0/243,229,225,242,227,232,233,238,231,160,170,243,160,17
     *4,174,174,170,238,0/
      DATA AAAAF0/175,0/
      DATA AAAAG0/198,160,170,243,0/
      DATA AAAAH0/175,0/
      DATA AAAAI0/198,160,170,243,0/
      DATA AAAAJ0/198,160,170,243,0/
      DATA AAAAK0/230,239,245,238,228,160,233,238,160,170,243,170,238,0/
      DATA AAAAL0/206,160,170,243,0/
      DATA AAAAM0/170,243,186,160,238,239,244,160,230,239,245,238,228,17
     *0,238,0/
      EXECV0=-3
      IF((CMDST0.EQ.0))GOTO 10010
        RETURN
10010 IF((SETUQ0(N).NE.-2))GOTO 10012
      IF((SETUP0(N).NE.-2))GOTO 10012
      GOTO 10011
10012   CALL CLEAN0(N)
        RETURN
10011 IF((AND(CITRA0,:10).EQ.0))GOTO 10013
        CALL PRINT(1,AAAAA0,CIFIL0,N)
        I=0
        GOTO 10016
10014   I=I+(1)
10016   IF((GETARG(I,CMD,102).EQ.-1))GOTO 10015
          CALL PRINT(1,' ''*s''.',CMD)
        GOTO 10014
10015   CALL PUTCH(138,1)
10013 IF((AND(CITRA0,:4000).EQ.0))GOTO 10017
        CALL DUMPP0(N)
10017 IF((GETARG(0,CMD,102).NE.-1))GOTO 10018
        CALL CLEAN0(N)
        EXECV0=-2
        RETURN
10018 IF((CMD(1).NE.222))GOTO 10019
      IF((CMD(2).NE.227))GOTO 10019
      IF((CMD(3).NE.238))GOTO 10019
        CALL ENCODE(CMD2,102,AAAAB0,CMD(5))
        STATUS=INVOK0(CMD2)
        GOTO 10020
10019   STATUS=-1
        IF((SVGET(AAAAC0,SR,102).EQ.-1))GOTO 10022
        IF((SR(1).EQ.0))GOTO 10022
        GOTO 10021
10022     CALL SCOPY(AAAAD0,1,SR,1)
10021   TRACE=(AND(CITRA0,:40).NE.0)
        RP=1
10023   IF((CMDST0.NE.0))GOTO 10024
        IF((STATUS.NE.-1))GOTO 10024
          LEN=GETEL0(SR,RP,ELEM)
          IF((LEN.NE.-1))GOTO 10025
            GOTO 10024
10025     IF((.NOT.TRACE))GOTO 10027
            CALL PRINT(1,AAAAE0,ELEM)
10026     GOTO 10027
10028       STATUS=INVOL0(CMD,ELEM(5))
            IF((STATUS.EQ.-1))GOTO 10023
            IF((CIREC0.EQ.-3))GOTO 10023
              I=CTOC(ELEM,CMD2,102)
              I=I+(CTOC(AAAAF0,CMD2(I+1),102-I-1))
              I=CTOC(CMD,CMD2(I+1),102-I-1)
              CALL LOGIN0(AAAAG0,CMD2)
10029     GOTO 10023
10031       STATUS=INVOM0(CMD)
            IF((STATUS.EQ.-1))GOTO 10023
            IF((CIREC0.EQ.-3))GOTO 10023
              I=CTOC(ELEM,CMD2,102)
              I=I+(CTOC(AAAAH0,CMD2(I+1),102-I-1))
              I=CTOC(CMD,CMD2(I+1),102-I-1)
              CALL LOGIN0(AAAAI0,CMD2)
10032     GOTO 10023
10033       J=1
            I=1
            GOTO 10036
10034       I=I+(1)
10036       IF((ELEM(I).EQ.0))GOTO 10035
            IF((J.GE.102))GOTO 10035
              IF((ELEM(I).NE.166))GOTO 10037
                J=J+(CTOC(CMD,CMD2(J),102-J+1))
                GOTO 10034
10037           CMD2(J)=ELEM(I)
                J=J+(1)
10038       GOTO 10034
10035       CMD2(J)=0
            STATUS=INVOK0(CMD2)
            IF((STATUS.EQ.-1))GOTO 10023
            IF((CIREC0.EQ.-3))GOTO 10023
              CALL EXPAND(CMD2,CMD,102)
              CALL LOGIN0(AAAAJ0,CMD)
10039     GOTO 10023
10027     IF((ELEM(1).NE.222))GOTO 10040
          IF((ELEM(2).NE.233))GOTO 10040
          IF((ELEM(3).NE.238))GOTO 10040
          IF((ELEM(4).NE.244))GOTO 10040
          GOTO 10028
10040     IF((ELEM(1).NE.222))GOTO 10041
          IF((ELEM(2).NE.246))GOTO 10041
          IF((ELEM(3).NE.225))GOTO 10041
          IF((ELEM(4).NE.242))GOTO 10041
          GOTO 10031
10041     IF((LEN.GE.1))GOTO 10033
          IF((ELEM(LEN-1).NE.175))GOTO 10033
          IF((ELEM(LEN).NE.166))GOTO 10033
          IF((CMD(1).NE.175))GOTO 10033
10030   GOTO 10023
10024   IF((STATUS.EQ.-1))GOTO 10042
        IF((.NOT.TRACE))GOTO 10042
          CALL PRINT(1,AAAAK0,ELEM)
10042 CONTINUE
10020 CALL CLEAN0(N)
      IF((CMDST0.EQ.0))GOTO 10043
        RETURN
10043 IF((STATUS.NE.-1))GOTO 10044
        STATUS=-3
        IF((CIREC0.EQ.-3))GOTO 10045
          CALL LOGIN0(AAAAL0,CMD)
10045   CALL PRINT(1,AAAAM0,CMD)
10044 IF((STATUS.NE.-3))GOTO 10046
        CALL ERRMSG(0,0,0)
10046 EXECV0=STATUS
      RETURN
      END
      INTEGER FUNCTION GETEL0(RULE,PTR,STR)
      INTEGER RULE(1),STR(1)
      INTEGER PTR
      INTEGER I
      I=1
      GOTO 10049
10047 I=I+(1)
10049 IF((RULE(PTR).EQ.172))GOTO 10048
      IF((RULE(PTR).EQ.0))GOTO 10048
        STR(I)=RULE(PTR)
        PTR=PTR+(1)
      GOTO 10047
10048 STR(I)=0
      IF((RULE(PTR).NE.0))GOTO 10050
        IF((I.GT.1))GOTO 10052
          GETEL0=-1
          RETURN
10050   PTR=PTR+(1)
10052 GETEL0=I-1
      RETURN
      END
      INTEGER FUNCTION INVOK0(CMD)
      INTEGER CMD(1)
      INTEGER STATUS,JUNK(3),AT,FILE(16)
      INTEGER FILET0,CALL$$,SHELL
      INTEGER FD
      INTEGER OPEN
      EXTERNAL ONANY$
      INTEGER AAAAN0
      INTEGER AAAAO0
      STATUS=-1
      AAAAN0=FILET0(CMD)
      GOTO 10053
10054   CALL GETTO(CMD,FILE,JUNK,AT)
        STATUS=CALL$$(FILE,32,ONANY$)
        IF((AT.EQ.0))GOTO 10056
          CALL FOLLOW(0,0)
10055 GOTO 10056
10057   FD=OPEN(CMD,1)
        IF((FD.NE.-3))GOTO 10058
          STATUS=-1
          GOTO 10056
10058     STATUS=SHELL(FD)
          CALL CLOSE(FD)
10059 GOTO 10056
10053 AAAAO0=AAAAN0-1
      GOTO(10057,10054),AAAAO0
10056 INVOK0=STATUS
      RETURN
      END
      INTEGER FUNCTION INVOM0(CMD)
      INTEGER CMD(1)
      INTEGER SVGET
      INTEGER VAL(102)
      IF((SVGET(CMD,VAL,102).NE.-1))GOTO 10060
        INVOM0=-1
        RETURN
10060 CALL PUTLIN(VAL,-11)
      CALL PUTCH(138,-11)
      INVOM0=-2
      RETURN
      END
      INTEGER FUNCTION FILET0(FILE)
      INTEGER FILE(1)
      INTEGER FD,I,LEN,TYP
      INTEGER OPEN,GETLIN
      INTEGER LINE(20)
      FD=OPEN(FILE,1,TYP)
      IF((FD.EQ.-3))GOTO 10062
      IF((TYP.EQ.4))GOTO 10062
      GOTO 10061
10062   IF((TYP.NE.4))GOTO 10063
        IF((FD.EQ.-3))GOTO 10063
          CALL CLOSE(FD)
10063   FILET0=1
        RETURN
10061 IF((TYP.LT.2))GOTO 10064
        FILET0=3
        GOTO 10065
10064   LEN=GETLIN(LINE,FD,20)
        FILET0=2
        I=1
        GOTO 10068
10066   I=I+(1)
10068   IF((I.GE.LEN))GOTO 10067
          IF((LINE(I).LT.128))GOTO 10070
          IF((LINE(I).GT.255))GOTO 10070
          GOTO 10066
10070       FILET0=3
            GOTO 10067
10067 CONTINUE
10065 CALL CLOSE(FD)
      RETURN
      END
C ---- Long Name Map ----
C forgetcmd                      forge0
C installationcmd                insta0
C Cimdate                        cimda0
C Fdflags                        fdfla0
C setupports                     setuq0
C singlestep                     singl0
C timecmd                        timec0
C executionorder                 execw0
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
C Tcclrlen                       tcclr0
C argscmd                        argsc0
C argument                       argum0
C declaredcmd                    declb0
C startlogging                   start0
C Errcod                         errco0
C Lword                          lword0
C Pbptr                          pbptr0
