      INTEGER MACH(102),ARG(102)
      INTEGER * 4 SIZE
      INTEGER CODEF,THISS0,JUNK,TYPE,MACHI0
      INTEGER GETARG,OPEN,GETBY0,EQUAL
      INTEGER MOTOR0(6)
      INTEGER INTEL0(6)
      INTEGER DEFAU0(6)
      DATA MOTOR0/173,182,184,176,176,0/
      DATA INTEL0/173,184,176,184,176,0/
      DATA DEFAU0/236,174,239,245,244,0/
      IF((GETARG(1,MACH,102).NE.-1))GOTO 10000
        CALL ERROR('Usage: size -(6800|8080) [<object_file>].')
10000 IF((EQUAL(MACH,MOTOR0).NE.1))GOTO 10001
        MACHI0=0
        GOTO 10002
10001   IF((EQUAL(MACH,INTEL0).NE.1))GOTO 10003
          MACHI0=1
          GOTO 10004
10003     CALL ERROR('Usage:  size -(6800|8080) [<object_file>].')
10004 CONTINUE
10002 IF((GETARG(2,ARG,102).NE.-1))GOTO 10005
        CALL SCOPY(DEFAU0,1,ARG,1)
10005 CODEF=OPEN(ARG,1)
      IF((CODEF.NE.-3))GOTO 10006
        CALL CANT(ARG)
10006 SIZE=0
10007 IF((GETBY0(TYPE,CODEF).NE.-2))GOTO 10008
        IF((TYPE.EQ.1))GOTO 10009
          CALL GETWO0(THISS0,CODEF,MACHI0)
          GOTO 10012
10010     THISS0=THISS0-1
10012     IF((THISS0.LE.0))GOTO 10011
            CALL GETBY0(JUNK,CODEF)
          GOTO 10010
10011     GOTO 10013
10009     CALL GETWO0(THISS0,CODEF,MACHI0)
          SIZE=SIZE+THISS0
          GOTO 10016
10014     THISS0=THISS0-1
10016     IF((THISS0.LE.0))GOTO 10015
            CALL GETBY0(JUNK,CODEF)
          GOTO 10014
10015   CONTINUE
10013 GOTO 10007
10008 CALL CLOSE(CODEF)
      CALL PRINT(-11,'*l*n.',SIZE)
      CALL SWT
      END
      INTEGER FUNCTION GETBY0(B,FD)
      INTEGER B,FD
      INTEGER JUNK,RC
      INTEGER MAPFD
      CALL PRWF$$(:1,MAPFD(FD),LOC(B),1,INTL(0),JUNK,RC)
      IF((RC.NE.0))GOTO 10017
        GETBY0=-2
        GOTO 10018
10017   GETBY0=-3
10018 RETURN
      END
      SUBROUTINE GETWO0(W,FD,M)
      INTEGER W,FD,M
      INTEGER HI,LO
      IF((M.NE.0))GOTO 10019
        CALL GETBY0(HI,FD)
        CALL GETBY0(LO,FD)
        GOTO 10020
10019   IF((M.NE.1))GOTO 10021
          CALL GETBY0(LO,FD)
          CALL GETBY0(HI,FD)
10021 CONTINUE
10020 W=OR(LS(HI,8),LO)
      RETURN
      END
C ---- Long Name Map ----
C default                        defau0
C intel8080                      intel0
C thissize                       thiss0
C getbyte                        getby0
C getword                        getwo0
C machine                        machi0
C motorola6800                   motor0
