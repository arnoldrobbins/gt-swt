C  TEST --- Subroutine to test the single precision SINH & COSH function
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
      INTEGER II,NIT,I2
      REAL BETAP,EXPON,AIND,ALXMAX,C0,DEN,XSQ
      REAL ZCOSH,ZSINH
      EXTERNAL ZCOSH,ZSINH
      CHARACTER*6 RNAME,RNAME2
C
C
      IF (WHICH) THEN
         RNAME = 'SINH$M'
         RNAME2 = 'COSH$M'
      ELSE
         RNAME = 'SINH77'
         RNAME2 = 'COSH77'
      ENDIF
C
      BETA = IBETA
      ALBETA = XALOG(BETA)
      ALXMAX = XALOG(XMAX)
      AIT = IT
      A = ZERO
      C0 = FIVE/16.0+1.152713683194269979E-2
      B = HALF
      C = (AIT+ONE)*.35
      IF (IBETA .EQ. 10) C = C*THREE
      I2 = 2
      NIT = 2-(INT(XALOG(EPS)*THREE))/20
      AIND = FLOAT(NIT+NIT+1)
C
C----------------------------------------------------------------------
C              RANDOM ARGUMENT ACCURACY TESTS
C----------------------------------------------------------------------
C
      DO 30 J = 1,4
        IF (J .EQ. 2) THEN
            AIND = AIND-ONE
            I2 = 1
        ENDIF
        K1 = 0
        K3 = 0
        X1 = ZERO
        R6 = ZERO
        R7 = ZERO
        DEL = (B-A)/XN
        XL = A
C
        DO 20 I = 1,N
          X = DEL*RANDX(I1)+XL
          IF (J .LE. 2) THEN
              XSQ = X*X
              Z = ONE
              DEN = AIND
C
              DO 10 II = I2,NIT
                W = ZZ*XSQ/(DEN*(DEN-ONE))
                ZZ = W+ONE
                DEN = DEN-TWO
   10         CONTINUE
              IF (J .NE. 2) THEN
                  W = X*XSQ*ZZ/6.0
                  ZZ = X+W
                  Z = ZSINH(X)
                  IF (IRND .EQ. 0) THEN
                      W = (X-ZZ)+W
                      ZZ = ZZ+(W+W)
                  ENDIF
C
              ELSE
                  Z = ZCOSH(X)
                  IF (IRND .EQ. 0) THEN
                      W = (ONE-ZZ)+W
                      ZZ = ZZ+(W+W)
                  ENDIF
              ENDIF
C
          ELSE
              Y = X
              X = Y-ONE
              W = X-ONE
              IF (J .EQ. 4) THEN
                  Z = ZCOSH(X)
                  ZZ = (ZCOSH(Y)+ZCOSH(W))*C0
C
              ELSE
                  Z = ZSINH(X)
                  ZZ = (ZSINH(Y)+ZSINH(W))*C0
              ENDIF
          ENDIF
          W = ONE
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
   20   CONTINUE
C
        K2 = N-K3-K1
        I = LT(J,31)
        IF (J .EQ. 1) THEN
            PRINT 70
C
        ELSEIF (J .EQ. 2) THEN
            PRINT 90
C
        ELSEIF (J .EQ. 3) THEN
            PRINT 80
C
        ELSE
            PRINT 100
        ENDIF
        PRINT 110, N,A,B
        IF (I .NE. J) THEN
            PRINT 120, RNAME,K1,K2,K3
C
        ELSE
            PRINT 120, RNAME2,K1,K2,K3
        ENDIF
        R7 = XSQRT(R7/XN)
        PRINT 130, IT,IBETA
        W = -999.0
        IF (R6 .NE. ZERO) W = XALOG(ABS(R6))/ALBETA
        PRINT 140, R6,IBETA,W,X1
        W = AMAX1(AIT+W,ZERO)
        PRINT 150, IBETA,W
        W = -999.0
        IF (R7 .NE. ZERO) W = XALOG(ABS(R7))/ALBETA
        PRINT 160, R7,IBETA,W
        W = AMAX1(AIT+W,ZERO)
        PRINT 150, IBETA,W
        IF (J .EQ. 2) THEN
            B = ALXMAX
            A = THREE
        ENDIF
   30 CONTINUE
C----------------------------------------------------------------------
C                       SPECIAL TESTS
C----------------------------------------------------------------------
      PRINT 170
      PRINT 210
C
      DO 40 I = 1,5
        X = RANDX(I1)*A
        Z = ZSINH(X)+ZSINH(-X)
        PRINT 190, X,Z
   40 CONTINUE
C
      PRINT 220
      BETAP = XPOWER(BETA,FLOAT(IT))
      X = RANDX(I1)/BETAP
C
      DO 50 I = 1,5
        Z = X-ZSINH(X)
        PRINT 190, X,Z
        X = X/BETA
   50 CONTINUE
C
      PRINT 230
C
      DO 60 I = 1,5
        X = RANDX(I1)*A
        Z = ZCOSH(X)-ZCOSH(-X)
        PRINT 190, X,Z
   60 CONTINUE
C
      PRINT 240
      EXPON = FLOAT(MINEXP)*0.75E0
      BETA = XPOWER(BETA,EXPON)
      Y = ZSINH(X)
      PRINT 280, X,Y
C----------------------------------------------------------------------
C                    TEST OF ERROR RETURNS
C----------------------------------------------------------------------
      PRINT 180
      X = ALXMAX+0.125
      PRINT 250, X
      Y = ZSINH(X)
      PRINT 270, Y
      X = BETAP
      PRINT 260, X
      Y = ZSINH(X)
      PRINT 270, Y
      PRINT 200
      RETURN
C
C     ----- End of the program ---
C
   70 FORMAT (//'Test of SINH(X) vs> Taylor Series expansion of SINH(X)'
     &//)
   80 FORMAT (//'Test of SINH(X) vs. C*(SINH(X+1)+SINH(X-1))'//)
   90 FORMAT (//'Test of COSH(X) vs> Taylor Series expansion of COSH(X)'
     &//)
  100 FORMAT (//'Test of SINH(X) vs. C*(SINH(X+1)+SINH(X-1))'//)
  110 FORMAT (I6,' Random arguments were tested in the interval '/6X,'('
     &,E12.4,',',E12.4,')'//)
  120 FORMAT (1X,A6,'(X) was larger',I6,' times,'/14X,' agreed',I6,
     &' times, and'/10X,'was smaller',I6,' times.'//)
  130 FORMAT (' There are ',I3,' base',I3,
     &' significant digits in a floating point number.'//)
  140 FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     &/4X,'occurred for X =',E17.6)
  150 FORMAT (' The estimated loss of base',I3,' significant digits is',
     &F7.2)
  160 FORMAT (' The root mean square relative error was',E15.4,' = ',I3,
     &' **',F7.2)
  170 FORMAT (//'Special Tests'//)
  180 FORMAT (///'Test of Error Returns'//)
  190 FORMAT (2E15.7/)
  200 FORMAT (10X,'***** This concludes the tests. *****'//)
  210 FORMAT (' The identity SINH(-X) = -SINH(X) will be tested.'//8X,
     &'X',9X,'F(X) + F(-X)'/)
  220 FORMAT (' The identity SINH(X) = X, X small, will be tested.'//8X,
     &'X',9X,'X - F(X)'/)
  230 FORMAT (' The identity COSH(-X) = COSH(X) will be tested.'//8X,'X'
     &,9X,'F(X) + F(-X)'/)
  240 FORMAT (' Test of underflow for very small argument.')
  250 FORMAT (' SINH will be called with argument',E15.4/
     &' This should not trigger an error message.'//)
  260 FORMAT (' SINH will be called with argument',E15.4/
     &' This should trigger an error message.'//)
  270 FORMAT (' SINH returned the value',E15.4//)
  280 FORMAT (/6X,' SINH(',E13.6,') =',E13.6)
      END
