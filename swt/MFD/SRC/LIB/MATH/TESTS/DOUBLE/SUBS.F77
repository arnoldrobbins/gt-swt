C     SETFLAG --- SEE WHICH TEST WE'RE RUNNING AND SET THE FLAG
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      SUBROUTINE SETFLAG
C
      LOGICAL WHICH
      COMMON WHICH
      EXTERNAL RDTK$$,NAMEQV
      LOGICAL NAMEQV
      INTEGER*2 INFO(8),KEY,BUFLEN,CODE
      PARAMETER (KEY=1,BUFLEN=3)
      CHARACTER*6 TOKEN
C
C
   10 CONTINUE
      CALL RDTK$$ (KEY,INFO,TOKEN,BUFLEN,CODE)
      IF (CODE .NE. 0) GO TO 30
      GO TO (20,10,10,10,10,30), INFO(1)
   20 CONTINUE
      IF (NAMEQV(TOKEN,'SWT   ')) THEN
          WHICH = .TRUE.
C
      ELSEIF (NAMEQV(TOKEN,'PRIMOS')) THEN
          WHICH = .FALSE.
C
      ELSE
   30     CONTINUE
          PRINT 40
          STOP
      ENDIF
C
      RETURN
C
   40 FORMAT ('Usage: test (swt | primos)')
      END
C
C     FOOBAR --- DIE IF WE GET AN 'ERROR' SIGNAL
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      SUBROUTINE FOOBAR (PTR)
C
      INTEGER PTR
C
      STOP
      END
C
C     RANDL --- EXPONENTIALLY DISTRIBUTED RANDOM NUMBERS
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION RANDL(X)
C
      DOUBLE PRECISION X,RANDX,DEXP$M
      EXTERNAL DEXP$M,RANDX
      RANDL = DEXP$M(X*RANDX(X))
      RETURN
      END
C
C     XPOWER --- REPLACE "**" BY SOMETHING MORE ACCURATE
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION XPOWER(X,Y)
C
      DOUBLE PRECISION X,Y
      DOUBLE PRECISION POWR$M
      EXTERNAL POWR$M
C
      XPOWER = POWR$M(X,Y)
      RETURN
      END
C
C     XSQRT --- REPLACE INTRINSIC "SQRT" BY SOMETHING MORE ACCURATE
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION XSQRT(A)
C
      DOUBLE PRECISION A,DSQT$M
      EXTERNAL DSQT$M
      XSQRT = DSQT$M(A)
      RETURN
      END
C
C     XEXP --- REPLACE INTRINSIC "EXP" BY SOMETHING MORE ACCURATE
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION XEXP(A)
C
      DOUBLE PRECISION A,DEXP$M
      EXTERNAL DEXP$M
      XEXP = DEXP$M(A)
      RETURN
      END
C
C     XALOG --- REPLACE INTRINSIC "ALOG" BY SOMETHING MORE ACCURATE
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION XALOG(A)
C
      DOUBLE PRECISION A,DLN$M
      EXTERNAL DLN$M
      XALOG = DLN$M(A)
      RETURN
      END
C
C     RANDX --- GENERATE A RANDOM NUMBER
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION RANDX(DUMMY)
C
      INTEGER DUMMY
      DOUBLE PRECISION RAND$M
      EXTERNAL RAND$M
      INTEGER I
      RANDX = RAND$M(I)
      RETURN
      END
C
C     ZASIN --- SELECT AN INVERSE SINE FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZASIN(X)
C
      DOUBLE PRECISION X,DASIN,DASN$M
      EXTERNAL DASN$M
      INTRINSIC DASIN
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZASIN = DASN$M(X)
C
      ELSE
          ZASIN = DASIN(X)
      ENDIF
      RETURN
      END
C
C     ZACOS --- SELECT AN INVERSE COSINE FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZACOS(X)
C
      DOUBLE PRECISION X,DACOS,DACS$M
      EXTERNAL DACS$M
      INTRINSIC DACOS
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZACOS = DACS$M(X)
C
      ELSE
          ZACOS = DACOS(X)
      ENDIF
      RETURN
      END
C
C     ZATAN --- SELECT AN INVERSE TANGENT FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZATAN(X)
C
      DOUBLE PRECISION X,DATN$M,DATAN
      INTRINSIC DATAN
      EXTERNAL DATN$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZATAN = DATN$M(X)
C
      ELSE
          ZATAN = DATAN(X)
      ENDIF
      RETURN
      END
C
C     ZEXP --- SELECT AN EXPONENTIAL FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZEXP(X)
C
      DOUBLE PRECISION X,DEXP,DEXP$M
      INTRINSIC DEXP
      EXTERNAL DEXP$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZEXP = DEXP$M(X)
C
      ELSE
          ZEXP = DEXP(X)
      ENDIF
      RETURN
      END
C
C     ZALOG --- SELECT A LN FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZALOG(X)
C
      INTRINSIC DLOG
      DOUBLE PRECISION X,DLN$M,DLOG
      EXTERNAL DLN$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZALOG = DLN$M(X)
C
      ELSE
          ZALOG = DLOG(X)
      ENDIF
      RETURN
      END
C
C     ZALG10 --- SELECT A LOG FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZALG10(X)
C
      INTRINSIC DLOG10
      DOUBLE PRECISION X,DLOG$M,DLOG10
      EXTERNAL DLOG$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZALG10 = DLOG$M(X)
C
      ELSE
          ZALG10 = DLOG10(X)
      ENDIF
      RETURN
      END
C
C     ZPOWR --- SELECT A POWER FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZPOWR(X,Y)
C
      DOUBLE PRECISION X,Y
      DOUBLE PRECISION POWR$M
      EXTERNAL POWR$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZPOWR = POWR$M(X,Y)
C
      ELSE
          ZPOWR = X**Y
      ENDIF
      RETURN
      END
C
C     ZCOS --- SELECT A COSINE FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZCOS(X)
C
      DOUBLE PRECISION X,DCOS$M
      INTRINSIC DCOS
      EXTERNAL DCOS$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZCOS = DCOS$M(X)
C
      ELSE
          ZCOS = DCOS(X)
      ENDIF
      RETURN
      END
C
C     ZSIN --- SELECT A SINE FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZSIN(X)
C
      DOUBLE PRECISION X,DSIN$M,DSIN
      INTRINSIC DSIN
      EXTERNAL DSIN$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZSIN = DSIN$M(X)
C
      ELSE
          ZSIN = DSIN(X)
      ENDIF
      RETURN
      END
C
C     ZCOSH --- SELECT A HYPERBOLIC COSINE FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZCOSH(X)
C
      DOUBLE PRECISION X,DCSH$M,DCOSH
      INTRINSIC DCOSH
      EXTERNAL DCSH$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZCOSH = DCSH$M(X)
C
      ELSE
          ZCOSH = DCOSH(X)
      ENDIF
      RETURN
      END
C
C     ZSINH --- SELECT A HYPERBOLIC SINE FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZSINH(X)
C
      DOUBLE PRECISION X,DSNH$M,DSINH
      INTRINSIC DSINH
      EXTERNAL DSNH$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZSINH = DSNH$M(X)
C
      ELSE
          ZSINH = DSINH(X)
      ENDIF
      RETURN
      END
C
C     ZSQRT --- SELECT A SQUARE ROOT FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZSQRT(X)
C
      INTRINSIC DSQRT
      DOUBLE PRECISION X,DSQT$M,DSQRT
      EXTERNAL DSQT$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZSQRT = DSQT$M(X)
C
      ELSE
          ZSQRT = DSQRT(X)
      ENDIF
      RETURN
      END
C
C     ZCOT --- SELECT A COTANGENT FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZCOT(X)
C
      DOUBLE PRECISION X,DCOT$M,MAXNUM,Y,DTAN
      INTEGER MAXNI(4)
      INTRINSIC DTAN
      EXTERNAL DCOT$M
      LOGICAL WHICH
      COMMON WHICH
      EQUIVALENCE (MAXNI,MAXNUM)
      DATA MAXNI /:77777,2*:177777,:77777/
C
C
      IF (WHICH) THEN
          ZCOT = DCOT$M(X)
C
      ELSE
          Y = DTAN(X)
          IF (Y .EQ. 0.0D0) THEN
              ZCOT = MAXNUM
C
          ELSE
              ZCOT = 1.0D0/Y
          ENDIF
      ENDIF
      RETURN
      END
C
C     ZTAN --- SELECT A TANGENT FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZTAN(X)
C
      DOUBLE PRECISION X,DTAN$M,DTAN
      INTRINSIC DTAN
      EXTERNAL DTAN$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZTAN = DTAN$M(X)
C
      ELSE
          ZTAN = DTAN(X)
      ENDIF
      RETURN
      END
C
C     ZTANH --- SELECT A HYPERBOLIC TANGENT FUNCTION TO TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      DOUBLE PRECISION FUNCTION ZTANH(X)
C
      DOUBLE PRECISION X,DTNH$M,DTANH
      INTRINSIC DTANH
      EXTERNAL DTNH$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZTANH = DTNH$M(X)
C
      ELSE
          ZTANH = DTANH(X)
      ENDIF
      RETURN
      END
