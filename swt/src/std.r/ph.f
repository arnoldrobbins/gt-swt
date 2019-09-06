      INTEGER I,RC,FD,PID,NAME(16),USERN0,PWD(3),ATTACH
      INTEGER CREATE,GETARG,GETTO,EXPAND,EQUAL
      INTEGER PHFILE(102),ARG(128),JUNK(102)
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
     *,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0(128,20),LASTF0,TABSA0(85),INPU
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
     *URRO0,CURCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0,LAST
     *F0,TABSA0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,
     *PBBUF0,PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,TCHOM0,TCLEF0,TCUPL0,RES
     *EX0
      INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
     *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
     *PT0(1),FDOPU0(1)
      INTEGER AAAAA0(25)
      INTEGER AAAAB0(9)
      INTEGER AAAAC0(4)
      INTEGER AAAAD0(5)
      EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
     *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
     *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
     *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
     *U0,FDESC0(13))
      DATA AAAAA0/189,246,225,242,243,228,233,242,189,175,240,232,170,17
     *9,172,172,176,233,170,178,172,172,176,233,0/
      DATA AAAAB0/189,199,225,212,229,227,232,189,0/
      DATA AAAAC0/249,229,243,0/
      DATA AAAAD0/170,243,170,238,0/
      CALL DATE(6,USERN0)
10000   DO 10001 I=1,4
          CALL ENCODE(PHFILE,102,AAAAA0,USERN0,I)
          FD=CREATE(PHFILE,2)
          IF((FD.EQ.-3))GOTO 10003
            GOTO 10004
10003     CONTINUE
10001   CONTINUE
10002   CALL PRINT(-15,'Can''t create phantom file: *s*n.',PHFILE)
        CALL SWT
10004 CALL PRINT(FD,'CHAP LOWER 1*nSWT -*i*n.',6)
      IF((EXPAND(AAAAB0,JUNK,102).EQ.-3))GOTO 10006
      IF((EQUAL(JUNK,AAAAC0).EQ.0))GOTO 10006
      GOTO 10005
10006   CALL PRINT(FD,AAAAD0,PASSW0)
10005 I=1
      GOTO 10009
10007 I=I+(1)
10009 IF((GETARG(I,ARG,128).EQ.-1))GOTO 10008
        CALL PUTLIN(ARG,FD)
        CALL PUTCH(160,FD)
      GOTO 10007
10008 IF((I.LE.1))GOTO 10010
        CALL PUTCH(138,FD)
        GOTO 10011
10010   CALL FCOPY(-10,FD)
10011 CALL PRINT(FD,'stop *s*n.',PHFILE)
      CALL CLOSE(FD)
      IF((GETTO(PHFILE,NAME,PWD,ATTACH).NE.-3))GOTO 10012
        CALL ERROR('=varsdir= is inaccessible.')
10012 CALL PHANT$(NAME,32,6,PID,RC)
      IF((RC.EQ.0))GOTO 10013
        CALL REMOVE(PHFILE)
        CALL REMARK('No free phantoms.')
        GOTO 10014
10013   CALL PRINT(-11,'*i*n.',PID)
10014 IF((ATTACH.NE.1))GOTO 10015
        CALL FOLLOW(0,0)
10015 CALL SWT
      END
C ---- Long Name Map ----
C Fdflags                        fdfla0
C Eofchar                        eofch0
C Inputstart                     input0
C usernum                        usern0
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
C Utempbuf                       utemq0
C Rtlabel                        rtlab0
C Lsho                           lshoa0
C Tcvertpos                      tcver0
C Tcwraparound                   tcwra0
C Tchomelen                      tchom0
C Tcceoslen                      tcceo0
C Fdbufend                       fdbui0
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
C Displaytime                    displ0
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
