      EXTERNAL CLEAN0
      INTEGER GETARG,STRIM,CTOP
      INTEGER LINE(102)
      INTEGER VCSTAT(2),BUFF(137)
      INTEGER VCID,SIZE,I,J,K
      INTEGER AAAAA0
      INTEGER AAAAB0(42)
      INTEGER AAAAC0(44)
      INTEGER AAAAD0
      DATA AAAAB0/210,233,238,231,160,232,225,243,160,226,229,229,238,16
     *0,244,229,242,237,233,238,225,244,229,228,160,239,238,160,243,249,
     *243,244,229,237,160,170,172,163,232,170,238,0/
      DATA AAAAC0/212,229,242,237,233,238,225,244,233,239,238,160,242,22
     *9,241,245,229,243,244,160,230,225,233,236,229,228,160,239,238,160,
     *243,249,243,244,229,237,160,170,172,163,232,170,238,0/
      I=1
      BUFF(I)=3
      I=I+(1)
      IF((GETARG(1,LINE,128).EQ.-1))GOTO 10000
        CALL MAPSTR(LINE,2)
        J=STRIM(LINE)
        GOTO 10003
10001   J=J+(1)
10003   IF((J.GE.2*3))GOTO 10002
          LINE(J+1)=160
        GOTO 10001
10002   LINE(2*3+1)=0
        J=1
        SIZE=I+(CTOP(LINE,J,BUFF(I),3)+1)/2-1
        GOTO 10004
10000   DO 10005 J=1,3
          BUFF(I)=0
          I=I+(1)
10005   CONTINUE
10006   SIZE=I-1
10004 CALL RING$C(VCID,VCSTAT,LINE)
      IF((LINE(1).NE.0))GOTO 10007
        CALL MKON$F('CLEANUP$',8,CLEAN0)
        GOTO 10008
10007   CALL ERROR(LINE)
10008 CALL RING$T(VCID,VCSTAT,BUFF,SIZE,LINE)
      IF((LINE(1).NE.0))GOTO 10009
        I=2
        J=SIZE-3-1
10010   IF((I.GE.J))GOTO 10016
          AAAAA0=BUFF(I+3)
          GOTO 10012
10013       CALL PRINT(-11,AAAAB0,2*3,BUFF(I))
          GOTO 10014
10015       CALL PRINT(-11,AAAAC0,2*3,BUFF(I))
          GOTO 10014
10012     AAAAD0=AAAAA0-6
          GOTO(10013,10015),AAAAD0
10014     I=I+(3+2)
        GOTO 10010
10009   CALL ERROR(LINE)
10016 CALL SWT
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
