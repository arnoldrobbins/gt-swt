*  ATAN$M --- Compute the inverse tangent in radians
*  DATN$M --- Compute the double precision inverse tangent
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
*        <result> := ATAN$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4), angle in radians
*           <argument> is a 4 byte real number
*
*     Double Precision
*        <result> := DATN$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8), angle in radians
*           <argument> is a 8 byte real number
*
* ================================================================
*
*   Algorithm and Source:
*
*     Rational approximation obtained from chapter 11 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     all valid real numbers
*
*   Range of Result:
*
*     (-pi/2, pi/2)
*
* ================================================================
*
*   Calls:
*
*     None
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     ATAN$M
            SUBR     DATN$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
ATAN$M      DECLARE  6
DATN$M      DECLARE  6
*
*
            DYNM     N,ISNEG,F(4),G(4),X(4),P(4),Q(4)
*
            START    ATAN$M SHORT
            FLD      ARGUMENT,*
            FDBL
            JMP      COMMON
*
            START    DATN$M LONG
            DFLD     ARGUMENT,*
*
COMMON      EQU      *
            DFST     ARG_VAL
            DFST     X
            LFLT
            STA      ISNEG
            DABS
            DFST     F              f
            DFCS     ONE
            JMP#     ADJ
            JMP#     OKAY
            JMP#     OKAY
ADJ         EQU      *
            DFLD     ONE
            DFDV     F
            DFST     F              1/f
            LDA      =2
            SKP
OKAY        CRA
            STA      N
*
            DFCS     TWO_MINUS_RT3
            JMP#     ADJ2
            JMP#     LAB9
            JMP#     LAB9
ADJ2        EQU      *
            DFAD     RT3
            DFST     P
            DFLD     F
            DFMP     RT3_MINUS_1
            DFSB     HALF
            DFSB     HALF
            DFAD     F
            DFDV     P
            DFST     F
            IRS      N
*
LAB9        EQU      *
            DABS
            DFCS     EPS
            JMP#     LAB11
            JMP#     LAB11
            DFLD     F
            JMP      CK
*
LAB11       EQU      *
            DFLD     F
            DFMP     F
            DFST     G              g
            DFMP     P2
            DFAD     P1
            DFMP     G
            DFAD     P0
            DFMP     G
            DFST     P              f*P(g)
            DFLD     G
            DFAD     Q2
            DFMP     G
            DFAD     Q1
            DFMP     G
            DFAD     Q0
            DFST     Q              Q(g)
            DFLD     P
            DFDV     Q
            DFMP     F
            DFAD     F              f+f*R(g)
CK          EQU      *
            LDA      N
            CAS      =1
            DFCM
            RCB
            DFLX     N
            DFAD     A,X
            DFST     P
            LDA      ISNEG
            SZE
            DFCM
            PRTN
*
*
*
*  Magic numbers
*
EPS         HEX      4000,0000,0000,0068
HALF        HEX      4000,0000,0000,0080
ONE         HEX      4000,0000,0000,0081
TWO_MINUS_RT3 HEX    4498,517A,7B35,007F
RT3         HEX      6ED9,EBA1,6133,0081
RT3_MINUS_1 HEX      5DB3,D742,C265,0080
P0          HEX      BB9C,5B95,C0DD,0083
P1          HEX      BB9B,DA78,60E3,0083
P2          HEX      9A51,62D2,FF3F,0080
Q0          HEX      6695,769F,5EDE,0084
Q1          HEX      5211,8C88,A773,0085
Q2          HEX      4995,4943,DE02,0084
A           HEX      0000,0000,0000,0080
            HEX      4305,48E0,B5CE,0080
            HEX      6487,ED51,10B4,0081
            HEX      4305,48E0,B5CE,0081
*
            END
