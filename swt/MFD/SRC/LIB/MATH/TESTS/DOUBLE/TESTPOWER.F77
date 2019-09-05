C     TEST --- Subroutine to test the double precision POWER function
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
      DOUBLE PRECISION ALXMAX,SQBETA,ONEP5,SCALE,DELY,Y1,Y2,XSQ,U1
      DOUBLE PRECISION ZPOWR
      EXTERNAL ZPOWR
      CHARACTER*6 RNAME
C
C
      IF (WHICH) THEN
         RNAME = 'DPWR$M'
      ELSE
         RNAME = '** D77'
      ENDIF
C
      BETA = IBETA
      SQBETA = XSQRT(BETA)
      ALBETA = XALOG(BETA)
      AIT = IT
      ALXMAX = XALOG(XMAX)
      ONEP5 = (TWO+ONE)/TWO
      SCALE = ONE
      J = (IT+1)/2
C
      DO 10 I = 1,J
        SCALE = SCALE*BETA
   10 CONTINUE
C
      A = ONE/BETA
      B = ONE
      C = -DMAX1(ALXMAX,-XALOG(XMIN))/XALOG(100D0)
      DELY = -C-C
      Y1 = ZERO
C
C     START WITH RANDOM ACCURACY TESTS
C
      DO 30 J = 1,4
        K1 = 0
        K3 = 0
        X1 = ZERO
        R6 = ZERO
        R7 = ZERO
        DEL = (B-A)/XN
        XL = A
        U1 = XPOWER(XMAX,ONE/THREE)
C
        DO 20 I = 1,N
          X = DEL*RANDX(I1)+XL
          IF (J .EQ. 1) THEN
              ZZ = ZPOWR(X,ONE)
              Z = X
C
          ELSE
              W = SCALE*X
              X = (X+W)-W
              IF (X .GT. U1) X = X+X-U1
              XSQ = X*X
              IF (J .NE. 4) THEN
                  ZZ = ZPOWR(XSQ,ONEP5)
                  Z = X*XSQ
C
              ELSE
                  Y = DELY*RANDX(I1)+C
                  Y2 = (Y/TWO+Y)-Y
                  Y = Y2+Y2
                  Z = ZPOWR(X,Y)
                  ZZ = ZPOWR(XSQ,Y2)
              ENDIF
          ENDIF
          W = ONE
          IF (Z .NE. ZERO) W = (Z-ZZ)/Z
          IF (W .GT. ZERO) K1 = K1+1
          IF (W .LT. ZERO) THEN
              K3 = K3+1
              W = -W
          ENDIF
          IF (W .GT. R6) THEN
              R6 = W
              X1 = X
              IF (J .EQ. 4) Y1 = Y
          ENDIF
          R7 = R7+W*W
          XL = XL+DEL
   20   CONTINUE
C
        K2 = N-K1-K3
        R7 = XSQRT(R7/XN)
        IF (J .LE. 1) THEN
            PRINT 50
            PRINT 80, N,A,B
            PRINT 90, RNAME,K1,K2,K3
C
        ELSEIF (J .NE. 4) THEN
            PRINT 60
            PRINT 80, N,A,B
            PRINT 100, RNAME,K1,K2,K3
C
        ELSE
            PRINT 70
            W = C+DELY
            PRINT 120, N,A,B,C,W
            PRINT 110, RNAME,K1,K2,K3
        ENDIF
        PRINT 130, IT,IBETA
        W = -999.0D0
        IF (R6 .NE. ZERO) W = XALOG(DABS(R6))/ALBETA
        IF (J .NE. 4) THEN
            PRINT 140, R6,IBETA,W,X1
C
        ELSE
            PRINT 170, R6,IBETA,W,X1,Y1
        ENDIF
        W = DMAX1(AIT+W,ZERO)
        PRINT 150, IBETA,W
        W = -999.0D0
        IF (R7 .NE. ZERO) W = XALOG(DABS(R7))/ALBETA
        PRINT 160, R7,IBETA,W
        W = DMAX1(AIT+W,ZERO)
        PRINT 150, IBETA,W
        IF (J .NE. 1) THEN
            B = TEN
            A = 0.01D0
            IF (J .NE. 3) THEN
                A = ONE
                B = XEXP(ALXMAX/THREE)
            ENDIF
        ENDIF
   30 CONTINUE
C
C     SPECIAL TESTS
C
      PRINT 180
      PRINT 190
      B = TEN
C
      DO 40 I = 1,5
        X = RANDX(I1)*B+ONE
        Y = RANDX(I1)*B+ONE
        Z = ZPOWR(X,Y)
        ZZ = ZPOWR((ONE/X),-Y)
        W = (Z-ZZ)/Z
        PRINT 240, X,Y,W
   40 CONTINUE
C
C     TEST OF ERROR RETURNS
C
      PRINT 200
      X = BETA
      Y = MINEXP
      PRINT 210, X,Y
      Z = ZPOWR(X,Y)
      PRINT 230, Z
      Y = MAXEXP-1
      PRINT 210, X,Y
      Z = ZPOWR(X,Y)
      PRINT 230, Z
      X = ZERO
      Y = TWO
      PRINT 210, X,Y
      Z = ZPOWR(X,Y)
      PRINT 230, Z
      X = -Y
      Y = ZERO
      PRINT 220, X,Y
      Z = ZPOWR(X,Y)
      PRINT 230, Z
      Y = TWO
      PRINT 220, X,Y
      Z = ZPOWR(X,Y)
      PRINT 230, Z
      X = ZERO
      Y = ZERO
      PRINT 220, X,Y
      Z = ZPOWR(X,Y)
      PRINT 230, Z
      PRINT 250
      RETURN
C
   50 FORMAT (/'Test of X**1.0 vs. X'//)
   60 FORMAT (/'Test of XSQ**1.5 vs. XSQ*X'//)
   70 FORMAT (/'Test of X**Y vs. XSQ**(Y/2)'//)
   80 FORMAT (I7,' Random arguments were tested in the interval '/6X,'('
     &,E12.4,',',E12.4,')'//)
   90 FORMAT (1X,A6,'(X**1.0) was larger',I6,' times,'/14X,' agreed',I6,
     &' times, and'/10X,'was smaller',I6,' times.'//)
  100 FORMAT (1X,A4,'(X**1.5) was larger',I6,' times,'/12X,' agreed',I6,
     &' times, and'/8X,'was smaller',I6,' times.'//)
  110 FORMAT (1X,A4,'(X**Y) was larger',I6,' times,'/12X,' agreed',I6,
     &' times, and'/8X,'was smaller',I6,' times.'//)
  120 FORMAT (I7,' Random arguments were tested from the region'/6X,
     &'X in (',E13.4,',',E13.4,') Y in (',E13.4,',',E13.4,')'//)
  130 FORMAT (' There are ',I3,' base',I3,
     &' significant digits in a floating point number.'//)
  140 FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     &/4X,'occurred for X =',E17.6)
  150 FORMAT (' The estimated loss of base',I3,' significant digits is',
     &F7.2)
  160 FORMAT (' The root mean square relative error was',E15.4,' = ',I3,
     &' **',F7.2)
  170 FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     &/4X,'occurred for X =',E17.6,' Y =',E17.6)
  180 FORMAT (//'Special Tests'//)
  190 FORMAT (' The identity X**Y = (1/X)**(-Y) will be tested.'//8X,'X'
     &,14X,'Y',9X,'(X**Y-(1/X)**(-Y))/X**Y'/)
  200 FORMAT (///'Test of Error Returns'//)
  210 FORMAT (' (',E14.7,' ) ** (',E14.7,' ) will be computed.'/
     &' This should not trigger an error message.'//)
  220 FORMAT (' (',E14.7,' ) ** (',E14.7,' ) will be computed.'/
     &' This should trigger an error message.'//)
  230 FORMAT (' The value returned is',E15.4///)
  240 FORMAT (2E15.7,6X,E15.7)
  250 FORMAT (10X,'***** This concludes the tests. *****'//)
      END
