*  DINT$P --- Get integer part of an 8 byte real. SHORTCALL
*  DINT$M --- Get integer part of an 8 byte real.
*
*   Georgia Tech Pascal Math Support Library (and SWT Math Library)
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
*     SWT DINT$M added 3/83
*     Final Documentation April 1983   EHS
*
* ================================================================
*
*   Calling Sequence:
*
*     DFLD  <argument>
*     EXT   DINT$P                  <result> := DINT$M (<argument>)
*     JSXB  DINT$P
*     DFST  <result>
*
*     Where
*        <result> is a 8 byte real number (REAL*8)
*        <argument> is a 8 byte real number
*
* ================================================================
*
*   Algorithm and Source:
*
*     Derived from known register structure.  E. Spafford
*
* ================================================================
*
*   Argument Domain:
*
*     unrestricted
*
*   Range of Result:
*
*     unrestricted, but only integer parts
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            ENT      DINT$P
            SUBR     DINT$M
*
            LINK
DINT$M      ECB      START,,ARGUMENT,1
            DATA     6,C'DINT$M'
            PROC
            DYNM     =22
            DYNM     ARGUMENT(3)
*
START       ARGT
            EAL      DINT$M
            STL      SB% + 18
            LDA      ='4000
            STA      SB% + 0
*
            DFLD     ARGUMENT,*
            JSXB     DINT$P
            PRTN
*
*
DINT$P      EQU      *
            LDA#     6              GET THE EXPONENT
            CAS      =128
            JMP#     NONZERO
            RCB
            DFLD     =0.0D0         CAN BE NO INTEGER PART
BACK        JMP%     XB% + 0
*
NONZERO     EQU      *              NOW SEE IF ALL INTEGER
            CAS      =128+47
            JMP#     BACK           NO ADJUSTMENT NEEDED
            JMP#     BACK
*
            CAS      =128+15        CHANGE FIRST WORD?
            JMP#     SECOND
            JMP#     ZERO2
            SUB      =128
            TAX
            LDA#     4
            ANA      ADJUST+1,X
            STA#     4
*
ZERO2       EQU      *
            CRA
            STA#     5
*
ZERO3       EQU      *
            CRL
            LDX#     6
            STLR     PB% + '13
            STX#     6
            JMP%     XB% + 0
*
SECOND      EQU      *
            CAS      =128+15+16
            JMP#     THIRD
            JMP#     ZERO3
            SUB      =128+15
            TAX
            LDA#     5
            ANA      ADJUST,X
            STA#     5
            JMP      ZERO3
*
THIRD       EQU      *
            SUB      =128+15+16
            TAY
            LDX#     6
            LDLR     PB% + '13
            ANA      ADJUST,Y
            IAB
            ANA      ADJUST,Y
            IAB
            STLR     PB% + '13
            STX#     6
            JMP%     XB% + 0
*
*
ADJUST      EQU      *
            DATA     %0000000000000000
            DATA     %1000000000000000
            DATA     %1100000000000000
            DATA     %1110000000000000
            DATA     %1111000000000000
            DATA     %1111100000000000
            DATA     %1111110000000000
            DATA     %1111111000000000
            DATA     %1111111100000000
            DATA     %1111111110000000
            DATA     %1111111111000000
            DATA     %1111111111100000
            DATA     %1111111111110000
            DATA     %1111111111111000
            DATA     %1111111111111100
            DATA     %1111111111111110
            DATA     %1111111111111111
*
            END
