*  UNIFORM --- Generate a random number in a uniform distribution.
*
*   Calling Sequence (in Ratfor):
*
*     <result> := UNIFORM (<lower>, <upper>)
*
*     Where:
*        <result> is a random number within the range. (INTEGER*4)
*        <lower>  is the lower bound of the range. (INTEGER*4)
*        <upper>  is the upper bound of the range. (INTEGER*4)
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     UNIFO0
*
UNIFO0      ECB      UNIFORM1,,LOWER,2
*
            DYNM     =20,LOWER(3),RANGE(3),TIMVEC(12),TEMP(4)
*
            LINK
SEED        DATA     0L             CURRENT RANDOM SEED
            PROC
*
UNIFORM1    ARGT
            LDL      LOWER,*        DEREFERENCE LOWER BOUND
            STL      LOWER
            SBL      RANGE,*        COMPUTE RANGE
            TCL
            STL      RANGE
            LDL      SEED           DETERMINE IF ALREADY INITIALIZED
            BLNE     UNIFORM2       IF SEED ALREADY INITIALIZED
            CALL     TIMDAT         GET SYSTEM STATISTICS
            AP       TIMVEC,S
            AP       =12,SL
*
            LDL      TIMVEC+6       CREATE INITIAL SEED
            ADL      TIMVEC+3
*
UNIFORM2    MPL      =764261123L
            ILE
            CSA
            STL      SEED
            CRA
            SRC
            LT
            XCA
            ADL      SEED
            STL      SEED
            ILE
            LLS      1
            ADL      SEED
            BLGT     UNIFORM3
            SBL      =2147483627L
UNIFORM3    STL      SEED
            STL      TEMP
            LDL      =159L
            STL      TEMP+2
            DFLD     TEMP
            DFDV     =2147483648.0D0
            DFST     TEMP
            LDL      RANGE
            FLTL
            FDBL
            DFMP     TEMP
            DFST     TEMP
            LDL      LOWER
            FLTL
            FDBL
            DFAD     TEMP
            DFAD     =0.5D0
            INTL
            PRTN
            END
