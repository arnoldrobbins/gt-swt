C     TEST --- Subroutine to test the double precision ASIN function
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
      DOUBLE PRECISION C1,C2,S,SUM,XM,YSQ,BETAP
      INTEGER K,L,M
      DOUBLE PRECISION DLOG$M,ZASIN,ZACOS
      EXTERNAL DLOG$M,ZASIN,ZACOS
      CHARACTER*6 RNAME,RNAME2
C
C
      IF (WHICH) THEN
         RNAME = 'DASN$M'
         RNAME2 = 'DACS$M'
      ELSE
         RNAME = 'DASIN7'
         RNAME2 = 'DACOS7'
      ENDIF
C
      BETA = IBETA
      ALBETA = XALOG(BETA)
      AIT = IT
      K = DLOG$M(XPOWER(BETA,DBLE$M(IT)))+1
      IF (IBETA .EQ. 10) THEN
          C1 = 1.57D0
          C2 = 7.9632679489662D-4
C
      ELSE
          C1 = 201.0D0/128.0D0
          C2 = 4.8382679489662D-4
      ENDIF
      A = -0.125D0
      B = -A
      L = -1
C
C     Random accuracy tests
C
      DO 30 J = 1,5
        K1 = 0
        K3 = 0
        L = -L
        X1 = ZERO
        R6 = ZERO
        R7 = ZERO
        DEL = (B-A)/XN
        XL = A
C
        DO 20 I = 1,N
          X = DEL*RANDX(I1)+XL
          IF (J .GT. 2) THEN
              YSQ = HALF-HALF*DABS(X)
              X = (HALF-(YSQ+YSQ))+HALF
              IF (J .EQ. 5) X = -X
              Y = XSQRT(YSQ)
              Y = Y+Y
C
          ELSE
              Y = X
              YSQ = Y*Y
          ENDIF
          SUM = ZERO
          XM = K+K+1
          IF (L .GT. 0) THEN
              Z = ZASIN(X)
C
          ELSEIF (L .LT. 0) THEN
              Z = ZACOS(X)
          ENDIF
C
          DO 10 M = 1,K
            SUM = YSQ*(SUM+ONE/XM)
            XM = XM-TWO
            SUM = SUM*(XM/(XM+ONE))
   10     CONTINUE
C
          SUM = SUM*Y
          IF ((J .EQ. 1) .OR.
     &        (J .EQ. 4)) THEN
              ZZ = Y+SUM
              SUM = (Y-ZZ)+SUM
C
          ELSE
              S = C1+C2
              SUM = ((C1-S)+C2)-SUM
              ZZ = S+SUM
              SUM = (S-ZZ)+SUM-Y
              S = ZZ
              ZZ = S+SUM
              SUM = (S-ZZ)+SUM
          ENDIF
C
          IF (IRND .NE. 1) ZZ = ZZ+(SUM+SUM)
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
        IF (L .GE. 0) THEN
            PRINT 160
            PRINT 60, N,A,B
            PRINT 70, RNAME,K1,K2,K3
C
        ELSE
            PRINT 170
            PRINT 60, N,A,B
            PRINT 70, RNAME2,K1,K2,K3
        ENDIF
        R7 = XSQRT(R7/XN)
        PRINT 80, IT,IBETA
        W = -999.0D0
        IF (R6 .NE. ZERO) W = XALOG(DABS(R6))/ALBETA
        PRINT 90, R6,IBETA,W,X1
        W = DMAX1(AIT+W,ZERO)
        PRINT 100, IBETA,W
        W = -999.0D0
        IF (R7 .NE. ZERO) W = XALOG(DABS(R7))/ALBETA
        PRINT 110, R7,IBETA,W
        W = DMAX1(AIT+W,ZERO)
        PRINT 100, IBETA,W
        IF (J .EQ. 2) THEN
            A = 0.75D0
            B = ONE
C
        ELSEIF (J .EQ. 4) THEN
            B = -A
            A = -ONE
            C1 = C1+C1
            C2 = C2+C2
            L = -L
        ENDIF
   30 CONTINUE
C
C     SPECIAL TESTS
C
      PRINT 120
      PRINT 180
C
      DO 40 I = 1,5
        X = RANDX(I1)*A
        Z = ZASIN(X)+ZASIN(-X)
        PRINT 140, X,Z
   40 CONTINUE
C
      PRINT 190
      BETAP = XPOWER(BETA,DBLE$M(IT))
      X = RANDX(I1)/BETAP
      DO 50 I = 1,5
        Z = X-ZASIN(X)
        PRINT 140, X,Z
        X = X/BETA
   50 CONTINUE
C
      PRINT 200
      X = XPOWER(BETA,(MINEXP*0.75D0))
      Y = ZASIN(X)
      PRINT 230, X,Y
C
C     TEST OF ERROR RETURNS
C
      PRINT 130
      X = 1.2D0
      PRINT 210, X
      Y = ZASIN(X)
      PRINT 220, Y
      PRINT 150
      RETURN
C
C     ---------- LAST LINE OF ASIN/ACOS TEST PROGRAM -----
C
   60 FORMAT (I6,' Random arguments were tested in the interval '/6X,'('
     &,E12.4,',',E12.4,')'//)
   70 FORMAT (1X,A6,'(X) was larger',I6,' times,'/14X,' agreed',I6,
     &' times, and'/10X,'was smaller',I6,' times.'//)
   80 FORMAT (' There are ',I3,' base',I3,
     &' significant digits in a floating point number.'//)
   90 FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     &/4X,'occurred for X =',E17.6)
  100 FORMAT (' The estimated loss of base',I3,' significant digits is',
     &F7.2)
  110 FORMAT (' The root mean square relative error was',E15.4,' = ',I3,
     &' **',F7.2)
  120 FORMAT (//'Special Tests'//)
  130 FORMAT (///'Test of Error Returns'//)
  140 FORMAT (2E15.7/)
  150 FORMAT (10X,'***** This concludes the tests. *****'//)
  160 FORMAT (///'Test of ASIN(X) vs. Taylor series'//)
  170 FORMAT (///'Test of ACOS(X) vs. Taylor series'//)
  180 FORMAT (' The identity ASIN(-X) = -ASIN(X) will be tested.'//8X,
     &'X',9X,'F(X) + F(-X)'/)
  190 FORMAT (' The identity ASIN(X) = X, X small, will be tested.'//8X,
     &'X',9X,'X - F(X)'/)
  200 FORMAT (' Test of underflow for very small argument.'/)
  210 FORMAT (' ASIN will be called with argument',E15.4/
     &' -- this should trigger an error message.'//)
  220 FORMAT (' ASIN returned the value',E15.4///)
  230 FORMAT (6X,' ASIN(',E13.6,') =',E13.6/)
      END
