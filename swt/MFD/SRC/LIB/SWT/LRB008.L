       SUBROUTINE VT$DEL(COUNT)
(0001)        SUBROUTINE VT$DEL(COUNT)
(0002)        INTEGER COUNT
(0003)        COMMON /SWT$CM/TERMB0(128),TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFC
(0004)       *H0,ESCCH0,RTCHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0(6),KILLR0(33),FDMEM0(
(0005)       *16,128),RESER0(846),FDBUF0(16384),PASSW0(7),BPLAB0(4),UTEMP0,FDLAS
(0006)       *0,PRTDE0(17),PRTFO0(9),UHASH0(37),UTEMQ0(4059),RESES0(985),CMDST0,
(0007)       *COMUN0,RTLAB0(4),FIRST0,ARGCA0,ARGVA0(256),TERMA0(6),TERMT0(7),LWO
(0008)       *RD0,LSHOA0,LSTOP0,LSNAA0,LSREF0(16384),RESET0(743),TSSTA0,TSGTA0,T
(0009)       *SATA0,TSEOS0,TSUNA0(32),TSPSA0(32),TSBFA0(32,32),TSPWA0(3,32),TSPA
(0010)       *T0(180),RESEU0(680),NEWSC0(85,51),RESEV0(785),CURSC0(85,51),RESEW0
(0011)       *(785),TCCLE0(10),TCCLF0(10),TCCLG0(10),TCCUR0(10),TCCUS0(10),TCCUT
(0012)       *0(10),TCCUU0(10),TCCUV0(10),TCABS0(10),TCVER0(10),TCHOR0(10),TCINS
(0013)       *0(10),TCDEL0(10),TCSHI0(10),TCSHJ0(10),TCCOO0,TCSHK0,TCCOP0,TCSEQ0
(0014)       *,TCSPE0,TCCLH0,TCLIN0,TCPOS0,TCWRA0,TCCLR0,TCCEO0,TCCEP0,TCABT0,TC
(0015)       *VES0,TCHOS0,TCHOM0,TCLEF0,TCUPL0,UNPRI0,COLCH0(51),COLCI0(51),ROWC
(0016)       *H0,ROWCI0,LASTC0(51),MAXRO0,MAXCO0,CURRO0,CURCO0,MSGRO0,MSGOW0(85)
(0017)       *,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0(128,20),LASTF0,TABSA0(85),INPU
(0018)       *T0(51),INPUU0(51),INBUF0(85),LASTD0,INSER0,INVER0,DUPLE0,INPUV0,PB
(0019)       *BUF0(400),PBPTR0,FNUSE0(20),DEFBU0(1000),LASTE0,NESTI0,RESEX0(1)
(0020)        INTEGER TERMB0,TERMC0,TERMD0,ECHAR0,KCHAR0,NLCHA0,EOFCH0,ESCCH0,RT
(0021)       *CHA0,ISPHA0,CPUTY0,ERRCO0,STDPO0,FDMEM0,RESER0,FDBUF0,PASSW0,BPLAB
(0022)       *0,UTEMP0,UHASH0,UTEMQ0,RESES0,CMDST0,COMUN0,RTLAB0,FIRST0,ARGCA0,A
(0023)       *RGVA0,TERMA0,TERMT0,LSHOA0,LSTOP0,LSNAA0,LSREF0,RESET0,FDLAS0,KILL
(0024)       *R0,PRTDE0,PRTFO0,LWORD0,TSSTA0,TSGTA0,TSATA0,TSEOS0,TSUNA0,TSPSA0,
(0025)       *TSBFA0,TSPWA0,TSPAT0,RESEU0,NEWSC0,RESEV0,CURSC0,RESEW0,TCCLE0,TCC
(0026)       *LF0,TCCLG0,TCCUR0,TCCUS0,TCCUT0,TCCUU0,TCCUV0,TCABS0,TCVER0,TCHOR0
(0027)       *,TCINS0,TCDEL0,TCCLH0,TCLIN0,TCPOS0,TCSHI0,TCSHJ0,TCCOO0,TCSHK0,TC
(0028)       *COP0,TCSEQ0,TCDEM0,TCWRA0,TCCLR0,TCSPE0,TCCEO0,TCCEP0,TCABT0,TCVES
(0029)       *0,TCHOS0,UNPRI0,COLCH0,COLCI0,ROWCH0,ROWCI0,LASTC0,MAXRO0,MAXCO0,C
(0030)       *URRO0,CURCO0,MSGRO0,MSGOW0,PADRO0,PADCO0,PADLE0,DISPL0,FNTAB0,LAST
(0031)       *F0,TABSA0,INPUT0,INPUU0,INBUF0,LASTD0,INSER0,INVER0,DUPLE0,INPUV0,
(0032)       *PBBUF0,PBPTR0,FNUSE0,DEFBU0,LASTE0,NESTI0,TCHOM0,TCLEF0,TCUPL0,RES
(0033)       *EX0
(0034)        INTEGER FDESC0(16),FDDEV0(1),FDUNI0(1),FDBUG0(1),FDBUH0(1),FDBUI0(
(0035)       *1),FDCOU0(1),FDBCO0(1),FDFLA0(1),FDVCS0(1),FDVCT0(1),FDOPS0(1),FDO
(0036)       *PT0(1),FDOPU0(1)
(0037)        INTEGER I
(0038)        EQUIVALENCE (FDMEM0,FDESC0),(FDDEV0,FDESC0(1)),(FDUNI0,FDESC0(2)),
(0039)       *(FDBUG0,FDESC0(3)),(FDBUH0,FDESC0(4)),(FDBUI0,FDESC0(5)),(FDCOU0,F
(0040)       *DESC0(6)),(FDBCO0,FDESC0(7)),(FDFLA0,FDESC0(8)),(FDVCS0,FDESC0(9))
(0041)       *,(FDVCT0,FDESC0(10)),(FDOPS0,FDESC0(11)),(FDOPT0,FDESC0(12)),(FDOP
(0042)       *U0,FDESC0(13))
(0043)        IF((COUNT.GT.0))GOTO 10000
        000000:   ARGT
(0044)          RETURN
(0045)  10000 I=(INTL(COUNT)*TCSPE0)/10000
        000001:   LDA   COUNT,*
        000003:   BGT
        000004:   DAC   $10000
        000005:   PRTN
        000006:   LINK  $10000
(0046)  10001 IF((I.LT.0))GOTO 10002
        000006:   LDA   COUNT,*
        000010:   PIDA
        000011:   STL   J#0001
        000013:   LDA   TCSPE0,*
        000015:   PIDA
        000016:   MPL   J#0001
        000020:   PIML
        000021:   PIDL
        000022:   DVL   =0
        000024:   XCB
        000025:   STA   I
(0047)          CALL TNOUA(LS(128,8),1)
(0048)          I=I-(1)
(0049)        GOTO 10001
(0050)  10002 RETURN
        000026:   LDA   I
        000027:   BLT
        000030:   DAC   $10002
        000031:   PCL   TNOUA,*
        000033:   AP    =-32768
        000035:   APL   =1
        000037:   LDA   I
        000040:   S1A
        000041:   STA   I
        000042:   JMP   $10001
        000043:   LINK  $10002
(0051)        END
        000043:   PRTN
        000044!   DAC   COUNT
        000042!   LINK  I
        000050!   LINK  J#0001
        000400>   LINK  =-32768
        000400>   OCT   100000
        000401>   LINK  =1
        000401>   OCT   000001
        000044:   LINK  =0
        000044:   OCT   000000
        000045:   OCT   023420
        000422>   LINK  =-31342
        000422>   DAC   TCSPE0
        000424>   LINK  =-29943
        000424>   DAC   TNOUA
        000006:   DAC   $10000
        000026:   DAC   $10001
        000043:   DAC   $10002
PROGRAM SIZE:   PROCEDURE - 000046    LINKAGE - 000026    STACK - 000052

  COUNT  I ARGUMENT 000044   0001S  0002S  0043   0045
  I      I STACK    000042   0037S  0045M  0046   0048M
  INTL   I EXTERNAL 000000   0045
  LS     I EXTERNAL 000000   0047
  TCSPE0 I /SWT$CM/ 152232   0003S  0020S  0045
  TNOUA  R EXTERNAL 000000   0047

  $10000            000006   0043   0045D
  $10001            000026   0046D  0049
  $10002            000043   0046   0050D

0000 ERRORS [<VT$DEL>FTN-REV19.2]
C ---- Long Name Map ----
(0052)  C ---- Long Name Map ----
(0053)  C Fdflags                        fdfla0
(0054)  C Eofchar                        eofch0
(0055)  C Inputstart                     input0
(0056)  C Escchar                        escch0
(0057)  C Invertcase                     inver0
(0058)  C Tccoordchar                    tccoo0
(0059)  C Tabs                           tabsa0
(0060)  C Fdbufstart                     fdbug0
(0061)  C Rtchar                         rtcha0
(0062)  C Prtdest                        prtde0
(0063)  C Tcdelline                      tcdel0
(0064)  C Colchgstop                     colci0
(0065)  C Rowchgstart                    rowch0
(0066)  C Maxcol                         maxco0
(0067)  C Echar                          echar0
(0068)  C Tseos                          tseos0
(0069)  C Tclinedelay                    tclin0
(0070)  C Fnused                         fnuse0
(0071)  C Termcount                      termd0
(0072)  C Reservedio                     reser0
(0073)  C Tsstate                        tssta0
(0074)  C Tccursorright                  tccut0
(0075)  C Tcabspos                       tcabs0
(0076)  C Tcposdelay                     tcpos0
(0077)  C Tchorlen                       tchos0
(0078)  C Reservedopen                   reses0
(0079)  C Lsna                           lsnaa0
(0080)  C Tcseqtype                      tcseq0
(0081)  C Unprintablechar                unpri0
(0082)  C Fdesc                          fdesc0
(0083)  C Cputype                        cputy0
(0084)  C Prtform                        prtfo0
(0085)  C Tsbf                           tsbfa0
(0086)  C Curcol                         curco0
(0087)  C Lastfn                         lastf0
(0088)  C Insertmode                     inser0
(0089)  C Fdbuf                          fdbuf0
(0090)  C Argv                           argva0
(0091)  C Lstop                          lstop0
(0092)  C Tcceollen                      tccep0
(0093)  C Tcshiftchar                    tcshk0
(0094)  C Inputwait                      inpuv0
(0095)  C Fdunit                         fduni0
(0096)  C Termcp                         termc0
(0097)  C Kchar                          kchar0
(0098)  C Fdmem                          fdmem0
(0099)  C Fddev                          fddev0
(0100)  C Fdvcstat1                      fdvcs0
(0101)  C Lastdef                        laste0
(0102)  C Tcdelaytime                    tcdem0
(0103)  C Fdvcstat2                      fdvct0
(0104)  C Killresp                       killr0
(0105)  C Tccleardelay                   tcclh0
(0106)  C Padrow                         padro0
(0107)  C Fntab                          fntab0
(0108)  C Reservednewscr                 resev0
(0109)  C Reservedcurscr                 resew0
(0110)  C Utempbuf                       utemq0
(0111)  C Rtlabel                        rtlab0
(0112)  C Lsho                           lshoa0
(0113)  C Tcvertpos                      tcver0
(0114)  C Tcwraparound                   tcwra0
(0115)  C Tchomelen                      tchom0
(0116)  C Tcceoslen                      tcceo0
(0117)  C Fdbufend                       fdbui0
(0118)  C Tcspeed                        tcspe0
(0119)  C Tcleftlen                      tclef0
(0120)  C Pbbuf                          pbbuf0
(0121)  C Fdopstat1                      fdops0
(0122)  C Passwd                         passw0
(0123)  C Newscr                         newsc0
(0124)  C Curscr                         cursc0
(0125)  C Duplex                         duple0
(0126)  C Fdopstat2                      fdopt0
(0127)  C Tccursorhome                   tccur0
(0128)  C Fdopstat3                      fdopu0
(0129)  C Tspath                         tspat0
(0130)  C Tsat                           tsata0
(0131)  C Tccursorleft                   tccus0
(0132)  C Colchgstart                    colch0
(0133)  C Reservedshell                  reset0
(0134)  C Inbuf                          inbuf0
(0135)  C Nestingcount                   nesti0
(0136)  C Reservedtscan                  reseu0
(0137)  C Defbuf                         defbu0
(0138)  C Uhashtb                        uhash0
(0139)  C Fdbuflen                       fdbuh0
(0140)  C Cmdstat                        cmdst0
(0141)  C Tchorpos                       tchor0
(0142)  C Tcinsline                      tcins0
(0143)  C Msgowner                       msgow0
(0144)  C Fdlastfd                       fdlas0
(0145)  C Termattr                       terma0
(0146)  C Tsgt                           tsgta0
(0147)  C Tcshiftout                     tcshj0
(0148)  C Inputstop                      inpuu0
(0149)  C Firstuse                       first0
(0150)  C Tcshiftin                      tcshi0
(0151)  C Displaytime                    displ0
(0152)  C Fdcount                        fdcou0
(0153)  C Termbuf                        termb0
(0154)  C Lsref                          lsref0
(0155)  C Tcabslen                       tcabt0
(0156)  C Rowchgstop                     rowci0
(0157)  C Maxrow                         maxro0
(0158)  C Padcol                         padco0
(0159)  C Lastcharscanned                lastd0
(0160)  C Msgrow                         msgro0
(0161)  C Padlen                         padle0
(0162)  C Stdporttbl                     stdpo0
(0163)  C Argc                           argca0
(0164)  C Termtype                       termt0
(0165)  C Tccleartoeol                   tcclf0
(0166)  C Tccursordown                   tccuv0
(0167)  C Currow                         curro0
(0168)  C Nlchar                         nlcha0
(0169)  C Isphantom                      ispha0
(0170)  C Tsun                           tsuna0
(0171)  C Tsps                           tspsa0
(0172)  C Reservedvthmisc                resex0
(0173)  C Tcuplen                        tcupl0
(0174)  C Lastchar                       lastc0
(0175)  C Utemptop                       utemp0
(0176)  C Bplabel                        bplab0
(0177)  C Tspw                           tspwa0
(0178)  C Tcclearscreen                  tccle0
(0179)  C Tccoordtype                    tccop0
(0180)  C Tcvertlen                      tcves0
(0181)  C Fdbcount                       fdbco0
(0182)  C Comunit                        comun0
(0183)  C Tccleartoeos                   tcclg0
(0184)  C Tccursorup                     tccuu0
(0185)  C Tcclrlen                       tcclr0
(0186)  C Errcod                         errco0
(0187)  C Lword                          lword0
(0188)  C Pbptr                          pbptr0
