*  ERR$M --- Common error condition handler for math routines
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
*     call ERR$M (<ptr_to_cfh>)
*     Where
*        <ptr_to_cfh> is an address pointer to the condition
*            stack frame header as defined by SIGNL$
*
* ================================================================
*
*   Other notes:
*
*     The action of this routine is highly dependent on the assumed
*     stack structure and calling sequence used by all of the math
*     routines.  These are defined in the macros in the common
*     insert file "DECLARATIONS.S.I"
*
* ================================================================
*
*   Calls:
*
*     PRINT
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     ERR$M
$INSERT EXTRA>INCL>SWT_DEF.S.I
*
            LINK
ERR$M       ECB      START,,PTR_TO_CFH,1
            DATA     5,C'ERR$M'
            PROC
            DYNM     =22
            DYNM     PTR_TO_CFH(3)
            DYNM     ARGUMENT_VALUE(2),DEFAULT_VALUE(2)
            DYNM     ERR_MESSAGE(2),ROUTINE_NAME(2)
*
START       ARGT
            EAL      ERR$M
            STL      SB% + 18
            LDA      ='4000
            STA      SB% + 0
*
            CALL     PRINT
            AP       =ERROUT,S
            AP       MINMES,SL
*
            EAXB     PTR_TO_CFH,*
            EAXB     XB%,*
            EAXB     XB% + 26,*
            EAL      XB% + 4
            STL      DEFAULT_VALUE
            EAL      XB% + 0
            STL      ARGUMENT_VALUE
            EAL      XB% + 8,*
            STL      ERR_MESSAGE
            CALL     PRINT
            AP       =ERROUT,S
            AP       ERR_MESSAGE,*SL
*
*  At this point, a minimal message has gone out to ERROUT.
*   Now we try to print the routine name.
*   Next we signal an error to cause this to die.
*
            EAXB     PTR_TO_CFH,*
            EAXB     XB%,*
            EAXB     XB% + 24,*
            LDA      XB% + 0
            SAS      5              IS THE FLAG BIT SET?
            JMP#     NONAME         NOPE
*
            EAXB     XB% + 18,*     POINTER TO ECB
            EAL      XB% + 16       SHOULD BE VARYING NAME STRING
            STL      ROUTINE_NAME
*
            CALL     PRINT
            AP       =ERROUT,S
            AP       FMT1,S
            AP       ROUTINE_NAME,*SL
*
            JMP      FINISH
*
*
NONAME      EQU      *
            EAXB     PTR_TO_CFH,*
            EAXB     XB%,*
            EAXB     XB% + 4,*      MATH ROUTINE STACK FRAME
            EAL      XB% + 6
            STL      ROUTINE_NAME
            CALL     PRINT
            AP       =ERROUT,S
            AP       FMT2,S
            AP       ROUTINE_NAME,*SL
*
FINISH      EQU      *
            CALL     PRINT
            AP       =ERROUT,S
            AP       FMT3,S
            AP       ARGUMENT_VALUE,*S
            AP       DEFAULT_VALUE,*SL
*
            PRTN                    IF SIGNAL RETURNS, SO DO WE.
*
*
MINMES      BCI      '*n*n*n>>> SWT Math Error <<<*n*n.'
FMT1        BCI      '*nCall made from routine "*v"@.*n.'
FMT2        BCI      '*nCall made from unnamed routine (lb% = *a)@.*n.'
FMT3        BCI      'The argument to the function had value *,-8d'
            BCI      '*nDefault return value will be *,-8d*n*n.'
            END
