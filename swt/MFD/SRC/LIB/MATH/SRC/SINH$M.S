*  SINH$M --- Calculate the hyperbolic sine of an angle
*  COSH$M --- Calculate the hyperbolic cosine of an angle
*  DSNH$M --- Calculate the double precision sinh
*  DCSH$M --- Calculate the double precision cosh
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
*        <result> := SINH$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number
*
*        <result> := COSH$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number
*
*     Double Precision
*        <result> := DSNH$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number
*
*        <result> := DCSH$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number
*
* ================================================================
*
*   Algorithm and Source:
*
*     Obtained from chapter 12 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     Effectively unrestricted, but overflow of some values possible
*
*   Range of Result:
*
*     (-MAXREAL, +MAXREAL)
*
*   Action on domain error:
*
*     Signals "SWT_MATH_ERROR$" to OS via call to "SIGNL$"
*     Condition may be returned from; default result may be changed.
*
*
* ================================================================
*
*   Calls:
*
*     DEXP$M, possibly SIGNL$
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     SINH$M
            SUBR     DSNH$M
            SUBR     COSH$M
            SUBR     DCSH$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
SINH$M      DECLARE  6
COSH$M      DECLARE  6
DSNH$M      DECLARE  6
DCSH$M      DECLARE  6
*
*
            DYNM     WANTCOSH,SGN,Y(4),Z(4),TEMP(4),TEMP2(4),X(4)
*
            START    SINH$M SHORT
            FLD      ARGUMENT,*
            FDBL
            JMP      XX1
*
            START    DSNH$M LONG
            DFLD     ARGUMENT,*
XX1         EQU      *
            DFST     ARG_VAL
            LF
            STA      WANTCOSH
            LFGE
            STA      SGN
            DFST     X
            DABS
            DFST     Y
            DFCS     ONE
            JMP#     LAB5
            RCB
            DFCS     EPS
            JMP#     LAB4
            JMP#     LAB4
            DFLD     X
            PRTN
*
LAB4        EQU      *
            DFLD     X
            DFMP     X
            DFST     Z              f = X **2
            DFAD     Q1
            DFMP     Z
            DFAD     Q0
            DFST     TEMP           Q(f)
            DFLD     Z
            DFMP     P3
            DFAD     P2
            DFMP     Z
            DFAD     P1
            DFMP     Z
            DFAD     P0
            DFDV     TEMP           P(f)/Q(f)
            DFMP     Z
            DFMP     X
            DFAD     X              X + X*R
            PRTN
*
            START    COSH$M SHORT
            FLD      ARGUMENT,*
            FDBL
            JMP      XX2
*
            START    DCSH$M LONG
            DFLD     ARGUMENT,*
XX2         LT
            DFST     ARG_VAL
            STA      WANTCOSH
            DFST     Y
*
LAB5        EQU      *
            DFCS     YBAR
            JMP#     LAB8
            RCB
            CALL     DEXP$M
            AP       Y,SL
            DFST     Z
            DFLD     ONE
            DFDV     Z
            DFST     TEMP
            DFLD     Z
            LDA      WANTCOSH
            BEQ      AA1
            DFAD     TEMP
            JMP      AA2
AA1         DFSB     TEMP
AA2         LDA      6
            S1A
            STA      6
LAB14       EQU      *
            LDA      SGN
            SNZ
            DFCM
            LDA      DBLFLAG
            SZE
            PRTN
            LDA#     6
            CAS      =127
            JMP#     ERRL
            PRTN
            CAS      =-128
            PRTN
            PRTN
            JMP      ERRL
*
LAB8        EQU      *
            DFSB     LNV
            DFST     TEMP           W
            DFCS     WMAX
            JMP#     ERRL
            RCB
            CALL     DEXP$M
            AP       TEMP,SL
            DFST     Z
            DFMP     VO2
            DFAD     Z
            JMP      LAB14
            FIN
*
*
ERRL        EQU      *
            LDA      WANTCOSH
            BEQ      ERRS
            SIGNAL   FMT1 =0.0D0
*
ERRS        EQU      *
            SIGNAL   FMT2 =0.0D0
*
FMT1        BCI      'Argument out of range in SWT COSH routine.'
FMT2        BCI      'Argument out of range in SWT SINH routine.'
*
*
*  Magic numbers
*
EPS         HEX      4000,0000,0000,0068
HALF        HEX      4000,0000,0000,0080
ONE         HEX      4000,0000,0000,0081
YBAR        HEX      585F,A17D,D507,008F     (FROM THE EXP$M ROUTINE)
WMAX        EQU      YBAR
VO2         HEX      7404,4BAC,080B,0070
LNV         HEX      58B9,8000,0000,0080
P0          HEX      4AD1,2613,B8F0,008C
P1          HEX      55F1,7B1D,7C61,0087
P2          HEX      5508,7C17,5FB6,0081
P3          HEX      7E8C,8D3B,29F4,0079
Q0          HEX      7039,B91D,956A,008E
Q1          HEX      9AB5,542C,F4B5,0088
*
            END
