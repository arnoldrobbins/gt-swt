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

include "=incl=/lib_def.s.i"

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
