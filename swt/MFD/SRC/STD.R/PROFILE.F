      INTEGER PROF(102),NAME(102),DICT(102)
      INTEGER NUMRTN,JUNK,CODE,FD,I,DICTFD,TIME(15)
      INTEGER * 4 RECORD(4,200),REALT0,CPUTO0,DISKI0,TICKS
      INTEGER OPEN,MAPFD
      CALL TIMDAT(TIME,15)
      TICKS=TIME(11)
      CALL OPTARG(PROF,DICT)
      FD=OPEN(PROF,1)
      IF((FD.NE.-3))GOTO 10000
        CALL CANT(PROF)
10000 NUMRTN=1
      GOTO 10003
10001 NUMRTN=NUMRTN+(1)
10003 IF((NUMRTN.GT.200))GOTO 10002
        CALL PRWF$$(:1,MAPFD(FD),LOC(RECORD(1,NUMRTN)),8,INTL(0),JUNK,CO
     *DE)
        IF((CODE.EQ.0))GOTO 10004
          GOTO 10002
10004 GOTO 10001
10002 NUMRTN=NUMRTN-(1)
      CALL CLOSE(FD)
      REALT0=0
      CPUTO0=0
      DISKI0=0
      I=1
      GOTO 10007
10005 I=I+(1)
10007 IF((I.GT.NUMRTN))GOTO 10006
        REALT0=REALT0+RECORD(2,I)
        CPUTO0=CPUTO0+RECORD(3,I)
        DISKI0=DISKI0+RECORD(4,I)
      GOTO 10005
10006 DICTFD=OPEN(DICT,1)
      IF((DICTFD.NE.-3))GOTO 10008
        CALL CANT(DICT)
10008 CALL PRINT(-11,'  Real            CPU           Disk      Count   
     * Routine*n.')
      CALL PRINT(-11,' Sec  %     Sec  %  ms/call    Sec  %             
     *  Name*n.')
      CALL PRINT(-11,'---- ---   ---- --- -------   ---- ---   -------  
     * ----------*n*n.')
      I=1
      GOTO 10011
10009 I=I+(1)
10011 IF((I.GT.NUMRTN))GOTO 10010
        CALL PRINT(-11,'*4l.',RECORD(2,I)/TICKS)
        IF((REALT0.EQ.0))GOTO 10012
          CALL PRINT(-11,' *3l.',(100*RECORD(2,I))/REALT0)
          GOTO 10013
10012     CALL PRINT(-11,'   0.')
10013   CALL PRINT(-11,'   *4l.',RECORD(3,I)/TICKS)
        IF((CPUTO0.EQ.0))GOTO 10014
          CALL PRINT(-11,' *3l.',(100*RECORD(3,I))/CPUTO0)
          GOTO 10015
10014     CALL PRINT(-11,'   0.')
10015   IF((RECORD(1,I).EQ.0))GOTO 10016
          CALL PRINT(-11,' *7l.',((1000*RECORD(3,I))/TICKS)/RECORD(1,I))
          GOTO 10017
10016     CALL PRINT(-11,'       0.')
10017   CALL PRINT(-11,'   *4l.',RECORD(4,I)/TICKS)
        IF((DISKI0.EQ.0))GOTO 10018
          CALL PRINT(-11,' *3l.',(100*RECORD(4,I))/DISKI0)
          GOTO 10019
10018     CALL PRINT(-11,'   0.')
10019   CALL PRINT(-11,'   *7l.',RECORD(1,I))
        CALL GETLIN(NAME,DICTFD)
        CALL PRINT(-11,'   *s.',NAME)
      GOTO 10009
10010 CALL PRINT(-11,'*n*nTotal real: *l   CPU: *l   Disk: *l*n.',REALT0
     */TICKS,CPUTO0/TICKS,DISKI0/TICKS)
      CALL CLOSE(DICTFD)
      CALL SWT
      END
      SUBROUTINE OPTARG(PROF,DICT)
      INTEGER PROF(102),DICT(102)
      INTEGER I
      INTEGER GETARG
      INTEGER ARG(102)
      INTEGER DEFAU0(9)
      INTEGER DEFAV0(17)
      DATA DEFAU0/223,240,242,239,230,233,236,229,0/
      DATA DEFAV0/244,233,237,229,242,223,228,233,227,244,233,239,238,22
     *5,242,249,0/
      CALL SCOPY(DEFAU0,1,PROF,1)
      CALL SCOPY(DEFAV0,1,DICT,1)
      I=1
      GOTO 10022
10020 I=I+(1)
10022 IF((GETARG(I,ARG,102).EQ.-1))GOTO 10021
        IF((ARG(1).NE.173))GOTO 10023
        IF(((ARG(2).NE.228).AND.(ARG(2).NE.196)))GOTO 10023
          I=I+(1)
          IF((GETARG(I,DICT,128).NE.-1))GOTO 10024
            CALL ERROR('Usage: profile [ -d <dictionary> ] [ <profile> ]
     *.')
10024     GOTO 10025
10023     CALL SCOPY(ARG,1,PROF,1)
10025 GOTO 10020
10021 RETURN
      END
C ---- Long Name Map ----
C cputotal                       cputo0
C defaultprof                    defau0
C realtotal                      realt0
C diskiototal                    diski0
C defaultdict                    defav0
