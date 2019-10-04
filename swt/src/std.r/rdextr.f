      INTEGER RD(884)
      INTEGER I,J,ERRS
      INTEGER FP,FLEN(40),FDELIM(40),FINDEX(40),LASTFP
      INTEGER ROW(500),BUF(102)
      INTEGER GETROW,FINDF0,LOADRD,CTOI,GETLIN
      INTEGER STR(400),WORD(102),NAME(102)
      INTEGER AAAAA0(23)
      INTEGER AAAAB0
      INTEGER AAAAC0(26)
      INTEGER AAAAD0(22)
      INTEGER AAAAE0
      INTEGER AAAAF0(4)
      INTEGER AAAAG0(4)
      INTEGER AAAAH0(4)
      INTEGER AAAAI0(3)
      INTEGER AAAAJ0(3)
      INTEGER AAAAK0(2)
      DATA AAAAA0/186,160,228,239,237,225,233,238,160,238,239,244,160,23
     *0,239,245,238,228,186,160,170,243,0/
      DATA AAAAC0/201,236,236,229,231,225,236,160,239,245,244,240,245,24
     *4,160,236,229,238,231,244,232,186,160,170,243,0/
      DATA AAAAD0/213,238,242,229,227,239,231,238,233,250,229,228,160,24
     *7,239,242,228,186,160,170,243,0/
      DATA AAAAF0/170,163,236,0/
      DATA AAAAG0/170,163,228,0/
      DATA AAAAH0/170,163,243,0/
      DATA AAAAI0/170,238,0/
      DATA AAAAJ0/170,227,0/
      DATA AAAAK0/160,0/
      ERRS=0
      IF((LOADRD(RD,-10).EQ.-2))GOTO 10000
        CALL ERROR('Cannot access input relation.')
10000 FP=1
      GOTO 10003
10001 FP=FP+(1)
10003 IF((GETLIN(STR,-12).EQ.-1))GOTO 10002
        I=1
        CALL GETWO0(STR,I,NAME)
        FINDEX(FP)=FINDF0(RD,NAME)
        IF((FINDEX(FP).NE.0))GOTO 10004
          ERRS=ERRS+(1)
          CALL PRINT(-15,AAAAA0,STR)
10004   FLEN(FP)=0
        FDELIM(FP)=160
10005     CALL GETWO0(STR,I,WORD)
          AAAAB0=WORD(1)
          GOTO 10006
10007       FDELIM(FP)=WORD(2)
          GOTO 10008
10009       J=2
            FLEN(FP)=CTOI(WORD,J)
            IF((FLEN(FP).LT.0))GOTO 10011
            IF((WORD(J).NE.0))GOTO 10011
            GOTO 10010
10011         ERRS=ERRS+(1)
              CALL PRINT(-15,AAAAC0,STR)
10010     GOTO 10008
10012       GOTO 10013
10006     IF(AAAAB0.EQ.0)GOTO 10012
          IF(AAAAB0.EQ.163)GOTO 10012
          IF(AAAAB0.EQ.196)GOTO 10007
          IF(AAAAB0.EQ.204)GOTO 10009
          IF(AAAAB0.EQ.228)GOTO 10007
          IF(AAAAB0.EQ.236)GOTO 10009
            ERRS=ERRS+(1)
            CALL PRINT(-15,AAAAD0,STR)
10008   CONTINUE
        GOTO 10005
10013 GOTO 10001
10002 IF((ERRS.LE.0))GOTO 10014
        CALL SWT
10014 LASTFP=FP-1
10015 IF((GETROW(RD,-10,ROW).EQ.-1))GOTO 10016
        FP=1
        GOTO 10019
10017   FP=FP+(1)
10019   IF((FP.GT.LASTFP))GOTO 10018
          CALL GETDA0(RD,FINDEX(FP),ROW,BUF)
          AAAAE0=RD(FINDEX(FP))
          GOTO 10020
10021       CALL PRINT(-11,AAAAF0,FLEN(FP),BUF)
          GOTO 10022
10023       CALL PRINT(-11,AAAAG0,FLEN(FP),BUF)
          GOTO 10022
10024       CALL PRINT(-11,AAAAH0,FLEN(FP),BUF)
          GOTO 10022
10020     GOTO(10021,10023,10024),AAAAE0
10022     IF((FP.NE.LASTFP))GOTO 10025
            CALL PRINT(-11,AAAAI0)
            GOTO 10026
10025       IF((FDELIM(FP).EQ.0))GOTO 10027
              CALL PRINT(-11,AAAAJ0,FDELIM(FP))
              GOTO 10028
10027         IF((FLEN(FP).GT.0))GOTO 10029
                CALL PRINT(-11,AAAAK0)
10029       CONTINUE
10028     CONTINUE
10026   GOTO 10017
10018 GOTO 10015
10016 CALL SWT
      END
      SUBROUTINE GETWO0(STR,I,WORD)
      INTEGER STR(1),WORD(102)
      INTEGER I
      INTEGER J
10030 IF((STR(I).NE.160))GOTO 10031
        I=I+(1)
      GOTO 10030
10031 J=1
      GOTO 10034
10032 I=I+(1)
      J=J+(1)
10034 IF((STR(I).EQ.160))GOTO 10033
      IF((STR(I).EQ.138))GOTO 10033
      IF((STR(I).EQ.0))GOTO 10033
        WORD(J)=STR(I)
      GOTO 10032
10033 WORD(J)=0
      RETURN
      END
      INTEGER FUNCTION LOADRD(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER ISATTY,READF
      IF((ISATTY(FD).NE.1))GOTO 10035
        CALL REMARK('Sorry, a relation can''t be read from the terminal.
     *')
        LOADRD=-3
        RETURN
10035 IF((READF(RD(1),1,FD).NE.-1))GOTO 10036
        LOADRD=-3
        RETURN
10036 IF((READF(RD(2),RD(1)-1,FD).NE.-1))GOTO 10037
        CALL REMARK('relation is corrupted!!.')
        LOADRD=-3
        RETURN
10037 LOADRD=-2
      RETURN
      END
      SUBROUTINE SAVERD(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER ISATTY
      IF((ISATTY(FD).NE.1))GOTO 10038
        CALL PRINT0(RD,FD)
        GOTO 10039
10038   CALL WRITEF(RD,RD(1),FD)
10039 RETURN
      END
      SUBROUTINE PRINT0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER TYPE(102)
      INTEGER AAAAL0(10)
      INTEGER AAAAM0(33)
      INTEGER AAAAN0(10)
      INTEGER AAAAO0
      INTEGER AAAAP0(8)
      INTEGER AAAAQ0(5)
      INTEGER AAAAR0(7)
      INTEGER AAAAS0(24)
      INTEGER AAAAT0(10)
      DATA AAAAL0/170,179,185,172,172,173,248,170,238,0/
      DATA AAAAM0/252,160,244,249,240,229,160,160,160,160,252,160,236,22
     *9,238,231,244,232,160,252,160,238,225,237,229,170,177,179,248,252,
     *170,238,0/
      DATA AAAAN0/170,179,185,172,172,173,248,170,238,0/
      DATA AAAAP0/233,238,244,229,231,229,242,0/
      DATA AAAAQ0/242,229,225,236,0/
      DATA AAAAR0/243,244,242,233,238,231,0/
      DATA AAAAS0/252,160,170,183,243,160,252,160,170,181,233,160,160,25
     *2,160,170,177,182,243,160,252,170,238,0/
      DATA AAAAT0/170,179,185,172,172,173,248,170,238,0/
      CALL PRINT(FD,AAAAL0)
      CALL PRINT(FD,AAAAM0)
      CALL PRINT(FD,AAAAN0)
      I=3+1
      GOTO 10042
10040 I=I+22
10042 IF((I.GT.RD(2)))GOTO 10041
        AAAAO0=RD(I)
        GOTO 10043
10044     CALL CTOC(AAAAP0,TYPE,102)
        GOTO 10045
10046     CALL CTOC(AAAAQ0,TYPE,102)
        GOTO 10045
10047     CALL CTOC(AAAAR0,TYPE,102)
        GOTO 10045
10043   GOTO(10044,10046,10047),AAAAO0
10045   CALL PRINT(FD,AAAAS0,TYPE,RD(I+1),RD(I+5))
      GOTO 10040
10041 CALL PRINT(FD,AAAAT0)
      RETURN
      END
      INTEGER FUNCTION ADDFI0(RD,TYPE,LEN,NAME)
      INTEGER RD(884)
      INTEGER TYPE,LEN
      INTEGER NAME(1)
      INTEGER I
      INTEGER AAAAU0
      I=RD(2)+22
      IF((I+22-1.LE.884))GOTO 10048
        ADDFI0=0
        RETURN
10048 RD(I)=TYPE
      RD(I+4)=LENGTH(NAME)
      AAAAU0=TYPE
      GOTO 10049
10050   RD(I+1)=2
        RD(I+4)=MAX0(RD(I+4),10)
      GOTO 10051
10052   RD(I+1)=4
        RD(I+4)=MAX0(RD(I+4),15)
      GOTO 10051
10053   RD(I+1)=LEN
        RD(I+4)=MAX0(RD(I+4),LEN)
      GOTO 10051
10049 GOTO(10050,10052,10053),AAAAU0
        CALL ERROR('in add_field_to_rd: bogus type passed.')
10051 RD(I+2)=RD(3)+1
      RD(I+3)=RD(3)+RD(I+1)
      CALL CTOC(NAME,RD(I+5),17)
      RD(1)=RD(1)+(22)
      RD(2)=RD(2)+(22)
      RD(3)=RD(3)+(RD(I+1))
      IF((RD(3).LE.500))GOTO 10054
        ADDFI0=0
        RETURN
10054 ADDFI0=I
      RETURN
      END
      INTEGER FUNCTION FINDF0(RD,NAME)
      INTEGER RD(884)
      INTEGER NAME(1)
      INTEGER I
      INTEGER EQUAL
      I=3+1
      GOTO 10057
10055 I=I+22
10057 IF((I.GT.RD(2)))GOTO 10056
        IF((EQUAL(RD(I+5),NAME).NE.1))GOTO 10058
          FINDF0=I
          RETURN
10058 GOTO 10055
10056 FINDF0=0
      RETURN
      END
      INTEGER FUNCTION COMPA0(TYPE,BUF1,BUF2)
      INTEGER TYPE
      INTEGER BUF1(500),BUF2(500)
      INTEGER R
      INTEGER COMPB0,COMPC0,COMPD0
      INTEGER AAAAV0
      INTEGER AAAAW0(34)
      DATA AAAAW0/233,238,160,227,239,237,240,225,242,229,223,230,233,22
     *9,236,228,186,160,226,239,231,245,243,160,244,249,240,229,160,170,
     *233,170,238,0/
      AAAAV0=TYPE
      GOTO 10059
10060   R=COMPB0(BUF1,BUF2)
      GOTO 10061
10062   R=COMPC0(BUF1,BUF2)
      GOTO 10061
10063   R=COMPD0(BUF1,BUF2)
      GOTO 10061
10059 GOTO(10060,10062,10063),AAAAV0
        CALL PRINT(-15,AAAAW0,TYPE)
        R=2
10061 COMPA0=R
      RETURN
      END
      INTEGER FUNCTION COMPB0(I1,I2)
      INTEGER * 4 I1,I2
      IF((I1.GE.I2))GOTO 10064
        COMPB0=1
        RETURN
10064 IF((I1.LE.I2))GOTO 10065
        COMPB0=3
        RETURN
10065 COMPB0=2
      RETURN
      END
      INTEGER FUNCTION COMPC0(D1,D2)
      REAL * 8 D1,D2
      IF((D1.GE.D2))GOTO 10066
        COMPC0=1
        RETURN
10066 IF((D1.LE.D2))GOTO 10067
        COMPC0=3
        RETURN
10067 COMPC0=2
      RETURN
      END
      INTEGER FUNCTION COMPD0(S1,S2)
      INTEGER S1(1),S2(1)
      INTEGER I
      I=1
      GOTO 10070
10068 I=I+(1)
10070 IF((S1(I).NE.S2(I)))GOTO 10069
      IF((S1(I).EQ.0))GOTO 10069
      GOTO 10068
10069 IF((S1(I).NE.S2(I)))GOTO 10071
        COMPD0=2
        RETURN
10071 IF((S1(I).EQ.0))GOTO 10073
      IF((S1(I).LT.S2(I)))GOTO 10073
      GOTO 10072
10073   COMPD0=1
        RETURN
10072 COMPD0=3
      RETURN
      END
      SUBROUTINE PRINU0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER AAAAX0(2)
      INTEGER AAAAY0(7)
      INTEGER AAAAZ0(3)
      INTEGER AAABA0(2)
      INTEGER AAABB0(7)
      INTEGER AAABC0(3)
      INTEGER AAABD0(2)
      INTEGER AAABE0(7)
      INTEGER AAABF0(3)
      DATA AAAAX0/173,0/
      DATA AAAAY0/170,163,172,172,173,248,0/
      DATA AAAAZ0/170,238,0/
      DATA AAABA0/252,0/
      DATA AAABB0/160,170,163,243,160,252,0/
      DATA AAABC0/170,238,0/
      DATA AAABD0/173,0/
      DATA AAABE0/170,163,172,172,173,248,0/
      DATA AAABF0/170,238,0/
      CALL PRINT(FD,AAAAX0)
      I=3+1
      GOTO 10076
10074 I=I+22
10076 IF((I.GT.RD(2)))GOTO 10075
        CALL PRINT(FD,AAAAY0,RD(I+4)+3)
      GOTO 10074
10075 CALL PRINT(FD,AAAAZ0)
      CALL PRINT(FD,AAABA0)
      I=3+1
      GOTO 10079
10077 I=I+22
10079 IF((I.GT.RD(2)))GOTO 10078
        CALL PRINT(FD,AAABB0,RD(I+4),RD(I+5))
      GOTO 10077
10078 CALL PRINT(FD,AAABC0)
      CALL PRINT(FD,AAABD0)
      I=3+1
      GOTO 10082
10080 I=I+22
10082 IF((I.GT.RD(2)))GOTO 10081
        CALL PRINT(FD,AAABE0,RD(I+4)+3)
      GOTO 10080
10081 CALL PRINT(FD,AAABF0)
      RETURN
      END
      SUBROUTINE PRINV0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER AAABG0(2)
      INTEGER AAABH0(7)
      INTEGER AAABI0(3)
      DATA AAABG0/173,0/
      DATA AAABH0/170,163,172,172,173,248,0/
      DATA AAABI0/170,238,0/
      CALL PRINT(FD,AAABG0)
      I=3+1
      GOTO 10085
10083 I=I+22
10085 IF((I.GT.RD(2)))GOTO 10084
        CALL PRINT(FD,AAABH0,RD(I+4)+3)
      GOTO 10083
10084 CALL PRINT(FD,AAABI0)
      RETURN
      END
      SUBROUTINE PRINW0(RD,FD,BUF)
      INTEGER RD(884)
      INTEGER FD
      INTEGER BUF(500)
      INTEGER I
      INTEGER AAABJ0(2)
      INTEGER AAABK0
      INTEGER AAABL0(7)
      INTEGER AAABM0(7)
      INTEGER AAABN0(9)
      INTEGER AAABO0(3)
      DATA AAABJ0/252,0/
      DATA AAABL0/160,170,163,236,160,252,0/
      DATA AAABM0/160,170,163,228,160,252,0/
      DATA AAABN0/160,170,163,172,163,243,160,252,0/
      DATA AAABO0/170,238,0/
      CALL PRINT(FD,AAABJ0)
      I=3+1
      GOTO 10088
10086 I=I+22
10088 IF((I.GT.RD(2)))GOTO 10087
        AAABK0=RD(I)
        GOTO 10089
10090     CALL PRINT(FD,AAABL0,RD(I+4),BUF(RD(I+2)))
        GOTO 10091
10092     CALL PRINT(FD,AAABM0,RD(I+4),BUF(RD(I+2)))
        GOTO 10091
10093     CALL PRINT(FD,AAABN0,RD(I+4),RD(I+1),BUF(RD(I+2)))
        GOTO 10091
10089   GOTO(10090,10092,10093),AAABK0
10091 GOTO 10086
10087 CALL PRINT(FD,AAABO0)
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
      IF((ISATTY(FD).NE.1))GOTO 10094
        CALL PRINW0(RD,FD,BUF)
        GOTO 10095
10094   CALL WRITEF(BUF,RD(3),FD)
10095 RETURN
      END
      SUBROUTINE GETDA0(RD,I,BUF,DEST)
      INTEGER RD(884)
      INTEGER I,BUF(1),DEST(102)
      INTEGER J,K
      INTEGER AAABP0
      AAABP0=RD(I)
      GOTO 10096
10097   J=RD(I+2)
        DEST(1)=BUF(J)
        DEST(2)=BUF(J+1)
      GOTO 10098
10099   J=RD(I+2)
        DEST(1)=BUF(J)
        DEST(2)=BUF(J+1)
        DEST(3)=BUF(J+2)
        DEST(4)=BUF(J+3)
      GOTO 10098
10100   J=RD(I+3)
        K=RD(I+1)
        GOTO 10103
10101   J=J-(1)
        K=K-(1)
10103   IF((K.LE.0))GOTO 10102
        IF((BUF(J).NE.160))GOTO 10102
        GOTO 10101
10102   DEST(K+1)=0
        GOTO 10106
10104   J=J-(1)
        K=K-(1)
10106   IF((K.LE.0))GOTO 10105
          DEST(K)=BUF(J)
        GOTO 10104
10105 GOTO 10098
10096 GOTO(10097,10099,10100),AAABP0
10098 RETURN
      END
      SUBROUTINE PUTDA0(RD,I,BUF,SRC)
      INTEGER RD(884)
      INTEGER I,BUF(1),SRC(102)
      INTEGER J,K
      INTEGER AAABQ0
      AAABQ0=RD(I)
      GOTO 10107
10108   J=RD(I+2)
        BUF(J)=SRC(1)
        BUF(J+1)=SRC(2)
      GOTO 10109
10110   J=RD(I+2)
        BUF(J)=SRC(1)
        BUF(J+1)=SRC(2)
        BUF(J+2)=SRC(3)
        BUF(J+3)=SRC(4)
      GOTO 10109
10111   J=RD(I+2)
        K=1
        GOTO 10114
10112   J=J+(1)
        K=K+(1)
10114   IF((SRC(K).EQ.0))GOTO 10113
        IF((K.GT.RD(I+1)))GOTO 10113
          BUF(J)=SRC(K)
        GOTO 10112
10113   GOTO 10117
10115   K=K+(1)
        J=J+(1)
10117   IF((K.GT.RD(I+1)))GOTO 10116
          BUF(J)=160
        GOTO 10115
10116 GOTO 10109
10107 GOTO(10108,10110,10111),AAABQ0
10109 RETURN
      END
      INTEGER FUNCTION COMPE0(RD,ROW1,ROW2)
      INTEGER RD(884)
      INTEGER ROW1(500),ROW2(500)
      INTEGER BUF1(500),BUF2(500)
      INTEGER R,I
      INTEGER COMPA0
      I=3+1
      GOTO 10120
10118 I=I+22
10120 IF((I.GT.RD(2)))GOTO 10119
        CALL GETDA0(RD,I,ROW1,BUF1)
        CALL GETDA0(RD,I,ROW2,BUF2)
        R=COMPA0(RD(I),BUF1,BUF2)
        IF((R.EQ.2))GOTO 10121
          COMPE0=R
          RETURN
10121 GOTO 10118
10119 COMPE0=2
      RETURN
      END
C ---- Long Name Map ----
C comparefield                   compa0
C printheader                    prinu0
C comparerow                     compe0
C printtrailer                   prinv0
C compareinteger                 compb0
C comparestring                  compd0
C putdata                        putda0
C findfield                      findf0
C getword                        getwo0
C printrd                        print0
C printrow                       prinw0
C comparereal                    compc0
C getdata                        getda0
C addfieldtord                   addfi0