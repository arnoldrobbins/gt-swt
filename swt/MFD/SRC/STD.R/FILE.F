      INTEGER FILTST,RESULT,GETARG,ARGNO
      INTEGER PATHN0(102)
      INTEGER ZEROL0,EXISTS,TYPE,PERMI0,GOTPA0,I
      INTEGER READA0,WRITA0,DUMPED
      INTEGER ARG(102)
      INTEGER PBITS(6)
      INTEGER AAAAA0(29)
      DATA AAAAA0/170,243,186,160,227,225,238,238,239,244,160,244,229,24
     *3,244,160,227,239,238,228,233,244,233,239,238,243,170,238,0/
      PERMI0=0
      TYPE=0
      EXISTS=1
      ZEROL0=0
      READA0=0
      WRITA0=0
      DUMPED=0
      ARGNO=1
      GOTPA0=0
      PBITS(1)=:2000
      PBITS(2)=:1000
      PBITS(3)=:400
      PBITS(4)=:4
      PBITS(5)=:2
      PBITS(6)=:1
10000 IF((-1.EQ.GETARG(ARGNO,ARG,102)))GOTO 10001
        IF((ARG(1).NE.173))GOTO 10002
          CALL MAPSTR(ARG,2)
          IF((ARG(2).EQ.196))GOTO 10003
          IF((ARG(2).EQ.197))GOTO 10003
          IF((ARG(2).EQ.206))GOTO 10003
          IF((ARG(2).EQ.208))GOTO 10003
          IF((ARG(2).EQ.211))GOTO 10003
          IF((ARG(2).EQ.213))GOTO 10003
          IF((ARG(2).EQ.215))GOTO 10003
          IF((ARG(2).EQ.210))GOTO 10003
          IF((ARG(2).EQ.218))GOTO 10003
            CALL USAGE
10003     IF((ARG(2).NE.196))GOTO 10004
            TYPE=:100001
10004     IF((ARG(2).NE.197))GOTO 10005
            EXISTS=1
10005     IF((ARG(2).NE.208))GOTO 10006
            IF((-1.NE.GETARG(ARGNO+1,ARG,102)))GOTO 10007
              CALL USAGE
10007       ARGNO=ARGNO+1
            I=1
            GOTO 10010
10008       I=I+1
10010       IF((I.GT.6))GOTO 10009
              IF((ARG(I).EQ.173))GOTO 10011
                PERMI0=OR(PERMI0,PBITS(I))
10011       GOTO 10008
10009     CONTINUE
10006     IF((ARG(2).NE.210))GOTO 10012
            READA0=1
10012     IF((ARG(2).NE.211))GOTO 10013
            TYPE=:100000
10013     IF((ARG(2).NE.213))GOTO 10014
            TYPE=:100004
10014     IF((ARG(2).NE.215))GOTO 10015
            WRITA0=1
10015     IF((ARG(2).NE.218))GOTO 10016
            ZEROL0=1
10016     IF((ARG(2).NE.206))GOTO 10017
            IF((ARG(3).EQ.197))GOTO 10018
            IF((ARG(3).EQ.215))GOTO 10018
            IF((ARG(3).EQ.210))GOTO 10018
            IF((ARG(3).EQ.218))GOTO 10018
              CALL USAGE
10018       IF((ARG(3).NE.197))GOTO 10019
              EXISTS=-1
10019       IF((ARG(3).NE.210))GOTO 10020
              READA0=-1
10020       IF((ARG(3).NE.215))GOTO 10021
              WRITA0=-1
10021       IF((ARG(3).NE.218))GOTO 10022
              ZEROL0=-1
10022     CONTINUE
10017     GOTO 10023
10002     CALL SCOPY(ARG,1,PATHN0,1)
          GOTPA0=1
10023   ARGNO=ARGNO+1
      GOTO 10000
10001 IF((GOTPA0.NE.0))GOTO 10024
        CALL USAGE
10024 RESULT=FILTST(PATHN0,ZEROL0,PERMI0,EXISTS,TYPE,READA0,WRITA0,DUMPE
     *D)
      IF((RESULT.NE.1))GOTO 10025
        CALL PRINT(-11,'1*n.')
        GOTO 10026
10025   IF((RESULT.NE.0))GOTO 10027
          CALL PRINT(-11,'0*n.')
          GOTO 10028
10027     IF((RESULT.NE.-3))GOTO 10029
            CALL PRINT(-11,'0*n.')
            CALL PRINT(-15,AAAAA0,PATHN0)
10029   CONTINUE
10028 CONTINUE
10026 CALL SWT
      END
      SUBROUTINE USAGE
      CALL ERROR('Usage: file <pathname> -d -[n]e -p twrtwr -[n]r -s -u 
     *-[n]w -[n]z.')
      RETURN
      END
C ---- Long Name Map ----
C zerolength                     zerol0
C pathname                       pathn0
C gotpath                        gotpa0
C writable                       writa0
C readable                       reada0
C permissions                    permi0
