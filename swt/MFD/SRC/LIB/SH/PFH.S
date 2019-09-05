*   R3POFH.PMA, DIRECV, Translator Group, 02/29/81
******* With Georgia Tech Modifications ********
*   Ring3 pointer fault snapper ( DYNT snapper )
*   Copyright (c) 1981, Prime Computer Inc., Natick, MA 01760
*
*   R3POFH - Ring 3 pointer fault handler. JDJ 03/17/80
*
*   Ring 3 shared library interface to pointer-fault handler (Rev. 17 version)
*   Copyright 1980, Prime Computer, Inc., Framingham, Ma.
*
*   This software is temporary in nature, and may not be supported by Prime
*   beyond Rev. 17.  Users are hereby advised not to use these tools to
*   build their own libraries unless they are willing to support the
*   implied mechanisms themselves, including changes to PRIMOS and SEG.
*
*
*   This routine is called by the ring 0 pointer fault handler SNAP$3
*     when a random user gets a pointer fault. We are expected to look into
*     our table of entry points and see if the user was calling a library
*     routine which we know about. If he is, we will setup his linkage frame
*     and return the location of the desired ECB. If the routine is not
*     found, return a zero.
*
*     If compiled with the 2/1 option, this routine will meter its usage
*       by incrementing a location in "ENT_TBL" every time a routine is
*       called ( the N'th location for the N'th routine ). This allows
*       us to meter which routines are called most often so we can redo
*       load orders in order to cut down on paging.
*
*   09/21/81 JDJ - The block that determines whether the library is
*                    initialized or not now lives in the command processor
*                    stack ( which we are running under on entry ).
*
       SEG
       RLIT
       SYML
include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"
include "=incl=/swt_com.s.i"
       SUBR    R3POFH,R3HECB
*
HESIZE EQU     6
METER  EQU     #101              B-REG Nonzero omplies metering
*
R3POFH ARGT

       LDA%    NAME,*            Get length
       A1A                       Convert to words
       ARL     1
       SMI                       Don't allow negative numbers.
       CAS     =4                Check for range 1-4
       JMP     FAIL              Nope - return 'not found'
       RCB                       ( nop )
       TAX
       STX     NAMLEN            Save away for later.
       CRL
*
*   Hash up the name to get a starting address within the table.
*
HASH1  ERA%    NAME,*X            /          A-REG: WORD(2) XOR WORD(4)
       IAB                       <   L-REG = B-REG: WORD(1) XOR WORD(3)
       BDX     HASH1              \
       SSP                       Insure positive result.
       PIDL
       DVL     HMOD              Take MOD( L-REG, HMOD )
       ILE
       XCB                       Get result in A-reg
       MPY     =HESIZE           Multiply by hash entry size ( =6 )
       XCB
       TAX
       EAXB    HTAB-6,X          Get addr of first try in table - 1.
*
NXTECB EAXB    XB%+6             Point to the next entry
*
       LDA     XB%
       BEQ     FAIL              Not found if name = 0.
       LDX     NAMLEN            Get length of dynt in words.
       JMP     *,X               Dispatch on length.
       JMP     CMP1              1 Word
       JMP     CMP2              2 Words
       JMP     CMP3              3 Words
*
CMP4   LDX     =3                Compare 4 words
       LDL     NAME,*X           Get last 2 words
       ERL     XB%+2             Compare with library entry
       BLNE    NXTECB            Br if no match.
*
CMP2   LDX     =1                Compare 2 words
       LDL     NAME,*X           Get 1st 2 words
       ERL     XB%               Compare with library entry
       BLNE    NXTECB            Br if no match
       JMP     SETUP
*
CMP3   LDX     =2                Compare 3 words
       LDL     NAME,*X           Get 2nd and 3rd words
       ERL     XB%+1             Compare with library entry
       BLNE    NXTECB            Br if no match
*
CMP1   LDX     =1                Compare 1 word
       LDA     NAME,*X           Get 1st word
       ERA     XB%               Compare with library entry
       BNE     NXTECB            Br if no match
*
SETUP  LDL     XB%+4             Match - Get ECB address
       STL     ECBADR            Save for link snapper.
       IFN     METER
*
*   Increment the counter for that particular routine. This is a metering
*     hack to determine what routines are called and how often.
*
       EAL     XB%+HESIZE        Point to next routine
       SBL     HTAB_IP           Calc ( Current + 1 ) - First
       DIV     =HESIZE           Get index into routine table
       TAX
       IRS     ENT_TBL_IP,*X     Increment usage count
       RCB                       ( prevent errors on skip )
       ENDC
*
*
* SET UP LINKAGE AREA
*
       LDX     =1
       LDA     SB%+1             Get stack root segment number.
       STA     PTRTMP
       LDA     PAKNO,*           GET PACKAGE NO.
       S1A                       START WITH 0
       CRB
       LRL     4                 A=WORD PART
       ADD     =4                LOCATION OF MASK WORD
       STA     PTRTMP+1
       CRA
       LLL     4                 GET BIT PART
       A1A
       TAX
       LT
       ARR     1                 POSITION BIT
       BDX     *-1
       TAB                       SAVE MASK BIT
       ANA%    PTRTMP,*          CHECK INITALIZATION BIT
       BNE     POFRET            1 MEANS INITALIZATION ALEADY DONE
       XCB                       GET MASK BIT
       ORA     PTRTMP,*          SET BIT
       STA%    PTRTMP,*
       LDA     LTLEN             ANYTHING TO COPY?
       BEQ     POFRET            NO, WE ARE DONE
       TAX     LTLEN             COPY LINKAGE TEMPLATE INTO LINKAGE AREA
       EAXB    LTSTRT,*
       EALB    LASTRT,*
COPLOP LDA     XB%-1,1
       STA     LB%-1,1
       BDX     COPLOP
POFRET LDL     ECBADR            L=ADDRESS OF ECB OF ROUTINE
       PRTN                      BACK TO FAULTING INSTRUCTION
*
FAIL   CRL                       0 = Not found
       PRTN
       IFN     METER
*
*   Pure link for the metering hack ( may be commented out ).
*
ENT_TBL_IP     EQU     *
       OCT     2036
       OCT     0
HTAB_IP        EQU     *
       IP      HTAB
       ENDC
*
R3HECB ECB     R3POFH,,NAME,3
*
*
       ENT     SEGBLK            FILLED IN BY SEG
SEGBLK EQU     *
LTSTRT BSS     2                 WILL BE IP TO LINKAGE TEMPLATE
LASTRT BSS     2                 WILL BE IP TO LINKAGE AREA
LTLEN  BSZ     1                 WILL BE LENGTH OF LINKAGE TEMPLATE  *GT
*
       FIN
*
* STACK DEFINITION
       DYNM    NAME(3),HISSB(3),PAKNO(3),PTRTMP(2),NAMLEN,ECBADR(2)
*
       include "hash_table"                                          *GT
*$INSERT HTAB.INS.PMA                                                *GT
*
       END
