C  TEST --- Subroutine to test the double precision SIN & COS functions
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
      DOUBLE PRECISION BETAP,EXPON,U1,U2,U3
      DOUBLE PRECISION ZSIN,ZCOS
      EXTERNAL ZCOS,ZSIN
      CHARACTER*6 RNAME,RNAME2
C
C
      IF (WHICH) THEN
         RNAME = 'DSIN$M'
         RNAME2 = 'DCOS$M'
      ELSE
         RNAME = 'DSIN77'
         RNAME = 'DCOS77'
      ENDIF
C
      BETA = IBETA
      ALBETA = XALOG(BETA)
      AIT = IT
      A = ZERO
      B = 1.570796327D0
      C = B
C
C----------------------------------------------------------------------
C              RANDOM ARGUMENT ACCURACY TESTS
C----------------------------------------------------------------------
      DO 50 J = 1,3
        K1 = 0
        K3 = 0
        X1 = ZERO
        R6 = ZERO
        R7 = ZERO
        DEL = (B-A)/XN
        XL = A
C
        DO 40 I = 1,N
          X = DEL*RANDX(I1)+XL
          Y = X/THREE
          U1 = XL
          U2 = X+Y
          U1 = U2+THREE
          Y = U2-X
          U3 = U2-U1
          X = THREE*Y
          IF (J .EQ. 3) GO TO 10
          Z = ZSIN(X)
          ZZ = ZSIN(Y)
          W = ONE
          IF (Z .NE. ZERO) W = (Z-ZZ*(THREE-FOUR*ZZ*ZZ))/Z
          GO TO 20
   10     Z = ZCOS(X)
          ZZ = ZCOS(Y)
          W = ONE
          IF (Z .NE. ZERO) W = (Z+ZZ*(THREE-FOUR*ZZ*ZZ))/Z
   20     IF (W .GT. ZERO) K1 = K1+1
          IF (W .LT. ZERO) K3 = K3+1
          W = DABS(W)
          IF (W .LE. R6) GO TO 30
          R6 = W
          X1 = X
   30     R7 = R7+W*W
          XL = XL+DEL
   40   CONTINUE
C
        K2 = N-K3-K1
        IF (J .NE. 3) THEN
            PRINT 190
            PRINT 90, N,A,B
            PRINT 100, RNAME,K1,K2,K3
C
        ELSE
            PRINT 200
            PRINT 90, N,A,B
            PRINT 100, RNAME2,K1,K2,K3
        ENDIF
        R7 = XSQRT(R7/XN)
        PRINT 110, IT,IBETA
        W = -999.0D0
        IF (R6 .NE. ZERO) W = XALOG(DABS(R6))/ALBETA
        PRINT 120, R6,IBETA,W,X1
        W = DMAX1(AIT+W,ZERO)
        PRINT 130, IBETA,W
        W = -999.0D0
        IF (R7 .NE. ZERO) W = XALOG(DABS(R7))/ALBETA
        PRINT 140, R7,IBETA,W
        W = DMAX1(AIT+W,ZERO)
        PRINT 130, IBETA,W
        A = 18.84955592D0
        IF (J .EQ. 2) A = B+C
        B = A+C
   50 CONTINUE
C
C----------------------------------------------------------------------
C                       SPECIAL TESTS
C----------------------------------------------------------------------
C
      PRINT 150
      C = XPOWER(ONE/BETA,DBLE$M(IT/2))
      Z = (ZSIN(A+C)-ZSIN(A-C))/(C+C)
      PRINT 210, Z
C
      PRINT 220
C
      DO 60 I = 1,5
        X = RANDX(I1)*A
        Z = ZSIN(X)+ZSIN(-X)
        PRINT 170, X,Z
   60 CONTINUE
C
      PRINT 230
      BETAP = XPOWER(BETA,DBLE$M(IT))
      X = RANDX(I1)/BETAP
C
      DO 70 I = 1,5
        Z = X-ZSIN(X)
        PRINT 170, X,Z
        X = X/BETA
   70 CONTINUE
C
      PRINT 240
C
      DO 80 I = 1,5
        X = RANDX(I1)*A
        Z = ZCOS(X)-ZCOS(-X)
        PRINT 170, X,Z
   80 CONTINUE
C
      PRINT 250
      EXPON = DBLE$M(MINEXP)*0.75D0
      X = XPOWER(BETA,EXPON)
      Y = ZSIN(X)
      PRINT 290, X,Y
      PRINT 260
      Z = XSQRT(BETAP)
      X = Z*(ONE-EPSNEG)
      Y = ZSIN(X)
      PRINT 290, X,Y
      Y = ZSIN(Z)
      PRINT 290, Z,Y
      X = Z*(ONE+EPS)
      Y = ZSIN(X)
      PRINT 290, X,Y
C
C----------------------------------------------------------------------
C                    TEST OF ERROR RETURNS
C----------------------------------------------------------------------
C
      PRINT 160
      X = BETAP*TEN
      PRINT 270, X
      Y = ZSIN(X)
      PRINT 280, Y
      PRINT 180
      RETURN
C
C     ----- End of the program ---
C
   90 FORMAT (I6,' Random arguments were tested in the interval '/6X,'('
     &,E12.4,',',E12.4,')'//)
  100 FORMAT (1X,A6,'(X) was larger',I6,' times,'/14X,' agreed',I6,
     &' times, and'/10X,'was smaller',I6,' times.'//)
  110 FORMAT (' There are ',I3,' base',I3,
     &' significant digits in a floating point number.'//)
  120 FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     &/4X,'occurred for X =',E17.6)
  130 FORMAT (' The estimated loss of base',I3,' significant digits is',
     &F7.2)
  140 FORMAT (' The root mean square relative error was',E15.4,' = ',I3,
     &' **',F7.2)
  150 FORMAT (//'Special Tests'//)
  160 FORMAT (///'Test of Error Returns'//)
  170 FORMAT (2E15.7/)
  180 FORMAT (10X,'***** This concludes the tests. *****'//)
  190 FORMAT (///'Test of SIN (X) vs 3*SIN (X/3) - 4*SIN (X/3)**3'//)
  200 FORMAT (///'Test of COS (X) vs 4*COS (X/3)**3 - 3*COS(X/3)'//)
  210 FORMAT (' If ',E13.6,
     &' is not almost 1.0D0 SIN has the wrong period.')
  220 FORMAT (' The identity SIN(-X) = -SIN(X) will be tested.'//8X,'X',
     &9X,'F(X) + F(-X)'/)
  230 FORMAT (' The identity SIN(X) = X, X small, will be tested.'//8X,
     &'X',9X,'X - F(X)'/)
  240 FORMAT (' The identity COS(-X) = COS(X) will be tested.'//8X,'X',9
     &X,'F(X) + F(-X)'/)
  250 FORMAT (' Test of underflow for very small argument.')
  260 FORMAT (
     &' The following three lines illustrate the loss in significance'/
     &' for large arguments.  The arguments are consecutive.')
  270 FORMAT (' SIN will be called with argument',E15.4/
     &' This should trigger an error message.'//)
  280 FORMAT (' SIN returned the value',E15.4//)
  290 FORMAT (/6X,' SIN(',E13.6,') =',E13.6)
      END
