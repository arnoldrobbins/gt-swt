*  LAST  ==> HIGH SPEED LAST N LINES LIST
*
*   3/9/80    EUGENE SPAFFORD
*   1/29/81    MODIFIED
*

            SUBR     LAST

            SEG
            RLIT
            SYML

* KEYS.INS.PMA, PRIMOS>INSERT, PRIMOS GROUP, 01/27/83
* SYSCOM>KEYS.P  MNEMONIC KEYS FOR FILE SYSTEM (PMA)
* Copyright (c) 1982, Prime Computer, Inc., Natick, MA 01760
       NLST
*
* NOTE: THIS FILE SHOULD AGREE EXACTLY WITH KEYS.INS.PLP AND KEYS.INS.PMA
*       THAT IS, BOTH THE INTEGER DECLARATIONS AND THE PARAMETER DECLARATIONS
*       SHOULD BE IN THE SAME ORDER AND INCLUDE THE SAME ITEMS.
*
* MODIFICATIONS:
* Date     Programmer   Description of modification
* 01/27/83 Kazin        Added K$SPEC to VINIT$ keys. [OSINFO 1362]
* 01/24/83 Kazin        Made agree with keys.ins.plp and keys.ins.ftn [OSI 1329]
* 10/25/82 Kazin        Added keys for dynamic storage manager. [OSI 1329]
* 11/15/82 Kroczak      Added k$trun key to satr$$.
* 10/11/82 Kroczak      Added K$DTLS key to SATR$$.
* 09/10/82 Kroczak      Added K$LTYP key to SATR$$ and K$RESV to SRCH$$
* 07/28/82 Kazin        Deleted K$RW, K$RWX, and K$GATE from VINIT$ keys.
* 07/03/82 Weinberg     Added keys for DIR$CR.
* 06/17/82 Kazin        Added k$dupl for vinit$.
* 05/21/82 Goggin       Added k$st$s, k$st$n, k$lonp, and k$nlop for event
* ........              logging module LGINI$.
* 04/29/82 Kazin        Added keys for SW$INT.
* 01/04/82 Slutz        Added new acl keys.
* 11/12/81 Weinberg     Added k$grp key for idchk$.
* 11/09/81 Weinberg     Removed non-standard error(!) code definitions in
* ........              MGSET$ section; added keys for R/W locks in SATR$$.
* 10/06/81 Weinberg     Removed initial attach point keys for ATCH$$;
* ........              ACL keys for RDEN$$; added keys for DIR$RD.
*
************************************************************            */
*                                                                       */
*                                                                       */
*      KEY DEFINITIONS                                                  */
*                                                                       */
*                                                                       */
********************* PRWF$$ *********************                      */
*              ****** RWKEY  ******                                     */
K$READ EQU    '1           /* READ                                      */
K$WRIT EQU    '2           /* WRITE                                     */
K$POSN EQU    '3           /* POSITION ONLY                             */
K$TRNC EQU    '4           /* TRUNCATE                                  */
K$RPOS EQU    '5           /* READ CURRENT POSITION                     */
*              ****** POSKEY ******                                     */
K$PRER EQU    '0           /* PRE-POSITION RELATIVE                     */
K$PREA EQU    '10          /* PRE-POSITION ABSOLUTE                     */
K$POSR EQU    '20          /* POST-POSITION RELATIVE                    */
K$POSA EQU    '30          /* POST-POSITION ABSOLUTE                    */
*              ****** MODE   ******                                     */
K$CONV EQU    '400         /* CONVENIENT NUMBER OF WORDS                */
K$FRCW EQU    '40000       /* FORCED WRITE TO DISK                      */
*                                                                       */
********************* SRCH$$ *********************                      */
*              ****** ACTION ******                                     */
* K$READ =    '1      /* OPEN FOR READ                                  */
* K$WRIT =    '2      /* OPEN FOR WRITE                                 */
K$RDWR EQU    '3           /* OPEN FOR READING AND WRITING              */
K$CLOS EQU    '4           /* CLOSE FILE UNIT                           */
K$DELE EQU    '5           /* DELETE FILE                               */
K$EXST EQU    '6           /* CHECK FILE'S EXISTENCE                    */
K$VMR  EQU    '20          /* OPEN FOR VMFA READ                        */
K$VMRW EQU    '60          /* OPEN FOR VMFA READ/WRITE                  */
K$GETU EQU    '40000       /* SYSTEM RETURNS UNIT NUMBER                */
K$RESV EQU    '100000      /* reserved                                  */
*              ****** REF    ******                                     */
K$IUFD EQU    '0           /* FILE ENTRY IS IN UFD                      */
K$ISEG EQU    '100         /* FILE ENTRY IS IN SEGMENT DIRECTORY        */
K$CACC EQU    '1000        /* CHANGE ACCESS                             */
*              ****** NEWFIL ******                                     */
K$NSAM EQU    '0           /* NEW SAM FILE                              */
K$NDAM EQU    '2000        /* NEW DAM FILE                              */
K$NSGS EQU    '4000        /* NEW SAM SEGMENT DIRECTORY                 */
K$NSGD EQU    '6000        /* NEW DAM SEGMENT DIRECTORY                 */
K$CURR EQU    '177777      /* CURRENTLY ATTACHED UFD                    */
*                                                                       */
********************* VINIT$ *********************                      */
*
K$ANY  EQU   '0            /* ACCEPT ANY SEGMENT NUMBERS                */
K$SPEC EQU   '1            /* USE SPECIFIED SEGMENTS                    */
K$DUPL EQU   '20           /* USE DUPLICATE SEGMENT NUMBERS             */
K$CNSC EQU   '10           /* CONSECUTIVE SEGMENTS REQUIRED             */
K$R    EQU   '2            /* READ ACCESS ON SEGMENT (^= K$READ!)       */
K$RX   EQU   '6            /* READ/EXECUTE ACCESS ON SEGMENT            */
*
********************* GETSN$, FIND_SEG *********************
*
K$DOWN EQU   '0            /* ALLOCATE DECREASING SEGMENT NUMBERS       */
K$UP   EQU   '1            /* ALLOCATE INCREASING SEGMENT NUMBERS       */
K$UPC  EQU   '2            /* ALLOCATE INCREASING CONSEC. SEGS.         */
K$DWNC EQU   '4            /* ALLOCATE DECREASING CONSEC. SEGS.         */
*
********************* ATCH$$ *********************                      */
*              ****** KEY    ******                                     */
K$IMFD EQU    '0           /* UFD IS IN MFD                             */
K$ICUR EQU    '2           /* UFD IS IN CURRENT UFD                     */
*              ****** KEYMOD ******                                     */
K$SETC EQU    '0           /* SET CURRENT UFD (DO NOT SET HOME)         */
K$SETH EQU    '1           /* SET HOME UFD (AS WELL AS CURRENT)         */
*              ****** NAME   ******                                     */
K$HOME EQU    '0           /* RETURN TO HOME UFD (KEY=K$IMFD)           */
*              ****** LDISK  ******                                     */
K$ALLD EQU    '100000      /* SEARCH ALL DISKS                          */
* K$CURR =    '177777 /* SEARCH MFD OF CURRENT DISK                     */
*                                                                       */
*********************** AC$SET ***********************                  */
*                                                                       */
* K$ANY EQU   '0            /* Do it regardless                         */
K$CREA EQU    '1            /* Create new ACL (error if already exists) */
K$REP  EQU    '2            /* Replace existing ACL (error if does not exist)*/
*                                                                       */
********************* SGDR$$ *********************                      */
*              ****** KEY    ******                                     */
K$SPOS EQU    '1           /* POSITION TO ENTRY NUMBER IN SEGDIR        */
K$GOND EQU    '2           /* POSITION TO END OF SEGDIR                 */
K$GPOS EQU    '3           /* RETURN CURRENT ENTRY NUMBER               */
K$MSIZ EQU    '4           /* MAKE SEGDIR GIVEN NR OF ENTRIES           */
K$MVNT EQU    '5           /* MOVE FILE ENTRY TO DIFFERENT POSITION     */
K$FULL EQU    '6           /* POSITION TO NEXT NON-EMPTY ENTRY          */
K$FREE EQU    '7           /* POSITION TO NEXT FREE ENTRY               */
*                                                                       */
********************* RDEN$$ *********************                      */
*              ****** KEY    ******                                     */
* K$READ =    '1      /* READ NEXT ENTRY                                */
K$RSUB EQU    '2           /* READ NEXT SUB-ENTRY                       */
* K$GPOS =    '3      /* RETURN CURRENT POSITION IN UFD                 */
K$UPOS EQU    '4           /* POSITION IN UFD                           */
K$NAME EQU    '5           /* READ ENTRY SPECIFIED BY NAME              */
*                                                                       */
********************************* DIR$RD ****************************** */
*                                                                       */
* K$READ EQU  '1           /* Read next entry                           */
K$INIT EQU    '2           /* Initialize directory (read header)        */
*                                                                       */
********************* SATR$$ *********************                      */
*              ****** KEY    ******                                     */
K$PROT EQU    '1           /* SET PROTECTION                            */
K$DTIM EQU    '2           /* SET DATE/TIME MODIFIED                    */
K$DMPB EQU    '3           /* SET DUMPED BIT                            */
K$RWLK EQU    '4           /* SET PER FILE READ/WRITE LOCK              */
K$SOWN EQU    '5           /* SET OWNER FIELD                           */
K$SDL  EQU    '6           /* SET ACL/DELETE SWITCH                     */
K$LTYP EQU    '7           /* set logical file type                     */
K$DTLS EQU    '10          /* set date/time last saved                  */
K$TRUN EQU    '11          /* set truncated by FIX_DISK bit             */
*                  ****** RWLOCK ******                                 */
K$DFLT EQU    '0           /* Use system default value                  */
K$EXCL EQU    '1           /* N readers OR one writer                   */
K$UPDT EQU    '2           /* N readers AND one writer                  */
K$NONE EQU    '3           /* N readers AND N writers                   */
*                                                                       */
********************* ERRPR$ *********************                      */
*              ****** KEY    ******                                     */
K$NRTN EQU    '0           /* NEVER RETURN TO USER                      */
K$SRTN EQU    '1           /* RETURN AFTER START COMMAND                */
K$IRTN EQU    '2           /* IMMEDIATE RETURN TO USER                  */
*                                                                       */
********************* LIMIT$ *************************                  */
*              ****** KEY    ******                                     */
* K$READ =    '0      /* RETURNS INFORMATION                            */
* K$WRIT =    '1      /* SETS INFORMATION                               */
*              ****** SUBKEY ******                                     */
K$CPLM EQU    '400         /* CPU TIME IN SECONDS                       */
K$LGLM EQU    '1000        /* LOGIN TIME IN MINUTES                     */
*                                                                       */
********************* GPATH$ ************************                   */
*              ****** KEY    ******                                     */
K$UNIT EQU    '1           /* GET PATHNAME BASED ON UNIT ARG            */
K$CURA EQU    '2           /* PATHNAME OF CURENT ATTACH POINT           */
K$HOMA EQU    '3           /* PATHNAME OF HOME ATTACH POINT             */
K$INIA EQU    '4           /* Pathname of initial attach point          */
*                                                                       */
********************* MGSET$/MSG$ST ************************            */
*              ****** KEY    ******                                     */
K$ACPT EQU    0            /* M -ACCEPT                                 */
K$DEFR EQU    1            /* M -DEFER                                  */
K$RJCT EQU    2            /* M -REJECT                                 */
*
********************* FNSID$ *******************************            */
*                                                                       */
K$LIST EQU    1            /* List all remote id's                      */
K$ADD  EQU    2            /* Add to existing list                      */
K$SRCH EQU    3            /* Search for specific node                  */
*                                                                       */
********************** KEYS FOR RESUME FUNCTIONALITY FOR EPFS ********* */
***************************** STR$AL, STR$FR ************************** */
*                                                                       */
K$PROC EQU    1            /* storage types: per process storage        */
K$LEVL EQU    2            /* per level                                 */
K$PROG EQU    3            /* per program                               */
K$SYST EQU    4            /* per system                                */
K$FRBK EQU    5            /* free a block of storage                   */
K$ANYW EQU    -1           /* base the storage block anywhere           */
K$ZERO EQU    0            /* base the storage block at word zero       */
*
****************************** R$MAP, R$INIT, R$ALLC ****************** */
****************************** R$RUN, R$INVK, R$DEL  ****************** */
*                                                                       */
K$COPY EQU    1            /* copy epf file into temp segs              */
K$DBG  EQU    2            /* map dbg info into memory                  */
K$INAL EQU    1            /* init all of the linkage area              */
K$REIN EQU    2            /* reinit some of the epf's linkage          */
K$INVK EQU    0            /* invoke and delete epf from memory         */
K$IVND EQU    1            /* invoke and do not delete epf from memory  */
K$REST EQU    2            /* do not invoke epf, just restore           */
*                                                                       */
********************** DYNAMIC STORAGE MANAGER ************************ */
*                                                                       */
*K$PROC EQU   1            /* storage types: per process                */
*K$LEVL EQU   2            /* per level                                 */
K$USER EQU    3            /* per user                                  */
*K$SYST EQU   4            /* per system                                */
*                                                                       */
******************** FNCHK$, TNCHK$, IDCHK$, PWCHK$ ******************* */
*                                                                       */
K$UPRC EQU    1            /* Mask to uppercase                         */
K$WLDC EQU    2            /* Allow wildcards (not PWCHK$)              */
K$NULL EQU    4            /* Allow null names                          */
K$NUM  EQU    8            /* Allow numeric names (FNCHK$ only)         */
K$GRP  EQU    8            /* Check group name (IDCHK$ only)            */
*                                                                       */
***************************** Q$SET *********************************** */
*                                                                       */
K$SMAX EQU    1            /* Set max quota                             */
*                                                                       */
***************************** LGINI$ ************************************/
*                                                                       */
K$LOF   EQU    0           /* Turn OS logging off                       */
K$NLOF  EQU    1           /* Turn network logging off                  */
K$LON   EQU    2           /* OS logging on                             */
K$NLON  EQU    3           /* Network logging on                        */
K$LONP  EQU    4           /* Turn sys logging on, use previous file    */
K$NLOP  EQU    5           /* Turn net logging on, use previous file    */
K$ST$S  EQU    6           /* Return status of system event logging     */
K$ST$N  EQU    7           /* Return status of network event logging    */
*                                                                       */
******************************** LDISK$ ******************************* */
*                                                                       */
K$ALL   EQU    0           /* return all disks                          */
K$LOCL  EQU    1           /* local disks only                          */
K$REM   EQU    2           /* remote disks only                         */
K$SYS   EQU    3           /* disks from specified system               */
*                                                                       */
**************************** SW$INT *************************************/
*                                                                       */
*K$READ EQU   1            /* Read present status                       */
K$ON   EQU    2            /* Turn on interrupt(s)                      */
K$OFF  EQU    3            /* Turn off interrupt(s)                     */
K$RDON EQU    4            /* Read present status and                   */
*                          /* turn on interrupt(s)                      */
K$RDOF EQU    5            /* Read present status and                   */
*                             turn off interrupt(s)                     */
K$RDAL EQU    6            /* Read present status of all interrupts     */
K$ALON EQU    7            /* Turn on all interrupts                    */
K$ALOF EQU    8            /* Turn off all interrupts                   */
K$RAON EQU    9            /* Read present status and                   */
*                             turn on all interrupts                    */
K$RAOF EQU    10           /* Read present status and                   */
*                             turn off all interrupts                   */
*                                                                       */
********************************** DIR$CR ***************************** */
*                                                                       */
K$SAME EQU    0            /* Create a directory of parent's type       */
K$PWD  EQU    1            /* Create a password directory               */
*                                                                       */
************************************************************            */

       LIST

            LINK
LAST        ECB      START,,FUNIT,2
            DATA     4,C'LAST'
            PROC

            LINK
BUFFER      BSS      1024
IP_BUFF     IP       BUFFER
GARBAGE     COMM     PLACE('170000)
            PROC

            DYNM     ERCODE, POS(2), NW, COUNT(2)
            DYNM     PCOUNT, FUNIT(3), NLINES(3)

START       ARGT
            LDA      NLINES,*
            SPL
            LT
            A1A
            STA      NLINES
            ALS      1
            TXA
            LDL      =1L
            STL      POS
            CRL
            STL      COUNT
            STL      PLACE
            STA      PCOUNT
ZZ          STA      PLACE - 2,X
            BDX      ZZ
*
*
LOOP        CALL     PRWF$$
            AP       =K$READ+K$PRER+K$CONV,S
            AP       FUNIT,*S
            AP       IP_BUFF,S
            AP       =1024,S
            AP       =0L,S
            AP       NW,S
            AP       ERCODE,SL
*
*
            LDA      NW
            BEQ      DONE
            TAX
            TCA
            TAY
            EAXB     BUFFER + 0,X
            TXA
            PIDA
            ADL      POS
            STL      POS
*
LOOP2       LDA      XB% + 0,Y
            ERA      ='105212
            TAB
            CAR
            BEQ      INCR
RCHAR       TBA
            CAL
            BNE      NXTWRD
INCR        IRS#     COUNT + 1
            JMP#     * + 2
            IRS#     COUNT
            LDA      PCOUNT
            A1A
            CAS      NLINES
            RCB
            CRA
            STA      PCOUNT
            FLX      PCOUNT
            TYA
            PIDA
            ADL      POS
            STL      PLACE,X
NXTWRD      BIY      LOOP2
            JMP      LOOP
*
*
*   OKAY, TELL HOW MANY LINES WE HAVE AND PRINT THE LAST LINES...
*
DONE        LDA      PCOUNT
            A1A
            CAS      NLINES
            RCB
            CRA
            STA      PCOUNT
            FLX      PCOUNT
            LDL      PLACE,X
            STL      POS
*
            CALL     PRWF$$
            AP       =K$POSN+K$PREA,S
            AP       FUNIT,*S
            AP       =0,S
            AP       =0,S
            AP       POS,S
            AP       NW,S
            AP       ERCODE,SL
*
            LDA      ERCODE
            BEQ      L2
            LDA      =-1L
            PRTN
*
L2          LDL      COUNT
            PRTN
*
            END
