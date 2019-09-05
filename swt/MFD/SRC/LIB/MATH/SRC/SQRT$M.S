*  SQRT$M --- Calculate a square root
*  DSQT$M --- Calculate a square root of a double precision real
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
*        <result> := SQRT$M (<argument>)
*        Where
*           <result> is a 4 byte real number (REAL*4)
*           <argument> is a 4 byte real number
*
*     Double Precision
*        <result> := DSQT$M (<argument>)
*        Where
*           <result> is a 8 byte real number (REAL*8)
*           <argument> is a 8 byte real number
*
* ================================================================
*
*   Algorithm and Source:
*
*     The argument is reduced to a value in the range of 0.5 - 2.0
*     and Newton's method is iterated over a first "best guess."
*     The adjusted exponent is then put back in.
*
*     Derived from the algorithm in chapter 4 of:
*     "Software Manual for the Elementary Functions"
*       by William J. Cody, Jr.  &  William Waite
*      Prentice-Hall, Englewood Cliffs, NJ  1980
*
* ================================================================
*
*   Argument Domain:
*
*     0.0 to maximum real value
*
*   Range of Result:
*
*     0.0 to square root of maximum real value
*
*   Action on domain error:
*
*     Calls DSQT$M with the negative of the argument (-x).
*     Signals "SWT_MATH_ERROR$" to OS via call to "SIGNL$"
*     Condition may be returned from; default result may be changed.
*
* ================================================================
*
*   Calls:
*
*     May call SIGNL$ on error (arg < 0.0)
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     SQRT$M
            SUBR     DSQT$M
*
$INSERT *>SRC>DECLARATIONS.S.I
*
SQRT$M      DECLARE  6
DSQT$M      DECLARE  6
*
            DYNM     ARG(4),N,TEMP(4),Z(4)
*
            START    SQRT$M SHORT
            FLD      ARGUMENT,*
            FDBL
            JMP      COMMON
*
            START    DSQT$M LONG
            DFLD     ARGUMENT,*
*
COMMON      EQU      *
            DFST     ARG_VAL
            DFCS     =0.0D0
            JMP#     OKAY
            PRTN                    SQUARE ROOT OF ZERO IS ZERO
*
            DFCM                    MAKE POSITIVE
            DFST     TEMP
            PCL      DSQT$M
            AP       TEMP,SL
            DFST     TEMP
            SIGNAL   FMT1 TEMP
*
FMT1        BCI      'Argument to SWT SQRT function less than zero.'
*
*
OKAY        EQU      *
            LDA      =128           SET TO EXPONENT OF 0
            IMA      6              ...GIVING VALUE IN RANGE
            SUB      =128
            ARS      1
            SRC
            IRS      6
            STA      N
            DFST     TEMP
            DFMP     =0.59016D0     GENERATE FIRST "BEST GUESS"
            DFAD     =0.41731D0
            DFST     ARG
*
*  Now, use a shortcut to get second order approximation
*
            DFLD     TEMP
            DFDV     ARG
            DFAD     ARG
            DFST     Z
            DFLD     TEMP
            DFDV     Z
            DFST     ARG
            DFLD     Z
            LDA      6
            S2A
            STA      6
            DFAD     ARG
            DFST     ARG
*
*  Now, apply Heron's formulation of Newton's method.
*  Two applications should produce over 63 bits of precision.
*
            DFLD     TEMP           NEWTON'S METHOD ON X**2 - ROOT
            DFDV     ARG
            DFAD     ARG
            LDA      6
            S1A
            STA      6
            DFST     ARG
            DFLD     TEMP           NEWTON'S METHOD ON X**2 - ROOT
            DFDV     ARG
            DFAD     ARG
            LDA      6
            S1A
*
*  Now we adjust the exponent
*
            ADD      N
            STA      6
            PRTN
*
            END
