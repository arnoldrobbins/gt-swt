      INTEGER GETARG
      INTEGER ARG(102)
      INTEGER AAAAA0(1)
      DATA AAAAA0/0/
      IF((GETARG(1,ARG,102).NE.-1))GOTO 10000
        CALL EDIT(AAAAA0,-10,-11)
        GOTO 10001
10000   CALL EDIT(ARG,-10,-11)
10001 CALL SWT
      END
C ---- Long Name Map ----