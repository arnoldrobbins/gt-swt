      INTEGER FD,ADDRE0,I,CODE,SIZE
      INTEGER OPEN,GETARG,GCTOI
      INTEGER ARG(102)
      INTEGER DEFAU0(6)
      DATA DEFAU0/236,174,239,245,244,0/
      CALL DSINIT(16384)
      IF((GETARG(1,ARG,102).NE.-1))GOTO 10000
        CALL SCOPY(DEFAU0,1,ARG,1)
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
      INTEGER MEM(16384)
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
      INTEGER MEM(16384)
      COMMON /DS$MEM/MEM
      INTEGER I,MAP,ADDR,UNNEC0
      INTEGER GETBY0
      IF((GETBY0(I,FD).EQ.-1))GOTO 10010
      IF((I.NE.2))GOTO 10010
      GOTO 10009
10010   CALL ERROR('badly formed code file.')
10009 CALL GETWO0(I,FD)
      I=0
      GOTO 10013
10011 I=I+1
10013 IF((I.GE.SIZE))GOTO 10012
        IF((MOD(I,8).NE.0))GOTO 10014
          CALL GETBY0(MAP,FD)
10014   IF((AND(MAP,LS(1,7-MOD(I,8))).EQ.0))GOTO 10015
          ADDR=ADDRE0+MEM(CODE+I)+LS(MEM(CODE+I+1),8)
          UNNEC0=CODE+I
          MEM(UNNEC0)=RT(ADDR,8)
          UNNEC0=UNNEC0+1
          MEM(UNNEC0)=RS(ADDR,8)
10015 GOTO 10011
10012 RETURN
      END
      SUBROUTINE DUMP(CODE,SIZE,ADDRE0)
      INTEGER CODE,SIZE,ADDRE0
      INTEGER MEM(16384)
      COMMON /DS$MEM/MEM
      INTEGER TW,MCONT,CKSUM
      TW=0
10016 IF((TW.GE.SIZE))GOTO 10017
        CALL PRINT(-11,':.')
        IF((SIZE-TW.GE.16))GOTO 10018
          MCONT=SIZE-TW
          GOTO 10019
10018     MCONT=16
10019   CKSUM=0
        CALL OUTHEX(MCONT,CKSUM)
        CALL OUTHEX(RS(TW+ADDRE0,8),CKSUM)
        CALL OUTHEX(RT(TW+ADDRE0,8),CKSUM)
        CALL OUTHEX(0,CKSUM)
10020     CALL OUTHEX(MEM(TW+CODE),CKSUM)
          TW=TW+1
          MCONT=MCONT-1
        IF((MCONT.GT.0))GOTO 10020
        CALL OUTHEX(0-CKSUM,CKSUM)
        CALL PRINT(-11,'*n.')
      GOTO 10016
10017 CALL PRINT(-11,':00*n.')
      RETURN
      END
      SUBROUTINE OUTHEX(BYTE,CHECK0)
      INTEGER BYTE,CHECK0
      INTEGER HEX(17)
      DATA HEX/176,177,178,179,180,181,182,183,184,185,193,194,195,196,1
     *97,198,0/
      CALL PUTCH(HEX(RT(RS(BYTE,4),4)+1),-11)
      CALL PUTCH(HEX(RT(BYTE,4)+1),-11)
      CHECK0=RT(CHECK0+BYTE,8)
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
      CALL GETBY0(LO,FD)
      CALL GETBY0(HI,FD)
      W=OR(LS(HI,8),LO)
      RETURN
      END
C ---- Long Name Map ----
C default                        defau0
C address                        addre0
C getbyte                        getby0
C relocate                       reloc0
C getword                        getwo0
C checksum                       check0
C unnecessary                    unnec0