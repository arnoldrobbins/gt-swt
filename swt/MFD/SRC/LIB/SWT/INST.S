*   MAIN.PMA, DIRECV, BLS-CEH-CBL, 07/24/78
*   Dummy main program for ring 3 fault handlers.
*   Copyright (c) 1978, Prime Computer, Inc., Natick, Ma 01760
*
*   This software is temporary in nature, and may not be supported by Prime
*   beyond Rev. 17.  Users are hereby advised not to use these tools to
*   build their own libraries unless they are willing to support the
*   implied mechanisms themselves, including changes to PRIMOS and SEG.
*
       SEG
*
       SUBR MAIN,STRTE
       EXT   SHRLIB          REV. 16 INSTALLER
       EXT   R3POFH
*
STRT   EQU   *
       STA   PN              A=PACKAGE NO. TO INSTALL (FOR REPLACING)
       CALL SHRLIB
       AP    PN,S
       AP    R3POFH,S
       AP    CODE,SL
       STA   PAKNO           PACKAGE NUMBER
       LDA   CODE
       SZE
       JMP   ERIT
       CALL TNOUA
       AP    =C'THIS IS PACKAGE #',S
       AP    =17,SL
       LDA     PAKNO
       XCA
       DIV     =10
      ICA
      STA      PAKNO
      IAB
      ERA      PAKNO
      ERA      =C'00'
      STA      PAKNO
       CALL    TNOU
       AP      PAKNO,S
       AP      =2,SL
       CALL EXIT
*
ERIT   EQU  *
       CALL ERRPR$
       AP    =0,S
       AP    CODE,S
       AP    =0,S
       AP    =0,S
       AP    =0,S
       AP    =0,SL
*
CODE   DAC   **
PAKNO  BSZ   1
PN     DAC   **
*
       LINK
STRTE  ECB STRT
*
       END   STRTE
* DYNT FOR SHRLIB
     SEG
     DYNT  SHRLIB
     END
