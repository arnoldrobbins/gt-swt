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
      INTEGER CODE
      INTEGER I,J
      EQUIVALENCE (HEADP0,MEMAA0(1))
      EQUIVALENCE (TAILP0,MEMAA0(2))
      EQUIVALENCE (LINKA0,MEMAA0(1))
      EQUIVALENCE (MSGPT0,MEMAA0(2))
      EQUIVALENCE (REFCO0,MEMAA0(1))
      EQUIVALENCE (MSGTE0,MEMAA0(2))
      DO 10000 I=1,10
        SHIEL0(I)=-1
        PHASE0(I)=0
        TORPE0(I)=0
        RESER0(I)=0
        RESEA0(I)=0
        WARPA0(I)=0
        BEARI0(I)=0
        XPOSA0(I)=0
        YPOSA0(I)=0
        KILLS0(I)=0
        LOCKE0(I)=0
        MSGQU0(I)=0
        NAMEA0(1,I)=0
10000 CONTINUE
10001 CALL DSINIT(10000)
      CALL SWT
      END
      SUBROUTINE DSINIT(W)
      INTEGER W
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
      INTEGER T
      EQUIVALENCE (HEADP0,MEMAA0(1))
      EQUIVALENCE (TAILP0,MEMAA0(2))
      EQUIVALENCE (LINKA0,MEMAA0(1))
      EQUIVALENCE (MSGPT0,MEMAA0(2))
      EQUIVALENCE (REFCO0,MEMAA0(1))
      EQUIVALENCE (MSGTE0,MEMAA0(2))
      IF((W.GE.2*2+2))GOTO 10002
        CALL ERROR('in dsinit: unreasonably small memory size.')
10002 T=2
      MEMAA0(T+1)=0
      MEMAA0(T+0)=2+2
      T=2+2
      MEMAA0(T+1)=W-2-1
      MEMAA0(T+0)=0
      MEMAA0(1)=W
      RETURN
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
