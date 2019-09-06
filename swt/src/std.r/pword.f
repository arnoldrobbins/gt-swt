      INTEGER DUPLX$,EQUAL,INPUT
      INTEGER CODE,I,SAVED0
      INTEGER OPW(9),NPW(9)
      INTEGER BUF1(102),BUF2(102)
      INTEGER AAAAA0(17)
      INTEGER AAAAB0(17)
      INTEGER AAAAC0(42)
      INTEGER AAAAD0
      DATA AAAAA0/207,236,228,160,240,225,243,243,247,239,242,228,186,16
     *0,170,243,0/
      DATA AAAAB0/206,229,247,160,240,225,243,243,247,239,242,228,186,16
     *0,170,243,0/
      DATA AAAAC0/210,229,229,238,244,229,242,160,238,229,247,160,240,22
     *5,243,243,247,239,242,228,160,230,239,242,160,246,229,242,233,230,
     *233,227,225,244,233,239,238,186,160,170,243,0/
      SAVED0=DUPLX$(-1)
      CALL DUPLX$(:140000)
      IF((INPUT(-10,AAAAA0,BUF1).EQ.-1))GOTO 10000
        CALL PUTCH(138,-11)
        I=1
        CALL CTOV(BUF1,I,OPW,9)
        IF((INPUT(-10,AAAAB0,BUF1).EQ.-1))GOTO 10001
          CALL PUTCH(138,-11)
          IF((INPUT(-10,AAAAC0,BUF2).EQ.-1))GOTO 10002
            CALL PUTCH(138,-11)
            IF((EQUAL(BUF1,BUF2).NE.0))GOTO 10003
              CALL ERROR('The new passwords do not match.')
10003       I=1
            CALL CTOV(BUF1,I,NPW,9)
            CALL CHG$PW(OPW,NPW,CODE)
            AAAAD0=CODE
            GOTO 10004
10005         CALL ERROR('One of the passwords was illegal@..')
            GOTO 10006
10007         CALL ERROR('The old password did not match the actual pass
     *word@..')
            GOTO 10006
10008         CALL ERROR('Disk is write protected@. See system administr
     *ator@..')
            GOTO 10006
10004       IF(AAAAD0.EQ.6)GOTO 10005
            IF(AAAAD0.EQ.24)GOTO 10007
            IF(AAAAD0.EQ.56)GOTO 10008
10006     CONTINUE
10002   CONTINUE
10001 CONTINUE
10000 CALL DUPLX$(SAVED0)
      CALL SWT
      END
C ---- Long Name Map ----
C saveduplex                     saved0
