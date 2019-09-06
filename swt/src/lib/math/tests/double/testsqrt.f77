C     TEST --- Subroutine to test the double precision SQRT function
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
      DOUBLE PRECISION SQBETA
      DOUBLE PRECISION ZSQRT
      EXTERNAL ZSQRT
      CHARACTER*6 RNAME
C
C
      IF (WHICH) THEN
         RNAME = 'DSQT$M'
      ELSE
         RNAME = 'DSQRT7'
      ENDIF
C
      BETA = IBETA
      SQBETA = XSQRT(BETA)
      ALBETA = XALOG(BETA)
      AIT = IT
      A = ONE/SQBETA
      B = ONE
C
C     START WITH RANDOM ACCURACY TESTS
C
      DO 20 J = 1,2
        C = XALOG(B/A)
        K1 = 0
        K3 = 0
        X1 = ZERO
        R6 = ZERO
        R7 = ZERO
C
        DO 10 I = 1,N
          X = A*RANDL(C)
          Y = X*X
          Z = ZSQRT(Y)
          W = (Z-X)/X
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
   10   CONTINUE
C
        K2 = N-K1-K3
        PRINT 30
        PRINT 40, N,A,B
        PRINT 50, RNAME,K1,K2,K3
        R7 = XSQRT(R7/XN)
        PRINT 60, IT,IBETA
        W = -999.0D0
        IF (R6 .NE. ZERO) W = XALOG(DABS(R6))/ALBETA
        PRINT 70, R6,IBETA,W,X1
        W = DMAX1(AIT+W,ZERO)
        PRINT 80, IBETA,W
        W = -999.0D0
        IF (R7 .NE. ZERO) W = XALOG(DABS(R7))/ALBETA
        PRINT 90, R7,IBETA,W
        W = DMAX1(AIT+W,ZERO)
        PRINT 80, IBETA,W
        A = ONE
        B = SQBETA
   20 CONTINUE
C
C     SPECIAL TESTS
C
      PRINT 100
      X = XMIN
      Y = ZSQRT(X)
      PRINT 130, X,Y
      X = ONE-EPSNEG
      Y = ZSQRT(X)
      PRINT 140, EPSNEG,Y
      X = ONE
      Y = ZSQRT(X)
      PRINT 150, X,Y
      X = ONE+EPS
      Y = ZSQRT(X)
      PRINT 160, X,Y
      X = XMAX
      Y = ZSQRT(X)
      PRINT 170, X,Y
C
C     TEST OF ERROR RETURNS
C
      PRINT 110
      X = ZERO
      PRINT 180, X
      Y = ZSQRT(X)
      PRINT 200, Y
      X = -ONE
      PRINT 190, X
      Y = ZSQRT(X)
      PRINT 200, Y
      PRINT 120
      RETURN
C
C
C     ----- THIS IS THE END OF THE SQUARE ROOT TEST ROUTINE -----
C
   30 FORMAT (///'Test of SQRT(X*X) - X'//)
   40 FORMAT (I6,' Random arguments were tested in the interval '/6X,'('
     &,E12.4,',',E12.4,')'//)
   50 FORMAT (1X,A6,'(X) was larger',I6,' times,'/14X,' agreed',I6,
     &' times, and'/10X,'was smaller',I6,' times.'//)
   60 FORMAT (' There are ',I3,' base',I3,
     &' significant digits in a floating point number.'//)
   70 FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     &/4X,'occurred for X =',E17.6)
   80 FORMAT (' The estimated loss of base',I3,' significant digits is',
     &F7.2)
   90 FORMAT (' The root mean square relative error was',E15.4,' = ',I3,
     &' **',F7.2)
  100 FORMAT (///'Test of Special Arguments'//)
  110 FORMAT (///'Test of Error Returns'//)
  120 FORMAT (10X,'***** This concludes the tests. *****'//)
  130 FORMAT (' SQRT(XMIN) = SQRT(',E15.7,') = ',E15.7//)
  140 FORMAT (' SQRT(1-EPSNEG) = SQRT(1-',E15.7,') =',E15.7//)
  150 FORMAT (' SQRT(1.0) = SQRT(1',E15.7,') =',E15.7//)
  160 FORMAT (' SQRT(1+EPS) = SQRT(1+',E15.7,') =',E15.7//)
  170 FORMAT (' SQRT(XMAX) = SQRT(',E15.7,') = ',E15.7//)
  180 FORMAT (' SQRT will be called with an argument of',E15.4/
     &' This should not trigger an error message.'//)
  190 FORMAT (' SQRT will be called with an argument of',E15.4/
     &' This should trigger an error message.'//)
  200 FORMAT (' SQRT returned the value',E15.4///)
      END
