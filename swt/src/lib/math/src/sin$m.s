*  SIN$M --- Calculate the sine of an angle given in radians
*  COS$M --- Calculate the cosine of an angle given in radians
*  DSIN$M --- Calculate the double precision sine of an angle
*  DCOS$M --- Calculate the double precision cosine of an angle
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
*        <result> := SIN$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number, angle in radians
*
*        <result> := COS$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number, angle in radians
*
*     Double Precision
*        <result> := DSIN$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number, angle in radians
*
*        <result> := DCOS$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number, angle in radians
*
* ================================================================
*
*   Algorithm and Source:
*
*    Minimax polynomial approximation obtained from chapter 8 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     (-26353588, 26353588)  for SIN$M and DSIN$M
*     (-26353588+ pi/2, 26353588 - pi/2)  for COS$M and DCOS$M
*
*   Range of Result:
*
*     [-1.0, 1.0]
*
*   Action on domain error:
*
*     Signals "SWT_MATH_ERROR$" to OS via call to "SIGNL$"
*     Condition may be returned from; default result may be changed.
*
*   Other notes:
*
*     Excessively small angles (less than 2 ** -24) will result in
*     a sine equal to the angle.  A similar result holds for
*     the cosine, although the cosine is calculated as sine pi/2 - x.
*
* ================================================================
*
*   Calls:
*
*     DINT$P
*     May call SIGNL$
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     SIN$M
            SUBR     DSIN$M
            SUBR     COS$M
            SUBR     DCOS$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
SIN$M       DECLARE  5
COS$M       DECLARE  5
DSIN$M      DECLARE  6
DCOS$M      DECLARE  6
*
*
            DYNM     WANTCOS,SGN,Y(4),XN(4),TEMP(4),TEMP2(4),X(4)
*
            START    SIN$M SHORT
            FLD      ARGUMENT,*
            FDBL
            JMP      XX1
*
            START    DSIN$M LONG
            DFLD     ARGUMENT,*
XX1         EQU      *
            DFST     ARG_VAL
            LF
            STA      WANTCOS
            LFGE
            DABS
            DFST     X
            JMP      COMMON
*
            START    COS$M SHORT
            FLD      ARGUMENT,*
            FDBL
            JMP      XX2
*
            START    DCOS$M LONG
            DFLD     ARGUMENT,*
XX2         LT
            STA      WANTCOS
            DFST     ARG_VAL
            DABS
            DFST     X
            DFAD     PIO2
*
COMMON      EQU      *
            DFST     Y
            STA      SGN
            DFCS     YMAX
            JMP#     ERRL
            JMP#     ERRL
            DFDV     PI
AA1         DFAD     HALF
            DINT
            INTL
            TBA
            SLN
            JMP#     LAB8
            LT
            SUB      SGN
            STA      SGN
*
LAB8        EQU      *
            LDA      WANTCOS
            BEQ      LAB10
            DFSB     HALF
LAB10       EQU      *
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
            JMP#     LAB12
            JMP#     LAB12
            DFLD     TEMP
            JMP      LAB15
*
LAB12       EQU      *
            DFLD     TEMP
            DFMP     TEMP
            DFST     TEMP2          g
            DFMP     R7
            DFAD     R6
            DFMP     TEMP2
            DFAD     R5
            DFMP     TEMP2
            DFAD     R4
            DFMP     TEMP2
            DFAD     R3
            DFMP     TEMP2
            DFAD     R2
            DFMP     TEMP2
            DFAD     R1
            DFMP     TEMP2          R(g)
            DFMP     TEMP
            DFAD     TEMP           f + f*R(g)
LAB15       EQU      *
            LDA      SGN
            SNZ
            DFCM
            PRTN
*
*
ERRL        EQU      *
            LDA      WANTCOS
            BEQ      ERRS
            SIGNAL   FMT1 =0.0D0
*
ERRS        EQU      *
            SIGNAL   FMT2 =0.0D0
*
FMT1        BCI      'Angle too large in SWT COS routine.'
FMT2        BCI      'Angle too large in SWT SIN routine.'
*
*
*  Magic numbers
*
EPS         HEX      4000,0000,0000,0069
YMAX        HEX      6487,ED00,0000,0099
HALF        HEX      4000,0000,0000,0080
R1          HEX      AAAA,AAAA,AAAF,007E
R2          HEX      4444,4444,423F,007A
R3          HEX      97F9,7F99,8FE3,0074
R4          HEX      5C77,8DF7,940C,006E
R5          HEX      9467,2D39,FD01,0067
R6          HEX      5839,555E,574B,0060
R7          HEX      9844,6381,B934,0058
PIO2        HEX      6487,ED51,10B4,0081
PI          HEX      6487,ED51,10B4,0082
C1          HEX      6488,0000,0000,0082
C2          HEX      B544,42D1,846A,0070
*
            END
