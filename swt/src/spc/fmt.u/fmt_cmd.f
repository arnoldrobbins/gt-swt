      SUBROUTINE COMAND(BUF)
      INTEGER BUF(1)
      COMMON /COUT/OUTPA0,OUTWA0,OUTWD0,OUTBU0(1454)
      INTEGER OUTPA0,OUTWA0,OUTWD0
      INTEGER OUTBU0
      COMMON /CPAGE/START0,ENDPA0,CURPA0,NEWPA0,LINEN0,PLVAL0,M1VAL0,M2V
     *AL0,M3VAL0,M4VAL0,BOTTO0,EVENH0(1454),ODDHE0(1454),EVENF0(1454),OD
     *DFO0(1454)
      INTEGER START0,ENDPA0,CURPA0,NEWPA0,LINEN0,PLVAL0,M1VAL0,M2VAL0,M3
     *VAL0,M4VAL0,BOTTO0
      INTEGER EVENH0,ODDHE0,EVENF0,ODDFO0
      COMMON /CPARAM/FILLA0,NOSPA0,ADJUS0,DVFLA0,TIWID0,POVAL0,MOVAL0,IN
     *VAL0,TIVAL0,LMVAL0,RMVAL0,BFVAL0,CEVAL0,ULVAL0,LSVAL0,OOVAL0,EOVAL
     *0,ITVAL0
      INTEGER FILLA0,NOSPA0,ADJUS0,DVFLA0,TIWID0,POVAL0,MOVAL0,INVAL0,TI
     *VAL0,LMVAL0,RMVAL0,BFVAL0,CEVAL0,ULVAL0,LSVAL0,OOVAL0,EOVAL0,ITVAL
     *0
      COMMON /CMISC/HYPHE0,EXTRB0,NOBRE0,WORDL0,FPTRA0,FLIST0(100),FTYPE
     *0(100),OLIST0(100),OUTFI0,NEXTA0,TABSA0(134),NUMRE0(200),MCOUT0,MC
     *CHA0,TMCCH0,CMDCH0,NBCCH0,REPLC0,TABCH0,FILEN0(180)
      INTEGER HYPHE0,EXTRB0,NOBRE0,WORDL0,FPTRA0,FLIST0,FTYPE0,OLIST0,OU
     *TFI0,NEXTA0,TABSA0,NUMRE0,MCOUT0
      INTEGER MCCHA0,TMCCH0,CMDCH0,NBCCH0,REPLC0,TABCH0,FILEN0
      COMMON /CMACRO/MACLV0,ARGVA0(100),ARGTO0,FIRST0,MACTO0,MACBU0(5000
     *0),ARGBU0(1000)
      INTEGER MACLV0,ARGVA0,ARGTO0,FIRST0,MACTO0
      INTEGER MACBU0,ARGBU0
      COMMON /COPTS/STOPM0
      INTEGER STOPM0
      COMMON /TABCOM/COMTA0,FNTAB0,SPCHA0
      INTEGER COMTA0,FNTAB0,SPCHA0
      COMMON /DS$MEM/MEMAA0(4090)
      INTEGER MEMAA0
      INTEGER I,ARGTYP,CT,SPVAL,VAL,VAL2,NEED
      INTEGER COMTYP,GETVAL,DOMAC,ESC,GETSTR,CTOI
      INTEGER TITLE(1454),TBUF(1454)
      INTEGER AAAAA0
      CT=COMTYP(BUF)
      VAL=GETVAL(BUF,ARGTYP)
      IF((DOMAC(BUF).NE.-2))GOTO 10000
        GOTO 10001
10000   AAAAA0=CT
        GOTO 10002
10003     CALL BRK
          FILLA0=1
        GOTO 10004
10005     CALL BRK
          FILLA0=0
        GOTO 10004
10006     NOBRE0=0
          CALL BRK
        GOTO 10004
10007     CALL SET(LSVAL0,VAL,ARGTYP,1,1,10000)
        GOTO 10004
10008     CALL BRK
          IF((LINEN0.LE.0))GOTO 10009
            CALL SPACE(10000)
10009     CALL SET(NEWPA0,VAL,ARGTYP,NEWPA0,-10000,10000)
        GOTO 10004
10010     CALL BRK
          IF((LINEN0.LE.0))GOTO 10011
            CALL SPACE(10000)
10011     I=1
10012     IF((BUF(I).EQ.160))GOTO 10013
          IF((BUF(I).EQ.137))GOTO 10013
          IF((BUF(I).EQ.138))GOTO 10013
          IF((BUF(I).EQ.0))GOTO 10013
            I=I+(1)
          GOTO 10012
10013     CONTINUE
10014     IF((BUF(I).NE.160))GOTO 10015
            I=I+(1)
          GOTO 10014
10015     VAL=CTOI(BUF,I)
10016     IF((BUF(I).NE.160))GOTO 10017
            I=I+(1)
          GOTO 10016
10017     VAL2=CTOI(BUF,I)
          IF((VAL2.GT.0))GOTO 10018
            VAL2=NEWPA0
10018     I=MOD(NEWPA0,VAL2)
          GOTO 10021
10019     I=I+(1)
10021     IF((I.GE.VAL))GOTO 10004
            CALL SPACE(10000)
          GOTO 10019
10022     CALL BRK
          IF((NOSPA0.NE.0))GOTO 10004
            CALL SET(SPVAL,VAL,ARGTYP,1,0,10000)
            CALL SPACE(SPVAL)
10023   GOTO 10004
10024     CALL BRK
          CALL SET(INVAL0,VAL,ARGTYP,0,0,RMVAL0-1)
          TIVAL0=INVAL0
        GOTO 10004
10025     CALL BRK
          CALL SET(RMVAL0,VAL,ARGTYP,60,TIVAL0+1,134-2)
          CALL SET(TIWID0,RMVAL0-LMVAL0+1,176,TIWID0,0,10000)
        GOTO 10004
10026     CALL BRK
          CALL SET(TIVAL0,VAL,ARGTYP,0,0,RMVAL0)
        GOTO 10004
10027     CALL BRK
          CALL SET(CEVAL0,VAL,ARGTYP,1,0,10000)
        GOTO 10004
10028     CALL SET(ITVAL0,VAL,ARGTYP,1,0,10000)
        GOTO 10004
10029     CALL SET(ULVAL0,VAL,ARGTYP,1,0,10000)
        GOTO 10004
10030     CALL GETSTR(BUF,EVENH0,1454)
          CALL SCOPY(EVENH0,1,ODDHE0,1)
        GOTO 10004
10031     CALL GETSTR(BUF,EVENF0,1454)
          CALL SCOPY(EVENF0,1,ODDFO0,1)
        GOTO 10004
10032     CALL SET(PLVAL0,VAL,ARGTYP,66,M1VAL0+M2VAL0+M3VAL0+M4VAL0+1,10
     *000)
          BOTTO0=PLVAL0-M3VAL0-M4VAL0
        GOTO 10004
10033     CALL SET(BFVAL0,VAL,ARGTYP,1,0,10000)
        GOTO 10004
10034     IF((GETSTR(BUF,FILEN0,180).LE.0))GOTO 10004
            CALL NEWINP(FILEN0)
10035   GOTO 10004
10036     CALL DEFMAC(BUF)
        GOTO 10004
10038     CALL SETTAB(BUF)
        GOTO 10004
10039     CALL GETSC(BUF,TABCH0,137)
        GOTO 10004
10040     CALL GETSC(BUF,CMDCH0,174)
        GOTO 10004
10041     CALL GETSC(BUF,NBCCH0,224)
        GOTO 10004
10042     HYPHE0=1
        GOTO 10004
10043     HYPHE0=0
        GOTO 10004
10044     IF((NOSPA0.NE.0))GOTO 10004
            CALL BRK
            NEED=0
            CALL SET(NEED,VAL,ARGTYP,1,0,10000)
            IF((LINEN0+NEED-1.LE.BOTTO0))GOTO 10046
            IF((LINEN0.LE.0))GOTO 10046
              CALL SPACE(10000)
10046     CONTINUE
10045   GOTO 10004
10047     CALL BRK
          CALL SET(POVAL0,VAL,ARGTYP,0,0,10000)
        GOTO 10004
10048     CALL BRK
          CALL SET(OOVAL0,VAL,ARGTYP,0,-10000,10000)
        GOTO 10004
10049     CALL BRK
          CALL SET(EOVAL0,VAL,ARGTYP,0,-10000,10000)
        GOTO 10004
10050     CALL BRK
          CALL SET(LMVAL0,VAL,ARGTYP,1,1,RMVAL0)
          CALL SET(TIWID0,RMVAL0-LMVAL0+1,176,TIWID0,0,10000)
        GOTO 10004
10051     I=1
10052     IF((BUF(I).EQ.160))GOTO 10053
          IF((BUF(I).EQ.137))GOTO 10053
          IF((BUF(I).EQ.138))GOTO 10053
          IF((BUF(I).EQ.0))GOTO 10053
            I=I+(1)
          GOTO 10052
10053     CONTINUE
10054     IF((BUF(I).NE.160))GOTO 10055
            I=I+(1)
          GOTO 10054
10055     IF((BUF(I).EQ.167))GOTO 10057
          IF((BUF(I).EQ.162))GOTO 10057
          GOTO 10060
10057       I=I+(1)
10056     GOTO 10060
10058     I=I+(1)
10060     IF((BUF(I).EQ.138))GOTO 10004
          IF((BUF(I).EQ.0))GOTO 10004
            CALL PUTCH(ESC(BUF,I),-15)
          GOTO 10058
10061     CALL SET(TIWID0,VAL,ARGTYP,60,1,10000)
        GOTO 10004
10062     CALL BRK
          CALL GETSTR(BUF,TITLE,1454)
          CALL MKTL(TITLE,CURPA0,TBUF,1454)
          CALL PUT(TBUF)
        GOTO 10004
10063     CALL GETSC(BUF,REPLC0,32)
        GOTO 10004
10064     CALL GETSC(BUF,ADJUS0,226)
          IF((ADJUS0.EQ.236))GOTO 10004
          IF((ADJUS0.EQ.242))GOTO 10004
          IF((ADJUS0.EQ.227))GOTO 10004
            ADJUS0=226
10065   GOTO 10004
10066     ADJUS0=236
        GOTO 10004
10067     NOSPA0=1
        GOTO 10004
10068     NOSPA0=0
        GOTO 10004
10069     CALL SET(NEWPA0,VAL,ARGTYP,NEWPA0,-10000,10000)
        GOTO 10004
10070     CALL BRK
          CALL RESET0
          CALL SWT
10071     CALL RESET0
          IF((GETSTR(BUF,FILEN0,180).LE.0))GOTO 10072
            CALL NEWINP(FILEN0)
            GOTO 10004
10072       IF((GETARG(NEXTA0,FILEN0,180).EQ.-1))GOTO 10074
              NEXTA0=NEXTA0+(1)
              CALL NEWINP(FILEN0)
              GOTO 10075
10074         CALL SWT
10075     CONTINUE
10073   GOTO 10004
10076     EXTRB0=1
        GOTO 10004
10077     EXTRB0=0
        GOTO 10004
10078     CALL SET(M1VAL0,VAL,ARGTYP,3,0,PLVAL0-M2VAL0-M3VAL0-M4VAL0-1)
        GOTO 10004
10079     CALL SET(M2VAL0,VAL,ARGTYP,2,0,PLVAL0-M1VAL0-M3VAL0-M4VAL0-1)
        GOTO 10004
10080     CALL SET(M3VAL0,VAL,ARGTYP,2,0,PLVAL0-M1VAL0-M2VAL0-M4VAL0-1)
          BOTTO0=PLVAL0-M3VAL0-M4VAL0
        GOTO 10004
10081     CALL SET(M4VAL0,VAL,ARGTYP,3,0,PLVAL0-M1VAL0-M2VAL0-M3VAL0-1)
          BOTTO0=PLVAL0-M3VAL0-M4VAL0
        GOTO 10004
10082     CALL BRK
          IF((GETSTR(BUF,FILEN0,180).LE.0))GOTO 10083
            DVFLA0=1
            CALL NEWOUT(FILEN0)
            GOTO 10004
10083       DVFLA0=0
10084   GOTO 10004
10085     CALL GETSC(BUF,MCCHA0,160)
          IF((MCCHA0.NE.160))GOTO 10087
          IF((OUTPA0.GT.1))GOTO 10086
          IF((MCOUT0.NE.1))GOTO 10086
          GOTO 10087
10087       TMCCH0=MCCHA0
10086     MCOUT0=0
        GOTO 10004
10089     CALL SET(MOVAL0,VAL,ARGTYP,0,0,10000)
        GOTO 10004
10090     CALL GETSTR(BUF,ODDHE0,1454)
        GOTO 10004
10091     CALL GETSTR(BUF,ODDFO0,1454)
        GOTO 10004
10092     CALL GETSTR(BUF,EVENH0,1454)
        GOTO 10004
10093     CALL GETSTR(BUF,EVENF0,1454)
        GOTO 10004
10094     CALL CHKIF(BUF)
        GOTO 10004
10095     CALL APNDM0(BUF)
        GOTO 10004
10002   GOTO(10064,10033,10008,10006,10041,10040,10027,10036,10082,10093
     *,10092,10004,10051,10070,10003,10031,10030,10042,10024,10050,10007
     *,10061,10078,10079,10080,10081,10085,10089,10066,10044,10005,10043
     *,10067,10071,10091,10090,10032,10069,10047,10063,10025,10068,10077
     *,10034,10022,10038,10039,10026,10062,10029,10076,10010,10048,10049
     *,10094,10095,10028),AAAAA0
          IF((CT.NE.-1))GOTO 10096
            GOTO 10097
10096       CALL TEXT(BUF)
10097   CONTINUE
10004 CONTINUE
10001 RETURN
      END
      INTEGER FUNCTION COMTYP(BUF)
      INTEGER BUF(134)
      COMMON /COUT/OUTPA0,OUTWA0,OUTWD0,OUTBU0(1454)
      INTEGER OUTPA0,OUTWA0,OUTWD0
      INTEGER OUTBU0
      COMMON /CPAGE/START0,ENDPA0,CURPA0,NEWPA0,LINEN0,PLVAL0,M1VAL0,M2V
     *AL0,M3VAL0,M4VAL0,BOTTO0,EVENH0(1454),ODDHE0(1454),EVENF0(1454),OD
     *DFO0(1454)
      INTEGER START0,ENDPA0,CURPA0,NEWPA0,LINEN0,PLVAL0,M1VAL0,M2VAL0,M3
     *VAL0,M4VAL0,BOTTO0
      INTEGER EVENH0,ODDHE0,EVENF0,ODDFO0
      COMMON /CPARAM/FILLA0,NOSPA0,ADJUS0,DVFLA0,TIWID0,POVAL0,MOVAL0,IN
     *VAL0,TIVAL0,LMVAL0,RMVAL0,BFVAL0,CEVAL0,ULVAL0,LSVAL0,OOVAL0,EOVAL
     *0,ITVAL0
      INTEGER FILLA0,NOSPA0,ADJUS0,DVFLA0,TIWID0,POVAL0,MOVAL0,INVAL0,TI
     *VAL0,LMVAL0,RMVAL0,BFVAL0,CEVAL0,ULVAL0,LSVAL0,OOVAL0,EOVAL0,ITVAL
     *0
      COMMON /CMISC/HYPHE0,EXTRB0,NOBRE0,WORDL0,FPTRA0,FLIST0(100),FTYPE
     *0(100),OLIST0(100),OUTFI0,NEXTA0,TABSA0(134),NUMRE0(200),MCOUT0,MC
     *CHA0,TMCCH0,CMDCH0,NBCCH0,REPLC0,TABCH0,FILEN0(180)
      INTEGER HYPHE0,EXTRB0,NOBRE0,WORDL0,FPTRA0,FLIST0,FTYPE0,OLIST0,OU
     *TFI0,NEXTA0,TABSA0,NUMRE0,MCOUT0
      INTEGER MCCHA0,TMCCH0,CMDCH0,NBCCH0,REPLC0,TABCH0,FILEN0
      COMMON /CMACRO/MACLV0,ARGVA0(100),ARGTO0,FIRST0,MACTO0,MACBU0(5000
     *0),ARGBU0(1000)
      INTEGER MACLV0,ARGVA0,ARGTO0,FIRST0,MACTO0
      INTEGER MACBU0,ARGBU0
      COMMON /COPTS/STOPM0
      INTEGER STOPM0
      COMMON /TABCOM/COMTA0,FNTAB0,SPCHA0
      INTEGER COMTA0,FNTAB0,SPCHA0
      COMMON /DS$MEM/MEMAA0(4090)
      INTEGER MEMAA0
      INTEGER LOOKUP
      INTEGER COMSTR(3)
      COMSTR(1)=BUF(2)
      COMSTR(2)=BUF(3)
      COMSTR(3)=0
      IF((LOOKUP(COMSTR,COMTYP,COMTA0).NE.0))GOTO 10098
        IF((COMSTR(1).NE.163))GOTO 10099
          COMTYP=-1
          GOTO 10100
10099     COMTYP=-2
10100 CONTINUE
10098 RETURN
      END
      SUBROUTINE PROCE0(INBUF)
      INTEGER INBUF(1454)
      COMMON /COUT/OUTPA0,OUTWA0,OUTWD0,OUTBU0(1454)
      INTEGER OUTPA0,OUTWA0,OUTWD0
      INTEGER OUTBU0
      COMMON /CPAGE/START0,ENDPA0,CURPA0,NEWPA0,LINEN0,PLVAL0,M1VAL0,M2V
     *AL0,M3VAL0,M4VAL0,BOTTO0,EVENH0(1454),ODDHE0(1454),EVENF0(1454),OD
     *DFO0(1454)
      INTEGER START0,ENDPA0,CURPA0,NEWPA0,LINEN0,PLVAL0,M1VAL0,M2VAL0,M3
     *VAL0,M4VAL0,BOTTO0
      INTEGER EVENH0,ODDHE0,EVENF0,ODDFO0
      COMMON /CPARAM/FILLA0,NOSPA0,ADJUS0,DVFLA0,TIWID0,POVAL0,MOVAL0,IN
     *VAL0,TIVAL0,LMVAL0,RMVAL0,BFVAL0,CEVAL0,ULVAL0,LSVAL0,OOVAL0,EOVAL
     *0,ITVAL0
      INTEGER FILLA0,NOSPA0,ADJUS0,DVFLA0,TIWID0,POVAL0,MOVAL0,INVAL0,TI
     *VAL0,LMVAL0,RMVAL0,BFVAL0,CEVAL0,ULVAL0,LSVAL0,OOVAL0,EOVAL0,ITVAL
     *0
      COMMON /CMISC/HYPHE0,EXTRB0,NOBRE0,WORDL0,FPTRA0,FLIST0(100),FTYPE
     *0(100),OLIST0(100),OUTFI0,NEXTA0,TABSA0(134),NUMRE0(200),MCOUT0,MC
     *CHA0,TMCCH0,CMDCH0,NBCCH0,REPLC0,TABCH0,FILEN0(180)
      INTEGER HYPHE0,EXTRB0,NOBRE0,WORDL0,FPTRA0,FLIST0,FTYPE0,OLIST0,OU
     *TFI0,NEXTA0,TABSA0,NUMRE0,MCOUT0
      INTEGER MCCHA0,TMCCH0,CMDCH0,NBCCH0,REPLC0,TABCH0,FILEN0
      COMMON /CMACRO/MACLV0,ARGVA0(100),ARGTO0,FIRST0,MACTO0,MACBU0(5000
     *0),ARGBU0(1000)
      INTEGER MACLV0,ARGVA0,ARGTO0,FIRST0,MACTO0
      INTEGER MACBU0,ARGBU0
      COMMON /COPTS/STOPM0
      INTEGER STOPM0
      COMMON /TABCOM/COMTA0,FNTAB0,SPCHA0
      INTEGER COMTA0,FNTAB0,SPCHA0
      COMMON /DS$MEM/MEMAA0(4090)
      INTEGER MEMAA0
      NOBRE0=0
      IF((INBUF(1).EQ.CMDCH0))GOTO 10102
      IF((INBUF(1).EQ.NBCCH0))GOTO 10102
      GOTO 10101
10102   IF((INBUF(1).NE.NBCCH0))GOTO 10103
          NOBRE0=1
10103   CALL COMAND(INBUF)
        GOTO 10104
10101   CALL TEXT(INBUF)
10104 RETURN
      END
      SUBROUTINE TEXT(INBUF)
      INTEGER INBUF(1454)
      COMMON /COUT/OUTPA0,OUTWA0,OUTWD0,OUTBU0(1454)
      INTEGER OUTPA0,OUTWA0,OUTWD0
      INTEGER OUTBU0
      COMMON /CPAGE/START0,ENDPA0,CURPA0,NEWPA0,LINEN0,PLVAL0,M1VAL0,M2V
     *AL0,M3VAL0,M4VAL0,BOTTO0,EVENH0(1454),ODDHE0(1454),EVENF0(1454),OD
     *DFO0(1454)
      INTEGER START0,ENDPA0,CURPA0,NEWPA0,LINEN0,PLVAL0,M1VAL0,M2VAL0,M3
     *VAL0,M4VAL0,BOTTO0
      INTEGER EVENH0,ODDHE0,EVENF0,ODDFO0
      COMMON /CPARAM/FILLA0,NOSPA0,ADJUS0,DVFLA0,TIWID0,POVAL0,MOVAL0,IN
     *VAL0,TIVAL0,LMVAL0,RMVAL0,BFVAL0,CEVAL0,ULVAL0,LSVAL0,OOVAL0,EOVAL
     *0,ITVAL0
      INTEGER FILLA0,NOSPA0,ADJUS0,DVFLA0,TIWID0,POVAL0,MOVAL0,INVAL0,TI
     *VAL0,LMVAL0,RMVAL0,BFVAL0,CEVAL0,ULVAL0,LSVAL0,OOVAL0,EOVAL0,ITVAL
     *0
      COMMON /CMISC/HYPHE0,EXTRB0,NOBRE0,WORDL0,FPTRA0,FLIST0(100),FTYPE
     *0(100),OLIST0(100),OUTFI0,NEXTA0,TABSA0(134),NUMRE0(200),MCOUT0,MC
     *CHA0,TMCCH0,CMDCH0,NBCCH0,REPLC0,TABCH0,FILEN0(180)
      INTEGER HYPHE0,EXTRB0,NOBRE0,WORDL0,FPTRA0,FLIST0,FTYPE0,OLIST0,OU
     *TFI0,NEXTA0,TABSA0,NUMRE0,MCOUT0
      INTEGER MCCHA0,TMCCH0,CMDCH0,NBCCH0,REPLC0,TABCH0,FILEN0
      COMMON /CMACRO/MACLV0,ARGVA0(100),ARGTO0,FIRST0,MACTO0,MACBU0(5000
     *0),ARGBU0(1000)
      INTEGER MACLV0,ARGVA0,ARGTO0,FIRST0,MACTO0
      INTEGER MACBU0,ARGBU0
      COMMON /COPTS/STOPM0
      INTEGER STOPM0
      COMMON /TABCOM/COMTA0,FNTAB0,SPCHA0
      INTEGER COMTA0,FNTAB0,SPCHA0
      COMMON /DS$MEM/MEMAA0(4090)
      INTEGER MEMAA0
      INTEGER I
      INTEGER GETWRD
      INTEGER WRDBUF(1454)
      IF((DVFLA0.NE.1))GOTO 10105
        CALL PUTLIN(INBUF,OUTFI0)
        RETURN
10105 IF((INBUF(1).EQ.160))GOTO 10107
      IF((INBUF(1).EQ.138))GOTO 10107
      GOTO 10106
10107   CALL LEADBL(INBUF)
10106 IF((ITVAL0.LE.0))GOTO 10108
        CALL ITALIC(INBUF,WRDBUF,1454,0)
        CALL CTOC(WRDBUF,INBUF,1454)
        ITVAL0=ITVAL0-(1)
10108 IF((ULVAL0.LE.0))GOTO 10109
        CALL UNDERL(INBUF,WRDBUF,1454,0)
        CALL CTOC(WRDBUF,INBUF,1454)
        ULVAL0=ULVAL0-(1)
10109 IF((BFVAL0.LE.0))GOTO 10110
        CALL BOFACE(INBUF,WRDBUF,1454)
        CALL CTOC(WRDBUF,INBUF,1454)
        BFVAL0=BFVAL0-(1)
10110 IF((CEVAL0.LE.0))GOTO 10111
        CALL CENTER(INBUF)
        CALL PUT(INBUF)
        CEVAL0=CEVAL0-(1)
        GOTO 10112
10111   IF((INBUF(1).NE.138))GOTO 10113
          CALL PUT(INBUF)
          GOTO 10114
10113     IF((FILLA0.NE.0))GOTO 10115
            CALL PUT(INBUF)
            GOTO 10116
10115       I=1
            GOTO 10119
10117       CONTINUE
10119       IF((GETWRD(INBUF,I,WRDBUF).LE.0))GOTO 10118
              CALL PUTWRD(WRDBUF)
            GOTO 10117
10118     CONTINUE
10116   CONTINUE
10114 CONTINUE
10112 RETURN
      END
C ---- Long Name Map ----
C Fill                           filla0
C Nbcch                          nbcch0
C Spchartable                    spcha0
C Cmdch                          cmdch0
C Curpag                         curpa0
C Newpag                         newpa0
C Olist                          olist0
C Tabs                           tabsa0
C Tabch                          tabch0
C Mactop                         macto0
C Lineno                         linen0
C Fntable                        fntab0
C Firstmacro                     first0
C Argv                           argva0
C chktrap                        chktr0
C Evenfooter                     evenf0
C Adjust                         adjus0
C Nobreak                        nobre0
C Bfval                          bfval0
C Ceval                          ceval0
C Argtop                         argto0
C M1val                          m1val0
C Numreg                         numre0
C M2val                          m2val0
C M3val                          m3val0
C Evenheader                     evenh0
C M4val                          m4val0
C Tmcch                          tmcch0
C Nospace                        nospa0
C Stopmode                       stopm0
C processline                    proce0
C Filename                       filen0
C Outbuf                         outbu0
C Bottom                         botto0
C Fptr                           fptra0
C Oddfooter                      oddfo0
C Wordlast                       wordl0
C Extrablankmode                 extrb0
C Eoval                          eoval0
C Macbuf                         macbu0
C Comtable                       comta0
C Mem                            memaa0
C findmac                        findm0
C Startpage                      start0
C Oddheader                      oddhe0
C Inval                          inval0
C apndmac                        apndm0
C Lmval                          lmval0
C Hyphenation                    hyphe0
C Dvflag                         dvfla0
C Mcch                           mccha0
C extractfcn                     extra0
C initialize                     initi0
C Outp                           outpa0
C Plval                          plval0
C Moval                          moval0
C Outfile                        outfi0
C Tival                          tival0
C Itval                          itval0
C Nextarg                        nexta0
C Argbuf                         argbu0
C Ooval                          ooval0
C resetfiles                     reset0
C Poval                          poval0
C Rmval                          rmval0
C Lsval                          lsval0
C Flist                          flist0
C Outwds                         outwd0
C Tiwidth                        tiwid0
C Ulval                          ulval0
C evalfcn                        evalf0
C Outw                           outwa0
C Endpage                        endpa0
C Replch                         replc0
C options                        optio0
C Ftype                          ftype0
C Mcout                          mcout0
C Maclvl                         maclv0