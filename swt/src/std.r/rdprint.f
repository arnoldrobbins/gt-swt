      INTEGER RD(884)
      INTEGER LOADRD
      INTEGER ROW(500)
      INTEGER GETROW
      INTEGER A$BUF(200)
      INTEGER PARSCL
      INTEGER AAAAA0(3)
      INTEGER AAAAB0(26)
      DATA AAAAA0/228,242,0/
      DATA AAAAB0/213,243,225,231,229,186,160,160,242,228,240,242,233,23
     *8,244,160,168,173,228,160,252,160,173,242,169,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR(AAAAB0)
10000 IF((LOADRD(RD,-10).EQ.-2))GOTO 10001
        CALL ERROR('Can''t access input relation.')
10001 IF((A$BUF(242-225+1).EQ.0))GOTO 10003
      IF((A$BUF(228-225+1).NE.0))GOTO 10003
      GOTO 10002
10003   CALL PRINT0(RD,-11)
10002 IF((A$BUF(228-225+1).EQ.0))GOTO 10005
      IF((A$BUF(242-225+1).NE.0))GOTO 10005
      GOTO 10004
10005   CALL PRINU0(RD,-11)
10006   IF((GETROW(RD,-10,ROW).EQ.-1))GOTO 10007
          CALL PRINV0(RD,-11,ROW)
        GOTO 10006
10007   CALL PRINW0(RD,-11)
10004 CALL SWT
      END
      INTEGER FUNCTION LOADRD(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER ISATTY,READF
      IF((ISATTY(FD).NE.1))GOTO 10008
        CALL REMARK('Sorry, a relation can''t be read from the terminal.
     *')
        LOADRD=-3
        RETURN
10008 IF((READF(RD(1),1,FD).NE.-1))GOTO 10009
        LOADRD=-3
        RETURN
10009 IF((READF(RD(2),RD(1)-1,FD).NE.-1))GOTO 10010
        CALL REMARK('relation is corrupted!!.')
        LOADRD=-3
        RETURN
10010 LOADRD=-2
      RETURN
      END
      SUBROUTINE SAVERD(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER ISATTY
      IF((ISATTY(FD).NE.1))GOTO 10011
        CALL PRINT0(RD,FD)
        GOTO 10012
10011   CALL WRITEF(RD,RD(1),FD)
10012 RETURN
      END
      SUBROUTINE PRINT0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER TYPE(102)
      INTEGER AAAAC0(10)
      INTEGER AAAAD0(33)
      INTEGER AAAAE0(10)
      INTEGER AAAAF0
      INTEGER AAAAG0(8)
      INTEGER AAAAH0(5)
      INTEGER AAAAI0(7)
      INTEGER AAAAJ0(24)
      INTEGER AAAAK0(10)
      DATA AAAAC0/170,179,185,172,172,173,248,170,238,0/
      DATA AAAAD0/252,160,244,249,240,229,160,160,160,160,252,160,236,22
     *9,238,231,244,232,160,252,160,238,225,237,229,170,177,179,248,252,
     *170,238,0/
      DATA AAAAE0/170,179,185,172,172,173,248,170,238,0/
      DATA AAAAG0/233,238,244,229,231,229,242,0/
      DATA AAAAH0/242,229,225,236,0/
      DATA AAAAI0/243,244,242,233,238,231,0/
      DATA AAAAJ0/252,160,170,183,243,160,252,160,170,181,233,160,160,25
     *2,160,170,177,182,243,160,252,170,238,0/
      DATA AAAAK0/170,179,185,172,172,173,248,170,238,0/
      CALL PRINT(FD,AAAAC0)
      CALL PRINT(FD,AAAAD0)
      CALL PRINT(FD,AAAAE0)
      I=3+1
      GOTO 10015
10013 I=I+22
10015 IF((I.GT.RD(2)))GOTO 10014
        AAAAF0=RD(I)
        GOTO 10016
10017     CALL CTOC(AAAAG0,TYPE,102)
        GOTO 10018
10019     CALL CTOC(AAAAH0,TYPE,102)
        GOTO 10018
10020     CALL CTOC(AAAAI0,TYPE,102)
        GOTO 10018
10016   GOTO(10017,10019,10020),AAAAF0
10018   CALL PRINT(FD,AAAAJ0,TYPE,RD(I+1),RD(I+5))
      GOTO 10013
10014 CALL PRINT(FD,AAAAK0)
      RETURN
      END
      INTEGER FUNCTION ADDFI0(RD,TYPE,LEN,NAME)
      INTEGER RD(884)
      INTEGER TYPE,LEN
      INTEGER NAME(1)
      INTEGER I
      INTEGER AAAAL0
      I=RD(2)+22
      IF((I+22-1.LE.884))GOTO 10021
        ADDFI0=0
        RETURN
10021 RD(I)=TYPE
      RD(I+4)=LENGTH(NAME)
      AAAAL0=TYPE
      GOTO 10022
10023   RD(I+1)=2
        RD(I+4)=MAX0(RD(I+4),10)
      GOTO 10024
10025   RD(I+1)=4
        RD(I+4)=MAX0(RD(I+4),15)
      GOTO 10024
10026   RD(I+1)=LEN
        RD(I+4)=MAX0(RD(I+4),LEN)
      GOTO 10024
10022 GOTO(10023,10025,10026),AAAAL0
        CALL ERROR('in add_field_to_rd: bogus type passed.')
10024 RD(I+2)=RD(3)+1
      RD(I+3)=RD(3)+RD(I+1)
      CALL CTOC(NAME,RD(I+5),17)
      RD(1)=RD(1)+(22)
      RD(2)=RD(2)+(22)
      RD(3)=RD(3)+(RD(I+1))
      IF((RD(3).LE.500))GOTO 10027
        ADDFI0=0
        RETURN
10027 ADDFI0=I
      RETURN
      END
      INTEGER FUNCTION FINDF0(RD,NAME)
      INTEGER RD(884)
      INTEGER NAME(1)
      INTEGER I
      INTEGER EQUAL
      I=3+1
      GOTO 10030
10028 I=I+22
10030 IF((I.GT.RD(2)))GOTO 10029
        IF((EQUAL(RD(I+5),NAME).NE.1))GOTO 10031
          FINDF0=I
          RETURN
10031 GOTO 10028
10029 FINDF0=0
      RETURN
      END
      INTEGER FUNCTION COMPA0(TYPE,BUF1,BUF2)
      INTEGER TYPE
      INTEGER BUF1(500),BUF2(500)
      INTEGER R
      INTEGER COMPB0,COMPC0,COMPD0
      INTEGER AAAAM0
      INTEGER AAAAN0(34)
      DATA AAAAN0/233,238,160,227,239,237,240,225,242,229,223,230,233,22
     *9,236,228,186,160,226,239,231,245,243,160,244,249,240,229,160,170,
     *233,170,238,0/
      AAAAM0=TYPE
      GOTO 10032
10033   R=COMPB0(BUF1,BUF2)
      GOTO 10034
10035   R=COMPC0(BUF1,BUF2)
      GOTO 10034
10036   R=COMPD0(BUF1,BUF2)
      GOTO 10034
10032 GOTO(10033,10035,10036),AAAAM0
        CALL PRINT(-15,AAAAN0,TYPE)
        R=2
10034 COMPA0=R
      RETURN
      END
      INTEGER FUNCTION COMPB0(I1,I2)
      INTEGER * 4 I1,I2
      IF((I1.GE.I2))GOTO 10037
        COMPB0=1
        RETURN
10037 IF((I1.LE.I2))GOTO 10038
        COMPB0=3
        RETURN
10038 COMPB0=2
      RETURN
      END
      INTEGER FUNCTION COMPC0(D1,D2)
      REAL * 8 D1,D2
      IF((D1.GE.D2))GOTO 10039
        COMPC0=1
        RETURN
10039 IF((D1.LE.D2))GOTO 10040
        COMPC0=3
        RETURN
10040 COMPC0=2
      RETURN
      END
      INTEGER FUNCTION COMPD0(S1,S2)
      INTEGER S1(1),S2(1)
      INTEGER I
      I=1
      GOTO 10043
10041 I=I+(1)
10043 IF((S1(I).NE.S2(I)))GOTO 10042
      IF((S1(I).EQ.0))GOTO 10042
      GOTO 10041
10042 IF((S1(I).NE.S2(I)))GOTO 10044
        COMPD0=2
        RETURN
10044 IF((S1(I).EQ.0))GOTO 10046
      IF((S1(I).LT.S2(I)))GOTO 10046
      GOTO 10045
10046   COMPD0=1
        RETURN
10045 COMPD0=3
      RETURN
      END
      SUBROUTINE PRINU0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER AAAAO0(2)
      INTEGER AAAAP0(7)
      INTEGER AAAAQ0(3)
      INTEGER AAAAR0(2)
      INTEGER AAAAS0(7)
      INTEGER AAAAT0(3)
      INTEGER AAAAU0(2)
      INTEGER AAAAV0(7)
      INTEGER AAAAW0(3)
      DATA AAAAO0/173,0/
      DATA AAAAP0/170,163,172,172,173,248,0/
      DATA AAAAQ0/170,238,0/
      DATA AAAAR0/252,0/
      DATA AAAAS0/160,170,163,243,160,252,0/
      DATA AAAAT0/170,238,0/
      DATA AAAAU0/173,0/
      DATA AAAAV0/170,163,172,172,173,248,0/
      DATA AAAAW0/170,238,0/
      CALL PRINT(FD,AAAAO0)
      I=3+1
      GOTO 10049
10047 I=I+22
10049 IF((I.GT.RD(2)))GOTO 10048
        CALL PRINT(FD,AAAAP0,RD(I+4)+3)
      GOTO 10047
10048 CALL PRINT(FD,AAAAQ0)
      CALL PRINT(FD,AAAAR0)
      I=3+1
      GOTO 10052
10050 I=I+22
10052 IF((I.GT.RD(2)))GOTO 10051
        CALL PRINT(FD,AAAAS0,RD(I+4),RD(I+5))
      GOTO 10050
10051 CALL PRINT(FD,AAAAT0)
      CALL PRINT(FD,AAAAU0)
      I=3+1
      GOTO 10055
10053 I=I+22
10055 IF((I.GT.RD(2)))GOTO 10054
        CALL PRINT(FD,AAAAV0,RD(I+4)+3)
      GOTO 10053
10054 CALL PRINT(FD,AAAAW0)
      RETURN
      END
      SUBROUTINE PRINW0(RD,FD)
      INTEGER RD(884)
      INTEGER FD
      INTEGER I
      INTEGER AAAAX0(2)
      INTEGER AAAAY0(7)
      INTEGER AAAAZ0(3)
      DATA AAAAX0/173,0/
      DATA AAAAY0/170,163,172,172,173,248,0/
      DATA AAAAZ0/170,238,0/
      CALL PRINT(FD,AAAAX0)
      I=3+1
      GOTO 10058
10056 I=I+22
10058 IF((I.GT.RD(2)))GOTO 10057
        CALL PRINT(FD,AAAAY0,RD(I+4)+3)
      GOTO 10056
10057 CALL PRINT(FD,AAAAZ0)
      RETURN
      END
      SUBROUTINE PRINV0(RD,FD,BUF)
      INTEGER RD(884)
      INTEGER FD
      INTEGER BUF(500)
      INTEGER I
      INTEGER AAABA0(2)
      INTEGER AAABB0
      INTEGER AAABC0(7)
      INTEGER AAABD0(7)
      INTEGER AAABE0(9)
      INTEGER AAABF0(3)
      DATA AAABA0/252,0/
      DATA AAABC0/160,170,163,236,160,252,0/
      DATA AAABD0/160,170,163,228,160,252,0/
      DATA AAABE0/160,170,163,172,163,243,160,252,0/
      DATA AAABF0/170,238,0/
      CALL PRINT(FD,AAABA0)
      I=3+1
      GOTO 10061
10059 I=I+22
10061 IF((I.GT.RD(2)))GOTO 10060
        AAABB0=RD(I)
        GOTO 10062
10063     CALL PRINT(FD,AAABC0,RD(I+4),BUF(RD(I+2)))
        GOTO 10064
10065     CALL PRINT(FD,AAABD0,RD(I+4),BUF(RD(I+2)))
        GOTO 10064
10066     CALL PRINT(FD,AAABE0,RD(I+4),RD(I+1),BUF(RD(I+2)))
        GOTO 10064
10062   GOTO(10063,10065,10066),AAABB0
10064 GOTO 10059
10060 CALL PRINT(FD,AAABF0)
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
      IF((ISATTY(FD).NE.1))GOTO 10067
        CALL PRINV0(RD,FD,BUF)
        GOTO 10068
10067   CALL WRITEF(BUF,RD(3),FD)
10068 RETURN
      END
      SUBROUTINE GETDA0(RD,I,BUF,DEST)
      INTEGER RD(884)
      INTEGER I,BUF(1),DEST(102)
      INTEGER J,K
      INTEGER AAABG0
      AAABG0=RD(I)
      GOTO 10069
10070   J=RD(I+2)
        DEST(1)=BUF(J)
        DEST(2)=BUF(J+1)
      GOTO 10071
10072   J=RD(I+2)
        DEST(1)=BUF(J)
        DEST(2)=BUF(J+1)
        DEST(3)=BUF(J+2)
        DEST(4)=BUF(J+3)
      GOTO 10071
10073   J=RD(I+3)
        K=RD(I+1)
        GOTO 10076
10074   J=J-(1)
        K=K-(1)
10076   IF((K.LE.0))GOTO 10075
        IF((BUF(J).NE.160))GOTO 10075
        GOTO 10074
10075   DEST(K+1)=0
        GOTO 10079
10077   J=J-(1)
        K=K-(1)
10079   IF((K.LE.0))GOTO 10078
          DEST(K)=BUF(J)
        GOTO 10077
10078 GOTO 10071
10069 GOTO(10070,10072,10073),AAABG0
10071 RETURN
      END
      SUBROUTINE PUTDA0(RD,I,BUF,SRC)
      INTEGER RD(884)
      INTEGER I,BUF(1),SRC(102)
      INTEGER J,K
      INTEGER AAABH0
      AAABH0=RD(I)
      GOTO 10080
10081   J=RD(I+2)
        BUF(J)=SRC(1)
        BUF(J+1)=SRC(2)
      GOTO 10082
10083   J=RD(I+2)
        BUF(J)=SRC(1)
        BUF(J+1)=SRC(2)
        BUF(J+2)=SRC(3)
        BUF(J+3)=SRC(4)
      GOTO 10082
10084   J=RD(I+2)
        K=1
        GOTO 10087
10085   J=J+(1)
        K=K+(1)
10087   IF((SRC(K).EQ.0))GOTO 10086
        IF((K.GT.RD(I+1)))GOTO 10086
          BUF(J)=SRC(K)
        GOTO 10085
10086   GOTO 10090
10088   K=K+(1)
        J=J+(1)
10090   IF((K.GT.RD(I+1)))GOTO 10089
          BUF(J)=160
        GOTO 10088
10089 GOTO 10082
10080 GOTO(10081,10083,10084),AAABH0
10082 RETURN
      END
      INTEGER FUNCTION COMPE0(RD,ROW1,ROW2)
      INTEGER RD(884)
      INTEGER ROW1(500),ROW2(500)
      INTEGER BUF1(500),BUF2(500)
      INTEGER R,I
      INTEGER COMPA0
      I=3+1
      GOTO 10093
10091 I=I+22
10093 IF((I.GT.RD(2)))GOTO 10092
        CALL GETDA0(RD,I,ROW1,BUF1)
        CALL GETDA0(RD,I,ROW2,BUF2)
        R=COMPA0(RD(I),BUF1,BUF2)
        IF((R.EQ.2))GOTO 10094
          COMPE0=R
          RETURN
10094 GOTO 10091
10092 COMPE0=2
      RETURN
      END
C ---- Long Name Map ----
C comparefield                   compa0
C printheader                    prinu0
C comparerow                     compe0
C printtrailer                   prinw0
C compareinteger                 compb0
C comparestring                  compd0
C putdata                        putda0
C findfield                      findf0
C printrd                        print0
C printrow                       prinv0
C comparereal                    compc0
C getdata                        getda0
C addfieldtord                   addfi0