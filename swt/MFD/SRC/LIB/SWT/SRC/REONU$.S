* reonu$ --- on-unit for the REENTER$ condition

            SUBR     REONU$

            SEG
            RLIT

            LINK
REONU$      ECB      REENTER,,CFP,1
            DATA     6,C'REONU$'
            PROC

            DYNM     =20,CFP(3)
            DYNM     TARGET(4)

FRAME_PB    EQU      2              Offset of return address
FRAME_SB    EQU      4              Offset of previous stack frame address

TARGET_PB   EQU      TARGET
TARGET_SB   EQU      TARGET+2

REENTER     ARGT
            BLEQ     PRTN_          Make sure we're passed a static link
            ANA      ='7777         Mask out ring bits
            STL      TARGET_SB      Save locally

            EAXB     SB%            Point XB at our frame

VLOOP       EAXB     XB%+FRAME_SB,*    Point XB at caller's frame
            LDL      XB%+FRAME_SB   Check for end of stack...
            CLS      NULL           ...signified by null return SB
            JMP#     *+2
PRTN_       PRTN                    Target not found, can't reenter
            ANA      ='7777         Mask out ring bits
            ERL      TARGET_SB      See if he returns to target frame...
            BLNE     VLOOP          ...if not, check previous frame

            LDL      XB%+FRAME_PB   Construct a label for non-local goto
            IAB
            STL      TARGET_PB
            CALL     PL1$NL
            AP       TARGET,SL

NULL        DATA     '7777,0        Null pointer

            END
