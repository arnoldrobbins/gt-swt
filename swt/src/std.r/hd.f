      INTEGER A$BUF(200)
      INTEGER AP,I,JUNK,DISK,CODE,MFD,RFD,NORM,RATLE0,RATBUF(8808)
      INTEGER READR0,OPENR0,BITCO0,GETARG,FOLLOW,GCTOI
      INTEGER * 4 RECS,TOTAL0,NUMBE0
      REAL PERCE0
      INTEGER RATNA0(33),ARG(102)
      INTEGER AAAAA0
      INTEGER PARSCL
      INTEGER AAAAB0(4)
      INTEGER AAAAC0(35)
      INTEGER AAAAD0(33)
      INTEGER AAAAE0(19)
      INTEGER AAAAF0(6)
      INTEGER AAAAG0(21)
      INTEGER AAAAH0(26)
      INTEGER AAAAI0(31)
      INTEGER AAAAJ0(5)
      INTEGER AAAAK0(8)
      INTEGER AAAAL0(22)
      INTEGER AAAAM0(27)
      EQUIVALENCE (RATBUF(3),NUMBE0)
      DATA AAAAB0/238,245,246,0/
      DATA AAAAC0/213,243,225,231,229,186,160,232,228,160,219,173,245,25
     *2,173,238,252,173,246,221,160,251,160,188,240,225,227,235,160,233,
     *228,190,160,253,0/
      DATA AAAAD0/173,238,160,225,238,228,160,173,245,160,225,242,229,16
     *0,237,245,244,245,225,236,236,249,160,229,248,227,236,245,243,233,
     *246,229,0/
      DATA AAAAE0/170,243,186,160,226,225,228,160,240,225,227,235,238,22
     *5,237,229,170,238,0/
      DATA AAAAF0/175,170,172,184,233,0/
      DATA AAAAG0/170,243,186,160,237,230,228,160,245,238,242,229,225,22
     *8,225,226,236,229,170,238,0/
      DATA AAAAH0/170,243,186,160,228,233,243,235,173,242,225,244,160,24
     *5,238,242,229,225,228,225,226,236,229,170,238,0/
      DATA AAAAI0/170,243,186,160,228,233,243,235,173,242,225,244,160,22
     *6,225,228,236,249,160,230,239,242,237,225,244,244,229,228,170,238,
     *0/
      DATA AAAAJ0/160,160,160,160,0/
      DATA AAAAK0/170,178,172,184,233,186,160,0/
      DATA AAAAL0/170,178,233,160,232,229,225,228,243,160,160,170,182,23
     *6,160,242,229,227,243,160,160,0/
      DATA AAAAM0/170,182,236,160,230,242,229,229,160,160,170,182,172,17
     *8,242,165,160,230,245,236,236,160,170,243,170,238,0/
      IF((PARSCL(AAAAB0,A$BUF).NE.-3))GOTO 10001
        CALL ERROR(AAAAC0)
10001 IF((A$BUF(245-225+1).EQ.0))GOTO 10002
        IF((A$BUF(238-225+1).EQ.0))GOTO 10003
          CALL ERROR(AAAAD0)
10003   NORM=0
        GOTO 10004
10002   IF((A$BUF(238-225+1).EQ.0))GOTO 10005
          NORM=1
          GOTO 10006
10005     NORM=0
10006 CONTINUE
10004 ARG(1)=175
      AP=1
      GOTO 10009
10007 AP=AP+(1)
10009 IF((GETARG(AP,ARG(2),102-1).EQ.-1))GOTO 10008
        IF((FOLLOW(ARG,0).NE.-3))GOTO 10010
          CALL PRINT(-15,AAAAE0,ARG(2))
          GOTO 10007
10010   IF((176.GT.ARG(2)))GOTO 10011
        IF((ARG(2).GT.185))GOTO 10011
          I=2
          DISK=GCTOI(ARG,I,8)
          IF((ARG(I).EQ.0))GOTO 10012
            DISK=-1
10012     GOTO 10013
10011     DISK=-1
10013   AAAAA0=1
        GOTO 10000
10014 GOTO 10007
10008 IF((AP.NE.1))GOTO 10015
        DO 10016 DISK=0,62
          CALL ENCODE(ARG,102,AAAAF0,DISK)
          IF((FOLLOW(ARG,0).NE.-2))GOTO 10018
            AAAAA0=2
            GOTO 10000
10019     CONTINUE
10018     CONTINUE
10016   CONTINUE
10017 CONTINUE
10015 CALL SWT
10000 CALL SRCH$$(:1+:40000,:177777,0,MFD,JUNK,CODE)
      IF((CODE.EQ.0))GOTO 10020
        CALL PRINT(-15,AAAAG0,ARG)
        GOTO 1
10020 RFD=OPENR0(MFD,RATNA0)
      IF((RFD.NE.-3))GOTO 10021
        CALL SRCH$$(:4,0,0,MFD,JUNK,CODE)
        CALL PRINT(-15,AAAAH0,ARG)
        GOTO 1
10021 RATLE0=READR0(RFD,RATBUF)
      IF((RATLE0.NE.-3))GOTO 10022
        CALL SRCH$$(:4,0,0,RFD,JUNK,CODE)
        CALL SRCH$$(:4,0,0,MFD,JUNK,CODE)
        CALL PRINT(-15,AAAAI0,ARG)
        GOTO 1
10022 RECS=0
      I=RATBUF(1)+1
      GOTO 10025
10023 I=I+(1)
10025 IF((I.GT.RATLE0))GOTO 10024
        RECS=RECS+(BITCO0(RATBUF(I)))
      GOTO 10023
10024 IF((RATBUF(1).NE.5))GOTO 10026
        TOTAL0=RT(INTL(RATBUF(3)),16)
        GOTO 10027
10026   TOTAL0=NUMBE0
10027 PERCE0=(100.0*(TOTAL0-RECS))/TOTAL0
      IF((NORM.NE.1))GOTO 10028
      IF((RATBUF(2).NE.1040))GOTO 10028
        RECS=INTL((RECS*1024.0)/440.0+0.5)
10028 IF((DISK.NE.-1))GOTO 10029
        CALL PRINT(-11,AAAAJ0)
        GOTO 10030
10029   CALL PRINT(-11,AAAAK0,DISK)
10030 IF((A$BUF(246-225+1).EQ.0))GOTO 10031
        CALL PRINT(-11,AAAAL0,RATBUF(5),TOTAL0)
10031 CALL PRINT(-11,AAAAM0,RECS,PERCE0,RATNA0)
      CALL SRCH$$(:4,0,0,MFD,JUNK,CODE)
      CALL SRCH$$(:4,0,0,RFD,JUNK,CODE)
1     CONTINUE
      GOTO 10032
10032 GOTO(10014,10019),AAAAA0
      GOTO 10032
      END
      INTEGER FUNCTION BITCO0(WORD)
      INTEGER WORD
      INTEGER HEX,BITTA0(16)
      DATA BITTA0/0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4/
      HEX=RS(WORD,12)
      BITCO0=BITTA0(HEX+1)
      HEX=RT(RS(WORD,8),4)
      BITCO0=BITCO0+(BITTA0(HEX+1))
      HEX=RT(RS(WORD,4),4)
      BITCO0=BITCO0+(BITTA0(HEX+1))
      HEX=RT(WORD,4)
      BITCO0=BITCO0+BITTA0(HEX+1)
      RETURN
      END
      INTEGER FUNCTION OPENR0(FD,NAME)
      INTEGER FD
      INTEGER NAME(33)
      INTEGER BUF(32),NWR,CODE
      CALL DIR$RD(:2,FD,LOC(BUF),32,CODE)
10033   CALL DIR$RD(:1,FD,LOC(BUF),32,CODE)
        IF((CODE.EQ.0))GOTO 10034
          OPENR0=-3
          RETURN
10034 CONTINUE
      IF((AND(BUF(1),65280).EQ.256))GOTO 10035
      IF((AND(BUF(1),65280).EQ.512))GOTO 10035
      GOTO 10033
10035 CONTINUE
      CALL PTOC(BUF(2),160,NAME,33)
      CALL MAPSTR(NAME,1)
      CALL SRCH$$(:1+:40000,BUF(2),32,OPENR0,NWR,CODE)
      IF((CODE.EQ.0))GOTO 10036
        OPENR0=-3
10036 RETURN
      END
      INTEGER FUNCTION READR0(FD,BUF)
      INTEGER FD,BUF(8808)
      INTEGER NWR,CODE
      CALL PRWF$$(1,FD,LOC(BUF),8808,INTL(0),NWR,CODE)
      IF((CODE.EQ.0))GOTO 10037
      IF((CODE.EQ.1))GOTO 10037
        READR0=-3
        GOTO 10038
10037   READR0=NWR
10038 RETURN
      END
C ---- Long Name Map ----
C readrat                        readr0
C bitcount                       bitco0
C ratname                        ratna0
C numberofrecords                numbe0
C ratlength                      ratle0
C bittable                       bitta0
C percentfull                    perce0
C docurrentdisk                  docur0
C totalrecs                      total0
C openrat                        openr0