      INTEGER MEM(10000)
      COMMON /DS$MEM/MEM
      INTEGER FD,ADDRE0,I,CODE,SIZE
      INTEGER OPEN,GETARG,GCTOI
      INTEGER ARG(102)
      CALL DSINIT(10000)
      IF((GETARG(1,ARG,102).NE.-1))GOTO 10000
        CALL ERROR('Usage: ap <file> [ <start address> ].')
10000 FD=OPEN(ARG,1)
      IF((FD.NE.-3))GOTO 10001
        CALL CANT(ARG)
10001 IF((GETARG(2,ARG,102).NE.-1))GOTO 10002
        ADDRE0=0
        GOTO 10003
10002   I=1
        ADDRE0=GCTOI(ARG,I,16)
10003 CALL LOAD(FD,CODE,SIZE)
      CALL RELOC0(FD,CODE,SIZE,ADDRE0)
      CALL DUMP(CODE,SIZE,ADDRE0)
      CALL CLOSE(FD)
      CALL SWT
      END
      SUBROUTINE LOAD(FD,CODE,SIZE)
      INTEGER FD,SIZE
      INTEGER CODE
      INTEGER MEM(10000)
      COMMON /DS$MEM/MEM
      INTEGER I,B
      INTEGER GETBY0
      INTEGER DSGET
      IF((GETBY0(B,FD).EQ.-1))GOTO 10005
      IF((B.NE.1))GOTO 10005
      GOTO 10004
10005   CALL ERROR('badly formed code file.')
10004 CALL GETWO0(SIZE,FD)
      CODE=DSGET(SIZE)
      I=0
      GOTO 10008
10006 I=I+1
10008 IF((I.GE.SIZE))GOTO 10007
        CALL GETBY0(MEM(CODE+I),FD)
      GOTO 10006
10007 RETURN
      END
      SUBROUTINE RELOC0(FD,CODE,SIZE,ADDRE0)
      INTEGER FD,SIZE,ADDRE0
      INTEGER CODE
      INTEGER MEM(10000)
      COMMON /DS$MEM/MEM
      INTEGER I,MAP,ADDR,UNNEC0
      INTEGER GETBY0
      IF((ADDRE0.NE.0))GOTO 10009
        RETURN
10009 IF((GETBY0(I,FD).EQ.-1))GOTO 10011
      IF((I.NE.2))GOTO 10011
      GOTO 10010
10011   CALL ERROR('badly formed code file.')
10010 CALL GETWO0(I,FD)
      I=0
      GOTO 10014
10012 I=I+1
10014 IF((I.GE.SIZE))GOTO 10013
        IF((MOD(I,8).NE.0))GOTO 10015
          CALL GETBY0(MAP,FD)
10015   IF((AND(MAP,LS(1,7-MOD(I,8))).EQ.0))GOTO 10016
          ADDR=ADDRE0+MEM(CODE+I+1)+LS(MEM(CODE+I),8)
          UNNEC0=CODE+I
          MEM(UNNEC0)=RS(ADDR,8)
          UNNEC0=UNNEC0+1
          MEM(UNNEC0)=RT(ADDR,8)
10016 GOTO 10012
10013 RETURN
      END
      SUBROUTINE DUMP(CODE,SIZE,ADDRE0)
      INTEGER CODE,SIZE,ADDRE0
      INTEGER MEM(10000)
      COMMON /DS$MEM/MEM
      INTEGER W
      INTEGER CRC
      INTEGER AAAAA0(20)
      INTEGER AAAAB0(10)
      INTEGER AAAAC0(11)
      DATA AAAAA0/170,180,172,173,177,182,172,176,233,160,170,180,172,17
     *7,182,172,176,233,160,0/
      DATA AAAAB0/170,178,172,173,177,182,172,176,233,0/
      DATA AAAAC0/160,170,180,172,173,177,182,172,176,233,0/
      CALL PRINT(-11,'L.')
      CALL PRINT(-11,AAAAA0,ADDRE0,SIZE)
      W=0
      GOTO 10019
10017 W=W+(1)
10019 IF((W.GE.SIZE))GOTO 10018
        CALL PRINT(-11,AAAAB0,MEM(W+CODE))
      GOTO 10017
10018 CALL PRINT(-11,AAAAC0,CRC(CODE,SIZE))
      RETURN
      END
      INTEGER FUNCTION CRC(CODE,SIZE)
      INTEGER CODE,SIZE
      INTEGER MEM(10000)
      COMMON /DS$MEM/MEM
      INTEGER MASK,SR,W,TEMP
      MASK=128
      SR=0
      W=0
10020   IF((MASK.NE.0))GOTO 10021
          W=W+(1)
          IF((W.LT.SIZE))GOTO 10022
            GOTO 10023
10022     MASK=128
10021   TEMP=0
        IF((AND(MEM(W+CODE),MASK).EQ.0))GOTO 10024
          TEMP=NOT(TEMP)
10024   IF((AND(SR,:100000).EQ.0))GOTO 10025
          TEMP=NOT(TEMP)
10025   IF((AND(SR,512).EQ.0))GOTO 10026
          TEMP=NOT(TEMP)
10026   IF((AND(SR,128).EQ.0))GOTO 10027
          TEMP=NOT(TEMP)
10027   IF((AND(SR,16).EQ.0))GOTO 10028
          TEMP=NOT(TEMP)
10028   IF((AND(SR,1).EQ.0))GOTO 10029
          TEMP=NOT(TEMP)
10029   SR=RS(SR,1)
        IF((TEMP.EQ.0))GOTO 10030
          SR=OR(SR,:100000)
10030   MASK=RS(MASK,1)
      GOTO 10020
10023 CRC=SR
      RETURN
      END
      SUBROUTINE GETBY0(B,FD)
      INTEGER B,FD
      INTEGER JUNK
      INTEGER MAPFD
      CALL PRWF$$(:1,MAPFD(FD),LOC(B),1,INTL(0),JUNK,JUNK)
      RETURN
      END
      SUBROUTINE GETWO0(W,FD)
      INTEGER W,FD
      INTEGER HI,LO
      CALL GETBY0(HI,FD)
      CALL GETBY0(LO,FD)
      W=OR(LS(HI,8),LO)
      RETURN
      END
C ---- Long Name Map ----
C address                        addre0
C getbyte                        getby0
C relocate                       reloc0
C getword                        getwo0
C unnecessary                    unnec0