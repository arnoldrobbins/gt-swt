* init_s --- make a static mode program look like recursive mode

            SUBR  INIT_S

            SEG
            RLIT

FREE_PTR    EQU   XB%+0          Free pointer
EXT_PTR     EQU   XB%+2          Extension pointer
NEW_FRAME   EQU   XB%+8          First frame on the stack

FRAME_FLAG  EQU   0              Offset of flag word
FRAME_ROOT  EQU   1              Offset of root segment
FRAME_PB    EQU   2              Offset of return address
FRAME_SB    EQU   4              Offset of previous stack frame address
FRAME_LB    EQU   6              Offset of previous link frame address
FRAME_KEYS  EQU   8              Offset of previous keys

ECB_PB      EQU   LB%+0          Start address
ECB_FRAME   EQU   LB%+2          Stack frame size
ECB_LB      EQU   LB%+6          Link frame address
ECB_KEYS    EQU   LB%+8          Initial keys

CLDATA$FLAGS   EQU   XB%+6       Offset of flags field
CLDATA$EXIT_SB EQU   XB%+0       Offset of exit_sb field
CLDATA$SM_FAULT_FR   EQU   XB%+90   Offset of sm_fault_fr field
* change to 91 to for Primos 19.4

include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"
include "=incl=/temp_com.s.i"
            EJCT
INIT_S      E64V

*  Insure we are being invoked by Primos:

            BNE   NEW_ROOT       Check for root specified in A register
            LDA   ROOT_PTR       Not specified, use default
NEW_ROOT    CRB                  Point to start of segment
            STL   ROOT_ADDR

            LDA   SB%+FRAME_ROOT
            ANA   ='7777         Be sure we are called from Primos
            ERA   ='6002
            BEQ   CALLER_OK
            PCL   TNOU_PTR,*
            AP    =C'SWT must be invoked from PRIMOS',S
            AP    =31,SL
            PRTN

CALLER_OK   EAXB  ROOT_ADDR,*    Address new stack segment through XB
            EALB  MAIN_PTR,*     Address MAIN's ecb through LB


*  Make sure specified root segment isn't already in use:

            LDL   FREE_PTR
            BLEQ  ROOT_OK        OK if free pointer is 0
            EAL   NEW_FRAME         or if it already points to
            ERL   FREE_PTR          the first frame
            BLEQ  ROOT_OK
            PCL   SIGNL_PTR,*    Root is in use, raise REENTER$
            AP    REENTER,S
            AP    NULL_PTR,S
            AP    =0,S
            AP    NULL_PTR,S
            AP    =0,S
            AP    ='140000,SL

*  If SIGNL$ returns, someone other that SWT is using the root
*  segment; complain and return to Primos.

            PCL   TNOUA_PTR,*
            AP    =C'Segment ',S
            AP    =8,SL
            PCL   TOOCT_PTR,*
            AP    ROOT_ADDR,SL
            PCL   TNOU_PTR,*
            AP    =C' is in use by other software.',S
            AP    =29,SL
            PCL   TNOUA_PTR,*
            AP    =C'Type "dels ',S
            AP    =11,SL
            PCL   TOOCT_PTR,*
            AP    ROOT_ADDR,SL
            PCL   TNOU_PTR,*
            AP    =C'!; rls -all" then try again',S
            AP    =26,SL
            PRTN

ROOT_OK     LDX   ECB_FRAME      Get size of MAIN's stack frame
            EAL   NEW_FRAME,X    Compute initial free pointer
            STL   FREE_PTR          and initialize it
            STA   NEW_FRAME+FRAME_ROOT    Set new frame's root segment

            CRL
            STL   EXT_PTR        No extension segment
            STL   EXT_PTR+2      Clear shared library init. flags
            STL   EXT_PTR+4
            STA   NEW_FRAME+FRAME_FLAG    Clear new frame's flag word


*  Copy control information from current frame to new frame so that
*  return from new frame will look like return from current one:

            LDL   SB%+FRAME_PB
            STL   NEW_FRAME+FRAME_PB
            LDL   SB%+FRAME_SB
            STL   NEW_FRAME+FRAME_SB
            LDL   SB%+FRAME_LB
            STL   NEW_FRAME+FRAME_LB
            LDL   SB%+FRAME_KEYS
            STL   NEW_FRAME+FRAME_KEYS


*  Modify current frame to describe MAIN so that return from current
*  frame will deallocate it and then invoke MAIN:

            LDL   ECB_PB
            STL   SB%+FRAME_PB
            EAL   NEW_FRAME
            STL   SB%+FRAME_SB
            LDL   ECB_LB
            STL   SB%+FRAME_LB
            LDA   ECB_KEYS
            STA   SB%+FRAME_KEYS


*  Invalidate cldata.sm_fault_fr and erase cldata.sm_used:

            EALB  INIT_ECB+FRAME_LB,*
            EAXB  CLDATAPTR
            EAXB  XB%,*
            LDL   =$FFF0000L
            STL   CLDATA$SM_FAULT_FR
            EAL   NEW_FRAME
            STL   CLDATA$EXIT_SB
            LDA   CLDATA$FLAGS
            ANA   ='173777
            STA   CLDATA$FLAGS


*  Deallocate current frame, and invoke MAIN:

            PRTN


ROOT_ADDR   BSS   2
NULL_PTR    DATA  '7777, 0
REENTER     DATA  8,C'REENTER$'

            EXT   ROOT_, MAIN, TNOU, TNOUA, TOOCT, SIGNL$
ROOT_PTR    IP    ROOT_
MAIN_PTR    IP    MAIN
TNOU_PTR    IP    TNOU
TNOUA_PTR   IP    TNOUA
TOOCT_PTR   IP    TOOCT
SIGNL_PTR   IP    SIGNL$

INIT_ECB    ECB   INIT_S
            END   INIT_S
