      INTEGER RD(884)
      INTEGER I,L,FLAG,N,POS
      INTEGER * 4 IVAL
      REAL * 8 SUM,VALUE
      INTEGER ROW(500),RPN(200),CBUF(500)
      INTEGER BUF(102)
      INTEGER GETARG,LOADRD,GETROW,ISATTY,EVAL,PARSE,FINDF0
      INTEGER ARG(128),SUMMA0(128)
      INTEGER AAAAA0(20)
      INTEGER AAAAB0(4)
      DATA AAAAA0/170,228,160,239,246,229,242,160,170,233,160,246,225,23
     *6,245,229,243,170,238,0/
      DATA AAAAB0/176,170,238,0/
      IF((LOADRD(RD,-10).EQ.-2))GOTO 10000
        CALL ERROR('Cannot load input relation.')
10000 IF((GETARG(3,ARG,128).EQ.-1))GOTO 10001
        CALL ERROR('Usage: rdsum [<selection expr>] <attr>.')
10001 IF((GETARG(2,SUMMA0,128).EQ.-1))GOTO 10002
        FLAG=0
        I=GETARG(1,ARG,128)
        GOTO 10003
10002   IF((GETARG(1,SUMMA0,128).EQ.-1))GOTO 10004
          FLAG=1
          GOTO 10005
10004     CALL ERROR('Usage: rdsum [<selection expr>] <attr>.')
10005 CONTINUE
10003 POS=FINDF0(RD,SUMMA0)
      IF((POS.NE.0))GOTO 10006
        CALL ERROR('Domain not found.')
10006 IF((RD(POS).NE.3))GOTO 10007
        CALL ERROR('Strings can''t be averaged.')
10007 IF((FLAG.NE.0))GOTO 10008
        IF((PARSE(RD,0,ARG,RPN,CBUF).EQ.-2))GOTO 10009
          CALL SWT
10009 CONTINUE
10008 SUM=0
      N=0
10010 IF((GETROW(RD,-10,ROW).EQ.-1))GOTO 10011
        IF((FLAG.NE.0))GOTO 10012
          IF((EVAL(RD,ROW,RPN,CBUF).NE.1))GOTO 10013
            N=N+1
            IF((RD(POS).NE.1))GOTO 10014
              CALL GETDA0(RD,POS,ROW,IVAL)
              SUM=SUM+IVAL
10014       IF((RD(POS).NE.2))GOTO 10015
              CALL GETDA0(RD,POS,ROW,VALUE)
              SUM=SUM+VALUE
10015     CONTINUE
10013     GOTO 10016
10012     N=N+1
          IF((RD(POS).NE.1))GOTO 10017
            CALL GETDA0(RD,POS,ROW,IVAL)
            SUM=SUM+IVAL
10017     IF((RD(POS).NE.2))GOTO 10018
            CALL GETDA0(RD,POS,ROW,VALUE)
            SUM=SUM+VALUE
10018   CONTINUE
10016 GOTO 10010
10011 IF((N.EQ.0))GOTO 10019
        CALL PRINT(-11,AAAAA0,SUM,N)
        GOTO 10020
10019   CALL PRINT(-11,AAAAB0)
10020 CALL SWT
      END
      INTEGER FUNCTION PARSE(RD,POS2,ARG,RPN,CBUF)
      INTEGER RD(884)
      INTEGER POS2
      INTEGER ARG(1)
      INTEGER RPN(200),CBUF(500)
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      INTEGER AAAAC0(19)
      DATA AAAAC0/201,238,246,225,236,233,228,160,229,248,240,242,229,24
     *3,243,233,239,238,0/
      CALL MKLB$F($1,ERRLA0)
      CALL MOVE$(RD,RDAAA0,RD(1))
      POS2A0=POS2
      CALL CTOC(ARG,ARGAA0,128)
      APAAA0=1
      RPNLE0=1
      CBUFL0=1
      CALL GETSYM
      CALL EXPR
      IF((ARGAA0(APAAA0).EQ.0))GOTO 10021
        CALL PSYNER(AAAAC0,1)
10021 CALL PUSH(0)
      CALL MOVE$(RPNAA0,RPN,RPNLE0)
      CALL MOVE$(CBUFA0,CBUF,CBUFL0)
      PARSE=-2
      RETURN
1     PARSE=-3
      RETURN
      END
      SUBROUTINE EXPR
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      CALL TERM
10022 IF((SYMTY0.NE.252))GOTO 10023
        CALL GETSYM
        CALL TERM
        CALL PUSH(252)
      GOTO 10022
10023 RETURN
      END
      SUBROUTINE TERM
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      CALL FACTOR
10024 IF((SYMTY0.NE.166))GOTO 10025
        CALL GETSYM
        CALL FACTOR
        CALL PUSH(166)
      GOTO 10024
10025 RETURN
      END
      SUBROUTINE FACTOR
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      IF((SYMTY0.NE.254))GOTO 10026
        CALL GETSYM
        CALL FACTOR
        CALL PUSH(254)
        GOTO 10027
10026   CALL PRIMA0
10027 RETURN
      END
      SUBROUTINE PRIMA0
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      INTEGER FT1,FT2,P1,P2,OP,TYPE1,TYPE2
      INTEGER GETQU0,CONVE0
      INTEGER S1(102),S2(102)
      INTEGER AAAAD0(23)
      INTEGER AAAAE0(28)
      INTEGER AAAAF0
      INTEGER AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAI0(33)
      INTEGER AAAAJ0
      INTEGER AAAAK0(33)
      INTEGER AAAAL0(40)
      DATA AAAAD0/245,238,226,225,236,225,238,227,229,228,160,240,225,24
     *2,229,238,244,232,229,243,229,243,0/
      DATA AAAAE0/237,233,243,243,233,238,231,160,242,229,236,225,244,23
     *3,239,238,225,236,160,239,240,229,242,225,244,239,242,0/
      DATA AAAAI0/195,239,237,240,225,242,233,238,231,160,244,247,239,16
     *0,236,233,244,229,242,225,236,243,160,233,243,160,226,239,231,245,
     *243,161,0/
      DATA AAAAK0/195,239,237,240,225,242,233,238,231,160,244,247,239,16
     *0,236,233,244,229,242,225,236,243,160,233,243,160,226,239,231,245,
     *243,161,0/
      DATA AAAAL0/244,249,240,229,243,160,244,239,160,226,229,160,227,23
     *9,237,240,225,242,229,228,160,225,242,229,160,238,239,244,160,227,
     *239,237,240,225,244,233,226,236,229,0/
      IF((SYMTY0.NE.168))GOTO 10028
        CALL GETSYM
        CALL EXPR
        IF((SYMTY0.EQ.169))GOTO 10029
          CALL PSYNER(AAAAD0,1)
10029   CALL GETSYM
        GOTO 10030
10028   CALL FIELD(FT1,S1)
        IF((SYMTY0.EQ.188))GOTO 10031
        IF((SYMTY0.EQ.190))GOTO 10031
        IF((SYMTY0.EQ.220))GOTO 10031
        IF((SYMTY0.EQ.175))GOTO 10031
        IF((SYMTY0.EQ.222))GOTO 10031
        IF((SYMTY0.EQ.189))GOTO 10031
          CALL PSYNER(AAAAE0,1)
10031   OP=SYMTY0
        CALL GETSYM
        CALL FIELD(FT2,S2)
        TYPE1=3
        TYPE2=3
        AAAAF0=FT1
        GOTO 10032
10033     P1=GETQU0(S1)
          TYPE1=RDAAA0(P1)
          AAAAG0=FT2
          GOTO 10034
10035       P2=GETQU0(S2)
            TYPE2=RDAAA0(P2)
          GOTO 10036
10037       P2=CONVE0(S2,TYPE1)
            TYPE2=TYPE1
          GOTO 10036
10038       TYPE2=3
            P2=CONVE0(S2,3)
          GOTO 10036
10034     IF(AAAAG0.EQ.162)GOTO 10038
          IF(AAAAG0.EQ.176)GOTO 10037
          IF(AAAAG0.EQ.193)GOTO 10035
10036   GOTO 10039
10040     AAAAH0=FT2
          GOTO 10041
10042       P2=GETQU0(S2)
            TYPE2=RDAAA0(P2)
            TYPE1=RDAAA0(P2)
            P1=CONVE0(S1,TYPE1)
          GOTO 10043
10044       CALL PSYNER(AAAAI0,1)
          GOTO 10043
10041     IF(AAAAH0.EQ.162)GOTO 10044
          IF(AAAAH0.EQ.176)GOTO 10044
          IF(AAAAH0.EQ.193)GOTO 10042
10043   GOTO 10039
10045     TYPE1=3
          P1=CONVE0(S1,3)
          AAAAJ0=FT2
          GOTO 10046
10047       P2=GETQU0(S2)
            TYPE2=RDAAA0(P2)
          GOTO 10048
10049       CALL PSYNER(AAAAK0,1)
          GOTO 10048
10046     IF(AAAAJ0.EQ.162)GOTO 10049
          IF(AAAAJ0.EQ.176)GOTO 10049
          IF(AAAAJ0.EQ.193)GOTO 10047
10048   GOTO 10039
10032   IF(AAAAF0.EQ.162)GOTO 10045
        IF(AAAAF0.EQ.176)GOTO 10040
        IF(AAAAF0.EQ.193)GOTO 10033
10039   IF((TYPE1.EQ.TYPE2))GOTO 10050
          CALL PSYNER(AAAAL0,1)
10050   CALL PUSH(OP)
        CALL PUSH(FT1)
        CALL PUSH(P1)
        CALL PUSH(FT2)
        CALL PUSH(P2)
10030 RETURN
      END
      SUBROUTINE FIELD(FT,S)
      INTEGER FT
      INTEGER S(102)
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      INTEGER AAAAM0(32)
      DATA AAAAM0/229,248,240,229,227,244,229,228,160,228,239,237,225,23
     *3,238,160,238,225,237,229,160,239,242,160,236,233,244,229,242,225,
     *236,0/
      IF((SYMTY0.EQ.193))GOTO 10051
      IF((SYMTY0.EQ.176))GOTO 10051
      IF((SYMTY0.EQ.162))GOTO 10051
        CALL PSYNER(AAAAM0,1)
10051 FT=SYMTY0
      CALL CTOC(SYMTE0,S,102)
      CALL GETSYM
      RETURN
      END
      INTEGER FUNCTION GETQU0(NAME)
      INTEGER NAME(1)
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      INTEGER I
      INTEGER FINDQ0
      INTEGER AAAAN0(32)
      DATA AAAAN0/186,160,228,239,237,225,233,238,160,238,239,244,160,23
     *0,239,245,238,228,160,239,242,160,225,237,226,233,231,245,239,245,
     *243,0/
      I=FINDQ0(RDAAA0,NAME,POS2A0)
      IF((I.NE.0))GOTO 10052
        CALL PRINT(-15,'*s.',NAME)
        CALL PSYNER(AAAAN0,0)
10052 GETQU0=I
      RETURN
      END
      INTEGER FUNCTION FINDQ0(RD,NAME,POS2)
      INTEGER RD(884)
      INTEGER NAME(1)
      INTEGER POS2
      INTEGER P,I
      INTEGER EQUAL
      INTEGER RNAME(17)
      INTEGER AAAAO0(3)
      INTEGER AAAAP0(3)
      DATA AAAAO0/174,177,0/
      DATA AAAAP0/174,178,0/
      I=1
      GOTO 10055
10053 I=I+(1)
10055 IF((NAME(I).EQ.0))GOTO 10054
      IF((NAME(I).EQ.174))GOTO 10054
      IF((I.GE.17))GOTO 10054
        RNAME(I)=NAME(I)
      GOTO 10053
10054 RNAME(I)=0
      P=0
      IF((NAME(I).EQ.0))GOTO 10057
      IF((POS2.EQ.0))GOTO 10057
      GOTO 10056
10057   I=3+1
        GOTO 10060
10058   I=I+22
10060   IF((I.GT.RD(2)))GOTO 10059
          IF((EQUAL(RNAME,RD(I+5)).NE.1))GOTO 10061
            IF((P.NE.0))GOTO 10062
              P=I
              GOTO 10063
10062         P=0
              GOTO 10059
10063     CONTINUE
10061   GOTO 10058
10059   GOTO 10064
10056   IF((EQUAL(NAME(I),AAAAO0).NE.1))GOTO 10065
          I=3+1
          GOTO 10068
10066     I=I+22
10068     IF((I.EQ.POS2))GOTO 10067
            IF((EQUAL(RNAME,RD(I+5)).NE.1))GOTO 10069
              P=I
              GOTO 10067
10069     GOTO 10066
10067     GOTO 10070
10065     IF((EQUAL(NAME(I),AAAAP0).NE.1))GOTO 10071
            I=POS2
            GOTO 10074
10072       I=I+22
10074       IF((I.GT.RD(2)))GOTO 10073
              IF((EQUAL(RNAME,RD(I+5)).NE.1))GOTO 10075
                P=I
                GOTO 10073
10075       GOTO 10072
10073     CONTINUE
10071   CONTINUE
10070 CONTINUE
10064 FINDQ0=P
      RETURN
      END
      INTEGER FUNCTION CONVE0(S,TYPE)
      INTEGER S(1)
      INTEGER TYPE,P
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      INTEGER I,P
      INTEGER LENGTH
      INTEGER * 4 L
      INTEGER * 4 GCTOL
      REAL * 8 D
      REAL * 8 CTOD
      INTEGER AAAAQ0
      INTEGER AAAAR0(18)
      INTEGER AAAAS0(3)
      INTEGER AAAAT0(25)
      INTEGER AAAAU0(18)
      INTEGER AAAAV0(3)
      INTEGER AAAAW0(22)
      INTEGER AAAAX0(18)
      DATA AAAAR0/212,239,239,160,237,225,238,249,160,236,233,244,229,24
     *2,225,236,243,0/
      DATA AAAAS0/170,243,0/
      DATA AAAAT0/201,238,246,225,236,233,228,160,233,238,244,229,231,22
     *9,242,160,227,239,238,243,244,225,238,244,0/
      DATA AAAAU0/212,239,239,160,237,225,238,249,160,236,233,244,229,24
     *2,225,236,243,0/
      DATA AAAAV0/170,243,0/
      DATA AAAAW0/201,238,246,225,236,233,228,160,242,229,225,236,160,22
     *7,239,238,243,244,225,238,244,0/
      DATA AAAAX0/212,239,239,160,237,225,238,249,160,236,233,244,229,24
     *2,225,236,243,0/
      P=CBUFL0
      AAAAQ0=TYPE
      GOTO 10076
10077   CBUFL0=CBUFL0+(2)
        IF((CBUFL0.LE.500))GOTO 10078
          CALL PSYNER(AAAAR0,1)
10078   I=1
        L=GCTOL(S,I,10)
        IF((S(I).EQ.0))GOTO 10079
          CALL PRINT(-15,AAAAS0,S)
          CALL PSYNER(AAAAT0,0)
10079   CALL MOVE$(L,CBUFA0(P),2)
      GOTO 10080
10081   CBUFL0=CBUFL0+(4)
        IF((CBUFL0.LE.500))GOTO 10082
          CALL PSYNER(AAAAU0,1)
10082   I=1
        D=CTOD(S,I)
        IF((S(I).EQ.0))GOTO 10083
          CALL PRINT(-15,AAAAV0,S)
          CALL PSYNER(AAAAW0,0)
10083   CALL MOVE$(D,CBUFA0(P),4)
      GOTO 10080
10084   I=LENGTH(S)+1
        CBUFL0=CBUFL0+(I)
        IF((CBUFL0.LE.500))GOTO 10085
          CALL PSYNER(AAAAX0,1)
10085   CALL MOVE$(S,CBUFA0(P),I)
      GOTO 10080
10076 GOTO(10077,10081,10084),AAAAQ0
10080 CONVE0=P
      RETURN
      END
      SUBROUTINE GETSYM
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      INTEGER L
      INTEGER QUOTE
      INTEGER AAAAY0
      INTEGER AAAAZ0(14)
      INTEGER AAABA0
      INTEGER AAABB0
      INTEGER AAABC0
      INTEGER AAABD0
      INTEGER AAABE0
      INTEGER AAABF0
      INTEGER AAABG0
      INTEGER AAABH0(18)
      DATA AAAAZ0/205,233,243,243,233,238,231,160,241,245,239,244,229,0/
      DATA AAABH0/201,236,236,229,231,225,236,160,227,232,225,242,225,22
     *7,244,229,242,0/
10086 IF((ARGAA0(APAAA0).NE.160))GOTO 10087
        APAAA0=APAAA0+(1)
      GOTO 10086
10087 L=1
      AAAAY0=ARGAA0(APAAA0)
      GOTO 10088
10089   SYMTE0(L)=ARGAA0(APAAA0)
        APAAA0=APAAA0+(1)
        L=L+(1)
        GOTO 10092
10090   APAAA0=APAAA0+(1)
        L=L+(1)
10092   IF((193.GT.ARGAA0(APAAA0)))GOTO 10094
        IF((ARGAA0(APAAA0).GT.218))GOTO 10094
        GOTO 10093
10094   IF((225.GT.ARGAA0(APAAA0)))GOTO 10095
        IF((ARGAA0(APAAA0).GT.250))GOTO 10095
        GOTO 10093
10095   IF((176.GT.ARGAA0(APAAA0)))GOTO 10096
        IF((ARGAA0(APAAA0).GT.185))GOTO 10096
        GOTO 10093
10096   IF((ARGAA0(APAAA0).EQ.223))GOTO 10093
        IF((ARGAA0(APAAA0).EQ.174))GOTO 10093
        GOTO 10091
10093     SYMTE0(L)=ARGAA0(APAAA0)
        GOTO 10090
10091   SYMTY0=193
      GOTO 10097
10098   SYMTE0(L)=ARGAA0(APAAA0)
        APAAA0=APAAA0+(1)
        L=L+(1)
        GOTO 10101
10099   APAAA0=APAAA0+(1)
        L=L+(1)
10101   IF((176.GT.ARGAA0(APAAA0)))GOTO 10103
        IF((ARGAA0(APAAA0).GT.185))GOTO 10103
        GOTO 10102
10103   IF((ARGAA0(APAAA0).EQ.174))GOTO 10102
        IF((ARGAA0(APAAA0).EQ.171))GOTO 10102
        IF((ARGAA0(APAAA0).EQ.173))GOTO 10102
        IF((ARGAA0(APAAA0).EQ.229))GOTO 10102
        IF((ARGAA0(APAAA0).EQ.197))GOTO 10102
        IF((ARGAA0(APAAA0).EQ.242))GOTO 10102
        IF((ARGAA0(APAAA0).EQ.210))GOTO 10102
        GOTO 10100
10102     SYMTE0(L)=ARGAA0(APAAA0)
        GOTO 10099
10100   SYMTY0=176
      GOTO 10097
10104   QUOTE=ARGAA0(APAAA0)
        APAAA0=APAAA0+(1)
        L=1
        GOTO 10107
10105   APAAA0=APAAA0+(1)
        L=L+(1)
10107   IF((ARGAA0(APAAA0).EQ.0))GOTO 10106
        IF((ARGAA0(APAAA0).EQ.QUOTE))GOTO 10106
          SYMTE0(L)=ARGAA0(APAAA0)
        GOTO 10105
10106   SYMTE0(L)=0
        IF((ARGAA0(APAAA0).NE.0))GOTO 10108
          CALL PSYNER(AAAAZ0,1)
          GOTO 10109
10108     APAAA0=APAAA0+(1)
10109   SYMTY0=162
      GOTO 10097
10110   SYMTY0=ARGAA0(APAAA0)
        SYMTE0(1)=ARGAA0(APAAA0)
        APAAA0=APAAA0+(1)
        L=L+(1)
      GOTO 10097
10111   SYMTE0(1)=188
        APAAA0=APAAA0+(1)
        L=L+(1)
        AAABA0=ARGAA0(APAAA0)
        GOTO 10112
10113     SYMTY0=222
        GOTO 10114
10115     SYMTY0=175
        GOTO 10114
10114     SYMTE0(2)=ARGAA0(APAAA0)
          APAAA0=APAAA0+(1)
          L=L+(1)
        GOTO 10116
10112   AAABB0=AAABA0-188
        GOTO(10115,10113),AAABB0
          SYMTY0=188
10116 GOTO 10097
10117   SYMTE0(1)=190
        APAAA0=APAAA0+(1)
        L=L+(1)
        AAABC0=ARGAA0(APAAA0)
        GOTO 10118
10119     SYMTY0=222
        GOTO 10120
10121     SYMTY0=220
        GOTO 10120
10120     SYMTE0(2)=ARGAA0(APAAA0)
          APAAA0=APAAA0+(1)
          L=L+(1)
        GOTO 10122
10118   AAABD0=AAABC0-187
        GOTO(10119,10121),AAABD0
          SYMTY0=190
10122 GOTO 10097
10123   SYMTE0(1)=189
        APAAA0=APAAA0+(1)
        L=L+(1)
        AAABE0=ARGAA0(APAAA0)
        GOTO 10124
10125     SYMTY0=189
        GOTO 10126
10127     SYMTY0=220
        GOTO 10126
10128     SYMTY0=175
        GOTO 10126
10126     SYMTE0(2)=ARGAA0(APAAA0)
          APAAA0=APAAA0+(1)
          L=L+(1)
        GOTO 10129
10124   AAABF0=AAABE0-187
        GOTO(10128,10125,10127),AAABF0
          SYMTY0=189
10129 GOTO 10097
10130   SYMTE0(1)=254
        APAAA0=APAAA0+(1)
        L=L+(1)
        IF((ARGAA0(APAAA0).NE.189))GOTO 10131
          SYMTY0=222
          SYMTE0(2)=189
          APAAA0=APAAA0+(1)
          L=L+(1)
          GOTO 10132
10131     SYMTY0=254
10132 GOTO 10097
10133   SYMTY0=0
      GOTO 10097
10088 IF(AAAAY0.EQ.0)GOTO 10133
      AAABG0=AAAAY0-161
      GOTO(10104,10134,10134,10134,10110,10104,10110,10110,10134,10098,1
     *0134,10098,10110,10134,10098,10098,10098,10098,10098,10098,10098,1
     *0098,10098,10098,10134,10134,10111,10123,10117,10134,10134,10089,1
     *0089,10089,10089,10089,10089,10089,10089,10089,10089,10089,10089,1
     *0089,10089,10089,10089,10089,10089,10089,10089,10089,10089,10089,1
     *0089,10089,10089,10134,10134,10134,10134,10134,10134,10089,10089,1
     *0089,10089,10089,10089,10089,10089,10089,10089,10089,10089,10089,1
     *0089,10089,10089,10089,10089,10089,10089,10089,10089,10089,10089,1
     *0089,10089,10134,10110,10134,10130),AAABG0
10134   CALL PSYNER(AAABH0,1)
10097 SYMTE0(L)=0
      RETURN
      END
      SUBROUTINE PUSH(W)
      INTEGER W
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      INTEGER AAABI0(37)
      DATA AAABI0/211,229,236,229,227,244,233,239,238,160,229,248,240,24
     *2,229,243,243,233,239,238,160,244,239,239,160,227,239,237,240,236,
     *233,227,225,244,229,228,0/
      IF((RPNLE0.LT.200))GOTO 10135
        CALL PSYNER(AAABI0,1)
        GOTO 10136
10135   RPNAA0(RPNLE0)=W
        RPNLE0=RPNLE0+(1)
10136 RETURN
      END
      SUBROUTINE PSYNER(M,C)
      INTEGER M(1)
      INTEGER C
      INTEGER RDAAA0(884)
      INTEGER ARGAA0(128)
      INTEGER APAAA0,POS2A0
      INTEGER RPNAA0(200),RPNLE0
      INTEGER SYMTY0,SYMTE0(128)
      INTEGER CBUFA0(500),CBUFL0
      REAL * 8 ERRLA0
      COMMON /RSLCOM/RDAAA0,ARGAA0,APAAA0,RPNAA0,RPNLE0,SYMTY0,SYMTE0,CB
     *UFA0,CBUFL0,ERRLA0,POS2A0
      INTEGER AAABJ0(15)
      INTEGER AAABK0(5)
      DATA AAABJ0/170,243,186,160,170,243,170,238,170,163,248,222,170,23
     *8,0/
      DATA AAABK0/170,243,170,238,0/
      IF((C.NE.1))GOTO 10137
        CALL PRINT(-15,AAABJ0,ARGAA0,M,APAAA0-2)
        GOTO 10138
10137   CALL PRINT(-15,AAABK0,M)
10138 CALL PL1$NL(ERRLA0)
      END
      INTEGER FUNCTION EVAL(RD,ROW,RPN,CBUF)
      INTEGER RD(884)
      INTEGER ROW(1),RPN(1),CBUF(500)
      INTEGER SP,RP,I1,I2,R
      INTEGER BUF1(102),BUF2(102),STACK(200)
      INTEGER EVALR0
      INTEGER P1,P2
      INTEGER AAABL0
      INTEGER AAABM0
      INTEGER AAABN0(30)
      DATA AAABN0/233,238,160,229,246,225,236,186,160,243,244,225,227,23
     *5,160,237,229,243,243,229,228,160,245,240,160,170,233,170,238,0/
      SP=0
      RP=1
      GOTO 10141
10139 RP=RP+(1)
10141 IF((RPN(RP).EQ.0))GOTO 10140
        AAABL0=RPN(RP)
        GOTO 10142
10143     IF((STACK(SP).NE.1))GOTO 10144
          IF((STACK(SP-1).NE.1))GOTO 10144
            STACK(SP-1)=1
            GOTO 10145
10144       STACK(SP-1)=0
10145     SP=SP-(1)
        GOTO 10146
10147     IF((STACK(SP).EQ.1))GOTO 10149
          IF((STACK(SP-1).EQ.1))GOTO 10149
          GOTO 10148
10149       STACK(SP-1)=1
            GOTO 10150
10148       STACK(SP-1)=0
10150     SP=SP-(1)
        GOTO 10146
10151     IF((STACK(SP).NE.1))GOTO 10152
            STACK(SP)=0
            GOTO 10153
10152       STACK(SP)=1
10153   GOTO 10146
10142   IF(AAABL0.EQ.166)GOTO 10143
        AAABM0=AAABL0-251
        GOTO(10147,10154,10151),AAABM0
10154     I1=RPN(RP+1)
          P1=RPN(RP+2)
          I2=RPN(RP+3)
          P2=RPN(RP+4)
          IF((I1.NE.193))GOTO 10155
          IF((I2.NE.193))GOTO 10155
            CALL GETDA0(RD,P1,ROW,BUF1)
            CALL GETDA0(RD,P2,ROW,BUF2)
            R=EVALR0(RPN(RP),RD(P1),BUF1,BUF2)
            GOTO 10156
10155       IF((I1.NE.193))GOTO 10157
              CALL GETDA0(RD,P1,ROW,BUF1)
              R=EVALR0(RPN(RP),RD(P1),BUF1,CBUF(P2))
              GOTO 10158
10157         IF((I2.NE.193))GOTO 10159
                CALL GETDA0(RD,P2,ROW,BUF2)
                R=EVALR0(RPN(RP),RD(P2),CBUF(P1),BUF2)
                GOTO 10160
10159           R=EVALR0(RPN(RP),0,CBUF(P1),CBUF(P2))
10160       CONTINUE
10158     CONTINUE
10156     SP=SP+(1)
          STACK(SP)=R
          RP=RP+(4)
10146 GOTO 10139
10140 IF((SP.EQ.1))GOTO 10161
        CALL PRINT(-15,AAABN0,SP)
10161 EVAL=STACK(1)
      RETURN
      END
      INTEGER FUNCTION EVALR0(OP,TYPE,BUF1,BUF2)
      INTEGER OP,TYPE,BUF1(1),BUF2(1)
      INTEGER R
      INTEGER COMPA0
      INTEGER AAABO0
      INTEGER AAABP0
      INTEGER AAABQ0(30)
      DATA AAABQ0/233,238,160,229,246,225,236,223,242,229,236,186,160,22
     *6,239,231,245,243,160,229,238,244,242,249,160,170,233,170,238,0/
      AAABO0=OP
      GOTO 10162
10163   IF((COMPA0(TYPE,BUF1,BUF2).NE.1))GOTO 10164
          R=1
          GOTO 10165
10164     R=0
10165 GOTO 10166
10167   IF((COMPA0(TYPE,BUF1,BUF2).NE.2))GOTO 10168
          R=1
          GOTO 10169
10168     R=0
10169 GOTO 10166
10170   IF((COMPA0(TYPE,BUF1,BUF2).NE.3))GOTO 10171
          R=1
          GOTO 10172
10171     R=0
10172 GOTO 10166
10173   IF((COMPA0(TYPE,BUF1,BUF2).EQ.3))GOTO 10174
          R=1
          GOTO 10175
10174     R=0
10175 GOTO 10166
10176   IF((COMPA0(TYPE,BUF1,BUF2).EQ.2))GOTO 10177
          R=1
          GOTO 10178
10177     R=0
10178 GOTO 10166
10179   IF((COMPA0(TYPE,BUF1,BUF2).EQ.1))GOTO 10180
          R=1
          GOTO 10181
10180     R=0
10181 GOTO 10166
10162 IF(AAABO0.EQ.175)GOTO 10173
      AAABP0=AAABO0-187
      GOTO(10163,10167,10170),AAABP0
      AAABP0=AAABO0-219
      GOTO(10179,10182,10176),AAABP0
10182   CALL PRINT(-15,AAABQ0,OP)
10166 EVALR0=R
      RETURN
      END
      INTEGER FUNCTION LOADRD(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER ISATTY,READF
      IF((ISATTY(FD).NE.1))GOTO 10183
        CALL REMARK('Sorry, a relation can''t be read from the terminal.
     *')
        LOADRD=-3
        RETURN
10183 IF((READF(RD(1),1,FD).NE.-1))GOTO 10184
        LOADRD=-3
        RETURN
10184 IF((READF(RD(2),RD(1)-1,FD).NE.-1))GOTO 10185
        CALL REMARK('relation is corrupted!!.')
        LOADRD=-3
        RETURN
10185 LOADRD=-2
      RETURN
      END
      SUBROUTINE SAVERD(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER ISATTY
      IF((ISATTY(FD).NE.1))GOTO 10186
        CALL PRINT0(RD,FD)
        GOTO 10187
10186   CALL WRITEF(RD,RD(1),FD)
10187 RETURN
      END
      SUBROUTINE PRINT0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER TYPE(102)
      INTEGER AAABR0(10)
      INTEGER AAABS0(33)
      INTEGER AAABT0(10)
      INTEGER AAABU0
      INTEGER AAABV0(8)
      INTEGER AAABW0(5)
      INTEGER AAABX0(7)
      INTEGER AAABY0(24)
      INTEGER AAABZ0(10)
      DATA AAABR0/170,179,185,172,172,173,248,170,238,0/
      DATA AAABS0/252,160,244,249,240,229,160,160,160,160,252,160,236,22
     *9,238,231,244,232,160,252,160,238,225,237,229,170,177,179,248,252,
     *170,238,0/
      DATA AAABT0/170,179,185,172,172,173,248,170,238,0/
      DATA AAABV0/233,238,244,229,231,229,242,0/
      DATA AAABW0/242,229,225,236,0/
      DATA AAABX0/243,244,242,233,238,231,0/
      DATA AAABY0/252,160,170,183,243,160,252,160,170,181,233,160,160,25
     *2,160,170,177,182,243,160,252,170,238,0/
      DATA AAABZ0/170,179,185,172,172,173,248,170,238,0/
      CALL PRINT(FD,AAABR0)
      CALL PRINT(FD,AAABS0)
      CALL PRINT(FD,AAABT0)
      I=3+1
      GOTO 10190
10188 I=I+22
10190 IF((I.GT.RD(2)))GOTO 10189
        AAABU0=RD(I)
        GOTO 10191
10192     CALL CTOC(AAABV0,TYPE,102)
        GOTO 10193
10194     CALL CTOC(AAABW0,TYPE,102)
        GOTO 10193
10195     CALL CTOC(AAABX0,TYPE,102)
        GOTO 10193
10191   GOTO(10192,10194,10195),AAABU0
10193   CALL PRINT(FD,AAABY0,TYPE,RD(I+1),RD(I+5))
      GOTO 10188
10189 CALL PRINT(FD,AAABZ0)
      RETURN
      END
      INTEGER FUNCTION ADDFI0(RD,TYPE,LEN,NAME)
      INTEGER RD(884)
      INTEGER TYPE,LEN
      INTEGER NAME(1)
      INTEGER I
      INTEGER AAACA0
      I=RD(2)+22
      IF((I+22-1.LE.884))GOTO 10196
        ADDFI0=0
        RETURN
10196 RD(I)=TYPE
      RD(I+4)=LENGTH(NAME)
      AAACA0=TYPE
      GOTO 10197
10198   RD(I+1)=2
        RD(I+4)=MAX0(RD(I+4),10)
      GOTO 10199
10200   RD(I+1)=4
        RD(I+4)=MAX0(RD(I+4),15)
      GOTO 10199
10201   RD(I+1)=LEN
        RD(I+4)=MAX0(RD(I+4),LEN)
      GOTO 10199
10197 GOTO(10198,10200,10201),AAACA0
        CALL ERROR('in add_field_to_rd: bogus type passed.')
10199 RD(I+2)=RD(3)+1
      RD(I+3)=RD(3)+RD(I+1)
      CALL CTOC(NAME,RD(I+5),17)
      RD(1)=RD(1)+(22)
      RD(2)=RD(2)+(22)
      RD(3)=RD(3)+(RD(I+1))
      IF((RD(3).LE.500))GOTO 10202
        ADDFI0=0
        RETURN
10202 ADDFI0=I
      RETURN
      END
      INTEGER FUNCTION FINDF0(RD,NAME)
      INTEGER RD(884)
      INTEGER NAME(1)
      INTEGER I
      INTEGER EQUAL
      I=3+1
      GOTO 10205
10203 I=I+22
10205 IF((I.GT.RD(2)))GOTO 10204
        IF((EQUAL(RD(I+5),NAME).NE.1))GOTO 10206
          FINDF0=I
          RETURN
10206 GOTO 10203
10204 FINDF0=0
      RETURN
      END
      INTEGER FUNCTION COMPA0(TYPE,BUF1,BUF2)
      INTEGER TYPE
      INTEGER BUF1(500),BUF2(500)
      INTEGER R
      INTEGER COMPB0,COMPC0,COMPD0
      INTEGER AAACB0
      INTEGER AAACC0(34)
      DATA AAACC0/233,238,160,227,239,237,240,225,242,229,223,230,233,22
     *9,236,228,186,160,226,239,231,245,243,160,244,249,240,229,160,170,
     *233,170,238,0/
      AAACB0=TYPE
      GOTO 10207
10208   R=COMPB0(BUF1,BUF2)
      GOTO 10209
10210   R=COMPC0(BUF1,BUF2)
      GOTO 10209
10211   R=COMPD0(BUF1,BUF2)
      GOTO 10209
10207 GOTO(10208,10210,10211),AAACB0
        CALL PRINT(-15,AAACC0,TYPE)
        R=2
10209 COMPA0=R
      RETURN
      END
      INTEGER FUNCTION COMPB0(I1,I2)
      INTEGER * 4 I1,I2
      IF((I1.GE.I2))GOTO 10212
        COMPB0=1
        RETURN
10212 IF((I1.LE.I2))GOTO 10213
        COMPB0=3
        RETURN
10213 COMPB0=2
      RETURN
      END
      INTEGER FUNCTION COMPC0(D1,D2)
      REAL * 8 D1,D2
      IF((D1.GE.D2))GOTO 10214
        COMPC0=1
        RETURN
10214 IF((D1.LE.D2))GOTO 10215
        COMPC0=3
        RETURN
10215 COMPC0=2
      RETURN
      END
      INTEGER FUNCTION COMPD0(S1,S2)
      INTEGER S1(1),S2(1)
      INTEGER I
      I=1
      GOTO 10218
10216 I=I+(1)
10218 IF((S1(I).NE.S2(I)))GOTO 10217
      IF((S1(I).EQ.0))GOTO 10217
      GOTO 10216
10217 IF((S1(I).NE.S2(I)))GOTO 10219
        COMPD0=2
        RETURN
10219 IF((S1(I).EQ.0))GOTO 10221
      IF((S1(I).LT.S2(I)))GOTO 10221
      GOTO 10220
10221   COMPD0=1
        RETURN
10220 COMPD0=3
      RETURN
      END
      SUBROUTINE PRINU0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER AAACD0(2)
      INTEGER AAACE0(7)
      INTEGER AAACF0(3)
      INTEGER AAACG0(2)
      INTEGER AAACH0(7)
      INTEGER AAACI0(3)
      INTEGER AAACJ0(2)
      INTEGER AAACK0(7)
      INTEGER AAACL0(3)
      DATA AAACD0/173,0/
      DATA AAACE0/170,163,172,172,173,248,0/
      DATA AAACF0/170,238,0/
      DATA AAACG0/252,0/
      DATA AAACH0/160,170,163,243,160,252,0/
      DATA AAACI0/170,238,0/
      DATA AAACJ0/173,0/
      DATA AAACK0/170,163,172,172,173,248,0/
      DATA AAACL0/170,238,0/
      CALL PRINT(FD,AAACD0)
      I=3+1
      GOTO 10224
10222 I=I+22
10224 IF((I.GT.RD(2)))GOTO 10223
        CALL PRINT(FD,AAACE0,RD(I+4)+3)
      GOTO 10222
10223 CALL PRINT(FD,AAACF0)
      CALL PRINT(FD,AAACG0)
      I=3+1
      GOTO 10227
10225 I=I+22
10227 IF((I.GT.RD(2)))GOTO 10226
        CALL PRINT(FD,AAACH0,RD(I+4),RD(I+5))
      GOTO 10225
10226 CALL PRINT(FD,AAACI0)
      CALL PRINT(FD,AAACJ0)
      I=3+1
      GOTO 10230
10228 I=I+22
10230 IF((I.GT.RD(2)))GOTO 10229
        CALL PRINT(FD,AAACK0,RD(I+4)+3)
      GOTO 10228
10229 CALL PRINT(FD,AAACL0)
      RETURN
      END
      SUBROUTINE PRINV0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER AAACM0(2)
      INTEGER AAACN0(7)
      INTEGER AAACO0(3)
      DATA AAACM0/173,0/
      DATA AAACN0/170,163,172,172,173,248,0/
      DATA AAACO0/170,238,0/
      CALL PRINT(FD,AAACM0)
      I=3+1
      GOTO 10233
10231 I=I+22
10233 IF((I.GT.RD(2)))GOTO 10232
        CALL PRINT(FD,AAACN0,RD(I+4)+3)
      GOTO 10231
10232 CALL PRINT(FD,AAACO0)
      RETURN
      END
      SUBROUTINE PRINW0(RD,FD,BUF)
      INTEGER RD(884)
      INTEGER FD
      INTEGER BUF(500)
      INTEGER I
      INTEGER AAACP0(2)
      INTEGER AAACQ0
      INTEGER AAACR0(7)
      INTEGER AAACS0(7)
      INTEGER AAACT0(9)
      INTEGER AAACU0(3)
      DATA AAACP0/252,0/
      DATA AAACR0/160,170,163,236,160,252,0/
      DATA AAACS0/160,170,163,228,160,252,0/
      DATA AAACT0/160,170,163,172,163,243,160,252,0/
      DATA AAACU0/170,238,0/
      CALL PRINT(FD,AAACP0)
      I=3+1
      GOTO 10236
10234 I=I+22
10236 IF((I.GT.RD(2)))GOTO 10235
        AAACQ0=RD(I)
        GOTO 10237
10238     CALL PRINT(FD,AAACR0,RD(I+4),BUF(RD(I+2)))
        GOTO 10239
10240     CALL PRINT(FD,AAACS0,RD(I+4),BUF(RD(I+2)))
        GOTO 10239
10241     CALL PRINT(FD,AAACT0,RD(I+4),RD(I+1),BUF(RD(I+2)))
        GOTO 10239
10237   GOTO(10238,10240,10241),AAACQ0
10239 GOTO 10234
10235 CALL PRINT(FD,AAACU0)
      RETURN
      END
      INTEGER FUNCTION GETROW(RD,FD,BUF)
      INTEGER RD(884)
      INTEGER FD
      INTEGER BUF(500),I
      INTEGER READF
      I=READF(BUF,RD(3),FD)
      GETROW=I
      RETURN
      END
      SUBROUTINE PUTROW(RD,FD,BUF)
      INTEGER RD(884)
      INTEGER FD
      INTEGER BUF(500)
      INTEGER ISATTY
      IF((ISATTY(FD).NE.1))GOTO 10242
        CALL PRINW0(RD,FD,BUF)
        GOTO 10243
10242   CALL WRITEF(BUF,RD(3),FD)
10243 RETURN
      END
      SUBROUTINE GETDA0(RD,I,BUF,DEST)
      INTEGER RD(884)
      INTEGER I,BUF(1),DEST(102)
      INTEGER J,K
      INTEGER AAACV0
      AAACV0=RD(I)
      GOTO 10244
10245   J=RD(I+2)
        DEST(1)=BUF(J)
        DEST(2)=BUF(J+1)
      GOTO 10246
10247   J=RD(I+2)
        DEST(1)=BUF(J)
        DEST(2)=BUF(J+1)
        DEST(3)=BUF(J+2)
        DEST(4)=BUF(J+3)
      GOTO 10246
10248   J=RD(I+3)
        K=RD(I+1)
        GOTO 10251
10249   J=J-(1)
        K=K-(1)
10251   IF((K.LE.0))GOTO 10250
        IF((BUF(J).NE.160))GOTO 10250
        GOTO 10249
10250   DEST(K+1)=0
        GOTO 10254
10252   J=J-(1)
        K=K-(1)
10254   IF((K.LE.0))GOTO 10253
          DEST(K)=BUF(J)
        GOTO 10252
10253 GOTO 10246
10244 GOTO(10245,10247,10248),AAACV0
10246 RETURN
      END
      SUBROUTINE PUTDA0(RD,I,BUF,SRC)
      INTEGER RD(884)
      INTEGER I,BUF(1),SRC(102)
      INTEGER J,K
      INTEGER AAACW0
      AAACW0=RD(I)
      GOTO 10255
10256   J=RD(I+2)
        BUF(J)=SRC(1)
        BUF(J+1)=SRC(2)
      GOTO 10257
10258   J=RD(I+2)
        BUF(J)=SRC(1)
        BUF(J+1)=SRC(2)
        BUF(J+2)=SRC(3)
        BUF(J+3)=SRC(4)
      GOTO 10257
10259   J=RD(I+2)
        K=1
        GOTO 10262
10260   J=J+(1)
        K=K+(1)
10262   IF((SRC(K).EQ.0))GOTO 10261
        IF((K.GT.RD(I+1)))GOTO 10261
          BUF(J)=SRC(K)
        GOTO 10260
10261   GOTO 10265
10263   K=K+(1)
        J=J+(1)
10265   IF((K.GT.RD(I+1)))GOTO 10264
          BUF(J)=160
        GOTO 10263
10264 GOTO 10257
10255 GOTO(10256,10258,10259),AAACW0
10257 RETURN
      END
      INTEGER FUNCTION COMPE0(RD,ROW1,ROW2)
      INTEGER RD(884)
      INTEGER ROW1(500),ROW2(500)
      INTEGER BUF1(500),BUF2(500)
      INTEGER R,I
      INTEGER COMPA0
      I=3+1
      GOTO 10268
10266 I=I+22
10268 IF((I.GT.RD(2)))GOTO 10267
        CALL GETDA0(RD,I,ROW1,BUF1)
        CALL GETDA0(RD,I,ROW2,BUF2)
        R=COMPA0(RD(I),BUF1,BUF2)
        IF((R.EQ.2))GOTO 10269
          COMPE0=R
          RETURN
10269 GOTO 10266
10267 COMPE0=2
      RETURN
      END
C ---- Long Name Map ----
C Rpn                            rpnaa0
C comparefield                   compa0
C printheader                    prinu0
C comparerow                     compe0
C Ap                             apaaa0
C Rd                             rdaaa0
C Pos2                           pos2a0
C Cbuflen                        cbufl0
C evalrel                        evalr0
C printtrailer                   prinv0
C getqualfield                   getqu0
C Rpnlen                         rpnle0
C compareinteger                 compb0
C comparestring                  compd0
C putdata                        putda0
C summand                        summa0
C findfield                      findf0
C Arg                            argaa0
C findqualfield                  findq0
C Symtype                        symty0
C Symtext                        symte0
C convert                        conve0
C printrd                        print0
C printrow                       prinw0
C primary                        prima0
C comparereal                    compc0
C getdata                        getda0
C Errlab                         errla0
C Cbuf                           cbufa0
C addfieldtord                   addfi0