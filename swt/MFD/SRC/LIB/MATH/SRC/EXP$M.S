*  EXP$M --- Calculate exponential to the base e
*  DEXP$M --- Calculate exponential to the base e of an 8 byte real
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
*        <result> := EXP$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number
*
*     Double Precision
*        <result> := DEXP$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number
*
* ================================================================
*
*   Algorithm and Source:
*
*     A polynomial approximation is used from chapter 6 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     [-89.415985, 88.029678]  for EXP$M
*     [-22802.46279888, 22623.630826296]  for DEXP$M
*
*   Range of Result:
*
*     minimum positive real value to maximum positive real value
*
*   Action on domain error:
*
*     Signals "SWT_MATH_ERROR$" to OS via call to "SIGNL$"
*     Condition may be returned from; default result may be changed.
*
*   Other notes:
*
*     If the supplied value is less than the minimum in the argument
*     domain it might be reasonable to return 0.0 since the actual
*     value of the function would be identical to 0.0 within machine
*     representation.  However, the true exponential function
*     has no domain element which can map the function to zero;
*     an underflow error is triggered to indicate a loss of precision.
*
*     If the argument is sufficiently close to 0.0 (i.e.,
*     abs(x) <= (2** -47) ), then the result of the function is
*     returned as 1.0 since no more accurate result may be
*     determined due to machine representation limitations.
*
* ================================================================
*
*   Calls:
*
*     DINT$P
*     SIGNL$ may be called if a domain error occurs
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     EXP$M
            SUBR     DEXP$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
EXP$M       DECLARE  5
DEXP$M      DECLARE  6
*
            DYNM     TEMP(4),N(2),G(4),XN(4),Z(4),TEMP2(4)
*
            START    EXP$M SHORT
            FLD      ARGUMENT,*
            FDBL
            DFST     ARG_VAL
            FLD      ARGUMENT,*
            FCS      XMAX
            JMP#     TOOBIG
            RCB
            FCS      XMIN
            JMP#     * + 3
            JMP#     * + 2
            JMP#     TOOSMALL
            FDBL
            JMP      COMMON
*
            START    DEXP$M LONG
            DFLD     ARGUMENT,*
            DFST     ARG_VAL
            DFCS     DXMAX
            JMP#     TOOBIG
            RCB
            DFCS     DXMIN
            JMP#     * + 3
            JMP#     * + 2
            JMP#     TOOSMALL
*
COMMON      EQU      *
            DFST     TEMP
            DABS
            DFCS     EPS
            JMP#     CALC
            JMP#     CALC
            DFLD     =1.0D0
            PRTN                    VALUE IS TOO SLIGHT
*
*
CALC        EQU      *
            DFLD     TEMP
            DFDV     LN2
            BFGE     ZZ
            DFSB     HALF
            JMP      XX
*
ZZ          DFAD     HALF
XX          EQU      *
            DINT
            DFST     XN
            INTL
            STL      N
            DFMP     C2
            DFST     Z              XN*C2
            DFLD     XN
            DFMP     C1
            DFST     G              XN*C1
            DFLD     TEMP
            DINT
            DFST     TEMP2
            DFSB     G
            DFST     G              X1-XN*C1
            DFLD     TEMP
            DFSB     TEMP2
            DFAD     G
            DFSB     Z              G
            DFST     G
            DFMP     G
            DFST     Z
            DFMP     P2
            DFAD     P1
            DFMP     Z
            DFAD     P0
            DFMP     G
            DFST     XN             gP(z)
            DFLD     Z
            DFMP     Q2
            DFAD     Q1
            DFMP     Z
            DFAD     Q0
            DFSB     XN
            DFST     G              [Q(z)-gP(z)]
            DFLD     XN
            DFDV     G
            DFAD     HALF
            LDA      6
            PIDA
            ADL      =1L
            ADL      N
            PIMA
            STA      6
            PRTN
*
*
TOOBIG      EQU      *
            SIGNAL   FMT1 =0.0D0
*
TOOSMALL    EQU      *
            SIGNAL   FMT2 =0.0D0
*
FMT1        BCI      'Overflow in SWT EXP function.'
FMT2        BCI      'Underflow in SWT EXP function.'
*
*  Magic Numbers
*
XMAX        HEX      5807,9987
XMIN        HEX      A695,8287
DXMAX       HEX      585F,A17D,D507,008F
DXMIN       HEX      A6ED,8986,0338,008F
EPS         HEX      4000,0000,0000,0050
LN2         HEX      58B9,0BFB,E8E8,0080
P0          HEX      4000,0000,0000,007F
P1          HEX      71C3,91BE,CFDB,0079
P2          HEX      454A,91BD,6370,0071
HALF        EQU      *
Q0          HEX      4000,0000,0000,0080
Q1          HEX      71C6,39C5,0947,007C
Q2          HEX      40FE,65BF,78E0,0076
C1          OCT      54300,0,0,200
C2          HEX      90BF,BE8E,7BCD,0074
*
            END
