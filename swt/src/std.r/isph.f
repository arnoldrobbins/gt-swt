      INTEGER DUMMY
      INTEGER ISPH$
      INTEGER AAAAA0(4)
      INTEGER AAAAB0(4)
      DATA AAAAA0/177,170,238,0/
      DATA AAAAB0/176,170,238,0/
      IF((ISPH$(DUMMY).NE.1))GOTO 10000
        CALL PRINT(-11,AAAAA0)
        GOTO 10001
10000   CALL PRINT(-11,AAAAB0)
10001 CALL SWT
      END
C ---- Long Name Map ----
