      INTEGER CPOS(44)
      INTEGER CTAB(304)
      INTEGER IPOS(19)
      INTEGER ITAB(534)
      INTEGER NLOFF0(2)
      INTEGER NLOFG0(6)
      INTEGER NLONP0(2)
      INTEGER NLONT0(5)
      INTEGER A$BUF(200)
      INTEGER INPF(180),LISTF(180),BINF(180)
      INTEGER I
      INTEGER COMOPT,COMFN,PARSCL,EQUAL
      INTEGER AAAAA0(106)
      INTEGER CTOC
      INTEGER AAAAB0(1)
      INTEGER CTOC
      INTEGER AAAAC0(10)
      INTEGER CTOC
      INTEGER AAAAD0(1)
      INTEGER AAAAE0(12)
      INTEGER AAAAF0(3)
      INTEGER AAAAG0(3)
      INTEGER AAAAH0(3)
      DATA CTAB/1,0,1,182,0,2,0,0,179,0,3,0,0,226,233,231,0,4,0,0,228,22
     *7,0,5,0,0,228,229,0,6,0,0,228,239,0,7,0,1,228,249,0,8,0,0,229,242,
     *242,236,0,9,0,1,229,242,242,244,0,10,0,0,229,248,0,11,0,0,230,242,
     *238,0,12,0,1,233,238,244,236,0,13,0,0,233,238,244,243,0,14,0,0,236
     *,227,0,15,0,1,236,239,231,236,0,16,0,0,236,239,231,243,0,17,0,1,23
     *8,239,226,0,18,0,1,238,239,228,227,0,19,0,1,238,239,228,229,0,20,0
     *,1,238,239,228,239,0,21,0,1,238,239,229,242,242,236,0,22,0,0,238,2
     *39,229,242,242,244,0,23,0,1,238,239,229,248,0,24,0,1,238,239,230,0
     *,25,0,1,238,239,239,230,0,26,0,0,238,239,239,240,0,27,0,1,238,239,
     *240,0,28,0,1,238,239,242,0,29,0,1,238,239,243,233,0,30,0,1,238,239
     *,243,244,0,31,0,1,238,239,248,0,32,0,0,239,230,0,33,0,0,239,240,24
     *4,177,0,34,0,1,239,240,244,178,0,35,0,0,239,240,244,179,0,36,0,0,2
     *40,0,37,0,0,242,0,38,0,0,243,225,0,39,0,0,243,233,0,40,0,0,243,244
     *,0,41,0,1,245,0,42,0,0,248,0,43,0,0,248,242,229,230,243,0/
      DATA CPOS/43,1,6,11,18,24,30,36,42,50,58,64,71,79,87,93,101,109,11
     *6,124,132,140,150,160,168,175,183,191,198,205,213,221,228,234,242,
     *250,258,263,268,274,280,286,291,296/
      DATA ITAB/3,0,1,0,-106,-106,-106,-100,0,-101,41,-102,14,-104,-100,
     *1,-101,14,-102,41,-104,-105,4,0,2,0,-106,-106,-106,-100,0,-101,19,
     *27,-102,36,5,-104,-100,1,-101,36,19,-102,5,27,-104,-100,2,-101,5,2
     *7,-102,36,19,-103,15,0,2,227,225,238,167,244,160,228,229,226,245,2
     *31,160,247,233,244,232,160,230,245,236,236,160,239,240,244,233,237
     *,233,250,225,244,233,239,238,0,-104,-105,5,0,1,1,-106,-106,-106,-1
     *00,0,-101,22,-102,9,-104,-100,1,-101,9,-102,22,-104,-105,6,0,1,0,-
     *106,-106,-106,-100,0,-101,25,-102,32,-104,-100,1,-101,32,-102,25,-
     *104,-105,7,0,1,0,-106,-106,-106,-100,0,-101,16,-102,15,-104,-100,1
     *,-101,15,-102,16,-104,-105,8,0,1,0,-106,-106,-106,-100,0,-101,17,-
     *102,3,-104,-100,1,-101,3,-102,17,-104,-105,9,0,1,0,-106,-106,-106,
     *-100,0,-101,13,-102,12,-104,-100,1,-101,12,-102,13,-104,-105,11,0,
     *1,0,-106,-106,-106,-100,0,-101,30,-102,40,-104,-100,1,-101,40,-102
     *,30,-104,-105,13,2,3,2,-106,-106,-106,-100,2,-101,1,-102,2,-104,-1
     *00,3,-101,2,-102,1,-104,-105,15,0,3,2,-106,-106,-106,-100,0,-101,2
     *6,-102,33,34,35,-104,-100,1,-101,33,-102,26,34,35,-104,-100,2,-101
     *,34,-102,26,33,35,-104,-100,3,-101,35,-102,26,33,34,-103,4,0,1,227
     *,225,238,167,244,160,230,245,236,236,249,160,239,240,244,233,237,2
     *33,250,229,160,247,233,244,232,160,230,245,236,236,160,228,229,226
     *,245,231,0,-104,-105,17,0,1,1,-106,-106,-106,-100,0,-101,39,-102,2
     *9,-104,-100,1,-101,29,-102,39,-104,-105,18,0,1,0,-106,-106,-106,-1
     *00,0,-101,28,-102,37,-104,-100,1,-101,37,-102,28,-104,-105,19,0,1,
     *1,-106,-106,-106,-100,0,-101,38,-102,7,-104,-100,1,-101,7,-102,38,
     *-104,-105,20,0,1,0,-106,-106,-106,-100,0,-101,20,-102,6,-104,-100,
     *1,-101,6,-102,20,-104,-105,21,0,1,1,-106,-106,-106,-100,0,-101,18,
     *-102,4,-104,-100,1,-101,4,-102,18,-104,-105,22,0,2,1,-106,-106,-10
     *6,-100,0,-101,8,23,-102,21,10,-104,-100,1,-101,21,23,-102,8,10,-10
     *4,-100,2,-101,10,21,-102,8,23,-104,-105,23,0,1,0,-106,-106,-106,-1
     *00,0,-101,24,-102,11,-104,-100,1,-101,11,-102,24,-104,-105,24,0,2,
     *1,-106,-106,-106,-100,0,-101,31,-102,42,43,-104,-100,1,-101,43,-10
     *2,31,42,-104,-100,2,-101,42,-102,31,43,-104,-105/
      DATA IPOS/18,1,23,97,119,141,163,185,207,229,251,336,358,380,402,4
     *24,446,481,503/
      DATA NLOFG0/8,10,32,42,43,0/
      DATA NLOFF0/1,1/
      DATA NLONT0/21,23,25,31,0/
      DATA NLONP0/1,1/
      DATA AAAAA0/227,188,239,233,190,228,188,239,233,190,229,188,239,23
     *3,190,230,188,239,233,190,231,188,239,233,190,232,188,239,233,190,
     *233,188,239,233,190,235,188,239,233,190,237,188,239,233,190,239,18
     *8,239,233,190,241,188,239,233,190,242,188,239,233,190,243,188,239,
     *233,190,244,188,239,233,190,245,188,239,233,190,246,188,239,233,19
     *0,247,188,239,233,190,248,188,239,233,190,226,188,239,243,190,236,
     *188,239,243,190,250,188,239,243,190,0/
      DATA AAAAB0/0/
      DATA AAAAC0/175,228,229,246,175,238,245,236,236,0/
      DATA AAAAD0/0/
      DATA AAAAE0/174,230,183,183,172,174,230,172,174,228,230,0/
      DATA AAAAF0/174,236,0/
      DATA AAAAG0/174,226,0/
      DATA AAAAH0/238,239,0/
      IF((PARSCL(AAAAA0,A$BUF).EQ.-2))GOTO 10000
        CALL REMARK('Usage: f77c {-<opt>[<level>]} <file> {-(b|l) [<file
     *>]} [-z <string>].')
        CALL ERROR('       <opt> -> c|d|e|f|g|h|i|k|m|o|q|r|s|t|u|v|w|x.
     *')
10000 IF((A$BUF(236-225+1).EQ.0))GOTO 10001
        IF((A$BUF(236-225+1).EQ.2))GOTO 10002
          A$BUF(236-225+27)=A$BUF(53)
          A$BUF(53)=A$BUF(53)+(1+CTOC(AAAAB0,A$BUF(A$BUF(53)),200))
10002   GOTO 10003
10001   IF((A$BUF(236-225+1).EQ.2))GOTO 10004
          A$BUF(236-225+27)=A$BUF(53)
          A$BUF(53)=A$BUF(53)+(1+CTOC(AAAAC0,A$BUF(A$BUF(53)),200))
10004 CONTINUE
10003 IF((A$BUF(226-225+1).EQ.2))GOTO 10005
        A$BUF(226-225+27)=A$BUF(53)
        A$BUF(53)=A$BUF(53)+(1+CTOC(AAAAD0,A$BUF(A$BUF(53)),200))
10005 IF((COMOPT(A$BUF,CPOS,CTAB,IPOS,ITAB).EQ.-3))GOTO 10007
      IF((COMFN(A$BUF,INPF,AAAAE0,LISTF,AAAAF0,BINF,AAAAG0).EQ.-3))GOTO 
     *10007
      GOTO 10006
10007   CALL SETERR(1000)
        CALL SWT
10006 IF((EQUAL(LISTF,AAAAH0).EQ.0))GOTO 10008
        CALL COMNL(CPOS,CTAB,NLOFG0,NLONT0)
10008 CALL PRINT(-11,'f77 -i *s -b *s -l *s.',INPF,BINF,LISTF)
      I=1
      GOTO 10011
10009 I=I+(1)
10011 IF((I.GT.CPOS(1)))GOTO 10010
        IF((CTAB(CPOS(I+1)+1).NE.1))GOTO 10012
        IF((CTAB(CPOS(I+1)+2).NE.0))GOTO 10012
          CALL PRINT(-11,' -*s.',CTAB(CPOS(I+1)+3))
10012 GOTO 10009
10010 IF((A$BUF(250-225+1).EQ.0))GOTO 10013
        CALL PRINT(-11,' *s.',A$BUF(A$BUF(250-225+27)))
10013 CALL PUTCH(138,-11)
      CALL SWT
      END
      INTEGER FUNCTION COMOPT(A$BUF,CPOS,CTAB,IPOS,ITAB)
      INTEGER A$BUF(200)
      INTEGER CPOS(1),CTAB(1),IPOS(1),ITAB(1)
      INTEGER C,I,POS,FPOS,LP,NLP,LIST(26),NLIST(26)
      INTEGER AAAAK0
      INTEGER AAAAM0
      INTEGER AAAAN0
      INTEGER AAAAI0,AAAAJ0
      INTEGER AAAAO0,AAAAP0,AAAAQ0
      INTEGER LENGTH
      INTEGER AAAAR0
      INTEGER AAAAS0
      INTEGER AAAAL0
      INTEGER AAAAT0,AAAAU0
      LP=0
      I=1
      GOTO 10019
10017 I=I+(1)
10019 IF((I.GT.IPOS(1)))GOTO 10018
        POS=IPOS(I+1)
        C=ITAB(POS+0)
        IF((A$BUF(C).EQ.0))GOTO 10020
          IF((A$BUF(C).EQ.2))GOTO 10021
            A$BUF(C+26)=ITAB(POS+2)
10021     ITAB(POS+6)=A$BUF(C+26)
          LP=LP+(1)
          LIST(LP)=POS
          IF((A$BUF(C+26).LT.ITAB(POS+1)))GOTO 10023
          IF((A$BUF(C+26).GT.ITAB(POS+2)))GOTO 10023
          GOTO 10022
10023       CALL PRINT(-15,'level numbers for -*c are *i to *i*n.',C-1+2
     *25,ITAB(POS+1),ITAB(POS+2))
            COMOPT=-3
            RETURN
10022   CONTINUE
10020 GOTO 10017
10018 IF((LP.GT.0))GOTO 10024
        AAAAN0=1
        GOTO 10016
10025 CONTINUE
10024 CONTINUE
10026 IF((LP.LE.0))GOTO 10027
        NLP=0
        DO 10028 I=1,LP
          POS=LIST(I)
          C=ITAB(POS+0)
          IF((ITAB(POS+6).NE.-106))GOTO 10030
            GOTO 10031
10032         ITAB(POS+6)=ITAB(POS+4)
            GOTO 10033
10034         ITAB(POS+6)=ITAB(POS+5)
            GOTO 10033
10031       IF((ITAB(POS+3).LT.ITAB(POS+4)))GOTO 10032
            IF((ITAB(POS+3).GT.ITAB(POS+5)))GOTO 10034
              ITAB(POS+6)=ITAB(POS+3)
10033     CONTINUE
10030     AAAAI0=POS
          AAAAJ0=ITAB(POS+6)
          AAAAK0=1
          GOTO 10014
10035     CONTINUE
10028   CONTINUE
10029   IF((NLP.GT.0))GOTO 10036
          AAAAN0=2
          GOTO 10016
10037     GOTO 10038
10036     LP=NLP
          DO 10039 I=1,NLP
            LIST(I)=NLIST(I)
10039     CONTINUE
10040   CONTINUE
10038 GOTO 10026
10027 COMOPT=-2
      RETURN
10014 AAAAP0=AAAAI0+1
      GOTO 10043
10041 AAAAP0=AAAAP0+(1)
10043 IF((ITAB(AAAAP0).NE.-100))GOTO 10044
      IF((ITAB(AAAAP0+1).NE.AAAAJ0))GOTO 10044
      GOTO 10042
10044 IF((ITAB(AAAAP0).EQ.-105))GOTO 10042
      GOTO 10041
10042 IF((ITAB(AAAAP0).EQ.-100))GOTO 10045
        COMOPT=-3
        RETURN
10045 AAAAP0=AAAAP0+(2)
10046   AAAAR0=ITAB(AAAAP0)
        GOTO 10047
10048     AAAAP0=AAAAP0+(1)
          GOTO 10051
10049     AAAAP0=AAAAP0+(1)
10051     IF((ITAB(AAAAP0).LE.0))GOTO 10050
            AAAAQ0=1
            GOTO 10054
10052       AAAAQ0=AAAAQ0+(1)
10054       IF((AAAAQ0.GT.CPOS(1)))GOTO 10053
              IF((ITAB(AAAAP0).NE.CTAB(CPOS(AAAAQ0+1)+0)))GOTO 10055
                CTAB(CPOS(AAAAQ0+1)+1)=1
                GOTO 10053
10055       GOTO 10052
10053     GOTO 10049
10050   GOTO 10056
10057     AAAAP0=AAAAP0+(1)
          GOTO 10060
10058     AAAAP0=AAAAP0+(1)
10060     IF((ITAB(AAAAP0).LE.0))GOTO 10059
            AAAAQ0=1
            GOTO 10063
10061       AAAAQ0=AAAAQ0+(1)
10063       IF((AAAAQ0.GT.CPOS(1)))GOTO 10062
              IF((ITAB(AAAAP0).NE.CTAB(CPOS(AAAAQ0+1)+0)))GOTO 10064
                CTAB(CPOS(AAAAQ0+1)+1)=0
                GOTO 10062
10064       GOTO 10061
10062     GOTO 10058
10059   GOTO 10056
10065     AAAAO0=ITAB(AAAAP0+1)
          AAAAL0=AAAAO0
          AAAAM0=1
          GOTO 10015
10066     GOTO 10067
10068       IF((ITAB(FPOS+6).GT.ITAB(AAAAP0+3)))GOTO 10070
            IF((ITAB(FPOS+6).LT.ITAB(AAAAP0+2)))GOTO 10070
            GOTO 10069
10070         CALL PRINT(-15,'-*c*i: *s*n.',ITAB(AAAAI0+0)-1+225,AAAAJ0,
     *ITAB(AAAAP0+4))
              COMOPT=-3
              RETURN
10069     GOTO 10071
10072       ITAB(FPOS+4)=ITAB(AAAAP0+2)
            ITAB(FPOS+5)=ITAB(AAAAP0+3)
            NLP=NLP+(1)
            NLIST(NLP)=FPOS
          GOTO 10071
10073       ITAB(FPOS+4)=MAX0(ITAB(FPOS+4),ITAB(AAAAP0+2))
            ITAB(FPOS+5)=MIN0(ITAB(FPOS+5),ITAB(AAAAP0+3))
            NLP=NLP+(1)
            NLIST(NLP)=FPOS
          GOTO 10071
10067     IF((ITAB(FPOS+6).NE.-106))GOTO 10068
          IF((ITAB(FPOS+4).EQ.-106))GOTO 10072
          IF((ITAB(AAAAP0+2).GT.ITAB(FPOS+5)))GOTO 10074
          IF((ITAB(AAAAP0+3).LT.ITAB(FPOS+4)))GOTO 10074
          GOTO 10073
10074     CONTINUE
            CALL PRINT(-15,'-*c*i: *s*n.',ITAB(AAAAI0+0)-1+225,AAAAJ0,IT
     *AB(AAAAP0+4))
            COMOPT=-3
            RETURN
10071     AAAAP0=AAAAP0+(5+LENGTH(ITAB(AAAAP0+4)))
        GOTO 10056
10075     GOTO 10076
10047   AAAAS0=AAAAR0+105
        GOTO(10075,10065,10057,10048),AAAAS0
          COMOPT=-3
          RETURN
10056 CONTINUE
      GOTO 10046
10076 GOTO 10077
10015 FPOS=1
      GOTO 10080
10078 FPOS=FPOS+(1)
10080 IF((FPOS.GT.IPOS(1)))GOTO 10079
        IF((AAAAL0.NE.ITAB(IPOS(FPOS+1)+0)))GOTO 10081
          GOTO 10079
10081 GOTO 10078
10079 IF((FPOS.GT.IPOS(1)))GOTO 10082
        FPOS=IPOS(FPOS+1)
        GOTO 10083
10082   COMOPT=-3
        RETURN
10083 GOTO 10084
10016 LP=0
      AAAAT0=1
      GOTO 10087
10085 AAAAT0=AAAAT0+(1)
10087 IF((AAAAT0.GT.IPOS(1)))GOTO 10086
        AAAAU0=IPOS(AAAAT0+1)
        IF((ITAB(AAAAU0+6).NE.-106))GOTO 10088
          ITAB(AAAAU0+6)=ITAB(AAAAU0+3)
          LP=LP+(1)
          LIST(LP)=AAAAU0
10088 GOTO 10085
10086 GOTO 10089
10077 GOTO 10035
10089 GOTO(10025,10037),AAAAN0
      GOTO 10089
10084 GOTO 10066
      END
      INTEGER FUNCTION COMFN(A$BUF,INPF,EXT,LISTF,LEXT,BINF,BEXT)
      INTEGER A$BUF(200)
      INTEGER INPF(1),EXT(1),LISTF(1)
      INTEGER LEXT(1),BINF(1),BEXT(1)
      INTEGER GETARG,DEVEQ
      INTEGER FD
      INTEGER CREATE,OPEN
      INTEGER AAAAV0(9)
      INTEGER AAAAW0(10)
      INTEGER AAAAX0(9)
      INTEGER AAAAY0(9)
      INTEGER AAAAZ0(9)
      INTEGER AAABA0(9)
      INTEGER AAABB0(9)
      DATA AAAAV0/175,228,229,246,175,236,240,243,0/
      DATA AAAAW0/175,228,229,246,175,238,245,236,236,0/
      DATA AAAAX0/175,228,229,246,175,244,244,249,0/
      DATA AAAAY0/175,228,229,246,175,244,244,249,0/
      DATA AAAAZ0/175,228,229,246,175,244,244,249,0/
      DATA AAABA0/175,228,229,246,175,236,240,243,0/
      DATA AAABB0/175,228,229,246,175,244,244,249,0/
      IF((GETARG(1,INPF,180).NE.-1))GOTO 10090
        CALL REMARK('missing input file name.')
        COMFN=-3
        RETURN
10090 CALL MAPSTR(INPF,1)
      IF((DEVEQ(INPF,AAAAV0).EQ.1))GOTO 10092
      IF((DEVEQ(INPF,AAAAW0).EQ.1))GOTO 10092
      GOTO 10091
10092   CALL PRINT(-15,'*s: unreasonable input file*n.',INPF)
        COMFN=-3
        RETURN
10091 IF((A$BUF(A$BUF(236-225+27)).NE.0))GOTO 10093
        IF((DEVEQ(INPF,AAAAX0).NE.1))GOTO 10094
          CALL SCOPY(AAAAY0,1,LISTF,1)
          GOTO 10095
10094     CALL MAKED0(INPF,EXT,LISTF,LEXT)
10095   GOTO 10096
10093   CALL SCOPY(A$BUF(A$BUF(236-225+27)),1,LISTF,1)
10096 CALL CONVE0(LISTF)
      IF((A$BUF(A$BUF(226-225+27)).NE.0))GOTO 10097
        IF((DEVEQ(INPF,AAAAZ0).NE.1))GOTO 10098
          CALL SCOPY(BEXT,1,BINF,1)
          GOTO 10099
10098     CALL MAKED0(INPF,EXT,BINF,BEXT)
10099   GOTO 10100
10097   CALL SCOPY(A$BUF(A$BUF(226-225+27)),1,BINF,1)
10100 IF((DEVEQ(BINF,AAABA0).EQ.1))GOTO 10102
      IF((DEVEQ(BINF,AAABB0).EQ.1))GOTO 10102
      GOTO 10101
10102   CALL PRINT(-15,'*s: unreasonable binary file*n.',BINF)
        COMFN=-3
        RETURN
10101 CALL CONVE0(BINF)
      CALL CONVE0(INPF)
      COMFN=-2
      RETURN
      END
      SUBROUTINE COMNL(CPOS,CTAB,OFF,ON)
      INTEGER CPOS(1),CTAB(1),OFF(1),ON(1)
      INTEGER I,J
      I=1
      GOTO 10105
10103 I=I+(1)
10105 IF((OFF(I).EQ.0))GOTO 10104
        J=1
        GOTO 10108
10106   J=J+(1)
10108   IF((J.GT.CPOS(1)))GOTO 10107
          IF((OFF(I).NE.CTAB(CPOS(J+1)+0)))GOTO 10109
            CTAB(CPOS(J+1)+1)=0
            GOTO 10107
10109   GOTO 10106
10107 GOTO 10103
10104 I=1
      GOTO 10112
10110 I=I+(1)
10112 IF((ON(I).EQ.0))GOTO 10111
        J=1
        GOTO 10115
10113   J=J+(1)
10115   IF((J.GT.CPOS(1)))GOTO 10114
          IF((ON(I).NE.CTAB(CPOS(J+1)+0)))GOTO 10116
            CTAB(CPOS(J+1)+1)=1
            GOTO 10114
10116   GOTO 10113
10114 GOTO 10110
10111 RETURN
      END
      SUBROUTINE MAKED0(SOURCE,SEXT,DEST,DEXT)
      INTEGER SOURCE(1),SEXT(1),DEST(1),DEXT(1)
      INTEGER DLEN,TLEN,SP,TP
      INTEGER EQUAL,SCOPY
      INTEGER TEXT(102)
      DLEN=SCOPY(SOURCE,1,DEST,1)
      SP=1
10117 IF((SEXT(SP).EQ.0))GOTO 10118
        TP=1
        GOTO 10121
10119   TP=TP+(1)
        SP=SP+(1)
10121   IF((SEXT(SP).EQ.0))GOTO 10120
        IF((SEXT(SP).EQ.172))GOTO 10120
          TEXT(TP)=SEXT(SP)
        GOTO 10119
10120   TEXT(TP)=0
        TLEN=TP-1
        IF((TLEN.GT.DLEN))GOTO 10122
        IF((EQUAL(TEXT,DEST(DLEN-TLEN+1)).NE.1))GOTO 10122
          CALL SCOPY(DEXT,1,DEST,DLEN-TLEN+1)
          RETURN
10122   IF((SEXT(SP).NE.172))GOTO 10123
          SP=SP+(1)
10123 GOTO 10117
10118 CALL SCOPY(DEXT,1,DEST,DLEN+1)
      RETURN
      END
      SUBROUTINE CONVE0(NAME)
      INTEGER NAME(1)
      INTEGER TEMP(102)
      INTEGER I
      INTEGER DEVEQ,MKTR$,INDEX
      EXTERNAL INDEX
      INTEGER AAABC0(9)
      INTEGER AAABD0(4)
      INTEGER AAABE0(9)
      INTEGER AAABF0(6)
      INTEGER AAABG0(10)
      INTEGER AAABH0(3)
      DATA AAABC0/175,228,229,246,175,244,244,249,0/
      DATA AAABD0/244,244,249,0/
      DATA AAABE0/175,228,229,246,175,236,240,243,0/
      DATA AAABF0/243,240,239,239,236,0/
      DATA AAABG0/175,228,229,246,175,238,245,236,236,0/
      DATA AAABH0/238,239,0/
      IF((DEVEQ(NAME,AAABC0).NE.1))GOTO 10124
        CALL SCOPY(AAABD0,1,NAME,1)
        GOTO 10125
10124   IF((DEVEQ(NAME,AAABE0).NE.1))GOTO 10126
          CALL SCOPY(AAABF0,1,NAME,1)
          GOTO 10127
10126     IF((DEVEQ(NAME,AAABG0).NE.1))GOTO 10128
            CALL SCOPY(AAABH0,1,NAME,1)
            GOTO 10129
10128       CALL EXPAND(NAME,TEMP,102)
            IF((INDEX(TEMP,186).NE.0))GOTO 10130
              I=MKTR$(TEMP,NAME)
              GOTO 10131
10130         NAME(1)=167
              I=MKTR$(TEMP,NAME(2))+2
              NAME(I)=167
              NAME(I+1)=0
10131     CONTINUE
10129   CONTINUE
10127 CONTINUE
10125 RETURN
      END
      INTEGER FUNCTION DEVEQ(PATH,DEVICE)
      INTEGER PATH(1),DEVICE(1)
      INTEGER TEMP(180)
      INTEGER L
      INTEGER EQUAL,STAKE
      L=STAKE(PATH,TEMP,9)
      IF((TEMP(L).NE.175))GOTO 10132
        TEMP(L)=0
10132 DEVEQ=EQUAL(TEMP,DEVICE)
      RETURN
      END
C ---- Long Name Map ----
C processactions                 proce0
C nloffpos                       nloff0
C nlontab                        nlont0
C convertname                    conve0
C nlofftab                       nlofg0
C makedefault                    maked0
C findunrestrictedoptions        findu0
C nlonpos                        nlonp0
C findoption                     findo0