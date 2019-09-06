      INTEGER VTTERM,VT$CLR
      INTEGER I,TERMT0(7)
      IF((VTTERM(TERMT0).EQ.-3))GOTO 10001
      IF((VT$CLR(I).EQ.-3))GOTO 10001
      GOTO 10000
10001   I=1
        GOTO 10004
10002   I=I+(1)
10004   IF((I.GT.25))GOTO 10003
          CALL PUTCH(138,-11)
        GOTO 10002
10003 CONTINUE
10000 CALL SWT
      END
C ---- Long Name Map ----
C termtype                       termt0
