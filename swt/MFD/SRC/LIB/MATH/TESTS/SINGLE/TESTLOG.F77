C  TEST --- Subroutine to test the single precision LOG & LOG10 function
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
      REAL U1,U2,ZALOG,ZALG10
      EXTERNAL ZALOG,ZALG10
      CHARACTER*6 RNAME,RNAME2
C
C
      IF (WHICH) THEN
         RNAME = 'LOG$M '
         RNAME2 = 'LG10$M'
      ELSE
         RNAME = 'ALOG77'
         RNAME2 = 'ALOG10'
      ENDIF
C
      BETA = IBETA
      ALBETA = XALOG(BETA)
      AIT = IT
      J = IT/3
      C = ONE
C
      DO 10 I = 1,J
        C = C/BETA
   10 CONTINUE
C
      B = ONE+C
      A = ONE-C
C
      DO 80 J = 1,4
        K1 = 0
        K3 = 0
        X1 = ZERO
        R6 = ZERO
        R7 = ZERO
        DEL = (B-A)/XN
        XL = A
C
        DO 70 I = 1,N
          X = DEL*RANDX(I1)+XL
          GO TO (20,30,40,50), J
          GO TO 60
C
   20     CONTINUE
          Y = (X-HALF)-HALF
          ZZ = ZALOG(X)
          Z = ONE/THREE
          Z = Y*(Z-Y/FOUR)
          Z = (Z-HALF)*Y*Y+Y
          GO TO 60
C
   30     CONTINUE
          U1 = X+EIGHT
          U2 = ZZ+ZERO
          X = U1-EIGHT
          Y = X+X/16.0
          Z = ZALOG(X)
          ZZ = ZALOG(Y)-7.7746816434843E-5
          ZZ = ZZ-(31.0/512.0)
          GO TO 60
C
   40     CONTINUE
          U1 = X+EIGHT
          U2 = ZZ+ZERO
          X = U1-EIGHT
          Y = X+X*TENTH
          Z = ZALG10(X)
          ZZ = ZALG10(Y)-3.7706015822504E-4
          ZZ = ZZ-(21.0/512.0)
          GO TO 60
C
   50     CONTINUE
          Z = ZALOG(X*X)
          ZZ = ZALOG(X)
          ZZ = ZZ+ZZ
C
   60     CONTINUE
          W = ONE
          IF (Z .NE. ZERO) W = (Z-ZZ)/Z
          Z = SIGN(W,Z)
          IF (Z .GT. ZERO) THEN
              K1 = K1+1
C
          ELSEIF (Z .LT. ZERO) THEN
              K3 = K3+1
          ENDIF
          W = ABS(W)
          IF (W .GT. R6) THEN
              R6 = W
              X1 = X
          ENDIF
          R7 = R7+W*W
          XL = XL+DEL
   70   CONTINUE
C
        K2 = N-K3-K1
        IF (J .EQ. 1) THEN
            PRINT 100
            PRINT 140, N,C
            PRINT 160, 'ALOG',K1,K2,K3
C
        ELSEIF (J .EQ. 2) THEN
            PRINT 110
            PRINT 150, N,A,B
            PRINT 160, RNAME,K1,K2,K3
C
        ELSEIF (J .EQ. 3) THEN
            PRINT 130
            PRINT 150, N,A,B
            PRINT 160, RNAME2,K1,K2,K3
C
        ELSEIF (J .EQ. 4) THEN
            PRINT 120
            PRINT 150, N,A,B
            PRINT 160, RNAME,K1,K2,K3
        ENDIF
        R7 = XSQRT(R7/XN)
        PRINT 170, IT,IBETA
        W = -999.0
        IF (R6 .NE. ZERO) W = ZALOG(ABS(R6))/ALBETA
        PRINT 180, R6,IBETA,W,X1
        W = AMAX1(AIT+W,ZERO)
        PRINT 190, IBETA,W
        W = -999.0
        IF (R7 .NE. ZERO) W = ZALOG(ABS(R7))/ALBETA
        PRINT 200, R7,IBETA,W
        W = AMAX1(AIT+W,ZERO)
        PRINT 190, IBETA,W
        IF (J .EQ. 1) THEN
            A = XSQRT(HALF)
            B = 15.0/16.0
C
        ELSEIF (J .EQ. 2) THEN
            A = XSQRT(TENTH)
            B = 0.9
C
        ELSE
            A = 16.0
            B = 240.0
        ENDIF
   80 CONTINUE
C
C     SPECIAL TESTS
C
      PRINT 210
      PRINT 260
C
      DO 90 I = 1,5
        X = RANDX(I1)
        X = X+X+15.0
        Y = ONE/X
        Z = ZALOG(X)+ZALOG(Y)
        PRINT 240, X,Z
   90 CONTINUE
C
      PRINT 220
      X = ONE
      Y = ZALOG(X)
      PRINT 270, Y
      X = XMIN
      Y = ZALOG(X)
      PRINT 280, X,Y
      X = XMAX
      Y = ZALOG(X)
      PRINT 290, X,Y
C
C     TEST OF ERROR RETURNS
C
      PRINT 230
      X = -TWO
      PRINT 300, X
      Y = ZALOG(X)
      PRINT 310, Y
      X = ZERO
      PRINT 300, X
      Y = ZALOG(X)
      PRINT 310, Y
      PRINT 250
      RETURN
C
C
C     ***** END OF ROUTINE TO TEST THE LOG FUNCTIONS *****
C
  100 FORMAT (///
     &'Test of ALOG(X) vs. Taylor Series Expansion of ALOG(1+Y)'//)
  110 FORMAT (///'Test of ALOG(X) vs. ALOG(17X/16)-ALOG(17/16)'//)
  120 FORMAT (///'Test of ALOG(X*X) vs. 2 * ALOG(X)'//)
  130 FORMAT (///'Test of ALOG10(X) vs. ALOG10(11X/10) - ALOG10(11/10)'/
     &/)
  140 FORMAT (I7,' random arguments were tested from the interval'/6X,
     &'(1-EPS, 1+EPS), where EPS =',E15.4//)
  150 FORMAT (I6,' Random arguments were tested in the interval '/6X,'('
     &,E12.4,',',E12.4,')'//)
  160 FORMAT (1X,A6,'(X) was larger',I6,' times,'/14X,' agreed',I6,
     &' times, and'/10X,'was smaller',I6,' times.'//)
  170 FORMAT (' There are ',I3,' base',I3,
     &' significant digits in a floating point number.'//)
  180 FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     &/4X,'occurred for X =',E17.6)
  190 FORMAT (' The estimated loss of base',I3,' significant digits is',
     &F7.2)
  200 FORMAT (' The root mean square relative error was',E15.4,' = ',I3,
     &' **',F7.2)
  210 FORMAT (//'Special Tests'//)
  220 FORMAT (///'Test of Special Arguments'//)
  230 FORMAT (///'Test of Error Returns'//)
  240 FORMAT (2E15.7/)
  250 FORMAT (10X,'***** This concludes the tests. *****'//)
  260 FORMAT (' The identity ALOG(X) = - ALOG(1/X) will be tested.'//8X,
     &'X',9X,'F(X) + F(1/X)'/)
  270 FORMAT (' ALOG(1.0) = ',E15.7//)
  280 FORMAT (' ALOG(XMIN) = ALOG(',E15.7,') =',E15.7//)
  290 FORMAT (' ALOG(XMAX) = ALOG(',E15.7,') =',E15.7//)
  300 FORMAT (' ALOG will be called with the argument',E15.4/
     &' This should cause an error.'//)
  310 FORMAT (' ALOG returned the value',E15.4//)
      END
