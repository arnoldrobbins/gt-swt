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

include "=incl=/swt_def.s.i"
include "=incl=/lib_def.s.i"

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
