      INTEGER TD(11)
      REAL CTIME
      CALL TIMDAT(TD,11)
      CTIME=TD(8)
      CTIME=CTIME/TD(11)
      CTIME=CTIME+TD(7)
      CALL PRINT(-11,'*,3r*n.',CTIME)
      CALL SWT
      END
C ---- Long Name Map ----
