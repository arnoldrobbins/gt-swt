* CHARS --- CHARACTER INSERT AND REMOVE FUNCTIONS
*    EHS  02/17/82
*
*
*    CALLING INFORMATION
*
*           CHAR = GET$XS (LINE, PTR)
*           CALL PUT$XS (LINE, PTR, CHAR)
*
*    WHERE
*
*           LINE IS AN ARRAY OF PACKED BYTES
*           PTR IS A BYTE (CHARACTER) POSITION IN THE LINE
*              (1 IS THE FIRST POSITION)
*
*   THE CHARACTER RETURNED BY GET$XS IS IN THE LEAST SIGNIFICANT
*       BYTE OF CHAR (CHAR IS ASSUMED TO BE 1 WORD LONG)
*   THE CHARACTER SENT INTO PUT$XS IS ASSUMED TO BE IN THE LEAST
*       SIGNIFICANT BYTE OF CHAR
*
*   BOTH ROUTINES NEED 4 WORDS OF TEMPORARY STORAGE AT THE USUAL
*      LOCATION IN THE STACK (SB% + '24)
*
*
            D64V
            REL

POINTEMP    EQU      SB% + '24
RETURN      EQU      SB% + '26
LINE        EQU      XB% + 0
PTR         EQU      XB% + 3
CHAR        EQU      XB% + 6

' get$xs --- get a byte from a line

            ENT      GET$XS
GET$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA      PTR,*
            S1A
            ARS      1
            TAX
            LDA      LINE,*X
            SSC
            ICA
            CAL
            JMP      RETURN,*

' put$xs --- put a byte into a packed line

            ENT      PUT$XS
PUT$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA      PTR,*
            S1A
            ARS      1
            TAX
            LDA      CHAR,*
            CAL
            IMA      LINE,*X
            SSC
            ICA
            CAR
            ORA      LINE,*X
            SSC
            ICA
            STA      LINE,*X
            JMP      RETURN,*
            END
* KEYS --- DO CPU KEYS MANIPULATION AS SHORTCALLS
*    EHS  02/17/82
*
*
*    CALLING INFORMATION
*
*           CALL GKY$XS (WORD)   /* TO GET CURRENT KEYS
*           CALL SKY$XS (WORD)   /* TO SET CURRENT KEYS
*
*    WHERE
*
*           WORD IS AN INTEGER TO CONTAIN KEYS
*
*    BOTH SHORTCALL REQUIRES 2 WORDS OF TEMPORARY STACK SPACE
*        AT THE USUAL LOCATION (SB% + '24)
*
            D64V
            REL

POINTEMP    EQU      SB% + '24

' gky$xs --- shortcall to get keys

            ENT      GKY$XS
GKY$XS      EQU      *
            STL      POINTEMP
            TKA
            STA%     POINTEMP,*
            JMP%     XB% + 0

' sky$xs --- shortcall to change keys

            ENT      SKY$XS
SKY$XS      EQU      *
            STL      POINTEMP
            LDA%     POINTEMP,*
            TAK
            JMP%     XB% + 0
            END
* POKEPEEK --- PLAY WITH MEMORY DIRECTLY AS SHORTCALLS
*    EHS  02/17/82
*
*
*    CALLING INFORMATION
*
*           CALL POK$XS (ADDR, VALUE)
*           CALL PEK$XS (ADDR, VALUE)
*
*    WHERE
*
*           ADDR IS A TWO WORD VIRTUAL MEMORY ADDRESS
*           VALUE IS A ONE-WORD QUANTITY
*
*
*    BOTH ROUTINES NEED 4 WORDS OF TEMPORARY STACK SPACE AT THE
*      USUAL LOCATION (SB% + '24)
*
            D64V
            REL

POINTEMP    EQU      SB% + '24
RETURN      EQU      SB% + '26
ADDR        EQU      XB% + 0
VALUE       EQU      XB% + 3

' pek$xs --- get a word from memory

            ENT      PEK$XS
PEK$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA%     ADDR,*
            STA%     VALUE,*
            JMP%     RETURN,*

' pok$xs --- put a word into memory

            ENT      POK$XS
POK$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA%     VALUE,*
            STA%     ADDR,*
            JMP%     RETURN
            END
* QUEUE --- QUEUE OPERATIONS AS SHORTCALLS
*      EHS  02/17/82
*
*
*    CALLING INFORMATION
*
*           FLAG = ATQ$XS (QUEUCB, WORD)
*           FLAG = ABQ$XS (QUEUCB, WORD)
*           FLAG = RTQ$XS (QUEUCB, WORD)
*           FLAG = RBQ$XS (QUEUCB, WORD)
*           FLAG = TSQ$XS (QUEUCB, COUNT)
*
*     WHERE
*           QUEUCB IS A QUEUE CONTROL BLOCK
*           WORD IS INTEGER*2 DATA WORD
*           FLAG GETS SET TO TRUE (1) FOR SUCCESS
*              (NON-EMPTY IN CASE OF TSQ$XS)
*           FLAG GETS RESET TO FALSE (0) FOR NO SUCCESS
*              (EMPTY IN CASE OF TSQ$XS)
*
*     EACH OPERATION REQUIRES 4 TEMPORARY WORDS ON THE STACK
*        AT THE STANDARD LOCATION (SB% + '24)
*
            D64V
            REL

POINTEMP    EQU      SB% + '24
RETURN      EQU      SB% + '26
QUEUCB      EQU      XB% + 0
WORD        EQU      XB% + 3

' atq$xs --- add to top of specified queue

            ENT      ATQ$XS
ATQ$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA      WORD,*
            ATQ      QUEUCB,*
            LCNE
            JMP%     RETURN,*

' abq$xs --- add to bottom of specified queue

            ENT      ABQ$XS
ABQ$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA      WORD,*
            ABQ      QUEUCB,*
            LCNE
            JMP%     RETURN,*

' rtq$xs --- remove from top of specified queue

            ENT      RTQ$XS
RTQ$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA      WORD,*
            ATQ      QUEUCB,*
            LCNE
            JMP%     RETURN,*

' rbq$xs --- remove from bottom of specified queue

            ENT      RBQ$XS
RBQ$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA      WORD,*
            ABQ      QUEUCB,*
            LCNE
            JMP%     RETURN,*

' tsq$xs --- test a queue for entries

            ENT      TSQ$XS
TSQ$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            TSTQ     QUEUCB,*
            STA      WORD,*
            LCNE
            JMP%     RETURN,*
            END
* STACK --- SET STACK EXTENSION POINTER AS A SHORTCALL
*    EHS  02/17/82
*
*
*     CALLING INFORMATION
*
*           CALL STK$XS (STACK, ADDR)
*
*     WHERE
*
*           STACK IS THE STACK ROOT SEGMENT
*           ADDR IS A 2 WORD ADDRESS OF THE LOCATION OF THE
*              STACK EXTENSION AREA
*
*           IF STACK IS ZERO, THEN THE CURRENT STACK ROOT IS USED
*           IF STACK IS NEGATIVE, THEN THE CALL RETURNS THE
*             ADDRESS OF THE CURRENT EXTENSION IN "ADDR"
*             ('100000 IMPLIES CURRENT STACK)
*
*    THE CALL USES 4 WORDS OF TEMPORARY STACK SPACE AT THE USUAL
*        LOCATION (SB% + '24)
*
*
            D64V
            REL

POINTEMP    EQU      SB% + '24
RETURN      EQU      SB% + '26
STACK       EQU      XB% + 0
ADDR        EQU      XB% + 3

' stk$xs --- set stack extension pointer as a shortcall

            ENT      STK$XS
STK$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA%     STACK,*
            CAZ
            JMP%     STORE
            SKP
            JMP%     READ
*
*   USE CURRENT STACK ROOT
*
            LDA      SB% + 1
*
STORE       EQU      *
            CRB
            EAXB     ADDR,*
            STL      POINTEMP
            LDL%     XB% + 0
            STL%     POINTEMP,*
            JMP%     RETURN,*
*
*   FETCH CURRENT EXTENSION POINTER
*
READ        EQU      *
            EAXB     ADDR,*
            IAB
            CRA
            A2A
            IAB
            CHS
            BEQ      READCUR
            CHS
            TCA
            JMP      DOREAD
READCUR     EQU      *
            LDA      SB% + 1
DOREAD      STL      POINTEMP
            LDL%     POINTEMP,*
            STL%     XB% + 0
            JMP%     RETURN,*
            END
* STOREC --- STORE A VARIABLE IN CONCURRENT ENVIRONMENT
*    EHS  02/17/82
*
*
*     CALLING INFORMATION
*
*           FLAG = S1C$XS (ADDR, IWORD, IOLDVL)  /* STORE 1 WORD QUANTITY
*           FLAG = S2C$XS (ADDR, LWORD, LOLDVL)  /* STORE 2 WORD QUANTITY
*
*     WHERE
*           ADDR IS A TWO WORD VIRTUAL MEMORY ADDRESS
*              AS IN LOC(VARIABLE)
*
*    IF THE VALUE IN THE VARIABLE AT THE TIME OF THE STORE IS
*       NOT THE SAME AS THE SUPPLIED OLD VALUE (OLDVAL), THEN
*       THE STORE IS NOT DONE AND THE FUNCTION RETURN IS FALSE.
*       IF THE STORE IS SUCCESSFUL, THE THE FUNCTION RETURN IS TRUE.
*
*    EACH ROUTINE REQUIRES 4 WORDS OF TEMPORARY STACK SPACE
*        AT THE USUAL LOCATION (SB% + '24)
*
*
            D64V
            REL

POINTEMP    EQU      SB% + '24
RETURN      EQU      SB% + '26
ADDR        EQU      XB% + 0
VALUE       EQU      XB% + 3
OLDVAL      EQU      XB% + 6

' s1c$xs --- store single word variable

            ENT      S1C$XS
S1C$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA      OLDVAL,*
            TAB
            LDA      VALUE,*
            STAC     ADDR,*
            LCEQ
            JMP%     RETURN,*

' s2c$xs --- store double word variable

            ENT      S2C$XS
S2C$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDL      OLDVAL,*
            ILE
            LDL      VALUE,*
            STLC     ADDR,*
            LCEQ
            JMP%     RETURN,*
            END
* READYC --- IF A CHARACTER IS WAITING, FETCH IT
*    EHS  02/27/82
*
*    CALLING INFORMATION:
*
*           FLAG = RDY$XS (CHAR)
*
*    WHERE
*
*           FLAG IS A BOOLEAN VARIABLE SET TO ".TRUE." IF THERE WAS
*              A CHARACTER WAITING, ".FALSE." OTHERWISE
*           CHAR IS A CHARACTER VARIABLE WHICH GETS SET TO THE
*              CHARACTER WHICH WAS WAITING IF THE FUNCTION IS .TRUE.
*
*
*    THE FUNCTION REQUIRES FOUR WORDS OF TEMPORARY STORAGE ON THE
*       STACK AT THE USUAL LOCATIONS (SB% + '24 TO SB% + '27).
*
*
            SEG

' rdy$xs --- if a character is waiting, fetch it

            ENT      RDY$XS
RDY$XS      EQU      *
            STL      SB% + '24
            EAL      XB% + 0
            STL      SB% + '26
            E64R:D64R
            LT
            SKS      '704           THE FAULT HANDLER TAKES CARE OF THIS
            CRA
            E64V:D64V
            BEQ      DONE
            PCL      IP_T1IN,*      FETCH THE CHARACTER
            AP       SB% + '24,*SL
            LT
DONE        EQU      *
            JMP      SB% + '26,*

            EXT      T1IN
IP_T1IN     IP       T1IN
            END
* MAKE QUEUE --- MAKE A QUEUE IN GIVEN AREA, RETURN CONTROL BLOCK
*    EHS 02/27/82
*
*    CALLING INFORMATION
*
*           SIZE = MKQ$XS (ADDR, ROOM, CONTROL)
*
*    WHERE
*
*           ADDR IS A TWO WORD POINTER IN MEMORY
*           ROOM IS THE AMOUNT OF FREE SPACE AVAILABLE
*           CONTROL IS THE RETURNED CONTROL BLOCK
*
*    REQUIRES 4 WORDS OF TEMPORARY STORAGE ON THE STACK
*     AT THE USUAL LOCATION FOR SHORT CALLS (SB% + '24)
*
*
            SEG
            RLIT

POINTEMP    EQU      SB% + '24
RETURN      EQU      SB% + '26
ROOM        EQU      SB% + '24
AREA        EQU      SB% + '25
CONTROL     EQU      XB% + 0

' mkq$xs --- make a queue in given area, return control block

            ENT      MKQ$XS
MKQ$XS      EQU      *
            STL      POINTEMP
            EAL      XB% + 0
            STL      RETURN
            EAXB     POINTEMP,*
            LDA      XB% + 3,*
            STA      ROOM
            LDL      XB% + 0,*
            EAXB     XB% + 6,*
            ANA      ='7777
            CHS
            STA      CONTROL + 2
            TBA
            STA      AREA
            LDA      ROOM
            LDX      =0
            ARL      4
            BEQ      BAD
*
LOOP        EQU      *
            ARL      1
            BEQ      SIZED
            BIX      LOOP
*
SIZED       EQU      *
            LDA      POWERS,X
            S1A
            STA      CONTROL + 3
            ADD      AREA
            STA      CONTROL
            LDA      POWERS,X
            TCA
            ANA      CONTROL
            STA      CONTROL
            STA      CONTROL + 1
            SUB      AREA
            ADD      POWERS,X
            SUB      ROOM
            BLE      OKAY
            TXA
            BEQ      BAD
            DRX
            RCB
            JMP      SIZED
*
OKAY        EQU      *
            LDA      CONTROL + 3
            JMP%     RETURN,*
*
BAD         EQU      *
            CRA
            JMP%     RETURN,*
*
POWERS      OCT      20,40,100,200,400,1000,2000,4000
            OCT      10000,20000,40000,100000
            END
