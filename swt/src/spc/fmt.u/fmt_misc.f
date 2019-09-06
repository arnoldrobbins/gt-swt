      SUBROUTINE CHKIF(BUF)
      INTEGER BUF(1)
      INTEGER I,NEGCO0,COND,J
      INTEGER MAC(134),DELIM
      INTEGER CTOI
      I=1
10000 IF((BUF(I).EQ.160))GOTO 10001
      IF((BUF(I).EQ.137))GOTO 10001
      IF((BUF(I).EQ.138))GOTO 10001
      IF((BUF(I).EQ.0))GOTO 10001
        I=I+(1)
      GOTO 10000
10001 CONTINUE
10002 IF((BUF(I).NE.160))GOTO 10003
        I=I+(1)
      GOTO 10002
10003 CONTINUE
10004 IF((BUF(I).NE.160))GOTO 10005
        I=I+(1)
      GOTO 10004
10005 IF((BUF(I).EQ.138))GOTO 10007
      IF((BUF(I).EQ.0))GOTO 10007
      GOTO 10006
10007   RETURN
10006 IF((BUF(I).NE.254))GOTO 10008
        NEGCO0=1
        I=I+(1)
        GOTO 10009
10008   NEGCO0=0
10009 COND=CTOI(BUF,I)
      IF((NEGCO0.NE.1))GOTO 10012
      IF((COND.NE.0))GOTO 10012
      GOTO 10011
10012 IF((NEGCO0.NE.0))GOTO 10010
      IF((COND.EQ.0))GOTO 10010
      GOTO 10011
10011   CONTINUE
10014   IF((BUF(I).NE.160))GOTO 10015
          I=I+(1)
        GOTO 10014
10015   DELIM=BUF(I)
        I=I+(1)
10016   IF((BUF(I).NE.160))GOTO 10017
          I=I+(1)
        GOTO 10016
10017   J=1
        GOTO 10020
10018   I=I+(1)
        J=J+(1)
10020   IF((BUF(I).EQ.DELIM))GOTO 10019
        IF((BUF(I).EQ.0))GOTO 10019
          MAC(J)=BUF(I)
        GOTO 10018
10019   MAC(J)=0
        CALL PROCE0(MAC)
        GOTO 10021
10010   CONTINUE
10022   IF((BUF(I).NE.160))GOTO 10023
          I=I+(1)
        GOTO 10022
10023   DELIM=BUF(I)
        I=I+(1)
        GOTO 10026
10024   I=I+(1)
10026   IF((BUF(I).EQ.DELIM))GOTO 10025
        IF((BUF(I).EQ.0))GOTO 10025
        GOTO 10024
10025   I=I+(1)
10027   IF((BUF(I).NE.160))GOTO 10028
          I=I+(1)
        GOTO 10027
10028   IF((BUF(I).EQ.138))GOTO 10029
        IF((BUF(I).EQ.0))GOTO 10029
        IF((BUF(I).EQ.DELIM))GOTO 10029
          J=1
          GOTO 10032
10030     I=I+(1)
          J=J+(1)
10032     IF((BUF(I).EQ.DELIM))GOTO 10031
          IF((BUF(I).EQ.0))GOTO 10031
            MAC(J)=BUF(I)
          GOTO 10030
10031     MAC(J)=0
          CALL PROCE0(MAC)
10029 CONTINUE
10021 RETURN
      END
      INTEGER FUNCTION CTOI(STR,I)
      INTEGER STR(1)
      INTEGER I
      INTEGER GCTOI
      CTOI=GCTOI(STR,I,10)
      RETURN
      END
      INTEGER FUNCTION ESC(ARRAY,I)
      INTEGER ARRAY(1)
      INTEGER I
      IF((ARRAY(I).EQ.192))GOTO 10033
        ESC=ARRAY(I)
        GOTO 10034
10033   IF((ARRAY(I+1).NE.0))GOTO 10035
          ESC=192
          GOTO 10036
10035     I=I+(1)
          IF((ARRAY(I).NE.238))GOTO 10037
            ESC=138
            GOTO 10038
10037       IF((ARRAY(I).NE.244))GOTO 10039
              ESC=137
              GOTO 10040
10039         ESC=ARRAY(I)
10040     CONTINUE
10038   CONTINUE
10036 CONTINUE
10034 RETURN
      END
      INTEGER FUNCTION GETSTR(BUF,STR,SIZE)
      INTEGER SIZE
      INTEGER BUF(1),STR(SIZE)
      INTEGER I,J
      INTEGER CTOC
      I=1
10041 IF((BUF(I).EQ.160))GOTO 10042
      IF((BUF(I).EQ.137))GOTO 10042
      IF((BUF(I).EQ.138))GOTO 10042
      IF((BUF(I).EQ.0))GOTO 10042
        I=I+(1)
      GOTO 10041
10042 CONTINUE
10043 IF((BUF(I).NE.160))GOTO 10044
        I=I+(1)
      GOTO 10043
10044 J=CTOC(BUF(I),STR,SIZE)
      IF((J.LE.0))GOTO 10045
      IF((STR(J).NE.138))GOTO 10045
        STR(J)=0
        J=J-(1)
10045 GETSTR=J
      RETURN
      END
      SUBROUTINE GETSC(BUF,PARAM,DEFALT)
      INTEGER BUF(1),PARAM,DEFALT
      INTEGER I
      I=1
10046 IF((BUF(I).EQ.160))GOTO 10047
      IF((BUF(I).EQ.137))GOTO 10047
      IF((BUF(I).EQ.138))GOTO 10047
      IF((BUF(I).EQ.0))GOTO 10047
        I=I+(1)
      GOTO 10046
10047 CONTINUE
10048 IF((BUF(I).NE.160))GOTO 10049
        I=I+(1)
      GOTO 10048
10049 IF((BUF(I).NE.138))GOTO 10050
        PARAM=DEFALT
        GOTO 10051
10050   PARAM=BUF(I)
10051 RETURN
      END
      INTEGER FUNCTION GETVAL(BUF,ARGTYP)
      INTEGER BUF(134)
      INTEGER ARGTYP
      INTEGER I
      INTEGER CTOI
      I=1
10052 IF((BUF(I).EQ.160))GOTO 10053
      IF((BUF(I).EQ.137))GOTO 10053
      IF((BUF(I).EQ.138))GOTO 10053
      IF((BUF(I).EQ.0))GOTO 10053
        I=I+(1)
      GOTO 10052
10053 CONTINUE
10054 IF((BUF(I).NE.160))GOTO 10055
        I=I+(1)
      GOTO 10054
10055 ARGTYP=BUF(I)
      IF((ARGTYP.EQ.171))GOTO 10057
      IF((ARGTYP.EQ.173))GOTO 10057
      GOTO 10056
10057   I=I+(1)
10056 GETVAL=CTOI(BUF,I)
      RETURN
      END
      SUBROUTINE MKTL(BUF,PAGENO,TITLE,SIZE)
      INTEGER PAGENO,SIZE
      INTEGER BUF(1),TITLE(SIZE)
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
      INTEGER LPART(134),CPART(134),RPART(134),DELIM
      INTEGER LW,CW,RW,I,NUMSP,P,SIZEM0
      INTEGER MVPART,CTOC
      IF((BUF(1).NE.0))GOTO 10058
        TITLE(1)=138
        TITLE(2)=0
        RETURN
10058 I=1
      DELIM=BUF(1)
      SIZEM0=SIZE-1
      LW=MVPART(BUF,I,DELIM,PAGENO,LPART,134)
      CW=MVPART(BUF,I,DELIM,PAGENO,CPART,134)
      RW=MVPART(BUF,I,DELIM,PAGENO,RPART,134)
      P=CTOC(LPART,TITLE,SIZEM0)+1
      NUMSP=(TIWID0/2)-LW-CW/2
      IF((NUMSP.GE.1))GOTO 10059
        NUMSP=1
10059 I=1
      GOTO 10062
10060 P=P+(1)
      I=I+(1)
10062 IF((I.GT.NUMSP))GOTO 10061
      IF((P.GE.SIZEM0))GOTO 10061
        TITLE(P)=160
      GOTO 10060
10061 P=P+(CTOC(CPART,TITLE(P),SIZE-P))
      NUMSP=TIWID0-(LW+NUMSP+CW+RW)
      IF((NUMSP.GE.1))GOTO 10063
        NUMSP=1
10063 I=1
      GOTO 10066
10064 P=P+(1)
      I=I+(1)
10066 IF((I.GT.NUMSP))GOTO 10065
      IF((P.GE.SIZEM0))GOTO 10065
        TITLE(P)=160
      GOTO 10064
10065 P=P+(CTOC(RPART,TITLE(P),SIZE-P))
      TITLE(P)=138
      TITLE(P+1)=0
      RETURN
      END
      INTEGER FUNCTION MVPART(BUF,I,DELIM,PAGENO,PART,SIZE)
      INTEGER I,PAGENO,SIZE
      INTEGER BUF(1),DELIM,PART(SIZE)
      INTEGER J
      INTEGER ITOC,WIDTH
      IF((BUF(I).EQ.DELIM))GOTO 10067
        PART(1)=0
        MVPART=0
        RETURN
10067 I=I+(1)
      J=1
10068 IF((J.GE.SIZE))GOTO 10069
      IF((BUF(I).EQ.DELIM))GOTO 10069
      IF((BUF(I).EQ.138))GOTO 10069
      IF((BUF(I).EQ.0))GOTO 10069
        IF((BUF(I).NE.192))GOTO 10070
          IF((BUF(I+1).EQ.163))GOTO 10071
            PART(J)=192
            GOTO 10072
10071       PART(J)=163
            I=I+(1)
10072     J=J+(1)
          GOTO 10073
10070     IF((BUF(I).EQ.163))GOTO 10074
            PART(J)=BUF(I)
            J=J+(1)
            GOTO 10075
10074       J=J+(ITOC(PAGENO,PART(J),SIZE-J+1))
10075   CONTINUE
10073   I=I+(1)
      GOTO 10068
10069 PART(J)=0
      MVPART=WIDTH(PART)
      RETURN
      END
      SUBROUTINE SKIP(N)
      INTEGER N
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
      IF((CURPA0.LT.START0))GOTO 10077
      IF((CURPA0.GT.ENDPA0))GOTO 10077
      GOTO 10076
10077   RETURN
10076 I=1
      GOTO 10080
10078 I=I+(1)
10080 IF((I.GT.N))GOTO 10079
        CALL PUTCH(138,-11)
      GOTO 10078
10079 RETURN
      END
      SUBROUTINE TAILBL(BUF)
      INTEGER BUF(1)
      INTEGER I
      INTEGER LENGTH
      I=LENGTH(BUF)
      IF((I.LE.0))GOTO 10084
      IF((BUF(I).NE.138))GOTO 10084
        I=I-(1)
10081 GOTO 10084
10082 I=I-(1)
10084 IF((I.LE.0))GOTO 10083
      IF((BUF(I).NE.160))GOTO 10083
      GOTO 10082
10083 BUF(I+1)=138
      BUF(I+2)=0
      RETURN
      END
      INTEGER FUNCTION WIDTH(BUF)
      INTEGER BUF(134)
      INTEGER I
      WIDTH=0
      I=1
      GOTO 10087
10085 I=I+(1)
10087 IF((BUF(I).EQ.0))GOTO 10086
        GOTO 10088
10089     WIDTH=WIDTH-(1)
        GOTO 10085
10091     WIDTH=WIDTH+(1)
        GOTO 10085
10088   IF((OR(BUF(I),128).EQ.136))GOTO 10089
        IF((OR(BUF(I),128).LT.160))GOTO 10092
        IF((OR(BUF(I),128).GE.255))GOTO 10092
        GOTO 10091
10092   CONTINUE
10090 GOTO 10085
10086 RETURN
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
C sizeminus1                     sizem0
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
C negcond                        negco0
C evalfcn                        evalf0
C Outw                           outwa0
C Endpage                        endpa0
C Replch                         replc0
C options                        optio0
C Ftype                          ftype0
C Mcout                          mcout0
C Maclvl                         maclv0
