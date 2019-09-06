      INTEGER FUNCTION ENTER0(LAB,VALUE)
      INTEGER LAB(1)
      INTEGER VALUE
      INTEGER NEXTL0,LABEL0(3,20)
      COMMON /LABCOM/NEXTL0,LABEL0
      INTEGER L
      INTEGER FINDL0,CREAT0
      L=FINDL0(LAB)
      IF((L.NE.-1))GOTO 10000
        L=CREAT0(LAB)
        IF((L.NE.-3))GOTO 10001
          ENTER0=L
          RETURN
10001   LABEL0(2,L)=VALUE
        GOTO 10002
10000   IF((LABEL0(2,L).EQ.0))GOTO 10003
          CALL SYNERR('multiply defined label.')
          ENTER0=-3
          RETURN
10003     LABEL0(2,L)=VALUE
          CALL FWDREF(L)
10002 ENTER0=-2
      RETURN
      END
      INTEGER FUNCTION LOOKU0(LAB)
      INTEGER LAB(1)
      INTEGER NEXTL0,LABEL0(3,20)
      COMMON /LABCOM/NEXTL0,LABEL0
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER L,OPORT
      INTEGER FINDL0,CREAT0
      OPORT=NEXTO0(CURNO0)-1
      L=FINDL0(LAB)
      IF((L.NE.-1))GOTO 10004
        L=CREAT0(LAB)
        IF((L.NE.-3))GOTO 10005
          LOOKU0=L
          RETURN
10005   LABEL0(2,L)=0
        LABEL0(3,L)=LS(CURNO0,8)+OPORT
        OPDAA0(3,OPORT,CURNO0)=0
        GOTO 10006
10004   IF((LABEL0(2,L).NE.0))GOTO 10007
          OPDAA0(3,OPORT,CURNO0)=LABEL0(3,L)
          LABEL0(3,L)=LS(CURNO0,8)+OPORT
          GOTO 10008
10007     OPDAA0(3,OPORT,CURNO0)=LABEL0(2,L)
10008 CONTINUE
10006 LOOKU0=-2
      RETURN
      END
      INTEGER FUNCTION FINDL0(LAB)
      INTEGER LAB(1)
      INTEGER NEXTL0,LABEL0(3,20)
      COMMON /LABCOM/NEXTL0,LABEL0
      INTEGER I
      INTEGER LSCMPK
      I=1
      GOTO 10011
10009 I=I+(1)
10011 IF((I.GE.NEXTL0))GOTO 10010
        IF((LSCMPK(LABEL0(1,I),LAB).NE.189))GOTO 10009
          FINDL0=I
          RETURN
10010 FINDL0=-1
      RETURN
      END
      INTEGER FUNCTION CREAT0(LAB)
      INTEGER LAB(1)
      INTEGER NEXTL0,LABEL0(3,20)
      COMMON /LABCOM/NEXTL0,LABEL0
      INTEGER I
      INTEGER L
      INTEGER LSMAKE
      I=NEXTL0
      IF((I.LE.20))GOTO 10013
        CALL SYNERR('too many labels.')
        CREAT0=-3
        RETURN
10013 NEXTL0=NEXTL0+(1)
      IF((LSMAKE(L,LAB).NE.-3))GOTO 10014
        CREAT0=-3
        RETURN
10014 LABEL0(1,I)=L
      CREAT0=I
      RETURN
      END
      SUBROUTINE FWDREF(L)
      INTEGER L
      INTEGER NEXTI0(10),NEXTO0(10),IPDAA0(5,3,10),OPDAA0(5,3,10),DEFAU0
     *(6)
      COMMON /PORTCM/NEXTI0,NEXTO0,IPDAA0,OPDAA0,DEFAU0
      INTEGER NEXTL0,LABEL0(3,20)
      COMMON /LABCOM/NEXTL0,LABEL0
      INTEGER NODE,PORT,VALUE,LINK
      VALUE=LABEL0(2,L)
      LINK=LABEL0(3,L)
10015 IF((LINK.EQ.0))GOTO 10016
        NODE=RS(LINK,8)
        PORT=RT(LINK,8)
        LINK=OPDAA0(3,PORT,NODE)
        OPDAA0(3,PORT,NODE)=VALUE
      GOTO 10015
10016 RETURN
      END
      SUBROUTINE INITL0
      INTEGER NEXTL0,LABEL0(3,20)
      COMMON /LABCOM/NEXTL0,LABEL0
      NEXTL0=1
      RETURN
      END
      SUBROUTINE CLRLA0
      INTEGER NEXTL0,LABEL0(3,20)
      COMMON /LABCOM/NEXTL0,LABEL0
      NEXTL0=NEXTL0-(1)
      GOTO 10019
10017 NEXTL0=NEXTL0-(1)
10019 IF((NEXTL0.LE.0))GOTO 10018
        CALL LSFREE(LABEL0(1,NEXTL0),10000)
      GOTO 10017
10018 NEXTL0=1
      RETURN
      END
      INTEGER FUNCTION CHECK0(STATUS)
      INTEGER STATUS
      INTEGER NEXTL0,LABEL0(3,20)
      COMMON /LABCOM/NEXTL0,LABEL0
      INTEGER I
      INTEGER LAB(102)
      STATUS=-2
      I=1
      GOTO 10022
10020 I=I+(1)
10022 IF((I.GE.NEXTL0))GOTO 10021
        IF((LABEL0(2,I).NE.0))GOTO 10020
          STATUS=-3
          CALL LSEXTR(LABEL0(1,I),LAB,102)
          CALL PRINT(1,'*s: undefined label*n.',LAB)
10023 GOTO 10020
10021 CHECK0=STATUS
      RETURN
      END
C ---- Long Name Map ----
C forgetcmd                      forge0
C installationcmd                insta0
C setupports                     setuq0
C singlestep                     singl0
C timecmd                        timec0
C Labeltable                     label0
C reserveport                    reser0
C searchfor                      searc0
C loginnamecmd                   logio0
C Symiport                       symip0
C whencmd                        whenc0
C executenode                    execv0
C putbackcommand                 putba0
C results                        resul0
C getneta                        getne0
C initports                      initp0
C lookuplabel                    looku0
C dropcmd                        dropc0
C Symstr                         symst0
C checklabels                    check0
C dumpcmd                        dumpc0
C dumpports                      dumpp0
C histinit                       histi0
C selectport                     selec0
C argstocmd                      argst0
C histlook                       histl0
C makeportlist                   makep0
C Symoport                       symop0
C cleanupports                   clean0
C getnexttoken                   getng0
C histcmd                        histc0
C initconnect                    initc0
C nextunquotedchar               nextu0
C nextwhiletoken                 nextw0
C Cmdptr                         cmdpt0
C createlabel                    creat0
C gotocmd                        gotoc0
C clrargs                        clrar0
C enterlabel                     enter0
C exitcmd                        exitd0
C loginfo                        login0
C shtracecmd                     shtra0
C varscmd                        varsc0
C restorestate                   resto0
C vpsdcmd                        vpsdc0
C Nextlabel                      nextl0
C Cmd                            cmdaa0
C assigniports                   assig0
C histarg                        hista0
C execute                        execu0
C findlabel                      findl0
C makeiport                      makei0
C symboltrace                    symbo0
C Nextiport                      nexti0
C indexcmd                       index0
C primoscmd                      primo0
C whilecmd                       while0
C clrports                       clrpo0
C initlabels                     initl0
C savestate                      saves0
C assignoports                   assih0
C histget                        histh0
C nargscmd                       nargs0
C makeoport                      makeo0
C getelement                     getel0
C stopcmd                        stopc0
C Nextoport                      nexto0
C Ipd                            ipdaa0
C Symlen                         symle0
C casecmd                        casec0
C stoplogging                    stopl0
C Curnode                        curno0
C Symtype                        symty0
C invokevar                      invom0
C datecmd                        datec0
C accessarg                      acces0
C echocmd                        echoc0
C invokeint                      invol0
C substrcmd                      subst0
C Symtext                        symte0
C declarecmd                     decla0
C nettrace                       nettr0
C getnetlabel                    getnf0
C Opd                            opdaa0
C histfind                       histf0
C histsub                        hists0
C Defaultporttable               defau0
C exitcasecmd                    exitc0
C histfree                       histg0
C histque                        histq0
C redirector                     redir0
C invokeext                      invok0
C takecmd                        takec0
C Cmdcursor                      cmdcu0
C context                        conte0
C histexp                        histe0
C setupargs                      setup0
C clrlabels                      clrla0
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
C argscmd                        argsc0
C argument                       argum0
C declaredcmd                    declb0
C startlogging                   start0
