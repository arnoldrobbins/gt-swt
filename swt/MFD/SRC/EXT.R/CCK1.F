      INTEGER SBP(100),BP,LVL,I
      INTEGER GETLIN
      INTEGER BUF(4096)
      BP=1
      LVL=0
10000 IF((GETLIN(BUF(BP),-10,4096-BP).EQ.-1))GOTO 10001
        I=BP
        GOTO 10004
10002   I=I+(1)
10004   IF((BUF(I).EQ.0))GOTO 10003
          IF((BUF(I).NE.163))GOTO 10005
            LVL=LVL+(1)
            IF((LVL.LE.100))GOTO 10006
              CALL ERROR('Too many nesting levels.')
10006       SBP(LVL)=I
            GOTO 10007
10005       IF((BUF(I).NE.138))GOTO 10008
              CALL PUTLIN(BUF(SBP(LVL)),-11)
              BP=SBP(LVL)
              LVL=LVL-(1)
              IF((LVL.GE.0))GOTO 10009
                CALL ERROR('Nesting stack underflow.')
10009       CONTINUE
10008     CONTINUE
10007   GOTO 10002
10003 GOTO 10000
10001 CALL SWT
      END
C ---- Long Name Map ----
