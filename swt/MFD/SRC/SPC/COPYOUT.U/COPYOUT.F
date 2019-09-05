      INTEGER INFO(29),BUF(1000),CODE,I
      DO 10000 I=1,29
        INFO(I)='  '
10000 CONTINUE
10001 INFO(3)=1024
      CALL SPOOL$(2,'BATCH_OUTPUT',12,INFO,BUF,1000,CODE)
      CALL ERRPR$(:2,CODE,'spool',5,'copyout',7)
      CALL T1OU(140)
      CALL SWT
      END
C ---- Long Name Map ----
C SPOOL$.F, =src=/spc/copyout.u, TLC, 09/16/83
C
C SPOOL$.FTN, SPOOL>SOURCE, GAM-JCB, 06/29/81
C Insert entry into spool queue
C Copyright (c) 1979, Prime Computer, Inc., Wellesley, MA 02181
C
       SUBROUTINE SPOOL$(KEY,NAME,NAMLEN,INFO,BUF,BUFLEN,CODE)
C
       INTEGER  KEY,    /* ACTION KEY:
C                            1 - COPY (NAME) INTO QUEUE
C                            2 - OPEN FILE ON UNIT (INFO(2)) IN QUEUE
     +          NAME,   /* FILE NAME TO BE COPIED AND/OR NAME TO APPEAR ON
C                          HEADER PAGE WHEN FILE IS PRINTED
     +          NAMLEN, /* LENGTH OF (NAME)
     +          INFO(1),/* INFORMATION ARRAY, 29 ELEMENTS, AS FOLLOWS:
C                            1    - OBSOLETE
C                            2    - OPEN PRINT FILE ON THIS UNIT (KEY=2)
C                            3    - PRINT OPTION WORD, SEE BELOW
C                           4-6   - FORM TYPE DESIGNATION (ASCII, 1-6 CHAR'S)
C                            7    - WORDS PER RASTER SCAN (PLOT MODE ONLY)
C                           8-10  - SPOOL FILE NAME (RETURNED)
C                            11   - DEFERRED PRINT TIME
C                            12   - FILE SIZE (RETURNED IF KEY=1)
C                          13-20  - STRING SPECIFYING LOGICAL LOCATION FOR
C                                   OUTPUT (ASCII, 16 CHAR'S, BLANK FILLED)
C                          21-28  - STRING TO USE AS REPLACEMENT FOR (NAME) ON
C                                   HEADER PAGE (16 CHAR'S, BLANK FILLED)
C                            29   - NUMBER OF COPIES
     +          BUF(1), /* SCRATCH BUFFER - THIS IS USED TO SET UP CONTROL INFO
C                          & COPY THE SPOOL FILE (KEY=1).  IT MUST BE AT LEAST
C                          40 WORDS LONG.  COPY TIME IS INVERSELY PROPOR-
C                          TIONAL TO BUFFER SIZE - NOMINAL SIZE IS 300-1000.
     +          BUFLEN, /* LENGTH OF (BUF)
     +          CODE    /* RETURN CODE (NON-ZERO IF ERROR OCCURRED)
C
C   THE PRINT OPTION WORD (INFO(3)) SPECIFIES VARIOUS PRINT(/PLOT) INFORMATION
C   AND IS SET UP AS FOLLOWS:
C
C         BIT   DESIGNATION
C         ---   -----------
C          1    FORTRAN FORMAT CONTROL
C          2    EXPAND COMPRESSED LISTING
C          3    GENERATE LINE #'S AT LEFT MARGIN
C          4    SUPPRESS HEADER PAGE
C          5    DON'T EJECT PAGE WHEN DONE
C          6    NO FORMAT CONTROL
C          7    PLOT THIS FILE - INFO(7) SPECIFIES WORDS/RASTER SCAN
C          8    DON'T PRINT THIS FILE UNTIL THE TIME SPECIFIED IN INFO(11)
C          9    FORCE THIS FILE TO PRINT ON HOME PRINTER
C         10    PRINT/PLOT FILE AT LOCATION SPECIFIED BY STRING AT INFO(13)
C         11    REPLACE (NAME) WITH STRING AT INFO(21)
C         12    OUTPUT THE NUMBER OF COPIES SPECIFIED IN INFO(29)
C         16    USE HASP CARRIAGE CONTROL
C
       INTEGER SPLDIR(3),SPLPAS(3),CODE,QENTNO,OPKEY,C,GCHAR,
     +         QNAM(3),I,TIM(28),GU,GU2,GU3,J,ENTNAM(17),TA$
       INTEGER*4 LINFO,POS4
      LOGICAL ENTFLG
C
C
C---Begin GT changes
C
C ERRD.INS.FTN, PRIMOS>INSERT, PRIMOS GROUP, 11/30/82
C MNEMONIC CODES FOR FILE SYSTEM (FTN)
C Copyright (c) 1982, Prime Computer, Inc., Natick, MA 01760
      NOLIST
C
C     TABSET 6 11 26 59 68
C  Adding a code requires changes to: ERRD.INS.@@ and FS>ERRCOM.PMA
C
C  MODIFICATIONS:
C  01/21/83 HANTMAN  Added E$NSB for detection of NSB labelled tapes
C           .......  by MAGNET,MAGLIB and LABEL.
C  11/30/82 Goggin      Added NAMELIST error codes for library error processing.
C  10/29/82 HChen       Added E$MNPX (illegal multiple hoppings in NPX).
C  09/10/82 Kroczak     Added E$RESF (Improper access to restricted file).
C  04/04/82 HChen       Added E$APND (for R$BGIN) and E$BVCC.
C  03/24/82 Weinberg    Added E$NFAS (not found in attach scan).
C  12/14/81 Huber    changed T$GPPI error codes to match rev 18. To
C           .....    do this moved E$RSNU from 137 to 140 and filled
C           .....    in the previously used codes with E$CTPR, E$DFPR,
C           .....    and E$DLPR.
C  11/06/81 Weinberg changed codes for ACL rewrite.
C  10/26/81 Goggin   Added new error codes for translator group.
C  10/22/81 HChen    used a spare one, 137, for E$RSNU.
C  05/22/81 Detroy   add T$GPPI error codes.
C  04/07/81 Cecchin  merged new errors for Acls  (for Ben Crocker).
C  03/25/81 Cecchin  added NPX error codes from 18 to fix mismatch
C           .......  between 18 and 19. Also added spare 18 error codes
C           .......  as a temporary solution.
C
      INTEGER*2 E$EOF,E$BOF,E$UNOP,E$UIUS,E$FIUS,E$BPAR,E$NATT,
     X        E$FDFL,E$DKFL,E$NRIT,E$FDEL,E$NTUD,E$NTSD,E$DIRE,
     X        E$FNTF,E$FNTS,E$BNAM,E$EXST,E$DNTE,E$SHUT,E$DISK,
     X        E$BDAM,E$PTRM,E$BPAS,E$BCOD,E$BTRN,E$OLDP,E$BKEY,
     X        E$BUNT,E$BSUN,E$SUNO,E$NMLG,E$SDER,E$BUFD,E$BFTS,
     X        E$FITB,E$NULL,E$IREM,E$DVIU,E$RLDN,E$FUIU,E$DNS,
     X        E$TMUL,E$FBST,E$BSGN,E$FIFC,E$TMRU,E$NASS,E$BFSV,
     X        E$SEMO,E$NTIM,E$FABT,E$FONC,E$NPHA,E$ROOM,E$ITRE,
     X        E$WTPR,E$FAMU,E$TMUS,E$NCOM,E$NFLT,E$STKF,E$STKS,
     X        E$NOON,E$CRWL,E$CROV,E$CRUN,E$CMND,E$RCHR,E$NEXP,
     X        E$BARG,E$CSOV,E$NOSG,E$TRCL,E$NDMC,E$DNAV,E$DATT,
     X        E$BDAT,E$BLEN,E$BDEV,E$QLEX,E$NBUF,E$INWT,E$NINP,
     X        E$DFD, E$DNC, E$SICM,E$SBCF,E$VKBL,E$VIA, E$VICA,
     X        E$VIF, E$VFR, E$VFP, E$VPFC,E$VNFC,E$VPEF,E$VIRC,
     X        E$IVCM,E$DNCT,E$BNWD,E$SGIU,E$NESG,E$SDUP,E$IVWN,
     X        E$WAIN,E$NMVS,E$NMTS,E$NDAM,E$NOVA,E$NECS,
     X        E$NRCV,E$UNRV,E$UBSY,E$UDEF,E$UADR,E$PRTL,E$NSUC,
     X        E$NETE,E$SHDN,E$UNOD,E$NDAT,E$ENQD,
     X        E$NFQB,E$MXQB,E$NOQD,E$QEXC,E$IMFD,
     X        E$NROB,E$NACL,E$PNAC,E$NTFD,E$IACL,E$NCAT,E$LRNA,
     X        E$CPMF,E$ACBG,E$ACNF,E$LRNF,E$BACL,E$BVER,E$NINF,
     X        E$CATF,E$ADRF,E$DTNS,E$BMOD,E$BID,
     X        E$NVAL,E$LOGO,E$NUTP,E$UTAR,E$UNIU,E$NFUT,E$UAHU,
     X        E$PANF,E$MISA,E$SCCM,E$NENB,E$NSLA,E$PNTF,E$BRPA,
     X        E$PHNA,E$IWST,E$BKFP,E$BPRH,E$ABTI,E$ILFF,E$TMED,
     X        E$DANC,E$NENB,E$NSLA,E$PNTF,E$SVAL,E$IEDI,E$WMST,
     X        E$DNSK,E$RSNU,E$SPND,E$BCFG,E$S18E,
     X        E$ST19,E$BLUE,E$NDFD,E$WFT,
     X        E$FDMM,E$FER,E$BDV,E$BFOV,E$APND,E$BVCC,
     X        E$CTPR,E$DFPR,E$DLPR,E$NFAS,E$RESF,E$MNPX,
     X        E$SYNT,E$USTR,E$WNS,E$IREQ,E$VNG,E$SOR,
     X        E$TMVV,E$ESV,E$VABS,E$BCLC,E$NSB,
     X        E$LAST
C
      PARAMETER
     X
     X /*********************************************************/
     X /*                                                       */
     X /*                                                       */
     X /*      CODE DEFINITIONS                                 */
     X /*                                                       */
     X /*                                                       */
     X    E$EOF = 00001, /* END OF FILE                   PE       */
     X    E$BOF = 00002, /* BEGINNING OF FILE             PG       */
     X    E$UNOP= 00003, /* UNIT NOT OPEN                 PD,SD    */
     X    E$UIUS= 00004, /* UNIT IN USE                   SI       */
     X    E$FIUS= 00005, /* FILE IN USE                   SI       */
     X    E$BPAR= 00006, /* BAD PARAMETER                 SA       */
     X    E$NATT= 00007, /* NO UFD ATTACHED               SL,AL    */
     X    E$FDFL= 00008, /* UFD FULL                      SK       */
     X    E$DKFL= 00009, /* DISK FULL                     DJ       */
     X    E$NRIT= 00010, /* NO RIGHT                      SX       */
     X    E$FDEL= 00011, /* FILE OPEN ON DELETE           SD       */
     X    E$NTUD= 00012, /* NOT A UFD                     AR       */
     X    E$NTSD= 00013, /* NOT A SEGDIR                  --       */
     X    E$DIRE= 00014, /* IS A DIRECTORY                --       */
     X    E$FNTF= 00015, /* (FILE) NOT FOUND              SH,AH    */
     X    E$FNTS= 00016, /* (FILE) NOT FOUND IN SEGDIR    SQ       */
     X    E$BNAM= 00017, /* ILLEGAL NAME                  CA       */
     X    E$EXST= 00018, /* ALREADY EXISTS                CZ       */
     X    E$DNTE= 00019, /* DIRECTORY NOT EMPTY           --       */
     X    E$SHUT= 00020, /* BAD SHUTDN (FAM ONLY)         BS       */
     X    E$DISK= 00021, /* DISK I/O ERROR                WB       */
     X    E$BDAM= 00022, /* BAD DAM FILE (FAM ONLY)       SS       */
     X    E$PTRM= 00023, /* PTR MISMATCH (FAM ONLY)       PC,DC,AC */
     X    E$BPAS= 00024, /* BAD PASSWORD (FAM ONLY)       AN       */
     X    E$BCOD= 00025, /* BAD CODE IN ERRVEC            --       */
     X    E$BTRN= 00026, /* BAD TRUNCATE OF SEGDIR        --       */
     X    E$OLDP= 00027, /* OLD PARTITION                 --       */
     X    E$BKEY= 00028, /* BAD KEY                       --       */
     X    E$BUNT= 00029, /* BAD UNIT NUMBER               --       */
     X    E$BSUN= 00030, /* BAD SEGDIR UNIT               SA       */
     X    E$SUNO= 00031, /* SEGDIR UNIT NOT OPEN          --       */
     X    E$NMLG= 00032, /* NAME TOO LONG                 --       */
     X    E$SDER= 00033, /* SEGDIR ERROR                  SQ       */
     X    E$BUFD= 00034, /* BAD UFD                       --       */
     X    E$BFTS= 00035, /* BUFFER TOO SMALL              --       */
     X    E$FITB= 00036, /* FILE TOO BIG                  --       */
     X    E$NULL= 00037, /* (NULL MESSAGE)                --       */
     X    E$IREM= 00038, /* ILL REMOTE REF                --       */
     X    E$DVIU= 00039, /* DEVICE IN USE                 --       */
     X    E$RLDN= 00040, /* REMOTE LINE DOWN              --       */
     X    E$FUIU= 00041, /* ALL REMOTE UNITS IN USE       --       */
     X    E$DNS = 00042, /* DEVICE NOT STARTED            --       */
     X    E$TMUL= 00043, /* TOO MANY UFD LEVELS           --       */
     X    E$FBST= 00044, /* FAM - BAD STARTUP             --       */
     X    E$BSGN= 00045, /* BAD SEGMENT NUMBER            --       */
     X    E$FIFC= 00046, /* INVALID FAM FUNCTION CODE     --       */
     X    E$TMRU= 00047, /* MAX REMOTE USERS EXCEEDED     --       */
     X    E$NASS= 00048, /* DEVICE NOT ASSIGNED           --       */
     X    E$BFSV= 00049, /* BAD FAM SVC                   --       */
     X    E$SEMO= 00050, /* SEM OVERFLOW                  --       */
     X    E$NTIM= 00051, /* NO TIMER                      --       */
     X    E$FABT= 00052, /* FAM ABORT                     --       */
     X    E$FONC= 00053, /* FAM OP NOT COMPLETE           --       */
     X    E$NPHA= 00054, /* NO PHANTOMS AVAILABLE         -        */
     X    E$ROOM= 00055, /* NO ROOM                       --       */
     X    E$WTPR= 00056, /* DISK WRITE-PROTECTED          JF       */
     X    E$ITRE= 00057, /* ILLEGAL TREENAME              FE       */
     X    E$FAMU= 00058, /* FAM IN USE                    --       */
     X    E$TMUS= 00059, /* MAX USERS EXCEEDED            --       */
     X    E$NCOM= 00060, /* NULL_COMLINE                  --       */
     X    E$NFLT= 00061, /* NO_FAULT_FR                   --       */
     X    E$STKF= 00062, /* BAD STACK FORMAT              --       */
     X    E$STKS= 00063, /* BAD STACK ON SIGNAL           --       */
     X    E$NOON= 00064, /* NO ON UNIT FOR CONDITION      --       */
     X    E$CRWL= 00065, /* BAD CRAWLOUT                  --       */
     X    E$CROV= 00066, /* STACK OVFLO DURING CRAWLOUT   --       */
     X    E$CRUN= 00067, /* CRAWLOUT UNWIND FAIL          --       */
     X    E$CMND= 00068, /* BAD COMMAND FORMAT            --       */
     X    E$RCHR= 00069, /* RESERVED CHARACTER            --       */
     X    E$NEXP= 00070, /* CANNOT EXIT TO COMMAND PROC   --       */
     X    E$BARG= 00071, /* BAD COMMAND ARG               --       */
     X    E$CSOV= 00072, /* CONC STACK OVERFLOW           --       */
     X    E$NOSG= 00073, /* SEGMENT DOES NOT EXIST        --       */
     X    E$TRCL= 00074, /* TRUNCATED COMMAND LINE        --       */
     X    E$NDMC= 00075, /* NO SMLC DMC CHANNELS          --       */
     X    E$DNAV= 00076, /* DEVICE NOT AVAILABLE         DPTX      */
     X    E$DATT= 00077, /* DEVICE NOT ATTACHED           --       */
     X    E$BDAT= 00078, /* BAD DATA                      --       */
     X    E$BLEN= 00079, /* BAD LENGTH                    --       */
     X    E$BDEV= 00080, /* BAD DEVICE NUMBER             --       */
     X    E$QLEX= 00081, /* QUEUE LENGTH EXCEEDED         --       */
     X    E$NBUF= 00082, /* NO BUFFER SPACE               --       */
     X    E$INWT= 00083, /* INPUT WAITING                 --       */
     X    E$NINP= 00084, /* NO INPUT AVAILABLE            --       */
     X    E$DFD = 00085, /* DEVICE FORCIBLY DETACHED      --       */
     X    E$DNC = 00086, /* DPTX NOT CONFIGURED           --       */
     X    E$SICM= 00087, /* ILLEGAL 3270 COMMAND          --       */
     X    E$SBCF= 00088, /* BAD 'FROM' DEVICE             --       */
     X    E$VKBL= 00089, /* KBD LOCKED                    --       */
     X    E$VIA = 00090, /* INVALID AID BYTE              --       */
     X    E$VICA= 00091, /* INVALID CURSOR ADDRESS        --       */
     X    E$VIF = 00092, /* INVALID FIELD                 --       */
     X    E$VFR = 00093, /* FIELD REQUIRED                --       */
     X    E$VFP = 00094, /* FIELD PROHIBITED              --       */
     X    E$VPFC= 00095, /* PROTECTED FIELD CHECK         --       */
     X    E$VNFC= 00096, /* NUMERIC FIELD CHECK           --       */
     X    E$VPEF= 00097, /* PAST END OF FIELD             --       */
     X    E$VIRC= 00098, /* INVALID READ MOD CHAR         --       */
     X    E$IVCM= 00099, /* INVALID COMMAND               --       */
     X    E$DNCT= 00100, /* DEVICE NOT CONNECTED          --       */
     X    E$BNWD= 00101, /* BAD NO. OF WORDS              --       */
     X    E$SGIU= 00102, /* SEGMENT IN USE                --       */
     X    E$NESG= 00103, /* NOT ENOUGH SEGMENTS (VINIT$)  --       */
     X    E$SDUP= 00104, /* DUPLICATE SEGMENTS (VINIT$)   --       */
     X    E$IVWN= 00105, /* INVALID WINDOW NUMBER         --       */
     X    E$WAIN= 00106, /* WINDOW ALREADY INITIATED      --       */
     X    E$NMVS= 00107, /* NO MORE VMFA SEGMENTS         --       */
     X    E$NMTS= 00108, /* NO MORE TEMP SEGMENTS         --       */
     X    E$NDAM= 00109, /* NOT A DAM FILE                --       */
     X    E$NOVA= 00110, /* NOT OPEN FOR VMFA             --       */
     X    E$NECS= 00111, /* NOT ENOUGH CONTIGUOUS SEGMENTS         */
     X    E$NRCV= 00112, /* REQUIRES RECEIVE ENABLED      --       */
     X    E$UNRV= 00113, /* USER NOT RECEIVING NOW        --       */
     X    E$UBSY= 00114, /* USER BUSY, PLEASE WAIT        --       */
     X    E$UDEF= 00115, /* USER UNABLE TO RECEIVE MESSAGES        */
     X    E$UADR= 00116, /* UNKNOWN ADDRESSEE             --       */
     X    E$PRTL= 00117, /* OPERATION PARTIALLY BLOCKED   --       */
     X    E$NSUC= 00118, /* OPERATION UNSUCCESSFUL        --       */
     X    E$NROB= 00119, /* NO ROOM IN OUTPUT BUFFER      --       */
     X    E$NETE= 00120, /* NETWORK ERROR ENCOUNTERED     --       */
     X    E$SHDN= 00121, /* DISK HAS BEEN SHUT DOWN       FS       */
     X    E$UNOD= 00122, /* UNKNOWN NODE NAME (PRIMENET)           */
     X    E$NDAT= 00123, /* NO DATA FOUND                 --       */
     X    E$ENQD= 00124, /* ENQUED ONLY                   --       */
     X    E$PHNA= 00125, /* PROTOCOL HANDLER NOT AVAIL   DPTX      */
     X    E$IWST= 00126, /* E$INWT ENABLED BY CONFIG     DPTX      */
     X    E$BKFP= 00127, /* BAD KEY FOR THIS PROTOCOL    DPTX      */
     X    E$BPRH= 00128, /* BAD PROTOCOL HANDLER (TAT)   DPTX      */
     X    E$ABTI= 00129, /* I/O ABORT IN PROGRESS        DPTX      */
     X    E$ILFF= 00130, /* ILLEGAL DPTX FILE FORMAT     DPTX      */
     X    E$TMED= 00131, /* TOO MANY EMULATE DEVICES     DPTX      */
     X    E$DANC= 00132, /* DPTX ALREADY CONFIGURED      DPTX      */
     X    E$NENB= 00133, /* REMOTE MODE NOT AVAILABLE     NPX      */
     X    E$NSLA= 00134, /* NO NPX SLAVES AVAILABLE       ---      */
     X    E$PNTF= 00135, /* PROCEDURE NOT FOUND          R$CALL    */
     X    E$SVAL= 00136, /* SLAVE VALIDATION ERROR       R$CALL    */
     X    E$IEDI= 00137, /* I/O error or device interrupt (GPPI)   */
     X    E$WMST= 00138, /* Warm start happened (GPPI)             */
     X    E$DNSK= 00139, /* A pio instruction didn't skip (GPPI)   */
     X    E$RSNU= 00140, /* REMOTE SYSTEM NOT UP         R$CALL    */
     X    E$S18E= 00141, /* SPARE CODES FOR REV18                  */
C
C    New error codes added for REV 19 begin here:
C
     X    E$NFQB= 00142, /* NO FREE QUOTA BLOCKS          --       */
     X    E$MXQB= 00143, /* MAXIMUM QUOTA EXCEEDED        --       */
     X    E$NOQD= 00144, /* NOT A QUOTA DISK (RUN VFIXRAT)         */
     X    E$QEXC= 00145, /* SETTING QUOTA BELOW EXISTING USAGE     */
     X    E$IMFD= 00146, /* QUOTA NOT PERMITTED ON MFD             */
     X    E$NACL= 00147, /* NOT AN ACL UFD.                        */
     X    E$PNAC= 00148, /* PARENT NOT ACL UFD                     */
     X    E$NTFD= 00149, /* Not a file or directory                */
     X    E$IACL= 00150, /* ENTRY IS AN ACL                        */
     X    E$NCAT= 00151, /* Not an access category                 */
     X    E$LRNA= 00152, /* Like reference not available           */
     X    E$CPMF= 00153, /* Category protects MFD                  */
     X    E$ACBG= 00154, /* ACL too big                            */
     X    E$ACNF= 00155, /* Access category not found              */
     X    E$LRNF= 00158, /* Like reference not found               */
     X    E$BACL= 00157, /* BAD ACL                                */
     X    E$BVER= 00158, /* BAD VERSION                            */
     X    E$NINF= 00159, /* NO INFORMATION                         */
     X    E$CATF= 00160, /* Access category found (Ac$rvt)         */
     X    E$ADRF= 00161, /* ACL directory found (Ac$rvt)           */
     X    E$NVAL= 00162, /* Validation error (login)               */
     X    E$LOGO= 00163, /* Logout (code for fatal$)      --       */
     X    E$NUTP= 00164, /* No unit table availabe.(PHANT$)        */
     X    E$UTAR= 00165, /* Unit table already returned.(UTDALC)   */
     X    E$UNIU= 00166, /* Unit table not in use.(RTUTBL)         */
     X    E$NFUT= 00167, /* No free unit table.(GTUTBL)            */
     X    E$UAHU= 00168, /* User already has unit table.(UTALOC)   */
     X    E$PANF= 00169, /* Priority ACL not found.                */
     X    E$MISA= 00170, /* Missing argument to command.           */
     X    E$SCCM= 00171, /* System console command only.           */
     X    E$BRPA= 00172, /* Bad Remote Password          R$CALL    */
     X    E$DTNS= 00173, /* Date and time not set yet.             */
     X    E$SPND= 00174, /* REMOTE PROCEDURE CALL STILL PENDING    */
     X    E$BCFG= 00175, /* NETWORK CONFIGURATION MISMATCH         */
     X    E$BMOD= 00176, /* Illegal access mode (AC$SET)           */
     X    E$BID=  00177, /* Illegal identifer   (AC$SET)           */
     X    E$ST19= 00178, /* Operation illegal on pre-19 disk       */
     X    E$CTPR= 00179, /* Object is category-protected (Ac$chg)  */
     X    E$DFPR= 00180, /* Object is default-protected (Ac$chg)   */
     X    E$DLPR= 00181, /* File is delete-protected (Fil$dl)      */
     X    E$BLUE= 00182, /* Bad LUTBL entry.   F$IO                */
     X    E$NDFD= 00183, /* No driver for device.  F$IO            */
     X    E$WFT = 00184, /* Wrong file type  F$IO                  */
     X    E$FDMM= 00185, /* Format/data mismatch.  F$IO            */
     X    E$FER = 00186, /* Bad format.  F$IO                      */
     X    E$BDV = 00187, /* Bad dope vector.  F$IO                 */
     X    E$BFOV= 00188, /* F$IO BF overflow.  F$IO                */
     X    E$NFAS= 00189, /* Top-level dir not found or inaccessible*/
     X    E$APND= 00190, /* Asynchronous procedure still pending   */
     X    E$BVCC= 00191, /* Bad virtual circuit clearing           */
     X    E$RESF= 00192, /* Improper access to restricted file     */
     X    E$MNPX= 00193, /* Illegal multiple hoppings in NPX       */
     X    E$SYNT= 00194, /* SYNTanx error                          */
     X    E$USTR= 00195, /* Unterminated STRing                    */
     X    E$WNS = 00196, /* Wrong Number of Subscripts             */
     X    E$IREQ= 00197, /* Integer REQuired                       */
     X    E$VNG = 00198, /* Variable Not in namelist Group         */
     X    E$SOR = 00199, /* Subscript Out of Range                 */
     X    E$TMVV= 00200, /* Too Many Values for Variable           */
     X    E$ESV = 00201, /* Expected String Value                  */
     X    E$VABS= 00202, /* Variable Array Bounds or Size          */
     X    E$BCLC= 00203, /* Bad Compiler Library Call              */
     X    E$NSB = 00204, /* NSB labelled tape was detected         */
     X    E$LAST= 00204  /* THIS ***MUST*** BE LAST       --       */
      LIST
C KEYS.INS.FTN, PRIMOS>INSERT, PRIMOS GROUP, 01/27/83
C SYSCOM>KEYS.F  MNEMONIC KEYS FOR FILE SYSTEM (FTN)
C Copyright (c) 1982, Prime Computer, Inc., Natick, MA 01760
      NOLIST
C
C NOTE: THIS FILE SHOULD AGREE EXACTLY WITH KEYS.INS.PLP AND KEYS.INS.PMA
C       THAT IS, BOTH THE INTEGER DECLARATIONS AND THE PARAMETER DECLARATIONS
C       SHOULD BE IN THE SAME ORDER AND INCLUDE THE SAME ITEMS.
C
C
C MODIFICATIONS:
C Date     Programmer   Description of modification
C 01/27/83 Kazin          Added K$SPEC to VINIT$ keys. [OSINFO 1362]
C 01/24/83 Kazin          Made keys.ins.ftn agree with keys.ins.plp. [OSI 1329]
C 01/24/83 Kazin          Added keys for dynamic storage manager. [OSI 1329]
C 12/15/82 Swartzendruber Deleted k$gate, k$rw, and k$rwx from integer*2 stmt.
C 09/10/82 Kroczak        Added K$LTYP key to SATR$$ and K$RESV to SRCH$$
C 07/28/82 Kazin        Deleted K$RW, K$RWX, and K$GATE from VINIT$ keys.
C 07/03/82 Weinberg     Added keys for DIR$CR.
C 06/17/82 Kazin        Added K$DUPL for VINIT$.
C 05/21/82 Goggin       Added k$st$s, k$st$n, k$nlop, and k$lonp for event
C ........              logging module LGINI$.PLP.
C 04/29/82 Kazin        Added keys for SW$INT.
C 01/04/82 Slutz        Added new acl keys.
C 12/03/81 Curreri      Added keys for LGINI$ (log_init in pl1).
C 11/12/81 Weinberg     Added k$grp key for idchk$.
C 11/09/81 Weinberg     Removed non-standard ERROR code definitions from
C ........              MGSET$ section; defined keys for setting read/write
C ........              locks with SATR$$.
C 10/06/81 Weinberg     Removed initial attach point keys for ATCH$$,
C ........              ACL keys for RDEN$$; added keys for DIR$RD.
C
C
C     TABSET 6 11 28 69
C
      INTEGER*2 K$READ,K$WRIT,K$POSN,K$TRNC,K$RPOS,K$PRER,K$PREA,
     X    K$POSR,K$POSA,K$CONV,K$FRCW,
     X    K$RDWR,K$CLOS,K$DELE,K$EXST,K$VMR,K$VMRW,K$GETU,K$RESV,
     X    K$IUFD,K$ISEG,K$CACC,K$NSAM,K$NDAM,K$NSGS,K$NSGD,K$CURR,
     X    K$ANY,K$SPEC,K$DUPL,K$CNSC,K$R,K$RX,
     X    K$DOWN,K$UP,K$UPC,K$DWNC,
     X    K$IMFD,K$ICUR,K$SETC,K$SETH,K$HOME,K$ALLD,
     X    K$CREA,K$REP,
     X    K$SPOS,K$GOND,K$GPOS,K$MSIZ,
     X    K$MVNT,K$FULL,K$FREE,K$RSUB,K$UPOS,
     X    K$NAME,K$INIT,
     X    K$PROT,K$DTIM,K$DMPB,K$RWLK,K$SOWN,K$SDL,
     X    K$LTYP,K$DTLS,K$TRUN,K$DFLT,K$EXCL,K$UPDT,K$NONE,
     X    K$NRTN,K$SRTN,K$IRTN,K$CPLM,K$LGLM,
     X    K$UNIT,K$CURA,K$HOMA,K$INIA,
     X    K$ACPT,K$DEFR,K$RJCT,
     X    K$LIST,K$ADD,K$SRCH,
     X    K$PROC,K$LEVL,K$PROG,K$SYST,K$FRBK,K$ANYW,K$ZERO,
     X    K$USER,K$COPY,K$DBG,K$INAL,K$REIN,K$INVK,K$IVND,
     X    K$REST,
     X    K$UPRC,K$WLDC,K$NULL,K$NUM,K$GRP,K$SMAX,
     X    K$LOF,K$NLOF,K$LON,K$NLON,K$LONP,K$NLOP,K$ST$S,K$ST$N,
     X    K$ALL,K$LOCL,K$REM,K$SYS,
     X    K$ON,K$OFF,K$RDON,K$RDOF,K$RDAL,K$ALON,K$ALOF,K$RAON,K$RAOF,
     X    K$SAME,K$PWD

C
      PARAMETER
     X
     X /*************************************************************/
     X /*                                                           */
     X /*                                                           */
     X /*      KEY DEFINITIONS                                      */
     X /*                                                           */
     X /*                                                           */
     X /********************* PRWF$$ *********************          */
     X /*              ****** RWKEY  ******                         */
     X    K$READ = :1,     /* READ                                  */
     X    K$WRIT = :2,     /* WRITE                                 */
     X    K$POSN = :3,     /* POSITION ONLY                         */
     X    K$TRNC = :4,     /* TRUNCATE                              */
     X    K$RPOS = :5,     /* READ CURRENT POSITION                 */
     X /*              ****** POSKEY ******                         */
     X    K$PRER = :0,     /* PRE-POSITION RELATIVE                 */
     X    K$PREA = :10,    /* PRE-POSITION ABSOLUTE                 */
     X    K$POSR = :20,    /* POST-POSITION RELATIVE                */
     X    K$POSA = :30,    /* POST-POSITION ABSOLUTE                */
     X /*              ****** MODE   ******                         */
     X    K$CONV = :400,   /* CONVENIENT NUMBER OF WORDS            */
     X    K$FRCW = :40000, /* FORCED WRITE TO DISK                  */
     X /*                                                           */
     X /********************* SRCH$$ *********************          */
     X /*              ****** ACTION ******                         */
     X /* K$READ = :1,     /* OPEN FOR READ                         */
     X /* K$WRIT = :2,     /* OPEN FOR WRITE                        */
     X    K$RDWR = :3,     /* OPEN FOR READING AND WRITING          */
     X    K$CLOS = :4,     /* CLOSE FILE UNIT                       */
     X    K$DELE = :5,     /* DELETE FILE                           */
     X    K$EXST = :6,     /* CHECK FILE'S EXISTENCE                */
     X    K$VMR  = :20,    /* OPEN FOR VMFA READING                 */
     X    K$VMRW = :60,    /* OPEN FOR VMFA READING/WRITING         */
     X    K$GETU = :40000, /* SYSTEM RETURNS UNIT NUMBER            */
     X    K$RESV = :100000,/* reserved                              */
     X /*              ****** REF    ******                         */
     X    K$IUFD = :0,     /* FILE ENTRY IS IN UFD                  */
     X    K$ISEG = :100,   /* FILE ENTRY IS IN SEGMENT DIRECTORY    */
     X    K$CACC = :1000,  /* CHANGE ACCESS                         */
     X /*              ****** NEWFIL ******                         */
     X    K$NSAM = :0,     /* NEW SAM FILE                          */
     X    K$NDAM = :2000,  /* NEW DAM FILE                          */
     X    K$NSGS = :4000,  /* NEW SAM SEGMENT DIRECTORY             */
     X    K$NSGD = :6000,  /* NEW DAM SEGMENT DIRECTORY             */
     X    K$CURR = :177777,/* CURRENTLY ATTACHED UFD                */
     X /*                                                           */
     X /*                                                           */
     X /********************* VINIT$ *********************          */
     X /*                                                           */
     X    K$ANY  = :0,       /* USE ANY SEGMENTS                    */
     X    K$SPEC = :1,       /* USE SPECIFIED SEGMENTS              */
     X    K$DUPL = :20,      /* USE DUPLICATE SEGMENTS              */
     X    K$CNSC = :10,      /* CONSECUTIVE SEGMENTS REQUIRED       */
     X    K$R    = :2,       /* READ ACCESS ON SEGMENT (^= K$READ!) */
     X    K$RX   = :6,       /* READ/EXECUTE ACCESS                 */
     X /*                                                           */
     X /********************* GETSN$, FIND_SEG ******************** */
     X /*                                                           */
     X    K$DOWN = :0,       /* ALLOCATE DECREASING SEGMENT #'S     */
     X    K$UP   = :1,       /* ALLOCATE INCREASING SEGMENT #'S     */
     X    K$UPC  = :2,       /* ALLOCATE INCREASING CONSEC. SEGS    */
     X    K$DWNC = :4,       /* ALLOCATE DECREASING CONSEC. SEGS    */
     X /*                                                           */
     X /********************* ATCH$$ *********************          */
     X /*              ****** KEY    ******                         */
     X    K$IMFD = :0,     /* UFD IS IN MFD                         */
     X    K$ICUR = :2,     /* UFD IS IN CURRENT UFD                 */
     X /*              ****** KEYMOD ******                         */
     X    K$SETC = :0,     /* SET CURRENT UFD (DO NOT SET HOME)     */
     X    K$SETH = :1,     /* SET HOME UFD (AS WELL AS CURRENT)     */
     X /*              ****** NAME   ******                         */
     X    K$HOME = :0,     /* RETURN TO HOME UFD (KEY=K$IMFD)       */
     X /*              ****** LDISK  ******                         */
     X    K$ALLD = :100000,/* SEARCH ALL DISKS                      */
     X /* K$CURR = :177777,/* SEARCH MFD OF CURRENT DISK            */
     X /*                                                           */
     X /* *********************** AC$SET ***********************    */
     X /*                                                           */
     X /* K$ANY  = :0,     /* Do it regardless                      */
     X    K$CREA = :1,     /* Create new ACL (error if already exists)  */
     X    K$REP  = :2,     /* Replace existing ACL (error if does not exist)*/
     X /*                                                           */
     X /********************* SGDR$$ *********************          */
     X /*              ****** KEY    ******                         */
     X    K$SPOS = :1,     /* POSITION TO ENTRY NUMBER IN SEGDIR    */
     X    K$GOND = :2,     /* POSITION TO END OF SEGDIR             */
     X    K$GPOS = :3,     /* RETURN CURRENT ENTRY NUMBER           */
     X    K$MSIZ = :4,     /* MAKE SEGDIR GIVEN NR OF ENTRIES       */
     X    K$MVNT = :5,     /* MOVE FILE ENTRY TO DIFFERENT POSITION */
     X    K$FULL = :6,     /* POSITION TO NEXT NON-EMPTY ENTRY      */
     X    K$FREE = :7,     /* POSITION TO NEXT FREE ENTRY           */
     X /*                                                           */
     X /********************* RDEN$$ *********************          */
     X /*              ****** KEY    ******                         */
     X /* K$READ = :1,     /* READ NEXT ENTRY                       */
     X    K$RSUB = :2,     /* READ NEXT SUB-ENTRY                   */
     X /* K$GPOS = :3,     /* RETURN CURRENT POSITION IN UFD        */
     X    K$UPOS = :4,     /* POSITION IN UFD                       */
     X    K$NAME = :5,     /* READ ENTRY SPECIFIED BY NAME          */
     X /*                                                           */
     X /************************** DIR$RD ************************* */
     X /*                                                           */
     X /* K$READ = :1,     /* Read next entry                       */
     X    K$INIT = :2,     /* Initialize directory (read header)    */
     X /*                                                           */
     X /********************* SATR$$ *********************          */
     X /*              ****** KEY    ******                         */
     X    K$PROT = :1,     /* SET PROTECTION                        */
     X    K$DTIM = :2,     /* SET DATE/TIME MODIFIED                */
     X    K$DMPB = :3,     /* SET DUMPED BIT                        */
     X    K$RWLK = :4,     /* SET PER FILE READ/WRITE LOCK          */
     X    K$SOWN = :5,     /* SET OWNER FIELD ON FILE               */
     X    K$SDL  = :6,     /* SET ACL/DELETE SWITCH ON FILE         */
     X    K$LTYP = :7,     /* SET LOGICAL FILE TYPE                 */
     X    K$DTLS = :10,    /* SET DATE/TIME LAST SAVED              */
     X    K$TRUN = :11,    /* SET TRUNCATED BY FIX_DISK BIT         */
     X /*              ****** RWLOCK ******                         */
     X    K$DFLT = :0,     /* Use system default value              */
     X    K$EXCL = :1,     /* N readers OR one writer               */
     X    K$UPDT = :2,     /* N readers AND one writer              */
     X    K$NONE = :3,     /* N readers AND N writers               */
     X /*                                                           */
     X /********************* ERRPR$ *********************          */
     X /*              ****** KEY    ******                         */
     X    K$NRTN = :0,     /* NEVER RETURN TO USER                  */
     X    K$SRTN = :1,     /* RETURN AFTER START COMMAND            */
     X    K$IRTN = :2,     /* IMMEDIATE RETURN TO USER              */
     X /*                                                           */
     X /********************* LIMIT$ *************************      */
     X /*              ****** KEY    ******                         */
     X /* K$READ = :0,     /* RETURNS INFORMATION                   */
     X /* K$WRIT = :1,     /* SETS INFORMATION                      */
     X /*              ****** SUBKEY ******                         */
     X    K$CPLM = :400,   /* CPU TIME IN SECONDS                   */
     X    K$LGLM = :1000,  /* LOGIN TIME IN MINUTES                 */
     X /*                                                           */
     X /*                                                           */
     X /********************* GPATH$ ********************************/
     X /*              ****** KEY    ******                         */
     X    K$UNIT = :1,     /* PATHNAME OF UNIT RETURNED             */
     X    K$CURA = :2,     /* PATHNAME OF CURRENT ATTACH POINT      */
     X    K$HOMA = :3,     /* PATHNAME OF HOME ATTACH POINT         */
     X    K$INIA = :4,     /* Pathname of initial attach point      */
     X /*                                                           */
     X /********************* MSG$ST ********************************/
     X /*                                                           */
     X    K$ACPT = 0,      /* ACCEPT MSGS (ALSO MGSET)              */
     X    K$DEFR = 1,      /* DEFER MSGS  (ALSO MGSET)              */
     X    K$RJCT = 2,      /* REJECT MSGS (ALSO MGSET)              */
     X /*                                                           */
     X /********************** FNSID$ *******************************/
     X /*                                                           */
     X    K$LIST = 1,      /* Return entire list                    */
     X    K$ADD  = 2,      /* Add to existing list                  */
     X    K$SRCH = 3,      /* Search for specific node              */
     X /*                                                           */
     X /*********** KEYS FOR RESUME FUNCTIONALITY FOR EPFS***********/
     X /********************* STR$AL, STR$FR ************************/
     X /*                                                           */
     X    K$PROC = 1,      /* STORAGE TYPES :  PER PROCESS          */
     X    K$LEVL = 2,      /* PER LEVEL                             */
     X    K$PROG = 2,      /* PER PROGRAM                           */
     X    K$SYST = 4,      /* PER SYSTEM                            */
     X    K$FRBK = 5,      /* FREE A BLOCK OF STORAGE               */
     X    K$ANYW = -1,     /* BASE THE STORAGE BLOCK ANYWHERE       */
     X    K$ZERO = 0,      /* BASE THE STORAGE BLOCK AT WORD 0      */
     X /*                                                           */
     X /**************** R$MAP, R$INIT, R$ALLC **********************/
     X /**************** R$RUN, R$INVK, R$DEL  **********************/
     X /*                                                           */
     X    K$COPY = 1,      /* COPY EPF FILE INTO TEMP SEGS          */
     X    K$DBG = 2,       /* MAP DBG INFO EPF INTO MEMORY          */
     X    K$INAL = 1,      /* INIT ALL OF THE EPF'S LINKAGE         */
     X    K$REIN = 2,      /* ONLY INIT REINIT EPF LINKAGE          */
     X    K$INVK = 0,      /* INVOKE AND DELETE EPF FROM MEMORY     */
     X    K$IVND = 1,      /* INVOKE AND DO NOT DELETE EPF FROM MEM.*/
     X    K$REST = 2,      /* DO NOT INVOKE EPF, JUST RESTORE       */
     X /*                                                           */
     X /****************** DYNAMIC STORAGE MANAGER ******************/
     X /*                                                           */
     X /* K$PROC = 1,      /* STORAGE TYPES: PER PROCESS            */
     X /* K$LEVL = 2,      /* PER LEVEL                             */
     X    K$USER = 3,      /* PER USER                              */
     x /* K$SYST = 4,      /* PER SYSTEM                            */
     X /*                                                           */
     X /*************** FNCHK$, TNCHK$, IDCHK$, PWCHK$ **************/
     X /*                                                           */
     X    K$UPRC = 1,      /* Mask string to uppercase              */
     X    K$WLDC = 2,      /* Allow wildcards (not PWCHK$)          */
     X    K$NULL = 4,      /* Allow null names                      */
     X    K$NUM  = 8,      /* Allow numeric names (FNCHK$ only)     */
     X    K$GRP  = 8,      /* Check group name (IDCHK$ only)        */
     X /*                                                           */
     X /************************* Q$SET *****************************/
     X /*                                                           */
     X    K$SMAX = 1,      /* SET MAX QUOTA                         */
     X /*                                                           */
     X /*********************** LGINI$ ******************************/
     X /*                                                           */
     X    K$LOF = 0,       /* OS logging on                         */
     X    K$NLOF = 1,      /* Net logging off                       */
     X    K$LON =  2,      /* OS logging on                         */
     X    K$NLON = 3,      /* Net logging on                        */
     X    K$LONP = 4,      /* Turn sys logging on, use prev file    */
     X    K$NLOP = 5,      /* Turn net logging on, use prev file    */
     X    K$ST$S = 6,      /* Return system logging status          */
     X    K$ST$N = 7,      /* Return network logging status         */
     X /*                                                           */
     X /************************** LDISK$ ***************************/
     X /*                                                           */
     X    K$ALL  = 0,      /* RETURN ALL DISKS                      */
     X    K$LOCL = 1,      /* LOCAL DISKS ONLY                      */
     X    K$REM  = 2,      /* REMOTE DISKS ONLY                     */
     X    K$SYS  = 3,      /* DISKS FROM A SPECIFIED SYSTEM         */
     X /*                                                           */
     X /*************************** SW$INT **************************/
     X /*                                                           */
     X /* K$READ = 1       /* Read present status                   */
     X    K$ON = 2,        /* Turn on interrupt(s)                  */
     X    K$OFF = 3,       /* Turn off interrupt(s)                 */
     X    K$RDON = 4,      /* Read present status and               */
     X /*                     turn on interrupt(s)                  */
     X    K$RDOF = 5,      /* Read present status and               */
     X /*                     turn off interrupt(s)                 */
     X    K$RDAL = 6,      /* Read present status of all interrupts */
     X    K$ALON = 7,      /* Turn on all interrupts                */
     X    K$ALOF = 8,      /* Turn off all interrupts               */
     X    K$RAON = 9,      /* Read present status and               */
     X /*                     turn on all interrupts                */
     X    K$RAOF = 10,     /* Read present status and               */
     X /*                     turn off all interrupts               */
     X /*                                                           */
     X /************************** DIR$CR ***************************/
     X /*                                                           */
     X    K$SAME = 0,      /* Create directory of parent's type     */
     X    K$PWD  = 1       /* Create password directory             */
     X /*                                                           */
     X /*************************************************************/

      LIST
C Q$COM.INS.FTN, SPOOL>INSERT, JRW-GAM, 06/06/80
C Queue manager common and parameter definitions
C Copyright (c) 1979, Prime Computer, Inc., Wellesley, MA 02181
      NOLIST
C
       INTEGER HBUF,CHEAD,CTAIL,CSIZE,CENTS,CLOCK,CSYNC,HSIZE,JK
C
       PARAMETER ( HSIZE=7, CSIZE=40, CENTS=200 )
C
       LOGICAL CEMTY
C
       INTEGER*4 Q$POS
C
       COMMON /Q$COM/ HBUF(HSIZE)
C
       EQUIVALENCE
     +   (HBUF(3),CHEAD),                   /* HEADER ENTRY #
     +   (HBUF(4),CTAIL),                   /* TAIL ENTRY #
     +   (HBUF(7),CEMTY)                    /* QUEUE-EMPTY FLAG
C
       LIST
C NEWSCOM.INS.FTN, SPOOL>INSERT, JCB, 06/24/81
C New queue control common for rev 19 information
C Copyright (C) 1981, Prime Computer, Inc., Natick, MA 01760
      NOLIST
C
      INTEGER*2 S$BUFF(122)  /* 122 words.
C
      INTEGER*2 S$NLEN,S$UNAM,S$DTMD,S$PATH,S$COPY,S$SECS,S$EXTR
C
      PARAMETER
     &   S$NLEN=122,  /* New rev 19 area length.
     &   S$UNAM=1,  /* 32 characters of username.
     &   S$DTMD=17,  /* Date-time modified of file (0 if invalid).
     &   S$PATH=19,  /* Pathname of file.
     &   S$COPY=60,  /* One if copy, two if not, zero if invalid.
     &   S$SECS=61,  /* Seconds file spooled (QBUF(27) is in use).
     &   S$EXTR=62  /* Extra crap.
C
      LIST
C
C---End   GT changes
C
C
       INTEGER*4 RECSIZ
       PARAMETER ( RECSIZ=001024 )
       DATA SPLDIR /'SPOOLQ'/, SPLPAS /'      '/, QNAM /'Q.CTRL'/
C
       CODE=E$BKEY
       IF( KEY.EQ.2 ) GOTO 90
       IF( KEY.NE.1 ) RETURN
C
C---Try to open file for copy if KEY=1
C
      I=TA$(NAME,INTL(NAMLEN),2,ENTNAM(2),ENTNAM(1),ENTFLG,CODE)
      IF (CODE.NE.0) GO TO 270
      CALL SRCH$$(K$READ+K$GETU,ENTNAM(2),ENTNAM(1),GU2,I,CODE)
      IF (CODE.NE.0) GO TO 270
C
      S$BUFF(S$DTMD)=0
      S$BUFF(S$DTMD+1)=0
C
      DO 70 I=S$EXTR,S$NLEN
         S$BUFF(I)=0
70    CONTINUE
C
      CALL SRCH$$(K$READ+K$GETU,K$CURR,0,GU,I,CODE)
      IF (CODE.NE.0) GO TO 80
C
      CALL RDEN$$(K$NAME,GU,BUF,24,I,ENTNAM(2),ENTNAM(1),CODE)
      CALL SRCH$$(K$CLOS,0,0,GU,0,I)
      IF (CODE.NE.0) GO TO 80
C
      S$BUFF(S$DTMD)=BUF(21)  /* Get dtm of file.
      S$BUFF(S$DTMD+1)=BUF(22)
C
C ---  LINFO=NAMLEN                    /* set up 0,length pair for TSRC$$
C ---  CALL TSRC$$(K$READ+K$GETU,NAME,GU2,LINFO,I,CODE)
C ---  IF( CODE.NE.0 ) GOTO 270
C
80    CALL ATCH$$(K$HOME,0,0,0,0,I)
       CALL GPATH$(K$UNIT,GU2,S$BUFF(S$PATH+1),80,S$BUFF(S$PATH),CODE)
      IF(CODE.NE.0) CALL SPL$MB('(info unavailable)',S$BUFF(S$PATH+1),9)
      IF (CODE.NE.0) S$BUFF(S$PATH)=18
      GO TO 100
C
C---Create queue entry in buffer
C
90    CALL GPATH$(K$HOMA,0,S$BUFF(S$PATH+1),80,S$BUFF(S$PATH),CODE)
      IF(CODE.NE.0) CALL SPL$MB('(info unavailable)',S$BUFF(S$PATH+1),9)
      IF (CODE.NE.0) S$BUFF(S$PATH)=18
C
100    CALL ATCH$$(SPLDIR,6,K$ALLD,SPLPAS,K$IMFD,CODE)
       IF( CODE.NE.0 ) GOTO 260
       CALL TIMDAT(TIM,28)             /* need user and date/time info
C
       BUF(1)=2                        /* set valid word
       CALL SPL$MB(TIM(13),BUF(2),3)   /* move user name
       CALL SPL$MB(TIM(13),S$BUFF(S$UNAM),16)  /* Move entire username.
       S$BUFF(S$COPY)=KEY
       CALL SPL$MB(TIM,BUF(24),4)      /* move date/time
      S$BUFF(S$SECS)=TIM(5)  /* Now handles seconds too.  JCB
C
       IF( AND(INFO(3),:40 ).EQ.0) GOTO 110
       CALL SPL$MB(INFO(21),BUF(5),8)
       J=16
       GOTO 140
110    I=0
120    J=0
130    C=GCHAR(LOC(NAME),I)
       IF( I.GT.NAMLEN ) GOTO 140
       IF( C.EQ.RT(' >',8) ) GOTO 120
       IF( J.GT.31 ) GOTO 140
       CALL SCHAR(LOC(BUF(5)),J,C)
       GOTO 130
140    CALL SCHAR(LOC(BUF(5)),J,:240)
       IF( J.LT.32 ) GOTO 140
C
       CALL SPL$MB(INFO(4),BUF(21),3)  /* move -FORM name
       BUF(28)=INFO(3)                 /* set print option word
       BUF(29)=INFO(11)                /* get -DEFER time
       BUF(30)=-1                      /* size is currently unknown
       BUF(40)=INFO(29)                /* number of -COPIES
C
C---Try to get this system's default -AT name
C
       IF( AND(BUF(28),:100).NE.0 ) GOTO 160           /* did user supply one?
         CALL SRCH$$(K$READ+K$GETU,'L.DFLT',6,GU,J,CODE)
         IF( CODE.EQ.E$FNTF ) GOTO 170 /* default supplied?
         IF( CODE.NE.0      ) GOTO 260
           CALL RDLIN$(GU,BUF(32),8,CODE)             /* get the default
           CALL SRCH$$(K$CLOS,0,0,GU,0,CODE)
           BUF(28)=BUF(28)+:100        /* indicate we have a name
           CALL SPL$MB(BUF(32),BUF(31),3)             /* -AT field is split
           GOTO 170
160    CALL SPL$MB(INFO(13),BUF(31),3) /* move first part
       CALL SPL$MB(INFO(16),BUF(35),5) /* move rest after hole
170    BUF(34)=INFO(7)                 /* this is what made hole
C
C---Open queue
C
       CALL SRCH$$(K$EXST,QNAM,6,1,0,CODE)
       IF( CODE.EQ.E$FNTF ) GOTO 180
       IF( KEY.EQ.2 ) CALL SRCH$$(K$READ,'SPPHN.SEG',9,INFO(2),J,CODE)
       CALL Q$OFFC(GU,QNAM,6,K$RDWR+K$GETU,CODE)
       CALL SRCH$$(K$CLOS,'SPPHN.SEG',9,0,0,J)  /* free unit for the -OPEN
       IF( CODE.NE.0 ) GOTO 260
       CALL PRWF$$(K$READ,GU,LOC(HBUF),HSIZE,000000,J,CODE)
       IF( CODE.NE.0 ) GOTO 250
       GOTO 190
C
C---Queue not found, create one
C
180    CALL SRCH$$(K$WRIT+K$GETU,QNAM,6,GU,I,CODE)    /* create it
       IF( CODE.NE.0 ) GOTO 260
C
       HBUF(1)=0                       /* obsolete
       HBUF(2)=0                       /* obsolete
       CHEAD=1                         /* head pointer
       CTAIL=1                         /* tail pointer
       HBUF(5)=CENTS                   /* maximum number of entries
       HBUF(6)=CSIZE                   /* entry size minus one
       CEMTY=.FALSE.                   /* .FALSE. means queue empty!
C
       CALL PRWF$$(K$WRIT,GU,LOC(HBUF),HSIZE+CENTS*(CSIZE+1),
     +             000000,I,CODE)      /* write header and fill
       IF( CODE.NE.0 ) GOTO 250
       CALL PRWF$$(K$WRIT,GU,LOC(HBUF),CENTS*S$NLEN,000000,I,CODE)
       IF (CODE.NE.0) GO TO 250
C
C---Insert entry
C
190    CODE=E$ROOM                     /* in case queue is full
       IF( CEMTY .AND. CHEAD.EQ.CTAIL ) GOTO 250      /* queue full?
C
       POS4=(CTAIL-1)*(CSIZE+1)+HSIZE  /* get position of entry
       CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(BUF),CSIZE+1,POS4,I,CODE)
       IF( CODE.NE.0 ) GOTO 250
      IF (CTAIL.NE.1) GO TO 188
      CALL PRWF$$(K$POSN+K$PREA,GU,LOC(0),0,008208,0,CODE)
      IF (CODE.EQ.E$EOF) GO TO 189
C
188    CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(S$BUFF),S$NLEN,
     &   INTL(HSIZE+CENTS*(CSIZE+1)+(CTAIL-1)*S$NLEN),I,CODE)
       IF (CODE.NE.E$EOF) GO TO 195
C
189    CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(HBUF),CENTS*S$NLEN,
     &   INTL(HSIZE+CENTS*(CSIZE+1)),I,CODE)
       IF (CODE.NE.0) GO TO 250
       CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(S$BUFF),S$NLEN,
     &   INTL(HSIZE+CENTS*(CSIZE+1)+(CTAIL-1)*S$NLEN),I,CODE)
       IF (CODE.NE.0) GO TO 250
C
195   IF (CODE.NE.0) GO TO 250
C
C
       QENTNO=CTAIL                    /* store entry number
       CTAIL=MOD(CTAIL,CENTS)+1        /* increment and check wrap
       CEMTY=.TRUE.                    /* queue not empty
C
       CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(HBUF),HSIZE,000000,I,CODE)
       IF( CODE.NE.0 ) GOTO 250
C
C---Build name and open print file
C
       INFO(8)='PR'
       INFO(9)='T0'+QENTNO/100
       I=MOD(QENTNO,100)
       INFO(10)=LS(I/10,8)+MOD(I,10)+'00'
C
       OPKEY=K$RDWR+K$GETU             /* use this when KEY=1
       IF( KEY.EQ.1 ) GOTO 200
       OPKEY=K$RDWR
       GU3=INFO(2)                     /* use the user's unit
C
C---Begin GT changes
C
C200    CALL SRCH$$(OPKEY,INFO(8),6,GU3,I,CODE)
C
200    CALL COMO$$(:120,INFO(8),6,0,CODE) /* ****SPECIAL MODS**** gt */
       CALL SRCH$$(K$CLOS,0,0,GU,0,I)
       CALL BREAK$(.FALSE.)  /* queue is safe now
       IF( CODE.NE.0 ) GOTO 225
C       CALL PRWF$$(K$TRNC,GU3,LOC(0),0,000000,0,CODE) /* delete what's here
C       IF ( CODE.NE.0 ) GOTO 225
C
C---End   GT changes
C
       IF( KEY.NE.1 ) GOTO 270         /* done if -OPEN operation
C
C---Copy another block of the file
C
210    CALL PRWF$$(K$READ+K$CONV,GU2,LOC(BUF),BUFLEN,000000,I,CODE)
       IF( CODE.NE.0 .AND. CODE.NE.E$EOF ) GOTO 220   /* go delete if error
C
       IF( I.EQ.0 ) GOTO 230           /* EOF, finish up
       CALL PRWF$$(K$WRIT,GU3,LOC(BUF),I,000000,J,CODE)
       IF( CODE.EQ.0 ) GOTO 210
C
C---A read/write error, get rid of the evidence, watch locking (tricky)
C
220    CALL PRWF$$(K$TRNC+K$PREA,GU3,LOC(0),0,000000,0,I) /* delete most
225    CALL Q$REM(QNAM,GU,QENTNO,I)    /* remove entry
       IF( CODE.EQ.E$UIUS ) GOTO 250
       CALL SRCH$$(K$CLOS,0,0,GU3,0,I)
       CALL SRCH$$(K$DELE,INFO(8),6,GU3,0,I)
       GOTO 250
C
C---Transfer complete
C
230    CALL PRWF$$(K$RPOS,GU3,LOC(0),0,LINFO,0,CODE)  /* get file length
       IF( CODE.NE.0 ) GOTO 220
      LINFO=(LINFO+RECSIZ-INTL(1))/RECSIZ       /* calculate size (normalized)
       IF( AND(INFO(3),:20).NE.0 ) LINFO=LINFO*INTL(INFO(29)) /* copies
       IF (LINFO.GT.032767) LINFO=032767
       INFO(12)=INTS(LINFO)
C
C---Update queue with size
C
       CALL Q$OFFC(GU,QNAM,6,K$RDWR,CODE)
       IF( CODE.NE.0 ) GOTO 250
C
       CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(INFO(12)),1,POS4+29,J,CODE)
C
       CALL SRCH$$(K$CLOS,0,0,GU3,0,I) /* unit used for print file
       CALL SEM$DR(-32,I)
250    CALL SRCH$$(K$CLOS,0,0,GU,0,I)  /* unit used for queue
       CALL BREAK$(.FALSE.)
260    CALL SRCH$$(K$CLOS,0,0,GU2,0,I) /* unit used for user's file
270    CALL ATCH$$(K$HOME,0,0,0,0,I)
C
       RETURN
C
       END
