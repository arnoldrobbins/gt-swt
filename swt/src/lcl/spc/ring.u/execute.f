      EXTERNAL CLEAN0
      INTEGER GETARG,STRIM,CTOP,GETLIN,CTOC,EQUAL
      INTEGER LINE(102)
      INTEGER VCSTAT(2),BUFF(137)
      INTEGER VCID,SIZE,I,J,K
      INTEGER AAAAA0(4)
      INTEGER AAAAB0
      INTEGER AAAAC0(38)
      INTEGER AAAAD0(41)
      INTEGER AAAAE0
      DATA AAAAA0/193,204,204,0/
      DATA AAAAC0/208,232,225,238,244,239,237,160,168,170,233,169,160,22
     *7,242,229,225,244,229,228,160,239,238,160,243,249,243,244,229,237,
     *160,170,172,163,232,170,238,0/
      DATA AAAAD0/208,232,225,238,244,239,237,160,227,242,229,225,244,23
     *3,239,238,160,230,225,233,236,229,228,160,239,238,160,243,249,243,
     *244,229,237,160,170,172,163,232,170,238,0/
      I=1
      BUFF(I)=2
      I=I+(1)
      IF((GETARG(1,LINE,128).EQ.-1))GOTO 10000
        CALL MAPSTR(LINE,2)
        IF((EQUAL(LINE,AAAAA0).NE.1))GOTO 10001
          DO 10002 J=1,3
            BUFF(I)=0
            I=I+(1)
10002     CONTINUE
10003     GOTO 10008
10001     J=STRIM(LINE)
          GOTO 10007
10005     J=J+(1)
10007     IF((J.GE.2*3))GOTO 10006
            LINE(J+1)=160
          GOTO 10005
10006     LINE(2*3+1)=0
          J=1
          I=I+((CTOP(LINE,J,BUFF(I),3)+1)/2)
10004   GOTO 10008
10000   DO 10009 J=1,3
          BUFF(I)=0
          I=I+(1)
10009   CONTINUE
10010 CONTINUE
10008 J=2
      K=1
10011   SIZE=GETARG(J,LINE(K),102-K+1)
        IF((SIZE.EQ.-1))GOTO 10014
          K=K+(SIZE)
          LINE(K)=160
          K=K+(1)
          GOTO 10013
10013   J=J+(1)
      GOTO 10011
10014 IF((K.NE.1))GOTO 10015
        K=GETLIN(LINE,-10,102)
        IF((K.NE.-1))GOTO 10016
          K=1
10016 CONTINUE
10015 LINE(K)=0
      CALL STRIM(LINE)
      SIZE=I+CTOC(LINE,BUFF(I),102)-1
      CALL RING$C(VCID,VCSTAT,LINE)
      IF((LINE(1).NE.0))GOTO 10017
        CALL MKON$F('CLEANUP$',8,CLEAN0)
        GOTO 10018
10017   CALL ERROR(LINE)
10018 CALL RING$T(VCID,VCSTAT,BUFF,SIZE,LINE)
      IF((LINE(1).NE.0))GOTO 10019
        I=2
        J=SIZE-3-1
10020   IF((I.GE.J))GOTO 10026
          AAAAB0=BUFF(I+3)
          GOTO 10022
10023       CALL PRINT(-11,AAAAC0,BUFF(I+3+1),2*3,BUFF(I))
          GOTO 10024
10025       CALL PRINT(-11,AAAAD0,2*3,BUFF(I))
          GOTO 10024
10022     AAAAE0=AAAAB0-6
          GOTO(10023,10025),AAAAE0
10024     I=I+(3+2)
        GOTO 10020
10019   CALL ERROR(LINE)
10026 CALL SWT
      END
      SUBROUTINE CLEAN0(CP)
      INTEGER * 4 CP
      CALL X$CLRA
      RETURN
      END
C ---- Long Name Map ----
C netcode                        netco0
C netacceptconnect               netac0
C netdisconnect                  netdi0
C cleanup                        clean0
C netsend                        netse0
C netassign                      netas0
C netclear                       netcl0
C netreceive                     netre0
C netconnectinfo                 netcq0
C netwait                        netwa0
C netunassign                    netun0
C netconnect                     netcp0
