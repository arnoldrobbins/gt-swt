C  TEST --- Subroutine to test the double precision TAN & COT functions
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
      DOUBLE PRECISION BETAP,C1,C2,U1,U2,U3
      DOUBLE PRECISION ZCOT,ZTAN
      EXTERNAL ZCOT,ZTAN
      CHARACTER*6 RNAME,RNAME2
C
C
      IF (WHICH) THEN
         RNAME = 'DTAN$M'
         RNAME2 = 'DCOT$M'
      ELSE
         RNAME = 'DTAN77'
         RNAME2 = 'DCOT77'
      ENDIF
C
      BETA = IBETA
      ALBETA = XALOG(BETA)
      AIT = IT
      A = ZERO
      B = PI/FOUR
C
C----------------------------------------------------------------------
C              RANDOM ARGUMENT ACCURACY TESTS
C----------------------------------------------------------------------
C
      DO 20 J = 1,4
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
          Y = X*HALF
          X = Y+Y
          IF (J .NE. 4) THEN
              Z = ZTAN(X)
              ZZ = ZTAN(Y)
C
          ELSE
              Z = ZCOT(X)
              ZZ = ZCOT(Y)
          ENDIF
          W = ONE
          IF (Z .NE. ZERO) THEN
              U1 = HALF-ZZ
              U2 = HALF+ZZ
              W = (U1+HALF)*(U2+HALF)
              U1 = ZZ+ZZ
              IF (J .NE. 4) THEN
                  W = (Z-U1/W)/Z
C
              ELSE
                  W = (Z+W/U1)/Z
              ENDIF
          ENDIF
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
        IF (J .EQ. 4) THEN
            PRINT 160
C
        ELSE
            PRINT 150
        ENDIF
        PRINT 50, N,A,B
        IF (J .EQ. 4) THEN
            PRINT 60, RNAME2,K1,K2,K3
C
        ELSE
            PRINT 60, RNAME,K1,K2,K3
        ENDIF
        R7 = XSQRT(R7/XN)
        PRINT 70, IT,IBETA
        W = -999.0D0
        IF (R6 .NE. ZERO) W = XALOG(DABS(R6))/ALBETA
        PRINT 80, R6,IBETA,W,X1
        W = DMAX1(AIT+W,ZERO)
        PRINT 90, IBETA,W
        W = -999.0D0
        IF (R7 .NE. ZERO) W = XALOG(DABS(R7))/ALBETA
        PRINT 100, R7,IBETA,W
        W = DMAX1(AIT+W,ZERO)
        PRINT 90, IBETA,W
        IF (J .EQ. 1) THEN
            A = PI*0.875D0
            B = PI*1.125D0
C
        ELSE
            A = PI*6.0D0
            B = A+PI/FOUR
        ENDIF
   20 CONTINUE
C----------------------------------------------------------------------
C                       SPECIAL TESTS
C----------------------------------------------------------------------
C
      PRINT 110
      PRINT 170
C
      DO 30 I = 1,5
        X = RANDX(I1)*A
        Z = ZTAN(X)+ZTAN(-X)
        PRINT 130, X,Z
   30 CONTINUE
C
      PRINT 180
      BETAP = XPOWER(BETA,DBLE$M(IT))
      X = RANDX(I1)/BETAP
C
      DO 40 I = 1,5
        Z = X-ZTAN(X)
        PRINT 130, X,Z
        X = X/BETA
   40 CONTINUE
C
      PRINT 190
C
      X = XPOWER(BETA,(DBLE$M(MINEXP)*0.75D0))
      Y = ZTAN(X)
      PRINT 240, X,Y
      C1 = -225.0D0
      C2 = -0.950846454195142026D0
      X = 11.0D0
      Y = ZTAN(X)
      W = ((C1-Y)+C2)/(C1+C2)
      Z = XALOG(DABS(W))/ALBETA
      PRINT 200, W,IBETA,Z
      PRINT 240, X,Y
      W = DMAX1(AIT+Z,ZERO)
      PRINT 90, IBETA,W
C
C----------------------------------------------------------------------
C                    TEST OF ERROR RETURNS
C----------------------------------------------------------------------
      PRINT 120
      X = XPOWER(BETA,DBLE$M(IT/2))
      PRINT 210, X
      Y = ZTAN(X)
      PRINT 230, Y
      X = BETAP*TEN
      PRINT 220, X
      Y = ZTAN(X)
      PRINT 230, Y
      PRINT 140
      RETURN
C
C     ----- End of the program ---
C
   50 FORMAT (I6,' Random arguments were tested in the interval '/6X,'('
     &,E12.4,',',E12.4,')'//)
   60 FORMAT (1X,A6,'(X) was larger',I6,' times,'/14X,' agreed',I6,
     &' times, and'/10X,'was smaller',I6,' times.'//)
   70 FORMAT (' There are ',I3,' base',I3,
     &' significant digits in a floating point number.'//)
   80 FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     &/4X,'occurred for X =',E17.6)
   90 FORMAT (' The estimated loss of base',I3,' significant digits is',
     &F7.2)
  100 FORMAT (' The root mean square relative error was',E15.4,' = ',I3,
     &' **',F7.2)
  110 FORMAT (//'Special Tests'//)
  120 FORMAT (///'Test of Error Returns'//)
  130 FORMAT (2E15.7/)
  140 FORMAT (10X,'***** This concludes the tests. *****'//)
  150 FORMAT (///'Test of TAN (X) vs 2*TAN (X/2) /(1-TAN (X/2)**2)'//)
  160 FORMAT (///'Test of COT (X) vs (COT(X/2)**2-1)/(2*COT(X/2))'//)
  170 FORMAT (' The identity TAN(-X) = -TAN(X) will be tested.'//8X,'X',
     &9X,'F(X) + F(-X)'/)
  180 FORMAT (' The identity TAN(X) = X, X small, will be tested.'//8X,
     &'X',9X,'X - F(X)'/)
  190 FORMAT (' Test of underflow for very small argument.')
  200 FORMAT (' The relative error in TAN(11) is',E15.7,' = ',I4,' **',F
     &7.2,' where'/)
  210 FORMAT (' TAN will be called with argument',E15.4/
     &' This should not trigger an error message.'//)
  220 FORMAT (' TAN will be called with argument',E15.4/
     &' This should trigger an error message.'//)
  230 FORMAT (' TAN returned the value',E15.4//)
  240 FORMAT (6X,' TAN(',E13.6,') =',E13.6/)
      END
