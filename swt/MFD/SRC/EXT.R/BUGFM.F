      INTEGER LDATE(32),TIME(9),USERID(33),UNAME(102),PNAME(102),ENAME(1
     *02)
      INTEGER INPUT
      IF((INPUT(-10,'Your name: *,,`s.',UNAME).EQ.-1))GOTO 10001
      IF((INPUT(-10,'Name of problem software: *,,`s.',PNAME).EQ.-1))GOT
     *O 10001
      IF((INPUT(-10,'Name of example file (<CR> if none): *s.',ENAME).EQ
     *.-1))GOTO 10001
      GOTO 10000
10001   CALL SETERR(1000)
        CALL SWT
10000 CALL DATE(7,LDATE)
      CALL DATE(2,TIME)
      CALL DATE(3,USERID)
      CALL PRINT(-11,'*s at *s*2n.',LDATE,TIME)
      CALL PRINT(-11,'By: *s (*s)*n.',UNAME,USERID)
      CALL PRINT(-11,'Re: *s*n.',PNAME)
      IF((ENAME(1).EQ.0))GOTO 10002
        CALL PRINT(-11,'Ex: *s*n.',ENAME)
10002 CALL REMARK('Description of bug (end with ctrl\c in column 1).')
      CALL PRINT(-11,'*nDescription:*2n.')
      CALL FCOPY(-10,-11)
      CALL SWT
      END
C ---- Long Name Map ----
