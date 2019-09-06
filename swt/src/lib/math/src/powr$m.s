*  POWR$M --- Calculate a value to a power, double precision only
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
*        <result> := POWR$M (<argument>, <exp>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number base
*           <exp> is a 8 byte real number exponent
*
* ================================================================
*
*   Algorithm and Source:
*
*     Derived from the algorithm in chapter 7 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     <argument> must be greater than zero.
*     if <argument> is less than zero then <exp> must be zero
*     if <argument> is zero then <exp> must be positive
*     This corresponds to ANSI Fortran standards
*
*     Various combinations of arguments may cause underflow or
*     overflow.
*
*   Range of Result:
*
*     effectively, full floating point range
*
*   Action on domain error:
*
*     Sets up default return value: 0.0 for
*        trying to raise a non-positive number to an improper power,
*        the biggest floating point value for overflow, the smallest
*        floating point value for underflow.
*     Signals "SWT_MATH_ERROR$" to OS via call to "SIGNL$"
*     Condition may be returned from; default result may be changed.
*
* ================================================================
*
*   Calls:
*
*     May call SIGNL$ on error
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     POWR$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
            LINK
POWR$M      ECB      S_POWR$M,,ARGUMENT,2
            DATA     7,C'POWR$M'
            PROC
*
            DYNM     =22
            DYNM     ARGUMENT(3),EXPON(3)
            DYNM     ARG_VAL(4),ERR_RESULT(4),ERMES(2),DBLFLAG
            DYNM     P,M,I(2),IW1(2),PP(2),M1(2)
            DYNM     TEMP(4),TEMP2(4),W(4),W1(4),W2(4),G(4),Z(4)
            DYNM     Y1(4),Y2(4),ERR_PTR(2)
*
REDUCE      MAC
            IMA#     6
            ADD      =4
            IMA#     6
            DINT
            IMA#     6
            SUB      =4
            IMA#     6
            ENDM
*
*
            START    POWR$M LONG
*
            DFLD     ARGUMENT,*
            DFST     ARG_VAL
            BFGT     GETM
            BFNE     ER1
            DFLD     EXPON,*
            BFLE     ER2
            DFLD     ARGUMENT,*
            PRTN
*
ER1         EQU      *
            DFCM
            DFST     TEMP
            PCL      POWR$M
            AP       TEMP,S
            AP       EXPON,*SL
            DFST     TEMP
            SIGNAL   ERF1 TEMP
ERF1        BCI      'Negative argument supplied to SWT POWR function@..'
ER2         SIGNAL   ERF2 =0.0D0
ERF2  BCI 'Attempt to raise zero to non-positive power in SWT POWR@..'
ER3         SIGNAL   ERF3 BIGONE
ERF3        BCI      'Overflow in SWT POWR function@..'
ER4         SIGNAL   ERF4 SMALLONE
ERF4        BCI      'Underflow in SWT POWR function@..'
*
*
GETM        EQU      *
            LDA      =$80
            IMA#     6
            SUB      =$80
            STA      M
            DFST     G
*
            EAXB     A - 4
            DFLX     =9
            LT
            DFCS     XB%,X
            JMP#     * + 3
            RCB
            LDA#     =9
            STA      P
            DFLX     P
            DFCS     XB%+(4*4),X
            JMP#     * + 3
            RCB
            ADD#     =4
            STA      P
            DFLX     P
            DFCS     XB%+(2*4),X
            JMP#     * + 3
            RCB
            A2A
            STA      P
*
            EAXB     A
            DFLX     P
            DFAD     XB%,X
            DFST     TEMP           G + A(P+1)
            DFLD     G
            DFSB     XB%,X
            LDA      P
            A1A
            ARL      1              (P+1)/2
            ALL      2
            TAX
            DFSB     A2 - 4,X
            DFDV     TEMP
            IRS#     6
            DFST     Z
*
            DFMP     Z
            DFST     TEMP           V
            DFMP     P3
            DFAD     P2
            DFMP     TEMP
            DFAD     P1
            DFMP     TEMP
            DFMP     Z
            DFST     TEMP2          R
            DFMP     K
            DFAD     TEMP2
            DFST     TEMP2          New R
*
            DFLD     Z
            DFMP     K
            DFAD     TEMP2
            DFAD     Z
            DFST     TEMP2          U2
*
            LDA      P
            XCA
            STL      IW1
            LDA      M
            MPY      =16
            SBL      IW1
            FLTL
            FDBL
            LDA#     6
            SUB      =4
            STA#     6
            DFST     TEMP           U1
*
            DFLD     EXPON,*        REDUCE(Y) --> Y1
            REDUCE
            DFST     Y1
*
            DFSB     EXPON,*        Y - Y1 --> Y2
            DFCM
            DFST     Y2
*
            DFMP     TEMP           U2*Y + U1*Y2 --> W
            DFST     W
            DFLD     EXPON,*
            DFMP     TEMP2
            DFAD     W
            DFST     W
*
            REDUCE                  REDUCE(W) --> W1
            DFST     W1
*
            DFSB     W              W-W1 --> W2
            DFCM
            DFST     W2
*
            DFLD     TEMP           W1+U1*Y1 --> W
            DFMP     Y1
            DFAD     W1
            DFST     W
*
            REDUCE                  REDUCE(W) --> W1
            DFST     W1
*
            DFSB     W              W2+(W-W1) --> W2
            DFCM
            DFAD     W2
            DFST     W2
*
            REDUCE                  REDUCE(W2) --> W
            DFST     W
*
            DFAD     W1             INT(16*(W1+W)) --> IW1
            LDA#     6
            ADD      =4
            STA#     6
            INTL
            STL      IW1
*
            DFLD     W2             W2-W --> W2
            DFSB     W
            DFST     W2
*
            CLS      XMAX
            JMP#     ER3
            JMP#     QQ
            CLS      XMIN
            JMP#     QQ
            JMP#     QQ
            JMP      ER4
*
QQ          EQU      *
            BFLE     WOKAY
            DFSB     ONESIXTEENTH
            DFST     W2
            ADL      =1L
            STL      IW1
WOKAY       EQU      *
            LLGE
            XCA
            STL      I
            LDL      IW1
            DIV      =16            IW1/16
            PIDA
            ADL      I
            STL      M1
            LLL      4              M'*16
            SBL      IW1
            STL      PP
*
            DFMP     Q6
            DFAD     Q5
            DFMP     W2
            DFAD     Q4
            DFMP     W2
            DFAD     Q3
            DFMP     W2
            DFAD     Q2
            DFMP     W2
            DFAD     Q1
            DFMP     W2
            DFST     TEMP           Z
*
            DFLX     PP+1
            DFMP     A,X
            DFAD     A,X
            LDA#     6
            ADD      M1+1
            STA#     6
            PRTN
            FIN
*
*  Magic numbers
*
XMAX        DATA     522206L
XMIN        DATA     -526335L
BIGONE      HEX      7FFF,FFFF,FFFF,7FFF
SMALLONE    HEX      4000,0000,0000,8000
Q1          HEX      58B9,0BFB,E8E7,0080
Q2          HEX      7AFE,F7FE,05FA,007E
Q3          HEX      71AC,2353,D2E1,007C
Q4          HEX      4ECA,A79D,DFF2,007A
Q5          HEX      575D,6358,BC93,0077
Q6          HEX      4F0C,8D50,D318,0074
P1          HEX      5555,5555,58CD,007D
P2          HEX      6666,654E,B66B,007A
P3          HEX      4932,AD45,2A35,0078
K           HEX      7154,7652,B830,007F
ONESIXTEENTH DATA    0.0625D0
A           EQU      *
            HEX      4000,0000,0000,0081       A1(01)
            HEX      7A92,BE8A,9243,0080       A1(02)
            HEX      7560,6373,EE92,0080       A1(03)
            HEX      7066,6F76,154A,0080       A1(04)
            HEX      6BA2,7E65,6B4E,0080       A1(05)
            HEX      6712,460A,8FC2,0080       A1(06)
            HEX      62B3,9508,AA83,0080       A1(07)
            HEX      5E84,51CF,AC06,0080       A1(08)
            HEX      5A82,7999,FCEF,0080       A1(09)
            HEX      56AC,1F75,2150,0080       A1(10)
            HEX      52FF,6B54,D8A8,0080       A1(11)
            HEX      4F7A,9930,48D0,0080       A1(12)
            HEX      4C1B,F828,C6DC,0080       A1(13)
            HEX      48E1,E9B9,D588,0080       A1(14)
            HEX      45CA,E0F1,F545,0080       A1(15)
            HEX      42D5,61B3,E624,0080       A1(16)
            HEX      4000,0000,0000,0080       A1(17)
A2          EQU      *
            HEX      6616,3DCE,8640,0050       A2(01)
            HEX      7088,832C,4A80,0050       A2(02)
            HEX      4071,F11A,C1C0,0050       A2(03)
            HEX      6D7D,5102,3F80,004E       A2(04)
            HEX      52B1,9260,2A30,0051       A2(05)
            HEX      446B,6824,47C0,0051       A2(06)
            HEX      70CD,83F5,B640,0051       A2(07)
            HEX      7B14,C5C9,5B80,004F       A2(08)
*
            END
