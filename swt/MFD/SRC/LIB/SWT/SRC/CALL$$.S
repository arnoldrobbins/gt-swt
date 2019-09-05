* call$$ --- execute a P300 or SEG or EPF runfile as a procedure
*
* integer function call$$ (name, length)
* integer name (16), length

            SUBR     CALL$$

            SEG
            RLIT

include "=syscom=/errd.ins.pma"
include "=syscom=/keys.ins.pma"
include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"
include "=incl=/swt_com.s.i"

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
