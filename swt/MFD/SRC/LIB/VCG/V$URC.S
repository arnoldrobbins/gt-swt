* V$URC -- 16-BIT UNSIGNED INTEGER RANGE CHECK ROUTINES
*           V$CURNG, V$CUUPB, V$CULWB:  CONSTANT (KNOWN) BOUNDS
*           V$VURNG, V$VUUPB, V$VULWB:  VARIABLE (UNKNOWN) BOUNDS

*           REQUIRES SOFTWARE TOOLS LIBRARY


         SEG
         RLIT
         SYML

         ENT   V$CURNG        IS A-REG WITHIN CONSTANT BOUNDS?
         ENT   V$CUUPB        IS A-REG <= A CONSTANT UPPER BOUND?
         ENT   V$CULWB        IS A-REG >= A CONSTANT LOWER BOUND?
         ENT   V$VURNG        IS A-REG WITHIN DYNAMIC BOUNDS?
         ENT   V$VUUPB        IS A-REG <= A DYNAMIC UPPER BOUND?
         ENT   V$VULWB        IS A-REG >= A DYNAMIC LOWER BOUND?


VALUE    EQU   SB%+'12     FIRST AVAILABLE SCRATCH STORAGE LOCATION
LWBVAL   EQU   SB%+'13
UPBVAL   EQU   SB%+'14
COND     DATA  11,C'RANGE_ERROR'    PL/I CHAR VARYING FORM OF CONDITION
NULLP    DATA  '7777,0              PL/I NULL POINTER




* V$CURNG --- CONSTANT UNSIGNED INTEGER-BOUNDS RANGE CHECK
*
*        CALLING SEQUENCE:
*              LOAD ACCUMULATOR A WITH VALUE TO BE CHECKED
*              EXT   V$CURNG
*              JSXB  V$CURNG
*              DATA  LOWER_BOUND
*              DATA  UPPER_BOUND
*              DATA  LINE_NUMBER_TO_BE_USED_FOR_DIAGNOSTICS
*
*        EXAMPLE:
*              LDA   I
*              EXT   V$CURNG
*              JSXB  V$CURNG
*              DATA  1
*              DATA  100
*              DATA  47
*              TAX
*              LDA   ARRAY,X
*
*        VALUE IN A IS RETURNED UNCHANGED IF IT IS IN RANGE
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           IS RAISED IF IT IS NOT IN RANGE


V$CURNG  EQU   *
         STA   VALUE       SAVE VALUE, SINCE TEST IS DESTRUCTIVE
         SUB   XB%         COMPARE VALUE IN A TO LOWER BOUND
         BMGE  L1          IF >=, GO CHECK THE UPPER BOUND

         PCL   LWBERR      IF <, REPORT LOWER BOUND ERROR
         AP    VALUE,S        GIVING ACTUAL VALUE
         AP    XB%,S          LOWER BOUND
         AP    XB%+2,S        SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL      AND NAME OF ROUTINE

L1       EQU   *
         LDA   VALUE       RECOVER THE VALUE TO BE TESTED
         SUB   XB%+1       COMPARE IT AGAINST THE UPPER BOUND
         BMGT  L2          IF >, REPORT AN ERROR

         LDA   VALUE       OTHERWISE, RESTORE THE VALUE
         JMP%  XB%+3          AND RETURN NORMALLY

L2       EQU   *
         PCL   UPBERR      REPORT UPPER BOUND ERROR
         AP    VALUE,S        GIVING ACTUAL VALUE
         AP    XB%+1,S        UPPER BOUND
         AP    XB%+2,S        SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL      AND NAME OF ROUTINE



* V$CUUPB -- CONSTANT UNSIGNED UPPER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$CUUPB
*              JSXB  V$CUUPB
*              DATA  UPPER_BOUND
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              LDA   I
*              EXT   V$CUUPB
*              JSXB  V$CUUPB
*              DATA  10
*              DATA  14
*              TAX
*              LDA   ARRAY,X
*
*        A-REG IS RETURNED UNCHANGED IF IT IS <= UPPER BOUND
*
*        RANGE_ERROR EXCEPTION IS RAISED OTHERWISE


V$CUUPB  EQU   *
         STA   VALUE       SAVE VALUE, SINCE TEST IS DESTRUCTIVE
         SUB   XB%         COMPARE VALUE TO UPPER BOUND
         BMGT  L3          IF >, WE HAVE AN ERROR CONDITION

         LDA   VALUE       OTHERWISE, RESTORE THE VALUE
         JMP%  XB%+2          AND DO A NORMAL RETURN

L3       EQU   *
         PCL   UPBERR
         AP    VALUE,S
         AP    XB%,S
         AP    XB%+1,S
         AP    SB%+18,*
         AP    XB%+16,SL



* V$CULWB -- CONSTANT UNSIGNED LOWER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$CULWB
*              JSXB  V$CULWB
*              DATA  LOWER_BOUND
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              LDA   I
*              EXT   V$CULWB
*              JSXB  V$CULWB
*              DATA  0
*              DATA  14
*              TAX
*              LDA   ARRAY,X
*
*        A-REG IS RETURNED UNCHANGED IF IT IS >= LOWER BOUND
*
*        RANGE_ERROR EXCEPTION IS RAISED OTHERWISE


V$CULWB  EQU   *
         STA   VALUE       SAVE VALUE, SINCE TEST IS DESTRUCTIVE
         SUB   XB%         COMPARE VALUE TO LOWER BOUND
         BMGE  L4          IF >=, WE'RE SAFE

         PCL   LWBERR      OTHERWISE, REPORT THE ERROR
         AP    VALUE,S     ACTUAL VALUE
         AP    XB%,S       LOWER BOUND
         AP    XB%+1,S     LINE NUMBER IN SOURCE CODE
         AP    SB%+18,*
         AP    XB%+16,SL   NAME OF ROUTINE (FOLLOWING ECB)

L4       EQU   *
         LDA   VALUE       RESTORE VALUE
         JMP%  XB%+2          AND RETURN NORMALLY



* V$VURNG -- VARIABLE BOUNDS UNSIGNED RANGE CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH LOWER BOUND
*              STORE A IN THE CURRENT STACK FRAME
*              LOAD A WITH UPPER BOUND
*              STORE A IN THE CURRENT STACK FRAME
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$VURNG
*              JSXB  V$VURNG
*              DATA  OFFSET_OF_LOWER_BOUND_IN_FRAME
*              DATA  OFFSET_OF_UPPER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*EAXB  DISPLAY1,*
*              LDA   XB%+14
*              STA   SB%+21
*              LDA   XB%+15
*              STA   SB%+22
*              LDA   I
*              EXT   V$VURNG
*              JSXB  V$VURNG
*              DATA  21
*              DATA  22
*              DATA  14
*              TAX
*              LDA   ARRAY,X
*
*        A-REG IS RETURNED UNCHANGED IF IT IS IN RANGE
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           RAISED IF IT IS NOT IN RANGE


V$VURNG  EQU   *
         STA   VALUE    SAVE VALUE, SINCE TESTS ARE DESTRUCTIVE
         LDX   XB%      GET OFFSET OF LOWER BOUND
         SUB   SB%,X    COMPARE VALUE TO THE LOWER BOUND
         BMGE  L5       IF >=, GO ON TO CHECK THE UPPER BOUND

         LDA   SB%,X    OTHERWISE, REPORT THE ERROR
         STA   LWBVAL
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    LWBVAL,S    LOWER BOUND
         AP    XB%+2,S     SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND NAME OF ROUTINE

L5       EQU   *        BUILD A COLONY HERE
         LDX   XB%+1    GET OFFSET OF UPPER BOUND
         LDA   VALUE    RECOVER THE VALUE
         SUB   SB%,X    COMPARE THE VALUE TO THE UPPER BOUND
         BMGT  L6       IF >, WE REPORT AN ERROR

         LDA   VALUE    OTHERWISE, RECOVER THE VALUE
         JMP%  XB%+3       AND RETURN NORMALLY

L6       EQU   *
         LDA   SB%,X
         STA   UPBVAL
         PCL   UPBERR   GENERATE AN INTELLIGIBLE ERROR MESSAGE
         AP    VALUE,S     CONTAINING THE INDEX VALUE
         AP    UPBVAL,S    THE ACTUAL UPPER BOUND
         AP    XB%+2,S     THE SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND THE NAME OF THE ERRANT ROUTINE



* V$VUUPB -- VARIABLE UNSIGNED UPPER BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH UPPER BOUND
*              STORE A IN THE CURRENT STACK FRAME
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$VUUPB
*              JSXB  V$VUUPB
*              DATA  OFFSET_OF_UPPER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDA   XB%+15
*              STA   SB%+22
*              LDA   I
*              EXT   V$VUUPB
*              JSXB  V$VUUPB
*              DATA  22
*              DATA  14
*              TAX
*              LDA   ARRAY,X
*
*        A-REG IS RETURNED UNCHANGED IF IT IS NOT GREATER THAN
*           THE UPPER BOUND
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           RAISED IF IT IS GREATER THAN THE UPPER BOUND


V$VUUPB  EQU   *
         LDX   XB%      GET OFFSET OF UPPER BOUND
         STA   VALUE    SAVE VALUE UNDER TEST
         SUB   SB%,X    COMPARE VALUE TO THE UPPER BOUND
         BMGT  L7       IF >, WE REPORT AN ERROR

         LDA   VALUE    OTHERWISE, RESTORE THE VALUE
         JMP%  XB%+2       AND RETURN NORMALLY

L7       EQU   *
         LDA   SB%,X
         STA   UPBVAL
         PCL   UPBERR   GENERATE AN INTELLIGIBLE ERROR MESSAGE
         AP    VALUE,S     CONTAINING THE INDEX VALUE
         AP    UPBVAL,S    THE ACTUAL UPPER BOUND
         AP    XB%+1,S     THE SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND THE NAME OF THE ERRANT ROUTINE



* V$VULWB -- VARIABLE UNSIGNED LOWER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH LOWER BOUND
*              STORE A IN THE CURRENT STACK FRAME
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$VULWB
*              JSXB  V$VULWB
*              DATA  OFFSET_OF_LOWER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDA   XB%+14
*              STA   SB%+21
*              LDA   I
*              EXT   V$VULWB
*              JSXB  V$VULWB
*              DATA  21
*              DATA  14
*              TAX
*              LDA   ARRAY,X
*
*        A-REG IS RETURNED UNCHANGED IF IT IS NOT LESS THAN
*           THE LOWER BOUND
*
*        ERROR MESSAGE IS ISSUED AND RANGE_ERROR EXCEPTION
*           RAISED IF IT IS LESS THAN THE LOWER BOUND


V$VULWB  EQU   *
         STA   VALUE    SAVE VALUE UNDER TEST
         LDX   XB%      GET OFFSET OF LOWER BOUND
         SUB   SB%,X    COMPARE VALUE TO THE LOWER BOUND
         BMGE  L8       IF >=, CHECK THE UPPER BOUND

         LDA   SB%,X    IF <, BUILD ARGUMENT LIST AND REPORT ERROR
         STA   LWBVAL
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    LWBVAL,S    LOWER BOUND
         AP    XB%+1,S     SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND NAME OF ROUTINE

L8       EQU   *
         LDA   VALUE    RECOVER VALUE
         JMP%  XB%+2    NORMAL RETURN



* LWBERR -- REPORT UNSIGNED LOWER-BOUND RANGE ERROR

LWBERR   ECB   LWBERR$,,LWBVALP,4

         DYNM  LWBVALP(3),LWBP(3),LWBLINEP(3),LWBNAMEP(3)

LWBMSG   DATA  C'Range check failed (*,-10i <'
         DATA  C' *,-10i) on line *i of *v*n.'

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


* UPBERR -- REPORT UNSIGNED UPPER-BOUND RANGE ERROR

UPBERR   ECB   UPBERR$,,UPBVALP,4

         DYNM  UPBVALP(3),UPBP(3),UPBLINEP(3),UPBNAMEP(3)

UPBMSG   DATA  C'Range check failed (*,-10i >'
         DATA  C' *,-10i) on line *i of *v*n.'

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
