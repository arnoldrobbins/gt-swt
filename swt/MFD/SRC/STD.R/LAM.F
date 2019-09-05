      INTEGER ETYPE(256),EEOF(256)
      INTEGER I,NUMEN0,FCOUNT,EOFCO0,L,OUTLEN
      INTEGER GETARG,GETLIN,CTOC
      INTEGER EFD(256)
      INTEGER OPEN
      INTEGER ARG(102),STRIN0(102,256),LINE(102)
      FCOUNT=0
      I=1
      GOTO 10002
10000 I=I+(1)
10002 IF((GETARG(I,ARG,102).EQ.-1))GOTO 10001
        IF((I.LE.256))GOTO 10003
          CALL ERROR('too many files or insertion strings.')
10003   IF((ARG(1).NE.173))GOTO 10004
        IF((ARG(2).EQ.233))GOTO 10005
        IF((ARG(2).EQ.201))GOTO 10005
        GOTO 10004
10005     ETYPE(I)=1
          CALL SCOPY(ARG,3,STRIN0(1,I),1)
          GOTO 10006
10004     ETYPE(I)=0
          EFD(I)=OPEN(ARG,1)
          IF((EFD(I).NE.-3))GOTO 10007
            CALL CANT(ARG)
10007     EEOF(I)=1
          FCOUNT=FCOUNT+(1)
10006 GOTO 10000
10001 IF((I.NE.1))GOTO 10008
        ETYPE(1)=0
        EFD(1)=-10
        EEOF(1)=1
        ETYPE(2)=0
        EFD(2)=-12
        EEOF(2)=1
        I=3
        FCOUNT=2
10008 NUMEN0=I-1
      IF((FCOUNT.NE.0))GOTO 10009
        CALL ERROR('there must be at least one input file.')
10009 EOFCO0=0
10010   OUTLEN=0
        I=1
        GOTO 10013
10011   I=I+(1)
10013   IF((I.GT.NUMEN0))GOTO 10012
          IF((ETYPE(I).NE.1))GOTO 10014
            OUTLEN=OUTLEN+(CTOC(STRIN0(1,I),LINE(OUTLEN+1),102-OUTLEN-2)
     *)
            GOTO 10015
10014       IF((EEOF(I).NE.1))GOTO 10016
              L=GETLIN(ARG,EFD(I))
              IF((L.NE.-1))GOTO 10017
                EEOF(I)=-1
                EOFCO0=EOFCO0+(1)
                IF((EOFCO0.LT.FCOUNT))GOTO 10018
                  GOTO 10019
10018           GOTO 10020
10017           IF((ARG(L).NE.138))GOTO 10021
                  ARG(L)=0
10021           OUTLEN=OUTLEN+(CTOC(ARG,LINE(OUTLEN+1),102-OUTLEN-2))
10020       CONTINUE
10016     CONTINUE
10015   GOTO 10011
10012   LINE(OUTLEN+1)=138
        LINE(OUTLEN+2)=0
        CALL PUTLIN(LINE,-11)
      GOTO 10010
10019 CALL SWT
      END
C ---- Long Name Map ----
C numentries                     numen0
C strings                        strin0
C eofcount                       eofco0
