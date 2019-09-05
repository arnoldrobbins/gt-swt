*  ASIN$M --- Compute inverse sine value in radians
*  ACOS$M --- Compute inverse cosine value in radians
*  DASN$M --- Compute inverse sine in double precision
*  DACS$M --- Compute double precision inverse cosine
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
*        <result> := ASIN$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4), angle in radians
*           <argument> is a 4 byte real number
*
*        <result> := ACOS$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4), angle in radians
*           <argument> is a 4 byte real number
*
*     Double Precision
*        <result> := DASN$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8), angle in radians
*           <argument> is a 8 byte real number
*
*        <result> := DACS$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8), angle in radians
*           <argument> is a 8 byte real number
*
* ================================================================
*
*   Algorithm and Source:
*
*     Minimax rational approximation obtained from chapter 10 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     [-1.0, 1.0]   for all 4 functions
*
*   Range of Result:
*
*     [-pi/2, pi/2]  for ASIN$M and DASN$M
*     [pi, 0]  for ACOS$M and ACOS$M
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
*     may call SIGNL$
*     may call DSQT$M
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     ASIN$M
            SUBR     ACOS$M
            SUBR     DASN$M
            SUBR     DACS$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
ASIN$M      DECLARE  6
ACOS$M      DECLARE  6
DASN$M      DECLARE  6
DACS$M      DECLARE  6
*
            DYNM     SIGN,RFLAG,I,Q(4),Y(4),G(4)
*
            START    ASIN$M SHORT
            LF
            JMP      XX1
*
            START    ACOS$M SHORT
            LT
XX1         STA      RFLAG          MARKS WHICH VALUE WE SEEK
            FLD      ARGUMENT,*
            FDBL
            JMP      COMMON
*
            START    DASN$M LONG
            LF
            JMP      XX2
*
            START    DACS$M LONG
            LT
XX2         STA      RFLAG          MARKS WHICH VALUE WE SEEK
            DFLD     ARGUMENT,*
*
*
COMMON      EQU      *
            DFST     ARG_VAL
            LFGE
            STA      SIGN
            DABS                    WORK WITH FIRST QUADRANT VALUE
            DFST     Y
            DFCS     =1.0D0
            JMP#     ERRL
            RCB
            DFCS     =0.5D0
            JMP#     STEP4
            RCB
*
            LDA      RFLAG
            STA      I
            DFCS     EPS
            JMP#     UP
            JMP#     UP
            JMP#     STEP10
UP          EQU      *
            DFMP     Y
            DFST     G
            JMP      STEP9
*
STEP4       EQU      *
            LT
            SUB      RFLAG
            STA      I
            DFLD     HALF
            DFSB     Y
            DFAD     HALF
            LDA      6
            S1A
            STA      6
            DFST     G
            CALL     DSQT$M
            AP       G,SL
            DFCM
            LDA      6
            A1A
            STA      6
            DFST     Y
            DFLD     G
STEP9       EQU      *
            DFAD     Q3
            DFMP     G
            DFAD     Q2
            DFMP     G
            DFAD     Q1
            DFMP     G
            DFAD     Q0
            DFST     Q              Q(g)
*
            DFLD     G
            DFMP     P4
            DFAD     P3
            DFMP     G
            DFAD     P2
            DFMP     G
            DFAD     P1
            DFMP     G
            DFDV     Q              = R(g) = gP(g)/Q(g)
            DFMP     Y
            DFAD     Y
STEP10      EQU      *
            DFLX     I
            LDA      RFLAG          What were we looking for?
            BNE      WASCOS
*
            DFAD     A,X
            DFAD     A,X
            LDA      SIGN
            SNZ
            DFCM
            PRTN
*
WASCOS      EQU      *
            LDA      SIGN
            BEQ      USEB
            DFSB     A,X
            DFCM
            DFAD     A,X
            PRTN
*
USEB        EQU      *
            DFAD     B,X
            DFAD     B,X
            PRTN
*
*
*
ERRL        LDA      RFLAG          OOPS ! EITHER -1 > VALUE OR
            BNE      ILCOS          1 < VALUE
            SIGNAL   FMT1 =0.0D0
*
ILCOS       EQU      *
            SIGNAL   FMT2 =0.0D0
*
*
FMT1        BCI      'Invalid value supplied to SWT ASIN function.'
FMT2        BCI      'Invalid value supplied to SWT ACOS function.'
*
*   Magic Numbers
*
HALF        DATA     0.5D0
EPS         HEX      4000,0000,0000,0069
A           DATA     0.0D0
            HEX      6487,ED51,10B4,0080    Pi/4
B           HEX      6487,ED51,10B4,0081    Pi/2
            HEX      6487,ED51,10B4,0080
P1          HEX      444C,3821,9338,0084
P2          HEX      9492,0195,E26A,0084
P3          HEX      5F7E,38AB,1069,0083
P4          HEX      AC48,6509,1CD6,0080
Q0          HEX      6672,5432,5D3A,0086
Q1          HEX      9860,94A5,01E1,0087
Q2          HEX      44B8,378D,4563,0087
Q3          HEX      BE48,2210,4B3C,0085
*
            END
