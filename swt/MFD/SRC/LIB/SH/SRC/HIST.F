      INTEGER FUNCTION HISTS0(COMMA0)
      INTEGER COMMA0
      INTEGER HPTRA0(128)
      INTEGER HBUFA0(4096)
      INTEGER HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HONAA0
      COMMON /HISTCM/HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HPTRA0,HBUFA0,HO
     *NAA0
      INTEGER P
      INTEGER C
      INTEGER LSGETC
      INTEGER HISTE0,HISTQ0
      IF((COMMA0.EQ.0))GOTO 10001
      IF((HONAA0.EQ.0))GOTO 10001
      GOTO 10000
10001   HISTS0=-2
        RETURN
10000 IF((HISTE0(COMMA0).EQ.-3))GOTO 10003
      IF((HISTQ0(COMMA0).EQ.-3))GOTO 10003
      GOTO 10002
10003   HISTS0=-3
        RETURN
10002 P=COMMA0
      IF((LSGETC(P,C).NE.0))GOTO 10004
        CALL LSFREE(COMMA0,10000)
10004 HISTS0=-2
      RETURN
      END
      SUBROUTINE HISTI0
      INTEGER HPTRA0(128)
      INTEGER HBUFA0(4096)
      INTEGER HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HONAA0
      COMMON /HISTCM/HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HPTRA0,HBUFA0,HO
     *NAA0
      HPFAA0=1
      HPLAA0=1
      HBFAA0=1
      HBLAA0=1
      HLINE0=1
      RETURN
      END
      INTEGER FUNCTION HISTE0(COMMA0)
      INTEGER COMMA0
      INTEGER C
      INTEGER P,S
      INTEGER HFLAG
      INTEGER START,LEN
      INTEGER BUF(102)
      INTEGER LSGETC,LSPOS
      INTEGER HISTF0,HISTL0
      HFLAG=0
10005 IF((HISTF0(COMMA0,START,LEN).NE.-2))GOTO 10006
        IF((LEN.LT.102-1))GOTO 10007
          CALL ERRMSG(COMMA0,START,'history token too large.')
          HISTE0=-3
          RETURN
10007   P=COMMA0
        CALL LSPOS(P,START)
        CALL LSEXTR(P,BUF,LEN+1)
        IF((BUF(LEN).NE.161))GOTO 10008
          BUF(LEN)=0
10008   IF((HISTL0(BUF,S,COMMA0,START).NE.-3))GOTO 10009
          HISTE0=-3
          RETURN
10009   P=S
        CALL LSDEL(COMMA0,START,LEN)
        IF((LSGETC(P,C).EQ.0))GOTO 10010
          CALL LSINS(COMMA0,START-1,S,1,10000)
10010   CALL LSFREE(S,10000)
        HFLAG=1
      GOTO 10005
10006 IF((HFLAG.NE.1))GOTO 10011
        CALL LSPUTF(COMMA0,1)
        CALL PUTCH(138,1)
10011 HISTE0=-2
      RETURN
      END
      INTEGER FUNCTION HISTQ0(COMMA0)
      INTEGER COMMA0
      INTEGER HPTRA0(128)
      INTEGER HBUFA0(4096)
      INTEGER HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HONAA0
      COMMON /HISTCM/HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HPTRA0,HBUFA0,HO
     *NAA0
      INTEGER P
      INTEGER C
      INTEGER LSGETC
      HPTRA0(HPFAA0)=HBFAA0
      HPFAA0=MOD(HPFAA0,128)+1
      IF((HPFAA0.NE.HPLAA0))GOTO 10012
        CALL HISTG0
10012 P=COMMA0
      C=LSGETC(P,C)
10013 IF((C.EQ.0))GOTO 10014
      IF((HPFAA0.EQ.HPLAA0))GOTO 10014
10015     HBUFA0(HBFAA0)=C
          C=LSGETC(P,C)
          HBFAA0=MOD(HBFAA0,4096)+1
        IF((C.EQ.0))GOTO 10016
        IF((HBFAA0.EQ.HBLAA0))GOTO 10016
        GOTO 10015
10016   CONTINUE
        IF((HBFAA0.NE.HBLAA0))GOTO 10013
          CALL HISTG0
10017 GOTO 10013
10014 IF((HPFAA0.EQ.HPLAA0))GOTO 10018
        HBUFA0(HBFAA0)=0
        HBFAA0=MOD(HBFAA0,4096)+1
        IF((HBFAA0.NE.HBLAA0))GOTO 10019
          CALL HISTG0
10019 CONTINUE
10018 IF((HPFAA0.NE.HPLAA0))GOTO 10020
        CALL ERRMSG(0,0,'history buffer overflow.')
        CALL HISTI0
        HISTQ0=-3
        RETURN
10020 HISTQ0=-2
      RETURN
      END
      SUBROUTINE HISTG0
      INTEGER HPTRA0(128)
      INTEGER HBUFA0(4096)
      INTEGER HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HONAA0
      COMMON /HISTCM/HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HPTRA0,HBUFA0,HO
     *NAA0
      HPLAA0=MOD(HPLAA0,128)+1
      HBLAA0=HPTRA0(HPLAA0)
      HLINE0=HLINE0+(1)
      RETURN
      END
      INTEGER FUNCTION HISTF0(COMMA0,START,LEN)
      INTEGER START,LEN
      INTEGER COMMA0
      INTEGER P
      INTEGER C
      INTEGER SUBSE0
      INTEGER LSGETC
      START=1
      P=COMMA0
      C=LSGETC(P,C)
10021 IF((C.EQ.161))GOTO 10022
      IF((C.EQ.0))GOTO 10022
        IF((C.NE.192))GOTO 10023
          C=LSGETC(P,C)
          START=START+(1)
10023   IF((C.EQ.0))GOTO 10021
          C=LSGETC(P,C)
          START=START+(1)
10024 GOTO 10021
10022 IF((C.NE.0))GOTO 10025
        HISTF0=-3
        RETURN
10025 LEN=1
      C=LSGETC(P,C)
      IF((C.NE.191))GOTO 10026
        LEN=LEN+(1)
        C=LSGETC(P,C)
10027   IF((C.EQ.191))GOTO 10028
        IF((C.EQ.0))GOTO 10028
          IF((C.NE.192))GOTO 10029
            C=LSGETC(P,C)
            LEN=LEN+(1)
10029     IF((C.EQ.0))GOTO 10027
            C=LSGETC(P,C)
            LEN=LEN+(1)
10030   GOTO 10027
10028 CONTINUE
10026 CONTINUE
10031 IF((C.EQ.160))GOTO 10032
      IF((C.EQ.137))GOTO 10032
      IF((C.EQ.161))GOTO 10032
      IF((C.EQ.0))GOTO 10032
        IF((C.NE.222))GOTO 10033
          LEN=LEN+(1)
          SUBSE0=0
          C=LSGETC(P,C)
10034     IF((SUBSE0.GE.2))GOTO 10035
          IF((C.EQ.0))GOTO 10035
            IF((C.NE.192))GOTO 10036
              C=LSGETC(P,C)
              LEN=LEN+(1)
10036       IF((C.EQ.0))GOTO 10037
              C=LSGETC(P,C)
              LEN=LEN+(1)
10037       IF((C.NE.222))GOTO 10034
              SUBSE0=SUBSE0+(1)
10038     GOTO 10034
10035   CONTINUE
10033   IF((C.NE.192))GOTO 10039
          C=LSGETC(P,C)
          LEN=LEN+(1)
10039   IF((C.EQ.0))GOTO 10031
          C=LSGETC(P,C)
          LEN=LEN+(1)
10040 GOTO 10031
10032 IF((C.NE.161))GOTO 10041
        LEN=LEN+(1)
10041 HISTF0=-2
      RETURN
      END
      INTEGER FUNCTION HISTL0(STR,SUB,COM,POS)
      INTEGER STR(1)
      INTEGER SUB,COM
      INTEGER POS
      INTEGER HPTRA0(128)
      INTEGER HBUFA0(4096)
      INTEGER HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HONAA0
      COMMON /HISTCM/HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HPTRA0,HBUFA0,HO
     *NAA0
      INTEGER C
      INTEGER CTOI
      INTEGER HISTH0
      INTEGER LSPOS
      INTEGER P,SP,RP
      INTEGER BUF(102),REP(102)
      INTEGER I,VAL,SI,FLAG,LEN,LOC,LAST,NULL
      INTEGER AAAAA0
      INTEGER AAAAB0
      SI=2
      AAAAA0=STR(SI)
      GOTO 10042
10043   IF((HPFAA0.NE.HPLAA0))GOTO 10044
          CALL ERRMSG(COM,POS,'no history exists, yet.')
          HISTL0=-3
          RETURN
10044   VAL=MOD(HPFAA0-HPLAA0+128,128)+HLINE0-1
        IF((HISTH0(VAL,SUB).NE.-3))GOTO 10046
          CALL ERRMSG(COM,POS,'history internal error.')
          HISTL0=-3
          RETURN
10047   VAL=CTOI(STR,SI)
        IF((HISTH0(VAL,SUB).NE.-3))GOTO 10046
          CALL ERRMSG(COM,POS,'history item not found.')
          HISTL0=-3
          RETURN
10049   I=1
        SI=SI+(1)
10050   IF((STR(SI).EQ.0))GOTO 10051
        IF((STR(SI).EQ.191))GOTO 10051
          IF((STR(SI).NE.192))GOTO 10052
            SI=SI+(1)
10052     IF((STR(SI).EQ.0))GOTO 10053
            BUF(I)=STR(SI)
10053     SI=SI+(1)
          I=I+(1)
        GOTO 10050
10051   BUF(I)=0
        IF((STR(SI).NE.191))GOTO 10054
          SI=SI+(1)
10054   FLAG=0
        VAL=MOD(HPFAA0-HPLAA0+128,128)+HLINE0-1
10055   IF((HISTH0(VAL,SUB).EQ.-3))GOTO 10056
          P=SUB
          C=LSGETC(P,C)
10057     IF((C.EQ.0))GOTO 10058
            I=1
10059       IF((C.EQ.0))GOTO 10060
            IF((BUF(I).EQ.0))GOTO 10060
            IF((C.EQ.BUF(I)))GOTO 10060
              C=LSGETC(P,C)
            GOTO 10059
10060       SP=P
10061       IF((C.EQ.0))GOTO 10062
            IF((BUF(I).EQ.0))GOTO 10062
            IF((C.NE.BUF(I)))GOTO 10062
              C=LSGETC(SP,C)
              I=I+(1)
            GOTO 10061
10062       IF((BUF(I).NE.0))GOTO 10063
              FLAG=1
              GOTO 10056
10063       P=SP
            C=LSGETC(P,C)
          GOTO 10057
10058     VAL=VAL-(1)
          CALL LSFREE(SUB,10000)
        GOTO 10055
10056   IF((FLAG.NE.0))GOTO 10046
          CALL ERRMSG(COM,POS,'history item not found.')
          HISTL0=-3
          RETURN
10042 IF(AAAAA0.EQ.0)GOTO 10043
      AAAAB0=AAAAA0-175
      GOTO(10047,10047,10047,10047,10047,10047,10047,10047,10047,10047, 
     *    10065,10065,10065,10065,10065,10049,10065,10065,10065,10065,  
     *   10065,10065,10065,10065,10065,10065,10065,10065,10065,10065,   
     *  10065,10065,10065,10065,10065,10065,10065,10065,10065,10065,    
     * 10065,10065,10065,10065,10065,10065,10043,10065,10043),AAAAB0
10065   I=1
10066   IF((STR(SI).EQ.0))GOTO 10067
        IF((STR(SI).EQ.224))GOTO 10067
        IF((STR(SI).EQ.222))GOTO 10067
          IF((STR(SI).NE.192))GOTO 10068
            SI=SI+(1)
10068     IF((STR(SI).EQ.0))GOTO 10069
            BUF(I)=STR(SI)
10069     SI=SI+(1)
          I=I+(1)
        GOTO 10066
10067   BUF(I)=0
        FLAG=0
        VAL=MOD(HPFAA0-HPLAA0+128,128)+HLINE0-1
10070   IF((HISTH0(VAL,SUB).EQ.-3))GOTO 10071
          P=SUB
          C=LSGETC(P,C)
10072     IF((C.EQ.160))GOTO 10074
          IF((C.EQ.137))GOTO 10074
          GOTO 10073
10074       C=LSGETC(P,C)
          GOTO 10072
10073     I=1
10075     IF((BUF(I).EQ.0))GOTO 10076
          IF((BUF(I).NE.C))GOTO 10076
            C=LSGETC(P,C)
            I=I+(1)
          GOTO 10075
10076     IF((BUF(I).NE.0))GOTO 10077
            FLAG=1
            GOTO 10071
10077     CALL LSFREE(SUB,10000)
          VAL=VAL-(1)
        GOTO 10070
10071   IF((FLAG.NE.0))GOTO 10078
          CALL ERRMSG(COM,POS,'history item not found.')
          HISTL0=-3
          RETURN
10078 CONTINUE
10046 IF((STR(SI).EQ.0))GOTO 10079
      IF((STR(SI).EQ.224))GOTO 10079
      IF((STR(SI).EQ.222))GOTO 10079
        CALL ERRMSG(COM,POS+SI-1,'illegal history token.')
        HISTL0=-3
        RETURN
10079 IF((STR(SI).NE.0))GOTO 10080
        HISTL0=-2
        RETURN
10080 IF((STR(SI).NE.224))GOTO 10081
        SI=SI+(1)
        IF((STR(SI).LT.176))GOTO 10083
        IF((STR(SI).GT.185))GOTO 10083
        GOTO 10082
10083   IF((STR(SI).EQ.173))GOTO 10082
        IF((STR(SI).EQ.164))GOTO 10082
          CALL ERRMSG(COM,POS+SI-1,'illegal argument history.')
          CALL LSFREE(SUB,10000)
          HISTL0=-3
          RETURN
10082   P=SUB
        LAST=-1
        CALL HISTA0(P,LEN)
10084   IF((LEN.LE.0))GOTO 10085
          LAST=LAST+(1)
          C=LSPOS(P,LEN+1)
10086     IF((C.EQ.160))GOTO 10088
          IF((C.EQ.137))GOTO 10088
          GOTO 10087
10088       C=LSPOS(P,2)
          GOTO 10086
10087     CALL HISTA0(P,LEN)
        GOTO 10084
10085   IF((STR(SI).NE.173))GOTO 10089
          VAL=1
          GOTO 10090
10089     IF((STR(SI).LT.176))GOTO 10091
          IF((STR(SI).GT.185))GOTO 10091
            VAL=MIN0(CTOI(STR,SI),LAST+1)
            GOTO 10092
10091       VAL=LAST
            IF((STR(SI).EQ.0))GOTO 10093
              SI=SI+(1)
10093     CONTINUE
10092   CONTINUE
10090   I=VAL
        GOTO 10096
10094   I=I-(1)
10096   IF((I.LE.0))GOTO 10095
          CALL HISTA0(SUB,LEN)
          CALL LSDEL(SUB,1,LEN)
        GOTO 10094
10095   P=SUB
        LOC=0
        C=LSGETC(P,C)
10097   IF((C.EQ.160))GOTO 10099
        IF((C.EQ.137))GOTO 10099
        GOTO 10098
10099     C=LSGETC(P,C)
          LOC=LOC+(1)
        GOTO 10097
10098   CALL LSDEL(SUB,1,LOC)
        IF((STR(SI).NE.173))GOTO 10100
          SI=SI+(1)
          IF((STR(SI).LT.176))GOTO 10101
          IF((STR(SI).GT.185))GOTO 10101
            VAL=MIN0(CTOI(STR,SI),LAST)-VAL+1
            GOTO 10102
10101       VAL=LAST-VAL+1
            IF((STR(SI).EQ.0))GOTO 10103
              SI=SI+(1)
10103     CONTINUE
10102     P=SUB
          LOC=0
          CALL HISTA0(P,LEN)
10104     IF((VAL.LE.0))GOTO 10105
          IF((LEN.LE.0))GOTO 10105
            VAL=VAL-(1)
            LOC=LOC+(LEN)
            CALL LSPOS(P,LEN+1)
            CALL HISTA0(P,LEN)
          GOTO 10104
10105     CALL LSDEL(SUB,LOC+1,10000)
          GOTO 10106
10100     CALL HISTA0(SUB,LEN)
          CALL LSDEL(SUB,LEN+1,10000)
10106 CONTINUE
10081 IF((STR(SI).EQ.0))GOTO 10107
      IF((STR(SI).EQ.222))GOTO 10107
        CALL ERRMSG(COM,POS+SI-1,'illegal history token.')
        CALL LSFREE(SUB,10000)
        HISTL0=-3
        RETURN
10107 IF((STR(SI).NE.0))GOTO 10108
        HISTL0=-2
        RETURN
10108 CONTINUE
10109 IF((STR(SI).NE.222))GOTO 10110
        I=1
        SI=SI+(1)
        FLAG=0
10111   IF((STR(SI).EQ.0))GOTO 10112
        IF((STR(SI).EQ.222))GOTO 10112
          IF((STR(SI).NE.192))GOTO 10113
            SI=SI+(1)
10113     IF((STR(SI).EQ.0))GOTO 10114
            BUF(I)=STR(SI)
10114     I=I+(1)
          IF((STR(SI).EQ.0))GOTO 10111
            SI=SI+(1)
10115   GOTO 10111
10112   BUF(I)=0
        I=1
        IF((STR(SI).EQ.0))GOTO 10116
          SI=SI+(1)
10116   CONTINUE
10117   IF((STR(SI).EQ.0))GOTO 10118
        IF((STR(SI).EQ.222))GOTO 10118
          IF((STR(SI).NE.192))GOTO 10119
            SI=SI+(1)
10119     IF((STR(SI).EQ.0))GOTO 10120
            REP(I)=STR(SI)
10120     I=I+(1)
          IF((STR(SI).EQ.0))GOTO 10117
            SI=SI+(1)
10121   GOTO 10117
10118   NULL=0
        LEN=I-1
        REP(I)=0
        CALL LSMAKE(RP,REP)
        IF((LEN.NE.0))GOTO 10122
          NULL=1
10122   IF((STR(SI).NE.222))GOTO 10123
          SI=SI+(1)
10123   IF((STR(SI).EQ.231))GOTO 10125
        IF((STR(SI).EQ.199))GOTO 10125
        GOTO 10124
10125     FLAG=1
          SI=SI+(1)
10124   LOC=1
        P=SUB
        C=LSGETC(P,C)
        SP=P
10126   IF((C.EQ.0))GOTO 10127
          I=1
10128     IF((C.EQ.0))GOTO 10129
          IF((C.EQ.BUF(I)))GOTO 10129
            LOC=LOC+(1)
            C=LSGETC(P,C)
            SP=P
          GOTO 10128
10129     CONTINUE
10130     IF((C.EQ.0))GOTO 10131
          IF((BUF(I).EQ.0))GOTO 10131
          IF((C.NE.BUF(I)))GOTO 10131
            C=LSGETC(P,C)
            I=I+(1)
          GOTO 10130
10131     IF((BUF(I).NE.0))GOTO 10132
            CALL LSDEL(SUB,LOC,I-1)
            IF((NULL.NE.0))GOTO 10133
              CALL LSINS(SUB,LOC-1,RP,1,10000)
10133       IF((FLAG.NE.0))GOTO 10134
              GOTO 10127
10134       LOC=LOC+(LEN)
            GOTO 10126
10132       P=SP
            C=LSGETC(P,C)
            LOC=LOC+(1)
            SP=P
10135   GOTO 10126
10127   CALL LSFREE(RP,10000)
      GOTO 10109
10110 HISTL0=-2
      RETURN
      END
      INTEGER FUNCTION HISTH0(HP,SUB)
      INTEGER SUB
      INTEGER HP
      INTEGER HPTRA0(128)
      INTEGER HBUFA0(4096)
      INTEGER HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HONAA0
      COMMON /HISTCM/HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HPTRA0,HBUFA0,HO
     *NAA0
      INTEGER P
      INTEGER BUF(102)
      INTEGER I,J,MAX,HVAL
      INTEGER AAAAC0(1)
      DATA AAAAC0/0/
      MAX=MOD(HPFAA0-HPLAA0+128,128)+HLINE0-1
      IF((HP.LT.HLINE0))GOTO 10137
      IF((HP.GT.MAX))GOTO 10137
      GOTO 10136
10137   HISTH0=-3
        RETURN
10136 CALL LSMAKE(SUB,AAAAC0)
      HVAL=MOD(HP-HLINE0+HPLAA0-1,128)+1
      I=HPTRA0(HVAL)
      GOTO 10140
10138 CONTINUE
10140 IF((HBUFA0(I).EQ.0))GOTO 10139
        J=1
10141   IF((HBUFA0(I).EQ.0))GOTO 10142
        IF((J.GE.102))GOTO 10142
          BUF(J)=HBUFA0(I)
          I=MOD(I,4096)+1
          J=J+(1)
        GOTO 10141
10142   BUF(J)=0
        CALL LSMAKE(P,BUF)
        CALL LSJOIN(SUB,P)
      GOTO 10138
10139 HISTH0=-2
      RETURN
      END
      SUBROUTINE HISTA0(PTR,LEN)
      INTEGER PTR
      INTEGER LEN
      INTEGER P
      INTEGER C
      INTEGER LSGETC
      INTEGER PAREN,BRACK0,BRACE,SQUOTE,DQUOTE,SKIP
      INTEGER AAAAD0
      INTEGER AAAAE0
      P=PTR
      LEN=0
      SKIP=0
      PAREN=0
      BRACE=0
      SQUOTE=0
      DQUOTE=0
      BRACK0=0
10143   LEN=LEN+(1)
        C=LSGETC(P,C)
10144   IF((SKIP.NE.0))GOTO 10145
        IF((C.EQ.160))GOTO 10146
        IF((C.EQ.137))GOTO 10146
        GOTO 10145
10146     C=LSGETC(P,C)
          LEN=LEN+(1)
        GOTO 10144
10145   SKIP=1
        AAAAD0=C
        GOTO 10147
10148     IF((SQUOTE.NE.0))GOTO 10150
          IF((DQUOTE.NE.0))GOTO 10150
            PAREN=PAREN+(1)
10149   GOTO 10150
10151     IF((SQUOTE.NE.0))GOTO 10150
          IF((DQUOTE.NE.0))GOTO 10150
            PAREN=PAREN-(1)
10152   GOTO 10150
10153     IF((SQUOTE.NE.0))GOTO 10150
          IF((DQUOTE.NE.0))GOTO 10150
            BRACE=BRACE+(1)
10154   GOTO 10150
10155     IF((SQUOTE.NE.0))GOTO 10150
          IF((DQUOTE.NE.0))GOTO 10150
            BRACE=BRACE-(1)
10156   GOTO 10150
10157     IF((SQUOTE.NE.0))GOTO 10150
          IF((DQUOTE.NE.0))GOTO 10150
            BRACK0=BRACK0+(1)
10158   GOTO 10150
10159     IF((SQUOTE.NE.0))GOTO 10150
          IF((DQUOTE.NE.0))GOTO 10150
            BRACK0=BRACK0-(1)
10160   GOTO 10150
10161     IF((DQUOTE.NE.0))GOTO 10150
            SQUOTE=1-SQUOTE
10162   GOTO 10150
10163     IF((SQUOTE.NE.0))GOTO 10150
            DQUOTE=1-DQUOTE
10164   GOTO 10150
10147   AAAAE0=AAAAD0-161
        GOTO(10163,10165,10165,10165,10165,10161,10148,10151),AAAAE0
        AAAAE0=AAAAD0-218
        GOTO(10157,10165,10159),AAAAE0
        AAAAE0=AAAAD0-250
        GOTO(10153,10165,10155),AAAAE0
10165   CONTINUE
10150 CONTINUE
      IF((C.EQ.0))GOTO 10166
      IF((C.EQ.160))GOTO 10168
      IF((C.EQ.137))GOTO 10168
      GOTO 10143
10168 IF((PAREN.NE.0))GOTO 10143
      IF((BRACE.NE.0))GOTO 10143
      IF((BRACK0.NE.0))GOTO 10143
      IF((SQUOTE.NE.0))GOTO 10143
      IF((DQUOTE.NE.0))GOTO 10143
      GOTO 10166
10166 CONTINUE
      LEN=LEN-(1)
      RETURN
      END
      INTEGER FUNCTION HISTT0(FILE)
      INTEGER FILE(1)
      INTEGER HPTRA0(128)
      INTEGER HBUFA0(4096)
      INTEGER HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HONAA0
      COMMON /HISTCM/HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HPTRA0,HBUFA0,HO
     *NAA0
      INTEGER FD
      INTEGER STATUS
      INTEGER OPEN
      INTEGER WRITEF
      FD=OPEN(FILE,2)
      IF((FD.NE.-3))GOTO 10169
        HISTT0=-3
        RETURN
10169 STATUS=-2
      IF((WRITEF(128,1,FD).EQ.1))GOTO 10170
        STATUS=-3
10170 IF((STATUS.NE.-2))GOTO 10171
      IF((WRITEF(4096,1,FD).EQ.1))GOTO 10171
        STATUS=-3
10171 IF((STATUS.NE.-2))GOTO 10172
      IF((WRITEF(HBFAA0,1,FD).EQ.1))GOTO 10172
        STATUS=-3
10172 IF((STATUS.NE.-2))GOTO 10173
      IF((WRITEF(HBLAA0,1,FD).EQ.1))GOTO 10173
        STATUS=-3
10173 IF((STATUS.NE.-2))GOTO 10174
      IF((WRITEF(HPFAA0,1,FD).EQ.1))GOTO 10174
        STATUS=-3
10174 IF((STATUS.NE.-2))GOTO 10175
      IF((WRITEF(HPLAA0,1,FD).EQ.1))GOTO 10175
        STATUS=-3
10175 IF((STATUS.NE.-2))GOTO 10176
      IF((WRITEF(HPTRA0,128,FD).EQ.128))GOTO 10176
        STATUS=-3
10176 IF((STATUS.NE.-2))GOTO 10177
      IF((WRITEF(HBUFA0,4096,FD).EQ.4096))GOTO 10177
        STATUS=-3
10177 IF((STATUS.NE.-3))GOTO 10178
        CALL REWIND(FD)
10178 CALL TRUNC(FD)
      CALL CLOSE(FD)
      HISTT0=STATUS
      RETURN
      END
      INTEGER FUNCTION HISTR0(FILE)
      INTEGER FILE(1)
      INTEGER HPTRA0(128)
      INTEGER HBUFA0(4096)
      INTEGER HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HONAA0
      COMMON /HISTCM/HBFAA0,HBLAA0,HPFAA0,HPLAA0,HLINE0,HPTRA0,HBUFA0,HO
     *NAA0
      INTEGER FD
      INTEGER STATUS,JUNK
      INTEGER OPEN
      INTEGER READF
      FD=OPEN(FILE,1)
      IF((FD.NE.-3))GOTO 10179
        HISTR0=-3
        RETURN
10179 STATUS=-2
      IF((READF(JUNK,1,FD).NE.1))GOTO 10181
      IF((JUNK.NE.128))GOTO 10181
      GOTO 10180
10181   STATUS=-3
10180 IF((STATUS.NE.-2))GOTO 10182
      IF((READF(JUNK,1,FD).NE.1))GOTO 10183
      IF((JUNK.NE.4096))GOTO 10183
      GOTO 10182
10183   STATUS=-3
10182 IF((STATUS.NE.-2))GOTO 10184
      IF((READF(HBFAA0,1,FD).EQ.1))GOTO 10184
        STATUS=-3
10184 IF((STATUS.NE.-2))GOTO 10185
      IF((READF(HBLAA0,1,FD).EQ.1))GOTO 10185
        STATUS=-3
10185 IF((STATUS.NE.-2))GOTO 10186
      IF((READF(HPFAA0,1,FD).EQ.1))GOTO 10186
        STATUS=-3
10186 IF((STATUS.NE.-2))GOTO 10187
      IF((READF(HPLAA0,1,FD).EQ.1))GOTO 10187
        STATUS=-3
10187 IF((STATUS.NE.-2))GOTO 10188
      IF((READF(HPTRA0,128,FD).EQ.128))GOTO 10188
        STATUS=-3
10188 IF((STATUS.NE.-2))GOTO 10189
      IF((READF(HBUFA0,4096,FD).EQ.4096))GOTO 10189
        STATUS=-3
10189 CALL CLOSE(FD)
      HISTR0=STATUS
      RETURN
      END
C ---- Long Name Map ----
C forgetcmd                      forge0
C installationcmd                insta0
C setupports                     setuq0
C singlestep                     singl0
C timecmd                        timec0
C reserveport                    reser0
C searchfor                      searc0
C loginnamecmd                   logio0
C histsave                       histt0
C whencmd                        whenc0
C executenode                    execv0
C putbackcommand                 putba0
C results                        resul0
C getneta                        getne0
C initports                      initp0
C lookuplabel                    looku0
C dropcmd                        dropc0
C checklabels                    check0
C dumpcmd                        dumpc0
C dumpports                      dumpp0
C histinit                       histi0
C selectport                     selec0
C argstocmd                      argst0
C histlook                       histl0
C makeportlist                   makep0
C cleanupports                   clean0
C getnexttoken                   getng0
C histcmd                        histc0
C initconnect                    initc0
C nextunquotedchar               nextu0
C nextwhiletoken                 nextw0
C createlabel                    creat0
C gotocmd                        gotoc0
C Hbf                            hbfaa0
C clrargs                        clrar0
C enterlabel                     enter0
C exitcmd                        exitd0
C loginfo                        login0
C shtracecmd                     shtra0
C varscmd                        varsc0
C restorestate                   resto0
C vpsdcmd                        vpsdc0
C assigniports                   assig0
C histarg                        hista0
C execute                        execu0
C findlabel                      findl0
C makeiport                      makei0
C symboltrace                    symbo0
C Hbl                            hblaa0
C Hline                          hline0
C histrest                       histr0
C indexcmd                       index0
C primoscmd                      primo0
C subseen                        subse0
C whilecmd                       while0
C clrports                       clrpo0
C initlabels                     initl0
C savestate                      saves0
C assignoports                   assih0
C histget                        histh0
C nargscmd                       nargs0
C makeoport                      makeo0
C Hptr                           hptra0
C getelement                     getel0
C stopcmd                        stopc0
C casecmd                        casec0
C stoplogging                    stopl0
C Hpf                            hpfaa0
C invokevar                      invom0
C datecmd                        datec0
C accessarg                      acces0
C echocmd                        echoc0
C invokeint                      invol0
C substrcmd                      subst0
C declarecmd                     decla0
C nettrace                       nettr0
C getnetlabel                    getnf0
C Hpl                            hplaa0
C histfind                       histf0
C histsub                        hists0
C Hon                            honaa0
C exitcasecmd                    exitc0
C histfree                       histg0
C histque                        histq0
C redirector                     redir0
C invokeext                      invok0
C takecmd                        takec0
C context                        conte0
C histexp                        histe0
C setupargs                      setup0
C clrlabels                      clrla0
C evalcmd                        evalc0
C evalnetsep                     evaln0
C linecmd                        linec0
C repeatcmd                      repea0
C bracket                        brack0
C elsecmd                        elsec0
C removecn                       remov0
C nodesepr                       nodes0
C initargs                       inita0
C initializeeverything           initi0
C processhello                   proce0
C command                        comma0
C assignports                    assii0
C filetype                       filet0
C quotecmd                       quote0
C Hbuf                           hbufa0
C argscmd                        argsc0
C argument                       argum0
C declaredcmd                    declb0
C startlogging                   start0
