      BLOCKDATA
      INTEGER NEXTA0,ARGTA0(2,64)
      COMMON /ARGCOM/NEXTA0,ARGTA0
      INTEGER CIFIL0,CIFDA0(10),CIERR0,CITRA0,CICNO0(10)
      INTEGER CIBUF0(10),CIQUO0,CISEA0,CIQUP0,CIERS0,CIPRO0,CIHEL0,CIDEF
     *0
      INTEGER CIREC0
      INTEGER * 4 CIMDA0,CIMSI0,CICHE0
      COMMON /CICOM/CIQUO0,CISEA0,CIQUP0,CIPRO0,CIHEL0,CIERS0,CIDEF0,CIF
     *IL0,CITRA0,CIREC0,CIERR0,CIFDA0,CICNO0,CIBUF0,CIMDA0,CIMSI0,CICHE0
      INTEGER CONNE0(10,10)
      COMMON /EXECCM/CONNE0
      INTEGER HPTRA0(128)
      INTEGER HBUFA0(4096)
      INTEGER HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HONAA0
      COMMON /HISTCM/HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HPTRA0,HBUFA0,HO
     *NAA0
      INTEGER NEXTL0,LABEL0(3,20)
      COMMON /LABCOM/NEXTL0,LABEL0
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER SAVEN0(10,10),SAVEO0(10,10),SAVEI0(150,10),SAVEP0(150,10)
      INTEGER SAVEQ0(6,10)
      INTEGER SAVEA0(128,10)
      INTEGER SAVER0(10)
      INTEGER SAVEC0(10)
      COMMON /SAVCOM/SAVEN0,SAVEO0,SAVEI0,SAVEP0,SAVEQ0,SAVEA0,SAVER0,SA
     *VEC0
      COMMON /SVCOM/SVLLA0,SVTBL0(32,13),SVMEM0(4096),EOFSA0(32),ESAVE0(
     *32),ESCSA0(32),KSAVE0(32),NLSAV0(32),RTSAV0(32),KRESP0(33,32),PDES
     *T0(17,32),PFORM0(9,32)
      INTEGER SVLLA0,SVTBL0,SVMEM0,EOFSA0,ESAVE0,ESCSA0,KSAVE0,NLSAV0,RT
     *SAV0,KRESP0,PDEST0,PFORM0
      END
C ---- Long Name Map ----
C forgetcmd                      forge0
C installationcmd                insta0
C Cimdate                        cimda0
C setupports                     setuq0
C singlestep                     singl0
C timecmd                        timec0
C Labeltable                     label0
C reserveport                    reser0
C searchfor                      searc0
C Svtbl                          svtbl0
C loginnamecmd                   logio0
C Symiport                       symip0
C whencmd                        whenc0
C Citrace                        citra0
C executenode                    execv0
C putbackcommand                 putba0
C results                        resul0
C getneta                        getne0
C initports                      initp0
C lookuplabel                    looku0
C dropcmd                        dropc0
C Cierrorflag                    cierr0
C Symstr                         symst0
C checklabels                    check0
C dumpcmd                        dumpc0
C dumpports                      dumpp0
C histinit                       histi0
C selectport                     selec0
C argstocmd                      argst0
C histlook                       histl0
C makeportlist                   makep0
C Cihello                        cihel0
C Symoport                       symop0
C Nlsave                         nlsav0
C cleanupports                   clean0
C getnexttoken                   getng0
C histcmd                        histc0
C initconnect                    initc0
C nextunquotedchar               nextu0
C nextwhiletoken                 nextw0
C Cmdptr                         cmdpt0
C createlabel                    creat0
C gotocmd                        gotoc0
C Cibuf                          cibuf0
C Hbf                            hbfaa0
C clrargs                        clrar0
C enterlabel                     enter0
C exitcmd                        exitd0
C loginfo                        login0
C shtracecmd                     shtra0
C Cidefaultsr                    cidef0
C varscmd                        varsc0
C restorestate                   resto0
C vpsdcmd                        vpsdc0
C Nextlabel                      nextl0
C Cmd                            cmdaa0
C Savenextiport                  saven0
C assigniports                   assig0
C histarg                        hista0
C execute                        execu0
C findlabel                      findl0
C makeiport                      makei0
C symboltrace                    symbo0
C Hbl                            hblaa0
C Saveargtable                   savea0
C Hline                          hline0
C Nextiport                      nexti0
C Eofsave                        eofsa0
C indexcmd                       index0
C primoscmd                      primo0
C Connect                        conne0
C Escsave                        escsa0
C whilecmd                       while0
C Argtable                       argta0
C clrports                       clrpo0
C initlabels                     initl0
C savestate                      saves0
C Ciprompt                       cipro0
C Savenextoport                  saveo0
C Saveipd                        savei0
C Rtsave                         rtsav0
C assignoports                   assih0
C histget                        histh0
C nargscmd                       nargs0
C Savecurnode                    savec0
C Esave                          esave0
C makeoport                      makeo0
C Cifile                         cifil0
C Cierrorcontext                 ciers0
C Hptr                           hptra0
C getelement                     getel0
C stopcmd                        stopc0
C Symlen                         symle0
C Nextoport                      nexto0
C Ipd                            ipdaa0
C casecmd                        casec0
C stoplogging                    stopl0
C Hpf                            hpfaa0
C Curnode                        curno0
C Symtype                        symty0
C invokevar                      invom0
C Cifd                           cifda0
C Cicnodes                       cicno0
C Cisearchrule                   cisea0
C Saveporttable                  saveq0
C Svll                           svlla0
C datecmd                        datec0
C Ciquoteopt                     ciqup0
C Saveopd                        savep0
C accessarg                      acces0
C echocmd                        echoc0
C invokeint                      invol0
C substrcmd                      subst0
C Symtext                        symte0
C Ksave                          ksave0
C declarecmd                     decla0
C nettrace                       nettr0
C Cirecord                       cirec0
C Cimsize                        cimsi0
C getnetlabel                    getnf0
C Cicheck                        ciche0
C Opd                            opdaa0
C Hpl                            hplaa0
C Savenextarg                    saver0
C Pdestsave                      pdest0
C histfind                       histf0
C histsub                        hists0
C Hon                            honaa0
C Defaultporttable               defau0
C exitcasecmd                    exitc0
C histfree                       histg0
C histque                        histq0
C redirector                     redir0
C invokeext                      invok0
C takecmd                        takec0
C Nextarg                        nexta0
C Cmdcursor                      cmdcu0
C context                        conte0
C histexp                        histe0
C setupargs                      setup0
C Ciquote                        ciquo0
C Pformsave                      pform0
C clrlabels                      clrla0
C Krespsave                      kresp0
C evalcmd                        evalc0
C evalnetsep                     evaln0
C linecmd                        linec0
C repeatcmd                      repea0
C elsecmd                        elsec0
C removecn                       remov0
C nodesepr                       nodes0
C initargs                       inita0
C initializeeverything           initi0
C processhello                   proce0
C Symnode                        symno0
C assignports                    assii0
C filetype                       filet0
C quotecmd                       quote0
C Hbuf                           hbufa0
C argscmd                        argsc0
C argument                       argum0
C declaredcmd                    declb0
C startlogging                   start0
C Svmem                          svmem0
