C     TEST --- Subroutine to test the double precision EXP function
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
      DOUBLE PRECISION U1,U2,U3,D,V
      DOUBLE PRECISION ZEXP
      EXTERNAL ZEXP
      CHARACTER*6 RNAME
C
C
      IF (WHICH) THEN
         RNAME = 'DEXP$M'
      ELSE
         RNAME = 'DEXP77'
      ENDIF
C
      BETA = IBETA
      ALBETA = XALOG(BETA)
      AIT = IT
      V = 0.0625D0
      A = TWO
      B = XALOG(A)*HALF
      A = -B+V
      D = XALOG(XMAX)+XALOG(0.9D0)
C
C     RANDOM ACCURACY TESTS
C
      DO 20 J = 1,3
        K1 = 0
        K3 = 0
        X1 = ZERO
        R6 = ZERO
        R7 = ZERO
        DEL = (B-A)/XN
        XL = A
        DO 10 I = 1,N
          X = DEL*RANDX(I1)+XL
C
C     PURIFY ARGUMENTS
C
          Y = X-V
          IF (Y .LT. ZERO) X = Y+V
          Z = ZEXP(X)
          ZZ = ZEXP(Y)
          IF (J .NE. 1) THEN
              IF (IBETA .NE. 10) THEN
                  U1 = Z*0.0625D0
                  U2 = Z*2.445332104692057D-3
C
              ELSE
                  U1 = Z*0.06D0
                  U2 = -Z*5.466789530794296D-5
              ENDIF
C
          ELSE
              U1 = Z
              U2 = Z*6.0586937186524214D-2
          ENDIF
          U3 = U1-U2
          W = ONE
          Z = U3
          IF (ZZ .NE. ZERO) THEN
              U1 = Z-ZZ
              IF (U1 .EQ. ZERO) THEN
                  W = ZERO
              ELSE
                  W = U1/ZZ
              ENDIF
          ENDIF
C
          IF (W .LT. ZERO) THEN
              K1 = K1+1
              W = -W
C
          ELSEIF (W .GT. ZERO) THEN
              K3 = K3+1
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
        PRINT 40, V,V
        PRINT 50, N,A,B
        PRINT 60, RNAME,K1,K2,K3
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
        IF (J .NE. 2) THEN
            V = 45.0/16.0
            A = -TEN*B
            B = FOUR*XMIN*XPOWER(BETA,DBLE$M(IT))
            B = XALOG(B)
C
        ELSE
            A = -TWO*A
            B = TEN*A
            IF (B .LT. D) B = D
        ENDIF
   20 CONTINUE
C
C     SPECIAL TESTS
C
      PRINT 110
      PRINT 160
C
      DO 30 I = 1,5
        X = RANDX(I1)*BETA
        Y = -X
        Z = ZEXP(X)*ZEXP(Y)-ONE
        PRINT 140, X,Z
   30 CONTINUE
C
      PRINT 120
      X = ZERO
      Y = ZEXP(X)-ONE
      PRINT 170, Y
      X = DINT$M(XALOG(XMIN))
      Y = ZEXP(X)
      PRINT 180, X,Y
      X = DINT$M(XALOG(XMAX))
      Y = ZEXP(X)
      PRINT 180, X,Y
      X = X/TWO
      V = X/TWO
      Y = ZEXP(X)
      Z = ZEXP(V)
      Z = Z*Z
      PRINT 190, X,Y,V,Z
C
C     TEST OF ERROR RETURNS
C
      PRINT 130
      X = -ONE/XSQRT(XMIN)
      PRINT 200, X
      Y = ZEXP(X)
      PRINT 210, Y
      X = -X
      PRINT 200, X
      Y = ZEXP(X)
      PRINT 210, Y
      PRINT 150
      RETURN
C
C
C     ***** Last line of routine to test EXP function *****
C
   40 FORMAT (///'Test of EXP(X-',F7.4,') vs. EXP(X)/EXP(',F7.4,')'//)
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
  120 FORMAT (///'Test of Special Arguments'//)
  130 FORMAT (///'Test of Error Returns'//)
  140 FORMAT (2E15.7/)
  150 FORMAT (10X,'***** This concludes the tests. *****'//)
  160 FORMAT (' The identity EXP(X)*EXP(-X) = 1.0 will be tested.'//8X,
     &'X',9X,'F(X)*F(-X) - 1.0'/)
  170 FORMAT (' EXP(0.0) - 1.0 = ',E15.7/)
  180 FORMAT (' EXP(',E13.6,') =',E13.6/)
  190 FORMAT ('If EXP(',E13.6,') = ',E13.6,' is not about'/' EXP(',E13.6
     &,') **2 = ',E13.6,' there is an arg. reduction error.')
  200 FORMAT (' EXP will be called with the argument',E15.4/
     &' This should trigger an error message.'//)
  210 FORMAT (' EXP returned the value',E15.4///)
      END
