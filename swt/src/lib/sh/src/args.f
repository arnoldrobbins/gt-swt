      SUBROUTINE CLRAR0
      INTEGER NEXTA0,ARGTA0(2,64)
      COMMON /ARGCOM/NEXTA0,ARGTA0
      NEXTA0=NEXTA0-(1)
      GOTO 10002
10000 NEXTA0=NEXTA0-(1)
10002 IF((NEXTA0.LE.0))GOTO 10001
        CALL LSFREE(ARGTA0(1,NEXTA0),10000)
      GOTO 10000
10001 NEXTA0=1
      RETURN
      END
      INTEGER FUNCTION PUTARG(ARG,NODE)
      INTEGER ARG
      INTEGER NODE
      INTEGER NEXTA0,ARGTA0(2,64)
      COMMON /ARGCOM/NEXTA0,ARGTA0
      IF((NEXTA0.LE.64))GOTO 10003
        CALL ERRMSG(ARG,1,'too many arguments.')
        PUTARG=-3
        GOTO 10004
10003   ARGTA0(1,NEXTA0)=ARG
        ARGTA0(2,NEXTA0)=NODE
        NEXTA0=NEXTA0+(1)
        PUTARG=-2
10004 RETURN
      END
      SUBROUTINE INITA0
      INTEGER NEXTA0,ARGTA0(2,64)
      COMMON /ARGCOM/NEXTA0,ARGTA0
      NEXTA0=1
      RETURN
      END
      INTEGER FUNCTION SETUP0(N)
      INTEGER N
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
      INTEGER NEXTA0,ARGTA0(2,64)
      COMMON /ARGCOM/NEXTA0,ARGTA0
      INTEGER FIRST,LAST
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      SETUP0=-2
      ARGCA0=0
      LAST=NEXTA0-1
      GOTO 10007
10005 LAST=LAST-(1)
10007 IF((LAST.LE.0))GOTO 10006
        GOTO 10008
10010     RETURN
10008   IF((ARGTA0(2,LAST).EQ.N))GOTO 10006
        IF((ARGTA0(2,LAST).LT.N))GOTO 10010
      GOTO 10005
10006 IF((LAST.GT.0))GOTO 10011
        RETURN
10011 FIRST=LAST-1
      GOTO 10014
10012 FIRST=FIRST-(1)
10014 IF((FIRST.LE.0))GOTO 10013
        IF((ARGTA0(2,FIRST).EQ.N))GOTO 10012
          GOTO 10013
10013 FIRST=FIRST+(1)
      GOTO 10018
10016 FIRST=FIRST+(1)
10018 IF((FIRST.GT.LAST))GOTO 10017
        ARGCA0=ARGCA0+(1)
        ARGVA0(ARGCA0)=ARGTA0(1,FIRST)
      GOTO 10016
10017 RETURN
      END
      INTEGER FUNCTION ACCES0(BACKNO,ARGNO)
      INTEGER BACKNO,ARGNO
      INTEGER SAVEN0(10,10),SAVEO0(10,10),SAVEI0(150,10),SAVEP0(150,10)
      INTEGER SAVEQ0(6,10)
      INTEGER SAVEA0(128,10)
      INTEGER SAVER0(10)
      INTEGER SAVEC0(10)
      COMMON /SAVCOM/SAVEN0,SAVEO0,SAVEI0,SAVEP0,SAVEQ0,SAVEA0,SAVER0,SA
     *VEC0
      INTEGER CIFIL0,CIFDA0(10),CIERR0,CITRA0,CICNO0(10)
      INTEGER CIBUF0(10),CIQUO0,CISEA0,CIQUP0,CIERS0,CIPRO0,CIHEL0,CIDEF
     *0
      INTEGER CIREC0
      INTEGER * 4 CIMDA0,CIMSI0,CICHE0
      COMMON /CICOM/CIQUO0,CISEA0,CIQUP0,CIPRO0,CIHEL0,CIERS0,CIDEF0,CIF
     *IL0,CITRA0,CIREC0,CIERR0,CIFDA0,CICNO0,CIBUF0,CIMDA0,CIMSI0,CICHE0
      INTEGER LEVEL0,CN,I,J,ARGTB0(2,64,1)
      EQUIVALENCE (ARGTB0(1,1,1),SAVEA0(1,1))
      ACCES0=-1
      LEVEL0=CIFIL0-BACKNO
      IF((LEVEL0.LT.1))GOTO 10020
      IF((LEVEL0.GT.CIFIL0))GOTO 10020
      GOTO 10019
10020   RETURN
10019 CN=SAVEC0(LEVEL0)
      I=1
      GOTO 10023
10021 I=I+(1)
10023 IF((I.GE.SAVER0(LEVEL0)))GOTO 10022
        IF((ARGTB0(2,I,LEVEL0).LT.CN))GOTO 10021
          GOTO 10022
10022 J=0
      GOTO 10027
10025 I=I+(1)
10027 IF((I.GE.SAVER0(LEVEL0)))GOTO 10026
        IF((ARGTB0(2,I,LEVEL0).EQ.CN))GOTO 10028
          RETURN
10028     IF((J.NE.ARGNO))GOTO 10029
            ACCES0=ARGTB0(1,I,LEVEL0)
            RETURN
10029       J=J+(1)
      GOTO 10025
10026 RETURN
      END
C ---- Long Name Map ----
C forgetcmd                      forge0
C installationcmd                insta0
C Fdflags                        fdfla0
C Cimdate                        cimda0
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
C Tccoordchar                    tccoo0
C Tabs                           tabsa0
C Fdbufstart                     fdbug0
C whencmd                        whenc0
C Rtchar                         rtcha0
C Prtdest                        prtde0
C Tcdelline                      tcdel0
C Colchgstop                     colci0
C Rowchgstart                    rowch0
C Maxcol                         maxco0
C Citrace                        citra0
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
C Reservedopen                   reset0
C Lsna                           lsnaa0
C Tcseqtype                      tcseq0
C Unprintablechar                unpri0
C Fdesc                          fdesc0
C Cierrorflag                    cierr0
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
C Fdbuf                          fdbuf0
C Argv                           argva0
C Lstop                          lstop0
C Tcceollen                      tccep0
C Cihello                        cihel0
C argtable                       argtb0
C cleanupports                   clean0
C getnexttoken                   getng0
C histcmd                        histc0
C initconnect                    initc0
C nextunquotedchar               nextu0
C nextwhiletoken                 nextw0
C Tcshiftchar                    tcshk0
C Inputwait                      inpuv0
C Fdunit                         fduni0
C createlabel                    creat0
C gotocmd                        gotoc0
C Termcp                         termc0
C Kchar                          kchar0
C Fdmem                          fdmem0
C Fddev                          fddev0
C Fdvcstat1                      fdvcs0
C Cibuf                          cibuf0
C clrargs                        clrar0
C enterlabel                     enter0
C exitcmd                        exitd0
C loginfo                        login0
C shtracecmd                     shtra0
C Lastdef                        laste0
C Tcdelaytime                    tcdem0
C Fdvcstat2                      fdvct0
C Killresp                       killr0
C Tccleardelay                   tcclh0
C Padrow                         padro0
C Fntab                          fntab0
C Cidefaultsr                    cidef0
C varscmd                        varsc0
C Reservednewscr                 resew0
C Reservedcurscr                 resex0
C restorestate                   resto0
C vpsdcmd                        vpsdc0
C Utempbuf                       utemq0
C Rtlabel                        rtlab0
C Lsho                           lshoa0
C Tcvertpos                      tcver0
C Tcwraparound                   tcwra0
C Tchomelen                      tchom0
C Savenextiport                  saven0
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
C Saveargtable                   savea0
C Passwd                         passw0
C Newscr                         newsc0
C Curscr                         cursc0
C Duplex                         duple0
C Fdopstat2                      fdopt0
C indexcmd                       index0
C primoscmd                      primo0
C Tccursorhome                   tccur0
C Fdopstat3                      fdopu0
C levelno                        level0
C whilecmd                       while0
C Argtable                       argta0
C Tspath                         tspat0
C clrports                       clrpo0
C initlabels                     initl0
C savestate                      saves0
C Tsat                           tsata0
C Tccursorleft                   tccus0
C Colchgstart                    colch0
C Savenextoport                  saveo0
C Saveipd                        savei0
C Ciprompt                       cipro0
C assignoports                   assih0
C histget                        histh0
C nargscmd                       nargs0
C Reservedshell                  reseu0
C Inbuf                          inbuf0
C Nestingcount                   nesti0
C Savecurnode                    savec0
C makeoport                      makeo0
C Reservedtscan                  resev0
C Defbuf                         defbu0
C Cifile                         cifil0
C Cierrorcontext                 ciers0
C getelement                     getel0
C stopcmd                        stopc0
C Uhashtb                        uhash0
C Fdbuflen                       fdbuh0
C casecmd                        casec0
C stoplogging                    stopl0
C Cmdstat                        cmdst0
C Tchorpos                       tchor0
C Tcinsline                      tcins0
C Msgowner                       msgow0
C invokevar                      invom0
C Fdlastfd                       fdlas0
C Termattr                       terma0
C Saveporttable                  saveq0
C Cifd                           cifda0
C Cicnodes                       cicno0
C Cisearchrule                   cisea0
C datecmd                        datec0
C Tsgt                           tsgta0
C Tcshiftout                     tcshj0
C Inputstop                      inpuu0
C Saveopd                        savep0
C Ciquoteopt                     ciqup0
C accessarg                      acces0
C echocmd                        echoc0
C invokeint                      invol0
C substrcmd                      subst0
C Firstuse                       first0
C Tcshiftin                      tcshi0
C Displaytime                    displ0
C Fdcount                        fdcou0
C declarecmd                     decla0
C nettrace                       nettr0
C Cirecord                       cirec0
C Cimsize                        cimsi0
C getnetlabel                    getnf0
C Termbuf                        termb0
C Lsref                          lsref0
C Tcabslen                       tcabt0
C Rowchgstop                     rowci0
C Maxrow                         maxro0
C Padcol                         padco0
C Lastcharscanned                lastd0
C Cicheck                        ciche0
C Msgrow                         msgro0
C Padlen                         padle0
C Savenextarg                    saver0
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
C Nextarg                        nexta0
C Tccursordown                   tccuv0
C Currow                         curro0
C context                        conte0
C histexp                        histe0
C setupargs                      setup0
C Nlchar                         nlcha0
C Isphantom                      ispha0
C Tsun                           tsuna0
C Tsps                           tspsa0
C Reservedvthmisc                resey0
C Ciquote                        ciquo0
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
