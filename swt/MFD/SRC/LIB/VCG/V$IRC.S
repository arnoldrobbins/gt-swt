* V$IRC -- 16-BIT SIGNED INTEGER RANGE CHECK ROUTINES
*           V$CIRNG, V$CIUPB, V$CILWB:  CONSTANT (KNOWN) BOUNDS
*           V$VIRNG, V$VIUPB, V$VILWB:  VARIABLE (UNKNOWN) BOUNDS

*           REQUIRES SOFTWARE TOOLS LIBRARY


         SEG
         RLIT
         SYML

         ENT   V$CIRNG        IS A-REG WITHIN CONSTANT BOUNDS?
         ENT   V$CIUPB        IS A-REG <= A CONSTANT UPPER BOUND?
         ENT   V$CILWB        IS A-REG >= A CONSTANT LOWER BOUND?
         ENT   V$VIRNG        IS A-REG WITHIN DYNAMIC BOUNDS?
         ENT   V$VIUPB        IS A-REG <= A DYNAMIC UPPER BOUND?
         ENT   V$VILWB        IS A-REG >= A DYNAMIC LOWER BOUND?


VALUE    EQU   SB%+'12     FIRST AVAILABLE SCRATCH STORAGE LOCATION
LWBVAL   EQU   SB%+'13
UPBVAL   EQU   SB%+'14
COND     DATA  11,C'RANGE_ERROR'    PL/I CHAR VARYING FORM OF CONDITION
NULLP    DATA  '7777,0              PL/I NULL POINTER




* V$CIRNG --- CONSTANT INTEGER-BOUNDS RANGE CHECK
*
*        CALLING SEQUENCE:
*              LOAD ACCUMULATOR A WITH VALUE TO BE CHECKED
*              EXT   V$CIRNG
*              JSXB  V$CIRNG
*              DATA  LOWER_BOUND
*              DATA  UPPER_BOUND
*              DATA  LINE_NUMBER_TO_BE_USED_FOR_DIAGNOSTICS
*
*        EXAMPLE:
*              LDA   I
*              EXT   V$CIRNG
*              JSXB  V$CIRNG
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


V$CIRNG  EQU   *
         CAS   XB%         COMPARE VALUE IN A TO LOWER BOUND
         JMP#  L1          IF >, CHECK UPPER BOUND
         JMP#  L1          IF =, CHECK UPPER BOUND
         STA   VALUE
         PCL   LWBERR      IF <, REPORT LOWER BOUND ERROR
         AP    VALUE,S        GIVING ACTUAL VALUE
         AP    XB%,S          LOWER BOUND
         AP    XB%+2,S        SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL      AND NAME OF ROUTINE

L1       EQU   *
         CAS   XB%+1       COMPARE VALUE IN A TO UPPER BOUND
         JMP#  L2          IF >, VALUE EXCEEDS TOP OF RANGE
         RCB               IF =
         JMP%  XB%+3          OR IF <, VALUE IS OK; DO NORMAL RETURN

L2       EQU   *
         STA   VALUE
         PCL   UPBERR      REPORT UPPER BOUND ERROR
         AP    VALUE,S        GIVING ACTUAL VALUE
         AP    XB%+1,S        UPPER BOUND
         AP    XB%+2,S        SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL      AND NAME OF ROUTINE



* V$CIUPB -- CONSTANT UPPER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$CIUPB
*              JSXB  V$CIUPB
*              DATA  UPPER_BOUND
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              LDA   I
*              EXT   V$CIUPB
*              JSXB  V$CIUPB
*              DATA  10
*              DATA  14
*              TAX
*              LDA   ARRAY,X
*
*        A-REG IS RETURNED UNCHANGED IF IT IS <= UPPER BOUND
*
*        RANGE_ERROR EXCEPTION IS RAISED OTHERWISE


V$CIUPB  EQU   *
         CAS   XB%         COMPARE VALUE TO UPPER BOUND
         JMP#  L3          IF >, WE HAVE AN ERROR CONDITION
         RCB               IF =
         JMP%  XB%+2            OR IF <, WE RETURN NORMALLY

L3       EQU   *
         STA   VALUE
         PCL   UPBERR
         AP    VALUE,S
         AP    XB%,S
         AP    XB%+1,S
         AP    SB%+18,*
         AP    XB%+16,SL



* V$CILWB -- CONSTANT LOWER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$CILWB
*              JSXB  V$CILWB
*              DATA  LOWER_BOUND
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              LDA   I
*              EXT   V$CILWB
*              JSXB  V$CILWB
*              DATA  0
*              DATA  14
*              TAX
*              LDA   ARRAY,X
*
*        A-REG IS RETURNED UNCHANGED IF IT IS >= LOWER BOUND
*
*        RANGE_ERROR EXCEPTION IS RAISED OTHERWISE


V$CILWB  EQU   *
         CAS   XB%         COMPARE VALUE TO LOWER BOUND
         JMP#  L4          IF >
         JMP#  L4               OR IF =, WE RETURN NORMALLY

         STA   VALUE       OTHERWISE, WE REPORT AN ERROR
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    XB%,S       LOWER BOUND
         AP    XB%+1,S     LINE NUMBER IN SOURCE CODE
         AP    SB%+18,*
         AP    XB%+16,SL   NAME OF ROUTINE (FOLLOWING ECB)

L4       EQU   *
         JMP%  XB%+2



* V$VIRNG -- VARIABLE BOUNDS RANGE CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH LOWER BOUND
*              STORE A IN THE CURRENT STACK FRAME
*              LOAD A WITH UPPER BOUND
*              STORE A IN THE CURRENT STACK FRAME
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$VIRNG
*              JSXB  V$VIRNG
*              DATA  OFFSET_OF_LOWER_BOUND_IN_FRAME
*              DATA  OFFSET_OF_UPPER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDA   XB%+14
*              STA   SB%+21
*              LDA   XB%+15
*              STA   SB%+22
*              LDA   I
*              EXT   V$VIRNG
*              JSXB  V$VIRNG
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


V$VIRNG  EQU   *
         LDX   XB%      GET OFFSET OF LOWER BOUND
         CAS   SB%,X    COMPARE VALUE TO THE LOWER BOUND
         JMP#  L5       IF >, MOVE ON TO TEST UPPER BOUND
         JMP#  L5       (SAME FOR =)
         STA   VALUE    IF <, BUILD ARGUMENT LIST AND REPORT ERROR
         LDA   SB%,X
         STA   LWBVAL
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    LWBVAL,S    LOWER BOUND
         AP    XB%+2,S     SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND NAME OF ROUTINE

L5       EQU   *        BUILD A COLONY HERE
         LDX   XB%+1    GET OFFSET OF UPPER BOUND
         CAS   SB%,X    COMPARE VALUE TO THE UPPER BOUND
         JMP#  L6       IF >, WE REPORT AN ERROR
         RCB            OTHERWISE,
         JMP%  XB%+3    RETURN NORMALLY

L6       EQU   *
         STA   VALUE
         LDA   SB%,X
         STA   UPBVAL
         PCL   UPBERR   GENERATE AN INTELLIGIBLE ERROR MESSAGE
         AP    VALUE,S     CONTAINING THE INDEX VALUE
         AP    UPBVAL,S    THE ACTUAL UPPER BOUND
         AP    XB%+2,S     THE SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND THE NAME OF THE ERRANT ROUTINE



* V$VIUPB -- VARIABLE UPPER BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH UPPER BOUND
*              STORE A IN THE CURRENT STACK FRAME
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$VIUPB
*              JSXB  V$VIUPB
*              DATA  OFFSET_OF_UPPER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDA   XB%+15
*              STA   SB%+22
*              LDA   I
*              EXT   V$VIUPB
*              JSXB  V$VIUPB
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


V$VIUPB  EQU   *
         LDX   XB%      GET OFFSET OF UPPER BOUND
         CAS   SB%,X    COMPARE VALUE TO THE UPPER BOUND
         JMP#  L7       IF >, WE REPORT AN ERROR
         RCB            OTHERWISE,
         JMP%  XB%+2    RETURN NORMALLY

L7       EQU   *
         STA   VALUE
         LDA   SB%,X
         STA   UPBVAL
         PCL   UPBERR   GENERATE AN INTELLIGIBLE ERROR MESSAGE
         AP    VALUE,S     CONTAINING THE INDEX VALUE
         AP    UPBVAL,S    THE ACTUAL UPPER BOUND
         AP    XB%+1,S     THE SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND THE NAME OF THE ERRANT ROUTINE



* V$VILWB -- VARIABLE LOWER-BOUND CHECK
*
*        CALLING SEQUENCE:
*              LOAD A WITH LOWER BOUND
*              STORE A IN THE CURRENT STACK FRAME
*              LOAD A WITH VALUE TO BE CHECKED
*              EXT   V$VILWB
*              JSXB  V$VILWB
*              DATA  OFFSET_OF_LOWER_BOUND_IN_FRAME
*              DATA  SOURCE_LINE_NUMBER
*
*        EXAMPLE:
*              EAXB  DISPLAY1,*
*              LDA   XB%+14
*              STA   SB%+21
*              LDA   I
*              EXT   V$VILWB
*              JSXB  V$VILWB
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


V$VILWB  EQU   *
         LDX   XB%      GET OFFSET OF LOWER BOUND
         CAS   SB%,X    COMPARE VALUE TO THE LOWER BOUND
         JMP#  L8       IF >, MOVE ON TO TEST UPPER BOUND
         JMP#  L8       (SAME FOR =)

         STA   VALUE    IF <, BUILD ARGUMENT LIST AND REPORT ERROR
         LDA   SB%,X
         STA   LWBVAL
         PCL   LWBERR
         AP    VALUE,S     ACTUAL VALUE
         AP    LWBVAL,S    LOWER BOUND
         AP    XB%+1,S     SOURCE LINE NUMBER
         AP    SB%+18,*
         AP    XB%+16,SL   AND NAME OF ROUTINE

L8       EQU   *
         JMP%  XB%+2    NORMAL RETURN



* LWBERR -- REPORT LOWER-BOUND RANGE ERROR

LWBERR   ECB   LWBERR$,,LWBVALP,4

         DYNM  LWBVALP(3),LWBP(3),LWBLINEP(3),LWBNAMEP(3)

LWBMSG   DATA  C'Range check failed (*i < *i)'  32 CHAR LIMIT ON LIT. SIZE
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

UPBMSG   DATA  C'Range check failed (*i > *i)'
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
