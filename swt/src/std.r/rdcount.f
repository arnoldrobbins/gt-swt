      INTEGER RD(884)
      INTEGER I,L,FLAG
      INTEGER ROW(500),RPN(200),CBUF(500)
      INTEGER GETARG,LOADRD,GETROW,ISATTY,EVAL,PARSE
      INTEGER ARG(128)
      INTEGER AAAAA0(5)
      DATA AAAAA0/170,233,170,238,0/
      IF((LOADRD(RD,-10).EQ.-2))GOTO 10000
        CALL ERROR('Cannot load input relation.')
10000 IF((GETARG(2,ARG,128).EQ.-1))GOTO 10001
        CALL ERROR('Usage: rdsel <selection expr>.')
10001 IF((GETARG(1,ARG,128).NE.-1))GOTO 10002
        FLAG=1
        GOTO 10003
10002   FLAG=0
10003 IF((FLAG.NE.0))GOTO 10004
        IF((PARSE(RD,0,ARG,RPN,CBUF).EQ.-2))GOTO 10005
          CALL SWT
10005 CONTINUE
10004 I=0
10006 IF((GETROW(RD,-10,ROW).EQ.-1))GOTO 10007
        IF((FLAG.NE.0))GOTO 10008
          IF((EVAL(RD,ROW,RPN,CBUF).NE.1))GOTO 10009
            I=I+1
10009     GOTO 10010
10008     I=I+1
10010 GOTO 10006
10007 CALL PRINT(-11,AAAAA0,I)
      CALL SWT
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
      INTEGER AAAAB0(19)
      DATA AAAAB0/201,238,246,225,236,233,228,160,229,248,240,242,229,24
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
      IF((ARGAA0(APAAA0).EQ.0))GOTO 10011
        CALL PSYNER(AAAAB0,1)
10011 CALL PUSH(0)
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
10012 IF((SYMTY0.NE.252))GOTO 10013
        CALL GETSYM
        CALL TERM
        CALL PUSH(252)
      GOTO 10012
10013 RETURN
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
10014 IF((SYMTY0.NE.166))GOTO 10015
        CALL GETSYM
        CALL FACTOR
        CALL PUSH(166)
      GOTO 10014
10015 RETURN
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
      IF((SYMTY0.NE.254))GOTO 10016
        CALL GETSYM
        CALL FACTOR
        CALL PUSH(254)
        GOTO 10017
10016   CALL PRIMA0
10017 RETURN
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
      INTEGER AAAAC0(23)
      INTEGER AAAAD0(28)
      INTEGER AAAAE0
      INTEGER AAAAF0
      INTEGER AAAAG0
      INTEGER AAAAH0(33)
      INTEGER AAAAI0
      INTEGER AAAAJ0(33)
      INTEGER AAAAK0(40)
      DATA AAAAC0/245,238,226,225,236,225,238,227,229,228,160,240,225,24
     *2,229,238,244,232,229,243,229,243,0/
      DATA AAAAD0/237,233,243,243,233,238,231,160,242,229,236,225,244,23
     *3,239,238,225,236,160,239,240,229,242,225,244,239,242,0/
      DATA AAAAH0/195,239,237,240,225,242,233,238,231,160,244,247,239,16
     *0,236,233,244,229,242,225,236,243,160,233,243,160,226,239,231,245,
     *243,161,0/
      DATA AAAAJ0/195,239,237,240,225,242,233,238,231,160,244,247,239,16
     *0,236,233,244,229,242,225,236,243,160,233,243,160,226,239,231,245,
     *243,161,0/
      DATA AAAAK0/244,249,240,229,243,160,244,239,160,226,229,160,227,23
     *9,237,240,225,242,229,228,160,225,242,229,160,238,239,244,160,227,
     *239,237,240,225,244,233,226,236,229,0/
      IF((SYMTY0.NE.168))GOTO 10018
        CALL GETSYM
        CALL EXPR
        IF((SYMTY0.EQ.169))GOTO 10019
          CALL PSYNER(AAAAC0,1)
10019   CALL GETSYM
        GOTO 10020
10018   CALL FIELD(FT1,S1)
        IF((SYMTY0.EQ.188))GOTO 10021
        IF((SYMTY0.EQ.190))GOTO 10021
        IF((SYMTY0.EQ.220))GOTO 10021
        IF((SYMTY0.EQ.175))GOTO 10021
        IF((SYMTY0.EQ.222))GOTO 10021
        IF((SYMTY0.EQ.189))GOTO 10021
          CALL PSYNER(AAAAD0,1)
10021   OP=SYMTY0
        CALL GETSYM
        CALL FIELD(FT2,S2)
        TYPE1=3
        TYPE2=3
        AAAAE0=FT1
        GOTO 10022
10023     P1=GETQU0(S1)
          TYPE1=RDAAA0(P1)
          AAAAF0=FT2
          GOTO 10024
10025       P2=GETQU0(S2)
            TYPE2=RDAAA0(P2)
          GOTO 10026
10027       P2=CONVE0(S2,TYPE1)
            TYPE2=TYPE1
          GOTO 10026
10028       TYPE2=3
            P2=CONVE0(S2,3)
          GOTO 10026
10024     IF(AAAAF0.EQ.162)GOTO 10028
          IF(AAAAF0.EQ.176)GOTO 10027
          IF(AAAAF0.EQ.193)GOTO 10025
10026   GOTO 10029
10030     AAAAG0=FT2
          GOTO 10031
10032       P2=GETQU0(S2)
            TYPE2=RDAAA0(P2)
            TYPE1=RDAAA0(P2)
            P1=CONVE0(S1,TYPE1)
          GOTO 10033
10034       CALL PSYNER(AAAAH0,1)
          GOTO 10033
10031     IF(AAAAG0.EQ.162)GOTO 10034
          IF(AAAAG0.EQ.176)GOTO 10034
          IF(AAAAG0.EQ.193)GOTO 10032
10033   GOTO 10029
10035     TYPE1=3
          P1=CONVE0(S1,3)
          AAAAI0=FT2
          GOTO 10036
10037       P2=GETQU0(S2)
            TYPE2=RDAAA0(P2)
          GOTO 10038
10039       CALL PSYNER(AAAAJ0,1)
          GOTO 10038
10036     IF(AAAAI0.EQ.162)GOTO 10039
          IF(AAAAI0.EQ.176)GOTO 10039
          IF(AAAAI0.EQ.193)GOTO 10037
10038   GOTO 10029
10022   IF(AAAAE0.EQ.162)GOTO 10035
        IF(AAAAE0.EQ.176)GOTO 10030
        IF(AAAAE0.EQ.193)GOTO 10023
10029   IF((TYPE1.EQ.TYPE2))GOTO 10040
          CALL PSYNER(AAAAK0,1)
10040   CALL PUSH(OP)
        CALL PUSH(FT1)
        CALL PUSH(P1)
        CALL PUSH(FT2)
        CALL PUSH(P2)
10020 RETURN
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
      INTEGER AAAAL0(32)
      DATA AAAAL0/229,248,240,229,227,244,229,228,160,228,239,237,225,23
     *3,238,160,238,225,237,229,160,239,242,160,236,233,244,229,242,225,
     *236,0/
      IF((SYMTY0.EQ.193))GOTO 10041
      IF((SYMTY0.EQ.176))GOTO 10041
      IF((SYMTY0.EQ.162))GOTO 10041
        CALL PSYNER(AAAAL0,1)
10041 FT=SYMTY0
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
      INTEGER AAAAM0(32)
      DATA AAAAM0/186,160,228,239,237,225,233,238,160,238,239,244,160,23
     *0,239,245,238,228,160,239,242,160,225,237,226,233,231,245,239,245,
     *243,0/
      I=FINDQ0(RDAAA0,NAME,POS2A0)
      IF((I.NE.0))GOTO 10042
        CALL PRINT(-15,'*s.',NAME)
        CALL PSYNER(AAAAM0,0)
10042 GETQU0=I
      RETURN
      END
      INTEGER FUNCTION FINDQ0(RD,NAME,POS2)
      INTEGER RD(884)
      INTEGER NAME(1)
      INTEGER POS2
      INTEGER P,I
      INTEGER EQUAL
      INTEGER RNAME(17)
      INTEGER AAAAN0(3)
      INTEGER AAAAO0(3)
      DATA AAAAN0/174,177,0/
      DATA AAAAO0/174,178,0/
      I=1
      GOTO 10045
10043 I=I+(1)
10045 IF((NAME(I).EQ.0))GOTO 10044
      IF((NAME(I).EQ.174))GOTO 10044
      IF((I.GE.17))GOTO 10044
        RNAME(I)=NAME(I)
      GOTO 10043
10044 RNAME(I)=0
      P=0
      IF((NAME(I).EQ.0))GOTO 10047
      IF((POS2.EQ.0))GOTO 10047
      GOTO 10046
10047   I=3+1
        GOTO 10050
10048   I=I+22
10050   IF((I.GT.RD(2)))GOTO 10049
          IF((EQUAL(RNAME,RD(I+5)).NE.1))GOTO 10051
            IF((P.NE.0))GOTO 10052
              P=I
              GOTO 10053
10052         P=0
              GOTO 10049
10053     CONTINUE
10051   GOTO 10048
10049   GOTO 10054
10046   IF((EQUAL(NAME(I),AAAAN0).NE.1))GOTO 10055
          I=3+1
          GOTO 10058
10056     I=I+22
10058     IF((I.EQ.POS2))GOTO 10057
            IF((EQUAL(RNAME,RD(I+5)).NE.1))GOTO 10059
              P=I
              GOTO 10057
10059     GOTO 10056
10057     GOTO 10060
10055     IF((EQUAL(NAME(I),AAAAO0).NE.1))GOTO 10061
            I=POS2
            GOTO 10064
10062       I=I+22
10064       IF((I.GT.RD(2)))GOTO 10063
              IF((EQUAL(RNAME,RD(I+5)).NE.1))GOTO 10065
                P=I
                GOTO 10063
10065       GOTO 10062
10063     CONTINUE
10061   CONTINUE
10060 CONTINUE
10054 FINDQ0=P
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
      INTEGER AAAAP0
      INTEGER AAAAQ0(18)
      INTEGER AAAAR0(3)
      INTEGER AAAAS0(25)
      INTEGER AAAAT0(18)
      INTEGER AAAAU0(3)
      INTEGER AAAAV0(22)
      INTEGER AAAAW0(18)
      DATA AAAAQ0/212,239,239,160,237,225,238,249,160,236,233,244,229,24
     *2,225,236,243,0/
      DATA AAAAR0/170,243,0/
      DATA AAAAS0/201,238,246,225,236,233,228,160,233,238,244,229,231,22
     *9,242,160,227,239,238,243,244,225,238,244,0/
      DATA AAAAT0/212,239,239,160,237,225,238,249,160,236,233,244,229,24
     *2,225,236,243,0/
      DATA AAAAU0/170,243,0/
      DATA AAAAV0/201,238,246,225,236,233,228,160,242,229,225,236,160,22
     *7,239,238,243,244,225,238,244,0/
      DATA AAAAW0/212,239,239,160,237,225,238,249,160,236,233,244,229,24
     *2,225,236,243,0/
      P=CBUFL0
      AAAAP0=TYPE
      GOTO 10066
10067   CBUFL0=CBUFL0+(2)
        IF((CBUFL0.LE.500))GOTO 10068
          CALL PSYNER(AAAAQ0,1)
10068   I=1
        L=GCTOL(S,I,10)
        IF((S(I).EQ.0))GOTO 10069
          CALL PRINT(-15,AAAAR0,S)
          CALL PSYNER(AAAAS0,0)
10069   CALL MOVE$(L,CBUFA0(P),2)
      GOTO 10070
10071   CBUFL0=CBUFL0+(4)
        IF((CBUFL0.LE.500))GOTO 10072
          CALL PSYNER(AAAAT0,1)
10072   I=1
        D=CTOD(S,I)
        IF((S(I).EQ.0))GOTO 10073
          CALL PRINT(-15,AAAAU0,S)
          CALL PSYNER(AAAAV0,0)
10073   CALL MOVE$(D,CBUFA0(P),4)
      GOTO 10070
10074   I=LENGTH(S)+1
        CBUFL0=CBUFL0+(I)
        IF((CBUFL0.LE.500))GOTO 10075
          CALL PSYNER(AAAAW0,1)
10075   CALL MOVE$(S,CBUFA0(P),I)
      GOTO 10070
10066 GOTO(10067,10071,10074),AAAAP0
10070 CONVE0=P
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
      INTEGER AAAAX0
      INTEGER AAAAY0(14)
      INTEGER AAAAZ0
      INTEGER AAABA0
      INTEGER AAABB0
      INTEGER AAABC0
      INTEGER AAABD0
      INTEGER AAABE0
      INTEGER AAABF0
      INTEGER AAABG0(18)
      DATA AAAAY0/205,233,243,243,233,238,231,160,241,245,239,244,229,0/
      DATA AAABG0/201,236,236,229,231,225,236,160,227,232,225,242,225,22
     *7,244,229,242,0/
10076 IF((ARGAA0(APAAA0).NE.160))GOTO 10077
        APAAA0=APAAA0+(1)
      GOTO 10076
10077 L=1
      AAAAX0=ARGAA0(APAAA0)
      GOTO 10078
10079   SYMTE0(L)=ARGAA0(APAAA0)
        APAAA0=APAAA0+(1)
        L=L+(1)
        GOTO 10082
10080   APAAA0=APAAA0+(1)
        L=L+(1)
10082   IF((193.GT.ARGAA0(APAAA0)))GOTO 10084
        IF((ARGAA0(APAAA0).GT.218))GOTO 10084
        GOTO 10083
10084   IF((225.GT.ARGAA0(APAAA0)))GOTO 10085
        IF((ARGAA0(APAAA0).GT.250))GOTO 10085
        GOTO 10083
10085   IF((176.GT.ARGAA0(APAAA0)))GOTO 10086
        IF((ARGAA0(APAAA0).GT.185))GOTO 10086
        GOTO 10083
10086   IF((ARGAA0(APAAA0).EQ.223))GOTO 10083
        IF((ARGAA0(APAAA0).EQ.174))GOTO 10083
        GOTO 10081
10083     SYMTE0(L)=ARGAA0(APAAA0)
        GOTO 10080
10081   SYMTY0=193
      GOTO 10087
10088   SYMTE0(L)=ARGAA0(APAAA0)
        APAAA0=APAAA0+(1)
        L=L+(1)
        GOTO 10091
10089   APAAA0=APAAA0+(1)
        L=L+(1)
10091   IF((176.GT.ARGAA0(APAAA0)))GOTO 10093
        IF((ARGAA0(APAAA0).GT.185))GOTO 10093
        GOTO 10092
10093   IF((ARGAA0(APAAA0).EQ.174))GOTO 10092
        IF((ARGAA0(APAAA0).EQ.171))GOTO 10092
        IF((ARGAA0(APAAA0).EQ.173))GOTO 10092
        IF((ARGAA0(APAAA0).EQ.229))GOTO 10092
        IF((ARGAA0(APAAA0).EQ.197))GOTO 10092
        IF((ARGAA0(APAAA0).EQ.242))GOTO 10092
        IF((ARGAA0(APAAA0).EQ.210))GOTO 10092
        GOTO 10090
10092     SYMTE0(L)=ARGAA0(APAAA0)
        GOTO 10089
10090   SYMTY0=176
      GOTO 10087
10094   QUOTE=ARGAA0(APAAA0)
        APAAA0=APAAA0+(1)
        L=1
        GOTO 10097
10095   APAAA0=APAAA0+(1)
        L=L+(1)
10097   IF((ARGAA0(APAAA0).EQ.0))GOTO 10096
        IF((ARGAA0(APAAA0).EQ.QUOTE))GOTO 10096
          SYMTE0(L)=ARGAA0(APAAA0)
        GOTO 10095
10096   SYMTE0(L)=0
        IF((ARGAA0(APAAA0).NE.0))GOTO 10098
          CALL PSYNER(AAAAY0,1)
          GOTO 10099
10098     APAAA0=APAAA0+(1)
10099   SYMTY0=162
      GOTO 10087
10100   SYMTY0=ARGAA0(APAAA0)
        SYMTE0(1)=ARGAA0(APAAA0)
        APAAA0=APAAA0+(1)
        L=L+(1)
      GOTO 10087
10101   SYMTE0(1)=188
        APAAA0=APAAA0+(1)
        L=L+(1)
        AAAAZ0=ARGAA0(APAAA0)
        GOTO 10102
10103     SYMTY0=222
        GOTO 10104
10105     SYMTY0=175
        GOTO 10104
10104     SYMTE0(2)=ARGAA0(APAAA0)
          APAAA0=APAAA0+(1)
          L=L+(1)
        GOTO 10106
10102   AAABA0=AAAAZ0-188
        GOTO(10105,10103),AAABA0
          SYMTY0=188
10106 GOTO 10087
10107   SYMTE0(1)=190
        APAAA0=APAAA0+(1)
        L=L+(1)
        AAABB0=ARGAA0(APAAA0)
        GOTO 10108
10109     SYMTY0=222
        GOTO 10110
10111     SYMTY0=220
        GOTO 10110
10110     SYMTE0(2)=ARGAA0(APAAA0)
          APAAA0=APAAA0+(1)
          L=L+(1)
        GOTO 10112
10108   AAABC0=AAABB0-187
        GOTO(10109,10111),AAABC0
          SYMTY0=190
10112 GOTO 10087
10113   SYMTE0(1)=189
        APAAA0=APAAA0+(1)
        L=L+(1)
        AAABD0=ARGAA0(APAAA0)
        GOTO 10114
10115     SYMTY0=189
        GOTO 10116
10117     SYMTY0=220
        GOTO 10116
10118     SYMTY0=175
        GOTO 10116
10116     SYMTE0(2)=ARGAA0(APAAA0)
          APAAA0=APAAA0+(1)
          L=L+(1)
        GOTO 10119
10114   AAABE0=AAABD0-187
        GOTO(10118,10115,10117),AAABE0
          SYMTY0=189
10119 GOTO 10087
10120   SYMTE0(1)=254
        APAAA0=APAAA0+(1)
        L=L+(1)
        IF((ARGAA0(APAAA0).NE.189))GOTO 10121
          SYMTY0=222
          SYMTE0(2)=189
          APAAA0=APAAA0+(1)
          L=L+(1)
          GOTO 10122
10121     SYMTY0=254
10122 GOTO 10087
10123   SYMTY0=0
      GOTO 10087
10078 IF(AAAAX0.EQ.0)GOTO 10123
      AAABF0=AAAAX0-161
      GOTO(10094,10124,10124,10124,10100,10094,10100,10100,10124,10088,1
     *0124,10088,10100,10124,10088,10088,10088,10088,10088,10088,10088,1
     *0088,10088,10088,10124,10124,10101,10113,10107,10124,10124,10079,1
     *0079,10079,10079,10079,10079,10079,10079,10079,10079,10079,10079,1
     *0079,10079,10079,10079,10079,10079,10079,10079,10079,10079,10079,1
     *0079,10079,10079,10124,10124,10124,10124,10124,10124,10079,10079,1
     *0079,10079,10079,10079,10079,10079,10079,10079,10079,10079,10079,1
     *0079,10079,10079,10079,10079,10079,10079,10079,10079,10079,10079,1
     *0079,10079,10124,10100,10124,10120),AAABF0
10124   CALL PSYNER(AAABG0,1)
10087 SYMTE0(L)=0
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
      INTEGER AAABH0(37)
      DATA AAABH0/211,229,236,229,227,244,233,239,238,160,229,248,240,24
     *2,229,243,243,233,239,238,160,244,239,239,160,227,239,237,240,236,
     *233,227,225,244,229,228,0/
      IF((RPNLE0.LT.200))GOTO 10125
        CALL PSYNER(AAABH0,1)
        GOTO 10126
10125   RPNAA0(RPNLE0)=W
        RPNLE0=RPNLE0+(1)
10126 RETURN
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
      INTEGER AAABI0(15)
      INTEGER AAABJ0(5)
      DATA AAABI0/170,243,186,160,170,243,170,238,170,163,248,222,170,23
     *8,0/
      DATA AAABJ0/170,243,170,238,0/
      IF((C.NE.1))GOTO 10127
        CALL PRINT(-15,AAABI0,ARGAA0,M,APAAA0-2)
        GOTO 10128
10127   CALL PRINT(-15,AAABJ0,M)
10128 CALL PL1$NL(ERRLA0)
      END
      INTEGER FUNCTION EVAL(RD,ROW,RPN,CBUF)
      INTEGER RD(884)
      INTEGER ROW(1),RPN(1),CBUF(500)
      INTEGER SP,RP,I1,I2,R
      INTEGER BUF1(102),BUF2(102),STACK(200)
      INTEGER EVALR0
      INTEGER P1,P2
      INTEGER AAABK0
      INTEGER AAABL0
      INTEGER AAABM0(30)
      DATA AAABM0/233,238,160,229,246,225,236,186,160,243,244,225,227,23
     *5,160,237,229,243,243,229,228,160,245,240,160,170,233,170,238,0/
      SP=0
      RP=1
      GOTO 10131
10129 RP=RP+(1)
10131 IF((RPN(RP).EQ.0))GOTO 10130
        AAABK0=RPN(RP)
        GOTO 10132
10133     IF((STACK(SP).NE.1))GOTO 10134
          IF((STACK(SP-1).NE.1))GOTO 10134
            STACK(SP-1)=1
            GOTO 10135
10134       STACK(SP-1)=0
10135     SP=SP-(1)
        GOTO 10136
10137     IF((STACK(SP).EQ.1))GOTO 10139
          IF((STACK(SP-1).EQ.1))GOTO 10139
          GOTO 10138
10139       STACK(SP-1)=1
            GOTO 10140
10138       STACK(SP-1)=0
10140     SP=SP-(1)
        GOTO 10136
10141     IF((STACK(SP).NE.1))GOTO 10142
            STACK(SP)=0
            GOTO 10143
10142       STACK(SP)=1
10143   GOTO 10136
10132   IF(AAABK0.EQ.166)GOTO 10133
        AAABL0=AAABK0-251
        GOTO(10137,10144,10141),AAABL0
10144     I1=RPN(RP+1)
          P1=RPN(RP+2)
          I2=RPN(RP+3)
          P2=RPN(RP+4)
          IF((I1.NE.193))GOTO 10145
          IF((I2.NE.193))GOTO 10145
            CALL GETDA0(RD,P1,ROW,BUF1)
            CALL GETDA0(RD,P2,ROW,BUF2)
            R=EVALR0(RPN(RP),RD(P1),BUF1,BUF2)
            GOTO 10146
10145       IF((I1.NE.193))GOTO 10147
              CALL GETDA0(RD,P1,ROW,BUF1)
              R=EVALR0(RPN(RP),RD(P1),BUF1,CBUF(P2))
              GOTO 10148
10147         IF((I2.NE.193))GOTO 10149
                CALL GETDA0(RD,P2,ROW,BUF2)
                R=EVALR0(RPN(RP),RD(P2),CBUF(P1),BUF2)
                GOTO 10150
10149           R=EVALR0(RPN(RP),0,CBUF(P1),CBUF(P2))
10150       CONTINUE
10148     CONTINUE
10146     SP=SP+(1)
          STACK(SP)=R
          RP=RP+(4)
10136 GOTO 10129
10130 IF((SP.EQ.1))GOTO 10151
        CALL PRINT(-15,AAABM0,SP)
10151 EVAL=STACK(1)
      RETURN
      END
      INTEGER FUNCTION EVALR0(OP,TYPE,BUF1,BUF2)
      INTEGER OP,TYPE,BUF1(1),BUF2(1)
      INTEGER R
      INTEGER COMPA0
      INTEGER AAABN0
      INTEGER AAABO0
      INTEGER AAABP0(30)
      DATA AAABP0/233,238,160,229,246,225,236,223,242,229,236,186,160,22
     *6,239,231,245,243,160,229,238,244,242,249,160,170,233,170,238,0/
      AAABN0=OP
      GOTO 10152
10153   IF((COMPA0(TYPE,BUF1,BUF2).NE.1))GOTO 10154
          R=1
          GOTO 10155
10154     R=0
10155 GOTO 10156
10157   IF((COMPA0(TYPE,BUF1,BUF2).NE.2))GOTO 10158
          R=1
          GOTO 10159
10158     R=0
10159 GOTO 10156
10160   IF((COMPA0(TYPE,BUF1,BUF2).NE.3))GOTO 10161
          R=1
          GOTO 10162
10161     R=0
10162 GOTO 10156
10163   IF((COMPA0(TYPE,BUF1,BUF2).EQ.3))GOTO 10164
          R=1
          GOTO 10165
10164     R=0
10165 GOTO 10156
10166   IF((COMPA0(TYPE,BUF1,BUF2).EQ.2))GOTO 10167
          R=1
          GOTO 10168
10167     R=0
10168 GOTO 10156
10169   IF((COMPA0(TYPE,BUF1,BUF2).EQ.1))GOTO 10170
          R=1
          GOTO 10171
10170     R=0
10171 GOTO 10156
10152 IF(AAABN0.EQ.175)GOTO 10163
      AAABO0=AAABN0-187
      GOTO(10153,10157,10160),AAABO0
      AAABO0=AAABN0-219
      GOTO(10169,10172,10166),AAABO0
10172   CALL PRINT(-15,AAABP0,OP)
10156 EVALR0=R
      RETURN
      END
      INTEGER FUNCTION LOADRD(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER ISATTY,READF
      IF((ISATTY(FD).NE.1))GOTO 10173
        CALL REMARK('Sorry, a relation can''t be read from the terminal.
     *')
        LOADRD=-3
        RETURN
10173 IF((READF(RD(1),1,FD).NE.-1))GOTO 10174
        LOADRD=-3
        RETURN
10174 IF((READF(RD(2),RD(1)-1,FD).NE.-1))GOTO 10175
        CALL REMARK('relation is corrupted!!.')
        LOADRD=-3
        RETURN
10175 LOADRD=-2
      RETURN
      END
      SUBROUTINE SAVERD(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER ISATTY
      IF((ISATTY(FD).NE.1))GOTO 10176
        CALL PRINT0(RD,FD)
        GOTO 10177
10176   CALL WRITEF(RD,RD(1),FD)
10177 RETURN
      END
      SUBROUTINE PRINT0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER TYPE(102)
      INTEGER AAABQ0(10)
      INTEGER AAABR0(33)
      INTEGER AAABS0(10)
      INTEGER AAABT0
      INTEGER AAABU0(8)
      INTEGER AAABV0(5)
      INTEGER AAABW0(7)
      INTEGER AAABX0(24)
      INTEGER AAABY0(10)
      DATA AAABQ0/170,179,185,172,172,173,248,170,238,0/
      DATA AAABR0/252,160,244,249,240,229,160,160,160,160,252,160,236,22
     *9,238,231,244,232,160,252,160,238,225,237,229,170,177,179,248,252,
     *170,238,0/
      DATA AAABS0/170,179,185,172,172,173,248,170,238,0/
      DATA AAABU0/233,238,244,229,231,229,242,0/
      DATA AAABV0/242,229,225,236,0/
      DATA AAABW0/243,244,242,233,238,231,0/
      DATA AAABX0/252,160,170,183,243,160,252,160,170,181,233,160,160,25
     *2,160,170,177,182,243,160,252,170,238,0/
      DATA AAABY0/170,179,185,172,172,173,248,170,238,0/
      CALL PRINT(FD,AAABQ0)
      CALL PRINT(FD,AAABR0)
      CALL PRINT(FD,AAABS0)
      I=3+1
      GOTO 10180
10178 I=I+22
10180 IF((I.GT.RD(2)))GOTO 10179
        AAABT0=RD(I)
        GOTO 10181
10182     CALL CTOC(AAABU0,TYPE,102)
        GOTO 10183
10184     CALL CTOC(AAABV0,TYPE,102)
        GOTO 10183
10185     CALL CTOC(AAABW0,TYPE,102)
        GOTO 10183
10181   GOTO(10182,10184,10185),AAABT0
10183   CALL PRINT(FD,AAABX0,TYPE,RD(I+1),RD(I+5))
      GOTO 10178
10179 CALL PRINT(FD,AAABY0)
      RETURN
      END
      INTEGER FUNCTION ADDFI0(RD,TYPE,LEN,NAME)
      INTEGER RD(884)
      INTEGER TYPE,LEN
      INTEGER NAME(1)
      INTEGER I
      INTEGER AAABZ0
      I=RD(2)+22
      IF((I+22-1.LE.884))GOTO 10186
        ADDFI0=0
        RETURN
10186 RD(I)=TYPE
      RD(I+4)=LENGTH(NAME)
      AAABZ0=TYPE
      GOTO 10187
10188   RD(I+1)=2
        RD(I+4)=MAX0(RD(I+4),10)
      GOTO 10189
10190   RD(I+1)=4
        RD(I+4)=MAX0(RD(I+4),15)
      GOTO 10189
10191   RD(I+1)=LEN
        RD(I+4)=MAX0(RD(I+4),LEN)
      GOTO 10189
10187 GOTO(10188,10190,10191),AAABZ0
        CALL ERROR('in add_field_to_rd: bogus type passed.')
10189 RD(I+2)=RD(3)+1
      RD(I+3)=RD(3)+RD(I+1)
      CALL CTOC(NAME,RD(I+5),17)
      RD(1)=RD(1)+(22)
      RD(2)=RD(2)+(22)
      RD(3)=RD(3)+(RD(I+1))
      IF((RD(3).LE.500))GOTO 10192
        ADDFI0=0
        RETURN
10192 ADDFI0=I
      RETURN
      END
      INTEGER FUNCTION FINDF0(RD,NAME)
      INTEGER RD(884)
      INTEGER NAME(1)
      INTEGER I
      INTEGER EQUAL
      I=3+1
      GOTO 10195
10193 I=I+22
10195 IF((I.GT.RD(2)))GOTO 10194
        IF((EQUAL(RD(I+5),NAME).NE.1))GOTO 10196
          FINDF0=I
          RETURN
10196 GOTO 10193
10194 FINDF0=0
      RETURN
      END
      INTEGER FUNCTION COMPA0(TYPE,BUF1,BUF2)
      INTEGER TYPE
      INTEGER BUF1(500),BUF2(500)
      INTEGER R
      INTEGER COMPB0,COMPC0,COMPD0
      INTEGER AAACA0
      INTEGER AAACB0(34)
      DATA AAACB0/233,238,160,227,239,237,240,225,242,229,223,230,233,22
     *9,236,228,186,160,226,239,231,245,243,160,244,249,240,229,160,170,
     *233,170,238,0/
      AAACA0=TYPE
      GOTO 10197
10198   R=COMPB0(BUF1,BUF2)
      GOTO 10199
10200   R=COMPC0(BUF1,BUF2)
      GOTO 10199
10201   R=COMPD0(BUF1,BUF2)
      GOTO 10199
10197 GOTO(10198,10200,10201),AAACA0
        CALL PRINT(-15,AAACB0,TYPE)
        R=2
10199 COMPA0=R
      RETURN
      END
      INTEGER FUNCTION COMPB0(I1,I2)
      INTEGER * 4 I1,I2
      IF((I1.GE.I2))GOTO 10202
        COMPB0=1
        RETURN
10202 IF((I1.LE.I2))GOTO 10203
        COMPB0=3
        RETURN
10203 COMPB0=2
      RETURN
      END
      INTEGER FUNCTION COMPC0(D1,D2)
      REAL * 8 D1,D2
      IF((D1.GE.D2))GOTO 10204
        COMPC0=1
        RETURN
10204 IF((D1.LE.D2))GOTO 10205
        COMPC0=3
        RETURN
10205 COMPC0=2
      RETURN
      END
      INTEGER FUNCTION COMPD0(S1,S2)
      INTEGER S1(1),S2(1)
      INTEGER I
      I=1
      GOTO 10208
10206 I=I+(1)
10208 IF((S1(I).NE.S2(I)))GOTO 10207
      IF((S1(I).EQ.0))GOTO 10207
      GOTO 10206
10207 IF((S1(I).NE.S2(I)))GOTO 10209
        COMPD0=2
        RETURN
10209 IF((S1(I).EQ.0))GOTO 10211
      IF((S1(I).LT.S2(I)))GOTO 10211
      GOTO 10210
10211   COMPD0=1
        RETURN
10210 COMPD0=3
      RETURN
      END
      SUBROUTINE PRINU0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER AAACC0(2)
      INTEGER AAACD0(7)
      INTEGER AAACE0(3)
      INTEGER AAACF0(2)
      INTEGER AAACG0(7)
      INTEGER AAACH0(3)
      INTEGER AAACI0(2)
      INTEGER AAACJ0(7)
      INTEGER AAACK0(3)
      DATA AAACC0/173,0/
      DATA AAACD0/170,163,172,172,173,248,0/
      DATA AAACE0/170,238,0/
      DATA AAACF0/252,0/
      DATA AAACG0/160,170,163,243,160,252,0/
      DATA AAACH0/170,238,0/
      DATA AAACI0/173,0/
      DATA AAACJ0/170,163,172,172,173,248,0/
      DATA AAACK0/170,238,0/
      CALL PRINT(FD,AAACC0)
      I=3+1
      GOTO 10214
10212 I=I+22
10214 IF((I.GT.RD(2)))GOTO 10213
        CALL PRINT(FD,AAACD0,RD(I+4)+3)
      GOTO 10212
10213 CALL PRINT(FD,AAACE0)
      CALL PRINT(FD,AAACF0)
      I=3+1
      GOTO 10217
10215 I=I+22
10217 IF((I.GT.RD(2)))GOTO 10216
        CALL PRINT(FD,AAACG0,RD(I+4),RD(I+5))
      GOTO 10215
10216 CALL PRINT(FD,AAACH0)
      CALL PRINT(FD,AAACI0)
      I=3+1
      GOTO 10220
10218 I=I+22
10220 IF((I.GT.RD(2)))GOTO 10219
        CALL PRINT(FD,AAACJ0,RD(I+4)+3)
      GOTO 10218
10219 CALL PRINT(FD,AAACK0)
      RETURN
      END
      SUBROUTINE PRINV0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER AAACL0(2)
      INTEGER AAACM0(7)
      INTEGER AAACN0(3)
      DATA AAACL0/173,0/
      DATA AAACM0/170,163,172,172,173,248,0/
      DATA AAACN0/170,238,0/
      CALL PRINT(FD,AAACL0)
      I=3+1
      GOTO 10223
10221 I=I+22
10223 IF((I.GT.RD(2)))GOTO 10222
        CALL PRINT(FD,AAACM0,RD(I+4)+3)
      GOTO 10221
10222 CALL PRINT(FD,AAACN0)
      RETURN
      END
      SUBROUTINE PRINW0(RD,FD,BUF)
      INTEGER RD(884)
      INTEGER FD
      INTEGER BUF(500)
      INTEGER I
      INTEGER AAACO0(2)
      INTEGER AAACP0
      INTEGER AAACQ0(7)
      INTEGER AAACR0(7)
      INTEGER AAACS0(9)
      INTEGER AAACT0(3)
      DATA AAACO0/252,0/
      DATA AAACQ0/160,170,163,236,160,252,0/
      DATA AAACR0/160,170,163,228,160,252,0/
      DATA AAACS0/160,170,163,172,163,243,160,252,0/
      DATA AAACT0/170,238,0/
      CALL PRINT(FD,AAACO0)
      I=3+1
      GOTO 10226
10224 I=I+22
10226 IF((I.GT.RD(2)))GOTO 10225
        AAACP0=RD(I)
        GOTO 10227
10228     CALL PRINT(FD,AAACQ0,RD(I+4),BUF(RD(I+2)))
        GOTO 10229
10230     CALL PRINT(FD,AAACR0,RD(I+4),BUF(RD(I+2)))
        GOTO 10229
10231     CALL PRINT(FD,AAACS0,RD(I+4),RD(I+1),BUF(RD(I+2)))
        GOTO 10229
10227   GOTO(10228,10230,10231),AAACP0
10229 GOTO 10224
10225 CALL PRINT(FD,AAACT0)
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
      IF((ISATTY(FD).NE.1))GOTO 10232
        CALL PRINW0(RD,FD,BUF)
        GOTO 10233
10232   CALL WRITEF(BUF,RD(3),FD)
10233 RETURN
      END
      SUBROUTINE GETDA0(RD,I,BUF,DEST)
      INTEGER RD(884)
      INTEGER I,BUF(1),DEST(102)
      INTEGER J,K
      INTEGER AAACU0
      AAACU0=RD(I)
      GOTO 10234
10235   J=RD(I+2)
        DEST(1)=BUF(J)
        DEST(2)=BUF(J+1)
      GOTO 10236
10237   J=RD(I+2)
        DEST(1)=BUF(J)
        DEST(2)=BUF(J+1)
        DEST(3)=BUF(J+2)
        DEST(4)=BUF(J+3)
      GOTO 10236
10238   J=RD(I+3)
        K=RD(I+1)
        GOTO 10241
10239   J=J-(1)
        K=K-(1)
10241   IF((K.LE.0))GOTO 10240
        IF((BUF(J).NE.160))GOTO 10240
        GOTO 10239
10240   DEST(K+1)=0
        GOTO 10244
10242   J=J-(1)
        K=K-(1)
10244   IF((K.LE.0))GOTO 10243
          DEST(K)=BUF(J)
        GOTO 10242
10243 GOTO 10236
10234 GOTO(10235,10237,10238),AAACU0
10236 RETURN
      END
      SUBROUTINE PUTDA0(RD,I,BUF,SRC)
      INTEGER RD(884)
      INTEGER I,BUF(1),SRC(102)
      INTEGER J,K
      INTEGER AAACV0
      AAACV0=RD(I)
      GOTO 10245
10246   J=RD(I+2)
        BUF(J)=SRC(1)
        BUF(J+1)=SRC(2)
      GOTO 10247
10248   J=RD(I+2)
        BUF(J)=SRC(1)
        BUF(J+1)=SRC(2)
        BUF(J+2)=SRC(3)
        BUF(J+3)=SRC(4)
      GOTO 10247
10249   J=RD(I+2)
        K=1
        GOTO 10252
10250   J=J+(1)
        K=K+(1)
10252   IF((SRC(K).EQ.0))GOTO 10251
        IF((K.GT.RD(I+1)))GOTO 10251
          BUF(J)=SRC(K)
        GOTO 10250
10251   GOTO 10255
10253   K=K+(1)
        J=J+(1)
10255   IF((K.GT.RD(I+1)))GOTO 10254
          BUF(J)=160
        GOTO 10253
10254 GOTO 10247
10245 GOTO(10246,10248,10249),AAACV0
10247 RETURN
      END
      INTEGER FUNCTION COMPE0(RD,ROW1,ROW2)
      INTEGER RD(884)
      INTEGER ROW1(500),ROW2(500)
      INTEGER BUF1(500),BUF2(500)
      INTEGER R,I
      INTEGER COMPA0
      I=3+1
      GOTO 10258
10256 I=I+22
10258 IF((I.GT.RD(2)))GOTO 10257
        CALL GETDA0(RD,I,ROW1,BUF1)
        CALL GETDA0(RD,I,ROW2,BUF2)
        R=COMPA0(RD(I),BUF1,BUF2)
        IF((R.EQ.2))GOTO 10259
          COMPE0=R
          RETURN
10259 GOTO 10256
10257 COMPE0=2
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
C Arg                            argaa0
C findfield                      findf0
C findqualfield                  findq0
C Symtype                        symty0
C Symtext                        symte0
C convert                        conve0
C printrd                        print0
C printrow                       prinw0
C primary                        prima0
C comparereal                    compc0
C Errlab                         errla0
C getdata                        getda0
C Cbuf                           cbufa0
C addfieldtord                   addfi0
