C     TEST --- Subroutine to test the single precision ATAN function
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
      INTEGER II
      REAL BETAP,EM,EXPON,OB32,SUM,XSQ,ZATAN
      EXTERNAL ZATAN
      CHARACTER*6 RNAME
C
C
      IF (WHICH) THEN
         RNAME = 'ATAN$M'
      ELSE
         RNAME = 'ATAN77'
      ENDIF
C
      BETA = IBETA
      ALBETA = XALOG(BETA)
      AIT = IT
      A = -0.0625
      B = -A
      OB32 = B*HALF
C
C----------------------------------------------------------------------
C              RANDOM ARGUMENT ACCURACY TESTS
C----------------------------------------------------------------------
C
      DO 30 J = 1,4
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
          IF (J .EQ. 2) X = ((ONE+X*A)-ONE)*16.0
          IF (X .GE. ONE) X = X-ONE
          Z = ZATAN(X)
          IF (J .EQ. 1) THEN
              XSQ = X*X
              EM = 17.0
              SUM = XSQ/EM
              DO 10 II = 1,7
                EM = EM-TWO
                SUM = (ONE/EM-SUM)*XSQ
   10         CONTINUE
              SUM = -X*SUM
              ZZ = X+SUM
              SUM = (X-ZZ)+SUM
              IF (IRND .EQ. 0) ZZ = ZZ+(SUM+SUM)
C
          ELSEIF (J .EQ. 2) THEN
              Y = X-.0625
              Y = Y/(ONE+X*A)
              ZZ = (ZATAN(Y)-8.1190004042651526021e-5)+OB32
              ZZ = ZZ+OB32
C
          ELSE
              Z = Z+Z
              Y = X/((HALF+X*HALF)*((HALF-X)+HALF))
              ZZ = ZATAN(Y)
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
        IF (J .EQ. 1) THEN
            PRINT 60
C
        ELSEIF (J .EQ. 2) THEN
            PRINT 70
C
        ELSE
            PRINT 80
        ENDIF
        PRINT 90, N,A,B
        PRINT 100, RNAME,K1,K2,K3
        R7 = XSQRT(R7/XN)
        PRINT 110, IT,IBETA
        W = -999.0
        IF (R6 .NE. ZERO) W = XALOG(ABS(R6))/ALBETA
        PRINT 120, R6,IBETA,W,X1
        W = AMAX1(AIT+W,ZERO)
        PRINT 130, IBETA,W
        W = -999.0
        IF (R7 .NE. ZERO) W = XALOG(ABS(R7))/ALBETA
        PRINT 140, R7,IBETA,W
        W = AMAX1(AIT+W,ZERO)
        PRINT 130, IBETA,W
        A = B
        IF (J .EQ. 1) THEN
            B = TWO-XSQRT(THREE)
C
        ELSEIF (J .EQ. 2) THEN
            B = XSQRT(TWO)-ONE
C
        ELSEIF (J .EQ. 3) THEN
            B = ONE
        ENDIF
   30 CONTINUE
C----------------------------------------------------------------------
C                       SPECIAL TESTS
C----------------------------------------------------------------------
C
      PRINT 150
      PRINT 190
C
      DO 40 I = 1,5
        X = RANDX(I1)*A
        Z = ZATAN(X)+ZATAN(-X)
        PRINT 170, X,Z
   40 CONTINUE
C
      PRINT 200
      BETAP = XPOWER(BETA,FLOAT(IT))
      X = RANDX(I1)/BETAP
C
      DO 50 I = 1,5
        Z = X-ZATAN(X)
        PRINT 170, X,Z
        X = X/BETA
   50 CONTINUE
C
C     NOTE THAT THERE IS NO ATAN2 IN THE LIBRARY, THUS NO TEST FOR IT
C
      PRINT 210
C
      EXPON = FLOAT(MINEXP)*0.75E0
      X = XPOWER(BETA,EXPON)
      Y = ZATAN(X)
      PRINT 230, X,Y
C
C----------------------------------------------------------------------
C                    TEST OF ERROR RETURNS
C----------------------------------------------------------------------
      PRINT 160
      PRINT 220, XMAX
      Z = ZATAN(XMAX)
      PRINT 230, XMAX,Z
C
C     TESTS OF ATAN2 WERE INTENTIONALLY LEFT OUT
C
      PRINT 180
      RETURN
C
C     ----- End of the program ---
C
   60 FORMAT (//'Test of ATAN(X) vs Truncated Taylor series'//)
   70 FORMAT (///
     &'Test of ATAN (X) vs ATAN(1/16)+ATAN((X-1/16)/(1+X/16))'//)
   80 FORMAT (//'Test of 2*ATAN(X) vs ATAN(2X/(1-X*X))'//)
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
  190 FORMAT (' The identity ATAN(-X) = -ATAN(X) will be tested.'//8X,
     &'X',9X,'F(X) + F(-X)'/)
  200 FORMAT (' The identity ATAN(X) = X, X small, will be tested.'//8X,
     &'X',9X,'X - F(X)'/)
  210 FORMAT (' Test of underflow for very small argument.')
  220 FORMAT (' ATAN will be called with argument',E15.4/
     &' This should not trigger an error message.'//)
  230 FORMAT (6X,' ATAN(',E13.6,') =',E13.6/)
      END
