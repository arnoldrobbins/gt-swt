      INTEGER LWB,UPB,NUM,I,SEED,TD(10)
      INTEGER GCTOI
      INTEGER ARG(128)
      INTEGER DASHL(3)
      INTEGER DASHU(3)
      INTEGER DASHN(3)
      INTEGER S1(2)
      INTEGER S100(4)
      DATA DASHL/173,236,0/
      DATA DASHU/173,245,0/
      DATA DASHN/173,238,0/
      DATA S1/177,0/
      DATA S100/177,176,176,0/
      CALL GETKWD(DASHL,ARG,128,S1)
      I=1
      LWB=GCTOI(ARG,I,10)
      CALL GETKWD(DASHU,ARG,128,S100)
      I=1
      UPB=GCTOI(ARG,I,10)
      CALL GETKWD(DASHN,ARG,128,S1)
      I=1
      NUM=GCTOI(ARG,I,10)
      CALL TIMDAT(TD,10)
      SEED=0
      DO 10000 I=1,10
        SEED=SEED+TD(I)
10000 CONTINUE
10001 CALL RND(IABS(SEED))
      I=1
      GOTO 10004
10002 I=I+1
10004 IF((I.GT.NUM))GOTO 10003
        CALL PRINT(-11,'*i*n.',INTS((UPB-LWB)*RND(0)+LWB))
      GOTO 10002
10003 CALL SWT
      END
C ---- Long Name Map ----