*  TAN$M --- Calculate the tangent of an angle in radians
*  COT$M --- Calculate the cotangent of an angle in radians
*  DTAN$M --- Calculate the double precision tangent
*  DCOT$M --- Calculate the double precision cotangent
*
*   Software Tools Subsystem Math Library
*   School of Information and Computer Science
*   Georgia Institute of Technology
*   Atlanta, Georgia 30332
*
* ================================================================
*
*   Modification History:
*
*     Written August 1982 by Eugene Spafford
*     Preliminary Documentation October 1982  E. Spafford
*     Converted to 8.1 SWT Math library routine 03/83  EHS
*     Final Documentation April 1983   EHS
*
* ================================================================
*
*   Calling Sequence:
*
*     Single Precision
*        <result> := TAN$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number, angle in radians
*
*        <result> := COT$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number, angle in radians
*
*     Double Precision
*        <result> := DTAN$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number, angle in radians
*
*        <result> := DCOT$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number, angle in radians
*
* ================================================================
*
*   Algorithm and Source:
*
*     Minimax polynomial approximation obtained from chapter 9 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     ABS (<angle>) <= 13176794.0  for both TAN and COTAN functions
*     ABS (<angle>) >  7.064835966 e -9865 for COTAN only
*
*   Range of Result:
*
*     (-maxreal, +maxreal)
*
*   Action on domain error:
*
*     Signals "SWT_MATH_ERROR$" to OS via call to "SIGNL$"
*     Condition may be returned from; default result may be changed.
*
* ================================================================
*
*   Calls:
*
*     DINT$P, possibly SIGNL$
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     TAN$M
            SUBR     DTAN$M
            SUBR     COT$M
            SUBR     DCOT$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
TAN$M       DECLARE  5
COT$M       DECLARE  5
DTAN$M      DECLARE  6
DCOT$M      DECLARE  6
*
*
            DYNM     WANTCOTAN,XN(4),TEMP(4),TEMP2(4),X(4)
            DYNM     XDEN(4),XNUM(4),N
*
            START    TAN$M SHORT
            FLD      ARGUMENT,*
            FDBL
            JMP      XX1
*
            START    DTAN$M LONG
            DFLD     ARGUMENT,*
XX1         EQU      *
            LF
            STA      WANTCOTAN
            DFST     ARG_VAL
            DFST     X
            DABS
            JMP      COMMON
*
            START    COT$M SHORT
            FLD      ARGUMENT,*
            FDBL
            JMP      XX2
*
            START    DCOT$M LONG
            DFLD     ARGUMENT,*
XX2         LT
            STA      WANTCOTAN
            DFST     ARG_VAL
            DFST     X
            DABS
            DFCS     EPS1
            JMP#     COMMON
            JMP#     COMMON
            JMP      ERRC
*
COMMON      EQU      *
            DFCS     YMAX
            JMP#     ERRL
            RCB
            DFLD     X
            DFDV     PI
            BFGE     AA1
            DFSB     HALF
            JMP      AA2
AA1         EQU      *
            DFAD     HALF
AA2         EQU      *
            DINT
            INTL
            TBA
            STA      N
*
            DFST     XN
            DFLD     X
            DINT
            DFST     TEMP           X1
            DFLD     X
            DFSB     TEMP
            DFST     TEMP2          X2
            DFLD     XN
            DFMP     C1
            DFSB     TEMP
            DFCM
            DFAD     TEMP2
            DFST     TEMP           (X1-XN*C1) + X2
            DFLD     XN
            DFMP     C2
            DFSB     TEMP
            DFCM
            DFST     TEMP           f
            DABS
            DFCS     EPS
            JMP#     LAB11
            JMP#     LAB11
            DFLD     TEMP
            DFST     XNUM
            DFLD     ONE
            DFST     XDEN
            JMP      LAB13
*
LAB11       EQU      *
            DFLD     TEMP
            DFMP     TEMP
            DFST     TEMP2          g
            DFMP     P3
            DFAD     P2
            DFMP     TEMP2
            DFAD     P1
            DFMP     TEMP2
            DFMP     TEMP
            DFAD     TEMP
            DFST     XNUM           f*P(g)
            DFLD     TEMP2
            DFMP     Q3
            DFAD     Q2
            DFMP     TEMP2
            DFAD     Q1
            DFMP     TEMP2
            DFAD     ONE
            DFST     XDEN           Q(g)
*
LAB13       EQU      *
            LDA      WANTCOTAN
            BEQ      LAB14
            LDA      N
            SLN
            JMP#     LABB
LABC        EQU      *
            DFLD     XNUM
            DFCM
            DFST     XNUM
LABD        EQU      *
            DFLD     XNUM
            DFDV     XDEN
            PRTN
*
LAB14       EQU      *
            LDA      N
            SLN
            JMP#     LABD
LABA        EQU      *
            DFLD     XNUM
            DFCM
            DFST     XNUM
LABB        EQU      *
            DFLD     XDEN
            DFDV     XNUM
            PRTN
            FIN
*
*
ERRL        EQU      *
            LDA      WANTCOTAN
            BEQ      ERRS
            SIGNAL   FMT0 =0.0D0
*
ERRS        EQU      *
            SIGNAL   FMT2 =0.0D0
*
ERRC        EQU      *
            SIGNAL   FMT1 =0.0D0
*
FMT0        BCI      'Angle too small in SWT COT routine.'
FMT1        BCI      'Angle too large in SWT COT routine.'
FMT2        BCI      'Angle too large in SWT TAN routine.'
*
*
*  Magic numbers
*
EPS1        HEX      4000,0000,0000,8081
EPS         HEX      4000,0000,0000,0068
YMAX        HEX      6487,ED00,0000,0098
HALF        HEX      4000,0000,0000,0080
ONE         HEX      4000,0000,0000,0081
PI          HEX      6487,ED51,10B4,0081
C1          HEX      6488,0000,0000,0081
C2          HEX      B544,42D1,846A,006F
P1          HEX      BE51,A103,F26E,007E
P2          HEX      5BF1,BF8A,60AA,0078
P3          HEX      8272,0856,0FD3,006F
Q1          HEX      89D3,7B2C,A3E2,007F
Q2          HEX      5F9E,DA36,6958,007B
Q3          HEX      92B6,93BC,BD7A,0074
*
            END
