      INTEGER A$BUF(200)
      INTEGER POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0
      INTEGER SPACI0,FORMA0
      LOGICAL OUTSU0
      REAL * 8 QUITL0
      COMMON /SP$COM/POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0,SP
     *ACI0,FORMA0,OUTSU0,QUITL0,A$BUF
      INTEGER NAME(102)
      INTEGER SAVEL0,STATE(4),I,JUNK
      INTEGER DUPLX$,GFNARG
      INTEGER OPEN
      EXTERNAL QUITU0
      SHORTCALL MKONU$(18)
      INTEGER VERT(16),HORIZ(16)
      INTEGER PARSCL
      INTEGER AAAAA0(30)
      INTEGER AAAAB0(79)
      INTEGER AAAAC0(27)
      INTEGER AAAAD0(25)
      INTEGER AAAAE0(4)
      INTEGER JUNK,T1IN
      INTEGER JUNK,T1IN
      INTEGER AAAAF0
      INTEGER AAAAG0(17)
      INTEGER AAAAH0(17)
      INTEGER AAAAI0
      INTEGER AAAAJ0(4)
      INTEGER JUNK,T1IN
      DATA VERT/208,209,210,211,212,213,214,215,216,217,218,219,220,221,
     *222,223/
      DATA HORIZ/192,193,194,195,196,197,198,199,200,201,202,203,204,205
     *,206,207/
      DATA AAAAA0/227,188,242,233,190,232,188,242,233,190,234,236,188,24
     *2,233,190,238,188,233,231,238,190,243,246,188,242,233,190,248,0/
      DATA AAAAB0/213,243,225,231,229,186,160,243,240,242,233,238,244,16
     *0,251,173,227,160,188,227,239,240,233,229,243,190,252,173,232,160,
     *188,232,239,242,233,250,190,252,173,234,252,173,236,160,188,236,22
     *9,238,231,244,232,190,252,173,243,252,173,246,160,188,246,229,242,
     *244,190,252,173,248,253,160,219,188,230,233,236,229,190,221,0/
      DATA AAAAC0/233,236,236,229,231,225,236,160,232,239,242,233,250,23
     *9,238,244,225,236,160,243,240,225,227,233,238,231,0/
      DATA AAAAD0/233,236,236,229,231,225,236,160,246,229,242,244,233,22
     *7,225,236,160,243,240,225,227,233,238,231,0/
      DATA AAAAE0/5,-11819,-13868,-23392/
      DATA AAAAG0/170,243,186,160,227,225,238,167,244,160,239,240,229,23
     *8,170,238,0/
      DATA AAAAH0/170,243,186,160,227,225,238,167,244,160,239,240,229,23
     *8,170,238,0/
      DATA AAAAJ0/5,-11819,-13868,-23392/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR(AAAAB0)
10000 IF((A$BUF(227-225+1).EQ.2))GOTO 10001
        A$BUF(227-225+27)=1
10001 IF((A$BUF(236-225+1).EQ.2))GOTO 10002
        A$BUF(236-225+27)=66
10002 IF((A$BUF(232-225+1).EQ.0))GOTO 10003
        IF((A$BUF(232-225+27).LT.0))GOTO 10005
        IF((15.LT.A$BUF(232-225+27)))GOTO 10005
        GOTO 10004
10005     CALL ERROR(AAAAC0)
10004 CONTINUE
10003 IF((A$BUF(246-225+1).EQ.0))GOTO 10006
        IF((A$BUF(246-225+27).LT.1))GOTO 10008
        IF((16.LT.A$BUF(246-225+27)))GOTO 10008
        GOTO 10007
10008     CALL ERROR(AAAAD0)
10007 CONTINUE
10006 CALL MKLB$F($1,QUITL0)
      CALL MKONU$(AAAAE0,LOC(QUITU0))
      SAVEL0=DUPLX$(-1)
      JUNK=DUPLX$(OR(SAVEL0,:140000))
      CALL SETDE0(0,0,1)
      POSAA0=1
      LINEA0=1
      OUTST0=0
      CHUNK0=0
      DIREC0=0
      OUTSU0=.FALSE.
      CALL T1OU(141)
      CHUNK0=CHUNK0+(1)
      IF((A$BUF(248-225+1).NE.0))GOTO 10009
        CALL T1OU(140)
        CHUNK0=CHUNK0+(1)
        IF((A$BUF(243-225+1).EQ.0))GOTO 10010
          IF((.NOT.OUTSU0))GOTO 10011
10012       IF((T1IN(JUNK).EQ.134))GOTO 10013
            GOTO 10012
10013     CONTINUE
10011     CHUNK0=0
          OUTSU0=.FALSE.
          CALL T1OU(135)
10014     IF((T1IN(JUNK).EQ.134))GOTO 10015
          GOTO 10014
10015   CONTINUE
10010 CONTINUE
10009 STATE(1)=1
10016   AAAAF0=GFNARG(NAME,STATE)
        GOTO 10017
10020     FDAAA0=OPEN(NAME,1)
          IF((FDAAA0.EQ.-3))GOTO 10021
            I=1
            GOTO 10024
10022       I=I+(1)
10024       IF((I.GT.A$BUF(227-225+27)))GOTO 10023
              IF((A$BUF(232-225+1).EQ.0))GOTO 10025
                SPACI0=HORIZ(A$BUF(232-225+27)+1)
                GOTO 10026
10025           SPACI0=-1
10026         IF((SPACI0.EQ.-1))GOTO 10027
                CALL T1OU(155)
                CALL T1OU(221)
                CALL T1OU(SPACI0)
                CHUNK0=CHUNK0+(3)
10027         IF((A$BUF(246-225+1).EQ.0))GOTO 10028
                FORMA0=VERT(A$BUF(246-225+27))
                GOTO 10029
10028           FORMA0=-1
10029         IF((FORMA0.EQ.-1))GOTO 10030
                CALL T1OU(155)
                CALL T1OU(221)
                CALL T1OU(FORMA0)
                CHUNK0=CHUNK0+(3)
10030         CALL SPRINT
              CALL REWIND(FDAAA0)
            GOTO 10022
10023       CALL CLOSE(FDAAA0)
            GOTO 10032
10021       CALL PRINT(-15,AAAAG0,NAME)
10031   GOTO 10032
10033     CALL PRINT(-15,AAAAH0,NAME)
        GOTO 10032
10017   AAAAI0=AAAAF0+4
        GOTO(10033,10020,10019),AAAAI0
10032 CONTINUE
      GOTO 10016
10019 CALL OUTCH(141)
1     CALL RVONU$(AAAAJ0)
      IF((.NOT.OUTSU0))GOTO 10034
10035   IF((T1IN(JUNK).EQ.134))GOTO 10036
        GOTO 10035
10036 CONTINUE
10034 IF((FDAAA0.EQ.-10))GOTO 10037
        CALL CLOSE(FDAAA0)
10037 CALL SETDE0(4,180,90)
      JUNK=DUPLX$(SAVEL0)
      CALL SWT
      END
      SUBROUTINE SPRINT
      INTEGER A$BUF(200)
      INTEGER POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0
      INTEGER SPACI0,FORMA0
      LOGICAL OUTSU0
      REAL * 8 QUITL0
      COMMON /SP$COM/POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0,SP
     *ACI0,FORMA0,OUTSU0,QUITL0,A$BUF
      INTEGER BUF(1000)
      INTEGER I,J,K,START,SIZE,LEN
      INTEGER INBUF
10038 IF((INBUF(BUF,LEN,START,SIZE).EQ.-1))GOTO 10039
        IF((SIZE.NE.0))GOTO 10040
          CALL OUTCH(138)
          GOTO 10038
10040     IF((POSAA0-START.LE.SIZE-POSAA0))GOTO 10042
            CALL T1OU(155)
            CALL T1OU(188)
            CHUNK0=CHUNK0+(2)
            DIREC0=1
            IF((POSAA0.EQ.SIZE))GOTO 10043
              CALL POSIT0(SIZE)
              CHUNK0=CHUNK0+(3)
              POSAA0=SIZE
10043       I=LEN
            GOTO 10046
10044       I=I-(1)
10046       IF((I.LT.START))GOTO 10045
              K=0
              J=I
              GOTO 10049
10047         J=J-(1)
10049         IF((BUF(J).NE.160))GOTO 10048
                K=K+(1)
              GOTO 10047
10048         IF((K.LE.3))GOTO 10050
                CALL POSIT0(POSAA0-K)
                CHUNK0=CHUNK0+(3)
                POSAA0=POSAA0-(K)
                I=J
10050         IF((POSAA0.LE.0))GOTO 10051
                CALL OUTCH(BUF(I))
10051         IF((BUF(I).NE.136))GOTO 10052
                POSAA0=POSAA0+(1)
                GOTO 10044
10052           IF((BUF(I).EQ.10))GOTO 10054
                IF((BUF(I).EQ.11))GOTO 10054
                  POSAA0=POSAA0-(1)
10054         CONTINUE
10053       GOTO 10044
10045       CALL OUTCH(138)
            GOTO 10055
10042       CALL T1OU(155)
            CALL T1OU(190)
            CHUNK0=CHUNK0+(2)
            DIREC0=0
            IF((POSAA0.EQ.START))GOTO 10056
              CALL POSIT0(START)
              CHUNK0=CHUNK0+(3)
              POSAA0=START
10056       I=START
            GOTO 10059
10057       I=I+(1)
10059       IF((I.GT.LEN))GOTO 10058
              K=0
              J=I
              GOTO 10062
10060         J=J+(1)
10062         IF((BUF(J).NE.160))GOTO 10061
                K=K+(1)
              GOTO 10060
10061         IF((K.LE.3))GOTO 10063
                CALL POSIT0(POSAA0+K)
                CHUNK0=CHUNK0+(3)
                POSAA0=POSAA0+(K)
                I=J
10063         IF((POSAA0.LE.0))GOTO 10064
                CALL OUTCH(BUF(I))
10064         IF((BUF(I).NE.136))GOTO 10065
                POSAA0=POSAA0-(1)
                GOTO 10057
10065           IF((BUF(I).EQ.10))GOTO 10067
                IF((BUF(I).EQ.11))GOTO 10067
                  POSAA0=POSAA0+(1)
10067         CONTINUE
10066       GOTO 10057
10058       CALL OUTCH(138)
10055   CONTINUE
10041 GOTO 10038
10039 IF((A$BUF(234-225+1).EQ.0))GOTO 10068
      IF((LINEA0.LE.1))GOTO 10068
        CALL OUTCH(140)
10068 RETURN
      END
      INTEGER FUNCTION INBUF(BUF,LEN,START,SIZE)
      INTEGER BUF(1000)
      INTEGER LEN,START,SIZE
      INTEGER A$BUF(200)
      INTEGER POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0
      INTEGER SPACI0,FORMA0
      LOGICAL OUTSU0
      REAL * 8 QUITL0
      COMMON /SP$COM/POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0,SP
     *ACI0,FORMA0,OUTSU0,QUITL0,A$BUF
      INTEGER L,K,I
      INTEGER GETLIN
      L=GETLIN(BUF,FDAAA0)
      IF((L.NE.-1))GOTO 10069
        INBUF=L
        RETURN
10069 CONTINUE
10070 IF((BUF(L).EQ.138))GOTO 10071
      IF((L.GE.1000-102))GOTO 10071
        K=GETLIN(BUF(L+1),FDAAA0)
        IF((K.NE.-1))GOTO 10072
          GOTO 10071
10072   L=L+(K)
      GOTO 10070
10071 LEN=L-1
      GOTO 10075
10073 LEN=LEN-(1)
10075 IF((LEN.LE.0))GOTO 10074
        IF((BUF(LEN).EQ.160))GOTO 10073
          GOTO 10074
10074 START=1
      GOTO 10079
10077 START=START+(1)
10079 IF((START.GT.LEN))GOTO 10078
        IF((BUF(START).EQ.160))GOTO 10077
          GOTO 10078
10078 SIZE=0
      I=1
      GOTO 10083
10081 I=I+(1)
10083 IF((I.GT.LEN))GOTO 10082
        IF((BUF(I).NE.136))GOTO 10084
          SIZE=SIZE-(1)
          GOTO 10081
10084     IF((BUF(I).EQ.10))GOTO 10086
          IF((BUF(I).EQ.11))GOTO 10086
          IF((BUF(I).EQ.75))GOTO 10086
            SIZE=SIZE+(1)
10086   CONTINUE
10085 GOTO 10081
10082 INBUF=L
      RETURN
      END
      SUBROUTINE OUTCH(C)
      INTEGER C
      INTEGER A$BUF(200)
      INTEGER POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0
      INTEGER SPACI0,FORMA0
      LOGICAL OUTSU0
      REAL * 8 QUITL0
      COMMON /SP$COM/POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0,SP
     *ACI0,FORMA0,OUTSU0,QUITL0,A$BUF
      INTEGER SGAMM0(13),SLAMB0(13),SNABLA(23),SNOT(11),SNU(11),SPHI(7),
     *SPHIA0(43),SPSI(19),SPSIA0(19),SPIAA0(33),STHETA(5),STHET0(5),SZET
     *A(15),SIOTA(13),SXIAA0(63),SUPSI0(13),SCHI(7),SPSSET(19),SSSET(21)
     *,SLE(13),SGE(13),SIMP(9),SEXIST(31),SNEXI0(33),SUNIV(15),SOR(15),S
     *AND(15),SNE(5),SISO(13),SAPEQ(13),SSCOL0(5),SDQUO0(11),SDOLL0(5)
      INTEGER VERT(16)
      INTEGER JUNK,T1IN
      INTEGER JUNK,T1IN
      INTEGER JUNK,T1IN
      INTEGER JUNK,T1IN
      INTEGER JUNK,T1IN
      INTEGER AAAAK0
      INTEGER AAAAL0
      DATA SGAMM0/96,160,160,160,160,167,136,136,136,136,136,136,0/,SLAM
     *B0/136,175,160,160,160,142,74,143,136,136,136,136,0/,SNABLA/136,14
     *2,74,143,160,160,160,175,136,136,11,11,11,11,173,136,136,136,10,10
     *,10,10,0/,SNOT/136,173,160,10,10,167,136,136,11,11,0/,SNU/136,168,
     *160,160,160,175,136,136,136,136,0/,SPHI/239,136,10,252,136,11,0/,S
     *PHIA0/239,136,136,136,10,10,10,142,64,143,160,160,160,160,142,62,1
     *43,136,136,136,136,136,136,136,11,11,11,11,11,11,94,160,160,160,16
     *0,96,136,136,136,10,10,10,0/,SPSI/252,136,173,10,160,160,167,136,1
     *36,136,136,136,136,136,167,160,160,11,0/,SPSIA0/201,136,173,10,160
     *,160,167,136,136,136,136,136,136,136,167,160,160,11,0/,SPIAA0/136,
     *136,136,136,136,136,136,136,94,160,160,160,160,96,160,160,160,160,
     *94,160,160,160,160,96,136,136,136,136,136,136,136,136,0/,STHETA/20
     *7,136,173,136,0/,STHET0/207,136,189,136,0/,SZETA/11,11,11,11,11,17
     *3,10,10,10,10,10,36,136,136,0/,SIOTA/10,10,39,10,10,167,11,11,11,1
     *1,136,136,0/,SXIAA0/223,10,173,11,11,11,11,11,11,11,136,136,223,10
     *,10,10,10,10,10,136,136,136,136,136,167,160,160,160,160,160,160,16
     *0,160,160,167,136,10,10,10,10,10,167,136,136,136,136,136,136,136,1
     *36,136,136,136,167,11,11,11,11,11,160,160,160,0/,SUPSI0/142,74,143
     *,160,160,160,169,136,136,136,136,136,0/,SCHI/36,136,142,74,143,136
     *,0/,SPSSET/11,227,160,160,11,173,136,10,10,10,173,10,11,11,136,136
     *,136,136,0/,SSSET/11,227,160,160,11,173,136,10,10,10,173,136,11,11
     *,223,10,136,136,136,136,0/,SLE/11,11,188,136,10,10,10,10,173,11,11
     *,136,0/,SGE/11,11,190,136,10,10,10,10,173,11,11,136,0/,SIMP/189,16
     *0,160,190,136,136,136,136,0/,SEXIST/223,11,11,11,11,11,11,11,11,13
     *6,223,10,10,10,10,10,10,10,10,160,173,160,160,252,136,136,136,136,
     *136,136,0/,SNEXI0/223,11,11,11,11,11,11,11,11,136,223,10,10,10,10,
     *10,10,10,10,160,173,136,175,160,160,252,136,136,136,136,136,136,0/
     *,SUNIV/142,74,143,160,160,173,160,175,136,136,136,136,136,136,0/,S
     *OR/142,74,143,160,160,160,160,175,136,136,136,136,136,136,0/,SAND/
     *175,160,160,160,160,142,74,143,136,136,136,136,136,136,0/,SNE/189,
     *136,175,136,0/,SISO/189,136,11,11,11,142,60,143,136,10,10,10,0/,SA
     *PEQ/11,142,60,143,10,10,136,142,60,143,11,136,0/,SSCOL0/186,136,17
     *2,136,0/,SDQUO0/136,136,167,160,160,160,167,136,136,136,0/,SDOLL0/
     *211,136,252,136,0/
      DATA VERT/208,209,210,211,212,213,214,215,216,217,218,219,220,221,
     *222,223/
      IF((CHUNK0.LT.72))GOTO 10087
        CALL BREAK$(1)
        IF((.NOT.OUTSU0))GOTO 10088
10089     IF((T1IN(JUNK).EQ.134))GOTO 10091
          GOTO 10089
10088     OUTSU0=.TRUE.
10091   CALL T1OU(131)
        CHUNK0=0
        CALL BREAK$(0)
10087 IF((C.NE.140))GOTO 10092
        CHUNK0=CHUNK0+(1)
        CALL T1OU(140)
        IF((A$BUF(243-225+1).EQ.0))GOTO 10093
          IF((.NOT.OUTSU0))GOTO 10094
10095       IF((T1IN(JUNK).EQ.134))GOTO 10096
            GOTO 10095
10096     CONTINUE
10094     CHUNK0=0
          OUTSU0=.FALSE.
          CALL T1OU(135)
10097     IF((T1IN(JUNK).EQ.134))GOTO 10098
          GOTO 10097
10098   CONTINUE
10093   LINEA0=1
        OUTST0=0
        GOTO 10099
10092   IF((C.NE.138))GOTO 10100
          LINEA0=LINEA0+(1)
          IF((LINEA0.LE.A$BUF(236-225+27)))GOTO 10101
            CHUNK0=CHUNK0+(1)
            CALL T1OU(140)
            IF((A$BUF(243-225+1).EQ.0))GOTO 10102
              IF((.NOT.OUTSU0))GOTO 10103
10104           IF((T1IN(JUNK).EQ.134))GOTO 10105
                GOTO 10104
10105         CONTINUE
10103         CHUNK0=0
              OUTSU0=.FALSE.
              CALL T1OU(135)
10106         IF((T1IN(JUNK).EQ.134))GOTO 10107
              GOTO 10106
10107       CONTINUE
10102       LINEA0=1
            OUTST0=0
            GOTO 10109
10101       OUTST0=OUTST0+(1)
10108     GOTO 10109
10100     IF((OUTST0.EQ.0))GOTO 10110
            CALL POSIU0(OUTST0)
            CHUNK0=CHUNK0+(3)
            OUTST0=0
10110     AAAAK0=C
          GOTO 10111
10112       CALL T1OU(142)
            CALL T1OU(83)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10114       CALL T1OU(65)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10115       CALL T1OU(38)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10116       CALL T1OU(66)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10117       CALL T1OU(142)
            CALL T1OU(71)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10118       CALL PLOTS0(SGAMM0)
          GOTO 10113
10119       CALL T1OU(142)
            CALL T1OU(75)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10120       CALL T1OU(142)
            CALL T1OU(65)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10121       CALL T1OU(142)
            CALL T1OU(78)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10122       CALL T1OU(69)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10123       CALL PLOTS0(SZETA)
          GOTO 10113
10124       CALL T1OU(90)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10125       CALL T1OU(142)
            CALL T1OU(76)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10126       CALL T1OU(72)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10127       CALL PLOTS0(STHETA)
          GOTO 10113
10128       CALL PLOTS0(STHET0)
          GOTO 10113
10129       CALL PLOTS0(SIOTA)
          GOTO 10113
10130       CALL T1OU(73)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10131       CALL T1OU(235)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10132       CALL T1OU(203)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10133       CALL T1OU(142)
            CALL T1OU(66)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10134       CALL PLOTS0(SLAMB0)
          GOTO 10113
10135       CALL T1OU(59)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10136       CALL T1OU(77)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10137       CALL PLOTS0(SNU)
          GOTO 10113
10138       CALL T1OU(78)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10139       CALL T1OU(142)
            CALL T1OU(68)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10140       CALL PLOTS0(SXIAA0)
          GOTO 10113
10141       CALL T1OU(111)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10142       CALL T1OU(79)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10143       CALL T1OU(34)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10144       CALL PLOTS0(SPIAA0)
          GOTO 10113
10145       CALL T1OU(142)
            CALL T1OU(70)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10146       CALL T1OU(80)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10147       CALL T1OU(142)
            CALL T1OU(86)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10148       CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(192)
            CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(211)
            CALL T1OU(155)
            CALL T1OU(185)
            CALL T1OU(126)
            CHUNK0=CHUNK0+(1)
            CALL T1OU(10)
            CALL T1OU(10)
            CALL T1OU(142)
            CALL T1OU(91)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
            CALL T1OU(155)
            CALL T1OU(185)
            CHUNK0=CHUNK0+(12)
            CALL T1OU(155)
            CALL T1OU(189)
            CHUNK0=CHUNK0+(2)
            IF((SPACI0.EQ.-1))GOTO 10149
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(SPACI0)
              CHUNK0=CHUNK0+(3)
10149       IF((FORMA0.EQ.-1))GOTO 10150
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(FORMA0)
              CHUNK0=CHUNK0+(3)
10150       CALL T1OU(160)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10151       CALL T1OU(142)
            CALL T1OU(67)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10152       CALL T1OU(84)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10153       CALL PLOTS0(SUPSI0)
          GOTO 10113
10154       CALL T1OU(217)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10155       CALL PLOTS0(SPHI)
          GOTO 10113
10156       CALL PLOTS0(SPHIA0)
          GOTO 10113
10157       CALL PLOTS0(SCHI)
          GOTO 10113
10158       CALL T1OU(88)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10159       CALL PLOTS0(SPSI)
          GOTO 10113
10160       CALL PLOTS0(SPSIA0)
          GOTO 10113
10161       CALL T1OU(142)
            CALL T1OU(88)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10162       CALL T1OU(92)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10163       CALL T1OU(142)
            CALL T1OU(95)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10164       CALL T1OU(36)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10165       CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(192)
            CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(211)
            CALL T1OU(155)
            CALL T1OU(185)
            CALL T1OU(142)
            CALL T1OU(72)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
            CALL T1OU(10)
            CALL T1OU(10)
            CALL T1OU(64)
            CHUNK0=CHUNK0+(1)
            CALL T1OU(155)
            CALL T1OU(185)
            CHUNK0=CHUNK0+(12)
            CALL T1OU(155)
            CALL T1OU(189)
            CHUNK0=CHUNK0+(2)
            IF((SPACI0.EQ.-1))GOTO 10166
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(SPACI0)
              CHUNK0=CHUNK0+(3)
10166       IF((FORMA0.EQ.-1))GOTO 10167
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(FORMA0)
              CHUNK0=CHUNK0+(3)
10167       CALL T1OU(160)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10168       CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(192)
            CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(211)
            CALL T1OU(155)
            CALL T1OU(185)
            CALL T1OU(94)
            CHUNK0=CHUNK0+(1)
            CALL T1OU(10)
            CALL T1OU(10)
            CALL T1OU(142)
            CALL T1OU(64)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
            CALL T1OU(155)
            CALL T1OU(185)
            CHUNK0=CHUNK0+(12)
            CALL T1OU(155)
            CALL T1OU(189)
            CHUNK0=CHUNK0+(2)
            IF((SPACI0.EQ.-1))GOTO 10169
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(SPACI0)
              CHUNK0=CHUNK0+(3)
10169       IF((FORMA0.EQ.-1))GOTO 10170
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(FORMA0)
              CHUNK0=CHUNK0+(3)
10170       CALL T1OU(160)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10171       CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(192)
            CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(211)
            CALL T1OU(155)
            CALL T1OU(185)
            CALL T1OU(96)
            CHUNK0=CHUNK0+(1)
            CALL T1OU(10)
            CALL T1OU(10)
            CALL T1OU(142)
            CALL T1OU(62)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
            CALL T1OU(155)
            CALL T1OU(185)
            CHUNK0=CHUNK0+(12)
            CALL T1OU(155)
            CALL T1OU(189)
            CHUNK0=CHUNK0+(2)
            IF((SPACI0.EQ.-1))GOTO 10172
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(SPACI0)
              CHUNK0=CHUNK0+(3)
10172       IF((FORMA0.EQ.-1))GOTO 10173
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(FORMA0)
              CHUNK0=CHUNK0+(3)
10173       CALL T1OU(160)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10174       CALL T1OU(142)
            CALL T1OU(60)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10175       CALL T1OU(142)
            CALL T1OU(74)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10176       CALL T1OU(142)
            CALL T1OU(90)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10177       CALL T1OU(142)
            CALL T1OU(94)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10178       CALL PLOTS0(SNABLA)
          GOTO 10113
10179       CALL PLOTS0(SNOT)
          GOTO 10113
10180       CALL T1OU(142)
            CALL T1OU(77)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10181       CALL T1OU(142)
            CALL T1OU(93)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10182       CALL PLOTS0(SPSSET)
          GOTO 10113
10183       CALL PLOTS0(SSSET)
          GOTO 10113
10184       CALL PLOTS0(SLE)
          GOTO 10113
10185       CALL PLOTS0(SGE)
          GOTO 10113
10186       CALL PLOTS0(SIMP)
          GOTO 10113
10187       CALL PLOTS0(SEXIST)
          GOTO 10113
10188       CALL PLOTS0(SNEXI0)
          GOTO 10113
10189       CALL PLOTS0(SUNIV)
          GOTO 10113
10190       CALL PLOTS0(SOR)
          GOTO 10113
10191       CALL PLOTS0(SAND)
          GOTO 10113
10192       CALL PLOTS0(SNE)
          GOTO 10113
10193       CALL PLOTS0(SISO)
          GOTO 10113
10194       CALL PLOTS0(SAPEQ)
          GOTO 10113
10195       CALL T1OU(142)
            CALL T1OU(62)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10196       CALL T1OU(142)
            CALL T1OU(64)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10197       CALL T1OU(96)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10198       CALL T1OU(94)
            CHUNK0=CHUNK0+(1)
          GOTO 10113
10199       CALL T1OU(142)
            CALL T1OU(80)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10200       CALL T1OU(142)
            CALL T1OU(81)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10201       CALL T1OU(142)
            CALL T1OU(87)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10202       CALL T1OU(142)
            CALL T1OU(69)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10203       CALL T1OU(142)
            CALL T1OU(82)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10204       CALL T1OU(142)
            CALL T1OU(84)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10205       CALL T1OU(142)
            CALL T1OU(89)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10206       CALL T1OU(142)
            CALL T1OU(85)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10207       CALL T1OU(142)
            CALL T1OU(73)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10208       CALL T1OU(142)
            CALL T1OU(79)
            CALL T1OU(143)
            CHUNK0=CHUNK0+(3)
          GOTO 10113
10209       CALL PLOTS0(SSCOL0)
          GOTO 10113
10210       CALL PLOTS0(SDQUO0)
          GOTO 10113
10211       CALL PLOTS0(SDOLL0)
          GOTO 10113
10212       CALL T1OU(155)
            CALL T1OU(185)
          GOTO 10113
10213       CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(211)
            IF((DIREC0.NE.0))GOTO 10214
              CALL T1OU(10)
              CHUNK0=CHUNK0+(4)
              GOTO 10215
10214         CALL T1OU(155)
              CALL T1OU(185)
              CHUNK0=CHUNK0+(5)
10215       CALL T1OU(155)
            CALL T1OU(189)
            CHUNK0=CHUNK0+(2)
            IF((SPACI0.EQ.-1))GOTO 10216
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(SPACI0)
              CHUNK0=CHUNK0+(3)
10216       IF((FORMA0.EQ.-1))GOTO 10113
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(FORMA0)
              CHUNK0=CHUNK0+(3)
10217     GOTO 10113
10218       CALL T1OU(155)
            CALL T1OU(221)
            CALL T1OU(211)
            IF((DIREC0.NE.0))GOTO 10219
              CALL T1OU(155)
              CALL T1OU(185)
              CHUNK0=CHUNK0+(5)
              GOTO 10220
10219         CALL T1OU(10)
              CHUNK0=CHUNK0+(4)
10220       CALL T1OU(155)
            CALL T1OU(189)
            CHUNK0=CHUNK0+(2)
            IF((SPACI0.EQ.-1))GOTO 10221
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(SPACI0)
              CHUNK0=CHUNK0+(3)
10221       IF((FORMA0.EQ.-1))GOTO 10113
              CALL T1OU(155)
              CALL T1OU(221)
              CALL T1OU(FORMA0)
              CHUNK0=CHUNK0+(3)
10222     GOTO 10113
10111     AAAAL0=AAAAK0-9
          GOTO(10213,10218),AAAAL0
          AAAAL0=AAAAK0-32
          GOTO(10199,10200,10201,10202,10203,10204,10205,10206,10207,   
     *  10208,10209,10210,10223,10211,10223,10168,10171,10174,10143,    
     * 10144,10175,10176,10177,10163,10165,10180,10164,10182,10181,10183
     *,10184,10186,10114,10116,10158,10120,10122,10198,10118,10128,10130
     *,10132,10212,10134,10194,10126,10142,10156,10154,10146,10148,10152
     *,10136,10138,10162,10140,10160,10124,10187,10192,10185,10178,10191
     *,10189,10112,10115,10157,10119,10121,10195,10117,10127,10129,10196
     *,10131,10133,10197,10125,10141,10155,10153,10145,10147,10151,10135
     *,10137,10161,10139,10159,10123,10190,10193,10188,10179),AAAAL0
10223       IF(((C.LT.16).OR.(C.GT.31)))GOTO 10224
              FORMA0=VERT(C-15)
              IF((FORMA0.EQ.-1))GOTO 10226
                CALL T1OU(155)
                CALL T1OU(221)
                CALL T1OU(FORMA0)
                CHUNK0=CHUNK0+(3)
10225         GOTO 10226
10224         CALL T1OU(C)
              CHUNK0=CHUNK0+(1)
10226     CONTINUE
10113   CONTINUE
10109 CONTINUE
10099 RETURN
      END
      SUBROUTINE PLOTS0(STR)
      INTEGER STR(1)
      INTEGER A$BUF(200)
      INTEGER POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0
      INTEGER SPACI0,FORMA0
      LOGICAL OUTSU0
      REAL * 8 QUITL0
      COMMON /SP$COM/POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0,SP
     *ACI0,FORMA0,OUTSU0,QUITL0,A$BUF
      INTEGER I
      INTEGER JUNK,T1IN
      CALL BREAK$(1)
      CALL T1OU(155)
      CALL T1OU(221)
      CALL T1OU(208)
      CALL T1OU(155)
      CALL T1OU(221)
      CALL T1OU(193)
      CHUNK0=CHUNK0+(6)
      IF((DIREC0.NE.1))GOTO 10227
        CALL T1OU(155)
        CALL T1OU(190)
        CHUNK0=CHUNK0+(2)
10227 I=1
      GOTO 10230
10228 I=I+(1)
10230 IF((STR(I).EQ.0))GOTO 10229
        IF((CHUNK0.LT.72))GOTO 10231
          IF((.NOT.OUTSU0))GOTO 10232
10233       IF((T1IN(JUNK).EQ.134))GOTO 10235
            GOTO 10233
10232       OUTSU0=.TRUE.
10235     CALL T1OU(131)
          CHUNK0=0
10231   IF((STR(I).NE.11))GOTO 10236
          CALL T1OU(155)
          CALL T1OU(185)
          CHUNK0=CHUNK0+(2)
          GOTO 10228
10236     CALL T1OU(STR(I))
          CHUNK0=CHUNK0+(1)
10237 GOTO 10228
10229 IF((DIREC0.NE.1))GOTO 10238
        CALL T1OU(155)
        CALL T1OU(188)
        CHUNK0=CHUNK0+(2)
10238 CALL T1OU(155)
      CALL T1OU(189)
      CHUNK0=CHUNK0+(2)
      IF((SPACI0.EQ.-1))GOTO 10239
        CALL T1OU(155)
        CALL T1OU(221)
        CALL T1OU(SPACI0)
        CHUNK0=CHUNK0+(3)
10239 IF((FORMA0.EQ.-1))GOTO 10240
        CALL T1OU(155)
        CALL T1OU(221)
        CALL T1OU(FORMA0)
        CHUNK0=CHUNK0+(3)
10240 CALL T1OU(160)
      CHUNK0=CHUNK0+(1)
      CALL BREAK$(0)
      RETURN
      END
      SUBROUTINE POSIT0(POS)
      INTEGER POS
      INTEGER SECON0,THIRD0(32)
      DATA THIRD0/192,193,194,195,196,197,198,199,200,201,202,203,204,20
     *5,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,
     *222,223/
      IF((POS.GT.32))GOTO 10241
        SECON0=208
        GOTO 10242
10241   IF((POS.GT.64))GOTO 10243
          SECON0=209
          GOTO 10244
10243     IF((POS.GT.96))GOTO 10245
            SECON0=210
            GOTO 10246
10245       IF((POS.GT.128))GOTO 10247
              SECON0=211
              GOTO 10248
10247         IF((POS.GT.160))GOTO 10249
                SECON0=212
                GOTO 10250
10249           SECON0=213
10250       CONTINUE
10248     CONTINUE
10246   CONTINUE
10244 CONTINUE
10242 CALL T1OU(155)
      CALL T1OU(SECON0)
      CALL T1OU(THIRD0(MOD(POS-1,32)+1))
      RETURN
      END
      SUBROUTINE POSIU0(POS)
      INTEGER POS
      INTEGER P
      INTEGER SECON0,THIRD0,TK(32)
      DATA TK/192,193,194,195,196,197,198,199,200,201,202,203,204,205,20
     *6,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,
     *223/
      P=POS
10251   IF((P.GT.31))GOTO 10252
          SECON0=218
          THIRD0=TK(P+1)
          P=0
          GOTO 10253
10252     SECON0=219
          IF((P.GT.63))GOTO 10254
            THIRD0=TK(MOD(P,32)+1)
            P=0
            GOTO 10255
10254       THIRD0=TK(32)
            P=P-(63)
10255   CONTINUE
10253   CALL T1OU(155)
        CALL T1OU(SECON0)
        CALL T1OU(THIRD0)
      IF((P.NE.0))GOTO 10251
      RETURN
      END
      SUBROUTINE QUITU0(CP)
      INTEGER * 4 CP
      INTEGER A$BUF(200)
      INTEGER POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0
      INTEGER SPACI0,FORMA0
      LOGICAL OUTSU0
      REAL * 8 QUITL0
      COMMON /SP$COM/POSAA0,LINEA0,CHUNK0,PAGEL0,FDAAA0,DIREC0,OUTST0,SP
     *ACI0,FORMA0,OUTSU0,QUITL0,A$BUF
      CALL T1OU(138)
      CALL PL1$NL(QUITL0)
      RETURN
      END
      SUBROUTINE SETDE0(MINIM0,MAXIM0,SLOPE)
      INTEGER MINIM0,MAXIM0,SLOPE
      INTEGER CMD(102)
      INTEGER AAAAM0(20)
      DATA AAAAM0/170,172,173,184,245,228,229,236,225,249,160,170,233,16
     *0,170,233,160,170,233,0/
      CALL ENCODE(CMD,102,AAAAM0,MINIM0,MAXIM0,SLOPE)
      CALL SYS$$(CMD,-3)
      RETURN
      END
C ---- Long Name Map ----
C thirdkey                       third0
C Line                           linea0
C Outstandingpoll                outsu0
C snexist                        snexi0
C Pos                            posaa0
C sPSI                           spsia0
C sPI                            spiaa0
C sLAMBDA                        slamb0
C sTHETA                         sthet0
C secondkey                      secon0
C plotstr                        plots0
C Spacing                        spaci0
C sXI                            sxiaa0
C sdollar                        sdoll0
C Direction                      direc0
C Quitlabel                      quitl0
C positionvertically             posiu0
C Pagelength                     pagel0
C supsilon                       supsi0
C minimum                        minim0
C Chunk                          chunk0
C savelword                      savel0
C maximum                        maxim0
C quitunit                       quitu0
C sscolon                        sscol0
C Outstandinglf                  outst0
C setdelay                       setde0
C sGAMMA                         sgamm0
C sPHI                           sphia0
C sdquote                        sdquo0
C Fd                             fdaaa0
C Formadvance                    forma0
C positionhorizontally           posit0
