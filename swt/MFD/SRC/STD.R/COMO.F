      INTEGER KEY,APPEND,PAUSE,AP,I,FILE(16),CODE,PWD(3)
      INTEGER GETARG,GETTO
      INTEGER ARG(128)
      KEY=106
      APPEND=0
      PAUSE=0
      AP=1
      GOTO 10002
10000 AP=AP+1
10002 IF((GETARG(AP,ARG,128).EQ.-1))GOTO 10001
        IF((ARG(1).NE.173))GOTO 10003
          I=2
          GOTO 10006
10004     I=I+1
10006     IF((ARG(I).EQ.0))GOTO 10005
            IF(((ARG(I).NE.244).AND.(ARG(I).NE.212)))GOTO 10007
              KEY=XOR(AND(KEY,:177774),2)
              GOTO 10008
10007         IF(((ARG(I).NE.238).AND.(ARG(I).NE.206)))GOTO 10009
                KEY=XOR(AND(KEY,:177774),1)
                GOTO 10010
10009           IF(((ARG(I).NE.227).AND.(ARG(I).NE.195)))GOTO 10011
                  APPEND=1
                  PAUSE=0
                  GOTO 10012
10011             IF(((ARG(I).NE.240).AND.(ARG(I).NE.208)))GOTO 10013
                    APPEND=0
                    PAUSE=1
                    GOTO 10014
10013               CALL ERROR('Usage: como {-{c|n|p|t}} [<pathname>].')
10014           CONTINUE
10012         CONTINUE
10010       CONTINUE
10008     GOTO 10004
10005     GOTO 10015
10003     AP=0
          KEY=XOR(AND(KEY,:177707),:20)
          PAUSE=0
          GOTO 10001
10015 GOTO 10000
10001 IF((PAUSE.NE.1))GOTO 10016
        KEY=XOR(AND(KEY,:177707),:10)
        GOTO 10017
10016   IF((APPEND.NE.1))GOTO 10018
          KEY=XOR(AND(KEY,:177607),:60)
10018 CONTINUE
10017 IF((AP.NE.0))GOTO 10019
        IF((GETTO(ARG,FILE,PWD,0).NE.-3))GOTO 10020
          CALL ERROR('bad pathname.')
10020   GOTO 10021
10019   FILE(1)='  '
10021 CALL COMO$$(KEY,FILE,32,0,CODE)
      CALL ERRPR$(:2,CODE,0,0,0,0)
      CALL SWT
      END
C ---- Long Name Map ----
