      INTEGER PATH(128),NEWNAM(33),NN(33)
      INTEGER OLD(16),NEW(16),I,J,K,RC,PWD(3)
      INTEGER GETARG,GETTO
      I=1
      GOTO 10002
10000 I=I+2
10002 IF((GETARG(I,PATH,128).EQ.-1))GOTO 10001
        IF((GETARG(I+1,NEWNAM,33).NE.-1))GOTO 10003
          CALL PUTLIN(PATH,-15)
          CALL ERROR(': missing name.')
10003   CALL FOLLOW(0,0)
        IF((GETTO(PATH,OLD,PWD,0).NE.-3))GOTO 10004
          CALL PUTLIN(PATH,-15)
          CALL ERROR(': bad pathname.')
10004   J=1
        K=1
        GOTO 10007
10005   J=J+(1)
        K=K+(1)
10007   IF((NEWNAM(J).EQ.0))GOTO 10006
          IF((NEWNAM(J).NE.192))GOTO 10008
          IF((NEWNAM(J+1).EQ.0))GOTO 10008
            J=J+(1)
            GOTO 10009
10008       IF((NEWNAM(J).NE.175))GOTO 10010
              CALL PUTLIN(NEWNAM,-15)
              CALL ERROR(': cannot move file to new directory.')
10010     CONTINUE
10009     NN(K)=NEWNAM(J)
        GOTO 10005
10006   NN(K)=0
        J=1
        GOTO 10013
10011   J=J+1
10013   IF((J.GT.16))GOTO 10012
          NEW(J)='  '
        GOTO 10011
10012   J=1
        CALL CTOP(NN,J,NEW,16)
        CALL CNAM$$(OLD,32,NEW,32,RC)
        IF((RC.NE.18))GOTO 10014
          CALL PRINT(-15,'*s: already exists*n.',NEWNAM)
          GOTO 10015
10014     IF((RC.NE.15))GOTO 10016
            CALL PRINT(-15,'*s: not found*n.',PATH)
            GOTO 10017
10016       CALL ERRPR$(:2,RC,0,0,0,0)
10017   CONTINUE
10015 GOTO 10000
10001 IF((I.NE.1))GOTO 10018
        CALL ERROR('Usage: cn old new {old new}.')
10018 CALL SWT
      END
C ---- Long Name Map ----
