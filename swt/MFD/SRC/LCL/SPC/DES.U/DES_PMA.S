* ENCRYPT_CHUNK --- ENCRYPT ONE 64 BIT CHUNK OF DATA

          SUBR      ENCRY0

          SEG
          RLIT

ENCRY0    ECB       ECHUNK,,PLAIN,3
          DYNM      PLAIN(3), CIPHER(3), KSCHED(3)

          DYNM      LEVEN(32), REVEN(32), LODD(32), RODD(32)
          DYNM      TEMP(32), I, KSPTR(3)

ECHUNK    ARGT

          CALL      INITI0    THE INITIAL PERMUTATION
          AP        PLAIN,*S
          AP        LEVEN,S
          AP        REVEN,SL

          CRA
          STA       I

LOOP      EQU       *

          DFLD      REVEN
          DFST      LODD
          DFLD      REVEN+4
          DFST      LODD+4
          DFLD      REVEN+8
          DFST      LODD+8
          DFLD      REVEN+12
          DFST      LODD+12
          DFLD      REVEN+16
          DFST      LODD+16
          DFLD      REVEN+20
          DFST      LODD+20
          DFLD      REVEN+24
          DFST      LODD+24
          DFLD      REVEN+28
          DFST      LODD+28

          LDX       I
          EAL       KSCHED,*X
          STL       KSPTR
          CALL      CIPHE0
          AP        REVEN,S
          AP        KSPTR,*S
          AP        TEMP,SL

          LDL       LEVEN
          ERL       TEMP
          STL       RODD
          LDL       LEVEN+2
          ERL       TEMP+2
          STL       RODD+2
          LDL       LEVEN+4
          ERL       TEMP+4
          STL       RODD+4
          LDL       LEVEN+6
          ERL       TEMP+6
          STL       RODD+6
          LDL       LEVEN+8
          ERL       TEMP+8
          STL       RODD+8
          LDL       LEVEN+10
          ERL       TEMP+10
          STL       RODD+10
          LDL       LEVEN+12
          ERL       TEMP+12
          STL       RODD+12
          LDL       LEVEN+14
          ERL       TEMP+14
          STL       RODD+14
          LDL       LEVEN+16
          ERL       TEMP+16
          STL       RODD+16
          LDL       LEVEN+18
          ERL       TEMP+18
          STL       RODD+18
          LDL       LEVEN+20
          ERL       TEMP+20
          STL       RODD+20
          LDL       LEVEN+22
          ERL       TEMP+22
          STL       RODD+22
          LDL       LEVEN+24
          ERL       TEMP+24
          STL       RODD+24
          LDL       LEVEN+26
          ERL       TEMP+26
          STL       RODD+26
          LDL       LEVEN+28
          ERL       TEMP+28
          STL       RODD+28
          LDL       LEVEN+30
          ERL       TEMP+30
          STL       RODD+30

*         SECOND HALF OF UNROLLED MAIN LOOP:

          DFLD      RODD
          DFST      LEVEN
          DFLD      RODD+4
          DFST      LEVEN+4
          DFLD      RODD+8
          DFST      LEVEN+8
          DFLD      RODD+12
          DFST      LEVEN+12
          DFLD      RODD+16
          DFST      LEVEN+16
          DFLD      RODD+20
          DFST      LEVEN+20
          DFLD      RODD+24
          DFST      LEVEN+24
          DFLD      RODD+28
          DFST      LEVEN+28

          LDA       I
          ADD       =48
          STA       I

          LDX       I
          EAL       KSCHED,*X
          STL       KSPTR
          CALL      CIPHE0
          AP        RODD,S
          AP        KSPTR,*S
          AP        TEMP,SL

          LDL       LODD
          ERL       TEMP
          STL       REVEN
          LDL       LODD+2
          ERL       TEMP+2
          STL       REVEN+2
          LDL       LODD+4
          ERL       TEMP+4
          STL       REVEN+4
          LDL       LODD+6
          ERL       TEMP+6
          STL       REVEN+6
          LDL       LODD+8
          ERL       TEMP+8
          STL       REVEN+8
          LDL       LODD+10
          ERL       TEMP+10
          STL       REVEN+10
          LDL       LODD+12
          ERL       TEMP+12
          STL       REVEN+12
          LDL       LODD+14
          ERL       TEMP+14
          STL       REVEN+14
          LDL       LODD+16
          ERL       TEMP+16
          STL       REVEN+16
          LDL       LODD+18
          ERL       TEMP+18
          STL       REVEN+18
          LDL       LODD+20
          ERL       TEMP+20
          STL       REVEN+20
          LDL       LODD+22
          ERL       TEMP+22
          STL       REVEN+22
          LDL       LODD+24
          ERL       TEMP+24
          STL       REVEN+24
          LDL       LODD+26
          ERL       TEMP+26
          STL       REVEN+26
          LDL       LODD+28
          ERL       TEMP+28
          STL       REVEN+28
          LDL       LODD+30
          ERL       TEMP+30
          STL       REVEN+30

          LDA       I
          ADD       =48
          STA       I

          SUB       =768
          BCLT      LOOP

          CALL      INVER0
          AP        REVEN,S
          AP        LEVEN,S
          AP        CIPHER,*SL

          PRTN
          END
* DECRYPT_CHUNK --- DECRYPT ONE 64 BIT CHUNK OF DATA

          SUBR      DECRY0

          SEG
          RLIT

DECRY0    ECB       DCHUNK,,CIPHER,3
          DYNM      CIPHER(3), PLAIN(3), KSCHED(3)

          DYNM      LEVEN(32), REVEN(32), LODD(32), RODD(32)
          DYNM      TEMP(32), I, KSPTR(3)

DCHUNK    ARGT

          CALL      INITI0
          AP        CIPHER,*S
          AP        REVEN,S
          AP        LEVEN,SL

          LDA       =720
          STA       I

LOOP      EQU       *

          DFLD      LEVEN
          DFST      RODD
          DFLD      LEVEN+4
          DFST      RODD+4
          DFLD      LEVEN+8
          DFST      RODD+8
          DFLD      LEVEN+12
          DFST      RODD+12
          DFLD      LEVEN+16
          DFST      RODD+16
          DFLD      LEVEN+20
          DFST      RODD+20
          DFLD      LEVEN+24
          DFST      RODD+24
          DFLD      LEVEN+28
          DFST      RODD+28

          LDX       I
          EAL       KSCHED,*X
          STL       KSPTR
          CALL      CIPHE0
          AP        LEVEN,S
          AP        KSPTR,*S
          AP        TEMP,SL

          LDL       REVEN
          ERL       TEMP
          STL       LODD
          LDL       REVEN+2
          ERL       TEMP+2
          STL       LODD+2
          LDL       REVEN+4
          ERL       TEMP+4
          STL       LODD+4
          LDL       REVEN+6
          ERL       TEMP+6
          STL       LODD+6
          LDL       REVEN+8
          ERL       TEMP+8
          STL       LODD+8
          LDL       REVEN+10
          ERL       TEMP+10
          STL       LODD+10
          LDL       REVEN+12
          ERL       TEMP+12
          STL       LODD+12
          LDL       REVEN+14
          ERL       TEMP+14
          STL       LODD+14
          LDL       REVEN+16
          ERL       TEMP+16
          STL       LODD+16
          LDL       REVEN+18
          ERL       TEMP+18
          STL       LODD+18
          LDL       REVEN+20
          ERL       TEMP+20
          STL       LODD+20
          LDL       REVEN+22
          ERL       TEMP+22
          STL       LODD+22
          LDL       REVEN+24
          ERL       TEMP+24
          STL       LODD+24
          LDL       REVEN+26
          ERL       TEMP+26
          STL       LODD+26
          LDL       REVEN+28
          ERL       TEMP+28
          STL       LODD+28
          LDL       REVEN+30
          ERL       TEMP+30
          STL       LODD+30

*         SECOND HALF OF UNROLLED MAIN LOOP:

          DFLD      LODD
          DFST      REVEN
          DFLD      LODD+4
          DFST      REVEN+4
          DFLD      LODD+8
          DFST      REVEN+8
          DFLD      LODD+12
          DFST      REVEN+12
          DFLD      LODD+16
          DFST      REVEN+16
          DFLD      LODD+20
          DFST      REVEN+20
          DFLD      LODD+24
          DFST      REVEN+24
          DFLD      LODD+28
          DFST      REVEN+28

          LDA       I
          SUB       =48
          STA       I

          LDX       I
          EAL       KSCHED,*X
          STL       KSPTR
          CALL      CIPHE0
          AP        LODD,S
          AP        KSPTR,*S
          AP        TEMP,SL

          LDL       RODD
          ERL       TEMP
          STL       LEVEN
          LDL       RODD+2
          ERL       TEMP+2
          STL       LEVEN+2
          LDL       RODD+4
          ERL       TEMP+4
          STL       LEVEN+4
          LDL       RODD+6
          ERL       TEMP+6
          STL       LEVEN+6
          LDL       RODD+8
          ERL       TEMP+8
          STL       LEVEN+8
          LDL       RODD+10
          ERL       TEMP+10
          STL       LEVEN+10
          LDL       RODD+12
          ERL       TEMP+12
          STL       LEVEN+12
          LDL       RODD+14
          ERL       TEMP+14
          STL       LEVEN+14
          LDL       RODD+16
          ERL       TEMP+16
          STL       LEVEN+16
          LDL       RODD+18
          ERL       TEMP+18
          STL       LEVEN+18
          LDL       RODD+20
          ERL       TEMP+20
          STL       LEVEN+20
          LDL       RODD+22
          ERL       TEMP+22
          STL       LEVEN+22
          LDL       RODD+24
          ERL       TEMP+24
          STL       LEVEN+24
          LDL       RODD+26
          ERL       TEMP+26
          STL       LEVEN+26
          LDL       RODD+28
          ERL       TEMP+28
          STL       LEVEN+28
          LDL       RODD+30
          ERL       TEMP+30
          STL       LEVEN+30

          LDA       I
          SUB       =48
          STA       I

          BGT       LOOP

          CALL      INVER0
          AP        LEVEN,S
          AP        REVEN,S
          AP        PLAIN,*SL

          PRTN
          END
* cipher_function --- perform central DES cipher function

          SUBR      CIPHE0

          SEG
          RLIT

CIPHE0    ECB       CFUNC,,A,3
          DYNM      A(3), KEY(3), VAL(3)

          DYNM      E(48), R(32), I, J, K

S         DEC       1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1
          DEC       0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0
          DEC       0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0
          DEC       0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1
          DEC       0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0
          DEC       1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1
          DEC       1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1
          DEC       1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0
          DEC       0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0
          DEC       1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1
          DEC       1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1
          DEC       0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0
          DEC       1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0
          DEC       0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1
          DEC       0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0
          DEC       1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1

          DEC       1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0
          DEC       0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0
          DEC       1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1
          DEC       1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0
          DEC       0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1
          DEC       1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0
          DEC       1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0
          DEC       0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1
          DEC       0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1
          DEC       1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1
          DEC       0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0
          DEC       1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1
          DEC       1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1
          DEC       0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0
          DEC       1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0
          DEC       0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1

          DEC       1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0
          DEC       0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1
          DEC       0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1
          DEC       1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0
          DEC       1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1
          DEC       0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0
          DEC       0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0
          DEC       1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1
          DEC       1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1
          DEC       1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0
          DEC       1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0
          DEC       0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1
          DEC       0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0
          DEC       0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1
          DEC       0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1
          DEC       1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0

          DEC       0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1
          DEC       0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0
          DEC       0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1
          DEC       1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1
          DEC       1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1
          DEC       0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1
          DEC       0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0
          DEC       0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1
          DEC       1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0
          DEC       1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1
          DEC       1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0
          DEC       0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0
          DEC       0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0
          DEC       1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0
          DEC       1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1
          DEC       1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0

          DEC       0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1
          DEC       0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0
          DEC       1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1
          DEC       1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1
          DEC       1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0
          DEC       0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1
          DEC       0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0
          DEC       0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0
          DEC       0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1
          DEC       1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0
          DEC       1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1
          DEC       0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0
          DEC       1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1
          DEC       0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1
          DEC       0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1
          DEC       1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1

          DEC       1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1
          DEC       1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0
          DEC       0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0
          DEC       1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1
          DEC       1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0
          DEC       0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1
          DEC       0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0
          DEC       0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0
          DEC       1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1
          DEC       0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1
          DEC       0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0
          DEC       0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0
          DEC       0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0
          DEC       1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0
          DEC       1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1
          DEC       0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1

          DEC       0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0
          DEC       1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1
          DEC       0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1
          DEC       0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1
          DEC       1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1
          DEC       0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0
          DEC       1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0
          DEC       0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0
          DEC       0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1
          DEC       1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0
          DEC       1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0
          DEC       0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0
          DEC       0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0
          DEC       0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1
          DEC       1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1
          DEC       1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0

          DEC       1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0
          DEC       0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1
          DEC       1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0
          DEC       0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1
          DEC       0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0
          DEC       1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0
          DEC       1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1
          DEC       0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0
          DEC       0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1
          DEC       1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0
          DEC       0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1
          DEC       1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0
          DEC       0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1
          DEC       0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1
          DEC       1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0
          DEC       0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1


CFUNC     ARGT

          EALB      A,*
          EALB      LB%-'400
          EAXB      KEY,*

          LDA       LB%+31+'400
          ERA       XB%+0
          STA       E+0
          LDA       LB%+0+'400
          ERA       XB%+1
          STA       E+1
          LDL       LB%+1+'400
          ERL       XB%+2
          STL       E+2
          LDL       LB%+3+'400
          ERL       XB%+4
          STL       E+4
          LDL       LB%+3+'400
          ERL       XB%+6
          STL       E+6
          LDL       LB%+5+'400
          ERL       XB%+8
          STL       E+8
          LDL       LB%+7+'400
          ERL       XB%+10
          STL       E+10
          LDL       LB%+7+'400
          ERL       XB%+12
          STL       E+12
          LDL       LB%+9+'400
          ERL       XB%+14
          STL       E+14
          LDL       LB%+11+'400
          ERL       XB%+16
          STL       E+16
          LDL       LB%+11+'400
          ERL       XB%+18
          STL       E+18
          LDL       LB%+13+'400
          ERL       XB%+20
          STL       E+20
          LDL       LB%+15+'400
          ERL       XB%+22
          STL       E+22
          LDL       LB%+15+'400
          ERL       XB%+24
          STL       E+24
          LDL       LB%+17+'400
          ERL       XB%+26
          STL       E+26
          LDL       LB%+19+'400
          ERL       XB%+28
          STL       E+28
          LDL       LB%+19+'400
          ERL       XB%+30
          STL       E+30
          LDL       LB%+21+'400
          ERL       XB%+32
          STL       E+32
          LDL       LB%+23+'400
          ERL       XB%+34
          STL       E+34
          LDL       LB%+23+'400
          ERL       XB%+36
          STL       E+36
          LDL       LB%+25+'400
          ERL       XB%+38
          STL       E+38
          LDL       LB%+27+'400
          ERL       XB%+40
          STL       E+40
          LDL       LB%+27+'400
          ERL       XB%+42
          STL       E+42
          LDL       LB%+29+'400
          ERL       XB%+44
          STL       E+44
          LDA       LB%+31+'400
          ERA       XB%+46
          STA       E+46
          LDA       LB%+0+'400
          ERA       XB%+47
          STA       E+47

          CRA
          STA       I
          STA       J
          STA       K

LOOP      EQU       *

          LDX       K
          LDA       I
          ALL       1
          ADD       E,X
          ALL       1
          ADD       E+5,X
          ALL       1
          ADD       E+1,X
          ALL       1
          ADD       E+2,X
          ALL       1
          ADD       E+3,X
          ALL       1
          ADD       E+4,X
          ALL       2

          TAX
          DFLD      S,X
          LDX       J
          DFST      R,X

          LDA       K
          ADD       =6
          STA       K

          LDA       J
          ADD       =4
          STA       J

          LDA       I
          A1A
          STA       I
          SUB       =8
          BCLT      LOOP


          EALB      VAL,*
          EALB      LB%-'400

          LDA       R+15
          STA       LB%+0+'400
          LDA       R+6
          STA       LB%+1+'400
          LDA       R+19
          STA       LB%+2+'400
          LDA       R+20
          STA       LB%+3+'400
          LDA       R+28
          STA       LB%+4+'400
          LDA       R+11
          STA       LB%+5+'400
          LDA       R+27
          STA       LB%+6+'400
          LDA       R+16
          STA       LB%+7+'400
          LDA       R+0
          STA       LB%+8+'400
          LDA       R+14
          STA       LB%+9+'400
          LDA       R+22
          STA       LB%+10+'400
          LDA       R+25
          STA       LB%+11+'400
          LDA       R+4
          STA       LB%+12+'400
          LDA       R+17
          STA       LB%+13+'400
          LDA       R+30
          STA       LB%+14+'400
          LDA       R+9
          STA       LB%+15+'400
          LDA       R+1
          STA       LB%+16+'400
          LDA       R+7
          STA       LB%+17+'400
          LDA       R+23
          STA       LB%+18+'400
          LDA       R+13
          STA       LB%+19+'400
          LDA       R+31
          STA       LB%+20+'400
          LDA       R+26
          STA       LB%+21+'400
          LDA       R+2
          STA       LB%+22+'400
          LDA       R+8
          STA       LB%+23+'400
          LDA       R+18
          STA       LB%+24+'400
          LDA       R+12
          STA       LB%+25+'400
          LDA       R+29
          STA       LB%+26+'400
          LDA       R+5
          STA       LB%+27+'400
          LDA       R+21
          STA       LB%+28+'400
          LDA       R+10
          STA       LB%+29+'400
          LDA       R+3
          STA       LB%+30+'400
          LDA       R+24
          STA       LB%+31+'400

          PRTN
          END
