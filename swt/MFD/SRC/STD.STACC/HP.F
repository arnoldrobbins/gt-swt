      REAL * 8 STACK(100)
      INTEGER SCANP0,SP,STATE
      INTEGER CHAR,LINE(102)
      COMMON /JUNK/STACK,SP,SCANP0,CHAR,LINE,STATE
      INTEGER STATE,I,L
      INTEGER GETLIN,GETARG,LENGTH
      LOGICAL SOUND
      CALL INITI0
      IF((GETARG(1,LINE,102).EQ.-1))GOTO 10000
        L=1
        I=1
        GOTO 10003
10001   I=I+(1)
10003   IF((GETARG(I,LINE(L),102-L).EQ.-1))GOTO 10002
          L=LENGTH(LINE)+1
          LINE(L)=160
          L=L+(1)
        GOTO 10001
10002   SCANP0=0
        CALL GETCH0
        CALL EXPRE0(STATE)
        IF((.NOT.SOUND(1)))GOTO 10005
          CALL PRINT(-11,'*f*n.',STACK(SP))
10004   GOTO 10005
10000   CONTINUE
10006   IF((GETLIN(LINE,-10).EQ.-1))GOTO 10007
          SCANP0=0
          CALL GETCH0
          CALL EXPRE0(STATE)
        GOTO 10006
10007 CONTINUE
10005 CALL SWT
      END
      SUBROUTINE EXPRE0(GPST)
      INTEGER GPST
      REAL * 8 STACK(100)
      INTEGER SCANP0,SP,STATE
      INTEGER CHAR,LINE(102)
      COMMON /JUNK/STACK,SP,SCANP0,CHAR,LINE,STATE
      INTEGER STATE
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
10008   CALL CONST0(STATE)
        AAAAA0=STATE
        GOTO 10009
10010     GPST=2
          RETURN
10009   IF(AAAAA0.EQ.2)GOTO 10010
        IF((STATE.NE.1))GOTO 10011
          CALL COMMA0(STATE)
          AAAAB0=STATE
          GOTO 10012
10013       GPST=2
            RETURN
10012     IF(AAAAB0.EQ.2)GOTO 10013
10011 CONTINUE
      IF((STATE.EQ.3))GOTO 10008
      AAAAC0=STATE
      GOTO 10014
10015   STATE=3
      GOTO 10016
10014 IF(AAAAC0.EQ.1)GOTO 10015
10016 IF((STATE.NE.3))GOTO 10017
        STATE=1
        IF((CHAR.NE.138))GOTO 10018
          STATE=3
10018   IF((STATE.NE.1))GOTO 10019
          IF((CHAR.NE.0))GOTO 10020
            STATE=3
            GOTO 10021
10020       CALL PRINT(-15,'*c: unrecognized command*n.',CHAR)
10021   CONTINUE
10019   IF((STATE.EQ.3))GOTO 10022
          GPST=2
          RETURN
10022 CONTINUE
10017 GPST=STATE
      RETURN
      END
      SUBROUTINE CONST0(GPST)
      INTEGER GPST
      REAL * 8 STACK(100)
      INTEGER SCANP0,SP,STATE
      INTEGER CHAR,LINE(102)
      COMMON /JUNK/STACK,SP,SCANP0,CHAR,LINE,STATE
      INTEGER STATE
      REAL * 8 CTOD
10023 IF((CHAR.NE.160))GOTO 10024
        CALL GETCH0
      GOTO 10023
10024 STATE=1
      IF((CHAR.NE.174))GOTO 10025
        STATE=3
        CALL PUSH(CTOD(LINE,SCANP0))
        SCANP0=SCANP0-(1)
        CALL GETCH0
10025 IF((STATE.NE.1))GOTO 10026
        IF((176.GT.CHAR))GOTO 10027
        IF((CHAR.GT.185))GOTO 10027
          STATE=3
          CALL PUSH(CTOD(LINE,SCANP0))
          SCANP0=SCANP0-(1)
          CALL GETCH0
10027 CONTINUE
10026 GPST=STATE
      RETURN
      END
      SUBROUTINE COMMA0(GPST)
      INTEGER GPST
      REAL * 8 STACK(100)
      INTEGER SCANP0,SP,STATE
      INTEGER CHAR,LINE(102)
      COMMON /JUNK/STACK,SP,SCANP0,CHAR,LINE,STATE
      INTEGER STATE
      INTEGER I
      LOGICAL SOUND
10028 IF((CHAR.NE.160))GOTO 10029
        CALL GETCH0
      GOTO 10028
10029 STATE=1
      IF((CHAR.NE.240))GOTO 10030
        STATE=3
        IF((.NOT.SOUND(1)))GOTO 10031
          CALL PRINT(-11,'*d*n.',STACK(SP))
10031   CALL GETCH0
10030 IF((STATE.NE.1))GOTO 10032
        IF((CHAR.NE.208))GOTO 10033
          STATE=3
          I=1
          GOTO 10036
10034     I=I+(1)
10036     IF((I.GT.SP))GOTO 10035
            CALL PRINT(-11,'*d*n.',STACK(I))
          GOTO 10034
10035     CALL GETCH0
10033   IF((STATE.NE.1))GOTO 10037
          IF((CHAR.NE.171))GOTO 10038
            STATE=3
            IF((.NOT.SOUND(2)))GOTO 10039
              STACK(SP-1)=STACK(SP-1)+(STACK(SP))
              SP=SP-(1)
10039       CALL GETCH0
10038     IF((STATE.NE.1))GOTO 10040
            IF((CHAR.NE.173))GOTO 10041
              STATE=3
              IF((.NOT.SOUND(2)))GOTO 10042
                STACK(SP-1)=STACK(SP-1)-(STACK(SP))
                SP=SP-(1)
10042         CALL GETCH0
10041       IF((STATE.NE.1))GOTO 10043
              IF((CHAR.NE.170))GOTO 10044
                STATE=3
                IF((.NOT.SOUND(2)))GOTO 10045
                  STACK(SP-1)=STACK(SP-1)*(STACK(SP))
                  SP=SP-(1)
10045           CALL GETCH0
10044         IF((STATE.NE.1))GOTO 10046
                IF((CHAR.NE.175))GOTO 10047
                  STATE=3
                  IF((.NOT.SOUND(2)))GOTO 10048
                    STACK(SP-1)=STACK(SP-1)/(STACK(SP))
                    SP=SP-(1)
10048             CALL GETCH0
10047           IF((STATE.NE.1))GOTO 10049
                  IF((CHAR.NE.222))GOTO 10050
                    STATE=3
                    IF((.NOT.SOUND(2)))GOTO 10051
                      STACK(SP-1)=STACK(SP-1)**STACK(SP)
                      SP=SP-(1)
10051               CALL GETCH0
10050             IF((STATE.NE.1))GOTO 10052
                    IF((CHAR.NE.228))GOTO 10053
                      STATE=3
                      IF((.NOT.SOUND(1)))GOTO 10054
                        SP=SP-(1)
10054                 CALL GETCH0
10053               IF((STATE.NE.1))GOTO 10055
                      IF((CHAR.NE.196))GOTO 10056
                        STATE=3
                        SP=0
                        CALL GETCH0
10056                 IF((STATE.NE.1))GOTO 10057
                        IF((CHAR.NE.188))GOTO 10058
                          STATE=3
                          IF((.NOT.SOUND(2)))GOTO 10059
                            IF((STACK(SP-1).GE.STACK(SP)))GOTO 10060
                              STACK(SP-1)=1.0
                              GOTO 10061
10060                         STACK(SP-1)=0.0
10061                       SP=SP-(1)
10059                     CALL GETCH0
10058                   IF((STATE.NE.1))GOTO 10062
                          IF((CHAR.NE.189))GOTO 10063
                            STATE=3
                            IF((.NOT.SOUND(2)))GOTO 10064
                              IF((STACK(SP-1).NE.STACK(SP)))GOTO 10065
                                STACK(SP-1)=1.0
                                GOTO 10066
10065                           STACK(SP-1)=0
10066                         SP=SP-(1)
10064                       CALL GETCH0
10063                     IF((STATE.NE.1))GOTO 10067
                            IF((CHAR.NE.190))GOTO 10068
                              STATE=3
                              IF((.NOT.SOUND(2)))GOTO 10069
                                IF((STACK(SP-1).LE.STACK(SP)))GOTO 10070
                                  STACK(SP-1)=1.0
                                  GOTO 10071
10070                             STACK(SP-1)=0
10071                           SP=SP-(1)
10069                         CALL GETCH0
10068                       IF((STATE.NE.1))GOTO 10072
                              IF((CHAR.NE.166))GOTO 10073
                                STATE=3
                                IF((.NOT.SOUND(2)))GOTO 10074
                                  IF(((STACK(SP-1).EQ.0).OR.(STACK(SP).E
     *Q.0)))GOTO 10075
                                    STACK(SP-1)=1.0
                                    GOTO 10076
10075                               STACK(SP-1)=0.0
10076                             SP=SP-(1)
10074                           CALL GETCH0
10073                         IF((STATE.NE.1))GOTO 10077
                                IF((CHAR.NE.252))GOTO 10078
                                  STATE=3
                                  IF((.NOT.SOUND(2)))GOTO 10079
                                    IF(((STACK(SP-1).EQ.0).AND.(STACK(SP
     *).EQ.0)))GOTO 10080
                                      STACK(SP-1)=1.0
                                      GOTO 10081
10080                                 STACK(SP-1)=0.0
10081                               SP=SP-(1)
10079                             CALL GETCH0
10078                           IF((STATE.NE.1))GOTO 10082
                                  IF((CHAR.NE.254))GOTO 10083
                                    STATE=3
                                    IF((.NOT.SOUND(1)))GOTO 10084
                                      IF((STACK(SP).EQ.0))GOTO 10085
                                        STACK(SP)=0
                                        GOTO 10086
10085                                   STACK(SP)=1.0
10086                               CONTINUE
10084                               CALL GETCH0
10083                           CONTINUE
10082                         CONTINUE
10077                       CONTINUE
10072                     CONTINUE
10067                   CONTINUE
10062                 CONTINUE
10057               CONTINUE
10055             CONTINUE
10052           CONTINUE
10049         CONTINUE
10046       CONTINUE
10043     CONTINUE
10040   CONTINUE
10037 CONTINUE
10032 GPST=STATE
      RETURN
      END
      SUBROUTINE PUSH(STUFF)
      REAL * 8 STUFF
      REAL * 8 STACK(100)
      INTEGER SCANP0,SP,STATE
      INTEGER CHAR,LINE(102)
      COMMON /JUNK/STACK,SP,SCANP0,CHAR,LINE,STATE
      IF((SP.LT.100))GOTO 10087
        CALL REMARK('stack overflow.')
        STATE=2
        GOTO 10088
10087   SP=SP+(1)
        STACK(SP)=STUFF
10088 RETURN
      END
      LOGICAL FUNCTION SOUND(DEPTH)
      INTEGER DEPTH
      REAL * 8 STACK(100)
      INTEGER SCANP0,SP,STATE
      INTEGER CHAR,LINE(102)
      COMMON /JUNK/STACK,SP,SCANP0,CHAR,LINE,STATE
      IF((SP.GE.DEPTH))GOTO 10089
        CALL REMARK('stack underflow.')
        SOUND=.FALSE.
        STATE=2
        GOTO 10090
10089   SOUND=.TRUE.
10090 RETURN
      END
      SUBROUTINE GETCH0
      REAL * 8 STACK(100)
      INTEGER SCANP0,SP,STATE
      INTEGER CHAR,LINE(102)
      COMMON /JUNK/STACK,SP,SCANP0,CHAR,LINE,STATE
      SCANP0=SCANP0+(1)
      CHAR=LINE(SCANP0)
      RETURN
      END
      SUBROUTINE INITI0
      REAL * 8 STACK(100)
      INTEGER SCANP0,SP,STATE
      INTEGER CHAR,LINE(102)
      COMMON /JUNK/STACK,SP,SCANP0,CHAR,LINE,STATE
      SP=0
      RETURN
      END
C ---- Long Name Map ----
C constant                       const0
C expression                     expre0
C scanptr                        scanp0
C initialize                     initi0
C getchar                        getch0
C command                        comma0
