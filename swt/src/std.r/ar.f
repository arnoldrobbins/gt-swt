      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER A$BUF(200)
      INTEGER ANAME(102)
      INTEGER GETARG
      INTEGER USAGE(53)
      INTEGER PARSCL
      INTEGER AAAAA0(15)
      INTEGER AAAAB0(20)
      DATA USAGE/213,243,225,231,229,186,160,225,242,160,173,168,225,219
     *,228,221,252,228,252,240,252,244,252,245,219,228,221,252,248,169,2
     *19,246,221,160,188,225,242,227,232,233,246,229,190,160,251,188,230
     *,233,236,229,190,253,0/
      DATA AAAAA0/225,228,240,244,245,248,246,160,238,188,233,231,238,19
     *0,0/
      DATA AAAAB0/225,242,227,232,233,246,229,160,238,239,244,160,225,23
     *6,244,229,242,229,228,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR(USAGE)
10000 IF((GETARG(1,ANAME,102).NE.-1))GOTO 10001
        CALL ERROR(USAGE)
10001 CALL DELARG(1)
      ERRCN0=0
      CALL GETFNS
      IF((ERRCN0.EQ.0))GOTO 10002
        CALL ERROR(AAAAB0)
10002 GOTO 10003
10004   IF((A$BUF(240-225+1).NE.0))GOTO 10006
        IF((A$BUF(244-225+1).NE.0))GOTO 10006
        IF((A$BUF(245-225+1).NE.0))GOTO 10006
        IF((A$BUF(248-225+1).NE.0))GOTO 10006
        GOTO 10005
10006     CALL ERROR(USAGE)
10005   CALL APPEND(ANAME,(A$BUF(228-225+1).NE.0),(A$BUF(246-225+1).NE.0
     *))
      GOTO 10007
10008   IF((A$BUF(228-225+1).NE.0))GOTO 10010
        IF((A$BUF(240-225+1).NE.0))GOTO 10010
        IF((A$BUF(245-225+1).NE.0))GOTO 10010
        IF((A$BUF(248-225+1).NE.0))GOTO 10010
        GOTO 10009
10010     CALL ERROR(USAGE)
10009   CALL TABLE(ANAME,(A$BUF(246-225+1).NE.0))
      GOTO 10007
10011   IF((A$BUF(228-225+1).NE.0))GOTO 10013
        IF((A$BUF(245-225+1).NE.0))GOTO 10013
        IF((A$BUF(248-225+1).NE.0))GOTO 10013
        GOTO 10012
10013     CALL ERROR(USAGE)
10012   CALL EXTRA0(ANAME,240,(A$BUF(246-225+1).NE.0))
      GOTO 10007
10014   IF((A$BUF(248-225+1).EQ.0))GOTO 10015
          CALL ERROR(USAGE)
10015   CALL UPDATE(ANAME,(A$BUF(228-225+1).NE.0),(A$BUF(246-225+1).NE.0
     *))
      GOTO 10007
10016   IF((A$BUF(248-225+1).EQ.0))GOTO 10017
          CALL ERROR(USAGE)
10017   CALL DELETE(ANAME,(A$BUF(246-225+1).NE.0))
      GOTO 10007
10018   CALL EXTRA0(ANAME,248,(A$BUF(246-225+1).NE.0))
      GOTO 10007
10003 IF((A$BUF(225-225+1).NE.0))GOTO 10004
      IF((A$BUF(244-225+1).NE.0))GOTO 10008
      IF((A$BUF(240-225+1).NE.0))GOTO 10011
      IF((A$BUF(245-225+1).NE.0))GOTO 10014
      IF((A$BUF(228-225+1).NE.0))GOTO 10016
      IF((A$BUF(248-225+1).NE.0))GOTO 10018
        CALL ERROR(USAGE)
10007 CALL SWT
      END
      INTEGER * 4 FUNCTION ACOPY(IFD,OFD,SIZE)
      INTEGER IFD,OFD
      INTEGER * 4 SIZE
      INTEGER BUF(2048),LEN
      INTEGER READF
      INTEGER * 4 I,LIM
      LIM=SIZE-2048
      I=0
      GOTO 10021
10019 I=I+(LEN)
10021 IF((I.GT.LIM))GOTO 10020
        LEN=READF(BUF,2048,IFD)
        IF((LEN.LE.0))GOTO 10022
          CALL WRITEF(BUF,LEN,OFD)
          GOTO 10023
10022     ACOPY=I
          RETURN
10023 GOTO 10019
10020 IF((SIZE-I.LE.0))GOTO 10024
        LEN=READF(BUF,INTS(SIZE-I),IFD)
        IF((LEN.LE.0))GOTO 10025
          CALL WRITEF(BUF,LEN,OFD)
          I=I+(LEN)
10025 CONTINUE
10024 ACOPY=I
      RETURN
      END
      SUBROUTINE ADDFIL(NAME,AFD,ERRCNT)
      INTEGER NAME(1)
      INTEGER AFD
      INTEGER ERRCNT
      INTEGER * 4 SIZE
      INTEGER * 4 FSIZE
      INTEGER HEAD(192)
      INTEGER NFD
      INTEGER OPEN
      INTEGER AAAAC0(16)
      DATA AAAAC0/170,243,186,160,227,225,238,167,244,160,225,228,228,17
     *0,238,0/
      NFD=OPEN(NAME,1)
      IF((NFD.NE.-3))GOTO 10026
        CALL PRINT(-15,AAAAC0,NAME)
        ERRCNT=ERRCNT+(1)
10026 IF((ERRCNT.NE.0))GOTO 10027
        SIZE=FSIZE(NFD)
        CALL MAKHDR(NAME,SIZE,HEAD)
        CALL PUTLIN(HEAD,AFD)
        CALL FLUSH$(AFD)
        CALL FCOPY(NFD,AFD)
10027 CALL CLOSE(NFD)
      RETURN
      END
      SUBROUTINE AMOVE(NAME1,NAME2)
      INTEGER NAME1(1),NAME2(1)
      INTEGER CREATE,OPEN
      INTEGER FD1,FD2
      INTEGER AAAAD0(32)
      INTEGER AAAAE0(1)
      DATA AAAAD0/227,225,238,167,244,160,242,229,240,236,225,227,229,16
     *0,225,242,227,232,233,246,229,160,247,233,244,232,160,170,243,170,
     *238,0/
      DATA AAAAE0/0/
      FD1=OPEN(NAME1,1)
      IF((FD1.EQ.-3))GOTO 10028
        FD2=CREATE(NAME2,2)
10028 IF((FD1.EQ.-3))GOTO 10030
      IF((FD2.EQ.-3))GOTO 10030
      GOTO 10029
10030   CALL PRINT(-15,AAAAD0,NAME1)
        CALL ERROR(AAAAE0)
10029 CALL FCOPY(FD1,FD2)
      CALL CLOSE(FD1)
      CALL CLOSE(FD2)
      CALL REMOVE(NAME1)
      RETURN
      END
      SUBROUTINE APPEND(ANAME,REMOPT,VERBO0)
      INTEGER ANAME(1)
      LOGICAL REMOPT,VERBO0
      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER FILARG,GETHDR,REMOVE
      INTEGER I
      INTEGER * 4 SIZE
      INTEGER AFD
      INTEGER OPEN
      INTEGER HEAD(192),NAME(128)
      INTEGER AAAAF0(25)
      INTEGER AAAAG0(5)
      INTEGER AAAAH0(20)
      INTEGER AAAAI0(19)
      DATA AAAAF0/170,243,186,160,225,236,242,229,225,228,249,160,233,23
     *8,160,225,242,227,232,233,246,229,170,238,0/
      DATA AAAAG0/170,243,170,238,0/
      DATA AAAAH0/225,242,227,232,233,246,229,160,238,239,244,160,225,23
     *6,244,229,242,229,228,0/
      DATA AAAAI0/170,243,186,160,227,225,238,167,244,160,242,229,237,23
     *9,246,229,170,238,0/
      IF((NFILE0.GT.0))GOTO 10031
        RETURN
10031 AFD=OPEN(ANAME,3)
      IF((AFD.NE.-3))GOTO 10032
        CALL CANT(ANAME)
10032 CONTINUE
10033 IF((GETHDR(AFD,HEAD,NAME,SIZE).EQ.-1))GOTO 10034
        IF((FILARG(NAME).NE.1))GOTO 10035
          CALL PRINT(-15,AAAAF0,NAME)
          ERRCN0=ERRCN0+(1)
10035   CALL FSKIP(AFD,SIZE)
      GOTO 10033
10034 DO 10036 I=1,NFILE0
        IF((FSTAT0(I).NE.0))GOTO 10038
          IF((.NOT.VERBO0))GOTO 10039
            CALL PRINT(-11,AAAAG0,FNAME0(1,I))
10039     CALL ADDFIL(FNAME0(1,I),AFD,ERRCN0)
10038   CONTINUE
10036 CONTINUE
10037 CALL CLOSE(AFD)
      IF((ERRCN0.EQ.0))GOTO 10040
        CALL ERROR(AAAAH0)
        GOTO 10041
10040   IF((.NOT.REMOPT))GOTO 10042
          DO 10043 I=1,NFILE0
            IF((REMOVE(FNAME0(1,I)).NE.-3))GOTO 10045
              CALL PRINT(-15,AAAAI0,FNAME0(1,I))
10045       CONTINUE
10043     CONTINUE
10044   CONTINUE
10042 CONTINUE
10041 RETURN
      END
      SUBROUTINE DELETE(ANAME,VERBO0)
      INTEGER ANAME(1)
      LOGICAL VERBO0
      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER AFD,TFD
      INTEGER CREATE,OPEN
      INTEGER TNAME(14)
      INTEGER AAAAJ0(20)
      INTEGER AAAAK0(20)
      DATA TNAME/225,242,227,244,229,237,240,174,189,240,233,228,189,0/
      DATA AAAAJ0/228,229,236,229,244,229,160,226,249,160,238,225,237,22
     *9,160,239,238,236,249,0/
      DATA AAAAK0/225,242,227,232,233,246,229,160,238,239,244,160,225,23
     *6,244,229,242,229,228,0/
      IF((NFILE0.GT.0))GOTO 10046
        CALL ERROR(AAAAJ0)
10046 AFD=OPEN(ANAME,3)
      IF((AFD.NE.-3))GOTO 10047
        CALL CANT(ANAME)
10047 TFD=CREATE(TNAME,3)
      IF((TFD.NE.-3))GOTO 10048
        CALL CANT(TNAME)
10048 CALL REPLA0(AFD,TFD,228,VERBO0,ERRCN0)
      CALL CLOSE(AFD)
      CALL CLOSE(TFD)
      IF((ERRCN0.NE.0))GOTO 10049
        CALL NOTFO0
10049 IF((ERRCN0.NE.0))GOTO 10050
        CALL AMOVE(TNAME,ANAME)
        GOTO 10051
10050   CALL REMOVE(TNAME)
        CALL ERROR(AAAAK0)
10051 RETURN
      END
      SUBROUTINE EXTRA0(ANAME,CMD,VERBO0)
      INTEGER ANAME(1),CMD
      LOGICAL VERBO0
      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER ENAME(128),HEAD(192)
      INTEGER AFD,EFD
      INTEGER OPEN,CREATE,MKTEMP
      INTEGER FILARG,GETHDR,ISATTY
      INTEGER * 4 SIZE
      INTEGER * 4 ACOPY
      INTEGER AAAAL0(5)
      INTEGER AAAAM0(19)
      INTEGER AAAAN0(14)
      DATA AAAAL0/170,243,170,238,0/
      DATA AAAAM0/170,243,186,160,227,225,238,167,244,160,227,242,229,22
     *5,244,229,170,238,0/
      DATA AAAAN0/240,242,229,237,225,244,245,242,229,160,197,207,198,0/
      AFD=OPEN(ANAME,1)
      IF((AFD.NE.-3))GOTO 10052
        CALL CANT(ANAME)
10052 IF((CMD.NE.240))GOTO 10053
        IF((ISATTY(-11).NE.1))GOTO 10054
          EFD=MKTEMP(3)
          IF((EFD.NE.-3))GOTO 10055
            CALL ERROR('can''t open temporary file for extraction.')
10055     GOTO 10056
10054     EFD=-11
10056 CONTINUE
10053 CONTINUE
10057 IF((GETHDR(AFD,HEAD,ENAME,SIZE).EQ.-1))GOTO 10058
        IF((FILARG(ENAME).NE.0))GOTO 10059
          CALL FSKIP(AFD,SIZE)
          GOTO 10060
10059     IF((.NOT.VERBO0))GOTO 10061
            CALL PRINT(-11,AAAAL0,ENAME)
10061     IF((CMD.EQ.240))GOTO 10062
            EFD=CREATE(ENAME,2)
10062     IF((EFD.NE.-3))GOTO 10063
            CALL PRINT(-15,AAAAM0,ENAME)
            ERRCN0=ERRCN0+(1)
            CALL FSKIP(AFD,SIZE)
            GOTO 10064
10063       IF((ACOPY(AFD,EFD,SIZE).EQ.SIZE))GOTO 10065
              ERRCN0=ERRCN0+(1)
              CALL REMARK(AAAAN0)
10065       IF((CMD.EQ.240))GOTO 10066
              CALL CLOSE(EFD)
10066     CONTINUE
10064   CONTINUE
10060 GOTO 10057
10058 IF((CMD.NE.240))GOTO 10067
      IF((ISATTY(-11).NE.1))GOTO 10067
        CALL REWIND(EFD)
        CALL FCOPY(EFD,-11)
        CALL RMTEMP(EFD)
10067 IF((ERRCN0.NE.0))GOTO 10068
        CALL NOTFO0
10068 RETURN
      END
      INTEGER FUNCTION FILARG(NAME)
      INTEGER NAME(1)
      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER I
      INTEGER EQUAL
      IF((NFILE0.GT.0))GOTO 10069
        FILARG=1
        RETURN
10069 DO 10070 I=1,NFILE0
        IF((EQUAL(NAME,FNAME0(1,I)).NE.1))GOTO 10072
          FSTAT0(I)=1
          FILARG=1
          RETURN
10072   CONTINUE
10070 CONTINUE
10071 FILARG=0
      RETURN
      END
      INTEGER * 4 FUNCTION FSIZE(FD)
      INTEGER FD
      INTEGER * 4 MARKF
      CALL WIND(FD)
      FSIZE=MARKF(FD)
      CALL REWIND(FD)
      RETURN
      END
      SUBROUTINE FSKIP(FD,N)
      INTEGER FD
      INTEGER * 4 N
      CALL SEEKF(N,FD,1)
      RETURN
      END
      SUBROUTINE GETFNS
      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER JUNK(128)
      INTEGER I,J,STATE(4)
      INTEGER EQUAL,GFNARG,GETARG
      INTEGER AAAAO0(39)
      INTEGER AAAAP0(26)
      DATA AAAAO0/227,225,238,167,244,160,232,225,238,228,236,229,160,23
     *7,239,242,229,160,244,232,225,238,160,170,233,160,230,233,236,229,
     *160,238,225,237,229,243,170,238,0/
      DATA AAAAP0/170,243,186,160,228,245,240,236,233,227,225,244,229,16
     *0,230,233,236,229,160,238,225,237,229,170,238,0/
      IF((GETARG(1,JUNK,1).NE.-1))GOTO 10073
        NFILE0=0
        RETURN
10073 STATE(1)=1
      I=1
      GOTO 10076
10074 I=I+(1)
10076 IF((I.GT.256))GOTO 10075
        FSTAT0(I)=0
        IF((GFNARG(FNAME0(1,I),STATE).NE.-1))GOTO 10077
          GOTO 10075
10077 GOTO 10074
10075 IF((I.LE.256))GOTO 10078
      IF((GFNARG(JUNK,STATE).EQ.-1))GOTO 10078
        CALL PRINT(-15,AAAAO0,256)
        ERRCN0=ERRCN0+(1)
10078 NFILE0=I-1
      I=1
      GOTO 10081
10079 I=I+(1)
10081 IF((I.GE.NFILE0))GOTO 10080
        J=I+1
        GOTO 10084
10082   J=J+(1)
10084   IF((J.GT.NFILE0))GOTO 10083
          IF((EQUAL(FNAME0(1,I),FNAME0(1,J)).NE.1))GOTO 10085
            CALL PRINT(-15,AAAAP0,FNAME0(1,I))
            ERRCN0=ERRCN0+(1)
10085   GOTO 10082
10083 GOTO 10079
10080 RETURN
      END
      INTEGER FUNCTION GETHDR(FD,HEAD,NAME,SIZE)
      INTEGER FD
      INTEGER HEAD(192),NAME(128)
      INTEGER * 4 SIZE
      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER TEMP(128)
      INTEGER I,LEN
      INTEGER EQUAL,GETLIN,GETWRD
      INTEGER * 4 CTOL
      INTEGER HDR(6)
      INTEGER AAAAQ0(6)
      INTEGER AAAAR0(29)
      INTEGER AAAAS0(6)
      DATA HDR/163,200,196,163,186,0/
      DATA AAAAQ0/163,163,163,200,186,0/
      DATA AAAAR0/225,242,227,232,233,246,229,160,238,239,244,160,233,23
     *8,160,240,242,239,240,229,242,160,230,239,242,237,225,244,0/
      DATA AAAAS0/163,163,163,200,186,0/
      IF((GETLIN(HEAD,FD,192).NE.-1))GOTO 10086
        GETHDR=-1
        RETURN
10086 I=1
      LEN=GETWRD(HEAD,I,TEMP,128)
      IF((EQUAL(TEMP,HDR).NE.0))GOTO 10087
      IF((EQUAL(TEMP,AAAAQ0).NE.0))GOTO 10087
        CALL REMARK(AAAAR0)
        ERRCN0=ERRCN0+(1)
        GETHDR=-1
        RETURN
10087 IF((EQUAL(TEMP,AAAAS0).NE.1))GOTO 10088
        CALL CONVE0(HEAD)
10088 CALL GETWRD(HEAD,I,NAME,128)
      SIZE=CTOL(HEAD,I)
      GETHDR=-2
      RETURN
      END
      INTEGER FUNCTION GETWRD(IN,I,OUT,MAX)
      INTEGER IN(1),OUT(1)
      INTEGER I,MAX
      INTEGER J
10089 IF((IN(I).NE.160))GOTO 10090
        I=I+(1)
      GOTO 10089
10090 J=1
10091 IF((IN(I).EQ.0))GOTO 10092
      IF((IN(I).EQ.160))GOTO 10092
      IF((IN(I).EQ.138))GOTO 10092
        IF((J.LT.MAX))GOTO 10093
          GOTO 10092
10093   OUT(J)=IN(I)
        I=I+(1)
        J=J+(1)
      GOTO 10091
10092 OUT(J)=0
      GETWRD=J-1
      RETURN
      END
      SUBROUTINE GETDA0(SDATE)
      INTEGER SDATE(12)
      INTEGER MONTH,I
      INTEGER CTOI
      INTEGER MMDDYY(9)
      INTEGER SPOS(13)
      INTEGER SMON(48)
      INTEGER AAAAT0(15)
      DATA SMON/202,225,238,0,198,229,226,0,205,225,242,0,193,240,242,0,
     *205,225,249,0,202,245,238,0,202,245,236,0,193,245,231,0,211,229,24
     *0,0,207,227,244,0,206,239,246,0,196,229,227,0/
      DATA SPOS/12,1,5,9,13,17,21,25,29,33,37,41,45/
      DATA AAAAT0/170,243,173,170,172,178,243,173,177,185,170,172,178,24
     *3,0/
      CALL DATE(1,MMDDYY)
      I=1
      MONTH=CTOI(MMDDYY,I)
      CALL ENCODE(SDATE,12,AAAAT0,SMON(SPOS(MONTH+1)),MMDDYY(4),MMDDYY(7
     *))
      RETURN
      END
      SUBROUTINE MAKHDR(NAME,SIZE,HEAD)
      INTEGER NAME(128),HEAD(192)
      INTEGER * 4 SIZE
      INTEGER DAT(12),TIM(9)
      INTEGER HDR(6)
      INTEGER AAAAU0(20)
      DATA HDR/163,200,196,163,186,0/
      DATA AAAAU0/170,243,160,170,243,160,160,170,236,160,160,170,243,16
     *0,160,170,243,170,238,0/
      CALL GETDA0(DAT)
      CALL DATE(2,TIM)
      CALL ENCODE(HEAD,192,AAAAU0,HDR,NAME,SIZE,DAT,TIM)
      RETURN
      END
      SUBROUTINE NOTFO0
      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER I
      INTEGER AAAAV0(21)
      DATA AAAAV0/170,243,186,160,238,239,244,160,233,238,160,225,242,22
     *7,232,233,246,229,170,238,0/
      I=1
      GOTO 10096
10094 I=I+(1)
10096 IF((I.GT.NFILE0))GOTO 10095
        IF((FSTAT0(I).NE.0))GOTO 10097
          CALL PRINT(-15,AAAAV0,FNAME0(1,I))
          ERRCN0=ERRCN0+(1)
10097 GOTO 10094
10095 RETURN
      END
      SUBROUTINE REPLA0(AFD,TFD,CMD,VERBO0,ERRCNT)
      INTEGER AFD,TFD
      INTEGER CMD
      LOGICAL VERBO0
      INTEGER ERRCNT
      INTEGER HEAD(192),NAME(128)
      INTEGER FILARG,GETHDR
      INTEGER * 4 SIZE
      INTEGER * 4 ACOPY
      INTEGER TFD
      INTEGER AAAAW0(5)
      INTEGER AAAAX0(14)
      DATA AAAAW0/170,243,170,238,0/
      DATA AAAAX0/240,242,229,237,225,244,245,242,229,160,197,207,198,0/
10098 IF((GETHDR(AFD,HEAD,NAME,SIZE).EQ.-1))GOTO 10099
        IF((FILARG(NAME).NE.1))GOTO 10100
          IF((.NOT.VERBO0))GOTO 10101
            CALL PRINT(-11,AAAAW0,NAME)
10101     IF((CMD.NE.245))GOTO 10102
            CALL ADDFIL(NAME,TFD,ERRCNT)
10102     CALL FSKIP(AFD,SIZE)
          GOTO 10103
10100     CALL PUTLIN(HEAD,TFD)
          IF((ACOPY(AFD,TFD,SIZE).EQ.SIZE))GOTO 10104
            ERRCNT=ERRCNT+(1)
            CALL REMARK(AAAAX0)
10104   CONTINUE
10103 GOTO 10098
10099 RETURN
      END
      SUBROUTINE TABLE(ANAME,VERBO0)
      INTEGER ANAME(1)
      LOGICAL VERBO0
      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER HEAD(192),NAME(128)
      INTEGER FILARG,GETHDR
      INTEGER * 4 SIZE
      INTEGER AFD
      INTEGER OPEN
      AFD=OPEN(ANAME,1)
      IF((AFD.NE.-3))GOTO 10105
        CALL CANT(ANAME)
10105 CONTINUE
10106 IF((GETHDR(AFD,HEAD,NAME,SIZE).EQ.-1))GOTO 10107
        IF((FILARG(NAME).NE.1))GOTO 10108
          CALL TPRINT(HEAD,VERBO0)
10108   CALL FSKIP(AFD,SIZE)
      GOTO 10106
10107 IF((ERRCN0.NE.0))GOTO 10109
        CALL NOTFO0
10109 RETURN
      END
      SUBROUTINE TPRINT(BUF,VERBO0)
      INTEGER BUF(1)
      LOGICAL VERBO0
      INTEGER I
      INTEGER NAME(128),SIZE(12),DATE(12),TIME(9)
      INTEGER AAAAY0(5)
      INTEGER AAAAZ0(16)
      DATA AAAAY0/170,243,170,238,0/
      DATA AAAAZ0/170,243,160,170,243,160,170,173,182,243,160,170,243,17
     *0,238,0/
      I=1
      CALL GETWRD(BUF,I,NAME,128)
      CALL GETWRD(BUF,I,NAME,128)
      IF(VERBO0)GOTO 10110
        CALL PRINT(-11,AAAAY0,NAME)
        GOTO 10111
10110   CALL GETWRD(BUF,I,SIZE,12)
        CALL GETWRD(BUF,I,DATE,12)
        CALL GETWRD(BUF,I,TIME,9)
        CALL PRINT(-11,AAAAZ0,DATE,TIME,SIZE,NAME)
10111 RETURN
      END
      SUBROUTINE UPDATE(ANAME,REMOPT,VERBO0)
      INTEGER ANAME(1)
      LOGICAL REMOPT,VERBO0
      COMMON /ARCOM/FNAME0(128,256),FSTAT0(256),NFILE0,ERRCN0
      INTEGER FNAME0
      INTEGER FSTAT0,NFILE0,ERRCN0
      INTEGER I
      INTEGER REMOVE
      INTEGER AFD,TFD
      INTEGER OPEN,CREATE
      INTEGER TNAME(14)
      INTEGER AAABA0(5)
      INTEGER AAABB0(19)
      INTEGER AAABC0(20)
      DATA TNAME/225,242,227,244,229,237,240,174,189,240,233,228,189,0/
      DATA AAABA0/170,243,170,238,0/
      DATA AAABB0/170,243,186,160,227,225,238,167,244,160,242,229,237,23
     *9,246,229,170,238,0/
      DATA AAABC0/225,242,227,232,233,246,229,160,238,239,244,160,225,23
     *6,244,229,242,229,228,0/
      AFD=OPEN(ANAME,3)
      IF((AFD.NE.-3))GOTO 10112
        AFD=CREATE(ANAME,3)
10112 IF((AFD.NE.-3))GOTO 10113
        CALL CANT(ANAME)
10113 TFD=CREATE(TNAME,3)
      IF((TFD.NE.-3))GOTO 10114
        CALL CANT(TNAME)
10114 CALL REPLA0(AFD,TFD,245,VERBO0,ERRCN0)
      I=1
      GOTO 10117
10115 I=I+(1)
10117 IF((I.GT.NFILE0))GOTO 10116
        IF((FSTAT0(I).NE.0))GOTO 10118
          IF((.NOT.VERBO0))GOTO 10119
            CALL PRINT(-11,AAABA0,FNAME0(1,I))
10119     CALL ADDFIL(FNAME0(1,I),TFD,ERRCN0)
          FSTAT0(I)=1
10118 GOTO 10115
10116 CALL CLOSE(AFD)
      CALL CLOSE(TFD)
      IF((ERRCN0.NE.0))GOTO 10120
        CALL AMOVE(TNAME,ANAME)
        IF((.NOT.REMOPT))GOTO 10121
          I=1
          GOTO 10124
10122     I=I+(1)
10124     IF((I.GT.NFILE0))GOTO 10123
            IF((REMOVE(FNAME0(1,I)).NE.-3))GOTO 10125
              CALL PRINT(-15,AAABB0,FNAME0(1,I))
10125     GOTO 10122
10123   CONTINUE
10121   GOTO 10126
10120   CALL REMOVE(TNAME)
        CALL ERROR(AAABC0)
10126 RETURN
      END
      SUBROUTINE CONVE0(HEAD)
      INTEGER HEAD(192)
      INTEGER I
      INTEGER GETWRD
      INTEGER NAME(128),SIZE(12),MON(4),DAY(3),YEAR(5),TIME(9)
      INTEGER FLAG(6)
      INTEGER AAABD0(26)
      DATA FLAG/163,200,196,163,186,0/
      DATA AAABD0/170,243,160,170,243,160,160,170,243,160,160,170,243,17
     *3,170,243,173,170,243,160,160,170,243,170,238,0/
      I=1
      CALL GETWRD(HEAD,I,NAME,128)
      CALL GETWRD(HEAD,I,NAME,128)
      CALL GETWRD(HEAD,I,SIZE,12)
      CALL GETWRD(HEAD,I,MON,4)
      CALL GETWRD(HEAD,I,DAY,3)
      CALL GETWRD(HEAD,I,YEAR,5)
      CALL GETWRD(HEAD,I,TIME,9)
      CALL ENCODE(HEAD,192,AAABD0,FLAG,NAME,SIZE,MON,DAY,YEAR,TIME)
      RETURN
      END
C ---- Long Name Map ----
C Nfiles                         nfile0
C Fname                          fname0
C notfound                       notfo0
C Errcnt                         errcn0
C verbose                        verbo0
C extract                        extra0
C Fstat                          fstat0
C replace                        repla0
C getdate                        getda0
C convertheader                  conve0