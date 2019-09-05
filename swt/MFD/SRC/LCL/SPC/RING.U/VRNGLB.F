      SUBROUTINE RING$C(VCID,VCSTAT,ERROR)
      INTEGER VCID,VCSTAT(2),ERROR(102)
      INTEGER RING(128),ADDRE0(128)
      INTEGER COUNT,SIZE,STATUS,I,J
      INTEGER AAAAA0
      INTEGER AAAAB0
      ERROR(1)=0
      CALL X$STAT(6,I,RING,COUNT,ADDRE0,SIZE,STATUS,J)
      AAAAA0=STATUS
      GOTO 10000
10001   CALL X$CONN(VCID,99,RING,COUNT,VCSTAT)
10002   IF((VCSTAT(1).NE.1))GOTO 10003
          CALL X$WAIT(1)
        GOTO 10002
10003   IF((VCSTAT(1).EQ.0))GOTO 10004
          CALL PTOC('Unable to connect to Ring process.',174,ERROR,102)
10004 GOTO 10005
10006   CALL PTOC('Bad parameter in status call.',174,ERROR,102)
      GOTO 10005
10007   CALL PTOC('Networks are not configured.',174,ERROR,102)
      GOTO 10005
10008   CALL PTOC('Primenet name is unknown.',174,ERROR,102)
      GOTO 10005
10000 AAAAB0=AAAAA0+2
      GOTO(10007,10001,10009,10009,10006,10009,10009,10009,10008),AAAAB0
10009 CONTINUE
10005 RETURN
      END
      SUBROUTINE RING$T(VCID,VCSTAT,BUFF,SIZE,ERROR)
      INTEGER VCID,VCSTAT(2),BUFF(136),SIZE,ERROR(102)
      INTEGER RCVST0(3)
      INTEGER STATUS
      INTEGER AAAAC0
      INTEGER AAAAD0
      INTEGER AAAAE0
      ERROR(1)=0
      CALL X$TRAN(VCID,0,BUFF,2*SIZE,STATUS)
10010 IF((STATUS.NE.1))GOTO 10011
        CALL X$WAIT(1)
      GOTO 10010
10011 IF((VCSTAT(1).NE.0))GOTO 10012
        CALL X$RCV(VCID,BUFF,2*136,RCVST0)
10013   IF((RCVST0(1).NE.1))GOTO 10014
          CALL X$WAIT(1)
        GOTO 10013
10014   AAAAC0=BUFF(2)
        GOTO 10015
10016     CALL X$RCV(VCID,BUFF,2*136,RCVST0)
10017     IF((RCVST0(1).NE.1))GOTO 10018
            CALL X$WAIT(1)
          GOTO 10017
10018     IF((VCSTAT(1).EQ.4))GOTO 10019
            SIZE=(RCVST0(3)+1)/2
            AAAAD0=BUFF(SIZE)
            GOTO 10020
10021         CALL X$CLR(VCID,0,STATUS)
10022         IF((VCSTAT(1).EQ.4))GOTO 10023
                CALL X$WAIT(1)
              GOTO 10022
10023       GOTO 10024
10025         CALL PTOC('System is not in the ring.',174,ERROR,102)
            GOTO 10024
10020       AAAAE0=AAAAD0-2
            GOTO(10025,10026,10026,10021),AAAAE0
10026       CONTINUE
10024       GOTO 10027
10019       CALL PTOC('Connection has been terminated.',174,ERROR,102)
10027   GOTO 10028
10029     CALL PTOC('Request is invalid.',174,ERROR,102)
        GOTO 10028
10030     CALL PTOC('System is not in the ring.',174,ERROR,102)
        GOTO 10028
10031     CALL PTOC('Request is unknown.',174,ERROR,102)
        GOTO 10028
10032     CALL PTOC('Request is the wrong size.',174,ERROR,102)
        GOTO 10028
10015   GOTO(10016,10029,10030,10031,10032),AAAAC0
10028   GOTO 10033
10012   CALL PTOC('Cannot transmit request.',174,ERROR,102)
10033 RETURN
      END
C ---- Long Name Map ----
C netcode                        netco0
C netacceptconnect               netac0
C netdisconnect                  netdi0
C address                        addre0
C netsend                        netse0
C netassign                      netas0
C netclear                       netcl0
C netreceive                     netre0
C netconnectinfo                 netcq0
C netwait                        netwa0
C netunassign                    netun0
C netconnect                     netcp0
C rcvstat                        rcvst0
