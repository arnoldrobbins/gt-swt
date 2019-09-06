      INTEGER FUNCTION PARSE(COMMA0,STATUS)
      INTEGER COMMA0
      INTEGER STATUS
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER CIFIL0,CIFDA0(10),CIERR0,CITRA0,CICNO0(10)
      INTEGER CIBUF0(10),CIQUO0,CISEA0,CIQUP0,CIERS0,CIPRO0,CIHEL0,CIDEF
     *0
      INTEGER CIREC0
      INTEGER * 4 CIMDA0,CIMSI0,CICHE0
      COMMON /CICOM/CIQUO0,CISEA0,CIQUP0,CIPRO0,CIHEL0,CIERS0,CIDEF0,CIF
     *IL0,CITRA0,CIREC0,CIERR0,CIFDA0,CICNO0,CIBUF0,CIMDA0,CIMSI0,CICHE0
      INTEGER NET,CHECK0
      INTEGER AAAAA0(3)
      DATA AAAAA0/229,248,0/
      IF((AND(CITRA0,:1).EQ.0))GOTO 10000
        CALL NETTR0(COMMA0,CIFIL0,AAAAA0)
10000 CALL INITP0
      CALL INITA0
      CALL INITL0
      CURNO0=1
      CMDCU0=0
      CMDAA0=COMMA0
      CMDPT0=COMMA0
      CALL GETSYM
      IF((NET(STATUS).EQ.-2))GOTO 10001
        GOTO 10002
10001   IF((SYMTY0.EQ.1))GOTO 10003
          CALL SYNERR('semicolon or newline expected.')
          STATUS=-3
          GOTO 10004
10003     CALL CHECK0(STATUS)
10004 CONTINUE
10002 CALL CLRLA0
      IF((STATUS.NE.-2))GOTO 10005
        CALL EXECU0(STATUS)
10005 CALL CLRPO0
      CALL CLRAR0
      PARSE=STATUS
      RETURN
      END
      INTEGER FUNCTION NET(STATUS)
      INTEGER STATUS
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER NODE,NODES0,ENTER0
      INTEGER AAAAB0(2)
      DATA AAAAB0/164,0/
      GOTO 10008
10006 CURNO0=CURNO0+(1)
10008 IF((CURNO0.GT.10))GOTO 10007
      IF((NODE(STATUS).NE.-2))GOTO 10007
        IF((NODES0(STATUS).NE.-1))GOTO 10009
          GOTO 10007
10009   CONTINUE
10010   IF((NODES0(STATUS).NE.-2))GOTO 10011
        GOTO 10010
10011   IF((STATUS.NE.-3))GOTO 10006
          GOTO 10007
10007 IF((STATUS.NE.-1))GOTO 10013
        STATUS=-2
10013 IF((CURNO0.LE.10))GOTO 10014
        IF((SYMTY0.EQ.1))GOTO 10015
          CALL SYNERR('too many nodes in net.')
          STATUS=-3
          GOTO 10016
10015     CURNO0=CURNO0-(1)
10016 CONTINUE
10014 IF((STATUS.NE.-2))GOTO 10017
        STATUS=ENTER0(AAAAB0,CURNO0)
10017 NET=STATUS
      RETURN
      END
      INTEGER FUNCTION NODES0(STATUS)
      INTEGER STATUS
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER MAKEO0,LOOKU0
      IF((SYMTY0.NE.2))GOTO 10018
        STATUS=-2
        GOTO 10019
10018   IF((SYMTY0.NE.3))GOTO 10020
          IF((SYMNO0.NE.-3))GOTO 10021
            IF((MAKEO0(CURNO0,3,SYMOP0,0,SYMIP0).EQ.-3))GOTO 10023
            IF((LOOKU0(SYMST0).EQ.-3))GOTO 10023
            GOTO 10022
10023         STATUS=-3
              GOTO 10027
10022         STATUS=-2
10024       GOTO 10027
10021       IF((SYMNO0.NE.0))GOTO 10026
              SYMNO0=CURNO0+1
10026       STATUS=MAKEO0(CURNO0,3,SYMOP0,SYMNO0,SYMIP0)
10025     GOTO 10027
10020     IF((SYMTY0.NE.12))GOTO 10028
            STATUS=-3
            GOTO 10029
10028       STATUS=-1
10029   CONTINUE
10027 CONTINUE
10019 IF((STATUS.NE.-2))GOTO 10030
        CALL GETSYM
10030 NODES0=STATUS
      RETURN
      END
      INTEGER FUNCTION NODE(STATUS)
      INTEGER STATUS
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER NUMAR0,NUMFU0
      INTEGER ENTER0,REDIR0,ARGUM0
      INTEGER AAAAC0
      INTEGER AAAAD0
      NUMAR0=0
      NUMFU0=0
      STATUS=-1
10031 IF((SYMTY0.NE.4))GOTO 10032
        STATUS=ENTER0(SYMST0,CURNO0)
        IF((STATUS.NE.-3))GOTO 10033
          NODE=STATUS
          RETURN
10033   CALL GETSYM
      GOTO 10031
10032 CONTINUE
10034   AAAAC0=SYMTY0
        GOTO 10035
10036     NUMAR0=NUMAR0+(1)
          IF((ARGUM0(STATUS).NE.-3))GOTO 10039
            GOTO 10038
10040     NUMFU0=NUMFU0+(1)
          IF((REDIR0(STATUS).NE.-3))GOTO 10039
            GOTO 10038
10042     STATUS=-3
          GOTO 10038
10039     CALL GETSYM
        GOTO 10043
10035   AAAAD0=AAAAC0-3
        GOTO(10036,10036,10040,10040,10040,10040,10038,10038,10042),AAAA
     *D0
10044     GOTO 10038
10043 CONTINUE
      GOTO 10034
10038 IF((STATUS.NE.-2))GOTO 10045
      IF((NUMAR0.NE.0))GOTO 10045
        IF((NUMFU0.EQ.0))GOTO 10046
          STATUS=-3
          CALL SYNERR('missing command name.')
10046 CONTINUE
10045 NODE=STATUS
      RETURN
      END
      INTEGER FUNCTION ARGUM0(STATUS)
      INTEGER STATUS
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER PUTARG
      INTEGER PTR
      INTEGER LSMAKE
      STATUS=PUTARG(LSMAKE(PTR,SYMTE0),CURNO0)
      ARGUM0=STATUS
      RETURN
      END
      INTEGER FUNCTION REDIR0(STATUS)
      INTEGER STATUS
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER PATHN0
      INTEGER MAKEI0,MAKEO0
      IF((SYMTY0.EQ.6))GOTO 10047
        CALL LSMAKE(PATHN0,SYMST0)
10047 IF((SYMTY0.EQ.7))GOTO 10049
      IF((SYMTY0.EQ.6))GOTO 10049
      GOTO 10048
10049   STATUS=MAKEI0(CURNO0,SYMTY0,SYMIP0,PATHN0,0)
        GOTO 10050
10048   STATUS=MAKEO0(CURNO0,SYMTY0,SYMOP0,PATHN0,0)
10050 REDIR0=STATUS
      RETURN
      END
      SUBROUTINE GETSYM
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER CIFIL0,CIFDA0(10),CIERR0,CITRA0,CICNO0(10)
      INTEGER CIBUF0(10),CIQUO0,CISEA0,CIQUP0,CIERS0,CIPRO0,CIHEL0,CIDEF
     *0
      INTEGER CIREC0
      INTEGER * 4 CIMDA0,CIMSI0,CICHE0
      COMMON /CICOM/CIQUO0,CISEA0,CIQUP0,CIPRO0,CIHEL0,CIERS0,CIDEF0,CIF
     *IL0,CITRA0,CIREC0,CIERR0,CIFDA0,CICNO0,CIBUF0,CIMDA0,CIMSI0,CICHE0
      INTEGER I,J,CHRPOS
      INTEGER CKNUM,CKALF,EQUAL
      INTEGER BACKUP
      INTEGER C,QUOTE
      INTEGER LSGETC
      LOGICAL FIRST0
      INTEGER AAAAE0
      INTEGER AAAAF0
      INTEGER AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0(2)
      INTEGER AAAAK0
      DATA AAAAJ0/164,0/
10052   CALL LSGETC(CMDPT0,C)
        CMDCU0=CMDCU0+(1)
      IF((C.EQ.160))GOTO 10052
      IF((C.EQ.137))GOTO 10052
      SYMTY0=0
      SYMLE0=0
      SYMNO0=0
      SYMIP0=0
      SYMOP0=0
      SYMST0(1)=0
      FIRST0=.TRUE.
10053   AAAAF0=C
        GOTO 10054
10057     IF(FIRST0)GOTO 10058
            CMDPT0=BACKUP
            CMDCU0=CMDCU0-(1)
            GOTO 10056
10058       AAAAG0=C
            GOTO 10060
10061         SYMTY0=2
            GOTO 10062
10063         SYMTY0=1
            GOTO 10062
10060       IF(AAAAG0.EQ.0)GOTO 10063
            IF(AAAAG0.EQ.172)GOTO 10061
            IF(AAAAG0.EQ.187)GOTO 10063
10062       SYMLE0=1
            SYMTE0(1)=C
10059     GOTO 10056
10064     IF((SYMTY0.NE.0))GOTO 10065
            SYMTY0=3
            CHRPOS=SYMLE0+1
            GOTO 10068
10065       CALL SYNERR('whitespace needed around pipe connector.')
            AAAAE0=1
            GOTO 10051
10067     CONTINUE
10066   GOTO 10068
10069     IF((SYMTY0.NE.0))GOTO 10070
            SYMTY0=10
            CHRPOS=SYMLE0+1
            GOTO 10068
10070       IF((SYMTY0.NE.10))GOTO 10072
              SYMTY0=11
              GOTO 10073
10072         CALL SYNERR('whitespace needed around redirector.')
              AAAAE0=2
              GOTO 10051
10074       CONTINUE
10073     CONTINUE
10071   GOTO 10068
10075     IF((SYMLE0.LE.0))GOTO 10076
            GOTO 10068
10076       SYMTY0=4
10077   GOTO 10068
10078     QUOTE=C
10079     IF((LSGETC(CMDPT0,C).EQ.QUOTE))GOTO 10080
          IF((C.EQ.0))GOTO 10080
            CMDCU0=CMDCU0+(1)
            IF((SYMLE0.LT.102-1))GOTO 10081
              CALL SYNERR('token too long.')
              AAAAE0=3
              GOTO 10051
10082       CONTINUE
10081       SYMLE0=SYMLE0+(1)
            SYMTE0(SYMLE0)=C
          GOTO 10079
10080     CMDCU0=CMDCU0+(1)
          IF((C.NE.0))GOTO 10083
            CALL SYNERR('missing quote.')
            AAAAE0=4
            GOTO 10051
10084     CONTINUE
10083     BACKUP=CMDPT0
          CALL LSGETC(CMDPT0,C)
          CMDCU0=CMDCU0+(1)
          FIRST0=.FALSE.
          GOTO 10053
10054   IF(AAAAF0.EQ.0)GOTO 10057
        IF(AAAAF0.EQ.137)GOTO 10056
        AAAAH0=AAAAF0-159
        GOTO(10056,10086,10078,10086,10086,10086,10086,10078,10086,10086
     *,10086,10086,10057,10086,10086,10086,10086,10086,10086,10086,10086
     *,10086,10086,10086,10086,10086,10075,10057,10086,10086,10069),AAAA
     *H0
        IF(AAAAF0.EQ.252)GOTO 10064
10086   CONTINUE
10068   IF((SYMLE0.LT.102-1))GOTO 10087
          CALL SYNERR('token too long.')
          AAAAE0=5
          GOTO 10051
10088   CONTINUE
10087   SYMLE0=SYMLE0+(1)
        SYMTE0(SYMLE0)=C
        BACKUP=CMDPT0
        CALL LSGETC(CMDPT0,C)
        CMDCU0=CMDCU0+(1)
        FIRST0=.FALSE.
10085 GOTO 10053
10056 SYMTE0(SYMLE0+1)=0
      IF((SYMTY0.NE.0))GOTO 10089
        SYMTY0=5
10089 AAAAI0=SYMTY0
      GOTO 10090
10091   CALL SDROP(SYMTE0,SYMST0,1)
        IF((CKALF(SYMST0).NE.0))GOTO 10094
          CALL SYNERR('non-alphanumeric label.')
          AAAAE0=6
          GOTO 10051
10093   CONTINUE
10092 GOTO 10094
10095   CALL STAKE(SYMTE0,SYMST0,CHRPOS-1)
        SYMOP0=CKNUM(SYMST0)
        IF((SYMOP0.NE.-3))GOTO 10096
          CALL SYNERR('non-numeric output port.')
          AAAAE0=7
          GOTO 10051
10097   CONTINUE
10096   J=CHRPOS+1
        I=J
        GOTO 10100
10098   I=I+(1)
10100   IF((SYMTE0(I).EQ.0))GOTO 10099
        IF((SYMTE0(I).EQ.174))GOTO 10099
        GOTO 10098
10099   CALL SUBSTR(SYMTE0,SYMST0,J,I-J)
        SYMNO0=CKNUM(SYMST0)
        IF((SYMNO0.NE.-3))GOTO 10101
        IF((CKALF(SYMST0).NE.0))GOTO 10101
        IF((EQUAL(SYMST0,AAAAJ0).NE.0))GOTO 10101
          CALL SYNERR('destination is neither label nor node number.')
          AAAAE0=8
          GOTO 10051
10102   CONTINUE
10101   IF((SYMTE0(I).NE.174))GOTO 10103
          SYMIP0=CKNUM(SYMTE0(I+1))
          IF((SYMIP0.NE.-3))GOTO 10094
            CALL SYNERR('non-numeric destination input port.')
            AAAAE0=9
            GOTO 10051
10105     CONTINUE
10104     GOTO 10094
10103     SYMIP0=0
10106 GOTO 10094
10107   CALL STAKE(SYMTE0,SYMST0,CHRPOS-1)
        SYMOP0=CKNUM(SYMST0)
        IF((SYMOP0.EQ.-3))GOTO 10109
        IF((SYMTE0(1).NE.190))GOTO 10108
        IF((SYMTE0(2).NE.190))GOTO 10108
        IF((CKNUM(SYMTE0(3)).EQ.-3))GOTO 10108
        GOTO 10109
10109     CHRPOS=CHRPOS+(1)
          IF((SYMTE0(CHRPOS).NE.190))GOTO 10111
            IF((SYMST0(1).NE.0))GOTO 10112
              SYMTY0=6
              CHRPOS=CHRPOS+(1)
              GOTO 10115
10112         CALL SYNERR('pathname not allowed on CMDSRC redirector.')
              AAAAE0=10
              GOTO 10051
10114       CONTINUE
10113       GOTO 10115
10111       SYMTY0=7
10115     SYMIP0=CKNUM(SYMTE0(CHRPOS))
          IF((SYMIP0.NE.-3))GOTO 10094
            CALL SYNERR('non-numeric input port.')
            AAAAE0=11
            GOTO 10051
10117     CONTINUE
10116     GOTO 10094
10108     IF((SYMTE0(CHRPOS+1).NE.190))GOTO 10119
            CHRPOS=CHRPOS+(1)
            SYMTY0=9
            GOTO 10120
10119       SYMTY0=8
10120     CALL SDROP(SYMTE0,SYMST0,CHRPOS)
          IF((SYMST0(1).NE.0))GOTO 10121
            CALL SYNERR('missing pathname in redirector.')
            AAAAE0=12
            GOTO 10051
10122     CONTINUE
10121   CONTINUE
10118 GOTO 10094
10090 AAAAK0=AAAAI0-2
      GOTO(10095,10091,10123,10123,10123,10123,10123,10107,10107),AAAAK0
10123 CONTINUE
10094 IF((AND(CITRA0,:100).EQ.0))GOTO 10124
        CALL SYMBO0
10124 RETURN
10051 SYMTY0=12
      IF((AND(CITRA0,:100).EQ.0))GOTO 10125
        CALL SYMBO0
10125 RETURN
10126 GOTO(10067,10074,10082,10084,10088,10093,10097,10102,10105,10114, 
     *    10117,10122),AAAAE0
      GOTO 10126
      END
      INTEGER FUNCTION CKNUM(STR)
      INTEGER STR(1)
      INTEGER I
      INTEGER CTOI
      I=1
      CKNUM=CTOI(STR,I)
      IF((STR(I).EQ.0))GOTO 10127
        CKNUM=-3
10127 RETURN
      END
      INTEGER FUNCTION CKALF(STR)
      INTEGER STR(1)
      INTEGER I
      IF((STR(1).EQ.0))GOTO 10128
        IF((193.GT.STR(1)))GOTO 10130
        IF((STR(1).GT.218))GOTO 10130
        GOTO 10129
10130   IF((225.GT.STR(1)))GOTO 10131
        IF((STR(1).GT.250))GOTO 10131
        GOTO 10129
10131     CKALF=0
          RETURN
10129   I=2
        GOTO 10134
10132   I=I+(1)
10134   IF((STR(I).EQ.0))GOTO 10133
          IF((193.GT.STR(I)))GOTO 10136
          IF((STR(I).GT.218))GOTO 10136
          GOTO 10132
10136     IF((225.GT.STR(I)))GOTO 10137
          IF((STR(I).GT.250))GOTO 10137
          GOTO 10132
10137     IF((176.GT.STR(I)))GOTO 10138
          IF((STR(I).GT.185))GOTO 10138
          GOTO 10132
10138     IF((STR(I).EQ.223))GOTO 10132
            CKALF=0
            RETURN
10133 CONTINUE
10128 CKALF=1
      RETURN
      END
      SUBROUTINE SYNERR(MSG)
      INTEGER MSG(1)
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      CALL ERRMSG(CMDAA0,CMDCU0,MSG)
      RETURN
      END
      SUBROUTINE SEMERR(MSG)
      INTEGER MSG(1)
      CALL ERRMSG(0,0,MSG)
      RETURN
      END
      SUBROUTINE SYMBO0
      INTEGER CURNO0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SYMNO0,SYMLE0
      INTEGER SYMTE0(102),SYMST0(102)
      INTEGER CMDAA0,CMDPT0
      COMMON /PARCOM/CURNO0,CMDAA0,CMDPT0,CMDCU0,SYMTY0,SYMIP0,SYMOP0,SY
     *MNO0,SYMLE0,SYMTE0,SYMST0
      INTEGER L
      INTEGER SYMBP0(12)
      INTEGER SYMBQ0(118)
      DATA SYMBQ0/1,206,197,212,212,197,210,205,223,211,217,205,0,2,195,
     *207,205,205,193,223,211,217,205,0,3,208,201,208,197,223,211,217,20
     *5,0,4,204,193,194,197,204,223,211,217,205,0,5,193,210,199,223,211,
     *217,205,0,6,195,205,196,211,210,195,223,211,217,205,0,7,198,210,20
     *7,205,223,211,217,205,0,8,212,207,215,193,210,196,223,211,217,205,
     *0,9,193,208,208,197,206,196,223,211,217,205,0,12,197,210,210,223,2
     *11,217,205,0,0,213,206,203,206,207,215,206,0/
      DATA SYMBP0/11,1,14,25,35,46,55,67,77,89,101,110/
      L=1
      GOTO 10141
10139 L=L+(1)
10141 IF((L.GE.SYMBP0(1)))GOTO 10140
        IF((SYMTY0.NE.SYMBQ0(SYMBP0(L+1))))GOTO 10139
          GOTO 10140
10140 CALL PRINT(1,'Sym_type = *s, Sym_text = ''*s''*n.',SYMBQ0(SYMBP0(L
     *+1)+1),SYMTE0)
      RETURN
      END
C ---- Long Name Map ----
C forgetcmd                      forge0
C installationcmd                insta0
C Cimdate                        cimda0
C setupports                     setuq0
C singlestep                     singl0
C timecmd                        timec0
C reserveport                    reser0
C searchfor                      searc0
C symbolpos                      symbp0
C loginnamecmd                   logio0
C Symiport                       symip0
C returnerr                      retur0
C whencmd                        whenc0
C Citrace                        citra0
C executenode                    execv0
C putbackcommand                 putba0
C results                        resul0
C getneta                        getne0
C initports                      initp0
C lookuplabel                    looku0
C dropcmd                        dropc0
C Symstr                         symst0
C Cierrorflag                    cierr0
C checklabels                    check0
C dumpcmd                        dumpc0
C dumpports                      dumpp0
C histinit                       histi0
C selectport                     selec0
C argstocmd                      argst0
C histlook                       histl0
C makeportlist                   makep0
C Symoport                       symop0
C Cihello                        cihel0
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
C firstchar                      first0
C clrargs                        clrar0
C enterlabel                     enter0
C exitcmd                        exitd0
C loginfo                        login0
C shtracecmd                     shtra0
C Cidefaultsr                    cidef0
C varscmd                        varsc0
C numfunnels                     numfu0
C restorestate                   resto0
C vpsdcmd                        vpsdc0
C Cmd                            cmdaa0
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
C Ciprompt                       cipro0
C pathname                       pathn0
C assignoports                   assih0
C histget                        histh0
C nargscmd                       nargs0
C makeoport                      makeo0
C Cifile                         cifil0
C Cierrorcontext                 ciers0
C getelement                     getel0
C stopcmd                        stopc0
C Symlen                         symle0
C casecmd                        casec0
C stoplogging                    stopl0
C Curnode                        curno0
C Symtype                        symty0
C invokevar                      invom0
C Cifd                           cifda0
C Cicnodes                       cicno0
C Cisearchrule                   cisea0
C datecmd                        datec0
C Ciquoteopt                     ciqup0
C numargs                        numar0
C accessarg                      acces0
C echocmd                        echoc0
C invokeint                      invol0
C substrcmd                      subst0
C Symtext                        symte0
C declarecmd                     decla0
C nettrace                       nettr0
C Cirecord                       cirec0
C Cimsize                        cimsi0
C getnetlabel                    getnf0
C Cicheck                        ciche0
C symboltext                     symbq0
C histfind                       histf0
C histsub                        hists0
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
C Ciquote                        ciquo0
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
C command                        comma0
C Symnode                        symno0
C assignports                    assii0
C filetype                       filet0
C quotecmd                       quote0
C argscmd                        argsc0
C argument                       argum0
C declaredcmd                    declb0
C startlogging                   start0
