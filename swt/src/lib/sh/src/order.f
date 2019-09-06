      INTEGER FUNCTION ORDER(A,N,V)
      INTEGER N,V(N),A(10,10)
      INTEGER D(10),I,J,T
      INTEGER CKEX
      ORDER=CKEX(A,N)
      IF((ORDER.NE.-3))GOTO 10000
        RETURN
10000 IF((N.NE.1))GOTO 10001
        V(1)=1
        RETURN
10001 DO 10002 I=1,N
        D(I)=0
        V(I)=I
        DO 10004 J=1,N
          D(I)=D(I)+(A(I,J))
10004   CONTINUE
10005   CONTINUE
10002 CONTINUE
10003 I=N
      GOTO 10008
10006 I=I-(1)
10008 IF((I.LE.1))GOTO 10007
        J=1
        GOTO 10011
10009   J=J+(1)
10011   IF((J.GE.I))GOTO 10006
          IF((D(J).GE.D(J+1)))GOTO 10009
            T=D(J)
            D(J)=D(J+1)
            D(J+1)=T
            T=V(J)
            V(J)=V(J+1)
            V(J+1)=T
10012   GOTO 10009
10007 RETURN
      END
      INTEGER FUNCTION CKEX(A,N)
      INTEGER N,A(10,10)
      INTEGER I
      CALL WARSH(A,N)
      DO 10013 I=1,N
        IF((A(I,I).NE.1))GOTO 10015
          CKEX=-3
          RETURN
10015   CONTINUE
10013 CONTINUE
10014 CKEX=-2
      RETURN
      END
      SUBROUTINE WARSH(A,N)
      INTEGER N,A(10,10)
      INTEGER I,J,K
      DO 10016 I=1,N
        DO 10018 J=1,N
          IF((A(J,I).NE.1))GOTO 10020
            DO 10021 K=1,N
              A(J,K)=OR(A(J,K),A(I,K))
10021       CONTINUE
10022     CONTINUE
10020     CONTINUE
10018   CONTINUE
10019   CONTINUE
10016 CONTINUE
10017 RETURN
      END
C ---- Long Name Map ----
C forgetcmd                      forge0
C installationcmd                insta0
C setupports                     setuq0
C singlestep                     singl0
C timecmd                        timec0
C reserveport                    reser0
C searchfor                      searc0
C loginnamecmd                   logio0
C whencmd                        whenc0
C executenode                    execv0
C putbackcommand                 putba0
C results                        resul0
C getneta                        getne0
C initports                      initp0
C lookuplabel                    looku0
C dropcmd                        dropc0
C checklabels                    check0
C dumpcmd                        dumpc0
C dumpports                      dumpp0
C histinit                       histi0
C selectport                     selec0
C argstocmd                      argst0
C histlook                       histl0
C makeportlist                   makep0
C cleanupports                   clean0
C getnexttoken                   getng0
C histcmd                        histc0
C initconnect                    initc0
C nextunquotedchar               nextu0
C nextwhiletoken                 nextw0
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
C assigniports                   assig0
C histarg                        hista0
C execute                        execu0
C findlabel                      findl0
C makeiport                      makei0
C symboltrace                    symbo0
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
C casecmd                        casec0
C stoplogging                    stopl0
C invokevar                      invom0
C datecmd                        datec0
C accessarg                      acces0
C echocmd                        echoc0
C invokeint                      invol0
C substrcmd                      subst0
C declarecmd                     decla0
C nettrace                       nettr0
C getnetlabel                    getnf0
C histfind                       histf0
C histsub                        hists0
C exitcasecmd                    exitc0
C histfree                       histg0
C histque                        histq0
C redirector                     redir0
C invokeext                      invok0
C takecmd                        takec0
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
C assignports                    assii0
C filetype                       filet0
C quotecmd                       quote0
C argscmd                        argsc0
C argument                       argum0
C declaredcmd                    declb0
C startlogging                   start0
