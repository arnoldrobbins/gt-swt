C     TEST --- Subroutine to test the MACHAR subroutine
C
C     Eugene Spafford
C     Software Tools Subsystem Math Library Test Routine
C     School of Information and Computer Science
C     Georgia Institute of Technology
C     Atlanta, Georgia 30332
C
C     Coded April 1983 by Eugene Spafford
C     ----------------------------------------------------------
C
      SUBROUTINE TEST
C
$INSERT MACHAR.F77.I
      INTRINSIC INTS
      EXTERNAL PRINT,TOHEX
      DOUBLE PRECISION PP
      INTEGER*2 IPP(4)
      EQUIVALENCE (IPP,PP)
C
      PRINT 10, IBETA
      PRINT 20, IT,IBETA
      IF (IRND .NE. 1) THEN
          PRINT 40
C
      ELSE
          PRINT 30
      ENDIF
      PRINT 50, NGRD
      PRINT 60, MACHEP
      PRINT 70, NEGEP
      PRINT 80, IEXP
      PRINT 90, MINEXP
      PRINT 100, MAXEXP
      PRINT 110, EPS
      PRINT 120, EPSNEG
C     PRINT 130, XMIN
C     PRINT 140, XMAX
      CALL PRINT (INTS(1),'Value of xmin (see text): *,-14d*n*n.',XMIN)
      PP = XMIN
      CALL TOHEX (IPP(1))
      CALL TOHEX (IPP(4))
      CALL PRINT (INTS(1),'Value of xmax (see text): *,-14d*n*n.',XMAX)
      RETURN
C
   10 FORMAT ('Floating point radix is ',I7/)
   20 FORMAT ('There are ',I7,' base ',I7,' digits in the significand'/)
   30 FORMAT ('Floating point multiplication rounds results'/)
   40 FORMAT ('Floating point multiplication truncates results'/)
   50 FORMAT ('There are ',I7,' guard digits in multiplication'/)
   60 FORMAT ('Value of machep (see text): ',I7/)
   70 FORMAT ('Value of negep (see text): ',I7/)
   80 FORMAT ('Number of bits in the exponent is ',I7/)
   90 FORMAT ('Value of minexp (see text): ',I7/)
  100 FORMAT ('Value of maxexp (see text): ',I7/)
  110 FORMAT ('Value of eps (see text): ',G30.16/)
  120 FORMAT ('Value of epsneg (see text): ',G30.16/)
  130 FORMAT ('Value of xmin (see text): ',D30.16/)
  140 FORMAT ('Value of xmax (see text): ',D30.16/)
      END
