      SUBROUTINE GETSYM
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER INFO(3)
      INTEGER LOOKUP
      SYMBO0=NSYMB0
      SYMPT0=NSYMP0
      SYMLE0=NSYML0
      SYMLI0=NSYMM0
      IF((NSYML0.LE.0))GOTO 10000
        CALL SCOPY(NSYMT0,1,SYMTE0,1)
        GOTO 10001
10000   SYMTE0(1)=0
10001 CONTINUE
10002   CALL GETTOK
        IF((NSYMB0.NE.163))GOTO 10003
          CALL CPREP0
          GOTO 10002
10003   IF((NSYMB0.NE.1023))GOTO 10009
        IF((LOOKUP(NSYMT0,INFO,KEYWD0).NE.1))GOTO 10009
          IF((INFO(1).NE.1))GOTO 10006
            CALL INVOK0(INFO)
            GOTO 10002
10006       IF((INFO(1).NE.2))GOTO 10007
              NSYMB0=INFO(2)
              GOTO 10008
10007         CALL FATAL0('Undefined IDTYPE in Nsymbol.')
10008     CONTINUE
10005   GOTO 10009
10009 RETURN
      END
      SUBROUTINE GETTOK
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER I
      INTEGER CTOI,GCTOI,INDEX,MAPDN
      INTEGER * 4 VAL
      INTEGER * 4 GCTOL
      INTEGER C
      INTEGER AAAAA0
      INTEGER AAAAD0
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0
      INTEGER AAAAL0
      INTEGER AAAAK0
      INTEGER AAAAM0
      INTEGER AAAAN0(17)
      INTEGER AAAAP0
      INTEGER AAAAO0
      INTEGER AAAAQ0
      INTEGER AAAAS0
      INTEGER AAAAR0
      INTEGER AAAAT0
      INTEGER AAAAU0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAV0
      INTEGER AAAAE0
      INTEGER AAAAF0,AAAAG0
      INTEGER AAAAW0
      DATA AAAAN0/176,177,178,179,180,181,182,183,184,185,225,226,227,22
     *8,229,230,0/
      NSYMP0=0
10013   NSYML0=0
        NSYMT0(1)=0
        NSYMM0=LINEN0(LEVEL0)
10014     IF((INBUF0(IBPAA0).EQ.0))GOTO 10015
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10016
10015       CALL REFIL0(C)
10016   CONTINUE
        IF((C.EQ.160))GOTO 10014
        IF((C.EQ.137))GOTO 10014
        AAAAI0=C
        GOTO 10017
10018     CONTINUE
10019     IF((193.GT.C))GOTO 10022
          IF((C.GT.218))GOTO 10022
          GOTO 10021
10022     IF((225.GT.C))GOTO 10023
          IF((C.GT.250))GOTO 10023
          GOTO 10021
10023     IF((176.GT.C))GOTO 10024
          IF((C.GT.185))GOTO 10024
          GOTO 10021
10024     IF((C.EQ.164))GOTO 10021
          IF((C.EQ.223))GOTO 10021
          GOTO 10020
10021       NSYML0=NSYML0+(1)
            NSYMT0(NSYML0)=C
            IF((INBUF0(IBPAA0).EQ.0))GOTO 10025
              C=INBUF0(IBPAA0)
              IBPAA0=IBPAA0+(1)
              GOTO 10019
10025         CALL REFIL0(C)
10026     GOTO 10019
10020     CALL PUTBA0(C)
          NSYMT0(NSYML0+1)=0
          IF((A$BUF(237-225+1).EQ.0))GOTO 10027
            CALL MAPSTR(NSYMT0,1)
10027     NSYMB0=1023
          GOTO 10028
10029     AAAAA0=1
          GOTO 10010
10031     IF((INBUF0(IBPAA0).EQ.0))GOTO 10032
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10033
10032       CALL REFIL0(C)
10033     IF((176.GT.C))GOTO 10034
          IF((C.GT.185))GOTO 10034
            CALL PUTBA0(C)
            C=174
            AAAAA0=2
            GOTO 10010
10034       CALL PUTBA0(C)
            NSYMB0=174
10036     GOTO 10028
10037     IF((C.NE.162))GOTO 10038
            NSYMB0=1026
            GOTO 10039
10038       NSYMB0=1021
10039     CALL COLLF0(C,NSYMT0,NSYML0)
          GOTO 10028
10040     IF((INBUF0(IBPAA0).EQ.0))GOTO 10041
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10042
10041       CALL REFIL0(C)
10042     IF((C.NE.188))GOTO 10043
            NSYMB0=1010
            GOTO 10028
10043       IF((C.NE.189))GOTO 10045
              NSYMB0=1005
              GOTO 10046
10045         IF((C.NE.190))GOTO 10047
                IF((INBUF0(IBPAA0).EQ.0))GOTO 10048
                  C=INBUF0(IBPAA0)
                  IBPAA0=IBPAA0+(1)
                  GOTO 10049
10048             CALL REFIL0(C)
10049           IF((C.NE.189))GOTO 10050
                  NSYMB0=1017
                  GOTO 10052
10050             NSYMB0=1018
                  CALL PUTBA0(C)
10051           GOTO 10052
10047           NSYMB0=190
                CALL PUTBA0(C)
10052       CONTINUE
10046     CONTINUE
10044     GOTO 10028
10053     IF((INBUF0(IBPAA0).EQ.0))GOTO 10054
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10055
10054       CALL REFIL0(C)
10055     IF((C.NE.190))GOTO 10056
            NSYMB0=1010
            GOTO 10028
10056       IF((C.NE.189))GOTO 10058
              NSYMB0=1007
              GOTO 10059
10058         IF((C.NE.188))GOTO 10060
                IF((INBUF0(IBPAA0).EQ.0))GOTO 10061
                  C=INBUF0(IBPAA0)
                  IBPAA0=IBPAA0+(1)
                  GOTO 10062
10061             CALL REFIL0(C)
10062           IF((C.NE.189))GOTO 10063
                  NSYMB0=1015
                  GOTO 10065
10063             NSYMB0=1016
                  CALL PUTBA0(C)
10064           GOTO 10065
10060           NSYMB0=188
                CALL PUTBA0(C)
10065       CONTINUE
10059     CONTINUE
10057     GOTO 10028
10066     AAAAB0=189
          AAAAC0=1004
          AAAAD0=1
          GOTO 10011
10068     AAAAB0=161
          AAAAC0=1010
          AAAAD0=2
          GOTO 10011
10070     IF((INBUF0(IBPAA0).EQ.0))GOTO 10071
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10072
10071       CALL REFIL0(C)
10072     IF((C.NE.170))GOTO 10073
            IF((INBUF0(IBPAA0).EQ.0))GOTO 10074
              C=INBUF0(IBPAA0)
              IBPAA0=IBPAA0+(1)
              GOTO 10075
10074         CALL REFIL0(C)
10075       CONTINUE
10076         CONTINUE
10077         IF((C.EQ.170))GOTO 10078
              IF((C.EQ.-1))GOTO 10078
                IF((INBUF0(IBPAA0).EQ.0))GOTO 10079
                  C=INBUF0(IBPAA0)
                  IBPAA0=IBPAA0+(1)
                  GOTO 10077
10079             CALL REFIL0(C)
10080         GOTO 10077
10078         IF((C.NE.-1))GOTO 10081
                CALL SYNERR('Missing trailing comment delimiter.',0)
                GOTO 10013
10081         IF((INBUF0(IBPAA0).EQ.0))GOTO 10083
                C=INBUF0(IBPAA0)
                IBPAA0=IBPAA0+(1)
                GOTO 10084
10083           CALL REFIL0(C)
10084       CONTINUE
            IF((C.NE.175))GOTO 10076
10082       GOTO 10013
10073     CALL PUTBA0(C)
          AAAAB0=175
          AAAAC0=1003
          AAAAD0=3
          GOTO 10011
10087     IF((INBUF0(IBPAA0).EQ.0))GOTO 10088
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10089
10088       CALL REFIL0(C)
10089     IF((C.NE.190))GOTO 10090
            NSYMB0=1014
            GOTO 10028
10090       CALL PUTBA0(C)
            AAAAE0=173
            AAAAF0=1002
            AAAAG0=1008
            AAAAH0=1
            GOTO 10012
10092     CONTINUE
10091     GOTO 10028
10093     AAAAE0=171
          AAAAF0=1006
          AAAAG0=1013
          AAAAH0=2
          GOTO 10012
10095     AAAAE0=166
          AAAAF0=1001
          AAAAG0=1000
          AAAAH0=3
          GOTO 10012
10097     AAAAE0=252
          AAAAF0=1012
          AAAAG0=1011
          AAAAH0=4
          GOTO 10012
10099     AAAAB0=170
          AAAAC0=1019
          AAAAD0=4
          GOTO 10011
10101     AAAAB0=165
          AAAAC0=1009
          AAAAD0=5
          GOTO 10011
10103     AAAAB0=222
          AAAAC0=1020
          AAAAD0=6
          GOTO 10011
10017   IF(AAAAI0.EQ.138)GOTO 10013
        AAAAJ0=AAAAI0-160
        GOTO(10068,10037,10106,10018,10101,10095,10037,10106,10106,10099
     *,10093,10106,10087,10031,10070,10029,10029,10029,10029,10029,10029
     *,10029,10029,10029,10029,10106,10106,10053,10066,10040,10106,10106
     *,10018,10018,10018,10018,10018,10018,10018,10018,10018,10018,10018
     *,10018,10018,10018,10018,10018,10018,10018,10018,10018,10018,10018
     *,10018,10018,10018,10018,10106,10106,10106,10103,10018,10106,10018
     *,10018,10018,10018,10018,10018,10018,10018,10018,10018,10018,10018
     *,10018,10018,10018,10018,10018,10018,10018,10018,10018,10018,10018
     *,10018,10018,10018,10106,10097),AAAAJ0
10106     NSYMB0=C
          NSYMT0(1)=C
          NSYMT0(2)=0
          NSYML0=1
          GOTO 10028
10028 RETURN
10107 CONTINUE
10108   IF((AAAAK0.GT.10))GOTO 10109
          AAAAM0=C-176+1
          GOTO 10110
10109     AAAAM0=INDEX(AAAAN0,MAPDN(C))
10110   IF((1.GT.AAAAM0))GOTO 10113
        IF((AAAAM0.GT.AAAAK0))GOTO 10113
        GOTO 10111
10111   NSYMT0(NSYML0+1)=C
        NSYML0=NSYML0+(1)
        IF((INBUF0(IBPAA0).EQ.0))GOTO 10114
          C=INBUF0(IBPAA0)
          IBPAA0=IBPAA0+(1)
          GOTO 10115
10114     CALL REFIL0(C)
10115 CONTINUE
      GOTO 10108
10113 NSYMT0(NSYML0+1)=0
      GOTO 10116
10117 AAAAQ0=1
      VAL=GCTOL(NSYMT0,AAAAQ0,AAAAO0)
      IF((NSYMT0(AAAAQ0).EQ.0))GOTO 10119
        CALL SYNERR('Illegal character in integer constant.',0)
10118 GOTO 10119
10120 IF((C.EQ.236))GOTO 10122
      IF((C.EQ.204))GOTO 10122
      GOTO 10121
10122   NSYMB0=1024
        IF((INBUF0(IBPAA0).EQ.0))GOTO 10123
          C=INBUF0(IBPAA0)
          IBPAA0=IBPAA0+(1)
          GOTO 10125
10123     CALL REFIL0(C)
10124   GOTO 10125
10121   IF((C.EQ.243))GOTO 10127
        IF((C.EQ.204))GOTO 10127
        GOTO 10126
10127     NSYMB0=1025
          IF((INBUF0(IBPAA0).EQ.0))GOTO 10128
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10130
10128       CALL REFIL0(C)
10129     GOTO 10130
10126     IF((AAAAR0.NE.10))GOTO 10131
            IF((VAL.LE.32767))GOTO 10132
              NSYMB0=1024
              GOTO 10134
10132         NSYMB0=1025
10133       GOTO 10134
10131       IF((VAL.LE.65535))GOTO 10135
              NSYMB0=1024
              GOTO 10136
10135         NSYMB0=1025
10136     CONTINUE
10134   CONTINUE
10130 CONTINUE
10125 CALL LTOC(VAL,NSYMT0,200)
      GOTO 10137
10010 AAAAK0=10
      AAAAL0=1
      GOTO 10107
10138 AAAAT0=C
      GOTO 10139
10140   AAAAO0=10
        AAAAP0=1
        GOTO 10117
10141   IF(((VAL.GE.2).AND.(VAL.LE.16)))GOTO 10142
          CALL SYNERR('Radix must be between 2 and 16.',0)
          VAL=16
10142   IF((INBUF0(IBPAA0).EQ.0))GOTO 10143
          C=INBUF0(IBPAA0)
          IBPAA0=IBPAA0+(1)
          GOTO 10144
10143     CALL REFIL0(C)
10144   NSYML0=0
        AAAAK0=VAL
        AAAAL0=2
        GOTO 10107
10145   AAAAO0=VAL
        AAAAP0=2
        GOTO 10117
10146   AAAAR0=16
        AAAAS0=1
        GOTO 10120
10149   IF((NSYMT0(1).NE.176))GOTO 10150
        IF((NSYMT0(2).NE.0))GOTO 10150
          IF((INBUF0(IBPAA0).EQ.0))GOTO 10151
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10152
10151       CALL REFIL0(C)
10152     NSYML0=0
          AAAAK0=16
          AAAAL0=3
          GOTO 10107
10153     AAAAO0=16
          AAAAP0=3
          GOTO 10117
10150     CALL SYNERR('Illegal hexadecimal constant.',0)
          AAAAO0=10
          AAAAP0=4
          GOTO 10117
10156   CONTINUE
10155   AAAAR0=16
        AAAAS0=2
        GOTO 10120
10158   IF((C.NE.174))GOTO 10159
          NSYMT0(NSYML0+1)=174
          NSYML0=NSYML0+(1)
          IF((INBUF0(IBPAA0).EQ.0))GOTO 10160
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10161
10160       CALL REFIL0(C)
10161     AAAAK0=10
          AAAAL0=4
          GOTO 10107
10162   CONTINUE
10159   IF((C.EQ.229))GOTO 10164
        IF((C.EQ.197))GOTO 10164
        GOTO 10163
10164     NSYMT0(NSYML0+1)=229
          NSYML0=NSYML0+(1)
          IF((INBUF0(IBPAA0).EQ.0))GOTO 10165
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10166
10165       CALL REFIL0(C)
10166     IF((C.EQ.173))GOTO 10168
          IF((C.EQ.171))GOTO 10168
          GOTO 10167
10168       NSYMT0(NSYML0+1)=C
            NSYML0=NSYML0+(1)
            IF((INBUF0(IBPAA0).EQ.0))GOTO 10169
              C=INBUF0(IBPAA0)
              IBPAA0=IBPAA0+(1)
              GOTO 10170
10169         CALL REFIL0(C)
10170     CONTINUE
10167     AAAAK0=10
          AAAAL0=5
          GOTO 10107
10171   CONTINUE
10163   NSYMB0=1022
      GOTO 10148
10139 IF(AAAAT0.EQ.174)GOTO 10158
      IF(AAAAT0.EQ.197)GOTO 10158
      AAAAU0=AAAAT0-209
      GOTO(10140,10172,10172,10172,10172,10172,10149),AAAAU0
      IF(AAAAT0.EQ.229)GOTO 10158
      AAAAU0=AAAAT0-241
      GOTO(10140,10172,10172,10172,10172,10172,10149),AAAAU0
10172   IF((NSYMT0(1).NE.176))GOTO 10173
          AAAAO0=8
          AAAAP0=5
          GOTO 10117
10174     AAAAR0=8
          AAAAS0=3
          GOTO 10120
10173     AAAAO0=10
          AAAAP0=6
          GOTO 10117
10177     AAAAR0=10
          AAAAS0=4
          GOTO 10120
10178   CONTINUE
10176 CONTINUE
10148 CALL PUTBA0(C)
      GOTO 10179
10011 IF((INBUF0(IBPAA0).EQ.0))GOTO 10180
        AAAAV0=INBUF0(IBPAA0)
        IBPAA0=IBPAA0+(1)
        GOTO 10181
10180   CALL REFIL0(AAAAV0)
10181 IF((AAAAV0.NE.189))GOTO 10182
        NSYMB0=AAAAC0
        GOTO 10184
10182   CALL PUTBA0(AAAAV0)
        NSYMB0=AAAAB0
10183 GOTO 10184
10012 IF((INBUF0(IBPAA0).EQ.0))GOTO 10185
        AAAAW0=INBUF0(IBPAA0)
        IBPAA0=IBPAA0+(1)
        GOTO 10186
10185   CALL REFIL0(AAAAW0)
10186 IF((AAAAW0.NE.AAAAE0))GOTO 10187
        NSYMB0=AAAAF0
        GOTO 10191
10187   IF((AAAAW0.NE.189))GOTO 10189
          NSYMB0=AAAAG0
          GOTO 10190
10189     NSYMB0=AAAAE0
          CALL PUTBA0(AAAAW0)
10190 CONTINUE
10188 GOTO 10191
10119 GOTO(10141,10146,10155,10156,10174,10177),AAAAP0
      GOTO 10119
10179 GOTO(10028,10028),AAAAA0
      GOTO 10179
10116 GOTO(10138,10145,10153,10162,10171),AAAAL0
      GOTO 10116
10191 GOTO(10092,10028,10028,10028),AAAAH0
      GOTO 10191
10137 GOTO(10148,10148,10176,10178),AAAAS0
      GOTO 10137
10184 GOTO(10028,10028,10028,10028,10028,10028),AAAAD0
      GOTO 10184
      END
      SUBROUTINE REFIL0(C)
      INTEGER C
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER GETLIN
10192   IF((LEVEL0.GE.1))GOTO 10193
          C=-1
          INBUF0(1000)=0
          IBPAA0=1000
          RETURN
10193   IF((GETLIN(INBUF0(1000),INFIL0(LEVEL0)).EQ.-1))GOTO 10194
          LINEN0(LEVEL0)=LINEN0(LEVEL0)+1
          GOTO 10195
10194   CALL CLOSE(INFIL0(LEVEL0))
        LEVEL0=LEVEL0-1
        IF((LEVEL0.LT.1))GOTO 10196
          CALL SCOPY(MEMAA0,FNAME0(LEVEL0),MODUL0,1)
          CALL DSFREE(FNAME0(LEVEL0))
          SYMLI0=LINEN0(LEVEL0)
10196 CONTINUE
      GOTO 10192
10195 C=INBUF0(1000)
      IBPAA0=1000+1
      RETURN
      END
      SUBROUTINE PUTBA0(C)
      INTEGER C
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      IBPAA0=IBPAA0-1
      IF((IBPAA0.LT.1))GOTO 10197
        INBUF0(IBPAA0)=C
        GOTO 10198
10197   CALL FATAL0('too many characters pushed back.')
10198 RETURN
      END
      SUBROUTINE PUTBC0(STR)
      INTEGER STR(1)
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER I
      INTEGER LENGTH
      I=LENGTH(STR)
      GOTO 10201
10199 I=I-1
10201 IF((I.LE.0))GOTO 10200
        CALL PUTBA0(STR(I))
      GOTO 10199
10200 RETURN
      END
      SUBROUTINE PUTBB0(N)
      INTEGER N
      INTEGER LEN
      INTEGER ITOC
      INTEGER CHARS(102)
      LEN=ITOC(N,CHARS,102)
      CHARS(LEN+1)=0
      CALL PUTBC0(CHARS)
      RETURN
      END
      SUBROUTINE COLLF0(QUOTE,TEXT,TL)
      INTEGER QUOTE,TEXT(1)
      INTEGER TL
      INTEGER SYMTE0(200),NSYMT0(200)
      INTEGER SYMLE0,SYMBO0,SYMLI0,NSYML0,NSYMB0,NSYMM0
      INTEGER SYMPT0,NSYMP0
      COMMON /LEXCOM/SYMBO0,NSYMB0,SYMLE0,NSYML0,SYMPT0,NSYMP0,SYMTE0,NS
     *YMT0,SYMLI0,NSYMM0
      INTEGER INBUF0(1105)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER DIRTO0,DFOTO0
      INTEGER PPTBL0
      INTEGER DIRNA0(300),DFONA0(300)
      COMMON /PPCOM/PPTBL0,DIRTO0,DIRNA0,DFOTO0,DFONA0
      INTEGER KEYWD0,IDTBL0(50),SMTBL0(50)
      INTEGER LLAAA0
      COMMON /IDCOM/LLAAA0,KEYWD0,IDTBL0,SMTBL0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SEMSK0(300),CTLSK0(50)
      INTEGER SEMSP0,CTLSP0
      COMMON /PARCOM/SEMSK0,SEMSP0,CTLSK0,CTLSP0
      INTEGER INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LABEL0,PO
     *INT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0(20),MODEU0(20),MODE
     *V0
      COMMON /MODCOM/INTMO0,CHARM0,SHORT0,LONGM0,UNSIG0,FLOAT0,DOUBL0,LA
     *BEL0,POINT0,SHORU0,LONGU0,CHARU0,MODET0,MODEL0,MODES0,MODEU0,MODEV
     *0
      INTEGER EXPSK0(100),PROCM0,PROCR0
      INTEGER EXPSP0,OBJNO0
      INTEGER * 4 ZINIT0
      COMMON /EXPCOM/EXPSK0,EXPSP0,OBJNO0,PROCM0,PROCR0,ZINIT0
      INTEGER OUTFP0,NERRS0
      INTEGER MODUL0(200),ERROR0(200)
      INTEGER A$BUF(200)
      INTEGER OUTFI0(3),CKFIL0
      INTEGER FNAME0(5)
      COMMON /MISCOM/MODUL0,ERROR0,A$BUF,OUTFI0,OUTFP0,CKFIL0,NERRS0,FNA
     *ME0
      INTEGER GCTOI
      INTEGER C
      INTEGER AAAAX0
      INTEGER AAAAY0
      INTEGER AAAAZ0(5)
      INTEGER AAABA0
      INTEGER AAABB0
      IF((INBUF0(IBPAA0).EQ.0))GOTO 10203
        C=INBUF0(IBPAA0)
        IBPAA0=IBPAA0+(1)
        GOTO 10204
10203   CALL REFIL0(C)
10204 CONTINUE
10205 IF((TL.GE.200))GOTO 10206
      IF((C.EQ.138))GOTO 10206
      IF((C.EQ.QUOTE))GOTO 10206
        IF((C.NE.220))GOTO 10207
          AAAAX0=1
          GOTO 10202
10207     TEXT(TL+1)=C
          TL=TL+(1)
10209   IF((INBUF0(IBPAA0).EQ.0))GOTO 10210
          C=INBUF0(IBPAA0)
          IBPAA0=IBPAA0+(1)
          GOTO 10205
10210     CALL REFIL0(C)
10211 GOTO 10205
10206 IF((C.NE.138))GOTO 10212
        CALL SYNERR('Missing closing quote.',0)
        GOTO 10213
10212   IF((TL.LT.200))GOTO 10214
          CALL SYNERR('Quoted literal too long.',0)
10214 CONTINUE
10213 TEXT(TL+1)=0
      RETURN
10202 IF((INBUF0(IBPAA0).EQ.0))GOTO 10215
        C=INBUF0(IBPAA0)
        IBPAA0=IBPAA0+(1)
        GOTO 10216
10215   CALL REFIL0(C)
10216 AAABA0=C
      GOTO 10217
10218   C=-1
      GOTO 10219
10220   C=138
      GOTO 10219
10221   C=137
      GOTO 10219
10222   C=136
      GOTO 10219
10223   C=141
      GOTO 10219
10224   C=140
      GOTO 10219
10225   AAAAY0=1
        GOTO 10228
10226   AAAAY0=AAAAY0+(1)
10228   IF((AAAAY0.GT.3))GOTO 10227
        IF((176.GT.C))GOTO 10227
        IF((C.GT.183))GOTO 10227
          AAAAZ0(AAAAY0)=C
          IF((INBUF0(IBPAA0).EQ.0))GOTO 10229
            C=INBUF0(IBPAA0)
            IBPAA0=IBPAA0+(1)
            GOTO 10226
10229       CALL REFIL0(C)
10230   GOTO 10226
10227   AAAAZ0(AAAAY0)=0
        CALL PUTBA0(C)
        AAAAY0=1
        C=GCTOI(AAAAZ0,AAAAY0,8)
      GOTO 10219
10217 IF(AAABA0.EQ.138)GOTO 10218
      AAABB0=AAABA0-175
      GOTO(10225,10225,10225,10225,10225,10225,10225,10225,10231,10231, 
     *    10231,10231,10231,10231,10231,10231,10231,10231,10231,10231,  
     *   10231,10231,10231,10231,10231,10231,10231,10231,10231,10231,   
     *  10231,10231,10231,10231,10231,10231,10231,10231,10231,10231,    
     * 10231,10231,10231,10231,10231,10231,10231,10231,10231,10231,10222
     *,10231,10231,10231,10224,10231,10231,10231,10231,10231,10231,10231
     *,10220,10231,10231,10231,10223,10231,10221),AAABB0
10231 CONTINUE
10219 IF((C.EQ.-1))GOTO 10209
        TEXT(TL+1)=C
        TL=TL+(1)
10232 GOTO 10209
      END
C ---- Long Name Map ----
C dumpsymentry                   dumpt0
C Procmode                       procm0
C convertinteger                 conve0
C declspecifiers                 decls0
C enterdefinition                entes0
C islvalue                       islva0
C outoper                        outop0
C installdefinition              insta0
C Nerrs                          nerrs0
C dumpsym                        dumps0
C entersmdecl                    entex0
C enumspecifier                  enums0
C openinclude                    openi0
C Nsymbol                        nsymb0
C Expsk                          expsk0
C enterchildmode                 enter0
C gencast                        genca0
C Dfoname                        dfona0
C checkarith                     check0
C droplitval                     dropl0
C outgoto                        outgo0
C returnstatement                retur0
C Nsymlen                        nsyml0
C Symptr                         sympt0
C ckfncall                       ckfnc0
C cleanupll                      clean0
C genmakearith                   genma0
C Outfp                          outfp0
C alloctemp                      alloe0
C forstatement                   forst0
C outinitend                     outio0
C outsize                        outsi0
C putbackstr                     putbc0
C Floatmodeptr                   float0
C createmode                     creat0
C displaymode                    displ0
C Expsp                          expsp0
C convoper                       convo0
C outexprtree                    outey0
C putback                        putba0
C structdeclaratorlist           strue0
C Nsymtext                       nsymt0
C Modelist                       model0
C Fnametable                     fname0
C genopnd                        genoq0
C isconstant                     iscon0
C isstored                       issto0
C Dirname                        dirna0
C invokemacro                    invok0
C makemode                       makem0
C notstatementstart              notsu0
C outexpr                        outex0
C structdecllist                 struf0
C Ll                             llaaa0
C Modesavelen                    modeu0
C functionheader                 funct0
C outdeclarations                outde0
C Charunsmodeptr                 charu0
C Modesavetype                   modes0
C structdeclaration              struc0
C Dfotop                         dfoto0
C ckputname                      ckpuu0
C findmode                       findm0
C refillbuffer                   refil0
C Keywdtbl                       keywd0
C declarations                   decla0
C entersiblingmode               entew0
C genoper                        genop0
C getlong                        getlo0
C typeorscspec                   typeo0
C declarator                     declb0
C ssalloc                        ssall0
C accesssym                      acces0
C declarelabel                   declc0
C ifstatement                    ifsta0
C initializer                    initj0
C isnullconv                     isnul0
C resetline                      reset0
C Charmodeptr                    charm0
C analyzenumber                  analy0
C collectinteger                 collg0
C ckputmode                      ckput0
C createsavedmode                creau0
C displaysc                      dispo0
C dumpexpr                       dumpe0
C foldconst                      foldc0
C getlitval                      getli0
C initdeclarator                 initd0
C statementlabel                 statf0
C Idtbl                          idtbl0
C checkdeclaration               checl0
C enumdeclarator                 enumd0
C gentoboolean                   gento0
C isarith                        isari0
C processifdef                   procg0
C Dirtop                         dirto0
C constantexpr                   const0
C expression                     expre0
C outstmt                        outst0
C checkfunctiondeclaration       checm0
C convtype                       convt0
C dostatement                    dosta0
C enterll                        entev0
C Intmodeptr                     intmo0
C Doublemodeptr                  doubl0
C Zinitlen                       zinit0
C makesym                        makes0
C breakstatement                 break0
C expr10                         expr10
C externaldefinition             exter0
C structorunionspecifier         struh0
C Symbol                         symbo0
C Nsymline                       nsymm0
C Inbuf                          inbuf0
C Ibp                            ibpaa0
C checkdoubleop                  checo0
C collectquotedstring            collf0
C notstatementend                notst0
C outname                        outna0
C arrayinit                      array0
C displayoper                    dispn0
C fatalerr                       fatal0
C findsym                        finds0
C scalarinit                     scala0
C Symlen                         symle0
C Pointermodeptr                 point0
C genindex                       genin0
C Ckfile                         ckfil0
C ckfndef                        ckfnd0
C displayop                      dispm0
C enteriddecl                    entet0
C isaggregate                    isagg0
C removedefinition               remov0
C statement                      state0
C Level                          level0
C Mem                            memaa0
C Objno                          objno0
C arithexcep                     arith0
C compoundstatement              compo0
C continuestatement              conti0
C dgetsym                        dgets0
C initdeclaratorlist             inite0
C outmode                        outmo0
C processdebug                   procf0
C savemode                       savem0
C Nsymptr                        nsymp0
C Labelmodeptr                   label0
C Shortunsmodeptr                shoru0
C allocstruct                    allod0
C structinit                     strug0
C Symtext                        symte0
C cpreprocessor                  cprep0
C process                        proce0
C recordsym                      recor0
C Unsignedmodeptr                unsig0
C Longunsmodeptr                 longu0
C enterkw                        enteu0
C outproccallarg                 outps0
C allocatestorage                alloc0
C displaysymbol                  dispp0
C alignmode                      align0
C initialize                     initi0
C nextistype                     nexti0
C skipwhitespace                 skipw0
C Shortmodeptr                   short0
C Modulename                     modul0
C getactualparameters            getac0
C gotostatement                  gotos0
C switchstatement                switc0
C Outfile                        outfi0
C returninteger                  retus0
C ckfnend                        ckfne0
C convconst                      convc0
C dumpmode                       dumpm0
C ispointer                      ispoi0
C primary                        prima0
C Infile                         infil0
C Longmodeptr                    longm0
C checkbecomesop                 checn0
C comparemode                    compa0
C modifyparammode                modif0
C sizeofmode                     sizeo0
C Ctlsk                          ctlsk0
C analyzeescape                  analz0
C collectactualparameter         colle0
C outinitstart                   outip0
C Pptbl                          pptbl0
C Smtbl                          smtbl0
C Modesavect                     modev0
C ckfnarg                        ckfna0
C Semsk                          semsk0
C Procrtnv                       procr0
C getdefinition                  getde0
C putlong                        putlo0
C getformalparameters            getfo0
C putbacknum                     putbb0
C Ctlsp                          ctlsp0
C Modetable                      modet0
C genconvert                     genco0
C processifndef                  proch0
C structdeclarator               strud0
C abstractdeclarator             abstr0
C deallocexpr                    deall0
C gobbleuntilelseorendif         gobbl0
C outinit                        outin0
C outproc                        outpr0
C putlitval                      putli0
C ssdealloc                      ssdea0
C typename                       typen0
C whilestatement                 while0
C Symline                        symli0
C Linenumber                     linen0
C Semsp                          semsp0
C Errorsym                       error0
