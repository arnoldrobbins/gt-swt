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
