      CALL MAIN
      END

      SUBROUTINE P3
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 4
99998 CALL P$UJC
    5 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 437
      CALL P$LDO(1,27)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,27)
      LINENO = 439
      CALL P$LAO(7)
      CALL P$PAG
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 440
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LCA(26223)
      CALL P$LDC(1,INTL(13))
      CALL P$LDC(1,INTL(13))
      CALL P$WRS
      CALL P$LCA(26227)
      CALL P$LDC(1,INTL(12))
      CALL P$LDC(1,INTL(12))
      CALL P$WRS
      SP=SP-1
      LINENO = 441
      CALL P$LAO(7)
      CALL P$LCA(26230)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(174))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(8))
      CALL P$WRC
      SP=SP-1
      LINENO = 442
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,13026)
      CALL P$LDC(1,INTL(8))
      CALL P$STR(0,5)
    6 CONTINUE
      CALL P$LDO(1,13026)
      CALL P$LOD(0,5)
      CALL P$LEQ(1)
      CALL P$FJP($7)
      CALL P$LAO(7)
      CALL P$LAO(6469)
      CALL P$LDO(1,13026)
      CALL P$CHK(INTL(1),INTL(8))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(6,0)
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      CALL P$LDO(1,13026)
      CALL P$INC(1,INTL(1))
      CALL P$SRO(1,13026)
      GOTO 6
    7 CONTINUE
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(4))
      CALL P$WRC
      SP=SP-1
      LINENO = 443
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,13026)
      CALL P$LDC(1,INTL(8))
      CALL P$STR(0,5)
    8 CONTINUE
      CALL P$LDO(1,13026)
      CALL P$LOD(0,5)
      CALL P$LEQ(1)
      CALL P$FJP($9)
      CALL P$LAO(7)
      CALL P$LAO(6461)
      CALL P$LDO(1,13026)
      CALL P$CHK(INTL(1),INTL(8))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(6,0)
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      CALL P$LDO(1,13026)
      CALL P$INC(1,INTL(1))
      CALL P$SRO(1,13026)
      GOTO 8
    9 CONTINUE
      LINENO = 444
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(24))
      CALL P$WRC
      CALL P$LCA(26233)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LDO(1,27)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 445
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 446
      CALL P$LDC(1,INTL(56))
      CALL P$SRO(1,26)
      CALL P$RET(0)
      RETURN
    4 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 23
      GOTO 5
      END

      SUBROUTINE P10
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 11
99998 CALL P$UJC
   12 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 463
      CALL P$LDO(1,191)
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$FJP($13)
      LINENO = 464
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(2))
      CALL P$SBI
      CALL P$SRO(1,26)
      LINENO = 465
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LCA(26235)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(15))
      CALL P$WRC
      SP=SP-1
      LINENO = 466
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,10)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,9)
      LINENO = 467
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,5)
      CALL P$LDO(1,191)
      CALL P$STR(0,11)
   14 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,11)
      CALL P$LEQ(1)
      CALL P$FJP($15)
      LINENO = 468
      CALL P$LAO(193)
      CALL P$LOD(0,5)
      CALL P$CHK(INTL(1),INTL(10))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$STRA(0,12)
      LINENO = 469
      CALL P$LODA(0,12)
      CALL P$IND(1,0)
      CALL P$STR(0,8)
      CALL P$LODA(0,12)
      CALL P$IND(1,1)
      CALL P$STR(0,7)
      LINENO = 470
      CALL P$LOD(0,8)
      CALL P$LOD(0,10)
      CALL P$EQU(1,1)
      CALL P$FJP($16)
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 17
   16 CONTINUE
      LINENO = 471
      LINENO = 472
   18 CONTINUE
      LINENO = 472
      CALL P$LOD(0,9)
      CALL P$LOD(0,8)
      CALL P$LES(1,1)
      CALL P$FJP($19)
      LINENO = 473
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      CALL P$LOD(0,9)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,9)
      GOTO 18
   19 CONTINUE
      LINENO = 474
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(222))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 475
      CALL P$LOD(0,8)
      CALL P$STR(0,10)
   17 CONTINUE
      LINENO = 477
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(10))
      CALL P$LES(1,1)
      CALL P$FJP($20)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,6)
      GOTO 21
   20 CONTINUE
      LINENO = 478
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(100))
      CALL P$LES(1,1)
      CALL P$FJP($22)
      CALL P$LDC(1,INTL(2))
      CALL P$STR(0,6)
      GOTO 23
   22 CONTINUE
      LINENO = 479
      CALL P$LDC(1,INTL(3))
      CALL P$STR(0,6)
   23 CONTINUE
   21 CONTINUE
      LINENO = 480
      CALL P$LAO(7)
      CALL P$LOD(0,7)
      CALL P$LOD(0,6)
      CALL P$WRI
      SP=SP-1
      LINENO = 481
      CALL P$LOD(0,9)
      CALL P$LOD(0,6)
      CALL P$ADI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,9)
      CALL P$LOD(0,5)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,5)
      GOTO 14
   15 CONTINUE
      LINENO = 483
      CALL P$LAO(7)
      CALL P$WLN
      LINENO = 484
      CALL P$LDO(1,226)
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$FJP($24)
      LINENO = 485
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(21))
      CALL P$WRC
      CALL P$LCA(26237)
      CALL P$LDC(1,INTL(19))
      CALL P$LDC(1,INTL(19))
      CALL P$WRS
      CALL P$LDO(1,226)
      CALL P$LDC(1,INTL(10))
      CALL P$WRI
      CALL P$WLN
      GOTO 25
   24 CONTINUE
      LINENO = 487
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(21))
      CALL P$WRC
      CALL P$LCA(26242)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      CALL P$WLN
   25 CONTINUE
      LINENO = 488
      CALL P$LDO(1,25)
      CALL P$SRO(1,226)
      LINENO = 489
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$SRO(1,191)
   13 CONTINUE
      LINENO = 491
      CALL P$LDO(1,25)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,25)
      LINENO = 492
      CALL P$LDO(3,32)
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$NOT
      CALL P$AND
      CALL P$FJP($26)
      LINENO = 493
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$SRO(1,26)
      LINENO = 494
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(1))
      CALL P$LES(1,1)
      CALL P$FJP($27)
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P3
   27 CONTINUE
      LINENO = 495
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LDO(1,25)
      CALL P$LDC(1,INTL(5))
      CALL P$WRI
      SP=SP-1
      LINENO = 496
      CALL P$LAO(7)
      CALL P$LDO(1,62)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$LDC(1,INTL(4))
      CALL P$WRI
      CALL P$LDO(1,28)
      CALL P$LDC(1,INTL(3))
      CALL P$WRI
      SP=SP-1
      LINENO = 497
      CALL P$LDO(3,30)
      CALL P$FJP($28)
      CALL P$LAO(7)
      CALL P$LDO(1,23)
      CALL P$LDC(1,INTL(7))
      CALL P$WRI
      SP=SP-1
      GOTO 29
   28 CONTINUE
      LINENO = 498
      CALL P$LAO(7)
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(7))
      CALL P$WRI
      SP=SP-1
   29 CONTINUE
      LINENO = 500
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
   26 CONTINUE
      LINENO = 502
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,22)
      CALL P$RET(0)
      RETURN
   11 CONTINUE
      SG1SIZ = 13
      SG2SIZ = 29
      GOTO 12
      END

      SUBROUTINE P31
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 32
99998 CALL P$UJC
   33 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 516
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(255))
      CALL P$LEQ(1,1)
      CALL P$FJP($34)
      LINENO = 517
      CALL P$LDC(1,INTL(7))
      CALL P$LDO(4,213)
      CALL P$LOD(0,5)
      CALL P$SGS
      CALL P$UNI
      CALL P$LDC(1,INTL(7))
      CALL P$SRO(4,213)
      GOTO 35
   34 CONTINUE
      LINENO = 519
      CALL P$LDC(1,INTL(4))
      CALL P$LDO(4,221)
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(255))
      CALL P$SBI
      CALL P$SGS
      CALL P$UNI
      CALL P$LDC(1,INTL(4))
      CALL P$SRO(4,221)
   35 CONTINUE
      CALL P$RET(0)
      RETURN
   32 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 37
      GOTO 33
      END

      SUBROUTINE P30
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 36
99998 CALL P$UJC
   37 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 523
      CALL P$LDO(1,191)
      CALL P$LDC(1,INTL(9))
      CALL P$GEQ(1,1)
      CALL P$FJP($38)
      LINENO = 524
      CALL P$LAO(193)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(1),INTL(10))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(255))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$STO(1)
      CALL P$MST(0)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P31
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$SRO(1,191)
      GOTO 39
   38 CONTINUE
      LINENO = 525
      LINENO = 526
      CALL P$LDO(1,191)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$SRO(1,191)
      LINENO = 527
      CALL P$LAO(193)
      CALL P$LDO(1,191)
      CALL P$CHK(INTL(1),INTL(10))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$INC(0,INTL(1))
      CALL P$LOD(0,5)
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$STO(1)
      LINENO = 528
      CALL P$MST(0)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P31
   39 CONTINUE
      LINENO = 530
      CALL P$LAO(193)
      CALL P$LDO(1,191)
      CALL P$CHK(INTL(1),INTL(10))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LDO(1,22)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
   36 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 15
      GOTO 37
      END

      SUBROUTINE P40
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 41
99998 CALL P$UJC
   42 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 543
      CALL P$LAO(7)
      CALL P$WLN
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(400))
      CALL P$SRO(1,192)
      LINENO = 544
      CALL P$LDO(1,226)
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$LDO(1,226)
      CALL P$LDO(1,25)
      CALL P$NEQ(1,1)
      CALL P$AND
      CALL P$FJP($43)
      LINENO = 546
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(21))
      CALL P$WRC
      CALL P$LCA(26245)
      CALL P$LDC(1,INTL(19))
      CALL P$LDC(1,INTL(19))
      CALL P$WRS
      CALL P$LDO(1,226)
      CALL P$LDC(1,INTL(10))
      CALL P$WRI
      CALL P$WLN
   43 CONTINUE
      LINENO = 547
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$SRO(1,26)
      LINENO = 548
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(7))
      CALL P$LEQ(1,1)
      CALL P$FJP($44)
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P3
   44 CONTINUE
      LINENO = 549
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 550
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 551
      CALL P$LDC(1,INTL(7))
      CALL P$LDO(4,213)
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32367))
      CALL P$NEQ(4,8)
      CALL P$LDC(1,INTL(4))
      CALL P$LDO(4,221)
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32367))
      CALL P$NEQ(4,5)
      CALL P$IOR
      CALL P$FJP($45)
      LINENO = 552
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(5))
      CALL P$WRC
      CALL P$LCA(26250)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$WLN
      LINENO = 553
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(5))
      CALL P$WRC
      CALL P$LCA(26252)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(5))
      CALL P$WRC
      CALL P$LCA(26254)
      CALL P$LDC(1,INTL(7))
      CALL P$LDC(1,INTL(7))
      CALL P$WRS
      CALL P$WLN
      LINENO = 554
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(5))
      CALL P$WRC
      CALL P$LCA(26256)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(5))
      CALL P$WRC
      CALL P$LCA(26258)
      CALL P$LDC(1,INTL(7))
      CALL P$LDC(1,INTL(7))
      CALL P$WRS
      CALL P$WLN
      LINENO = 555
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 556
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(6))
      CALL P$SBI
      CALL P$SRO(1,26)
      LINENO = 557
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,5)
      CALL P$LDC(1,INTL(255))
      CALL P$STR(0,6)
   46 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,6)
      CALL P$LEQ(1)
      CALL P$FJP($47)
      LINENO = 558
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(7))
      CALL P$LDO(4,213)
      CALL P$INN
      CALL P$FJP($48)
      LINENO = 559
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(3))
      CALL P$WRI
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(7))
      CALL P$WRC
      CALL P$LAO(865)
      CALL P$LOD(0,5)
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LDC(1,INTL(50))
      CALL P$LDC(1,INTL(50))
      CALL P$WRS
      CALL P$WLN
      LINENO = 560
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$SRO(1,26)
      LINENO = 561
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(1))
      CALL P$LES(1,1)
      CALL P$FJP($49)
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P3
   49 CONTINUE
      LINENO = 562
      CALL P$LDO(1,192)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(400))
      CALL P$SRO(1,192)
   48 CONTINUE
      CALL P$LOD(0,5)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,5)
      GOTO 46
   47 CONTINUE
      LINENO = 564
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,5)
      CALL P$LDC(1,INTL(145))
      CALL P$STR(0,6)
   50 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,6)
      CALL P$LEQ(1)
      CALL P$FJP($51)
      LINENO = 565
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(4))
      CALL P$LDO(4,221)
      CALL P$INN
      CALL P$FJP($52)
      LINENO = 566
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(255))
      CALL P$ADI
      CALL P$LDC(1,INTL(3))
      CALL P$WRI
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(7))
      CALL P$WRC
      CALL P$LAO(865)
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(255))
      CALL P$ADI
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LDC(1,INTL(50))
      CALL P$LDC(1,INTL(50))
      CALL P$WRS
      CALL P$WLN
      LINENO = 567
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$SRO(1,26)
      LINENO = 568
      CALL P$LDO(1,26)
      CALL P$LDC(1,INTL(1))
      CALL P$LES(1,1)
      CALL P$FJP($53)
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P3
   53 CONTINUE
      LINENO = 569
      CALL P$LDO(1,192)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(400))
      CALL P$SRO(1,192)
   52 CONTINUE
      CALL P$LOD(0,5)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,5)
      GOTO 50
   51 CONTINUE
   45 CONTINUE
      CALL P$RET(0)
      RETURN
   41 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 37
      GOTO 42
      END

      SUBROUTINE P54
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 55
99998 CALL P$UJC
   56 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 581
      CALL P$LDO(3,21)
      CALL P$FJP($57)
      LINENO = 582
      CALL P$LDO(3,32)
      CALL P$FJP($58)
      CALL P$LAO(7)
      CALL P$WLN
   58 CONTINUE
      LINENO = 583
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P10
   57 CONTINUE
      LINENO = 585
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$NOT
      CALL P$FJP($59)
      LINENO = 586
      CALL P$LAO(5)
      CALL P$ELN
      CALL P$SRO(3,21)
      CALL P$LAO(5)
      CALL P$LAO(20)
      CALL P$RDC
      SP=SP-1
      LINENO = 587
      CALL P$LDO(3,32)
      CALL P$LDO(3,21)
      CALL P$NOT
      CALL P$AND
      CALL P$FJP($60)
      CALL P$LAO(7)
      CALL P$LDO(6,20)
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
   60 CONTINUE
      LINENO = 588
      CALL P$LDO(1,22)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,22)
      GOTO 61
   59 CONTINUE
      LINENO = 590
      LINENO = 591
      CALL P$LAO(7)
      CALL P$LCA(26260)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      CALL P$LCA(26263)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      CALL P$WLN
      LINENO = 592
      CALL P$LODA(0,5)
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
   61 CONTINUE
      CALL P$RET(0)
      RETURN
   55 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 17
      GOTO 56
      END

      SUBROUTINE P66
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 67
99998 CALL P$UJC
   68 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 616
      CALL P$LOD(0,5)
      CALL P$LDC(6,INTL(225))
      CALL P$GEQ(6,1)
      CALL P$LOD(0,5)
      CALL P$LDC(6,INTL(250))
      CALL P$LEQ(6,1)
      CALL P$AND
      CALL P$FJP($69)
      LINENO = 617
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(32))
      CALL P$SBI
      CALL P$CHK(INTL(128),INTL(255))
      CALL P$STR(0,0)
      GOTO 70
   69 CONTINUE
      LINENO = 619
      CALL P$LOD(0,5)
      CALL P$STR(0,0)
   70 CONTINUE
      CALL P$RET(1)
      RETURN
   67 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 11
      GOTO 68
      END

      SUBROUTINE P71
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 72
99998 CALL P$UJC
   73 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 627
   74 CONTINUE
      LINENO = 628
      CALL P$MST(2)
      CALL P$LDA(1,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 629
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(170))
      CALL P$NEQ(6,1)
      CALL P$FJP($75)
      LINENO = 630
      CALL P$LDO(6,20)
      CALL P$STR(0,5)
      CALL P$MST(2)
      CALL P$LDA(1,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 631
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(1542))
      CALL P$LDC(4,INTL(32367))
      CALL P$INN
      CALL P$FJP($76)
      LINENO = 632
      CALL P$LOD(0,5)
      GOTO 77
   79 CONTINUE
      LINENO = 633
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(171))
      CALL P$EQU(6,1)
      CALL P$SRO(3,39)
      GOTO 78
   80 CONTINUE
      LINENO = 634
      LINENO = 635
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(171))
      CALL P$EQU(6,1)
      CALL P$SRO(3,32)
      LINENO = 636
      CALL P$LDO(3,32)
      CALL P$NOT
      CALL P$FJP($81)
      CALL P$LAO(7)
      CALL P$WLN
   81 CONTINUE
      GOTO 78
   82 CONTINUE
      LINENO = 638
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(171))
      CALL P$EQU(6,1)
      CALL P$SRO(3,33)
      GOTO 78
   83 CONTINUE
      LINENO = 639
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(171))
      CALL P$EQU(6,1)
      CALL P$SRO(3,34)
      GOTO 78
   84 CONTINUE
      LINENO = 640
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(171))
      CALL P$EQU(6,1)
      CALL P$SRO(3,38)
      GOTO 78
   85 CONTINUE
      LINENO = 641
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(177))
      CALL P$EQU(6,1)
      CALL P$FJP($86)
      LINENO = 642
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,36)
      LINENO = 643
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,37)
      GOTO 87
   86 CONTINUE
      LINENO = 644
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(178))
      CALL P$EQU(6,1)
      CALL P$FJP($88)
      LINENO = 645
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,36)
      LINENO = 646
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,37)
      GOTO 89
   88 CONTINUE
      LINENO = 647
      LINENO = 648
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,36)
      LINENO = 649
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,37)
   89 CONTINUE
   87 CONTINUE
      GOTO 78
   90 CONTINUE
      LINENO = 650
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(171))
      CALL P$EQU(6,1)
      CALL P$SRO(3,35)
      GOTO 78
   77 CONTINUE
      CALL P$CHK(INTL(194),INTL(212))
      CALL P$LDC(1,INTL(194))
      CALL P$SBI
      CALL P$XJP($91)
   91 CONTINUE
   92 GOTO 82
   93 GOTO 90
   94 GOTO 83
   95 GOTO 99998
   96 GOTO 99998
   97 GOTO 99998
   98 GOTO 99998
   99 GOTO 99998
  100 GOTO 99998
  101 GOTO 99998
  102 GOTO 80
  103 GOTO 99998
  104 GOTO 99998
  105 GOTO 99998
  106 GOTO 84
  107 GOTO 99998
  108 GOTO 85
  109 GOTO 99998
  110 GOTO 79
   78 CONTINUE
   76 CONTINUE
      LINENO = 652
      CALL P$MST(2)
      CALL P$LDA(1,45)
      CALL P$CUP(1)
      CALL P54
   75 CONTINUE
      LINENO = 654
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(172))
      CALL P$NEQ(6,1)
      CALL P$FJP($74)
      CALL P$RET(0)
      RETURN
   72 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 27
      GOTO 73
      END

      SUBROUTINE P62
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 111
99998 CALL P$UJC
  112 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
   63 CONTINUE
      LINENO = 660
  113 CONTINUE
      LINENO = 661
  114 CONTINUE
      LINENO = 661
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(160))
      CALL P$EQU(6,1)
      CALL P$LDO(3,21)
      CALL P$NOT
      CALL P$AND
      CALL P$FJP($115)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 114
  115 CONTINUE
      LINENO = 662
      CALL P$LDO(3,21)
      CALL P$STR(0,45)
      LINENO = 663
      CALL P$LOD(0,45)
      CALL P$FJP($116)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
  116 CONTINUE
      LINENO = 664
      CALL P$LOD(0,45)
      CALL P$NOT
      CALL P$FJP($113)
      LINENO = 665
      CALL P$LAO(248)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($117)
      LINENO = 666
      CALL P$LDC(1,INTL(52))
      CALL P$SRO(1,13)
      CALL P$LDC(1,INTL(15))
      CALL P$SRO(1,14)
      LINENO = 667
      CALL P$MST(1)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 118
  117 CONTINUE
      LINENO = 670
      CALL P$LDO(6,20)
      GOTO 119
  121 CONTINUE
      LINENO = 676
      LINENO = 678
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,6)
      CALL P$LAO(18)
      CALL P$LCA(26266)
      CALL P$MOV(2)
      LINENO = 679
  122 CONTINUE
      LINENO = 680
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(8))
      CALL P$LES(1,1)
      CALL P$FJP($123)
      LINENO = 681
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,6)
      CALL P$LAO(18)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(8))
      CALL P$DEC(1,INTL(1))
      CALL P$MST(0)
      CALL P$LDO(6,20)
      CALL P$CUP(1)
      CALL P66
      CALL P$SPC
  123 CONTINUE
      LINENO = 682
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 683
      CALL P$LAO(248)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32368))
      CALL P$INN
      CALL P$FJP($122)
      LINENO = 684
      CALL P$LAO(450)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$STR(0,7)
      CALL P$LAO(450)
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$STR(0,47)
  124 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,47)
      CALL P$LEQ(1)
      CALL P$FJP($125)
      LINENO = 685
      CALL P$LAO(376)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LAO(18)
      CALL P$EQU(5,8)
      CALL P$FJP($126)
      LINENO = 686
      CALL P$LAO(459)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$SRO(1,13)
      CALL P$LAO(624)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$SRO(1,14)
      GOTO 64
  127 CONTINUE
  126 CONTINUE
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 124
  125 CONTINUE
      LINENO = 688
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,13)
      CALL P$LDC(1,INTL(15))
      CALL P$SRO(1,14)
   64 CONTINUE
      GOTO 120
  128 CONTINUE
      LINENO = 693
      LINENO = 695
      CALL P$LDC(1,INTL(15))
      CALL P$SRO(1,14)
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,7)
      LINENO = 696
  129 CONTINUE
      LINENO = 697
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,7)
      LINENO = 698
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(15))
      CALL P$LEQ(1,1)
      CALL P$FJP($130)
      CALL P$LDA(0,8)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDO(6,20)
      CALL P$SPC
  130 CONTINUE
      LINENO = 699
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 700
      CALL P$LAO(248)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(1))
      CALL P$NEQ(1,1)
      CALL P$FJP($129)
      LINENO = 701
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(174))
      CALL P$EQU(6,1)
      CALL P$MST(0)
      CALL P$LDO(6,20)
      CALL P$CUP(1)
      CALL P66
      CALL P$LDC(6,INTL(197))
      CALL P$EQU(6,1)
      CALL P$IOR
      CALL P$FJP($131)
      LINENO = 702
      CALL P$LOD(0,7)
      CALL P$STR(0,6)
      LINENO = 703
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(174))
      CALL P$EQU(6,1)
      CALL P$FJP($132)
      LINENO = 704
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,6)
      LINENO = 705
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(15))
      CALL P$LEQ(1,1)
      CALL P$FJP($133)
      CALL P$LDA(0,8)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDO(6,20)
      CALL P$SPC
  133 CONTINUE
      LINENO = 706
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 707
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(174))
      CALL P$EQU(6,1)
      CALL P$FJP($134)
      CALL P$LDC(6,INTL(186))
      CALL P$SRO(6,20)
      GOTO 65
  135 CONTINUE
  134 CONTINUE
      LINENO = 708
      CALL P$LAO(248)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(1))
      CALL P$NEQ(1,1)
      CALL P$FJP($136)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(201))
      CALL P$CUP(1)
      CALL P30
      GOTO 137
  136 CONTINUE
      LINENO = 710
  138 CONTINUE
      LINENO = 711
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,6)
      LINENO = 712
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(15))
      CALL P$LEQ(1,1)
      CALL P$FJP($139)
      CALL P$LDA(0,8)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDO(6,20)
      CALL P$SPC
  139 CONTINUE
      LINENO = 713
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 714
      CALL P$LAO(248)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(1))
      CALL P$NEQ(1,1)
      CALL P$FJP($138)
  137 CONTINUE
  132 CONTINUE
      LINENO = 716
      CALL P$MST(0)
      CALL P$LDO(6,20)
      CALL P$CUP(1)
      CALL P66
      CALL P$LDC(6,INTL(197))
      CALL P$EQU(6,1)
      CALL P$FJP($140)
      LINENO = 717
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,6)
      LINENO = 718
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(15))
      CALL P$LEQ(1,1)
      CALL P$FJP($141)
      CALL P$LDA(0,8)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDO(6,20)
      CALL P$SPC
  141 CONTINUE
      LINENO = 719
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 720
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(171))
      CALL P$EQU(6,1)
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(173))
      CALL P$EQU(6,1)
      CALL P$IOR
      CALL P$FJP($142)
      LINENO = 721
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,6)
      LINENO = 722
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(15))
      CALL P$LEQ(1,1)
      CALL P$FJP($143)
      CALL P$LDA(0,8)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDO(6,20)
      CALL P$SPC
  143 CONTINUE
      LINENO = 723
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
  142 CONTINUE
      LINENO = 725
      CALL P$LAO(248)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(1))
      CALL P$NEQ(1,1)
      CALL P$FJP($144)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(201))
      CALL P$CUP(1)
      CALL P30
      GOTO 145
  144 CONTINUE
      LINENO = 727
  146 CONTINUE
      LINENO = 728
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,6)
      LINENO = 729
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(15))
      CALL P$LEQ(1,1)
      CALL P$FJP($147)
      CALL P$LDA(0,8)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDO(6,20)
      CALL P$SPC
  147 CONTINUE
      LINENO = 730
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 731
      CALL P$LAO(248)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(1))
      CALL P$NEQ(1,1)
      CALL P$FJP($146)
  145 CONTINUE
  140 CONTINUE
      LINENO = 733
      CALL P$LDA(0,44)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      CALL P$LDC(1,INTL(2))
      CALL P$SRO(1,13)
      CALL P$LODA(0,44)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 734
      CALL P$LODA(0,44)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,47)
      LINENO = 735
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,7)
      CALL P$LDC(1,INTL(16))
      CALL P$STR(0,48)
  148 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,48)
      CALL P$LEQ(1)
      CALL P$FJP($149)
      CALL P$LODA(0,47)
      CALL P$INC(0,INTL(1))
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDC(6,INTL(160))
      CALL P$SPC
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 148
  149 CONTINUE
      LINENO = 736
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(15))
      CALL P$LEQ(1,1)
      CALL P$FJP($150)
      LINENO = 737
      CALL P$LDC(1,INTL(2))
      CALL P$STR(0,7)
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,48)
  151 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,48)
      CALL P$LEQ(1)
      CALL P$FJP($152)
      CALL P$LODA(0,47)
      CALL P$INC(0,INTL(1))
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDA(0,8)
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LPC
      CALL P$SPC
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 151
  152 CONTINUE
      GOTO 153
  150 CONTINUE
      LINENO = 738
      LINENO = 739
      CALL P$MST(1)
      CALL P$LDC(1,INTL(203))
      CALL P$CUP(1)
      CALL P30
      CALL P$LODA(0,47)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDC(6,INTL(176))
      CALL P$SPC
      LINENO = 740
      CALL P$LODA(0,47)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDC(6,INTL(174))
      CALL P$SPC
      CALL P$LODA(0,47)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDC(6,INTL(176))
      CALL P$SPC
  153 CONTINUE
      LINENO = 743
      CALL P$LODA(0,44)
      CALL P$SRO(0,16)
      GOTO 154
  131 CONTINUE
      LINENO = 745
   65 CONTINUE
      LINENO = 747
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(194))
      CALL P$EQU(6,1)
      CALL P$FJP($155)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(8),INTL(10))
      CALL P$STR(0,5)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 156
  155 CONTINUE
      LINENO = 748
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(8),INTL(10))
      CALL P$STR(0,5)
  156 CONTINUE
      LINENO = 749
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(15))
      CALL P$GRT(1,1)
      CALL P$FJP($157)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(203))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,16)
      GOTO 158
  157 CONTINUE
      LINENO = 751
      LINENO = 752
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,16)
      LINENO = 753
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,6)
      CALL P$LOD(0,7)
      CALL P$STR(0,47)
  159 CONTINUE
      CALL P$LOD(0,6)
      CALL P$LOD(0,47)
      CALL P$LEQ(1)
      CALL P$FJP($160)
      LINENO = 754
      CALL P$LDO(1,16)
      CALL P$LOD(0,5)
      CALL P$MPI
      CALL P$LAO(6350)
      CALL P$LDA(0,8)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LPC
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$ADI
      CALL P$SRO(1,16)
      CALL P$LOD(0,6)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,6)
      GOTO 159
  160 CONTINUE
      LINENO = 755
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,13)
  158 CONTINUE
  154 CONTINUE
      GOTO 120
  161 CONTINUE
      LINENO = 761
      LINENO = 763
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,17)
      CALL P$LDC(1,INTL(3))
      CALL P$SRO(1,13)
      CALL P$LDC(1,INTL(15))
      CALL P$SRO(1,14)
      LINENO = 764
  162 CONTINUE
      LINENO = 765
  163 CONTINUE
      LINENO = 766
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,17)
      LINENO = 767
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(128))
      CALL P$LEQ(1,1)
      CALL P$FJP($164)
      CALL P$LDA(0,12)
      CALL P$LDO(1,17)
      CALL P$CHK(INTL(1),INTL(128))
      CALL P$DEC(1,INTL(1))
      CALL P$LDO(6,20)
      CALL P$SPC
  164 CONTINUE
      LINENO = 768
      CALL P$LDO(3,21)
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(167))
      CALL P$EQU(6,1)
      CALL P$IOR
      CALL P$FJP($163)
      LINENO = 769
      CALL P$LDO(3,21)
      CALL P$FJP($165)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(202))
      CALL P$CUP(1)
      CALL P30
      GOTO 166
  165 CONTINUE
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
  166 CONTINUE
      LINENO = 770
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(167))
      CALL P$NEQ(6,1)
      CALL P$FJP($162)
      LINENO = 771
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$SRO(1,17)
      LINENO = 772
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($167)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(205))
      CALL P$CUP(1)
      CALL P30
      GOTO 168
  167 CONTINUE
      LINENO = 773
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($169)
      LINENO = 774
      CALL P$LDA(0,12)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(128))
      CALL P$DEC(1,INTL(1))
      CALL P$LPC
      CALL P$SRO(1,16)
      GOTO 170
  169 CONTINUE
      LINENO = 775
      LINENO = 776
      CALL P$LDA(0,44)
      CALL P$LDC(1,INTL(3))
      CALL P$NEW
      CALL P$LODA(0,44)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 777
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(128))
      CALL P$GRT(1,1)
      CALL P$FJP($171)
      LINENO = 778
      CALL P$MST(1)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(1,INTL(128))
      CALL P$SRO(1,17)
  171 CONTINUE
      LINENO = 779
      CALL P$LODA(0,44)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,47)
      LINENO = 780
      CALL P$LODA(0,47)
      CALL P$INC(0,INTL(1))
      CALL P$LDO(1,17)
      CALL P$CHK(INTL(0),INTL(128))
      CALL P$STO(1)
      LINENO = 781
      CALL P$LODA(0,47)
      CALL P$INC(0,INTL(2))
      CALL P$LDO(1,13027)
      CALL P$CHK(INTL(0),INTL(24575))
      CALL P$STO(1)
      LINENO = 782
      CALL P$LDO(1,13027)
      CALL P$LODA(0,47)
      CALL P$IND(1,1)
      CALL P$ADI
      CALL P$LDC(1,INTL(24575))
      CALL P$LDC(1,INTL(3))
      CALL P$SBI
      CALL P$LEQ(1,1)
      CALL P$FJP($172)
      LINENO = 783
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,6)
      CALL P$LODA(0,47)
      CALL P$IND(1,1)
      CALL P$STR(0,48)
  173 CONTINUE
      CALL P$LOD(0,6)
      CALL P$LOD(0,48)
      CALL P$LEQ(1)
      CALL P$FJP($174)
      LINENO = 784
      CALL P$LAO(6480)
      CALL P$LDO(1,13027)
      CALL P$CHK(INTL(0),INTL(24575))
      CALL P$LDA(0,12)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(128))
      CALL P$DEC(1,INTL(1))
      CALL P$LPC
      CALL P$SPC
      LINENO = 785
      CALL P$LDO(1,13027)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,13027)
      CALL P$LOD(0,6)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,6)
      GOTO 173
  174 CONTINUE
      LINENO = 787
  175 CONTINUE
      LINENO = 787
      CALL P$LDO(1,13027)
      CALL P$LDC(1,INTL(4))
      CALL P$MOD
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($176)
      LINENO = 788
      CALL P$LAO(6480)
      CALL P$LDO(1,13027)
      CALL P$CHK(INTL(0),INTL(24575))
      CALL P$LDC(6,INTL(160))
      CALL P$SPC
      LINENO = 789
      CALL P$LDO(1,13027)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,13027)
      GOTO 175
  176 CONTINUE
      GOTO 177
  172 CONTINUE
      LINENO = 792
      CALL P$MST(1)
      CALL P$LDC(1,INTL(351))
      CALL P$CUP(1)
      CALL P30
  177 CONTINUE
      LINENO = 794
      CALL P$LODA(0,44)
      CALL P$SRO(0,16)
  170 CONTINUE
  168 CONTINUE
      GOTO 120
  178 CONTINUE
      LINENO = 799
      LINENO = 801
      CALL P$LDC(1,INTL(15))
      CALL P$SRO(1,14)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 802
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(189))
      CALL P$EQU(6,1)
      CALL P$FJP($179)
      LINENO = 803
      CALL P$LDC(1,INTL(17))
      CALL P$SRO(1,13)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 180
  179 CONTINUE
      LINENO = 804
      CALL P$LDC(1,INTL(16))
      CALL P$SRO(1,13)
  180 CONTINUE
      GOTO 120
  181 CONTINUE
      LINENO = 808
      LINENO = 810
      CALL P$LDC(1,INTL(15))
      CALL P$SRO(1,14)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 811
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(174))
      CALL P$EQU(6,1)
      CALL P$FJP($182)
      LINENO = 812
      CALL P$LDC(1,INTL(16))
      CALL P$SRO(1,13)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 183
  182 CONTINUE
      LINENO = 813
      CALL P$LDC(1,INTL(14))
      CALL P$SRO(1,13)
  183 CONTINUE
      GOTO 120
  184 CONTINUE
      LINENO = 817
      LINENO = 819
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      CALL P$LDC(1,INTL(7))
      CALL P$SRO(1,13)
      LINENO = 820
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(189))
      CALL P$EQU(6,1)
      CALL P$FJP($185)
      LINENO = 821
      CALL P$LDC(1,INTL(9))
      CALL P$SRO(1,14)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 186
  185 CONTINUE
      LINENO = 822
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(190))
      CALL P$EQU(6,1)
      CALL P$FJP($187)
      LINENO = 823
      CALL P$LDC(1,INTL(12))
      CALL P$SRO(1,14)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 188
  187 CONTINUE
      LINENO = 824
      CALL P$LDC(1,INTL(8))
      CALL P$SRO(1,14)
  188 CONTINUE
  186 CONTINUE
      GOTO 120
  189 CONTINUE
      LINENO = 828
      LINENO = 830
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      CALL P$LDC(1,INTL(7))
      CALL P$SRO(1,13)
      LINENO = 831
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(189))
      CALL P$EQU(6,1)
      CALL P$FJP($190)
      LINENO = 832
      CALL P$LDC(1,INTL(10))
      CALL P$SRO(1,14)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 191
  190 CONTINUE
      LINENO = 833
      CALL P$LDC(1,INTL(11))
      CALL P$SRO(1,14)
  191 CONTINUE
      GOTO 120
  192 CONTINUE
      LINENO = 837
      LINENO = 838
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 839
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(170))
      CALL P$EQU(6,1)
      CALL P$FJP($193)
      LINENO = 840
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 841
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(164))
      CALL P$EQU(6,1)
      CALL P$FJP($194)
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P71
  194 CONTINUE
      LINENO = 842
  195 CONTINUE
      LINENO = 843
  196 CONTINUE
      LINENO = 843
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(170))
      CALL P$NEQ(6,1)
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$NOT
      CALL P$AND
      CALL P$FJP($197)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 196
  197 CONTINUE
      LINENO = 844
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 845
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(169))
      CALL P$EQU(6,1)
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$IOR
      CALL P$FJP($195)
      LINENO = 846
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 63
  198 CONTINUE
  193 CONTINUE
      LINENO = 848
      CALL P$LDC(1,INTL(8))
      CALL P$SRO(1,13)
      CALL P$LDC(1,INTL(15))
      CALL P$SRO(1,14)
      GOTO 120
  199 CONTINUE
      LINENO = 852
      LINENO = 854
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 855
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(164))
      CALL P$EQU(6,1)
      CALL P$FJP($200)
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P71
  200 CONTINUE
      LINENO = 856
  201 CONTINUE
      LINENO = 856
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(253))
      CALL P$NEQ(6,1)
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$NOT
      CALL P$AND
      CALL P$FJP($202)
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 201
  202 CONTINUE
      LINENO = 857
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 63
  203 CONTINUE
      GOTO 120
  204 CONTINUE
      LINENO = 861
      LINENO = 863
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 864
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,7)
      LINENO = 865
  205 CONTINUE
      LINENO = 866
  206 CONTINUE
      LINENO = 867
      CALL P$LAO(248)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32369))
      CALL P$INN
      CALL P$FJP($207)
      LINENO = 868
      CALL P$LAO(6360)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(101))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$MST(0)
      CALL P$LDO(6,20)
      CALL P$CUP(1)
      CALL P66
      CALL P$STO(6)
      GOTO 208
  207 CONTINUE
      LINENO = 869
      CALL P$LAO(6360)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(101))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDO(6,20)
      CALL P$STO(6)
  208 CONTINUE
      LINENO = 870
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,7)
      LINENO = 871
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 872
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(162))
      CALL P$EQU(6,1)
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(100))
      CALL P$GRT(1,1)
      CALL P$IOR
      CALL P$FJP($206)
      LINENO = 873
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      LINENO = 874
      CALL P$LDO(6,20)
      CALL P$LDC(6,INTL(162))
      CALL P$NEQ(6,1)
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(100))
      CALL P$GRT(1,1)
      CALL P$IOR
      CALL P$FJP($205)
      LINENO = 875
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(100))
      CALL P$GRT(1,1)
      CALL P$FJP($209)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(261))
      CALL P$CUP(1)
      CALL P30
  209 CONTINUE
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,13)
      GOTO 120
  210 CONTINUE
      LINENO = 880
      LINENO = 882
      CALL P$LAO(496)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$SRO(1,13)
      CALL P$LAO(661)
      CALL P$LDO(6,20)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$SRO(1,14)
      LINENO = 883
      CALL P$MST(1)
      CALL P$LDA(0,45)
      CALL P$CUP(1)
      CALL P54
      GOTO 120
  211 CONTINUE
      LINENO = 887
      CALL P$LDC(1,INTL(52))
      CALL P$SRO(1,13)
      GOTO 120
  119 CONTINUE
      CALL P$CHK(INTL(160),INTL(253))
      CALL P$LDC(1,INTL(160))
      CALL P$SBI
      CALL P$XJP($212)
  212 CONTINUE
  213 GOTO 211
  214 GOTO 99998
  215 GOTO 204
  216 GOTO 99998
  217 GOTO 210
  218 GOTO 99998
  219 GOTO 99998
  220 GOTO 161
  221 GOTO 192
  222 GOTO 210
  223 GOTO 210
  224 GOTO 210
  225 GOTO 210
  226 GOTO 210
  227 GOTO 181
  228 GOTO 210
  229 GOTO 128
  230 GOTO 128
  231 GOTO 128
  232 GOTO 128
  233 GOTO 128
  234 GOTO 128
  235 GOTO 128
  236 GOTO 128
  237 GOTO 128
  238 GOTO 128
  239 GOTO 178
  240 GOTO 210
  241 GOTO 184
  242 GOTO 210
  243 GOTO 189
  244 GOTO 99998
  245 GOTO 99998
  246 GOTO 121
  247 GOTO 121
  248 GOTO 121
  249 GOTO 121
  250 GOTO 121
  251 GOTO 121
  252 GOTO 121
  253 GOTO 121
  254 GOTO 121
  255 GOTO 121
  256 GOTO 121
  257 GOTO 121
  258 GOTO 121
  259 GOTO 121
  260 GOTO 121
  261 GOTO 121
  262 GOTO 121
  263 GOTO 121
  264 GOTO 121
  265 GOTO 121
  266 GOTO 121
  267 GOTO 121
  268 GOTO 121
  269 GOTO 121
  270 GOTO 121
  271 GOTO 121
  272 GOTO 210
  273 GOTO 99998
  274 GOTO 210
  275 GOTO 210
  276 GOTO 99998
  277 GOTO 99998
  278 GOTO 121
  279 GOTO 121
  280 GOTO 121
  281 GOTO 121
  282 GOTO 121
  283 GOTO 121
  284 GOTO 121
  285 GOTO 121
  286 GOTO 121
  287 GOTO 121
  288 GOTO 121
  289 GOTO 121
  290 GOTO 121
  291 GOTO 121
  292 GOTO 121
  293 GOTO 121
  294 GOTO 121
  295 GOTO 121
  296 GOTO 121
  297 GOTO 121
  298 GOTO 121
  299 GOTO 121
  300 GOTO 121
  301 GOTO 121
  302 GOTO 121
  303 GOTO 121
  304 GOTO 199
  305 GOTO 99998
  306 GOTO 210
  120 CONTINUE
  118 CONTINUE
      CALL P$RET(0)
      RETURN
  111 CONTINUE
      SG1SIZ = 49
      SG2SIZ = 105
      GOTO 112
      END

      SUBROUTINE P307
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 308
99998 CALL P$UJC
  309 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 898
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$NOT
      CALL P$FJP($310)
      LINENO = 899
  311 CONTINUE
      LINENO = 899
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$NOT
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$NOT
      CALL P$AND
      CALL P$FJP($312)
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      GOTO 311
  312 CONTINUE
      LINENO = 900
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($313)
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
  313 CONTINUE
  310 CONTINUE
      CALL P$RET(0)
      RETURN
  308 CONTINUE
      SG1SIZ = 13
      SG2SIZ = 23
      GOTO 309
      END

      SUBROUTINE P314
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 315
99998 CALL P$UJC
  316 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 918
      CALL P$LDA(0,6)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$MOV(2)
      LINENO = 919
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$IND(0,0)
      CALL P$STRA(0,9)
      LINENO = 920
      CALL P$LODA(0,9)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($317)
      LINENO = 921
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$LODA(0,5)
      CALL P$STO(0)
      GOTO 318
  317 CONTINUE
      LINENO = 922
      LINENO = 923
  319 CONTINUE
      LINENO = 924
      CALL P$LODA(0,9)
      CALL P$STRA(0,8)
      LINENO = 925
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDA(0,6)
      CALL P$EQU(5,8)
      CALL P$FJP($320)
      LINENO = 926
      CALL P$MST(1)
      CALL P$LDC(1,INTL(101))
      CALL P$CUP(1)
      CALL P30
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,2)
      CALL P$STRA(0,9)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,10)
      GOTO 321
  320 CONTINUE
      LINENO = 928
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDA(0,6)
      CALL P$LES(5,8)
      CALL P$FJP($322)
      LINENO = 929
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,2)
      CALL P$STRA(0,9)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,10)
      GOTO 323
  322 CONTINUE
      LINENO = 930
      LINENO = 931
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,3)
      CALL P$STRA(0,9)
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,10)
  323 CONTINUE
  321 CONTINUE
      LINENO = 932
      CALL P$LODA(0,9)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($319)
      LINENO = 933
      CALL P$LOD(0,10)
      CALL P$FJP($324)
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(3))
      CALL P$LODA(0,5)
      CALL P$STO(0)
      GOTO 325
  324 CONTINUE
      LINENO = 934
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LODA(0,5)
      CALL P$STO(0)
  325 CONTINUE
  318 CONTINUE
      LINENO = 936
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(3))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$RET(0)
      RETURN
  315 CONTINUE
      SG1SIZ = 11
      SG2SIZ = 11
      GOTO 316
      END

      SUBROUTINE P326
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 328
99998 CALL P$UJC
  329 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 950
  330 CONTINUE
      LINENO = 950
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($331)
      LINENO = 951
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LAO(18)
      CALL P$EQU(5,8)
      CALL P$FJP($332)
      GOTO 327
  333 CONTINUE
      GOTO 334
  332 CONTINUE
      LINENO = 952
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LAO(18)
      CALL P$LES(5,8)
      CALL P$FJP($335)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,2)
      CALL P$STRA(0,5)
      GOTO 336
  335 CONTINUE
      LINENO = 953
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,3)
      CALL P$STRA(0,5)
  336 CONTINUE
  334 CONTINUE
      GOTO 330
  331 CONTINUE
  327 CONTINUE
      LINENO = 954
      CALL P$LODA(0,6)
      CALL P$LODA(0,5)
      CALL P$STO(0)
      CALL P$RET(0)
      RETURN
  328 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 9
      GOTO 329
      END

      SUBROUTINE P337
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 339
99998 CALL P$UJC
  340 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 968
      CALL P$LDO(1,64)
      CALL P$SRO(1,63)
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,15)
  341 CONTINUE
      CALL P$LDO(1,63)
      CALL P$LOD(0,15)
      CALL P$GEQ(1)
      CALL P$FJP($342)
      LINENO = 969
      CALL P$LAO(65)
      CALL P$LDO(1,63)
      CALL P$IXA(6)
      CALL P$IND(0,0)
      CALL P$STRA(0,14)
      LINENO = 970
  343 CONTINUE
      LINENO = 970
      CALL P$LODA(0,14)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($344)
      LINENO = 971
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LAO(18)
      CALL P$EQU(5,8)
      CALL P$FJP($345)
      LINENO = 972
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$FJP($346)
      GOTO 338
  347 CONTINUE
      GOTO 348
  346 CONTINUE
      LINENO = 974
      CALL P$LDO(3,31)
      CALL P$FJP($349)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(103))
      CALL P$CUP(1)
      CALL P30
  349 CONTINUE
      LINENO = 975
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,2)
      CALL P$STRA(0,14)
  348 CONTINUE
      GOTO 350
  345 CONTINUE
      LINENO = 978
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LAO(18)
      CALL P$LES(5,8)
      CALL P$FJP($351)
      LINENO = 979
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,2)
      CALL P$STRA(0,14)
      GOTO 352
  351 CONTINUE
      LINENO = 980
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,3)
      CALL P$STRA(0,14)
  352 CONTINUE
  350 CONTINUE
      GOTO 343
  344 CONTINUE
      CALL P$LDO(1,63)
      CALL P$DEC(1,INTL(1))
      CALL P$SRO(1,63)
      GOTO 341
  342 CONTINUE
      LINENO = 985
      CALL P$LDO(3,31)
      CALL P$FJP($353)
      LINENO = 986
      CALL P$MST(1)
      CALL P$LDC(1,INTL(104))
      CALL P$CUP(1)
      CALL P30
      LINENO = 990
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$FJP($354)
      CALL P$LDO(0,51)
      CALL P$STRA(0,14)
      GOTO 355
  354 CONTINUE
      LINENO = 992
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$FJP($356)
      CALL P$LDO(0,53)
      CALL P$STRA(0,14)
      GOTO 357
  356 CONTINUE
      LINENO = 994
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$FJP($358)
      CALL P$LDO(0,54)
      CALL P$STRA(0,14)
      GOTO 359
  358 CONTINUE
      LINENO = 996
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$FJP($360)
      CALL P$LDO(0,52)
      CALL P$STRA(0,14)
      GOTO 361
  360 CONTINUE
      LINENO = 998
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$FJP($362)
      CALL P$LDO(0,55)
      CALL P$STRA(0,14)
      GOTO 363
  362 CONTINUE
      LINENO = 999
      CALL P$LDO(0,56)
      CALL P$STRA(0,14)
  363 CONTINUE
  361 CONTINUE
  359 CONTINUE
  357 CONTINUE
  355 CONTINUE
  353 CONTINUE
  338 CONTINUE
      LINENO = 1001
      CALL P$LODA(0,13)
      CALL P$LODA(0,14)
      CALL P$STO(0)
      CALL P$RET(0)
      RETURN
  339 CONTINUE
      SG1SIZ = 16
      SG2SIZ = 27
      GOTO 340
      END

      SUBROUTINE P364
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 365
99998 CALL P$UJC
  366 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1012
      CALL P$LODA(0,6)
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,7)
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 1013
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($367)
      LINENO = 1014
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 1015
      CALL P$LODA(0,8)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($368)
      LINENO = 1016
      CALL P$LODA(0,6)
      CALL P$LODA(0,8)
      CALL P$IND(1,8)
      CALL P$STO(1)
      CALL P$LODA(0,7)
      CALL P$LODA(0,8)
      CALL P$IND(1,6)
      CALL P$STO(1)
      GOTO 369
  368 CONTINUE
      LINENO = 1018
      CALL P$LODA(0,5)
      CALL P$LDO(0,47)
      CALL P$EQU(0,1)
      CALL P$FJP($370)
      LINENO = 1019
      CALL P$LODA(0,6)
      CALL P$LDC(1,INTL(128))
      CALL P$STO(1)
      CALL P$LODA(0,7)
      CALL P$LDC(1,INTL(255))
      CALL P$STO(1)
      GOTO 371
  370 CONTINUE
      LINENO = 1021
      CALL P$LODA(0,5)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($372)
      LINENO = 1022
      CALL P$LODA(0,7)
      CALL P$LDC(1,INTL(2147483647))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$LDC(1,INTL(2147483647))
      CALL P$NGI
      CALL P$STO(1)
      GOTO 373
  372 CONTINUE
      LINENO = 1024
      CALL P$LODA(0,8)
      CALL P$IND(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($374)
      LINENO = 1025
      CALL P$LODA(0,7)
      CALL P$LODA(0,8)
      CALL P$IND(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,8)
      CALL P$STO(1)
  374 CONTINUE
  373 CONTINUE
  371 CONTINUE
  369 CONTINUE
  367 CONTINUE
      CALL P$RET(0)
      RETURN
  365 CONTINUE
      SG1SIZ = 9
      SG2SIZ = 9
      GOTO 366
      END

      SUBROUTINE P375
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 376
99998 CALL P$UJC
  377 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1033
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      LINENO = 1034
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($378)
      LINENO = 1035
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 1036
      CALL P$LODA(0,6)
      CALL P$IND(1,3)
      GOTO 379
  381 CONTINUE
      LINENO = 1037
      CALL P$LODA(0,5)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($382)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      GOTO 383
  382 CONTINUE
      LINENO = 1038
      CALL P$LODA(0,5)
      CALL P$LDO(0,48)
      CALL P$EQU(0,1)
      CALL P$FJP($384)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      GOTO 385
  384 CONTINUE
      LINENO = 1039
      CALL P$LODA(0,6)
      CALL P$IND(1,4)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($386)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      GOTO 387
  386 CONTINUE
      LINENO = 1040
      CALL P$LODA(0,5)
      CALL P$LDO(0,47)
      CALL P$EQU(0,1)
      CALL P$FJP($388)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      GOTO 389
  388 CONTINUE
      LINENO = 1041
      CALL P$LODA(0,5)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($390)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      GOTO 391
  390 CONTINUE
      LINENO = 1042
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
  391 CONTINUE
  389 CONTINUE
  387 CONTINUE
  385 CONTINUE
  383 CONTINUE
      GOTO 380
  392 CONTINUE
      LINENO = 1043
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$IND(0,4)
      CALL P$CUP(1)
      CALL P375
      CALL P$STR(0,0)
      GOTO 380
  393 CONTINUE
      LINENO = 1044
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      GOTO 380
  394 CONTINUE
      LINENO = 1045
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      GOTO 380
  395 CONTINUE
      LINENO = 1046
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      GOTO 380
  396 CONTINUE
      LINENO = 1047
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$IND(0,5)
      CALL P$CUP(1)
      CALL P375
      CALL P$STR(0,0)
      GOTO 380
  397 CONTINUE
      LINENO = 1048
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,0)
      GOTO 380
  398 CONTINUE
      LINENO = 1049
      CALL P$MST(1)
      CALL P$LDC(1,INTL(301))
      CALL P$CUP(1)
      CALL P30
      GOTO 380
  379 CONTINUE
      CALL P$CHK(INTL(0),INTL(8))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($399)
  399 CONTINUE
  400 GOTO 381
  401 GOTO 392
  402 GOTO 393
  403 GOTO 394
  404 GOTO 396
  405 GOTO 397
  406 GOTO 395
  407 GOTO 398
  408 GOTO 398
  380 CONTINUE
  378 CONTINUE
      CALL P$RET(1)
      RETURN
  376 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 11
      GOTO 377
      END

      SUBROUTINE P409
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 410
99998 CALL P$UJC
  411 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1060
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CUP(1)
      CALL P375
      CALL P$STR(0,8)
      LINENO = 1061
      CALL P$LODA(0,6)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$STR(0,7)
      LINENO = 1062
      CALL P$LODA(0,6)
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$ADI
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$MOD
      CALL P$SBI
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
  410 CONTINUE
      SG1SIZ = 9
      SG2SIZ = 13
      GOTO 411
      END

      SUBROUTINE P412
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 413
99998 CALL P$UJC
  414 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1073
      CALL P$LDO(1,6478)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,6478)
      LINENO = 1074
      CALL P$LODA(0,5)
      CALL P$LDO(1,6478)
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
  413 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 9
      GOTO 414
      END

      SUBROUTINE P415
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 416
99998 CALL P$UJC
  417 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1084
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26268)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$LCA(26272)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1085
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26276)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$LCA(26280)
      CALL P$LDC(1,INTL(17))
      CALL P$LDC(1,INTL(17))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1086
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26285)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1087
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26289)
      CALL P$LDC(1,INTL(22))
      CALL P$LDC(1,INTL(22))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1088
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26295)
      CALL P$LDC(1,INTL(41))
      CALL P$LDC(1,INTL(41))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1089
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26306)
      CALL P$LDC(1,INTL(22))
      CALL P$LDC(1,INTL(22))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1090
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26312)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1091
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26316)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1092
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26320)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1093
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26324)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1094
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(10))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$RET(0)
      RETURN
  416 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 13
      GOTO 417
      END

      SUBROUTINE P418
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 419
99998 CALL P$UJC
  420 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1101
      CALL P$LDO(3,33)
      CALL P$FJP($421)
      LINENO = 1102
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26328)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$LCA(26332)
      CALL P$LDC(1,INTL(10))
      CALL P$LDC(1,INTL(10))
      CALL P$WRS
      CALL P$LDC(1,INTL(24575))
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDC(1,INTL(4))
      CALL P$DVI
      CALL P$LDC(1,INTL(4))
      CALL P$WRI
      CALL P$LCA(26335)
      CALL P$LDC(1,INTL(15))
      CALL P$LDC(1,INTL(15))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1104
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26339)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$LCA(26343)
      CALL P$LDC(1,INTL(17))
      CALL P$LDC(1,INTL(17))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1105
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26348)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1106
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26352)
      CALL P$LDC(1,INTL(24))
      CALL P$LDC(1,INTL(24))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1107
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26358)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1108
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26362)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1109
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26366)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1110
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26370)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(1,INTL(14))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1111
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26374)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$LCA(26378)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1112
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26380)
      CALL P$LDC(1,INTL(41))
      CALL P$LDC(1,INTL(41))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1113
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26391)
      CALL P$LDC(1,INTL(19))
      CALL P$LDC(1,INTL(19))
      CALL P$WRS
      CALL P$LDC(1,INTL(26223))
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDC(1,INTL(5))
      CALL P$WRI
      CALL P$LCA(26396)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      CALL P$LCA(26397)
      CALL P$LDC(1,INTL(12))
      CALL P$LDC(1,INTL(12))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1115
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26400)
      CALL P$LDC(1,INTL(19))
      CALL P$LDC(1,INTL(19))
      CALL P$WRS
      CALL P$LDC(1,INTL(32367))
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDC(1,INTL(5))
      CALL P$WRI
      CALL P$LCA(26405)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      CALL P$LCA(26406)
      CALL P$LDC(1,INTL(12))
      CALL P$LDC(1,INTL(12))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1117
      CALL P$LAO(11)
      CALL P$WLN
      LINENO = 1118
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(5))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
  421 CONTINUE
      CALL P$RET(0)
      RETURN
  419 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 13
      GOTO 420
      END

      SUBROUTINE P423
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 424
99998 CALL P$UJC
  425 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1134
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,15)
      CALL P$LODA(0,14)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 1135
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,232)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($426)
      LINENO = 1136
      CALL P$MST(2)
      CALL P$LDC(1,INTL(50))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,232)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  426 CONTINUE
      LINENO = 1137
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,232)
      CALL P$INN
      CALL P$FJP($427)
      LINENO = 1138
      LINENO = 1139
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($428)
      LINENO = 1140
      LINENO = 1141
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($429)
      CALL P$LDO(0,47)
      CALL P$STRA(0,15)
      GOTO 430
  429 CONTINUE
      LINENO = 1143
      LINENO = 1144
      CALL P$LDA(0,15)
      CALL P$LDC(1,INTL(6))
      CALL P$NEW
      LINENO = 1145
      CALL P$LODA(0,15)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,20)
      LINENO = 1146
      CALL P$LODA(0,20)
      CALL P$INC(0,INTL(5))
      CALL P$LDO(0,47)
      CALL P$STO(0)
      LINENO = 1147
      CALL P$LODA(0,20)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 1148
      CALL P$LODA(0,20)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,21)
      LINENO = 1149
      CALL P$LODA(0,21)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1150
      CALL P$LODA(0,21)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,45)
      CALL P$STO(0)
      LINENO = 1151
      CALL P$LODA(0,21)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1152
      CALL P$LODA(0,21)
      CALL P$INC(0,INTL(6))
      CALL P$LDO(1,17)
      CALL P$STO(1)
      LINENO = 1154
      CALL P$LODA(0,20)
      CALL P$INC(0,INTL(2))
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(3))
      CALL P$ADI
      CALL P$LDC(1,INTL(4))
      CALL P$DVI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,20)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      LINENO = 1155
      CALL P$LODA(0,20)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(3,INTL(1))
      CALL P$STO(3)
  430 CONTINUE
      LINENO = 1158
      CALL P$LODA(0,14)
      CALL P$LAO(15)
      CALL P$MOV(2)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 431
  428 CONTINUE
      LINENO = 1161
      LINENO = 1162
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,17)
      LINENO = 1163
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$LDO(1,14)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32370))
      CALL P$INN
      CALL P$AND
      CALL P$FJP($432)
      LINENO = 1164
      CALL P$LDO(1,14)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($433)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,17)
      GOTO 434
  433 CONTINUE
      CALL P$LDC(1,INTL(2))
      CALL P$STR(0,17)
  434 CONTINUE
      LINENO = 1165
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
  432 CONTINUE
      LINENO = 1167
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($435)
      LINENO = 1168
      CALL P$MST(2)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32371))
      CALL P$LDA(0,16)
      CALL P$CUP(9)
      CALL P337
      LINENO = 1169
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,20)
      LINENO = 1170
      CALL P$LODA(0,20)
      CALL P$IND(0,4)
      CALL P$STRA(0,15)
      CALL P$LODA(0,14)
      CALL P$LODA(0,20)
      CALL P$INC(0,INTL(7))
      CALL P$MOV(2)
      LINENO = 1171
      CALL P$LOD(0,17)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($436)
      LINENO = 1172
      CALL P$LODA(0,15)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($437)
      LINENO = 1173
      CALL P$LOD(0,17)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($438)
      CALL P$LODA(0,14)
      CALL P$INC(0,INTL(1))
      CALL P$LODA(0,14)
      CALL P$IND(1,1)
      CALL P$NGI
      CALL P$STO(1)
  438 CONTINUE
      GOTO 439
  437 CONTINUE
      LINENO = 1175
      CALL P$LODA(0,15)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($440)
      LINENO = 1176
      LINENO = 1177
      CALL P$LOD(0,17)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($441)
      LINENO = 1178
      CALL P$LDA(0,18)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 1179
      CALL P$LODA(0,14)
      CALL P$IND(0,1)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LPC
      CALL P$LDC(6,INTL(173))
      CALL P$EQU(6,1)
      CALL P$FJP($442)
      LINENO = 1180
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDC(6,INTL(171))
      CALL P$SPC
      GOTO 443
  442 CONTINUE
      LINENO = 1181
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDC(6,INTL(173))
      CALL P$SPC
  443 CONTINUE
      LINENO = 1182
      CALL P$LDC(1,INTL(2))
      CALL P$STR(0,19)
      CALL P$LDC(1,INTL(128))
      CALL P$STR(0,20)
  444 CONTINUE
      CALL P$LOD(0,19)
      CALL P$LOD(0,20)
      CALL P$LEQ(1)
      CALL P$FJP($445)
      LINENO = 1183
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(1))
      CALL P$LOD(0,19)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LODA(0,14)
      CALL P$IND(0,1)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(1))
      CALL P$LOD(0,19)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LPC
      CALL P$SPC
      CALL P$LOD(0,19)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,19)
      GOTO 444
  445 CONTINUE
      LINENO = 1184
      CALL P$LODA(0,14)
      CALL P$INC(0,INTL(1))
      CALL P$LODA(0,18)
      CALL P$STO(0)
  441 CONTINUE
      GOTO 446
  440 CONTINUE
      LINENO = 1187
      CALL P$MST(2)
      CALL P$LDC(1,INTL(105))
      CALL P$CUP(1)
      CALL P30
  446 CONTINUE
  439 CONTINUE
  436 CONTINUE
      LINENO = 1188
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 447
  435 CONTINUE
      LINENO = 1191
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($448)
      LINENO = 1192
      CALL P$LOD(0,17)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($449)
      CALL P$LDO(1,16)
      CALL P$NGI
      CALL P$SRO(1,16)
  449 CONTINUE
      LINENO = 1193
      CALL P$LDO(0,45)
      CALL P$STRA(0,15)
      CALL P$LODA(0,14)
      CALL P$LAO(15)
      CALL P$MOV(2)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 450
  448 CONTINUE
      LINENO = 1196
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($451)
      LINENO = 1197
      CALL P$LOD(0,17)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($452)
      CALL P$LDO(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LDC(6,INTL(173))
      CALL P$SPC
  452 CONTINUE
      LINENO = 1198
      CALL P$LDO(0,46)
      CALL P$STRA(0,15)
      CALL P$LODA(0,14)
      CALL P$LAO(15)
      CALL P$MOV(2)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 453
  451 CONTINUE
      LINENO = 1201
      CALL P$MST(2)
      CALL P$LDC(1,INTL(106))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P307
  453 CONTINUE
  450 CONTINUE
  447 CONTINUE
  431 CONTINUE
      LINENO = 1203
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($454)
      LINENO = 1204
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P307
  454 CONTINUE
  427 CONTINUE
      LINENO = 1206
      CALL P$LODA(0,13)
      CALL P$LODA(0,15)
      CALL P$STO(0)
      CALL P$RET(0)
      RETURN
  424 CONTINUE
      SG1SIZ = 22
      SG2SIZ = 83
      GOTO 425
      END

      SUBROUTINE P455
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 456
99998 CALL P$UJC
  457 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1215
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$IOR
      CALL P$FJP($458)
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,0)
      GOTO 459
  458 CONTINUE
      LINENO = 1217
      LINENO = 1218
      CALL P$MST(2)
      CALL P$LODA(0,5)
      CALL P$LDA(0,10)
      CALL P$LDA(0,8)
      CALL P$CUP(3)
      CALL P364
      LINENO = 1219
      CALL P$MST(2)
      CALL P$LODA(0,6)
      CALL P$LDA(0,9)
      CALL P$LDA(0,7)
      CALL P$CUP(3)
      CALL P364
      LINENO = 1220
      CALL P$LOD(0,10)
      CALL P$LOD(0,9)
      CALL P$EQU(1,1)
      CALL P$LOD(0,8)
      CALL P$LOD(0,7)
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$STR(0,0)
  459 CONTINUE
      CALL P$RET(1)
      RETURN
  456 CONTINUE
      SG1SIZ = 11
      SG2SIZ = 23
      GOTO 457
      END

      SUBROUTINE P460
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 461
99998 CALL P$UJC
  462 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1236
      CALL P$LODA(0,5)
      CALL P$LODA(0,6)
      CALL P$EQU(0,1)
      CALL P$FJP($463)
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,0)
      GOTO 464
  463 CONTINUE
      LINENO = 1238
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$AND
      CALL P$FJP($465)
      LINENO = 1239
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$EQU(1,1)
      CALL P$FJP($466)
      LINENO = 1240
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      GOTO 467
  469 CONTINUE
      LINENO = 1242
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,0)
      GOTO 468
  470 CONTINUE
      LINENO = 1246
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P460
      CALL P$STR(0,0)
      GOTO 468
  471 CONTINUE
      LINENO = 1248
      LINENO = 1249
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,9)
      CALL P$LDO(0,61)
      CALL P$STRA(0,11)
      LINENO = 1250
      CALL P$LDO(0,61)
      CALL P$STRA(0,10)
      LINENO = 1251
  472 CONTINUE
      LINENO = 1251
      CALL P$LODA(0,11)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($473)
      LINENO = 1252
      CALL P$LODA(0,11)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,12)
      LINENO = 1253
      LINENO = 1254
      CALL P$LODA(0,12)
      CALL P$IND(0,1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$EQU(0,1)
      CALL P$LODA(0,12)
      CALL P$IND(0,0)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($474)
      LINENO = 1255
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,9)
  474 CONTINUE
      LINENO = 1256
      CALL P$LODA(0,12)
      CALL P$IND(0,2)
      CALL P$STRA(0,11)
      GOTO 472
  473 CONTINUE
      LINENO = 1258
      CALL P$LOD(0,9)
      CALL P$NOT
      CALL P$FJP($475)
      LINENO = 1259
      CALL P$LDA(0,11)
      CALL P$LDC(1,INTL(3))
      CALL P$NEW
      LINENO = 1260
      CALL P$LODA(0,11)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,12)
      LINENO = 1261
      CALL P$LODA(0,12)
      CALL P$INC(0,INTL(1))
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STO(0)
      LINENO = 1262
      CALL P$LODA(0,12)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STO(0)
      LINENO = 1263
      CALL P$LODA(0,12)
      CALL P$INC(0,INTL(2))
      CALL P$LDO(0,61)
      CALL P$STO(0)
      LINENO = 1265
      CALL P$LODA(0,11)
      CALL P$SRO(0,61)
      LINENO = 1266
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P460
      CALL P$STR(0,9)
  475 CONTINUE
      LINENO = 1268
      CALL P$LOD(0,9)
      CALL P$STR(0,0)
      CALL P$LODA(0,10)
      CALL P$SRO(0,61)
      GOTO 468
  476 CONTINUE
      LINENO = 1271
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P460
      CALL P$STR(0,0)
      GOTO 468
  477 CONTINUE
      LINENO = 1273
      LINENO = 1274
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$CUP(2)
      CALL P460
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P460
      CALL P$AND
      CALL P$STR(0,9)
      LINENO = 1276
      CALL P$LOD(0,9)
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P455
      CALL P$AND
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(3,1)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(3,1)
      CALL P$EQU(3,1)
      CALL P$AND
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$STR(0,0)
      GOTO 468
  478 CONTINUE
      LINENO = 1282
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,8)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,7)
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,9)
      LINENO = 1283
  479 CONTINUE
      LINENO = 1283
      CALL P$LODA(0,8)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LODA(0,7)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$AND
      CALL P$FJP($480)
      LINENO = 1284
      CALL P$LOD(0,9)
      CALL P$MST(1)
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P460
      CALL P$AND
      CALL P$STR(0,9)
      LINENO = 1285
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,8)
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,7)
      GOTO 479
  480 CONTINUE
      LINENO = 1287
      CALL P$LOD(0,9)
      CALL P$LODA(0,8)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$LODA(0,7)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$STR(0,0)
      GOTO 468
  481 CONTINUE
      LINENO = 1293
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P460
      CALL P$STR(0,0)
      GOTO 468
  467 CONTINUE
      CALL P$CHK(INTL(0),INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($482)
  482 CONTINUE
  483 GOTO 469
  484 GOTO 470
  485 GOTO 471
  486 GOTO 476
  487 GOTO 477
  488 GOTO 478
  489 GOTO 481
  468 CONTINUE
      GOTO 490
  466 CONTINUE
      LINENO = 1296
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($491)
      LINENO = 1297
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CUP(2)
      CALL P460
      CALL P$STR(0,0)
      GOTO 492
  491 CONTINUE
      LINENO = 1299
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($493)
      LINENO = 1300
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P460
      CALL P$STR(0,0)
      GOTO 494
  493 CONTINUE
      LINENO = 1301
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,0)
  494 CONTINUE
  492 CONTINUE
  490 CONTINUE
      GOTO 495
  465 CONTINUE
      LINENO = 1302
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,0)
  495 CONTINUE
  464 CONTINUE
      CALL P$RET(1)
      RETURN
  461 CONTINUE
      SG1SIZ = 13
      SG2SIZ = 27
      GOTO 462
      END

      SUBROUTINE P496
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 497
99998 CALL P$UJC
  498 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1308
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,0)
      LINENO = 1309
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($499)
      LINENO = 1310
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($500)
      LINENO = 1311
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$LDO(0,47)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($501)
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,0)
  501 CONTINUE
  500 CONTINUE
  499 CONTINUE
      CALL P$RET(1)
      RETURN
  497 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 9
      GOTO 498
      END

      SUBROUTINE P502
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 503
99998 CALL P$UJC
  504 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1322
      CALL P$LDO(0,60)
      CALL P$STRA(0,6)
      LINENO = 1323
  505 CONTINUE
      LINENO = 1323
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$NEQ(5,8)
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$AND
      CALL P$FJP($506)
      LINENO = 1324
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,2)
      CALL P$STRA(0,6)
      GOTO 505
  506 CONTINUE
      LINENO = 1325
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($507)
      LINENO = 1326
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,0)
      GOTO 508
  507 CONTINUE
      LINENO = 1327
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,0)
  508 CONTINUE
      CALL P$RET(1)
      RETURN
  503 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 11
      GOTO 504
      END

      SUBROUTINE P510
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 511
99998 CALL P$UJC
  512 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1346
      CALL P$LODA(0,14)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 1347
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,234)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($513)
      LINENO = 1348
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,234)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  513 CONTINUE
      LINENO = 1349
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,234)
      CALL P$INN
      CALL P$FJP($514)
      LINENO = 1350
      LINENO = 1351
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($515)
      LINENO = 1352
      CALL P$LDO(1,64)
      CALL P$STR(0,19)
      LINENO = 1353
  516 CONTINUE
      LINENO = 1353
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($517)
      CALL P$LDO(1,64)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$SRO(1,64)
      GOTO 516
  517 CONTINUE
      LINENO = 1354
      CALL P$LDA(0,16)
      CALL P$LDC(1,INTL(6))
      CALL P$NEW
      LINENO = 1355
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,23)
      LINENO = 1356
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 1357
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1359
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,17)
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,20)
      LINENO = 1360
  518 CONTINUE
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1361
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($519)
      LINENO = 1362
      CALL P$LDA(0,18)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 1363
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,23)
      LINENO = 1364
      CALL P$LODA(0,23)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,16)
      CALL P$STO(0)
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,17)
      CALL P$STO(0)
      LINENO = 1365
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(8))
      CALL P$LOD(0,20)
      CALL P$STO(1)
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1367
      CALL P$MST(3)
      CALL P$LODA(0,18)
      CALL P$CUP(1)
      CALL P314
      LINENO = 1368
      CALL P$LOD(0,20)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,20)
      LINENO = 1369
      CALL P$LODA(0,18)
      CALL P$STRA(0,17)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 520
  519 CONTINUE
      LINENO = 1371
      CALL P$MST(3)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
  520 CONTINUE
      LINENO = 1372
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32372))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($521)
      LINENO = 1373
      CALL P$MST(3)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32373))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  521 CONTINUE
      LINENO = 1374
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$FJP($518)
      LINENO = 1375
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,17)
      CALL P$STO(0)
      CALL P$LOD(0,19)
      CALL P$SRO(1,64)
      LINENO = 1376
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($522)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 523
  522 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
  523 CONTINUE
      GOTO 524
  515 CONTINUE
      LINENO = 1379
      LINENO = 1380
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($525)
      LINENO = 1381
      CALL P$MST(3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32374))
      CALL P$LDA(0,18)
      CALL P$CUP(9)
      CALL P337
      LINENO = 1382
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1383
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($526)
      LINENO = 1384
      CALL P$LDA(0,16)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 1385
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,23)
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,24)
      LINENO = 1386
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,24)
      CALL P$IND(0,4)
      CALL P$STO(0)
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1387
      CALL P$MST(2)
      CALL P$LODA(0,23)
      CALL P$IND(0,4)
      CALL P$CUP(1)
      CALL P496
      CALL P$FJP($527)
      LINENO = 1388
      CALL P$MST(3)
      CALL P$LDC(1,INTL(148))
      CALL P$CUP(1)
      CALL P30
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
  527 CONTINUE
      LINENO = 1389
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(7))
      CALL P$LODA(0,24)
      CALL P$INC(0,INTL(7))
      CALL P$MOV(2)
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 1391
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($528)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 529
  528 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
  529 CONTINUE
      LINENO = 1392
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDA(0,15)
      CALL P$LDA(0,21)
      CALL P$CUP(10)
      CALL P423
      LINENO = 1393
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LDA(0,21)
      CALL P$MOV(2)
      LINENO = 1394
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,15)
      CALL P$NEQ(0,1)
      CALL P$FJP($530)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(107))
      CALL P$CUP(1)
      CALL P30
  530 CONTINUE
      GOTO 531
  526 CONTINUE
      LINENO = 1397
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,16)
      LINENO = 1398
      CALL P$LODA(0,16)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($532)
      CALL P$LODA(0,14)
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STO(1)
  532 CONTINUE
  531 CONTINUE
      GOTO 533
  525 CONTINUE
      LINENO = 1402
      CALL P$LDA(0,16)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1403
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32375))
      CALL P$UNI
      CALL P$LDA(0,15)
      CALL P$LDA(0,21)
      CALL P$CUP(10)
      CALL P423
      LINENO = 1404
      CALL P$MST(2)
      CALL P$LODA(0,15)
      CALL P$CUP(1)
      CALL P496
      CALL P$FJP($534)
      LINENO = 1405
      CALL P$MST(3)
      CALL P$LDC(1,INTL(148))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,15)
  534 CONTINUE
      LINENO = 1406
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,23)
      LINENO = 1407
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,15)
      CALL P$STO(0)
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(7))
      CALL P$LDA(0,21)
      CALL P$MOV(2)
      CALL P$LODA(0,23)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 1408
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($535)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 536
  535 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
  536 CONTINUE
      LINENO = 1409
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDA(0,15)
      CALL P$LDA(0,21)
      CALL P$CUP(10)
      CALL P423
      LINENO = 1410
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LDA(0,21)
      CALL P$MOV(2)
      LINENO = 1411
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,15)
      CALL P$NEQ(0,1)
      CALL P$FJP($537)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(107))
      CALL P$CUP(1)
      CALL P30
  537 CONTINUE
  533 CONTINUE
      LINENO = 1413
      CALL P$LODA(0,16)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($538)
      LINENO = 1414
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,23)
      LINENO = 1415
      CALL P$LODA(0,23)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($539)
      LINENO = 1416
      CALL P$LODA(0,23)
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($540)
      LINENO = 1417
      CALL P$LODA(0,23)
      CALL P$IND(0,4)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($541)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
      GOTO 542
  541 CONTINUE
      LINENO = 1419
      CALL P$LODA(0,23)
      CALL P$IND(1,8)
      CALL P$LODA(0,23)
      CALL P$IND(1,6)
      CALL P$GRT(1,1)
      CALL P$FJP($543)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(102))
      CALL P$CUP(1)
      CALL P30
  543 CONTINUE
  542 CONTINUE
  540 CONTINUE
  539 CONTINUE
  538 CONTINUE
  524 CONTINUE
      LINENO = 1421
      CALL P$LODA(0,13)
      CALL P$LODA(0,16)
      CALL P$STO(0)
      LINENO = 1422
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($544)
      LINENO = 1423
      CALL P$MST(3)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P307
  544 CONTINUE
      GOTO 545
  514 CONTINUE
      LINENO = 1425
      CALL P$LODA(0,13)
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
  545 CONTINUE
      CALL P$RET(0)
      RETURN
  511 CONTINUE
      SG1SIZ = 25
      SG2SIZ = 163
      GOTO 512
      END

      SUBROUTINE P546
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 547
99998 CALL P$UJC
  548 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1431
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,14)
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,22)
      LINENO = 1432
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32376))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($549)
      LINENO = 1433
      CALL P$MST(3)
      CALL P$LDC(1,INTL(19))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32378))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  549 CONTINUE
      LINENO = 1434
  550 CONTINUE
      LINENO = 1434
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($551)
      LINENO = 1435
      CALL P$LODA(0,14)
      CALL P$STRA(0,15)
      LINENO = 1436
  552 CONTINUE
      LINENO = 1437
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($553)
      LINENO = 1438
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(8))
      CALL P$NEW
      LINENO = 1439
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,28)
      LINENO = 1440
      CALL P$LODA(0,28)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,15)
      CALL P$STO(0)
      LINENO = 1441
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(3))
      CALL P$STO(1)
      LINENO = 1443
      CALL P$LODA(0,17)
      CALL P$STRA(0,15)
      LINENO = 1444
      CALL P$MST(3)
      CALL P$LODA(0,17)
      CALL P$CUP(1)
      CALL P314
      LINENO = 1445
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 554
  553 CONTINUE
      LINENO = 1447
      CALL P$MST(3)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
  554 CONTINUE
      LINENO = 1448
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32380))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($555)
      LINENO = 1449
      CALL P$MST(3)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32381))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  555 CONTINUE
      LINENO = 1451
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(2,16)
      LINENO = 1452
      CALL P$LOD(2,16)
      CALL P$NOT
      CALL P$FJP($556)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
  556 CONTINUE
      LINENO = 1453
      CALL P$LOD(2,16)
      CALL P$FJP($552)
      LINENO = 1454
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($557)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 558
  557 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
  558 CONTINUE
      LINENO = 1455
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32383))
      CALL P$UNI
      CALL P$LDA(0,22)
      CALL P$LDA(0,23)
      CALL P$CUP(10)
      CALL P509
      LINENO = 1456
  559 CONTINUE
      LINENO = 1456
      CALL P$LODA(0,15)
      CALL P$LODA(0,14)
      CALL P$NEQ(0,1)
      CALL P$FJP($560)
      LINENO = 1457
      CALL P$LODA(0,15)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,28)
      LINENO = 1458
      CALL P$MST(3)
      CALL P$LODA(0,22)
      CALL P$LDA(1,20)
      CALL P$CUP(2)
      CALL P409
      LINENO = 1459
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,22)
      CALL P$STO(0)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(7))
      CALL P$LOD(1,20)
      CALL P$STO(1)
      LINENO = 1460
      CALL P$LODA(0,28)
      CALL P$IND(0,5)
      CALL P$STRA(0,15)
      CALL P$LOD(1,20)
      CALL P$LOD(0,23)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(1,20)
      GOTO 559
  560 CONTINUE
      LINENO = 1462
      CALL P$LODA(0,17)
      CALL P$STRA(0,14)
      LINENO = 1463
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($561)
      LINENO = 1464
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1465
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32385))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($562)
      LINENO = 1466
      CALL P$MST(3)
      CALL P$LDC(1,INTL(19))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32387))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  562 CONTINUE
  561 CONTINUE
      GOTO 550
  551 CONTINUE
      LINENO = 1469
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,15)
      LINENO = 1470
  563 CONTINUE
      LINENO = 1470
      CALL P$LODA(0,14)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($564)
      LINENO = 1471
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,28)
      LINENO = 1472
      CALL P$LODA(0,28)
      CALL P$IND(0,5)
      CALL P$STRA(0,17)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,15)
      CALL P$STO(0)
      CALL P$LODA(0,14)
      CALL P$STRA(0,15)
      CALL P$LODA(0,17)
      CALL P$STRA(0,14)
      GOTO 563
  564 CONTINUE
      LINENO = 1473
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(33))
      CALL P$EQU(1,1)
      CALL P$FJP($565)
      LINENO = 1474
      CALL P$LDA(0,22)
      CALL P$LDC(1,INTL(6))
      CALL P$NEW
      LINENO = 1475
      CALL P$LODA(0,22)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,28)
      LINENO = 1476
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(7))
      CALL P$STO(1)
      LINENO = 1477
      CALL P$LODA(0,13)
      CALL P$LODA(0,22)
      CALL P$STO(0)
      LINENO = 1478
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1479
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($566)
      LINENO = 1480
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(8))
      CALL P$NEW
      LINENO = 1481
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,28)
      LINENO = 1482
      CALL P$LODA(0,28)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(3))
      CALL P$STO(1)
      LINENO = 1483
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(7))
      CALL P$LOD(1,20)
      CALL P$STO(1)
      LINENO = 1485
      CALL P$MST(3)
      CALL P$LODA(0,17)
      CALL P$CUP(1)
      CALL P314
      LINENO = 1486
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1487
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($567)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 568
  567 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
  568 CONTINUE
      LINENO = 1488
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($569)
      LINENO = 1489
      CALL P$MST(3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32389))
      CALL P$LDA(0,16)
      CALL P$CUP(9)
      CALL P337
      LINENO = 1490
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,21)
      LINENO = 1491
      CALL P$LODA(0,21)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($570)
      LINENO = 1492
      CALL P$MST(3)
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDA(1,20)
      CALL P$CUP(2)
      CALL P409
      LINENO = 1493
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(7))
      CALL P$LOD(1,20)
      CALL P$STO(1)
      LINENO = 1494
      CALL P$LOD(1,20)
      CALL P$LODA(0,21)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(1,20)
      LINENO = 1495
      CALL P$LODA(0,21)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$MST(2)
      CALL P$LODA(0,21)
      CALL P$CUP(1)
      CALL P496
      CALL P$IOR
      CALL P$FJP($571)
      LINENO = 1496
      CALL P$MST(2)
      CALL P$LDO(0,46)
      CALL P$LODA(0,21)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($572)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(109))
      CALL P$CUP(1)
      CALL P30
      GOTO 573
  572 CONTINUE
      LINENO = 1497
      CALL P$MST(2)
      CALL P$LODA(0,21)
      CALL P$CUP(1)
      CALL P496
      CALL P$FJP($574)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
  574 CONTINUE
  573 CONTINUE
      LINENO = 1498
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,21)
      CALL P$STO(0)
      CALL P$LODA(0,22)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,17)
      CALL P$STO(0)
      GOTO 575
  571 CONTINUE
      LINENO = 1500
      CALL P$MST(3)
      CALL P$LDC(1,INTL(110))
      CALL P$CUP(1)
      CALL P30
  575 CONTINUE
  570 CONTINUE
      LINENO = 1502
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 576
  569 CONTINUE
      LINENO = 1504
      CALL P$MST(3)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32390))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  576 CONTINUE
      GOTO 577
  566 CONTINUE
      LINENO = 1506
      CALL P$MST(3)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32392))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  577 CONTINUE
      LINENO = 1507
      CALL P$LODA(0,22)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LOD(1,20)
      CALL P$STO(1)
      LINENO = 1508
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(47))
      CALL P$EQU(1,1)
      CALL P$FJP($578)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 579
  578 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(8))
      CALL P$CUP(1)
      CALL P30
  579 CONTINUE
      LINENO = 1509
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,21)
      CALL P$LOD(1,20)
      CALL P$STR(0,25)
      CALL P$LOD(1,20)
      CALL P$STR(0,24)
      LINENO = 1510
  580 CONTINUE
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,20)
      LINENO = 1511
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32394))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($581)
      LINENO = 1512
      LINENO = 1513
  582 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32396))
      CALL P$UNI
      CALL P$LDA(0,19)
      CALL P$LDA(0,26)
      CALL P$CUP(10)
      CALL P423
      LINENO = 1514
      CALL P$LODA(0,22)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($583)
      LINENO = 1515
      CALL P$MST(2)
      CALL P$LODA(0,22)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,19)
      CALL P$CUP(2)
      CALL P460
      CALL P$NOT
      CALL P$FJP($584)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(111))
      CALL P$CUP(1)
      CALL P30
  584 CONTINUE
  583 CONTINUE
      LINENO = 1516
      CALL P$LDA(0,19)
      CALL P$LDC(1,INTL(8))
      CALL P$NEW
      LINENO = 1517
      CALL P$LODA(0,19)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,28)
      LINENO = 1518
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,21)
      CALL P$STO(0)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,20)
      CALL P$STO(0)
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(6))
      CALL P$LDA(0,26)
      CALL P$MOV(2)
      LINENO = 1519
      CALL P$LODA(0,28)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(8))
      CALL P$STO(1)
      LINENO = 1521
      CALL P$LODA(0,21)
      CALL P$STRA(0,18)
      LINENO = 1522
  585 CONTINUE
      LINENO = 1522
      CALL P$LODA(0,18)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($586)
      LINENO = 1523
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,28)
      LINENO = 1524
      LINENO = 1525
      CALL P$LODA(0,28)
      CALL P$IND(1,7)
      CALL P$LOD(0,27)
      CALL P$EQU(1,1)
      CALL P$FJP($587)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(178))
      CALL P$CUP(1)
      CALL P30
  587 CONTINUE
      LINENO = 1526
      CALL P$LODA(0,28)
      CALL P$IND(0,5)
      CALL P$STRA(0,18)
      GOTO 585
  586 CONTINUE
      LINENO = 1528
      CALL P$LODA(0,19)
      CALL P$STRA(0,21)
      CALL P$LODA(0,19)
      CALL P$STRA(0,20)
      LINENO = 1529
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(2,16)
      LINENO = 1530
      CALL P$LOD(2,16)
      CALL P$NOT
      CALL P$FJP($588)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
  588 CONTINUE
      LINENO = 1531
      CALL P$LOD(2,16)
      CALL P$FJP($582)
      LINENO = 1532
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($589)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 590
  589 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
  590 CONTINUE
      LINENO = 1533
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($591)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 592
  591 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(9))
      CALL P$CUP(1)
      CALL P30
  592 CONTINUE
      LINENO = 1534
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32397))
      CALL P$UNI
      CALL P$LDA(0,20)
      CALL P$CUP(9)
      CALL P546
      LINENO = 1535
      CALL P$LOD(1,20)
      CALL P$LOD(0,24)
      CALL P$GRT(1,1)
      CALL P$FJP($593)
      CALL P$LOD(1,20)
      CALL P$STR(0,24)
  593 CONTINUE
      LINENO = 1536
  594 CONTINUE
      LINENO = 1536
      CALL P$LODA(0,19)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($595)
      LINENO = 1537
      CALL P$LODA(0,19)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,18)
      CALL P$LODA(0,19)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,20)
      CALL P$STO(0)
      LINENO = 1538
      CALL P$LODA(0,19)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LOD(1,20)
      CALL P$STO(1)
      LINENO = 1539
      CALL P$LODA(0,18)
      CALL P$STRA(0,19)
      GOTO 594
  595 CONTINUE
      LINENO = 1541
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($596)
      LINENO = 1542
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1543
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32398))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($597)
      LINENO = 1544
      CALL P$MST(3)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32399))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  597 CONTINUE
      GOTO 598
  596 CONTINUE
      LINENO = 1546
      CALL P$MST(3)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
  598 CONTINUE
  581 CONTINUE
      LINENO = 1548
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$NEQ(1,1)
      CALL P$STR(2,16)
      LINENO = 1549
      CALL P$LOD(2,16)
      CALL P$NOT
      CALL P$FJP($599)
      LINENO = 1550
      CALL P$LOD(0,25)
      CALL P$STR(1,20)
      LINENO = 1551
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
  599 CONTINUE
      LINENO = 1553
      CALL P$LOD(2,16)
      CALL P$FJP($580)
      LINENO = 1554
      CALL P$LOD(0,24)
      CALL P$STR(1,20)
      LINENO = 1555
      CALL P$LODA(0,22)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,21)
      CALL P$STO(0)
      GOTO 600
  565 CONTINUE
      LINENO = 1557
      CALL P$LODA(0,13)
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
  600 CONTINUE
      CALL P$RET(0)
      RETURN
  547 CONTINUE
      SG1SIZ = 29
      SG2SIZ = 243
      GOTO 548
      END

      SUBROUTINE P509
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 601
99998 CALL P$UJC
  602 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1561
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,236)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($603)
      LINENO = 1562
      CALL P$MST(2)
      CALL P$LDC(1,INTL(10))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,236)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  603 CONTINUE
      LINENO = 1563
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,236)
      CALL P$INN
      CALL P$FJP($604)
      LINENO = 1564
      LINENO = 1565
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,234)
      CALL P$INN
      CALL P$FJP($605)
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LODA(0,13)
      CALL P$LODA(0,14)
      CALL P$CUP(10)
      CALL P510
      GOTO 606
  605 CONTINUE
      LINENO = 1567
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(15))
      CALL P$EQU(1,1)
      CALL P$FJP($607)
      LINENO = 1568
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      CALL P$LODA(0,13)
      CALL P$LODA(0,17)
      CALL P$STO(0)
      LINENO = 1569
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,25)
      LINENO = 1570
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 1571
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1572
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($608)
      LINENO = 1573
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,31)
      LINENO = 1574
      CALL P$MST(2)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32400))
      CALL P$LDA(0,19)
      CALL P$CUP(9)
      CALL P337
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,31)
      LINENO = 1575
      CALL P$LODA(0,19)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($609)
      LINENO = 1576
      CALL P$LDA(0,19)
      CALL P$LDC(1,INTL(7))
      CALL P$NEW
      LINENO = 1577
      CALL P$LODA(0,19)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,25)
      LINENO = 1578
      CALL P$LODA(0,25)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,17)
      CALL P$STO(0)
      LINENO = 1579
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(5))
      CALL P$LDO(0,57)
      CALL P$STO(0)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 1581
      CALL P$LODA(0,19)
      CALL P$SRO(0,57)
      GOTO 610
  609 CONTINUE
      LINENO = 1584
      LINENO = 1585
      CALL P$LODA(0,19)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($611)
      LINENO = 1586
      CALL P$LODA(0,19)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$FJP($612)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(108))
      CALL P$CUP(1)
      CALL P30
      GOTO 613
  612 CONTINUE
      LINENO = 1587
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,19)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STO(0)
  613 CONTINUE
  611 CONTINUE
  610 CONTINUE
      LINENO = 1589
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 614
  608 CONTINUE
      LINENO = 1591
      CALL P$MST(2)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
  614 CONTINUE
      GOTO 615
  607 CONTINUE
      LINENO = 1594
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,24)
      LINENO = 1595
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(26))
      CALL P$EQU(1,1)
      CALL P$FJP($616)
      LINENO = 1596
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,24)
      LINENO = 1597
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,246)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($617)
      LINENO = 1598
      LINENO = 1599
      CALL P$MST(2)
      CALL P$LDC(1,INTL(10))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,246)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  617 CONTINUE
  616 CONTINUE
      LINENO = 1602
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(27))
      CALL P$EQU(1,1)
      CALL P$FJP($618)
      LINENO = 1603
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1604
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(10))
      CALL P$EQU(1,1)
      CALL P$FJP($619)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 620
  619 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(11))
      CALL P$CUP(1)
      CALL P30
  620 CONTINUE
      LINENO = 1605
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,16)
      LINENO = 1606
  621 CONTINUE
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(6))
      CALL P$NEW
      LINENO = 1607
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,25)
      LINENO = 1608
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,16)
      CALL P$STO(0)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      LINENO = 1609
      CALL P$LODA(0,17)
      CALL P$STRA(0,16)
      LINENO = 1610
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32401))
      CALL P$UNI
      CALL P$LDA(0,15)
      CALL P$LDA(0,21)
      CALL P$CUP(10)
      CALL P510
      LINENO = 1611
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LOD(0,21)
      CALL P$STO(1)
      LINENO = 1612
      CALL P$LODA(0,15)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($622)
      LINENO = 1613
      CALL P$LODA(0,15)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$FJP($623)
      LINENO = 1614
      LINENO = 1615
      CALL P$LODA(0,15)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($624)
      LINENO = 1616
      CALL P$MST(2)
      CALL P$LDC(1,INTL(109))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,15)
      GOTO 625
  624 CONTINUE
      LINENO = 1618
      CALL P$LODA(0,15)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($626)
      LINENO = 1619
      CALL P$MST(2)
      CALL P$LDC(1,INTL(149))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,15)
  626 CONTINUE
  625 CONTINUE
      LINENO = 1620
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,15)
      CALL P$STO(0)
      GOTO 627
  623 CONTINUE
      LINENO = 1622
      CALL P$MST(2)
      CALL P$LDC(1,INTL(113))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,15)
  627 CONTINUE
  622 CONTINUE
      LINENO = 1623
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(1,16)
      LINENO = 1624
      CALL P$LOD(1,16)
      CALL P$NOT
      CALL P$FJP($628)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
  628 CONTINUE
      LINENO = 1625
      CALL P$LOD(1,16)
      CALL P$FJP($621)
      LINENO = 1626
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(11))
      CALL P$EQU(1,1)
      CALL P$FJP($629)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 630
  629 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(12))
      CALL P$CUP(1)
      CALL P30
  630 CONTINUE
      LINENO = 1627
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(47))
      CALL P$EQU(1,1)
      CALL P$FJP($631)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 632
  631 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(8))
      CALL P$CUP(1)
      CALL P30
  632 CONTINUE
      LINENO = 1628
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDA(0,17)
      CALL P$LDA(0,21)
      CALL P$CUP(10)
      CALL P509
      LINENO = 1629
  633 CONTINUE
      LINENO = 1630
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,25)
      LINENO = 1631
      CALL P$LODA(0,25)
      CALL P$IND(0,5)
      CALL P$STRA(0,15)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,17)
      CALL P$STO(0)
      LINENO = 1632
      CALL P$LODA(0,25)
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($634)
      LINENO = 1633
      CALL P$MST(2)
      CALL P$LODA(0,25)
      CALL P$IND(0,4)
      CALL P$LDA(0,23)
      CALL P$LDA(0,22)
      CALL P$CUP(3)
      CALL P364
      LINENO = 1634
      CALL P$MST(2)
      CALL P$LODA(0,17)
      CALL P$LDA(0,21)
      CALL P$CUP(2)
      CALL P409
      LINENO = 1635
      CALL P$LOD(0,24)
      CALL P$LODA(0,25)
      CALL P$IND(0,5)
      CALL P$LDO(0,47)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($635)
      LINENO = 1636
      CALL P$LOD(0,22)
      CALL P$LOD(0,23)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDC(1,INTL(3))
      CALL P$ADI
      CALL P$LDC(1,INTL(4))
      CALL P$DVI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,21)
      GOTO 636
  635 CONTINUE
      LINENO = 1638
      CALL P$LOD(0,21)
      CALL P$LOD(0,22)
      CALL P$LOD(0,23)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$MPI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,21)
  636 CONTINUE
      LINENO = 1639
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(2))
      CALL P$LOD(0,21)
      CALL P$STO(1)
  634 CONTINUE
      LINENO = 1640
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(1))
      CALL P$LOD(0,24)
      CALL P$STO(3)
      LINENO = 1642
      CALL P$LODA(0,16)
      CALL P$STRA(0,17)
      CALL P$LODA(0,15)
      CALL P$STRA(0,16)
      LINENO = 1643
      CALL P$LODA(0,16)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($633)
      GOTO 637
  618 CONTINUE
      LINENO = 1646
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(28))
      CALL P$EQU(1,1)
      CALL P$FJP($638)
      LINENO = 1647
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1648
      CALL P$LDO(1,64)
      CALL P$STR(0,18)
      LINENO = 1649
      CALL P$LDO(1,64)
      CALL P$LDC(1,INTL(20))
      CALL P$LES(1,1)
      CALL P$FJP($639)
      LINENO = 1650
      CALL P$LDO(1,64)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$SRO(1,64)
      LINENO = 1651
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$STRA(0,25)
      LINENO = 1652
      CALL P$LODA(0,25)
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 1653
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 1654
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$STO(1)
      GOTO 640
  639 CONTINUE
      LINENO = 1657
      CALL P$MST(2)
      CALL P$LDC(1,INTL(250))
      CALL P$CUP(1)
      CALL P30
  640 CONTINUE
      LINENO = 1658
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,20)
      LINENO = 1659
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32403))
      CALL P$DIF
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32404))
      CALL P$UNI
      CALL P$LDA(0,16)
      CALL P$CUP(9)
      CALL P546
      LINENO = 1660
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(6))
      CALL P$NEW
      LINENO = 1661
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,25)
      LINENO = 1662
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(4))
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$IND(0,0)
      CALL P$STO(0)
      LINENO = 1663
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,16)
      CALL P$STO(0)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(2))
      CALL P$LOD(0,20)
      CALL P$STO(1)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      LINENO = 1665
      CALL P$LOD(0,18)
      CALL P$SRO(1,64)
      LINENO = 1666
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(39))
      CALL P$EQU(1,1)
      CALL P$FJP($641)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 642
  641 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(13))
      CALL P$CUP(1)
      CALL P30
  642 CONTINUE
      GOTO 643
  638 CONTINUE
      LINENO = 1669
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(25))
      CALL P$EQU(1,1)
      CALL P$FJP($644)
      LINENO = 1670
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1671
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(47))
      CALL P$EQU(1,1)
      CALL P$FJP($645)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 646
  645 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(8))
      CALL P$CUP(1)
      CALL P30
  646 CONTINUE
      LINENO = 1672
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDA(0,16)
      CALL P$LDA(0,21)
      CALL P$CUP(10)
      CALL P510
      LINENO = 1674
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,17)
      LINENO = 1675
      CALL P$LODA(0,16)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($647)
      LINENO = 1676
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$GRT(1,1)
      CALL P$FJP($648)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(115))
      CALL P$CUP(1)
      CALL P30
      GOTO 649
  648 CONTINUE
      LINENO = 1677
      CALL P$LODA(0,16)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($650)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(114))
      CALL P$CUP(1)
      CALL P30
      GOTO 651
  650 CONTINUE
      LINENO = 1678
      CALL P$LODA(0,16)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($652)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(169))
      CALL P$CUP(1)
      CALL P30
      GOTO 653
  652 CONTINUE
      LINENO = 1679
      LINENO = 1680
      CALL P$MST(2)
      CALL P$LODA(0,16)
      CALL P$LDA(0,23)
      CALL P$LDA(0,22)
      CALL P$CUP(3)
      CALL P364
      LINENO = 1681
      CALL P$LOD(0,23)
      CALL P$LDC(1,INTL(0))
      CALL P$LES(1,1)
      CALL P$LOD(0,22)
      CALL P$LDC(1,INTL(255))
      CALL P$GRT(1,1)
      CALL P$IOR
      CALL P$FJP($654)
      LINENO = 1682
      CALL P$MST(2)
      CALL P$LDC(1,INTL(169))
      CALL P$CUP(1)
      CALL P30
      GOTO 655
  654 CONTINUE
      LINENO = 1683
      LINENO = 1684
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 1685
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,25)
      LINENO = 1686
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$STO(1)
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,16)
      CALL P$STO(0)
      LINENO = 1687
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(2))
      CALL P$LOD(0,22)
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$LOD(0,23)
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
  655 CONTINUE
  653 CONTINUE
  651 CONTINUE
  649 CONTINUE
  647 CONTINUE
      GOTO 656
  644 CONTINUE
      LINENO = 1694
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(29))
      CALL P$EQU(1,1)
      CALL P$FJP($657)
      LINENO = 1695
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 1696
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(47))
      CALL P$EQU(1,1)
      CALL P$FJP($658)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 659
  658 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(8))
      CALL P$CUP(1)
      CALL P30
  659 CONTINUE
      LINENO = 1697
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,234)
      CALL P$INN
      CALL P$FJP($660)
      LINENO = 1698
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDA(0,16)
      CALL P$LDA(0,21)
      CALL P$CUP(10)
      CALL P510
      GOTO 661
  660 CONTINUE
      LINENO = 1699
      LINENO = 1700
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(26))
      CALL P$EQU(1,1)
      CALL P$FJP($662)
      LINENO = 1701
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,24)
      LINENO = 1702
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,246)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($663)
      LINENO = 1703
      CALL P$MST(2)
      CALL P$LDC(1,INTL(10))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,246)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  663 CONTINUE
  662 CONTINUE
      LINENO = 1705
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDA(0,16)
      CALL P$LDA(0,21)
      CALL P$CUP(10)
      CALL P509
  661 CONTINUE
      LINENO = 1707
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(6))
      CALL P$STO(1)
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LOD(0,21)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 1710
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$NEQ(1,1)
      CALL P$FJP($664)
      LINENO = 1711
      LINENO = 1712
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,25)
      LINENO = 1713
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,16)
      CALL P$STO(0)
      LINENO = 1714
      CALL P$LODA(0,25)
      CALL P$INC(0,INTL(1))
      CALL P$LOD(0,24)
      CALL P$STO(3)
      GOTO 665
  664 CONTINUE
      LINENO = 1717
      LINENO = 1718
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(398))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(108))
      CALL P$CUP(1)
      CALL P30
  665 CONTINUE
  657 CONTINUE
  656 CONTINUE
  643 CONTINUE
  637 CONTINUE
      LINENO = 1721
      CALL P$LODA(0,13)
      CALL P$LODA(0,17)
      CALL P$STO(0)
  615 CONTINUE
  606 CONTINUE
      LINENO = 1723
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($666)
      LINENO = 1724
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P307
  666 CONTINUE
      GOTO 667
  604 CONTINUE
      LINENO = 1726
      CALL P$LODA(0,13)
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
  667 CONTINUE
      LINENO = 1727
      CALL P$LODA(0,13)
      CALL P$IND(0,0)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($668)
      CALL P$LODA(0,14)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      GOTO 669
  668 CONTINUE
      CALL P$LODA(0,14)
      CALL P$LODA(0,13)
      CALL P$IND(0,0)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STO(1)
  669 CONTINUE
      CALL P$RET(0)
      RETURN
  601 CONTINUE
      SG1SIZ = 26
      SG2SIZ = 289
      GOTO 602
      END

      SUBROUTINE P670
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 671
99998 CALL P$UJC
  672 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1735
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$STRA(0,8)
      LINENO = 1736
      CALL P$LDA(0,7)
      CALL P$LDC(1,INTL(7))
      CALL P$NEW
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$MOV(2)
      LINENO = 1737
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(3))
      CALL P$LOD(0,6)
      CALL P$STO(1)
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,8)
      CALL P$STO(1)
      LINENO = 1738
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CUP(1)
      CALL P502
      CALL P$STO(3)
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(6))
      CALL P$LODA(0,8)
      CALL P$IND(0,2)
      CALL P$STO(0)
      LINENO = 1739
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($673)
      LINENO = 1740
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(1))
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,8)
      CALL P$STO(1)
      GOTO 674
  673 CONTINUE
      LINENO = 1741
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(1))
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$STO(1)
  674 CONTINUE
      LINENO = 1742
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(2))
      CALL P$LODA(0,7)
      CALL P$STO(0)
      CALL P$RET(0)
      RETURN
  671 CONTINUE
      SG1SIZ = 9
      SG2SIZ = 9
      GOTO 672
      END

      SUBROUTINE P675
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 676
99998 CALL P$UJC
  677 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1749
      CALL P$LDC(1,INTL(10))
      CALL P$STR(0,5)
      CALL P$RET(0)
      RETURN
  676 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 7
      GOTO 677
      END

      SUBROUTINE P678
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 679
99998 CALL P$UJC
  680 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1755
  681 CONTINUE
      LINENO = 1756
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($682)
      LINENO = 1757
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$STRA(0,8)
      LINENO = 1758
      CALL P$LODA(0,8)
      CALL P$IND(0,1)
      CALL P$STRA(0,5)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,6)
      LINENO = 1759
  683 CONTINUE
      LINENO = 1759
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LOD(0,6)
      CALL P$NOT
      CALL P$AND
      CALL P$FJP($684)
      LINENO = 1760
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDO(1,16)
      CALL P$NEQ(1,1)
      CALL P$FJP($685)
      LINENO = 1761
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,0)
      CALL P$STRA(0,5)
      GOTO 686
  685 CONTINUE
      LINENO = 1762
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,6)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(166))
      CALL P$CUP(1)
      CALL P30
  686 CONTINUE
      GOTO 683
  684 CONTINUE
      LINENO = 1763
      CALL P$LOD(0,6)
      CALL P$NOT
      CALL P$FJP($687)
      LINENO = 1764
      CALL P$LDA(0,5)
      CALL P$LDC(1,INTL(4))
      CALL P$NEW
      LINENO = 1765
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,9)
      LINENO = 1766
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(3))
      CALL P$LDO(1,16)
      CALL P$STO(1)
      CALL P$MST(2)
      CALL P$LDA(0,7)
      CALL P$CUP(1)
      CALL P412
      LINENO = 1767
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      CALL P$LODA(0,9)
      CALL P$LODA(0,8)
      CALL P$IND(0,1)
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(2))
      CALL P$LOD(0,7)
      CALL P$STO(1)
      LINENO = 1769
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(1))
      CALL P$LODA(0,5)
      CALL P$STO(0)
  687 CONTINUE
      LINENO = 1771
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 688
  682 CONTINUE
      LINENO = 1773
      CALL P$MST(2)
      CALL P$LDC(1,INTL(15))
      CALL P$CUP(1)
      CALL P30
  688 CONTINUE
      LINENO = 1774
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32405))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($689)
      LINENO = 1775
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32406))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  689 CONTINUE
      LINENO = 1776
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(1,16)
      LINENO = 1777
      CALL P$LOD(1,16)
      CALL P$NOT
      CALL P$FJP($690)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
  690 CONTINUE
      LINENO = 1778
      CALL P$LOD(1,16)
      CALL P$FJP($681)
      LINENO = 1779
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($691)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 692
  691 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
  692 CONTINUE
      CALL P$RET(0)
      RETURN
  679 CONTINUE
      SG1SIZ = 10
      SG2SIZ = 45
      GOTO 680
      END

      SUBROUTINE P693
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 694
99998 CALL P$UJC
  695 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1785
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($696)
      LINENO = 1786
      CALL P$MST(2)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32407))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  696 CONTINUE
      LINENO = 1787
  697 CONTINUE
      LINENO = 1787
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($698)
      LINENO = 1788
      CALL P$LDA(0,5)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 1789
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,9)
      LINENO = 1790
      CALL P$LODA(0,9)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1791
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1792
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(7))
      CALL P$EQU(1,1)
      CALL P$LDO(1,14)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$FJP($699)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 700
  699 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(16))
      CALL P$CUP(1)
      CALL P30
  700 CONTINUE
      LINENO = 1793
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32408))
      CALL P$UNI
      CALL P$LDA(0,6)
      CALL P$LDA(0,7)
      CALL P$CUP(10)
      CALL P423
      LINENO = 1794
      CALL P$MST(2)
      CALL P$LODA(0,5)
      CALL P$CUP(1)
      CALL P314
      LINENO = 1795
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,6)
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(7))
      CALL P$LDA(0,7)
      CALL P$MOV(2)
      LINENO = 1796
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($701)
      LINENO = 1797
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1798
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32409))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($702)
      LINENO = 1799
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32410))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  702 CONTINUE
      GOTO 703
  701 CONTINUE
      LINENO = 1801
      CALL P$MST(2)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
  703 CONTINUE
      GOTO 697
  698 CONTINUE
      CALL P$RET(0)
      RETURN
  694 CONTINUE
      SG1SIZ = 10
      SG2SIZ = 81
      GOTO 695
      END

      SUBROUTINE P704
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 705
99998 CALL P$UJC
  706 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1808
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($707)
      LINENO = 1809
      CALL P$MST(2)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32411))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  707 CONTINUE
      LINENO = 1810
  708 CONTINUE
      LINENO = 1810
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($709)
      LINENO = 1811
      CALL P$LDA(0,7)
      CALL P$LDC(1,INTL(7))
      CALL P$NEW
      LINENO = 1812
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,10)
      LINENO = 1813
      CALL P$LODA(0,10)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,10)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,10)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 1814
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1815
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(7))
      CALL P$EQU(1,1)
      CALL P$LDO(1,14)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$FJP($710)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 711
  710 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(16))
      CALL P$CUP(1)
      CALL P30
  711 CONTINUE
      LINENO = 1816
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32412))
      CALL P$UNI
      CALL P$LDA(0,8)
      CALL P$LDA(0,9)
      CALL P$CUP(10)
      CALL P509
      LINENO = 1817
      CALL P$MST(2)
      CALL P$LODA(0,7)
      CALL P$CUP(1)
      CALL P314
      LINENO = 1818
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,8)
      CALL P$STO(0)
      LINENO = 1820
      CALL P$LDO(0,57)
      CALL P$STRA(0,6)
      LINENO = 1821
  712 CONTINUE
      LINENO = 1821
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($713)
      LINENO = 1822
      LINENO = 1823
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$EQU(5,8)
      CALL P$FJP($714)
      LINENO = 1824
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STO(0)
      LINENO = 1825
      CALL P$LODA(0,6)
      CALL P$LDO(0,57)
      CALL P$NEQ(0,1)
      CALL P$FJP($715)
      LINENO = 1826
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STO(0)
      GOTO 716
  715 CONTINUE
      LINENO = 1827
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$SRO(0,57)
  716 CONTINUE
      GOTO 717
  714 CONTINUE
      LINENO = 1829
      CALL P$LODA(0,6)
      CALL P$STRA(0,5)
  717 CONTINUE
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,6)
      GOTO 712
  713 CONTINUE
      LINENO = 1831
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($718)
      LINENO = 1832
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1833
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32413))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($719)
      LINENO = 1834
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32414))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  719 CONTINUE
      GOTO 720
  718 CONTINUE
      LINENO = 1836
      CALL P$MST(2)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
  720 CONTINUE
      GOTO 708
  709 CONTINUE
      LINENO = 1838
      CALL P$LDO(0,57)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($721)
      LINENO = 1839
      CALL P$MST(2)
      CALL P$LDC(1,INTL(117))
      CALL P$CUP(1)
      CALL P30
      CALL P$LAO(7)
      CALL P$WLN
      LINENO = 1840
  722 CONTINUE
      CALL P$LAO(7)
      CALL P$LCA(26409)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LDO(0,57)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDC(1,INTL(8))
      CALL P$LDC(1,INTL(8))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1841
      CALL P$LDO(0,57)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$SRO(0,57)
      LINENO = 1842
      CALL P$LDO(0,57)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($722)
      LINENO = 1843
      CALL P$LDO(3,21)
      CALL P$NOT
      CALL P$FJP($723)
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDO(1,22)
      CALL P$LDC(1,INTL(20))
      CALL P$ADI
      CALL P$WRC
      SP=SP-1
  723 CONTINUE
  721 CONTINUE
      CALL P$RET(0)
      RETURN
  705 CONTINUE
      SG1SIZ = 11
      SG2SIZ = 81
      GOTO 706
      END

      SUBROUTINE P724
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 725
99998 CALL P$UJC
  726 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1852
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,5)
      LINENO = 1853
  727 CONTINUE
      LINENO = 1854
  728 CONTINUE
      LINENO = 1855
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($729)
      LINENO = 1856
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(10))
      CALL P$NEW
      LINENO = 1857
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,15)
      LINENO = 1858
      CALL P$LODA(0,15)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,15)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,5)
      CALL P$STO(0)
      CALL P$LODA(0,15)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 1859
      CALL P$LODA(0,15)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,15)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,15)
      CALL P$INC(0,INTL(8))
      CALL P$LDO(1,62)
      CALL P$STO(1)
      LINENO = 1861
      CALL P$MST(2)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      LINENO = 1862
      CALL P$LODA(0,6)
      CALL P$STRA(0,5)
      LINENO = 1863
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 730
  729 CONTINUE
      LINENO = 1865
      CALL P$MST(2)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
  730 CONTINUE
      LINENO = 1866
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32415))
      CALL P$UNI
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,246)
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($731)
      LINENO = 1867
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32416))
      CALL P$UNI
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,246)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  731 CONTINUE
      LINENO = 1868
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(1,16)
      LINENO = 1869
      CALL P$LOD(1,16)
      CALL P$NOT
      CALL P$FJP($732)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
  732 CONTINUE
      LINENO = 1870
      CALL P$LOD(1,16)
      CALL P$FJP($728)
      LINENO = 1871
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($733)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 734
  733 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
  734 CONTINUE
      LINENO = 1872
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32417))
      CALL P$UNI
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,246)
      CALL P$UNI
      CALL P$LDA(0,8)
      CALL P$LDA(0,9)
      CALL P$CUP(10)
      CALL P509
      LINENO = 1873
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,14)
      CALL P$LODA(0,8)
      CALL P$STRA(0,7)
      LINENO = 1874
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32418))
      CALL P$INN
      CALL P$FJP($735)
      LINENO = 1875
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      GOTO 736
  738 CONTINUE
      LINENO = 1876
  739 CONTINUE
      LINENO = 1876
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($740)
      LINENO = 1877
      CALL P$MST(2)
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDA(0,13)
      CALL P$LDA(0,12)
      CALL P$CUP(3)
      CALL P364
      LINENO = 1878
      CALL P$LOD(0,12)
      CALL P$LOD(0,13)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LOD(0,14)
      CALL P$MPI
      CALL P$STR(0,14)
      LINENO = 1879
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,7)
      GOTO 739
  740 CONTINUE
      GOTO 737
  741 CONTINUE
      LINENO = 1881
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P675
      GOTO 737
  736 CONTINUE
      CALL P$CHK(INTL(4),INTL(5))
      CALL P$LDC(1,INTL(4))
      CALL P$SBI
      CALL P$XJP($742)
  742 CONTINUE
  743 GOTO 738
  744 GOTO 741
  737 CONTINUE
  735 CONTINUE
      LINENO = 1883
  745 CONTINUE
      LINENO = 1883
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($746)
      LINENO = 1884
      CALL P$MST(2)
      CALL P$LODA(0,8)
      CALL P$LAO(23)
      CALL P$CUP(2)
      CALL P409
      LINENO = 1885
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,8)
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(9))
      CALL P$LDO(1,23)
      CALL P$STO(1)
      CALL P$LDO(1,23)
      CALL P$STR(0,11)
      LINENO = 1886
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$FJP($747)
      LINENO = 1887
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,10)
      CALL P$LOD(0,14)
      CALL P$STR(0,15)
  748 CONTINUE
      CALL P$LOD(0,10)
      CALL P$LOD(0,15)
      CALL P$LEQ(1)
      CALL P$FJP($749)
      LINENO = 1888
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$LOD(0,11)
      CALL P$CUP(2)
      CALL P670
      LINENO = 1889
      CALL P$LOD(0,11)
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$ADI
      CALL P$STR(0,11)
      CALL P$LOD(0,10)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,10)
      GOTO 748
  749 CONTINUE
  747 CONTINUE
      LINENO = 1891
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$FJP($750)
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$LOD(0,11)
      CALL P$CUP(2)
      CALL P670
  750 CONTINUE
      LINENO = 1892
      CALL P$LDO(1,23)
      CALL P$LOD(0,9)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,23)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,5)
      GOTO 745
  746 CONTINUE
      LINENO = 1894
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($751)
      LINENO = 1895
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1896
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32419))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($752)
      LINENO = 1897
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32420))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  752 CONTINUE
      GOTO 753
  751 CONTINUE
      LINENO = 1899
      CALL P$MST(2)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
  753 CONTINUE
      LINENO = 1900
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,246)
      CALL P$INN
      CALL P$NOT
      CALL P$AND
      CALL P$FJP($727)
      LINENO = 1901
      CALL P$LDO(0,57)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($754)
      LINENO = 1902
      CALL P$MST(2)
      CALL P$LDC(1,INTL(117))
      CALL P$CUP(1)
      CALL P30
      CALL P$LAO(7)
      CALL P$WLN
      LINENO = 1903
  755 CONTINUE
      CALL P$LAO(7)
      CALL P$LCA(26412)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LDO(0,57)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDC(1,INTL(8))
      CALL P$LDC(1,INTL(8))
      CALL P$WRS
      CALL P$WLN
      LINENO = 1904
      CALL P$LDO(0,57)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$SRO(0,57)
      LINENO = 1905
      CALL P$LDO(0,57)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($755)
      LINENO = 1906
      CALL P$LDO(3,21)
      CALL P$NOT
      CALL P$FJP($756)
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDO(1,22)
      CALL P$LDC(1,INTL(20))
      CALL P$ADI
      CALL P$WRC
      SP=SP-1
  756 CONTINUE
  754 CONTINUE
      CALL P$RET(0)
      RETURN
  725 CONTINUE
      SG1SIZ = 16
      SG2SIZ = 107
      GOTO 726
      END

      SUBROUTINE P758
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 759
99998 CALL P$UJC
  760 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 1918
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,16)
      LINENO = 1919
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32421))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($761)
      LINENO = 1920
      CALL P$MST(3)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$UNI
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32422))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  761 CONTINUE
      LINENO = 1921
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($762)
      LINENO = 1922
      CALL P$LOD(1,11)
      CALL P$FJP($763)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(119))
      CALL P$CUP(1)
      CALL P30
  763 CONTINUE
      LINENO = 1923
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1924
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32423))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($764)
      LINENO = 1925
      CALL P$MST(3)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32424))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  764 CONTINUE
      LINENO = 1926
  765 CONTINUE
      LINENO = 1926
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32425))
      CALL P$INN
      CALL P$FJP($766)
      LINENO = 1927
      LINENO = 1928
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(24))
      CALL P$EQU(1,1)
      CALL P$FJP($767)
      LINENO = 1929
      CALL P$MST(3)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
      LINENO = 1930
  768 CONTINUE
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1931
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($769)
      LINENO = 1932
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(11))
      CALL P$NEW
      LINENO = 1933
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,26)
      LINENO = 1934
      CALL P$LODA(0,26)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,16)
      CALL P$STO(0)
      LINENO = 1935
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(8))
      CALL P$LDO(1,62)
      CALL P$STO(1)
      LINENO = 1936
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(10))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1938
      CALL P$MST(3)
      CALL P$LODA(0,17)
      CALL P$CUP(1)
      CALL P314
      LINENO = 1939
      CALL P$LODA(0,17)
      CALL P$STRA(0,16)
      LINENO = 1940
      CALL P$MST(3)
      CALL P$LDO(0,44)
      CALL P$LAO(23)
      CALL P$CUP(2)
      CALL P409
      LINENO = 1942
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 770
  769 CONTINUE
      LINENO = 1944
      CALL P$MST(3)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
  770 CONTINUE
      LINENO = 1945
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32426))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($771)
      LINENO = 1946
      CALL P$MST(3)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32427))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  771 CONTINUE
      LINENO = 1947
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$FJP($768)
      GOTO 772
  767 CONTINUE
      LINENO = 1950
      LINENO = 1951
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(22))
      CALL P$EQU(1,1)
      CALL P$FJP($773)
      LINENO = 1952
      CALL P$MST(3)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,15)
      LINENO = 1953
  774 CONTINUE
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1954
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($775)
      LINENO = 1955
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(11))
      CALL P$NEW
      LINENO = 1956
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,26)
      LINENO = 1957
      CALL P$LODA(0,26)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,15)
      CALL P$STO(0)
      LINENO = 1958
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(8))
      CALL P$LDO(1,62)
      CALL P$STO(1)
      LINENO = 1959
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1960
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(10))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 1962
      CALL P$MST(3)
      CALL P$LODA(0,17)
      CALL P$CUP(1)
      CALL P314
      LINENO = 1963
      CALL P$LODA(0,17)
      CALL P$STRA(0,15)
      LINENO = 1964
      CALL P$MST(3)
      CALL P$LDO(0,44)
      CALL P$LAO(23)
      CALL P$CUP(2)
      CALL P409
      LINENO = 1966
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
  775 CONTINUE
      LINENO = 1968
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32428))
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($776)
      LINENO = 1969
      CALL P$MST(3)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32429))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  776 CONTINUE
      LINENO = 1971
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$FJP($774)
      LINENO = 1972
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($777)
      LINENO = 1973
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 1974
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($778)
      LINENO = 1975
      CALL P$MST(3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32430))
      CALL P$LDA(0,17)
      CALL P$CUP(9)
      CALL P337
      LINENO = 1976
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,18)
      LINENO = 1977
      CALL P$LODA(0,18)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($779)
      LINENO = 1978
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32431))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($780)
      LINENO = 1979
      CALL P$MST(3)
      CALL P$LDC(1,INTL(120))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,18)
  780 CONTINUE
  779 CONTINUE
      LINENO = 1980
      CALL P$LODA(0,15)
      CALL P$STRA(0,14)
      LINENO = 1981
  781 CONTINUE
      LINENO = 1981
      CALL P$LODA(0,15)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($782)
      LINENO = 1982
      CALL P$LODA(0,15)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,18)
      CALL P$STO(0)
      CALL P$LODA(0,15)
      CALL P$STRA(0,17)
      LINENO = 1983
      CALL P$LODA(0,15)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,15)
      GOTO 781
  782 CONTINUE
      LINENO = 1985
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,16)
      CALL P$STO(0)
      CALL P$LODA(0,14)
      CALL P$STRA(0,16)
      LINENO = 1986
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 783
  778 CONTINUE
      LINENO = 1988
      CALL P$MST(3)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
  783 CONTINUE
      LINENO = 1989
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32432))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($784)
      LINENO = 1990
      CALL P$MST(3)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32433))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  784 CONTINUE
      GOTO 785
  777 CONTINUE
      LINENO = 1992
      CALL P$MST(3)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
  785 CONTINUE
      GOTO 786
  773 CONTINUE
      LINENO = 1995
      LINENO = 1996
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(21))
      CALL P$EQU(1,1)
      CALL P$FJP($787)
      LINENO = 1998
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,19)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 788
  787 CONTINUE
      LINENO = 1999
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,19)
  788 CONTINUE
      LINENO = 2000
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,15)
      LINENO = 2001
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,25)
      LINENO = 2002
  789 CONTINUE
      LINENO = 2003
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($790)
      LINENO = 2004
      CALL P$LDA(0,17)
      CALL P$LDC(1,INTL(10))
      CALL P$NEW
      LINENO = 2005
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,26)
      LINENO = 2006
      CALL P$LODA(0,26)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 2007
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(7))
      CALL P$LOD(0,19)
      CALL P$STO(1)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,15)
      CALL P$STO(0)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(8))
      CALL P$LDO(1,62)
      CALL P$STO(1)
      LINENO = 2009
      CALL P$MST(3)
      CALL P$LODA(0,17)
      CALL P$CUP(1)
      CALL P314
      LINENO = 2010
      CALL P$LODA(0,17)
      CALL P$STRA(0,15)
      CALL P$LOD(0,25)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,25)
      LINENO = 2011
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
  790 CONTINUE
      LINENO = 2013
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32434))
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($791)
      LINENO = 2014
      CALL P$MST(3)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32435))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  791 CONTINUE
      LINENO = 2016
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(2,16)
      LINENO = 2017
      CALL P$LOD(2,16)
      CALL P$NOT
      CALL P$FJP($792)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
  792 CONTINUE
      LINENO = 2018
      CALL P$LOD(2,16)
      CALL P$FJP($789)
      LINENO = 2019
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($793)
      LINENO = 2020
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 2021
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($794)
      LINENO = 2022
      CALL P$MST(3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32436))
      CALL P$LDA(0,17)
      CALL P$CUP(9)
      CALL P337
      LINENO = 2023
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,18)
      LINENO = 2024
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,24)
      LINENO = 2025
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,23)
      LINENO = 2026
      CALL P$LODA(0,18)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($795)
      LINENO = 2027
      CALL P$LOD(0,19)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($796)
      LINENO = 2028
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$LES(1,1)
      CALL P$FJP($797)
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STR(0,24)
      GOTO 798
  797 CONTINUE
      LINENO = 2029
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($799)
      LINENO = 2030
      CALL P$LDC(1,INTL(255))
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,24)
      LINENO = 2031
      CALL P$MST(3)
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDA(0,21)
      CALL P$LDA(0,22)
      CALL P$CUP(3)
      CALL P364
      LINENO = 2032
      CALL P$LOD(0,21)
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$STR(0,23)
      GOTO 800
  799 CONTINUE
      LINENO = 2034
      CALL P$LODA(0,18)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$FJP($801)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(121))
      CALL P$CUP(1)
      CALL P30
  801 CONTINUE
  800 CONTINUE
  798 CONTINUE
  796 CONTINUE
  795 CONTINUE
      LINENO = 2035
      CALL P$MST(3)
      CALL P$LDO(0,44)
      CALL P$LDA(0,24)
      CALL P$CUP(2)
      CALL P409
      LINENO = 2036
      CALL P$LODA(0,15)
      CALL P$STRA(0,14)
      LINENO = 2037
      CALL P$MST(3)
      CALL P$LDO(0,44)
      CALL P$LAO(23)
      CALL P$CUP(2)
      CALL P409
      LINENO = 2038
      CALL P$LDO(1,23)
      CALL P$LOD(0,25)
      CALL P$LOD(0,24)
      CALL P$MPI
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,23)
      LINENO = 2039
      CALL P$LDO(1,23)
      CALL P$STR(0,20)
      LINENO = 2040
  802 CONTINUE
      LINENO = 2040
      CALL P$LODA(0,15)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($803)
      LINENO = 2041
      CALL P$LODA(0,15)
      CALL P$STRA(0,17)
      LINENO = 2042
      CALL P$LODA(0,15)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,26)
      LINENO = 2043
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,18)
      CALL P$STO(0)
      LINENO = 2044
      CALL P$LOD(0,20)
      CALL P$LOD(0,24)
      CALL P$SBI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,20)
      LINENO = 2045
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(9))
      CALL P$LOD(0,20)
      CALL P$LOD(0,23)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 2047
      CALL P$LODA(0,15)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,15)
      GOTO 802
  803 CONTINUE
      LINENO = 2049
      CALL P$LODA(0,17)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,16)
      CALL P$STO(0)
      CALL P$LODA(0,14)
      CALL P$STRA(0,16)
      LINENO = 2050
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 804
  794 CONTINUE
      LINENO = 2052
      CALL P$MST(3)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
  804 CONTINUE
      LINENO = 2053
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32437))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($805)
      LINENO = 2054
      CALL P$MST(3)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32438))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  805 CONTINUE
      GOTO 806
  793 CONTINUE
      LINENO = 2056
      CALL P$MST(3)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
  806 CONTINUE
  786 CONTINUE
  772 CONTINUE
      LINENO = 2059
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($807)
      LINENO = 2060
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 2061
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32439))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($808)
      LINENO = 2062
      CALL P$MST(3)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32440))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  808 CONTINUE
  807 CONTINUE
      GOTO 765
  766 CONTINUE
      LINENO = 2065
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($809)
      LINENO = 2066
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 2067
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($810)
      LINENO = 2068
      CALL P$MST(3)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(2,5)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  810 CONTINUE
      GOTO 811
  809 CONTINUE
      LINENO = 2070
      CALL P$MST(3)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
  811 CONTINUE
      LINENO = 2071
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,14)
      LINENO = 2074
  812 CONTINUE
      LINENO = 2074
      CALL P$LODA(0,16)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($813)
      LINENO = 2075
      CALL P$LODA(0,16)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,26)
      LINENO = 2076
      CALL P$LODA(0,26)
      CALL P$IND(0,5)
      CALL P$STRA(0,15)
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,14)
      CALL P$STO(0)
      LINENO = 2077
      CALL P$LODA(0,26)
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($814)
      LINENO = 2078
      CALL P$LODA(0,26)
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($815)
      LINENO = 2079
      CALL P$LODA(0,26)
      CALL P$IND(1,7)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$LODA(0,26)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$GRT(1,1)
      CALL P$AND
      CALL P$FJP($816)
      LINENO = 2080
      CALL P$MST(3)
      CALL P$LODA(0,26)
      CALL P$IND(0,4)
      CALL P$LAO(23)
      CALL P$CUP(2)
      CALL P409
      LINENO = 2081
      CALL P$LODA(0,26)
      CALL P$INC(0,INTL(9))
      CALL P$LDO(1,23)
      CALL P$STO(1)
      LINENO = 2082
      CALL P$LDO(1,23)
      CALL P$LODA(0,26)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,23)
  816 CONTINUE
  815 CONTINUE
  814 CONTINUE
      LINENO = 2084
      CALL P$LODA(0,16)
      CALL P$STRA(0,14)
      CALL P$LODA(0,15)
      CALL P$STRA(0,16)
      GOTO 812
  813 CONTINUE
      LINENO = 2086
      CALL P$LODA(0,13)
      CALL P$LODA(0,14)
      CALL P$STO(0)
      GOTO 817
  762 CONTINUE
      LINENO = 2088
      CALL P$LODA(0,13)
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
  817 CONTINUE
      CALL P$RET(0)
      RETURN
  759 CONTINUE
      SG1SIZ = 27
      SG2SIZ = 267
      GOTO 760
      END

      SUBROUTINE P757
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 818
99998 CALL P$UJC
  819 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2092
      CALL P$LDO(1,23)
      CALL P$STR(0,15)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,23)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,11)
      LINENO = 2093
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($820)
      LINENO = 2094
      CALL P$MST(2)
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$IND(0,0)
      CALL P$LDA(0,9)
      CALL P$CUP(2)
      CALL P326
      LINENO = 2095
      CALL P$LODA(0,9)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($821)
      LINENO = 2096
      LINENO = 2097
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($822)
      LINENO = 2098
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(3,11)
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(24))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,10)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$STR(0,11)
      GOTO 823
  822 CONTINUE
      LINENO = 2100
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($824)
      LINENO = 2101
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(3,11)
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(22))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,10)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$STR(0,11)
      GOTO 825
  824 CONTINUE
      LINENO = 2102
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,11)
  825 CONTINUE
  823 CONTINUE
      LINENO = 2103
      CALL P$LOD(0,11)
      CALL P$NOT
      CALL P$FJP($826)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(160))
      CALL P$CUP(1)
      CALL P30
  826 CONTINUE
  821 CONTINUE
      LINENO = 2105
      CALL P$LOD(0,11)
      CALL P$NOT
      CALL P$FJP($827)
      LINENO = 2106
      LINENO = 2107
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(24))
      CALL P$EQU(1,1)
      CALL P$FJP($828)
      CALL P$LDA(0,9)
      CALL P$LDC(1,INTL(15))
      CALL P$NEW
      GOTO 829
  828 CONTINUE
      LINENO = 2108
      CALL P$LDA(0,9)
      CALL P$LDC(1,INTL(15))
      CALL P$NEW
  829 CONTINUE
      LINENO = 2109
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,18)
      LINENO = 2110
      CALL P$LODA(0,18)
      CALL P$LAO(18)
      CALL P$MOV(2)
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(13))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      LINENO = 2111
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(12))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(8))
      CALL P$LDO(1,62)
      CALL P$STO(1)
      LINENO = 2112
      CALL P$MST(2)
      CALL P$LDA(0,16)
      CALL P$CUP(1)
      CALL P412
      LINENO = 2114
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(10))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(9))
      CALL P$LOD(0,16)
      CALL P$STO(1)
      LINENO = 2115
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(24))
      CALL P$EQU(1,1)
      CALL P$FJP($830)
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      GOTO 831
  830 CONTINUE
      LINENO = 2116
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
  831 CONTINUE
      LINENO = 2118
      CALL P$MST(2)
      CALL P$LODA(0,9)
      CALL P$CUP(1)
      CALL P314
      GOTO 832
  827 CONTINUE
      LINENO = 2121
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,8)
      LINENO = 2122
  833 CONTINUE
      LINENO = 2122
      CALL P$LODA(0,8)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($834)
      LINENO = 2123
      LINENO = 2124
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,18)
      LINENO = 2125
      CALL P$LODA(0,18)
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($835)
      LINENO = 2126
      CALL P$LODA(0,18)
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($836)
      LINENO = 2127
      CALL P$LODA(0,18)
      CALL P$IND(1,9)
      CALL P$LODA(0,18)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,14)
      LINENO = 2128
      CALL P$LOD(0,14)
      CALL P$LDO(1,23)
      CALL P$GRT(1,1)
      CALL P$FJP($837)
      CALL P$LOD(0,14)
      CALL P$SRO(1,23)
  837 CONTINUE
  836 CONTINUE
  835 CONTINUE
      LINENO = 2130
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,8)
      GOTO 833
  834 CONTINUE
  832 CONTINUE
      LINENO = 2133
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 838
  820 CONTINUE
      LINENO = 2136
      CALL P$MST(2)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDO(0,56)
      CALL P$STRA(0,9)
  838 CONTINUE
      LINENO = 2138
      CALL P$LDO(1,62)
      CALL P$STR(0,6)
      CALL P$LDO(1,64)
      CALL P$STR(0,12)
      LINENO = 2139
      CALL P$LDO(1,62)
      CALL P$LDC(1,INTL(10))
      CALL P$LES(1,1)
      CALL P$FJP($839)
      CALL P$LDO(1,62)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$SRO(1,62)
      GOTO 840
  839 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(251))
      CALL P$CUP(1)
      CALL P30
  840 CONTINUE
      LINENO = 2140
      CALL P$LDO(1,64)
      CALL P$LDC(1,INTL(20))
      CALL P$LES(1,1)
      CALL P$FJP($841)
      LINENO = 2141
      CALL P$LDO(1,64)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$SRO(1,64)
      LINENO = 2142
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$STRA(0,18)
      LINENO = 2143
      LINENO = 2144
      CALL P$LOD(0,11)
      CALL P$FJP($842)
      CALL P$LODA(0,18)
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STO(0)
      GOTO 843
  842 CONTINUE
      LINENO = 2145
      CALL P$LODA(0,18)
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
  843 CONTINUE
      LINENO = 2146
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 2147
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 2148
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      GOTO 844
  841 CONTINUE
      LINENO = 2151
      CALL P$MST(2)
      CALL P$LDC(1,INTL(250))
      CALL P$CUP(1)
      CALL P30
  844 CONTINUE
      LINENO = 2152
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(24))
      CALL P$EQU(1,1)
      CALL P$FJP($845)
      LINENO = 2153
      CALL P$MST(0)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32441))
      CALL P$LDA(0,8)
      CALL P$CUP(9)
      CALL P758
      LINENO = 2155
      CALL P$LOD(0,11)
      CALL P$NOT
      CALL P$FJP($846)
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,8)
      CALL P$STO(0)
  846 CONTINUE
      GOTO 847
  845 CONTINUE
      LINENO = 2159
      CALL P$MST(0)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32442))
      CALL P$LDA(0,8)
      CALL P$CUP(9)
      CALL P758
      LINENO = 2160
      CALL P$LOD(0,11)
      CALL P$NOT
      CALL P$FJP($848)
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,8)
      CALL P$STO(0)
  848 CONTINUE
      LINENO = 2162
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($849)
      LINENO = 2163
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 2164
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($850)
      LINENO = 2165
      CALL P$LOD(0,11)
      CALL P$FJP($851)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(122))
      CALL P$CUP(1)
      CALL P30
  851 CONTINUE
      LINENO = 2166
      CALL P$MST(2)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32443))
      CALL P$LDA(0,8)
      CALL P$CUP(9)
      CALL P337
      LINENO = 2167
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,10)
      LINENO = 2168
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,10)
      CALL P$STO(0)
      LINENO = 2169
      CALL P$LODA(0,10)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($852)
      LINENO = 2170
      CALL P$LODA(0,10)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32444))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($853)
      LINENO = 2171
      CALL P$MST(2)
      CALL P$LDC(1,INTL(120))
      CALL P$CUP(1)
      CALL P30
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
  853 CONTINUE
  852 CONTINUE
      LINENO = 2172
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 854
  850 CONTINUE
      LINENO = 2174
      CALL P$MST(2)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32445))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
  854 CONTINUE
      GOTO 855
  849 CONTINUE
      LINENO = 2177
      CALL P$LOD(0,11)
      CALL P$NOT
      CALL P$FJP($856)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(123))
      CALL P$CUP(1)
      CALL P30
  856 CONTINUE
  855 CONTINUE
  847 CONTINUE
      LINENO = 2179
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($857)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 858
  857 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
  858 CONTINUE
      LINENO = 2180
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(30))
      CALL P$EQU(1,1)
      CALL P$FJP($859)
      LINENO = 2181
      LINENO = 2182
      CALL P$LOD(0,11)
      CALL P$FJP($860)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(161))
      CALL P$CUP(1)
      CALL P30
      GOTO 861
  860 CONTINUE
      LINENO = 2183
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(11))
      CALL P$LDC(3,INTL(1))
      CALL P$STO(3)
  861 CONTINUE
      LINENO = 2184
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 2185
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($862)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 863
  862 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
  863 CONTINUE
      LINENO = 2186
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($864)
      LINENO = 2187
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$CUP(8)
      CALL P307
  864 CONTINUE
      GOTO 865
  859 CONTINUE
      LINENO = 2189
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(41))
      CALL P$EQU(1,1)
      CALL P$FJP($866)
      LINENO = 2190
      LINENO = 2191
      CALL P$MST(2)
      CALL P$LDC(1,INTL(400))
      CALL P$CUP(1)
      CALL P30
      LINENO = 2192
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(12))
      CALL P$LDC(3,INTL(1))
      CALL P$STO(3)
      LINENO = 2193
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 2194
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$NEQ(1,1)
      CALL P$FJP($867)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
      GOTO 868
  867 CONTINUE
      LINENO = 2195
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
  868 CONTINUE
      LINENO = 2196
      CALL P$MST(2)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32446))
      CALL P$CUP(8)
      CALL P307
      GOTO 869
  866 CONTINUE
      LINENO = 2198
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(42))
      CALL P$EQU(1,1)
      CALL P$FJP($870)
      LINENO = 2199
      LINENO = 2200
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(13))
      CALL P$LDC(3,INTL(1))
      CALL P$STO(3)
      LINENO = 2203
      CALL P$LDO(0,58)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($871)
      LINENO = 2204
      LINENO = 2205
      CALL P$LODA(0,9)
      CALL P$SRO(0,58)
      LINENO = 2206
      CALL P$LODA(0,9)
      CALL P$SRO(0,59)
      LINENO = 2207
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(14))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      GOTO 872
  871 CONTINUE
      LINENO = 2210
      LINENO = 2211
      CALL P$LDO(0,59)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(14))
      CALL P$LODA(0,9)
      CALL P$STO(0)
      LINENO = 2212
      CALL P$LODA(0,9)
      CALL P$SRO(0,59)
      LINENO = 2213
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(14))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
  872 CONTINUE
      LINENO = 2215
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($873)
      LINENO = 2216
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$IOR
      CALL P$NOT
      CALL P$FJP($874)
      LINENO = 2217
      CALL P$MST(2)
      CALL P$LDC(1,INTL(397))
      CALL P$CUP(1)
      CALL P30
  874 CONTINUE
  873 CONTINUE
      LINENO = 2218
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 2219
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$NEQ(1,1)
      CALL P$FJP($875)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
      GOTO 876
  875 CONTINUE
      LINENO = 2220
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
  876 CONTINUE
      LINENO = 2221
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32447))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($877)
      LINENO = 2222
      LINENO = 2223
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      LINENO = 2224
      CALL P$MST(2)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32448))
      CALL P$CUP(8)
      CALL P307
  877 CONTINUE
      GOTO 878
  870 CONTINUE
      LINENO = 2228
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(11))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      CALL P$LDA(0,17)
      CALL P$SAV
      LINENO = 2229
  879 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(13))
      CALL P$LODA(0,9)
      CALL P$CUP(10)
      CALL P422
      LINENO = 2230
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($880)
      LINENO = 2231
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      LINENO = 2232
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32449))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($881)
      LINENO = 2233
      CALL P$MST(2)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$CUP(8)
      CALL P307
  881 CONTINUE
      GOTO 882
  880 CONTINUE
      LINENO = 2235
      CALL P$MST(2)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
  882 CONTINUE
      LINENO = 2236
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32450))
      CALL P$INN
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$IOR
      CALL P$FJP($879)
      LINENO = 2237
      CALL P$LODA(0,17)
      CALL P$RST
  878 CONTINUE
  869 CONTINUE
  865 CONTINUE
      LINENO = 2239
      CALL P$LOD(0,6)
      CALL P$SRO(1,62)
      CALL P$LOD(0,12)
      CALL P$SRO(1,64)
      CALL P$LOD(0,15)
      CALL P$SRO(1,23)
      CALL P$RET(0)
      RETURN
  818 CONTINUE
      SG1SIZ = 19
      SG2SIZ = 223
      GOTO 819
      END

      SUBROUTINE P884
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 885
99998 CALL P$UJC
  886 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2263
      CALL P$LOD(1,20)
      CALL P$LAO(6255)
      CALL P$LOD(0,5)
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(2))
      CALL P$MPI
      CALL P$ADI
      CALL P$STR(1,20)
      LINENO = 2264
      CALL P$LOD(1,20)
      CALL P$LOD(1,19)
      CALL P$GRT(1,1)
      CALL P$FJP($887)
      CALL P$LOD(1,20)
      CALL P$STR(1,19)
  887 CONTINUE
      CALL P$RET(0)
      RETURN
  885 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 11
      GOTO 886
      END

      SUBROUTINE P888
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 889
99998 CALL P$UJC
  890 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2275
      CALL P$LOD(1,20)
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(2))
      CALL P$MPI
      CALL P$ADI
      CALL P$STR(1,20)
      LINENO = 2276
      CALL P$LOD(1,20)
      CALL P$LOD(1,19)
      CALL P$GRT(1,1)
      CALL P$FJP($891)
      CALL P$LOD(1,20)
      CALL P$STR(1,19)
  891 CONTINUE
      CALL P$RET(0)
      RETURN
  889 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 11
      GOTO 890
      END

      SUBROUTINE P892
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 893
99998 CALL P$UJC
  894 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2287
      CALL P$LDO(3,33)
      CALL P$FJP($895)
      LINENO = 2288
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26415)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LOD(0,5)
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$WLN
      LINENO = 2289
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$MST(1)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P884
  895 CONTINUE
      CALL P$RET(0)
      RETURN
  893 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 13
      GOTO 894
      END

      SUBROUTINE P896
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 897
99998 CALL P$UJC
  898 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2305
      CALL P$LDO(3,33)
      CALL P$FJP($899)
      LINENO = 2306
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(30))
      CALL P$EQU(1,1)
      CALL P$FJP($900)
      LINENO = 2307
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26416)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6197)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$WLN
      LINENO = 2308
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 2309
      CALL P$LOD(1,20)
      CALL P$LAO(6321)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(2))
      CALL P$MPI
      CALL P$ADI
      CALL P$STR(1,20)
      LINENO = 2310
      CALL P$LOD(1,20)
      CALL P$LOD(1,19)
      CALL P$GRT(1,1)
      CALL P$FJP($901)
      CALL P$LOD(1,20)
      CALL P$STR(1,19)
  901 CONTINUE
      GOTO 902
  900 CONTINUE
      LINENO = 2312
      LINENO = 2313
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26417)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LOD(0,5)
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2314
      CALL P$LAO(11)
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      SP=SP-1
      LINENO = 2315
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 2316
      CALL P$MST(1)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P884
      LINENO = 2317
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
  902 CONTINUE
  899 CONTINUE
      CALL P$RET(0)
      RETURN
  897 CONTINUE
      SG1SIZ = 8
      SG2SIZ = 15
      GOTO 898
      END

      SUBROUTINE P903
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 904
99998 CALL P$UJC
  905 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2332
      CALL P$LDO(3,33)
      CALL P$FJP($906)
      LINENO = 2333
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(30))
      CALL P$EQU(1,1)
      CALL P$FJP($907)
      LINENO = 2334
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26418)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6197)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 2335
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 2336
      CALL P$LOD(1,20)
      CALL P$LAO(6321)
      CALL P$LOD(0,6)
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(2))
      CALL P$MPI
      CALL P$ADI
      CALL P$STR(1,20)
      LINENO = 2337
      CALL P$LOD(1,20)
      CALL P$LOD(1,19)
      CALL P$GRT(1,1)
      CALL P$FJP($908)
      CALL P$LOD(1,20)
      CALL P$STR(1,19)
  908 CONTINUE
      GOTO 909
  907 CONTINUE
      LINENO = 2339
      LINENO = 2340
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26419)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LOD(0,5)
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2341
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(45))
      CALL P$EQU(1,1)
      CALL P$FJP($910)
      LINENO = 2342
      CALL P$LAO(11)
      CALL P$LCA(26420)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(26422)
      CALL P$LDC(1,INTL(8))
      CALL P$LDC(1,INTL(8))
      CALL P$WRS
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 911
  910 CONTINUE
      LINENO = 2343
      CALL P$LAO(11)
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      SP=SP-1
  911 CONTINUE
      LINENO = 2344
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 2345
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 2346
      CALL P$MST(1)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P884
  909 CONTINUE
  906 CONTINUE
      CALL P$RET(0)
      RETURN
  904 CONTINUE
      SG1SIZ = 10
      SG2SIZ = 17
      GOTO 905
      END

      SUBROUTINE P912
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 913
99998 CALL P$UJC
  914 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2359
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($915)
      LINENO = 2360
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 2361
      CALL P$LODA(0,6)
      CALL P$IND(1,3)
      GOTO 916
  918 CONTINUE
      LINENO = 2363
      CALL P$LODA(0,5)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($919)
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(177))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 920
  919 CONTINUE
      LINENO = 2364
      CALL P$LODA(0,5)
      CALL P$LDO(0,48)
      CALL P$EQU(0,1)
      CALL P$FJP($921)
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(179))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 922
  921 CONTINUE
      LINENO = 2365
      CALL P$LODA(0,5)
      CALL P$LDO(0,47)
      CALL P$EQU(0,1)
      CALL P$FJP($923)
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(182))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 924
  923 CONTINUE
      LINENO = 2366
      CALL P$LODA(0,6)
      CALL P$IND(1,4)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($925)
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(177))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 926
  925 CONTINUE
      LINENO = 2367
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(178))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
  926 CONTINUE
  924 CONTINUE
  922 CONTINUE
  920 CONTINUE
      GOTO 917
  927 CONTINUE
      LINENO = 2368
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$IND(0,4)
      CALL P$CUP(1)
      CALL P912
      GOTO 917
  928 CONTINUE
      LINENO = 2369
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(176))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 917
  929 CONTINUE
      LINENO = 2370
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(180))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 917
  930 CONTINUE
      LINENO = 2372
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(181))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 917
  931 CONTINUE
      LINENO = 2375
      CALL P$MST(3)
      CALL P$LDC(1,INTL(352))
      CALL P$CUP(1)
      CALL P30
      GOTO 917
  916 CONTINUE
      CALL P$CHK(INTL(0),INTL(8))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($932)
  932 CONTINUE
  933 GOTO 918
  934 GOTO 927
  935 GOTO 928
  936 GOTO 929
  937 GOTO 930
  938 GOTO 930
  939 GOTO 931
  940 GOTO 931
  941 GOTO 931
  917 CONTINUE
  915 CONTINUE
      CALL P$RET(0)
      RETURN
  913 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 29
      GOTO 914
      END

      SUBROUTINE P942
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 943
99998 CALL P$UJC
  944 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2384
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($945)
      LINENO = 2385
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($946)
      LINENO = 2386
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(211))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 947
  946 CONTINUE
      LINENO = 2387
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($948)
      LINENO = 2388
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(193))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
  948 CONTINUE
  947 CONTINUE
  945 CONTINUE
      CALL P$RET(0)
      RETURN
  943 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 13
      GOTO 944
      END

      SUBROUTINE P949
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 950
99998 CALL P$UJC
  951 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2396
      CALL P$LDO(3,33)
      CALL P$FJP($952)
      LINENO = 2397
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26424)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LOD(0,5)
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2398
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P912
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 2399
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$MST(1)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P884
  952 CONTINUE
      CALL P$RET(0)
      RETURN
  950 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 15
      GOTO 951
      END

      SUBROUTINE P953
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 954
99998 CALL P$UJC
  955 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2412
      CALL P$LDO(3,33)
      CALL P$FJP($956)
      LINENO = 2413
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26425)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LOD(0,5)
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2414
      CALL P$MST(1)
      CALL P$LODA(0,7)
      CALL P$CUP(1)
      CALL P912
      LINENO = 2415
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(31))
      CALL P$NEQ(1,1)
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(34))
      CALL P$NEQ(1,1)
      CALL P$AND
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(51))
      CALL P$NEQ(1,1)
      CALL P$AND
      CALL P$FJP($957)
      LINENO = 2416
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      GOTO 958
  957 CONTINUE
      LINENO = 2418
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LCA(26426)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(26428)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      CALL P$WLN
  958 CONTINUE
      LINENO = 2419
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$MST(1)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P884
  956 CONTINUE
      CALL P$RET(0)
      RETURN
  954 CONTINUE
      SG1SIZ = 8
      SG2SIZ = 17
      GOTO 955
      END

      SUBROUTINE P959
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 960
99998 CALL P$UJC
  961 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2428
      CALL P$LDO(3,33)
      CALL P$FJP($962)
      LINENO = 2429
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26429)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LOD(0,5)
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      SP=SP-1
      LINENO = 2430
      CALL P$MST(1)
      CALL P$LODA(0,8)
      CALL P$CUP(1)
      CALL P942
      LINENO = 2431
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(45))
      CALL P$EQU(1,1)
      CALL P$FJP($963)
      LINENO = 2432
      CALL P$LAO(11)
      CALL P$LCA(26430)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(26432)
      CALL P$LDC(1,INTL(7))
      CALL P$LDC(1,INTL(7))
      CALL P$WRS
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(26434)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      CALL P$WLN
      GOTO 964
  963 CONTINUE
      LINENO = 2434
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
  964 CONTINUE
      LINENO = 2435
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$MST(1)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P884
  962 CONTINUE
      CALL P$RET(0)
      RETURN
  960 CONTINUE
      SG1SIZ = 9
      SG2SIZ = 17
      GOTO 961
      END

      SUBROUTINE P965
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 966
99998 CALL P$UJC
  967 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2445
      CALL P$LDO(3,33)
      CALL P$FJP($968)
      LINENO = 2446
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26435)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      SP=SP-1
      LINENO = 2447
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($969)
      LINENO = 2449
      CALL P$MST(1)
      CALL P$LDO(0,45)
      CALL P$CUP(1)
      CALL P912
      LINENO = 2450
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2451
      CALL P$LAO(11)
      CALL P$LCA(26438)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      SP=SP-1
      LINENO = 2452
      CALL P$LODA(0,6)
      CALL P$IND(0,1)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,7)
      LINENO = 2453
      CALL P$LAO(11)
      CALL P$LODA(0,7)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(256))
      CALL P$MPI
      CALL P$LODA(0,7)
      CALL P$IND(1,2)
      CALL P$ADI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(26440)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      CALL P$WLN
      LINENO = 2454
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 2455
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26441)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      SP=SP-1
      LINENO = 2456
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CUP(1)
      CALL P912
      LINENO = 2457
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2458
      CALL P$LAO(11)
      CALL P$LCA(26444)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LDC(1,INTL(32367))
      CALL P$LODA(0,7)
      CALL P$IND(1,1)
      CALL P$ADI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2459
      CALL P$MST(1)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P888
      GOTO 970
  969 CONTINUE
      LINENO = 2462
      LINENO = 2463
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CUP(1)
      CALL P912
      LINENO = 2464
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2465
      CALL P$LODA(0,5)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($971)
      LINENO = 2466
      CALL P$LODA(0,6)
      CALL P$IND(0,1)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,7)
      LINENO = 2467
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,13026)
      CALL P$LDC(1,INTL(16))
      CALL P$STR(0,8)
  972 CONTINUE
      CALL P$LDO(1,13026)
      CALL P$LOD(0,8)
      CALL P$LEQ(1)
      CALL P$FJP($973)
      LINENO = 2468
      CALL P$LAO(11)
      CALL P$LODA(0,7)
      CALL P$INC(0,INTL(1))
      CALL P$LDO(1,13026)
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$DEC(1,INTL(1))
      CALL P$LPC
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      CALL P$LDO(1,13026)
      CALL P$INC(1,INTL(1))
      CALL P$SRO(1,13026)
      GOTO 972
  973 CONTINUE
      GOTO 974
  971 CONTINUE
      LINENO = 2470
      CALL P$LAO(11)
      CALL P$LCA(26446)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LODA(0,6)
      CALL P$IND(1,1)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
  974 CONTINUE
  970 CONTINUE
      LINENO = 2472
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 2473
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(51))
      CALL P$CUP(1)
      CALL P884
  968 CONTINUE
      CALL P$RET(0)
      RETURN
  966 CONTINUE
      SG1SIZ = 9
      SG2SIZ = 37
      GOTO 967
      END

      SUBROUTINE P975
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 976
99998 CALL P$UJC
  977 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2484
      CALL P$LDO(3,33)
      CALL P$FJP($978)
      LINENO = 2485
      CALL P$MST(3)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDA(0,7)
      CALL P$LDA(0,6)
      CALL P$CUP(3)
      CALL P364
      LINENO = 2486
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26448)
      CALL P$LDC(1,INTL(13))
      CALL P$LDC(1,INTL(13))
      CALL P$WRS
      CALL P$LCA(26452)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$LDC(1,INTL(256))
      CALL P$MPI
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$ADI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(26454)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      CALL P$WLN
      LINENO = 2488
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
  978 CONTINUE
      CALL P$RET(0)
      RETURN
  976 CONTINUE
      SG1SIZ = 8
      SG2SIZ = 19
      GOTO 977
      END

      SUBROUTINE P979
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 980
99998 CALL P$UJC
  981 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2497
      LINENO = 2498
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($982)
      LINENO = 2499
      CALL P$LDO(1,228)
      GOTO 983
  985 CONTINUE
      LINENO = 2501
      CALL P$MST(1)
      CALL P$LDO(0,227)
      CALL P$LAO(229)
      CALL P$CUP(2)
      CALL P965
      GOTO 984
  986 CONTINUE
      LINENO = 2503
      LINENO = 2504
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($987)
      LINENO = 2505
      CALL P$MST(1)
      CALL P$LDO(0,227)
      CALL P$CUP(1)
      CALL P975
      LINENO = 2506
      CALL P$MST(1)
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(1)
      CALL P888
  987 CONTINUE
      LINENO = 2507
      CALL P$LDO(1,229)
      GOTO 988
  990 CONTINUE
      LINENO = 2509
      CALL P$LDO(1,230)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$FJP($991)
      LINENO = 2510
      CALL P$MST(1)
      CALL P$LDC(1,INTL(39))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,231)
      CALL P$LDO(0,227)
      CALL P$CUP(3)
      CALL P953
      GOTO 992
  991 CONTINUE
      LINENO = 2512
      CALL P$MST(1)
      CALL P$LDC(1,INTL(54))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LDO(1,230)
      CALL P$SBI
      CALL P$LDO(1,231)
      CALL P$LDO(0,227)
      CALL P$CUP(4)
      CALL P959
  992 CONTINUE
      GOTO 989
  993 CONTINUE
      LINENO = 2513
      CALL P$MST(1)
      CALL P$LDC(1,INTL(35))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,230)
      CALL P$LDO(0,227)
      CALL P$CUP(3)
      CALL P953
      GOTO 989
  994 CONTINUE
      LINENO = 2514
      CALL P$MST(1)
      CALL P$LDC(1,INTL(61))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 989
  988 CONTINUE
      CALL P$CHK(INTL(0),INTL(2))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($995)
  995 CONTINUE
  996 GOTO 990
  997 GOTO 993
  998 GOTO 994
  989 CONTINUE
      GOTO 984
  999 CONTINUE
      GOTO 984
  983 CONTINUE
      CALL P$CHK(INTL(0),INTL(2))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($1000)
 1000 CONTINUE
 1001 GOTO 985
 1002 GOTO 986
 1003 GOTO 999
  984 CONTINUE
      LINENO = 2519
      CALL P$LDC(1,INTL(2))
      CALL P$SRO(1,228)
  982 CONTINUE
      CALL P$RET(0)
      RETURN
  980 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 41
      GOTO 981
      END

      SUBROUTINE P1004
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1005
99998 CALL P$UJC
 1006 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2528
      CALL P$LODA(0,5)
      CALL P$STRA(0,6)
      LINENO = 2529
      CALL P$LODA(0,6)
      CALL P$IND(0,0)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1007)
      LINENO = 2530
      LINENO = 2531
      CALL P$LODA(0,6)
      CALL P$IND(0,0)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($1008)
      LINENO = 2532
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$IND(0,0)
      CALL P$CUP(1)
      CALL P975
      LINENO = 2533
      CALL P$MST(1)
      CALL P$LDC(1,INTL(7))
      CALL P$NGI
      CALL P$CUP(1)
      CALL P888
 1008 CONTINUE
      LINENO = 2534
      CALL P$LODA(0,6)
      CALL P$IND(1,2)
      GOTO 1009
 1011 CONTINUE
      LINENO = 2535
      CALL P$LODA(0,6)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$FJP($1012)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(43))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,6)
      CALL P$IND(1,4)
      CALL P$LODA(0,6)
      CALL P$IND(0,0)
      CALL P$CUP(3)
      CALL P953
      GOTO 1013
 1012 CONTINUE
      LINENO = 2536
      CALL P$MST(1)
      CALL P$LDC(1,INTL(56))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LODA(0,6)
      CALL P$IND(1,3)
      CALL P$SBI
      CALL P$LODA(0,6)
      CALL P$IND(1,4)
      CALL P$LODA(0,6)
      CALL P$IND(0,0)
      CALL P$CUP(4)
      CALL P959
 1013 CONTINUE
      GOTO 1010
 1014 CONTINUE
      LINENO = 2537
      CALL P$LODA(0,6)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($1015)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(353))
      CALL P$CUP(1)
      CALL P30
      GOTO 1016
 1015 CONTINUE
      LINENO = 2538
      CALL P$MST(1)
      CALL P$LDC(1,INTL(26))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,6)
      CALL P$IND(0,0)
      CALL P$CUP(2)
      CALL P949
 1016 CONTINUE
      GOTO 1010
 1017 CONTINUE
      LINENO = 2539
      CALL P$MST(1)
      CALL P$LDC(1,INTL(62))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1010
 1009 CONTINUE
      CALL P$CHK(INTL(0),INTL(2))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($1018)
 1018 CONTINUE
 1019 GOTO 1011
 1020 GOTO 1014
 1021 GOTO 1017
 1010 CONTINUE
 1007 CONTINUE
      CALL P$RET(0)
      RETURN
 1005 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 35
      GOTO 1006
      END

      SUBROUTINE P1022
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1023
99998 CALL P$UJC
 1024 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2546
      LINENO = 2547
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1025)
      LINENO = 2548
      LINENO = 2549
      CALL P$LDO(1,228)
      GOTO 1026
 1028 CONTINUE
      LINENO = 2550
      CALL P$MST(2)
      CALL P$LDO(0,227)
      CALL P$CUP(1)
      CALL P496
      CALL P$FJP($1029)
      LINENO = 2551
      CALL P$LDO(0,230)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,5)
      LINENO = 2552
      CALL P$MST(1)
      CALL P$LDC(1,INTL(38))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,5)
      CALL P$IND(1,2)
      CALL P$LDC(1,INTL(4))
      CALL P$DVI
      CALL P$LDC(1,INTL(26223))
      CALL P$ADI
      CALL P$CUP(2)
      CALL P896
      GOTO 1030
 1029 CONTINUE
      LINENO = 2553
      CALL P$MST(3)
      CALL P$LDC(1,INTL(356))
      CALL P$CUP(1)
      CALL P30
 1030 CONTINUE
      GOTO 1027
 1031 CONTINUE
      LINENO = 2554
      LINENO = 2555
      CALL P$LDO(1,229)
      GOTO 1032
 1034 CONTINUE
      LINENO = 2556
      CALL P$LDO(1,230)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$FJP($1035)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(37))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,231)
      CALL P$CUP(2)
      CALL P896
      GOTO 1036
 1035 CONTINUE
      LINENO = 2557
      CALL P$MST(1)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LDO(1,230)
      CALL P$SBI
      CALL P$LDO(1,231)
      CALL P$CUP(3)
      CALL P903
 1036 CONTINUE
      GOTO 1033
 1037 CONTINUE
      LINENO = 2558
      CALL P$LDO(1,230)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($1038)
      LINENO = 2559
      CALL P$MST(1)
      CALL P$LDC(1,INTL(34))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,230)
      CALL P$LDO(0,49)
      CALL P$CUP(3)
      CALL P953
 1038 CONTINUE
      GOTO 1033
 1039 CONTINUE
      LINENO = 2560
      CALL P$MST(3)
      CALL P$LDC(1,INTL(354))
      CALL P$CUP(1)
      CALL P30
      GOTO 1033
 1032 CONTINUE
      CALL P$CHK(INTL(0),INTL(2))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($1040)
 1040 CONTINUE
 1041 GOTO 1034
 1042 GOTO 1037
 1043 GOTO 1039
 1033 CONTINUE
      GOTO 1027
 1044 CONTINUE
      LINENO = 2563
      CALL P$MST(3)
      CALL P$LDC(1,INTL(355))
      CALL P$CUP(1)
      CALL P30
      GOTO 1027
 1026 CONTINUE
      CALL P$CHK(INTL(0),INTL(2))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($1045)
 1045 CONTINUE
 1046 GOTO 1028
 1047 GOTO 1031
 1048 GOTO 1044
 1027 CONTINUE
      LINENO = 2565
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,228)
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,229)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,230)
 1025 CONTINUE
      CALL P$RET(0)
      RETURN
 1023 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 35
      GOTO 1024
      END

      SUBROUTINE P1049
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1050
99998 CALL P$UJC
 1051 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2571
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P979
      LINENO = 2572
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1052)
      LINENO = 2573
      CALL P$LDO(0,227)
      CALL P$LDO(0,48)
      CALL P$NEQ(0,1)
      CALL P$FJP($1053)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(144))
      CALL P$CUP(1)
      CALL P30
 1053 CONTINUE
 1052 CONTINUE
      LINENO = 2574
      CALL P$LDO(3,33)
      CALL P$FJP($1054)
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26455)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(33))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LCA(26456)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
 1054 CONTINUE
      LINENO = 2575
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(33))
      CALL P$CUP(1)
      CALL P884
      CALL P$RET(0)
      RETURN
 1050 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 15
      GOTO 1051
      END

      SUBROUTINE P1055
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1056
99998 CALL P$UJC
 1057 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2580
      CALL P$LDO(3,33)
      CALL P$FJP($1058)
      LINENO = 2581
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(57))
      CALL P$EQU(1,1)
      CALL P$FJP($1059)
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26457)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      GOTO 1060
 1059 CONTINUE
      LINENO = 2582
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26459)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LOD(0,5)
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LCA(26460)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
 1060 CONTINUE
 1058 CONTINUE
      LINENO = 2583
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$MST(1)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P884
      CALL P$RET(0)
      RETURN
 1056 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 13
      GOTO 1057
      END

      SUBROUTINE P1061
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1062
99998 CALL P$UJC
 1063 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2595
      CALL P$LDO(3,33)
      CALL P$FJP($1064)
      LINENO = 2596
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26461)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LOD(0,5)
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 2597
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26462)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
 1064 CONTINUE
      LINENO = 2598
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(2))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$MST(1)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P884
      CALL P$RET(0)
      RETURN
 1062 CONTINUE
      SG1SIZ = 8
      SG2SIZ = 13
      GOTO 1063
      END

      SUBROUTINE P1065
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1066
99998 CALL P$UJC
 1067 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      CALL P$LDA(0,9)
      CALL P$LODA(0,7)
      CALL P$MOV(2)
      LINENO = 2612
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,13)
      LINENO = 2613
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,11)
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,12)
      LINENO = 2614
      CALL P$LDA(0,9)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(1),INTL(8))
      CALL P$DEC(1,INTL(1))
      CALL P$LDC(6,INTL(160))
      CALL P$SPC
      LINENO = 2615
      CALL P$LDA(0,9)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(1),INTL(8))
      CALL P$DEC(1,INTL(1))
      CALL P$LDC(6,INTL(160))
      CALL P$SPC
      LINENO = 2616
      CALL P$LDO(3,33)
      CALL P$FJP($1068)
      LINENO = 2617
      LINENO = 2619
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26464)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LOD(0,5)
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 2621
      CALL P$MST(1)
      CALL P$LDC(1,INTL(32))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(4))
      CALL P$ADI
      CALL P$CUP(3)
      CALL P903
      LINENO = 2623
      CALL P$MST(1)
      CALL P$LDC(1,INTL(32))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(0))
      CALL P$CUP(3)
      CALL P903
      LINENO = 2626
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1069)
      LINENO = 2627
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26465)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      SP=SP-1
      GOTO 1070
 1069 CONTINUE
      LINENO = 2629
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($1071)
      LINENO = 2630
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26467)
      CALL P$LDC(1,INTL(12))
      CALL P$LDC(1,INTL(12))
      CALL P$WRS
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(4))
      CALL P$ADI
      CALL P$LDC(1,INTL(10))
      CALL P$WRI
      CALL P$LCA(26470)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      SP=SP-1
      GOTO 1072
 1071 CONTINUE
      LINENO = 2632
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26471)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(4))
      CALL P$ADI
      CALL P$LDC(1,INTL(10))
      CALL P$WRI
      CALL P$LCA(26474)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      SP=SP-1
 1072 CONTINUE
 1070 CONTINUE
      LINENO = 2633
      CALL P$LAO(11)
      CALL P$LDA(0,9)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(8))
      CALL P$WRS
      SP=SP-1
      LINENO = 2634
 1073 CONTINUE
      LINENO = 2634
      CALL P$LOD(0,11)
      CALL P$LOD(0,6)
      CALL P$LEQ(1,1)
      CALL P$FJP($1074)
      LINENO = 2635
      LINENO = 2636
      CALL P$LOD(0,12)
      CALL P$FJP($1075)
      LINENO = 2637
      LINENO = 2638
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,12)
      LINENO = 2639
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 1076
 1075 CONTINUE
      LINENO = 2642
      CALL P$LAO(11)
      CALL P$LCA(26475)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      SP=SP-1
 1076 CONTINUE
      LINENO = 2643
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,7)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1077)
      LINENO = 2644
      CALL P$LAO(11)
      CALL P$LCA(26476)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LOD(0,6)
      CALL P$LOD(0,11)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      GOTO 1078
 1077 CONTINUE
      LINENO = 2646
      CALL P$LAO(11)
      CALL P$LCA(26479)
      CALL P$LDC(1,INTL(15))
      CALL P$LDC(1,INTL(15))
      CALL P$WRS
      CALL P$LOD(0,6)
      CALL P$LOD(0,11)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(26483)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      SP=SP-1
 1078 CONTINUE
      LINENO = 2647
      CALL P$LOD(0,11)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,11)
      LINENO = 2648
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,13)
      GOTO 1073
 1074 CONTINUE
      LINENO = 2650
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 2651
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1079)
      LINENO = 2652
      CALL P$MST(1)
      CALL P$LDC(1,INTL(42))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$CUP(2)
      CALL P896
      GOTO 1080
 1079 CONTINUE
      LINENO = 2654
      CALL P$MST(1)
      CALL P$LDC(1,INTL(42))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$CUP(2)
      CALL P896
 1080 CONTINUE
      LINENO = 2655
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(3))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 2656
      CALL P$MST(1)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P884
      CALL P$MST(1)
      CALL P$LDC(1,INTL(42))
      CALL P$CUP(1)
      CALL P884
 1068 CONTINUE
      CALL P$RET(0)
      RETURN
 1066 CONTINUE
      SG1SIZ = 14
      SG2SIZ = 45
      GOTO 1067
      END

      SUBROUTINE P1081
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1082
99998 CALL P$UJC
 1083 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2666
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1084)
      LINENO = 2667
      CALL P$LODA(0,5)
      CALL P$LDO(0,45)
      CALL P$NEQ(0,1)
      CALL P$FJP($1085)
      LINENO = 2668
      CALL P$LODA(0,5)
      CALL P$LDO(0,46)
      CALL P$NEQ(0,1)
      CALL P$FJP($1086)
      LINENO = 2669
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$FJP($1087)
      LINENO = 2670
      LINENO = 2671
      CALL P$MST(3)
      CALL P$LODA(0,5)
      CALL P$LDA(0,7)
      CALL P$LDA(0,6)
      CALL P$CUP(3)
      CALL P364
      LINENO = 2672
      CALL P$MST(1)
      CALL P$LDC(1,INTL(45))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,7)
      CALL P$LOD(0,6)
      CALL P$LODA(0,5)
      CALL P$CUP(4)
      CALL P959
 1087 CONTINUE
 1086 CONTINUE
 1085 CONTINUE
 1084 CONTINUE
      CALL P$RET(0)
      RETURN
 1082 CONTINUE
      SG1SIZ = 8
      SG2SIZ = 19
      GOTO 1083
      END

      SUBROUTINE P1088
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1089
99998 CALL P$UJC
 1090 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2682
      CALL P$LDO(3,37)
      CALL P$FJP($1091)
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,0)
      GOTO 1092
 1091 CONTINUE
      LINENO = 2683
      CALL P$LDO(3,36)
      CALL P$NOT
      CALL P$FJP($1093)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,0)
      GOTO 1094
 1093 CONTINUE
      LINENO = 2684
      CALL P$LODA(0,5)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($1095)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,0)
      GOTO 1096
 1095 CONTINUE
      LINENO = 2685
      LINENO = 2686
      CALL P$MST(3)
      CALL P$LODA(0,5)
      CALL P$LDA(0,10)
      CALL P$LDA(0,8)
      CALL P$CUP(3)
      CALL P364
      LINENO = 2687
      CALL P$MST(3)
      CALL P$LODA(0,6)
      CALL P$LDA(0,9)
      CALL P$LDA(0,7)
      CALL P$CUP(3)
      CALL P364
      LINENO = 2688
      CALL P$LOD(0,9)
      CALL P$LOD(0,10)
      CALL P$LES(1,1)
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$GRT(1,1)
      CALL P$IOR
      CALL P$STR(0,0)
 1096 CONTINUE
 1094 CONTINUE
 1092 CONTINUE
      CALL P$RET(1)
      RETURN
 1089 CONTINUE
      SG1SIZ = 11
      SG2SIZ = 23
      GOTO 1090
      END

      SUBROUTINE P1097
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1098
99998 CALL P$UJC
 1099 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2695
      CALL P$LDO(3,33)
      CALL P$FJP($1100)
      LINENO = 2696
      CALL P$LAO(11)
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(5))
      CALL P$WRI
      CALL P$LCA(26484)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$WLN
      LINENO = 2697
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 1100 CONTINUE
      CALL P$RET(0)
      RETURN
 1098 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 13
      GOTO 1099
      END

      SUBROUTINE P1104
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1105
99998 CALL P$UJC
 1106 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2713
      CALL P$LODA(0,5)
      CALL P$IND(0,0)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 2714
      CALL P$LODA(0,6)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($1107)
      LINENO = 2715
      CALL P$LODA(0,5)
      CALL P$LODA(0,6)
      CALL P$IND(0,4)
      CALL P$STO(0)
 1107 CONTINUE
      CALL P$RET(0)
      RETURN
 1105 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 9
      GOTO 1106
      END

      SUBROUTINE P1108
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1109
99998 CALL P$UJC
 1110 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2723
      CALL P$LODA(0,5)
      CALL P$IND(0,0)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(15))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$FJP($1111)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,0)
      GOTO 1112
 1111 CONTINUE
      LINENO = 2725
      LINENO = 2726
      CALL P$LODA(0,5)
      CALL P$IND(0,0)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1113)
      LINENO = 2727
 1114 CONTINUE
      LINENO = 2727
      CALL P$LODA(0,5)
      CALL P$IND(0,0)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1115)
      LINENO = 2728
      CALL P$LODA(0,5)
      CALL P$LODA(0,5)
      CALL P$IND(0,0)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STO(0)
      GOTO 1114
 1115 CONTINUE
 1113 CONTINUE
      LINENO = 2729
      CALL P$LODA(0,5)
      CALL P$IND(0,0)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$STR(0,0)
 1112 CONTINUE
      CALL P$RET(1)
      RETURN
 1109 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 11
      GOTO 1110
      END

      SUBROUTINE P1116
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1117
99998 CALL P$UJC
 1118 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2746
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,24)
      LINENO = 2747
      CALL P$LODA(0,24)
      CALL P$IND(0,4)
      CALL P$SRO(0,227)
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,228)
      LINENO = 2748
      CALL P$LODA(0,24)
      CALL P$IND(1,6)
      GOTO 1119
 1121 CONTINUE
      LINENO = 2750
      CALL P$LODA(0,24)
      CALL P$IND(1,7)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1122)
      LINENO = 2751
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,229)
      CALL P$LODA(0,24)
      CALL P$IND(1,8)
      CALL P$SRO(1,230)
      LINENO = 2752
      CALL P$LODA(0,24)
      CALL P$IND(1,8)
      CALL P$STR(1,15)
      CALL P$LODA(0,24)
      CALL P$IND(1,9)
      CALL P$SRO(1,231)
      GOTO 1123
 1122 CONTINUE
      LINENO = 2755
      CALL P$MST(2)
      CALL P$LDC(1,INTL(54))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LODA(0,24)
      CALL P$IND(1,8)
      CALL P$SBI
      CALL P$LODA(0,24)
      CALL P$IND(1,9)
      CALL P$LDO(0,49)
      CALL P$CUP(4)
      CALL P959
      LINENO = 2756
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,229)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,230)
 1123 CONTINUE
      GOTO 1120
 1124 CONTINUE
      LINENO = 2759
      CALL P$LAO(65)
      CALL P$LDO(1,63)
      CALL P$IXA(6)
      CALL P$STRA(0,25)
      LINENO = 2760
      CALL P$LODA(0,25)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($1125)
      LINENO = 2761
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,229)
      CALL P$LODA(0,25)
      CALL P$IND(1,4)
      CALL P$SRO(1,230)
      LINENO = 2762
      CALL P$LODA(0,25)
      CALL P$IND(1,5)
      CALL P$LODA(0,24)
      CALL P$IND(1,7)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,231)
      GOTO 1126
 1125 CONTINUE
      LINENO = 2765
      LINENO = 2766
      CALL P$LDO(1,62)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($1127)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(39))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,25)
      CALL P$IND(1,4)
      CALL P$LDO(0,49)
      CALL P$CUP(3)
      CALL P953
      GOTO 1128
 1127 CONTINUE
      LINENO = 2767
      CALL P$MST(2)
      CALL P$LDC(1,INTL(54))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$LODA(0,25)
      CALL P$IND(1,4)
      CALL P$LDO(0,49)
      CALL P$CUP(4)
      CALL P959
 1128 CONTINUE
      LINENO = 2768
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,229)
      CALL P$LODA(0,24)
      CALL P$IND(1,7)
      CALL P$SRO(1,230)
 1126 CONTINUE
      GOTO 1120
 1129 CONTINUE
      LINENO = 2771
      CALL P$LODA(0,24)
      CALL P$IND(1,7)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1130)
      LINENO = 2772
      CALL P$MST(4)
      CALL P$LDC(1,INTL(150))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
      GOTO 1131
 1130 CONTINUE
      LINENO = 2774
      LINENO = 2775
      CALL P$LODA(0,24)
      CALL P$IND(1,10)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($1132)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(151))
      CALL P$CUP(1)
      CALL P30
      GOTO 1133
 1132 CONTINUE
      LINENO = 2777
      CALL P$LODA(0,24)
      CALL P$IND(1,8)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDO(1,62)
      CALL P$NEQ(1,1)
      CALL P$LODA(3,14)
      CALL P$LODA(0,13)
      CALL P$NEQ(0,1)
      CALL P$IOR
      CALL P$FJP($1134)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(177))
      CALL P$CUP(1)
      CALL P30
 1134 CONTINUE
 1133 CONTINUE
      LINENO = 2778
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,229)
      CALL P$LODA(0,24)
      CALL P$IND(1,8)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$SRO(1,230)
      LINENO = 2779
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,231)
 1131 CONTINUE
      GOTO 1120
 1119 CONTINUE
      CALL P$CHK(INTL(2),INTL(5))
      CALL P$LDC(1,INTL(2))
      CALL P$SBI
      CALL P$XJP($1135)
 1135 CONTINUE
 1136 GOTO 1121
 1137 GOTO 1124
 1138 GOTO 99998
 1139 GOTO 1129
 1120 CONTINUE
      LINENO = 2784
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,240)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1140)
      LINENO = 2785
      CALL P$MST(4)
      CALL P$LDC(1,INTL(59))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,240)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
 1140 CONTINUE
      LINENO = 2786
      CALL P$LOD(1,17)
      CALL P$NOT
      CALL P$FJP($1141)
      LINENO = 2787
      CALL P$LDO(0,227)
      CALL P$STRA(0,20)
      CALL P$LDC(3,INTL(1))
      CALL P$STR(1,17)
      LINENO = 2788
      CALL P$MST(1)
      CALL P$LDA(0,20)
      CALL P$CUP(1)
      CALL P1108
      CALL P$NOT
      CALL P$FJP($1142)
      LINENO = 2789
      CALL P$LOD(1,16)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32451))
      CALL P$INN
      CALL P$FJP($1143)
      LINENO = 2790
      CALL P$LDO(3,42)
      CALL P$NOT
      CALL P$FJP($1144)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(176))
      CALL P$CUP(1)
      CALL P30
 1144 CONTINUE
      LINENO = 2791
      CALL P$MST(2)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(3)
      CALL P903
      GOTO 1145
 1143 CONTINUE
      LINENO = 2793
      LINENO = 2794
      CALL P$LDO(3,43)
      CALL P$NOT
      CALL P$FJP($1146)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(175))
      CALL P$CUP(1)
      CALL P30
 1146 CONTINUE
      LINENO = 2795
      CALL P$MST(2)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(3)
      CALL P903
 1145 CONTINUE
      GOTO 1147
 1142 CONTINUE
      LINENO = 2798
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$NEQ(1,1)
      CALL P$FJP($1148)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P1022
 1148 CONTINUE
 1147 CONTINUE
 1141 CONTINUE
      LINENO = 2801
 1149 CONTINUE
      LINENO = 2801
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,240)
      CALL P$INN
      CALL P$FJP($1150)
      LINENO = 2802
      LINENO = 2803
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(10))
      CALL P$EQU(1,1)
      CALL P$FJP($1151)
      LINENO = 2804
      LINENO = 2805
 1152 CONTINUE
      CALL P$LDA(0,14)
      CALL P$LAO(227)
      CALL P$MOV(5)
      LINENO = 2806
      LINENO = 2807
      CALL P$LODA(0,14)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1153)
      LINENO = 2808
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$NEQ(1,1)
      CALL P$FJP($1154)
      LINENO = 2809
      CALL P$MST(4)
      CALL P$LDC(1,INTL(138))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,14)
 1154 CONTINUE
 1153 CONTINUE
      LINENO = 2810
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P1022
      LINENO = 2811
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32452))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 2812
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      LINENO = 2813
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1155)
      LINENO = 2814
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$GRT(1,1)
      CALL P$FJP($1156)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(113))
      CALL P$CUP(1)
      CALL P30
 1156 CONTINUE
 1155 CONTINUE
      LINENO = 2815
      CALL P$LODA(0,14)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1157)
      LINENO = 2816
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,24)
      LINENO = 2817
      LINENO = 2818
      CALL P$MST(3)
      CALL P$LODA(0,24)
      CALL P$IND(0,4)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1158)
      LINENO = 2819
      LINENO = 2820
      CALL P$LODA(0,24)
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1159)
      LINENO = 2821
      CALL P$MST(4)
      CALL P$LODA(0,24)
      CALL P$IND(0,4)
      CALL P$LDA(0,22)
      CALL P$LDA(0,21)
      CALL P$CUP(3)
      CALL P364
      LINENO = 2822
      CALL P$MST(2)
      CALL P$LODA(0,24)
      CALL P$IND(0,4)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P1088
      CALL P$FJP($1160)
      LINENO = 2823
      CALL P$MST(2)
      CALL P$LDC(1,INTL(45))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,22)
      CALL P$LOD(0,21)
      CALL P$LDO(0,45)
      CALL P$CUP(4)
      CALL P959
 1160 CONTINUE
      LINENO = 2824
      CALL P$LOD(0,22)
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$FJP($1161)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(31))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,22)
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
      GOTO 1162
 1161 CONTINUE
      LINENO = 2825
      CALL P$LOD(0,22)
      CALL P$LDC(1,INTL(0))
      CALL P$LES(1,1)
      CALL P$FJP($1163)
      LINENO = 2826
      CALL P$MST(2)
      CALL P$LDC(1,INTL(34))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,22)
      CALL P$NGI
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
 1163 CONTINUE
 1162 CONTINUE
 1159 CONTINUE
      GOTO 1164
 1158 CONTINUE
      LINENO = 2830
      CALL P$MST(4)
      CALL P$LDC(1,INTL(139))
      CALL P$CUP(1)
      CALL P30
 1164 CONTINUE
      LINENO = 2831
      LINENO = 2832
      CALL P$LODA(0,24)
      CALL P$IND(0,5)
      CALL P$SRO(0,227)
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,228)
      LINENO = 2833
      CALL P$LODA(0,24)
      CALL P$IND(0,5)
      CALL P$LDO(0,47)
      CALL P$EQU(0,1)
      CALL P$LODA(0,24)
      CALL P$IND(3,1)
      CALL P$AND
      CALL P$FJP($1165)
      LINENO = 2834
      CALL P$LDC(1,INTL(2))
      CALL P$SRO(1,229)
      GOTO 1166
 1165 CONTINUE
      LINENO = 2836
      LINENO = 2837
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,229)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,230)
 1166 CONTINUE
      LINENO = 2840
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LDO(1,229)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$FJP($1167)
      LINENO = 2841
      LINENO = 2842
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STR(0,23)
      LINENO = 2843
      CALL P$MST(4)
      CALL P$LDO(0,227)
      CALL P$LDA(0,23)
      CALL P$CUP(2)
      CALL P409
      LINENO = 2844
      CALL P$MST(2)
      CALL P$LDC(1,INTL(36))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,23)
      CALL P$CUP(2)
      CALL P896
 1167 CONTINUE
 1157 CONTINUE
      LINENO = 2847
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$FJP($1152)
      LINENO = 2848
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(11))
      CALL P$EQU(1,1)
      CALL P$FJP($1168)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1169
 1168 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(12))
      CALL P$CUP(1)
      CALL P30
 1169 CONTINUE
      GOTO 1170
 1151 CONTINUE
      LINENO = 2851
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(14))
      CALL P$EQU(1,1)
      CALL P$FJP($1171)
      LINENO = 2852
      LINENO = 2853
      LINENO = 2854
      LINENO = 2855
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1172)
      LINENO = 2856
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(5))
      CALL P$NEQ(1,1)
      CALL P$FJP($1173)
      LINENO = 2857
      CALL P$MST(4)
      CALL P$LDC(1,INTL(140))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1173 CONTINUE
 1172 CONTINUE
      LINENO = 2858
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      LINENO = 2859
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1174)
      LINENO = 2860
      LINENO = 2861
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1175)
      LINENO = 2862
      CALL P$MST(4)
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDA(0,19)
      CALL P$CUP(2)
      CALL P326
      LINENO = 2863
      CALL P$LODA(0,19)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($1176)
      LINENO = 2864
      CALL P$MST(4)
      CALL P$LDC(1,INTL(152))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
      GOTO 1177
 1176 CONTINUE
      LINENO = 2866
      CALL P$LODA(0,19)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,24)
      LINENO = 2867
      CALL P$LODA(0,24)
      CALL P$IND(0,4)
      CALL P$SRO(0,227)
      LINENO = 2868
      CALL P$LDO(1,229)
      GOTO 1178
 1180 CONTINUE
      LINENO = 2869
      CALL P$LDO(1,231)
      CALL P$LODA(0,24)
      CALL P$IND(1,7)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,231)
      GOTO 1179
 1181 CONTINUE
      LINENO = 2870
      CALL P$LDO(1,230)
      CALL P$LODA(0,24)
      CALL P$IND(1,7)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,230)
      GOTO 1179
 1182 CONTINUE
      LINENO = 2871
      CALL P$MST(4)
      CALL P$LDC(1,INTL(350))
      CALL P$CUP(1)
      CALL P30
      GOTO 1179
 1178 CONTINUE
      CALL P$CHK(INTL(0),INTL(2))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($1183)
 1183 CONTINUE
 1184 GOTO 1180
 1185 GOTO 1181
 1186 GOTO 1182
 1179 CONTINUE
 1177 CONTINUE
 1175 CONTINUE
      LINENO = 2875
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1187
 1174 CONTINUE
      LINENO = 2877
      CALL P$MST(4)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
 1187 CONTINUE
      GOTO 1188
 1171 CONTINUE
      LINENO = 2881
      LINENO = 2882
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1189)
      LINENO = 2883
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,24)
      LINENO = 2884
      CALL P$LODA(0,24)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($1190)
      LINENO = 2885
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      CALL P$LODA(0,24)
      CALL P$IND(0,4)
      CALL P$SRO(0,227)
      LINENO = 2886
      CALL P$LDO(3,38)
      CALL P$FJP($1191)
      LINENO = 2887
      CALL P$MST(2)
      CALL P$LDC(1,INTL(45))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(1,INTL(32767))
      CALL P$LDO(0,49)
      CALL P$CUP(4)
      CALL P959
 1191 CONTINUE
      LINENO = 2888
      LINENO = 2889
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,228)
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,229)
      LINENO = 2890
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,230)
      GOTO 1192
 1190 CONTINUE
      LINENO = 2894
      CALL P$LODA(0,24)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$FJP($1193)
      LINENO = 2895
      CALL P$LODA(0,24)
      CALL P$IND(0,4)
      CALL P$SRO(0,227)
      LINENO = 2896
      CALL P$LDO(1,231)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,231)
      GOTO 1194
 1193 CONTINUE
      LINENO = 2898
      CALL P$MST(4)
      CALL P$LDC(1,INTL(141))
      CALL P$CUP(1)
      CALL P30
 1194 CONTINUE
 1192 CONTINUE
 1189 CONTINUE
      LINENO = 2899
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
 1188 CONTINUE
 1170 CONTINUE
      LINENO = 2901
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,240)
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1195)
      LINENO = 2902
      CALL P$MST(4)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,240)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
 1195 CONTINUE
      GOTO 1149
 1150 CONTINUE
      CALL P$RET(0)
      RETURN
 1117 CONTINUE
      SG1SIZ = 26
      SG2SIZ = 185
      GOTO 1118
      END

      SUBROUTINE P1197
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1198
99998 CALL P$UJC
 1199 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2910
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1200)
      LINENO = 2911
      CALL P$MST(5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32453))
      CALL P$LODA(0,13)
      CALL P$CUP(9)
      CALL P337
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      GOTO 1201
 1200 CONTINUE
      LINENO = 2912
      CALL P$MST(5)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$LODA(0,13)
      CALL P$LDO(0,53)
      CALL P$STO(0)
 1201 CONTINUE
      LINENO = 2913
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32454))
      CALL P$UNI
      CALL P$LODA(0,13)
      CALL P$IND(0,0)
      CALL P$CUP(9)
      CALL P1116
      CALL P$RET(0)
      RETURN
 1198 CONTINUE
      SG1SIZ = 14
      SG2SIZ = 57
      GOTO 1199
      END

      SUBROUTINE P1202
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1203
99998 CALL P$UJC
 1204 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2923
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,11)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(2,17)
      LINENO = 2924
      CALL P$LDC(1,INTL(2))
      CALL P$STR(0,8)
      CALL P$LDC(1,INTL(100))
      CALL P$STR(0,12)
 1205 CONTINUE
      CALL P$LOD(0,8)
      CALL P$LOD(0,12)
      CALL P$LEQ(1)
      CALL P$FJP($1206)
      CALL P$LAO(6360)
      CALL P$LOD(0,8)
      CALL P$CHK(INTL(1),INTL(101))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(6,INTL(160))
      CALL P$STO(6)
      CALL P$LOD(0,8)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,8)
      GOTO 1205
 1206 CONTINUE
      LINENO = 2925
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32455))
      CALL P$UNI
      CALL P$LDA(0,10)
      CALL P$CUP(9)
      CALL P1197
      CALL P$LODA(0,10)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,9)
      LINENO = 2926
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($1207)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      GOTO 1208
 1207 CONTINUE
      LINENO = 2927
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32456))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1209)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
      GOTO 1210
 1209 CONTINUE
      LINENO = 2928
      LINENO = 2929
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$EQU(1,1)
      CALL P$FJP($1211)
      LINENO = 2930
      CALL P$MST(4)
      CALL P$LODA(0,10)
      CALL P$CUP(1)
      CALL P502
      CALL P$NOT
      CALL P$FJP($1212)
      LINENO = 2931
      CALL P$MST(5)
      CALL P$LDC(1,INTL(183))
      CALL P$CUP(1)
      CALL P30
      LINENO = 2933
      CALL P$MST(5)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32457))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
      GOTO 1213
 1212 CONTINUE
      LINENO = 2935
      LINENO = 2936
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,11)
      LINENO = 2937
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($1214)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
 1214 CONTINUE
      LINENO = 2938
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
 1213 CONTINUE
 1211 CONTINUE
      LINENO = 2940
      CALL P$LOD(0,11)
      CALL P$NOT
      CALL P$FJP($1215)
      LINENO = 2941
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,7)
      CALL P$LDC(1,INTL(8))
      CALL P$STR(0,12)
 1216 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,12)
      CALL P$LEQ(1)
      CALL P$FJP($1217)
      CALL P$LAO(6360)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(101))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LAO(18)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(8))
      CALL P$DEC(1,INTL(1))
      CALL P$LPC
      CALL P$STO(6)
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 1216
 1217 CONTINUE
 1215 CONTINUE
      LINENO = 2942
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      GOTO 1218
 1220 CONTINUE
      LINENO = 2943
      CALL P$MST(2)
      CALL P$LDA(0,9)
      CALL P$CUP(1)
      CALL P1108
      CALL P$FJP($1221)
      LINENO = 2944
      CALL P$LODA(0,10)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,8)
      CALL P$STR(0,5)
      GOTO 1222
 1221 CONTINUE
      LINENO = 2945
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1222 CONTINUE
      GOTO 1219
 1223 CONTINUE
      LINENO = 2946
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,5)
      GOTO 1219
 1224 CONTINUE
      LINENO = 2947
      CALL P$MST(5)
      CALL P$LDC(1,INTL(400))
      CALL P$CUP(1)
      CALL P30
      GOTO 1219
 1218 CONTINUE
      CALL P$CHK(INTL(4),INTL(6))
      CALL P$LDC(1,INTL(4))
      CALL P$SBI
      CALL P$XJP($1225)
 1225 CONTINUE
 1226 GOTO 1220
 1227 GOTO 1224
 1228 GOTO 1223
 1219 CONTINUE
      LINENO = 2949
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDO(0,47)
      CALL P$EQU(0,1)
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$FJP($1229)
      LINENO = 2950
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,6)
      GOTO 1230
 1229 CONTINUE
      LINENO = 2951
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$STR(0,6)
 1230 CONTINUE
      LINENO = 2953
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26487)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6197)
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(21))
      CALL P$ADI
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LOD(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2954
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($1231)
      CALL P$LAO(11)
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(26488)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      SP=SP-1
      GOTO 1232
 1231 CONTINUE
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(167))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
 1232 CONTINUE
      LINENO = 2955
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,7)
      LINENO = 2956
 1233 CONTINUE
      LINENO = 2957
      CALL P$LAO(11)
      CALL P$LAO(6360)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(101))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(6,0)
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 2958
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,7)
      LINENO = 2959
      CALL P$LAO(6360)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(101))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(6,0)
      CALL P$LDC(6,INTL(160))
      CALL P$EQU(6,1)
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(100))
      CALL P$GRT(1,1)
      CALL P$IOR
      CALL P$FJP($1233)
      LINENO = 2960
      CALL P$LAO(11)
      CALL P$LCA(26489)
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$WRS
      CALL P$WLN
      LINENO = 2961
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 2962
      CALL P$LOD(3,20)
      CALL P$LAO(6321)
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(21))
      CALL P$ADI
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(2))
      CALL P$MPI
      CALL P$ADI
      CALL P$STR(3,20)
      LINENO = 2963
      CALL P$LOD(3,20)
      CALL P$LOD(3,19)
      CALL P$GRT(1,1)
      CALL P$FJP($1234)
      CALL P$LOD(3,20)
      CALL P$STR(3,19)
 1234 CONTINUE
 1210 CONTINUE
 1208 CONTINUE
      CALL P$RET(0)
      RETURN
 1203 CONTINUE
      SG1SIZ = 13
      SG2SIZ = 67
      GOTO 1204
      END

      SUBROUTINE P1235
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1236
99998 CALL P$UJC
 1237 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2969
      CALL P$LDC(3,INTL(0))
      CALL P$STR(2,17)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32458))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 2970
      CALL P$MST(2)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$CUP(1)
      CALL P1108
      CALL P$FJP($1238)
      LINENO = 2971
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(1,14)
      CALL P$CUP(2)
      CALL P896
      GOTO 1239
 1238 CONTINUE
      LINENO = 2972
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1239 CONTINUE
      CALL P$RET(0)
      RETURN
 1236 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 37
      GOTO 1237
      END

      SUBROUTINE P1240
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1241
99998 CALL P$UJC
 1242 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2977
      CALL P$LDC(3,INTL(0))
      CALL P$STR(2,17)
      LINENO = 2978
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32459))
      CALL P$UNI
      CALL P$LDA(0,6)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 2979
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($1243)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      GOTO 1244
 1243 CONTINUE
      LINENO = 2980
      LINENO = 2981
      CALL P$MST(2)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$CUP(1)
      CALL P1108
      CALL P$FJP($1245)
      LINENO = 2982
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDO(0,47)
      CALL P$NEQ(0,1)
      CALL P$FJP($1246)
      LINENO = 2983
      CALL P$MST(5)
      CALL P$LDC(1,INTL(182))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(5)
      CALL P$LDC(1,INTL(59))
      CALL P$CUP(1)
      CALL P30
      GOTO 1247
 1246 CONTINUE
      LINENO = 2985
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(26))
      CALL P$CUP(2)
      CALL P896
 1247 CONTINUE
      GOTO 1248
 1245 CONTINUE
      LINENO = 2986
      CALL P$MST(5)
      CALL P$LDC(1,INTL(59))
      CALL P$CUP(1)
      CALL P30
 1248 CONTINUE
 1244 CONTINUE
      CALL P$RET(0)
      RETURN
 1241 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 37
      GOTO 1242
      END

      SUBROUTINE P1249
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1250
99998 CALL P$UJC
 1251 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 2993
      CALL P$LDO(0,47)
      CALL P$STRA(0,6)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(2,17)
      LINENO = 2994
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($1252)
      LINENO = 2995
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      CALL P$LDC(3,INTL(0))
      CALL P$STR(4,16)
      LINENO = 3001
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32460))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 3002
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1253)
      LINENO = 3003
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,7)
      LINENO = 3004
      CALL P$MST(2)
      CALL P$LDA(0,7)
      CALL P$CUP(1)
      CALL P1108
      CALL P$FJP($1254)
      LINENO = 3005
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,6)
      LINENO = 3006
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1255)
      LINENO = 3007
      LINENO = 3008
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($1256)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1256 CONTINUE
      LINENO = 3009
      CALL P$LDC(3,INTL(1))
      CALL P$STR(4,16)
      GOTO 1257
 1255 CONTINUE
      LINENO = 3011
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$FJP($1258)
      LINENO = 3012
      LINENO = 3013
      CALL P$MST(5)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32461))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
      LINENO = 3014
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1258 CONTINUE
 1257 CONTINUE
      LINENO = 3016
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$EQU(1,1)
      CALL P$FJP($1259)
      LINENO = 3017
      LINENO = 3018
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      LINENO = 3019
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32462))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P1197
      GOTO 1260
 1259 CONTINUE
      LINENO = 3021
      CALL P$LDC(3,INTL(1))
      CALL P$STR(4,16)
 1260 CONTINUE
 1254 CONTINUE
 1253 CONTINUE
      LINENO = 3024
      CALL P$LOD(4,16)
      CALL P$NOT
      CALL P$FJP($1261)
      LINENO = 3025
 1262 CONTINUE
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P1022
      LINENO = 3026
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1263)
      LINENO = 3027
      CALL P$LDO(0,227)
      CALL P$STRA(0,7)
      LINENO = 3028
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32463))
      CALL P$INN
      CALL P$FJP($1264)
      LINENO = 3029
      CALL P$MST(4)
      CALL P$LODA(0,6)
      CALL P$LDO(0,47)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1265)
      LINENO = 3030
      CALL P$MST(4)
      CALL P$LODA(0,7)
      CALL P$LDO(0,45)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1266)
      LINENO = 3031
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(3))
      CALL P$CUP(2)
      CALL P896
      GOTO 1267
 1266 CONTINUE
      LINENO = 3032
      CALL P$MST(4)
      CALL P$LODA(0,7)
      CALL P$LDO(0,46)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1268)
      LINENO = 3033
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(2)
      CALL P896
      GOTO 1269
 1268 CONTINUE
      LINENO = 3034
      CALL P$MST(4)
      CALL P$LODA(0,7)
      CALL P$LDO(0,47)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1270)
      LINENO = 3035
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(2)
      CALL P896
      GOTO 1271
 1270 CONTINUE
      LINENO = 3036
      CALL P$MST(5)
      CALL P$LDC(1,INTL(145))
      CALL P$CUP(1)
      CALL P30
 1271 CONTINUE
 1269 CONTINUE
 1267 CONTINUE
      GOTO 1272
 1265 CONTINUE
      LINENO = 3037
      CALL P$MST(4)
      CALL P$LODA(0,7)
      CALL P$LODA(0,6)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1273)
      LINENO = 3039
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STR(0,9)
      LINENO = 3040
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(27))
      CALL P$LOD(0,9)
      CALL P$CUP(3)
      CALL P903
      GOTO 1274
 1273 CONTINUE
      LINENO = 3042
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1274 CONTINUE
 1272 CONTINUE
 1264 CONTINUE
 1263 CONTINUE
      LINENO = 3044
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(4,16)
      LINENO = 3045
      CALL P$LOD(4,16)
      CALL P$NOT
      CALL P$FJP($1275)
      LINENO = 3046
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32464))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P1197
 1275 CONTINUE
      LINENO = 3047
      CALL P$LOD(4,16)
      CALL P$FJP($1262)
 1261 CONTINUE
      LINENO = 3048
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1276)
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      GOTO 1277
 1276 CONTINUE
      CALL P$MST(5)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
 1277 CONTINUE
      GOTO 1278
 1252 CONTINUE
      LINENO = 3050
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($1279)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
      GOTO 1280
 1279 CONTINUE
      LINENO = 3051
      LINENO = 3052
      CALL P$LDC(3,INTL(1))
      CALL P$STR(2,17)
      LINENO = 3053
      CALL P$LDO(3,43)
      CALL P$NOT
      CALL P$FJP($1281)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(176))
      CALL P$CUP(1)
      CALL P30
 1281 CONTINUE
      LINENO = 3054
      CALL P$MST(3)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(3)
      CALL P903
 1280 CONTINUE
 1278 CONTINUE
      LINENO = 3056
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(11))
      CALL P$EQU(1,1)
      CALL P$FJP($1282)
      LINENO = 3057
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(21))
      CALL P$CUP(2)
      CALL P896
      GOTO 1283
 1282 CONTINUE
      LINENO = 3058
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26490)
      CALL P$LDC(1,INTL(7))
      CALL P$LDC(1,INTL(7))
      CALL P$WRS
      CALL P$WLN
 1283 CONTINUE
      CALL P$RET(0)
      RETURN
 1250 CONTINUE
      SG1SIZ = 10
      SG2SIZ = 135
      GOTO 1251
      END

      SUBROUTINE P1284
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1285
99998 CALL P$UJC
 1286 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3065
      CALL P$LOD(1,14)
      CALL P$STR(0,14)
      LINENO = 3066
      CALL P$LDO(0,47)
      CALL P$STRA(0,5)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(2,17)
      LINENO = 3067
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($1287)
      LINENO = 3068
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      CALL P$LDC(3,INTL(0))
      CALL P$STR(4,16)
      LINENO = 3069
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32465))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 3070
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1288)
      LINENO = 3071
      CALL P$LDO(0,227)
      CALL P$STRA(0,6)
      LINENO = 3072
      CALL P$MST(2)
      CALL P$LDA(0,6)
      CALL P$CUP(1)
      CALL P1108
      CALL P$FJP($1289)
      LINENO = 3073
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,5)
      LINENO = 3074
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1290)
      LINENO = 3075
      LINENO = 3076
      CALL P$LOD(0,14)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$FJP($1291)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1291 CONTINUE
      LINENO = 3077
      CALL P$LDC(3,INTL(1))
      CALL P$STR(4,16)
      GOTO 1292
 1290 CONTINUE
      LINENO = 3079
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$FJP($1293)
      LINENO = 3080
      LINENO = 3081
      CALL P$MST(5)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32466))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
      LINENO = 3082
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1293 CONTINUE
 1292 CONTINUE
      LINENO = 3084
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$EQU(1,1)
      CALL P$FJP($1294)
      LINENO = 3085
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      LINENO = 3086
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32467))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      GOTO 1295
 1294 CONTINUE
      LINENO = 3088
      CALL P$LDC(3,INTL(1))
      CALL P$STR(4,16)
 1295 CONTINUE
 1289 CONTINUE
 1288 CONTINUE
      LINENO = 3091
      CALL P$LOD(2,17)
      CALL P$NOT
      CALL P$FJP($1296)
      LINENO = 3092
      LINENO = 3093
      CALL P$LDC(3,INTL(1))
      CALL P$STR(2,17)
      LINENO = 3094
      CALL P$LDO(3,42)
      CALL P$NOT
      CALL P$FJP($1297)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(176))
      CALL P$CUP(1)
      CALL P30
 1297 CONTINUE
      LINENO = 3095
      CALL P$MST(3)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(3)
      CALL P903
 1296 CONTINUE
      LINENO = 3097
      CALL P$LOD(4,16)
      CALL P$NOT
      CALL P$FJP($1298)
      LINENO = 3098
 1299 CONTINUE
      LINENO = 3099
      CALL P$MST(2)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
      LINENO = 3100
      CALL P$LDO(0,227)
      CALL P$STRA(0,6)
      LINENO = 3101
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1300)
      LINENO = 3102
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$FJP($1301)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P979
      GOTO 1302
 1301 CONTINUE
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P1022
 1302 CONTINUE
 1300 CONTINUE
      LINENO = 3103
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32468))
      CALL P$INN
      CALL P$FJP($1303)
      LINENO = 3104
      CALL P$MST(4)
      CALL P$LODA(0,5)
      CALL P$LDO(0,47)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1304)
      LINENO = 3105
      LINENO = 3106
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($1305)
      LINENO = 3107
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      LINENO = 3108
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32469))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 3109
      CALL P$MST(2)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
      LINENO = 3110
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1306)
      LINENO = 3111
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$NEQ(0,1)
      CALL P$FJP($1307)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1307 CONTINUE
 1306 CONTINUE
      LINENO = 3112
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P979
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,9)
      GOTO 1308
 1305 CONTINUE
      LINENO = 3114
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,9)
 1308 CONTINUE
      LINENO = 3115
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($1309)
      LINENO = 3116
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      LINENO = 3117
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32470))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 3118
      CALL P$MST(2)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
      LINENO = 3119
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1310)
      LINENO = 3120
      CALL P$LODA(0,6)
      CALL P$LDO(0,46)
      CALL P$NEQ(0,1)
      CALL P$FJP($1311)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(124))
      CALL P$CUP(1)
      CALL P30
 1311 CONTINUE
 1310 CONTINUE
      LINENO = 3121
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P979
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,8)
      GOTO 1312
 1309 CONTINUE
      LINENO = 3123
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,8)
 1312 CONTINUE
      LINENO = 3124
      CALL P$LODA(0,6)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1313)
      LINENO = 3125
      LINENO = 3126
      CALL P$LOD(0,9)
      CALL P$FJP($1314)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(10))
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
 1314 CONTINUE
      LINENO = 3127
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(2)
      CALL P896
      GOTO 1315
 1313 CONTINUE
      LINENO = 3129
      CALL P$LODA(0,6)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($1316)
      LINENO = 3130
      LINENO = 3131
      CALL P$LOD(0,9)
      CALL P$FJP($1317)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(20))
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
 1317 CONTINUE
      LINENO = 3132
      CALL P$LOD(0,8)
      CALL P$FJP($1318)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(20))
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
 1318 CONTINUE
      LINENO = 3133
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(8))
      CALL P$CUP(2)
      CALL P896
      GOTO 1319
 1316 CONTINUE
      LINENO = 3135
      CALL P$LODA(0,6)
      CALL P$LDO(0,47)
      CALL P$EQU(0,1)
      CALL P$FJP($1320)
      LINENO = 3136
      LINENO = 3137
      CALL P$LOD(0,9)
      CALL P$FJP($1321)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
 1321 CONTINUE
      LINENO = 3138
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(9))
      CALL P$CUP(2)
      CALL P896
      GOTO 1322
 1320 CONTINUE
      LINENO = 3140
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1323)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
      GOTO 1324
 1323 CONTINUE
      LINENO = 3141
      CALL P$MST(4)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P496
      CALL P$FJP($1325)
      LINENO = 3142
      CALL P$MST(5)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDA(0,15)
      CALL P$LDA(0,16)
      CALL P$CUP(3)
      CALL P364
      LINENO = 3143
      CALL P$LOD(0,16)
      CALL P$LOD(0,15)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,11)
      LINENO = 3144
      CALL P$LOD(0,9)
      CALL P$FJP($1326)
      LINENO = 3145
      CALL P$MST(3)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,11)
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
 1326 CONTINUE
      LINENO = 3146
      CALL P$MST(3)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,11)
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
      LINENO = 3147
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(10))
      CALL P$CUP(2)
      CALL P896
      GOTO 1327
 1325 CONTINUE
      LINENO = 3149
      CALL P$MST(5)
      CALL P$LDC(1,INTL(145))
      CALL P$CUP(1)
      CALL P30
 1327 CONTINUE
 1324 CONTINUE
 1322 CONTINUE
 1319 CONTINUE
 1315 CONTINUE
      GOTO 1328
 1304 CONTINUE
      LINENO = 3151
      CALL P$MST(4)
      CALL P$LODA(0,6)
      CALL P$LODA(0,5)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1329)
      LINENO = 3152
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STR(0,12)
      LINENO = 3153
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(28))
      CALL P$LOD(0,12)
      CALL P$CUP(3)
      CALL P903
      GOTO 1330
 1329 CONTINUE
      LINENO = 3155
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1330 CONTINUE
 1328 CONTINUE
 1303 CONTINUE
      LINENO = 3156
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(4,16)
      LINENO = 3157
      CALL P$LOD(4,16)
      CALL P$NOT
      CALL P$FJP($1331)
      LINENO = 3158
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      LINENO = 3159
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32471))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
 1331 CONTINUE
      LINENO = 3161
      CALL P$LOD(4,16)
      CALL P$FJP($1299)
 1298 CONTINUE
      LINENO = 3162
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1332)
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      GOTO 1333
 1332 CONTINUE
      CALL P$MST(5)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
 1333 CONTINUE
      GOTO 1334
 1287 CONTINUE
      LINENO = 3164
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$FJP($1335)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
      GOTO 1336
 1335 CONTINUE
      LINENO = 3165
      LINENO = 3166
      CALL P$LDC(3,INTL(1))
      CALL P$STR(2,17)
      LINENO = 3167
      CALL P$LDO(3,42)
      CALL P$NOT
      CALL P$FJP($1337)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(176))
      CALL P$CUP(1)
      CALL P30
 1337 CONTINUE
      LINENO = 3168
      CALL P$MST(3)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$LDC(1,INTL(7))
      CALL P$CUP(3)
      CALL P903
 1336 CONTINUE
 1334 CONTINUE
      LINENO = 3170
      CALL P$LOD(0,14)
      CALL P$LDC(1,INTL(12))
      CALL P$EQU(1,1)
      CALL P$FJP($1338)
      LINENO = 3171
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(22))
      CALL P$CUP(2)
      CALL P896
      GOTO 1339
 1338 CONTINUE
      LINENO = 3173
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26492)
      CALL P$LDC(1,INTL(7))
      CALL P$LDC(1,INTL(7))
      CALL P$WRS
      CALL P$WLN
 1339 CONTINUE
      CALL P$RET(0)
      RETURN
 1285 CONTINUE
      SG1SIZ = 17
      SG2SIZ = 221
      GOTO 1286
      END

      SUBROUTINE P1340
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1341
99998 CALL P$UJC
 1342 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3178
      CALL P$MST(5)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32472))
      CALL P$UNI
      CALL P$LDA(0,7)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 3179
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,5)
      LINENO = 3180
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1343)
      LINENO = 3181
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 3182
      CALL P$LODA(0,8)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1344)
      LINENO = 3183
      CALL P$LODA(0,8)
      CALL P$IND(0,4)
      CALL P$STRA(0,6)
      CALL P$LODA(0,8)
      CALL P$IND(0,5)
      CALL P$STRA(0,5)
      GOTO 1345
 1344 CONTINUE
      LINENO = 3184
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1345 CONTINUE
 1343 CONTINUE
      LINENO = 3185
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$EQU(1,1)
      CALL P$FJP($1346)
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      GOTO 1347
 1346 CONTINUE
      CALL P$MST(5)
      CALL P$LDC(1,INTL(20))
      CALL P$CUP(1)
      CALL P30
 1347 CONTINUE
      LINENO = 3186
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32473))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 3187
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1348)
      LINENO = 3188
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$GRT(1,1)
      CALL P$FJP($1349)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
      GOTO 1350
 1349 CONTINUE
      LINENO = 3190
      CALL P$MST(4)
      CALL P$LODA(0,6)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$NOT
      CALL P$FJP($1351)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1351 CONTINUE
 1350 CONTINUE
 1348 CONTINUE
      LINENO = 3191
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$EQU(1,1)
      CALL P$FJP($1352)
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      GOTO 1353
 1352 CONTINUE
      CALL P$MST(5)
      CALL P$LDC(1,INTL(20))
      CALL P$CUP(1)
      CALL P30
 1353 CONTINUE
      LINENO = 3192
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32474))
      CALL P$UNI
      CALL P$LDA(0,7)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 3193
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1354)
      LINENO = 3194
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 3195
      CALL P$LODA(0,8)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1355)
      LINENO = 3196
      LINENO = 3197
      CALL P$MST(4)
      CALL P$LODA(0,8)
      CALL P$IND(0,5)
      CALL P$LODA(0,5)
      CALL P$CUP(2)
      CALL P460
      CALL P$NOT
      CALL P$MST(4)
      CALL P$LODA(0,8)
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CUP(2)
      CALL P460
      CALL P$NOT
      CALL P$IOR
      CALL P$FJP($1356)
      LINENO = 3199
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1356 CONTINUE
      GOTO 1357
 1355 CONTINUE
      LINENO = 3201
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1357 CONTINUE
 1354 CONTINUE
      CALL P$RET(0)
      RETURN
 1341 CONTINUE
      SG1SIZ = 9
      SG2SIZ = 85
      GOTO 1342
      END

      SUBROUTINE P1358
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1359
99998 CALL P$UJC
 1360 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3206
      CALL P$MST(5)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32475))
      CALL P$UNI
      CALL P$LDA(0,7)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 3207
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,5)
      LINENO = 3208
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1361)
      LINENO = 3209
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 3210
      CALL P$LODA(0,8)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1362)
      LINENO = 3211
      CALL P$LODA(0,8)
      CALL P$IND(0,4)
      CALL P$STRA(0,6)
      CALL P$LODA(0,8)
      CALL P$IND(0,5)
      CALL P$STRA(0,5)
      GOTO 1363
 1362 CONTINUE
      LINENO = 3212
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1363 CONTINUE
 1361 CONTINUE
      LINENO = 3213
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$EQU(1,1)
      CALL P$FJP($1364)
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      GOTO 1365
 1364 CONTINUE
      CALL P$MST(5)
      CALL P$LDC(1,INTL(20))
      CALL P$CUP(1)
      CALL P30
 1365 CONTINUE
      LINENO = 3214
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32476))
      CALL P$UNI
      CALL P$LDA(0,7)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 3215
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1366)
      LINENO = 3216
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 3217
      CALL P$LODA(0,8)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1367)
      LINENO = 3218
      LINENO = 3219
      CALL P$MST(4)
      CALL P$LODA(0,8)
      CALL P$IND(0,5)
      CALL P$LODA(0,5)
      CALL P$CUP(2)
      CALL P460
      CALL P$NOT
      CALL P$MST(4)
      CALL P$LODA(0,8)
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CUP(2)
      CALL P460
      CALL P$NOT
      CALL P$IOR
      CALL P$FJP($1368)
      LINENO = 3221
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1368 CONTINUE
      GOTO 1369
 1367 CONTINUE
      LINENO = 3223
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1369 CONTINUE
 1366 CONTINUE
      LINENO = 3224
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$EQU(1,1)
      CALL P$FJP($1370)
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      GOTO 1371
 1370 CONTINUE
      CALL P$MST(5)
      CALL P$LDC(1,INTL(20))
      CALL P$CUP(1)
      CALL P30
 1371 CONTINUE
      LINENO = 3225
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32477))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 3226
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1372)
      LINENO = 3227
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$GRT(1,1)
      CALL P$FJP($1373)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
      GOTO 1374
 1373 CONTINUE
      LINENO = 3229
      CALL P$MST(4)
      CALL P$LODA(0,6)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$NOT
      CALL P$FJP($1375)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1375 CONTINUE
 1374 CONTINUE
 1372 CONTINUE
      CALL P$RET(0)
      RETURN
 1359 CONTINUE
      SG1SIZ = 9
      SG2SIZ = 89
      GOTO 1360
      END

      SUBROUTINE P1376
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1378
99998 CALL P$UJC
 1379 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3236
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32478))
      CALL P$UNI
      CALL P$LDA(0,14)
      CALL P$CUP(9)
      CALL P1197
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P1022
      LINENO = 3237
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,6)
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,9)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,11)
      LINENO = 3238
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1380)
      LINENO = 3239
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,15)
      LINENO = 3240
      CALL P$LODA(0,15)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($1381)
      LINENO = 3241
      LINENO = 3242
      CALL P$LODA(0,15)
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1382)
      LINENO = 3243
      CALL P$LODA(0,15)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STR(0,11)
      LINENO = 3244
      CALL P$LODA(0,15)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($1383)
      CALL P$LODA(0,15)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,6)
 1383 CONTINUE
 1382 CONTINUE
      GOTO 1384
 1381 CONTINUE
      LINENO = 3247
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1384 CONTINUE
 1380 CONTINUE
      LINENO = 3248
 1385 CONTINUE
      LINENO = 3248
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$EQU(1,1)
      CALL P$FJP($1386)
      LINENO = 3249
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32479))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$LDA(0,12)
      CALL P$CUP(10)
      CALL P423
      LINENO = 3250
      CALL P$LOD(0,9)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,9)
      LINENO = 3252
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($1387)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(158))
      CALL P$CUP(1)
      CALL P30
      GOTO 1388
 1387 CONTINUE
      LINENO = 3254
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(7))
      CALL P$NEQ(1,1)
      CALL P$FJP($1389)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(162))
      CALL P$CUP(1)
      CALL P30
      GOTO 1390
 1389 CONTINUE
      LINENO = 3256
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1391)
      LINENO = 3257
      CALL P$MST(4)
      CALL P$LODA(0,5)
      CALL P$CUP(1)
      CALL P496
      CALL P$LODA(0,5)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$IOR
      CALL P$FJP($1392)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(159))
      CALL P$CUP(1)
      CALL P30
      GOTO 1393
 1392 CONTINUE
      LINENO = 3259
      CALL P$MST(4)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,5)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1394)
      LINENO = 3260
      LINENO = 3261
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,5)
      LINENO = 3262
 1395 CONTINUE
      LINENO = 3262
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1396)
      LINENO = 3263
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,15)
      LINENO = 3264
      CALL P$LODA(0,15)
      CALL P$IND(1,7)
      CALL P$LOD(0,13)
      CALL P$EQU(1,1)
      CALL P$FJP($1397)
      LINENO = 3265
      CALL P$LODA(0,15)
      CALL P$IND(1,2)
      CALL P$STR(0,11)
      CALL P$LODA(0,15)
      CALL P$IND(0,4)
      CALL P$STRA(0,6)
      LINENO = 3266
      GOTO 1377
 1398 CONTINUE
      GOTO 1399
 1397 CONTINUE
      LINENO = 3268
      CALL P$LODA(0,15)
      CALL P$IND(0,5)
      CALL P$STRA(0,5)
 1399 CONTINUE
      GOTO 1395
 1396 CONTINUE
      LINENO = 3269
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STR(0,11)
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,6)
      GOTO 1400
 1394 CONTINUE
      LINENO = 3271
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1400 CONTINUE
 1393 CONTINUE
 1391 CONTINUE
 1390 CONTINUE
 1388 CONTINUE
 1377 CONTINUE
      GOTO 1385
 1386 CONTINUE
      LINENO = 3273
      CALL P$MST(3)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,11)
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
      LINENO = 3274
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(12))
      CALL P$CUP(2)
      CALL P896
      CALL P$RET(0)
      RETURN
 1378 CONTINUE
      SG1SIZ = 16
      SG2SIZ = 65
      GOTO 1379
      END

      SUBROUTINE P1401
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1402
99998 CALL P$UJC
 1403 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3279
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32480))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 3280
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1404)
      LINENO = 3281
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($1405)
      LINENO = 3282
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P1022
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(23))
      CALL P$CUP(2)
      CALL P896
      GOTO 1406
 1405 CONTINUE
      LINENO = 3283
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1406 CONTINUE
 1404 CONTINUE
      CALL P$RET(0)
      RETURN
 1402 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 37
      GOTO 1403
      END

      SUBROUTINE P1407
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1408
99998 CALL P$UJC
 1409 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3288
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32481))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 3289
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1410)
      LINENO = 3290
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($1411)
      LINENO = 3291
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P979
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(13))
      CALL P$CUP(2)
      CALL P896
      GOTO 1412
 1411 CONTINUE
      LINENO = 3292
      CALL P$MST(5)
      CALL P$LDC(1,INTL(116))
      CALL P$CUP(1)
      CALL P30
 1412 CONTINUE
 1410 CONTINUE
      CALL P$RET(0)
      RETURN
 1408 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 37
      GOTO 1409
      END

      SUBROUTINE P1413
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1414
99998 CALL P$UJC
 1415 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3297
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32482))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 3298
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1416)
      LINENO = 3299
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(4))
      CALL P$NEQ(1,1)
      CALL P$FJP($1417)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(103))
      CALL P$CUP(1)
      CALL P30
      GOTO 1418
 1417 CONTINUE
      LINENO = 3300
      LINENO = 3301
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P1022
      LINENO = 3302
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(15))
      CALL P$EQU(1,1)
      CALL P$FJP($1419)
      LINENO = 3303
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(29))
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(3)
      CALL P903
      GOTO 1420
 1419 CONTINUE
      LINENO = 3304
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(29))
      CALL P$LDC(1,INTL(1))
      CALL P$CUP(3)
      CALL P903
 1420 CONTINUE
 1418 CONTINUE
      GOTO 1421
 1416 CONTINUE
      LINENO = 3306
      CALL P$MST(5)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
 1421 CONTINUE
      CALL P$RET(0)
      RETURN
 1414 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 39
      GOTO 1415
      END

      SUBROUTINE P1422
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1423
99998 CALL P$UJC
 1424 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3311
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1425)
      LINENO = 3312
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1426)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1427
 1426 CONTINUE
      LINENO = 3314
      CALL P$LDO(0,227)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($1428)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1429
 1428 CONTINUE
      LINENO = 3315
      CALL P$MST(5)
      CALL P$LDC(1,INTL(125))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDO(0,45)
      CALL P$SRO(0,227)
 1429 CONTINUE
 1427 CONTINUE
 1425 CONTINUE
      CALL P$RET(0)
      RETURN
 1423 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 13
      GOTO 1424
      END

      SUBROUTINE P1430
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1431
99998 CALL P$UJC
 1432 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3320
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1433)
      LINENO = 3321
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1434)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(24))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1435
 1434 CONTINUE
      LINENO = 3323
      CALL P$LDO(0,227)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($1436)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(25))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1437
 1436 CONTINUE
      LINENO = 3324
      CALL P$MST(5)
      CALL P$LDC(1,INTL(125))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDO(0,45)
      CALL P$SRO(0,227)
 1437 CONTINUE
 1435 CONTINUE
 1433 CONTINUE
      CALL P$RET(0)
      RETURN
 1431 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 13
      GOTO 1432
      END

      SUBROUTINE P1438
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1439
99998 CALL P$UJC
 1440 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3329
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1441)
      LINENO = 3330
      CALL P$LDO(0,227)
      CALL P$LDO(0,46)
      CALL P$NEQ(0,1)
      CALL P$FJP($1442)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(125))
      CALL P$CUP(1)
      CALL P30
 1442 CONTINUE
 1441 CONTINUE
      LINENO = 3331
      CALL P$MST(3)
      CALL P$LDC(1,INTL(27))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3332
      CALL P$LDO(0,45)
      CALL P$SRO(0,227)
      CALL P$RET(0)
      RETURN
 1439 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 11
      GOTO 1440
      END

      SUBROUTINE P1443
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1444
99998 CALL P$UJC
 1445 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3337
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1446)
      LINENO = 3338
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$NEQ(0,1)
      CALL P$FJP($1447)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(125))
      CALL P$CUP(1)
      CALL P30
 1447 CONTINUE
 1446 CONTINUE
      LINENO = 3339
      CALL P$MST(3)
      CALL P$LDC(1,INTL(20))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3340
      CALL P$LDO(0,48)
      CALL P$SRO(0,227)
      CALL P$RET(0)
      RETURN
 1444 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 11
      GOTO 1445
      END

      SUBROUTINE P1448
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1449
99998 CALL P$UJC
 1450 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3345
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1451)
      LINENO = 3346
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$GEQ(1,1)
      CALL P$FJP($1452)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(125))
      CALL P$CUP(1)
      CALL P30
 1452 CONTINUE
 1451 CONTINUE
      LINENO = 3348
      CALL P$LDO(0,45)
      CALL P$SRO(0,227)
      CALL P$RET(0)
      RETURN
 1449 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 9
      GOTO 1450
      END

      SUBROUTINE P1453
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1454
99998 CALL P$UJC
 1455 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3353
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1456)
      LINENO = 3354
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$NEQ(0,1)
      CALL P$FJP($1457)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(125))
      CALL P$CUP(1)
      CALL P30
      GOTO 1458
 1457 CONTINUE
      LINENO = 3355
      CALL P$LDO(3,36)
      CALL P$FJP($1459)
      LINENO = 3356
      CALL P$MST(3)
      CALL P$LDC(1,INTL(45))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(128))
      CALL P$LDC(1,INTL(255))
      CALL P$LDO(0,45)
      CALL P$CUP(4)
      CALL P959
 1459 CONTINUE
 1458 CONTINUE
 1456 CONTINUE
      LINENO = 3357
      CALL P$LDO(0,47)
      CALL P$SRO(0,227)
      CALL P$RET(0)
      RETURN
 1454 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 17
      GOTO 1455
      END

      SUBROUTINE P1460
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1461
99998 CALL P$UJC
 1462 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3362
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1463)
      LINENO = 3363
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($1464)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(125))
      CALL P$CUP(1)
      CALL P30
 1464 CONTINUE
 1463 CONTINUE
      LINENO = 3364
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(7))
      CALL P$EQU(1,1)
      CALL P$FJP($1465)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(31))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(0,227)
      CALL P$CUP(3)
      CALL P953
      GOTO 1466
 1465 CONTINUE
      LINENO = 3365
      CALL P$MST(3)
      CALL P$LDC(1,INTL(34))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(0,227)
      CALL P$CUP(3)
      CALL P953
 1466 CONTINUE
      CALL P$RET(0)
      RETURN
 1461 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 19
      GOTO 1462
      END

      SUBROUTINE P1467
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1468
99998 CALL P$UJC
 1469 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3383
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($1470)
      LINENO = 3384
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32483))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P1197
      LINENO = 3385
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1471)
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      GOTO 1472
 1471 CONTINUE
      CALL P$MST(5)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
 1472 CONTINUE
      GOTO 1473
 1470 CONTINUE
      LINENO = 3388
      LINENO = 3389
      CALL P$LDO(0,50)
      CALL P$SRO(0,227)
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,228)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,229)
      LINENO = 3390
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$SRO(1,230)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,231)
 1473 CONTINUE
      LINENO = 3392
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P1022
      LINENO = 3393
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1474)
      LINENO = 3394
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$NEQ(1,1)
      CALL P$FJP($1475)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(125))
      CALL P$CUP(1)
      CALL P30
 1475 CONTINUE
 1474 CONTINUE
      LINENO = 3395
      CALL P$LOD(1,14)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1476)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1477
 1476 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(2)
      CALL P896
 1477 CONTINUE
      LINENO = 3396
      CALL P$LDO(0,48)
      CALL P$SRO(0,227)
      CALL P$RET(0)
      RETURN
 1468 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 37
      GOTO 1469
      END

      SUBROUTINE P1478
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1479
99998 CALL P$UJC
 1480 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3404
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,11)
      LINENO = 3405
      CALL P$LODA(1,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,12)
      LINENO = 3406
      CALL P$LODA(0,12)
      CALL P$IND(0,5)
      CALL P$STRA(0,6)
      CALL P$LODA(0,12)
      CALL P$IND(1,10)
      CALL P$STR(0,8)
      LINENO = 3407
      CALL P$LODA(0,12)
      CALL P$IND(3,12)
      CALL P$NOT
      CALL P$FJP($1481)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(41))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LODA(0,12)
      CALL P$IND(1,8)
      CALL P$SBI
      CALL P$CUP(2)
      CALL P896
 1481 CONTINUE
      LINENO = 3411
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($1482)
      LINENO = 3412
      CALL P$LDO(1,23)
      CALL P$STR(0,10)
      LINENO = 3413
 1483 CONTINUE
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,9)
      LINENO = 3414
      CALL P$LOD(0,8)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1484)
      LINENO = 3415
      LINENO = 3416
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($1485)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(126))
      CALL P$CUP(1)
      CALL P30
      GOTO 1486
 1485 CONTINUE
      LINENO = 3417
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32484))
      CALL P$INN
      CALL P$STR(0,9)
 1486 CONTINUE
      GOTO 1487
 1484 CONTINUE
      LINENO = 3418
      CALL P$MST(5)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
 1487 CONTINUE
      LINENO = 3425
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      LINENO = 3426
      CALL P$LOD(0,9)
      CALL P$FJP($1488)
      LINENO = 3427
      CALL P$MST(5)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
      LINENO = 3428
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($1489)
      LINENO = 3429
      CALL P$MST(5)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(5)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32485))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
      GOTO 1490
 1489 CONTINUE
      LINENO = 3431
      LINENO = 3432
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1491)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32486))
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P337
      GOTO 1492
 1491 CONTINUE
      LINENO = 3434
      CALL P$MST(5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32487))
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P337
      LINENO = 3435
      CALL P$MST(4)
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P460
      CALL P$NOT
      CALL P$FJP($1493)
      LINENO = 3436
      CALL P$MST(5)
      CALL P$LDC(1,INTL(128))
      CALL P$CUP(1)
      CALL P30
 1493 CONTINUE
 1492 CONTINUE
      LINENO = 3438
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      LINENO = 3439
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32488))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1494)
      LINENO = 3440
      CALL P$MST(5)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(5)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32489))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
 1494 CONTINUE
 1490 CONTINUE
      GOTO 1495
 1488 CONTINUE
      LINENO = 3445
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32490))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 3446
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1496)
      LINENO = 3447
      CALL P$LOD(0,8)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1497)
      LINENO = 3448
      LINENO = 3449
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1498)
      LINENO = 3450
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STRA(0,7)
      LINENO = 3451
      CALL P$LODA(0,7)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1499)
      LINENO = 3452
      LINENO = 3453
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,7)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1500)
      LINENO = 3454
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$LEQ(1,1)
      CALL P$FJP($1501)
      LINENO = 3455
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P979
      LINENO = 3456
      CALL P$MST(4)
      CALL P$LDO(0,46)
      CALL P$LODA(0,7)
      CALL P$CUP(2)
      CALL P460
      CALL P$MST(4)
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$CUP(2)
      CALL P460
      CALL P$AND
      CALL P$FJP($1502)
      LINENO = 3458
      CALL P$MST(3)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3459
      CALL P$LDO(0,46)
      CALL P$SRO(0,227)
 1502 CONTINUE
      LINENO = 3461
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$FJP($1503)
      LINENO = 3462
      CALL P$MST(3)
      CALL P$LODA(0,7)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P1088
      CALL P$FJP($1504)
      LINENO = 3463
      CALL P$MST(3)
      CALL P$LODA(0,7)
      CALL P$CUP(1)
      CALL P1081
 1504 CONTINUE
 1503 CONTINUE
      LINENO = 3464
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($1505)
      LINENO = 3465
      CALL P$LOD(0,11)
      CALL P$LDC(1,INTL(255))
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$ADI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,11)
      GOTO 1506
 1505 CONTINUE
      LINENO = 3466
      CALL P$LOD(0,11)
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,11)
 1506 CONTINUE
      LINENO = 3467
      CALL P$MST(5)
      CALL P$LDO(0,44)
      CALL P$LDA(0,11)
      CALL P$CUP(2)
      CALL P409
      GOTO 1507
 1501 CONTINUE
      LINENO = 3470
      LINENO = 3471
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P1022
      LINENO = 3472
      CALL P$LOD(0,11)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,11)
      LINENO = 3473
      CALL P$MST(5)
      CALL P$LDO(0,44)
      CALL P$LDA(0,11)
      CALL P$CUP(2)
      CALL P409
 1507 CONTINUE
      GOTO 1508
 1500 CONTINUE
      LINENO = 3476
      CALL P$LDO(1,228)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($1509)
      LINENO = 3477
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P1022
      LINENO = 3478
      CALL P$LOD(0,11)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,11)
      GOTO 1510
 1509 CONTINUE
      LINENO = 3480
      CALL P$MST(5)
      CALL P$LDC(1,INTL(154))
      CALL P$CUP(1)
      CALL P30
 1510 CONTINUE
 1508 CONTINUE
      LINENO = 3481
      CALL P$MST(4)
      CALL P$LODA(0,7)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$NOT
      CALL P$FJP($1511)
      LINENO = 3482
      CALL P$MST(5)
      CALL P$LDC(1,INTL(142))
      CALL P$CUP(1)
      CALL P30
 1511 CONTINUE
 1499 CONTINUE
 1498 CONTINUE
      GOTO 1512
 1497 CONTINUE
      LINENO = 3487
 1512 CONTINUE
 1496 CONTINUE
 1495 CONTINUE
      LINENO = 3490
      CALL P$LOD(0,8)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$AND
      CALL P$FJP($1513)
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,6)
 1513 CONTINUE
      LINENO = 3491
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$FJP($1483)
      LINENO = 3492
      CALL P$LOD(0,10)
      CALL P$SRO(1,23)
      LINENO = 3493
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1514)
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      GOTO 1515
 1514 CONTINUE
      CALL P$MST(5)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
 1515 CONTINUE
 1482 CONTINUE
      LINENO = 3495
      CALL P$LOD(0,8)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1516)
      LINENO = 3496
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1517)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(126))
      CALL P$CUP(1)
      CALL P30
 1517 CONTINUE
      LINENO = 3497
      CALL P$LODA(1,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,12)
      LINENO = 3498
      LINENO = 3499
      CALL P$LODA(0,12)
      CALL P$IND(3,12)
      CALL P$FJP($1518)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,12)
      CALL P$IND(1,9)
      CALL P$CUP(2)
      CALL P896
      GOTO 1519
 1518 CONTINUE
      LINENO = 3500
      CALL P$LODA(0,12)
      CALL P$IND(3,13)
      CALL P$FJP($1520)
      LINENO = 3501
      CALL P$MST(3)
      CALL P$LDC(1,INTL(46))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,11)
      CALL P$LODA(0,12)
      CALL P$LODA(1,13)
      CALL P$CUP(4)
      CALL P1065
      GOTO 1521
 1520 CONTINUE
      LINENO = 3505
      CALL P$MST(3)
      CALL P$LDC(1,INTL(46))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,11)
      CALL P$LODA(0,12)
      CALL P$IND(1,9)
      CALL P$CUP(3)
      CALL P1061
 1521 CONTINUE
 1519 CONTINUE
 1516 CONTINUE
      LINENO = 3508
      CALL P$LODA(1,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$SRO(0,227)
      CALL P$RET(0)
      RETURN
 1479 CONTINUE
      SG1SIZ = 13
      SG2SIZ = 155
      GOTO 1480
      END

      SUBROUTINE P1196
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1522
99998 CALL P$UJC
 1523 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3512
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,7)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1524)
      LINENO = 3513
      LINENO = 3514
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,8)
      CALL P$STR(0,14)
      LINENO = 3515
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($1525)
      LINENO = 3516
      LINENO = 3517
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,8)
      CALL P$STR(1,16)
      LINENO = 3518
      CALL P$LOD(0,14)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32491))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1526)
      LINENO = 3519
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($1527)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1528
 1527 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(9))
      CALL P$CUP(1)
      CALL P30
 1528 CONTINUE
 1526 CONTINUE
      LINENO = 3520
      CALL P$LOD(0,14)
      GOTO 1529
 1531 CONTINUE
      LINENO = 3521
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1235
      GOTO 1530
 1532 CONTINUE
      LINENO = 3522
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1202
      GOTO 1530
 1533 CONTINUE
      LINENO = 3523
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1249
      GOTO 1530
 1534 CONTINUE
      LINENO = 3524
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1284
      GOTO 1530
 1535 CONTINUE
      LINENO = 3525
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1340
      GOTO 1530
 1536 CONTINUE
      LINENO = 3526
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1358
      GOTO 1530
 1537 CONTINUE
      LINENO = 3527
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1376
      GOTO 1530
 1538 CONTINUE
      LINENO = 3528
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1407
      GOTO 1530
 1539 CONTINUE
      LINENO = 3529
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1240
      GOTO 1530
 1540 CONTINUE
      LINENO = 3530
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1401
      GOTO 1530
 1541 CONTINUE
      LINENO = 3531
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1413
      GOTO 1530
 1529 CONTINUE
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$XJP($1542)
 1542 CONTINUE
 1543 GOTO 1531
 1544 GOTO 1531
 1545 GOTO 1532
 1546 GOTO 1532
 1547 GOTO 1533
 1548 GOTO 1534
 1549 GOTO 1535
 1550 GOTO 1536
 1551 GOTO 1537
 1552 GOTO 1538
 1553 GOTO 1533
 1554 GOTO 1534
 1555 GOTO 1539
 1556 GOTO 1540
 1557 GOTO 1541
 1558 GOTO 1541
 1530 CONTINUE
      LINENO = 3533
      CALL P$LOD(0,14)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32492))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1559)
      LINENO = 3534
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1560)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1561
 1560 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
 1561 CONTINUE
 1559 CONTINUE
      GOTO 1562
 1525 CONTINUE
      LINENO = 3537
      LINENO = 3538
      CALL P$LOD(0,14)
      CALL P$LDC(1,INTL(8))
      CALL P$LEQ(1,1)
      CALL P$FJP($1563)
      LINENO = 3539
      LINENO = 3540
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($1564)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1565
 1564 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(9))
      CALL P$CUP(1)
      CALL P30
 1565 CONTINUE
      LINENO = 3541
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32493))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      CALL P$MST(1)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
 1563 CONTINUE
      LINENO = 3543
      CALL P$LOD(0,14)
      GOTO 1566
 1568 CONTINUE
      LINENO = 3544
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1422
      GOTO 1567
 1569 CONTINUE
      LINENO = 3545
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1430
      GOTO 1567
 1570 CONTINUE
      LINENO = 3546
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1438
      GOTO 1567
 1571 CONTINUE
      LINENO = 3547
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1443
      GOTO 1567
 1572 CONTINUE
      LINENO = 3548
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1448
      GOTO 1567
 1573 CONTINUE
      LINENO = 3549
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1453
      GOTO 1567
 1574 CONTINUE
      LINENO = 3550
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1460
      GOTO 1567
 1575 CONTINUE
      LINENO = 3551
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1467
      GOTO 1567
 1566 CONTINUE
      CALL P$CHK(INTL(1),INTL(10))
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$XJP($1576)
 1576 CONTINUE
 1577 GOTO 1568
 1578 GOTO 1569
 1579 GOTO 1570
 1580 GOTO 1571
 1581 GOTO 1572
 1582 GOTO 1573
 1583 GOTO 1574
 1584 GOTO 1574
 1585 GOTO 1575
 1586 GOTO 1575
 1567 CONTINUE
      LINENO = 3553
      CALL P$LOD(0,14)
      CALL P$LDC(1,INTL(8))
      CALL P$LEQ(1,1)
      CALL P$FJP($1587)
      LINENO = 3554
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1588)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1589
 1588 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
 1589 CONTINUE
 1587 CONTINUE
 1562 CONTINUE
      GOTO 1590
 1524 CONTINUE
      LINENO = 3557
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1478
 1590 CONTINUE
      CALL P$RET(0)
      RETURN
 1522 CONTINUE
      SG1SIZ = 15
      SG2SIZ = 43
      GOTO 1523
      END

      SUBROUTINE P1595
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1596
99998 CALL P$UJC
 1597 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3582
      CALL P$LDO(1,13028)
      CALL P$LDC(1,INTL(399))
      CALL P$LEQ(1,1)
      CALL P$FJP($1598)
      LINENO = 3583
      CALL P$LAO(12624)
      CALL P$LDO(1,13028)
      CALL P$CHK(INTL(0),INTL(399))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$STO(4)
      LINENO = 3584
      CALL P$LDO(1,13028)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,13028)
      GOTO 1599
 1598 CONTINUE
      LINENO = 3586
      CALL P$MST(9)
      CALL P$LDC(1,INTL(254))
      CALL P$CUP(1)
      CALL P30
 1599 CONTINUE
      CALL P$RET(0)
      RETURN
 1596 CONTINUE
      SG1SIZ = 13
      SG2SIZ = 23
      GOTO 1597
      END

      SUBROUTINE P1594
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1600
99998 CALL P$UJC
 1601 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3590
      CALL P$LDC(1,INTL(7))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32494))
      CALL P$EQU(4,8)
      CALL P$FJP($1602)
      LINENO = 3591
      CALL P$LODA(0,13)
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LODA(0,14)
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      GOTO 1603
 1602 CONTINUE
      LINENO = 3593
      LINENO = 3594
      CALL P$LODA(0,13)
      CALL P$LDC(1,INTL(7))
      CALL P$STO(1)
      CALL P$LODA(0,14)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$STO(1)
      LINENO = 3595
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,16)
      CALL P$LDC(1,INTL(255))
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$STR(0,19)
 1604 CONTINUE
      CALL P$LOD(0,16)
      CALL P$LOD(0,19)
      CALL P$LEQ(1)
      CALL P$FJP($1605)
      LINENO = 3596
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32494))
      CALL P$LDC(1,INTL(0))
      CALL P$STRS(0,18)
      CALL P$LOD(0,16)
      CALL P$LDC(1,INTL(31))
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$MPI
      CALL P$STR(0,17)
      LINENO = 3597
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,15)
      CALL P$LDC(1,INTL(31))
      CALL P$STR(0,20)
 1606 CONTINUE
      CALL P$LOD(0,15)
      CALL P$LOD(0,20)
      CALL P$LEQ(1)
      CALL P$FJP($1607)
      LINENO = 3598
      CALL P$LOD(0,15)
      CALL P$LOD(0,17)
      CALL P$ADI
      CALL P$LDC(1,INTL(7))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$FJP($1608)
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,18)
      CALL P$LOD(0,15)
      CALL P$SGS
      CALL P$UNI
      CALL P$LDC(1,INTL(0))
      CALL P$STRS(0,18)
 1608 CONTINUE
      CALL P$LOD(0,15)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,15)
      GOTO 1606
 1607 CONTINUE
      LINENO = 3599
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,18)
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32494))
      CALL P$NEQ(4,1)
      CALL P$FJP($1609)
      LINENO = 3600
      CALL P$LODA(0,13)
      CALL P$IND(1,0)
      CALL P$LODA(0,14)
      CALL P$IND(1,0)
      CALL P$LEQ(1,1)
      CALL P$LODA(0,14)
      CALL P$IND(1,0)
      CALL P$LOD(0,16)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$LES(1,1)
      CALL P$AND
      CALL P$FJP($1610)
      LINENO = 3601
      CALL P$LODA(0,14)
      CALL P$IND(1,0)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,15)
      CALL P$LOD(0,16)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$STR(0,20)
 1611 CONTINUE
      CALL P$LOD(0,15)
      CALL P$LOD(0,20)
      CALL P$LEQ(1)
      CALL P$FJP($1612)
      CALL P$MST(0)
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32494))
      CALL P$CUP(8)
      CALL P1595
      CALL P$LOD(0,15)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,15)
      GOTO 1611
 1612 CONTINUE
 1610 CONTINUE
      LINENO = 3602
      CALL P$MST(0)
      CALL P$LDC(1,INTL(0))
      CALL P$LODS(0,18)
      CALL P$CUP(8)
      CALL P1595
      LINENO = 3603
      CALL P$LODA(0,14)
      CALL P$LOD(0,16)
      CALL P$STO(1)
      LINENO = 3604
      CALL P$LOD(0,16)
      CALL P$LODA(0,13)
      CALL P$IND(1,0)
      CALL P$LES(1,1)
      CALL P$FJP($1613)
      CALL P$LODA(0,13)
      CALL P$LOD(0,16)
      CALL P$STO(1)
 1613 CONTINUE
 1609 CONTINUE
      CALL P$LOD(0,16)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,16)
      GOTO 1604
 1605 CONTINUE
 1603 CONTINUE
      CALL P$RET(0)
      RETURN
 1600 CONTINUE
      SG1SIZ = 21
      SG2SIZ = 37
      GOTO 1601
      END

      SUBROUTINE P1614
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1615
99998 CALL P$UJC
 1616 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3613
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,0)
      LINENO = 3614
      CALL P$LDO(1,228)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1617)
      LINENO = 3615
      CALL P$LDO(1,230)
      CALL P$LDC(1,INTL(0))
      CALL P$LES(1,1)
      CALL P$LDO(1,230)
      CALL P$LDC(1,INTL(255))
      CALL P$GRT(1,1)
      CALL P$IOR
      CALL P$FJP($1618)
      LINENO = 3617
      CALL P$MST(8)
      CALL P$LDC(1,INTL(304))
      CALL P$CUP(1)
      CALL P30
      LINENO = 3618
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,0)
 1618 CONTINUE
 1617 CONTINUE
      CALL P$RET(1)
      RETURN
 1615 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 11
      GOTO 1616
      END

      SUBROUTINE P1619
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1620
99998 CALL P$UJC
 1621 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3626
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,0)
      LINENO = 3627
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1622)
      LINENO = 3628
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$GRT(1,1)
      CALL P$FJP($1623)
      CALL P$MST(8)
      CALL P$LDC(1,INTL(136))
      CALL P$CUP(1)
      CALL P30
      GOTO 1624
 1623 CONTINUE
      LINENO = 3629
      CALL P$MST(7)
      CALL P$LODA(1,25)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1625)
      LINENO = 3630
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,0)
      GOTO 1626
 1625 CONTINUE
      LINENO = 3631
      CALL P$MST(8)
      CALL P$LDC(1,INTL(137))
      CALL P$CUP(1)
      CALL P30
 1626 CONTINUE
 1624 CONTINUE
 1622 CONTINUE
      CALL P$RET(1)
      RETURN
 1620 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 11
      GOTO 1621
      END

      SUBROUTINE P1593
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1627
99998 CALL P$UJC
 1628 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3636
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,242)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1629)
      LINENO = 3637
      CALL P$MST(7)
      CALL P$LDC(1,INTL(58))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(7)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,242)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
      LINENO = 3638
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1629 CONTINUE
      LINENO = 3640
 1630 CONTINUE
      LINENO = 3640
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,242)
      CALL P$INN
      CALL P$FJP($1631)
      LINENO = 3641
      LINENO = 3642
      CALL P$LDO(1,13)
      GOTO 1632
 1634 CONTINUE
      LINENO = 3644
      CALL P$MST(7)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32494))
      CALL P$LDA(0,13)
      CALL P$CUP(9)
      CALL P337
      LINENO = 3645
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      LINENO = 3646
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($1635)
      LINENO = 3647
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LODA(0,13)
      CALL P$CUP(9)
      CALL P1196
      LINENO = 3648
      CALL P$LDC(1,INTL(2))
      CALL P$SRO(1,228)
      GOTO 1636
 1635 CONTINUE
      LINENO = 3651
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($1637)
      LINENO = 3652
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,33)
      LINENO = 3653
      CALL P$LODA(0,33)
      CALL P$IND(0,4)
      CALL P$SRO(0,227)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,228)
      LINENO = 3654
      CALL P$LAO(229)
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(7))
      CALL P$MOV(2)
      GOTO 1638
 1637 CONTINUE
      LINENO = 3657
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LODA(0,13)
      CALL P$CUP(9)
      CALL P1116
 1638 CONTINUE
 1636 CONTINUE
      GOTO 1633
 1639 CONTINUE
      LINENO = 3660
      LINENO = 3661
      LINENO = 3662
      CALL P$LDO(0,45)
      CALL P$SRO(0,227)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,228)
      LINENO = 3663
      CALL P$LAO(229)
      CALL P$LAO(15)
      CALL P$MOV(2)
      LINENO = 3665
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      GOTO 1633
 1640 CONTINUE
      LINENO = 3668
      LINENO = 3669
      LINENO = 3670
      CALL P$LDO(0,46)
      CALL P$SRO(0,227)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,228)
      LINENO = 3671
      CALL P$LAO(229)
      CALL P$LAO(15)
      CALL P$MOV(2)
      LINENO = 3673
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      GOTO 1633
 1641 CONTINUE
      LINENO = 3676
      LINENO = 3677
      LINENO = 3678
      LINENO = 3679
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1642)
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
      GOTO 1643
 1642 CONTINUE
      LINENO = 3680
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($1644)
      CALL P$LDO(0,47)
      CALL P$SRO(0,227)
      GOTO 1645
 1644 CONTINUE
      LINENO = 3682
      CALL P$LDA(0,25)
      CALL P$LDC(1,INTL(6))
      CALL P$NEW
      LINENO = 3683
      CALL P$LODA(0,25)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,33)
      LINENO = 3684
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(5))
      CALL P$LDO(0,47)
      CALL P$STO(0)
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      LINENO = 3685
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(3,INTL(1))
      CALL P$STO(3)
      LINENO = 3686
      CALL P$LDA(0,24)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 3687
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(4))
      CALL P$LODA(0,24)
      CALL P$STO(0)
      LINENO = 3688
      CALL P$LODA(0,33)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,34)
      LINENO = 3689
      CALL P$LODA(0,34)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 3690
      CALL P$LODA(0,34)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,45)
      CALL P$STO(0)
      LINENO = 3691
      CALL P$LODA(0,34)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 3692
      CALL P$LODA(0,34)
      CALL P$INC(0,INTL(6))
      CALL P$LDO(1,17)
      CALL P$STO(1)
      LINENO = 3694
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(2))
      CALL P$LDO(1,17)
      CALL P$LDC(1,INTL(3))
      CALL P$ADI
      CALL P$LDC(1,INTL(4))
      CALL P$DVI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 3696
      CALL P$LODA(0,25)
      CALL P$SRO(0,227)
 1645 CONTINUE
 1643 CONTINUE
      LINENO = 3698
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,228)
      CALL P$LAO(229)
      CALL P$LAO(15)
      CALL P$MOV(2)
      LINENO = 3700
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      GOTO 1633
 1646 CONTINUE
      LINENO = 3703
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32495))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 3704
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$EQU(1,1)
      CALL P$FJP($1647)
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      GOTO 1648
 1647 CONTINUE
      CALL P$MST(7)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
 1648 CONTINUE
      GOTO 1633
 1649 CONTINUE
      LINENO = 3707
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P1593
      LINENO = 3708
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P979
      CALL P$MST(5)
      CALL P$LDC(1,INTL(19))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3709
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1650)
      LINENO = 3710
      CALL P$LDO(0,227)
      CALL P$LDO(0,48)
      CALL P$NEQ(0,1)
      CALL P$FJP($1651)
      LINENO = 3711
      CALL P$MST(7)
      CALL P$LDC(1,INTL(135))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1651 CONTINUE
 1650 CONTINUE
      GOTO 1633
 1652 CONTINUE
      LINENO = 3714
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32496))
      CALL P$LDC(1,INTL(7))
      CALL P$STRS(0,16)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,15)
      LINENO = 3715
      CALL P$LDA(0,25)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 3716
      CALL P$LODA(0,25)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,33)
      LINENO = 3717
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$STO(1)
      LINENO = 3718
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(11))
      CALL P$EQU(1,1)
      CALL P$FJP($1653)
      LINENO = 3719
      LINENO = 3720
      LINENO = 3721
      CALL P$LODA(0,25)
      CALL P$SRO(0,227)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,228)
      LINENO = 3722
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      GOTO 1654
 1653 CONTINUE
      LINENO = 3725
      LINENO = 3726
 1655 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32496))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 3727
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1619
      CALL P$FJP($1656)
      LINENO = 3728
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$NEQ(1,1)
      CALL P$FJP($1657)
      LINENO = 3729
      LINENO = 3730
      CALL P$LDO(1,228)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1658)
      LINENO = 3731
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1614
      CALL P$NOT
      CALL P$FJP($1659)
      LINENO = 3732
      CALL P$LDC(1,INTL(7))
      CALL P$LODS(0,16)
      CALL P$LDO(1,230)
      CALL P$SGS
      CALL P$UNI
      CALL P$LDC(1,INTL(7))
      CALL P$STRS(0,16)
 1659 CONTINUE
      GOTO 1660
 1658 CONTINUE
      LINENO = 3735
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P979
      LINENO = 3736
      CALL P$MST(5)
      CALL P$LDC(1,INTL(23))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3737
      CALL P$LOD(0,15)
      CALL P$FJP($1661)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1662
 1661 CONTINUE
      LINENO = 3738
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,15)
 1662 CONTINUE
 1660 CONTINUE
      LINENO = 3740
      CALL P$LODA(0,25)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,227)
      CALL P$STO(0)
      GOTO 1663
 1657 CONTINUE
      LINENO = 3742
      LINENO = 3743
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1614
      CALL P$FJP($1664)
      CALL P$LDC(1,INTL(255))
      CALL P$SRO(1,230)
 1664 CONTINUE
      LINENO = 3744
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P979
      LINENO = 3745
      CALL P$LODA(0,25)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,227)
      CALL P$STO(0)
      LINENO = 3746
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      LINENO = 3747
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32497))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 3748
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1619
      CALL P$FJP($1665)
      LINENO = 3749
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1614
      CALL P$FJP($1666)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,230)
 1666 CONTINUE
      LINENO = 3750
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P979
      LINENO = 3751
      CALL P$MST(5)
      CALL P$LDC(1,INTL(59))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1667
 1665 CONTINUE
      LINENO = 3754
      CALL P$MST(5)
      CALL P$LDC(1,INTL(23))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
 1667 CONTINUE
      LINENO = 3755
      CALL P$LOD(0,15)
      CALL P$FJP($1668)
      CALL P$MST(5)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1669
 1668 CONTINUE
      LINENO = 3756
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,15)
 1669 CONTINUE
 1663 CONTINUE
      LINENO = 3758
      CALL P$LODA(0,25)
      CALL P$SRO(0,227)
      GOTO 1670
 1656 CONTINUE
      LINENO = 3760
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1670 CONTINUE
      LINENO = 3761
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(6,16)
      LINENO = 3762
      CALL P$LOD(6,16)
      CALL P$NOT
      CALL P$FJP($1671)
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
 1671 CONTINUE
      LINENO = 3763
      CALL P$LOD(6,16)
      CALL P$FJP($1655)
      LINENO = 3764
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(11))
      CALL P$EQU(1,1)
      CALL P$FJP($1672)
      CALL P$MST(7)
      CALL P$CUP(0)
      CALL P62
      GOTO 1673
 1672 CONTINUE
      CALL P$MST(7)
      CALL P$LDC(1,INTL(12))
      CALL P$CUP(1)
      CALL P30
 1673 CONTINUE
 1654 CONTINUE
      LINENO = 3766
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1674)
      LINENO = 3767
      CALL P$MST(7)
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDA(0,28)
      CALL P$LDA(0,29)
      CALL P$CUP(3)
      CALL P364
      LINENO = 3768
      CALL P$LOD(0,29)
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$LOD(0,28)
      CALL P$LDC(1,INTL(32))
      CALL P$DVI
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,30)
      LINENO = 3769
      CALL P$LOD(0,30)
      CALL P$LDC(1,INTL(8))
      CALL P$GRT(1,1)
      CALL P$FJP($1675)
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      GOTO 1676
 1675 CONTINUE
      LINENO = 3770
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LOD(0,30)
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
 1676 CONTINUE
      LINENO = 3771
      CALL P$LDO(1,13028)
      CALL P$STR(0,30)
      LINENO = 3772
      CALL P$MST(0)
      CALL P$LDC(1,INTL(7))
      CALL P$LODS(0,16)
      CALL P$LDA(0,27)
      CALL P$LDA(0,26)
      CALL P$CUP(10)
      CALL P1594
      LINENO = 3773
      CALL P$LDA(0,14)
      CALL P$LDC(1,INTL(4))
      CALL P$NEW
      LINENO = 3774
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,33)
      LINENO = 3775
      CALL P$LODA(0,33)
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(1))
      CALL P$LOD(0,30)
      CALL P$CHK(INTL(0),INTL(399))
      CALL P$STO(1)
      LINENO = 3776
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(3))
      CALL P$LOD(0,27)
      CALL P$CHK(INTL(0),INTL(7))
      CALL P$STO(1)
      CALL P$LODA(0,33)
      CALL P$INC(0,INTL(2))
      CALL P$LOD(0,26)
      CALL P$CHK(INTL(0),INTL(7))
      CALL P$STO(1)
      LINENO = 3778
      CALL P$LOD(0,15)
      CALL P$FJP($1677)
      LINENO = 3779
      CALL P$LDC(1,INTL(7))
      CALL P$LODS(0,16)
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32498))
      CALL P$NEQ(4,8)
      CALL P$FJP($1678)
      LINENO = 3780
      LINENO = 3781
      CALL P$LODA(0,14)
      CALL P$STRA(0,32)
      LINENO = 3782
      CALL P$MST(5)
      CALL P$LODA(0,25)
      CALL P$LDA(0,31)
      CALL P$CUP(2)
      CALL P965
      LINENO = 3783
      CALL P$MST(5)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      CALL P$LDC(1,INTL(2))
      CALL P$SRO(1,228)
 1678 CONTINUE
      GOTO 1679
 1677 CONTINUE
      LINENO = 3787
      CALL P$LODA(0,14)
      CALL P$SRO(0,230)
 1679 CONTINUE
 1674 CONTINUE
      GOTO 1633
 1632 CONTINUE
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($1680)
 1680 CONTINUE
 1681 GOTO 1634
 1682 GOTO 1639
 1683 GOTO 1640
 1684 GOTO 1641
 1685 GOTO 1649
 1686 GOTO 99998
 1687 GOTO 99998
 1688 GOTO 99998
 1689 GOTO 1646
 1690 GOTO 99998
 1691 GOTO 1652
 1633 CONTINUE
      LINENO = 3791
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1692)
      LINENO = 3792
      CALL P$MST(7)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(7)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,242)
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
 1692 CONTINUE
      GOTO 1630
 1631 CONTINUE
      CALL P$RET(0)
      RETURN
 1627 CONTINUE
      SG1SIZ = 35
      SG2SIZ = 213
      GOTO 1628
      END

      SUBROUTINE P1592
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1693
99998 CALL P$UJC
 1694 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3797
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32498))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1593
      LINENO = 3798
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($1695)
      CALL P$MST(3)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
 1695 CONTINUE
      LINENO = 3799
 1696 CONTINUE
      LINENO = 3799
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($1697)
      LINENO = 3800
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P979
      CALL P$LDA(0,13)
      CALL P$LAO(227)
      CALL P$MOV(5)
      CALL P$LDO(1,14)
      CALL P$STR(0,18)
      LINENO = 3801
      CALL P$MST(6)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32499))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1593
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P979
      CALL P$MST(3)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
      LINENO = 3802
      CALL P$LODA(0,13)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$AND
      CALL P$FJP($1698)
      LINENO = 3803
      CALL P$LOD(0,18)
      GOTO 1699
 1701 CONTINUE
      LINENO = 3804
      CALL P$LODA(0,13)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1702)
      LINENO = 3805
      CALL P$MST(4)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1703
 1702 CONTINUE
      LINENO = 3807
      LINENO = 3808
      CALL P$LODA(0,13)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1704)
      LINENO = 3809
      CALL P$MST(4)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3810
      CALL P$LDO(0,46)
      CALL P$STRA(0,13)
      GOTO 1705
 1704 CONTINUE
      LINENO = 3813
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1706)
      LINENO = 3814
      CALL P$MST(4)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3815
      CALL P$LDO(0,46)
      CALL P$SRO(0,227)
 1706 CONTINUE
 1705 CONTINUE
      LINENO = 3817
      CALL P$LODA(0,13)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1707)
      LINENO = 3818
      CALL P$MST(4)
      CALL P$LDC(1,INTL(16))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1708
 1707 CONTINUE
      LINENO = 3820
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$MST(5)
      CALL P$LODA(0,13)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$AND
      CALL P$FJP($1709)
      LINENO = 3822
      CALL P$MST(4)
      CALL P$LDC(1,INTL(12))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1710
 1709 CONTINUE
      LINENO = 3823
      CALL P$MST(6)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1710 CONTINUE
 1708 CONTINUE
 1703 CONTINUE
      GOTO 1700
 1711 CONTINUE
      LINENO = 3825
      LINENO = 3826
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1712)
      LINENO = 3827
      CALL P$MST(4)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3828
      CALL P$LDO(0,46)
      CALL P$SRO(0,227)
 1712 CONTINUE
      LINENO = 3830
      CALL P$LODA(0,13)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1713)
      LINENO = 3831
      CALL P$MST(4)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3832
      CALL P$LDO(0,46)
      CALL P$STRA(0,13)
 1713 CONTINUE
      LINENO = 3834
      CALL P$LODA(0,13)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1714)
      LINENO = 3835
      CALL P$MST(4)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1715
 1714 CONTINUE
      LINENO = 3836
      CALL P$MST(6)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1715 CONTINUE
      GOTO 1700
 1716 CONTINUE
      LINENO = 3838
      CALL P$LODA(0,13)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1717)
      LINENO = 3839
      CALL P$MST(4)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1718
 1717 CONTINUE
      LINENO = 3840
      CALL P$MST(6)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1718 CONTINUE
      GOTO 1700
 1719 CONTINUE
      LINENO = 3841
      CALL P$LODA(0,13)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1720)
      LINENO = 3842
      CALL P$MST(4)
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1721
 1720 CONTINUE
      LINENO = 3843
      CALL P$MST(6)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1721 CONTINUE
      GOTO 1700
 1722 CONTINUE
      LINENO = 3844
      CALL P$LODA(0,13)
      CALL P$LDO(0,48)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,48)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1723)
      LINENO = 3845
      CALL P$MST(4)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1724
 1723 CONTINUE
      LINENO = 3846
      CALL P$MST(6)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1724 CONTINUE
      GOTO 1700
 1699 CONTINUE
      CALL P$CHK(INTL(0),INTL(4))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($1725)
 1725 CONTINUE
 1726 GOTO 1701
 1727 GOTO 1711
 1728 GOTO 1722
 1729 GOTO 1716
 1730 GOTO 1719
 1700 CONTINUE
      GOTO 1731
 1698 CONTINUE
      LINENO = 3848
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1731 CONTINUE
      GOTO 1696
 1697 CONTINUE
      CALL P$RET(0)
      RETURN
 1693 CONTINUE
      SG1SIZ = 19
      SG2SIZ = 79
      GOTO 1694
      END

      SUBROUTINE P1591
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1732
99998 CALL P$UJC
 1733 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3853
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,19)
      LINENO = 3854
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$LDO(1,14)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32500))
      CALL P$INN
      CALL P$AND
      CALL P$FJP($1734)
      LINENO = 3855
      CALL P$LDO(1,14)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$STR(0,19)
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
 1734 CONTINUE
      LINENO = 3856
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32501))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1592
      LINENO = 3857
      CALL P$LOD(0,19)
      CALL P$FJP($1735)
      LINENO = 3858
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P979
      CALL P$MST(2)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
      LINENO = 3859
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1736)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(17))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1737
 1736 CONTINUE
      LINENO = 3861
      CALL P$LDO(0,227)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($1738)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(18))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1739
 1738 CONTINUE
      LINENO = 3862
      CALL P$MST(5)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1739 CONTINUE
 1737 CONTINUE
 1735 CONTINUE
      LINENO = 3864
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$FJP($1740)
      CALL P$MST(2)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
 1740 CONTINUE
      LINENO = 3865
 1741 CONTINUE
      LINENO = 3865
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(6))
      CALL P$EQU(1,1)
      CALL P$FJP($1742)
      LINENO = 3866
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P979
      CALL P$LDA(0,13)
      CALL P$LAO(227)
      CALL P$MOV(5)
      CALL P$LDO(1,14)
      CALL P$STR(0,18)
      LINENO = 3867
      CALL P$MST(5)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32502))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1592
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P979
      CALL P$MST(2)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
      LINENO = 3868
      CALL P$LODA(0,13)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$AND
      CALL P$FJP($1743)
      LINENO = 3869
      CALL P$LOD(0,18)
      GOTO 1744
 1746 CONTINUE
      LINENO = 3871
      CALL P$LODA(0,13)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1747)
      LINENO = 3872
      CALL P$MST(3)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1748
 1747 CONTINUE
      LINENO = 3874
      LINENO = 3875
      CALL P$LODA(0,13)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1749)
      LINENO = 3876
      CALL P$MST(3)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3877
      CALL P$LDO(0,46)
      CALL P$STRA(0,13)
      GOTO 1750
 1749 CONTINUE
      LINENO = 3880
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1751)
      LINENO = 3881
      CALL P$MST(3)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3882
      CALL P$LDO(0,46)
      CALL P$SRO(0,227)
 1751 CONTINUE
 1750 CONTINUE
      LINENO = 3884
      CALL P$LODA(0,13)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1752)
      LINENO = 3885
      CALL P$MST(3)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1753
 1752 CONTINUE
      LINENO = 3886
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$MST(4)
      CALL P$LODA(0,13)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$AND
      CALL P$FJP($1754)
      LINENO = 3888
      CALL P$MST(3)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1755
 1754 CONTINUE
      LINENO = 3889
      CALL P$MST(5)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1755 CONTINUE
 1753 CONTINUE
 1748 CONTINUE
      GOTO 1745
 1756 CONTINUE
      LINENO = 3892
      CALL P$LODA(0,13)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1757)
      LINENO = 3893
      CALL P$MST(3)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1758
 1757 CONTINUE
      LINENO = 3895
      LINENO = 3896
      CALL P$LODA(0,13)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1759)
      LINENO = 3897
      CALL P$MST(3)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3898
      CALL P$LDO(0,46)
      CALL P$STRA(0,13)
      GOTO 1760
 1759 CONTINUE
      LINENO = 3901
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1761)
      LINENO = 3902
      CALL P$MST(3)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3903
      CALL P$LDO(0,46)
      CALL P$SRO(0,227)
 1761 CONTINUE
 1760 CONTINUE
      LINENO = 3905
      CALL P$LODA(0,13)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1762)
      LINENO = 3906
      CALL P$MST(3)
      CALL P$LDC(1,INTL(22))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1763
 1762 CONTINUE
      LINENO = 3908
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$MST(4)
      CALL P$LODA(0,13)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$AND
      CALL P$FJP($1764)
      LINENO = 3910
      CALL P$MST(3)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1765
 1764 CONTINUE
      LINENO = 3911
      CALL P$MST(5)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1765 CONTINUE
 1763 CONTINUE
 1758 CONTINUE
      GOTO 1745
 1766 CONTINUE
      LINENO = 3914
      CALL P$LODA(0,13)
      CALL P$LDO(0,48)
      CALL P$EQU(0,1)
      CALL P$LDO(0,227)
      CALL P$LDO(0,48)
      CALL P$EQU(0,1)
      CALL P$AND
      CALL P$FJP($1767)
      LINENO = 3915
      CALL P$MST(3)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1768
 1767 CONTINUE
      LINENO = 3916
      CALL P$MST(5)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1768 CONTINUE
      GOTO 1745
 1744 CONTINUE
      CALL P$CHK(INTL(5),INTL(7))
      CALL P$LDC(1,INTL(5))
      CALL P$SBI
      CALL P$XJP($1769)
 1769 CONTINUE
 1770 GOTO 1746
 1771 GOTO 1756
 1772 GOTO 1766
 1745 CONTINUE
      GOTO 1773
 1743 CONTINUE
      LINENO = 3918
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1773 CONTINUE
      GOTO 1741
 1742 CONTINUE
      CALL P$RET(0)
      RETURN
 1732 CONTINUE
      SG1SIZ = 20
      SG2SIZ = 85
      GOTO 1733
      END

      SUBROUTINE P1103
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1774
99998 CALL P$UJC
 1775 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 3923
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32503))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1591
      LINENO = 3924
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(7))
      CALL P$EQU(1,1)
      CALL P$FJP($1776)
      LINENO = 3925
      LINENO = 3926
      CALL P$MST(1)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
      LINENO = 3927
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1777)
      LINENO = 3928
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$LEQ(1,1)
      CALL P$FJP($1778)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      GOTO 1779
 1778 CONTINUE
      LINENO = 3929
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P1022
 1779 CONTINUE
 1777 CONTINUE
      LINENO = 3930
      CALL P$LDA(0,7)
      CALL P$LAO(227)
      CALL P$MOV(5)
      CALL P$LDO(1,14)
      CALL P$STR(0,12)
      LINENO = 3934
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P1591
      LINENO = 3935
      CALL P$MST(1)
      CALL P$LAO(227)
      CALL P$CUP(1)
      CALL P1104
      LINENO = 3936
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1780)
      LINENO = 3937
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$LEQ(1,1)
      CALL P$FJP($1781)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      GOTO 1782
 1781 CONTINUE
      LINENO = 3938
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P1022
 1782 CONTINUE
 1780 CONTINUE
      LINENO = 3939
      CALL P$LODA(0,7)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$AND
      CALL P$FJP($1783)
      LINENO = 3940
      CALL P$LOD(0,12)
      CALL P$LDC(1,INTL(14))
      CALL P$EQU(1,1)
      CALL P$FJP($1784)
      LINENO = 3941
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$EQU(1,1)
      CALL P$FJP($1785)
      LINENO = 3942
      CALL P$MST(3)
      CALL P$LODA(0,7)
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1786)
      LINENO = 3943
      CALL P$MST(2)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 1787
 1786 CONTINUE
      LINENO = 3944
      CALL P$MST(4)
      CALL P$LDC(1,INTL(129))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1787 CONTINUE
      GOTO 1788
 1785 CONTINUE
      LINENO = 3945
      CALL P$MST(4)
      CALL P$LDC(1,INTL(130))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,227)
 1788 CONTINUE
      GOTO 1789
 1784 CONTINUE
      LINENO = 3947
      LINENO = 3948
      CALL P$LODA(0,7)
      CALL P$LDO(0,227)
      CALL P$NEQ(0,1)
      CALL P$FJP($1790)
      LINENO = 3949
      CALL P$LODA(0,7)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1791)
      LINENO = 3950
      CALL P$MST(2)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3951
      CALL P$LDO(0,46)
      CALL P$STRA(0,7)
      GOTO 1792
 1791 CONTINUE
      LINENO = 3954
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($1793)
      LINENO = 3955
      CALL P$MST(2)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 3956
      CALL P$LDO(0,46)
      CALL P$SRO(0,227)
 1793 CONTINUE
 1792 CONTINUE
 1790 CONTINUE
      LINENO = 3958
      CALL P$MST(3)
      CALL P$LODA(0,7)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1794)
      LINENO = 3959
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STR(0,14)
      LINENO = 3960
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      GOTO 1795
 1797 CONTINUE
      LINENO = 3962
      CALL P$LODA(0,7)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($1798)
      CALL P$LDC(1,INTL(2))
      CALL P$STR(0,13)
      GOTO 1799
 1798 CONTINUE
      LINENO = 3964
      CALL P$LODA(0,7)
      CALL P$LDO(0,48)
      CALL P$EQU(0,1)
      CALL P$FJP($1800)
      CALL P$LDC(1,INTL(3))
      CALL P$STR(0,13)
      GOTO 1801
 1800 CONTINUE
      LINENO = 3966
      CALL P$LODA(0,7)
      CALL P$LDO(0,47)
      CALL P$EQU(0,1)
      CALL P$FJP($1802)
      CALL P$LDC(1,INTL(6))
      CALL P$STR(0,13)
      GOTO 1803
 1802 CONTINUE
      LINENO = 3967
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,13)
 1803 CONTINUE
 1801 CONTINUE
 1799 CONTINUE
      GOTO 1796
 1804 CONTINUE
      LINENO = 3969
      LINENO = 3970
      CALL P$LOD(0,12)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32504))
      CALL P$INN
      CALL P$FJP($1805)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(131))
      CALL P$CUP(1)
      CALL P30
 1805 CONTINUE
      LINENO = 3971
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,13)
      GOTO 1796
 1806 CONTINUE
      LINENO = 3974
      CALL P$LOD(0,12)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32505))
      CALL P$INN
      CALL P$FJP($1807)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(132))
      CALL P$CUP(1)
      CALL P30
 1807 CONTINUE
      LINENO = 3975
      CALL P$LDC(1,INTL(4))
      CALL P$STR(0,13)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(15))
      CALL P$NGI
      CALL P$CUP(1)
      CALL P888
      GOTO 1796
 1808 CONTINUE
      LINENO = 3978
      LINENO = 3979
      CALL P$MST(3)
      CALL P$LODA(0,7)
      CALL P$CUP(1)
      CALL P496
      CALL P$NOT
      CALL P$FJP($1809)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
 1809 CONTINUE
      LINENO = 3980
      CALL P$MST(4)
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDA(0,15)
      CALL P$LDA(0,16)
      CALL P$CUP(3)
      CALL P364
      LINENO = 3981
      CALL P$LOD(0,16)
      CALL P$LOD(0,15)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,14)
      LINENO = 3982
      CALL P$LDC(1,INTL(5))
      CALL P$STR(0,13)
      GOTO 1796
 1810 CONTINUE
      LINENO = 3985
      LINENO = 3986
      CALL P$MST(4)
      CALL P$LDC(1,INTL(134))
      CALL P$CUP(1)
      CALL P30
      LINENO = 3987
      CALL P$LDC(1,INTL(5))
      CALL P$STR(0,13)
      GOTO 1796
 1811 CONTINUE
      LINENO = 3990
      CALL P$MST(4)
      CALL P$LDC(1,INTL(133))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,13)
      GOTO 1796
 1795 CONTINUE
      CALL P$CHK(INTL(0),INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($1812)
 1812 CONTINUE
 1813 GOTO 1797
 1814 GOTO 99998
 1815 GOTO 1804
 1816 GOTO 1806
 1817 GOTO 1808
 1818 GOTO 1810
 1819 GOTO 1811
 1796 CONTINUE
      LINENO = 3992
      CALL P$LOD(0,12)
      GOTO 1820
 1822 CONTINUE
      LINENO = 3993
      CALL P$MST(2)
      CALL P$LDC(1,INTL(53))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,13)
      CALL P$LOD(0,14)
      CALL P$CUP(3)
      CALL P903
      GOTO 1821
 1823 CONTINUE
      LINENO = 3994
      CALL P$MST(2)
      CALL P$LDC(1,INTL(52))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,13)
      CALL P$LOD(0,14)
      CALL P$CUP(3)
      CALL P903
      GOTO 1821
 1824 CONTINUE
      LINENO = 3995
      CALL P$MST(2)
      CALL P$LDC(1,INTL(49))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,13)
      CALL P$LOD(0,14)
      CALL P$CUP(3)
      CALL P903
      GOTO 1821
 1825 CONTINUE
      LINENO = 3996
      CALL P$MST(2)
      CALL P$LDC(1,INTL(48))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,13)
      CALL P$LOD(0,14)
      CALL P$CUP(3)
      CALL P903
      GOTO 1821
 1826 CONTINUE
      LINENO = 3997
      CALL P$MST(2)
      CALL P$LDC(1,INTL(55))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,13)
      CALL P$LOD(0,14)
      CALL P$CUP(3)
      CALL P903
      GOTO 1821
 1827 CONTINUE
      LINENO = 3998
      CALL P$MST(2)
      CALL P$LDC(1,INTL(47))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,13)
      CALL P$LOD(0,14)
      CALL P$CUP(3)
      CALL P903
      GOTO 1821
 1820 CONTINUE
      CALL P$CHK(INTL(8),INTL(13))
      CALL P$LDC(1,INTL(8))
      CALL P$SBI
      CALL P$XJP($1828)
 1828 CONTINUE
 1829 GOTO 1822
 1830 GOTO 1823
 1831 GOTO 1825
 1832 GOTO 1824
 1833 GOTO 1826
 1834 GOTO 1827
 1821 CONTINUE
      GOTO 1835
 1794 CONTINUE
      LINENO = 4001
      CALL P$MST(4)
      CALL P$LDC(1,INTL(129))
      CALL P$CUP(1)
      CALL P30
 1835 CONTINUE
 1789 CONTINUE
 1783 CONTINUE
      LINENO = 4003
      CALL P$LDO(0,48)
      CALL P$SRO(0,227)
      CALL P$LDC(1,INTL(2))
      CALL P$SRO(1,228)
 1776 CONTINUE
      CALL P$RET(0)
      RETURN
 1774 CONTINUE
      SG1SIZ = 17
      SG2SIZ = 113
      GOTO 1775
      END

      SUBROUTINE P1836
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1837
99998 CALL P$UJC
 1838 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4011
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32506))
      CALL P$UNI
      CALL P$LODA(0,5)
      CALL P$CUP(9)
      CALL P1116
      LINENO = 4012
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(17))
      CALL P$EQU(1,1)
      CALL P$FJP($1839)
      LINENO = 4013
      LINENO = 4014
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1840)
      LINENO = 4015
      CALL P$LDO(1,229)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$GRT(1,1)
      CALL P$IOR
      CALL P$FJP($1841)
      LINENO = 4016
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P1022
 1841 CONTINUE
 1840 CONTINUE
      LINENO = 4017
      CALL P$LDA(0,6)
      CALL P$LAO(227)
      CALL P$MOV(5)
      LINENO = 4018
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$CUP(8)
      CALL P1103
      LINENO = 4019
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1842)
      LINENO = 4020
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$LEQ(1,1)
      CALL P$FJP($1843)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      GOTO 1844
 1843 CONTINUE
      LINENO = 4021
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P1022
 1844 CONTINUE
 1842 CONTINUE
      LINENO = 4022
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$AND
      CALL P$FJP($1845)
      LINENO = 4023
      LINENO = 4024
      CALL P$MST(3)
      CALL P$LDO(0,46)
      CALL P$LODA(0,6)
      CALL P$CUP(2)
      CALL P460
      CALL P$MST(3)
      CALL P$LDO(0,227)
      CALL P$LDO(0,45)
      CALL P$CUP(2)
      CALL P460
      CALL P$AND
      CALL P$FJP($1846)
      LINENO = 4026
      CALL P$MST(2)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 4027
      CALL P$LDO(0,46)
      CALL P$SRO(0,227)
 1846 CONTINUE
      LINENO = 4029
      CALL P$MST(3)
      CALL P$LODA(0,6)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1847)
      LINENO = 4030
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      GOTO 1848
 1850 CONTINUE
      LINENO = 4032
      LINENO = 4033
      CALL P$MST(2)
      CALL P$LODA(0,6)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P1088
      CALL P$FJP($1851)
      LINENO = 4034
      CALL P$MST(2)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P1081
 1851 CONTINUE
      LINENO = 4035
      CALL P$MST(2)
      CALL P$LDA(0,6)
      CALL P$CUP(1)
      CALL P1004
      GOTO 1849
 1852 CONTINUE
      LINENO = 4037
      LINENO = 4038
      CALL P$LDO(3,38)
      CALL P$LDO(3,37)
      CALL P$AND
      CALL P$FJP($1853)
      LINENO = 4039
      CALL P$MST(2)
      CALL P$LDC(1,INTL(45))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(1,INTL(32767))
      CALL P$LDO(0,49)
      CALL P$CUP(4)
      CALL P959
 1853 CONTINUE
      LINENO = 4040
      CALL P$MST(2)
      CALL P$LDA(0,6)
      CALL P$CUP(1)
      CALL P1004
      GOTO 1849
 1854 CONTINUE
      LINENO = 4042
      CALL P$MST(2)
      CALL P$LDA(0,6)
      CALL P$CUP(1)
      CALL P1004
      GOTO 1849
 1855 CONTINUE
      LINENO = 4044
      CALL P$MST(2)
      CALL P$LDC(1,INTL(40))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$CUP(2)
      CALL P896
      GOTO 1849
 1856 CONTINUE
      LINENO = 4045
      CALL P$MST(4)
      CALL P$LDC(1,INTL(146))
      CALL P$CUP(1)
      CALL P30
      GOTO 1849
 1848 CONTINUE
      CALL P$CHK(INTL(0),INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($1857)
 1857 CONTINUE
 1858 GOTO 1850
 1859 GOTO 1850
 1860 GOTO 1852
 1861 GOTO 1854
 1862 GOTO 1855
 1863 GOTO 1855
 1864 GOTO 1856
 1849 CONTINUE
      GOTO 1865
 1847 CONTINUE
      LINENO = 4047
      CALL P$MST(4)
      CALL P$LDC(1,INTL(129))
      CALL P$CUP(1)
      CALL P30
 1865 CONTINUE
 1845 CONTINUE
      GOTO 1866
 1839 CONTINUE
      LINENO = 4050
      CALL P$MST(4)
      CALL P$LDC(1,INTL(51))
      CALL P$CUP(1)
      CALL P30
 1866 CONTINUE
      CALL P$RET(0)
      RETURN
 1837 CONTINUE
      SG1SIZ = 11
      SG2SIZ = 75
      GOTO 1838
      END

      SUBROUTINE P1867
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1868
99998 CALL P$UJC
 1869 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4056
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($1870)
      LINENO = 4057
      LINENO = 4058
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,6)
      LINENO = 4059
      CALL P$LDO(1,64)
      CALL P$STR(0,8)
      LINENO = 4060
 1871 CONTINUE
      LINENO = 4060
      CALL P$LAO(65)
      CALL P$LOD(0,8)
      CALL P$IXA(6)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($1872)
      CALL P$LOD(0,8)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$STR(0,8)
      GOTO 1871
 1872 CONTINUE
      LINENO = 4061
      CALL P$LOD(0,8)
      CALL P$STR(0,7)
      LINENO = 4062
 1873 CONTINUE
      LINENO = 4063
      CALL P$LAO(65)
      CALL P$LOD(0,8)
      CALL P$IXA(6)
      CALL P$IND(0,1)
      CALL P$STRA(0,5)
      LINENO = 4064
 1874 CONTINUE
      LINENO = 4064
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LOD(0,6)
      CALL P$NOT
      CALL P$AND
      CALL P$FJP($1875)
      LINENO = 4065
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,10)
      LINENO = 4066
      CALL P$LODA(0,10)
      CALL P$IND(1,3)
      CALL P$LDO(1,16)
      CALL P$EQU(1,1)
      CALL P$FJP($1876)
      LINENO = 4067
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,6)
      LINENO = 4068
      CALL P$LOD(0,8)
      CALL P$LOD(0,7)
      CALL P$EQU(1,1)
      CALL P$FJP($1877)
      LINENO = 4069
      CALL P$MST(2)
      CALL P$LDC(1,INTL(57))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,10)
      CALL P$IND(1,2)
      CALL P$CUP(2)
      CALL P1055
      CALL P$MST(4)
      CALL P$LDA(0,9)
      CALL P$CUP(1)
      CALL P412
      LINENO = 4070
      CALL P$MST(2)
      CALL P$LOD(0,9)
      CALL P$CUP(1)
      CALL P1097
      GOTO 1878
 1877 CONTINUE
      LINENO = 4071
      CALL P$MST(4)
      CALL P$LDC(1,INTL(399))
      CALL P$CUP(1)
      CALL P30
 1878 CONTINUE
      GOTO 1879
 1876 CONTINUE
      LINENO = 4073
      CALL P$LODA(0,10)
      CALL P$IND(0,0)
      CALL P$STRA(0,5)
 1879 CONTINUE
      GOTO 1874
 1875 CONTINUE
      LINENO = 4074
      CALL P$LOD(0,8)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$STR(0,8)
      LINENO = 4075
      CALL P$LOD(0,6)
      CALL P$LOD(0,8)
      CALL P$LDC(1,INTL(0))
      CALL P$LEQ(1,1)
      CALL P$IOR
      CALL P$FJP($1873)
      LINENO = 4076
      CALL P$LOD(0,6)
      CALL P$NOT
      CALL P$FJP($1880)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(167))
      CALL P$CUP(1)
      CALL P30
 1880 CONTINUE
      LINENO = 4077
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1881
 1870 CONTINUE
      LINENO = 4079
      CALL P$MST(4)
      CALL P$LDC(1,INTL(15))
      CALL P$CUP(1)
      CALL P30
 1881 CONTINUE
      CALL P$RET(0)
      RETURN
 1868 CONTINUE
      SG1SIZ = 11
      SG2SIZ = 21
      GOTO 1869
      END

      SUBROUTINE P1882
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1883
99998 CALL P$UJC
 1884 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4084
 1885 CONTINUE
      LINENO = 4085
 1886 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32507))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1101
      LINENO = 4086
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1886)
      LINENO = 4087
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$NEQ(1,1)
      CALL P$STR(3,16)
      LINENO = 4088
      CALL P$LOD(3,16)
      CALL P$NOT
      CALL P$FJP($1887)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
 1887 CONTINUE
      LINENO = 4089
      CALL P$LOD(3,16)
      CALL P$FJP($1885)
      LINENO = 4090
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(39))
      CALL P$EQU(1,1)
      CALL P$FJP($1888)
      LINENO = 4091
      CALL P$LDO(1,28)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$SRO(1,28)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1889
 1888 CONTINUE
      LINENO = 4092
      CALL P$MST(4)
      CALL P$LDC(1,INTL(13))
      CALL P$CUP(1)
      CALL P30
 1889 CONTINUE
      CALL P$RET(0)
      RETURN
 1883 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 39
      GOTO 1884
      END

      SUBROUTINE P1890
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1891
99998 CALL P$UJC
 1892 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4097
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32509))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 4098
      CALL P$MST(4)
      CALL P$LDA(0,6)
      CALL P$CUP(1)
      CALL P412
      CALL P$MST(2)
      CALL P$LOD(0,6)
      CALL P$CUP(1)
      CALL P1049
      LINENO = 4099
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(51))
      CALL P$EQU(1,1)
      CALL P$FJP($1893)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1894
 1893 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(52))
      CALL P$CUP(1)
      CALL P30
 1894 CONTINUE
      LINENO = 4100
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32510))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1101
      LINENO = 4101
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(40))
      CALL P$EQU(1,1)
      CALL P$FJP($1895)
      LINENO = 4102
      CALL P$MST(4)
      CALL P$LDA(0,5)
      CALL P$CUP(1)
      CALL P412
      CALL P$MST(2)
      CALL P$LDC(1,INTL(57))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,5)
      CALL P$CUP(2)
      CALL P1055
      LINENO = 4103
      CALL P$MST(2)
      CALL P$LOD(0,6)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4104
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$CUP(8)
      CALL P1101
      LINENO = 4105
      CALL P$MST(2)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P1097
      GOTO 1896
 1895 CONTINUE
      LINENO = 4107
      CALL P$MST(2)
      CALL P$LOD(0,6)
      CALL P$CUP(1)
      CALL P1097
 1896 CONTINUE
      CALL P$RET(0)
      RETURN
 1891 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 71
      GOTO 1892
      END

      SUBROUTINE P1897
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1899
99998 CALL P$UJC
 1900 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4120
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32511))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 4121
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      LINENO = 4122
      CALL P$LDO(0,227)
      CALL P$STRA(0,6)
      LINENO = 4123
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1901)
      LINENO = 4124
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$GRT(1,1)
      CALL P$LODA(0,6)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$IOR
      CALL P$FJP($1902)
      LINENO = 4125
      CALL P$MST(4)
      CALL P$LDC(1,INTL(144))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,6)
 1902 CONTINUE
 1901 CONTINUE
      LINENO = 4126
      CALL P$MST(4)
      CALL P$LDA(0,16)
      CALL P$CUP(1)
      CALL P412
      LINENO = 4127
      CALL P$MST(2)
      CALL P$LDC(1,INTL(57))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,16)
      CALL P$CUP(2)
      CALL P1055
      LINENO = 4128
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(47))
      CALL P$EQU(1,1)
      CALL P$FJP($1903)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1904
 1903 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(8))
      CALL P$CUP(1)
      CALL P30
 1904 CONTINUE
      LINENO = 4129
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,10)
      CALL P$MST(4)
      CALL P$LDA(0,17)
      CALL P$CUP(1)
      CALL P412
      LINENO = 4130
 1905 CONTINUE
      LINENO = 4131
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,7)
      CALL P$MST(4)
      CALL P$LDA(0,15)
      CALL P$CUP(1)
      CALL P412
      LINENO = 4132
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32513))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1906)
      LINENO = 4133
      LINENO = 4134
 1907 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32515))
      CALL P$UNI
      CALL P$LDA(0,5)
      CALL P$LDA(0,11)
      CALL P$CUP(10)
      CALL P423
      LINENO = 4135
      CALL P$LODA(0,6)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1908)
      LINENO = 4136
      CALL P$MST(3)
      CALL P$LODA(0,6)
      CALL P$LODA(0,5)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1909)
      LINENO = 4137
      CALL P$LODA(0,10)
      CALL P$STRA(0,9)
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,8)
      LINENO = 4138
 1910 CONTINUE
      LINENO = 4138
      CALL P$LODA(0,9)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1911)
      LINENO = 4139
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,18)
      LINENO = 4140
      LINENO = 4141
      CALL P$LODA(0,18)
      CALL P$IND(1,2)
      CALL P$LOD(0,12)
      CALL P$LEQ(1,1)
      CALL P$FJP($1912)
      LINENO = 4142
      CALL P$LODA(0,18)
      CALL P$IND(1,2)
      CALL P$LOD(0,12)
      CALL P$EQU(1,1)
      CALL P$FJP($1913)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(156))
      CALL P$CUP(1)
      CALL P30
 1913 CONTINUE
      LINENO = 4143
      GOTO 1898
 1914 CONTINUE
 1912 CONTINUE
      LINENO = 4145
      CALL P$LODA(0,9)
      CALL P$STRA(0,8)
      CALL P$LODA(0,18)
      CALL P$IND(0,0)
      CALL P$STRA(0,9)
      GOTO 1910
 1911 CONTINUE
 1898 CONTINUE
      LINENO = 4147
      CALL P$LDA(0,7)
      CALL P$LDC(1,INTL(3))
      CALL P$NEW
      LINENO = 4148
      CALL P$LODA(0,7)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,18)
      LINENO = 4149
      CALL P$LODA(0,18)
      CALL P$LODA(0,9)
      CALL P$STO(0)
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(2))
      CALL P$LOD(0,12)
      CALL P$STO(1)
      LINENO = 4150
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(1))
      CALL P$LOD(0,15)
      CALL P$STO(1)
      LINENO = 4152
      CALL P$LODA(0,8)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($1915)
      CALL P$LODA(0,7)
      CALL P$STRA(0,10)
      GOTO 1916
 1915 CONTINUE
      LINENO = 4153
      CALL P$LODA(0,8)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LODA(0,7)
      CALL P$STO(0)
 1916 CONTINUE
      GOTO 1917
 1909 CONTINUE
      LINENO = 4155
      CALL P$MST(4)
      CALL P$LDC(1,INTL(147))
      CALL P$CUP(1)
      CALL P30
 1917 CONTINUE
 1908 CONTINUE
      LINENO = 4156
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(3,16)
      LINENO = 4157
      CALL P$LOD(3,16)
      CALL P$NOT
      CALL P$FJP($1918)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
 1918 CONTINUE
      LINENO = 4158
      CALL P$LOD(3,16)
      CALL P$FJP($1907)
      LINENO = 4159
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($1919)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1920
 1919 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
 1920 CONTINUE
      LINENO = 4160
      CALL P$MST(2)
      CALL P$LOD(0,15)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4161
 1921 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32516))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1101
      LINENO = 4162
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1921)
      LINENO = 4163
      CALL P$LODA(0,7)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1922)
      LINENO = 4164
      CALL P$MST(2)
      CALL P$LDC(1,INTL(57))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,17)
      CALL P$CUP(2)
      CALL P1055
 1922 CONTINUE
 1906 CONTINUE
      LINENO = 4166
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$NEQ(1,1)
      CALL P$STR(3,16)
      LINENO = 4167
      CALL P$LOD(3,16)
      CALL P$NOT
      CALL P$FJP($1923)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
 1923 CONTINUE
      LINENO = 4168
      CALL P$LOD(3,16)
      CALL P$FJP($1905)
      LINENO = 4169
      CALL P$MST(2)
      CALL P$LOD(0,16)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4170
      CALL P$LODA(0,10)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1924)
      LINENO = 4171
      CALL P$LODA(0,10)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STR(0,13)
      LINENO = 4173
      CALL P$LODA(0,10)
      CALL P$STRA(0,9)
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,10)
      LINENO = 4174
 1925 CONTINUE
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,0)
      CALL P$STRA(0,8)
      CALL P$LODA(0,9)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LODA(0,10)
      CALL P$STO(0)
      LINENO = 4175
      CALL P$LODA(0,9)
      CALL P$STRA(0,10)
      CALL P$LODA(0,8)
      CALL P$STRA(0,9)
      LINENO = 4176
      CALL P$LODA(0,9)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($1925)
      LINENO = 4177
      CALL P$LODA(0,10)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$STR(0,14)
      LINENO = 4178
      CALL P$LOD(0,13)
      CALL P$LOD(0,14)
      CALL P$SBI
      CALL P$LDC(1,INTL(1000))
      CALL P$LES(1,1)
      CALL P$FJP($1926)
      LINENO = 4179
      LINENO = 4180
      CALL P$MST(2)
      CALL P$LDC(1,INTL(45))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,14)
      CALL P$LOD(0,13)
      CALL P$LDO(0,45)
      CALL P$CUP(4)
      CALL P959
      LINENO = 4181
      CALL P$MST(2)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,14)
      CALL P$LDO(0,45)
      CALL P$CUP(3)
      CALL P953
      CALL P$MST(2)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      CALL P$MST(4)
      CALL P$LDA(0,16)
      CALL P$CUP(1)
      CALL P412
      LINENO = 4182
      CALL P$MST(2)
      CALL P$LDC(1,INTL(44))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,16)
      CALL P$CUP(2)
      CALL P1055
      CALL P$MST(2)
      CALL P$LOD(0,16)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4183
 1927 CONTINUE
      LINENO = 4184
      CALL P$LODA(0,10)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,18)
      LINENO = 4185
      LINENO = 4186
      CALL P$LDO(3,33)
      CALL P$FJP($1928)
      LINENO = 4187
 1929 CONTINUE
      LINENO = 4187
      CALL P$LODA(0,18)
      CALL P$IND(1,2)
      CALL P$LOD(0,14)
      CALL P$GRT(1,1)
      CALL P$FJP($1930)
      LINENO = 4188
      CALL P$MST(4)
      CALL P$LDA(0,16)
      CALL P$CUP(1)
      CALL P412
      LINENO = 4189
      CALL P$LAO(11)
      CALL P$LOD(0,16)
      CALL P$LDC(1,INTL(5))
      CALL P$WRI
      CALL P$LCA(26494)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      CALL P$WLN
      LINENO = 4190
      CALL P$LOD(0,14)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,14)
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      GOTO 1929
 1930 CONTINUE
      LINENO = 4192
      CALL P$MST(4)
      CALL P$LDA(0,16)
      CALL P$CUP(1)
      CALL P412
      LINENO = 4193
      CALL P$LAO(11)
      CALL P$LOD(0,16)
      CALL P$LDC(1,INTL(5))
      CALL P$WRI
      CALL P$LCA(26497)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LODA(0,18)
      CALL P$IND(1,1)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4194
      CALL P$LOD(0,14)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$STR(0,14)
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 1928 CONTINUE
      LINENO = 4195
      CALL P$LODA(0,18)
      CALL P$IND(0,0)
      CALL P$STRA(0,10)
      LINENO = 4197
      CALL P$LODA(0,10)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($1927)
      LINENO = 4198
      CALL P$MST(2)
      CALL P$LOD(0,17)
      CALL P$CUP(1)
      CALL P1097
      GOTO 1931
 1926 CONTINUE
      LINENO = 4200
      CALL P$MST(4)
      CALL P$LDC(1,INTL(157))
      CALL P$CUP(1)
      CALL P30
 1931 CONTINUE
 1924 CONTINUE
      LINENO = 4202
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(39))
      CALL P$EQU(1,1)
      CALL P$FJP($1932)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1933
 1932 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(13))
      CALL P$CUP(1)
      CALL P30
 1933 CONTINUE
      CALL P$RET(0)
      RETURN
 1899 CONTINUE
      SG1SIZ = 19
      SG2SIZ = 123
      GOTO 1900
      END

      SUBROUTINE P1934
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1935
99998 CALL P$UJC
 1936 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4211
      CALL P$LDO(1,29)
      CALL P$LDO(1,25)
      CALL P$NEQ(1,1)
      CALL P$FJP($1937)
      LINENO = 4212
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26499)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LDO(1,25)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4213
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 4214
      CALL P$LDO(1,25)
      CALL P$SRO(1,29)
 1937 CONTINUE
      CALL P$RET(0)
      RETURN
 1935 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 13
      GOTO 1936
      END

      SUBROUTINE P1938
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1939
99998 CALL P$UJC
 1940 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4220
      CALL P$MST(4)
      CALL P$LDA(0,5)
      CALL P$CUP(1)
      CALL P412
      CALL P$MST(2)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4221
 1941 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32517))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1101
      LINENO = 4222
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$INN
      CALL P$FJP($1942)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
 1942 CONTINUE
      LINENO = 4223
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1941)
      LINENO = 4224
 1943 CONTINUE
      LINENO = 4224
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$EQU(1,1)
      CALL P$FJP($1944)
      LINENO = 4225
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      LINENO = 4226
 1945 CONTINUE
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32519))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1101
      LINENO = 4227
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$INN
      CALL P$FJP($1946)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
 1946 CONTINUE
      LINENO = 4228
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($1945)
      GOTO 1943
 1944 CONTINUE
      LINENO = 4230
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(46))
      CALL P$EQU(1,1)
      CALL P$FJP($1947)
      LINENO = 4231
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      LINENO = 4232
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P1934
      LINENO = 4233
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$CUP(8)
      CALL P1103
      CALL P$MST(2)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P1049
      GOTO 1948
 1947 CONTINUE
      LINENO = 4235
      CALL P$MST(4)
      CALL P$LDC(1,INTL(53))
      CALL P$CUP(1)
      CALL P30
 1948 CONTINUE
      CALL P$RET(0)
      RETURN
 1939 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 65
      GOTO 1940
      END

      SUBROUTINE P1949
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1950
99998 CALL P$UJC
 1951 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4240
      CALL P$MST(4)
      CALL P$LDA(0,6)
      CALL P$CUP(1)
      CALL P412
      CALL P$MST(2)
      CALL P$LOD(0,6)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4241
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26502)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LDO(1,25)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 4242
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32521))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      CALL P$MST(4)
      CALL P$LDA(0,5)
      CALL P$CUP(1)
      CALL P412
      CALL P$MST(2)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P1049
      LINENO = 4243
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(48))
      CALL P$EQU(1,1)
      CALL P$FJP($1952)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1953
 1952 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(54))
      CALL P$CUP(1)
      CALL P30
 1953 CONTINUE
      LINENO = 4244
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$CUP(8)
      CALL P1101
      CALL P$MST(2)
      CALL P$LDC(1,INTL(57))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,6)
      CALL P$CUP(2)
      CALL P1055
      CALL P$MST(2)
      CALL P$LOD(0,5)
      CALL P$CUP(1)
      CALL P1097
      CALL P$RET(0)
      RETURN
 1950 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 53
      GOTO 1951
      END

      SUBROUTINE P1954
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1955
99998 CALL P$UJC
 1956 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4251
      CALL P$LDO(1,23)
      CALL P$STR(0,14)
      LINENO = 4252
      LINENO = 4253
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,6)
      LINENO = 4254
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,7)
      CALL P$LDO(1,62)
      CALL P$STR(0,8)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,9)
      LINENO = 4256
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1957)
      LINENO = 4257
      CALL P$MST(4)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32522))
      CALL P$LDA(1,13)
      CALL P$CUP(9)
      CALL P337
      LINENO = 4258
      CALL P$LODA(1,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,15)
      LINENO = 4259
      CALL P$LODA(0,15)
      CALL P$IND(0,4)
      CALL P$STRA(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,6)
      LINENO = 4260
      CALL P$LODA(0,15)
      CALL P$IND(1,7)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1958)
      LINENO = 4261
      CALL P$LDC(1,INTL(0))
      CALL P$STR(0,7)
      CALL P$LODA(0,15)
      CALL P$IND(1,8)
      CALL P$STR(0,8)
      LINENO = 4262
      CALL P$LODA(0,15)
      CALL P$IND(1,9)
      CALL P$STR(0,9)
      GOTO 1959
 1958 CONTINUE
      LINENO = 4264
      CALL P$MST(4)
      CALL P$LDC(1,INTL(155))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,5)
 1959 CONTINUE
      LINENO = 4266
      CALL P$LODA(0,5)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1960)
      LINENO = 4267
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$GRT(1,1)
      CALL P$MST(3)
      CALL P$LDO(0,46)
      CALL P$LODA(0,5)
      CALL P$CUP(2)
      CALL P460
      CALL P$IOR
      CALL P$FJP($1961)
      LINENO = 4269
      CALL P$MST(4)
      CALL P$LDC(1,INTL(143))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,5)
 1961 CONTINUE
 1960 CONTINUE
      LINENO = 4270
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1962
 1957 CONTINUE
      LINENO = 4273
      CALL P$MST(4)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32523))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
 1962 CONTINUE
      LINENO = 4274
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(17))
      CALL P$EQU(1,1)
      CALL P$FJP($1963)
      LINENO = 4275
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32525))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 4276
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1964)
      LINENO = 4277
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$GRT(1,1)
      CALL P$FJP($1965)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(144))
      CALL P$CUP(1)
      CALL P30
      GOTO 1966
 1965 CONTINUE
      LINENO = 4279
      CALL P$MST(3)
      CALL P$LODA(0,5)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1967)
      LINENO = 4280
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      CALL P$MST(2)
      CALL P$LDA(0,5)
      CALL P$CUP(1)
      CALL P1004
      GOTO 1968
 1967 CONTINUE
      LINENO = 4281
      CALL P$MST(4)
      CALL P$LDC(1,INTL(145))
      CALL P$CUP(1)
      CALL P30
 1968 CONTINUE
 1966 CONTINUE
 1964 CONTINUE
      GOTO 1969
 1963 CONTINUE
      LINENO = 4284
      CALL P$MST(4)
      CALL P$LDC(1,INTL(51))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32526))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
 1969 CONTINUE
      LINENO = 4285
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32527))
      CALL P$INN
      CALL P$FJP($1970)
      LINENO = 4286
      CALL P$LDO(1,13)
      CALL P$STR(0,11)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32528))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1103
      LINENO = 4287
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1971)
      LINENO = 4288
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(1))
      CALL P$GRT(1,1)
      CALL P$FJP($1972)
      CALL P$MST(4)
      CALL P$LDC(1,INTL(144))
      CALL P$CUP(1)
      CALL P30
      GOTO 1973
 1972 CONTINUE
      LINENO = 4290
      CALL P$MST(3)
      CALL P$LODA(0,5)
      CALL P$LDO(0,227)
      CALL P$CUP(2)
      CALL P460
      CALL P$FJP($1974)
      LINENO = 4291
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      LINENO = 4292
      CALL P$MST(2)
      CALL P$LDC(1,INTL(56))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$LDO(1,23)
      CALL P$LDO(0,227)
      CALL P$CUP(4)
      CALL P959
      LINENO = 4293
      CALL P$MST(4)
      CALL P$LDA(0,12)
      CALL P$CUP(1)
      CALL P412
      CALL P$MST(2)
      CALL P$LOD(0,12)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4294
      CALL P$LAO(227)
      CALL P$LDA(0,5)
      CALL P$MOV(5)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      LINENO = 4295
      CALL P$MST(2)
      CALL P$LDC(1,INTL(54))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$LDO(1,23)
      CALL P$LDO(0,227)
      CALL P$CUP(4)
      CALL P959
      LINENO = 4296
      CALL P$LDO(1,23)
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,23)
      LINENO = 4297
      CALL P$LDO(1,23)
      CALL P$LOD(2,23)
      CALL P$GRT(1,1)
      CALL P$FJP($1975)
      CALL P$LDO(1,23)
      CALL P$STR(2,23)
 1975 CONTINUE
      LINENO = 4298
      CALL P$LOD(0,11)
      CALL P$LDC(1,INTL(49))
      CALL P$EQU(1,1)
      CALL P$FJP($1976)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(52))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$CUP(2)
      CALL P896
      GOTO 1977
 1976 CONTINUE
      LINENO = 4299
      CALL P$MST(2)
      CALL P$LDC(1,INTL(48))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$CUP(2)
      CALL P896
 1977 CONTINUE
      GOTO 1978
 1974 CONTINUE
      LINENO = 4301
      CALL P$MST(4)
      CALL P$LDC(1,INTL(145))
      CALL P$CUP(1)
      CALL P30
 1978 CONTINUE
 1973 CONTINUE
 1971 CONTINUE
      GOTO 1979
 1970 CONTINUE
      LINENO = 4303
      CALL P$MST(4)
      CALL P$LDC(1,INTL(55))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(4)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32529))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P307
 1979 CONTINUE
      LINENO = 4304
      CALL P$MST(4)
      CALL P$LDA(0,13)
      CALL P$CUP(1)
      CALL P412
      CALL P$MST(2)
      CALL P$LDC(1,INTL(33))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,13)
      CALL P$CUP(2)
      CALL P1055
      LINENO = 4305
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(48))
      CALL P$EQU(1,1)
      CALL P$FJP($1980)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1981
 1980 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(54))
      CALL P$CUP(1)
      CALL P30
 1981 CONTINUE
      LINENO = 4306
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$CUP(8)
      CALL P1101
      LINENO = 4307
      CALL P$LAO(227)
      CALL P$LDA(0,5)
      CALL P$MOV(5)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P979
      LINENO = 4308
      CALL P$LOD(0,11)
      CALL P$LDC(1,INTL(49))
      CALL P$EQU(1,1)
      CALL P$FJP($1982)
      CALL P$MST(2)
      CALL P$LDC(1,INTL(34))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(0,227)
      CALL P$CUP(3)
      CALL P953
      GOTO 1983
 1982 CONTINUE
      LINENO = 4309
      CALL P$MST(2)
      CALL P$LDC(1,INTL(31))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(0,227)
      CALL P$CUP(3)
      CALL P953
 1983 CONTINUE
      LINENO = 4310
      CALL P$MST(2)
      CALL P$LDA(0,5)
      CALL P$CUP(1)
      CALL P1004
      CALL P$MST(2)
      CALL P$LDC(1,INTL(57))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LOD(0,12)
      CALL P$CUP(2)
      CALL P1055
      CALL P$MST(2)
      CALL P$LOD(0,13)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4311
      CALL P$LOD(0,14)
      CALL P$SRO(1,23)
      CALL P$RET(0)
      RETURN
 1955 CONTINUE
      SG1SIZ = 16
      SG2SIZ = 203
      GOTO 1956
      END

      SUBROUTINE P1984
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 1985
99998 CALL P$UJC
 1986 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4317
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$STR(0,6)
      CALL P$LDO(1,23)
      CALL P$STR(0,7)
      LINENO = 4318
 1987 CONTINUE
      LINENO = 4319
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1988)
      LINENO = 4320
      CALL P$MST(4)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32530))
      CALL P$LDA(0,5)
      CALL P$CUP(9)
      CALL P337
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 1989
 1988 CONTINUE
      LINENO = 4321
      CALL P$MST(4)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
      CALL P$LDO(0,53)
      CALL P$STRA(0,5)
 1989 CONTINUE
      LINENO = 4322
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32531))
      CALL P$UNI
      CALL P$LODA(0,5)
      CALL P$CUP(9)
      CALL P1116
      LINENO = 4323
      CALL P$LDO(0,227)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($1990)
      LINENO = 4324
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(5))
      CALL P$EQU(1,1)
      CALL P$FJP($1991)
      LINENO = 4325
      CALL P$LDO(1,64)
      CALL P$LDC(1,INTL(20))
      CALL P$LES(1,1)
      CALL P$FJP($1992)
      LINENO = 4326
      CALL P$LDO(1,64)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$SRO(1,64)
      CALL P$LOD(0,6)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$STR(0,6)
      LINENO = 4327
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$STRA(0,8)
      LINENO = 4328
      CALL P$LODA(0,8)
      CALL P$LDO(0,227)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$STO(0)
      LINENO = 4329
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 4331
      CALL P$LDO(1,229)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($1993)
      LINENO = 4332
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$STRA(0,8)
      LINENO = 4333
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(1,230)
      CALL P$STO(1)
      LINENO = 4334
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(5))
      CALL P$LDO(1,231)
      CALL P$STO(1)
      GOTO 1994
 1993 CONTINUE
      LINENO = 4337
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P1022
      LINENO = 4338
      CALL P$MST(4)
      CALL P$LDO(0,49)
      CALL P$LAO(23)
      CALL P$CUP(2)
      CALL P409
      LINENO = 4339
      CALL P$MST(2)
      CALL P$LDC(1,INTL(56))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$LDO(1,23)
      CALL P$LDO(0,49)
      CALL P$CUP(4)
      CALL P959
      LINENO = 4340
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$STRA(0,8)
      LINENO = 4341
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(1,23)
      CALL P$STO(1)
      LINENO = 4342
      CALL P$LDO(1,23)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,23)
      LINENO = 4343
      CALL P$LDO(1,23)
      CALL P$LOD(2,23)
      CALL P$GRT(1,1)
      CALL P$FJP($1995)
      CALL P$LDO(1,23)
      CALL P$STR(2,23)
 1995 CONTINUE
 1994 CONTINUE
      GOTO 1996
 1992 CONTINUE
      LINENO = 4346
      CALL P$MST(4)
      CALL P$LDC(1,INTL(250))
      CALL P$CUP(1)
      CALL P30
 1996 CONTINUE
      GOTO 1997
 1991 CONTINUE
      LINENO = 4347
      CALL P$MST(4)
      CALL P$LDC(1,INTL(140))
      CALL P$CUP(1)
      CALL P30
 1997 CONTINUE
 1990 CONTINUE
      LINENO = 4348
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$STR(3,16)
      LINENO = 4349
      CALL P$LOD(3,16)
      CALL P$NOT
      CALL P$FJP($1998)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
 1998 CONTINUE
      LINENO = 4350
      CALL P$LOD(3,16)
      CALL P$FJP($1987)
      LINENO = 4351
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(48))
      CALL P$EQU(1,1)
      CALL P$FJP($1999)
      CALL P$MST(4)
      CALL P$CUP(0)
      CALL P62
      GOTO 2000
 1999 CONTINUE
      CALL P$MST(4)
      CALL P$LDC(1,INTL(54))
      CALL P$CUP(1)
      CALL P30
 2000 CONTINUE
      LINENO = 4352
      CALL P$MST(2)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(1,5)
      CALL P$CUP(8)
      CALL P1101
      LINENO = 4353
      CALL P$LDO(1,64)
      CALL P$LOD(0,6)
      CALL P$SBI
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$SRO(1,64)
      CALL P$LOD(0,7)
      CALL P$SRO(1,23)
      CALL P$RET(0)
      RETURN
 1985 CONTINUE
      SG1SIZ = 9
      SG2SIZ = 81
      GOTO 1986
      END

      SUBROUTINE P1101
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2001
99998 CALL P$UJC
 2002 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4357
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,17)
      LINENO = 4362
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$EQU(1,1)
      CALL P$FJP($2003)
      LINENO = 4363
      CALL P$LAO(65)
      CALL P$LDO(1,62)
      CALL P$IXA(6)
      CALL P$IND(0,1)
      CALL P$STRA(0,14)
      LINENO = 4364
 2004 CONTINUE
      LINENO = 4364
      CALL P$LODA(0,14)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2005)
      LINENO = 4365
      CALL P$LODA(0,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,18)
      LINENO = 4366
      CALL P$LODA(0,18)
      CALL P$IND(1,3)
      CALL P$LDO(1,16)
      CALL P$EQU(1,1)
      CALL P$FJP($2006)
      LINENO = 4367
      CALL P$LODA(0,18)
      CALL P$IND(3,1)
      CALL P$FJP($2007)
      CALL P$MST(3)
      CALL P$LDC(1,INTL(165))
      CALL P$CUP(1)
      CALL P30
 2007 CONTINUE
      LINENO = 4368
      CALL P$MST(1)
      CALL P$LODA(0,18)
      CALL P$IND(1,2)
      CALL P$CUP(1)
      CALL P1097
      CALL P$LODA(0,18)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(3,INTL(1))
      CALL P$STO(3)
      LINENO = 4369
      GOTO 1102
 2008 CONTINUE
      GOTO 2009
 2006 CONTINUE
      LINENO = 4371
      CALL P$LODA(0,18)
      CALL P$IND(0,0)
      CALL P$STRA(0,14)
 2009 CONTINUE
      GOTO 2004
 2005 CONTINUE
      LINENO = 4372
      CALL P$MST(3)
      CALL P$LDC(1,INTL(167))
      CALL P$CUP(1)
      CALL P30
 1102 CONTINUE
      LINENO = 4373
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 4374
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(16))
      CALL P$EQU(1,1)
      CALL P$FJP($2010)
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      GOTO 2011
 2010 CONTINUE
      CALL P$MST(3)
      CALL P$LDC(1,INTL(5))
      CALL P$CUP(1)
      CALL P30
 2011 CONTINUE
 2003 CONTINUE
      LINENO = 4376
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32533))
      CALL P$UNI
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($2012)
      LINENO = 4377
      CALL P$MST(3)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P307
 2012 CONTINUE
      LINENO = 4378
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32534))
      CALL P$UNI
      CALL P$INN
      CALL P$FJP($2013)
      LINENO = 4379
      LINENO = 4380
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1934
      LINENO = 4381
      CALL P$LDO(1,13)
      GOTO 2014
 2016 CONTINUE
      LINENO = 4382
      CALL P$MST(3)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32535))
      CALL P$LDA(0,13)
      CALL P$CUP(9)
      CALL P337
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      LINENO = 4383
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(4))
      CALL P$EQU(1,1)
      CALL P$FJP($2017)
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LODA(0,13)
      CALL P$CUP(9)
      CALL P1196
      GOTO 2018
 2017 CONTINUE
      LINENO = 4384
      CALL P$MST(0)
      CALL P$LODA(0,13)
      CALL P$CUP(1)
      CALL P1836
 2018 CONTINUE
      GOTO 2015
 2019 CONTINUE
      LINENO = 4386
      CALL P$LDO(1,28)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,28)
      LINENO = 4387
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1882
      GOTO 2015
 2020 CONTINUE
      LINENO = 4388
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1867
      GOTO 2015
 2021 CONTINUE
      LINENO = 4389
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1890
      GOTO 2015
 2022 CONTINUE
      LINENO = 4390
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1897
      GOTO 2015
 2023 CONTINUE
      LINENO = 4391
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1949
      GOTO 2015
 2024 CONTINUE
      LINENO = 4392
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1938
      GOTO 2015
 2025 CONTINUE
      LINENO = 4393
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1954
      GOTO 2015
 2026 CONTINUE
      LINENO = 4394
      CALL P$MST(3)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P1984
      GOTO 2015
 2014 CONTINUE
      CALL P$CHK(INTL(0),INTL(38))
      CALL P$LDC(1,INTL(0))
      CALL P$SBI
      CALL P$XJP($2027)
 2027 CONTINUE
 2028 GOTO 2016
 2029 GOTO 99998
 2030 GOTO 99998
 2031 GOTO 99998
 2032 GOTO 99998
 2033 GOTO 99998
 2034 GOTO 99998
 2035 GOTO 99998
 2036 GOTO 99998
 2037 GOTO 99998
 2038 GOTO 99998
 2039 GOTO 99998
 2040 GOTO 99998
 2041 GOTO 99998
 2042 GOTO 99998
 2043 GOTO 99998
 2044 GOTO 99998
 2045 GOTO 99998
 2046 GOTO 99998
 2047 GOTO 99998
 2048 GOTO 99998
 2049 GOTO 99998
 2050 GOTO 99998
 2051 GOTO 99998
 2052 GOTO 99998
 2053 GOTO 99998
 2054 GOTO 99998
 2055 GOTO 99998
 2056 GOTO 99998
 2057 GOTO 99998
 2058 GOTO 99998
 2059 GOTO 2019
 2060 GOTO 2021
 2061 GOTO 2022
 2062 GOTO 2024
 2063 GOTO 2023
 2064 GOTO 2025
 2065 GOTO 2026
 2066 GOTO 2020
 2015 CONTINUE
      LINENO = 4396
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32536))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($2067)
      LINENO = 4397
      CALL P$MST(3)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(3)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P307
 2067 CONTINUE
 2013 CONTINUE
      CALL P$RET(0)
      RETURN
 2001 CONTINUE
      SG1SIZ = 19
      SG2SIZ = 87
      GOTO 2002
      END

      SUBROUTINE P883
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2068
99998 CALL P$UJC
 2069 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4402
      CALL P$LODA(1,14)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2070)
      LINENO = 4403
      CALL P$LODA(1,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,9)
      CALL P$STR(0,17)
      LINENO = 4404
      CALL P$LDO(3,33)
      CALL P$FJP($2071)
      LINENO = 4405
      CALL P$LAO(11)
      CALL P$WLN
      LINENO = 4406
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26505)
      CALL P$LDC(1,INTL(12))
      CALL P$LDC(1,INTL(12))
      CALL P$WRS
      CALL P$LOD(0,17)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4407
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(2))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2071 CONTINUE
      GOTO 2072
 2070 CONTINUE
      LINENO = 4410
      LINENO = 4411
      CALL P$MST(2)
      CALL P$LDA(0,17)
      CALL P$CUP(1)
      CALL P412
      LINENO = 4412
      CALL P$LDO(3,33)
      CALL P$FJP($2073)
      LINENO = 4413
      CALL P$LAO(11)
      CALL P$WLN
      LINENO = 4414
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26508)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$LDC(6,INTL(206))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 4415
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(2))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2073 CONTINUE
 2072 CONTINUE
      LINENO = 4418
      CALL P$LDO(0,58)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2074)
      LINENO = 4420
 2075 CONTINUE
      LINENO = 4420
      CALL P$LDO(0,58)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$LDO(0,58)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,8)
      CALL P$LDO(1,62)
      CALL P$EQU(1,1)
      CALL P$AND
      CALL P$FJP($2076)
      LINENO = 4421
      LINENO = 4422
      CALL P$LDO(3,33)
      CALL P$FJP($2077)
      LINENO = 4423
      LINENO = 4424
      CALL P$LDO(0,58)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDO(0,45)
      CALL P$EQU(0,1)
      CALL P$FJP($2078)
      LINENO = 4425
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26512)
      CALL P$LDC(1,INTL(10))
      CALL P$LDC(1,INTL(10))
      CALL P$WRS
      CALL P$LDO(0,58)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(8))
      CALL P$WRS
      CALL P$WLN
      GOTO 2079
 2078 CONTINUE
      LINENO = 4426
      CALL P$LDO(0,58)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDO(0,46)
      CALL P$EQU(0,1)
      CALL P$FJP($2080)
      LINENO = 4427
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26515)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LDO(0,58)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(8))
      CALL P$WRS
      CALL P$WLN
 2080 CONTINUE
 2079 CONTINUE
      LINENO = 4428
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2077 CONTINUE
      LINENO = 4430
      CALL P$LDO(0,58)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,14)
      CALL P$SRO(0,58)
      GOTO 2075
 2076 CONTINUE
 2074 CONTINUE
      LINENO = 4432
      CALL P$LDO(3,33)
      CALL P$FJP($2081)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P415
 2081 CONTINUE
      LINENO = 4433
      CALL P$LDC(1,INTL(5))
      CALL P$STR(0,20)
      CALL P$LDC(1,INTL(5))
      CALL P$STR(0,19)
      LINENO = 4434
      CALL P$MST(2)
      CALL P$LDA(0,16)
      CALL P$CUP(1)
      CALL P412
      CALL P$MST(2)
      CALL P$LDA(0,21)
      CALL P$CUP(1)
      CALL P412
      LINENO = 4435
      CALL P$LDO(3,33)
      CALL P$FJP($2082)
      LINENO = 4436
      CALL P$LDO(3,39)
      CALL P$FJP($2083)
      LINENO = 4437
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26517)
      CALL P$LDC(1,INTL(15))
      CALL P$LDC(1,INTL(15))
      CALL P$WRS
      SP=SP-1
      LINENO = 4438
      CALL P$LODA(1,14)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2084)
      LINENO = 4439
      CALL P$LAO(11)
      CALL P$LODA(1,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDC(1,INTL(8))
      CALL P$LDC(1,INTL(8))
      CALL P$WRS
      SP=SP-1
      GOTO 2085
 2084 CONTINUE
      LINENO = 4441
      CALL P$LAO(11)
      CALL P$LCA(26521)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      SP=SP-1
 2085 CONTINUE
      LINENO = 4442
      CALL P$LAO(11)
      CALL P$LCA(26524)
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$WRS
      CALL P$WLN
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2083 CONTINUE
      LINENO = 4444
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26525)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LOD(0,16)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4445
      CALL P$LAO(11)
      CALL P$LCA(26527)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$WLN
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(2))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2082 CONTINUE
      LINENO = 4446
      CALL P$MST(0)
      CALL P$LOD(0,21)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4447
      CALL P$LDO(3,33)
      CALL P$FJP($2086)
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26531)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LCA(26532)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$WLN
      LINENO = 4448
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26536)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LCA(26537)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$WLN
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(2))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2086 CONTINUE
      LINENO = 4449
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$IND(0,2)
      CALL P$STRA(0,30)
      LINENO = 4450
 2087 CONTINUE
      LINENO = 4450
      CALL P$LODA(0,30)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2088)
      LINENO = 4451
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(2))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 4452
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$FJP($2089)
      CALL P$MST(0)
      CALL P$LDC(1,INTL(37))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$CUP(2)
      CALL P896
      GOTO 2090
 2089 CONTINUE
      LINENO = 4453
      CALL P$MST(0)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$SBI
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$CUP(3)
      CALL P903
 2090 CONTINUE
      LINENO = 4454
      CALL P$MST(0)
      CALL P$LDC(1,INTL(65))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      LINENO = 4455
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,6)
      CALL P$STRA(0,30)
      GOTO 2087
 2088 CONTINUE
      LINENO = 4457
      CALL P$LODA(1,14)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2091)
      LINENO = 4458
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,22)
      LINENO = 4459
      CALL P$LODA(1,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,24)
      LINENO = 4460
 2092 CONTINUE
      LINENO = 4460
      CALL P$LODA(0,24)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2093)
      LINENO = 4461
      CALL P$LODA(0,24)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,31)
      LINENO = 4462
      LINENO = 4463
      CALL P$LODA(0,31)
      CALL P$IND(1,6)
      CALL P$LDC(1,INTL(2))
      CALL P$EQU(1,1)
      CALL P$FJP($2094)
      LINENO = 4464
      CALL P$LODA(0,31)
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2095)
      LINENO = 4465
      CALL P$LODA(0,31)
      CALL P$IND(1,7)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$LODA(0,31)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(3))
      CALL P$GRT(1,1)
      CALL P$AND
      CALL P$FJP($2096)
      LINENO = 4466
      LINENO = 4467
      CALL P$MST(0)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$LODA(0,31)
      CALL P$IND(1,9)
      CALL P$CUP(3)
      CALL P903
      LINENO = 4468
      CALL P$MST(0)
      CALL P$LDC(1,INTL(54))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$LOD(0,22)
      CALL P$LDO(0,49)
      CALL P$CUP(4)
      CALL P959
      LINENO = 4469
      CALL P$MST(0)
      CALL P$LDC(1,INTL(40))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,31)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$CUP(2)
      CALL P896
      LINENO = 4470
      CALL P$LOD(0,22)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,22)
      GOTO 2097
 2096 CONTINUE
      LINENO = 4472
      CALL P$LOD(0,22)
      CALL P$LODA(0,31)
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STR(0,22)
 2097 CONTINUE
 2095 CONTINUE
 2094 CONTINUE
      LINENO = 4473
      CALL P$LODA(0,24)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,5)
      CALL P$STRA(0,24)
      GOTO 2092
 2093 CONTINUE
 2091 CONTINUE
      LINENO = 4476
      CALL P$LDO(1,23)
      CALL P$STR(0,23)
      LINENO = 4477
 2098 CONTINUE
      LINENO = 4478
 2099 CONTINUE
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32538))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P1101
      LINENO = 4479
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($2099)
      LINENO = 4480
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$NEQ(1,1)
      CALL P$STR(1,16)
      LINENO = 4481
      CALL P$LOD(1,16)
      CALL P$NOT
      CALL P$FJP($2100)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
 2100 CONTINUE
      LINENO = 4482
      CALL P$LOD(1,16)
      CALL P$FJP($2098)
      LINENO = 4483
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(39))
      CALL P$EQU(1,1)
      CALL P$FJP($2101)
      LINENO = 4484
      CALL P$LDO(1,28)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$SRO(1,28)
      CALL P$MST(2)
      CALL P$CUP(0)
      CALL P62
      GOTO 2102
 2101 CONTINUE
      LINENO = 4485
      CALL P$MST(2)
      CALL P$LDC(1,INTL(13))
      CALL P$CUP(1)
      CALL P30
 2102 CONTINUE
      LINENO = 4486
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$IND(0,1)
      CALL P$STRA(0,25)
      LINENO = 4487
 2103 CONTINUE
      LINENO = 4487
      CALL P$LODA(0,25)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2104)
      LINENO = 4488
      CALL P$LODA(0,25)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,31)
      LINENO = 4489
      LINENO = 4490
      CALL P$LODA(0,31)
      CALL P$IND(3,1)
      CALL P$NOT
      CALL P$FJP($2105)
      LINENO = 4491
      CALL P$MST(2)
      CALL P$LDC(1,INTL(168))
      CALL P$CUP(1)
      CALL P30
      LINENO = 4492
      CALL P$LAO(7)
      CALL P$WLN
      CALL P$LAO(7)
      CALL P$LCA(26541)
      CALL P$LDC(1,INTL(7))
      CALL P$LDC(1,INTL(7))
      CALL P$WRS
      CALL P$LODA(0,31)
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(10))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4493
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDO(1,22)
      CALL P$LDC(1,INTL(20))
      CALL P$ADI
      CALL P$WRC
      SP=SP-1
 2105 CONTINUE
      LINENO = 4495
      CALL P$LODA(0,31)
      CALL P$IND(0,0)
      CALL P$STRA(0,25)
      GOTO 2103
 2104 CONTINUE
      LINENO = 4497
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$IND(0,2)
      CALL P$STRA(0,30)
      LINENO = 4498
 2106 CONTINUE
      LINENO = 4498
      CALL P$LODA(0,30)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2107)
      LINENO = 4500
      LINENO = 4501
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$LDC(1,INTL(1))
      CALL P$LEQ(1,1)
      CALL P$FJP($2108)
      CALL P$MST(0)
      CALL P$LDC(1,INTL(37))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$CUP(2)
      CALL P896
      GOTO 2109
 2108 CONTINUE
      LINENO = 4502
      CALL P$MST(0)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDO(1,62)
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,2)
      CALL P$SBI
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$CUP(3)
      CALL P903
 2109 CONTINUE
      LINENO = 4503
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(3,0)
      CALL P$FJP($2110)
      CALL P$MST(0)
      CALL P$LDC(1,INTL(63))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$CUP(1)
      CALL P892
      GOTO 2111
 2110 CONTINUE
      LINENO = 4504
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      LINENO = 4505
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26543)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(64))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$LDC(6,INTL(168))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,1)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(26544)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      SP=SP-1
      LINENO = 4506
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,18)
      CALL P$LDC(1,INTL(8))
      CALL P$STR(0,31)
 2112 CONTINUE
      CALL P$LOD(0,18)
      CALL P$LOD(0,31)
      CALL P$LEQ(1)
      CALL P$FJP($2113)
      CALL P$LAO(11)
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(4))
      CALL P$LOD(0,18)
      CALL P$CHK(INTL(1),INTL(8))
      CALL P$DEC(1,INTL(1))
      CALL P$LPC
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      CALL P$LOD(0,18)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,18)
      GOTO 2112
 2113 CONTINUE
      LINENO = 4507
      CALL P$LAO(11)
      CALL P$LCA(26545)
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$WRS
      CALL P$WLN
 2111 CONTINUE
      LINENO = 4509
      CALL P$LODA(0,30)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,6)
      CALL P$STRA(0,30)
      GOTO 2106
 2107 CONTINUE
      LINENO = 4511
      CALL P$LAO(65)
      CALL P$LDO(1,64)
      CALL P$IXA(6)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 4512
      CALL P$LODA(1,14)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2114)
      LINENO = 4513
      LINENO = 4514
      CALL P$LODA(1,14)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($2115)
      CALL P$MST(0)
      CALL P$LDC(1,INTL(42))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$CUP(2)
      CALL P896
      GOTO 2116
 2115 CONTINUE
      LINENO = 4515
      CALL P$MST(0)
      CALL P$LDC(1,INTL(42))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(1))
      CALL P$CUP(2)
      CALL P896
 2116 CONTINUE
      LINENO = 4516
      CALL P$MST(2)
      CALL P$LDO(0,44)
      CALL P$LDA(0,23)
      CALL P$CUP(2)
      CALL P409
      LINENO = 4517
      CALL P$LDO(3,33)
      CALL P$FJP($2117)
      LINENO = 4518
      CALL P$LDO(3,39)
      CALL P$FJP($2118)
      LINENO = 4519
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26546)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$WLN
      LINENO = 4520
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2118 CONTINUE
      LINENO = 4522
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26550)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$WLN
      LINENO = 4523
      CALL P$MST(0)
      CALL P$LOD(0,16)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4524
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26552)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LOD(0,23)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4525
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26555)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LOD(0,19)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4526
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26558)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LOD(0,21)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4527
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26560)
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$WRS
      CALL P$WLN
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(5))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2117 CONTINUE
      GOTO 2119
 2114 CONTINUE
      LINENO = 4531
      CALL P$MST(0)
      CALL P$LDC(1,INTL(42))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$LDC(1,INTL(0))
      CALL P$CUP(2)
      CALL P896
      LINENO = 4532
      CALL P$MST(2)
      CALL P$LDO(0,44)
      CALL P$LDA(0,23)
      CALL P$CUP(2)
      CALL P409
      LINENO = 4533
      CALL P$LDO(3,33)
      CALL P$FJP($2120)
      LINENO = 4534
      LINENO = 4535
      CALL P$LDO(3,39)
      CALL P$FJP($2121)
      LINENO = 4536
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26561)
      CALL P$LDC(1,INTL(16))
      CALL P$LDC(1,INTL(16))
      CALL P$WRS
      CALL P$WLN
      LINENO = 4537
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2121 CONTINUE
      LINENO = 4539
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26565)
      CALL P$LDC(1,INTL(6))
      CALL P$LDC(1,INTL(6))
      CALL P$WRS
      CALL P$WLN
      LINENO = 4540
      CALL P$MST(0)
      CALL P$LOD(0,16)
      CALL P$CUP(1)
      CALL P1097
      LINENO = 4541
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26567)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LOD(0,23)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4542
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26570)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LOD(0,19)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4543
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26573)
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(5))
      CALL P$WRS
      CALL P$LOD(0,21)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$WLN
      LINENO = 4544
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(26575)
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$WRS
      CALL P$WLN
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(5))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2120 CONTINUE
      LINENO = 4546
      CALL P$LDA(0,14)
      CALL P$LAO(18)
      CALL P$MOV(2)
      LINENO = 4547
 2122 CONTINUE
      LINENO = 4547
      CALL P$LDO(0,60)
      CALL P$LDC(0,INTL(0))
      CALL P$NEQ(0,1)
      CALL P$FJP($2123)
      LINENO = 4548
      CALL P$LDC(3,INTL(1))
      CALL P$STR(0,26)
      LINENO = 4549
      CALL P$LDO(0,60)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,31)
      LINENO = 4550
      CALL P$LAO(18)
      CALL P$LODA(0,31)
      CALL P$MOV(2)
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,31)
      LINENO = 4551
      CALL P$MST(2)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32540))
      CALL P$LDA(0,13)
      CALL P$CUP(9)
      CALL P337
      LINENO = 4552
      CALL P$LODA(0,13)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($2124)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,26)
      GOTO 2125
 2124 CONTINUE
      LINENO = 4553
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$LDC(0,INTL(0))
      CALL P$EQU(0,1)
      CALL P$FJP($2126)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,26)
      GOTO 2127
 2126 CONTINUE
      LINENO = 4554
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,4)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,3)
      CALL P$LDC(1,INTL(6))
      CALL P$NEQ(1,1)
      CALL P$FJP($2128)
      CALL P$LDC(3,INTL(0))
      CALL P$STR(0,26)
 2128 CONTINUE
 2127 CONTINUE
 2125 CONTINUE
      LINENO = 4555
      CALL P$LOD(0,26)
      CALL P$NOT
      CALL P$FJP($2129)
      LINENO = 4556
      CALL P$LAO(7)
      CALL P$WLN
      LINENO = 4557
      CALL P$LAO(7)
      CALL P$LCA(26576)
      CALL P$LDC(1,INTL(8))
      CALL P$LDC(1,INTL(8))
      CALL P$WRS
      CALL P$LCA(26578)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      CALL P$LCA(26581)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$LCA(26584)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      CALL P$LDO(0,60)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(8))
      CALL P$WRS
      CALL P$WLN
      LINENO = 4559
      CALL P$LAO(7)
      CALL P$LDC(6,INTL(160))
      CALL P$LDO(1,22)
      CALL P$LDC(1,INTL(20))
      CALL P$ADI
      CALL P$WRC
      SP=SP-1
 2129 CONTINUE
      LINENO = 4562
      CALL P$LDO(0,60)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(0,2)
      CALL P$SRO(0,60)
      GOTO 2122
 2123 CONTINUE
      LINENO = 4564
      CALL P$LAO(18)
      CALL P$LDA(0,14)
      CALL P$MOV(2)
 2119 CONTINUE
      CALL P$RET(0)
      RETURN
 2068 CONTINUE
      SG1SIZ = 32
      SG2SIZ = 137
      GOTO 2069
      END

      SUBROUTINE P422
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2130
99998 CALL P$UJC
 2131 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4569
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,30)
      LINENO = 4570
 2132 CONTINUE
      LINENO = 4571
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(18))
      CALL P$EQU(1,1)
      CALL P$FJP($2133)
      LINENO = 4572
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P678
 2133 CONTINUE
      LINENO = 4573
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(19))
      CALL P$EQU(1,1)
      CALL P$FJP($2134)
      LINENO = 4574
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P693
 2134 CONTINUE
      LINENO = 4575
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(20))
      CALL P$EQU(1,1)
      CALL P$FJP($2135)
      LINENO = 4576
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P704
 2135 CONTINUE
      LINENO = 4577
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(21))
      CALL P$EQU(1,1)
      CALL P$FJP($2136)
      LINENO = 4578
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P724
 2136 CONTINUE
      LINENO = 4579
 2137 CONTINUE
      LINENO = 4579
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32541))
      CALL P$INN
      CALL P$FJP($2138)
      LINENO = 4580
      CALL P$LDO(1,13)
      CALL P$STR(0,15)
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      CALL P$MST(0)
      CALL P$LOD(0,15)
      CALL P$CUP(1)
      CALL P757
      GOTO 2137
 2138 CONTINUE
      LINENO = 4581
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(31))
      CALL P$NEQ(1,1)
      CALL P$FJP($2139)
      LINENO = 4583
      CALL P$MST(1)
      CALL P$LDC(1,INTL(18))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P307
 2139 CONTINUE
      LINENO = 4584
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$INN
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$IOR
      CALL P$FJP($2132)
      LINENO = 4585
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,30)
      LINENO = 4586
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(31))
      CALL P$EQU(1,1)
      CALL P$FJP($2140)
      LINENO = 4587
      CALL P$LDO(1,28)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,28)
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      GOTO 2141
 2140 CONTINUE
      LINENO = 4588
      CALL P$MST(1)
      CALL P$LDC(1,INTL(17))
      CALL P$CUP(1)
      CALL P30
 2141 CONTINUE
      LINENO = 4589
 2142 CONTINUE
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32542))
      CALL P$UNI
      CALL P$CUP(8)
      CALL P883
      LINENO = 4590
      CALL P$LDO(1,13)
      CALL P$LOD(0,13)
      CALL P$NEQ(1,1)
      CALL P$FJP($2143)
      LINENO = 4591
      CALL P$MST(1)
      CALL P$LDC(1,INTL(6))
      CALL P$CUP(1)
      CALL P30
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$CUP(8)
      CALL P307
 2143 CONTINUE
      LINENO = 4592
      CALL P$LDO(1,13)
      CALL P$LOD(0,13)
      CALL P$EQU(1,1)
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,238)
      CALL P$INN
      CALL P$IOR
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$IOR
      CALL P$FJP($2142)
      CALL P$RET(0)
      RETURN
 2130 CONTINUE
      SG1SIZ = 17
      SG2SIZ = 81
      GOTO 2131
      END

      SUBROUTINE P2144
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2145
99998 CALL P$UJC
 2146 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4599
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(23))
      CALL P$EQU(1,1)
      CALL P$FJP($2147)
      LINENO = 4600
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$NEQ(1,1)
      CALL P$FJP($2148)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
 2148 CONTINUE
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      LINENO = 4601
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32543))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($2149)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
 2149 CONTINUE
      LINENO = 4602
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(8))
      CALL P$EQU(1,1)
      CALL P$FJP($2150)
      LINENO = 4603
      LINENO = 4604
 2151 CONTINUE
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      LINENO = 4605
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$EQU(1,1)
      CALL P$FJP($2152)
      LINENO = 4606
      LINENO = 4607
      CALL P$LAO(18)
      CALL P$LCA(26585)
      CALL P$EQU(5,8)
      CALL P$FJP($2153)
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,43)
      GOTO 2154
 2153 CONTINUE
      LINENO = 4608
      CALL P$LAO(18)
      CALL P$LCA(26587)
      CALL P$EQU(5,8)
      CALL P$FJP($2155)
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,42)
      GOTO 2156
 2155 CONTINUE
      LINENO = 4609
      CALL P$LAO(18)
      CALL P$LCA(26589)
      CALL P$EQU(5,8)
      CALL P$FJP($2157)
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,40)
      GOTO 2158
 2157 CONTINUE
      LINENO = 4610
      CALL P$LAO(18)
      CALL P$LCA(26591)
      CALL P$EQU(5,8)
      CALL P$FJP($2159)
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,41)
      GOTO 2160
 2159 CONTINUE
      LINENO = 4611
      CALL P$LDA(0,13)
      CALL P$LDC(1,INTL(3))
      CALL P$NEW
      LINENO = 4612
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$LAO(18)
      CALL P$MOV(2)
      LINENO = 4613
      CALL P$LODA(0,13)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(2))
      CALL P$LDO(0,60)
      CALL P$STO(0)
      LINENO = 4614
      CALL P$LODA(0,13)
      CALL P$SRO(0,60)
 2160 CONTINUE
 2158 CONTINUE
 2156 CONTINUE
 2154 CONTINUE
      LINENO = 4616
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
      LINENO = 4617
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32544))
      CALL P$INN
      CALL P$NOT
      CALL P$FJP($2161)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(20))
      CALL P$CUP(1)
      CALL P30
 2161 CONTINUE
      GOTO 2162
 2152 CONTINUE
      LINENO = 4619
      CALL P$MST(1)
      CALL P$LDC(1,INTL(2))
      CALL P$CUP(1)
      CALL P30
 2162 CONTINUE
      LINENO = 4620
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(12))
      CALL P$NEQ(1,1)
      CALL P$FJP($2151)
      LINENO = 4621
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(9))
      CALL P$NEQ(1,1)
      CALL P$FJP($2163)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(4))
      CALL P$CUP(1)
      CALL P30
 2163 CONTINUE
      LINENO = 4622
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
 2150 CONTINUE
      LINENO = 4624
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(13))
      CALL P$NEQ(1,1)
      CALL P$FJP($2164)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(14))
      CALL P$CUP(1)
      CALL P30
      GOTO 2165
 2164 CONTINUE
      LINENO = 4625
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P62
 2165 CONTINUE
 2147 CONTINUE
      LINENO = 4627
 2166 CONTINUE
      CALL P$MST(1)
      CALL P$LDC(1,INTL(1))
      CALL P$LODS(0,5)
      CALL P$LDC(1,INTL(14))
      CALL P$LDC(0,INTL(0))
      CALL P$CUP(10)
      CALL P422
      LINENO = 4628
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(14))
      CALL P$NEQ(1,1)
      CALL P$FJP($2167)
      CALL P$MST(1)
      CALL P$LDC(1,INTL(21))
      CALL P$CUP(1)
      CALL P30
 2167 CONTINUE
      LINENO = 4629
      CALL P$LDO(1,13)
      CALL P$LDC(1,INTL(14))
      CALL P$EQU(1,1)
      CALL P$LAO(5)
      CALL P$EOF
      CALL P$IOR
      CALL P$FJP($2166)
      LINENO = 4630
      CALL P$LDO(3,32)
      CALL P$FJP($2168)
      CALL P$LAO(7)
      CALL P$WLN
 2168 CONTINUE
      LINENO = 4631
      CALL P$LDO(1,191)
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$FJP($2169)
      LINENO = 4632
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,32)
      CALL P$MST(1)
      CALL P$CUP(0)
      CALL P10
 2169 CONTINUE
      CALL P$RET(0)
      RETURN
 2145 CONTINUE
      SG1SIZ = 14
      SG2SIZ = 43
      GOTO 2146
      END

      SUBROUTINE P2170
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2171
99998 CALL P$UJC
 2172 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4638
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26593)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26595)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26597)
      CALL P$MOV(2)
      LINENO = 4639
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26599)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26601)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26603)
      CALL P$MOV(2)
      LINENO = 4640
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26605)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26607)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26609)
      CALL P$MOV(2)
      LINENO = 4641
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26611)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26613)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(12))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26615)
      CALL P$MOV(2)
      LINENO = 4642
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26617)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26619)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26621)
      CALL P$MOV(2)
      LINENO = 4643
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(16))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26623)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(17))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26625)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(18))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26627)
      CALL P$MOV(2)
      LINENO = 4644
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(19))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26629)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(20))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26631)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26633)
      CALL P$MOV(2)
      LINENO = 4645
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(22))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26635)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(23))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26637)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(24))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26639)
      CALL P$MOV(2)
      LINENO = 4646
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(25))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26641)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(26))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26643)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(27))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26645)
      CALL P$MOV(2)
      LINENO = 4647
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26647)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(29))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26649)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26651)
      CALL P$MOV(2)
      LINENO = 4648
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(31))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26653)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(32))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26655)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(33))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26657)
      CALL P$MOV(2)
      LINENO = 4649
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(34))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26659)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(35))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26661)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(36))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26663)
      CALL P$MOV(2)
      LINENO = 4650
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(37))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26665)
      CALL P$MOV(2)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(38))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26667)
      CALL P$MOV(2)
      CALL P$RET(0)
      RETURN
 2171 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 9
      GOTO 2172
      END

      SUBROUTINE P2173
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2174
99998 CALL P$UJC
 2175 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4660
      CALL P$LAO(45)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 4661
      CALL P$LDO(0,45)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 4662
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4663
      CALL P$LAO(46)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 4664
      CALL P$LDO(0,46)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 4665
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4666
      CALL P$LAO(47)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 4667
      CALL P$LDO(0,47)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 4668
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4669
      CALL P$LAO(48)
      CALL P$LDC(1,INTL(6))
      CALL P$NEW
      LINENO = 4670
      CALL P$LDO(0,48)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 4671
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 4672
      CALL P$LAO(49)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 4673
      CALL P$LDO(0,49)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 4674
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 4675
      CALL P$LAO(44)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 4676
      CALL P$LDO(0,44)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 4677
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4678
      CALL P$LAO(50)
      CALL P$LDC(1,INTL(5))
      CALL P$NEW
      LINENO = 4679
      CALL P$LDO(0,50)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,6)
      LINENO = 4680
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,47)
      CALL P$STO(0)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,6)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(6))
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
 2174 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 11
      GOTO 2175
      END

      SUBROUTINE P2176
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2177
99998 CALL P$UJC
 2178 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4688
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(7))
      CALL P$NEW
      LINENO = 4689
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 4690
      CALL P$LODA(0,8)
      CALL P$LCA(26669)
      CALL P$MOV(2)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,45)
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4691
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      LINENO = 4692
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(7))
      CALL P$NEW
      LINENO = 4693
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 4694
      CALL P$LODA(0,8)
      CALL P$LCA(26671)
      CALL P$MOV(2)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,46)
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4695
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      LINENO = 4696
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(7))
      CALL P$NEW
      LINENO = 4697
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 4698
      CALL P$LODA(0,8)
      CALL P$LCA(26673)
      CALL P$MOV(2)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,47)
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4699
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      LINENO = 4700
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(7))
      CALL P$NEW
      LINENO = 4701
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 4702
      CALL P$LODA(0,8)
      CALL P$LCA(26675)
      CALL P$MOV(2)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,48)
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4703
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      LINENO = 4704
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(7))
      CALL P$NEW
      LINENO = 4705
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 4706
      CALL P$LODA(0,8)
      CALL P$LCA(26677)
      CALL P$MOV(2)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,50)
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4707
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      LINENO = 4708
      CALL P$LDC(0,INTL(0))
      CALL P$STRA(0,5)
      LINENO = 4709
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,7)
      CALL P$LDC(1,INTL(2))
      CALL P$STR(0,8)
 2179 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$LEQ(1)
      CALL P$FJP($2180)
      LINENO = 4710
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 4711
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,9)
      LINENO = 4712
      CALL P$LODA(0,9)
      CALL P$LAO(789)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$MOV(2)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,48)
      CALL P$STO(0)
      LINENO = 4713
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,5)
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(8))
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$STO(1)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 4715
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      CALL P$LODA(0,6)
      CALL P$STRA(0,5)
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 2179
 2180 CONTINUE
      LINENO = 4717
      CALL P$LDO(0,48)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,6)
      CALL P$STO(0)
      LINENO = 4718
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 4719
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 4720
      CALL P$LODA(0,8)
      CALL P$LCA(26679)
      CALL P$MOV(2)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,49)
      CALL P$STO(0)
      LINENO = 4721
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 4723
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      LINENO = 4724
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 4725
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 4726
      CALL P$LODA(0,8)
      CALL P$LCA(26681)
      CALL P$MOV(2)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,45)
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 4727
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(2147483647))
      CALL P$STO(1)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 4729
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      LINENO = 4730
      CALL P$LDC(1,INTL(3))
      CALL P$STR(0,7)
      CALL P$LDC(1,INTL(4))
      CALL P$STR(0,8)
 2181 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$LEQ(1)
      CALL P$FJP($2182)
      LINENO = 4731
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(10))
      CALL P$NEW
      LINENO = 4732
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,9)
      LINENO = 4733
      CALL P$LODA(0,9)
      CALL P$LAO(789)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$MOV(2)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,50)
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 4734
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$STO(1)
      LINENO = 4735
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(9))
      CALL P$LDC(1,INTL(5))
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(3))
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$MPI
      CALL P$LDC(1,INTL(2))
      CALL P$MPI
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 4738
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 2181
 2182 CONTINUE
      LINENO = 4740
      CALL P$LDC(1,INTL(34))
      CALL P$STR(0,7)
      CALL P$LDC(1,INTL(35))
      CALL P$STR(0,8)
 2183 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$LEQ(1)
      CALL P$FJP($2184)
      LINENO = 4741
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(10))
      CALL P$NEW
      LINENO = 4742
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,9)
      LINENO = 4743
      CALL P$LODA(0,9)
      CALL P$LAO(789)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$MOV(2)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,50)
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 4744
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$STO(1)
      LINENO = 4745
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(9))
      CALL P$LDC(1,INTL(5))
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(32))
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$MPI
      CALL P$LDC(1,INTL(2))
      CALL P$MPI
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 4747
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 2183
 2184 CONTINUE
      LINENO = 4749
      CALL P$LDC(1,INTL(37))
      CALL P$STR(0,7)
      CALL P$LDC(1,INTL(38))
      CALL P$STR(0,8)
 2185 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$LEQ(1)
      CALL P$FJP($2186)
      LINENO = 4750
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 4751
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,9)
      LINENO = 4752
      CALL P$LODA(0,9)
      CALL P$LAO(789)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$MOV(2)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 4753
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(8))
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(22))
      CALL P$SBI
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$STO(1)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      LINENO = 4754
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4756
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 2185
 2186 CONTINUE
      LINENO = 4758
      CALL P$LDC(1,INTL(5))
      CALL P$STR(0,7)
      CALL P$LDC(1,INTL(17))
      CALL P$STR(0,8)
 2187 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$LEQ(1)
      CALL P$FJP($2188)
      LINENO = 4759
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 4760
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,9)
      LINENO = 4761
      CALL P$LODA(0,9)
      CALL P$LAO(789)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$MOV(2)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 4762
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(8))
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(4))
      CALL P$SBI
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$STO(1)
      LINENO = 4763
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4765
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 2187
 2188 CONTINUE
      LINENO = 4767
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 4768
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 4769
      CALL P$LODA(0,8)
      CALL P$LAO(789)
      CALL P$LDC(1,INTL(36))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$MOV(2)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 4770
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$STO(1)
      LINENO = 4771
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4772
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      LINENO = 4773
      CALL P$LDC(1,INTL(18))
      CALL P$STR(0,7)
      CALL P$LDC(1,INTL(27))
      CALL P$STR(0,8)
 2189 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$LEQ(1)
      CALL P$FJP($2190)
      LINENO = 4774
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 4775
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,9)
      LINENO = 4776
      CALL P$LODA(0,9)
      CALL P$LAO(789)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$MOV(2)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 4777
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(8))
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(17))
      CALL P$SBI
      CALL P$CHK(INTL(1),INTL(16))
      CALL P$STO(1)
      LINENO = 4778
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4780
      CALL P$MST(1)
      CALL P$LODA(0,6)
      CALL P$CUP(1)
      CALL P314
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 2189
 2190 CONTINUE
      LINENO = 4782
      CALL P$LDA(0,6)
      CALL P$LDC(1,INTL(10))
      CALL P$NEW
      LINENO = 4783
      CALL P$LODA(0,6)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,8)
      LINENO = 4784
      CALL P$LODA(0,8)
      CALL P$LCA(26683)
      CALL P$MOV(2)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,46)
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 4785
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$STO(1)
      CALL P$LODA(0,8)
      CALL P$INC(0,INTL(9))
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 4787
      CALL P$LDC(1,INTL(28))
      CALL P$STR(0,7)
      CALL P$LDC(1,INTL(33))
      CALL P$STR(0,8)
 2191 CONTINUE
      CALL P$LOD(0,7)
      CALL P$LOD(0,8)
      CALL P$LEQ(1)
      CALL P$FJP($2192)
      LINENO = 4788
      CALL P$LDA(0,5)
      CALL P$LDC(1,INTL(15))
      CALL P$NEW
      LINENO = 4789
      CALL P$LODA(0,5)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,9)
      LINENO = 4790
      CALL P$LODA(0,9)
      CALL P$LAO(789)
      CALL P$LOD(0,7)
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$MOV(2)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(4))
      CALL P$LDO(0,46)
      CALL P$STO(0)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(5))
      CALL P$LODA(0,6)
      CALL P$STO(0)
      LINENO = 4791
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(11))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(12))
      CALL P$LDC(3,INTL(1))
      CALL P$STO(3)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$STO(1)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(9))
      CALL P$LOD(0,7)
      CALL P$LDC(1,INTL(13))
      CALL P$SBI
      CALL P$STO(1)
      LINENO = 4792
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(13))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      LINENO = 4793
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LODA(0,9)
      CALL P$INC(0,INTL(10))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4795
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$CUP(1)
      CALL P314
      CALL P$LOD(0,7)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,7)
      GOTO 2191
 2192 CONTINUE
      CALL P$RET(0)
      RETURN
 2177 CONTINUE
      SG1SIZ = 10
      SG2SIZ = 39
      GOTO 2178
      END

      SUBROUTINE P2193
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2194
99998 CALL P$UJC
 2195 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4801
      CALL P$LAO(51)
      CALL P$LDC(1,INTL(7))
      CALL P$NEW
      LINENO = 4802
      CALL P$LDO(0,51)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,5)
      LINENO = 4803
      CALL P$LODA(0,5)
      CALL P$LCA(26685)
      CALL P$MOV(2)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4804
      CALL P$LAO(52)
      CALL P$LDC(1,INTL(9))
      CALL P$NEW
      LINENO = 4805
      CALL P$LDO(0,52)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,5)
      LINENO = 4806
      CALL P$LODA(0,5)
      CALL P$LCA(26687)
      CALL P$MOV(2)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 4807
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 4809
      CALL P$LAO(53)
      CALL P$LDC(1,INTL(10))
      CALL P$NEW
      LINENO = 4810
      CALL P$LDO(0,53)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,5)
      LINENO = 4811
      CALL P$LODA(0,5)
      CALL P$LCA(26689)
      CALL P$MOV(2)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4812
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$STO(1)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(9))
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 4814
      CALL P$LAO(54)
      CALL P$LDC(1,INTL(8))
      CALL P$NEW
      LINENO = 4815
      CALL P$LDO(0,54)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,5)
      LINENO = 4816
      CALL P$LODA(0,5)
      CALL P$LCA(26691)
      CALL P$MOV(2)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$STO(1)
      LINENO = 4817
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(3))
      CALL P$STO(1)
      LINENO = 4819
      CALL P$LAO(55)
      CALL P$LDC(1,INTL(15))
      CALL P$NEW
      LINENO = 4820
      CALL P$LDO(0,55)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,5)
      LINENO = 4821
      CALL P$LODA(0,5)
      CALL P$LCA(26693)
      CALL P$MOV(2)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(11))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      LINENO = 4822
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(13))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      LINENO = 4823
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(12))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$STO(1)
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(9))
      CALL P$CUP(1)
      CALL P412
      LINENO = 4824
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(10))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 4826
      CALL P$LAO(56)
      CALL P$LDC(1,INTL(15))
      CALL P$NEW
      LINENO = 4827
      CALL P$LDO(0,56)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$STRA(0,5)
      LINENO = 4828
      CALL P$LODA(0,5)
      CALL P$LCA(26695)
      CALL P$MOV(2)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(4))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(5))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      LINENO = 4829
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(13))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      LINENO = 4830
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(11))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(12))
      CALL P$LDC(3,INTL(0))
      CALL P$STO(3)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(8))
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$STO(1)
      CALL P$MST(1)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(9))
      CALL P$CUP(1)
      CALL P412
      LINENO = 4831
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(6))
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(7))
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LODA(0,5)
      CALL P$INC(0,INTL(10))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
 2194 CONTINUE
      SG1SIZ = 6
      SG2SIZ = 13
      GOTO 2195
      END

      SUBROUTINE P2196
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2197
99998 CALL P$UJC
 2198 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4838
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,39)
      LINENO = 4839
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,34)
      LINENO = 4840
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,32)
      LINENO = 4841
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,33)
      LINENO = 4842
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,35)
      LINENO = 4843
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,36)
      LINENO = 4844
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,37)
      LINENO = 4845
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,38)
      LINENO = 4846
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,43)
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,42)
      LINENO = 4847
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,41)
      CALL P$LDC(3,INTL(0))
      CALL P$SRO(3,40)
      LINENO = 4848
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,13027)
      LINENO = 4849
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,13028)
      LINENO = 4850
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,28)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,26)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,27)
      LINENO = 4851
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,29)
      LINENO = 4852
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,30)
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,31)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$SRO(1,191)
      LINENO = 4853
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,57)
      LINENO = 4854
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,6478)
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,60)
      LINENO = 4855
      CALL P$LDC(1,INTL(5))
      CALL P$LDC(1,INTL(8))
      CALL P$LDC(1,INTL(1))
      CALL P$MPI
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,23)
      LINENO = 4857
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
      CALL P$LDC(3,INTL(1))
      CALL P$SRO(3,21)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,25)
      LINENO = 4858
      CALL P$LDC(6,INTL(160))
      CALL P$SRO(6,20)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,22)
      LINENO = 4859
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32545))
      CALL P$LDC(1,INTL(7))
      CALL P$SRO(4,213)
      LINENO = 4860
      CALL P$LDC(1,INTL(256))
      CALL P$LDC(4,INTL(32545))
      CALL P$LDC(1,INTL(4))
      CALL P$SRO(4,221)
      LINENO = 4861
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,226)
      LINENO = 4862
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,61)
      LINENO = 4863
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,58)
      CALL P$LDC(0,INTL(0))
      CALL P$SRO(0,59)
      LINENO = 4864
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,5)
      CALL P$LDC(1,INTL(8))
      CALL P$STR(0,6)
 2199 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,6)
      CALL P$LEQ(1)
      CALL P$FJP($2200)
      LINENO = 4865
      CALL P$LAO(6461)
      CALL P$LOD(0,5)
      CALL P$CHK(INTL(1),INTL(8))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(6,INTL(160))
      CALL P$STO(6)
      CALL P$LAO(6469)
      CALL P$LOD(0,5)
      CALL P$CHK(INTL(1),INTL(8))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(6,INTL(160))
      CALL P$STO(6)
      CALL P$LOD(0,5)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,5)
      GOTO 2199
 2200 CONTINUE
      LINENO = 4866
      CALL P$LAO(6461)
      CALL P$DAT(1)
      CALL P$LAO(6469)
      CALL P$DAT(2)
      CALL P$RET(0)
      RETURN
 2197 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 21
      GOTO 2198
      END

      SUBROUTINE P2201
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2202
99998 CALL P$UJC
 2203 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4872
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32545))
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(4,232)
      LINENO = 4873
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32546))
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,232)
      CALL P$UNI
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(4,234)
      LINENO = 4874
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32547))
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,234)
      CALL P$UNI
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(4,236)
      LINENO = 4875
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32548))
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(4,246)
      LINENO = 4876
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32549))
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(4,238)
      LINENO = 4878
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32550))
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(4,240)
      LINENO = 4879
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32551))
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(4,242)
      LINENO = 4880
      CALL P$LDC(1,INTL(1))
      CALL P$LDC(4,INTL(32552))
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(4,244)
      CALL P$RET(0)
      RETURN
 2202 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 37
      GOTO 2203
      END

      SUBROUTINE P2205
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2206
99998 CALL P$UJC
 2207 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4888
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26697)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26699)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26701)
      CALL P$MOV(2)
      LINENO = 4889
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26703)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26705)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26707)
      CALL P$MOV(2)
      LINENO = 4890
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26709)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26711)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26713)
      CALL P$MOV(2)
      LINENO = 4891
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26715)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26717)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(12))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26719)
      CALL P$MOV(2)
      LINENO = 4892
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26721)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26723)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26725)
      CALL P$MOV(2)
      LINENO = 4893
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(16))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26727)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(17))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26729)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(18))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26731)
      CALL P$MOV(2)
      LINENO = 4894
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(19))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26733)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(20))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26735)
      CALL P$MOV(2)
      LINENO = 4895
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26737)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(22))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26739)
      CALL P$MOV(2)
      LINENO = 4896
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(23))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26741)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(24))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26743)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(25))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26745)
      CALL P$MOV(2)
      LINENO = 4897
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(26))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26747)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(27))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26749)
      CALL P$MOV(2)
      LINENO = 4898
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26751)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(29))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26753)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26755)
      CALL P$MOV(2)
      LINENO = 4899
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(31))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26757)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(32))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26759)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(33))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26761)
      CALL P$MOV(2)
      LINENO = 4900
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(34))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26763)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(35))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26765)
      CALL P$MOV(2)
      LINENO = 4901
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(36))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26767)
      CALL P$MOV(2)
      CALL P$LAO(376)
      CALL P$LDC(1,INTL(37))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(26769)
      CALL P$MOV(2)
      LINENO = 4902
      CALL P$LAO(450)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$STO(1)
      CALL P$LAO(450)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$STO(1)
      CALL P$LAO(450)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$STO(1)
      CALL P$LAO(450)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$STO(1)
      CALL P$LAO(450)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(22))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$STO(1)
      LINENO = 4903
      CALL P$LAO(450)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$STO(1)
      CALL P$LAO(450)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(33))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$STO(1)
      CALL P$LAO(450)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(36))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$STO(1)
      CALL P$LAO(450)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(1),INTL(9))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(38))
      CALL P$CHK(INTL(1),INTL(38))
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
 2206 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 9
      GOTO 2207
      END

      SUBROUTINE P2208
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2209
99998 CALL P$UJC
 2210 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 4910
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,5)
      CALL P$LDC(1,INTL(400))
      CALL P$STR(0,6)
 2211 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,6)
      CALL P$LEQ(1)
      CALL P$FJP($2212)
      LINENO = 4911
      CALL P$LAO(865)
      CALL P$LOD(0,5)
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26771)
      CALL P$MOV(13)
      CALL P$LOD(0,5)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,5)
      GOTO 2211
 2212 CONTINUE
      LINENO = 4912
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26784)
      CALL P$MOV(13)
      LINENO = 4913
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26797)
      CALL P$MOV(13)
      LINENO = 4914
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26810)
      CALL P$MOV(13)
      LINENO = 4915
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26823)
      CALL P$MOV(13)
      LINENO = 4916
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26836)
      CALL P$MOV(13)
      LINENO = 4917
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26849)
      CALL P$MOV(13)
      LINENO = 4918
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26862)
      CALL P$MOV(13)
      LINENO = 4919
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26875)
      CALL P$MOV(13)
      LINENO = 4920
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26888)
      CALL P$MOV(13)
      LINENO = 4921
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26901)
      CALL P$MOV(13)
      LINENO = 4922
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26914)
      CALL P$MOV(13)
      LINENO = 4923
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(12))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26927)
      CALL P$MOV(13)
      LINENO = 4924
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26940)
      CALL P$MOV(13)
      LINENO = 4925
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26953)
      CALL P$MOV(13)
      LINENO = 4926
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26966)
      CALL P$MOV(13)
      LINENO = 4927
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(16))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26979)
      CALL P$MOV(13)
      LINENO = 4928
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(17))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(26992)
      CALL P$MOV(13)
      LINENO = 4929
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(18))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27005)
      CALL P$MOV(13)
      LINENO = 4930
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(19))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27018)
      CALL P$MOV(13)
      LINENO = 4931
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(20))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27031)
      CALL P$MOV(13)
      LINENO = 4932
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27044)
      CALL P$MOV(13)
      LINENO = 4933
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27057)
      CALL P$MOV(13)
      LINENO = 4934
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27070)
      CALL P$MOV(13)
      LINENO = 4935
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(52))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27083)
      CALL P$MOV(13)
      LINENO = 4936
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(53))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27096)
      CALL P$MOV(13)
      LINENO = 4937
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(54))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27109)
      CALL P$MOV(13)
      LINENO = 4938
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(55))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27122)
      CALL P$MOV(13)
      LINENO = 4939
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(56))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27135)
      CALL P$MOV(13)
      LINENO = 4940
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(57))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27148)
      CALL P$MOV(13)
      LINENO = 4941
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(58))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27161)
      CALL P$MOV(13)
      LINENO = 4942
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(59))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27174)
      CALL P$MOV(13)
      LINENO = 4943
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(60))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27187)
      CALL P$MOV(13)
      LINENO = 4944
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(101))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27200)
      CALL P$MOV(13)
      LINENO = 4945
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(102))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27213)
      CALL P$MOV(13)
      LINENO = 4946
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(103))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27226)
      CALL P$MOV(13)
      LINENO = 4947
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(104))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27239)
      CALL P$MOV(13)
      LINENO = 4948
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(105))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27252)
      CALL P$MOV(13)
      LINENO = 4949
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(106))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27265)
      CALL P$MOV(13)
      LINENO = 4950
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(107))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27278)
      CALL P$MOV(13)
      LINENO = 4951
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(108))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27291)
      CALL P$MOV(13)
      LINENO = 4952
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(109))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27304)
      CALL P$MOV(13)
      LINENO = 4953
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(110))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27317)
      CALL P$MOV(13)
      LINENO = 4954
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(111))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27330)
      CALL P$MOV(13)
      LINENO = 4955
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(112))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27343)
      CALL P$MOV(13)
      LINENO = 4956
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(113))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27356)
      CALL P$MOV(13)
      LINENO = 4957
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(114))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27369)
      CALL P$MOV(13)
      LINENO = 4958
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(115))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27382)
      CALL P$MOV(13)
      LINENO = 4959
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(116))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27395)
      CALL P$MOV(13)
      LINENO = 4960
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(117))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27408)
      CALL P$MOV(13)
      LINENO = 4961
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(118))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27421)
      CALL P$MOV(13)
      LINENO = 4962
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(119))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27434)
      CALL P$MOV(13)
      LINENO = 4963
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(120))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27447)
      CALL P$MOV(13)
      LINENO = 4964
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(121))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27460)
      CALL P$MOV(13)
      LINENO = 4965
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(122))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27473)
      CALL P$MOV(13)
      LINENO = 4966
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(123))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27486)
      CALL P$MOV(13)
      LINENO = 4967
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(124))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27499)
      CALL P$MOV(13)
      LINENO = 4968
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(125))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27512)
      CALL P$MOV(13)
      LINENO = 4969
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(126))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27525)
      CALL P$MOV(13)
      LINENO = 4970
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(127))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27538)
      CALL P$MOV(13)
      LINENO = 4971
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(128))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27551)
      CALL P$MOV(13)
      LINENO = 4972
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(129))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27564)
      CALL P$MOV(13)
      LINENO = 4973
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(130))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27577)
      CALL P$MOV(13)
      LINENO = 4974
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(131))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27590)
      CALL P$MOV(13)
      LINENO = 4975
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(132))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27603)
      CALL P$MOV(13)
      LINENO = 4976
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(133))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27616)
      CALL P$MOV(13)
      LINENO = 4977
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(134))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27629)
      CALL P$MOV(13)
      LINENO = 4978
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(135))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27642)
      CALL P$MOV(13)
      LINENO = 4979
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(136))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27655)
      CALL P$MOV(13)
      LINENO = 4980
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(137))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27668)
      CALL P$MOV(13)
      LINENO = 4981
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(138))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27681)
      CALL P$MOV(13)
      LINENO = 4982
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(139))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27694)
      CALL P$MOV(13)
      LINENO = 4983
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(140))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27707)
      CALL P$MOV(13)
      LINENO = 4984
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(141))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27720)
      CALL P$MOV(13)
      LINENO = 4985
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(142))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27733)
      CALL P$MOV(13)
      LINENO = 4986
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(143))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27746)
      CALL P$MOV(13)
      LINENO = 4987
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(144))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27759)
      CALL P$MOV(13)
      LINENO = 4988
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(145))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27772)
      CALL P$MOV(13)
      LINENO = 4989
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(146))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27785)
      CALL P$MOV(13)
      LINENO = 4990
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(147))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27798)
      CALL P$MOV(13)
      LINENO = 4991
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(148))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27811)
      CALL P$MOV(13)
      LINENO = 4992
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(149))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27824)
      CALL P$MOV(13)
      LINENO = 4993
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(150))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27837)
      CALL P$MOV(13)
      LINENO = 4994
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(151))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27850)
      CALL P$MOV(13)
      LINENO = 4995
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(152))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27863)
      CALL P$MOV(13)
      LINENO = 4996
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(153))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27876)
      CALL P$MOV(13)
      LINENO = 4997
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(154))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27889)
      CALL P$MOV(13)
      LINENO = 4998
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(155))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27902)
      CALL P$MOV(13)
      LINENO = 4999
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(156))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27915)
      CALL P$MOV(13)
      LINENO = 5000
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(157))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27928)
      CALL P$MOV(13)
      LINENO = 5001
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(158))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27941)
      CALL P$MOV(13)
      LINENO = 5002
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(159))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27954)
      CALL P$MOV(13)
      LINENO = 5003
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(160))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27967)
      CALL P$MOV(13)
      LINENO = 5004
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(161))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27980)
      CALL P$MOV(13)
      LINENO = 5005
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(162))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(27993)
      CALL P$MOV(13)
      LINENO = 5006
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(163))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28006)
      CALL P$MOV(13)
      LINENO = 5007
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(164))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28019)
      CALL P$MOV(13)
      LINENO = 5008
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(165))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28032)
      CALL P$MOV(13)
      LINENO = 5009
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(166))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28045)
      CALL P$MOV(13)
      LINENO = 5010
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(167))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28058)
      CALL P$MOV(13)
      LINENO = 5011
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(168))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28071)
      CALL P$MOV(13)
      LINENO = 5012
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(169))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28084)
      CALL P$MOV(13)
      LINENO = 5013
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(170))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28097)
      CALL P$MOV(13)
      LINENO = 5014
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(171))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28110)
      CALL P$MOV(13)
      LINENO = 5015
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(172))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28123)
      CALL P$MOV(13)
      LINENO = 5016
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(173))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28136)
      CALL P$MOV(13)
      LINENO = 5017
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(174))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28149)
      CALL P$MOV(13)
      LINENO = 5018
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(175))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28162)
      CALL P$MOV(13)
      LINENO = 5019
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(176))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28175)
      CALL P$MOV(13)
      LINENO = 5020
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(177))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28188)
      CALL P$MOV(13)
      LINENO = 5021
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(178))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28201)
      CALL P$MOV(13)
      LINENO = 5022
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(179))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28214)
      CALL P$MOV(13)
      LINENO = 5023
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(180))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28227)
      CALL P$MOV(13)
      LINENO = 5024
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(181))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28240)
      CALL P$MOV(13)
      LINENO = 5025
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(182))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28253)
      CALL P$MOV(13)
      LINENO = 5026
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(183))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28266)
      CALL P$MOV(13)
      LINENO = 5027
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(201))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28279)
      CALL P$MOV(13)
      LINENO = 5028
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(202))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28292)
      CALL P$MOV(13)
      LINENO = 5029
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(203))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28305)
      CALL P$MOV(13)
      LINENO = 5030
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(204))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28318)
      CALL P$MOV(13)
      LINENO = 5031
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(205))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28331)
      CALL P$MOV(13)
      LINENO = 5032
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(206))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28344)
      CALL P$MOV(13)
      LINENO = 5033
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(250))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28357)
      CALL P$MOV(13)
      LINENO = 5034
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(251))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28370)
      CALL P$MOV(13)
      LINENO = 5035
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(252))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28383)
      CALL P$MOV(13)
      LINENO = 5036
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(253))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28396)
      CALL P$MOV(13)
      LINENO = 5037
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(254))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28409)
      CALL P$MOV(13)
      LINENO = 5038
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(255))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28422)
      CALL P$MOV(13)
      LINENO = 5039
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(256))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28435)
      CALL P$MOV(13)
      LINENO = 5040
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(257))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28448)
      CALL P$MOV(13)
      LINENO = 5041
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(258))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28461)
      CALL P$MOV(13)
      LINENO = 5042
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(259))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28474)
      CALL P$MOV(13)
      LINENO = 5043
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(260))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28487)
      CALL P$MOV(13)
      LINENO = 5044
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(261))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28500)
      CALL P$MOV(13)
      LINENO = 5045
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(300))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28513)
      CALL P$MOV(13)
      LINENO = 5046
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(301))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28526)
      CALL P$MOV(13)
      LINENO = 5047
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(302))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28539)
      CALL P$MOV(13)
      LINENO = 5048
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(303))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28552)
      CALL P$MOV(13)
      LINENO = 5049
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(304))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28565)
      CALL P$MOV(13)
      LINENO = 5050
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(350))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28578)
      CALL P$MOV(13)
      LINENO = 5051
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(351))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28591)
      CALL P$MOV(13)
      LINENO = 5052
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(352))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28604)
      CALL P$MOV(13)
      LINENO = 5053
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(353))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28617)
      CALL P$MOV(13)
      LINENO = 5054
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(354))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28630)
      CALL P$MOV(13)
      LINENO = 5055
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(355))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28643)
      CALL P$MOV(13)
      LINENO = 5056
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(356))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28656)
      CALL P$MOV(13)
      LINENO = 5057
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(397))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28669)
      CALL P$MOV(13)
      LINENO = 5058
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(398))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28682)
      CALL P$MOV(13)
      LINENO = 5059
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(399))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28695)
      CALL P$MOV(13)
      LINENO = 5060
      CALL P$LAO(865)
      CALL P$LDC(1,INTL(400))
      CALL P$CHK(INTL(1),INTL(400))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(13)
      CALL P$LCA(28708)
      CALL P$MOV(13)
      CALL P$RET(0)
      RETURN
 2209 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 9
      GOTO 2210
      END

      SUBROUTINE P2213
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2214
99998 CALL P$UJC
 2215 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 5065
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(32))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(48))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(47))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(49))
      CALL P$STO(1)
      LINENO = 5066
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(7))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(6))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(39))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(36))
      CALL P$STO(1)
      LINENO = 5067
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(21))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(12))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(25))
      CALL P$STO(1)
      LINENO = 5068
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(51))
      CALL P$STO(1)
      LINENO = 5069
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(16))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(40))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(17))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(37))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(18))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(38))
      CALL P$STO(1)
      LINENO = 5070
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(19))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(33))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(20))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(20))
      CALL P$STO(1)
      LINENO = 5071
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(29))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(22))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(31))
      CALL P$STO(1)
      LINENO = 5072
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(23))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(46))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(24))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(35))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(25))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(27))
      CALL P$STO(1)
      LINENO = 5073
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(26))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(19))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(27))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(18))
      CALL P$STO(1)
      LINENO = 5074
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(34))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(29))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(28))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(50))
      CALL P$STO(1)
      LINENO = 5075
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(31))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(26))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(32))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(41))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(33))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(30))
      CALL P$STO(1)
      LINENO = 5076
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(34))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(23))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(35))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(42))
      CALL P$STO(1)
      LINENO = 5077
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(36))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(22))
      CALL P$STO(1)
      CALL P$LAO(459)
      CALL P$LDC(1,INTL(37))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(24))
      CALL P$STO(1)
      LINENO = 5078
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(171))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(6))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(173))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(6))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(170))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      LINENO = 5079
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(175))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(168))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(8))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(169))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(9))
      CALL P$STO(1)
      LINENO = 5080
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(164))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(52))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(189))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(7))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(160))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(52))
      CALL P$STO(1)
      LINENO = 5081
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(172))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(12))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(174))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(14))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(167))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(52))
      CALL P$STO(1)
      LINENO = 5082
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(219))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(10))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(221))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(11))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(186))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(16))
      CALL P$STO(1)
      LINENO = 5083
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(222))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(15))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(251))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(43))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(253))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(44))
      CALL P$STO(1)
      LINENO = 5084
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(188))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(7))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(190))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(7))
      CALL P$STO(1)
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(162))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(45))
      CALL P$STO(1)
      LINENO = 5085
      CALL P$LAO(496)
      CALL P$LDC(6,INTL(187))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(13))
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
 2214 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 9
      GOTO 2215
      END

      SUBROUTINE P2216
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2217
99998 CALL P$UJC
 2218 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 5091
      CALL P$LDC(1,INTL(1))
      CALL P$STR(0,5)
      CALL P$LDC(1,INTL(37))
      CALL P$STR(0,7)
 2219 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,7)
      CALL P$LEQ(1)
      CALL P$FJP($2220)
      CALL P$LAO(624)
      CALL P$LOD(0,5)
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(15))
      CALL P$STO(1)
      CALL P$LOD(0,5)
      CALL P$INC(1,INTL(1))
      CALL P$STR(0,5)
      GOTO 2219
 2220 CONTINUE
      LINENO = 5092
      CALL P$LAO(624)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(14))
      CALL P$STO(1)
      CALL P$LAO(624)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(3))
      CALL P$STO(1)
      CALL P$LAO(624)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      LINENO = 5093
      CALL P$LAO(624)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(7))
      CALL P$STO(1)
      CALL P$LAO(624)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(1),INTL(37))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5094
      CALL P$LDC(1,INTL(128))
      CALL P$CHK(INTL(128),INTL(255))
      CALL P$STR(0,6)
      CALL P$LDC(1,INTL(255))
      CALL P$CHK(INTL(128),INTL(255))
      CALL P$STR(0,7)
 2221 CONTINUE
      CALL P$LOD(0,6)
      CALL P$LOD(0,7)
      CALL P$LEQ(1)
      CALL P$FJP($2222)
      CALL P$LAO(661)
      CALL P$LOD(0,6)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(15))
      CALL P$STO(1)
      CALL P$LOD(0,6)
      CALL P$INC(6,INTL(1))
      CALL P$STR(0,6)
      GOTO 2221
 2222 CONTINUE
      LINENO = 5095
      CALL P$LAO(661)
      CALL P$LDC(6,INTL(171))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LAO(661)
      CALL P$LDC(6,INTL(173))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(6))
      CALL P$STO(1)
      CALL P$LAO(661)
      CALL P$LDC(6,INTL(170))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LAO(661)
      CALL P$LDC(6,INTL(175))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      LINENO = 5096
      CALL P$LAO(661)
      CALL P$LDC(6,INTL(189))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(13))
      CALL P$STO(1)
      LINENO = 5097
      CALL P$LAO(661)
      CALL P$LDC(6,INTL(188))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(8))
      CALL P$STO(1)
      CALL P$LAO(661)
      CALL P$LDC(6,INTL(190))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(11))
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
 2217 CONTINUE
      SG1SIZ = 8
      SG2SIZ = 9
      GOTO 2218
      END

      SUBROUTINE P2223
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2224
99998 CALL P$UJC
 2225 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 5105
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28721)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28723)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28725)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28727)
      CALL P$MOV(2)
      LINENO = 5106
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28729)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28731)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28733)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28735)
      CALL P$MOV(2)
      LINENO = 5107
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28737)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28739)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28741)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(12))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28743)
      CALL P$MOV(2)
      LINENO = 5108
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28745)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28747)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28749)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(16))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28751)
      CALL P$MOV(2)
      LINENO = 5109
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(17))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28753)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(18))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28755)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(19))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28757)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(20))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28759)
      CALL P$MOV(2)
      LINENO = 5110
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28761)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(22))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28763)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(23))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28765)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(24))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28767)
      CALL P$MOV(2)
      LINENO = 5111
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(25))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28769)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(26))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28771)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(27))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28773)
      CALL P$MOV(2)
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28775)
      CALL P$MOV(2)
      LINENO = 5112
      CALL P$LAO(6197)
      CALL P$LDC(1,INTL(29))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(2)
      CALL P$LCA(28777)
      CALL P$MOV(2)
      CALL P$RET(0)
      RETURN
 2224 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 9
      GOTO 2225
      END

      SUBROUTINE P2226
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2227
99998 CALL P$UJC
 2228 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 5120
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28779)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28781)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28783)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28785)
      CALL P$MOV(2)
      LINENO = 5121
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28787)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28789)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28791)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28793)
      CALL P$MOV(2)
      LINENO = 5122
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28795)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28797)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28799)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28801)
      CALL P$MOV(2)
      LINENO = 5123
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(12))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28803)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28805)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28807)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28809)
      CALL P$MOV(2)
      LINENO = 5124
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(16))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28811)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(17))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28813)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(18))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28815)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(19))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28817)
      CALL P$MOV(2)
      LINENO = 5125
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(20))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28819)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28821)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(22))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28823)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(23))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28825)
      CALL P$MOV(2)
      LINENO = 5126
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(24))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28827)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(25))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28829)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(26))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28831)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(27))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28833)
      CALL P$MOV(2)
      LINENO = 5127
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28835)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(29))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28837)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28839)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(31))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28841)
      CALL P$MOV(2)
      LINENO = 5128
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(32))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28843)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(33))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28845)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(34))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28847)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(35))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28849)
      CALL P$MOV(2)
      LINENO = 5129
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(36))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28851)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(37))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28853)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(38))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28855)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(39))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28857)
      CALL P$MOV(2)
      LINENO = 5130
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(40))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28859)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(41))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28861)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(42))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28863)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(43))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28865)
      CALL P$MOV(2)
      LINENO = 5131
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(44))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28867)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(45))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28869)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(46))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28871)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(47))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28873)
      CALL P$MOV(2)
      LINENO = 5132
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(48))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28875)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(49))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28877)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28879)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28881)
      CALL P$MOV(2)
      LINENO = 5133
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(52))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28883)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(53))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28885)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(54))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28887)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(55))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28889)
      CALL P$MOV(2)
      LINENO = 5134
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(56))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28891)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(57))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28893)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(58))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28895)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(59))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28897)
      CALL P$MOV(2)
      LINENO = 5135
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(60))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28899)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(61))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28901)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(62))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28903)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(63))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28905)
      CALL P$MOV(2)
      LINENO = 5136
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(64))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28907)
      CALL P$MOV(2)
      CALL P$LAO(6065)
      CALL P$LDC(1,INTL(65))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(2)
      CALL P$LCA(28909)
      CALL P$MOV(2)
      CALL P$RET(0)
      RETURN
 2227 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 9
      GOTO 2228
      END

      SUBROUTINE P2229
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2230
99998 CALL P$UJC
 2231 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 5143
      CALL P$LDC(1,INTL(128))
      CALL P$CHK(INTL(128),INTL(255))
      CALL P$STR(0,5)
      CALL P$LDC(1,INTL(255))
      CALL P$CHK(INTL(128),INTL(255))
      CALL P$STR(0,6)
 2232 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,6)
      CALL P$LEQ(1)
      CALL P$FJP($2233)
      CALL P$LAO(248)
      CALL P$LOD(0,5)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(3))
      CALL P$STO(1)
      CALL P$LOD(0,5)
      CALL P$INC(6,INTL(1))
      CALL P$STR(0,5)
      GOTO 2232
 2233 CONTINUE
      LINENO = 5144
      CALL P$LDC(6,INTL(193))
      CALL P$STR(0,5)
      CALL P$LDC(6,INTL(218))
      CALL P$STR(0,6)
 2234 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,6)
      CALL P$LEQ(1)
      CALL P$FJP($2235)
      CALL P$LAO(248)
      CALL P$LOD(0,5)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LOD(0,5)
      CALL P$INC(6,INTL(1))
      CALL P$STR(0,5)
      GOTO 2234
 2235 CONTINUE
      LINENO = 5145
      CALL P$LDC(6,INTL(225))
      CALL P$STR(0,5)
      CALL P$LDC(6,INTL(250))
      CALL P$STR(0,6)
 2236 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,6)
      CALL P$LEQ(1)
      CALL P$FJP($2237)
      CALL P$LAO(248)
      CALL P$LOD(0,5)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LOD(0,5)
      CALL P$INC(6,INTL(1))
      CALL P$STR(0,5)
      GOTO 2236
 2237 CONTINUE
      LINENO = 5146
      CALL P$LDC(6,INTL(176))
      CALL P$STR(0,5)
      CALL P$LDC(6,INTL(185))
      CALL P$STR(0,6)
 2238 CONTINUE
      CALL P$LOD(0,5)
      CALL P$LOD(0,6)
      CALL P$LEQ(1)
      CALL P$FJP($2239)
      CALL P$LAO(248)
      CALL P$LOD(0,5)
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LOD(0,5)
      CALL P$INC(6,INTL(1))
      CALL P$STR(0,5)
      GOTO 2238
 2239 CONTINUE
      LINENO = 5147
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(223))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(171))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5148
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(173))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(170))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5149
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(175))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(168))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5150
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(169))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(164))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5151
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(189))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(160))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5152
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(172))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(174))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5153
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(167))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(219))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5154
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(221))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(186))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5155
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(222))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(187))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5156
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(188))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(190))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5157
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(251))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(253))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5158
      CALL P$LAO(248)
      CALL P$LDC(6,INTL(162))
      CALL P$DEC(1,INTL(128))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5160
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(176))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(177))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$STO(1)
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(178))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$STO(1)
      LINENO = 5161
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(179))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(3))
      CALL P$STO(1)
      LINENO = 5162
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(180))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(4))
      CALL P$STO(1)
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(181))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(5))
      CALL P$STO(1)
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(182))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(6))
      CALL P$STO(1)
      LINENO = 5163
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(183))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(184))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6350)
      CALL P$LDC(6,INTL(185))
      CALL P$CHK(INTL(176),INTL(185))
      CALL P$DEC(1,INTL(176))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(9))
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
 2230 CONTINUE
      SG1SIZ = 7
      SG2SIZ = 9
      GOTO 2231
      END

      SUBROUTINE P2240
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2241
99998 CALL P$UJC
 2242 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 5169
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5170
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(8))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5171
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(8))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5172
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(12))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(8))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5173
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(16))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(17))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(18))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(19))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5174
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(20))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(22))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(23))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5175
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(24))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(25))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(26))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(27))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5176
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(8))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(29))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(30))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(31))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5177
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(32))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(33))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(34))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(35))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5178
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(36))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(37))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(38))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(39))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5179
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(40))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(41))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(42))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(43))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5180
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(44))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(45))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(46))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(47))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5181
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(48))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(49))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(50))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(51))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5182
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(52))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(53))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(54))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(55))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5183
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(56))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(57))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(58))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(59))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5184
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(60))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(61))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(62))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(3))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(63))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5185
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(64))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      CALL P$LAO(6255)
      CALL P$LDC(1,INTL(65))
      CALL P$CHK(INTL(0),INTL(65))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-8),INTL(8))
      CALL P$STO(1)
      LINENO = 5186
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(2))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(3))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(4))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      LINENO = 5187
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(5))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(6))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(7))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(3))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(8))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(3))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      LINENO = 5188
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(9))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(10))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(3))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(11))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(12))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      LINENO = 5189
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(13))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(14))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(15))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(16))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      LINENO = 5190
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(17))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(18))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(19))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(20))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      LINENO = 5191
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(21))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(22))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(23))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(24))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      LINENO = 5192
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(25))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(26))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(27))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(28))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      LINENO = 5193
      CALL P$LAO(6321)
      CALL P$LDC(1,INTL(29))
      CALL P$CHK(INTL(1),INTL(29))
      CALL P$DEC(1,INTL(1))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(2))
      CALL P$NGI
      CALL P$CHK(INTL(-7),INTL(7))
      CALL P$STO(1)
      CALL P$RET(0)
      RETURN
 2241 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 9
      GOTO 2242
      END

      SUBROUTINE P2204
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2243
99998 CALL P$UJC
 2244 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 5197
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2205
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2213
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2216
      LINENO = 5198
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2226
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2223
      LINENO = 5199
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2229
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2240
      LINENO = 5200
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2208
      CALL P$RET(0)
      RETURN
 2243 CONTINUE
      SG1SIZ = 5
      SG2SIZ = 5
      GOTO 2244
      END

      SUBROUTINE P$MAIN
      INTEGER*2 LINENO, SG1SIZ, SG2SIZ
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      INTEGER SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      GOTO 2246
99998 CALL P$UJC
 2247 CONTINUE
      CALL P$ENT(1,SG1SIZ)
      CALL P$ENT(2,SG2SIZ)
      LINENO = 5206
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2196
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2201
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2204
      LINENO = 5212
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$SRO(1,62)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$SRO(1,64)
      LINENO = 5215
      CALL P$LDO(3,33)
      CALL P$FJP($2248)
      LINENO = 5216
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28911)
      CALL P$LDC(1,INTL(9))
      CALL P$LDC(1,INTL(9))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5217
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28914)
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5218
      CALL P$LDO(1,24)
      CALL P$LDC(1,INTL(2))
      CALL P$ADI
      CALL P$CHK(INTL(0),INTL(32767))
      CALL P$SRO(1,24)
 2248 CONTINUE
      LINENO = 5221
      CALL P$LAO(65)
      CALL P$LDC(1,INTL(0))
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$IXA(6)
      CALL P$STRA(0,13029)
      LINENO = 5222
      CALL P$LDO(0,13029)
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LDO(0,13029)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LDO(0,13029)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 5225
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2173
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2170
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2176
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P2193
      LINENO = 5228
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$SRO(1,64)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(10))
      CALL P$SRO(1,62)
      LINENO = 5229
      CALL P$LAO(65)
      CALL P$LDC(1,INTL(1))
      CALL P$CHK(INTL(0),INTL(20))
      CALL P$IXA(6)
      CALL P$STRA(0,13029)
      LINENO = 5230
      CALL P$LDO(0,13029)
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LDO(0,13029)
      CALL P$INC(0,INTL(1))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LDO(0,13029)
      CALL P$INC(0,INTL(2))
      CALL P$LDC(0,INTL(0))
      CALL P$STO(0)
      CALL P$LDO(0,13029)
      CALL P$INC(0,INTL(3))
      CALL P$LDC(1,INTL(0))
      CALL P$STO(1)
      LINENO = 5237
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P62
      LINENO = 5238
      CALL P$MST(0)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,238)
      CALL P$LDC(1,INTL(1))
      CALL P$LDO(4,244)
      CALL P$UNI
      CALL P$LDC(1,INTL(257))
      CALL P$LDC(4,INTL(32554))
      CALL P$DIF
      CALL P$CUP(8)
      CALL P2144
      LINENO = 5239
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P40
      LINENO = 5241
      CALL P$LDO(3,33)
      CALL P$FJP($2249)
      LINENO = 5242
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28915)
      CALL P$LDC(1,INTL(15))
      CALL P$LDC(1,INTL(15))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5243
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28919)
      CALL P$LDC(1,INTL(17))
      CALL P$LDC(1,INTL(17))
      CALL P$WRS
      CALL P$LDC(1,INTL(24575))
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDC(1,INTL(4))
      CALL P$DVI
      CALL P$LDC(1,INTL(4))
      CALL P$WRI
      CALL P$LCA(28924)
      CALL P$LDC(1,INTL(13))
      CALL P$LDC(1,INTL(13))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5245
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P418
      LINENO = 5246
      CALL P$LDO(1,13028)
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$FJP($2250)
      LINENO = 5247
      CALL P$LAO(11)
      CALL P$WLN
      LINENO = 5248
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28928)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5249
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,13024)
      CALL P$LDO(1,13028)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$STR(0,13029)
 2251 CONTINUE
      CALL P$LDO(1,13024)
      CALL P$LOD(0,13029)
      CALL P$LEQ(1)
      CALL P$FJP($2252)
      LINENO = 5250
      CALL P$LAO(11)
      CALL P$LCA(28931)
      CALL P$LDC(1,INTL(7))
      CALL P$LDC(1,INTL(7))
      CALL P$WRS
      SP=SP-1
      LINENO = 5251
      CALL P$LDC(1,INTL(31))
      CALL P$LAO(12624)
      CALL P$LDO(1,13024)
      CALL P$CHK(INTL(0),INTL(399))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$IND(4,0)
      CALL P$INN
      CALL P$FJP($2253)
      CALL P$LDC(1,INTL(2))
      CALL P$SRO(1,13026)
      GOTO 2254
 2253 CONTINUE
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,13026)
 2254 CONTINUE
      LINENO = 5252
      CALL P$LDC(1,INTL(30))
      CALL P$LAO(12624)
      CALL P$LDO(1,13024)
      CALL P$CHK(INTL(0),INTL(399))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$IND(4,0)
      CALL P$INN
      CALL P$FJP($2255)
      CALL P$LDO(1,13026)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,13026)
 2255 CONTINUE
      LINENO = 5253
      CALL P$LAO(11)
      CALL P$LDO(1,13026)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      SP=SP-1
      LINENO = 5254
      CALL P$LDC(1,INTL(29))
      CALL P$SRO(1,13025)
      LINENO = 5255
 2256 CONTINUE
      LINENO = 5255
      CALL P$LDO(1,13025)
      CALL P$LDC(1,INTL(1))
      CALL P$NGI
      CALL P$GRT(1,1)
      CALL P$FJP($2257)
      LINENO = 5256
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,13026)
      LINENO = 5257
      CALL P$LDO(1,13025)
      CALL P$LAO(12624)
      CALL P$LDO(1,13024)
      CALL P$CHK(INTL(0),INTL(399))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$IND(4,0)
      CALL P$INN
      CALL P$FJP($2258)
      CALL P$LDO(1,13026)
      CALL P$LDC(1,INTL(4))
      CALL P$ADI
      CALL P$SRO(1,13026)
 2258 CONTINUE
      LINENO = 5258
      CALL P$LDO(1,13025)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$LAO(12624)
      CALL P$LDO(1,13024)
      CALL P$CHK(INTL(0),INTL(399))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$IND(4,0)
      CALL P$INN
      CALL P$FJP($2259)
      CALL P$LDO(1,13026)
      CALL P$LDC(1,INTL(2))
      CALL P$ADI
      CALL P$SRO(1,13026)
 2259 CONTINUE
      LINENO = 5259
      CALL P$LDO(1,13025)
      CALL P$LDC(1,INTL(2))
      CALL P$SBI
      CALL P$LAO(12624)
      CALL P$LDO(1,13024)
      CALL P$CHK(INTL(0),INTL(399))
      CALL P$IXA(1)
      CALL P$LDC(1,INTL(0))
      CALL P$IND(4,0)
      CALL P$INN
      CALL P$FJP($2260)
      CALL P$LDO(1,13026)
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$SRO(1,13026)
 2260 CONTINUE
      LINENO = 5260
      CALL P$LAO(11)
      CALL P$LDO(1,13026)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      SP=SP-1
      LINENO = 5261
      CALL P$LDO(1,13025)
      CALL P$LDC(1,INTL(3))
      CALL P$SBI
      CALL P$SRO(1,13025)
      GOTO 2256
 2257 CONTINUE
      LINENO = 5263
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      CALL P$LDO(1,13024)
      CALL P$INC(1,INTL(1))
      CALL P$SRO(1,13024)
      GOTO 2251
 2252 CONTINUE
      LINENO = 5265
      CALL P$LDC(1,INTL(399))
      CALL P$LDO(1,13028)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$FJP($2261)
      LINENO = 5266
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(5))
      CALL P$WRC
      CALL P$LDC(6,INTL(171))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LDC(1,INTL(399))
      CALL P$LDO(1,13028)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(28933)
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$WRS
      CALL P$WLN
 2261 CONTINUE
 2250 CONTINUE
      LINENO = 5269
      CALL P$LDO(1,13027)
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$FJP($2262)
      LINENO = 5270
      CALL P$LAO(11)
      CALL P$WLN
      LINENO = 5271
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28934)
      CALL P$LDC(1,INTL(12))
      CALL P$LDC(1,INTL(12))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5272
      CALL P$LDO(1,13027)
      CALL P$LDC(1,INTL(32))
      CALL P$SBI
      CALL P$SRO(1,13026)
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,13024)
      LINENO = 5273
 2263 CONTINUE
      LINENO = 5273
      CALL P$LDO(1,13024)
      CALL P$LDO(1,13026)
      CALL P$LES(1,1)
      CALL P$FJP($2264)
      LINENO = 5274
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(5))
      CALL P$WRC
      CALL P$LCA(28937)
      CALL P$LDC(1,INTL(4))
      CALL P$LDC(1,INTL(4))
      CALL P$WRS
      SP=SP-1
      LINENO = 5275
      CALL P$LDO(1,13024)
      CALL P$SRO(1,13025)
      CALL P$LDO(1,13024)
      CALL P$LDC(1,INTL(31))
      CALL P$ADI
      CALL P$STR(0,13029)
 2265 CONTINUE
      CALL P$LDO(1,13025)
      CALL P$LOD(0,13029)
      CALL P$LEQ(1)
      CALL P$FJP($2266)
      LINENO = 5276
      CALL P$LAO(11)
      CALL P$LAO(6480)
      CALL P$LDO(1,13025)
      CALL P$CHK(INTL(0),INTL(24575))
      CALL P$LPC
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      CALL P$LDO(1,13025)
      CALL P$INC(1,INTL(1))
      CALL P$SRO(1,13025)
      GOTO 2265
 2266 CONTINUE
      LINENO = 5277
      CALL P$LDO(1,13024)
      CALL P$LDC(1,INTL(32))
      CALL P$ADI
      CALL P$SRO(1,13024)
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      GOTO 2263
 2264 CONTINUE
      LINENO = 5279
      CALL P$LDO(1,13027)
      CALL P$LDO(1,13024)
      CALL P$SBI
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$FJP($2267)
      LINENO = 5280
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(5))
      CALL P$WRC
      CALL P$LDC(6,INTL(171))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LDO(1,13027)
      CALL P$LDO(1,13024)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(200))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      LINENO = 5281
      CALL P$LDO(1,13024)
      CALL P$SRO(1,13025)
      CALL P$LDO(1,13027)
      CALL P$LDC(1,INTL(1))
      CALL P$SBI
      CALL P$STR(0,13029)
 2268 CONTINUE
      CALL P$LDO(1,13025)
      CALL P$LOD(0,13029)
      CALL P$LEQ(1)
      CALL P$FJP($2269)
      LINENO = 5282
      CALL P$LAO(11)
      CALL P$LAO(6480)
      CALL P$LDO(1,13025)
      CALL P$CHK(INTL(0),INTL(24575))
      CALL P$LPC
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      SP=SP-1
      CALL P$LDO(1,13025)
      CALL P$INC(1,INTL(1))
      CALL P$SRO(1,13025)
      GOTO 2268
 2269 CONTINUE
 2267 CONTINUE
      LINENO = 5284
      CALL P$LDC(1,INTL(24575))
      CALL P$LDO(1,13027)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDC(1,INTL(0))
      CALL P$GRT(1,1)
      CALL P$FJP($2270)
      LINENO = 5285
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(172))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$LDC(1,INTL(24575))
      CALL P$LDO(1,13027)
      CALL P$SBI
      CALL P$LDC(1,INTL(1))
      CALL P$ADI
      CALL P$LDC(1,INTL(4))
      CALL P$DVI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LCA(28938)
      CALL P$LDC(1,INTL(2))
      CALL P$LDC(1,INTL(2))
      CALL P$WRS
      SP=SP-1
 2270 CONTINUE
      LINENO = 5286
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(175))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
 2262 CONTINUE
      LINENO = 5288
      CALL P$LAO(11)
      CALL P$WLN
      LINENO = 5289
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28939)
      CALL P$LDC(1,INTL(37))
      CALL P$LDC(1,INTL(37))
      CALL P$WRS
      CALL P$LDO(1,13027)
      CALL P$LDC(1,INTL(2))
      CALL P$DVI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 5291
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28949)
      CALL P$LDC(1,INTL(36))
      CALL P$LDC(1,INTL(36))
      CALL P$WRS
      CALL P$LDO(1,13028)
      CALL P$LDC(1,INTL(2))
      CALL P$MPI
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 5293
      CALL P$LDO(3,43)
      CALL P$FJP($2271)
      CALL P$LDC(1,INTL(1))
      CALL P$SRO(1,13026)
      GOTO 2272
 2271 CONTINUE
      CALL P$LDC(1,INTL(0))
      CALL P$SRO(1,13026)
 2272 CONTINUE
      LINENO = 5294
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28958)
      CALL P$LDC(1,INTL(12))
      CALL P$LDC(1,INTL(12))
      CALL P$WRS
      CALL P$LDO(1,13026)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 5295
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28961)
      CALL P$LDC(1,INTL(13))
      CALL P$LDC(1,INTL(13))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5296
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28965)
      CALL P$LDC(1,INTL(13))
      CALL P$LDC(1,INTL(13))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5297
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28969)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5298
      CALL P$LDO(3,35)
      CALL P$FJP($2273)
      LINENO = 5299
      LINENO = 5300
      CALL P$LAO(18)
      CALL P$LCA(28972)
      CALL P$MOV(2)
      LINENO = 5301
      CALL P$MST(0)
      CALL P$LDC(1,INTL(0))
      CALL P$LDC(4,INTL(32555))
      CALL P$LAO(6479)
      CALL P$CUP(9)
      CALL P337
      LINENO = 5302
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28974)
      CALL P$LDC(1,INTL(11))
      CALL P$LDC(1,INTL(11))
      CALL P$WRS
      CALL P$LDO(0,6479)
      CALL P$CHKA(INTL(1),INTL(32767))
      CALL P$IND(1,9)
      CALL P$LDC(1,INTL(1))
      CALL P$WRI
      CALL P$LDC(6,INTL(169))
      CALL P$LDC(1,INTL(1))
      CALL P$WRC
      CALL P$WLN
      LINENO = 5303
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28977)
      CALL P$LDC(1,INTL(40))
      CALL P$LDC(1,INTL(40))
      CALL P$WRS
      CALL P$WLN
 2273 CONTINUE
      LINENO = 5305
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28987)
      CALL P$LDC(1,INTL(10))
      CALL P$LDC(1,INTL(10))
      CALL P$WRS
      CALL P$WLN
      LINENO = 5306
      CALL P$LAO(11)
      CALL P$LDC(6,INTL(160))
      CALL P$LDC(1,INTL(6))
      CALL P$WRC
      CALL P$LCA(28990)
      CALL P$LDC(1,INTL(3))
      CALL P$LDC(1,INTL(3))
      CALL P$WRS
      CALL P$WLN
 2249 CONTINUE
      CALL P$RET(0)
      RETURN
 2246 CONTINUE
      SG1SIZ = 13030
      SG2SIZ = 63
      GOTO 2247
      END
      SUBROUTINE MAIN
      INTEGER*4 STRGS (6144), SETS (400)
      INTEGER*4 STOREX, STRTBL (6144), SETTBL (400)
      INTEGER*4 STORE(1), STOREX(32767)
      REAL STORER(1)
      INTEGER*2 SP, MP, EP, NP
      COMMON /SP/ SP
      COMMON /MP/ MP
      COMMON /EP/ EP
      COMMON /NP/ NP
      COMMON /CSTORE/ STOREX
      EQUIVALENCE(STOREX(2),STORE(1),STORER(1))
      EQUIVALENCE(STOREX(26224), STRTBL (1))
      EQUIVALENCE(STOREX(32368), SETTBL (1))


      DATA SETS /
     +:00005210034,
     +:00000000014,
     +:00000000001,
     +:00000000140,
     +:00000000002,
     +:00000011000,
     +:00000011000,
     +:00000000003,
     +:00000200000,
     +:00000000001,
     +:00000000002,
     +:00000000001,
     +:00000000002,
     +:00000210000,
     +:00000230000,
     +:00000000002,
     +:00000020000,
     +:00000000002,
     +:00000000001,
     +:00000000002,
     +:00000000001,
     +:00000000002,
     +:00000000001,
     +:00000000400,
     +:00000100000,
     +:00000000400,
     +:00000100000,
     +:00000020000,
     +:00000000200,
     +:00000210400,
     +:00000021000,
     +:00000020000,
     +:00000020000,
     +:00000000001,
     +:00000014000,
     +:00000100000,
     +:00000020000,
     +:00000000200,
     +:00000030000,
     +:00000030000,
     +:00000000001,
     +:00000020000,
     +:00000000001,
     +:00000000001,
     +:00000000001,
     +:00000020000,
     +:00000000001,
     +:00000000001,
     +:00000210000,
     +:00000230000,
     +:00000020000,
     +:00000000060,
     +:00000000001,
     +:00000000001,
     +:00000000400,
     +:00000000400,
     +:00130000001,
     +:00000001001,
     +:00130000001,
     +:00000031000,
     +:00000031000,
     +:00000210000,
     +:00000031000,
     +:00000000001,
     +:00000000007,
     +:00000021000,
     +:00000021000,
     +:00000210000,
     +:00000031000,
     +:00000000001,
     +:00000021000,
     +:00000021000,
     +:00130000001,
     +:00000001001,
     +:00000020000,
     +:00000220000,
     +:00000000001,
     +:00000000007,
     +:00000020000,
     +:20120000000,
     +:20120000000,
     +:20120000000,
     +:20120000000,
     +:20120000000,
     +:00000010104,
     +:00000014000,
     +:00000000014,
     +:00000010000,
     +:00000001000,
     +:00000000160,
     +:00000011000,
     +:00000001000,
     +:00000001000,
     +:00000011000,
     +:00000011000,
     +:00000011000,
     +:00000000063,
     +:00000011000,
     +:00000211000,
     +:00000011000,
     +:00000211000,
     +:00000000063,
     +:00000211000,
     +:00000011000,
     +:00000211000,
     +:00000011000,
     +:00000011000,
     +:00000001000,
     +:00000011000,
     +:00000011000,
     +:00000001000,
     +:00000011000,
     +:00000011000,
     +:00000001000,
     +:00000001000,
     +:00000001000,
     +:00000001000,
     +:00000000060,
     +:00000011000,
     +:00000000020,
     +:00000000040,
     +:00000011000,
     +:00000011000,
     +:00000011000,
     +:00000014140,
     +:00000014140,
     +:00000001000,
     +:00000000056,
     +:00000001000,
     +:00000214000,
     +:00000014000,
     +:00000000040,
     +:00000000040,
     +:00000000140,
     +:00000000100,
     +:00000000100,
     +:00000000200,
     +:00000007400,
     +:00000004400,
     +:00000400000,
     +:00000020000,
     +:00000000200,
     +:00002000000,
     +:00000000400,
     +:00000210000,
     +:00000100000,
     +:00000020000,
     +:00000000200,
     +:00000210000,
     +:00000020000,
     +:00000020000,
     +:00000040000,
     +:00000020000,
     +:00000040000,
     +:00000200000,
     +:00000000004,
     +:00000400000,
     +:00001600000,
     +:00001600000,
     +:00001600000,
     +:00001400000,
     +:00000200000,
     +:00000200000,
     +:00000000014,
     +:00000010000,
     +:00000200000,
     +:00000000001,
     +:00000000001,
     +:00000000074,
     +:00000020000,
     +:00000040600,
     +:00000020000,
     +:00000000200,
     +:00000000004,
     +:00120000000,
     +:00000000002,
     +:00000020400,
     +:00000011000,
     +:00000000117,
     +:00000000400,
     +:07600100000,
     +:07200000000,
     +:20137000000,
     +:00000142000,
     +:00000002437,
     +:20000000000,
     +:00000000177,
     +:00000000002,
     +:00000000004,
     +211*0/

      DATA STRGS /
     +32HGEORGIA TECH    PASCAL P4 - REVI,
     +32HSION    PAGE    *****   LAST ERR,
     +32HOR AT LINE  FIRST ERROR LAST ERR,
     +32HOR AT LINE  ERROR   NUMBER  MESS,
     +32HAGE ******  *******  ***** EOF  ,
     +32HENCOUNTERED         INTEGER*2 LI,
     +32HNENO, SG1SIZ, SG2SIZINTEGER*4 ST,
     +32HORE(1), STOREX(32767)   REAL STO,
     +32HRER(1)  COMMON /CSTORE/ STOREX  ,
     +32HEQUIVALENCE(STOREX(2),STORE(1),S,
     +32HTORER(1))   INTEGER SP, MP, EP, ,
     +32HNP  COMMON /SP/ SP  COMMON /MP/ ,
     +32HMP  COMMON /EP/ EP  COMMON /NP/ ,
     +32HNP  INTEGER*4 STOREX, STRTBL (  ,
     +32H), SETTBL (400) INTEGER*4 STORE(,
     +32H1), STOREX(32767)   REAL STORER(,
     +32H1)  INTEGER*2 SP, MP, EP, NPCOMM,
     +32HON /SP/ SP  COMMON /MP/ MP  COMM,
     +32HON /EP/ EP  COMMON /NP/ NP  COMM,
     +32HON /CSTORE/ STOREX  EQUIVALENCE(,
     +32HSTOREX(2),STORE(1),STORER(1))   ,
     +32HEQUIVALENCE(STOREX( ),   STRTBL ,
     +32H(1))EQUIVALENCE(STOREX( ),   SET,
     +32HTBL (1)) TYPE-ID     TYPE-ID    ,
     +32HCALLCALLCALLCALLCALLINTL(   ), I,
     +32HNTL(CALLCALLINTL(   ))  CALL(INT,
     +32HL(  ),INTL( ))  CALL P$LDC( INTL,
     +32H(   ))  CALL P$LDC( INTL(   INTL,
     +32H(   CALL P$LDC(1,   INTL(   ))  ,
     +32HCALL($  GOTO    CALL($  CALLCALL,
     +32H P  CALLCALL    STORER (SP -) = ,
     +32HSTORE (SP - ) = ,   STORE(SP-   ,
     +32HSTORE(STORE(SP- ))   CONTINUE   ,
     +32HCALL,'  ;') SP=SP-1 SP=SP-1  GOT,
     +32HO 99998  GOTO   LINENO =    LINE,
     +32HNO =    SUBROUTINE PSUBROUTINE P,
     +32H$MAIINTEGER*4   REAL    CALL T$T,
     +32HRAC(1,' OUTER BLOCK .') GOTO    ,
     +32H99998 CALL P$UJCCALL P$ENT(1,SG1,
     +32HSIZ)CALL P$ENT(2,SG2SIZ) LABEL  ,
     +32HCALL,'  ;') CALL T$TRAC(2,0)RETU,
     +32HRN  SG1SIZ =    SG2SIZ =    GOTO,
     +32H    END CALL T$TRAC(2,0)RETURN  ,
     +32HSG1SIZ =    SG2SIZ =    GOTO    ,
     +32HEND  *****  UNDECLARED  EXTERNAL,
     +32H    FILEINPUT   OUTPUT  PRR     ,
     +32HKEYBOARDFALSE   TRUE    INPUT   ,
     +32HOUTPUT  GET     PUT     RESET   ,
     +32HREWRITE READ    WRITE   PACK    ,
     +32HUNPACK  NEW     RELEASE READLN  ,
     +32HWRITELN PAGE    ABS     SQR     ,
     +32HTRUNC   ODD     ORD     CHR     ,
     +32HPRED    SUCC    EOF     EOLN    ,
     +32HSIN     COS     EXP     SQRT    ,
     +32HLN      ARCTAN  KEYBOARDPRR     ,
     +32HMARK    TIME    DATE    INTEGER ,
     +32HREAL    CHAR    BOOLEAN TEXT    ,
     +32HNIL     MAXINT                  ,
     +32H                                ,
     +32H        IF      DO      OF      ,
     +32HTO      IN      OR      END     ,
     +32HFOR     VAR     DIV     MOD     ,
     +32HSET     AND     NOT     THEN    ,
     +32HELSE    WITH    GOTO    CASE    ,
     +32HTYPE    FILE    BEGIN   UNTIL   ,
     +32HWHILE   ARRAY   CONST   LABEL   ,
     +32HREPEAT  RECORD  DOWNTO  PACKED  ,
     +32HEXTERN  FORWARD PROGRAM FORTRAN ,
     +32HFUNCTIONPROCEDUR                ,
     +32H                                ,
     +32H    error in simple type        ,
     +32H                        identifi,
     +32Her expected                     ,
     +32H            'program' expected  ,
     +32H                                ,
     +32H')' expected                    ,
     +32H                    ':' expected,
     +32H                                ,
     +32H        illegal symbol          ,
     +32H                            erro,
     +32Hr in parameter list             ,
     +32H                'of' expected   ,
     +32H                                ,
     +32H    '(' expected                ,
     +32H                        error in,
     +32H type                           ,
     +32H            '[' expected        ,
     +32H                                ,
     +32H']' expected                    ,
     +32H                    'end' expect,
     +32Hed                              ,
     +32H        ';' expected            ,
     +32H                            inte,
     +32Hger expected                    ,
     +32H                '=' expected    ,
     +32H                                ,
     +32H    'begin' expected            ,
     +32H                        error in,
     +32H declaration part               ,
     +32H            error in field-list ,
     +32H                                ,
     +32H',' expected                    ,
     +32H                    '*' expected,
     +32H                                ,
     +32H        error in constant       ,
     +32H                            ':=',
     +32H expected                       ,
     +32H                'then' expected ,
     +32H                                ,
     +32H    'until' expected            ,
     +32H                        'do' exp,
     +32Hected                           ,
     +32H            'to'/'downto' expect,
     +32Hed                              ,
     +32H'if' expected                   ,
     +32H                    'file' expec,
     +32Hted                             ,
     +32H        error in factor         ,
     +32H                            erro,
     +32Hr in variable                   ,
     +32H                ':' or '/' expec,
     +32Hted                             ,
     +32H    identifier declared twice   ,
     +32H                        low boun,
     +32Hd exceeds highbound             ,
     +32H            identifier is not of,
     +32H appropriate class              ,
     +32Hidentifier not declared         ,
     +32H                    sign not all,
     +32Howed                            ,
     +32H        number expected         ,
     +32H                            inco,
     +32Hmpatible subrange types         ,
     +32H                file not allowed,
     +32H here                           ,
     +32H    type must not be real       ,
     +32H                        tagfield,
     +32H type must be scalar or subrange,
     +32H            incompatible with ta,
     +32Hgfield type                     ,
     +32Hindex type must not be real     ,
     +32H                    index type m,
     +32Hust be scalar or subrange       ,
     +32H        base type must not be re,
     +32Hal                          base,
     +32H type must be scalar or subrange,
     +32H                error in type of,
     +32H standard procedure parameter   ,
     +32H    unsatisfied forward referenc,
     +32He                       forward ,
     +32Hreference type id in variable de,
     +32Hcln         fwd declared; repeti,
     +32Htion of param list illegal      ,
     +32Hfunc result type must be scalar,,
     +32H subrange or ptr    file value p,
     +32Harameter not allowed            ,
     +32H        fwd declared function; c,
     +32Hannot repeat result type    miss,
     +32Hing result type in function decl,
     +32Haration         F-format for rea,
     +32Hl only                          ,
     +32H    error in type of standard fu,
     +32Hnction parameter        number o,
     +32Hf params does not agree with dec,
     +32Hlaration    illegal parameter su,
     +32Hbstitution                      ,
     +32Hresult type of param func does n,
     +32Hot agree with decl  type conflic,
     +32Ht of operands                   ,
     +32H        expression is not of set,
     +32H type                       test,
     +32Hs on equality allowed only      ,
     +32H                strict inclusion,
     +32H not allowed                    ,
     +32H    file comparison not allowed ,
     +32H                        illegal ,
     +32Htype of operand(s)              ,
     +32H            type of operand must,
     +32H be Boolean                     ,
     +32Hset element type must be scalar ,
     +32Hor subrange         set element ,
     +32Htypes not compatible            ,
     +32H        type of variable is not ,
     +32Harray                       inde,
     +32Hx type is not compatible with de,
     +32Hclaration       type of variable,
     +32H is not record                  ,
     +32H    type of variable must be fil,
     +32He or pointer            illegal ,
     +32Hparameter substitution          ,
     +32H            illegal type of loop,
     +32H control variable               ,
     +32Hillegal type of expression      ,
     +32H                    type conflic,
     +32Ht                               ,
     +32H        assignment of files not ,
     +32Hallowed                     labe,
     +32Hl type incompatible with selecti,
     +32Hng expr         subrange bounds ,
     +32Hmust be scalar                  ,
     +32H    index type must not be integ,
     +32Her                      assignme,
     +32Hnt to standard function is not a,
     +32Hllowed      assignment to formal,
     +32H function is not allowed        ,
     +32Hno such field in this record    ,
     +32H                    type error i,
     +32Hn read                          ,
     +32H        actual parameter must be,
     +32H a variable                 cont,
     +32Hrol variable can't be formal or ,
     +32Hnon local       multidefined cas,
     +32He label                         ,
     +32H    too many cases in case state,
     +32Hment                    missing ,
     +32Hcorresponding variant declaratio,
     +32Hn           real or string tagfi,
     +32Helds not allowed                ,
     +32Hprevious declaration was not for,
     +32Hward                again forwar,
     +32Hd declared                      ,
     +32H        parameter size must be c,
     +32Honstant                     miss,
     +32Hing variant in declaration      ,
     +32H                substitution of ,
     +32Hstandard proc/func not allowed  ,
     +32H    multidefined label          ,
     +32H                        multidec,
     +32Hlared label                     ,
     +32H            undeclared label    ,
     +32H                                ,
     +32Hundefined label                 ,
     +32H                    error in bas,
     +32He set                           ,
     +32H        value parameter expected,
     +32H                            stan,
     +32Hdard file was redeclared        ,
     +32H                undeclared exter,
     +32Hnal file                        ,
     +32H    Fortran procedure or functio,
     +32Hn expected              Pascal p,
     +32Hrocedure or function expected   ,
     +32H            missing file 'input',
     +32H in program heading             ,
     +32Hmissing file 'output' in program,
     +32H heading            assgt to fun,
     +32Hction identifier not allowed her,
     +32He       multidefined record vari,
     +32Hant                         X-op,
     +32Ht of actual proc/func does not m,
     +32Hatch decl       control variable,
     +32H must not be formal             ,
     +32H    constant part of address out,
     +32H of range               file mus,
     +32Ht be file of char               ,
     +32H            pathname linkage not,
     +32H allowed for temporary files    ,
     +32Herror in real constant: digit ex,
     +32Hpected              string const,
     +32Hant must not exceed source line ,
     +32H        integer constant exceeds,
     +32H range                      8 or,
     +32H 9 in octal number              ,
     +32H                string constant ,
     +32Hlength must not be zero         ,
     +32H    integer part of real constan,
     +32Ht exceeds range         too many,
     +32H nested scopes of identifiers   ,
     +32H            too many nested proc,
     +32Hedures and/or functions         ,
     +32Htoo many forward references of p,
     +32Hrocedure entries    procedure to,
     +32Ho long                          ,
     +32H        too many long constants ,
     +32Hin this procedure           too ,
     +32Hmany errors on this source line ,
     +32H                too many externa,
     +32Hl references                    ,
     +32H    too many externals          ,
     +32H                        too many,
     +32H local files                    ,
     +32H            expression too compl,
     +32Hicated                          ,
     +32Htoo many exit labels            ,
     +32H                    pathname too,
     +32H long                           ,
     +32H        division by zero        ,
     +32H                            no c,
     +32Hase provided for this value     ,
     +32H                index expression,
     +32H out of bounds                  ,
     +32H    value to be assigned is out ,
     +32Hof bounds               element ,
     +32Hexpression out of range         ,
     +32H            unknown -- see proce,
     +32Hdure selector                   ,
     +32Hunknown -- see recog of string c,
     +32Honst in insymbol    unknown -- s,
     +32Hee procedure gentypindicator    ,
     +32H        unknown -- see procedure,
     +32H store                      read,
     +32Hing of packed arrays not impleme,
     +32Hnted            unknown -- see p,
     +32Hrocedure loadaddress            ,
     +32H    unknown -- see procedure loa,
     +32Hdaddress                fortran ,
     +32Hfunc result type must be integer,
     +32H or real    implementation restr,
     +32Hiction                          ,
     +32Hmiscellaneous                   ,
     +32H                    not implemen,
     +32Hted in this version             ,
     +32H         P$GET   P$PUT   P$RDI  ,
     +32H P$RDR   P$RDC   P$WRI   P$WRO  ,
     +32H P$WRR   P$WRC   P$WRS   P$PAK  ,
     +32H P$NEW   P$RST   P$ELN   P$SIN  ,
     +32H P$COS   P$EXP   P$SQT   P$LOG  ,
     +32H P$ATN   P$RLN   P$WLN   P$SAV  ,
     +32H P$RES   P$RWR   P$PAG   P$BRD  ,
     +32H P$BWR   P$DAT   P$ABI   P$ABR  ,
     +32H P$ADI   P$ADR   P$AND   P$DIF  ,
     +32H P$DVI   P$DVR   P$EOF   P$FLO  ,
     +32H P$FLT   P$INN   P$INT   P$IOR  ,
     +32H P$MOD   P$MPI   P$MPR   P$NGI  ,
     +32H P$NGR   P$NOT   P$ODD   P$SBI  ,
     +32H P$SBR   P$SGS   P$SQI   P$SQR  ,
     +32H P$STO   P$TRC   P$UNI   P$STP  ,
     +32H P$CSP   P$DEC   P$ENT   P$FJP  ,
     +32H P$INC   P$IND   P$IXA   P$LAO  ,
     +32H P$LCA   P$LDO   P$MOV   P$MST  ,
     +32H P$RET   P$SRO   P$XJP   P$CHK  ,
     +32H P$CUP   P$EQU   P$GEQ   P$GRT  ,
     +32H P$LDA   P$LDC   P$LEQ   P$LES  ,
     +32H P$LOD   P$NEQ   P$STR   P$UJP  ,
     +32H         P$MTS   P$UJC   P$LPC  ,
     +32H P$SPC   P$CLS   P$REM   P$INF  ,
     +32HCALL MAIN   END SUBROUTINE MAIN ,
     +32HINTEGER*4 STRGS (   ), SETS (400,
     +32H)   DATA SETS /      +: *0/ DATA,
     +32H STRGS /+32H*0  CALL MOVE2S(LOC(,
     +32HSTRGS), LOC(STRTBL),    CALL MOV,
     +32HE2S(LOC(SETS), LOC(SETTBL), CALL,
     +32H P$INIT(CALL P$MST(0)   CALL P$C,
     +32HUP(0)   CALL P$MAIN ERRKTR  CALL,
     +32H P$LAO( CALL P$FMS(' errors in p,
     +32Hascal program.')CALL P$STP  END ,3376*0/

      CALL MOVE2S(LOC(STRGS), LOC(STRTBL), 5536)
      CALL MOVE2S(LOC(SETS), LOC(SETTBL), 378)
      CALL P$INIT(1)
      CALL P$MST(0)
      CALL P$CUP(0)
      CALL P$MAIN
      CALL P$STP
      END
