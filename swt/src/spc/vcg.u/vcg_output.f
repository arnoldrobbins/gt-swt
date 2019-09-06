      SUBROUTINE PUTIN0(CODE)
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
      INTEGER I
      INTEGER AAAAA0
      I=CODE
10000   AAAAA0=IMEMA0(I)
        GOTO 10001
10002     CALL OUT$04(I)
        GOTO 10003
10004     CALL OUT$03(I)
        GOTO 10003
10005     CALL OUT$01(I)
        GOTO 10003
10006     CALL OUT$02(I)
        GOTO 10003
10007     CALL OUT$05(I)
        GOTO 10003
10001   GOTO(10004,10005,10006,10002,10007),AAAAA0
          CALL PANIC('put_instr: bad instr type (*i)*n.',IMEMA0(I))
10003   I=IMEMA0(I+1)
      IF((I.NE.CODE))GOTO 10000
      RETURN
      END
      SUBROUTINE OUT$03(INSTR)
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
      INTEGER INS,BRAD(5),BRADDR,BRCODE
      INTEGER BRLAB0
      INTEGER POSN(39)
      INTEGER TEXT(252)
      INTEGER STR(20)
      DATA TEXT/1,-15486,194,195,197,209,0,2,-15483,194,195,199,197,0,3,
     *-15487,194,195,199,212,0,4,-15488,194,195,204,197,0,5,-15484,194,1
     *95,204,212,0,6,-15485,194,195,206,197,0,7,-15419,194,195,210,0,8,-
     *15420,194,195,211,0,9,-15908,194,196,216,0,10,-15916,194,196,217,0
     *,11,-15990,194,197,209,0,12,-15478,194,198,197,209,0,13,-15475,194
     *,198,199,197,0,14,-15479,194,198,199,212,0,15,-15480,194,198,204,1
     *97,0,16,-15476,194,198,204,212,0,17,-15477,194,198,206,197,0,18,-1
     *5987,194,199,197,0,19,-15991,194,199,212,0,20,-15652,194,201,216,0
     *,21,-15660,194,201,217,0,22,-15992,194,204,197,0,23,-15934,194,204
     *,197,209,0,24,-15987,194,204,199,197,0,25,-15935,194,204,199,212,0
     *,26,-15936,194,204,204,197,0,27,-15988,194,204,204,212,0,28,-15933
     *,194,204,206,197,0,29,-15417,194,204,210,0,30,-15418,194,204,211,0
     *,31,-15988,194,204,212,0,32,-15486,194,205,197,209,0,33,-15482,194
     *,205,199,197,0,34,-15416,194,205,199,212,0,35,-15415,194,205,204,1
     *97,0,36,-15417,194,205,204,212,0,37,-15485,194,205,206,197,0,38,-1
     *5989,194,206,197,0/
      DATA POSN/38,1,8,15,22,29,36,43,49,55,61,67,73,80,87,94,101,108,11
     *5,121,127,133,139,145,152,159,166,173,180,187,193,199,205,212,219,
     *226,233,240,247/
      BRLAB0=IMEMA0(INSTR+4)
      INS=IMEMA0(INSTR+3)
      IF((INS.LT.1))GOTO 10009
      IF((INS.GT.38))GOTO 10009
      GOTO 10008
10009   CALL PANIC('put_branch: bad instr code *i*n.',INS)
10008 IF((EMITP0.NE.1))GOTO 10010
        CALL PUTCH(160,OUTFI0)
        CALL PUTLIN(TEXT(POSN(INS+1)+2),OUTFI0)
        STR(1)=160
        STR(2)=204
        CALL GITOC(BRLAB0,STR(3),18,-10)
        CALL PUTLIN(STR,OUTFI0)
        CALL PUTCH(223,OUTFI0)
        CALL PUTCH(138,OUTFI0)
10010 IF((EMITO0.NE.1))GOTO 10011
        BRCODE=TEXT(POSN(INS+1)+1)
        BRAD(1)=10
        BRAD(2)=:000000
        BRAD(3)=BRLAB0
        CALL OTG(1,BRAD,BRCODE,:777)
10011 RETURN
      END
      SUBROUTINE OUT$01(INSTR)
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
      INTEGER POSN(54)
      INTEGER TEXT(331)
      INTEGER MRAD(5),INS,I,ILIT,MRCODE
      INTEGER STR(20)
      INTEGER * 4 LLIT
      REAL FLIT
      REAL * 8 DLIT
      INTEGER DPSTR(20)
      INTEGER J
      INTEGER AAAAB0
      INTEGER AAAAC0
      INTEGER AAAAD0(3)
      INTEGER AAAAE0(3)
      INTEGER AAAAF0(4)
      INTEGER AAAAG0(4)
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0(20)
      INTEGER AAAAK0
      INTEGER AAAAL0
      EQUIVALENCE (MRAD(2),ILIT),(MRAD(2),LLIT),(MRAD(2),FLIT),(MRAD(2),
     *DLIT)
      DATA TEXT/1,6,193,196,196,0,2,198,193,196,204,0,3,3,193,206,193,0,
     *4,195,193,206,204,0,5,9,195,193,211,0,6,201,195,204,211,0,7,134,19
     *6,198,193,196,0,8,137,196,198,195,211,0,9,143,196,198,196,214,0,10
     *,130,196,198,204,196,0,11,653,196,198,204,216,0,12,142,196,198,205
     *,208,0,13,135,196,198,211,194,0,14,132,196,198,211,212,0,15,15,196
     *,201,214,0,16,207,196,214,204,0,17,65,197,193,204,0,18,139,197,193
     *,204,194,0,19,138,197,193,216,194,0,20,5,197,210,193,0,21,197,197,
     *210,204,0,22,70,198,193,196,0,23,73,198,195,211,0,24,79,198,196,21
     *4,0,25,66,198,204,196,0,26,589,198,204,216,0,27,78,198,205,208,0,2
     *8,71,198,211,194,0,29,68,198,211,212,0,30,11,201,205,193,0,31,10,2
     *01,210,211,0,32,1,202,205,208,0,33,8,202,211,212,0,34,733,202,211,
     *216,0,35,140,202,211,216,194,0,36,12,202,211,217,0,37,2,204,196,19
     *3,0,38,194,204,196,204,0,39,321,204,196,204,210,0,40,541,204,196,2
     *16,0,41,605,204,196,217,0,42,206,205,208,204,0,43,14,205,208,217,0
     *,44,131,207,210,193,0,45,136,208,195,204,0,46,199,211,194,204,0,47
     *,4,211,212,193,0,48,196,211,212,204,0,49,67,211,212,204,210,0,50,5
     *25,211,212,216,0,51,669,211,212,217,0,52,7,211,213,194,0,53,129,21
     *6,197,195,0/
      DATA POSN/53,1,7,13,19,25,31,37,44,51,58,65,72,79,86,93,99,105,111
     *,118,125,131,137,143,149,155,161,167,173,179,185,191,197,203,209,2
     *15,222,228,234,240,247,253,259,265,271,277,283,289,295,301,308,314
     *,320,326/
      DATA AAAAD0/172,216,0/
      DATA AAAAE0/172,170,0/
      DATA AAAAF0/172,170,216,0/
      DATA AAAAG0/172,216,170,0/
      INS=IMEMA0(INSTR+3)
      IF((INS.LT.1))GOTO 10014
      IF((INS.GT.53))GOTO 10014
      GOTO 10013
10014   CALL PANIC('put_mr: bad instr code *i*n.',INS)
10013 J=INSTR+4
      I=1
      GOTO 10017
10015 I=I+(1)
      J=J+(1)
10017 IF((I.GT.5))GOTO 10016
        MRAD(I)=IMEMA0(J)
      GOTO 10015
10016 IF((EMITP0.NE.1))GOTO 10018
        CALL PUTCH(160,OUTFI0)
        CALL PUTLIN(TEXT(POSN(INS+1)+2),OUTFI0)
        CALL PUTCH(160,OUTFI0)
        AAAAC0=MRAD(1)
        GOTO 10019
10020     AAAAB0=1
          GOTO 10012
10023     AAAAB0=2
          GOTO 10012
10024     CALL PUTLIN(AAAAD0,OUTFI0)
        GOTO 10022
10025     AAAAB0=3
          GOTO 10012
10026     CALL PUTLIN(AAAAE0,OUTFI0)
        GOTO 10022
10027     AAAAB0=4
          GOTO 10012
10028     CALL PUTLIN(AAAAF0,OUTFI0)
        GOTO 10022
10029     AAAAB0=5
          GOTO 10012
10030     CALL PUTLIN(AAAAG0,OUTFI0)
        GOTO 10022
10031     STR(1)=189
          STR(2)=167
          CALL GITOC(ILIT,STR(3),18,-8)
          CALL PUTLIN(STR,OUTFI0)
        GOTO 10022
10032     STR(1)=189
          STR(2)=167
          CALL GLTOC(LLIT,STR(3),18,-8)
          CALL PUTLIN(STR,OUTFI0)
          CALL PUTCH(204,OUTFI0)
        GOTO 10022
10033     CALL RTOC(DLIT,DPSTR,20,-11)
          I=1
          GOTO 10036
10034     I=I+(1)
10036     IF((DPSTR(I).EQ.0))GOTO 10035
            IF((DPSTR(I).NE.229))GOTO 10034
              DPSTR(I)=197
10037     GOTO 10034
10035     I=1
          GOTO 10040
10038     I=I+(1)
10040     IF((DPSTR(I).NE.160))GOTO 10039
          GOTO 10038
10039     CALL PUTCH(189,OUTFI0)
          CALL PUTLIN(DPSTR(I),OUTFI0)
        GOTO 10022
10041     CALL DTOC(DLIT,DPSTR,20,-11)
          I=1
          GOTO 10044
10042     I=I+(1)
10044     IF((DPSTR(I).EQ.0))GOTO 10043
            IF((DPSTR(I).NE.229))GOTO 10042
              DPSTR(I)=196
10045     GOTO 10042
10043     I=1
          GOTO 10048
10046     I=I+(1)
10048     IF((DPSTR(I).NE.160))GOTO 10047
          GOTO 10046
10047     CALL PUTCH(189,OUTFI0)
          CALL PUTLIN(DPSTR(I),OUTFI0)
        GOTO 10022
10049     STR(1)=204
          CALL GITOC(MRAD(3),STR(2),19,-10)
          CALL PUTLIN(STR,OUTFI0)
          CALL PUTCH(223,OUTFI0)
        GOTO 10022
10022     CALL PUTCH(138,OUTFI0)
        GOTO 10050
10019   GOTO(10020,10023,10025,10027,10029,10031,10032,10033,10041,10049
     *),AAAAC0
          CALL PANIC('put_mr: bad instr operand *i*n.',MRAD(1))
10050 CONTINUE
10018 IF((EMITO0.NE.1))GOTO 10051
        CALL ZEROL0(MRAD)
        MRCODE=TEXT(POSN(INS+1)+1)
        AAAAH0=INS
        GOTO 10052
10053     IF((MRAD(1).NE.10))GOTO 10055
            MRAD(2)=:000000
10054   GOTO 10055
10056     MRAD(2)=:000002
        GOTO 10055
10052   AAAAI0=AAAAH0-31
        GOTO(10053,10053,10053,10053,10053,10057,10057,10057,10057,10057
     *,10057,10057,10057,10056),AAAAI0
10057   CONTINUE
10055   CALL OTG(2,MRAD,MRCODE)
10051 RETURN
10012 AAAAK0=MRAD(2)
      GOTO 10058
10059   AAAAJ0(1)=208
      GOTO 10060
10061   AAAAJ0(1)=211
      GOTO 10060
10062   AAAAJ0(1)=204
      GOTO 10060
10063   AAAAJ0(1)=216
      GOTO 10060
10058 AAAAL0=AAAAK0+1
      GOTO(10059,10061,10062,10063),AAAAL0
10060 AAAAJ0(2)=194
      AAAAJ0(3)=165
      AAAAJ0(4)=171
      AAAAJ0(5)=167
      CALL GITOC(MRAD(3),AAAAJ0(6),15,-8)
      CALL PUTLIN(AAAAJ0,OUTFI0)
      GOTO 10064
10064 GOTO(10022,10024,10026,10028,10030),AAAAB0
      GOTO 10064
      END
      SUBROUTINE OUT$02(INSTR)
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
      INTEGER STR(20)
      INTEGER LABEL0
      INTEGER LAD(5)
      INTEGER AAAAM0(8)
      DATA AAAAM0/223,160,197,209,213,160,170,0/
      LABEL0=IMEMA0(INSTR+3)
      IF((EMITP0.NE.1))GOTO 10065
        STR(1)=204
        CALL GITOC(LABEL0,STR(2),19,-10)
        CALL PUTLIN(STR,OUTFI0)
        CALL PUTLIN(AAAAM0,OUTFI0)
        CALL PUTCH(138,OUTFI0)
10065 IF((EMITO0.NE.1))GOTO 10066
        LAD(1)=10
        LAD(2)=0
        LAD(3)=LABEL0
        CALL OTG(3,LAD)
10066 RETURN
      END
      SUBROUTINE OUT$04(INSTR)
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
      INTEGER INS,GENOP0,DUMMY0(5)
      INTEGER POSN(107)
      INTEGER TEXT(677)
      INTEGER AAAAN0
      DATA TEXT/1,-15738,193,177,193,0,2,-16188,193,178,193,0,3,389,193,
     *210,199,212,0,4,-15832,195,193,204,0,5,-15836,195,193,210,0,6,-163
     *64,195,200,211,0,7,716,195,199,212,0,8,-16127,195,205,193,0,9,-163
     *52,195,210,193,0,10,-16371,195,210,194,0,11,-15612,195,210,197,0,1
     *2,-16376,195,210,204,0,13,-15608,195,210,204,197,0,14,-16176,195,2
     *11,193,0,15,-16004,196,198,195,205,0,16,-16248,196,210,216,0,17,-1
     *6004,198,195,205,0,18,-16370,198,196,194,204,0,19,3,198,201,206,0,
     *20,-16038,198,204,212,193,0,21,-16035,198,204,212,204,0,22,-16036,
     *198,210,206,0,23,-16051,198,211,199,212,0,24,-16052,198,211,204,19
     *7,0,25,-16054,198,211,205,201,0,26,-16055,198,211,206,218,0,27,-16
     *053,198,211,208,204,0,28,-16056,198,211,218,197,0,29,129,201,193,1
     *94,0,30,-15648,201,195,193,0,31,-15776,201,195,204,0,32,-15712,201
     *,195,210,0,33,-15604,201,204,197,0,34,-16039,201,206,212,193,0,35,
     *-16037,201,206,212,204,0,36,-16308,201,210,216,0,37,-15549,204,195
     *,197,209,0,38,-15548,204,195,199,197,0,39,-15547,204,195,199,212,0
     *,40,-15551,204,195,204,197,0,41,-15552,204,195,204,212,0,42,-15550
     *,204,195,206,197,0,43,-16117,204,197,209,0,44,-16114,204,198,0,45,
     *-15797,204,198,197,209,0,46,-15796,204,198,199,197,0,47,-15795,204
     *,198,199,212,0,48,-15799,204,198,204,197,0,49,-15800,204,198,204,2
     *12,0,50,-15798,204,198,206,197,0,51,-16116,204,199,197,0,52,-16115
     *,204,199,212,0,53,1,204,201,206,203,0,54,-16119,204,204,197,0,55,-
     *15541,204,204,197,209,0,56,-16116,204,204,199,197,0,57,-15539,204,
     *204,199,212,0,58,-15543,204,204,204,197,0,59,-16120,204,204,204,21
     *2,0,60,-15542,204,204,206,197,0,61,-16120,204,204,212,0,62,-16118,
     *204,206,197,0,63,-16113,204,212,0,64,1,206,207,208,0,65,77,208,201
     *,196,193,0,66,197,208,201,196,204,0,67,133,208,201,205,193,0,68,19
     *3,208,201,205,204,0,69,2,208,210,207,195,0,70,393,208,210,212,206,
     *0,71,-16256,210,195,194,0,72,-16312,211,177,193,0,73,-16184,211,17
     *8,193,0,74,-32592,211,193,210,0,75,-32080,211,193,211,0,76,-16000,
     *211,195,194,0,77,-32624,211,199,212,0,78,-32768,211,203,208,0,79,-
     *32112,211,204,197,0,80,-32192,211,204,206,0,81,-32704,211,204,218,
     *0,82,-32000,211,205,201,0,83,-32224,211,206,218,0,84,-32512,211,20
     *8,204,0,85,-32767,211,210,195,0,86,-32255,211,211,195,0,87,-16064,
     *211,211,205,0,88,-16320,211,211,208,0,89,717,211,212,197,216,0,90,
     *20,211,212,208,205,0,91,325,211,214,195,0,92,-32736,211,218,197,0,
     *93,-16180,212,193,194,0,94,525,212,193,203,0,95,-16060,212,193,216
     *,0,96,-16059,212,193,217,0,97,-15996,212,194,193,0,98,-16121,212,1
     *95,193,0,99,-15736,212,195,204,0,100,723,212,198,204,204,0,101,517
     *,212,203,193,0,102,721,212,204,198,204,0,103,-15844,212,216,193,0,
     *104,-15788,212,217,193,0,105,-16316,216,195,193,0,106,-16252,216,1
     *95,194,0/
      DATA POSN/106,1,7,13,20,26,32,38,44,50,56,62,68,74,81,87,94,100,10
     *6,113,119,126,133,139,146,153,160,167,174,181,187,193,199,205,211,
     *218,225,231,238,245,252,259,266,273,279,284,291,298,305,312,319,32
     *6,332,338,345,351,358,365,372,379,386,393,399,405,410,416,423,430,
     *437,444,451,458,464,470,476,482,488,494,500,506,512,518,524,530,53
     *6,542,548,554,560,566,573,580,586,592,598,604,610,616,622,628,634,
     *641,647,654,660,666,672/
      INS=IMEMA0(INSTR+3)
      IF((INS.LT.1))GOTO 10068
      IF((INS.GT.106))GOTO 10068
      GOTO 10067
10068   CALL PANIC('put_generic: bad instr code *i*n.',INS)
10067 IF((EMITP0.NE.1))GOTO 10069
        CALL PUTCH(160,OUTFI0)
        CALL PUTLIN(TEXT(POSN(INS+1)+2),OUTFI0)
        CALL PUTCH(138,OUTFI0)
10069 IF((EMITO0.NE.1))GOTO 10070
        GENOP0=TEXT(POSN(INS+1)+1)
        AAAAN0=INS
        GOTO 10071
10072     CALL OTG(6,DUMMY0,GENOP0)
        GOTO 10073
10071   IF(AAAAN0.EQ.19)GOTO 10072
        IF(AAAAN0.EQ.53)GOTO 10072
        IF(AAAAN0.EQ.69)GOTO 10072
          CALL OTG(4,DUMMY0,GENOP0)
10073 CONTINUE
10070 RETURN
      END
      SUBROUTINE OUT$05(INSTR)
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
      INTEGER RTRPOS(32),RTRTE0(281)
      COMMON /RTR$CM/RTRPOS,RTRTE0
      INTEGER I,AD(5),ILIT,J,INS,SHFTC0,ECBIN0(5),DUMMY(5),MODE
      INTEGER * 4 LLIT
      REAL FLIT
      REAL * 8 DLIT
      INTEGER DPSTR(20)
      INTEGER AAAAO0
      INTEGER POSN(17)
      INTEGER TEXT(23)
      INTEGER AAAAP0
      INTEGER AAAAQ0(46)
      INTEGER AAAAR0(16)
      INTEGER AAAAS0(38)
      INTEGER AAAAT0(10)
      INTEGER AAAAU0(10)
      INTEGER AAAAV0(10)
      INTEGER AAAAW0(10)
      INTEGER AAAAX0(10)
      INTEGER AAAAY0(10)
      INTEGER AAAAZ0(9)
      INTEGER AAABA0(15)
      INTEGER AAABB0(9)
      INTEGER AAABC0(10)
      INTEGER AAABD0(10)
      INTEGER AAABE0(15)
      INTEGER AAABF0(14)
      INTEGER AAABG0(16)
      INTEGER AAABH0(14)
      INTEGER AAABI0(17)
      INTEGER AAABJ0(5)
      INTEGER AAABK0
      INTEGER AAABL0(8)
      INTEGER AAABM0(9)
      INTEGER AAABN0(4)
      INTEGER AAABO0(4)
      INTEGER AAABP0(9)
      INTEGER AAABQ0
      INTEGER AAABR0
      INTEGER AAABS0
      INTEGER AAABT0
      INTEGER AAABU0
      INTEGER AAABV0(10)
      EQUIVALENCE (AD(1),ECBIN0(1))
      EQUIVALENCE (ILIT,AD(2)),(LLIT,ILIT),(FLIT,ILIT),(DLIT,ILIT)
      DATA TEXT/1,2,3,17152,4,5,6,7,8,16896,9,16640,10,16384,11,12,13,1,
     *14,15,16704,16,16448/
      DATA POSN/16,1,2,3,5,6,7,8,9,11,13,15,16,17,19,20,22/
      DATA AAAAQ0/204,170,172,173,177,176,233,223,160,197,195,194,160,20
     *4,170,172,173,177,176,233,223,172,172,211,194,165,171,167,170,172,
     *173,184,233,172,170,233,172,167,170,172,173,184,233,170,238,0/
      DATA AAAAR0/160,197,193,204,160,204,170,172,173,177,176,233,223,17
     *0,238,0/
      DATA AAAAS0/160,211,212,204,160,211,194,165,171,177,184,170,238,16
     *0,204,196,193,160,189,167,180,176,176,176,170,238,160,211,212,193,
     *165,160,211,194,165,170,238,0/
      DATA AAAAT0/160,193,204,204,160,170,233,170,238,0/
      DATA AAAAU0/160,204,204,204,160,170,233,170,238,0/
      DATA AAAAV0/160,193,210,204,160,170,233,170,238,0/
      DATA AAAAW0/160,204,210,204,160,170,233,170,238,0/
      DATA AAAAX0/160,193,210,211,160,170,233,170,238,0/
      DATA AAAAY0/160,204,210,211,160,170,233,170,238,0/
      DATA AAAAZ0/160,201,208,160,170,243,170,238,0/
      DATA AAABA0/160,201,208,160,204,170,172,173,177,176,233,223,170,23
     *8,0/
      DATA AAABB0/160,201,208,160,170,243,170,238,0/
      DATA AAABC0/160,197,216,212,160,170,243,170,238,0/
      DATA AAABD0/160,197,216,212,160,170,243,170,238,0/
      DATA AAABE0/160,196,193,212,193,160,167,170,172,173,184,233,170,23
     *8,0/
      DATA AAABF0/160,194,211,218,160,167,170,172,173,184,233,170,238,0/
      DATA AAABG0/160,196,193,195,160,204,170,172,173,177,176,233,223,17
     *0,238,0/
      DATA AAABH0/160,202,205,208,163,160,170,170,171,170,233,170,238,0/
      DATA AAABI0/160,202,205,208,163,160,204,170,172,173,177,176,233,22
     *3,170,238,0/
      DATA AAABJ0/160,193,208,160,0/
      DATA AAABL0/189,167,170,172,173,184,233,0/
      DATA AAABM0/189,167,170,172,173,184,236,204,0/
      DATA AAABN0/189,170,243,0/
      DATA AAABO0/189,170,243,0/
      DATA AAABP0/204,170,172,173,177,176,233,223,0/
      DATA AAABV0/194,165,171,167,170,172,173,184,233,0/
      INS=IMEMA0(INSTR+3)
      IF((INS.NE.1))GOTO 10075
        CALL PUTENT(SMEMA0(IMEMA0(INSTR+4)),IMEMA0(INSTR+5))
        CALL WARNI0('ENT emitted in middle of output stream*n.')
        RETURN
10075 IF((EMITP0.NE.1))GOTO 10076
        AAAAP0=INS
        GOTO 10077
10078     CALL PRINT(OUTFI0,AAAAQ0,IMEMA0(INSTR+4),IMEMA0(INSTR+5),IMEMA
     *0(INSTR+6),IMEMA0(INSTR+7),IMEMA0(INSTR+8))
        GOTO 10079
10080     CALL PRINT(OUTFI0,AAAAR0,IMEMA0(INSTR+4))
          CALL PRINT(OUTFI0,AAAAS0)
        GOTO 10079
10081     CALL PRINT(OUTFI0,AAAAT0,IMEMA0(INSTR+4))
        GOTO 10079
10082     CALL PRINT(OUTFI0,AAAAU0,IMEMA0(INSTR+4))
        GOTO 10079
10083     CALL PRINT(OUTFI0,AAAAV0,IMEMA0(INSTR+4))
        GOTO 10079
10084     CALL PRINT(OUTFI0,AAAAW0,IMEMA0(INSTR+4))
        GOTO 10079
10085     CALL PRINT(OUTFI0,AAAAX0,IMEMA0(INSTR+4))
        GOTO 10079
10086     CALL PRINT(OUTFI0,AAAAY0,IMEMA0(INSTR+4))
        GOTO 10079
10087     IF((IMEMA0(INSTR+4).NE.:707))GOTO 10088
            CALL MAPSTR(SMEMA0(IMEMA0(INSTR+5)),2)
            CALL PRINT(OUTFI0,AAAAZ0,SMEMA0(IMEMA0(INSTR+5)))
            GOTO 10079
10088       CALL PRINT(OUTFI0,AAABA0,IMEMA0(INSTR+5))
10089   GOTO 10079
10090     CALL PRINT(OUTFI0,AAABB0,RTRTE0(RTRPOS(IMEMA0(INSTR+4)+1)+1))
        GOTO 10079
10091     CALL MAPSTR(SMEMA0(IMEMA0(INSTR+4)),2)
          CALL PRINT(OUTFI0,AAABC0,SMEMA0(IMEMA0(INSTR+4)))
        GOTO 10079
10092     CALL PRINT(OUTFI0,AAABD0,RTRTE0(RTRPOS(IMEMA0(INSTR+4)+1)+1))
        GOTO 10079
10093     CALL PRINT(OUTFI0,AAABE0,IMEMA0(INSTR+4))
        GOTO 10079
10094     CALL PRINT(OUTFI0,AAABF0,IMEMA0(INSTR+4))
        GOTO 10079
10095     CALL PRINT(OUTFI0,AAABG0,IMEMA0(INSTR+4))
        GOTO 10079
10096     CALL PRINT(OUTFI0,AAABH0,IMEMA0(INSTR+4))
        GOTO 10079
10097     CALL PRINT(OUTFI0,AAABI0,IMEMA0(INSTR+4))
        GOTO 10079
10098     CALL PRINT(OUTFI0,AAABJ0)
          I=INSTR+6
          J=1
          GOTO 10101
10099     I=I+(1)
          J=J+(1)
10101     IF((J.GT.5))GOTO 10100
            AD(J)=IMEMA0(I)
          GOTO 10099
10100     AAABK0=AD(1)
          GOTO 10102
10103       AAAAO0=1
            GOTO 10074
10106       CALL PRINT(OUTFI0,AAABL0,ILIT)
          GOTO 10105
10107       CALL PRINT(OUTFI0,AAABM0,LLIT)
          GOTO 10105
10108       CALL RTOC(DLIT,DPSTR,20,-11)
            I=1
            GOTO 10111
10109       I=I+(1)
10111       IF((DPSTR(I).EQ.0))GOTO 10110
              IF((DPSTR(I).NE.229))GOTO 10109
                DPSTR(I)=197
10112       GOTO 10109
10110       I=1
            GOTO 10115
10113       I=I+(1)
10115       IF((DPSTR(I).NE.160))GOTO 10114
            GOTO 10113
10114       CALL PRINT(OUTFI0,AAABN0,DPSTR(I))
          GOTO 10105
10116       CALL DTOC(DLIT,DPSTR,20,-11)
            I=1
            GOTO 10119
10117       I=I+(1)
10119       IF((DPSTR(I).EQ.0))GOTO 10118
              IF((DPSTR(I).NE.229))GOTO 10117
                DPSTR(I)=196
10120       GOTO 10117
10118       I=1
            GOTO 10123
10121       I=I+(1)
10123       IF((DPSTR(I).NE.160))GOTO 10122
            GOTO 10121
10122       CALL PRINT(OUTFI0,AAABO0,DPSTR(I))
          GOTO 10105
10124       CALL PRINT(OUTFI0,AAABP0,AD(3))
          GOTO 10105
10102     GOTO(10103,10125,10103,10125,10125,10106,10107,10108,10116,   
     *  10124),AAABK0
10125       CALL WARNI0('*i: bad ad mode for ap*n.',AD(1))
            RETURN
10105     IF((AD(1).EQ.3))GOTO 10127
          IF((IMEMA0(INSTR+4).EQ.1))GOTO 10127
          IF((IMEMA0(INSTR+5).EQ.1))GOTO 10127
          GOTO 10126
10127       CALL PUTCH(172,OUTFI0)
10126     IF((AD(1).NE.3))GOTO 10128
            CALL PUTCH(170,OUTFI0)
10128     IF((IMEMA0(INSTR+4).NE.1))GOTO 10129
            CALL PUTCH(211,OUTFI0)
10129     IF((IMEMA0(INSTR+5).NE.1))GOTO 10130
            CALL PUTCH(204,OUTFI0)
10130     CALL PUTCH(138,OUTFI0)
        GOTO 10079
10077   AAABQ0=AAAAP0-1
        GOTO(10078,10081,10087,10091,10093,10094,10082,10083,10084,10098
     *,10096,10097,10095,10085,10086,10080,10131,10092,10090),AAABQ0
10131     CALL PANIC('put_misc: bad instr code *i*n.',IMEMA0(INSTR+3))
10079 CONTINUE
10076 IF((EMITO0.NE.1))GOTO 10132
        AAABR0=INS
        GOTO 10133
10134     AD(1)=10
          AD(2)=:000002
          AD(3)=IMEMA0(INSTR+4)
          CALL OTG(3,AD)
          ECBIN0(1)=IMEMA0(INSTR+5)
          ECBIN0(2)=IMEMA0(INSTR+8)
          ECBIN0(3)=IMEMA0(INSTR+6)
          ECBIN0(4)=IMEMA0(INSTR+7)
          ECBIN0(5)=-256
          CALL OTG(5,ECBIN0,2,:014000)
        GOTO 10135
10136     AD(1)=10
          AD(2)=:000002
          AD(3)=IMEMA0(INSTR+4)
          CALL OTG(2,AD,:0101)
          AD(1)=1
          AD(2)=:000001
          AD(3)=18
          CALL OTG(2,AD,:0304)
          AD(1)=6
          AD(2)=:04000
          CALL OTG(2,AD,:0002)
          AD(1)=1
          AD(2)=:000001
          AD(3)=0
          CALL OTG(2,AD,:0004)
        GOTO 10135
10137     SHFTC0=IMEMA0(INSTR+4)
          CALL OTG(5,AD,TEXT(POSN(INS+1)+1),SHFTC0)
        GOTO 10135
10138     IF((IMEMA0(INSTR+4).NE.:707))GOTO 10139
            CALL MAPSTR(SMEMA0(IMEMA0(INSTR+5)),2)
            CALL OTG(5,SMEMA0(IMEMA0(INSTR+5)),4,:707)
            GOTO 10135
10139       AD(1)=10
            AD(2)=:000002
            AD(3)=IMEMA0(INSTR+5)
            CALL OTG(5,AD,4,:7070)
10140   GOTO 10135
10141     CALL OTG(5,RTRTE0(RTRPOS(IMEMA0(INSTR+4)+1)+1),4,:707)
        GOTO 10135
10142     CALL MAPSTR(SMEMA0(IMEMA0(INSTR+4)),2)
          CALL OTG(5,SMEMA0(IMEMA0(INSTR+4)),5)
        GOTO 10135
10143     CALL OTG(5,RTRTE0(RTRPOS(IMEMA0(INSTR+4)+1)+1),5)
        GOTO 10135
10144     CALL OTG(5,DUMMY,6,IMEMA0(INSTR+4))
        GOTO 10135
10145     CALL OTG(5,DUMMY,7,IMEMA0(INSTR+4))
        GOTO 10135
10146     AD(1)=10
          AD(2)=:000000
          AD(3)=IMEMA0(INSTR+4)
          CALL OTG(5,AD,14)
        GOTO 10135
10147     CALL OTG(5,DUMMY,12,IMEMA0(INSTR+4))
        GOTO 10135
10148     AD(1)=10
          AD(2)=:000000
          AD(3)=IMEMA0(INSTR+4)
          CALL OTG(1,AD,TEXT(POSN(INS+1)+1),:111)
        GOTO 10135
10149     I=INSTR+6
          J=1
          GOTO 10152
10150     I=I+(1)
          J=J+(1)
10152     IF((J.GT.5))GOTO 10151
            AD(J)=IMEMA0(I)
          GOTO 10150
10151     IF((AD(1).EQ.4))GOTO 10154
          IF((AD(1).EQ.5))GOTO 10154
          GOTO 10153
10154       CALL WARNI0('in put_misc: bad addr mode for ap*n.')
            RETURN
10153     IF((AD(1).NE.3))GOTO 10155
            MODE=4
            GOTO 10156
10155       MODE=0
10156     IF((IMEMA0(INSTR+4).NE.1))GOTO 10157
            MODE=MODE+(2)
10157     IF((IMEMA0(INSTR+5).NE.1))GOTO 10158
            MODE=MODE+(1)
10158     CALL ZEROL0(AD)
          CALL OTG(5,AD,11,MODE)
        GOTO 10135
10133   AAABS0=AAABR0-1
        GOTO(10134,10137,10138,10142,10144,10145,10137,10137,10137,10149
     *,10147,10148,10146,10137,10137,10136,10159,10143,10141),AAABS0
10159     CALL PANIC('put_misc: bad instr code *i*n.',IMEMA0(INSTR+3))
10135 CONTINUE
10132 RETURN
10074 AAABT0=AD(2)
      GOTO 10160
10161   CALL PUTCH(208,OUTFI0)
      GOTO 10162
10163   CALL PUTCH(211,OUTFI0)
      GOTO 10162
10164   CALL PUTCH(204,OUTFI0)
      GOTO 10162
10165   CALL PUTCH(216,OUTFI0)
      GOTO 10162
10160 AAABU0=AAABT0+1
      GOTO(10161,10163,10164,10165),AAABU0
        CALL PANIC('put_misc: bad base reg*n.')
10162 CALL PRINT(OUTFI0,AAABV0,AD(3))
      GOTO 10105
      END
      SUBROUTINE ZEROL0(AD)
      INTEGER AD(5)
      INTEGER AAABW0
      INTEGER AAABX0
      AAABW0=AD(1)
      GOTO 10167
10168   AD(3)=0
        AD(4)=0
        AD(5)=0
      GOTO 10169
10170   AD(4)=0
        AD(5)=0
      GOTO 10169
10171   AD(4)=0
        AD(5)=0
      GOTO 10169
10167 AAABX0=AAABW0-5
      GOTO(10168,10170,10171),AAABX0
10169 RETURN
      END
      SUBROUTINE PUTENT(EXTNA0,OBJID)
      INTEGER EXTNA0(1)
      INTEGER OBJID
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
      INTEGER ADDR(5),LOOKX0
      INTEGER AAABY0(19)
      DATA AAABY0/160,197,206,212,160,170,243,172,204,170,172,173,177,17
     *6,233,223,170,238,0/
      IF((EMITP0.NE.1))GOTO 10172
        CALL PRINT(OUTFI0,AAABY0,EXTNA0,OBJID)
10172 IF((EMITO0.NE.1))GOTO 10173
        CALL OTG(5,EXTNA0,1,OBJID)
10173 RETURN
      END
      SUBROUTINE PUTMO0
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
      INTEGER DUMMY(1)
      INTEGER AAABZ0(21)
      DATA AAABZ0/160,211,197,199,170,238,160,210,204,201,212,170,238,16
     *0,211,217,205,204,170,238,0/
      IF((EMITP0.NE.1))GOTO 10174
        CALL PRINT(OUTFI0,AAABZ0)
10174 IF((EMITO0.NE.1))GOTO 10175
        CALL OTG(6,DUMMY,5)
10175 RETURN
      END
      SUBROUTINE PUTST0
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
      INTEGER DUMMY(1)
      IF((EMITO0.NE.1))GOTO 10176
        CALL OTG(6,DUMMY,6)
10176 RETURN
      END
      SUBROUTINE PUTMP0
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
      INTEGER DUMMY(1)
      INTEGER AAACA0(7)
      DATA AAACA0/160,197,206,196,170,238,0/
      IF((EMITP0.NE.1))GOTO 10177
        CALL PRINT(OUTFI0,AAACA0)
10177 IF((EMITO0.NE.1))GOTO 10178
        CALL OTG(6,DUMMY,4)
10178 RETURN
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
C enterlit                       enteu0
C generatestaticstuff            geneu0
C loadchecklower                 loadg0
C loaddefinestat                 loado0
C loadreturn                     loaer0
C setupswitch                    setuq0
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
C loadnot                        loaef0
C loadpreinc                     loaem0
C otg$rorglb                     otg$t0
C dummyad                        dummy0
C loadlabel                      loady0
C voidpostdec                    voidp0
C rtrtext                        rtrte0
C extname                        extna0
C framecom                       frame0
C generateprocedures             genet0
C genswitch                      gensw0
C loaddeclarestat                loadm0
C otglabel                       otgla0
C reachobject                    reacl0
C rshiftaby                      rshif0
C Breaksp                        break0
C Stream1                        strea0
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
C labelid                        label0
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
C getextaddr                     getex0
C lookupobj                      lookx0
C otg$rorg                       otg$s0
C reachselect                    reacm0
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
C brlabel                        brlab0
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
C ecbinfo                        ecbin0
C enterobj                       entev0
C loadgoto                       loadw0
C loadmulaa                      loaec0
C loadswitch                     loafc0
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
C shftcount                      shftc0
C otg$apins                      otg$b0
C genopcode                      genop0
C clearinstr                     cleat0
C clearlink                      cleav0
C flowconvert                    flowc0
C flowsand                       flows0
C loadfieldasgop                 loadu0
C otg$data                       otg$f0
C otg$xtip                       otg$x0
C putinstr                       putin0
C voidassign                     voidb0
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
C afieldmask                     afiel0
C flowsor                        flowu0
C generateentries                gener0
C loaddefinedynm                 loadn0
