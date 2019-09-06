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
      REAL FUNCTION RANDL(X)
C
      REAL X,RANDX,EXP$M
      EXTERNAL EXP$M,RANDX
      RANDL = EXP$M(X*RANDX(X))
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
      REAL FUNCTION XPOWER(X,Y)
C
      REAL X,Y
      DOUBLE PRECISION DBLE,POWR$M
      EXTERNAL POWR$M
      INTRINSIC DBLE
      XPOWER = POWR$M(DBLE(X),DBLE(Y))
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
      REAL FUNCTION XSQRT(A)
C
      REAL A,SQRT$M
      EXTERNAL SQRT$M
      XSQRT = SQRT$M(A)
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
      REAL FUNCTION XEXP(A)
C
      REAL A,EXP$M
      EXTERNAL EXP$M
      XEXP = EXP$M(A)
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
      REAL FUNCTION XALOG(A)
C
      REAL A,LN$M
      EXTERNAL LN$M
      XALOG = LN$M(A)
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
      REAL FUNCTION RANDX(DUMMY)
C
      INTEGER DUMMY
      REAL RAND$M
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
      REAL FUNCTION ZASIN(X)
C
      REAL X,ASIN,ASIN$M
      EXTERNAL ASIN$M
      INTRINSIC ASIN
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZASIN = ASIN$M(X)
C
      ELSE
          ZASIN = ASIN(X)
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
      REAL FUNCTION ZACOS(X)
C
      REAL X,ACOS,ACOS$M
      EXTERNAL ACOS$M
      INTRINSIC ACOS
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZACOS = ACOS$M(X)
C
      ELSE
          ZACOS = ACOS(X)
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
      REAL FUNCTION ZATAN(X)
C
      REAL X,ATAN$M,ATAN
      INTRINSIC ATAN
      EXTERNAL ATAN$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZATAN = ATAN$M(X)
C
      ELSE
          ZATAN = ATAN(X)
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
      REAL FUNCTION ZEXP(X)
C
      REAL X,EXP,EXP$M
      INTRINSIC EXP
      EXTERNAL EXP$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZEXP = EXP$M(X)
C
      ELSE
          ZEXP = EXP(X)
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
      REAL FUNCTION ZALOG(X)
C
      INTRINSIC ALOG
      REAL X,LN$M
      EXTERNAL LN$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZALOG = LN$M(X)
C
      ELSE
          ZALOG = ALOG(X)
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
      REAL FUNCTION ZALG10(X)
C
      INTRINSIC ALOG10
      REAL X,LOG$M
      EXTERNAL LOG$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZALG10 = LOG$M(X)
C
      ELSE
          ZALG10 = ALOG10(X)
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
      REAL FUNCTION ZPOWR(X,Y)
C
      REAL X,Y
      DOUBLE PRECISION POWR$M
      EXTERNAL POWR$M
      DOUBLE PRECISION DBLE
      INTRINSIC DBLE
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZPOWR = POWR$M(DBLE(X),DBLE(Y))
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
      REAL FUNCTION ZCOS(X)
C
      REAL X,COS$M
      INTRINSIC COS
      EXTERNAL COS$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZCOS = COS$M(X)
C
      ELSE
          ZCOS = COS(X)
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
      REAL FUNCTION ZSIN(X)
C
      REAL X,SIN$M
      INTRINSIC SIN
      EXTERNAL SIN$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZSIN = SIN$M(X)
C
      ELSE
          ZSIN = SIN(X)
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
      REAL FUNCTION ZCOSH(X)
C
      REAL X,COSH$M,COSH
      INTRINSIC COSH
      EXTERNAL COSH$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZCOSH = COSH$M(X)
C
      ELSE
          ZCOSH = COSH(X)
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
      REAL FUNCTION ZSINH(X)
C
      REAL X,SINH$M,SINH
      INTRINSIC SINH
      EXTERNAL SINH$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZSINH = SINH$M(X)
C
      ELSE
          ZSINH = SINH(X)
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
      REAL FUNCTION ZSQRT(X)
C
      INTRINSIC SQRT
      REAL X,SQRT$M,SQRT
      EXTERNAL SQRT$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZSQRT = SQRT$M(X)
C
      ELSE
          ZSQRT = SQRT(X)
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
      REAL FUNCTION ZCOT(X)
C
      REAL X,COT$M,MAXNUM,Y
      INTEGER MAXNI(2)
      INTRINSIC TAN
      EXTERNAL COT$M
      LOGICAL WHICH
      COMMON WHICH
      EQUIVALENCE (MAXNI,MAXNUM)
      DATA MAXNI /:77777,:177777/
C
C
      IF (WHICH) THEN
          ZCOT = COT$M(X)
C
      ELSE
          Y = TAN(X)
          IF (Y .EQ. 0.0) THEN
              ZCOT = MAXNUM
C
          ELSE
              ZCOT = 1.0/Y
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
      REAL FUNCTION ZTAN(X)
C
      REAL X,TAN$M
      INTRINSIC TAN
      EXTERNAL TAN$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZTAN = TAN$M(X)
C
      ELSE
          ZTAN = TAN(X)
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
      REAL FUNCTION ZTANH(X)
C
      REAL X,TANH$M,TANH
      INTRINSIC TANH
      EXTERNAL TANH$M
      LOGICAL WHICH
      COMMON WHICH
C
C
      IF (WHICH) THEN
          ZTANH = TANH$M(X)
C
      ELSE
          ZTANH = TANH(X)
      ENDIF
      RETURN
      END
