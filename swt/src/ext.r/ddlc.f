      INTEGER CPOS(2)
      INTEGER CTAB(13)
      INTEGER IPOS(2)
      INTEGER ITAB(18)
      INTEGER A$BUF(200)
      INTEGER INPF(180),LISTF(180),BINF(180)
      INTEGER I
      INTEGER COMOPT,COMFN,PARSCL,EQUAL
      INTEGER AAAAA0(17)
      INTEGER CTOC
      INTEGER AAAAB0(1)
      INTEGER CTOC
      INTEGER AAAAC0(1)
      INTEGER AAAAD0(5)
      INTEGER AAAAE0(3)
      INTEGER AAAAF0(1)
      INTEGER AAAAG0(3)
      INTEGER AAAAH0(4)
      INTEGER AAAAI0(6)
      DATA CTAB/1,0,0,244,242,160,176,178,176,176,176,176,0/
      DATA CPOS/1,1/
      DATA ITAB/22,0,1,1,-106,-106,-106,-100,0,-101,1,-104,-100,1,-102,1
     *,-104,-105/
      DATA IPOS/1,1/
      DATA AAAAA0/246,188,239,233,190,160,236,188,239,243,190,250,188,23
     *9,243,190,0/
      DATA AAAAB0/0/
      DATA AAAAC0/0/
      DATA AAAAD0/174,228,228,236,0/
      DATA AAAAE0/174,236,0/
      DATA AAAAF0/0/
      DATA AAAAG0/238,239,0/
      DATA AAAAH0/244,244,249,0/
      DATA AAAAI0/243,240,239,239,236,0/
      IF((PARSCL(AAAAA0,A$BUF).EQ.-2))GOTO 10000
        CALL ERROR('Usage: ddlc {-v[<level>]} <file> {-l [<file>]} [-z <
     *string>].')
10000 IF((A$BUF(236-225+1).EQ.2))GOTO 10001
        A$BUF(236-225+27)=A$BUF(53)
        A$BUF(53)=A$BUF(53)+(1+CTOC(AAAAB0,A$BUF(A$BUF(53)),200))
10001 IF((A$BUF(226-225+1).EQ.2))GOTO 10002
        A$BUF(226-225+27)=A$BUF(53)
        A$BUF(53)=A$BUF(53)+(1+CTOC(AAAAC0,A$BUF(A$BUF(53)),200))
10002 IF((COMOPT(A$BUF,CPOS,CTAB,IPOS,ITAB).EQ.-3))GOTO 10004
      IF((COMFN(A$BUF,INPF,AAAAD0,LISTF,AAAAE0,BINF,AAAAF0).EQ.-3))GOTO 
     *10004
      GOTO 10003
10004   CALL SETERR(1000)
        CALL SWT
10003 IF((EQUAL(LISTF,AAAAG0).EQ.1))GOTO 10006
      IF((EQUAL(LISTF,AAAAH0).EQ.1))GOTO 10006
      IF((EQUAL(LISTF,AAAAI0).EQ.1))GOTO 10006
      GOTO 10005
10006   CALL ERROR('Sorry, listing must go to a disk file.')
10005 CALL PRINT(-11,'schema -i *s -l *s.',INPF,LISTF)
      I=1
      GOTO 10009
10007 I=I+(1)
10009 IF((I.GT.CPOS(1)))GOTO 10008
        IF((CTAB(CPOS(I+1)+1).NE.1))GOTO 10010
        IF((CTAB(CPOS(I+1)+2).NE.0))GOTO 10010
          CALL PRINT(-11,' -*s.',CTAB(CPOS(I+1)+3))
10010 GOTO 10007
10008 IF((A$BUF(250-225+1).EQ.0))GOTO 10011
        CALL PRINT(-11,' *s.',A$BUF(A$BUF(250-225+27)))
10011 CALL PUTCH(138,-11)
      CALL SWT
      END
      INTEGER FUNCTION COMOPT(A$BUF,CPOS,CTAB,IPOS,ITAB)
      INTEGER A$BUF(200)
      INTEGER CPOS(1),CTAB(1),IPOS(1),ITAB(1)
      INTEGER C,I,POS,FPOS,LP,NLP,LIST(26),NLIST(26)
      INTEGER AAAAL0
      INTEGER AAAAN0
      INTEGER AAAAO0
      INTEGER AAAAJ0,AAAAK0
      INTEGER AAAAP0,AAAAQ0,AAAAR0
      INTEGER LENGTH
      INTEGER AAAAS0
      INTEGER AAAAT0
      INTEGER AAAAM0
      INTEGER AAAAU0,AAAAV0
      LP=0
      I=1
      GOTO 10017
10015 I=I+(1)
10017 IF((I.GT.IPOS(1)))GOTO 10016
        POS=IPOS(I+1)
        C=ITAB(POS+0)
        IF((A$BUF(C).EQ.0))GOTO 10018
          IF((A$BUF(C).EQ.2))GOTO 10019
            A$BUF(C+26)=ITAB(POS+2)
10019     ITAB(POS+6)=A$BUF(C+26)
          LP=LP+(1)
          LIST(LP)=POS
          IF((A$BUF(C+26).LT.ITAB(POS+1)))GOTO 10021
          IF((A$BUF(C+26).GT.ITAB(POS+2)))GOTO 10021
          GOTO 10020
10021       CALL PRINT(-15,'level numbers for -*c are *i to *i*n.',C-1+2
     *25,ITAB(POS+1),ITAB(POS+2))
            COMOPT=-3
            RETURN
10020   CONTINUE
10018 GOTO 10015
10016 IF((LP.GT.0))GOTO 10022
        AAAAO0=1
        GOTO 10014
10023 CONTINUE
10022 CONTINUE
10024 IF((LP.LE.0))GOTO 10025
        NLP=0
        DO 10026 I=1,LP
          POS=LIST(I)
          C=ITAB(POS+0)
          IF((ITAB(POS+6).NE.-106))GOTO 10028
            GOTO 10029
10030         ITAB(POS+6)=ITAB(POS+4)
            GOTO 10031
10032         ITAB(POS+6)=ITAB(POS+5)
            GOTO 10031
10029       IF((ITAB(POS+3).LT.ITAB(POS+4)))GOTO 10030
            IF((ITAB(POS+3).GT.ITAB(POS+5)))GOTO 10032
              ITAB(POS+6)=ITAB(POS+3)
10031     CONTINUE
10028     AAAAJ0=POS
          AAAAK0=ITAB(POS+6)
          AAAAL0=1
          GOTO 10012
10033     CONTINUE
10026   CONTINUE
10027   IF((NLP.GT.0))GOTO 10034
          AAAAO0=2
          GOTO 10014
10035     GOTO 10036
10034     LP=NLP
          DO 10037 I=1,NLP
            LIST(I)=NLIST(I)
10037     CONTINUE
10038   CONTINUE
10036 GOTO 10024
10025 COMOPT=-2
      RETURN
10012 AAAAQ0=AAAAJ0+1
      GOTO 10041
10039 AAAAQ0=AAAAQ0+(1)
10041 IF((ITAB(AAAAQ0).NE.-100))GOTO 10042
      IF((ITAB(AAAAQ0+1).NE.AAAAK0))GOTO 10042
      GOTO 10040
10042 IF((ITAB(AAAAQ0).EQ.-105))GOTO 10040
      GOTO 10039
10040 IF((ITAB(AAAAQ0).EQ.-100))GOTO 10043
        COMOPT=-3
        RETURN
10043 AAAAQ0=AAAAQ0+(2)
10044   AAAAS0=ITAB(AAAAQ0)
        GOTO 10045
10046     AAAAQ0=AAAAQ0+(1)
          GOTO 10049
10047     AAAAQ0=AAAAQ0+(1)
10049     IF((ITAB(AAAAQ0).LE.0))GOTO 10048
            AAAAR0=1
            GOTO 10052
10050       AAAAR0=AAAAR0+(1)
10052       IF((AAAAR0.GT.CPOS(1)))GOTO 10051
              IF((ITAB(AAAAQ0).NE.CTAB(CPOS(AAAAR0+1)+0)))GOTO 10053
                CTAB(CPOS(AAAAR0+1)+1)=1
                GOTO 10051
10053       GOTO 10050
10051     GOTO 10047
10048   GOTO 10054
10055     AAAAQ0=AAAAQ0+(1)
          GOTO 10058
10056     AAAAQ0=AAAAQ0+(1)
10058     IF((ITAB(AAAAQ0).LE.0))GOTO 10057
            AAAAR0=1
            GOTO 10061
10059       AAAAR0=AAAAR0+(1)
10061       IF((AAAAR0.GT.CPOS(1)))GOTO 10060
              IF((ITAB(AAAAQ0).NE.CTAB(CPOS(AAAAR0+1)+0)))GOTO 10062
                CTAB(CPOS(AAAAR0+1)+1)=0
                GOTO 10060
10062       GOTO 10059
10060     GOTO 10056
10057   GOTO 10054
10063     AAAAP0=ITAB(AAAAQ0+1)
          AAAAM0=AAAAP0
          AAAAN0=1
          GOTO 10013
10064     GOTO 10065
10066       IF((ITAB(FPOS+6).GT.ITAB(AAAAQ0+3)))GOTO 10068
            IF((ITAB(FPOS+6).LT.ITAB(AAAAQ0+2)))GOTO 10068
            GOTO 10067
10068         CALL PRINT(-15,'-*c*i: *s*n.',ITAB(AAAAJ0+0)-1+225,AAAAK0,
     *ITAB(AAAAQ0+4))
              COMOPT=-3
              RETURN
10067     GOTO 10069
10070       ITAB(FPOS+4)=ITAB(AAAAQ0+2)
            ITAB(FPOS+5)=ITAB(AAAAQ0+3)
            NLP=NLP+(1)
            NLIST(NLP)=FPOS
          GOTO 10069
10071       ITAB(FPOS+4)=MAX0(ITAB(FPOS+4),ITAB(AAAAQ0+2))
            ITAB(FPOS+5)=MIN0(ITAB(FPOS+5),ITAB(AAAAQ0+3))
            NLP=NLP+(1)
            NLIST(NLP)=FPOS
          GOTO 10069
10065     IF((ITAB(FPOS+6).NE.-106))GOTO 10066
          IF((ITAB(FPOS+4).EQ.-106))GOTO 10070
          IF((ITAB(AAAAQ0+2).GT.ITAB(FPOS+5)))GOTO 10072
          IF((ITAB(AAAAQ0+3).LT.ITAB(FPOS+4)))GOTO 10072
          GOTO 10071
10072     CONTINUE
            CALL PRINT(-15,'-*c*i: *s*n.',ITAB(AAAAJ0+0)-1+225,AAAAK0,IT
     *AB(AAAAQ0+4))
            COMOPT=-3
            RETURN
10069     AAAAQ0=AAAAQ0+(5+LENGTH(ITAB(AAAAQ0+4)))
        GOTO 10054
10073     GOTO 10074
10045   AAAAT0=AAAAS0+105
        GOTO(10073,10063,10055,10046),AAAAT0
          COMOPT=-3
          RETURN
10054 CONTINUE
      GOTO 10044
10074 GOTO 10075
10013 FPOS=1
      GOTO 10078
10076 FPOS=FPOS+(1)
10078 IF((FPOS.GT.IPOS(1)))GOTO 10077
        IF((AAAAM0.NE.ITAB(IPOS(FPOS+1)+0)))GOTO 10079
          GOTO 10077
10079 GOTO 10076
10077 IF((FPOS.GT.IPOS(1)))GOTO 10080
        FPOS=IPOS(FPOS+1)
        GOTO 10081
10080   COMOPT=-3
        RETURN
10081 GOTO 10082
10014 LP=0
      AAAAU0=1
      GOTO 10085
10083 AAAAU0=AAAAU0+(1)
10085 IF((AAAAU0.GT.IPOS(1)))GOTO 10084
        AAAAV0=IPOS(AAAAU0+1)
        IF((ITAB(AAAAV0+6).NE.-106))GOTO 10086
          ITAB(AAAAV0+6)=ITAB(AAAAV0+3)
          LP=LP+(1)
          LIST(LP)=AAAAV0
10086 GOTO 10083
10084 GOTO 10087
10075 GOTO 10033
10087 GOTO(10023,10035),AAAAO0
      GOTO 10087
10082 GOTO 10064
      END
      INTEGER FUNCTION COMFN(A$BUF,INPF,EXT,LISTF,LEXT,BINF,BEXT)
      INTEGER A$BUF(200)
      INTEGER INPF(1),EXT(1),LISTF(1)
      INTEGER LEXT(1),BINF(1),BEXT(1)
      INTEGER GETARG,DEVEQ
      INTEGER FD
      INTEGER CREATE,OPEN
      INTEGER AAAAW0(9)
      INTEGER AAAAX0(10)
      INTEGER AAAAY0(9)
      INTEGER AAAAZ0(9)
      INTEGER AAABA0(9)
      INTEGER AAABB0(9)
      INTEGER AAABC0(9)
      DATA AAAAW0/175,228,229,246,175,236,240,243,0/
      DATA AAAAX0/175,228,229,246,175,238,245,236,236,0/
      DATA AAAAY0/175,228,229,246,175,244,244,249,0/
      DATA AAAAZ0/175,228,229,246,175,244,244,249,0/
      DATA AAABA0/175,228,229,246,175,244,244,249,0/
      DATA AAABB0/175,228,229,246,175,236,240,243,0/
      DATA AAABC0/175,228,229,246,175,244,244,249,0/
      IF((GETARG(1,INPF,180).NE.-1))GOTO 10088
        CALL REMARK('missing input file name.')
        COMFN=-3
        RETURN
10088 CALL MAPSTR(INPF,1)
      IF((DEVEQ(INPF,AAAAW0).EQ.1))GOTO 10090
      IF((DEVEQ(INPF,AAAAX0).EQ.1))GOTO 10090
      GOTO 10089
10090   CALL PRINT(-15,'*s: unreasonable input file*n.',INPF)
        COMFN=-3
        RETURN
10089 IF((A$BUF(A$BUF(236-225+27)).NE.0))GOTO 10091
        IF((DEVEQ(INPF,AAAAY0).NE.1))GOTO 10092
          CALL SCOPY(AAAAZ0,1,LISTF,1)
          GOTO 10093
10092     CALL MAKED0(INPF,EXT,LISTF,LEXT)
10093   GOTO 10094
10091   CALL SCOPY(A$BUF(A$BUF(236-225+27)),1,LISTF,1)
10094 CALL CONVE0(LISTF)
      IF((A$BUF(A$BUF(226-225+27)).NE.0))GOTO 10095
        IF((DEVEQ(INPF,AAABA0).NE.1))GOTO 10096
          CALL SCOPY(BEXT,1,BINF,1)
          GOTO 10097
10096     CALL MAKED0(INPF,EXT,BINF,BEXT)
10097   GOTO 10098
10095   CALL SCOPY(A$BUF(A$BUF(226-225+27)),1,BINF,1)
10098 IF((DEVEQ(BINF,AAABB0).EQ.1))GOTO 10100
      IF((DEVEQ(BINF,AAABC0).EQ.1))GOTO 10100
      GOTO 10099
10100   CALL PRINT(-15,'*s: unreasonable binary file*n.',BINF)
        COMFN=-3
        RETURN
10099 CALL CONVE0(BINF)
      CALL CONVE0(INPF)
      COMFN=-2
      RETURN
      END
      SUBROUTINE COMNL(CPOS,CTAB,OFF,ON)
      INTEGER CPOS(1),CTAB(1),OFF(1),ON(1)
      INTEGER I,J
      I=1
      GOTO 10103
10101 I=I+(1)
10103 IF((OFF(I).EQ.0))GOTO 10102
        J=1
        GOTO 10106
10104   J=J+(1)
10106   IF((J.GT.CPOS(1)))GOTO 10105
          IF((OFF(I).NE.CTAB(CPOS(J+1)+0)))GOTO 10107
            CTAB(CPOS(J+1)+1)=0
            GOTO 10105
10107   GOTO 10104
10105 GOTO 10101
10102 I=1
      GOTO 10110
10108 I=I+(1)
10110 IF((ON(I).EQ.0))GOTO 10109
        J=1
        GOTO 10113
10111   J=J+(1)
10113   IF((J.GT.CPOS(1)))GOTO 10112
          IF((ON(I).NE.CTAB(CPOS(J+1)+0)))GOTO 10114
            CTAB(CPOS(J+1)+1)=1
            GOTO 10112
10114   GOTO 10111
10112 GOTO 10108
10109 RETURN
      END
      SUBROUTINE MAKED0(SOURCE,SEXT,DEST,DEXT)
      INTEGER SOURCE(1),SEXT(1),DEST(1),DEXT(1)
      INTEGER DLEN,TLEN,SP,TP
      INTEGER EQUAL,SCOPY
      INTEGER TEXT(102)
      DLEN=SCOPY(SOURCE,1,DEST,1)
      SP=1
10115 IF((SEXT(SP).EQ.0))GOTO 10116
        TP=1
        GOTO 10119
10117   TP=TP+(1)
        SP=SP+(1)
10119   IF((SEXT(SP).EQ.0))GOTO 10118
        IF((SEXT(SP).EQ.172))GOTO 10118
          TEXT(TP)=SEXT(SP)
        GOTO 10117
10118   TEXT(TP)=0
        TLEN=TP-1
        IF((TLEN.GT.DLEN))GOTO 10120
        IF((EQUAL(TEXT,DEST(DLEN-TLEN+1)).NE.1))GOTO 10120
          CALL SCOPY(DEXT,1,DEST,DLEN-TLEN+1)
          RETURN
10120   IF((SEXT(SP).NE.172))GOTO 10121
          SP=SP+(1)
10121 GOTO 10115
10116 CALL SCOPY(DEXT,1,DEST,DLEN+1)
      RETURN
      END
      SUBROUTINE CONVE0(NAME)
      INTEGER NAME(1)
      INTEGER TEMP(102)
      INTEGER I
      INTEGER DEVEQ,MKTR$,INDEX
      EXTERNAL INDEX
      INTEGER AAABD0(9)
      INTEGER AAABE0(4)
      INTEGER AAABF0(9)
      INTEGER AAABG0(6)
      INTEGER AAABH0(10)
      INTEGER AAABI0(3)
      DATA AAABD0/175,228,229,246,175,244,244,249,0/
      DATA AAABE0/244,244,249,0/
      DATA AAABF0/175,228,229,246,175,236,240,243,0/
      DATA AAABG0/243,240,239,239,236,0/
      DATA AAABH0/175,228,229,246,175,238,245,236,236,0/
      DATA AAABI0/238,239,0/
      IF((DEVEQ(NAME,AAABD0).NE.1))GOTO 10122
        CALL SCOPY(AAABE0,1,NAME,1)
        GOTO 10123
10122   IF((DEVEQ(NAME,AAABF0).NE.1))GOTO 10124
          CALL SCOPY(AAABG0,1,NAME,1)
          GOTO 10125
10124     IF((DEVEQ(NAME,AAABH0).NE.1))GOTO 10126
            CALL SCOPY(AAABI0,1,NAME,1)
            GOTO 10127
10126       CALL EXPAND(NAME,TEMP,102)
            IF((INDEX(TEMP,186).NE.0))GOTO 10128
              I=MKTR$(TEMP,NAME)
              GOTO 10129
10128         NAME(1)=167
              I=MKTR$(TEMP,NAME(2))+2
              NAME(I)=167
              NAME(I+1)=0
10129     CONTINUE
10127   CONTINUE
10125 CONTINUE
10123 RETURN
      END
      INTEGER FUNCTION DEVEQ(PATH,DEVICE)
      INTEGER PATH(1),DEVICE(1)
      INTEGER TEMP(180)
      INTEGER L
      INTEGER EQUAL,STAKE
      L=STAKE(PATH,TEMP,9)
      IF((TEMP(L).NE.175))GOTO 10130
        TEMP(L)=0
10130 DEVEQ=EQUAL(TEMP,DEVICE)
      RETURN
      END
C ---- Long Name Map ----
C processactions                 proce0
C convertname                    conve0
C makedefault                    maked0
C findunrestrictedoptions        findu0
C findoption                     findo0