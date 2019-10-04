      INTEGER EFAAA0,SFAAA0,PFAAA0
      INTEGER ELAAA0,SLAAA0,PLAAA0,INDEN0
      COMMON /INTCOM/EFAAA0,SFAAA0,PFAAA0,ELAAA0,SLAAA0,PLAAA0,INDEN0
      INTEGER FILE(102),ARG(102)
      INTEGER GETARG
      INTEGER OPEN
      INTEGER AAAAA0(7)
      INTEGER AAAAB0(7)
      INTEGER AAAAC0(7)
      DATA AAAAA0/170,243,174,227,244,177,0/
      DATA AAAAB0/170,243,174,227,244,178,0/
      DATA AAAAC0/170,243,174,227,244,179,0/
      IF((GETARG(1,ARG,102).EQ.-1))GOTO 10001
      IF((GETARG(2,FILE,102).NE.-1))GOTO 10001
      GOTO 10000
10001   CALL ERROR('usage:  interp filename_prefix.')
10000 CALL ENCODE(FILE,102,AAAAA0,ARG)
      EFAAA0=OPEN(FILE,1)
      IF((EFAAA0.NE.-3))GOTO 10002
        CALL PRINT(-15,'interp:  can''t open *s*n.',FILE)
        CALL SWT
10002 ELAAA0=1
      CALL ENCODE(FILE,102,AAAAB0,ARG)
      SFAAA0=OPEN(FILE,1)
      IF((SFAAA0.NE.-3))GOTO 10003
        CALL PRINT(-15,'interp:  can''t open *s*n.',FILE)
        CALL SWT
10003 SLAAA0=1
      CALL ENCODE(FILE,102,AAAAC0,ARG)
      PFAAA0=OPEN(FILE,1)
      IF((PFAAA0.NE.-3))GOTO 10004
        CALL PRINT(-15,'interp:  can''t open *s*n.',FILE)
        CALL SWT
10004 PLAAA0=1
      CALL DISPL0
      CALL SWT
      END
      SUBROUTINE DISPL0
      INTEGER EFAAA0,SFAAA0,PFAAA0
      INTEGER ELAAA0,SLAAA0,PLAAA0,INDEN0
      COMMON /INTCOM/EFAAA0,SFAAA0,PFAAA0,ELAAA0,SLAAA0,PLAAA0,INDEN0
      INTEGER MODNUM,VAL
      INTEGER GET
      INTEGER AAAAD0(34)
      INTEGER AAAAE0(18)
      INTEGER AAAAF0(31)
      INTEGER AAAAG0(29)
      DATA AAAAD0/170,238,170,238,163,163,163,163,163,163,160,160,205,23
     *9,228,245,236,229,160,170,233,160,160,163,163,163,163,163,163,170,
     *238,170,238,0/
      DATA AAAAE0/197,238,244,242,249,160,208,239,233,238,244,243,186,17
     *0,238,170,238,0/
      DATA AAAAF0/170,238,211,244,225,244,233,227,160,196,225,244,225,16
     *0,196,229,230,233,238,233,244,233,239,238,243,186,170,238,170,238,
     *0/
      DATA AAAAG0/170,238,208,242,239,227,229,228,245,242,229,160,196,22
     *9,230,233,238,233,244,233,239,238,243,186,170,238,170,238,0/
      MODNUM=1
      GOTO 10007
10005 MODNUM=MODNUM+(1)
10007 IF((GET(VAL,EFAAA0,ELAAA0).EQ.-1))GOTO 10006
      IF((VAL.EQ.39))GOTO 10006
        CALL PRINT(-11,AAAAD0,MODNUM)
        IF((VAL.EQ.32))GOTO 10008
          CALL ERRMSG('missing MODULE_OP in entry points.')
          CALL SKIPTO(32,EFAAA0,ELAAA0)
10008   IF((GET(VAL,SFAAA0,SLAAA0).EQ.-1))GOTO 10010
        IF((VAL.NE.32))GOTO 10010
        GOTO 10009
10010     CALL ERRMSG('missing MODULE_OP in static data.')
          CALL SKIPTO(32,SFAAA0,SLAAA0)
10009   IF((GET(VAL,PFAAA0,PLAAA0).EQ.-1))GOTO 10012
        IF((VAL.NE.32))GOTO 10012
        GOTO 10011
10012     CALL ERRMSG('missing MODULE_OP in procedures.')
          CALL SKIPTO(32,PFAAA0,PLAAA0)
10011   CALL PRINT(-11,AAAAE0)
        CALL DISPM0(EFAAA0,ELAAA0,VAL)
        IF((VAL.EQ.39))GOTO 10013
          CALL ERRMSG('missing NULL_OP in entry points.')
          CALL SKIPTO(39,EFAAA0,ELAAA0)
10013   CALL PRINT(-11,AAAAF0)
        CALL DISPM0(SFAAA0,SLAAA0,VAL)
        IF((VAL.EQ.39))GOTO 10014
          CALL ERRMSG('missing NULL_OP in static data.')
          CALL SKIPTO(39,SFAAA0,SLAAA0)
10014   CALL PRINT(-11,AAAAG0)
        CALL DISPM0(PFAAA0,PLAAA0,VAL)
        IF((VAL.EQ.39))GOTO 10015
          CALL ERRMSG('missing NULL_OP in procedures.')
          CALL SKIPTO(39,PFAAA0,PLAAA0)
10015 GOTO 10005
10006 IF((VAL.EQ.39))GOTO 10016
        CALL ERRMSG('missing NULL_OP at end of entry points.')
10016 IF((GET(VAL,SFAAA0,SLAAA0).EQ.-1))GOTO 10018
      IF((VAL.NE.39))GOTO 10018
      GOTO 10017
10018   CALL ERRMSG('missing NULL_OP at end of static data.')
10017 IF((GET(VAL,PFAAA0,PLAAA0).EQ.-1))GOTO 10020
      IF((VAL.NE.39))GOTO 10020
      GOTO 10019
10020   CALL ERRMSG('missing NULL_OP at end of procedures.')
10019 RETURN
      END
      SUBROUTINE DISPN0
      INTEGER EFAAA0,SFAAA0,PFAAA0
      INTEGER ELAAA0,SLAAA0,PLAAA0,INDEN0
      COMMON /INTCOM/EFAAA0,SFAAA0,PFAAA0,ELAAA0,SLAAA0,PLAAA0,INDEN0
      INTEGER OBJID
      INTEGER GET
      INTEGER NAME(102)
      INTEGER AAAAH0(21)
      DATA AAAAH0/239,226,234,229,227,244,160,233,228,160,170,233,172,16
     *0,167,170,243,167,170,238,0/
      IF((GET(OBJID,EFAAA0,ELAAA0).NE.-1))GOTO 10021
        CALL ERRMSG('missing object id in entry point declaration.')
        RETURN
10021 CALL GETST0(NAME,EFAAA0,ELAAA0)
      CALL PRINT(-11,AAAAH0,OBJID,NAME)
      RETURN
      END
      SUBROUTINE DISPO0(MODE)
      INTEGER MODE
      INTEGER AAAAI0
      INTEGER AAAAJ0(4)
      INTEGER AAAAK0(9)
      INTEGER AAAAL0(5)
      INTEGER AAAAM0(14)
      INTEGER AAAAN0(9)
      INTEGER AAAAO0(14)
      INTEGER AAAAP0(7)
      INTEGER AAAAQ0(13)
      DATA AAAAJ0/233,238,244,0/
      DATA AAAAK0/245,238,243,233,231,238,229,228,0/
      DATA AAAAL0/236,239,238,231,0/
      DATA AAAAM0/236,239,238,231,160,245,238,243,233,231,238,229,228,0/
      DATA AAAAN0/230,236,239,225,244,233,238,231,0/
      DATA AAAAO0/236,239,238,231,160,230,236,239,225,244,233,238,231,0/
      DATA AAAAP0/243,244,239,247,229,228,0/
      DATA AAAAQ0/245,238,235,238,239,247,238,160,168,170,233,169,0/
      AAAAI0=MODE
      GOTO 10022
10023   CALL PUTLIN(AAAAJ0,-11)
      GOTO 10024
10025   CALL PUTLIN(AAAAK0,-11)
      GOTO 10024
10026   CALL PUTLIN(AAAAL0,-11)
      GOTO 10024
10027   CALL PUTLIN(AAAAM0,-11)
      GOTO 10024
10028   CALL PUTLIN(AAAAN0,-11)
      GOTO 10024
10029   CALL PUTLIN(AAAAO0,-11)
      GOTO 10024
10030   CALL PUTLIN(AAAAP0,-11)
      GOTO 10024
10022 GOTO(10023,10026,10025,10027,10028,10029,10030),AAAAI0
        CALL PRINT(-11,AAAAQ0,MODE)
10024 RETURN
      END
      SUBROUTINE DISPM0(FILE,LINEN0,LAST)
      INTEGER FILE
      INTEGER LINEN0,LAST
      INTEGER EFAAA0,SFAAA0,PFAAA0
      INTEGER ELAAA0,SLAAA0,PLAAA0,INDEN0
      COMMON /INTCOM/EFAAA0,SFAAA0,PFAAA0,ELAAA0,SLAAA0,PLAAA0,INDEN0
      INTEGER GET
10031 IF((GET(LAST,FILE,LINEN0).EQ.-1))GOTO 10032
      IF((LAST.NE.59))GOTO 10032
        IF((FILE.NE.EFAAA0))GOTO 10033
          CALL DISPN0
          GOTO 10034
10033     IF((FILE.NE.SFAAA0))GOTO 10035
            CALL DISPP0
            GOTO 10036
10035       IF((FILE.NE.PFAAA0))GOTO 10037
              CALL DISPQ0
              GOTO 10038
10037         CALL ERROR('interp:  can''t possibly happen.')
10038     CONTINUE
10036   CONTINUE
10034 GOTO 10031
10032 RETURN
      END
      SUBROUTINE DISPR0(OP)
      INTEGER OP
      INTEGER POSN(73)
      INTEGER INFO(500)
      DATA INFO/225,228,228,225,225,0,225,228,228,0,225,238,228,225,225,
     *0,225,238,228,0,225,243,243,233,231,238,0,226,242,229,225,235,0,22
     *7,225,243,229,0,227,239,237,240,236,0,227,239,238,243,244,0,227,23
     *9,238,246,229,242,244,0,228,229,227,236,225,242,229,223,243,244,22
     *5,244,0,228,229,230,225,245,236,244,0,228,229,230,233,238,229,223,
     *228,249,238,237,0,228,229,230,233,238,229,223,243,244,225,244,0,22
     *8,229,242,229,230,0,228,233,246,225,225,0,228,233,246,0,228,239,22
     *3,236,239,239,240,0,229,241,0,230,239,242,223,236,239,239,240,0,23
     *1,229,0,231,239,244,239,0,231,244,0,233,230,0,233,238,228,229,248,
     *0,233,238,233,244,233,225,236,233,250,229,242,0,236,225,226,229,23
     *6,0,236,229,0,236,243,232,233,230,244,225,225,0,236,243,232,233,23
     *0,244,0,236,244,0,237,239,228,245,236,229,0,237,245,236,225,225,0,
     *237,245,236,0,238,229,231,0,238,229,248,244,0,238,229,0,238,239,24
     *4,0,238,245,236,236,0,239,226,234,229,227,244,0,239,242,225,225,0,
     *239,242,0,240,239,243,244,228,229,227,0,240,239,243,244,233,238,22
     *7,0,240,242,229,228,229,227,0,240,242,229,233,238,227,0,240,242,23
     *9,227,223,227,225,236,236,223,225,242,231,0,240,242,239,227,223,22
     *7,225,236,236,0,240,242,239,227,223,228,229,230,238,223,225,242,23
     *1,0,240,242,239,227,223,228,229,230,238,0,242,229,230,244,239,0,24
     *2,229,237,225,225,0,242,229,237,0,242,229,244,245,242,238,0,242,24
     *3,232,233,230,244,225,225,0,242,243,232,233,230,244,0,243,225,238,
     *228,0,243,229,236,229,227,244,0,243,229,241,0,243,239,242,0,243,24
     *5,226,225,225,0,243,245,226,0,243,247,233,244,227,232,0,245,238,22
     *8,229,230,233,238,229,223,228,249,238,237,0,247,232,233,236,229,22
     *3,236,239,239,240,0,248,239,242,225,225,0,248,239,242,0,250,229,24
     *2,239,223,233,238,233,244,233,225,236,233,250,229,242,0,230,233,22
     *9,236,228,0,227,232,229,227,235,223,242,225,238,231,229,0,227,232,
     *229,227,235,223,245,240,240,229,242,0,227,232,229,227,235,223,236,
     *239,247,229,242,0/
      DATA POSN/72,1,7,11,17,21,28,34,39,45,51,59,72,80,92,104,110,116,1
     *20,128,131,140,143,148,151,154,160,172,178,181,190,197,200,207,213
     *,217,221,226,229,233,238,245,250,253,261,269,276,283,297,307,321,3
     *31,337,343,347,354,363,370,375,382,386,390,396,400,407,421,432,438
     *,442,459,465,477,489/
      CALL PUTLIN(INFO(POSN(OP+1)),-11)
      RETURN
      END
      SUBROUTINE DISPQ0
      INTEGER EFAAA0,SFAAA0,PFAAA0
      INTEGER ELAAA0,SLAAA0,PLAAA0,INDEN0
      COMMON /INTCOM/EFAAA0,SFAAA0,PFAAA0,ELAAA0,SLAAA0,PLAAA0,INDEN0
      INTEGER PROCOP,OBJID,NARGS,LENGTH,VAL,MODE,DISP
      INTEGER GET
      INTEGER NAME(102)
      INTEGER AAAAR0(45)
      INTEGER AAAAS0(33)
      INTEGER AAAAT0(18)
      INTEGER AAAAU0(22)
      INTEGER AAAAV0(29)
      INTEGER AAAAW0(14)
      DATA AAAAR0/240,242,239,227,229,228,245,242,229,160,167,170,243,16
     *7,172,160,239,226,234,229,227,244,160,233,228,160,170,233,187,160,
     *170,233,160,225,242,231,245,237,229,238,244,243,170,238,0/
      DATA AAAAS0/160,160,160,225,242,231,245,237,229,238,244,172,160,23
     *9,226,234,229,227,244,160,233,228,160,170,233,172,160,237,239,228,
     *229,160,0/
      DATA AAAAT0/172,160,240,225,243,243,173,226,249,173,246,225,236,24
     *5,229,172,160,0/
      DATA AAAAU0/172,160,240,225,243,243,173,226,249,173,242,229,230,22
     *9,242,229,238,227,229,172,160,0/
      DATA AAAAV0/172,160,233,236,236,229,231,225,236,160,228,233,243,24
     *0,239,243,233,244,233,239,238,160,168,170,233,169,172,160,0/
      DATA AAAAW0/243,233,250,229,160,170,172,173,177,176,233,170,238,0/
      IF((GET(PROCOP,PFAAA0,PLAAA0).EQ.-1))GOTO 10040
      IF((PROCOP.NE.50))GOTO 10040
      GOTO 10039
10040   CALL ERRMSG('missing PROC_DEFN in procedure stream.')
        CALL SKIPTO(50,PFAAA0,PLAAA0)
10039 IF((GET(OBJID,PFAAA0,PLAAA0).NE.-1))GOTO 10041
        CALL ERRMSG('missing object id in procedure definition.')
        RETURN
10041 IF((GET(NARGS,PFAAA0,PLAAA0).NE.-1))GOTO 10042
        CALL ERRMSG('missing number-of-arguments in proc defn.')
        RETURN
10042 CALL GETST0(NAME,PFAAA0,PLAAA0)
      CALL PRINT(-11,AAAAR0,NAME,OBJID,NARGS)
10043 IF((GET(VAL,PFAAA0,PLAAA0).EQ.-1))GOTO 10044
      IF((VAL.NE.49))GOTO 10044
        IF((GET(OBJID,PFAAA0,PLAAA0).NE.-1))GOTO 10045
          CALL ERRMSG('missing argument object id number.')
          RETURN
10045   IF((GET(MODE,PFAAA0,PLAAA0).NE.-1))GOTO 10046
          CALL ERRMSG('missing argument data mode.')
          RETURN
10046   IF((GET(DISP,PFAAA0,PLAAA0).NE.-1))GOTO 10047
          CALL ERRMSG('missing argument disposition.')
          RETURN
10047   IF((GET(LENGTH,PFAAA0,PLAAA0).NE.-1))GOTO 10048
          CALL ERRMSG('missing argument length.')
          RETURN
10048   CALL PRINT(-11,AAAAS0,OBJID)
        CALL DISPO0(MODE)
        IF((DISP.NE.0))GOTO 10049
          CALL PRINT(-11,AAAAT0)
          GOTO 10050
10049     IF((DISP.NE.1))GOTO 10051
            CALL PRINT(-11,AAAAU0)
            GOTO 10052
10051       CALL PRINT(-11,AAAAV0,DISP)
10052   CONTINUE
10050   CALL PRINT(-11,AAAAW0,LENGTH)
      GOTO 10043
10044 IF((VAL.EQ.39))GOTO 10053
        CALL ERRMSG('missing NULL at end of procedure parameters.')
        RETURN
10053 INDEN0=0
      CALL DISPS0(PFAAA0,PLAAA0)
      RETURN
      END
      SUBROUTINE DISPP0
      INTEGER EFAAA0,SFAAA0,PFAAA0
      INTEGER ELAAA0,SLAAA0,PLAAA0,INDEN0
      COMMON /INTCOM/EFAAA0,SFAAA0,PFAAA0,ELAAA0,SLAAA0,PLAAA0,INDEN0
      INDEN0=0
      CALL DISPS0(SFAAA0,SLAAA0)
      RETURN
      END
      SUBROUTINE DISPS0(FILE,LINEN0)
      INTEGER FILE
      INTEGER LINEN0
      INTEGER EFAAA0,SFAAA0,PFAAA0
      INTEGER ELAAA0,SLAAA0,PLAAA0,INDEN0
      COMMON /INTCOM/EFAAA0,SFAAA0,PFAAA0,ELAAA0,SLAAA0,PLAAA0,INDEN0
      INTEGER POSN(73)
      INTEGER INFO(343)
      INTEGER OP,P,P2,SIZE,WORD,AVAL(4),I
      INTEGER GET
      INTEGER STR(102)
      SAVE STR
      INTEGER AAAAX0(5)
      INTEGER AAAAY0
      INTEGER AAAAZ0(16)
      INTEGER AAABA0(10)
      INTEGER AAABB0(11)
      INTEGER AAABC0(10)
      INTEGER AAABD0(9)
      INTEGER AAABE0
      INTEGER AAABF0(5)
      INTEGER AAABG0(7)
      INTEGER AAABH0(5)
      INTEGER AAABI0(9)
      INTEGER AAABJ0(5)
      INTEGER AAABK0(5)
      INTEGER AAABL0
      INTEGER AAABM0(5)
      INTEGER AAABN0(7)
      DATA INFO/1,6,3,3,0,2,6,3,3,0,3,6,3,3,0,4,6,3,3,0,5,6,3,3,1,0,6,1,
     *0,7,3,3,3,0,8,6,3,0,9,4,0,10,6,6,3,0,11,1,5,0,12,3,3,0,13,1,3,2,0,
     *14,1,3,2,0,15,6,3,0,16,6,3,3,0,17,6,3,3,0,18,3,3,0,19,6,3,3,0,20,3
     *,3,3,3,0,21,6,3,3,0,22,1,0,23,6,3,3,0,24,6,3,3,3,0,25,6,3,3,2,0,26
     *,6,3,3,0,27,1,0,28,6,3,3,0,29,6,3,3,0,30,6,3,3,0,31,6,3,3,0,32,4,0
     *,33,6,3,3,0,34,6,3,3,0,35,6,3,0,36,1,0,37,6,3,3,0,38,6,3,0,39,4,0,
     *40,6,1,0,41,6,3,3,0,42,6,3,3,0,43,6,3,3,0,44,6,3,3,0,45,6,3,3,0,46
     *,6,3,3,0,47,6,3,3,0,48,6,3,3,0,49,1,1,1,1,3,0,50,1,1,5,3,3,0,51,6,
     *3,0,52,6,3,3,0,53,6,3,3,0,54,3,0,55,6,3,3,0,56,6,3,3,0,57,6,3,3,0,
     *58,6,1,3,0,59,3,3,0,60,6,3,3,0,61,6,3,3,0,62,6,3,3,0,63,6,3,3,0,64
     *,1,0,65,3,3,0,66,6,3,3,0,67,6,3,3,0,68,2,3,0,69,6,1,1,3,0,70,6,3,3
     *,3,1,0,71,6,3,3,1,0,72,6,3,3,1,0/
      DATA POSN/72,1,6,11,16,21,27,30,35,39,42,47,51,55,60,65,69,74,79,8
     *3,88,94,99,102,107,113,119,124,127,132,137,142,147,150,155,160,164
     *,167,172,176,179,183,188,193,198,203,208,213,218,223,230,237,241,2
     *46,251,254,259,264,269,274,278,283,288,293,298,301,305,310,315,319
     *,325,332,338/
      DATA AAAAX0/170,233,170,238,0/
      DATA AAAAZ0/227,239,238,243,244,225,238,244,172,160,237,239,228,22
     *9,160,0/
      DATA AAABA0/172,160,243,233,250,229,160,170,233,0/
      DATA AAABB0/172,160,246,225,236,245,229,186,170,238,0/
      DATA AAABC0/170,172,173,184,172,176,233,170,238,0/
      DATA AAABD0/172,160,246,225,236,245,229,160,0/
      DATA AAABF0/170,233,170,238,0/
      DATA AAABG0/170,172,173,177,176,233,0/
      DATA AAABH0/170,236,170,238,0/
      DATA AAABI0/170,172,173,177,176,236,170,238,0/
      DATA AAABJ0/170,242,170,238,0/
      DATA AAABK0/170,228,170,238,0/
      DATA AAABM0/170,233,170,238,0/
      DATA AAABN0/167,170,243,167,170,238,0/
      IF((GET(OP,FILE,LINEN0).NE.-1))GOTO 10054
        CALL ERRMSG('premature end of tree.')
        RETURN
10054 IF((OP.LT.1))GOTO 10056
      IF((OP.GT.72))GOTO 10056
      GOTO 10055
10056   CALL PRINT(-15,AAAAX0,OP)
        CALL ERRMSG('bad operator in tree.')
        RETURN
10055 AAAAY0=OP
      GOTO 10057
10058   IF((GET(WORD,FILE,LINEN0).NE.-1))GOTO 10059
          CALL ERRMSG('premature end of tree.')
          RETURN
10059   CALL STEP
        CALL PRINT(-11,AAAAZ0)
        CALL DISPO0(WORD)
        IF((GET(SIZE,FILE,LINEN0).NE.-1))GOTO 10060
          CALL ERRMSG('premature end of tree.')
          RETURN
10060   CALL PRINT(-11,AAABA0,SIZE)
        IF((WORD.NE.7))GOTO 10061
          CALL PRINT(-11,AAABB0)
          INDEN0=INDEN0+(2)
          I=0
          GOTO 10064
10062     I=I+(1)
10064     IF((I.EQ.SIZE))GOTO 10063
            CALL STEP
            IF((GET(WORD,FILE,LINEN0).NE.-1))GOTO 10065
              CALL ERRMSG('premature end of tree.')
              RETURN
10065       CALL PRINT(-11,AAABC0,WORD)
          GOTO 10062
10063     INDEN0=INDEN0-(2)
          GOTO 10066
10061     CALL PRINT(-11,AAABD0)
          IF((SIZE.LT.1))GOTO 10068
          IF((SIZE.GT.4))GOTO 10068
          GOTO 10067
10068       CALL PUTCH(138,-15)
            CALL ERRMSG('bogus constant length.')
            RETURN
10067     I=1
          GOTO 10071
10069     I=I+(1)
10071     IF((I.GT.SIZE))GOTO 10070
            IF((GET(AVAL(I),FILE,LINEN0).NE.-1))GOTO 10072
              CALL ERRMSG('premature end of tree.')
              RETURN
10072     GOTO 10069
10070     AAABE0=WORD
          GOTO 10073
10074       CALL PRINT(-11,AAABF0,AVAL)
          GOTO 10075
10076       CALL PRINT(-11,AAABG0,AVAL)
          GOTO 10075
10077       CALL PRINT(-11,AAABH0,AVAL)
          GOTO 10075
10078       CALL PRINT(-11,AAABI0,AVAL)
          GOTO 10075
10079       CALL PRINT(-11,AAABJ0,AVAL)
          GOTO 10075
10080       CALL PRINT(-11,AAABK0,AVAL)
          GOTO 10075
10073     GOTO(10074,10077,10076,10078,10079,10080),AAABE0
10075   CONTINUE
10066   RETURN
10081   CALL STEP
        CALL DISPR0(39)
        CALL PUTCH(138,-11)
        RETURN
10082   CALL STEP
        CALL DISPR0(59)
        CALL PUTCH(138,-11)
        INDEN0=INDEN0+(2)
        CALL DISPS0(FILE,LINEN0)
        INDEN0=INDEN0-(2)
        CALL DISPS0(FILE,LINEN0)
        RETURN
10057 IF(AAAAY0.EQ.9)GOTO 10058
      IF(AAAAY0.EQ.39)GOTO 10081
      IF(AAAAY0.EQ.59)GOTO 10082
      P=POSN(OP+1)
      IF((INFO(P).EQ.OP))GOTO 10083
        CALL PRINT(-15,'interp:  table inconsistency at *i*n.',OP)
        CALL SWT
10083 CALL STEP
      CALL DISPR0(OP)
      CALL PUTCH(138,-11)
      INDEN0=INDEN0+(2)
      P2=P+1
      GOTO 10086
10084 P2=P2+(1)
10086 IF((INFO(P2).EQ.0))GOTO 10085
        AAABL0=INFO(P2)
        GOTO 10087
10088     IF((GET(WORD,FILE,LINEN0).NE.-1))GOTO 10089
            CALL ERRMSG('premature end of tree.')
            RETURN
10089     CALL STEP
          CALL PRINT(-11,AAABM0,WORD)
        GOTO 10090
10091     IF((GET(WORD,FILE,LINEN0).NE.-1))GOTO 10092
            CALL ERRMSG('premature end of tree.')
            RETURN
10092     CALL STEP
          CALL DISPO0(WORD)
          CALL PUTCH(138,-11)
        GOTO 10090
10093     CALL DISPS0(FILE,LINEN0)
        GOTO 10090
10094     CALL GETST0(STR,FILE,LINEN0)
          CALL STEP
          CALL PRINT(-11,AAABN0,STR)
        GOTO 10090
10087   GOTO(10088,10088,10093,10095,10094,10091),AAABL0
10095     CALL ERRMSG('bad table element in get_tree.')
10090 GOTO 10084
10085 INDEN0=INDEN0-(2)
      RETURN
      END
      SUBROUTINE ERRMSG(MSG)
      INTEGER MSG(1)
      INTEGER EFAAA0,SFAAA0,PFAAA0
      INTEGER ELAAA0,SLAAA0,PLAAA0,INDEN0
      COMMON /INTCOM/EFAAA0,SFAAA0,PFAAA0,ELAAA0,SLAAA0,PLAAA0,INDEN0
      CALL PRINT(-15,'interp *i/*i/*i: *p*n.',ELAAA0,SLAAA0,PLAAA0,MSG)
      RETURN
      END
      INTEGER FUNCTION GET(WORD,FILE,LINEN0)
      INTEGER WORD,LINEN0
      INTEGER FILE
      INTEGER READF
      IF((READF(WORD,1,FILE).NE.-1))GOTO 10096
        WORD=39+1
        GET=-1
        RETURN
10096 LINEN0=LINEN0+(1)
      GET=1
      RETURN
      END
      SUBROUTINE GETST0(STR,FILE,LINEN0)
      INTEGER STR(102)
      INTEGER FILE
      INTEGER LINEN0
      INTEGER LENGTH,I
      INTEGER GET
      IF((GET(LENGTH,FILE,LINEN0).NE.-1))GOTO 10097
        CALL ERRMSG('expected length of string.')
        STR(1)=0
        RETURN
10097 IF((LENGTH.LT.0))GOTO 10099
      IF((LENGTH.GT.102-1))GOTO 10099
      GOTO 10098
10099   CALL ERRMSG('unreasonable string length.')
        STR(1)=0
        RETURN
10098 I=1
      GOTO 10102
10100 I=I+(1)
10102 IF((I.GT.LENGTH))GOTO 10101
        IF((GET(STR(I),FILE,LINEN0).NE.-1))GOTO 10103
          CALL ERRMSG('bogus string length or premature end of module.')
          STR(I)=0
          RETURN
10103 GOTO 10100
10101 STR(I)=0
      RETURN
      END
      SUBROUTINE SKIPTO(OP,FILE,LINEN0)
      INTEGER OP,LINEN0
      INTEGER FILE
      INTEGER VAL
      INTEGER GET
10104 IF((GET(VAL,FILE,LINEN0).EQ.-1))GOTO 10105
      IF((VAL.EQ.OP))GOTO 10105
      GOTO 10104
10105 RETURN
      END
      SUBROUTINE STEP
      INTEGER EFAAA0,SFAAA0,PFAAA0
      INTEGER ELAAA0,SLAAA0,PLAAA0,INDEN0
      COMMON /INTCOM/EFAAA0,SFAAA0,PFAAA0,ELAAA0,SLAAA0,PLAAA0,INDEN0
      INTEGER BLANKS(102)
      INTEGER POS
      DATA BLANKS/101*160,0/
      POS=MIN0(INDEN0,60)
      CALL PUTLIN(BLANKS(102-POS),-11)
      RETURN
      END
C ---- Long Name Map ----
C Indent                         inden0
C El                             elaaa0
C displaymode                    dispo0
C Pf                             pfaaa0
C displayentrypoint              dispn0
C Sf                             sfaaa0
C Pl                             plaaa0
C displaymodule                  dispm0
C Sl                             slaaa0
C displaytree                    disps0
C display                        displ0
C linenum                        linen0
C displayop                      dispr0
C getstring                      getst0
C displayprocedure               dispq0
C displaystaticdatum             dispp0
C Ef                             efaaa0