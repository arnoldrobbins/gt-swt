* sys$$ --- pass a command string to PRIMOS for execution

            SUBR     SYS$$

            SEG
            RLIT

include "=syscom=/errd.ins.pma"
include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"
include "=incl=/swt_com.s.i"

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
