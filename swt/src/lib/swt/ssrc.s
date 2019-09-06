* at$swt --- bad-password-proof interlude to atch$$

            SUBR     AT$SWT

            SEG
            RLIT

* ERRD.INS.PMA, PRIMOS>INSERT, PRIMOS GROUP, 11/16/82
* MNEMONIC CODES FOR FILE SYSTEM (PMA)
* Copyright (c) 1982, Prime Computer, Inc., Natick, MA 01760
        NLST
*
*  Adding a code requires changes to: ERRD.INS.@@ and FS>ERRCOM.PMA *
*
*
*  MODIFICATIONS:
*  01/21/83 HANTMAN  Added E$NSB for MAGNET,MAGLIB and LABEL to detect
*           .......  NSB labelled tapes.
*  11/16/82 Goggin   Added NAMELIST error codes for library error processing.
*  10/29/82 HChen       Added E$MNPX (illegal mutiple hoping in NPX ).
*  09/10/82 Kroczak     Added E$RESF (Improper access to restricted file).
*  04/04/82 HChen       Added E$APND (for R$BGIN) and E$BVCC.
*  03/24/82 Weinberg    Added E$NFAS (not found in attach scan).
*  12/14/81 Huber    changed T$GPPI error codes to match rev 18. To do
*           .....    this changed E$RSNU from 137 to 140 and filled the
*           .....    previously held codes with E$CTPR, E$DLPR, E$DFPR.
*  11/06/81 Weinberg changed codes for ACL rewrite.
*  10/26/81 Goggin   Added F$IO error codes for translator group.
*  10/22/81 HChen    used a spare one, 137, for E$RSNU
*  05/22/81 Detroy   add T$GPPI error codes
*  04/07/81 Cecchin  merged new errors for Acls  (for Ben Crocker).
*  03/25/81 Cecchin  added NPX error codes from 18 to fix mismatch
*           .......  between 18 and 19. Also added spare 18 error codes
*           .......  as a temporary solution.
*
*      TABSET 8 14 33 65 74
*
***********************************************************************
*                                                                     *
*                                                                     *
*                    CODE DEFINITIONS                                 *
*                                                                     *
*                                                                     *
E$EOF  EQU    00001             * END OF FILE                   PE       *
E$BOF  EQU    00002             * BEGINNING OF FILE             PG       *
E$UNOP EQU    00003             * UNIT NOT OPEN                 PD,SD    *
E$UIUS EQU    00004             * UNIT IN USE                   SI       *
E$FIUS EQU    00005             * FILE IN USE                   SI       *
E$BPAR EQU    00006             * BAD PARAMETER                 SA       *
E$NATT EQU    00007             * NO UFD ATTACHED               SL,AL    *
E$FDFL EQU    00008             * UFD FULL                      SK       *
E$DKFL EQU    00009             * DISK FULL                     DJ       *
E$NRIT EQU    00010             * NO RIGHT                      SX       *
E$FDEL EQU    00011             * FILE OPEN ON DELETE           SD       *
E$NTUD EQU    00012             * NOT A UFD                     AR       *
E$NTSD EQU    00013             * NOT A SEGDIR                  --       *
E$DIRE EQU    00014             * IS A DIRECTORY                --       *
E$FNTF EQU    00015             * (FILE) NOT FOUND              SH,AH    *
E$FNTS EQU    00016             * (FILE) NOT FOUND IN SEGDIR    SQ       *
E$BNAM EQU    00017             * ILLEGAL NAME                  CA       *
E$EXST EQU    00018             * ALREADY EXISTS                CZ       *
E$DNTE EQU    00019             * DIRECTORY NOT EMPTY           --       *
E$SHUT EQU    00020             * BAD SHUTDN (FAM ONLY)         BS       *
E$DISK EQU    00021             * DISK I/O ERROR                WB       *
E$BDAM EQU    00022             * BAD DAM FILE (FAM ONLY)       SS       *
E$PTRM EQU    00023             * PTR MISMATCH (FAM ONLY)       PC,DC,AC *
E$BPAS EQU    00024             * BAD PASSWORD (FAM ONLY)       AN       *
E$BCOD EQU    00025             * BAD CODE IN ERRVEC            --       *
E$BTRN EQU    00026             * BAD TRUNCATE OF SEGDIR        --       *
E$OLDP EQU    00027             * OLD PARTITION                 --       *
E$BKEY EQU    00028             * BAD KEY                       --       *
E$BUNT EQU    00029             * BAD UNIT NUMBER               --       *
E$BSUN EQU    00030             * BAD SEGDIR UNIT               SA       *
E$SUNO EQU    00031             * SEGDIR UNIT NOT OPEN          --       *
E$NMLG EQU    00032             * NAME TOO LONG                 --       *
E$SDER EQU    00033             * SEGDIR ERROR                  SQ       *
E$BUFD EQU    00034             * BAD UFD                       --       *
E$BFTS EQU    00035             * BUFFER TOO SMALL              --       *
E$FITB EQU    00036             * FILE TOO BIG                  --       *
E$NULL EQU    00037             * (NULL MESSAGE)                --       *
E$IREM EQU    00038             * ILL REMOTE REF                --       *
E$DVIU EQU    00039             * DEVICE IN USE                 --       *
E$RLDN EQU    00040             * REMOTE LINE DOWN              --       *
E$FUIU EQU    00041             * ALL REMOTE UNITS IN USE       --       *
E$DNS  EQU    00042             * DEVICE NOT STARTED            --       *
E$TMUL EQU    00043             * TOO MANY UFD LEVELS           --       *
E$FBST EQU    00044             * FAM - BAD STARTUP             --       *
E$BSGN EQU    00045             * BAD SEGMENT NUMBER            --       *
E$FIFC EQU    00046             * INVALID FAM FUNCTION CODE     --       *
E$TMRU EQU    00047             * MAX REMOTE USERS EXCEEDED     --       *
E$NASS EQU    00048             * DEVICE NOT ASSIGNED           --       *
E$BFSV EQU    00049             * BAD FAM SVC                   --       *
E$SEMO EQU    00050             * SEM OVERFLOW                  --       *
E$NTIM EQU    00051             * NO TIMER                      --       *
E$FABT EQU    00052             * FAM ABORT                     --       *
E$FONC EQU    00053             * FAM OP NOT COMPLETE           --       *
E$NPHA EQU    00054             * NO PHANTOMS AVAILABLE         -        *
E$ROOM EQU    00055             * NO ROOM                       --       *
E$WTPR EQU    00056             * DISK WRITE-PROTECTED          JF       *
E$ITRE EQU    00057             * ILLEGAL TREENAME              FE       *
E$FAMU EQU    00058             * FAM IN USE                    --       *
E$TMUS EQU    00059             * MAX USERS EXCEEDED            --       *
E$NCOM EQU    00060             * NULL_COMLINE                  --       *
E$NFLT EQU    00061             * NO_FAULT_FR                   --       *
E$STKF EQU    00062             * BAD STACK FORMAT              --       *
E$STKS EQU    00063             * BAD STACK ON SIGNAL           --       *
E$NOON EQU    00064             * NO ON UNIT FOR CONDITION      --       *
E$CRWL EQU    00065             * BAD CRAWLOUT                  --       *
E$CROV EQU    00066             * STACK OVFLO DURING CRAWLOUT   --       *
E$CRUN EQU    00067             * CRAWLOUT UNWIND FAIL          --       *
E$CMND EQU    00068             * BAD COMMAND FORMAT            --       *
E$RCHR EQU    00069             * RESERVED CHARACTER            --       *
E$NEXP EQU    00070             * CANNOT EXIT TO COMMAND PROC   --       *
E$BARG EQU    00071             * BAD COMMAND ARG               --       *
E$CSOV EQU    00072             * CONC STACK OVERFLOW           --       *
E$NOSG EQU    00073             * SEGMENT DOES NOT EXIST        --       *
E$TRCL EQU    00074             * TRUNCATED COMMAND LINE        --       *
E$NDMC EQU    00075             * NO SMLC DMC CHANNELS          --       *
E$DNAV EQU    00076             * DEVICE NOT AVAILABLE         DPTX      *
E$DATT EQU    00077             * DEVICE NOT ATTACHED           --       *
E$BDAT EQU    00078             * BAD DATA                      --       *
E$BLEN EQU    00079             * BAD LENGTH                    --       *
E$BDEV EQU    00080             * BAD DEVICE NUMBER             --       *
E$QLEX EQU    00081             * QUEUE LENGTH EXCEEDED         --       *
E$NBUF EQU    00082             * NO BUFFER SPACE               --       *
E$INWT EQU    00083             * INPUT WAITING                 --       *
E$NINP EQU    00084             * NO INPUT AVAILABLE            --       *
E$DFD  EQU    00085             * DEVICE FORCIBLY DETACHED      --       *
E$DNC  EQU    00086             * DPTX NOT CONFIGURED           --       *
E$SICM EQU    00087             * ILLEGAL 3270 COMMAND          --       *
E$SBCF EQU    00088             * BAD 'FROM' DEVICE             --       *
E$VKBL EQU    00089             * KBD LOCKED                    --       *
E$VIA  EQU    00090             * INVALID AID BYTE              --       *
E$VICA EQU    00091             * INVALID CURSOR ADDRESS        --       *
E$VIF  EQU    00092             * INVALID FIELD                 --       *
E$VFR  EQU    00093             * FIELD REQUIRED                --       *
E$VFP  EQU    00094             * FIELD PROHIBITED              --       *
E$VPFC EQU    00095             * PROTECTED FIELD CHECK         --       *
E$VNFC EQU    00096             * NUMERIC FIELD CHECK           --       *
E$VPEF EQU    00097             * PAST END OF FIELD             --       *
E$VIRC EQU    00098             * INVALID READ MOD CHAR         --       *
E$IVCM EQU    00099             * INVALID COMMAND               --       *
E$DNCT EQU    00100             * DEVICE NOT CONNECTED          --       *
E$BNWD EQU    00101             * BAD NO. OF WORDS              --       *
E$SGIU EQU    00102             * SEGMENT IN USE                --       *
E$NESG EQU    00103             * NOT ENOUGH SEGMENTS (VINIT$)  --       *
E$SDUP EQU    00104             * DUPLICATE SEGMENTS (VINIT$)   --       *
E$IVWN EQU    00105             * INVALID WINDOW NUMBER         --       *
E$WAIN EQU    00106             * WINDOW ALREADY INITIATED      --       *
E$NMVS EQU    00107             * NO MORE VMFA SEGMENTS         --       *
E$NMTS EQU    00108             * NO MORE TEMP SEGMENTS         --       *
E$NDAM EQU    00109             * NOT A DAM FILE                --       *
E$NOVA EQU    00110             * NOT OPEN FOR VMFA             --       *
E$NECS EQU    00111             * NOT ENOUGH CONTIGUOUS SEGMENTS         *
E$NRCV EQU    00112             * REQUIRES RECEIVE ENABLED      --       *
E$UNRV EQU    00113             * USER NOT RECEIVING NOW        --       *
E$UBSY EQU    00114             * USER BUSY, PLEASE WAIT        --       *
E$UDEF EQU    00115             * USER UNABLE TO RECEIVE MESSAGES        *
E$UADR EQU    00116             * UNKNOWN ADDRESSEE             --       *
E$PRTL EQU    00117             * OPERATION PARTIALLY BLOCKED   --       *
E$NSUC EQU    00118             * OPERATION UNSUCCESSFUL        --       *
E$NROB EQU    00119             * NO ROOM IN OUTPUT BUFFER      --       *
E$NETE EQU    00120             * NETWORK ERROR ENCOUNTERED     --       *
E$SHDN EQU    00121             * DISK HAS BEEN SHUT DOWN       FS       *
E$UNOD EQU    00122             * UNKNOWN NODE NAME (PRIMENET)           *
E$NDAT EQU    00123             * NO DATA FOUND                 --       *
E$ENQD EQU    00124             * ENQUED ONLY                   --       *
E$PHNA EQU    00125             * PROTOCOL HANDLER NOT AVAIL   DPTX      *
E$IWST EQU    00126             * E$INWT ENABLED BY CONFIG     DPTX      *
E$BKFP EQU    00127             * BAD KEY FOR THIS PROTOCOL    DPTX      *
E$BPRH EQU    00128             * BAD PROTOCOL HANDLER (TAT)   DPTX      *
E$ABTI EQU    00129             * IO ABORT IN PROGRESS         DPTX      *
E$ILFF EQU    00130             * ILLEGAL DPTX FILE FORMAT     DPTX      *
E$TMED EQU    00131             * TOO MANY EMULATE DEVICES     DPTX      *
E$DANC EQU    00132             * DPTX ALREADY CONFIGURED      DPTX      *
E$NENB EQU    00133             * REMOTE NODE NOT ENABLED       NPX      *
E$NSLA EQU    00134             * NO NPX SLAVES AVAILABLE       ---      *
E$PNTF EQU    00135             * PROCEDURE NOT FOUND          R$CALL    *
E$SVAL EQU    00136             * SLAVE VALIDATION ERROR       R$CALL    *
E$IEDI EQU    00137             * I/O error or device interrupt (GPPI)   *
E$WMST EQU    00138             * Warm start happened (GPPI)             *
E$DNSK EQU    00139             * A pio instruction did not skip (GPPI)  *
E$RSNU EQU    00140             * REMOTE SYSTEM NOT UP         R$CALL    *
E$S18E EQU    00141             * SPARE REV18 ERROR CODES                *
*
* New error codes for REV19 begin here.
*
E$NFQB EQU    00142             * NO FREE QUOTA BLOCKS          --       *
E$MXQB EQU    00143             * MAXIMUM QUOTA EXCEEDED        --       *
E$NOQD EQU    00144             * NOT A QUOTA DISK (RUN VFIXRAT)         *
E$QEXC EQU    00145             * SETTING QUOTA BELOW EXISTING USAGE     *
E$IMFD EQU    00146             * Operation illegal on MFD               *
E$NACL EQU    00147             * Not an ACL directory                   *
E$PNAC EQU    00148             * Parent not an ACL directory            *
E$NTFD EQU    00149             * Not a file or directory                *
E$IACL EQU    00150             * Entry is an ACL                        *
E$NCAT EQU    00151             * Not an access category                 *
E$LRNA EQU    00152             * Like reference not available           *
E$CPMF EQU    00153             * Category protects MFD                  *
E$ACBG EQU    00154             * ACL TOO BIG                   --       *
E$ACNF EQU    00155             * Access category not found              *
E$LRNF EQU    00156             * Like reference not found               *
E$BACL EQU    00157             * BAD ACL                       --       *
E$BVER EQU    00158             * BAD VERSION                   --       *
E$NINF EQU    00159             * NO INFORMATION                --       *
E$CATF EQU    00160             * Access category found (Ac$rvt)         *
E$ADRF EQU    00161             * ACL directory found (Ac$rvt)           *
E$NVAL EQU    00162             * Validation error (login)      --       *
E$LOGO EQU    00163             * Logout (code for fatal$)      --       *
E$NUTP EQU    00164             * No unit table availabe.(PHANT$)        *
E$UTAR EQU    00165             * Unit table already returned.(UTDALC)   *
E$UNIU EQU    00166             * Unit table not in use.(RTUTBL)         *
E$NFUT EQU    00167             * No free unit table.(GTUTBL)            *
E$UAHU EQU    00168             * User already has unit table.(UTALOC)   *
E$PANF EQU    00169             * Priority ACL not found.                *
E$MISA EQU    00170             * Missing argument to command.           *
E$SCCM EQU    00171             * System console command only.           *
E$BRPA EQU    00172             * Bad remote password        R$CALL      *
E$DTNS EQU    00173             * Date and time not set yet.             *
E$SPND EQU    00174             * REMOTE PROCEDURE CALL STILL PENDING    *
E$BCFG EQU    00175             * NETWORK CONFIGURATION MISMATCH         *
E$BMOD EQU    00176             * Illegal access mode        AC$SET      *
E$BID  EQU    00177             * Illegal identifier         AC$SET      *
E$ST19 EQU    00178             * Operation illegal on pre-19 disk       *
E$CTPR EQU    00179             * Object is category-protected (Ac$chg)  *
E$DFPR EQU    00180             * Object is default-protected (Ac$chg)   *
E$DLPR EQU    00181             * File is delete-protected (Fil$dl)      *
E$BLUE EQU    00182             * Bad LUBTL entry   (F$IO)               *
E$NDFD EQU    00183             * No driver for device  (F$IO)           *
E$WFT  EQU    00184             * Wrong file type (F$IO)                 *
E$FDMM EQU    00185             * Format/data mismatch (F$IO)            *
E$FER  EQU    00186             * Bad format  (F$IO)                     *
E$BDV  EQU    00187             * Bad dope vector (F$IO)                 *
E$BFOV EQU    00188             * F$IOBF overflow  (F$IO)                *
E$NFAS EQU    00189             * Top-level dir not found or inaccessible*
E$APND EQU    00190             * Asynchrouns procedure still pending    *
E$BVCC EQU    00191             * Bad virtual circuit clearing           *
E$RESF EQU    00192             * Improper access to restricted file     *
E$MNPX EQU    00193             * Illegal multiple hoppings in NPX       *
E$SYNT EQU    00194             * SYNTanx error                          *
E$USTR EQU    00195             * Unterminated STRing                    *
E$WNS  EQU    00196             * Wrong Number of Subscripts             *
E$IREQ EQU    00197             * Integer REQuired                       *
E$VNG  EQU    00198             * Variable Not in namelist Group         *
E$SOR  EQU    00199             * Subscript Out of Range                 *
E$TMVV EQU    00200             * Too Many Values for Variable           *
E$ESV  EQU    00201             * Expected String Value                  *
E$VABS EQU    00202             * Variable Array Bounds or Size          *
E$BCLC EQU    00203             * Bad Compiler Library Call              *
E$NSB  EQU    00204             * NSB labelled tape was detected         *
E$LAST EQU    00204             * THIS ***MUST*** BE LAST       --       *
*                                                                        *
*                                                                        *
**************************************************************************
       LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
AT$SWT      ECB      AT$0,,NAME,6,66
            DATA     6,C'AT$SWT'
            PROC

            DYNM     =38,NAME(3),NAMEL(3),LDISK(3),PWD(3),KEY(3),CODE(3)
            DYNM     ARGS(6),DESCR(4)

            EXT      MKONU$

AT$0        ARGT
            ENTR     AT$SWT

            EAL      BP_UNIT
            STL      DESCR+0
            EAL      SB%
            STL      DESCR+2
            EAL      CNAME
            STL      ARGS+0
            EAL      DESCR
            STL      ARGS+3
            EAL      ARGS
            JSXB     MKONU$

            CALL     ATCH$$
            AP       NAME,*S
            AP       NAMEL,*S
            AP       LDISK,*S
            AP       PWD,*S
            AP       KEY,*S
            AP       CODE,*SL
            PRTN

BP          LDA      =E$BPAS
            STA      CODE,*
            PRTN

CNAME       DATA     13,C'BAD_PASSWORD$'
            EJCT
* bp_unit --- on-unit for the BAD_PASSWORD$ condition

            DYNM     =20,CP(3),LABEL(4)

            LINK
BP_UNIT     ECB      BP_UNIT0,,CP,1,28
            DATA     11,C'AT$.BP_UNIT'
            PROC

BP_UNIT0    ARGT
            STL      LABEL+2
            EAL      BP
            IAB
            STL      LABEL+0
            CALL     PL1$NL
            AP       LABEL,SL

            END
* call$$ --- execute a P300 or SEG or EPF runfile as a procedure
*
* integer function call$$ (name, length)
* integer name (16), length

            SUBR     CALL$$

            SEG
            RLIT

* ERRD.INS.PMA, PRIMOS>INSERT, PRIMOS GROUP, 11/16/82
* MNEMONIC CODES FOR FILE SYSTEM (PMA)
* Copyright (c) 1982, Prime Computer, Inc., Natick, MA 01760
        NLST
*
*  Adding a code requires changes to: ERRD.INS.@@ and FS>ERRCOM.PMA *
*
*
*  MODIFICATIONS:
*  01/21/83 HANTMAN  Added E$NSB for MAGNET,MAGLIB and LABEL to detect
*           .......  NSB labelled tapes.
*  11/16/82 Goggin   Added NAMELIST error codes for library error processing.
*  10/29/82 HChen       Added E$MNPX (illegal mutiple hoping in NPX ).
*  09/10/82 Kroczak     Added E$RESF (Improper access to restricted file).
*  04/04/82 HChen       Added E$APND (for R$BGIN) and E$BVCC.
*  03/24/82 Weinberg    Added E$NFAS (not found in attach scan).
*  12/14/81 Huber    changed T$GPPI error codes to match rev 18. To do
*           .....    this changed E$RSNU from 137 to 140 and filled the
*           .....    previously held codes with E$CTPR, E$DLPR, E$DFPR.
*  11/06/81 Weinberg changed codes for ACL rewrite.
*  10/26/81 Goggin   Added F$IO error codes for translator group.
*  10/22/81 HChen    used a spare one, 137, for E$RSNU
*  05/22/81 Detroy   add T$GPPI error codes
*  04/07/81 Cecchin  merged new errors for Acls  (for Ben Crocker).
*  03/25/81 Cecchin  added NPX error codes from 18 to fix mismatch
*           .......  between 18 and 19. Also added spare 18 error codes
*           .......  as a temporary solution.
*
*      TABSET 8 14 33 65 74
*
***********************************************************************
*                                                                     *
*                                                                     *
*                    CODE DEFINITIONS                                 *
*                                                                     *
*                                                                     *
E$EOF  EQU    00001             * END OF FILE                   PE       *
E$BOF  EQU    00002             * BEGINNING OF FILE             PG       *
E$UNOP EQU    00003             * UNIT NOT OPEN                 PD,SD    *
E$UIUS EQU    00004             * UNIT IN USE                   SI       *
E$FIUS EQU    00005             * FILE IN USE                   SI       *
E$BPAR EQU    00006             * BAD PARAMETER                 SA       *
E$NATT EQU    00007             * NO UFD ATTACHED               SL,AL    *
E$FDFL EQU    00008             * UFD FULL                      SK       *
E$DKFL EQU    00009             * DISK FULL                     DJ       *
E$NRIT EQU    00010             * NO RIGHT                      SX       *
E$FDEL EQU    00011             * FILE OPEN ON DELETE           SD       *
E$NTUD EQU    00012             * NOT A UFD                     AR       *
E$NTSD EQU    00013             * NOT A SEGDIR                  --       *
E$DIRE EQU    00014             * IS A DIRECTORY                --       *
E$FNTF EQU    00015             * (FILE) NOT FOUND              SH,AH    *
E$FNTS EQU    00016             * (FILE) NOT FOUND IN SEGDIR    SQ       *
E$BNAM EQU    00017             * ILLEGAL NAME                  CA       *
E$EXST EQU    00018             * ALREADY EXISTS                CZ       *
E$DNTE EQU    00019             * DIRECTORY NOT EMPTY           --       *
E$SHUT EQU    00020             * BAD SHUTDN (FAM ONLY)         BS       *
E$DISK EQU    00021             * DISK I/O ERROR                WB       *
E$BDAM EQU    00022             * BAD DAM FILE (FAM ONLY)       SS       *
E$PTRM EQU    00023             * PTR MISMATCH (FAM ONLY)       PC,DC,AC *
E$BPAS EQU    00024             * BAD PASSWORD (FAM ONLY)       AN       *
E$BCOD EQU    00025             * BAD CODE IN ERRVEC            --       *
E$BTRN EQU    00026             * BAD TRUNCATE OF SEGDIR        --       *
E$OLDP EQU    00027             * OLD PARTITION                 --       *
E$BKEY EQU    00028             * BAD KEY                       --       *
E$BUNT EQU    00029             * BAD UNIT NUMBER               --       *
E$BSUN EQU    00030             * BAD SEGDIR UNIT               SA       *
E$SUNO EQU    00031             * SEGDIR UNIT NOT OPEN          --       *
E$NMLG EQU    00032             * NAME TOO LONG                 --       *
E$SDER EQU    00033             * SEGDIR ERROR                  SQ       *
E$BUFD EQU    00034             * BAD UFD                       --       *
E$BFTS EQU    00035             * BUFFER TOO SMALL              --       *
E$FITB EQU    00036             * FILE TOO BIG                  --       *
E$NULL EQU    00037             * (NULL MESSAGE)                --       *
E$IREM EQU    00038             * ILL REMOTE REF                --       *
E$DVIU EQU    00039             * DEVICE IN USE                 --       *
E$RLDN EQU    00040             * REMOTE LINE DOWN              --       *
E$FUIU EQU    00041             * ALL REMOTE UNITS IN USE       --       *
E$DNS  EQU    00042             * DEVICE NOT STARTED            --       *
E$TMUL EQU    00043             * TOO MANY UFD LEVELS           --       *
E$FBST EQU    00044             * FAM - BAD STARTUP             --       *
E$BSGN EQU    00045             * BAD SEGMENT NUMBER            --       *
E$FIFC EQU    00046             * INVALID FAM FUNCTION CODE     --       *
E$TMRU EQU    00047             * MAX REMOTE USERS EXCEEDED     --       *
E$NASS EQU    00048             * DEVICE NOT ASSIGNED           --       *
E$BFSV EQU    00049             * BAD FAM SVC                   --       *
E$SEMO EQU    00050             * SEM OVERFLOW                  --       *
E$NTIM EQU    00051             * NO TIMER                      --       *
E$FABT EQU    00052             * FAM ABORT                     --       *
E$FONC EQU    00053             * FAM OP NOT COMPLETE           --       *
E$NPHA EQU    00054             * NO PHANTOMS AVAILABLE         -        *
E$ROOM EQU    00055             * NO ROOM                       --       *
E$WTPR EQU    00056             * DISK WRITE-PROTECTED          JF       *
E$ITRE EQU    00057             * ILLEGAL TREENAME              FE       *
E$FAMU EQU    00058             * FAM IN USE                    --       *
E$TMUS EQU    00059             * MAX USERS EXCEEDED            --       *
E$NCOM EQU    00060             * NULL_COMLINE                  --       *
E$NFLT EQU    00061             * NO_FAULT_FR                   --       *
E$STKF EQU    00062             * BAD STACK FORMAT              --       *
E$STKS EQU    00063             * BAD STACK ON SIGNAL           --       *
E$NOON EQU    00064             * NO ON UNIT FOR CONDITION      --       *
E$CRWL EQU    00065             * BAD CRAWLOUT                  --       *
E$CROV EQU    00066             * STACK OVFLO DURING CRAWLOUT   --       *
E$CRUN EQU    00067             * CRAWLOUT UNWIND FAIL          --       *
E$CMND EQU    00068             * BAD COMMAND FORMAT            --       *
E$RCHR EQU    00069             * RESERVED CHARACTER            --       *
E$NEXP EQU    00070             * CANNOT EXIT TO COMMAND PROC   --       *
E$BARG EQU    00071             * BAD COMMAND ARG               --       *
E$CSOV EQU    00072             * CONC STACK OVERFLOW           --       *
E$NOSG EQU    00073             * SEGMENT DOES NOT EXIST        --       *
E$TRCL EQU    00074             * TRUNCATED COMMAND LINE        --       *
E$NDMC EQU    00075             * NO SMLC DMC CHANNELS          --       *
E$DNAV EQU    00076             * DEVICE NOT AVAILABLE         DPTX      *
E$DATT EQU    00077             * DEVICE NOT ATTACHED           --       *
E$BDAT EQU    00078             * BAD DATA                      --       *
E$BLEN EQU    00079             * BAD LENGTH                    --       *
E$BDEV EQU    00080             * BAD DEVICE NUMBER             --       *
E$QLEX EQU    00081             * QUEUE LENGTH EXCEEDED         --       *
E$NBUF EQU    00082             * NO BUFFER SPACE               --       *
E$INWT EQU    00083             * INPUT WAITING                 --       *
E$NINP EQU    00084             * NO INPUT AVAILABLE            --       *
E$DFD  EQU    00085             * DEVICE FORCIBLY DETACHED      --       *
E$DNC  EQU    00086             * DPTX NOT CONFIGURED           --       *
E$SICM EQU    00087             * ILLEGAL 3270 COMMAND          --       *
E$SBCF EQU    00088             * BAD 'FROM' DEVICE             --       *
E$VKBL EQU    00089             * KBD LOCKED                    --       *
E$VIA  EQU    00090             * INVALID AID BYTE              --       *
E$VICA EQU    00091             * INVALID CURSOR ADDRESS        --       *
E$VIF  EQU    00092             * INVALID FIELD                 --       *
E$VFR  EQU    00093             * FIELD REQUIRED                --       *
E$VFP  EQU    00094             * FIELD PROHIBITED              --       *
E$VPFC EQU    00095             * PROTECTED FIELD CHECK         --       *
E$VNFC EQU    00096             * NUMERIC FIELD CHECK           --       *
E$VPEF EQU    00097             * PAST END OF FIELD             --       *
E$VIRC EQU    00098             * INVALID READ MOD CHAR         --       *
E$IVCM EQU    00099             * INVALID COMMAND               --       *
E$DNCT EQU    00100             * DEVICE NOT CONNECTED          --       *
E$BNWD EQU    00101             * BAD NO. OF WORDS              --       *
E$SGIU EQU    00102             * SEGMENT IN USE                --       *
E$NESG EQU    00103             * NOT ENOUGH SEGMENTS (VINIT$)  --       *
E$SDUP EQU    00104             * DUPLICATE SEGMENTS (VINIT$)   --       *
E$IVWN EQU    00105             * INVALID WINDOW NUMBER         --       *
E$WAIN EQU    00106             * WINDOW ALREADY INITIATED      --       *
E$NMVS EQU    00107             * NO MORE VMFA SEGMENTS         --       *
E$NMTS EQU    00108             * NO MORE TEMP SEGMENTS         --       *
E$NDAM EQU    00109             * NOT A DAM FILE                --       *
E$NOVA EQU    00110             * NOT OPEN FOR VMFA             --       *
E$NECS EQU    00111             * NOT ENOUGH CONTIGUOUS SEGMENTS         *
E$NRCV EQU    00112             * REQUIRES RECEIVE ENABLED      --       *
E$UNRV EQU    00113             * USER NOT RECEIVING NOW        --       *
E$UBSY EQU    00114             * USER BUSY, PLEASE WAIT        --       *
E$UDEF EQU    00115             * USER UNABLE TO RECEIVE MESSAGES        *
E$UADR EQU    00116             * UNKNOWN ADDRESSEE             --       *
E$PRTL EQU    00117             * OPERATION PARTIALLY BLOCKED   --       *
E$NSUC EQU    00118             * OPERATION UNSUCCESSFUL        --       *
E$NROB EQU    00119             * NO ROOM IN OUTPUT BUFFER      --       *
E$NETE EQU    00120             * NETWORK ERROR ENCOUNTERED     --       *
E$SHDN EQU    00121             * DISK HAS BEEN SHUT DOWN       FS       *
E$UNOD EQU    00122             * UNKNOWN NODE NAME (PRIMENET)           *
E$NDAT EQU    00123             * NO DATA FOUND                 --       *
E$ENQD EQU    00124             * ENQUED ONLY                   --       *
E$PHNA EQU    00125             * PROTOCOL HANDLER NOT AVAIL   DPTX      *
E$IWST EQU    00126             * E$INWT ENABLED BY CONFIG     DPTX      *
E$BKFP EQU    00127             * BAD KEY FOR THIS PROTOCOL    DPTX      *
E$BPRH EQU    00128             * BAD PROTOCOL HANDLER (TAT)   DPTX      *
E$ABTI EQU    00129             * IO ABORT IN PROGRESS         DPTX      *
E$ILFF EQU    00130             * ILLEGAL DPTX FILE FORMAT     DPTX      *
E$TMED EQU    00131             * TOO MANY EMULATE DEVICES     DPTX      *
E$DANC EQU    00132             * DPTX ALREADY CONFIGURED      DPTX      *
E$NENB EQU    00133             * REMOTE NODE NOT ENABLED       NPX      *
E$NSLA EQU    00134             * NO NPX SLAVES AVAILABLE       ---      *
E$PNTF EQU    00135             * PROCEDURE NOT FOUND          R$CALL    *
E$SVAL EQU    00136             * SLAVE VALIDATION ERROR       R$CALL    *
E$IEDI EQU    00137             * I/O error or device interrupt (GPPI)   *
E$WMST EQU    00138             * Warm start happened (GPPI)             *
E$DNSK EQU    00139             * A pio instruction did not skip (GPPI)  *
E$RSNU EQU    00140             * REMOTE SYSTEM NOT UP         R$CALL    *
E$S18E EQU    00141             * SPARE REV18 ERROR CODES                *
*
* New error codes for REV19 begin here.
*
E$NFQB EQU    00142             * NO FREE QUOTA BLOCKS          --       *
E$MXQB EQU    00143             * MAXIMUM QUOTA EXCEEDED        --       *
E$NOQD EQU    00144             * NOT A QUOTA DISK (RUN VFIXRAT)         *
E$QEXC EQU    00145             * SETTING QUOTA BELOW EXISTING USAGE     *
E$IMFD EQU    00146             * Operation illegal on MFD               *
E$NACL EQU    00147             * Not an ACL directory                   *
E$PNAC EQU    00148             * Parent not an ACL directory            *
E$NTFD EQU    00149             * Not a file or directory                *
E$IACL EQU    00150             * Entry is an ACL                        *
E$NCAT EQU    00151             * Not an access category                 *
E$LRNA EQU    00152             * Like reference not available           *
E$CPMF EQU    00153             * Category protects MFD                  *
E$ACBG EQU    00154             * ACL TOO BIG                   --       *
E$ACNF EQU    00155             * Access category not found              *
E$LRNF EQU    00156             * Like reference not found               *
E$BACL EQU    00157             * BAD ACL                       --       *
E$BVER EQU    00158             * BAD VERSION                   --       *
E$NINF EQU    00159             * NO INFORMATION                --       *
E$CATF EQU    00160             * Access category found (Ac$rvt)         *
E$ADRF EQU    00161             * ACL directory found (Ac$rvt)           *
E$NVAL EQU    00162             * Validation error (login)      --       *
E$LOGO EQU    00163             * Logout (code for fatal$)      --       *
E$NUTP EQU    00164             * No unit table availabe.(PHANT$)        *
E$UTAR EQU    00165             * Unit table already returned.(UTDALC)   *
E$UNIU EQU    00166             * Unit table not in use.(RTUTBL)         *
E$NFUT EQU    00167             * No free unit table.(GTUTBL)            *
E$UAHU EQU    00168             * User already has unit table.(UTALOC)   *
E$PANF EQU    00169             * Priority ACL not found.                *
E$MISA EQU    00170             * Missing argument to command.           *
E$SCCM EQU    00171             * System console command only.           *
E$BRPA EQU    00172             * Bad remote password        R$CALL      *
E$DTNS EQU    00173             * Date and time not set yet.             *
E$SPND EQU    00174             * REMOTE PROCEDURE CALL STILL PENDING    *
E$BCFG EQU    00175             * NETWORK CONFIGURATION MISMATCH         *
E$BMOD EQU    00176             * Illegal access mode        AC$SET      *
E$BID  EQU    00177             * Illegal identifier         AC$SET      *
E$ST19 EQU    00178             * Operation illegal on pre-19 disk       *
E$CTPR EQU    00179             * Object is category-protected (Ac$chg)  *
E$DFPR EQU    00180             * Object is default-protected (Ac$chg)   *
E$DLPR EQU    00181             * File is delete-protected (Fil$dl)      *
E$BLUE EQU    00182             * Bad LUBTL entry   (F$IO)               *
E$NDFD EQU    00183             * No driver for device  (F$IO)           *
E$WFT  EQU    00184             * Wrong file type (F$IO)                 *
E$FDMM EQU    00185             * Format/data mismatch (F$IO)            *
E$FER  EQU    00186             * Bad format  (F$IO)                     *
E$BDV  EQU    00187             * Bad dope vector (F$IO)                 *
E$BFOV EQU    00188             * F$IOBF overflow  (F$IO)                *
E$NFAS EQU    00189             * Top-level dir not found or inaccessible*
E$APND EQU    00190             * Asynchrouns procedure still pending    *
E$BVCC EQU    00191             * Bad virtual circuit clearing           *
E$RESF EQU    00192             * Improper access to restricted file     *
E$MNPX EQU    00193             * Illegal multiple hoppings in NPX       *
E$SYNT EQU    00194             * SYNTanx error                          *
E$USTR EQU    00195             * Unterminated STRing                    *
E$WNS  EQU    00196             * Wrong Number of Subscripts             *
E$IREQ EQU    00197             * Integer REQuired                       *
E$VNG  EQU    00198             * Variable Not in namelist Group         *
E$SOR  EQU    00199             * Subscript Out of Range                 *
E$TMVV EQU    00200             * Too Many Values for Variable           *
E$ESV  EQU    00201             * Expected String Value                  *
E$VABS EQU    00202             * Variable Array Bounds or Size          *
E$BCLC EQU    00203             * Bad Compiler Library Call              *
E$NSB  EQU    00204             * NSB labelled tape was detected         *
E$LAST EQU    00204             * THIS ***MUST*** BE LAST       --       *
*                                                                        *
*                                                                        *
**************************************************************************
       LIST
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
* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST
* swt_com.s.i --- Software Tools Subsystem Common Block Definition
* Version 9   -- 07/30/84
            NLST

SWT$CM      COMM ;
      TERMBUF(MAXTERMBUF),;
      TERMCP,;
      TERMCOUNT,;
      ECHAR,;
      KCHAR,;
      NLCHAR,;
      EOFCHAR,;
      ESCCHAR,;
      RTCHAR,;
      ISPHANTOM,;
      CPUTYPE,;
      ERRCOD,;
      STDPORTTBL(MAXSTDPORTS),;
      KILLRESP(MAXKILLRESP),;
      FDMEM(FDSIZE*NFILES),;
      RESERVEDIO(846),;
      FDBUF(MAXFDBUF),;
      PASSWD(7),;
      BPLABEL(4),;
      UTEMPTOP,;
      FDLASTFD,;
      PRTDEST(MAXPRTDEST),;
      PRTFORM(MAXPRTFORM),;
      UHASHTB(MAXTEMPHASH),;
      UTEMPBUF(MAXTEMPBUF),;
      RESERVEDOPEN(985),;
      CMDSTAT,;
      COMUNIT,;
      RTLABEL(4),;
      FIRSTUSE,;
      ARGC,;
      ARGV(MAXARGV),;
      TERMATTR(MAXTERMATTR),;
      TERMTYPE(MAXTERMTYPE),;
      LWORD,;
      LSHO,;
      LSTOP,;
      LSNA,;
      LSREF(MAXLSBUF),;
      RESERVEDSHELL(743),;
      TSSTATE,;
      TSGT,;
      TSAT,;
      TSEOS,;
      TSUN(MAXLEV),;
      TSPS(MAXLEV),;
      TSBF(MAXDIRENTRY*MAXLEV),;
      TSPW(3*MAXLEV),;
      TSPATH(MAXPATH),;
      RESERVEDTSCAN(680),;
      NEWSCR(MAXCOLS*MAXROWS),;
      RESERVEDNEWSCR(785),;
      CURSCR(MAXCOLS*MAXROWS),;
      RESERVEDCURSCR(785),;
      TCCLEARSCR(SEQSIZE),;
      TCCLEARTOEOL(SEQSIZE),;
      TCCLEARTOEOS(SEQSIZE),;
      TCCURSORHOME(SEQSIZE),;
      TCCURSORLEFT(SEQSIZE),;
      TCCURSORRIGHT(SEQSIZE),;
      TCCURSORUP(SEQSIZE),;
      TCCURSORDOWN(SEQSIZE),;
      TCABSPOS(SEQSIZE),;
      TCVERTPOS(SEQSIZE),;
      TCHORPOS(SEQSIZE),;
      TCINSLINE(SEQSIZE),;
      TCDELLINE(SEQSIZE),;
      TCINSCHAR(SEQSIZE),;
      TCDELCHAR(SEQSIZE),;
      TCINSSTR(SEQSIZE),;
      TCSHIFTIN(SEQSIZE),;
      TCSHIFTOUT(SEQSIZE),;
      TCCOORDCHAR,;
      TCSHIFTCHAR,;
      TCCOORDTYPE,;
      TCSEQTYPE,;
      TCDELAYTIME,;
      TCWRAPAROUND,;
      TCCLRLEN,;
      TCCEOSLEN,;
      TCCEOLLEN,;
      TCABSLEN,;
      TCVERTLEN,;
      TCHORLEN,;
      UNPRINTABLECHAR,;
      COLCHGSTART(MAXROWS),;
      COLCHGSTOP(MAXROWS),;
      ROWCHGSTART,;
      ROWCHGSTOP,;
      LASTCHAR(MAXROWS),;
      MAXROW,;
      MAXCOL,;
      CURROW,;
      CURCOL,;
      MSGROW,;
      MSGOWNER(MAXCOLS),;
      PADROW,;
      PADCOL,;
      PADLEN,;
      DISPLAYTIME,;
      FNTAB(CHARSETSIZE*MAXESCAPE),;
      LASTFN,;
      TABS(MAXCOLS),;
      INPUTSTART(MAXROWS),;
      INPUTSTOP(MAXROWS),;
      INBUF(MAXCOLS),;
      LASTCHARSCANNED,;
      INSERTMODE,;
      INVERTCASE,;
      DUPLEX,;
      INPUTWAIT,;
      PBBUF(MAXPB),;
      PBPTR,;
      FNUSED(MAXESCAPE),;
      DEFBUF(MAXDEF),;
      LASTDEF,;
      NESTINGCOUNT,;
      RESERVEDVTHMISC(489)

FDDEV       EQU      0  
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
FDVCSTAT1   EQU      8
FDVCSTAT2   EQU      9
FDOPSTAT1   EQU     10
FDOPSTAT2   EQU     11
FDOPSTAT3   EQU     12

            LIST

            EJCT

            LINK
CALL$$      ECB      CALL0,,NAME,3
            DATA     6,C'CALL$$'
            PROC

            DYNM     =38,NAME(3),LENGTH(3),ONUNIT(3)
            DYNM     CODE,RTNSAVE(4),NEWECB(9),RVEC(9)
            DYNM     ARGS(2*3),DESCR(4),STATE(MAXFILESTATE)
            DYNM     FUNIT,TYPE,SMT(2)

ECB_PB      EQU      XB%+0
ECB_FRAME   EQU      XB%+2
ECB_ROOT    EQU      XB%+3
ECB_ARGD    EQU      XB%+4
ECB_NARGS   EQU      XB%+5
ECB_LB      EQU      XB%+6
ECB_KEYS    EQU      XB%+8

RV_PB       EQU      RVEC+1
RV_L        EQU      RVEC+3
RV_X        EQU      RVEC+5
RV_KEYS     EQU      RVEC+6
RV_ECBAD    EQU      RVEC+7

K$VMR       EQU      '20
K$REST      EQU      '2

            EXT      MKONU$

CALL0       ARGT
            ENTR     CALL$$         Set up ECB pointer in stack frame

            CRL                     Zero out the smt pointer
            STL      SMT

            CALL     MOVE$          Clear P300 fault vectors
            AP       ZEROS,S
            AP       SECTOR0,*S
            AP       =14,SL

            CALL     REST$$         Bring runfile into memory
            AP       RVEC,S
            AP       NAME,*S
            AP       LENGTH,*S
            AP       CODE,SL
            LDA      CODE           Check return code...
            BEQ      CHECKECBAD     ...successfully loaded
            SUB      =E$BPAR        See if we have a SEG runfile...
            BEQ      SEGDIR         ...maybe; try loading it
            LDA      =ERR           ...error in loading
            PRTN

SEGDIR      CALL     LDSEG$         Try loading as a SEG runfile
            AP       RVEC,S
            AP       NAME,*S
            AP       LENGTH,*S
            AP       CODE,SL
            LDA      CODE           Check return code...
            BEQ      CHECKECBAD     ...successfully loaded
            SUB      =E$NTSD        See if we have an EPF
            BEQ      EPF_LOAD       ...maybe; try loading it
            LDA      =ERR           ...error in loading
            PRTN

EPF_LOAD    CALL     BREAK$         Prevent wierd things during
            AP       =DISABLE,SL    the EPF restoration

            CALL     SRCH$$         Attempt to open the file
            AP       =K$VMR+K$GETU,S
            AP       NAME,*S
            AP       LENGTH,*S
            AP       FUNIT,S
            AP       TYPE,S
            AP       CODE,SL

            LDA      CODE           Did it open correctly ??
            BEQ      EPF_REST       Yes...next step

            CALL     BREAK$         Didn't work, Re-enable breaks
            AP       =ENABLE,SL

            LDA      =ERR
            PRTN                    Return error

EPF_REST    CALL     R$RUN          Restore the file into memory
            AP       =K$REST,S
            AP       FUNIT,S
            AP       CODE,SL

            STL      SMT            Save the SMT pointer
            CALL     SRCH$$         Close the vmfa file
            AP       =K$CLOS,S
            AP       =C'',S
            AP       =0,S
            AP       FUNIT,S
            AP       TYPE,S
            AP       TYPE,SL        Junk variable

            LDA      CODE           Test the return code
            BEQ      CALLIT1        No error, prepare for execution

            LDA      =ERR           Return error
            PRTN

CHECKECBAD  LDL      RV_ECBAD       Check for address of main ECB...
            BLEQ     CHECKRMODE     ...missing, could be an R-mode program
            STLR     PB%+15         Make ECB addressable through XB register

CHECKECB    LDA      ECB_NARGS      Check for zero arguments
            BNE      RMODE
            LDA      ECB_KEYS       Check keys
            ANA      =$5C1F         Ignore exception enables & cond. codes
            ERA      =$1800         Check for 64V addressing mode
            BEQ      CALLIT
            ERA      =$0800         Check for 32I addressing mode
            BNE      RMODE

CALLIT      CALL     BREAK$         Disable breaks
            AP       =DISABLE,SL

CALLIT1     LDA      CMDSTAT        See if we have a pending quit
            BEQ      L1
            LDL      SMT            Test for a leftover SMT
            BLEQ     CALLITERR
            CALL     R$DEL          If one exists, delete it
            AP       SMT,SL
CALLITERR   CALL     BREAK$         Yes, reenable breaks
            AP       =ENABLE,SL
            LDA      =ERR           Return error
            PRTN

L1          DFLD     RTLABEL        Save current RTLABEL value locally
            DFST     RTNSAVE
            LDLR     PB%+13         Replace it with our own frame address
            STL      RTLABEL+2
            EAL      RETURN            and return pointer
            IAB
            STL      RTLABEL
            CALL     IOFL$          Mark file descriptors
            AP       STATE,SL
            LDL      ONUNIT         See if caller wants an onunit for ANY$
            BLT      NOUNIT         No
            STL      DESCR+0        Set up onunit descriptor block
            EAL      SB%
            STL      DESCR+2

            EAL      ANY$           Set up shortcall argument list
            STL      ARGS+0
            EAL      DESCR
            STL      ARGS+3
            EAL      ARGS
            JSXB     MKONU$         Establish the onunit
NOUNIT      CALL     BREAK$         Reenable breaks
            AP       =ENABLE,SL
            CALL     AT$HOM         Attach HOME
            AP       CODE,SL

            LDL      SMT            Test for an epf run
            BLNE     EPF_INVK       If so, then invoke it

            LDX      RV_X           Load initial registers from RVEC
            LDL      RV_L
            PCL      RV_ECBAD,*     Invoke the program
            JMP      RETURN

EPF_INVK    CALL     R$INVK         Crank it up
            AP       SMT,SL

RETURN      CALL     BREAK$         Hold off breaks for a moment
            AP       =DISABLE,SL

            LDL      SMT            Check for an epf
            BLEQ     CLOSEIT        No epf, close files

            CALL     R$DEL          Delete the epf memory image
            AP       SMT,SL

CLOSEIT     CALL     COF$           Close files opened by program
            AP       STATE,SL
            CALL     DUPLX$         Restore the terminal configuration
            AP       =-1,SL
            ANA      ='010000       (Save the "output suppressed" bit)
            STA      CODE
            LDA      LWORD
            ANA      ='167777
            ORA      CODE
            STA      CODE
            CALL     DUPLX$
            AP       CODE,SL
            CALL     RVONU$         Revert the default onunit
            AP       ANY$,SL
            DFLD     RTNSAVE        Restore previous value of RTLABEL
            DFST     RTLABEL
            CALL     BREAK$
            AP       =ENABLE,SL
            LDA      =OK            Indicate successful invocation

            PRTN


CHECKRMODE  LDA      RV_KEYS        Check keys...
            BNE      RMODE          ...if they are non-zero, it's R-mode
            LDL      DFT_ECBAD      Guess at the location of the ECB
            STL      RV_ECBAD
            STLR     PB%+15
            JMP      CHECKECB       See if it's there
            EJCT

RMODE       EAL      NEWECB         Build an ECB for the R-mode program
            STL      RV_ECBAD
            STLR     PB%+15
            LDL      RV_PB          Set up initial procedure base...
            LDA      ='4000         ...always in segment 4000
            STL      ECB_PB
            LDA      =10            Set up minimum frame size
            STA      ECB_FRAME
            STA      ECB_ARGD
            CRA                     Set up stack root segment number
            STA      ECB_ROOT
            STA      ECB_NARGS      No arguments to be passed
            LDLR     PB%+14         Use current link frame
            STL      ECB_LB
            LDA      RV_KEYS        Use keys from RVEC
            STA      ECB_KEYS
            JMP      CALLIT

ANY$        DATA     4,C'ANY$'
DFT_ECBAD   DATA     '4000,'1000    Default ECB location
SECTOR0     DATA     '4000,'60      Pointer to P300 fault vectors
ZEROS       BSZ      14             Size of P300 fault vectors

            END
* chkinp --- check for terminal input availability
*
*  logical function chkinp (flag)
*  logical flag

            SUBR     CHKINP

            SEG
            RLIT

* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
CHKINP      ECB      START,,FLAG,1
            DATA     6,C'CHKINP'
            PROC

            DYNM     =20,FLAG(3)

START       ARGT
            ENTR     CHKINP

            LT
            E64R
            D64R
            SKS      '704
            CRA
            E64V
            D64V
            STA      FLAG,*
            PRTN

            END
* ctoc --- convert EOS-terminated string to EOS-terminated string

            SUBR     CTOC

            SEG
            RLIT

* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
CTOC        ECB      CTOC0,,FROM,3
            DATA     4,C'CTOC'
            PROC

            DYNM     =20,FROM(3),TO(3),LEN(3)

CTOC0       ARGT
            ENTR     CTOC

            LDX      =0
            LDA      LEN,*
            BEQ      OUT
            TAY
            EAXB     FROM,*
            EALB     TO,*
LOOP        LDA      XB%,X
            STA      LB%,X
            ERA      =EOS
            BEQ      OUT
            IRX
            BDY      LOOP
            DRX
            RCB
            LDA      =EOS
            STA      LB%,X
OUT         TXA
            PRTN

            END
* dgetl$ --- read one line from a disk file
*
* integer functin dgetl$ (line, length, fd)
* character line (ARB)
* integer length
* fd_struct fd

            SUBR     DGETL$   (LINE, LENGTH, FD)

            SEG
            RLIT

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
* ERRD.INS.PMA, PRIMOS>INSERT, PRIMOS GROUP, 11/16/82
* MNEMONIC CODES FOR FILE SYSTEM (PMA)
* Copyright (c) 1982, Prime Computer, Inc., Natick, MA 01760
        NLST
*
*  Adding a code requires changes to: ERRD.INS.@@ and FS>ERRCOM.PMA *
*
*
*  MODIFICATIONS:
*  01/21/83 HANTMAN  Added E$NSB for MAGNET,MAGLIB and LABEL to detect
*           .......  NSB labelled tapes.
*  11/16/82 Goggin   Added NAMELIST error codes for library error processing.
*  10/29/82 HChen       Added E$MNPX (illegal mutiple hoping in NPX ).
*  09/10/82 Kroczak     Added E$RESF (Improper access to restricted file).
*  04/04/82 HChen       Added E$APND (for R$BGIN) and E$BVCC.
*  03/24/82 Weinberg    Added E$NFAS (not found in attach scan).
*  12/14/81 Huber    changed T$GPPI error codes to match rev 18. To do
*           .....    this changed E$RSNU from 137 to 140 and filled the
*           .....    previously held codes with E$CTPR, E$DLPR, E$DFPR.
*  11/06/81 Weinberg changed codes for ACL rewrite.
*  10/26/81 Goggin   Added F$IO error codes for translator group.
*  10/22/81 HChen    used a spare one, 137, for E$RSNU
*  05/22/81 Detroy   add T$GPPI error codes
*  04/07/81 Cecchin  merged new errors for Acls  (for Ben Crocker).
*  03/25/81 Cecchin  added NPX error codes from 18 to fix mismatch
*           .......  between 18 and 19. Also added spare 18 error codes
*           .......  as a temporary solution.
*
*      TABSET 8 14 33 65 74
*
***********************************************************************
*                                                                     *
*                                                                     *
*                    CODE DEFINITIONS                                 *
*                                                                     *
*                                                                     *
E$EOF  EQU    00001             * END OF FILE                   PE       *
E$BOF  EQU    00002             * BEGINNING OF FILE             PG       *
E$UNOP EQU    00003             * UNIT NOT OPEN                 PD,SD    *
E$UIUS EQU    00004             * UNIT IN USE                   SI       *
E$FIUS EQU    00005             * FILE IN USE                   SI       *
E$BPAR EQU    00006             * BAD PARAMETER                 SA       *
E$NATT EQU    00007             * NO UFD ATTACHED               SL,AL    *
E$FDFL EQU    00008             * UFD FULL                      SK       *
E$DKFL EQU    00009             * DISK FULL                     DJ       *
E$NRIT EQU    00010             * NO RIGHT                      SX       *
E$FDEL EQU    00011             * FILE OPEN ON DELETE           SD       *
E$NTUD EQU    00012             * NOT A UFD                     AR       *
E$NTSD EQU    00013             * NOT A SEGDIR                  --       *
E$DIRE EQU    00014             * IS A DIRECTORY                --       *
E$FNTF EQU    00015             * (FILE) NOT FOUND              SH,AH    *
E$FNTS EQU    00016             * (FILE) NOT FOUND IN SEGDIR    SQ       *
E$BNAM EQU    00017             * ILLEGAL NAME                  CA       *
E$EXST EQU    00018             * ALREADY EXISTS                CZ       *
E$DNTE EQU    00019             * DIRECTORY NOT EMPTY           --       *
E$SHUT EQU    00020             * BAD SHUTDN (FAM ONLY)         BS       *
E$DISK EQU    00021             * DISK I/O ERROR                WB       *
E$BDAM EQU    00022             * BAD DAM FILE (FAM ONLY)       SS       *
E$PTRM EQU    00023             * PTR MISMATCH (FAM ONLY)       PC,DC,AC *
E$BPAS EQU    00024             * BAD PASSWORD (FAM ONLY)       AN       *
E$BCOD EQU    00025             * BAD CODE IN ERRVEC            --       *
E$BTRN EQU    00026             * BAD TRUNCATE OF SEGDIR        --       *
E$OLDP EQU    00027             * OLD PARTITION                 --       *
E$BKEY EQU    00028             * BAD KEY                       --       *
E$BUNT EQU    00029             * BAD UNIT NUMBER               --       *
E$BSUN EQU    00030             * BAD SEGDIR UNIT               SA       *
E$SUNO EQU    00031             * SEGDIR UNIT NOT OPEN          --       *
E$NMLG EQU    00032             * NAME TOO LONG                 --       *
E$SDER EQU    00033             * SEGDIR ERROR                  SQ       *
E$BUFD EQU    00034             * BAD UFD                       --       *
E$BFTS EQU    00035             * BUFFER TOO SMALL              --       *
E$FITB EQU    00036             * FILE TOO BIG                  --       *
E$NULL EQU    00037             * (NULL MESSAGE)                --       *
E$IREM EQU    00038             * ILL REMOTE REF                --       *
E$DVIU EQU    00039             * DEVICE IN USE                 --       *
E$RLDN EQU    00040             * REMOTE LINE DOWN              --       *
E$FUIU EQU    00041             * ALL REMOTE UNITS IN USE       --       *
E$DNS  EQU    00042             * DEVICE NOT STARTED            --       *
E$TMUL EQU    00043             * TOO MANY UFD LEVELS           --       *
E$FBST EQU    00044             * FAM - BAD STARTUP             --       *
E$BSGN EQU    00045             * BAD SEGMENT NUMBER            --       *
E$FIFC EQU    00046             * INVALID FAM FUNCTION CODE     --       *
E$TMRU EQU    00047             * MAX REMOTE USERS EXCEEDED     --       *
E$NASS EQU    00048             * DEVICE NOT ASSIGNED           --       *
E$BFSV EQU    00049             * BAD FAM SVC                   --       *
E$SEMO EQU    00050             * SEM OVERFLOW                  --       *
E$NTIM EQU    00051             * NO TIMER                      --       *
E$FABT EQU    00052             * FAM ABORT                     --       *
E$FONC EQU    00053             * FAM OP NOT COMPLETE           --       *
E$NPHA EQU    00054             * NO PHANTOMS AVAILABLE         -        *
E$ROOM EQU    00055             * NO ROOM                       --       *
E$WTPR EQU    00056             * DISK WRITE-PROTECTED          JF       *
E$ITRE EQU    00057             * ILLEGAL TREENAME              FE       *
E$FAMU EQU    00058             * FAM IN USE                    --       *
E$TMUS EQU    00059             * MAX USERS EXCEEDED            --       *
E$NCOM EQU    00060             * NULL_COMLINE                  --       *
E$NFLT EQU    00061             * NO_FAULT_FR                   --       *
E$STKF EQU    00062             * BAD STACK FORMAT              --       *
E$STKS EQU    00063             * BAD STACK ON SIGNAL           --       *
E$NOON EQU    00064             * NO ON UNIT FOR CONDITION      --       *
E$CRWL EQU    00065             * BAD CRAWLOUT                  --       *
E$CROV EQU    00066             * STACK OVFLO DURING CRAWLOUT   --       *
E$CRUN EQU    00067             * CRAWLOUT UNWIND FAIL          --       *
E$CMND EQU    00068             * BAD COMMAND FORMAT            --       *
E$RCHR EQU    00069             * RESERVED CHARACTER            --       *
E$NEXP EQU    00070             * CANNOT EXIT TO COMMAND PROC   --       *
E$BARG EQU    00071             * BAD COMMAND ARG               --       *
E$CSOV EQU    00072             * CONC STACK OVERFLOW           --       *
E$NOSG EQU    00073             * SEGMENT DOES NOT EXIST        --       *
E$TRCL EQU    00074             * TRUNCATED COMMAND LINE        --       *
E$NDMC EQU    00075             * NO SMLC DMC CHANNELS          --       *
E$DNAV EQU    00076             * DEVICE NOT AVAILABLE         DPTX      *
E$DATT EQU    00077             * DEVICE NOT ATTACHED           --       *
E$BDAT EQU    00078             * BAD DATA                      --       *
E$BLEN EQU    00079             * BAD LENGTH                    --       *
E$BDEV EQU    00080             * BAD DEVICE NUMBER             --       *
E$QLEX EQU    00081             * QUEUE LENGTH EXCEEDED         --       *
E$NBUF EQU    00082             * NO BUFFER SPACE               --       *
E$INWT EQU    00083             * INPUT WAITING                 --       *
E$NINP EQU    00084             * NO INPUT AVAILABLE            --       *
E$DFD  EQU    00085             * DEVICE FORCIBLY DETACHED      --       *
E$DNC  EQU    00086             * DPTX NOT CONFIGURED           --       *
E$SICM EQU    00087             * ILLEGAL 3270 COMMAND          --       *
E$SBCF EQU    00088             * BAD 'FROM' DEVICE             --       *
E$VKBL EQU    00089             * KBD LOCKED                    --       *
E$VIA  EQU    00090             * INVALID AID BYTE              --       *
E$VICA EQU    00091             * INVALID CURSOR ADDRESS        --       *
E$VIF  EQU    00092             * INVALID FIELD                 --       *
E$VFR  EQU    00093             * FIELD REQUIRED                --       *
E$VFP  EQU    00094             * FIELD PROHIBITED              --       *
E$VPFC EQU    00095             * PROTECTED FIELD CHECK         --       *
E$VNFC EQU    00096             * NUMERIC FIELD CHECK           --       *
E$VPEF EQU    00097             * PAST END OF FIELD             --       *
E$VIRC EQU    00098             * INVALID READ MOD CHAR         --       *
E$IVCM EQU    00099             * INVALID COMMAND               --       *
E$DNCT EQU    00100             * DEVICE NOT CONNECTED          --       *
E$BNWD EQU    00101             * BAD NO. OF WORDS              --       *
E$SGIU EQU    00102             * SEGMENT IN USE                --       *
E$NESG EQU    00103             * NOT ENOUGH SEGMENTS (VINIT$)  --       *
E$SDUP EQU    00104             * DUPLICATE SEGMENTS (VINIT$)   --       *
E$IVWN EQU    00105             * INVALID WINDOW NUMBER         --       *
E$WAIN EQU    00106             * WINDOW ALREADY INITIATED      --       *
E$NMVS EQU    00107             * NO MORE VMFA SEGMENTS         --       *
E$NMTS EQU    00108             * NO MORE TEMP SEGMENTS         --       *
E$NDAM EQU    00109             * NOT A DAM FILE                --       *
E$NOVA EQU    00110             * NOT OPEN FOR VMFA             --       *
E$NECS EQU    00111             * NOT ENOUGH CONTIGUOUS SEGMENTS         *
E$NRCV EQU    00112             * REQUIRES RECEIVE ENABLED      --       *
E$UNRV EQU    00113             * USER NOT RECEIVING NOW        --       *
E$UBSY EQU    00114             * USER BUSY, PLEASE WAIT        --       *
E$UDEF EQU    00115             * USER UNABLE TO RECEIVE MESSAGES        *
E$UADR EQU    00116             * UNKNOWN ADDRESSEE             --       *
E$PRTL EQU    00117             * OPERATION PARTIALLY BLOCKED   --       *
E$NSUC EQU    00118             * OPERATION UNSUCCESSFUL        --       *
E$NROB EQU    00119             * NO ROOM IN OUTPUT BUFFER      --       *
E$NETE EQU    00120             * NETWORK ERROR ENCOUNTERED     --       *
E$SHDN EQU    00121             * DISK HAS BEEN SHUT DOWN       FS       *
E$UNOD EQU    00122             * UNKNOWN NODE NAME (PRIMENET)           *
E$NDAT EQU    00123             * NO DATA FOUND                 --       *
E$ENQD EQU    00124             * ENQUED ONLY                   --       *
E$PHNA EQU    00125             * PROTOCOL HANDLER NOT AVAIL   DPTX      *
E$IWST EQU    00126             * E$INWT ENABLED BY CONFIG     DPTX      *
E$BKFP EQU    00127             * BAD KEY FOR THIS PROTOCOL    DPTX      *
E$BPRH EQU    00128             * BAD PROTOCOL HANDLER (TAT)   DPTX      *
E$ABTI EQU    00129             * IO ABORT IN PROGRESS         DPTX      *
E$ILFF EQU    00130             * ILLEGAL DPTX FILE FORMAT     DPTX      *
E$TMED EQU    00131             * TOO MANY EMULATE DEVICES     DPTX      *
E$DANC EQU    00132             * DPTX ALREADY CONFIGURED      DPTX      *
E$NENB EQU    00133             * REMOTE NODE NOT ENABLED       NPX      *
E$NSLA EQU    00134             * NO NPX SLAVES AVAILABLE       ---      *
E$PNTF EQU    00135             * PROCEDURE NOT FOUND          R$CALL    *
E$SVAL EQU    00136             * SLAVE VALIDATION ERROR       R$CALL    *
E$IEDI EQU    00137             * I/O error or device interrupt (GPPI)   *
E$WMST EQU    00138             * Warm start happened (GPPI)             *
E$DNSK EQU    00139             * A pio instruction did not skip (GPPI)  *
E$RSNU EQU    00140             * REMOTE SYSTEM NOT UP         R$CALL    *
E$S18E EQU    00141             * SPARE REV18 ERROR CODES                *
*
* New error codes for REV19 begin here.
*
E$NFQB EQU    00142             * NO FREE QUOTA BLOCKS          --       *
E$MXQB EQU    00143             * MAXIMUM QUOTA EXCEEDED        --       *
E$NOQD EQU    00144             * NOT A QUOTA DISK (RUN VFIXRAT)         *
E$QEXC EQU    00145             * SETTING QUOTA BELOW EXISTING USAGE     *
E$IMFD EQU    00146             * Operation illegal on MFD               *
E$NACL EQU    00147             * Not an ACL directory                   *
E$PNAC EQU    00148             * Parent not an ACL directory            *
E$NTFD EQU    00149             * Not a file or directory                *
E$IACL EQU    00150             * Entry is an ACL                        *
E$NCAT EQU    00151             * Not an access category                 *
E$LRNA EQU    00152             * Like reference not available           *
E$CPMF EQU    00153             * Category protects MFD                  *
E$ACBG EQU    00154             * ACL TOO BIG                   --       *
E$ACNF EQU    00155             * Access category not found              *
E$LRNF EQU    00156             * Like reference not found               *
E$BACL EQU    00157             * BAD ACL                       --       *
E$BVER EQU    00158             * BAD VERSION                   --       *
E$NINF EQU    00159             * NO INFORMATION                --       *
E$CATF EQU    00160             * Access category found (Ac$rvt)         *
E$ADRF EQU    00161             * ACL directory found (Ac$rvt)           *
E$NVAL EQU    00162             * Validation error (login)      --       *
E$LOGO EQU    00163             * Logout (code for fatal$)      --       *
E$NUTP EQU    00164             * No unit table availabe.(PHANT$)        *
E$UTAR EQU    00165             * Unit table already returned.(UTDALC)   *
E$UNIU EQU    00166             * Unit table not in use.(RTUTBL)         *
E$NFUT EQU    00167             * No free unit table.(GTUTBL)            *
E$UAHU EQU    00168             * User already has unit table.(UTALOC)   *
E$PANF EQU    00169             * Priority ACL not found.                *
E$MISA EQU    00170             * Missing argument to command.           *
E$SCCM EQU    00171             * System console command only.           *
E$BRPA EQU    00172             * Bad remote password        R$CALL      *
E$DTNS EQU    00173             * Date and time not set yet.             *
E$SPND EQU    00174             * REMOTE PROCEDURE CALL STILL PENDING    *
E$BCFG EQU    00175             * NETWORK CONFIGURATION MISMATCH         *
E$BMOD EQU    00176             * Illegal access mode        AC$SET      *
E$BID  EQU    00177             * Illegal identifier         AC$SET      *
E$ST19 EQU    00178             * Operation illegal on pre-19 disk       *
E$CTPR EQU    00179             * Object is category-protected (Ac$chg)  *
E$DFPR EQU    00180             * Object is default-protected (Ac$chg)   *
E$DLPR EQU    00181             * File is delete-protected (Fil$dl)      *
E$BLUE EQU    00182             * Bad LUBTL entry   (F$IO)               *
E$NDFD EQU    00183             * No driver for device  (F$IO)           *
E$WFT  EQU    00184             * Wrong file type (F$IO)                 *
E$FDMM EQU    00185             * Format/data mismatch (F$IO)            *
E$FER  EQU    00186             * Bad format  (F$IO)                     *
E$BDV  EQU    00187             * Bad dope vector (F$IO)                 *
E$BFOV EQU    00188             * F$IOBF overflow  (F$IO)                *
E$NFAS EQU    00189             * Top-level dir not found or inaccessible*
E$APND EQU    00190             * Asynchrouns procedure still pending    *
E$BVCC EQU    00191             * Bad virtual circuit clearing           *
E$RESF EQU    00192             * Improper access to restricted file     *
E$MNPX EQU    00193             * Illegal multiple hoppings in NPX       *
E$SYNT EQU    00194             * SYNTanx error                          *
E$USTR EQU    00195             * Unterminated STRing                    *
E$WNS  EQU    00196             * Wrong Number of Subscripts             *
E$IREQ EQU    00197             * Integer REQuired                       *
E$VNG  EQU    00198             * Variable Not in namelist Group         *
E$SOR  EQU    00199             * Subscript Out of Range                 *
E$TMVV EQU    00200             * Too Many Values for Variable           *
E$ESV  EQU    00201             * Expected String Value                  *
E$VABS EQU    00202             * Variable Array Bounds or Size          *
E$BCLC EQU    00203             * Bad Compiler Library Call              *
E$NSB  EQU    00204             * NSB labelled tape was detected         *
E$LAST EQU    00204             * THIS ***MUST*** BE LAST       --       *
*                                                                        *
*                                                                        *
**************************************************************************
       LIST
* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST
* swt_com.s.i --- Software Tools Subsystem Common Block Definition
* Version 9   -- 07/30/84
            NLST

SWT$CM      COMM ;
      TERMBUF(MAXTERMBUF),;
      TERMCP,;
      TERMCOUNT,;
      ECHAR,;
      KCHAR,;
      NLCHAR,;
      EOFCHAR,;
      ESCCHAR,;
      RTCHAR,;
      ISPHANTOM,;
      CPUTYPE,;
      ERRCOD,;
      STDPORTTBL(MAXSTDPORTS),;
      KILLRESP(MAXKILLRESP),;
      FDMEM(FDSIZE*NFILES),;
      RESERVEDIO(846),;
      FDBUF(MAXFDBUF),;
      PASSWD(7),;
      BPLABEL(4),;
      UTEMPTOP,;
      FDLASTFD,;
      PRTDEST(MAXPRTDEST),;
      PRTFORM(MAXPRTFORM),;
      UHASHTB(MAXTEMPHASH),;
      UTEMPBUF(MAXTEMPBUF),;
      RESERVEDOPEN(985),;
      CMDSTAT,;
      COMUNIT,;
      RTLABEL(4),;
      FIRSTUSE,;
      ARGC,;
      ARGV(MAXARGV),;
      TERMATTR(MAXTERMATTR),;
      TERMTYPE(MAXTERMTYPE),;
      LWORD,;
      LSHO,;
      LSTOP,;
      LSNA,;
      LSREF(MAXLSBUF),;
      RESERVEDSHELL(743),;
      TSSTATE,;
      TSGT,;
      TSAT,;
      TSEOS,;
      TSUN(MAXLEV),;
      TSPS(MAXLEV),;
      TSBF(MAXDIRENTRY*MAXLEV),;
      TSPW(3*MAXLEV),;
      TSPATH(MAXPATH),;
      RESERVEDTSCAN(680),;
      NEWSCR(MAXCOLS*MAXROWS),;
      RESERVEDNEWSCR(785),;
      CURSCR(MAXCOLS*MAXROWS),;
      RESERVEDCURSCR(785),;
      TCCLEARSCR(SEQSIZE),;
      TCCLEARTOEOL(SEQSIZE),;
      TCCLEARTOEOS(SEQSIZE),;
      TCCURSORHOME(SEQSIZE),;
      TCCURSORLEFT(SEQSIZE),;
      TCCURSORRIGHT(SEQSIZE),;
      TCCURSORUP(SEQSIZE),;
      TCCURSORDOWN(SEQSIZE),;
      TCABSPOS(SEQSIZE),;
      TCVERTPOS(SEQSIZE),;
      TCHORPOS(SEQSIZE),;
      TCINSLINE(SEQSIZE),;
      TCDELLINE(SEQSIZE),;
      TCINSCHAR(SEQSIZE),;
      TCDELCHAR(SEQSIZE),;
      TCINSSTR(SEQSIZE),;
      TCSHIFTIN(SEQSIZE),;
      TCSHIFTOUT(SEQSIZE),;
      TCCOORDCHAR,;
      TCSHIFTCHAR,;
      TCCOORDTYPE,;
      TCSEQTYPE,;
      TCDELAYTIME,;
      TCWRAPAROUND,;
      TCCLRLEN,;
      TCCEOSLEN,;
      TCCEOLLEN,;
      TCABSLEN,;
      TCVERTLEN,;
      TCHORLEN,;
      UNPRINTABLECHAR,;
      COLCHGSTART(MAXROWS),;
      COLCHGSTOP(MAXROWS),;
      ROWCHGSTART,;
      ROWCHGSTOP,;
      LASTCHAR(MAXROWS),;
      MAXROW,;
      MAXCOL,;
      CURROW,;
      CURCOL,;
      MSGROW,;
      MSGOWNER(MAXCOLS),;
      PADROW,;
      PADCOL,;
      PADLEN,;
      DISPLAYTIME,;
      FNTAB(CHARSETSIZE*MAXESCAPE),;
      LASTFN,;
      TABS(MAXCOLS),;
      INPUTSTART(MAXROWS),;
      INPUTSTOP(MAXROWS),;
      INBUF(MAXCOLS),;
      LASTCHARSCANNED,;
      INSERTMODE,;
      INVERTCASE,;
      DUPLEX,;
      INPUTWAIT,;
      PBBUF(MAXPB),;
      PBPTR,;
      FNUSED(MAXESCAPE),;
      DEFBUF(MAXDEF),;
      LASTDEF,;
      NESTINGCOUNT,;
      RESERVEDVTHMISC(489)

FDDEV       EQU      0  
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
FDVCSTAT1   EQU      8
FDVCSTAT2   EQU      9
FDOPSTAT1   EQU     10
FDOPSTAT2   EQU     11
FDOPSTAT3   EQU     12

            LIST

            LINK
DGETL$      ECB      DGETL,,LINE,3
            DATA     6,C'DGETL$'
            PROC

            DYNM     =20,LINE(3),LENGTH(3),FD(3)
            DYNM     LFD(8),RETURN,XSAVE,NWR,BUFP(2)

UNIT        EQU      LFD+1
BUFSTART    EQU      LFD+2
BUFLEN      EQU      LFD+3
BUFEND      EQU      LFD+4
COUNT       EQU      LFD+5
BCOUNT      EQU      LFD+6
FLAGS       EQU      LFD+7

DGETL       ARGT
            ENTR     DGETL$

            EAXB     FD,*
            LDA      LENGTH,*       Get line length
            S1A                     Exclude space for EOS
            STA      LENGTH
            SUB      ='400          To allow short LB refs
            TAX
            EALB     LINE,*X        Access LINE through LB
            LDA      LENGTH
            TCA
            TAX                     LINE is indexed by X

            LDA      XB%+FDBCOUNT   Check for compressed blanks
            BLE      NOBLANKS
            TAY                     Save blank count in Y
            LDA      =BLANK
BLOOP1      STA      LB%+'400,X     Store a blank
            BDY      BUMPX1         Decrement blank count
            STY      XB%+FDBCOUNT   Count exhausted, clear FD_BCOUNT
            BIX      NOBLANKS          and bump LINE index
            JMP      STORE_EOS      End of LINE reached

BUMPX1      BIX      BLOOP1         Bump LINE index and loop back
            STY      XB%+FDBCOUNT   End of LINE reached, save count
            JMP      STORE_EOS

NOBLANKS    DFLD     XB%            Make a local copy of file descriptor
            DFST     LFD
            DFLD     XB%+4
            DFST     LFD+4

            LDY      BUFSTART       Construct pointer to buffer
            EAL      FDBUFADDR,*Y
            STL      BUFP           Save for later use by FILL_BUF
            LDA      COUNT          See of buffer is empty
            BNE      NOTEMPTY
            JSY      FILL_BUF       It is, go fill it
            JMP      LEFT_BYTE      Jump into fetch loop

NOTEMPTY    LDY      BUFEND         Make buffer addressable thru XB
            EAXB     FDBUFADDR,*Y
            TAY                     Buffer is indexed by Y
            LDA      FLAGS          See which byte to start with
            SPL                        0 => left
            JMP#     RIGHT_BYTE        1 => right

            EJCT

LEFT_BYTE   LDA      XB%,Y          Fetch word from buffer
            ICL                     Isolate left byte
            CAS      =DC1           Check for blank compression flag
            SKP
            JMP      DC1_LEFT
            STA      LB%+'400,X     Store character into LINE
            CAS      =LF            Check for NEWLINE
            SKP
            JMP#     LF_LEFT
            BIX      RIGHT_BYTE     Bump LINE index, get next byte
            JMP      END_LEFT       End of LINE reached

RIGHT_BYTE  LDA      XB%,Y          Fetch word from buffer
            CAL                     Isolate right byte
            CAS      =DC1           Check for blank compression flag
            SKP
            JMP      DC1_RIGHT
            STA      LB%+'400,X     Store character into LINE
            CAS      =LF            Check for NEWLINE
            SKP
            JMP#     LF_RIGHT
            BIX      BUMPY1         Bump LINE index
            BIY      END_RIGHT      End of LINE, bump buffer index
            JMP      END_RIGHT      End of buffer reached
BUMPY1      BIY      LEFT_BYTE      Bump buffer index, get next byte
            JSY      FILL_BUF       End of buffer reached, fill it
            JMP      LEFT_BYTE

            EJCT

DC1_LEFT    LDA      XB%,Y          Get blank count from right byte
            CAL
            STY      COUNT          Save buffer index
            TAY                     Put blank count in Y
            LDA      =BLANK
BLOOPL      STA      LB%+'400,X
            BDY      BUMPXL
            LDY      COUNT          Restore buffer index
            BIX      BUMPYL         Bump LINE index
            IRS#     3              Bump buffer index
            RCB                     Ignore end condition
            JMP      END_RIGHT      End of LINE reached
BUMPYL      BIY      LEFT_BYTE      Bump buffer index, get next byte
            JSY      FILL_BUF       Buffer empty, fill it
            JMP      LEFT_BYTE
BUMPXL      BIX      BLOOPL         Bump line index, loop back
            STY      BCOUNT         End of LINE, save residual count
            LDY      COUNT          Restore buffer index
            IRS#     3              Bump buffer index
            RCB                     Ignore end condition
            JMP      END_RIGHT

DC1_RIGHT   BIY      GET_COUNT      Bump buffer index
            JSY      FILL_BUF       Buffer is empty, fill it
GET_COUNT   LDA      XB%,Y          Get blank count from left byte
            ICL
            STY      COUNT          Save buffer index
            TAY                     Put blank count in Y
            LDA      =BLANK
BLOOPR      STA      LB%+'400,X     Store a blank in LINE
            BDY      BUMPXR         Decrement count
            LDY      COUNT          No more blanks, restore buffer index
            BIX      RIGHT_BYTE     Bump LINE index, get next byte
            JMP      END_LEFT       End of LINE
BUMPXR      BIX      BLOOPR         Bump LINE index, loop back
            STY      BCOUNT         End of LINE, save residual count
            LDY      COUNT          Restore buffer index
            JMP      END_LEFT

            EJCT

FILL_BUF    STY      RETURN         Save return address
            STX      XSAVE          Save X register across call
            PCL      PRWFADDR,*     Read next chunk from disk file
            AP       =K$READ+K$CONV,S
            AP       UNIT,S
            AP       BUFP,S
            AP       BUFLEN,S
            AP       =0L,S
            AP       NWR,S
            AP       CODEADDR,*SL

            LDX      XSAVE          Restore X register
            LDA      CODEADDR,*     Test return code
            BEQ      FILL_OK
            ERA      =E$EOF         Check for end of file
            BEQ      FILL_EOF
            CRA                     Clear NWR
            STA      NWR
            LDA      =FDERR         Some other error, set bit in FLAGS
            SKP
FILL_EOF    LDA#     =FDEOF         Set EOF bit in FLAGS
            ORA      FLAGS
            STA      FLAGS

FILL_OK     LDA      NWR            See how much we got
            STA      COUNT
            BEQ      RETURN_FD
            ADD      BUFSTART       Compute new end of buffer
            STA      BUFEND
            TAY                     Construct pointer to same
            EAXB     FDBUFADDR,*Y
            LDA      NWR            Set up Y with -NWR
            TCA
            TAY
            LDA      RETURN
            STA#     7

            EXT      PRWF$$
PRWFADDR    IP       PRWF$$
FDBUFADDR   IP       FDBUF
CODEADDR    IP       ERRCOD

LF_RIGHT    EQU      *
LF_LEFT     IRX                     Bump LINE index
            RCB
            BIY      END_RIGHT      Bump buffer index
            JMP      END_RIGHT      In case buffer is empty

END_LEFT    LDA      FLAGS          Set byte indicator for right byte
            SSM
            JMP      SET_BYTE

END_RIGHT   LDA      FLAGS          Set byte indicator for left byte
            SSP

SET_BYTE    STA      FLAGS
            STY      COUNT          Save buffer count
RETURN_FDEAXB     FD,*           Copy back local version of FD
            DFLD     LFD+4             copy only modified portion
            DFST     XB%+4
STORE_EOS   LDA      =EOS           Terminate LINE
            STA      LB%+'400,X
            TXA                     Return length of LINE
            ADD      LENGTH
            PRTN

            END
* dputl$ --- put one line on a disk file

            SUBR     DPUTL$    (LINE, FD)

            SEG
            RLIT

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
* ERRD.INS.PMA, PRIMOS>INSERT, PRIMOS GROUP, 11/16/82
* MNEMONIC CODES FOR FILE SYSTEM (PMA)
* Copyright (c) 1982, Prime Computer, Inc., Natick, MA 01760
        NLST
*
*  Adding a code requires changes to: ERRD.INS.@@ and FS>ERRCOM.PMA *
*
*
*  MODIFICATIONS:
*  01/21/83 HANTMAN  Added E$NSB for MAGNET,MAGLIB and LABEL to detect
*           .......  NSB labelled tapes.
*  11/16/82 Goggin   Added NAMELIST error codes for library error processing.
*  10/29/82 HChen       Added E$MNPX (illegal mutiple hoping in NPX ).
*  09/10/82 Kroczak     Added E$RESF (Improper access to restricted file).
*  04/04/82 HChen       Added E$APND (for R$BGIN) and E$BVCC.
*  03/24/82 Weinberg    Added E$NFAS (not found in attach scan).
*  12/14/81 Huber    changed T$GPPI error codes to match rev 18. To do
*           .....    this changed E$RSNU from 137 to 140 and filled the
*           .....    previously held codes with E$CTPR, E$DLPR, E$DFPR.
*  11/06/81 Weinberg changed codes for ACL rewrite.
*  10/26/81 Goggin   Added F$IO error codes for translator group.
*  10/22/81 HChen    used a spare one, 137, for E$RSNU
*  05/22/81 Detroy   add T$GPPI error codes
*  04/07/81 Cecchin  merged new errors for Acls  (for Ben Crocker).
*  03/25/81 Cecchin  added NPX error codes from 18 to fix mismatch
*           .......  between 18 and 19. Also added spare 18 error codes
*           .......  as a temporary solution.
*
*      TABSET 8 14 33 65 74
*
***********************************************************************
*                                                                     *
*                                                                     *
*                    CODE DEFINITIONS                                 *
*                                                                     *
*                                                                     *
E$EOF  EQU    00001             * END OF FILE                   PE       *
E$BOF  EQU    00002             * BEGINNING OF FILE             PG       *
E$UNOP EQU    00003             * UNIT NOT OPEN                 PD,SD    *
E$UIUS EQU    00004             * UNIT IN USE                   SI       *
E$FIUS EQU    00005             * FILE IN USE                   SI       *
E$BPAR EQU    00006             * BAD PARAMETER                 SA       *
E$NATT EQU    00007             * NO UFD ATTACHED               SL,AL    *
E$FDFL EQU    00008             * UFD FULL                      SK       *
E$DKFL EQU    00009             * DISK FULL                     DJ       *
E$NRIT EQU    00010             * NO RIGHT                      SX       *
E$FDEL EQU    00011             * FILE OPEN ON DELETE           SD       *
E$NTUD EQU    00012             * NOT A UFD                     AR       *
E$NTSD EQU    00013             * NOT A SEGDIR                  --       *
E$DIRE EQU    00014             * IS A DIRECTORY                --       *
E$FNTF EQU    00015             * (FILE) NOT FOUND              SH,AH    *
E$FNTS EQU    00016             * (FILE) NOT FOUND IN SEGDIR    SQ       *
E$BNAM EQU    00017             * ILLEGAL NAME                  CA       *
E$EXST EQU    00018             * ALREADY EXISTS                CZ       *
E$DNTE EQU    00019             * DIRECTORY NOT EMPTY           --       *
E$SHUT EQU    00020             * BAD SHUTDN (FAM ONLY)         BS       *
E$DISK EQU    00021             * DISK I/O ERROR                WB       *
E$BDAM EQU    00022             * BAD DAM FILE (FAM ONLY)       SS       *
E$PTRM EQU    00023             * PTR MISMATCH (FAM ONLY)       PC,DC,AC *
E$BPAS EQU    00024             * BAD PASSWORD (FAM ONLY)       AN       *
E$BCOD EQU    00025             * BAD CODE IN ERRVEC            --       *
E$BTRN EQU    00026             * BAD TRUNCATE OF SEGDIR        --       *
E$OLDP EQU    00027             * OLD PARTITION                 --       *
E$BKEY EQU    00028             * BAD KEY                       --       *
E$BUNT EQU    00029             * BAD UNIT NUMBER               --       *
E$BSUN EQU    00030             * BAD SEGDIR UNIT               SA       *
E$SUNO EQU    00031             * SEGDIR UNIT NOT OPEN          --       *
E$NMLG EQU    00032             * NAME TOO LONG                 --       *
E$SDER EQU    00033             * SEGDIR ERROR                  SQ       *
E$BUFD EQU    00034             * BAD UFD                       --       *
E$BFTS EQU    00035             * BUFFER TOO SMALL              --       *
E$FITB EQU    00036             * FILE TOO BIG                  --       *
E$NULL EQU    00037             * (NULL MESSAGE)                --       *
E$IREM EQU    00038             * ILL REMOTE REF                --       *
E$DVIU EQU    00039             * DEVICE IN USE                 --       *
E$RLDN EQU    00040             * REMOTE LINE DOWN              --       *
E$FUIU EQU    00041             * ALL REMOTE UNITS IN USE       --       *
E$DNS  EQU    00042             * DEVICE NOT STARTED            --       *
E$TMUL EQU    00043             * TOO MANY UFD LEVELS           --       *
E$FBST EQU    00044             * FAM - BAD STARTUP             --       *
E$BSGN EQU    00045             * BAD SEGMENT NUMBER            --       *
E$FIFC EQU    00046             * INVALID FAM FUNCTION CODE     --       *
E$TMRU EQU    00047             * MAX REMOTE USERS EXCEEDED     --       *
E$NASS EQU    00048             * DEVICE NOT ASSIGNED           --       *
E$BFSV EQU    00049             * BAD FAM SVC                   --       *
E$SEMO EQU    00050             * SEM OVERFLOW                  --       *
E$NTIM EQU    00051             * NO TIMER                      --       *
E$FABT EQU    00052             * FAM ABORT                     --       *
E$FONC EQU    00053             * FAM OP NOT COMPLETE           --       *
E$NPHA EQU    00054             * NO PHANTOMS AVAILABLE         -        *
E$ROOM EQU    00055             * NO ROOM                       --       *
E$WTPR EQU    00056             * DISK WRITE-PROTECTED          JF       *
E$ITRE EQU    00057             * ILLEGAL TREENAME              FE       *
E$FAMU EQU    00058             * FAM IN USE                    --       *
E$TMUS EQU    00059             * MAX USERS EXCEEDED            --       *
E$NCOM EQU    00060             * NULL_COMLINE                  --       *
E$NFLT EQU    00061             * NO_FAULT_FR                   --       *
E$STKF EQU    00062             * BAD STACK FORMAT              --       *
E$STKS EQU    00063             * BAD STACK ON SIGNAL           --       *
E$NOON EQU    00064             * NO ON UNIT FOR CONDITION      --       *
E$CRWL EQU    00065             * BAD CRAWLOUT                  --       *
E$CROV EQU    00066             * STACK OVFLO DURING CRAWLOUT   --       *
E$CRUN EQU    00067             * CRAWLOUT UNWIND FAIL          --       *
E$CMND EQU    00068             * BAD COMMAND FORMAT            --       *
E$RCHR EQU    00069             * RESERVED CHARACTER            --       *
E$NEXP EQU    00070             * CANNOT EXIT TO COMMAND PROC   --       *
E$BARG EQU    00071             * BAD COMMAND ARG               --       *
E$CSOV EQU    00072             * CONC STACK OVERFLOW           --       *
E$NOSG EQU    00073             * SEGMENT DOES NOT EXIST        --       *
E$TRCL EQU    00074             * TRUNCATED COMMAND LINE        --       *
E$NDMC EQU    00075             * NO SMLC DMC CHANNELS          --       *
E$DNAV EQU    00076             * DEVICE NOT AVAILABLE         DPTX      *
E$DATT EQU    00077             * DEVICE NOT ATTACHED           --       *
E$BDAT EQU    00078             * BAD DATA                      --       *
E$BLEN EQU    00079             * BAD LENGTH                    --       *
E$BDEV EQU    00080             * BAD DEVICE NUMBER             --       *
E$QLEX EQU    00081             * QUEUE LENGTH EXCEEDED         --       *
E$NBUF EQU    00082             * NO BUFFER SPACE               --       *
E$INWT EQU    00083             * INPUT WAITING                 --       *
E$NINP EQU    00084             * NO INPUT AVAILABLE            --       *
E$DFD  EQU    00085             * DEVICE FORCIBLY DETACHED      --       *
E$DNC  EQU    00086             * DPTX NOT CONFIGURED           --       *
E$SICM EQU    00087             * ILLEGAL 3270 COMMAND          --       *
E$SBCF EQU    00088             * BAD 'FROM' DEVICE             --       *
E$VKBL EQU    00089             * KBD LOCKED                    --       *
E$VIA  EQU    00090             * INVALID AID BYTE              --       *
E$VICA EQU    00091             * INVALID CURSOR ADDRESS        --       *
E$VIF  EQU    00092             * INVALID FIELD                 --       *
E$VFR  EQU    00093             * FIELD REQUIRED                --       *
E$VFP  EQU    00094             * FIELD PROHIBITED              --       *
E$VPFC EQU    00095             * PROTECTED FIELD CHECK         --       *
E$VNFC EQU    00096             * NUMERIC FIELD CHECK           --       *
E$VPEF EQU    00097             * PAST END OF FIELD             --       *
E$VIRC EQU    00098             * INVALID READ MOD CHAR         --       *
E$IVCM EQU    00099             * INVALID COMMAND               --       *
E$DNCT EQU    00100             * DEVICE NOT CONNECTED          --       *
E$BNWD EQU    00101             * BAD NO. OF WORDS              --       *
E$SGIU EQU    00102             * SEGMENT IN USE                --       *
E$NESG EQU    00103             * NOT ENOUGH SEGMENTS (VINIT$)  --       *
E$SDUP EQU    00104             * DUPLICATE SEGMENTS (VINIT$)   --       *
E$IVWN EQU    00105             * INVALID WINDOW NUMBER         --       *
E$WAIN EQU    00106             * WINDOW ALREADY INITIATED      --       *
E$NMVS EQU    00107             * NO MORE VMFA SEGMENTS         --       *
E$NMTS EQU    00108             * NO MORE TEMP SEGMENTS         --       *
E$NDAM EQU    00109             * NOT A DAM FILE                --       *
E$NOVA EQU    00110             * NOT OPEN FOR VMFA             --       *
E$NECS EQU    00111             * NOT ENOUGH CONTIGUOUS SEGMENTS         *
E$NRCV EQU    00112             * REQUIRES RECEIVE ENABLED      --       *
E$UNRV EQU    00113             * USER NOT RECEIVING NOW        --       *
E$UBSY EQU    00114             * USER BUSY, PLEASE WAIT        --       *
E$UDEF EQU    00115             * USER UNABLE TO RECEIVE MESSAGES        *
E$UADR EQU    00116             * UNKNOWN ADDRESSEE             --       *
E$PRTL EQU    00117             * OPERATION PARTIALLY BLOCKED   --       *
E$NSUC EQU    00118             * OPERATION UNSUCCESSFUL        --       *
E$NROB EQU    00119             * NO ROOM IN OUTPUT BUFFER      --       *
E$NETE EQU    00120             * NETWORK ERROR ENCOUNTERED     --       *
E$SHDN EQU    00121             * DISK HAS BEEN SHUT DOWN       FS       *
E$UNOD EQU    00122             * UNKNOWN NODE NAME (PRIMENET)           *
E$NDAT EQU    00123             * NO DATA FOUND                 --       *
E$ENQD EQU    00124             * ENQUED ONLY                   --       *
E$PHNA EQU    00125             * PROTOCOL HANDLER NOT AVAIL   DPTX      *
E$IWST EQU    00126             * E$INWT ENABLED BY CONFIG     DPTX      *
E$BKFP EQU    00127             * BAD KEY FOR THIS PROTOCOL    DPTX      *
E$BPRH EQU    00128             * BAD PROTOCOL HANDLER (TAT)   DPTX      *
E$ABTI EQU    00129             * IO ABORT IN PROGRESS         DPTX      *
E$ILFF EQU    00130             * ILLEGAL DPTX FILE FORMAT     DPTX      *
E$TMED EQU    00131             * TOO MANY EMULATE DEVICES     DPTX      *
E$DANC EQU    00132             * DPTX ALREADY CONFIGURED      DPTX      *
E$NENB EQU    00133             * REMOTE NODE NOT ENABLED       NPX      *
E$NSLA EQU    00134             * NO NPX SLAVES AVAILABLE       ---      *
E$PNTF EQU    00135             * PROCEDURE NOT FOUND          R$CALL    *
E$SVAL EQU    00136             * SLAVE VALIDATION ERROR       R$CALL    *
E$IEDI EQU    00137             * I/O error or device interrupt (GPPI)   *
E$WMST EQU    00138             * Warm start happened (GPPI)             *
E$DNSK EQU    00139             * A pio instruction did not skip (GPPI)  *
E$RSNU EQU    00140             * REMOTE SYSTEM NOT UP         R$CALL    *
E$S18E EQU    00141             * SPARE REV18 ERROR CODES                *
*
* New error codes for REV19 begin here.
*
E$NFQB EQU    00142             * NO FREE QUOTA BLOCKS          --       *
E$MXQB EQU    00143             * MAXIMUM QUOTA EXCEEDED        --       *
E$NOQD EQU    00144             * NOT A QUOTA DISK (RUN VFIXRAT)         *
E$QEXC EQU    00145             * SETTING QUOTA BELOW EXISTING USAGE     *
E$IMFD EQU    00146             * Operation illegal on MFD               *
E$NACL EQU    00147             * Not an ACL directory                   *
E$PNAC EQU    00148             * Parent not an ACL directory            *
E$NTFD EQU    00149             * Not a file or directory                *
E$IACL EQU    00150             * Entry is an ACL                        *
E$NCAT EQU    00151             * Not an access category                 *
E$LRNA EQU    00152             * Like reference not available           *
E$CPMF EQU    00153             * Category protects MFD                  *
E$ACBG EQU    00154             * ACL TOO BIG                   --       *
E$ACNF EQU    00155             * Access category not found              *
E$LRNF EQU    00156             * Like reference not found               *
E$BACL EQU    00157             * BAD ACL                       --       *
E$BVER EQU    00158             * BAD VERSION                   --       *
E$NINF EQU    00159             * NO INFORMATION                --       *
E$CATF EQU    00160             * Access category found (Ac$rvt)         *
E$ADRF EQU    00161             * ACL directory found (Ac$rvt)           *
E$NVAL EQU    00162             * Validation error (login)      --       *
E$LOGO EQU    00163             * Logout (code for fatal$)      --       *
E$NUTP EQU    00164             * No unit table availabe.(PHANT$)        *
E$UTAR EQU    00165             * Unit table already returned.(UTDALC)   *
E$UNIU EQU    00166             * Unit table not in use.(RTUTBL)         *
E$NFUT EQU    00167             * No free unit table.(GTUTBL)            *
E$UAHU EQU    00168             * User already has unit table.(UTALOC)   *
E$PANF EQU    00169             * Priority ACL not found.                *
E$MISA EQU    00170             * Missing argument to command.           *
E$SCCM EQU    00171             * System console command only.           *
E$BRPA EQU    00172             * Bad remote password        R$CALL      *
E$DTNS EQU    00173             * Date and time not set yet.             *
E$SPND EQU    00174             * REMOTE PROCEDURE CALL STILL PENDING    *
E$BCFG EQU    00175             * NETWORK CONFIGURATION MISMATCH         *
E$BMOD EQU    00176             * Illegal access mode        AC$SET      *
E$BID  EQU    00177             * Illegal identifier         AC$SET      *
E$ST19 EQU    00178             * Operation illegal on pre-19 disk       *
E$CTPR EQU    00179             * Object is category-protected (Ac$chg)  *
E$DFPR EQU    00180             * Object is default-protected (Ac$chg)   *
E$DLPR EQU    00181             * File is delete-protected (Fil$dl)      *
E$BLUE EQU    00182             * Bad LUBTL entry   (F$IO)               *
E$NDFD EQU    00183             * No driver for device  (F$IO)           *
E$WFT  EQU    00184             * Wrong file type (F$IO)                 *
E$FDMM EQU    00185             * Format/data mismatch (F$IO)            *
E$FER  EQU    00186             * Bad format  (F$IO)                     *
E$BDV  EQU    00187             * Bad dope vector (F$IO)                 *
E$BFOV EQU    00188             * F$IOBF overflow  (F$IO)                *
E$NFAS EQU    00189             * Top-level dir not found or inaccessible*
E$APND EQU    00190             * Asynchrouns procedure still pending    *
E$BVCC EQU    00191             * Bad virtual circuit clearing           *
E$RESF EQU    00192             * Improper access to restricted file     *
E$MNPX EQU    00193             * Illegal multiple hoppings in NPX       *
E$SYNT EQU    00194             * SYNTanx error                          *
E$USTR EQU    00195             * Unterminated STRing                    *
E$WNS  EQU    00196             * Wrong Number of Subscripts             *
E$IREQ EQU    00197             * Integer REQuired                       *
E$VNG  EQU    00198             * Variable Not in namelist Group         *
E$SOR  EQU    00199             * Subscript Out of Range                 *
E$TMVV EQU    00200             * Too Many Values for Variable           *
E$ESV  EQU    00201             * Expected String Value                  *
E$VABS EQU    00202             * Variable Array Bounds or Size          *
E$BCLC EQU    00203             * Bad Compiler Library Call              *
E$NSB  EQU    00204             * NSB labelled tape was detected         *
E$LAST EQU    00204             * THIS ***MUST*** BE LAST       --       *
*                                                                        *
*                                                                        *
**************************************************************************
       LIST
* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST
* swt_com.s.i --- Software Tools Subsystem Common Block Definition
* Version 9   -- 07/30/84
            NLST

SWT$CM      COMM ;
      TERMBUF(MAXTERMBUF),;
      TERMCP,;
      TERMCOUNT,;
      ECHAR,;
      KCHAR,;
      NLCHAR,;
      EOFCHAR,;
      ESCCHAR,;
      RTCHAR,;
      ISPHANTOM,;
      CPUTYPE,;
      ERRCOD,;
      STDPORTTBL(MAXSTDPORTS),;
      KILLRESP(MAXKILLRESP),;
      FDMEM(FDSIZE*NFILES),;
      RESERVEDIO(846),;
      FDBUF(MAXFDBUF),;
      PASSWD(7),;
      BPLABEL(4),;
      UTEMPTOP,;
      FDLASTFD,;
      PRTDEST(MAXPRTDEST),;
      PRTFORM(MAXPRTFORM),;
      UHASHTB(MAXTEMPHASH),;
      UTEMPBUF(MAXTEMPBUF),;
      RESERVEDOPEN(985),;
      CMDSTAT,;
      COMUNIT,;
      RTLABEL(4),;
      FIRSTUSE,;
      ARGC,;
      ARGV(MAXARGV),;
      TERMATTR(MAXTERMATTR),;
      TERMTYPE(MAXTERMTYPE),;
      LWORD,;
      LSHO,;
      LSTOP,;
      LSNA,;
      LSREF(MAXLSBUF),;
      RESERVEDSHELL(743),;
      TSSTATE,;
      TSGT,;
      TSAT,;
      TSEOS,;
      TSUN(MAXLEV),;
      TSPS(MAXLEV),;
      TSBF(MAXDIRENTRY*MAXLEV),;
      TSPW(3*MAXLEV),;
      TSPATH(MAXPATH),;
      RESERVEDTSCAN(680),;
      NEWSCR(MAXCOLS*MAXROWS),;
      RESERVEDNEWSCR(785),;
      CURSCR(MAXCOLS*MAXROWS),;
      RESERVEDCURSCR(785),;
      TCCLEARSCR(SEQSIZE),;
      TCCLEARTOEOL(SEQSIZE),;
      TCCLEARTOEOS(SEQSIZE),;
      TCCURSORHOME(SEQSIZE),;
      TCCURSORLEFT(SEQSIZE),;
      TCCURSORRIGHT(SEQSIZE),;
      TCCURSORUP(SEQSIZE),;
      TCCURSORDOWN(SEQSIZE),;
      TCABSPOS(SEQSIZE),;
      TCVERTPOS(SEQSIZE),;
      TCHORPOS(SEQSIZE),;
      TCINSLINE(SEQSIZE),;
      TCDELLINE(SEQSIZE),;
      TCINSCHAR(SEQSIZE),;
      TCDELCHAR(SEQSIZE),;
      TCINSSTR(SEQSIZE),;
      TCSHIFTIN(SEQSIZE),;
      TCSHIFTOUT(SEQSIZE),;
      TCCOORDCHAR,;
      TCSHIFTCHAR,;
      TCCOORDTYPE,;
      TCSEQTYPE,;
      TCDELAYTIME,;
      TCWRAPAROUND,;
      TCCLRLEN,;
      TCCEOSLEN,;
      TCCEOLLEN,;
      TCABSLEN,;
      TCVERTLEN,;
      TCHORLEN,;
      UNPRINTABLECHAR,;
      COLCHGSTART(MAXROWS),;
      COLCHGSTOP(MAXROWS),;
      ROWCHGSTART,;
      ROWCHGSTOP,;
      LASTCHAR(MAXROWS),;
      MAXROW,;
      MAXCOL,;
      CURROW,;
      CURCOL,;
      MSGROW,;
      MSGOWNER(MAXCOLS),;
      PADROW,;
      PADCOL,;
      PADLEN,;
      DISPLAYTIME,;
      FNTAB(CHARSETSIZE*MAXESCAPE),;
      LASTFN,;
      TABS(MAXCOLS),;
      INPUTSTART(MAXROWS),;
      INPUTSTOP(MAXROWS),;
      INBUF(MAXCOLS),;
      LASTCHARSCANNED,;
      INSERTMODE,;
      INVERTCASE,;
      DUPLEX,;
      INPUTWAIT,;
      PBBUF(MAXPB),;
      PBPTR,;
      FNUSED(MAXESCAPE),;
      DEFBUF(MAXDEF),;
      LASTDEF,;
      NESTINGCOUNT,;
      RESERVEDVTHMISC(489)

FDDEV       EQU      0  
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
FDVCSTAT1   EQU      8
FDVCSTAT2   EQU      9
FDOPSTAT1   EQU     10
FDOPSTAT2   EQU     11
FDOPSTAT3   EQU     12

            LIST

            LINK
DPUTL$      ECB      DPUTL,,LINE,2
            DATA     6,C'DPUTL$'
            PROC

            DYNM     =20,LINE(3),FD(3)
            DYNM     LFD(8),XSAVE,LSAVE(2),BUFP(2),RETURN(2),TEMP,JUNK

UNIT        EQULFD+1
BUFSTART    EQU      LFD+2
BUFLEN      EQU      LFD+3
BUFEND      EQU      LFD+4
COUNT       EQU      LFD+5
BCOUNT      EQU      LFD+6
FLAGS       EQU      LFD+7

DPUTL       ARGT
            ENTR     DPUTL$

            EAXB     FD,*
            DFLD     XB%
            DFST     LFD
            DFLD     XB%+4
            DFST     LFD+4

            EAL      *
            STA      RETURN

            LDX      BUFSTART
            EAL      FDBUFADDR,*X
            STL      BUFP
            LDX      BUFLEN
            EAXB     BUFP,*X
            LDY      COUNT
            LDX      =-'400
            EALB     LINE,*X
            LDX      =0

            LDA      FLAGS
            CSA
            LDA      BCOUNT
            BEQ      NOBLANKS
            BCR      BLANK_L
            LDA      XB%,Y
            STA      TEMP
            JMP      BLANK_R
NOBLANKS    BCR      LEFT_BYTE
            LDA      XB%,Y
            STA      TEMP
            JMP      RIGHT_BYTE

            EJCT

LEFT_BYTE   LDA      LB%+'400,X
            CAS      =BLANK
            SKP
            JMP#     BLANK_LEFT
            CAS      =EOS
            SKP
            JMP#     END_LEFT
STORE_LEFT  ICR
            CAS      =NEWLINE.LS.8
            SKP
            JMP#     STORE_RIGHT
            STA      TEMP
            BIX      RIGHT_BYTE
            JMP      END_LEFT

RIGHT_BYTE  LDA      LB%+'400,X
            CAS      =BLANK
            SKP
            JMP#     BLANK_RIGHT
            CAS      =EOS
            SKP
            JMP      END_RIGHT
            CAL
            ERA      TEMP
STORE_RIGHT STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            BIX      LEFT_BYTE
            JMP      END_RIGHT

            EJCT

BLANK_LEFT  IRS      BCOUNT
            RCB
            BIX      BLANK_L
            JMP#     PUTBL_LEFT
BLANK_L     LDA      LB%+'400,X
            CAS      =BLANK
            SKP
            JMP#     BLANK_LEFT
            CAS      =EOS
            SKP
            JMP#     END_LEFT
PUTBL_LEFT  IMA      BCOUNT
PUTBL_L     BLE      COMP_LEFT
            CAS      =2
            JMP#     COMP_LEFT
            JMP#     TWO_LEFT
            CRA
            IMA      BCOUNT
            CAL
            ERA      =BLANK.LS.8
            JMP      STORE_RIGHT
TWO_LEFT    LDA      =(BLANK.LS.8)+BLANK
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            CRA
            IMA      BCOUNT
            JMP      STORE_LEFT
COMP_LEFT   TAB
            CAS      =0
            CAS#     =256
            LDA#     =255
            LDA#     =255
            ERA      =DC1.LS.8
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            CAL
            IAB
            SUB#     2
            BNE      PUTBL_L
            IMA      BCOUNT
            JMP      STORE_LEFT

            EJCT

BLANK_RIGHT IRS      BCOUNT
            RCB
            BIX      BLANK_R
            JMP#     PUTBL_RIGHT
BLANK_R     LDA      LB%+'400,X
            CAS      =BLANK
            SKP
            JMP#     BLANK_RIGHT
            CAS      =EOS
            SKP
            JMP#     END_RIGHT
PUTBL_RIGHT IMA      BCOUNT
PUTBL_R     BLE      COMP_RIGHT
            CAS      =2
            JMP#     COMP_RIGHT
            JMP#     TWO_RIGHT
            CRA
            IMA      BCOUNT
            ICR
            IMA      TEMP
            ERA      =BLANK
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            LDA      TEMP
            CAS      =NEWLINE.LS.8
            SKP
            JMP#     STORE_RIGHT
            BIX      RIGHT_BYTE
            JMP      END_LEFT
TWO_RIGHT   LDA      TEMP
            ERA      =BLANK
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            CRA
            IMA      BCOUNT
            CAL
            ERA      =BLANK.LS.8
            JMP      STORE_RIGHT
COMP_RIGHT  TAB
            LDA      TEMP
            ERA      =DC1
            STA      XB%,Y
            BIY      *+3
            JSY#     EMPTY_BUF
            TBA
            CAS      =0
            CAS#     =256
            LDA#     =255
            LDA      =255
            ICR
            STA      TEMP
            ICL
            IAB
            SUB#     2
            BNE      PUTBL_R
            IMA      BCOUNT
            CAL
            ERA      TEMP
            JMP      STORE_RIGHT

            EJCT

EMPTY_BUF   STL      LSAVE
            STX      XSAVE
            STY      RETURN+1
            PCL      PRWFADDR,*
            AP       =K$WRIT,S
            AP       UNIT,S
            AP       BUFP,S
            AP       BUFLEN,S
            AP       =0L,S
            AP       JUNK,S
            AP       CODEADDR,*SL

            LDA      CODEADDR,*
            BNE      EMPTY_ERR
            LDA      BUFLEN
            TAY
            EAXB     BUFP,*Y
            TCA
            TAY
            LDX      XSAVE
            LDL      LSAVE
            JMP%     RETURN,*

EMPTY_ERR   LDA      =FDERR
            ORA      FLAGS
            STA      FLAGS
            LDA      =ERR
            JMP      RETURN_FD

            EXT      PRWF$$
PRWFADDR    IP       PRWF$$
FDBUFADDR   IP       FDBUF
CODEADDR    IP       ERRCOD

            EJCT

END_LEFT    LDA      FLAGS
            SSP
            JMP      SET_FLAGS

END_RIGHT   LDA      TEMP
            STA      XB%,Y
            LDA      FLAGS
            SSM

SET_FLAGS   STA      FLAGS
            STY      COUNT
            TXA

RETURN_FD   EAXB     FD,*
            DFLD     LFD+4
            DFST     XB%+4
            PRTN

            END
* equal --- compare str1 to str2; return YES if equal
*
*   integer function equal (str1, str2)
*   character str1 (ARB), str2 (ARB)

            SUBR     EQUAL

            SEG
            RLIT

* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
EQUAL       ECB      EQUAL$,,STR1,2
            DATA     5,C'EQUAL'
            PROC

            DYNM     =20,STR1(3),STR2(3)

EQUAL$      ARGT
            ENTR     EQUAL

            EAXB     STR1,*         XB := STR1
            EALB     STR2,*         LB := STR2
            LDX      =0             X := 0

LOOP        LDA      XB%+0,X        if (XB+X)^ <> (LB+X)^ then
            CAS      LB%+0,X           goto NE
            JMP      NE
            JMP      *+2
            JMP      NE
            CAS      =EOS           if (XB+X)^ = EOS then
            JMP      *+2               go to EQ
            JMP      EQ
            BIX      LOOP           X := X + 1; goto LOOP

EQ          LDA      =YES           return YES
            PRTN

NE          LDA      =NO            return NO
            PRTN

            END
* file$p --- connect SWT i/o to a Pascal file
*
*    declaration:
*
*             type name = array [1..7] of char;
*
*             procedure file$p (var f: text; n: name);
*                       extern;
*
*    calling sequence:
*
*             file$p (pascal_file_variable, 'swt_file');
*
*    entry    (arg 1) = address of Pascal file block.
*             (arg 2) = string containing SWT file name.
*
*    exit     file connected.

            SUBR     FILE$P

            SEG
            RLIT

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
* ERRD.INS.PMA, PRIMOS>INSERT, PRIMOS GROUP, 11/16/82
* MNEMONIC CODES FOR FILE SYSTEM (PMA)
* Copyright (c) 1982, Prime Computer, Inc., Natick, MA 01760
        NLST
*
*  Adding a code requires changes to: ERRD.INS.@@ and FS>ERRCOM.PMA *
*
*
*  MODIFICATIONS:
*  01/21/83 HANTMAN  Added E$NSB for MAGNET,MAGLIB and LABEL to detect
*           .......  NSB labelled tapes.
*  11/16/82 Goggin   Added NAMELIST error codes for library error processing.
*  10/29/82 HChen       Added E$MNPX (illegal mutiple hoping in NPX ).
*  09/10/82 Kroczak     Added E$RESF (Improper access to restricted file).
*  04/04/82 HChen       Added E$APND (for R$BGIN) and E$BVCC.
*  03/24/82 Weinberg    Added E$NFAS (not found in attach scan).
*  12/14/81 Huber    changed T$GPPI error codes to match rev 18. To do
*           .....    this changed E$RSNU from 137 to 140 and filled the
*           .....    previously held codes with E$CTPR, E$DLPR, E$DFPR.
*  11/06/81 Weinberg changed codes for ACL rewrite.
*  10/26/81 Goggin   Added F$IO error codes for translator group.
*  10/22/81 HChen    used a spare one, 137, for E$RSNU
*  05/22/81 Detroy   add T$GPPI error codes
*  04/07/81 Cecchin  merged new errors for Acls  (for Ben Crocker).
*  03/25/81 Cecchin  added NPX error codes from 18 to fix mismatch
*           .......  between 18 and 19. Also added spare 18 error codes
*           .......  as a temporary solution.
*
*      TABSET 8 14 33 65 74
*
***********************************************************************
*                                                                     *
*                                                                     *
*                    CODE DEFINITIONS                                 *
*                                                                     *
*                                                                     *
E$EOF  EQU    00001             * END OF FILE                   PE       *
E$BOF  EQU    00002             * BEGINNING OF FILE             PG       *
E$UNOP EQU    00003             * UNIT NOT OPEN                 PD,SD    *
E$UIUS EQU    00004             * UNIT IN USE                   SI       *
E$FIUS EQU    00005             * FILE IN USE                   SI       *
E$BPAR EQU    00006             * BAD PARAMETER                 SA       *
E$NATT EQU    00007             * NO UFD ATTACHED               SL,AL    *
E$FDFL EQU    00008             * UFD FULL                      SK       *
E$DKFL EQU    00009             * DISK FULL                     DJ       *
E$NRIT EQU    00010             * NO RIGHT                      SX       *
E$FDEL EQU    00011             * FILE OPEN ON DELETE           SD       *
E$NTUD EQU    00012             * NOT A UFD                     AR       *
E$NTSD EQU    00013             * NOT A SEGDIR                  --       *
E$DIRE EQU    00014             * IS A DIRECTORY                --       *
E$FNTF EQU    00015             * (FILE) NOT FOUND              SH,AH    *
E$FNTS EQU    00016             * (FILE) NOT FOUND IN SEGDIR    SQ       *
E$BNAM EQU    00017             * ILLEGAL NAME                  CA       *
E$EXST EQU    00018             * ALREADY EXISTS                CZ       *
E$DNTE EQU    00019             * DIRECTORY NOT EMPTY           --       *
E$SHUT EQU    00020             * BAD SHUTDN (FAM ONLY)         BS       *
E$DISK EQU    00021             * DISK I/O ERROR                WB       *
E$BDAM EQU    00022             * BAD DAM FILE (FAM ONLY)       SS       *
E$PTRM EQU    00023             * PTR MISMATCH (FAM ONLY)       PC,DC,AC *
E$BPAS EQU    00024             * BAD PASSWORD (FAM ONLY)       AN       *
E$BCOD EQU    00025             * BAD CODE IN ERRVEC            --       *
E$BTRN EQU    00026             * BAD TRUNCATE OF SEGDIR        --       *
E$OLDP EQU    00027             * OLD PARTITION                 --       *
E$BKEY EQU    00028             * BAD KEY                       --       *
E$BUNT EQU    00029             * BAD UNIT NUMBER               --       *
E$BSUN EQU    00030             * BAD SEGDIR UNIT               SA       *
E$SUNO EQU    00031             * SEGDIR UNIT NOT OPEN          --       *
E$NMLG EQU    00032             * NAME TOO LONG                 --       *
E$SDER EQU    00033             * SEGDIR ERROR                  SQ       *
E$BUFD EQU    00034             * BAD UFD                       --       *
E$BFTS EQU    00035             * BUFFER TOO SMALL              --       *
E$FITB EQU    00036             * FILE TOO BIG                  --       *
E$NULL EQU    00037             * (NULL MESSAGE)                --       *
E$IREM EQU    00038             * ILL REMOTE REF                --       *
E$DVIU EQU    00039             * DEVICE IN USE                 --       *
E$RLDN EQU    00040             * REMOTE LINE DOWN              --       *
E$FUIU EQU    00041             * ALL REMOTE UNITS IN USE       --       *
E$DNS  EQU    00042             * DEVICE NOT STARTED            --       *
E$TMUL EQU    00043             * TOO MANY UFD LEVELS           --       *
E$FBST EQU    00044             * FAM - BAD STARTUP             --       *
E$BSGN EQU    00045             * BAD SEGMENT NUMBER            --       *
E$FIFC EQU    00046             * INVALID FAM FUNCTION CODE     --       *
E$TMRU EQU    00047             * MAX REMOTE USERS EXCEEDED     --       *
E$NASS EQU    00048             * DEVICE NOT ASSIGNED           --       *
E$BFSV EQU    00049             * BAD FAM SVC                   --       *
E$SEMO EQU    00050             * SEM OVERFLOW                  --       *
E$NTIM EQU    00051             * NO TIMER                      --       *
E$FABT EQU    00052             * FAM ABORT                     --       *
E$FONC EQU    00053             * FAM OP NOT COMPLETE           --       *
E$NPHA EQU    00054             * NO PHANTOMS AVAILABLE         -        *
E$ROOM EQU    00055             * NO ROOM                       --       *
E$WTPR EQU    00056             * DISK WRITE-PROTECTED          JF       *
E$ITRE EQU    00057             * ILLEGAL TREENAME              FE       *
E$FAMU EQU    00058             * FAM IN USE                    --       *
E$TMUS EQU    00059             * MAX USERS EXCEEDED            --       *
E$NCOM EQU    00060             * NULL_COMLINE                  --       *
E$NFLT EQU    00061             * NO_FAULT_FR                   --       *
E$STKF EQU    00062             * BAD STACK FORMAT              --       *
E$STKS EQU    00063             * BAD STACK ON SIGNAL           --       *
E$NOON EQU    00064             * NO ON UNIT FOR CONDITION      --       *
E$CRWL EQU    00065             * BAD CRAWLOUT                  --       *
E$CROV EQU    00066             * STACK OVFLO DURING CRAWLOUT   --       *
E$CRUN EQU    00067             * CRAWLOUT UNWIND FAIL          --       *
E$CMND EQU    00068             * BAD COMMAND FORMAT            --       *
E$RCHR EQU    00069             * RESERVED CHARACTER            --       *
E$NEXP EQU    00070             * CANNOT EXIT TO COMMAND PROC   --       *
E$BARG EQU    00071             * BAD COMMAND ARG               --       *
E$CSOV EQU    00072             * CONC STACK OVERFLOW           --       *
E$NOSG EQU    00073             * SEGMENT DOES NOT EXIST        --       *
E$TRCL EQU    00074             * TRUNCATED COMMAND LINE        --       *
E$NDMC EQU    00075             * NO SMLC DMC CHANNELS          --       *
E$DNAV EQU    00076             * DEVICE NOT AVAILABLE         DPTX      *
E$DATT EQU    00077             * DEVICE NOT ATTACHED           --       *
E$BDAT EQU    00078             * BAD DATA                      --       *
E$BLEN EQU    00079             * BAD LENGTH                    --       *
E$BDEV EQU    00080             * BAD DEVICE NUMBER             --       *
E$QLEX EQU    00081             * QUEUE LENGTH EXCEEDED         --       *
E$NBUF EQU    00082             * NO BUFFER SPACE               --       *
E$INWT EQU    00083             * INPUT WAITING                 --       *
E$NINP EQU    00084             * NO INPUT AVAILABLE            --       *
E$DFD  EQU    00085             * DEVICE FORCIBLY DETACHED      --       *
E$DNC  EQU    00086             * DPTX NOT CONFIGURED           --       *
E$SICM EQU    00087             * ILLEGAL 3270 COMMAND          --       *
E$SBCF EQU    00088             * BAD 'FROM' DEVICE             --       *
E$VKBL EQU    00089             * KBD LOCKED                    --       *
E$VIA  EQU    00090             * INVALID AID BYTE              --       *
E$VICA EQU    00091             * INVALID CURSOR ADDRESS        --       *
E$VIF  EQU    00092             * INVALID FIELD                 --       *
E$VFR  EQU    00093             * FIELD REQUIRED                --       *
E$VFP  EQU    00094             * FIELD PROHIBITED              --       *
E$VPFC EQU    00095             * PROTECTED FIELD CHECK         --       *
E$VNFC EQU    00096             * NUMERIC FIELD CHECK           --       *
E$VPEF EQU    00097             * PAST END OF FIELD             --       *
E$VIRC EQU    00098             * INVALID READ MOD CHAR         --       *
E$IVCM EQU    00099             * INVALID COMMAND               --       *
E$DNCT EQU    00100             * DEVICE NOT CONNECTED          --       *
E$BNWD EQU    00101             * BAD NO. OF WORDS              --       *
E$SGIU EQU    00102             * SEGMENT IN USE                --       *
E$NESG EQU    00103             * NOT ENOUGH SEGMENTS (VINIT$)  --       *
E$SDUP EQU    00104             * DUPLICATE SEGMENTS (VINIT$)   --       *
E$IVWN EQU    00105             * INVALID WINDOW NUMBER         --       *
E$WAIN EQU    00106             * WINDOW ALREADY INITIATED      --       *
E$NMVS EQU    00107             * NO MORE VMFA SEGMENTS         --       *
E$NMTS EQU    00108             * NO MORE TEMP SEGMENTS         --       *
E$NDAM EQU    00109             * NOT A DAM FILE                --       *
E$NOVA EQU    00110             * NOT OPEN FOR VMFA             --       *
E$NECS EQU    00111             * NOT ENOUGH CONTIGUOUS SEGMENTS         *
E$NRCV EQU    00112             * REQUIRES RECEIVE ENABLED      --       *
E$UNRV EQU    00113             * USER NOT RECEIVING NOW        --       *
E$UBSY EQU    00114             * USER BUSY, PLEASE WAIT        --       *
E$UDEF EQU    00115             * USER UNABLE TO RECEIVE MESSAGES        *
E$UADR EQU    00116             * UNKNOWN ADDRESSEE             --       *
E$PRTL EQU    00117             * OPERATION PARTIALLY BLOCKED   --       *
E$NSUC EQU    00118             * OPERATION UNSUCCESSFUL        --       *
E$NROB EQU    00119             * NO ROOM IN OUTPUT BUFFER      --       *
E$NETE EQU    00120             * NETWORK ERROR ENCOUNTERED     --       *
E$SHDN EQU    00121             * DISK HAS BEEN SHUT DOWN       FS       *
E$UNOD EQU    00122             * UNKNOWN NODE NAME (PRIMENET)           *
E$NDAT EQU    00123             * NO DATA FOUND                 --       *
E$ENQD EQU    00124             * ENQUED ONLY                   --       *
E$PHNA EQU    00125             * PROTOCOL HANDLER NOT AVAIL   DPTX      *
E$IWST EQU    00126             * E$INWT ENABLED BY CONFIG     DPTX      *
E$BKFP EQU    00127             * BAD KEY FOR THIS PROTOCOL    DPTX      *
E$BPRH EQU    00128             * BAD PROTOCOL HANDLER (TAT)   DPTX      *
E$ABTI EQU    00129             * IO ABORT IN PROGRESS         DPTX      *
E$ILFF EQU    00130             * ILLEGAL DPTX FILE FORMAT     DPTX      *
E$TMED EQU    00131             * TOO MANY EMULATE DEVICES     DPTX      *
E$DANC EQU    00132             * DPTX ALREADY CONFIGURED      DPTX      *
E$NENB EQU    00133             * REMOTE NODE NOT ENABLED       NPX      *
E$NSLA EQU    00134             * NO NPX SLAVES AVAILABLE       ---      *
E$PNTF EQU    00135             * PROCEDURE NOT FOUND          R$CALL    *
E$SVAL EQU    00136             * SLAVE VALIDATION ERROR       R$CALL    *
E$IEDI EQU    00137             * I/O error or device interrupt (GPPI)   *
E$WMST EQU    00138             * Warm start happened (GPPI)             *
E$DNSK EQU    00139             * A pio instruction did not skip (GPPI)  *
E$RSNU EQU    00140             * REMOTE SYSTEM NOT UP         R$CALL    *
E$S18E EQU    00141             * SPARE REV18 ERROR CODES                *
*
* New error codes for REV19 begin here.
*
E$NFQB EQU    00142             * NO FREE QUOTA BLOCKS          --       *
E$MXQB EQU    00143             * MAXIMUM QUOTA EXCEEDED        --       *
E$NOQD EQU    00144             * NOT A QUOTA DISK (RUN VFIXRAT)         *
E$QEXC EQU    00145             * SETTING QUOTA BELOW EXISTING USAGE     *
E$IMFD EQU    00146             * Operation illegal on MFD               *
E$NACL EQU    00147             * Not an ACL directory                   *
E$PNAC EQU    00148             * Parent not an ACL directory            *
E$NTFD EQU    00149             * Not a file or directory                *
E$IACL EQU    00150             * Entry is an ACL                        *
E$NCAT EQU    00151             * Not an access category                 *
E$LRNA EQU    00152             * Like reference not available           *
E$CPMF EQU    00153             * Category protects MFD                  *
E$ACBG EQU    00154             * ACL TOO BIG                   --       *
E$ACNF EQU    00155             * Access category not found              *
E$LRNF EQU    00156             * Like reference not found               *
E$BACL EQU    00157             * BAD ACL                       --       *
E$BVER EQU    00158             * BAD VERSION                   --       *
E$NINF EQU    00159             * NO INFORMATION                --       *
E$CATF EQU    00160             * Access category found (Ac$rvt)         *
E$ADRF EQU    00161             * ACL directory found (Ac$rvt)           *
E$NVAL EQU    00162             * Validation error (login)      --       *
E$LOGO EQU    00163             * Logout (code for fatal$)      --       *
E$NUTP EQU    00164             * No unit table availabe.(PHANT$)        *
E$UTAR EQU    00165             * Unit table already returned.(UTDALC)   *
E$UNIU EQU    00166             * Unit table not in use.(RTUTBL)         *
E$NFUT EQU    00167             * No free unit table.(GTUTBL)            *
E$UAHU EQU    00168             * User already has unit table.(UTALOC)   *
E$PANF EQU    00169             * Priority ACL not found.                *
E$MISA EQU    00170             * Missing argument to command.           *
E$SCCM EQU    00171             * System console command only.           *
E$BRPA EQU    00172             * Bad remote password        R$CALL      *
E$DTNS EQU    00173             * Date and time not set yet.             *
E$SPND EQU    00174             * REMOTE PROCEDURE CALL STILL PENDING    *
E$BCFG EQU    00175             * NETWORK CONFIGURATION MISMATCH         *
E$BMOD EQU    00176             * Illegal access mode        AC$SET      *
E$BID  EQU    00177             * Illegal identifier         AC$SET      *
E$ST19 EQU    00178             * Operation illegal on pre-19 disk       *
E$CTPR EQU    00179             * Object is category-protected (Ac$chg)  *
E$DFPR EQU    00180             * Object is default-protected (Ac$chg)   *
E$DLPR EQU    00181             * File is delete-protected (Fil$dl)      *
E$BLUE EQU    00182             * Bad LUBTL entry   (F$IO)               *
E$NDFD EQU    00183             * No driver for device  (F$IO)           *
E$WFT  EQU    00184             * Wrong file type (F$IO)                 *
E$FDMM EQU    00185             * Format/data mismatch (F$IO)            *
E$FER  EQU    00186             * Bad format  (F$IO)                     *
E$BDV  EQU    00187             * Bad dope vector (F$IO)                 *
E$BFOV EQU    00188             * F$IOBF overflow  (F$IO)                *
E$NFAS EQU    00189             * Top-level dir not found or inaccessible*
E$APND EQU    00190             * Asynchrouns procedure still pending    *
E$BVCC EQU    00191             * Bad virtual circuit clearing           *
E$RESF EQU    00192             * Improper access to restricted file     *
E$MNPX EQU    00193             * Illegal multiple hoppings in NPX       *
E$SYNT EQU    00194             * SYNTanx error                          *
E$USTR EQU    00195             * Unterminated STRing                    *
E$WNS  EQU    00196             * Wrong Number of Subscripts             *
E$IREQ EQU    00197             * Integer REQuired                       *
E$VNG  EQU    00198             * Variable Not in namelist Group         *
E$SOR  EQU    00199             * Subscript Out of Range                 *
E$TMVV EQU    00200             * Too Many Values for Variable           *
E$ESV  EQU    00201             * Expected String Value                  *
E$VABS EQU    00202             * Variable Array Bounds or Size          *
E$BCLC EQU    00203             * Bad Compiler Library Call              *
E$NSB  EQU    00204             * NSB labelled tape was detected         *
E$LAST EQU    00204             * THIS ***MUST*** BE LAST       --       *
*                                                                        *
*                                                                        *
**************************************************************************
       LIST
* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
FILE$P      ECB      CONNECT,,FILE,2
            DATA     6,C'FILE$P'
            PROC

            DYNM     =20,FILE(3),NAME(3),CODE,ADDR(2),INDEX,UNIT
            DYNM     SUNIT,PUNIT,I,PATH(MAXPATH),TREE(MAXPATH)

FCB_FLAG          EQU   XB%+0
FCB_CUR_POS_PTR   EQU   XB%+1
FCB_BUF_SIZE      EQU   XB%+4
FCB_UNIT_NUM      EQU   XB%+6
FCB_NUM_OBJ       EQU   XB%+7
FCB_OBJ_SIZE      EQU   XB%+8
FCB_FILE_NAME     EQU   XB%+10
FCB_TOTAL_OBJ     EQU   XB%+74
FCB_BUFFER        EQU   XB%+75

CONNECT     ARGT                    transfer arguments
            ENTR     FILE$P

            EAL      CONNECTA       set address of first file name
            STL      ADDR

            LDX      =10            get number of SWT file names
            LDY      =2             get offset halfway through name

CONNECT1    LDL      ADDR,*         check first 4 characters of name
            SBL      NAME,*
            BCNE     CONNECT2       if not a match

            LDL      ADDR,*Y        check remainder of name
            ERL      NAME,*Y
            ANL      =-256L         clear last character
            BLEQ     CONNECT3       if a match

CONNECT2    LDL      ADDR           advance address to next entry
            ADL      =4L
            STL      ADDR
            BDX      CONNECT1       continue search

            CALL     ERRPR$         signal bad file name error
            AP       =K$NRTN,S
            AP       =E$BNAM,S
            AP       =0,S
            AP       =0,S
            AP       =C'FILE$P',S
            AP       =6,SL

CONNECT3    STX      INDEX          save loop index
            LDA      =10            calculate index into units
            SUB      INDEX          0 = STDIN, 1 = STDIN1, etc.
            TAX

            LDA      CONNECTB,X     set requested unit number
            STA      UNIT

            CALL     MAPSU          convert unit to SWT unit number
            AP       UNIT,SL
            STA      SUNIT

            CALL     FLUSH$         flush file buffer
            AP       SUNIT,SL

            CALL     MAPFD          convert unit to PRIMOS unit number
            AP       UNIT,SL
            STA      PUNIT

            BLE      CONNECT7       if file is not on disk

            CALL     ATTDEV         attach requested file
            AP       PUNIT,S
            AP       =7,S           select compressed disk file
            AP       PUNIT,S
            AP       =128,SL        buffer is 128 words

            EAXB     FILE,*         get address of file control block

            LDA      INDEX          see if file is input or output
            SUB      =6
            BCLT     CONNECT4       if file is a standard output

            LDA      =B'1110010000000000'    set input file values
            STA      FCB_FLAG

            CRA                     clear number of objects
            STA      FCB_NUM_OBJ

            JMP      CONNECT6

CONNECT4    LDA      =B'0111010000000000'    set output file values
            STA      FCB_FLAG

            LDA      =1             set number of objects to 1
            STA      FCB_NUM_OBJ

            LDA      =C'  '         blank fill the buffer
            LDX      =128
CONNECT5    STA      FCB_BUFFER-1,X
            BDX      CONNECT5

CONNECT6    LDA      PUNIT          set file unit number
            STA      FCB_UNIT_NUM

            JMP      CONNECT11

CONNECT7    EAXB     FILE,*         get address of file control block

            LDA      INDEX          see if file in input or output
            SUB      =6
            BCLT     CONNECT8       if file is a standard output

            LDA      =B'1110011000000000'    set input file value
            STA      FCB_FLAG

            CRA                     clear number of objects
            STA      FCB_NUM_OBJ

            JMP      CONNECT10

CONNECT8    LDA      =B'0111011000000000'    set output file values
            STA      FCB_FLAG

            LDA      =1             set number of objects
            STA      FCB_NUM_OBJ

            LDA      =C'  '         blank fill the buffer
            LDX      =128
CONNECT9    STA      FCB_BUFFER-1,X
            BDX      CONNECT9

CONNECT10   LDA      =1             set terminal file unit
            STA      FCB_UNIT_NUM


CONNECT11   EAL      FCB_BUFFER     get a pointer to the buffer
            STL      FCB_CUR_POS_PTR
            CRA                     clear bit offset
            STA      FCB_CUR_POS_PTR+2

            LDA      =256           initialize the buffer size
            STA      FCB_TOTAL_OBJ
            XCA
            STL      FCB_BUF_SIZE

            LDL      =1L            set object size to 1 byte
            STL      FCB_OBJ_SIZE

CLEAR_FNAME LDA      =C'  '         blank out the file name
            LDX      =64
CONNECT12   STA      FCB_FILE_NAME-1,X
            BDX      CONNECT12

GET_FNAME   CALL     GFNAM$         get the name of the file
            AP       UNIT,S
            AP       PATH,S
            AP       =MAXPATH,SL

            CAS      =ERR           did we get it?
            SKP
            JMP#     STORE_BAD_PATH    nope, store bad pathname

CHECK_TTY   CALL     PTOC           is the file
            AP       DEV_TTY,S      is connected to the
            AP       =PERIOD,S      terminal device ("/dev/tty") ?
            AP       TREE,S
            AP       =MAXPATH,SL

            CALL     EQUAL
            AP       PATH,S
            AP       TREE,SL

            CAS      =YES
            SKP
            JMP#     STORE_TTY

CHECK_NULL  CALL     PTOC           is the file
            AP       DEV_NULL,S     connected to the
            AP       =PERIOD,S      null device ("/dev/null") ?
            AP       TREE,S
            AP       =MAXPATH,SL

            CALL     EQUAL
            AP       PATH,S
            AP       TREE,SL

            CAS      =YES           Yes it is, Pascal doesn't
            SKP                     support I/O to /dev/null
            JMP#     STORE_TTY      use /dev/tty as filename


            CALL     MKTR$          it is a valid disk file
            AP       PATH,S
            AP       TREE,SL

            LDA      =1             store the file name into
            STA      I              the Pascal file control
            CALL     CTOP           block
            AP       TREE,S
            AP       I,S
            AP       FILE,*
            AP       FCB_FILE_NAME,S
            AP       =64,SL

            PRTN

STORE_TTY   CALL     MOVE$          store the TTY name into
            AP       TTY_PATH,S     the Pascal file control
            AP       FILE,*         block
            AP       FCB_FILE_NAME,S
            AP       =2,SL

            PRTN

STORE_BAD_PATH CALL  MOVE$          store the Bad Pathname message
            AP       BAD_PATH,S     into the Pascal file control
            AP       FILE,*         block
            AP       FCB_FILE_NAME,S
            AP       =9,SL

            PRTN

            LINK

CONNECTA    BCI      'STDIN  '      table of SWT file names
            BCI      'STDIN1 '
            BCI      'STDIN2 '
            BCI      'STDIN3 '
            BCI      'ERRIN  '
            BCI      'STDOUT '
            BCI      'STDOUT1'
            BCI      'STDOUT2'
            BCI      'STDOUT3'
            BCI      'ERROUT '

CONNECTB    DATA     STDIN          table of corresponding units
            DATA     STDIN1
            DATA     STDIN2
            DATA     STDIN3
            DATA     ERRIN
            DATA     STDOUT
            DATA     STDOUT1
            DATA     STDOUT2
            DATA     STDOUT3
            DATA     ERROUT

DEV_NULL    BCI      '/dev/null.'

DEV_TTY     BCI      '/dev/tty.'

BAD_PATH    BCI      'path unobtainable '

TTY_PATH    BCI      'TTY '

            END
* index --- find character  c  in string  str
*
*   integer function index (str, c)
*   character c, str (ARB)
*
*   for (index = 1; str (index) ~= EOS; index += 1)
*      if (str (index) == c)
*         return
*   index = 0
*   return
*   end

            SUBR     INDEX

            SEG
            RLIT

* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN	EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
INDEX       ECB      INDEX$,,STR,2
            DATA     5,C'INDEX'
            PROC

            DYNM     =20,STR(3),C(3)

INDEX$      ARGT
            ENTR     INDEX

            EAXB     STR,*          XB := STR
            LDX      =0             X := 0

LOOP        LDA      XB%+0,X        if (XB+X)^ = C then

            CAS      =EOS           if (XB+X)^ = EOS then
            JMP      *+2               go to NE
            JMP      NE

            CAS      C,*            if (XB+X)^ = C then
            JMP      *+2              go to EQ
            JMP      EQ

            BIX      LOOP           X := X + 1; goto LOOP

EQ          TXA                     return X + 1
            A1A
            PRTN

NE          CRA                     return 0
            PRTN

            END
* length --- returns length of a string
*
*  integer function length (str)
*  character str (ARB)

            SUBR     LENGTH

            SEG
            RLIT

* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
LENGTH      ECB      LENGTH$,,STR,1
            DATA     6,C'LENGTH'
            PROC

            DYNM     =20,STR(3)

LENGTH$     ARGT
            ENTR     LENGTH

            EAXB     STR,*          XB := STR
            LDX      =0             X := 0
            LDA      =EOS

LOOP        CAS      XB%,X          if (XB+X)^ = EOS then
            JMP      *+2               goto OUT
            JMP      OUT
            BIX      LOOP           X := X + 1; goto LOOP

OUT         TXA                     return X
            PRTN

            END
* move$ --- move blocks of memory around quickly
*
*  subroutine move$ (from, to, count)
*  integer from (ARB), to (ARB), count
*
*  integer i
*
*  for (i = 1; i <= count; i += 1)
*     to (i) = from (i)
*
*  return
*  end

            SUBR     MOVE$

            SEG
            RLIT

* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
MOVE$       ECB      MOVE,,FROM_PTR,3
            DATA     5,C'MOVE$'
            PROC

            DYNM     =20,FROM_PTR(3),TO_PTR(3),COUNT_PTR(3)

MOVE        ARGT
            ENTR     MOVE$

            LDA      COUNT_PTR,*
            SNZ
            PRTN
            TAX
            EAXB     FROM_PTR,*X
            EALB     TO_PTR,*X
            TCA
            TAX
            SLN
            JMP      L1
            LDA      XB%,X
            STA      LB%,X
            BIX      *+3
            PRTN
            TXA
L1          SAS      15
            JMP      L2
            LDL      XB%,X
            STL      LB%,X
            IRX
            BIX      *+3
            PRTN
            TXA
L2          SAS      14
            JMP      L3
            DFLD     XB%,X
            DFST     LB%,X
            ADD      =4
            SNZ
            PRTN
            TAX
L3          SAS      13
            JMP      L4
            DFLD     XB%,X
            DFST     LB%,X
            DFLD     XB%+4,X
            DFST     LB%+4,X
            ADD      =8
            SNZ
            PRTN
            TAX
L4          DFLD     XB%,X
            DFST     LB%,X
            DFLD     XB%+4,X
            DFST     LB%+4,X
            DFLD     XB%+8,X
            DFST     LB%+8,X
            DFLD     XB%+12,X
            DFST     LB%+12,X
            ADD      =16
            BNE      L4-1
            PRTN

            END
* ptov --- convert packed to varying string
*
* integer function ptov (pstr, termch, vstr, len)
* integer pstr (ARB), vstr (ARB), len
* character termch
*
* returns number of characters moved (<= (len - 1) * 2)

            SUBR     PTOV

            SEG
            RLIT
            SYML

* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
PTOV        ECB      CNVSTART,,PSTR,4
            DATA     4,C'PTOV'
            PROC

            DYNM     =20,PSTR(3),TERMCH(3),VSTR(3),LEN(3)
            DYNM     CHAR, FLAG

CNVSTART    ARGT
            ENTR     PTOV

            CRA
            STA      VSTR,*         set number chars in target
            LDA      LEN,*
            BEQ      QUIT           no space - quit
            S1A
            BEQ      QUIT           not enough space - quit
            STA      LEN            save first word for count
            LDA      TERMCH,*
            STA      TERMCH

            CRA
            STA      FLAG
            TAX
            S1A
            TAB                     set B reg for fetch
            LT
            TAY

COPYCH      JSXB     GETNXT
            CAS      =ESCAPE
            JMP#     CHKTERM
            JMP#     SAVENXT        save nextchar if this is an "@"
CHKTERM     CAS      TERMCH
            JMP#     STASH
            JMP#     QUIT           quit if it's terminating char
            JMP#     STASH
SAVENXT     JSXB     GETNXT
STASH       JSXB     SAVEIT
            JMP      COPYCH

QUIT        LDA      VSTR,*         fetch count & return it
            PRTN

*
* SAVEIT --- stash character in A into next open space in target
*            resulting word is always zero filled
*
SAVEIT      EQU      *
            STA      CHAR
            LDA      FLAG
            BNE      EVENCH
            LT                      set flag for 2nd char
            STA      FLAG
            LDA      CHAR
            ICA                     store as first char in target word
            STA      VSTR,*Y
            IRS      VSTR,*         add 1 to count
            RCB
            JMP%     XB%+0          go back for more

EVENCH      EQU      *
            CRA                     set flag for 1st char
            STA      FLAG
            LDA      CHAR
            ORA      VSTR,*Y        pack char
            STA      VSTR,*Y        and stash it
            IRS      VSTR,*         add 1 to count & set 1st char flag
            RCB
            TYA
            CAS      LEN            used all available space?
            JMP#     QUIT
            JMP#     QUIT
            A1A
            TAY
            JMP%     XB%+0          go back for more


*
* GETNXT --- get next character into A
*            if B < 0 then tap source, else use char in B
*
GETNXT      EQU      *
            CRA
            S1A
            IAB                     if B >= 0 then
            BGE      GOTIT
            LDA      PSTR,*X        get next 2 chars
            TAB
            CAL
            IAB                     second in B,
            ICL                     first in A
            IRX                     set for next fetch
GOTIT       JMP%     XB%+0

            END
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
* rtn$$ --- return to frame indicated in RTLABEL

            SUBR     RTN$$

            SEG
            RLIT

* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST
* swt_com.s.i --- Software Tools Subsystem Common Block Definition
* Version 9   -- 07/30/84
            NLST

SWT$CM      COMM ;
      TERMBUF(MAXTERMBUF),;
      TERMCP,;
      TERMCOUNT,;
      ECHAR,;
      KCHAR,;
      NLCHAR,;
      EOFCHAR,;
      ESCCHAR,;
      RTCHAR,;
      ISPHANTOM,;
      CPUTYPE,;
      ERRCOD,;
      STDPORTTBL(MAXSTDPORTS),;
      KILLRESP(MAXKILLRESP),;
      FDMEM(FDSIZE*NFILES),;
      RESERVEDIO(846),;
      FDBUF(MAXFDBUF),;
      PASSWD(7),;
      BPLABEL(4),;
      UTEMPTOP,;
      FDLASTFD,;
      PRTDEST(MAXPRTDEST),;
      PRTFORM(MAXPRTFORM),;
      UHASHTB(MAXTEMPHASH),;
      UTEMPBUF(MAXTEMPBUF),;
      RESERVEDOPEN(985),;
      CMDSTAT,;
      COMUNIT,;
      RTLABEL(4),;
      FIRSTUSE,;
      ARGC,;
      ARGV(MAXARGV),;
      TERMATTR(MAXTERMATTR),;
      TERMTYPE(MAXTERMTYPE),;
      LWORD,;
      LSHO,;
      LSTOP,;
      LSNA,;
      LSREF(MAXLSBUF),;
      RESERVEDSHELL(743),;
      TSSTATE,;
      TSGT,;
      TSAT,;
      TSEOS,;
      TSUN(MAXLEV),;
      TSPS(MAXLEV),;
      TSBF(MAXDIRENTRY*MAXLEV),;
      TSPW(3*MAXLEV),;
      TSPATH(MAXPATH),;
      RESERVEDTSCAN(680),;
      NEWSCR(MAXCOLS*MAXROWS),;
      RESERVEDNEWSCR(785),;
      CURSCR(MAXCOLS*MAXROWS),;
      RESERVEDCURSCR(785),;
      TCCLEARSCR(SEQSIZE),;
      TCCLEARTOEOL(SEQSIZE),;
      TCCLEARTOEOS(SEQSIZE),;
      TCCURSORHOME(SEQSIZE),;
      TCCURSORLEFT(SEQSIZE),;
      TCCURSORRIGHT(SEQSIZE),;
      TCCURSORUP(SEQSIZE),;
      TCCURSORDOWN(SEQSIZE),;
      TCABSPOS(SEQSIZE),;
      TCVERTPOS(SEQSIZE),;
      TCHORPOS(SEQSIZE),;
      TCINSLINE(SEQSIZE),;
      TCDELLINE(SEQSIZE),;
      TCINSCHAR(SEQSIZE),;
      TCDELCHAR(SEQSIZE),;
      TCINSSTR(SEQSIZE),;
      TCSHIFTIN(SEQSIZE),;
      TCSHIFTOUT(SEQSIZE),;
      TCCOORDCHAR,;
      TCSHIFTCHAR,;
      TCCOORDTYPE,;
      TCSEQTYPE,;
      TCDELAYTIME,;
      TCWRAPAROUND,;
      TCCLRLEN,;
      TCCEOSLEN,;
      TCCEOLLEN,;
      TCABSLEN,;
      TCVERTLEN,;
      TCHORLEN,;
      UNPRINTABLECHAR,;
      COLCHGSTART(MAXROWS),;
      COLCHGSTOP(MAXROWS),;
      ROWCHGSTART,;
      ROWCHGSTOP,;
      LASTCHAR(MAXROWS),;
      MAXROW,;
      MAXCOL,;
      CURROW,;
      CURCOL,;
      MSGROW,;
      MSGOWNER(MAXCOLS),;
      PADROW,;
      PADCOL,;
      PADLEN,;
      DISPLAYTIME,;
      FNTAB(CHARSETSIZE*MAXESCAPE),;
      LASTFN,;
      TABS(MAXCOLS),;
      INPUTSTART(MAXROWS),;
      INPUTSTOP(MAXROWS),;
      INBUF(MAXCOLS),;
      LASTCHARSCANNED,;
      INSERTMODE,;
      INVERTCASE,;
      DUPLEX,;
      INPUTWAIT,;
      PBBUF(MAXPB),;
      PBPTR,;
      FNUSED(MAXESCAPE),;
      DEFBUF(MAXDEF),;
      LASTDEF,;
      NESTINGCOUNT,;
      RESERVEDVTHMISC(489)

FDDEV       EQU      0  
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
FDVCSTAT1   EQU      8
FDVCSTAT2   EQU      9
FDOPSTAT1   EQU     10
FDOPSTAT2   EQU     11
FDOPSTAT3   EQU     12

            LIST
* temp_com.s.i --- Software Tools Subsystem Template Common Area
*                       Version 9

*     Each element of Hashtb is a pointer to a list of
*     (template, replacement) pairs.  
*
*     Each pair of templates in Tempbuf is of the following
*     format:
*           Tempbuf (p + 0)            pointer to next template
*           Tempbuf (p + 1)            pointer to replacement value
*           Tempbuf (p + 2)            template (EOS-terminated string)
*           Tempbuf (Tempbuf (p + 1))  replacement (EOS-terminated string)

SWT$TP      COMM     TEMPTOP,;
                     HASHTB(MAXTEMPHASH),;
                     TEMPBUF(MAXTEMPBUF),;
                     CLDATAPTR(2)

            LINK
RTN$$       ECB      RTN0
            DATA     5,C'RTN$$'
            PROC

            DYNM     =20

CLDATA$FLAGS EQU     XB% + 6

RTN0        EAXB     CLDATAPTR
            EAXB     XB%,*
            LDA      CLDATA$FLAGS
            ANA      ='020000       Was I run by DBG?
            BNE      MUSTEXIT       If I was I must exit

            CALL     PL1$NL         Not run by DBG
            AP       RTLABEL,SL     just return to the shell

MUSTEXIT    CALL     EXIT

            END
* scopy --- copy a string at from(i) to to(j)
*
*   integer function scopy (from, i, to, j)
*   character from (ARB), to (ARB)
*   integer i, j

            SUBR     SCOPY

            SEG
            RLIT

* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
SCOPY       ECB      SCOPY$,,FROM,4
            DATA     5,C'SCOPY'
            PROC

            DYNM     =20,FROM(3),I(3),TO(3),J(3)

SCOPY$      ARGT
            ENTR     SCOPY

            LDX      I,*            XB := FROM+I-1
            EAXB     FROM,*X

            LDX      J,*            LB := TO+J-1
            EALB     TO,*X

            LDX      =0

LOOP        LDA      XB%-1,X        (SB+x)^ := (LB+X)^
            STA      LB%-1,X
            CAS      =EOS           if (LB+X)^ = EOS then
            JMP      *+2               goto OUT
            JMP      OUT
            BIX      LOOP           X := X + 1; goto LOOP

OUT         TXA                     return X

            PRTN

            END
* sys$$ --- pass a command string to PRIMOS for execution

            SUBR     SYS$$

            SEG
            RLIT

* ERRD.INS.PMA, PRIMOS>INSERT, PRIMOS GROUP, 11/16/82
* MNEMONIC CODES FOR FILE SYSTEM (PMA)
* Copyright (c) 1982, Prime Computer, Inc., Natick, MA 01760
        NLST
*
*  Adding a code requires changes to: ERRD.INS.@@ and FS>ERRCOM.PMA *
*
*
*  MODIFICATIONS:
*  01/21/83 HANTMAN  Added E$NSB for MAGNET,MAGLIB and LABEL to detect
*           .......  NSB labelled tapes.
*  11/16/82 Goggin   Added NAMELIST error codes for library error processing.
*  10/29/82 HChen       Added E$MNPX (illegal mutiple hoping in NPX ).
*  09/10/82 Kroczak     Added E$RESF (Improper access to restricted file).
*  04/04/82 HChen       Added E$APND (for R$BGIN) and E$BVCC.
*  03/24/82 Weinberg    Added E$NFAS (not found in attach scan).
*  12/14/81 Huber    changed T$GPPI error codes to match rev 18. To do
*           .....    this changed E$RSNU from 137 to 140 and filled the
*           .....    previously held codes with E$CTPR, E$DLPR, E$DFPR.
*  11/06/81 Weinberg changed codes for ACL rewrite.
*  10/26/81 Goggin   Added F$IO error codes for translator group.
*  10/22/81 HChen    used a spare one, 137, for E$RSNU
*  05/22/81 Detroy   add T$GPPI error codes
*  04/07/81 Cecchin  merged new errors for Acls  (for Ben Crocker).
*  03/25/81 Cecchin  added NPX error codes from 18 to fix mismatch
*           .......  between 18 and 19. Also added spare 18 error codes
*           .......  as a temporary solution.
*
*      TABSET 8 14 33 65 74
*
***********************************************************************
*                                                                     *
*                                                                     *
*                    CODE DEFINITIONS                                 *
*                                                                     *
*                                                                     *
E$EOF  EQU    00001             * END OF FILE                   PE       *
E$BOF  EQU    00002             * BEGINNING OF FILE             PG       *
E$UNOP EQU    00003             * UNIT NOT OPEN                 PD,SD    *
E$UIUS EQU    00004             * UNIT IN USE                   SI       *
E$FIUS EQU    00005             * FILE IN USE                   SI       *
E$BPAR EQU    00006             * BAD PARAMETER                 SA       *
E$NATT EQU    00007             * NO UFD ATTACHED               SL,AL    *
E$FDFL EQU    00008             * UFD FULL                      SK       *
E$DKFL EQU    00009             * DISK FULL                     DJ       *
E$NRIT EQU    00010             * NO RIGHT                      SX       *
E$FDEL EQU    00011             * FILE OPEN ON DELETE           SD       *
E$NTUD EQU    00012             * NOT A UFD                     AR       *
E$NTSD EQU    00013             * NOT A SEGDIR                  --       *
E$DIRE EQU    00014             * IS A DIRECTORY                --       *
E$FNTF EQU    00015             * (FILE) NOT FOUND              SH,AH    *
E$FNTS EQU    00016             * (FILE) NOT FOUND IN SEGDIR    SQ       *
E$BNAM EQU    00017             * ILLEGAL NAME                  CA       *
E$EXST EQU    00018             * ALREADY EXISTS                CZ       *
E$DNTE EQU    00019             * DIRECTORY NOT EMPTY           --       *
E$SHUT EQU    00020             * BAD SHUTDN (FAM ONLY)         BS       *
E$DISK EQU    00021             * DISK I/O ERROR                WB       *
E$BDAM EQU    00022             * BAD DAM FILE (FAM ONLY)       SS       *
E$PTRM EQU    00023             * PTR MISMATCH (FAM ONLY)       PC,DC,AC *
E$BPAS EQU    00024             * BAD PASSWORD (FAM ONLY)       AN       *
E$BCOD EQU    00025             * BAD CODE IN ERRVEC            --       *
E$BTRN EQU    00026             * BAD TRUNCATE OF SEGDIR        --       *
E$OLDP EQU    00027             * OLD PARTITION                 --       *
E$BKEY EQU    00028             * BAD KEY                       --       *
E$BUNT EQU    00029             * BAD UNIT NUMBER               --       *
E$BSUN EQU    00030             * BAD SEGDIR UNIT               SA       *
E$SUNO EQU    00031             * SEGDIR UNIT NOT OPEN          --       *
E$NMLG EQU    00032             * NAME TOO LONG                 --       *
E$SDER EQU    00033             * SEGDIR ERROR                  SQ       *
E$BUFD EQU    00034             * BAD UFD                       --       *
E$BFTS EQU    00035             * BUFFER TOO SMALL              --       *
E$FITB EQU    00036             * FILE TOO BIG                  --       *
E$NULL EQU    00037             * (NULL MESSAGE)                --       *
E$IREM EQU    00038             * ILL REMOTE REF                --       *
E$DVIU EQU    00039             * DEVICE IN USE                 --       *
E$RLDN EQU    00040             * REMOTE LINE DOWN              --       *
E$FUIU EQU    00041             * ALL REMOTE UNITS IN USE       --       *
E$DNS  EQU    00042             * DEVICE NOT STARTED            --       *
E$TMUL EQU    00043             * TOO MANY UFD LEVELS           --       *
E$FBST EQU    00044             * FAM - BAD STARTUP             --       *
E$BSGN EQU    00045             * BAD SEGMENT NUMBER            --       *
E$FIFC EQU    00046             * INVALID FAM FUNCTION CODE     --       *
E$TMRU EQU    00047             * MAX REMOTE USERS EXCEEDED     --       *
E$NASS EQU    00048             * DEVICE NOT ASSIGNED           --       *
E$BFSV EQU    00049             * BAD FAM SVC                   --       *
E$SEMO EQU    00050             * SEM OVERFLOW                  --       *
E$NTIM EQU    00051             * NO TIMER                      --       *
E$FABT EQU    00052             * FAM ABORT                     --       *
E$FONC EQU    00053             * FAM OP NOT COMPLETE           --       *
E$NPHA EQU    00054             * NO PHANTOMS AVAILABLE         -        *
E$ROOM EQU    00055             * NO ROOM                       --       *
E$WTPR EQU    00056             * DISK WRITE-PROTECTED          JF       *
E$ITRE EQU    00057             * ILLEGAL TREENAME              FE       *
E$FAMU EQU    00058             * FAM IN USE                    --       *
E$TMUS EQU    00059             * MAX USERS EXCEEDED            --       *
E$NCOM EQU    00060             * NULL_COMLINE                  --       *
E$NFLT EQU    00061             * NO_FAULT_FR                   --       *
E$STKF EQU    00062             * BAD STACK FORMAT              --       *
E$STKS EQU    00063             * BAD STACK ON SIGNAL           --       *
E$NOON EQU    00064             * NO ON UNIT FOR CONDITION      --       *
E$CRWL EQU    00065             * BAD CRAWLOUT                  --       *
E$CROV EQU    00066             * STACK OVFLO DURING CRAWLOUT   --       *
E$CRUN EQU    00067             * CRAWLOUT UNWIND FAIL          --       *
E$CMND EQU    00068             * BAD COMMAND FORMAT            --       *
E$RCHR EQU    00069             * RESERVED CHARACTER            --       *
E$NEXP EQU    00070             * CANNOT EXIT TO COMMAND PROC   --       *
E$BARG EQU    00071             * BAD COMMAND ARG               --       *
E$CSOV EQU    00072             * CONC STACK OVERFLOW           --       *
E$NOSG EQU    00073             * SEGMENT DOES NOT EXIST        --       *
E$TRCL EQU    00074             * TRUNCATED COMMAND LINE        --       *
E$NDMC EQU    00075             * NO SMLC DMC CHANNELS          --       *
E$DNAV EQU    00076             * DEVICE NOT AVAILABLE         DPTX      *
E$DATT EQU    00077             * DEVICE NOT ATTACHED           --       *
E$BDAT EQU    00078             * BAD DATA                      --       *
E$BLEN EQU    00079             * BAD LENGTH                    --       *
E$BDEV EQU    00080             * BAD DEVICE NUMBER             --       *
E$QLEX EQU    00081             * QUEUE LENGTH EXCEEDED         --       *
E$NBUF EQU    00082             * NO BUFFER SPACE               --       *
E$INWT EQU    00083             * INPUT WAITING                 --       *
E$NINP EQU    00084             * NO INPUT AVAILABLE            --       *
E$DFD  EQU    00085             * DEVICE FORCIBLY DETACHED      --       *
E$DNC  EQU    00086             * DPTX NOT CONFIGURED           --       *
E$SICM EQU    00087             * ILLEGAL 3270 COMMAND          --       *
E$SBCF EQU    00088             * BAD 'FROM' DEVICE             --       *
E$VKBL EQU    00089             * KBD LOCKED                    --       *
E$VIA  EQU    00090             * INVALID AID BYTE              --       *
E$VICA EQU    00091             * INVALID CURSOR ADDRESS        --       *
E$VIF  EQU    00092             * INVALID FIELD                 --       *
E$VFR  EQU    00093             * FIELD REQUIRED                --       *
E$VFP  EQU    00094             * FIELD PROHIBITED              --       *
E$VPFC EQU    00095             * PROTECTED FIELD CHECK         --       *
E$VNFC EQU    00096             * NUMERIC FIELD CHECK           --       *
E$VPEF EQU    00097             * PAST END OF FIELD             --       *
E$VIRC EQU    00098             * INVALID READ MOD CHAR         --       *
E$IVCM EQU    00099             * INVALID COMMAND               --       *
E$DNCT EQU    00100             * DEVICE NOT CONNECTED          --       *
E$BNWD EQU    00101             * BAD NO. OF WORDS              --       *
E$SGIU EQU    00102             * SEGMENT IN USE                --       *
E$NESG EQU    00103             * NOT ENOUGH SEGMENTS (VINIT$)  --       *
E$SDUP EQU    00104             * DUPLICATE SEGMENTS (VINIT$)   --       *
E$IVWN EQU    00105             * INVALID WINDOW NUMBER         --       *
E$WAIN EQU    00106             * WINDOW ALREADY INITIATED      --       *
E$NMVS EQU    00107             * NO MORE VMFA SEGMENTS         --       *
E$NMTS EQU    00108             * NO MORE TEMP SEGMENTS         --       *
E$NDAM EQU    00109             * NOT A DAM FILE                --       *
E$NOVA EQU    00110             * NOT OPEN FOR VMFA             --       *
E$NECS EQU    00111             * NOT ENOUGH CONTIGUOUS SEGMENTS         *
E$NRCV EQU    00112             * REQUIRES RECEIVE ENABLED      --       *
E$UNRV EQU    00113             * USER NOT RECEIVING NOW        --       *
E$UBSY EQU    00114             * USER BUSY, PLEASE WAIT        --       *
E$UDEF EQU    00115             * USER UNABLE TO RECEIVE MESSAGES        *
E$UADR EQU    00116             * UNKNOWN ADDRESSEE             --       *
E$PRTL EQU    00117             * OPERATION PARTIALLY BLOCKED   --       *
E$NSUC EQU    00118             * OPERATION UNSUCCESSFUL        --       *
E$NROB EQU    00119             * NO ROOM IN OUTPUT BUFFER      --       *
E$NETE EQU    00120             * NETWORK ERROR ENCOUNTERED     --       *
E$SHDN EQU    00121             * DISK HAS BEEN SHUT DOWN       FS       *
E$UNOD EQU    00122             * UNKNOWN NODE NAME (PRIMENET)           *
E$NDAT EQU    00123             * NO DATA FOUND                 --       *
E$ENQD EQU    00124             * ENQUED ONLY                   --       *
E$PHNA EQU    00125             * PROTOCOL HANDLER NOT AVAIL   DPTX      *
E$IWST EQU    00126             * E$INWT ENABLED BY CONFIG     DPTX      *
E$BKFP EQU    00127             * BAD KEY FOR THIS PROTOCOL    DPTX      *
E$BPRH EQU    00128             * BAD PROTOCOL HANDLER (TAT)   DPTX      *
E$ABTI EQU    00129             * IO ABORT IN PROGRESS         DPTX      *
E$ILFF EQU    00130             * ILLEGAL DPTX FILE FORMAT     DPTX      *
E$TMED EQU    00131             * TOO MANY EMULATE DEVICES     DPTX      *
E$DANC EQU    00132             * DPTX ALREADY CONFIGURED      DPTX      *
E$NENB EQU    00133             * REMOTE NODE NOT ENABLED       NPX      *
E$NSLA EQU    00134             * NO NPX SLAVES AVAILABLE       ---      *
E$PNTF EQU    00135             * PROCEDURE NOT FOUND          R$CALL    *
E$SVAL EQU    00136             * SLAVE VALIDATION ERROR       R$CALL    *
E$IEDI EQU    00137             * I/O error or device interrupt (GPPI)   *
E$WMST EQU    00138             * Warm start happened (GPPI)             *
E$DNSK EQU    00139             * A pio instruction did not skip (GPPI)  *
E$RSNU EQU    00140             * REMOTE SYSTEM NOT UP         R$CALL    *
E$S18E EQU    00141             * SPARE REV18 ERROR CODES                *
*
* New error codes for REV19 begin here.
*
E$NFQB EQU    00142             * NO FREE QUOTA BLOCKS          --       *
E$MXQB EQU    00143             * MAXIMUM QUOTA EXCEEDED        --       *
E$NOQD EQU    00144             * NOT A QUOTA DISK (RUN VFIXRAT)         *
E$QEXC EQU    00145             * SETTING QUOTA BELOW EXISTING USAGE     *
E$IMFD EQU    00146             * Operation illegal on MFD               *
E$NACL EQU    00147             * Not an ACL directory                   *
E$PNAC EQU    00148             * Parent not an ACL directory            *
E$NTFD EQU    00149             * Not a file or directory                *
E$IACL EQU    00150             * Entry is an ACL                        *
E$NCAT EQU    00151             * Not an access category                 *
E$LRNA EQU    00152             * Like reference not available           *
E$CPMF EQU    00153             * Category protects MFD                  *
E$ACBG EQU    00154             * ACL TOO BIG                   --       *
E$ACNF EQU    00155             * Access category not found              *
E$LRNF EQU    00156             * Like reference not found               *
E$BACL EQU    00157             * BAD ACL                       --       *
E$BVER EQU    00158             * BAD VERSION                   --       *
E$NINF EQU    00159             * NO INFORMATION                --       *
E$CATF EQU    00160             * Access category found (Ac$rvt)         *
E$ADRF EQU    00161             * ACL directory found (Ac$rvt)           *
E$NVAL EQU    00162             * Validation error (login)      --       *
E$LOGO EQU    00163             * Logout (code for fatal$)      --       *
E$NUTP EQU    00164             * No unit table availabe.(PHANT$)        *
E$UTAR EQU    00165             * Unit table already returned.(UTDALC)   *
E$UNIU EQU    00166             * Unit table not in use.(RTUTBL)         *
E$NFUT EQU    00167             * No free unit table.(GTUTBL)            *
E$UAHU EQU    00168             * User already has unit table.(UTALOC)   *
E$PANF EQU    00169             * Priority ACL not found.                *
E$MISA EQU    00170             * Missing argument to command.           *
E$SCCM EQU    00171             * System console command only.           *
E$BRPA EQU    00172             * Bad remote password        R$CALL      *
E$DTNS EQU    00173             * Date and time not set yet.             *
E$SPND EQU    00174             * REMOTE PROCEDURE CALL STILL PENDING    *
E$BCFG EQU    00175             * NETWORK CONFIGURATION MISMATCH         *
E$BMOD EQU    00176             * Illegal access mode        AC$SET      *
E$BID  EQU    00177             * Illegal identifier         AC$SET      *
E$ST19 EQU    00178             * Operation illegal on pre-19 disk       *
E$CTPR EQU    00179             * Object is category-protected (Ac$chg)  *
E$DFPR EQU    00180             * Object is default-protected (Ac$chg)   *
E$DLPR EQU    00181             * File is delete-protected (Fil$dl)      *
E$BLUE EQU    00182             * Bad LUBTL entry   (F$IO)               *
E$NDFD EQU    00183             * No driver for device  (F$IO)           *
E$WFT  EQU    00184             * Wrong file type (F$IO)                 *
E$FDMM EQU    00185             * Format/data mismatch (F$IO)            *
E$FER  EQU    00186             * Bad format  (F$IO)                     *
E$BDV  EQU    00187             * Bad dope vector (F$IO)                 *
E$BFOV EQU    00188             * F$IOBF overflow  (F$IO)                *
E$NFAS EQU    00189             * Top-level dir not found or inaccessible*
E$APND EQU    00190             * Asynchrouns procedure still pending    *
E$BVCC EQU    00191             * Bad virtual circuit clearing           *
E$RESF EQU    00192             * Improper access to restricted file     *
E$MNPX EQU    00193             * Illegal multiple hoppings in NPX       *
E$SYNT EQU    00194             * SYNTanx error                          *
E$USTR EQU    00195             * Unterminated STRing                    *
E$WNS  EQU    00196             * Wrong Number of Subscripts             *
E$IREQ EQU    00197             * Integer REQuired                       *
E$VNG  EQU    00198             * Variable Not in namelist Group         *
E$SOR  EQU    00199             * Subscript Out of Range                 *
E$TMVV EQU    00200             * Too Many Values for Variable           *
E$ESV  EQU    00201             * Expected String Value                  *
E$VABS EQU    00202             * Variable Array Bounds or Size          *
E$BCLC EQU    00203             * Bad Compiler Library Call              *
E$NSB  EQU    00204             * NSB labelled tape was detected         *
E$LAST EQU    00204             * THIS ***MUST*** BE LAST       --       *
*                                                                        *
*                                                                        *
**************************************************************************
       LIST
* swt_def.s.i --- standard definitions for Subsystem programs
*     Software Tools Subsystem Standard Definitions, Version 9
            NLST

* Capital letters:
BIGA        EQU      R'A'
BIGB        EQU      R'B'
BIGC        EQU      R'C'
BIGD        EQU      R'D'
BIGE        EQU      R'E'
BIGF        EQU      R'F'
BIGG        EQU      R'G'
BIGH        EQU      R'H'
BIGI        EQU      R'I'
BIGJ        EQU      R'J'
BIGK        EQU      R'K'
BIGL        EQU      R'L'
BIGM        EQU      R'M'
BIGN        EQU      R'N'
BIGO        EQU      R'O'
BIGP        EQU      R'P'
BIGQ        EQU      R'Q'
BIGR        EQU      R'R'
BIGS        EQU      R'S'
BIGT        EQU      R'T'
BIGU        EQU      R'U'
BIGV        EQU      R'V'
BIGW        EQU      R'W'
BIGX        EQU      R'X'
BIGY        EQU      R'Y'
BIGZ        EQU      R'Z'

* Lower case letters:
LETA        EQU      R'a'
LETB        EQU      R'b'
LETC        EQU      R'c'
LETD        EQU      R'd'
LETE        EQU      R'e'
LETF        EQU      R'f'
LETG        EQU      R'g'
LETH        EQU      R'h'
LETI        EQU      R'i'
LETJ        EQU      R'j'
LETK        EQU      R'k'
LETL        EQU      R'l'
LETM        EQU      R'm'
LETN        EQU      R'n'
LETO        EQU      R'o'
LETP        EQU      R'p'
LETQ        EQU      R'q'
LETR        EQU      R'r'
LETS        EQU      R's'
LETT        EQU      R't'
LETU        EQU      R'u'
LETV        EQU      R'v'
LETW        EQU      R'w'
LETX        EQU      R'x'
LETY        EQU      R'y'
LETZ        EQU      R'z'

* Digits:
DIG0        EQU      R'0'
DIG1        EQU      R'1'
DIG2        EQU      R'2'
DIG3        EQU      R'3'
DIG4        EQU      R'4'
DIG5        EQU      R'5'
DIG6        EQU      R'6'
DIG7        EQU      R'7'
DIG8        EQU      R'8'
DIG9        EQU      R'9'

* Special characters:
BLANK       EQU      R' '
BANG        EQU      R'!!'
DQUOTE      EQU      R'"'
SHARP       EQU      R'#'
DOLLAR      EQU      R'$'
PERCENT     EQU      R'%'
AMPERSAND   EQU      R'&'
AMPER       EQU      AMPERSAND
SQUOTE      EQU      R'''
LPAREN      EQU      R'('
RPAREN      EQU      R')'
STAR        EQU      R'*'
PLUS        EQU      R'+'
COMMA       EQU      R','
MINUS       EQU      R'-'
PERIOD      EQU      R'.'
SLASH       EQU      R'/'
COLON       EQU      R'!:'
SEMICOL     EQU      R'!;'
LESS        EQU      R'<'
EQUALS      EQU      R'='
GREATER     EQU      R'>'
QMARK       EQU      R'?'
ATSIGN      EQU      R'@'
LBRACK      EQU      R'['
BACKSLASH   EQU      R'\'
RBRACK      EQU      R']'
CARET       EQU      R'^'
UNDERLINE   EQU      R'_'
AGRAVE      EQU      R'`'
LBRACE      EQU      R'{'
BAR         EQU      R'|'
RBRACE      EQU      R'}'
TILDE       EQU      R'~'

* ASCII control character definitions:
NUL         EQU      '200
CTRL_A      EQU      '201
SOH         EQU      '201
CTRL_B      EQU      '202
STX         EQU      '202
CTRL_C      EQU      '203
ETX         EQU      '203
CTRL_D      EQU      '204
EOT         EQU      '204
CTRL_E      EQU      '205
ENQ         EQU      '205
CTRL_F      EQU      '206
ACK         EQU      '206
CTRL_G      EQU      '207
BEL         EQU      '207
CTRL_H      EQU      '210
BS          EQU      '210
CTRL_I      EQU      '211
HT          EQU      '211
CTRL_J      EQU      '212
LF          EQU      '212
CTRL_K      EQU      '213
VT          EQU      '213
CTRL_L      EQU      '214
FF          EQU      '214
CTRL_M      EQU      '215
CR          EQU      '215
CTRL_N      EQU      '216
SO          EQU      '216
CTRL_O      EQU      '217
SI          EQU      '217
CTRL_P      EQU      '220
DLE         EQU      '220
CTRL_Q      EQU      '221
DC1         EQU      '221
CTRL_R      EQU      '222
DC2         EQU      '222
CTRL_S      EQU      '223
DC3         EQU      '223
CTRL_T      EQU      '224
DC4         EQU      '224
CTRL_U      EQU      '225
NAK         EQU      '225
CTRL_V      EQU      '226
SYN         EQU      '226
CTRL_W      EQU      '227
ETB         EQU      '227
CTRL_X      EQU      '230
CAN         EQU      '230
CTRL_Y      EQU      '231
EM          EQU      '231
CTRL_Z      EQU      '232
SUB         EQU      '232
CTRL_LBRACK EQU      '233
ESC         EQU      '233
CTRL_BACKSLASH EQU   '234
FS          EQU      '234
CTRL_RBRACK EQU      '235
GS          EQU      '235
CTRL_CARET  EQU      '236
RS          EQU      '236
CTRL_UNDERLINE EQU   '237
US          EQU      '237
SP          EQU      '240
DEL         EQU      '377

* Synonyms for important non-printing characters:
BACKSPACE   EQU      BS
TAB         EQU      HT
BELL        EQU      BEL
NEWLINE     EQU      LF
RHT         EQU      DC1
RUBOUT      EQU      DEL

* Status and action symbols:
ABS         EQU      0              'seekf': absolute positioning
REL         EQU      1              'seekf': relative positioning
*
DIGIT       EQU      DIG0           returned by 'type'
LETTER      EQU      LETA
*
LOWER       EQU      1              'mapstr': map to lower case
UPPER       EQU      2              'mapstr': map to upper case
*
READ        EQU      1              'open': open for reading
WRITE       EQU      2              'open': open for writing
READWRITE   EQU      3              'open': open for reading and writing
*
EOF         EQU      -1             end of file
OK          EQU      -2             non-error status
ERR         EQU      -3             error status
*
EOS         EQU      0              end of string  
*
LAMBDA      EQU      0              end of list marker
*
NO          EQU      0
YES         EQU      1
*
SYS_DATE    EQU      1              'date': return current date
SYS_TIME    EQU      2              'date': return current time
SYS_USERID  EQU      3              'date': return user's login name
SYS_PIDSTR  EQU      4              'date': process id as a string
SYS_DAY     EQU      5              'date': current day of week
SYS_PID     EQU      6              'date': user's process id
SYS_LDATE   EQU      7              'date': current day of week, month, day, year
SYS_MINUTES EQU      8              'date': minutes past midnight in str (1..2)
SYS_SECONDS EQU      9              'date': seconds past midnight in str (1..2)
SYS_MSEC    EQU      10             'date': msec. past midnight in str (1..2)
*
TA_SE_USEABLE  EQU   1              'gtattr': does 'se' support term?
TA_VTH_USEABLE EQU   2              'gtattr': does 'vth' support term?
TA_UPPER_ONLY  EQU   3              'gtattr': is term upper case only?

* Standard port definitions:
STDIN1      EQU      -10
STDOUT1     EQU      -11
STDIN2      EQU      -12
STDOUT2     EQU      -13
STDIN3      EQU      -14
STDOUT3     EQU      -15
STDIN       EQU      STDIN1
STDOUT      EQU      STDOUT1
ERRIN       EQU      STDIN3
ERROUT      EQU      STDOUT3
TTY         EQU      1              always references the terminal

* Limit definitions:
CHARS_PER_WORD EQU   2              characters per machine word
MAXINT      EQU      '77777         max single precision integer value
MAXARG      EQU      128            max size of an argument array
MAXCARD     EQU      101            max string length (excluding EOS)
MAXDECODE   EQU      200            max size of decoded string
MAXDIRENTRY EQU      32             max size of directory entry
MAXFNAME    EQU      33             max size of a filename array
MAXLINE     EQU      102            should be one more than MAXCARD
MAXPAT      EQU      256            max size of a pattern array
MAXPATH     EQU      180            max size of a pathname array
MAXPRINT    EQU      300            max size of output from 'print'
MAXSTR      EQU      100
MAXTERMATTR EQU      6              number of terminal attributes
MAXTERMTYPE EQU      7              max length of terminal type name (+1)
MAXTREE     EQU      256            max characters in a treename
MAXUSERNAME EQU      33             max size of user name string
MAXPACKEDUSERNAME EQU   (MAXUSERNAME-1)/2    for hollerith strings

* Miscellaneous definitions:
ESCAPE      EQU      R'@'
NOT         EQU      R'~'
DISABLE     EQU      1              Primos break$: disable breaks
ENABLE      EQU      0              Primos break$: enable breaks

            LIST
* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST
* swt_com.s.i --- Software Tools Subsystem Common Block Definition
* Version 9   -- 07/30/84
            NLST

SWT$CM      COMM ;
      TERMBUF(MAXTERMBUF),;
      TERMCP,;
      TERMCOUNT,;
      ECHAR,;
      KCHAR,;
      NLCHAR,;
      EOFCHAR,;
      ESCCHAR,;
      RTCHAR,;
      ISPHANTOM,;
      CPUTYPE,;
      ERRCOD,;
      STDPORTTBL(MAXSTDPORTS),;
      KILLRESP(MAXKILLRESP),;
      FDMEM(FDSIZE*NFILES),;
      RESERVEDIO(846),;
      FDBUF(MAXFDBUF),;
      PASSWD(7),;
      BPLABEL(4),;
      UTEMPTOP,;
      FDLASTFD,;
      PRTDEST(MAXPRTDEST),;
      PRTFORM(MAXPRTFORM),;
      UHASHTB(MAXTEMPHASH),;
      UTEMPBUF(MAXTEMPBUF),;
      RESERVEDOPEN(985),;
      CMDSTAT,;
      COMUNIT,;
      RTLABEL(4),;
      FIRSTUSE,;
      ARGC,;
      ARGV(MAXARGV),;
      TERMATTR(MAXTERMATTR),;
      TERMTYPE(MAXTERMTYPE),;
      LWORD,;
      LSHO,;
      LSTOP,;
      LSNA,;
      LSREF(MAXLSBUF),;
      RESERVEDSHELL(743),;
      TSSTATE,;
      TSGT,;
      TSAT,;
      TSEOS,;
      TSUN(MAXLEV),;
      TSPS(MAXLEV),;
      TSBF(MAXDIRENTRY*MAXLEV),;
      TSPW(3*MAXLEV),;
      TSPATH(MAXPATH),;
      RESERVEDTSCAN(680),;
      NEWSCR(MAXCOLS*MAXROWS),;
      RESERVEDNEWSCR(785),;
      CURSCR(MAXCOLS*MAXROWS),;
      RESERVEDCURSCR(785),;
      TCCLEARSCR(SEQSIZE),;
      TCCLEARTOEOL(SEQSIZE),;
      TCCLEARTOEOS(SEQSIZE),;
      TCCURSORHOME(SEQSIZE),;
      TCCURSORLEFT(SEQSIZE),;
      TCCURSORRIGHT(SEQSIZE),;
      TCCURSORUP(SEQSIZE),;
      TCCURSORDOWN(SEQSIZE),;
      TCABSPOS(SEQSIZE),;
      TCVERTPOS(SEQSIZE),;
      TCHORPOS(SEQSIZE),;
      TCINSLINE(SEQSIZE),;
      TCDELLINE(SEQSIZE),;
      TCINSCHAR(SEQSIZE),;
      TCDELCHAR(SEQSIZE),;
      TCINSSTR(SEQSIZE),;
      TCSHIFTIN(SEQSIZE),;
      TCSHIFTOUT(SEQSIZE),;
      TCCOORDCHAR,;
      TCSHIFTCHAR,;
      TCCOORDTYPE,;
      TCSEQTYPE,;
      TCDELAYTIME,;
      TCWRAPAROUND,;
      TCCLRLEN,;
      TCCEOSLEN,;
      TCCEOLLEN,;
      TCABSLEN,;
      TCVERTLEN,;
      TCHORLEN,;
      UNPRINTABLECHAR,;
      COLCHGSTART(MAXROWS),;
      COLCHGSTOP(MAXROWS),;
      ROWCHGSTART,;
      ROWCHGSTOP,;
      LASTCHAR(MAXROWS),;
      MAXROW,;
      MAXCOL,;
      CURROW,;
      CURCOL,;
      MSGROW,;
      MSGOWNER(MAXCOLS),;
      PADROW,;
      PADCOL,;
      PADLEN,;
      DISPLAYTIME,;
      FNTAB(CHARSETSIZE*MAXESCAPE),;
      LASTFN,;
      TABS(MAXCOLS),;
      INPUTSTART(MAXROWS),;
      INPUTSTOP(MAXROWS),;
      INBUF(MAXCOLS),;
      LASTCHARSCANNED,;
      INSERTMODE,;
      INVERTCASE,;
      DUPLEX,;
      INPUTWAIT,;
      PBBUF(MAXPB),;
      PBPTR,;
      FNUSED(MAXESCAPE),;
      DEFBUF(MAXDEF),;
      LASTDEF,;
      NESTINGCOUNT,;
      RESERVEDVTHMISC(489)

FDDEV       EQU      0  
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
FDVCSTAT1   EQU      8
FDVCSTAT2   EQU      9
FDOPSTAT1   EQU     10
FDOPSTAT2   EQU     11
FDOPSTAT3   EQU     12

            LIST

            LINK
SYS$$       ECB      SYS0,,CMD,2,189
            DATA     5,C'SYS$$'
            PROC

            DYNM     =38,CMD(3),FD(3)
            DYNM     I,STATUS,F,TEMP,OLD_CU,CODE,DESCR(4),ARGS(6)
            DYNM     COMMAND(128)

            EXT      MKONU$

SYS0        ARGT
            ENTR     SYS$$

            LT                      i = 1
            STA      I

            CALL     CTOV           call ctov (cmd, i, command, 128)
            AP       CMD,*S
            AP       I,S
            AP       COMMAND,S
            AP       =128,SL

            CRA                     status = 0
            STA      STATUS

            LDA      COMUNIT        old_cu = Comunit
            STA      OLD_CU

            CALL     BREAK$         Disable breaks
            AP       =DISABLE,SL

            LDA      FD,*           if (fd == ERR) # Don't change comi$$
            ERA      =ERR              goto l2
            BEQ      L2

            CALL     MAPFD          f = mapfd (fd)
            AP       FD,*SL
            BLE      L1             if (f <= 0)
            STA      F                 goto l1

            CALL     MAPSU          call flush$ (mapsu (fd))
            AP       FD,*SL
            STA      TEMP
            CALL     FLUSH$
            AP       TEMP,SL

            LDA      F              Comunit = f
            STA      COMUNIT        call comi$$ ("CONTIN", 6, f, code)
            CALL     COMI$$
            AP       =C'CONTIN',S
            AP       =6,S
            AP       F,S
            AP       CODE,SL
            JMP      L2             goto l2

L1          CRA                     Comunit = 0
            LDA      COMUNIT        call comi$$ ("PAUSE", 5, 0, code)
            CALL     COMI$$
            AP       =C'PAUSE',S
            AP       =5,S
            AP       =0,S
            AP       CODE,SL

L2          EAL      CLEANUP_       call mkonu$ to set up CLEANUP$ unit
            STL      DESCR
            EAL      SB%
            STL      DESCR+2
            EAL      CLEANUP$
            STL      ARGS
            EAL      DESCR
            STL      ARGS+3
            EAL      ARGS
            JSXB     MKONU$

            CALL     BREAK$         OK to reenable breaks now
            AP       =ENABLE,SL

            CALL     CP$            Pass command line to PRIMOS
            AP       COMMAND,S
            AP       I,S
            AP       STATUS,SL

            LDA      OLD_CU         Comunit = old_cu
            STA      COMUNIT

            BEQ      L3             If (Comunit == 0)
*                                      goto l3
            CALL     COMI$$         call comi$$ ("CONTIN", 6, old_cu, code)
            AP       =C'CONTIN',S
            AP       =6,S
            AP       OLD_CU,S
            AP       CODE,SL
            JMP      L4             goto l4

L3          CALL     COMI$$         call comi$$ ("PAUSE", 5, 0, code)
            AP       =C'PAUSE',S
            AP       =5,S
            AP       =0,S
            AP       CODE,SL

L4          LDA      I              if (i == 0)
            BEQ      L5                goto l5

            ERA      =E$NCOM        if (i == E$NCOM)
            BNE      L6                goto l6

L5          LDA      STATUS         if (status > 0)
            BGT      L6                goto l6

            LDA      =OK            return (OK)
            PRTN

L6          LDA      =ERR           return (ERR)
            PRTN

CLEANUP$    DATA     8,C'CLEANUP$'

            EJCT

* cleanup_ --- CLEANUP$ handler for sys$$

            LINK
CLEANUP_    ECB      CLEANUP0,,CP,1,14
            PROC

            DYNM     =10,CP(3)
            DYNM     RC

CLEANUP0    ARGT

            STLR     PB%+15         Save static link in XB

            LDA      OLD_CU-SB%+XB%  Comunit = old_cu
            STA      COMUNIT        if (Comunit == 0)
            BEQ      L10               goto l10

            CALL     COMI$$         call comi$$ ("CONTIN", 6, Comunit, rc)
            AP       =C'CONTIN',S
            AP       =6,S
            AP       COMUNIT,S
            AP       RC,SL

            PRTN                    return

L10         CALL     COMI$$         call comi$$ ("PAUSE", 5, 0, rc)
            AP       =C'PAUSE',S
            AP       =5,S
            AP       =0,S
            AP       RC,SL

            PRTN                    return

            END
* vtop --- convert varying to packed string
*
* integer function vtop (vstr, pstr, len)
* integer vstr (ARB), pstr (ARB), len
*
* returns number of characters moved

            SUBR     VTOP

            SEG
            RLIT
            SYML

* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
VTOP        ECB      CNVSTART,,VSTR,3
            DATA     4,C'VTOP'
            PROC

            DYNM     =20,VSTR(3),PSTR(3),LEN(3)
            DYNM     NUMCH

CNVSTART    ARGT
            ENTR     VTOP

            LDA      VSTR,*            get char count
            STA      NUMCH
            BEQ      QUIT
            RCB
            ARS      1              check for odd # chars
            BCR      NOTODD
            A1A
            TAX
            LDA      VSTR,*X        null fill last char of last word
            ANA      ='177400
            STA      VSTR,*X
            TXA                     recover the index

NOTODD      CAS      LEN,*
            JMP#     NOSPACE        see if enough words available in
            JMP#     GETINDX        'pstr'
            JMP#     GETINDX
NOSPACE     LDA      LEN,*
            ALS      1
            STA      NUMCH          if not, reset # words to copy
            BLE      QUIT           no space or > 32767 - die
            ARS      1

GETINDX     TAX                     set up index
            EAXB     PSTR,*

COPYCH      LDA      VSTR,*X        do it backwards
            STA      XB%-1,X
            BDX      COPYCH

QUIT        LDA      NUMCH          bye bye
            PRTN
            END
* zmem$ --- clear uninitialized part of a segment for ldseg$

            SUBR     ZMEM$   (symbol_table_node)

            SEG
            RLIT

* lib_def.s.i --- Software Tools Subsystem Library Definitions
*                 Version 9
            NLST     

* Defines for i/o routines:
MAXFILESTATE EQU     258
MAXLSBUF    EQU      16384
MAXFDBUF    EQU      16384
MAXARGV     EQU      256
MAXKILLRESP EQU      33
MAXPRTDEST  EQU      17
MAXPRTFORM  EQU      9
MAXTERMBUF  EQU      128
MAXSTDPORTS EQU      6
NFILES      EQU      128
BUFSIZE     EQU      128
FDSIZE      EQU      16
FDDEV       EQU      0
FDUNIT      EQU      1
FDBUFSTART  EQU      2
FDBUFLEN    EQU      3
FDBUFEND    EQU      4
FDCOUNT     EQU      5
FDBCOUNT    EQU      6
FDFLAGS     EQU      7
DEVTTY      EQU      1
DEVDSK      EQU      2
DEVNULL     EQU      3
FDBYTE      EQU      '100000
FDREAD      EQU      '040000
FDWRITE     EQU      '020000
FDEOF       EQU      '010000
FDERR       EQU      '004000
FDCOMP      EQU      '002000
FDOPENED    EQU      '001000
FDFTYPE     EQU      '000700
FDMBZ       EQU      '000060
FDLASTOP    EQU      '000017
FDINITIAL   EQU      0
FDREADF     EQU      1
FDWRITEF    EQU      2
FDGETLIN    EQU      3
FDPUTLIN    EQU      4
                     
* Defines for template expander:
MAXTEMPHASH EQU      37
MAXTEMPBUF  EQU      4096-MAXTEMPHASH

* Defines for tscan$
MAXLEV      EQU      32

* Defines for vth library routines
MAXROWS     EQU      51
MAXCOLS     EQU      85
SEQSIZE     EQU      6
CHARSETSIZE EQU      128
MAXESCAPE   EQU      20
MAXPB       EQU      400
MAXDEF      EQU      1000

* Procedure entry macro:
ENTR        MAC
            NLSM
<0>         BSS      0
            LSMD
            EAL      <1>
            STL      SB%+18
            LDA%     SB%+0
            ERA      ='4000
            STA%     SB%+0
            ENDM

            LIST

            LINK
ZMEM$       ECB      START,,NODE,1
            DATA     5,C'ZMEM$'
            PROC

            DYNM     =20,NODE(3),PTR(2)

ST_SEGNUM   EQU      XB%+1
ST_LOW      EQU      XB%+3
ST_HIGH     EQU      XB%+4

START       ARGT
            ENTR     ZMEM$

            EAXB     NODE,*
            LDA      ST_SEGNUM
            STA      PTR
            LDA      ST_LOW
            STA      PTR+1
            TCA
            A1A
            ADD      ST_HIGH
            TAX
            EAXB     PTR,*
            CRA
LOOP        STA      XB%,X
            BDX      LOOP
            PRTN

            END
