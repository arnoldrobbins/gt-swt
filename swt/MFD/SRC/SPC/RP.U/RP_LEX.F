      SUBROUTINE GETSYM
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER RADIX,I
      INTEGER INDEX,CTOI,LTOC
      INTEGER * 4 VAL
      INTEGER C,QUOTE
      INTEGER MAPDN
      INTEGER ANYUP0
      INTEGER LOOKUP,SCOPY
      INTEGER INFO(3)
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0(17)
      INTEGER AAAAE0(6)
      INTEGER AAAAF0(5)
      INTEGER AAAAG0(5)
      INTEGER AAAAH0(5)
      INTEGER AAAAI0(5)
      INTEGER AAAAJ0(5)
      INTEGER AAAAK0(5)
      INTEGER AAAAL0(5)
      INTEGER AAAAM0(6)
      INTEGER AAAAN0
      INTEGER AAAAO0
      INTEGER AAAAP0
      INTEGER AAAAQ0
      DATA AAAAD0/176,177,178,179,180,181,182,183,184,185,225,226,227,22
     *8,229,230,0/
      DATA AAAAE0/174,193,206,196,174,0/
      DATA AAAAF0/174,207,210,174,0/
      DATA AAAAG0/174,197,209,174,0/
      DATA AAAAH0/174,204,197,174,0/
      DATA AAAAI0/174,204,212,174,0/
      DATA AAAAJ0/174,199,197,174,0/
      DATA AAAAK0/174,199,212,174,0/
      DATA AAAAL0/174,206,197,174,0/
      DATA AAAAM0/174,206,207,212,174,0/
10001   SYMLE0=0
        SYMTE0(1)=0
        IF((INBUF0(IBPAA0).EQ.0))GOTO 10002
          C=INBUF0(IBPAA0)
          IBPAA0=IBPAA0+(1)
          GOTO 10003
10002     CALL REFIL0(C)
10003   AAAAA0=1
        GOTO 10000
10004   AAAAB0=C
        GOTO 10005
10006     ANYUP0=0
10007       GOTO 10008
10009         SYMLE0=SYMLE0+(1)
              SYMTE0(SYMLE0)=C
            GOTO 10010
10011         SYMLE0=SYMLE0+(1)
              SYMTE0(SYMLE0)=C
              ANYUP0=1
            GOTO 10010
10008       IF((225.GT.C))GOTO 10013
            IF((C.GT.250))GOTO 10013
            GOTO 10009
10013       IF((176.GT.C))GOTO 10014
            IF((C.GT.185))GOTO 10014
            GOTO 10009
10014       IF((C.EQ.164))GOTO 10009
            IF((193.GT.C))GOTO 10015
            IF((C.GT.218))GOTO 10015
            GOTO 10011
10015       IF((C.EQ.223))GOTO 10010
              GOTO 10016
10010       IF((INBUF0(IBPAA0).EQ.0))GOTO 10017
              C=INBUF0(IBPAA0)
              IBPAA0=IBPAA0+(1)
              GOTO 10018
10017         CALL REFIL0(C)
10018     CONTINUE
          GOTO 10008
10016     CALL PUTBA0(C)
          SYMTE0(SYMLE0+1)=0
          IF((A$BUF(237-225+1).EQ.0))GOTO 10019
            ANYUP0=0
            CALL MAPSTR(SYMTE0,1)
10019     SYMLO0(1)=0
          I=SCOPE0
          GOTO 10022
10020     I=I-(1)
10022     IF((I.LE.0))GOTO 10021
            IF((SCOPF0(I).EQ.0))GOTO 10020
            IF((LOOKUP(SYMTE0,INFO,SCOPF0(I)).NE.1))GOTO 10020
              CALL SCOPY(SYMTE0,1,SYMLO0,1)
              SYMLE0=SCOPY(MEMAA0,INFO(3),SYMTE0,1)
              SYMBO0=1024
              GOTO 10024
10021     IF((PROCT0.EQ.0))GOTO 10025
          IF((LOOKUP(SYMTE0,INFO,PROCT0).NE.1))GOTO 10025
            PROCH0=INFO(3)
            SYMBO0=1033
            GOTO 10024
10025     IF((LOOKUP(SYMTE0,INFO,IDTAB0).NE.0))GOTO 10026
            IF((SYMLE0.GT.6))GOTO 10028
            IF((ANYUP0.EQ.1))GOTO 10028
            IF((SYMTE0(6).NE.176))GOTO 10027
            IF((SYMLE0.NE.6))GOTO 10027
            GOTO 10028
10028       IF((A$BUF(226-225+1).NE.0))GOTO 10027
              CALL SCOPY(SYMTE0,1,SYMLO0,1)
              CALL ENTET0
10027       SYMBO0=1024
            GOTO 10024
10026     AAAAC0=INFO(1)
          GOTO 10030
10031       SYMBO0=INFO(2)
            GOTO 10024
10032       CALL SCOPY(SYMTE0,1,SYMLO0,1)
            SYMLE0=SCOPY(MEMAA0,INFO(3),SYMTE0,1)
            SYMBO0=1024
            GOTO 10024
10033       CALL INVOK0(INFO)
            GOTO 10001
10030     GOTO(10031,10032,10033),AAAAC0
            CALL FATAL0('in getsym/id:  can''t happen (bad symtype).')
        GOTO 10035
10036     CONTINUE
10037     IF((176.GT.C))GOTO 10038
          IF((C.GT.185))GOTO 10038
            SYMTE0(SYMLE0+1)=C
            SYMLE0=SYMLE0+(1)
            IF((INBUF0(IBPAA0).EQ.0))GOTO 10039
              C=INBUF0(IBPAA0)
              IBPAA0=IBPAA0+(1)
              GOTO 10037
10039         CALL REFIL0(C)
10040     GOTO 10037
10038     SYMTE0(SYMLE0+1)=0
          IF((C.NE.242))GOTO 10041
            I=1
            RADIX=CTOI(SYMTE0,I)
            IF(((RADIX.GE.2).AND.(RADIX.LE.16)))GOTO 10042
              CALL SYNERR('Radix must be between 2 and 16.')
              RADIX=16
10042       VAL=0
10043         IF((INBUF0(IBPAA0).EQ.0))GOTO 10044
                C=INBUF0(IBPAA0)
                IBPAA0=IBPAA0+(1)
                GOTO 10045
10044           CALL REFIL0(C)
10045         IF((176.GT.C))GOTO 10046
              IF((C.GT.185))GOTO 10046
                I=C-176
                GOTO 10047
10046           I=INDEX(AAAAD0,MAPDN(C))-1
10047         IF((I.LT.0))GOTO 10050
              IF((I.GE.RADIX))GOTO 10050
              GOTO 10048
10048         VAL=VAL*RADIX+I
            GOTO 10043
10050       SYMLE0=LTOC(VAL,SYMTE0,200)
10041     CALL PUTBA0(C)
          SYMBO0=1032
          GOTO 10024
10051     SYMBO0=1041
10052       QUOTE=C
10053         IF((INBUF0(IBPAA0).EQ.0))GOTO 10054
                C=INBUF0(IBPAA0)
                IBPAA0=IBPAA0+(1)
                GOTO 10055
10054           CALL REFIL0(C)
10055         IF((C.NE.QUOTE))GOTO 10056
                GOTO 10057
10056         SYMLE0=SYMLE0+(1)
              IF((SYMLE0.LT.200))GOTO 10058
                CALL SYNERR('Quoted literal too long.')
                GOTO 10059
10058         SYMTE0(SYMLE0)=C
              IF((C.NE.138))GOTO 10060
                CALL SYNERR('Unmatched quote.')
                GOTO 10057
10060       CONTINUE
            GOTO 10053
10057       SYMTE0(SYMLE0+1)=0
            IF((INBUF0(IBPAA0).EQ.0))GOTO 10061
              C=INBUF0(IBPAA0)
              IBPAA0=IBPAA0+(1)
              GOTO 10062
10061         CALL REFIL0(C)
10062       AAAAA0=2
            GOTO 10000
10063     CONTINUE
          IF((C.EQ.162))GOTO 10052
          IF((C.EQ.167))GOTO 10052
10059     IF((225.GT.C))GOTO 10064
          IF((C.GT.250))GOTO 10064
            CALL CONVE0(C)
            GOTO 10024
10064       CALL PUTBA0(C)
10065     GOTO 10024
10066     IF((INBUF0(IBPAA0).EQ.0))GOTO 10067
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10068
10067       CALL REFIL0(C)
10068     IF((C.NE.166))GOTO 10069
            SYMBO0=1000
            GOTO 10024
10069       IF((C.NE.189))GOTO 10071
              SYMBO0=1056
              GOTO 10072
10071         CALL PUTBA0(C)
              SYMLE0=SCOPY(AAAAE0,1,SYMTE0,1)
              SYMBO0=166
10072     CONTINUE
10070     GOTO 10024
10073     IF((INBUF0(IBPAA0).EQ.0))GOTO 10074
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10075
10074       CALL REFIL0(C)
10075     IF((C.NE.252))GOTO 10076
            SYMBO0=1008
            GOTO 10024
10076       IF((C.NE.189))GOTO 10078
              SYMBO0=1057
              GOTO 10079
10078         CALL PUTBA0(C)
              SYMLE0=SCOPY(AAAAF0,1,SYMTE0,1)
              SYMBO0=252
10079     CONTINUE
10077     GOTO 10024
10080     IF((INBUF0(IBPAA0).EQ.0))GOTO 10081
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10082
10081       CALL REFIL0(C)
10082     IF((C.NE.189))GOTO 10083
            SYMLE0=SCOPY(AAAAG0,1,SYMTE0,1)
            SYMBO0=1001
            GOTO 10024
10083       CALL PUTBA0(C)
            SYMTE0(1)=189
            SYMTE0(2)=0
            SYMLE0=1
            SYMBO0=189
10084     GOTO 10024
10085     IF((INBUF0(IBPAA0).EQ.0))GOTO 10086
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10087
10086       CALL REFIL0(C)
10087     IF((C.NE.189))GOTO 10088
            SYMBO0=1004
            SYMLE0=SCOPY(AAAAH0,1,SYMTE0,1)
            GOTO 10024
10088       CALL PUTBA0(C)
            SYMLE0=SCOPY(AAAAI0,1,SYMTE0,1)
            SYMBO0=1005
10089     GOTO 10024
10090     IF((INBUF0(IBPAA0).EQ.0))GOTO 10091
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10092
10091       CALL REFIL0(C)
10092     IF((C.NE.189))GOTO 10093
            SYMBO0=1002
            SYMLE0=SCOPY(AAAAJ0,1,SYMTE0,1)
            GOTO 10024
10093       SYMBO0=1003
            SYMLE0=SCOPY(AAAAK0,1,SYMTE0,1)
            CALL PUTBA0(C)
10094     GOTO 10024
10095     IF((INBUF0(IBPAA0).EQ.0))GOTO 10096
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10097
10096       CALL REFIL0(C)
10097     IF((C.NE.189))GOTO 10098
            SYMBO0=1006
            SYMLE0=SCOPY(AAAAL0,1,SYMTE0,1)
            GOTO 10024
10098       SYMBO0=1007
            SYMLE0=SCOPY(AAAAM0,1,SYMTE0,1)
            CALL PUTBA0(C)
10099     GOTO 10024
10100     SYMBO0=C
          IF((INBUF0(IBPAA0).EQ.0))GOTO 10101
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10102
10101       CALL REFIL0(C)
10102     IF((C.EQ.189))GOTO 10103
            SYMTE0(1)=SYMBO0
            SYMTE0(2)=0
            SYMLE0=1
            CALL PUTBA0(C)
            GOTO 10024
10103       AAAAN0=SYMBO0
            GOTO 10105
10106         SYMBO0=1050
            GOTO 10107
10108         SYMBO0=1051
            GOTO 10107
10109         SYMBO0=1052
            GOTO 10107
10110         SYMBO0=1053
            GOTO 10107
10111         SYMBO0=1054
            GOTO 10107
10112         SYMBO0=1055
            GOTO 10107
10105       AAAAO0=AAAAN0-164
            GOTO(10111,10113,10113,10113,10113,10109,10106,10113,10108, 
     *    10113,10110),AAAAO0
            IF(AAAAN0.EQ.222)GOTO 10112
10113       CONTINUE
10107     CONTINUE
10104     GOTO 10024
10114     SYMBO0=C
          SYMTE0(1)=C
          SYMTE0(2)=0
          SYMLE0=1
          CALL PUTBA0(223)
          GOTO 10024
10005   AAAAP0=AAAAB0-161
        GOTO(10051,10115,10006,10100,10066,10051,10115,10115,10100,10100
     *,10114,10100,10115,10100,10036,10036,10036,10036,10036,10036,10036
     *,10036,10036,10036,10115,10115,10085,10080,10090,10115,10115,10006
     *,10006,10006,10006,10006,10006,10006,10006,10006,10006,10006,10006
     *,10006,10006,10006,10006,10006,10006,10006,10006,10006,10006,10006
     *,10006,10006,10006,10115,10115,10115,10100,10115,10115,10006,10006
     *,10006,10006,10006,10006,10006,10006,10006,10006,10006,10006,10006
     *,10006,10006,10006,10006,10006,10006,10006,10006,10006,10006,10006
     *,10006,10006,10115,10073,10115,10095),AAAAP0
10115     SYMBO0=C
          SYMTE0(1)=C
          SYMTE0(2)=0
          SYMLE0=1
          GOTO 10024
10035 CONTINUE
10034 GOTO 10001
10024 RETURN
10000 CONTINUE
10116   CONTINUE
10117   IF((C.NE.160))GOTO 10118
          IF((INBUF0(IBPAA0).EQ.0))GOTO 10119
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10117
10119       CALL REFIL0(C)
10120   GOTO 10117
10118   AAAAQ0=C
        GOTO 10121
10122     CONTINUE
10123       IF((INBUF0(IBPAA0).EQ.0))GOTO 10124
              C=INBUF0(IBPAA0)
              IBPAA0=IBPAA0+(1)
              GOTO 10125
10124         CALL REFIL0(C)
10125       IF((C.NE.163))GOTO 10126
10127           IF((INBUF0(IBPAA0).EQ.0))GOTO 10128
                  C=INBUF0(IBPAA0)
                  IBPAA0=IBPAA0+(1)
                  GOTO 10129
10128             CALL REFIL0(C)
10129         CONTINUE
              IF((C.NE.138))GOTO 10127
10126     CONTINUE
          IF((C.EQ.160))GOTO 10123
          IF((C.EQ.138))GOTO 10123
          IF((C.EQ.223))GOTO 10123
        GOTO 10130
10131     CONTINUE
10132       IF((INBUF0(IBPAA0).EQ.0))GOTO 10133
              C=INBUF0(IBPAA0)
              IBPAA0=IBPAA0+(1)
              GOTO 10134
10133         CALL REFIL0(C)
10134     CONTINUE
          IF((C.NE.138))GOTO 10132
        GOTO 10130
10121   IF(AAAAQ0.EQ.163)GOTO 10131
        IF(AAAAQ0.EQ.223)GOTO 10122
10130 CONTINUE
      IF((C.EQ.160))GOTO 10116
      GOTO 10135
10135 GOTO(10004,10063),AAAAA0
      GOTO 10135
      END
      SUBROUTINE CONVE0(C)
      INTEGER C
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER V,I,J
      INTEGER ITOC,SCOPY,TLIT
      INTEGER TEXT(200)
      INTEGER AAAAR0
      INTEGER AAAAS0
      AAAAR0=C
      GOTO 10136
10137   IF((SYMLE0.NE.1))GOTO 10138
          V=TLIT(SYMTE0(1))
          SYMLE0=ITOC(V,SYMTE0,200)
          SYMBO0=1032
          GOTO 10140
10138     CALL SYNERR('Only one character allowed in a character constan
     *t.')
10139 GOTO 10140
10141   CALL SCOPY(SYMTE0,1,TEXT,1)
        J=0
        I=1
        GOTO 10144
10142   I=I+(1)
10144   IF((TEXT(I).EQ.0))GOTO 10143
          J=J+(1)
          IF((J.LT.200-1))GOTO 10145
            CALL SYNERR('Packed string constant too long.')
            GOTO 10143
10145     IF((TEXT(I).NE.174))GOTO 10146
            SYMTE0(J)=192
            J=J+(1)
10146     SYMTE0(J)=TEXT(I)
        GOTO 10142
10143   SYMTE0(J+1)=174
        SYMTE0(J+2)=0
        SYMLE0=J+1
        SYMBO0=1041
      GOTO 10140
10147   IF(((OUTPA0(2).EQ.0).AND.(OUTPA0(1).EQ.0)))GOTO 10148
          CALL SYNERR('EOS-terminated string not allowed in this context
     *.')
          RETURN
10148   CALL VARGEN(TEXT)
        CALL GENIN0(TEXT,SYMLE0+1)
        I=1
        GOTO 10151
10149   I=I+(1)
10151   IF((SYMTE0(I).EQ.0))GOTO 10150
          CALL GENCH0(TEXT,I,SYMTE0(I))
        GOTO 10149
10150   CALL GENCH0(TEXT,I,0)
        CALL GENDA0
        SYMLE0=SCOPY(TEXT,1,SYMTE0,1)
        SYMBO0=1024
      GOTO 10140
10152   IF(((OUTPA0(2).EQ.0).AND.(OUTPA0(1).EQ.0)))GOTO 10153
          CALL SYNERR('Varying string not allowed in this context.')
          RETURN
10153   CALL VARGEN(TEXT)
        CALL GENIN0(TEXT,(SYMLE0+1)/2+1)
        SYMTE0(SYMLE0+1)=160
        CALL GENDB0(TEXT,1,SYMLE0)
        I=1
        GOTO 10156
10154   I=I+(2)
10156   IF((I.GT.SYMLE0))GOTO 10155
          CALL GENDB0(TEXT,I/2+2,XOR(LS(TLIT(SYMTE0(I)),8),TLIT(SYMTE0(I
     *+1))))
        GOTO 10154
10155   CALL GENDA0
        SYMLE0=SCOPY(TEXT,1,SYMTE0,1)
        SYMBO0=1024
      GOTO 10140
10136 IF(AAAAR0.EQ.195)GOTO 10137
      AAAAS0=AAAAR0-207
      GOTO(10141,10157,10157,10147,10157,10157,10152,10157,10157,10157, 
     *    10157,10157,10157,10157,10157,10157,10157,10157,10157,10137),A
     *AAAS0
      AAAAS0=AAAAR0-239
      GOTO(10141,10157,10157,10147,10157,10157,10152),AAAAS0
10157   CALL SYNERR('Unrecognizable string format indicator.')
10140 RETURN
      END
      SUBROUTINE REFIL0(C)
      INTEGER C
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER GETLIN
10158   IF((LEVEL0.GE.1))GOTO 10159
          C=-1
          INBUF0(400)=0
          IBPAA0=400
          RETURN
10159   IF((GETLIN(INBUF0(400),INFIL0(LEVEL0)).EQ.-1))GOTO 10160
          LINEN0(LEVEL0)=LINEN0(LEVEL0)+(1)
          GOTO 10161
10160   CALL CLOSE(INFIL0(LEVEL0))
        LEVEL0=LEVEL0-(1)
      GOTO 10158
10161 C=INBUF0(400)
      IBPAA0=400+1
      RETURN
      END
      SUBROUTINE PUTBA0(C)
      INTEGER C
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      IBPAA0=IBPAA0-(1)
      IF((IBPAA0.LT.1))GOTO 10162
        INBUF0(IBPAA0)=C
        GOTO 10163
10162   CALL FATAL0('too many characters pushed back.')
10163 RETURN
      END
      SUBROUTINE PUTBC0(STR)
      INTEGER STR(1)
      INTEGER SYMTE0(200),SYMLO0(200),LASTV0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0,LASTV0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAL0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAL0
      INTEGER OUTBU0(128,4)
      INTEGER OUTPA0(4)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(32767)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(4),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRU0(20),EXPRV0,FALSE0
      COMMON /CODEG0/EXPRU0,EXPRV0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SLTAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER DISPA0,LASTD0,XGOFR0(407),XGOTO0(407),LGOLI0(1000),LGOPO0(
     *1000),LGOST0(1000),LGOLP0
      COMMON /GOCOM/DISPA0,LASTD0,XGOFR0,XGOTO0,LGOLI0,LGOPO0,LGOST0,LGO
     *LP0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200),TLITC0(256),TLITE0
      INTEGER CURLA0,BRACE0,INDEN0,FIRST0,SPNUM0,LASTN0,CODEL0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,INDEN0,MODUM0,FIRST0,PROFD0,SP
     *NUM0,ERROR0,A$BUF,LASTN0,CODEL0,TLITC0,TLITE0
      INTEGER I
      INTEGER LENGTH
      I=LENGTH(STR)-1
      GOTO 10166
10164 I=I-(1)
10166 IF((I.LT.0))GOTO 10165
        CALL PUTBA0(STR(I+1))
      GOTO 10164
10165 RETURN
      END
      SUBROUTINE PUTBB0(N)
      INTEGER N
      INTEGER LEN
      INTEGER ITOC
      INTEGER CHARS(128)
      LEN=ITOC(N,CHARS,128)
      CHARS(LEN+1)=0
      CALL PUTBC0(CHARS)
      RETURN
      END
C ---- Long Name Map ----
C boolterm                       boolt0
C callstmt                       calls0
C casestmt                       cases0
C returnstmt                     retus0
C Xgofrom                        xgofr0
C booloperand                    boolo0
C collectbalancedstring          collf0
C dataother                      datao0
C deleteunderscores              delet0
C enterdefinition                enter0
C codeother                      codeo0
C endmodule                      endmo0
C enterlongname                  entet0
C forstmt                        forst0
C Fortfile                       fortf0
C Tlitchar                       tlitc0
C Tliteos                        tlite0
C Indent                         inden0
C Slt                            sltaa0
C otherstmt                      other0
C cleanup                        clean0
C convertstringconstant          conve0
C putbackstr                     putbc0
C simpleboolexpr                 simpl0
C Breaklab                       breal0
C boolexpr                       boole0
C generateexprcode               gener0
C putback                        putba0
C Xgoto                          xgoto0
C Lgostmt                        lgost0
C copylefthandside               copyl0
C genchardata                    gench0
C maketreenode                   maket0
C obufcom                        obufc0
C genprocentry                   genpt0
C invokemacro                    invok0
C linkagedecl                    linka0
C setupprochead                  setuq0
C Dispatchflag                   dispa0
C Spnum                          spnum0
C Codelinenum                    codel0
C genintdecl                     genin0
C selectstmt                     selec0
C checklastforboolean            check0
C loadtranstable                 loadt0
C repeatstmt                     repea0
C Proctable                      proct0
C Lastdispatchflag               lastd0
C begindecl                      begin0
C refillbuffer                   refil0
C exprstackpop                   exprs0
C strtabledecl                   strta0
C equivother                     equiv0
C stopmodule                     stopm0
C strdecl                        strde0
C returnmodule                   retur0
C anyupper                       anyup0
C genproccontroldecl             genps0
C beginstmt                      begip0
C breakstmt                      break0
C genparam                       genpa0
C savemodulename                 savem0
C genprocgoto                    genpu0
C genselectcode                  gense0
C includedecl                    inclu0
C listlongnames                  listl0
C localdecl                      local0
C Lgoline                        lgoli0
C Lgopos                         lgopo0
C Outbuf                         outbu0
C Firststmt                      first0
C Symbol                         symbo0
C Inbuf                          inbuf0
C Ibp                            ibpaa0
C compoundstmt                   compo0
C genexpr                        genex0
C loopcom                        loopc0
C ratforcode                     ratfo0
C replacetreenode                repla0
C Unametable                     uname0
C Nextlab                        nextl0
C enddecl                        endde0
C fatalerr                       fatal0
C Symlen                         symle0
C Prochead                       proch0
C boolfactor                     boolf0
C exitscope                      exits0
C gendataitem                    gendb0
C parboolexpr                    parbo0
C propagatenots                  propa0
C removedefinition               remov0
C statement                      state0
C Symlongtext                    symlo0
C Level                          level0
C Mem                            memaa0
C dgetsym                        dgets0
C gettranschar                   gettr0
C Falsebranch                    false0
C Scopetable                     scopf0
C Profdictfile                   profd0
C boolprimary                    boolp0
C Symtext                        symte0
C Scvalue                        scval0
C declaration                    decla0
C endprogram                     endpr0
C enteroperator                  enteu0
C gotostmt                       gotos0
C process                        procg0
C Loopsp                         loops0
C codegen                        codeg0
C enterkw                        entes0
C setuplocalid                   setup0
C Modulelongname                 modum0
C enterprocparam                 entev0
C proceduredecl                  proce0
C Result                         resul0
C Bracecount                     brace0
C initialize                     initi0
C restoresym                     resto0
C skipwhitespace                 skipw0
C Exprstackptr                   exprv0
C Lgolp                          lgolp0
C Modulename                     modul0
C genproccall                    genpr0
C genprocreturn                  genpv0
C getactualparameters            getac0
C Outp                           outpa0
C Outfile                        outfi0
C beginmodule                    begio0
C Infile                         infil0
C makeunique                     makeu0
C nextstmt                       nexts0
C collectactualparameter         colle0
C gendataend                     genda0
C negatechildren                 negat0
C outgolab                       outgo0
C procedurestmt                  procf0
C Curlab                         curla0
C genselgoto                     gensf0
C Exprstack                      expru0
C skipblanksandcomments          skipb0
C copytreenode                   copyt0
C enterscope                     entew0
C savesym                        saves0
C whilestmt                      while0
C Lastvar                        lastv0
C Scopesp                        scope0
C createprocscope                creat0
C escapestmt                     escap0
C getdefinition                  getde0
C exprstackpush                  exprt0
C getformalparameters            getfo0
C getlongname                    getlo0
C putbacknum                     putbb0
C setupwhen                      setur0
C cleanupgotos                   cleao0
C Idtable                        idtab0
C declother                      declo0
C stopstmt                       stops0
C Linenumber                     linen0
C Sclabel                        sclab0
C Errorsym                       error0
C Lastnumout                     lastn0
