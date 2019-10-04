      INTEGER CACHE,ARG
      INTEGER GETARG,MKTEMP,VFYUSR
      INTEGER USER(102)
      INTEGER A$BUF(200)
      INTEGER PARSCL
      INTEGER AAAAA0(2)
      INTEGER AAAAB0(36)
      INTEGER AAAAC0(25)
      INTEGER AAAAD0(28)
      DATA AAAAA0/240,0/
      DATA AAAAB0/213,243,225,231,229,186,160,160,237,225,233,236,160,21
     *9,160,173,240,160,221,160,251,160,188,245,243,229,242,160,238,225,
     *237,229,190,160,253,0/
      DATA AAAAC0/170,243,186,160,160,225,228,228,242,229,243,243,229,22
     *9,160,245,238,235,238,239,247,238,170,238,0/
      DATA AAAAD0/227,225,238,167,244,160,227,242,229,225,244,229,160,24
     *4,229,237,240,239,242,225,242,249,160,230,233,236,229,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR(AAAAB0)
10000 IF((GETARG(1,USER,102).NE.-1))GOTO 10001
        CALL RECEI0((A$BUF(240-225+1).NE.0))
        GOTO 10002
10001   ARG=1
        GOTO 10005
10003   ARG=ARG+(1)
10005   IF((GETARG(ARG,USER,102).EQ.-1))GOTO 10004
          IF((VFYUSR(USER).NE.-3))GOTO 10006
            CALL PRINT(-15,AAAAC0,USER)
            CALL SWT
10006   GOTO 10003
10004   CACHE=MKTEMP(3)
        IF((CACHE.NE.-3))GOTO 10007
          CALL ERROR(AAAAD0)
10007   CALL FCOPY(-10,CACHE)
        ARG=1
        GOTO 10010
10008   ARG=ARG+(1)
10010   IF((GETARG(ARG,USER,102).EQ.-1))GOTO 10009
          CALL REWIND(CACHE)
          CALL SENDM0(CACHE,USER)
        GOTO 10008
10009   CALL RMTEMP(CACHE)
10002 CALL SWT
      END
      SUBROUTINE RECEI0(NOPAGE)
      INTEGER NOPAGE
      INTEGER MAILB0(14)
      INTEGER SAVEB0(11)
      INTEGER BOX,SBOX
      INTEGER OPEN,GETLIN
      INTEGER RESPO0(102)
      INTEGER AAAAE0(12)
      INTEGER AAAAF0(7)
      INTEGER AAAAG0(17)
      DATA MAILB0/189,237,225,233,236,189,175,189,245,243,229,242,189,0/
      DATA SAVEB0/189,237,225,233,236,230,233,236,229,189,0/
      DATA AAAAE0/219,170,233,221,160,237,239,242,229,191,160,0/
      DATA AAAAF0/219,197,206,196,221,160,0/
      DATA AAAAG0/211,225,246,229,160,237,225,233,236,160,168,249,169,16
     *0,191,160,0/
      BOX=OPEN(MAILB0,1)
      IF((BOX.EQ.-3))GOTO 10011
        IF((NOPAGE.NE.1))GOTO 10012
          CALL FCOPY(BOX,-11)
          GOTO 10013
10012     CALL PAGE(BOX,AAAAE0,AAAAF0,22,-11,2)
10013   CALL PRINT(-15,AAAAG0)
        IF((GETLIN(RESPO0,-14).EQ.-1))GOTO 10015
        IF(((RESPO0(1).NE.238).AND.(RESPO0(1).NE.206)))GOTO 10015
        GOTO 10014
10015     CALL REWIND(BOX)
          SBOX=OPEN(SAVEB0,3)
          IF((SBOX.NE.-3))GOTO 10016
            CALL CLOSE(BOX)
            CALL CANT(SAVEB0)
10016     CALL WIND(SBOX)
          CALL FCOPY(BOX,SBOX)
          CALL CLOSE(SBOX)
10014   CALL CLOSE(BOX)
        CALL REMOVE(MAILB0)
10011 RETURN
      END
      SUBROUTINE SENDM0(FILE,USER)
      INTEGER FILE
      INTEGER USER(1)
      INTEGER MAILF0(40),DAT(32),TIM(9),SENDER(33)
      INTEGER DEST
      INTEGER OPEN
      INTEGER AAAAH0(7)
      INTEGER AAAAI0(10)
      INTEGER AAAAJ0(26)
      INTEGER AAAAK0(29)
      DATA AAAAH0/189,245,243,229,242,189,0/
      DATA AAAAI0/189,237,225,233,236,189,175,170,243,0/
      DATA AAAAJ0/227,225,238,167,244,160,239,240,229,238,160,170,243,16
     *7,243,160,237,225,233,236,226,239,248,170,238,0/
      DATA AAAAK0/170,238,170,238,198,242,239,237,160,170,243,160,225,24
     *4,160,170,243,160,239,238,160,170,243,186,170,238,170,238,0/
      CALL EXPAND(AAAAH0,SENDER,33)
      CALL DATE(7,DAT)
      CALL DATE(2,TIM)
      TIM(6)=0
      CALL ENCODE(MAILF0,40,AAAAI0,USER)
      DEST=OPEN(MAILF0,3)
      IF((DEST.NE.-3))GOTO 10017
        CALL PRINT(-15,AAAAJ0,USER)
        RETURN
10017 CALL WIND(DEST)
      CALL PRINT(DEST,AAAAK0,SENDER,TIM,DAT)
      CALL FCOPY(FILE,DEST)
      CALL CLOSE(DEST)
      RETURN
      END
C ---- Long Name Map ----
C mailbox                        mailb0
C mailfile                       mailf0
C response                       respo0
C sendmail                       sendm0
C savebox                        saveb0
C receivemail                    recei0