C     MAIN --- SET FLAGS AND ON-UNIT HANDLERS, RUN THE TEST
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C

      PROGRAM MAIN
      EXTERNAL MACHAR,SEED$M,TEST,SETFLAG,MKON$P,ERR$M,FOOBAR
      INTRINSIC INTS
      INTEGER*2 INTS
C
      CALL SETFLAG
      CALL MACHAR
      CALL SEED$M (10007)
C
      CALL MKON$P ('SWT_MATH_ERROR$',INTS(15),ERR$M)
      CALL MKON$P ('ERROR',INTS(5),FOOBAR)
      CALL TEST
C
      STOP
      END
C     MACHAR --- DETERMINE MACHINE CHARACTERISTICS
C
C        Eugene Spafford
C        SWT Math Library Test Support
C        School of Information and Computer Science
C        Georgia Institute of Technology
C        Atlanta, GA  30332
C
C
      SUBROUTINE MACHAR
C
$INSERT MACHAR.F77.I
C
      INTEGER IZ,K,MX
      DOUBLE PRECISION BETAIN,BETAM1,U1,U2,U3
      DOUBLE PRECISION PRIMEKLUDGE
      INTEGER*2 PRIMEK(4)
      EQUIVALENCE (PRIMEK,PRIMEKLUDGE)
C
C
C     DETERMINE  IBETA, BETA
C
      A = ONE
10    CONTINUE
      A = A+A
      U1 = A+ONE
      U2 = U3+1
      U1 = U1-A
      U2 = U3-1
      U1 = U1-ONE
      U2 = U3+1
      IF (U1 .EQ. ZERO) GO TO 10
C
      B = ONE
20    CONTINUE
      B = B+B
      IF ((A+B)-A .EQ. ZERO) GO TO 20
C
      IBETA = (A+B)-A
      BETA = IBETA
C
C     DETERMINE  IT, IRND
C
      IT = 0
      B = ONE
30    CONTINUE
      IT = IT+1
      U1 = B*BETA
      U2 = U3 - 1
      B = U1
      U1 = B + ONE
      U2 = U3 + 1
      U1 = U1 -B
      U2 = U3 - 1
      U1 = U1 -ONE
      IF (U1 .EQ. ZERO) GO TO 30
C
      IRND = 0
      BETAM1 = BETA-ONE
      IF ((A+BETAM1)-A .NE. ZERO) IRND = 1
C
C     DETERMINE  NEGEP, EPSNEG
C
      NEGEP = IT+3
      BETAIN = ONE/BETA
      A = ONE
C
      DO 40 I = 1,NEGEP
         A = A*BETAIN
40    CONTINUE
C
      B = A
50    CONTINUE
      IF ((ONE-A)-ONE .NE. ZERO) GO TO 60
      A = A*(BETA)
      NEGEP = NEGEP-(1)
      GO TO 50
C
60    CONTINUE
      NEGEP = -NEGEP
      EPSNEG = A
      IF ((BETA .NE. 2) .AND.
     $    (IRND .NE. 0)) THEN
            A = (A*(ONE+A))/(ONE+ONE)
            IF ((ONE-A)-ONE .NE. ZERO) EPSNEG = A
      ENDIF
C
C     DETERMINE  MACHEP, EPS
C
      MACHEP = -IT-3
      A = B
70    CONTINUE
      IF ((ONE+A)-ONE .NE. ZERO) GO TO 80
      A = A*BETA
      MACHEP = MACHEP+1
      GO TO 70
C
80    CONTINUE
      EPS = A
      IF ((IBETA .NE. 2) .AND.
     $    (IRND .NE. 0)) THEN
            A = (A*(ONE+A))/(ONE+ONE)
            IF ((ONE+A)-ONE .NE. ZERO) EPS = A
      ENDIF
C
C     DETERMINE NGRD
C
      NGRD = 0
      IF ((IRND .EQ. 0) .AND.
     $    (((ONE+EPS)*ONE-ONE) .NE. ZERO)) NGRD = 1
C
C     DETERMINE  IEXP, MINEXP, XMIN
C
      I = 0
      K = 1
      Z = BETAIN
90    CONTINUE
      Y = Z
      Z = Y*Y                       /* CHECK FOR UNDERFLOW AFTER THIS */
      A = Z*ONE
      IF ((A+A .EQ. ZERO) .OR.
     $    (DABS(Z) .GE. Y)) GO TO 100
      I = I+1
      K = K+K
      GO TO 90
C
100   CONTINUE
      IF (IBETA .NE. 10) THEN
            IEXP = I+1
            MX = K+K
         ELSE
            IEXP = 2
            IZ = IBETA
110         CONTINUE
            IF (K .LT. IZ) GO TO 120
            IZ = IZ*IBETA
            IEXP = IEXP+1
            GO TO 110
C
120         CONTINUE
            MX = IZ+IZ-1
      ENDIF
C
C     LOOP TO DETERMINE MINEXP, XMIN; SIGNALLED BY AN UNDERFLOW
C
130   CONTINUE
      XMIN = Y
      Y = Y*BETAIN
      A = Y*ONE
      IF ((A+A .EQ. ZERO) .OR.
     $    (DABS(Y) .GE. XMIN)) GO TO 140
      K = K+1
      GO TO 130
C
140   CONTINUE
      MINEXP = -K
C
C     DETERMINE MAXEXP, XMAX
C
      IF ((MX .LE. K+K-3) .AND.
     $    (IBETA .NE. 10)) THEN
            MX = MX+MX
            IEXP = IEXP+1
      ENDIF
      MAXEXP = MX+MINEXP
C
C     NOW ADJUST FOR UNUSUAL FLOATING POINT REPRESENTATION
C
      I = MAXEXP+MINEXP
      IF ((IBETA .EQ. 2) .AND.
     $    (I .EQ. 0)) MAXEXP = MAXEXP-1
      IF (I .GT. 20) MAXEXP = MAXEXP-1
      IF (A .NE. Y) MAXEXP = MAXEXP-2
      XMAX = ONE-EPSNEG
      IF (XMAX*ONE .NE. XMAX) XMAX = ONE-BETA*EPSNEG
C
C     The following are due to the odd structure of the Prime
C     Double FLoating exponent...
C
C      XMAX = XMAX/(BETA*BETA*BETA*XMIN)
C      I = MAXEXP+MINEXP+3
C      IF (I .GT. 0) THEN
C            DO 150 J = 1,I
C               IF (IBETA .EQ. 2) THEN
C                     XMAX = XMAX+XMAX
C                  ELSE
C                     XMAX = XMAX*BETA
C               ENDIF
C150         CONTINUE
C      ENDIF
      MAXEXP = 32767-128
      PRIMEKLUDGE = ONE - EPSNEG
      PRIMEK(4) = MAXEXP+128
      XMAX = PRIMEKLUDGE
      IEXP = 16
C
C     End of special code
C
      RETURN
C
C     -----  END OF SUBROUTINE "MACHAR" -----
C
      END
