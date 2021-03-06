C     TESTPOWER --- TEST THE POWER FUNCTION
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      SUBROUTINE TEST
C
$INSERT MACHAR.F77.I
C
      REAL ALXMAX,SQBETA,ONEP5,SCALE,DELY,Y1,Y2,XSQ
      REAL ZPOWR
      EXTERNAL ZPOWR
      CHARACTER*6 RNAME
C
C
      IF (WHICH) THEN
         RNAME = 'POWR$M'
      ELSE
         RNAME = '  **  '
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
      C = -AMAX1(ALXMAX,-XALOG(XMIN))/XALOG(100E0)
      DELY = -C-C
      Y1 = ZERO
C
C     START WITH RANDOM ACCURACY TESTS
C
      DO 300  J = 1,4
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
          IF (J .EQ. 1) THEN
              ZZ = ZPOWR(X,ONE)
              Z = X
C
          ELSE
              W = SCALE*X
              Z = ONE
              X = X+W
              Z = TWO
              X = X-W
              XSQ = X*X
              IF (J .NE. 4) THEN
                  ZZ = ZPOWR(XSQ,ONEP5)
                  Z = X*XSQ
C
              ELSE
                  Y = DELY*RANDX(I1)+C
                  Y2 = (Y/TWO+Y)-Y
                  Y = Y2+Y2
                  Z =ZPOWR(X,Y)
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
        PRINT 1000
        PRINT 1010, N,A,B
        PRINT 1011, RNAME,K1,K2,K3
      ELSEIF (J .NE. 4) THEN
        PRINT 1001
        PRINT 1010, N,A,B
        PRINT 1012, RNAME,K1,K2,K3
      ELSE
        PRINT 1002
        W = C+DELY
        PRINT 1014, N,A,B,C,W
        PRINT 1013, RNAME, K1,K2,K3
      ENDIF
      PRINT 1020, IT,IBETA
      W = -999.0
      IF (R6 .NE. ZERO) W = XALOG(ABS(R6))/ALBETA
      IF (J .NE. 4) THEN
        PRINT 1021, R6,IBETA,W,X1
      ELSE
        PRINT 1024, R6,IBETA,W,X1,Y1
      ENDIF
      W = AMAX1(AIT+W,ZERO)
      PRINT 1022, IBETA,W
      W = -999.0
      IF (R7 .NE. ZERO) W = XALOG(ABS(R7))/ALBETA
      PRINT 1023, R7,IBETA,W
      W = AMAX1(AIT+W,ZERO)
      PRINT 1022, IBETA,W
      IF (J .NE. 1) THEN
        B = TEN
        A = 0.01E0
        IF (J .NE. 3) THEN
          A = ONE
          B = XEXP(ALXMAX/THREE)
        ENDIF
      ENDIF
300   CONTINUE
C
C     SPECIAL TESTS
C
      PRINT 1025
      PRINT 1030
      B = TEN
C
      DO 320 I =1,5
      X = RANDX(I1)*B+ONE
      Y = RANDX(I1)*B+ONE
      Z = ZPOWR(X,Y)
      ZZ = ZPOWR((ONE/X),-Y)
      W = (Z-ZZ)/Z
      PRINT 1060, X,Y,W
320   CONTINUE
C
C     TEST OF ERROR RETURNS
C
      PRINT 1050
      X = BETA
      Y = MINEXP
      PRINT 1051, X, Y
      Z = ZPOWR (X,Y)
      PRINT 1055, Z
      Y = MAXEXP-1
      PRINT 1051, X, Y
      Z = ZPOWR (X,Y)
      PRINT 1055, Z
      X = ZERO
      Y = TWO
      PRINT 1051, X, Y
      Z = ZPOWR (X,Y)
      PRINT 1055, Z
      X = -Y
      Y = ZERO
      PRINT 1052, X, Y
      Z = ZPOWR (X,Y)
      PRINT 1055, Z
      Y = TWO
      PRINT 1052, X, Y
      Z = ZPOWR (X,Y)
      PRINT 1055, Z
      X = ZERO
      Y = ZERO
      PRINT 1052, X, Y
      Z = ZPOWR (X,Y)
      PRINT 1055, Z
      PRINT 1100
      RETURN
C
1000  FORMAT (/'Test of X**1.0 vs. X'//)
1001  FORMAT (/'Test of XSQ**1.5 vs. XSQ*X'//)
1002  FORMAT (/'Test of X**Y vs. XSQ**(Y/2)'//)
1010  FORMAT (I7,' Random arguments were tested in the interval '/6X,'('
     $,E12.4,',',E12.4,')'//)
1011  FORMAT (1X,A4,'(X**1.0) was larger',I6,' times,'/12X,' agreed',I6,
     $' times, and'/8X,'was smaller',I6,' times.'//)
1012  FORMAT (1X,A4,'(X**1.5) was larger',I6,' times,'/12X,' agreed',I6,
     $' times, and'/8X,'was smaller',I6,' times.'//)
1013  FORMAT (1X,A4,'(X**Y) was larger',I6,' times,'/12X,' agreed',I6,
     $' times, and'/8X,'was smaller',I6,' times.'//)
1014  FORMAT (I7,' Random arguments were tested from the region'/
     &6X,'X in (',E13.4,',',E13.4,') Y in (',E13.4,',',E13.4,')'//)
1020  FORMAT (' There are ',I3,' base',I3,
     $' significant digits in a floating point number.'//)
1021  FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     $/4X,'occurred for X =',E17.6)
1022  FORMAT (' The estimated loss of base',I3,' significant digits is',
     $F7.2)
1023  FORMAT (' The root mean square relative error was',E15.4,' = ',I3,
     $' **',F7.2)
1024  FORMAT (' The maximum relative error of',E12.4,' = ',I3,' **',F7.2
     $/4X,'occurred for X =',E17.6,' Y =',E17.6)
1025  FORMAT (//'Special Tests'//)
1030  FORMAT (' The identity X**Y = (1/X)**(-Y) will be tested.'//
     &8X,'X',14X,'Y',9X,'(X**Y-(1/X)**(-Y))/X**Y'/)
1040  FORMAT (///'Test of Special Arguments'//)
1050  FORMAT (///'Test of Error Returns'//)
1051  FORMAT (' (',E14.7,' ) ** (',E14.7,' ) will be computed.'/
     &' This should not trigger an error message.'//)
1052  FORMAT (' (',E14.7,' ) ** (',E14.7,' ) will be computed.'/
     &' This should trigger an error message.'//)
1055  FORMAT (' The value returned is',E15.4///)
1060  FORMAT (2E15.7,6X,E15.7)
1100  FORMAT (10X,'***** This concludes the tests. *****'//)
      END
