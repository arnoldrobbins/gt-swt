      INTEGER ARG(128)
      INTEGER I
      INTEGER GETARG
      IF((GETARG(1,ARG,128).NE.-1))GOTO 10000
        CALL DISPL0
        GOTO 10001
10000   I=1
        GOTO 10004
10002   I=I+(1)
10004   IF((GETARG(I,ARG,128).EQ.-1))GOTO 10003
          IF((ARG(1).NE.173))GOTO 10005
            CALL DOOPT(ARG(2),I)
            GOTO 10006
10005       CALL DOTERM(ARG)
10006   GOTO 10002
10003 CONTINUE
10001 CALL SWT
      END
      SUBROUTINE DOTERM(TERM)
      INTEGER TERM(1)
      INTEGER TTYP$V,EQUAL
      INTEGER AAAAA0(5)
      INTEGER AAAAB0(2)
      DATA AAAAA0/232,229,236,240,0/
      DATA AAAAB0/191,0/
      CALL MAPSTR(TERM,1)
      IF((EQUAL(AAAAA0,TERM).EQ.1))GOTO 10008
      IF((EQUAL(AAAAB0,TERM).EQ.1))GOTO 10008
      GOTO 10007
10008   CALL TTYP$L
        GOTO 10009
10007   IF((TTYP$V(TERM).NE.1))GOTO 10010
          GOTO 10011
10010     CALL USAGE
10011 CONTINUE
10009 RETURN
      END
      SUBROUTINE DOOPT(OPT,AP)
      INTEGER OPT(1)
      INTEGER AP
      COMMON /SWT$CM/TERMB0(128),TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFC
     *H0,ESCCH0,RTCHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0(6),KILLR0(33),FDMEM0(
     *16,128),RESER0(846),FDBUF0(16384),PASSW0(7),BPLAB0(4),UTEMP0,FDLAS
     *0,PRTDE0(17),PRTFO0(9),UHASH0(37),UTEMQ0(4059),RESES0(985),CMDST0,
     *COMUN0,RTLAB0(4),FIRST0,ARGCA0,ARGVA0(256),TERMA0(6),TERMT0(7),LWO
     *RD0,LSHOA0,LSTOP0,LSNAA0,LSREF0(16384),RESET0(743),TSSTA0,TSGTA0,T
     *SATA0,TSEOS0,TSUNA0(32),TSPSA0(32),TSBFA0(32,32),TSPWA0(3,32),TSPA
     *T0(180),RESEU0(680),NEWSC0(85,51),RESEV0(785),CURSC0(85,51),RESEW0
     *(785),TCCLE0(10),TCCLF0(10),TCCLG0(10),TCCUR0(10),TCCUS0(10),TCCUT
     *0(10),TCCUU0(10),TCCUV0(10),TCABS0(10),TCVER0(10),TCHOR0(10),TCINS
     *0(10),TCDEL0(10),TCSHI0(10),TCSHJ0(10),TCCOO0,TCSHK0,TCCOP0,TCSEQ0
     *,TCSPE0,TCCLH0,TCLIN0,TCPOS0,TCWRA0,TCCLR0,TCCEO0,TCCEP0,TCABT0,TC
     *VES0,TCHOS0,TCHOM0,TCLEF0,TCUPL0,UNPRI0,COLCH0(51),COLCI0(51),ROWC
     *H0,ROWCI0,LASTC0(51),MAXRO0,MAXCO0,CURRO0,CURCO0,MSGRO0,MSGOW0(85)
     *,PADRO0,PADCO0,PADLE0,DISPM0,FNTAB0(128,20),LASTF0,TABSA0(85),INPU
     *T0(51),INPUU0(51),INBUF0(85),LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PB
     *BUF0(400),PBPTR0,FNUSE0(20),DEFBU0(1000),LASTE0,NESTI0,RESEX0(1)
      INTEGER TERMB0,TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFCH0,ESCCH0,RT
     *CHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0,FDMEM0,RESER0,FDBUF0,PASSW0,BPLAB
     *0,UTEMP0,UHASH0,UTEMQ0,RESES0,CMDST0,COMUN0,RTLAB0,FIRST0,ARGCA0,A
     *RGVA0,TERMA0,TERMT0,LSHOA0,LSTOP0,LSNAA0,LSREF0,RESET0,FDLAS0,KILL
     *R0,PRTDE0,PRTFO0,LWORD0,TSSTA0,TSGTA0,TSATA0,TSEOS0,TSUNA0,TSPSA0,
     *TSBFA0,TSPWA0,TSPAT0,RESEU0,NEWSC0,RESEV0,CURSC0,RESEW0,TCCLE0,TCC
     *LF0,TCCLG0,TCCUR0,TCCUS0,TCCUT0,TCCUU0,TCCUV0,TCABS0,TCVER0,TCHOR0
     *,TCINS0,TCDEL0,TCCLH0,TCLIN0,TCPOS0,TCSHI0,TCSHJ0,TCCOO0,TCSHK0,TC
     *COP0,TCSEQ0,TCDEM0,TCWRA0,TCCLR0,TCSPE0,TCCEO0,TCCEP0,TCABT0,TCVES
     *0,TCHOS0,UNPRI0,COLCH0,COLCI0,ROWCH0,ROWCI0,LASTC0,MAXRO0,MAXCO0,C
     *URRO0,CURCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPM0,FNTAB0,LAST
     *F0,TABSA0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,
     *PBBUF0,PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,TCHOM0,TCLEF0,TCUPL0,RES
     *EX0
      INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
     *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
     *PT0(1),FDOPU0(1)
      INTEGER O
      INTEGER STRBSR,DUPLX$,GETARG
      INTEGER C,CHAR(4)
      INTEGER MNTOC
      INTEGER OPOS(26)
      INTEGER OTEXT(164)
      INTEGER AAAAC0
      INTEGER AAAAE0
      INTEGER AAAAG0
      INTEGER AAAAH0
      INTEGER AAAAI0
      INTEGER AAAAJ0(24)
      INTEGER AAAAD0
      INTEGER AAAAF0
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      DATA OTEXT/1,226,242,229,225,235,0,2,229,227,232,239,0,3,229,238,2
     *26,0,20,229,239,230,0,4,229,242,225,243,229,0,5,229,243,227,225,24
     *0,229,0,6,233,238,232,0,7,235,233,236,236,0,8,236,227,225,243,229,
     *0,9,236,230,0,19,238,229,247,236,233,238,229,0,10,238,239,226,242,
     *229,225,235,0,11,238,239,229,227,232,239,0,3,238,239,233,238,232,0
     *,12,238,239,236,227,225,243,229,0,13,238,239,236,230,0,21,238,239,
     *243,229,0,22,238,239,246,244,232,0,14,238,239,248,239,230,230,0,15
     *,238,239,248,239,238,0,16,242,229,244,249,240,229,0,23,243,229,0,2
     *4,246,244,232,0,17,248,239,230,230,0,18,248,239,238,0/
      DATA OPOS/25,1,8,14,19,24,31,39,44,50,57,61,70,79,87,94,103,109,11
     *5,122,130,137,145,149,154,160/
      DATA AAAAJ0/186,160,245,238,242,229,227,239,231,238,233,250,229,22
     *8,160,237,238,229,237,239,238,233,227,0/
      CALL MAPSTR(OPT,1)
      O=STRBSR(OPOS,OTEXT,1,OPT)
      IF((O.NE.-1))GOTO 10015
        CALL USAGE
        GOTO 10016
10015   AAAAH0=OTEXT(OPOS(O))
        GOTO 10017
10018     CALL BREAK$(0)
        GOTO 10019
10020     AAAAF0=:100000
          AAAAG0=1
          GOTO 10014
10021   GOTO 10019
10022     AAAAF0=:10000
          AAAAG0=2
          GOTO 10014
10023   GOTO 10019
10024     AAAAC0=1
          GOTO 10012
10025     ECHAR0=C
        GOTO 10019
10026     AAAAC0=2
          GOTO 10012
10027     ESCCH0=C
        GOTO 10019
10028     AAAAD0=:10000
          AAAAE0=1
          GOTO 10013
10029   GOTO 10019
10030     AAAAC0=3
          GOTO 10012
10031     KCHAR0=C
        GOTO 10019
10032     TERMA0(3)=0
        GOTO 10019
10033     AAAAF0=:40000
          AAAAG0=3
          GOTO 10014
10034   GOTO 10019
10035     CALL BREAK$(1)
        GOTO 10019
10036     AAAAD0=:100000
          AAAAE0=2
          GOTO 10013
10037   GOTO 10019
10038     TERMA0(3)=1
        GOTO 10019
10039     AAAAD0=:40000
          AAAAE0=3
          GOTO 10013
10040   GOTO 10019
10041     AAAAF0=:20000
          AAAAG0=4
          GOTO 10014
10042   GOTO 10019
10043     AAAAC0=4
          GOTO 10012
10044     RTCHA0=C
        GOTO 10019
10045     AAAAD0=:20000
          AAAAE0=4
          GOTO 10013
10046   GOTO 10019
10047     AAAAC0=5
          GOTO 10012
10048     NLCHA0=C
        GOTO 10019
10049     AAAAC0=6
          GOTO 10012
10050     EOFCH0=C
        GOTO 10019
10051     TERMA0(1)=0
        GOTO 10019
10052     TERMA0(2)=0
        GOTO 10019
10053     TERMA0(1)=1
        GOTO 10019
10054     TERMA0(2)=1
        GOTO 10019
10017   GOTO(10018,10020,10022,10024,10026,10028,10030,10032,10033,10035
     *,10036,10038,10039,10041,10041,10043,10045,10045,10047,10049,10051
     *,10052,10053,10054),AAAAH0
10019 CONTINUE
10016 RETURN
10012 AP=AP+(1)
      IF((GETARG(AP,CHAR,4).NE.-1))GOTO 10055
        CALL USAGE
10055 AAAAI0=1
      C=MNTOC(CHAR,AAAAI0,-3)
      IF((C.NE.-3))GOTO 10056
        CALL PUTLIN(CHAR,-15)
        CALL ERROR(AAAAJ0)
10056 GOTO 10057
10013 LWORD0=OR(DUPLX$(-1),AAAAD0)
      CALL DUPLX$(LWORD0)
      GOTO 10058
10014 LWORD0=AND(DUPLX$(-1),NOT(AAAAF0))
      CALL DUPLX$(LWORD0)
      GOTO 10059
10057 GOTO(10025,10027,10031,10044,10048,10050),AAAAC0
      GOTO 10057
10059 GOTO(10021,10023,10034,10042),AAAAG0
      GOTO 10059
10058 GOTO(10029,10037,10040,10046),AAAAE0
      GOTO 10058
      END
      SUBROUTINE DISPL0
      COMMON /SWT$CM/TERMB0(128),TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFC
     *H0,ESCCH0,RTCHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0(6),KILLR0(33),FDMEM0(
     *16,128),RESER0(846),FDBUF0(16384),PASSW0(7),BPLAB0(4),UTEMP0,FDLAS
     *0,PRTDE0(17),PRTFO0(9),UHASH0(37),UTEMQ0(4059),RESES0(985),CMDST0,
     *COMUN0,RTLAB0(4),FIRST0,ARGCA0,ARGVA0(256),TERMA0(6),TERMT0(7),LWO
     *RD0,LSHOA0,LSTOP0,LSNAA0,LSREF0(16384),RESET0(743),TSSTA0,TSGTA0,T
     *SATA0,TSEOS0,TSUNA0(32),TSPSA0(32),TSBFA0(32,32),TSPWA0(3,32),TSPA
     *T0(180),RESEU0(680),NEWSC0(85,51),RESEV0(785),CURSC0(85,51),RESEW0
     *(785),TCCLE0(10),TCCLF0(10),TCCLG0(10),TCCUR0(10),TCCUS0(10),TCCUT
     *0(10),TCCUU0(10),TCCUV0(10),TCABS0(10),TCVER0(10),TCHOR0(10),TCINS
     *0(10),TCDEL0(10),TCSHI0(10),TCSHJ0(10),TCCOO0,TCSHK0,TCCOP0,TCSEQ0
     *,TCSPE0,TCCLH0,TCLIN0,TCPOS0,TCWRA0,TCCLR0,TCCEO0,TCCEP0,TCABT0,TC
     *VES0,TCHOS0,TCHOM0,TCLEF0,TCUPL0,UNPRI0,COLCH0(51),COLCI0(51),ROWC
     *H0,ROWCI0,LASTC0(51),MAXRO0,MAXCO0,CURRO0,CURCO0,MSGRO0,MSGOW0(85)
     *,PADRO0,PADCO0,PADLE0,DISPM0,FNTAB0(128,20),LASTF0,TABSA0(85),INPU
     *T0(51),INPUU0(51),INBUF0(85),LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PB
     *BUF0(400),PBPTR0,FNUSE0(20),DEFBU0(1000),LASTE0,NESTI0,RESEX0(1)
      INTEGER TERMB0,TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFCH0,ESCCH0,RT
     *CHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0,FDMEM0,RESER0,FDBUF0,PASSW0,BPLAB
     *0,UTEMP0,UHASH0,UTEMQ0,RESES0,CMDST0,COMUN0,RTLAB0,FIRST0,ARGCA0,A
     *RGVA0,TERMA0,TERMT0,LSHOA0,LSTOP0,LSNAA0,LSREF0,RESET0,FDLAS0,KILL
     *R0,PRTDE0,PRTFO0,LWORD0,TSSTA0,TSGTA0,TSATA0,TSEOS0,TSUNA0,TSPSA0,
     *TSBFA0,TSPWA0,TSPAT0,RESEU0,NEWSC0,RESEV0,CURSC0,RESEW0,TCCLE0,TCC
     *LF0,TCCLG0,TCCUR0,TCCUS0,TCCUT0,TCCUU0,TCCUV0,TCABS0,TCVER0,TCHOR0
     *,TCINS0,TCDEL0,TCCLH0,TCLIN0,TCPOS0,TCSHI0,TCSHJ0,TCCOO0,TCSHK0,TC
     *COP0,TCSEQ0,TCDEM0,TCWRA0,TCCLR0,TCSPE0,TCCEO0,TCCEP0,TCABT0,TCVES
     *0,TCHOS0,UNPRI0,COLCH0,COLCI0,ROWCH0,ROWCI0,LASTC0,MAXRO0,MAXCO0,C
     *URRO0,CURCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPM0,FNTAB0,LAST
     *F0,TABSA0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,
     *PBBUF0,PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,TCHOM0,TCLEF0,TCUPL0,RES
     *EX0
      INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
     *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
     *PT0(1),FDOPU0(1)
      INTEGER LWORD,I,BREAK0
      INTEGER DUPLX$,CTOMN,CHKSTR
      INTEGER ERASE(4),ESCAPE(4),KILL(4),RETYPE(4),EOF(4),NL(4)
      INTEGER AAAAK0(10)
      INTEGER AAAAL0(12)
      INTEGER AAAAM0(34)
      INTEGER AAAAN0(35)
      INTEGER AAAAO0(8)
      INTEGER AAAAP0(6)
      INTEGER AAAAQ0(4)
      INTEGER AAAAR0(8)
      INTEGER AAAAS0(7)
      INTEGER AAAAT0(8)
      INTEGER AAAAU0(8)
      INTEGER AAAAV0(6)
      INTEGER AAAAW0(6)
      INTEGER AAAAX0(5)
      INTEGER AAAAY0(8)
      INTEGER AAAAZ0(6)
      INTEGER AAABA0(9)
      INTEGER AAABB0(7)
      INTEGER AAABC0(11)
      INTEGER AAABD0(9)
      INTEGER AAABE0(7)
      INTEGER AAABF0(9)
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      DATA AAAAK0/244,249,240,229,160,170,243,160,160,0/
      DATA AAAAL0/226,245,230,230,229,242,160,170,233,170,238,0/
      DATA AAAAM0/173,229,242,225,243,229,160,170,243,160,160,173,229,24
     *3,227,225,240,229,160,170,243,160,160,173,235,233,236,236,160,170,
     *243,160,160,0/
      DATA AAAAN0/173,242,229,244,249,240,229,160,170,243,160,160,173,22
     *9,239,230,160,170,243,160,160,173,238,229,247,236,233,238,229,160,
     *170,243,170,238,0/
      DATA AAAAO0/170,163,231,170,243,160,160,0/
      DATA AAAAP0/173,229,227,232,239,0/
      DATA AAAAQ0/173,236,230,0/
      DATA AAAAR0/173,238,239,248,239,230,230,0/
      DATA AAAAS0/173,238,239,233,238,232,0/
      DATA AAAAT0/170,163,231,170,243,160,160,0/
      DATA AAAAU0/173,238,239,229,227,232,239,0/
      DATA AAAAV0/173,238,239,236,230,0/
      DATA AAAAW0/173,248,239,230,230,0/
      DATA AAAAX0/173,233,238,232,0/
      DATA AAAAY0/173,238,239,243,229,160,160,0/
      DATA AAAAZ0/173,243,229,160,160,0/
      DATA AAABA0/173,238,239,246,244,232,160,160,0/
      DATA AAABB0/173,246,244,232,160,160,0/
      DATA AAABC0/173,238,239,236,227,225,243,229,160,160,0/
      DATA AAABD0/173,236,227,225,243,229,160,160,0/
      DATA AAABE0/173,226,242,229,225,235,0/
      DATA AAABF0/173,238,239,226,242,229,225,235,0/
      LWORD=DUPLX$(-1)
      CALL BREAK$(2,BREAK0)
      IF((CHKSTR(TERMT0,7).NE.1))GOTO 10060
        CALL PRINT(-11,AAAAK0,TERMT0)
10060 CALL PRINT(-11,AAAAL0,AND(LWORD,255))
      CALL CTOMN(ECHAR0,ERASE)
      CALL CTOMN(ESCCH0,ESCAPE)
      CALL CTOMN(KCHAR0,KILL)
      CALL CTOMN(RTCHA0,RETYPE)
      CALL CTOMN(EOFCH0,EOF)
      CALL CTOMN(NLCHA0,NL)
      CALL PRINT(-11,AAAAM0,ERASE,ESCAPE,KILL)
      CALL PRINT(-11,AAAAN0,RETYPE,EOF,NL)
      I=1
      GOTO 10063
10061 LWORD=LS(LWORD,1)
      I=I+(1)
10063 IF((I.GT.4))GOTO 10062
        IF((LT(LWORD,1).NE.0))GOTO 10064
          CALL PRINT(-11,AAAAO0,I+1,AAAAP0,AAAAQ0,AAAAR0,AAAAS0)
          GOTO 10065
10064     CALL PRINT(-11,AAAAT0,I+1,AAAAU0,AAAAV0,AAAAW0,AAAAX0)
10065 GOTO 10061
10062 IF((TERMA0(1).NE.0))GOTO 10066
        CALL PRINT(-11,AAAAY0)
        GOTO 10067
10066   CALL PRINT(-11,AAAAZ0)
10067 IF((TERMA0(2).NE.0))GOTO 10068
        CALL PRINT(-11,AAABA0)
        GOTO 10069
10068   CALL PRINT(-11,AAABB0)
10069 IF((TERMA0(3).NE.1))GOTO 10070
        CALL PRINT(-11,AAABC0)
        GOTO 10071
10070   CALL PRINT(-11,AAABD0)
10071 IF((BREAK0.NE.0))GOTO 10072
        CALL PRINT(-11,AAABE0)
        GOTO 10073
10072   CALL PRINT(-11,AAABF0)
10073 CALL PUTCH(138,-11)
      RETURN
      END
      SUBROUTINE USAGE
      CALL REMARK('Usage: term [ ? | <term type> | { <option> } ].')
      CALL REMARK('   <option> ::= -erase <char>  | -kill <char> | -newl
     *ine <char>.')
      CALL REMARK('              | -retype <char> | -eof <char>  | -esca
     *pe <char>.')
      CALL REMARK('              | -[no]break | -[no]echo | -[no]lcase |
     * -[no]lf.')
      CALL REMARK('              | -[no]xoff  | -[no]xon  | -[no]se    |
     * -[no]vth.')
      CALL ERROR('              | -[no]inh.')
      RETURN
      END
C ---- Long Name Map ----
C Fdflags                        fdfla0
C Eofchar                        eofch0
C Inputstart                     input0
C Escchar                        escch0
C Invertcase                     inver0
C Tccoordchar                    tccoo0
C Tabs                           tabsa0
C Fdbufstart                     fdbug0
C Rtchar                         rtcha0
C Prtdest                        prtde0
C Tcdelline                      tcdel0
C Colchgstop                     colci0
C Rowchgstart                    rowch0
C Maxcol                         maxco0
C Echar                          echar0
C Tseos                          tseos0
C Tclinedelay                    tclin0
C Fnused                         fnuse0
C Termcount                      termd0
C Reservedio                     reser0
C Tsstate                        tssta0
C Tccursorright                  tccut0
C Tcabspos                       tcabs0
C Tcposdelay                     tcpos0
C Tchorlen                       tchos0
C Reservedopen                   reses0
C Lsna                           lsnaa0
C Tcseqtype                      tcseq0
C Unprintablechar                unpri0
C Fdesc                          fdesc0
C Cputype                        cputy0
C Prtform                        prtfo0
C Tsbf                           tsbfa0
C Curcol                         curco0
C Lastfn                         lastf0
C Insertmode                     inser0
C Fdbuf                          fdbuf0
C Argv                           argva0
C Lstop                          lstop0
C Tcceollen                      tccep0
C Tcshiftchar                    tcshk0
C Inputwait                      inpuv0
C Fdunit                         fduni0
C Termcp                         termc0
C Kchar                          kchar0
C Fdmem                          fdmem0
C Fddev                          fddev0
C Fdvcstat1                      fdvcs0
C Lastdef                        laste0
C Tcdelaytime                    tcdem0
C Fdvcstat2                      fdvct0
C Killresp                       killr0
C Tccleardelay                   tcclh0
C Padrow                         padro0
C Fntab                          fntab0
C Reservednewscr                 resev0
C Reservedcurscr                 resew0
C resetlwordbits                 resey0
C Utempbuf                       utemq0
C Rtlabel                        rtlab0
C Lsho                           lshoa0
C Tcvertpos                      tcver0
C Tcwraparound                   tcwra0
C Tchomelen                      tchom0
C breakval                       break0
C Tcceoslen                      tcceo0
C Fdbufend                       fdbui0
C setlwordbits                   setlw0
C Tcspeed                        tcspe0
C Tcleftlen                      tclef0
C Pbbuf                          pbbuf0
C Fdopstat1                      fdops0
C Passwd                         passw0
C Newscr                         newsc0
C Curscr                         cursc0
C Duplex                         duple0
C Fdopstat2                      fdopt0
C Tccursorhome                   tccur0
C Fdopstat3                      fdopu0
C display                        displ0
C Tspath                         tspat0
C Tsat                           tsata0
C Tccursorleft                   tccus0
C Colchgstart                    colch0
C Reservedshell                  reset0
C Inbuf                          inbuf0
C Nestingcount                   nesti0
C Reservedtscan                  reseu0
C Defbuf                         defbu0
C Uhashtb                        uhash0
C Fdbuflen                       fdbuh0
C Cmdstat                        cmdst0
C Tchorpos                       tchor0
C Tcinsline                      tcins0
C Msgowner                       msgow0
C Fdlastfd                       fdlas0
C Termattr                       terma0
C Tsgt                           tsgta0
C Tcshiftout                     tcshj0
C Inputstop                      inpuu0
C Firstuse                       first0
C Tcshiftin                      tcshi0
C Displaytime                    dispm0
C Fdcount                        fdcou0
C Termbuf                        termb0
C Lsref                          lsref0
C Tcabslen                       tcabt0
C Rowchgstop                     rowci0
C Maxrow                         maxro0
C Padcol                         padco0
C Lastcharscanned                lastd0
C Msgrow                         msgro0
C Padlen                         padle0
C Stdporttbl                     stdpo0
C Argc                           argca0
C Termtype                       termt0
C Tccleartoeol                   tcclf0
C Tccursordown                   tccuv0
C Currow                         curro0
C Nlchar                         nlcha0
C Isphantom                      ispha0
C Tsun                           tsuna0
C Tsps                           tspsa0
C Reservedvthmisc                resex0
C Tcuplen                        tcupl0
C Lastchar                       lastc0
C Utemptop                       utemp0
C Bplabel                        bplab0
C Tspw                           tspwa0
C Tcclearscreen                  tccle0
C Tccoordtype                    tccop0
C Tcvertlen                      tcves0
C Fdbcount                       fdbco0
C Comunit                        comun0
C Tccleartoeos                   tcclg0
C Tccursorup                     tccuu0
C Tcclrlen                       tcclr0
C Errcod                         errco0
C Lword                          lword0
C Pbptr                          pbptr0
