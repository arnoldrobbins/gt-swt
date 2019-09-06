      INTEGER FUNCTION INVOL0(ICMD,SUBCL0)
      INTEGER ICMD(1),SUBCL0(1)
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
      INTEGER CMD(102)
      INTEGER I,STATUS
      INTEGER STATE(258)
      INTEGER STRBSR,INDEX
      REAL * 8 RTN,OLDRTN
      SHORTCALL MKONU$(18)
      EXTERNAL ONANY$
      INTEGER POSIT0(47)
      INTEGER COMMA0(345)
      INTEGER AAAAA0(3)
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0(3)
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      EQUIVALENCE (RTN,RTLAB0)
      DATA COMMA0/2,225,225,242,231,0,3,225,225,242,231,243,0,42,225,225
     *,242,231,243,244,239,0,4,227,227,225,243,229,0,5,228,227,228,0,6,2
     *32,228,225,244,229,0,7,232,228,225,249,0,44,248,228,226,231,0,8,24
     *6,228,229,227,236,225,242,229,0,9,246,228,229,227,236,225,242,229,
     *228,0,10,237,228,242,239,240,0,11,226,228,245,237,240,0,13,232,229
     *,227,232,239,0,14,227,229,236,233,230,0,15,227,229,236,243,229,0,1
     *6,227,229,243,225,227,0,17,232,229,246,225,236,0,18,227,229,248,23
     *3,244,0,19,227,230,233,0,20,243,230,239,242,231,229,244,0,21,227,2
     *31,239,244,239,0,51,232,232,233,243,244,0,22,227,233,230,0,23,237,
     *233,238,228,229,248,0,24,232,233,238,243,244,225,236,236,225,244,2
     *33,239,238,0,25,227,236,225,226,229,236,0,26,232,236,233,238,229,0
     *,27,232,236,239,231,233,238,223,238,225,237,229,0,28,225,238,225,2
     *42,231,243,0,29,227,239,245,244,0,45,248,240,242,233,237,239,243,0
     *,41,225,241,245,239,244,229,0,49,227,242,229,240,229,225,244,0,31,
     *243,243,229,244,0,32,243,243,232,0,33,226,243,232,244,242,225,227,
     *229,0,34,241,243,244,239,240,0,35,237,243,245,226,243,244,242,0,36
     *,237,244,225,235,229,0,37,227,244,232,229,238,0,38,232,244,233,237
     *,229,0,50,227,245,238,244,233,236,0,39,246,246,225,242,243,0,46,24
     *8,246,240,243,228,0,40,227,247,232,229,238,0,43,248,248,0/
      DATA POSIT0/46,1,7,14,23,30,35,42,48,54,64,75,82,89,96,103,110,117
     *,124,131,136,145,152,159,164,172,187,195,202,215,223,229,238,246,2
     *55,261,266,276,283,292,299,306,313,321,328,335,342/
      DATA AAAAA0/4,-15922,-9820/
      DATA AAAAD0/4,-15922,-9820/
      CALL CTOC(ICMD,CMD,102)
      CALL MAPSTR(CMD,1)
      I=STRBSR(POSIT0,COMMA0,2,CMD)
      IF((I.NE.-1))GOTO 10000
        INVOL0=-1
        RETURN
10000 IF((SUBCL0(1).NE.175))GOTO 10001
      IF((INDEX(SUBCL0(2),COMMA0(POSIT0(I)+1)).EQ.0))GOTO 10001
        INVOL0=-1
        RETURN
10001 STATUS=-2
      CALL BREAK$(1)
      IF((CMDST0.EQ.0))GOTO 10002
        CALL BREAK$(0)
        INVOL0=-3
        RETURN
10002 CALL IOFL$(STATE)
      OLDRTN=RTN
      CALL MKLB$F($1,RTLAB0)
      CALL MKONU$(AAAAA0,LOC(ONANY$))
      CALL BREAK$(0)
      AAAAB0=COMMA0(POSIT0(I))
      GOTO 10003
10004   CALL ARGCMD
      GOTO 10005
10006   CALL ARGSC0
      GOTO 10005
10007   CALL ARGST0
      GOTO 10005
10008   CALL CASEC0
      GOTO 10005
10009   CALL CDCMD
      GOTO 10005
10010   CALL DATEC0
      GOTO 10005
10011   CALL DAYCMD
      GOTO 10005
10012   CALL DBGCMD
      GOTO 10005
10013   CALL DECLA0
      GOTO 10005
10014   CALL DECLB0
      GOTO 10005
10015   CALL DROPC0
      GOTO 10005
10016   CALL DUMPC0
      GOTO 10005
10017   CALL ECHOC0
      GOTO 10005
10018   CALL ELSEC0
      GOTO 10005
10019   CALL ELSEC0
      GOTO 10005
10021   CALL EVALC0
      GOTO 10005
10022   CALL EXITD0
      GOTO 10005
10024   CALL FORGE0
      GOTO 10005
10025   CALL GOTOC0
      GOTO 10005
10026   CALL HISTC0
      GOTO 10005
10027   CALL IFCMD
      GOTO 10005
10028   CALL INDEX0
      GOTO 10005
10029   CALL INSTA0
      GOTO 10005
10031   CALL LINEC0
      GOTO 10005
10032   CALL LOGIO0
      GOTO 10005
10033   CALL NARGS0
      GOTO 10005
10034   CALL OUTCMD
      GOTO 10005
10035   CALL PRIMO0
      GOTO 10005
10036   CALL QUOTE0
      GOTO 10005
10037   CALL REPEA0
      GOTO 10005
10038   CALL SETCMD
      GOTO 10005
10039   CALL SHCMD
      GOTO 10005
10040   CALL SHTRA0
      GOTO 10005
10041   CALL STOPC0
      GOTO 10005
10042   CALL SUBST0
      GOTO 10005
10043   CALL TAKEC0
      GOTO 10005
10045   CALL TIMEC0
      GOTO 10005
10047   CALL VARSC0
      GOTO 10005
10048   CALL VPSDC0
      GOTO 10005
10049   CALL WHENC0
      GOTO 10005
10050   CALL XCMD
      GOTO 10005
10003 AAAAC0=AAAAB0-1
      GOTO(10004,10006,10008,10009,10010,10011,10013,10014,10015,10016, 
     *    10051,10017,10018,10019,10005,10021,10022,10005,10024,10025,  
     *   10027,10028,10029,10005,10031,10032,10033,10034,10051,10038,   
     *  10039,10040,10041,10042,10043,10005,10045,10047,10049,10036,    
     * 10007,10050,10012,10035,10048,10051,10051,10037,10005,10026),AAAA
     *C0
10051   CALL REMARK('no subroutine for internal command!!.')
        STATUS=-3
10005 CONTINUE
1     CALL BREAK$(1)
      CALL RVONU$(AAAAD0)
      RTN=OLDRTN
      CALL COF$(STATE)
      CALL BREAK$(0)
      IF((COMMA0(POSIT0(I)).NE.34))GOTO 10052
        CALL SWT
10052 INVOL0=STATUS
      RETURN
      END
C ---- Long Name Map ----
C forgetcmd                      forge0
C installationcmd                insta0
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
C position                       posit0
C Passwd                         passw0
C Newscr                         newsc0
C Curscr                         cursc0
C Duplex                         duple0
C Fdopstat2                      fdopt0
C indexcmd                       index0
C primoscmd                      primo0
C Tccursorhome                   tccur0
C Fdopstat3                      fdopu0
C whilecmd                       while0
C Tspath                         tspat0
C clrports                       clrpo0
C initlabels                     initl0
C savestate                      saves0
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
C Reservedtscan                  resev0
C Defbuf                         defbu0
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
C datecmd                        datec0
C Tsgt                           tsgta0
C Tcshiftout                     tcshj0
C Inputstop                      inpuu0
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
C getnetlabel                    getnf0
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
C subclass                       subcl0
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
C command                        comma0
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
