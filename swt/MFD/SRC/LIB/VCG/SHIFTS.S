*  shifts --- shortcall routines to do variable shifts
*
*
*           ENT      C$LSHFS        Left shift signed & unsigned ints
*           ENT      C$LSHFL        Left shift signed & unsigned longs
*           ENT      C$RSHFSS       Right shift signed int
*           ENT      C$RSHFSL       Right shift signed long
*           ENT      C$RSHFUS       Right shift unsigned int
*           ENT      C$RSHFUL       Right shift unsigned long
*
*  Left shift signed & unsigned ints (shorts)
*
*     Shift count in X reg
*     Operand in A reg
*     Return address in XB% reg
*
            SEG
            SYML
            RLIT

            ENT      C$LSHFS
            PROC
C$LSHFS     EQU      *
            TAB
            TXA
            CAS      ='177777       bounds check
            CAS      ='21
            RCB
            LDA      ='20
            TAX
            TBA
            XEC      LSHFS$TB,X
            JMP%     XB%
            FIN

LSHFS$TB    RCB
            ALL      1
            ALL      2
            ALL      3
            ALL      4
            ALL      5
            ALL      6
            ALL      7
            ALL      8
            ALL      9
            ALL      10
            ALL      11
            ALL      12
            ALL      13
            ALL      14
            ALL      15
            CRA                     has to be zero (no sign)
            END

*
*  Left shift signed & unsigned long ints
*
*     Shift count in X reg
*     Operand in L reg
*     Return address in XB% reg
*
            SEG
            SYML
            RLIT

            ENT      C$LSHFL
            PROC
C$LSHFL     EQU      *
            ILE
            TXA
            CAS      ='177777       bounds check
            CAS      ='41
            RCB
            LDA      ='40
            TAX
            ILE
            XEC      LSHFL$TB,X
            JMP%     XB%
            FIN

LSHFL$TB    RCB
            LLL      1
            LLL      2
            LLL      3
            LLL      4
            LLL      5
            LLL      6
            LLL      7
            LLL      8
            LLL      9
            LLL      10
            LLL      11
            LLL      12
            LLL      13
            LLL      14
            LLL      15
            LLL      16             for both signed & unsigned
            LLL      17
            LLL      18
            LLL      19
            LLL      20
            LLL      21
            LLL      22
            LLL      23
            LLL      24
            LLL      25
            LLL      26
            LLL      27
            LLL      28
            LLL      29
            LLL      30
            LLL      31
            CRL
            END

*
*  Right shift unsigned ints
*
*     Shift count in X reg
*     Operand in A reg
*     Return address in XB% reg
*
            SEG
            SYML
            RLIT

            ENT      C$RSHFUS
            PROC
C$RSHFUS    EQU      *
            TAB
            TXA
            CAS      ='177777       bounds check
            CAS      ='21
            RCB
            LDA      ='20
            TAX
            TBA
            XEC      RSHUS$TB,X
            JMP%     XB%
            FIN

RSHUS$TB    RCB
            ARL      1
            ARL      2
            ARL      3
            ARL      4
            ARL      5
            ARL      6
            ARL      7
            ARL      8
            ARL      9
            ARL      10
            ARL      11
            ARL      12
            ARL      13
            ARL      14
            ARL      15
            CRA
            END

*
*  Right shift unsigned longs
*
*     Shift count in X reg
*     Operand in L reg
*     Return address in XB% reg
*
            SEG
            SYML
            RLIT

            ENT      C$RSHFUL
            PROC
C$RSHFUL    EQU      *
            ILE
            TXA
            CAS      ='177777       bounds check
            CAS      ='41
            RCB
            LDA      ='40
            TAX
            ILE
            XEC      RSHUL$TB,X
            JMP%     XB%
            FIN

RSHUL$TB    RCB
            LRL      1
            LRL      2
            LRL      3
            LRL      4
            LRL      5
            LRL      6
            LRL      7
            LRL      8
            LRL      9
            LRL      10
            LRL      11
            LRL      12
            LRL      13
            LRL      14
            LRL      15
            XCA
            LRL      17
            LRL      18
            LRL      19
            LRL      20
            LRL      21
            LRL      22
            LRL      23
            LRL      24
            LRL      25
            LRL      26
            LRL      27
            LRL      28
            LRL      29
            LRL      30
            LRL      31
            CRL
            END

*
*  Right shift signed ints
*
*     Shift count in X reg
*     Operand in A reg
*     Return address in XB% reg
*
            SEG
            SYML
            RLIT

            ENT      C$RSHFSS
            PROC
C$RSHFSS    EQU      *
            TAB
            TXA
            CAS      ='177777       bounds check
            CAS      ='21
            RCB
            LDA      ='20
            TAX
            TBA
            XEC      RSHSS$TB,X
            JMP%     XB%
            FIN

RSHSS$TB    RCB
            ARS      1
            ARS      2
            ARS      3
            ARS      4
            ARS      5
            ARS      6
            ARS      7
            ARS      8
            ARS      9
            ARS      10
            ARS      11
            ARS      12
            ARS      13
            ARS      14
            ARS      15
            CRA                     has to be zero (no sign)
            END

*
*  Right shift signed long int
*
*     Shift count in X reg
*     Operand in L reg
*     Return address in XB% reg
*
            SEG
            SYML
            RLIT

            ENT      C$RSHFSL
            PROC
C$RSHFSL    EQU      *
            ILE
            TXA
            CAS      ='177777       bounds check
            CAS      ='41
            RCB
            LDA      ='40
            TAX
            ILE
            XEC      RSHSL$TB,X
            JMP%     XB%
            FIN

RSHSL$TB    RCB
            LRS      1
            LRS      2
            LRS      3
            LRS      4
            LRS      5
            LRS      6
            LRS      7
            LRS      8
            LRS      9
            LRS      10
            LRS      11
            LRS      12
            LRS      13
            LRS      14
            LRS      15
            LRS      16
            LRS      17
            LRS      18
            LRS      19
            LRS      20
            LRS      21
            LRS      22
            LRS      23
            LRS      24
            LRS      25
            LRS      26
            LRS      27
            LRS      28
            LRS      29
            LRS      30
            LRS      31
            CRL                     has to be zero (no sign)
            END
