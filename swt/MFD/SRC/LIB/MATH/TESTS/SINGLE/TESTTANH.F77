C     TEST --- Subroutine to test the single precision TANH function
C
C     Eugene Spafford
C     Software Tools Subsystem Math Library Test Routine
C     School of Information and Computer Science
C     Georgia Institute of Technology
C     Atlanta, Georgia 30332
C
C     Adapted from:
C     "Software Manual for the Elementary Functions"
C       by William J. Cody, Jr.  &  William Waite
C      Prentice-Hall, Englewood Cliffs, NJ  1980
C
C     Coded April 1983 by Eugene Spafford
C
C     ----------------------------------------------------------
C
      SUBROUTINE TEST
C
$INSERT MACHAR.F77.I
C
      REAL BETAP,C1,C2,EXPON,D
      REAL ZTANH
      EXTERNAL ZTANH
      CHARACTER*6 RNAME
C
C
      IF (WHICH) THEN
         RNAME = 'TANH$M'
      ELSE
         RNAME = 'TANH77'
      ENDIF
C
      BETA = IBETA
      ALBETA = XALOG(BETA)
      AIT = IT
      A = 0.125
      B = XALOG(THREE)*HALF
      C = .1243530017715962080
      D = XALOG(TWO)+(AIT+ONE)*XALOG(BETA)*HALF
C
C----------------------------------------------------------------------
C              RANDOM ARGUMENT ACCURACY TESTS
C----------------------------------------------------------------------
      DO 20 J = 1,2
        K1 = 0
        K3 = 0
        X1 = ZERO
        R6 = ZERO
        R7 = ZERO
        DEL = (B-A)/XN
        XL = A
C
        DO 10 I = 1,N
          X = DEL*RANDX(I1)+XL
          W = ONE
          Z = ZTANH(X)
          Y = X-0.125
          ZZ = ZTANH(Y)
          ZZ = (ZZ+C)/(ONE+C*ZZ)
          IF (Z .NE. ZERO) W = (Z-ZZ)/Z
          IF (W .GT. ZERO) THEN
              K1 = K1+1
C
          ELSEIF (W .LT. ZERO) THEN
              K3 = K3+1
              W = -W
          ENDIF
          IF (W .GT. R6) THEN
              R6 = W
              X1 = X
          ENDIF
          R7 = R7+W*W
          XL = XL+DEL
   10   CONTINUE
C
        K2 = N-K3-K1
        PRINT 60
        PRINT 70, N,A,B
        PRINT 80, RNAME,K1,K2,K3
        R7 = XSQRT(R7/XN)
        PRINT 90, IT,IBETA
        W = -999.0
        IF (R6 .NE. ZERO) W = XALOG(ABS(R6))/ALBETA
        PRINT 100, R6,IBETA,W,X1
        W = AMAX1(AIT+W,ZERO)
        PRINT 110, IBETA,W
        W = -999.0
        IF (R7 .NE. ZERO) W = XALOG(ABS(R7))/ALBETA
        PRINT 120, R7,IBETA,W
        W = AMAX1(AIT+W,ZERO)
        PRINT 110, IBETA,W
        A = B+A
        B = D
   20 CONTINUE
C----------------------------------------------------------------------
C                       SPECIAL TESTS
C----------------------------------------------------------------------
C
      PRINT 130
      PRINT 160
C
      DO 30 I = 1,5
        X = RANDX(I1)
        Z = ZTANH(X)+ZTANH(-X)
        PRINT 140, X,Z
   30 CONTINUE
C
      PRINT 170
      BETAP = XPOWER(BETA,FLOAT(IT))
      X = RANDX(I1)/BETAP
C
      DO 40 I = 1,5
        Z = X-ZTANH(X)
        PRINT 140, X,Z
        X = X/BETA
   40 CONTINUE
C
      PRINT 180
C
      X = D
      B = FOUR
      DO 50 I = 1,5
        Z = (ZTANH(X)-HALF)-HALF
        PRINT 140, X,Z
        X = X+B
   50 CONTINUE
C
      PRINT 190
      EXPON = MINEXP*0.75
      X = XPOWER(BETA,EXPON)
      Z = ZTANH(X)
      PRINT 210, X,Z
      PRINT 200, XMAX
      Z = ZTANH(XMAX)
      PRINT 210, XMAX,Z
      PRINT 200, XMIN
      Z = ZTANH(XMIN)
      PRINT 210, XMIN,Z
      X = ZERO
      PRINT 200, X
      Z = ZTANH(X)
      PRINT 210, X,Z
      PRINT 150
      RETURN
C
C     ----- End of the program ---
C
   60 FORMAT (///
     &'Test of TANH (X) vs (TANH(X-1/8)+TANH(1/8))/(1+TANH(X-/8)*TANH(1/
     &8))'//)
   70 FORMAT (I6,' Random arguments were tested in the interval '/6X,'('
     &,E12.4,',',E12.4,')'//)
   80 FORMAT (1X,A6,'(X) was larger',I6,' times,'/14X,' agreed',I6,
     &' times, and'/10X,'was smaller',I6,' times.'//)
   90 FORMAT (' There are ',I3,' base',I3,
     &' significant digits in a floating point number.'//)
  100 FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     &/4X,'occurred for X =',E17.6)
  110 FORMAT (' The estimated loss of base',I3,' significant digits is',
     &F7.2)
  120 FORMAT (' The root mean square relative error was',E15.4,' = ',I3,
     &' **',F7.2)
  130 FORMAT (//'Special Tests'//)
  140 FORMAT (2E15.7/)
  150 FORMAT (10X,'***** This concludes the tests. *****'//)
  160 FORMAT (' The identity TANH(-X) = -TANH(X) will be tested.'//8X,
     &'X',9X,'F(X) + F(-X)'/)
  170 FORMAT (' The identity TANH(X) = X, X small, will be tested.'//8X,
     &'X',9X,'X - F(X)'/)
  180 FORMAT (' The identity TANH(X) = 1, X large, will be tested.'//8X,
     &'X',9X,'X - F(X)'/)
  190 FORMAT (' Test of underflow for very small argument.')
  200 FORMAT (' TANH will be called with argument',E15.4)
  210 FORMAT (6X,' TANH(',E13.6,') =',E13.6/)
      END
