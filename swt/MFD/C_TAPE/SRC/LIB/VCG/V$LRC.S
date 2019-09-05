* V$LRC -- 32-BIT SIGNED INTEGER RANGE CHECK ROUTINES
*           V$CLRNG, V$CLUPB, V$CLLWB:  CONSTANT (KNOWN) BOUNDS
*           V$VLRNG, V$VLUPB, V$VLLWB:  VARIABLE (UNKNOWN) BOUNDS

*           REQUIRES SOFTWARE TOOLS LIBRARY


         SEG
         RLIT
         SYML

         ENT   V$CLRNG        IS L-REG WITHIN CONSTANT BOUNDS?
         ENT   V$CLUPB        IS L-REG <= A CONSTANT UPPER BOUND?
         ENT   V$CLLWB        IS L-REG >= A CONSTANT LOWER BOUND?
         ENT   V$VLRNG        IS L-REG WITHIN DYNAMIC BOUNDS?
         ENT   V$VLUPB        IS L-REG <= A DYNAMIC UPPER BOUND?
         ENT   V$VLLWB        IS L-REG >= A DYNAMIC LOWER BOUND?


VALUE    EQU   SB%+'12     FIRST AVAILABLE SCRATCH STORAGE LOCATION
LWBVAL   EQU   SB%+'14
UPBVAL   EQU   SB%+'16
COND     DATA  11,C'RANGE_ERROR'    PL/I CHAR VARYING FORM OF CONDITION
NULLP    DATA  '7777,0              PL/I NULL POINTER




* V$CLRNG --- CONSTANT LONG INTEGER-BOUNDS RANGE CHECK
*
*        CALLING SEQUENCE:
*              LOAD ACCUMULATOR L WITH VALUE TO BE CHECKED
*              EXT   V$CLRNG
*              JSXB  V$CLRNG
*              DATA  LOWER_BOUND_HIGH_WORD
*              DATA  LOWER_BOUND_LOW_WORD
*              DATA  UPPER_BOUND_HIGH_WORD
*              DATA  UPPER_BOUND_LOW_WORD
*              DATA  LINE_NUMBER_TO_BE_USED_FOR_DIAGNOSTICS
*
*        EXAMPLE:
*              LDL   I
*              EXT   V$CLRNG
*              JSXB  V$CLRNG
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


V$CLRNG  EQU   *
         CLS   XB%         COMPARE VALUE IN L TO LOWER BOUND
         JMP#  L1          IF >, CHECK UPPER BOUND
         JMP#  L1          IF =, CHECK UPPER BOUND
         STL   VALUE
         PCL   LWBERR      IF <, REPORT LOWER BOUND ERROR
         AP    VALUE,S        GIVING ACTUAL VALUE
         AP    XB%,S          LOWER BOUND
         AP    XB%+4,S        SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL      AND NAME OF ROUTINE

L1       EQU   *
         CLS   XB%+2       COMPARE VALUE IN L TO UPPER BOUND
         JMP#  L2          IF >, VALUE EXCEEDS TOP OF RANGE
         RCB               IF =
         JMP%  XB%+5          OR IF <, VALUE IS OK; DO NORMAL RETURN

L2       EQU   *
         STL   VALUE
         PCL   UPBERR      REPORT UPPER BOUND ERROR
         AP    VALUE,S        GIVING ACTUAL VALUE
         AP    XB%+2,S        UPPER BOUND
         AP    XB%+4,S        SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL      AND NAME OF ROUTINE



* V$CLUPB -- CONSTANT UPPER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$CLUPB
*              JSXB  V$CLUPB
*              DATA  UPPER_BOUND_HIGH_WORD
*              DATA  UPPER_BOUND_LOW_WORD
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              LDL   I
*              EXT   V$CLUPB
*              JSXB  V$CLUPB
*              DATA  0
*              DATA  10
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS <= UPPER BOUND
*
*        RANGE_ERROR EXCEPTION IS RAISED OTHERWISE


V$CLUPB  EQU   *
         CLS   XB%         COMPARE VALUE TO UPPER BOUND
         JMP#  L3          IF >, WE HAVE AN ERROR CONDITION
         RCB               IF =
         JMP%  XB%+3            OR IF <, WE RETURN NORMALLY

L3       EQU   *
         STL   VALUE
         PCL   UPBERR
         AP    VALUE,S
         AP    XB%,S
         AP    XB%+2,S
         AP    SB%+18,*
         AP    XB%+16,SL



* V$CLLWB -- CONSTANT LOWER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$CLLWB
*              JSXB  V$CLLWB
*              DATA  LOWER_BOUND_HIGH_WORD
*              DATA  LOWER_BOUND_LOW_WORD
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              LDL   I
*              EXT   V$CLLWB
*              JSXB  V$CLLWB
*              DATA  0
*              DATA  1
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS >= LOWER BOUND
*
*        RANGE_ERROR EXCEPTION IS RAISED OTHERWISE


V$CLLWB  EQU   *
         CLS   XB%         COMPARE VALUE TO LOWER BOUND
         JMP#  L4          IF >
         JMP#  L4               OR IF =, WE RETURN NORMALLY

         STL   VALUE       OTHERWISE, WE REPORT AN ERROR
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    XB%,S       LOWER BOUND
         AP    XB%+2,S     LINE NUMBER IN SOURCE CODE
         AP    SB%+18,*
         AP    XB%+16,SL   NAME OF ROUTINE (FOLLOWING ECB)

L4       EQU   *
         JMP%  XB%+3



* V$VLRNG -- VARIABLE BOUNDS RANGE CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH LOWER BOUND
*              STORE L IN THE CURRENT STACK FRAME
*              LOAD L WITH UPPER BOUND
*              STORE L IN THE CURRENT STACK FRAME
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$VLRNG
*              JSXB  V$VLRNG
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
*              EXT   V$VLRNG
*              JSXB  V$VLRNG
*              DATA  21
*              DATA  23
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS IN RANGE
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           RAISED IF IT IS NOT IN RANGE


V$VLRNG  EQU   *
         LDX   XB%      GET OFFSET OF LOWER BOUND
         CLS   SB%,X    COMPARE VALUE TO THE LOWER BOUND
         JMP#  L5       IF >, MOVE ON TO TEST UPPER BOUND
         JMP#  L5       (SAME FOR =)
         STL   VALUE    IF <, BUILD ARGUMENT LIST AND REPORT ERROR
         LDL   SB%,X
         STL   LWBVAL
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    LWBVAL,S    LOWER BOUND
         AP    XB%+2,S     SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND NAME OF ROUTINE

L5       EQU   *        BUILD A COLONY HERE
         LDX   XB%+1    GET OFFSET OF UPPER BOUND
         CLS   SB%,X    COMPARE VALUE TO THE UPPER BOUND
         JMP#  L6       IF >, WE REPORT AN ERROR
         RCB            OTHERWISE,
         JMP%  XB%+3    RETURN NORMALLY

L6       EQU   *
         STL   VALUE
         LDL   SB%,X
         STL   UPBVAL
         PCL   UPBERR   GENERATE AN INTELLIGIBLE ERROR MESSAGE
         AP    VALUE,S     CONTAINING THE INDEX VALUE
         AP    UPBVAL,S    THE ACTUAL UPPER BOUND
         AP    XB%+2,S     THE SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND THE NAME OF THE ERRANT ROUTINE



* V$VLUPB -- VARIABLE UPPER BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH UPPER BOUND
*              STORE L IN THE CURRENT STACK FRAME
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$VLUPB
*              JSXB  V$VLUPB
*              DATA  OFFSET_OF_UPPER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDL   XB%+15
*              STL   SB%+22
*              LDL   I
*              EXT   V$VLUPB
*              JSXB  V$VLUPB
*              DATA  22
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS NOT GREATER THAN
*           THE UPPER BOUND
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           RAISED IF IT IS GREATER THAN THE UPPER BOUND


V$VLUPB  EQU   *
         LDX   XB%      GET OFFSET OF UPPER BOUND
         CLS   SB%,X    COMPARE VALUE TO THE UPPER BOUND
         JMP#  L7       IF >, WE REPORT AN ERROR
         RCB            OTHERWISE,
         JMP%  XB%+2    RETURN NORMALLY

L7       EQU   *
         STL   VALUE
         LDL   SB%,X
         STL   UPBVAL
         PCL   UPBERR   GENERATE AN INTELLIGIBLE ERROR MESSAGE
         AP    VALUE,S     CONTAINING THE INDEX VALUE
         AP    UPBVAL,S    THE ACTUAL UPPER BOUND
         AP    XB%+1,S     THE SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND THE NAME OF THE ERRANT ROUTINE



* V$VLLWB -- VARIABLE LOWER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD L WITH LOWER BOUND
*              STORE L IN THE CURRENT STACK FRAME
*              LOAD L WITH VALUE TO BE CHECKED
*              EXT   V$VLLWB
*              JSXB  V$VLLWB
*              DATA  OFFSET_OF_LOWER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDL   XB%+14
*              STL   SB%+21
*              LDL   I
*              EXT   V$VLLWB
*              JSXB  V$VLLWB
*              DATA  21
*              DATA  14
*
*        L-REG IS RETURNED UNCHANGED IF IT IS NOT LESS THAN
*           THE LOWER BOUND
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           RAISED IF IT IS LESS THAN THE LOWER BOUND


V$VLLWB  EQU   *
         LDX   XB%      GET OFFSET OF LOWER BOUND
         CLS   SB%,X    COMPARE VALUE TO THE LOWER BOUND
         JMP#  L8       IF >, MOVE ON TO TEST UPPER BOUND
         JMP#  L8       (SAME FOR =)

         STL   VALUE    IF <, BUILD ARGUMENT LIST AND REPORT ERROR
         LDL   SB%,X
         STL   LWBVAL
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    LWBVAL,S    LOWER BOUND
         AP    XB%+1,S     SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND NAME OF ROUTINE

L8       EQU   *        BUILD A COLONY HERE
         JMP%  XB%+2    NORMAL RETURN



* LWBERR -- REPORT LOWER-BOUND RANGE ERROR

LWBERR   ECB   LWBERR$,,LWBVALP,4

         DYNM  LWBVALP(3),LWBP(3),LWBLINEP(3),LWBNAMEP(3)

LWBMSG   DATA  C'Range check failed (*l < *l)'  32 CHAR LIMIT ON LIT. SIZE
         DATA  C' on line *i of *v*n.'

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

UPBMSG   DATA  C'Range check failed (*l > *l)'
         DATA  C' on line *i of *v*n.'

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
