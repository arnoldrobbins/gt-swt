      INTEGER ARG(128),START0(256),ENDPAT(256),LINE(102)
      INTEGER INCLU0,INCLV0,PRINT0,ENDGI0
      INTEGER MATCH,MAKPAT,GETARG,GETLIN,EQUAL
      INTEGER AAAAA0(3)
      INTEGER AAAAB0(3)
      INTEGER AAAAC0(3)
      INTEGER AAAAD0(3)
      DATA AAAAA0/173,233,0/
      DATA AAAAB0/173,248,0/
      DATA AAAAC0/173,233,0/
      DATA AAAAD0/173,248,0/
      IF((GETARG(1,ARG,128).NE.-1))GOTO 10000
        CALL USAGE
10000 CALL MAPSTR(ARG,1)
      IF((EQUAL(ARG,AAAAA0).NE.1))GOTO 10001
        INCLU0=1
        GOTO 10002
10001   IF((EQUAL(ARG,AAAAB0).NE.1))GOTO 10003
          INCLU0=0
          GOTO 10004
10003     CALL USAGE
10004 CONTINUE
10002 IF((GETARG(2,ARG,128).NE.-1))GOTO 10005
        CALL USAGE
10005 IF((MAKPAT(ARG,1,0,START0).NE.-3))GOTO 10006
        CALL ERROR('start pattern is ill-formed.')
10006 IF((GETARG(3,ARG,128).NE.-1))GOTO 10007
        ENDGI0=0
        GOTO 10008
10007   CALL MAPSTR(ARG,1)
        IF((EQUAL(ARG,AAAAC0).NE.1))GOTO 10009
          INCLV0=1
          GOTO 10010
10009     IF((EQUAL(ARG,AAAAD0).NE.1))GOTO 10011
            INCLV0=0
            GOTO 10012
10011       CALL USAGE
10012   CONTINUE
10010   IF((GETARG(4,ARG,128).NE.-1))GOTO 10013
          CALL USAGE
10013   IF((MAKPAT(ARG,1,0,ENDPAT).NE.-3))GOTO 10014
          CALL ERROR('end pattern is ill-formed.')
10014   ENDGI0=1
10008 PRINT0=0
10015 IF((GETLIN(LINE,-10).EQ.-1))GOTO 10016
        IF((PRINT0.NE.1))GOTO 10017
          IF((ENDGI0.NE.1))GOTO 10018
          IF((MATCH(LINE,ENDPAT).NE.1))GOTO 10018
            IF((INCLV0.NE.1))GOTO 10019
              CALL PUTLIN(LINE,-11)
10019       GOTO 10016
10018     CALL PUTLIN(LINE,-11)
          GOTO 10020
10017     IF((MATCH(LINE,START0).NE.1))GOTO 10021
            PRINT0=1
            IF((INCLU0.NE.1))GOTO 10022
              CALL PUTLIN(LINE,-11)
10022     CONTINUE
10021   CONTINUE
10020 GOTO 10015
10016 CALL SWT
      END
      SUBROUTINE USAGE
      CALL ERROR('Usage:  slice (-i|-x) <start_pat> (-i|-x) <end_pat>.')
      END
C ---- Long Name Map ----
C printing                       print0
C includeend                     inclv0
C startpat                       start0
C endgiven                       endgi0
C includestart                   inclu0
