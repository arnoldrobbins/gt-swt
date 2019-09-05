      SUBROUTINE OPTIM0(CODE)
      INTEGER CODE
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I,NEWI
      INTEGER GENGE0
      INTEGER ASTATE,LSTATE,FSTATE,LFSTA0,XSTATE,XBSTA0
      INTEGER AAD(5),LAD(5),FAD(5),LFAD(5),XAD(5),XBAD(5),FRAMF0
      LOGICAL ADEQU0,OVERL0,LINKI0,PROCI0
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAE0
      INTEGER AAAAF0
      INTEGER AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0
      INTEGER AAAAK0
      INTEGER AAAAL0
      INTEGER AAAAM0
      INTEGER AAAAN0
      INTEGER AAAAO0
      INTEGER AAAAP0
      INTEGER AAAAQ0
      INTEGER AAAAR0
      INTEGER AAAAS0
      INTEGER AAAAT0
      INTEGER AAAAD0
      INTEGER AAAAU0,AAAAV0,AAAAW0
      FRAMF0=69
      LINKI0=.FALSE.
      PROCI0=.FALSE.
      AAAAA0=1
      GOTO 10000
10005 I=IMEMA0(CODE+1)
      GOTO 10008
10006 I=IMEMA0(I+1)
10008 IF((I.EQ.CODE))GOTO 10007
        CALL SIMPL0(I)
        IF((IMEMA0(I).NE.4))GOTO 10009
          IF((IMEMA0(I+3).NE.53))GOTO 10010
            IF((FRAMF0.NE.53))GOTO 10011
              AAAAF0=1
              GOTO 10004
10011         IF(PROCI0)GOTO 10014
                IF((IMEMA0(IMEMA0(I+2)).NE.4))GOTO 10015
                IF((IMEMA0(IMEMA0(I+2)+3).NE.69))GOTO 10015
                  IMEMA0(IMEMA0(IMEMA0(I+2)+2)+1)=IMEMA0(IMEMA0(I+2)+1)
                  IMEMA0(I+2)=IMEMA0(IMEMA0(I+2)+2)
                  AAAAF0=2
                  GOTO 10004
10015             LINKI0=.FALSE.
10017           FRAMF0=53
                GOTO 10018
10014           FRAMF0=53
                LINKI0=.FALSE.
10018       CONTINUE
10013       GOTO 10032
10010       IF((IMEMA0(I+3).NE.69))GOTO 10020
              IF((FRAMF0.NE.69))GOTO 10021
                AAAAF0=3
                GOTO 10004
10021           IF(LINKI0)GOTO 10024
                  IF((IMEMA0(IMEMA0(I+2)).NE.4))GOTO 10025
                  IF((IMEMA0(IMEMA0(I+2)+3).NE.53))GOTO 10025
                    IMEMA0(IMEMA0(IMEMA0(I+2)+2)+1)=IMEMA0(IMEMA0(I+2)+1
     *)
                    IMEMA0(I+2)=IMEMA0(IMEMA0(I+2)+2)
                    AAAAF0=4
                    GOTO 10004
10025               PROCI0=.FALSE.
10027             FRAMF0=69
                  GOTO 10028
10024             FRAMF0=69
                  PROCI0=.FALSE.
10028         CONTINUE
10023         GOTO 10029
10020         IF((FRAMF0.NE.69))GOTO 10030
                PROCI0=.TRUE.
                GOTO 10031
10030           LINKI0=.TRUE.
10031       CONTINUE
10029     CONTINUE
10019     GOTO 10032
10009     IF((FRAMF0.NE.69))GOTO 10033
            PROCI0=.TRUE.
            GOTO 10034
10033       LINKI0=.TRUE.
10034   CONTINUE
10032   AAAAG0=IMEMA0(I)
        GOTO 10035
10038     AAAAA0=2
          GOTO 10000
10040     AAAAH0=IMEMA0(I+3)
          GOTO 10041
10042       ASTATE=1
            LSTATE=1
          GOTO 10006
10044       IF((ASTATE.NE.0))GOTO 10045
            IF((AAD(1).NE.6))GOTO 10045
            IF((AAD(2).NE.0))GOTO 10045
              AAAAF0=5
              GOTO 10004
10045         ASTATE=0
              AAD(1)=6
              AAD(2)=0
              IF((LSTATE.NE.0))GOTO 10048
              IF((LAD(1).NE.7))GOTO 10048
                LAD(2)=0
                GOTO 10049
10048           LSTATE=1
10049       CONTINUE
10047     GOTO 10006
10050       IF((ASTATE.NE.0))GOTO 10051
            IF((AAD(1).NE.6))GOTO 10051
            IF((AAD(2).NE.1))GOTO 10051
              AAAAF0=6
              GOTO 10004
10051         ASTATE=0
              AAD(1)=6
              AAD(2)=1
              IF((LSTATE.NE.0))GOTO 10054
              IF((LAD(1).NE.7))GOTO 10054
                LAD(2)=1
                GOTO 10055
10054           LSTATE=1
10055       CONTINUE
10053     GOTO 10006
10056       IF((LSTATE.NE.0))GOTO 10057
            IF((LAD(1).NE.7))GOTO 10057
              LAD(3)=0
              GOTO 10006
10057         LSTATE=1
10058     GOTO 10006
10059       IF((LSTATE.NE.0))GOTO 10060
            IF((LAD(1).NE.7))GOTO 10060
            IF((LAD(2).NE.0))GOTO 10060
            IF((LAD(3).NE.0))GOTO 10060
              AAAAF0=7
              GOTO 10004
10060         LSTATE=0
              LAD(1)=7
              LAD(2)=0
              LAD(3)=0
              ASTATE=0
              AAD(1)=6
              AAD(2)=0
10062     GOTO 10006
10063       IF((LSTATE.NE.0))GOTO 10064
            IF((LAD(1).NE.7))GOTO 10064
              LAD(3)=LAD(2)
              GOTO 10006
10064         LSTATE=1
10065     GOTO 10006
10066       XSTATE=ASTATE
            CALL ADCOPY(AAD,XAD)
            AAAAB0=1
            GOTO 10001
10068       ASTATE=XSTATE
            CALL ADCOPY(XAD,AAD)
            LSTATE=1
          GOTO 10006
10069       IF((LSTATE.NE.0))GOTO 10070
            IF((LAD(1).NE.7))GOTO 10070
              LAD(3)=LAD(2)
              LAD(2)=0
              GOTO 10071
10070         LSTATE=1
10071       ASTATE=0
            AAD(1)=6
            AAD(2)=0
          GOTO 10006
10072       AAAAA0=3
            GOTO 10000
10075       IF((IMEMA0(IMEMA0(I+2)).NE.4))GOTO 10006
            IF((IMEMA0(IMEMA0(I+2)+3).NE.70))GOTO 10006
              AAAAF0=8
              GOTO 10004
10077       CONTINUE
10076     GOTO 10006
10078       FSTATE=1
            LFSTA0=1
          GOTO 10006
10079       XSTATE=1
            AAAAB0=2
            GOTO 10001
10041     GOTO(10042,10042,10072,10042,10042,10042,10072,10042,10044,   
     *  10056,10006,10059,10059,10042,10078,10079,10078,10078,10006,    
     * 10078,10078,10078,10072,10072,10072,10072,10072,10072,10042,10042
     *,10042,10042,10042,10042,10042,10079,10042,10042,10042,10042,10042
     *,10042,10042,10044,10042,10042,10042,10042,10042,10042,10042,10042
     *,10006,10042,10042,10042,10042,10042,10042,10042,10042,10042,10050
     *,10006,10042,10042,10042,10042,10006,10075,10006,10042,10042,10072
     *,10072,10006,10072,10072,10072,10072,10072,10072,10072,10072,10072
     *,10072,10042,10042,10042,10006,10072,10072,10063,10006,10066,10006
     *,10042,10042,10042,10042,10042,10081,10068,10042,10069,10042),AAAA
     *H0
10081     CONTINUE
10043   GOTO 10006
10082     AAAAI0=IMEMA0(I+3)
          GOTO 10083
10086       ASTATE=1
            LSTATE=1
          GOTO 10006
10087       AAAAA0=4
            GOTO 10000
10089       AAAAA0=5
            GOTO 10000
10083     GOTO(10006,10006,10086,10006,10006,10006,10006,10086,10086,   
     *  10086,10006,10087,10087,10006,10086,10086,10089),AAAAI0
10085   GOTO 10006
10091     AAAAJ0=IMEMA0(I+3)
          GOTO 10092
10093       ASTATE=1
            LSTATE=1
          GOTO 10006
10095       AAAAA0=6
            GOTO 10000
10097       FSTATE=1
            LFSTA0=1
          GOTO 10006
10099       XSTATE=1
            AAAAB0=3
            GOTO 10001
10101       IF((ASTATE.NE.0))GOTO 10102
            IF((.NOT.ADEQU0(IMEMA0(I+4),AAD)))GOTO 10102
              AAAAF0=9
              GOTO 10004
10102         IF((IMEMA0(IMEMA0(I+2)).NE.2))GOTO 10105
              IF((IMEMA0(IMEMA0(I+2)+3).NE.47))GOTO 10105
              IF((.NOT.ADEQU0(IMEMA0(I+4),IMEMA0(IMEMA0(I+2)+4))))GOTO  
     *    10105
                AAAAF0=10
                GOTO 10004
10105           IF((XSTATE.NE.0))GOTO 10108
                IF((.NOT.ADEQU0(IMEMA0(I+4),XAD)))GOTO 10108
                  CALL ADCOPY(XAD,AAD)
                  ASTATE=0
                  LSTATE=1
                  NEWI=GENGE0(103)
                  IMEMA0(NEWI+1)=IMEMA0(I+1)
                  IMEMA0(NEWI+2)=IMEMA0(I+2)
                  IMEMA0(IMEMA0(I+2)+1)=NEWI
                  IMEMA0(IMEMA0(I+1)+2)=NEWI
                  I=NEWI
                  ASTATE=0
                  CALL ADCOPY(XAD,AAD)
                  GOTO 10109
10108             ASTATE=0
                  LSTATE=1
                  CALL ADCOPY(IMEMA0(I+4),AAD)
10109         CONTINUE
10107       CONTINUE
10104     GOTO 10006
10110       IF((LSTATE.NE.0))GOTO 10111
            IF((.NOT.ADEQU0(IMEMA0(I+4),LAD)))GOTO 10111
              AAAAF0=11
              GOTO 10004
10111         IF((IMEMA0(IMEMA0(I+2)).NE.2))GOTO 10114
              IF((IMEMA0(IMEMA0(I+2)+3).NE.48))GOTO 10114
              IF((.NOT.ADEQU0(IMEMA0(I+4),IMEMA0(IMEMA0(I+2)+4))))GOTO  
     *    10114
                AAAAF0=12
                GOTO 10004
10114           LSTATE=0
                CALL ADCOPY(IMEMA0(I+4),LAD)
                CALL ADCOPY(LAD,AAD)
                IF((LAD(1).NE.7))GOTO 10117
                  AAD(1)=6
10117           ASTATE=0
10116       CONTINUE
10113     GOTO 10006
10118       IF((FSTATE.NE.0))GOTO 10119
            IF((.NOT.ADEQU0(IMEMA0(I+4),FAD)))GOTO 10119
              AAAAF0=13
              GOTO 10004
10119         IF((IMEMA0(IMEMA0(I+2)).NE.2))GOTO 10122
              IF((IMEMA0(IMEMA0(I+2)+3).NE.29))GOTO 10122
              IF((.NOT.ADEQU0(IMEMA0(I+4),IMEMA0(IMEMA0(I+2)+4))))GOTO  
     *    10122
                AAAAF0=14
                GOTO 10004
10122           FSTATE=0
                CALL ADCOPY(IMEMA0(I+4),FAD)
10124       CONTINUE
10121       LFSTA0=1
          GOTO 10006
10125       IF((LFSTA0.NE.0))GOTO 10126
            IF((.NOT.ADEQU0(IMEMA0(I+4),LFAD)))GOTO 10126
              AAAAF0=15
              GOTO 10004
10126         IF((IMEMA0(IMEMA0(I+2)).NE.2))GOTO 10129
              IF((IMEMA0(IMEMA0(I+2)+3).NE.14))GOTO 10129
              IF((.NOT.ADEQU0(IMEMA0(I+4),IMEMA0(IMEMA0(I+2)+4))))GOTO  
     *    10129
                AAAAF0=16
                GOTO 10004
10129           LFSTA0=0
                CALL ADCOPY(IMEMA0(I+4),LFAD)
10131       CONTINUE
10128       FSTATE=1
          GOTO 10006
10132       IF((XSTATE.NE.0))GOTO 10133
            IF((.NOT.ADEQU0(IMEMA0(I+4),XAD)))GOTO 10133
              AAAAF0=17
              GOTO 10004
10133         IF((IMEMA0(IMEMA0(I+2)).NE.2))GOTO 10136
              IF((IMEMA0(IMEMA0(I+2)+3).NE.50))GOTO 10136
              IF((.NOT.ADEQU0(IMEMA0(I+4),IMEMA0(IMEMA0(I+2)+4))))GOTO  
     *    10136
                AAAAF0=18
                GOTO 10004
10136           IF((ASTATE.NE.0))GOTO 10139
                IF((.NOT.ADEQU0(IMEMA0(I+4),AAD)))GOTO 10139
                  NEWI=GENGE0(95)
                  IMEMA0(NEWI+1)=IMEMA0(I+1)
                  IMEMA0(NEWI+2)=IMEMA0(I+2)
                  IMEMA0(IMEMA0(I+2)+1)=NEWI
                  IMEMA0(IMEMA0(I+1)+2)=NEWI
                  I=NEWI
                  XSTATE=0
                  CALL ADCOPY(AAD,XAD)
                  AAAAB0=4
                  GOTO 10001
10139             XSTATE=0
                  CALL ADCOPY(IMEMA0(I+4),XAD)
                  AAAAB0=5
                  GOTO 10001
10142           CONTINUE
10141         CONTINUE
10138       CONTINUE
10135     GOTO 10006
10143       XBSTA0=LSTATE
            CALL ADCOPY(LAD,XBAD)
            AAAAC0=1
            GOTO 10002
10145       ASTATE=1
            LSTATE=1
          GOTO 10006
10146       XBSTA0=1
            AAAAC0=2
            GOTO 10002
10148       AAAAD0=1
            AAAAE0=1
            GOTO 10003
10150       AAAAD0=1
            AAAAE0=2
            GOTO 10003
10151       IF((ASTATE.NE.1))GOTO 10006
              ASTATE=0
              CALL ADCOPY(IMEMA0(I+4),AAD)
10152     GOTO 10006
10153       AAAAD0=1
            AAAAE0=3
            GOTO 10003
10154       IF((XSTATE.NE.1))GOTO 10006
              XSTATE=0
              CALL ADCOPY(IMEMA0(I+4),XAD)
10155     GOTO 10006
10156       AAAAD0=2
            AAAAE0=4
            GOTO 10003
10157       IF((LSTATE.NE.1))GOTO 10006
              LSTATE=0
              CALL ADCOPY(IMEMA0(I+4),LAD)
10158     GOTO 10006
10159       AAAAD0=2
            AAAAE0=5
            GOTO 10003
10160       IF((FSTATE.NE.1))GOTO 10006
              FSTATE=0
              CALL ADCOPY(IMEMA0(I+4),FAD)
10161     GOTO 10006
10162       AAAAD0=4
            AAAAE0=6
            GOTO 10003
10163       IF((LFSTA0.NE.1))GOTO 10006
              LFSTA0=0
              CALL ADCOPY(IMEMA0(I+4),LFAD)
10164     GOTO 10006
10092     GOTO(10093,10093,10093,10093,10095,10095,10097,10095,10097,   
     *  10125,10099,10097,10097,10162,10093,10093,10145,10006,10146,    
     * 10093,10093,10097,10095,10097,10118,10099,10097,10097,10159,10093
     *,10148,10095,10095,10095,10095,10095,10101,10110,10093,10132,10006
     *,10093,10093,10093,10095,10093,10150,10156,10143,10153,10006,10093
     *,10095),AAAAJ0
10094   GOTO 10006
10035   GOTO(10006,10091,10038,10040,10082),AAAAG0
10037 GOTO 10006
10007 RETURN
10000 ASTATE=1
      LSTATE=1
      FSTATE=1
      LFSTA0=1
      XSTATE=1
      XBSTA0=1
      GOTO 10165
10001 IF((ASTATE.NE.0))GOTO 10166
      IF((AAD(1).EQ.2))GOTO 10167
      IF((AAD(1).EQ.4))GOTO 10167
      IF((AAD(1).EQ.5))GOTO 10167
      GOTO 10166
10167   ASTATE=1
        LSTATE=1
10166 IF((LSTATE.NE.0))GOTO 10168
      IF((LAD(1).EQ.2))GOTO 10169
      IF((LAD(1).EQ.4))GOTO 10169
      IF((LAD(1).EQ.5))GOTO 10169
      GOTO 10168
10169   ASTATE=1
        LSTATE=1
10168 IF((FSTATE.NE.0))GOTO 10170
      IF((FAD(1).EQ.2))GOTO 10171
      IF((FAD(1).EQ.4))GOTO 10171
      IF((FAD(1).EQ.5))GOTO 10171
      GOTO 10170
10171   FSTATE=1
        LFSTA0=1
10170 IF((LFSTA0.NE.0))GOTO 10172
      IF((LFAD(1).EQ.2))GOTO 10173
      IF((LFAD(1).EQ.4))GOTO 10173
      IF((LFAD(1).EQ.5))GOTO 10173
      GOTO 10172
10173   FSTATE=1
        LFSTA0=1
10172 IF((XBSTA0.NE.0))GOTO 10176
      IF((XBAD(1).EQ.2))GOTO 10175
      IF((XBAD(1).EQ.4))GOTO 10175
      IF((XBAD(1).EQ.5))GOTO 10175
      GOTO 10176
10175   XBSTA0=1
10174 GOTO 10176
10002 IF((ASTATE.NE.0))GOTO 10177
        AAAAK0=AAD(1)
        GOTO 10178
10178   AAAAL0=AAAAK0-5
        GOTO(10180,10180,10180,10180,10180),AAAAL0
          IF((AAD(2).NE.:000003))GOTO 10181
            ASTATE=1
            LSTATE=1
10181   CONTINUE
10180 CONTINUE
10177 IF((LSTATE.NE.0))GOTO 10182
        AAAAM0=LAD(1)
        GOTO 10183
10183   AAAAN0=AAAAM0-5
        GOTO(10185,10185,10185,10185,10185),AAAAN0
          IF((LAD(2).NE.:000003))GOTO 10186
            ASTATE=1
            LSTATE=1
10186   CONTINUE
10185 CONTINUE
10182 IF((FSTATE.NE.0))GOTO 10187
        AAAAO0=FAD(1)
        GOTO 10188
10188   AAAAP0=AAAAO0-5
        GOTO(10190,10190,10190,10190,10190),AAAAP0
          IF((FAD(2).NE.:000003))GOTO 10191
            FSTATE=1
            LFSTA0=1
10191   CONTINUE
10190 CONTINUE
10187 IF((LFSTA0.NE.0))GOTO 10192
        AAAAQ0=LFAD(1)
        GOTO 10193
10193   AAAAR0=AAAAQ0-5
        GOTO(10195,10195,10195,10195,10195),AAAAR0
          IF((LFAD(2).NE.:000003))GOTO 10196
            FSTATE=1
            LFSTA0=1
10196   CONTINUE
10195 CONTINUE
10192 IF((XSTATE.NE.0))GOTO 10202
        AAAAS0=XAD(1)
        GOTO 10198
10198   AAAAT0=AAAAS0-5
        GOTO(10200,10200,10200,10200,10200),AAAAT0
          IF((XAD(2).NE.:000003))GOTO 10201
            XSTATE=1
10201   CONTINUE
10200 CONTINUE
10197 GOTO 10202
10003 AAAAU0=IMEMA0(I+4)
      AAAAV0=IMEMA0(I+5)
      AAAAW0=IMEMA0(I+6)
      IF((AAAAU0.EQ.10))GOTO 10204
      IF((AAAAV0.EQ.:000003))GOTO 10204
      GOTO 10203
10204   AAAAA0=7
        GOTO 10000
10203   IF((AAAAU0.EQ.2))GOTO 10208
        IF((AAAAU0.EQ.3))GOTO 10208
        IF((AAAAU0.EQ.4))GOTO 10208
        IF((AAAAU0.EQ.5))GOTO 10208
        GOTO 10207
10208     IF((ASTATE.NE.0))GOTO 10209
          IF((AAD(1).EQ.6))GOTO 10209
            ASTATE=1
            LSTATE=1
10209     IF((LSTATE.NE.0))GOTO 10210
          IF((LAD(1).EQ.7))GOTO 10210
            ASTATE=1
            LSTATE=1
10210     IF((FSTATE.NE.0))GOTO 10211
          IF((FAD(1).EQ.8))GOTO 10211
            FSTATE=1
            LFSTA0=1
10211     IF((LFSTA0.NE.0))GOTO 10212
          IF((LFAD(1).EQ.9))GOTO 10212
            FSTATE=1
            LFSTA0=1
10212     IF((XSTATE.NE.0))GOTO 10213
          IF((XAD(1).EQ.6))GOTO 10213
            XSTATE=1
10213     IF((XBSTA0.NE.0))GOTO 10215
          IF((XBAD(1).EQ.7))GOTO 10215
            XBSTA0=1
10214     GOTO 10215
10207     IF((ASTATE.NE.0))GOTO 10216
          IF((AAD(1).NE.1))GOTO 10216
          IF((AAD(2).NE.AAAAV0))GOTO 10216
          IF((.NOT.OVERL0(AAD(3),1,AAAAW0,AAAAD0)))GOTO 10216
            ASTATE=1
            LSTATE=1
10216     IF((LSTATE.NE.0))GOTO 10217
          IF((LAD(1).NE.1))GOTO 10217
          IF((LAD(2).NE.AAAAV0))GOTO 10217
          IF((.NOT.OVERL0(LAD(3),2,AAAAW0,AAAAD0)))GOTO 10217
            ASTATE=1
            LSTATE=1
10217     IF((FSTATE.NE.0))GOTO 10218
          IF((FAD(1).NE.1))GOTO 10218
          IF((FAD(2).NE.AAAAV0))GOTO 10218
          IF((.NOT.OVERL0(FAD(3),2,AAAAW0,AAAAD0)))GOTO 10218
            FSTATE=1
            LFSTA0=1
10218     IF((LFSTA0.NE.0))GOTO 10219
          IF((LFAD(1).NE.1))GOTO 10219
          IF((LFAD(2).NE.AAAAV0))GOTO 10219
          IF((.NOT.OVERL0(LFAD(3),4,AAAAW0,AAAAD0)))GOTO 10219
            FSTATE=1
            LFSTA0=1
10219     IF((XSTATE.NE.0))GOTO 10220
          IF((XAD(1).NE.1))GOTO 10220
          IF((XAD(2).NE.AAAAV0))GOTO 10220
          IF((.NOT.OVERL0(XAD(3),1,AAAAW0,AAAAD0)))GOTO 10220
            XSTATE=1
10220     IF((XBSTA0.NE.0))GOTO 10221
          IF((XBAD(1).NE.1))GOTO 10221
          IF((XBAD(2).NE.AAAAV0))GOTO 10221
          IF((.NOT.OVERL0(XBAD(3),2,AAAAW0,AAAAD0)))GOTO 10221
            XBSTA0=1
10221   CONTINUE
10215 CONTINUE
10206 GOTO 10222
10004 IMEMA0(IMEMA0(I+2)+1)=IMEMA0(I+1)
      IMEMA0(IMEMA0(I+1)+2)=IMEMA0(I+2)
      I=IMEMA0(I+2)
      GOTO 10223
10223 GOTO(10032,10017,10029,10027,10006,10006,10006,10077,10006,10107, 
     *    10006,10116,10121,10124,10128,10131,10006,10138),AAAAF0
      GOTO 10223
10202 GOTO(10006,10006),AAAAC0
      GOTO 10202
10165 GOTO(10005,10006,10006,10006,10006,10006,10222),AAAAA0
      GOTO 10165
10176 GOTO(10006,10006,10006,10141,10142),AAAAB0
      GOTO 10176
10222 GOTO(10006,10151,10154,10157,10160,10163),AAAAE0
      GOTO 10222
      END
      SUBROUTINE SIMPL0(INSTR)
      INTEGER INSTR
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER NEWIN0,I
      INTEGER GENGE0,GENMR
      INTEGER AD(5)
      INTEGER AAAAX0
      INTEGER AAAAY0
      INTEGER AAAAZ0
      INTEGER AAABA0
      INTEGER AAABB0
      INTEGER AAABC0
      INTEGER AAABD0
      INTEGER AAABE0
      I=INSTR
      AAAAY0=IMEMA0(I)
      GOTO 10225
10226   AAAAZ0=IMEMA0(I+3)
        GOTO 10227
10228     CALL ADCOPY(IMEMA0(I+4),AD)
          IF((AD(1).NE.6))GOTO 10229
          IF((AD(2).NE.0))GOTO 10229
            NEWIN0=GENGE0(9)
            AAAAX0=1
            GOTO 10224
10229       IF((AD(1).NE.6))GOTO 10232
            IF((AD(2).NE.1))GOTO 10232
              NEWIN0=GENGE0(63)
              AAAAX0=2
              GOTO 10224
10233       CONTINUE
10232     CONTINUE
10231   GOTO 10263
10235     CALL ADCOPY(IMEMA0(I+4),AD)
          IF((AD(1).NE.7))GOTO 10263
          IF((AD(2).NE.0))GOTO 10263
          IF((AD(3).NE.0))GOTO 10263
            NEWIN0=GENGE0(12)
            AAAAX0=3
            GOTO 10224
10237     CONTINUE
10236   GOTO 10263
10238     CALL ADCOPY(IMEMA0(I+4),AD)
          IF((AD(1).NE.3))GOTO 10263
            AD(1)=1
            NEWIN0=GENMR(38,AD)
            AAAAX0=4
            GOTO 10224
10240     CONTINUE
10239   GOTO 10263
10241     CALL ADCOPY(IMEMA0(I+4),AD)
          IF((AD(1).NE.6))GOTO 10263
            AAABA0=AD(2)
            GOTO 10243
10244         NEWIN0=GENGE0(1)
            GOTO 10245
10246         NEWIN0=GENGE0(2)
            GOTO 10245
10247         NEWIN0=GENGE0(72)
            GOTO 10245
10248         NEWIN0=GENGE0(73)
            GOTO 10245
10245         AAAAX0=5
              GOTO 10224
10243       AAABB0=AAABA0+3
            GOTO(10248,10247,10251,10244,10246),AAABB0
10251       CONTINUE
10250     CONTINUE
10242   GOTO 10263
10252     CALL ADCOPY(IMEMA0(I+4),AD)
          IF((AD(1).NE.6))GOTO 10263
            AAABC0=AD(2)
            GOTO 10254
10255         NEWIN0=GENGE0(72)
            GOTO 10256
10257         NEWIN0=GENGE0(73)
            GOTO 10256
10258         NEWIN0=GENGE0(1)
            GOTO 10256
10259         NEWIN0=GENGE0(2)
            GOTO 10256
10256         AAAAX0=6
              GOTO 10224
10254       AAABD0=AAABC0+3
            GOTO(10259,10258,10262,10255,10257),AAABD0
10262       CONTINUE
10261     CONTINUE
10253   GOTO 10263
10227   IF(AAAAZ0.EQ.1)GOTO 10241
        IF(AAAAZ0.EQ.17)GOTO 10238
        AAABE0=AAAAZ0-36
        GOTO(10228,10235),AAABE0
        IF(AAAAZ0.EQ.52)GOTO 10252
10234 GOTO 10263
10225 IF(AAAAY0.EQ.2)GOTO 10226
10263 RETURN
10224 IMEMA0(IMEMA0(INSTR+2)+1)=NEWIN0
      IMEMA0(IMEMA0(INSTR+1)+2)=NEWIN0
      IMEMA0(NEWIN0+1)=IMEMA0(INSTR+1)
      IMEMA0(NEWIN0+2)=IMEMA0(INSTR+2)
      INSTR=NEWIN0
      GOTO 10264
10264 GOTO(10263,10233,10237,10240,10250,10261),AAAAX0
      GOTO 10264
      END
      LOGICAL FUNCTION OVERL0(START1,LEN1,START2,LEN2)
      INTEGER START1,LEN1,START2,LEN2
      INTEGER * 4 LOW,HIGH
      IF((RT(INTL(START1),16).GE.RT(INTL(START2),16)))GOTO 10265
        LOW=RT(INTL(START1),16)
        GOTO 10266
10265   LOW=RT(INTL(START2),16)
10266 IF((RT(INTL(START1+LEN1),16).LE.RT(INTL(START2+LEN2),16)))GOTO    
     *  10267
        HIGH=RT(INTL(START1+LEN1),16)
        GOTO 10268
10267   HIGH=RT(INTL(START2+LEN2),16)
10268 OVERL0=HIGH-LOW.LT.LEN1+LEN2
      RETURN
      END
      SUBROUTINE ADCOPY(SRC,DST)
      INTEGER SRC(5),DST(5)
      INTEGER I
      I=1
      GOTO 10271
10269 I=I+(1)
10271 IF((I.GT.5))GOTO 10270
        DST(I)=SRC(I)
      GOTO 10269
10270 RETURN
      END
      LOGICAL FUNCTION ADEQU0(AD1,AD2)
      INTEGER AD1(5),AD2(5)
      INTEGER AAABF0
      IF((AD1(1).EQ.AD2(1)))GOTO 10272
        ADEQU0=.FALSE.
        RETURN
10272 AAABF0=AD1(1)
      GOTO 10273
10274   ADEQU0=AD1(2).EQ.AD2(2)
        RETURN
10275   ADEQU0=AD1(2).EQ.AD2(2).AND.AD1(3).EQ.AD2(3)
        RETURN
10276   ADEQU0=AD1(2).EQ.AD2(2).AND.AD1(3).EQ.AD2(3).AND.AD1(4).EQ.AD2(4
     *).AND.AD1(5).EQ.AD2(5)
        RETURN
10277   ADEQU0=AD1(3).EQ.AD2(3)
        RETURN
10278   ADEQU0=AD1(2).EQ.AD2(2).AND.AD1(3).EQ.AD2(3)
        RETURN
10273 GOTO(10278,10278,10278,10278,10278,10274,10275,10275,10276,10277),
     *AAABF0
        CALL WARNI0('*i: bad address descriptor mode in ad_equal*n.',AD1
     *(1))
      ADEQU0=.FALSE.
      RETURN
      END
C ---- Long Name Map ----
C loadcompl                      loadj0
C loadxoraa                      loafg0
C deletelit                      delev0
C enterent                       enter0
C flowfield                      flowf0
C geniplabel                     genip0
C genlabel                       genla0
C loaddiv                        loadq0
C loadlshiftaa                   loaea0
C loadpredec                     loael0
C otg$aentpb                     otg$a0
C Imem                           imema0
C loadrem                        loaep0
C putmoduleheader                putmo0
C linkinstremitted               linki0
C enterlit                       enteu0
C generatestaticstuff            geneu0
C loadchecklower                 loadg0
C loaddefinestat                 loado0
C loadreturn                     loaer0
C setupswitch                    setuq0
C discardinst                    disca0
C gengeneric                     genge0
C linksize                       links0
C loadandaa                      loadd0
C loadobject                     loaeh0
C loadproccall                   loaen0
C loadrefto                      loaeo0
C lookupext                      looku0
C alloctemp                      alloc0
C loadcheckupper                 loadi0
C loadwhileloop                  loafe0
C geniprtr                       geniq0
C loadrshiftaa                   loaet0
C loadseq                        loaex0
C voidswitch                     voidt0
C initializelabels               initi0
C loadsub                        loafa0
C procinstremitted               proci0
C clearobj                       cleax0
C deleteext                      delet0
C loadundefinedynm               loafd0
C reachindex                     reack0
C simplify                       simpl0
C stfield                        stfie0
C lfieldmask                     lfiel0
C loadoraa                       loaei0
C otg$dac                        otg$e0
C otg$mref                       otg$m0
C putmoduletrailer               putmp0
C resolveent                     resol0
C clearstack                     cleay0
C enterext                       entes0
C lshiftaby                      lshif0
C putstartdata                   putst0
C Smem                           smema0
C loadconst                      loadk0
C loadmul                        loaeb0
C loadpostinc                    loaek0
C otg$ecb                        otg$g0
C putbranch                      putbr0
C resolvelit                     reson0
C voidfieldasgop                 voidf0
C Tmem                           tmema0
C EmitPMA                        emitp0
C flowswitch                     flowv0
C loadconvert                    loadl0
C loadforloop                    loadv0
C loadsand                       loaev0
C optimize                       optim0
C rsvstack                       rsvst0
C voidaddaa                      voida0
C gettree                        gettr0
C loadselect                     loaew0
C lookuplab                      lookv0
C otg$endlb                      otg$h0
C otg$rentlb                     otg$r0
C killxbrel                      killx0
C loadnot                        loaef0
C loadpreinc                     loaem0
C otg$rorglb                     otg$t0
C loadlabel                      loady0
C voidpostdec                    voidp0
C framecom                       frame0
C generateprocedures             genet0
C genswitch                      gensw0
C loaddeclarestat                loadm0
C otglabel                       otgla0
C reachobject                    reacl0
C rshiftaby                      rshif0
C Breaksp                        break0
C Stream1                        strea0
C lfstate                        lfsta0
C deletelab                      deleu0
C getlitaddr                     getli0
C loadadd                        loada0
C loadcheckrange                 loadh0
C loadsor                        loaez0
C otg$endpb                      otg$i0
C Stream2                        streb0
C gencopy                        genco0
C loadassign                     loade0
C reachseq                       reacn0
C Stream3                        strec0
C enterlab                       entet0
C generateproc                   genes0
C initshfttableids               inits0
C loadfield                      loadt0
C otg$proc                       otg$p0
C otgmisc                        otgmi0
C resolveext                     resom0
C warning                        warni0
C Breakstack                     breal0
C clearent                       clear0
C loadbreak                      loadf0
C loaddivaa                      loadr0
C loadderef                      loadp0
C loadremaa                      loaeq0
C loadrtrip                      loaeu0
C lshiftlby                      lshig0
C otg$brnch                      otg$d0
C stacksize                      stack0
C Continuesp                     conti0
C newinstr                       newin0
C andawith                       andaw0
C clearlit                       cleaw0
C gensjtolab                     gensk0
C loadxor                        loaff0
C overlap                        overl0
C genbranch                      genbr0
C loadlshift                     loadz0
C reachconst                     reaci0
C Rtrids                         rtrid0
C voidseq                        voids0
C Continuestack                  contj0
C xbstate                        xbsta0
C getextaddr                     getex0
C lookupobj                      lookx0
C otg$rorg                       otg$s0
C reachselect                    reacm0
C framestate                     framf0
C arshiftaby                     arshi0
C getlabeladdr                   getla0
C loaddoloop                     loads0
C otg$blk                        otg$c0
C initotg                        inito0
C loadand                        loadc0
C loadsubaa                      loafb0
C otg$gen                        otg$l0
C rshiftlby                      rshig0
C gendata                        genda0
C ldfield                        ldfie0
C loadshiftins                   loaey0
C Errors                         error0
C deleteobj                      delew0
C loadrshift                     loaes0
C otg$entlb                      otg$j0
C voidpostinc                    voidq0
C EmitObj                        emito0
C clearext                       cleas0
C flfield                        flfie0
C flowseq                        flowt0
C freetemp                       freet0
C genshift                       gensh0
C otg$orglb                      otg$o0
C otgpseudo                      otgps0
C reachassign                    reach0
C enterobj                       entev0
C loadgoto                       loadw0
C loadmulaa                      loaec0
C loadswitch                     loafc0
C putlabel                       putla0
C gensjforward                   gensj0
C mklabel                        mklab0
C setupframeowner                setup0
C voidpreinc                     voidr0
C Outfile                        outfi0
C andlwith                       andlw0
C loadnull                       loaeg0
C otg$entpb                      otg$k0
C reachderef                     reacj0
C Infile                         infil0
C loadneg                        loaed0
C putmisc                        putmi0
C otg$apins                      otg$b0
C putgeneric                     putge0
C killindexed                    killi0
C clearinstr                     cleat0
C clearlink                      cleav0
C flowconvert                    flowc0
C flowsand                       flows0
C loadfieldasgop                 loadu0
C otg$data                       otg$f0
C otg$xtip                       otg$x0
C putinstr                       putin0
C voidassign                     voidb0
C replace                        repla0
C adequal                        adequ0
C arshiftlby                     arshj0
C loadaddaa                      loadb0
C loadnext                       loaee0
C ophasvalue                     ophas0
C strsave                        strsa0
C clearstr                       cleaz0
C cleartree                      cleba0
C flownot                        flown0
C otg$rslv                       otg$u0
C rsvlink                        rsvli0
C zerolit                        zerol0
C clearlab                       cleau0
C freestack                      frees0
C genextrtr                      genex0
C loadindex                      loadx0
C lookuplit                      lookw0
C otgbranch                      otgbr0
C loadpostdec                    loaej0
C otg$uii                        otg$v0
C killaddress                    killa0
C afieldmask                     afiel0
C flowsor                        flowu0
C generateentries                gener0
C loaddefinedynm                 loadn0
