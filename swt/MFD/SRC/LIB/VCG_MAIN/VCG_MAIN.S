* GENERAL-PURPOSE SEG MAIN PROGRAM
*     INVOKES USER ROUTINE 'MAIN'

            SEG
            RLIT
            SYML

            SUBR     MAIN$$
            EXT      MAIN

            LINK
MAIN$$      ECB      L1

            PROC
L1          EQU      *
            PCL      MAIN
            CALL     SWT
            PRTN

            END      MAIN$$
