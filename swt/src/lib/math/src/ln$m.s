*  LN$M --- Calculate a logarithm to the base e (natural log)
*  DLN$M --- Calculate a logarithm to base e of an 8 byte real
*  LOG$M --- Calculate a logarithm to the base 10
*  DLOG$M --- Calculate a logarithm to the base 10 of an 8 byte real
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
*        <result> := LN$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number
*
*        <result> := LOG$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number
*
*     Double Precision
*        <result> := DLN$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number
*
*        <result> := DLOG$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number
*
* ================================================================
*
*   Algorithm and Source:
*
*     The polynomial approximation from chapter 5 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     Any positive, non-zero value
*
*   Range of Result:
*
*     log of minimum real to appropriate log of maximum real
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
*     All may call SIGNL$ if the argument is <= 0.0
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     LN$M
            SUBR     DLN$M
            SUBR     LOG$M
            SUBR     DLOG$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
LN$M        DECLARE  4
DLN$M       DECLARE  5
LOG$M       DECLARE  5
DLOG$M      DECLARE  6
*
            DYNM     Z(4),W(4),XN(4),ZDEN(4),ZNUM(4),TENFLAG
*
*
            START    LN$M SHORT
            LF
XX1         EQU      *
            STA      TENFLAG
            FLD      ARGUMENT,*
            FDBL
            JMP      COMMON
*
            START    DLN$M LONG
            LF
            JMP      XX2
*
            START    LOG$M SHORT
            LT
            JMP      XX1
*
            START    DLOG$M LONG
            LT
XX2         EQU      *
            STA      TENFLAG
            DFLD     ARGUMENT,*
*
*
COMMON      EQU      *
            DFST     ARG_VAL
            BFLE     ERRL
            LDA      ='200
            IMA#     6              PICK UP EXPONENT
            PIDA
            SBL      ='200L
            DFST     XN
            DFCS     C0
            JMP#     ZADJ
            RCB
NADJ        EQU      *
            SBL      =1L
            DFSB     HALF
            DFST     ZNUM
            JMP      MERGE
*
ZADJ        EQU      *
            DFSB     HALF
            DFSB     HALF
            DFST     ZNUM
            DFLD     XN
MERGE       EQU      *
            DFMP     HALF
            DFAD     HALF
            DFST     ZDEN
            FLTL
            FDBL
            DFST     XN
            DFLD     ZNUM
            DFDV     ZDEN
            DFST     Z
            DFMP     Z
            DFST     W
            DFAD     B1
            DFMP     W
            DFAD     B0
            DFST     ZNUM
            DFLD     A2
            DFMP     W
            DFAD     A1
            DFMP     W
            DFAD     A0
            DFDV     ZNUM
            DFMP     W
            DFMP     Z
            DFAD     Z
            DFST     ZNUM
            DFLD     XN
            DFMP     C2
            DFAD     ZNUM
            DFST     ZNUM
            DFLD     XN
            DFMP     C1
            DFAD     ZNUM
            LDA      TENFLAG
            BEQ      RET
            DFDV     C3
RET         EQU      *
            PRTN
            FIN
*
*
*  Magic Numbers
*
HALF        DATA     0.5D0
A0          HEX      777C,3F49,751A,0082
A1          HEX      AF06,ADEA,0B72,0080
A2          HEX      48D1,CCD8,A4A0,0079
B0          HEX      599D,2F77,1757,0086
B1          HEX      8D80,4C5C,05AD,0084
C0          HEX      5A82,7999,FCEF,0080
C1          DATA     '54300,0,0,'200   (OCTAL .543D0)
C2          HEX      90BF,BE8E,7BCD,0074
C3          HEX      49AE,C6EE,D554,0082   (1/LOG E)
*
*
*
ERRL        EQU      *
            LDA      TENFLAG
            BNE      ERRE
            DFLD     ARG_VAL
            BFEQ     ERLZ
            DFCM
            DFST     ZDEN
            PCL      DLN$M
            AP       ZDEN,SL
ERLZ        DFST     ZDEN
            SIGNAL   FMT ZDEN
*
ERRE        EQU      *
            DFLD     ARG_VAL
            BFEQ     EREZ
            DFCM
            DFST     ZDEN
            PCL      DLOG$M
            AP       ZDEN,SL
EREZ        DFST     ZDEN
            SIGNAL   FMT2 ZDEN
*
FMT BCI    'Argument to SWT LN function is less than or equal to zero.'
FMT2 BCI      'Argument to SWT LOG function is less than or equal to zero.'
*
            END
