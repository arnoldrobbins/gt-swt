* V$VRC -- 32-BIT UNSIGNED INTEGER RANGE CHECK ROUTINES
*           V$CVRNG, V$CVUPB, V$CVLWB:  CONSTANT (KNOWN) BOUNDS
*           V$VVRNG, V$VVUPB, V$VVLWB:  VARIABLE (UNKNOWN) BOUNDS

*           REQUIRES SOFTWARE TOOLS LIBRARY


         SEG
         RLIT
         SYML

         ENT   V$CVRNG        IS L-REG WITHIN CONSTANT BOUNDS?
         ENT   V$CVUPB        IS L-REG <= A CONSTANT UPPER BOUND?
         ENT   V$CVLWB        IS L-REG >= A CONSTANT LOWER BOUND?
         ENT   V$VVRNG        IS L-REG WITHIN DYNAMIC BOUNDS?
         ENT   V$VVUPB        IS L-REG <= A DYNAMIC UPPER BOUND?
         ENT   V$VVLWB        IS L-REG >= A DYNAMIC LOWER BOUND?


VALUE    EQU   SB%+'12     FIRST AVAILABLE SCRATCH STORAGE LOCATION
LWBVAL   EQU   SB%+'14
UPBVAL   EQU   SB%+'16
COND     DATA  11,C'RANGE_ERROR'    PL/I CHAR VARYING FORM OF CONDITION
NULLP    DATA  '7777,0              PL/I NULL POINTER




* V$CVRNG --- CONSTANT UNSIGNED LONG INTEGER-BOUNDS RANGE CHECK
*
*        CALLING SEQUENCE:
*              LOAD ACCUMULATOR L WITH VALUE TO BE CHECKED
*              EXT   V$CVRNG
*              JSXB  V$CVRNG
*              DATA  LOWER_BOUND_HIGH_WORD
*              DATA  LOWER_BOUND_LOW_WORD
*              DATA  UPPER_BOUND_HIGH_WORD
*              DATA  UPPER_BOUND_LOW_WORD
*              DATA  LINE_NUMBER_TO_BE_USED_FOR_DIAGNOSTICS
*
*        EXAMPLE:
*              LDL   I
*              EXT   V$CVRNG
*              JSXB  V$CVRNG
*              DATA  0
*              DATA  1
*              DATA  0
*              DATA  100
*              DATA  47
*
*        VALUE IN L IS RETURNED UNCHANGED IF IT IS IN RANGE
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           IS RAISED IF IT IS NOT IN RANGE


V$CVRNG  EQU   *
         STL   VALUE       SAVE VALUE, SINCE TESTS ARE DESTRUCTIVE
         SBL   XB%         COMPARE VALUE IN L TO LOWER BOUND
         BMGE  L1          IF >=, CHECK UPPER BOUND

         PCL   LWBERR      IF <, REPORT LOWER BOUND ERROR
         AP    VALUE,S        GIVING ACTUAL VALUE
         AP    XB%,S          LOWER BOUND
         AP    XB%+4,S        SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL      AND NAME OF ROUTINE

L1       EQU   *
         LDL   VALUE       RECOVER VALUE UNDER TEST
         SBL   XB%+2       COMPARE VALUE TO UPPER BOUND
         BMGT  L2          IF >, VALUE EXCEEDS TOP OF RANGE

         LDL   VALUE       OTHERWISE, RECOVER VALUE
         JMP%  XB%+5          AND RETURN NORMALLY

L2       EQU   *
         PCL   UPBERR      REPORT UPPER BOUND ERROR
         AP    VALUE,S        GIVING ACTUAL VALUE
         AP    XB%+2,S        UPPER BOUND
         AP    XB%+4,S        SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL      AND NAME OF ROUTINE



* V$CVUPB -- CONSTANT UNSIGNED UPPER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$CVUPB
*              JSXB  V$CVUPB
*              DATA  UPPER_BOUND_HIGH_WORD
*              DATA  UPPER_BOUND_LOW_WORD
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              LDL   I
*              EXT   V$CVUPB
*              JSXB  V$CVUPB
*              DATA  0
*              DATA  10
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS <= UPPER BOUND
*
*        RANGE_ERROR EXCEPTION IS RAISED OTHERWISE


V$CVUPB  EQU   *
         STL   VALUE       SAVE VALUE; TEST IS DESTRUCTIVE
         SBL   XB%         COMPARE VALUE TO UPPER BOUND
         BMGT  L3          IF >, WE HAVE AN ERROR CONDITION

         LDL   VALUE       OTHERWISE, RESTORE VALUE
         JMP%  XB%+3          AND RETURN

L3       EQU   *
         PCL   UPBERR
         AP    VALUE,S
         AP    XB%,S
         AP    XB%+2,S
         AP    SB%+18,*
         AP    XB%+16,SL



* V$CVLWB -- CONSTANT UNSIGNED LOWER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$CVLWB
*              JSXB  V$CVLWB
*              DATA  LOWER_BOUND_HIGH_WORD
*              DATA  LOWER_BOUND_LOW_WORD
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              LDL   I
*              EXT   V$CVLWB
*              JSXB  V$CVLWB
*              DATA  0
*              DATA  1
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS >= LOWER BOUND
*
*        RANGE_ERROR EXCEPTION IS RAISED OTHERWISE


V$CVLWB  EQU   *
         STL   VALUE       SAVE VALUE; TEST IS DESTRUCTIVE
         SBL   XB%         COMPARE VALUE TO LOWER BOUND
         BMGE  L4          IF >=, WE RETURN NORMALLY

         PCL   LWBERR      OTHERWISE, WE REPORT AN ERROR
         AP    VALUE,S     ACTUAL VALUE
         AP    XB%,S       LOWER BOUND
         AP    XB%+2,S     LINE NUMBER IN SOURCE CODE
         AP    SB%+18,*
         AP    XB%+16,SL   NAME OF ROUTINE (FOLLOWING ECB)

L4       EQU   *
         LDL   VALUE
         JMP%  XB%+3



* V$VVRNG -- VARIABLE UNSIGNED BOUNDS RANGE CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH LOWER BOUND
*              STORE L IN THE CURRENT STACK FRAME
*              LOAD L WITH UPPER BOUND
*              STORE L IN THE CURRENT STACK FRAME
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$VVRNG
*              JSXB  V$VVRNG
*              DATA  OFFSET_OF_LOWER_BOUND_IN_FRAME
*              DATA  OFFSET_OF_UPPER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDL   XB%+14
*              STL   SB%+21
*              LDL   XB%+15
*              STL   SB%+23
*              LDL   I
*              EXT   V$VVRNG
*              JSXB  V$VVRNG
*              DATA  21
*              DATA  23
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS IN RANGE
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           RAISED IF IT IS NOT IN RANGE


V$VVRNG  EQU   *
         STL   VALUE    SAVE VALUE SINCE TESTS ARE DESTRUCTIVE
         LDX   XB%      GET OFFSET OF LOWER BOUND
         SBL   SB%,X    COMPARE VALUE TO THE LOWER BOUND
         BMGE  L5       IF >=, MOVE ON TO TEST UPPER BOUND

         LDL   SB%,X    IF <, REPORT THE ERROR
         STL   LWBVAL
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    LWBVAL,S    LOWER BOUND
         AP    XB%+2,S     SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND NAME OF ROUTINE

L5       EQU   *        BUILD A COLONY HERE
         LDL   VALUE    RECOVER VALUE UNDER TEST
         LDX   XB%+1    GET OFFSET OF UPPER BOUND
         SBL   SB%,X    COMPARE VALUE TO THE UPPER BOUND
         BMGT  L6       IF >, WE REPORT AN ERROR

         LDL   VALUE    OTHERWISE, RECOVER THE VALUE
         JMP%  XB%+3       AND RETURN NORMALLY

L6       EQU   *
         LDL   SB%,X
         STL   UPBVAL
         PCL   UPBERR   GENERATE AN INTELLIGIBLE ERROR MESSAGE
         AP    VALUE,S     CONTAINING THE INDEX VALUE
         AP    UPBVAL,S    THE ACTUAL UPPER BOUND
         AP    XB%+2,S     THE SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND THE NAME OF THE ERRANT ROUTINE



* V$VVUPB -- VARIABLE UPPER BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH UPPER BOUND
*              STORE L IN THE CURRENT STACK FRAME
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$VVUPB
*              JSXB  V$VVUPB
*              DATA  OFFSET_OF_UPPER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDL   XB%+15
*              STL   SB%+22
*              LDL   I
*              EXT   V$VVUPB
*              JSXB  V$VVUPB
*              DATA  22
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS NOT GREATER THAN
*           THE UPPER BOUND
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           RAISED IF IT IS GREATER THAN THE UPPER BOUND


V$VVUPB  EQU   *
         STL   VALUE    SAVE VALUE, SINCE TEST IS DESTRUCTIVE
         LDX   XB%      GET OFFSET OF UPPER BOUND
         SBL   SB%,X    COMPARE VALUE TO THE UPPER BOUND
         BMGT  L7       IF >, WE REPORT AN ERROR

         LDL   VALUE    OTHERWISE, RECOVER VALUE AND
         JMP%  XB%+2    RETURN NORMALLY

L7       EQU   *
         LDL   SB%,X
         STL   UPBVAL
         PCL   UPBERR   GENERATE AN INTELLIGIBLE ERROR MESSAGE
         AP    VALUE,S     CONTAINING THE INDEX VALUE
         AP    UPBVAL,S    THE ACTUAL UPPER BOUND
         AP    XB%+1,S     THE SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND THE NAME OF THE ERRANT ROUTINE



* V$VVLWB -- VARIABLE LOWER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH LOWER BOUND
*              STORE L IN THE CURRENT STACK FRAME
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$VVLWB
*              JSXB  V$VVLWB
*              DATA  OFFSET_OF_LOWER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDL   XB%+14
*              STL   SB%+21
*              LDL   I
*              EXT   V$VVLWB
*              JSXB  V$VVLWB
*              DATA  21
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS NOT LESS THAN
*           THE LOWER BOUND
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           RAISED IF IT IS LESS THAN THE LOWER BOUND


V$VVLWB  EQU   *
         STL   VALUE    SAVE VALUE, SINCE TEST IS DESTRUCTIVE
         LDX   XB%      GET OFFSET OF LOWER BOUND
         SBL   SB%,X    COMPARE VALUE TO THE LOWER BOUND
         BMGE  L8       IF >=, RETURN NORMALLY

         LDL   SB%,X    IF <, BUILD ARGUMENT LIST AND REPORT ERROR
         STL   LWBVAL
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    LWBVAL,S    LOWER BOUND
         AP    XB%+1,S     SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND NAME OF ROUTINE

L8       EQU   *
         LDL   VALUE    RECOVER VALUE
         JMP%  XB%+2    NORMAL RETURN



* LWBERR -- REPORT LOWER-BOUND RANGE ERROR

LWBERR   ECB   LWBERR$,,LWBVALP,4

         DYNM  LWBVALP(3),LWBP(3),LWBLINEP(3),LWBNAMEP(3)

LWBMSG   DATA  C'Range check failed (*,-10l <'  32 CHAR LIMIT ON LIT SIZE
         DATA  C' *,-10l) on line *i of *v*n.'

LWBERR$  EQU   *
         ARGT

         CALL  PRINT    CHEAT; USE SWT PRINT ROUTINE TO DUMP ERROR MESSAGE
         AP    =1,S     (1 IS A FILE DESCRIPTOR FOR THE TERMINAL)
         AP    LWBMSG,S
         AP    LWBVALP,*S
         AP    LWBP,*S
         AP    LWBLINEP,*S
         AP    LWBNAMEP,*SL

         CALL  SIGNL$   RAISE A RANGE_ERROR EXCEPTION
         AP    COND,S      CHAR VARYING: 'RANGE_ERROR'
         AP    NULLP,S     NO STACK HEADER INFO
         AP    =0,S
         AP    NULLP,S     NO AUXILIARY INFO
         AP    =0,S
         AP    =0,SL       RETURN IS IMPOSSIBLE


* UPBERR -- REPORT UPPER-BOUND RANGE ERROR

UPBERR   ECB   UPBERR$,,UPBVALP,4

         DYNM  UPBVALP(3),UPBP(3),UPBLINEP(3),UPBNAMEP(3)

UPBMSG   DATA  C'Range check failed (*,-10l >'
         DATA  C' *,-10l) on line *i of *v*n.'

UPBERR$  EQU   *
         ARGT

         CALL  PRINT    CHEAT; USE SWT PRINT ROUTINE TO DUMP ERROR MESSAGE
         AP    =1,S     (1 IS A FILE DESCRIPTOR FOR THE TERMINAL)
         AP    UPBMSG,S
         AP    UPBVALP,*S
         AP    UPBP,*S
         AP    UPBLINEP,*S
         AP    UPBNAMEP,*SL

         CALL  SIGNL$   RAISE A RANGE_ERROR EXCEPTION
         AP    COND,S      CHAR VARYING: 'RANGE_ERROR'
         AP    NULLP,S     NO STACK HEADER INFO
         AP    =0,S
         AP    NULLP,S     NO AUXILIARY INFO
         AP    =0,S
         AP    =0,SL       RETURN IS IMPOSSIBLE

         END
