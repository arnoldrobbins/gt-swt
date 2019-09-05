* DECLARATIONS.S.I -- SWT Math Library Common Definitions
*   EHS  1983
*
            NLST
            LSMD
*
ERR_PTR_DEF XSET     0

DECLARE     MAC
            LINK
<0>         ECB      S_<0>,,ARGUMENT,1
            DATA     <1>,C'<0>'
            PROC
            DYNM     =22
            DYNM     ARGUMENT(3),ARG_VAL(4),ERR_RESULT(4),ERMES(2)
            DYNM     DBLFLAG,ERR_PTR(2)
            ENDM
*
DECLM       MAC
<0>         ECB      S_<0>
            DATA     <1>,C'<0>'
            PROC
            DYNM     =22
            ENDM
*
*
NA          XSET     0
SHORT       XSET     1
LONG        XSET     2
*
START       MAC
&FLAG       XSET     <2>+0
*
S_<1>       ARGT
            EAL      <1>
            STL      SB% + 18
            LDA      ='4000
            STA      SB% + 0
            SCT      &FLAG
%
            LF
            STA      DBLFLAG
%
            LT
            STA      DBLFLAG
%/
            ENDM
*
STARTN      MAC                     NO ARGUMENTS VERSION
S_<1>       EQU      *
            EAL      <1>
            STL      SB% + 18
            LDA      ='4000
            STA      SB% + 0
            ENDM
*
SIGNAL      MAC
            IFZ      ERR_PTR_DEF
ERR_PTR_DEF XSET     1
            LINK
ERR_ACTION  DATA     '140000
ERRNAME     DATA     15
            BCI      'SWT_MATH_ERROR$'
            PROC
            ENDC
*
<0>         DFLD     <2>
            DFST     ERR_RESULT
            EAL      <1>
            STL      ERMES
            EAL      ARG_VAL
            STL      ERR_PTR
            CALL     SIGNL$
            AP       ERRNAME,S
            AP       SB% + 4,S
            AP       =20,S
            AP       ERR_PTR,S
            AP       =10,S
            AP       ERR_ACTION,SL
            DFLD     ERR_RESULT
            PRTN
            ENDM
*
*
*   Now a few more macros
*
DABS        MAC
            FSPL
            DFCM
            ENDM
*
DINT        MAC
            EXT      DINT$P
            JSXB     DINT$P
            ENDM
*
SKP         MAC
            JMP#     * + 2
            ENDM
*
            LIST
