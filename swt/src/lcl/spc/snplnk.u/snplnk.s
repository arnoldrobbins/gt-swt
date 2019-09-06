***         snplnk --- snap dynamic links in segments 2030-2037
*
*           Jeff Lee
*           feb 11, 1983
*
*           Snplnk snaps dynamic links in the 2030-2037 installation
*           defined shared segments. A dynamic link (to this program)
*           is defined to be a faulting pointer with a segment
*           in the 2030-2037 range that points to a pl/1 character
*           varying string containing only the characters 'A'..'Z',
*           '0'..'9', '$', and '_'. Anything else is ignored.
*           It is possible for the program to make a mistake, but
*           extremely unlikely.
*
*           Calling sequence:
*
*              snplnk 1/<segment> [2/1]
*
*           The "1/<segment>" argument is required. The optional
*           "2/1" argument causes the program to print the
*           addresses and name associated with a dynamic for
*           debugging purposes.

            REL
            D64V

SNPLNK      E64V                    ENTER 64V MODE

            BEQ      SNPLNK7        NO 'A' REGISTER SETTING SPECIFIED
            CAS#     ='2030-1       CHECK RANGE 2030-2037
            CAS#     ='2037+1
            JMP#     SNPLNK8
            JMP#     SNPLNK8

            IAB                     SAVE THE 'B' REGISTER FOR DEBUG
            STA      DEBUG
            XCB                     SAVE THE SEGMENT-# AND CLEAR WORD-#
            STL      PTR            POINTER TO SEGMENT START
            LDY      =0             USE 'Y' AS THE WORD OFFSET

SNPLNK1     LDL      PTR,*Y         GET THE NEXT SEGMENT
            STL      FPTR           SAVE A (HOPEFULLY) FAULTING PTR
            ANA      ='117770       MASK OUT RING AND LEAST OCTAL DIGIT
            CAS      ='102030       TEST FOR FAULTING PTR (2030-2037)
            JMP#     *+2
            JMP#     SNPLNK3        YES...LOOK FOR PL/1 VARY STRING

SNPLNK2     BIY      SNPLNK1        GO TO THE NEXT WORD
            PRTN

SNPLNK3     LDL      FPTR           GET THE POINTER
            SSP                     RESET THE FAULT BIT
            STL      TPTR           SAVE THE PL/1 STRING POINTER
            LDA      TPTR,*         GET THE CHAR COUNT (POSSIBLY)

            CAS      =1-1           COMPARE FOR 1 <= COUNT <= 8
            CAS      =8+1
            JMP#     SNPLNK2
            JMP#     SNPLNK2

            XCA                     TURN COUNT INTO LONG COUNT
            TLFL     0              PLACE IN FLR0
            LDL      =1L            ADD 1 TO THE STRING PTR (CHAR START)
            ADL      TPTR
            STL      TPTR
            EAFA     0,TPTR,*       PUT THE ADDRESS IN FAR0

SNPLNK4     LDC      0              GET THE NEXT CHARACTER
            BCEQ     SNPLNK5        IF NO MORE CHARACTERS SNAP LINK

            CAS      =R'A'-1        CHECK FOR BETWEEN 'A' AND 'Z'
            CAS      =R'Z'+1
            JMP#     *+3
            JMP#     *+2
            JMP#     SNPLNK4

            CAS      =R'0'-1        CHECK FOR BETWEEN '0' AND '9'
            CAS      =R'9'+1
            JMP#     *+3
            JMP#     *+2
            JMP#     SNPLNK4

            CAS      =R'$'          CHECK FOR '$'
            JMP#     *+2
            JMP#     SNPLNK4

            CAS      =R'_'          CHECK FOR '_'
            JMP#     *+2
            JMP#     SNPLNK4

            JMP      SNPLNK2        NONE OF ABOVE, ILLEGAL LINK

SNPLNK5     LDA      DEBUG          SEE IF DEBUG WAS SPECIFIED
            BEQ      SNPLNK6        NO...SKIP IT

            STY      SAVEY          SAVE THE 'Y' REGISTER
            EAL      PTR,*Y         GET THE LOCATION OF THE POINTER
            STL      FPTR

            PCL      IP_TNOUA,*
            AP       =C'Snapping ',S
            AP       =9,SL
            PCL      IP_TOOCT,*
            AP       FPTR,SL
            PCL      IP_TNOUA,*
            AP       =C'/',S
            AP       =1,SL
            PCL      IP_TOOCT,*
            AP       FPTR+1,SL
            PCL      IP_TNOUA,*
            AP       =C' (',S
            AP       =2,SL
            PCL      IP_TNOUA,*
            AP       TPTR,*S
            AP       TPTR,*
            AP       XB%-1,SL
            PCL      IP_TNOU,*
            AP       =C')',S
            AP       =1,SL

            LDY      SAVEY
SNPLNK6     EAXB     PTR,*Y         PREPARE TO SNAP LINK
            EAL      XB%,*          SNAP IT
            LDA      XB%            RETRIEVE THE SEGMENT NUMBER
            ANA      ='7777         CLEAR THE RING BITS
            STA      XB%            RESTORE IT
            JMP      SNPLNK2        GO TO THE NEXT ONE

SNPLNK7     PCL      IP_TNOU,*      MISSING 'A' REGISTER
            AP       =C'A register setting missing.',S
            AP       =27,SL
            PRTN

SNPLNK8     PCL      IP_TNOU,*
            AP       =C'Segment range is 2030-2037.',S
            AP       =27,SL
            PRTN

            EXT      TNOUA
IP_TNOUA    IP       TNOUA
            EXT      TOOCT
IP_TOOCT    IP       TOOCT
            EXT      TNOU
IP_TNOU     IP       TNOU

PTR         BSS      2
FPTR        BSS      2
TPTR        BSS      2
SAVEY       BSS      1
DEBUG       BSS      1

            END      SNPLNK
