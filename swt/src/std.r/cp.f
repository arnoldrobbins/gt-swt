      INTEGER A$BUF(200)
      INTEGER SRCPA0(180),DSTPA0(180),SNAME(33)
      INTEGER MAPDN,GCHAR
      INTEGER ENTRY(32),CODE,SRCFD,DSTFD,SRCTY0,DSTTY0,I,LEVEL,MAXLE0,OP
     *W(3),NPW(3),DSTNA0(16,32),DSTPWD(3,32),FCP,SCP,JUNK(3),ATTACH,ENTR
     *Y2(32)
      INTEGER TSCAN$,FOLLOW,GETARG,FINFO$,GETTO,EXPAND,EQUAL,UPKFN$,LENG
     *TH
      LOGICAL DSTCR0,GATEC0
      INTEGER AAAAA0
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0
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
      INTEGER USAGE(43)
      INTEGER AAAAP0(9)
      INTEGER AAAAQ0(4)
      INTEGER PARSCL
      INTEGER AAAAR0(21)
      INTEGER AAAAS0(12)
      INTEGER AAAAT0(17)
      INTEGER AAAAU0(15)
      INTEGER AAAAV0
      INTEGER AAAAW0(15)
      INTEGER AAAAX0
      INTEGER AAAAY0(13)
      INTEGER * 4 AAAAZ0,AAABA0
      INTEGER AAABB0(35)
      INTEGER AAABC0(35)
      INTEGER AAABD0(15)
      INTEGER AAABE0(15)
      INTEGER AAABF0(13)
      INTEGER AAABG0(15)
      INTEGER AAABH0(22)
      INTEGER AAABI0
      INTEGER AAABJ0
      INTEGER AAABK0(18)
      DATA USAGE/213,243,225,231,229,186,160,227,240,160,219,173,237,240
     *,221,160,219,173,243,160,188,228,229,240,244,232,190,221,160,188,2
     *30,242,239,237,190,160,219,188,244,239,190,221,0/
      DATA AAAAP0/189,199,225,212,229,227,232,189,0/
      DATA AAAAQ0/249,229,243,0/
      DATA AAAAR0/219,173,237,240,221,160,219,173,243,160,188,239,240,24
     *4,160,233,238,244,190,221,0/
      DATA AAAAS0/186,160,238,239,244,160,230,239,245,238,228,0/
      DATA AAAAT0/186,160,233,243,160,225,160,228,233,242,229,227,244,23
     *9,242,249,0/
      DATA AAAAU0/186,160,226,225,228,160,240,225,244,232,238,225,237,22
     *9,0/
      DATA AAAAW0/186,160,227,225,238,167,244,160,227,242,229,225,244,22
     *9,0/
      DATA AAAAY0/227,225,238,167,244,160,232,225,240,240,229,238,0/
      DATA AAABB0/233,238,160,230,239,236,236,239,247,223,228,243,244,22
     *3,240,225,244,232,186,160,227,225,238,167,244,160,232,225,240,240,
     *229,238,160,177,0/
      DATA AAABC0/233,238,160,230,239,236,236,239,247,223,228,243,244,22
     *3,240,225,244,232,186,160,227,225,238,167,244,160,232,225,240,240,
     *229,238,160,178,0/
      DATA AAABD0/186,160,226,225,228,160,240,225,244,232,238,225,237,22
     *9,0/
      DATA AAABE0/186,160,227,225,238,167,244,160,227,242,229,225,244,22
     *9,0/
      DATA AAABF0/186,160,227,225,238,167,244,160,239,240,229,238,0/
      DATA AAABG0/186,160,227,225,238,167,244,160,227,242,229,225,244,22
     *9,0/
      DATA AAABH0/186,160,238,239,238,173,229,237,240,244,249,160,228,23
     *3,242,229,227,244,239,242,249,0/
      DATA AAABK0/186,160,227,239,240,249,160,233,238,227,239,237,240,23
     *6,229,244,229,0/
      IF((EXPAND(AAAAP0,SRCPA0,180).EQ.-3))GOTO 10016
      IF((EQUAL(SRCPA0,AAAAQ0).EQ.0))GOTO 10016
      GOTO 10015
10016   GATEC0=.FALSE.
        GOTO 10017
10015   GATEC0=.TRUE.
10017 IF((PARSCL(AAAAR0,A$BUF).NE.-3))GOTO 10018
        CALL ERROR(USAGE)
10018 IF((A$BUF(243-225+1).EQ.2))GOTO 10019
        A$BUF(243-225+27)=:77777
10019 IF((GETARG(3,SRCPA0,1).NE.-1))GOTO 10021
      IF((GETARG(1,SRCPA0,180).EQ.-1))GOTO 10021
      GOTO 10020
10021   CALL ERROR(USAGE)
10020 I=GETARG(2,DSTPA0,180)
      LEVEL=0
      MAXLE0=A$BUF(243-225+27)
      IF((FINFO$(SRCPA0,ENTRY,ATTACH).NE.-3))GOTO 10022
        CALL PUTLIN(SRCPA0,-15)
        CALL ERROR(AAAAS0)
        GOTO 10023
10022   IF((AND(ENTRY(20),7).EQ.4))GOTO 10024
          AAAAA0=1
          GOTO 10000
10025     GOTO 10026
10024     IF((A$BUF(243-225+1).NE.0))GOTO 10028
          IF((A$BUF(237-225+1).NE.0))GOTO 10028
          GOTO 10027
10028       AAAAB0=1
            GOTO 10001
10029       GOTO 10030
10027       CALL PUTLIN(SRCPA0,-15)
            CALL ERROR(AAAAT0)
10030   CONTINUE
10026 CONTINUE
10023 GOTO 10031
10000 AAAAJ0=1
      GOTO 10009
10032 IF((CODE.EQ.0))GOTO 10033
        AAAAK0=1
        GOTO 10010
10034 CONTINUE
10033 IF((ATTACH.EQ.0))GOTO 10035
        CALL AT$HOM(CODE)
10035 GOTO 10036
10037   AAAAN0=1
        GOTO 10013
10038 GOTO 10039
10040 GOTO 10039
10039   AAAAH0=1
        GOTO 10007
10041 GOTO 10042
10036 IF((FOLLOW(DSTPA0,0).EQ.-2))GOTO 10037
      IF((GETTO(DSTPA0,ENTRY(2),JUNK,ATTACH).EQ.-2))GOTO 10040
        CODE=-3
        CALL PUTLIN(DSTPA0,-15)
        CALL REMARK(AAAAU0)
10042 CALL SRCH$$(:4,0,0,SRCFD,0,JUNK)
      IF((CODE.EQ.0))GOTO 10043
        AAAAK0=2
        GOTO 10010
10044 CONTINUE
10043 GOTO 10045
10031 GOTO 10046
10001 AAAAC0=1
      GOTO 10002
10047 IF((ATTACH.EQ.0))GOTO 10048
        CALL AT$HOM(CODE)
10048 DSTCR0=.FALSE.
      GOTO 10049
10050 GOTO 10051
10052   AAAAN0=2
        GOTO 10013
10053 GOTO 10051
10051   AAAAO0=1
        GOTO 10014
10054   CALL AT$HOM(CODE)
        AAAAI0=1
        GOTO 10008
10055   DSTCR0=.TRUE.
        AAAAL0=1
        GOTO 10011
10056 GOTO 10057
10049 IF((FOLLOW(DSTPA0,0).EQ.-3))GOTO 10050
      IF((A$BUF(237-225+1).EQ.0))GOTO 10052
10057 CONTINUE
10058   AAAAV0=TSCAN$(SRCPA0,ENTRY,LEVEL,MAXLE0,2+4+1)
        GOTO 10059
10060     GOTO 10061
10062     MAXLE0=A$BUF(243-225+27)
          IF((AND(ENTRY(20),7).NE.4))GOTO 10063
            AAAAC0=2
            GOTO 10002
10064       SRCTY0=4
            GOTO 10065
10063       AAAAJ0=2
            GOTO 10009
10066       IF((CODE.EQ.0))GOTO 10067
              GOTO 10068
10067     CONTINUE
10065     AAAAG0=1
          GOTO 10006
10069     AAAAD0=1
          GOTO 10003
10070     IF((SRCTY0.NE.4))GOTO 10071
            IF((ENTRY(1).NE.0))GOTO 10072
              CALL RMFIL$(ENTRY(2))
              CALL CREA$$(ENTRY(2),32,OPW,NPW,CODE)
              IF((CODE.EQ.0))GOTO 10073
              IF((CODE.EQ.18))GOTO 10073
                AAAAE0=1
                GOTO 10004
10074           CALL REMARK(AAAAW0)
                MAXLE0=LEVEL
10073         GOTO 10075
10072         AAAAF0=1
              GOTO 10005
10076       CONTINUE
10075       GOTO 10077
10071       AAAAH0=2
            GOTO 10007
10078       CALL SRCH$$(:4,0,0,SRCFD,0,JUNK)
10077   GOTO 10079
10059   AAAAX0=AAAAV0+3
        GOTO(10062,10060),AAAAX0
10079 CONTINUE
10068 GOTO 10058
10061 IF((.NOT.DSTCR0))GOTO 10080
        AAAAM0=1
        GOTO 10012
10081   CALL AT$HOM(CODE)
        IF((GETTO(DSTPA0,ENTRY(2),JUNK,ATTACH).NE.-3))GOTO 10082
          CALL ERROR(AAAAY0)
10082   AAAAF0=2
        GOTO 10005
10083 CONTINUE
10080 GOTO 10084
10046 GOTO 10085
10002 CALL GPAS$$(ENTRY(2),32,OPW,NPW,CODE)
      IF((CODE.NE.0))GOTO 10087
      IF((A$BUF(240-225+1).EQ.0))GOTO 10087
      GOTO 10086
10087   DO 10088 I=1,3
          OPW(I)=0
          NPW(I)=0
10088   CONTINUE
10089 CONTINUE
10086 GOTO 10090
10085 GOTO 10091
10003 AAAAZ0=LOC(DSTNA0(1,LEVEL))
      AAABA0=LOC(ENTRY(2))
      FCP=0
      SCP=0
      GOTO 10094
10092 CONTINUE
10094 IF((FCP.GE.32))GOTO 10093
        CALL SCHAR(AAAAZ0,SCP,MAPDN(GCHAR(AAABA0,FCP)))
      GOTO 10092
10093 IF((.NOT.GATEC0))GOTO 10095
        DO 10096 I=1,3
          DSTPWD(I,LEVEL)=NPW(I)
10096   CONTINUE
10097   GOTO 10098
10095   DO 10099 I=1,3
          IF((OPW(1).NE.0))GOTO 10101
            DSTPWD(I,LEVEL)='  '
            GOTO 10102
10101       DSTPWD(I,LEVEL)=OPW(I)
10102     CONTINUE
10099   CONTINUE
10100 CONTINUE
10098 GOTO 10103
10091 GOTO 10104
10004 CALL PUTLIN(DSTPA0,-15)
      I=1
      GOTO 10107
10105 I=I+(1)
10107 IF((I.GT.LEVEL))GOTO 10106
        IF((LEVEL.GT.1))GOTO 10109
        IF((DSTPA0(1).NE.0))GOTO 10109
        GOTO 10108
10109     CALL PUTCH(175,-15)
10108   CALL UPKFN$(DSTNA0(1,I),32,SNAME,33)
        CALL PUTLIN(SNAME,-15)
      GOTO 10105
10106 GOTO 10110
10104 GOTO 10111
10005 CALL SATR$$(:1,ENTRY(2),32,LS(INTL(ENTRY(18)),16),JUNK)
      IF((SRCTY0.EQ.4))GOTO 10112
      IF((SRCTY0.EQ.6))GOTO 10112
        CALL SATR$$(:4,ENTRY(2),32,RS(AND(ENTRY(20),3072),10),JUNK)
10112 IF((AND(ENTRY(20),8192).NE.0))GOTO 10113
        CALL SATR$$(:2,ENTRY(2),32,ENTRY(21),JUNK)
10113 CALL SATR$$(:6,ENTRY(2),32,AND(ENTRY(18),128),JUNK)
      CALL SATR$$(:7,ENTRY(2),32,ENTRY(23),JUNK)
      GOTO 10114
10111 GOTO 10115
10006 CALL AT$HOM(CODE)
      IF((FOLLOW(DSTPA0,0).EQ.-3))GOTO 10116
        I=1
        GOTO 10119
10117   I=I+(1)
10119   IF((I.GE.LEVEL))GOTO 10118
          CALL ATCH$$(DSTNA0(1,I),32,0,DSTPWD(1,I),:2,CODE)
          IF((CODE.EQ.0))GOTO 10120
            CALL ERROR(AAABB0)
10120   GOTO 10117
10118   GOTO 10121
10116   CALL ERROR(AAABC0)
10121 GOTO 10122
10115 GOTO 10123
10008 IF((GETTO(DSTPA0,ENTRY(2),JUNK,ATTACH).NE.-3))GOTO 10124
        CALL PUTLIN(DSTPA0,-15)
        CALL ERROR(AAABD0)
10124 CALL RMFIL$(ENTRY(2))
      CALL CREA$$(ENTRY(2),32,OPW,NPW,CODE)
      IF((CODE.EQ.0))GOTO 10125
      IF((CODE.EQ.18))GOTO 10125
        CALL PUTLIN(DSTPA0,-15)
        CALL ERROR(AAABE0)
10125 GOTO 10126
10123 GOTO 10127
10009 CALL SRCH$$(:1+:40000,ENTRY(2),32,SRCFD,SRCTY0,CODE)
      IF((CODE.EQ.0))GOTO 10128
        CALL PUTLIN(SRCPA0,-15)
        CALL REMARK(AAABF0)
        GOTO 10129
10128   SRCTY0=AND(SRCTY0,7)
10129 GOTO 10130
10127 GOTO 10131
10007 CALL SRCH$$(:3+:40000+LS(SRCTY0,10),ENTRY(2),32,DSTFD,DSTTY0,CODE)
      IF((CODE.NE.0))GOTO 10132
      IF((DSTTY0.EQ.SRCTY0))GOTO 10132
        CALL RMFIL$(ENTRY(2))
        CALL SRCH$$(:3+:40000+LS(SRCTY0,10),ENTRY(2),32,DSTFD,DSTTY0,COD
     *E)
10132 IF((CODE.EQ.0))GOTO 10133
        AAAAE0=2
        GOTO 10004
10134   CALL REMARK(AAABG0)
        GOTO 10135
10133   IF((DSTTY0.EQ.SRCTY0))GOTO 10136
          CALL SRCH$$(:4,0,0,DSTFD,0,CODE)
          AAAAE0=3
          GOTO 10004
10137     CALL REMARK(AAABH0)
          CODE=-3
          GOTO 10138
10136     AAABI0=SRCTY0
          GOTO 10139
10140       CALL CPFIL$(SRCFD,DSTFD,CODE)
          GOTO 10141
10142       CALL CPSEG$(SRCFD,DSTFD,CODE)
          GOTO 10141
10139     AAABJ0=AAABI0+1
          GOTO(10140,10140,10142,10142),AAABJ0
10141     CALL PRWF$$(:4,DSTFD,INTL(0),0,INTL(0),0,JUNK)
          CALL SRCH$$(:4,0,0,DSTFD,0,JUNK)
          IF((CODE.NE.-3))GOTO 10143
            AAAAE0=4
            GOTO 10004
10144       CALL REMARK(AAABK0)
            GOTO 10145
10143       AAAAF0=3
            GOTO 10005
10146       CODE=0
10145   CONTINUE
10138 CONTINUE
10135 GOTO 10147
10131 GOTO 10148
10010 CALL SETERR(1000)
      CALL SWT
10148 GOTO 10149
10011 CALL MOVE$(ENTRY,ENTRY2,32)
      GOTO 10150
10149 GOTO 10151
10012 CALL MOVE$(ENTRY2,ENTRY,32)
      GOTO 10152
10151 GOTO 10153
10013 I=LENGTH(DSTPA0)+1
      IF((I.LE.1))GOTO 10154
      IF((I.GE.180))GOTO 10154
        DSTPA0(I)=175
        I=I+(1)
10154 CALL UPKFN$(ENTRY(2),32,DSTPA0(I),180-I+1)
      GOTO 10155
10153 GOTO 10156
10014 I=LENGTH(DSTPA0)+1
      DSTPA0(I)=186
      IF((.NOT.GATEC0))GOTO 10157
      IF((NPW(1).EQ.0))GOTO 10157
        CALL UPKFN$(NPW,6,DSTPA0(I+1),180-I)
        GOTO 10158
10157   IF(GATEC0)GOTO 10159
        IF((OPW(1).EQ.0))GOTO 10159
          CALL UPKFN$(OPW,6,DSTPA0(I+1),180-I)
          GOTO 10160
10159     DSTPA0(I)=0
10160 CONTINUE
10158 GOTO 10161
10156 CALL SWT
10161 GOTO 10054
10084 GOTO 10029
10103 GOTO 10070
10110 GOTO(10074,10134,10137,10144),AAAAE0
      GOTO 10110
10090 GOTO(10047,10064),AAAAC0
      GOTO 10090
10045 GOTO 10025
10126 GOTO 10055
10155 GOTO(10038,10053),AAAAN0
      GOTO 10155
10130 GOTO(10032,10066),AAAAJ0
      GOTO 10130
10162 GOTO(10034,10044),AAAAK0
      GOTO 10162
10147 GOTO(10041,10078),AAAAH0
      GOTO 10147
10122 GOTO 10069
10152 GOTO 10081
10114 GOTO(10076,10083,10146),AAAAF0
      GOTO 10114
10150 GOTO 10056
      END
C ---- Long Name Map ----
C dsttype                        dstty0
C addpassword                    addpa0
C dstname                        dstna0
C updatedstpath                  updat0
C printdstpath                   print0
C getpasswords                   getpa0
C dstcreated                     dstcr0
C srcpath                        srcpa0
C createdstdir                   creau0
C dstpath                        dstpa0
C constructdestname              const0
C opensrc                        opens0
C createdstfile                  creat0
C followdstpath                  follo0
C restoreentry                   resto0
C GaTech                         gatec0
C maxlevel                       maxle0
C setattributes                  setat0
C saveentry                      savee0
C srctype                        srcty0
