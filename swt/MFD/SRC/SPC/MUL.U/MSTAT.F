      INTEGER XPOSA0(10)
      INTEGER YPOSA0(10)
      INTEGER BEARI0(10)
      INTEGER WARPA0(10)
      INTEGER PHASE0(10)
      INTEGER TORPE0(10)
      INTEGER RESER0(10)
      INTEGER RESEA0(10)
      INTEGER SHIEL0(10)
      INTEGER KILLS0(10)
      INTEGER LOCKE0(10)
      INTEGER MSGQU0(10)
      INTEGER NAMEA0(21,10)
      INTEGER HEADP0(1)
      INTEGER TAILP0(1)
      INTEGER LINKA0(1)
      INTEGER MSGPT0(1)
      INTEGER REFCO0(1)
      INTEGER MSGTE0(1)
      INTEGER MEMAA0(10000)
      COMMON /MULCOM/XPOSA0,YPOSA0,BEARI0,WARPA0,PHASE0,TORPE0,RESER0,RE
     *SEA0,SHIEL0,KILLS0,LOCKE0,MSGQU0,NAMEA0,MEMAA0
      INTEGER PHANT0
      INTEGER PHANU0
      INTEGER PLAYER
      INTEGER ECHAR
      INTEGER KCHAR
      INTEGER CURSOR
      INTEGER COMMA0(102)
      INTEGER PHCON0
      INTEGER PHALLY
      INTEGER PHTUR0
      INTEGER PHVIC0
      INTEGER PHCHE0
      INTEGER PHTASK
      INTEGER DBLOCK
      COMMON /PRIVA0/PHANT0,PHANU0,PLAYER,ECHAR,KCHAR,CURSOR,COMMA0,PHCO
     *N0,PHALLY,PHTUR0,PHVIC0,PHCHE0,PHTASK,DBLOCK
      INTEGER I,FLAG
      INTEGER TERM(7)
      LOGICAL TQUIT$
      INTEGER VTINIT
      INTEGER AAAAA0(38)
      INTEGER AAAAB0(41)
      INTEGER AAAAC0(34)
      INTEGER AAAAD0(35)
      INTEGER AAAAE0(34)
      INTEGER AAAAF0(45)
      INTEGER AAAAG0(29)
      INTEGER AAAAH0(12)
      INTEGER AAAAI0(5)
      INTEGER AAAAJ0(1)
      EQUIVALENCE (HEADP0,MEMAA0(1))
      EQUIVALENCE (TAILP0,MEMAA0(2))
      EQUIVALENCE (LINKA0,MEMAA0(1))
      EQUIVALENCE (MSGPT0,MEMAA0(2))
      EQUIVALENCE (REFCO0,MEMAA0(1))
      EQUIVALENCE (MSGTE0,MEMAA0(2))
      DATA AAAAA0/244,229,242,237,233,238,225,236,160,244,249,240,229,16
     *0,167,170,243,167,160,233,243,160,238,239,244,160,243,245,240,240,
     *239,242,244,229,228,170,238,0/
      DATA AAAAB0/173,173,160,208,242,233,237,229,160,205,245,236,244,24
     *2,229,235,160,199,225,236,225,248,249,160,211,244,225,244,245,243,
     *160,210,229,240,239,242,244,160,173,173,0/
      DATA AAAAC0/210,243,227,160,160,210,229,243,160,160,160,211,232,16
     *0,160,160,208,232,160,160,160,212,240,160,160,160,215,240,160,160,
     *160,194,242,0/
      DATA AAAAD0/168,216,172,217,169,160,160,160,160,205,243,231,160,20
     *9,160,160,208,186,203,236,186,160,160,208,236,225,249,229,242,160,
     *206,225,237,229,0/
      DATA AAAAE0/189,189,189,160,160,189,189,189,160,160,189,189,189,16
     *0,160,189,189,189,160,160,189,189,189,160,160,189,189,189,160,160,
     *189,189,189,0/
      DATA AAAAF0/189,189,189,189,189,189,189,189,189,160,160,189,189,18
     *9,189,189,160,160,189,186,189,189,186,160,189,189,189,189,189,189,
     *189,189,189,189,189,189,189,189,189,189,189,189,189,189,0/
      DATA AAAAG0/170,179,233,170,181,233,170,181,233,170,181,233,170,18
     *1,233,170,181,233,170,181,233,170,182,233,172,170,180,233,0/
      DATA AAAAH0/170,181,233,160,160,170,227,186,170,178,233,0/
      DATA AAAAI0/186,160,170,243,0/
      DATA AAAAJ0/0/
      IF((VTINIT(TERM).NE.-3))GOTO 10000
        CALL PRINT(-15,AAAAA0,TERM)
        CALL SETERR(1000)
        CALL SWT
10000 CALL VTPUTL(AAAAB0,3,17)
      CALL VTPUTL(AAAAC0,3+2,1)
      CALL VTPUTL(AAAAD0,3+2,38)
      CALL VTPUTL(AAAAE0,3+3,1)
      CALL VTPUTL(AAAAF0,3+3,36)
      CALL VTUPD(1)
      CALL BREAK$(1)
10001 IF(TQUIT$(FLAG))GOTO 10002
        DO 10003 I=1,10
          CALL VTPRT(3+3+I,1,AAAAG0,RESEA0(I),RESER0(I),SHIEL0(I),PHASE0
     *(I),TORPE0(I),WARPA0(I),BEARI0(I),XPOSA0(I),YPOSA0(I))
          CALL VTPRT(3+3+I,47,AAAAH0,MSGQU0(I),I+225-1,KILLS0(I))
          IF((SHIEL0(I).LT.0))GOTO 10005
            CALL VTPRT(3+3+I,58,AAAAI0,NAMEA0(1,I))
            GOTO 10006
10005       CALL VTPRT(3+3+I,58,AAAAJ0)
10006     CALL VTPAD(80)
10003   CONTINUE
10004   CALL VTUPD(0)
        CALL VTMOVE(1,1)
        CALL SLEEP$(0002000)
      GOTO 10001
10002 CALL BREAK$(0)
      CALL VTSTOP
      CALL SWT
      END
C ---- Long Name Map ----
C phturnsleft                    phtur0
C phvictim                       phvic0
C Bearing                        beari0
C phantomstate                   phant0
C Link                           linka0
C Msgtext                        msgte0
C Refcount                       refco0
C Headptr                        headp0
C Warp                           warpa0
C Msgqueue                       msgqu0
C Shields                        shiel0
C Torpedos                       torpe0
C private                        priva0
C Mem                            memaa0
C Locked                         locke0
C Msgptr                         msgpt0
C Phasers                        phase0
C Research                       resea0
C phcheck                        phche0
C Kills                          kills0
C Xpos                           xposa0
C phcontrolled                   phcon0
C Ypos                           yposa0
C Reserve                        reser0
C Name                           namea0
C phantomflag                    phanu0
C command                        comma0
C Tailptr                        tailp0
