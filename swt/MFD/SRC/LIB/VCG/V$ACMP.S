* V$ACMP -- COMPARE ARRAYS A1 AND A2, RETURN <0 FOR A1<A2,
*                                             0 FOR A1=A2,
*                                            >0 FOR A1>A2
*
* CALLING SEQUENCE:
*        CALL  V$ACMP
*        AP    A1,S
*        AP    A2,S
*        AP    LENGTH,SL   (LENGTH MUST BE 0-65535, AND IS 1 LESS
*                          THEN THE ACTUAL ARRAY LENGTH)

         SEG
         RLIT
         SYML

         SUBR  V$ACMP

V$ACMP   ECB   START,,A1P,3
         DYNM  A1P(3),A2P(3),LENP(3)

START    EQU   *
         ARGT
         EALB  A1P,*       LOAD LINK BASE REGISTER WITH POINTER TO A1
         EALB  LB%-'400    OFFSET BY 256 TO FORCE SHORT ADDRESSING MODE

         EAXB  A2P,*       LOAD AUX. BASE REGISTER WITH POINTER TO A2

         CRA
         TAX               INDEX FIRST ARRAY ELEMENT

         LDA   LENP,*      GET LENGTH - 1
         A1A
         TAY               USE Y INDEX REGISTER AS THE ELEMENT COUNTER

LOOP     EQU   *
         LDA   LB%+'400,X  GET ELEMENT OF FIRST ARRAY
         SUB   XB%,X       SUBTRACT ELEMENT OF SECOND ARRAY
         BNE   EXIT        IF NON-ZERO, WE HAVE THE DESIRED RESULT
         IRX               ADVANCE TO NEXT ELEMENT
         RCB                  (JUST IN CASE X = 0)
         BDY   LOOP        REPEAT UNTIL ALL ELEMENTS HAVE BEEN TESTED

EXIT     EQU   *
         PRTN              RETURN WITH RESULT OF LAST COMPARISON IN A-REG

         END
