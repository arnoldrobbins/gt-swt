*  TANH$M --- Calculate the hyperbolic tangent of an angle
*  DTNH$M --- Calculate the double precision tanh of an angle
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
*        <result> := TANH$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number
*
*     Double Precision
*        <result> := DTNH$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number
*
* ================================================================
*
*   Algorithm and Source:
*
*     Obtained from chapter 13 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     unrestricted
*
*   Range of Result:
*
*     [-1.0, 1.0]
*
* ================================================================
*
*   Calls:
*
*     DEXP$M
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     TANH$M
            SUBR     DTNH$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
TANH$M      DECLARE  6
DTNH$M      DECLARE  6
*
*
            DYNM     X(4),G(4),TEMP(4),F(4),ISNEG
*
            START    TANH$M SHORT
            FLD      ARGUMENT,*
            FDBL
            JMP      COMMON
*
            START    DTNH$M LONG
            DFLD     ARGUMENT,*
*
COMMON      EQU      *
            DFST     ARG_VAL
            DFST     X
            LFLT
            STA      ISNEG
            DABS
            DFCS     XBIG
            JMP#     ISBIG
            JMP#     LAB2
            JMP#     LAB2
ISBIG       DFLD     ONE
            JMP      ALMOSTDONE
*
LAB2        EQU      *
            DFCS     LN3O2
            JMP#     USEEXP
            JMP#     LAB4
            JMP#     LAB4
USEEXP      EQU      *
            IRS      6
            DFST     TEMP
            CALL     DEXP$M
            AP       TEMP,SL
            DFAD     ONE
            DFST     TEMP
            DFLD     ONE
            DFDV     TEMP
            DFSB     HALF
            DFCM
            DFST     TEMP
            DFAD     TEMP
            JMP      ALMOSTDONE
*
LAB4        EQU      *
            DFCS     EPS
            JMP#     LAB5
            JMP#     LAB5
            DFLD     X
            PRTN
*
LAB5        EQU      *
            DFST     F
            DFMP     F
            DFST     G          g
            DFAD     Q1
            DFMP     G
            DFAD     Q0
            DFST     TEMP           Q(g)
            DFLD     G
            DFMP     P2
            DFAD     P1
            DFMP     G
            DFAD     P0
            DFMP     G
            DFDV     TEMP           R(g)
            DFMP     F
            DFAD     F
*
ALMOSTDONE  EQU      *
            LDA      ISNEG
            SZE
            DFCM
            PRTN
            FIN
*
*
*  Magic numbers
*
EPS         HEX      4000,0000,0000,0068
HALF        HEX      4000,0000,0000,0080
ONE         HEX      4000,0000,0000,0081
XBIG        HEX      43ED,AD2C,E326,0085
LN3O2       HEX      464F,A9EA,B40C,0080
P0          HEX      B3C3,0C8D,8AEE,0085
P1          HEX      89D5,0307,FB94,0080
P2          HEX      A0FE,1F52,905A,0075
Q0          HEX      725B,6D2B,AFC5,0086
Q1          HEX      6690,5F0D,59BE,0085
*
            END
