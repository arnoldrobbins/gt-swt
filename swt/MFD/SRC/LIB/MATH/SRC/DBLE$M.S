*  DBLE$M --- Create an 8 byte real from a 4 byte integer.
*
*   Software Tools Math Library
*   School of Information and Computer Science
*   Georgia Institute of Technology
*   Atlanta, Georgia 30332
*
* ================================================================
*
*   Modification History:
*
*     Written March 1983 by Eugene Spafford
*     Preliminary Documentation March 1983  E. Spafford
*     Converted from shortcall March 1983   EHS
*     Final Documentation April 1983   EHS
*
* ================================================================
*
*   Calling Sequence:
*
*     <result> := DBLE$M (<argument>)
*
*     Where
*        <result> is a 8 byte real number
*        <argument> is a 4 byte integer number (INTEGER *4)
*
* ================================================================
*
*   Algorithm and Source:
*
*     Derived from known register structure.  E. Spafford
*
*     Note that the "FLTL" instruction potentially drops 8
*      significant bits
*
* ================================================================
*
*   Argument Domain:
*
*     unrestricted
*
*   Range of Result:
*
*     determined by input
*
* ================================================================
*
            EJCT
            SEG
            SYML
            RLIT
*
            SUBR     DBLE$M

            LINK
DBLE$M      ECB      START,,ARGUMENT,1
            DATA     6,C'DBLE$M'
            PROC
            DYNM     =22
            DYNM     ARGUMENT(3),TEMP(4)

START       ARGT
            EAL      DBLE$M
            STL      SB% + 18
            LDA      ='4000
            STA      SB% + 0
*
            LDL      ARGUMENT,*
            STL      TEMP
            LDL      EXP
            STL      TEMP + 2
            DFLD     TEMP
            DFAD     ZERO
            PRTN

EXP         DATA     0,128+31
ZERO        DATA     0.0D0
            END
