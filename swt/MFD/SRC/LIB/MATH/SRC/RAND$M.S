*  RAND$M ---  Generate a random number between 0.0 and 1.0
*  SEED$M --- Set the seed for the random number generator in RAND$M
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
*     10/10/82 -- installed new multiplier and tested.  E. Spafford
*     Final Documentation April 1983   EHS
*     Converted to 8.1 SWT Math library routine 03/83  EHS
*
* ================================================================
*
*   Calling Sequence:
*
*     call SEED$M (<seedval>)
*     Where
*        <seedval> is an untyped 32 bit quantity not equal to zero
*
*     <result> := RAND$M (<dummy>)
*     Where
*        <result> is a 8 byte real number (REAL*8)
*        <dummy> is a 32 bit integer set to a value in [1, 2147483647]
*
* ================================================================
*
*   Algorithm and Source:
*
*     This function uses the MG1 generation procedure as defined by
*     Payne, Rabung, and Bogyo and reproduced in "A Statistical
*     Evaluation of Multiplicative Congruential Random Number
*     Generators with Modulus 2 ** 31 - 1" by George S. Fishman
*     and Louis R. Moore, published In the Journal of the
*     American Statistical Association, March 1982, Vol. 77, # 377,
*     pp. 129-136.  The multiplier used is number VIII as tested
*     in the article, and is derived from the work of D. Hoaglin.
*
* ================================================================
*
*   Argument Domain:
*
*     The seed supplied to SEED$M should never be identical to 0,
*     ie., all 32 bits of the seed should not be 0.
*
*   Range of Result of RAND$M:
*
*     0.0 to 1.0   (open interval)
*
*   Action on domain error in RAND$M:
*
*     Signals "SWT_MATH_ERROR$" to OS via call to "SIGNL$"
*     Condition may be returned from; default result may be changed.
*
*   Other notes:
*
*     The multiplier may be changed by changing the data value
*     stored at the location "MULTIPLIER" in the link frame.
*     Note that this value must be a 32 bit integer.
*
*     If RAND$M has never been initialized with a seed, then a seed
*     will be constructed based on the time of day and cpu
*     seconds used since login.
*
*     The link frame for this procedure CANNOT be shared.
*
* ================================================================
*
*   Calls:
*
*     RAND$M may call TIMDAT, calls DBLE$M
*     SEED$M may call SIGNL$
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     RAND$M
            SUBR     SEED$M
*
$INSERT *>SRC>DECLARATIONS.S.I
$INSERT EXTRA>INCL>SWT_DEF.S.I
*
RAND$M      DECLARE  6
SEED$M      DECLARE  6
*
            DYNM     TIMVEC(12),TEMP(2)
            LINK
INITIALF    DATA     0
REALSEED    BSZ      4
MULTIPLIER  DATA     764261123L
            PROC
*
            START    RAND$M NA
*
            LDA      INITIALF          SEED BEEN INITIALIZED?
            BNE      CALC
            LT
            STA      INITIALF          TURN IT INTO A NOP
            CALL     TIMDAT
            AP       TIMVEC,S
            AP       =12,SL
            LDL      TIMVEC + 6
            ADL      TIMVEC + 3
            STL      REALSEED
*
CALC        EQU      *
            LDL      REALSEED
            MPL      MULTIPLIER
            ILE
            CSA
            STL      REALSEED       Effectively X in MG1
            CRA
            SRC
            LT
            XCA
            ADL      REALSEED
            STL      REALSEED
            ILE
            LLS      1
            ADL      REALSEED
            STL      REALSEED
            BLGT     GETFLOT
            SBL      =2147483647L
            STL      REALSEED
GETFLOT     EQU      *
            STL      TEMP           Make into a double float
            CALL     DBLE$M
            AP       TEMP,SL
            DFDV     =2147483648.0D0
            PRTN
*
*
            START    SEED$M NA
*
            LDL      ARGUMENT,*
            STL      REALSEED
            BLEQ     NULLSEED
            LT
            STA      INITIALF
            PRTN
*
NULLSEED    EQU      *
            DFLD     =0.0D0
            DFST     ARG_VAL
            SIGNAL   FMT =0.0D0
*
FMT         BCI      'Null-valued seed supplied to SWT SEED procedure.'
            END
