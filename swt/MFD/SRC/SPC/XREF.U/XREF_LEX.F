      SUBROUTINE GETSYM
      INTEGER A$BUF(200)
      COMMON /OPTCOM/A$BUF
      INTEGER SYMTE0(200),SYMNA0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,SYMNA0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER OUTBU0(102)
      INTEGER OUTPA0,OUTLI0,OUTWI0
      COMMON /OBUFC0/OUTBU0,OUTPA0,OUTLI0,OUTWI0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER RADIX,I
      INTEGER INDEX
      INTEGER C,QUOTE
      INTEGER NGETCH
      INTEGER AAAAA0
      INTEGER AAAAB0(23)
      INTEGER AAAAC0
      DATA AAAAB0/176,177,178,179,180,181,182,183,184,185,225,226,227,22
     *8,229,230,193,194,195,196,197,198,0/
10000   SYMLE0=0
        SYMTE0(1)=0
        SYMNA0(1)=0
        CALL NGETCH(C)
        CALL SKIPB0(C)
        AAAAA0=C
        GOTO 10001
10002     I=0
10003       SYMLE0=SYMLE0+(1)
            SYMTE0(SYMLE0)=C
            IF((C.EQ.223))GOTO 10004
              I=I+(1)
              SYMNA0(I)=C
10004       CALL NGETCH(C)
          IF((193.GT.C))GOTO 10005
          IF((C.GT.218))GOTO 10005
          GOTO 10003
10005     IF((225.GT.C))GOTO 10006
          IF((C.GT.250))GOTO 10006
          GOTO 10003
10006     IF((176.GT.C))GOTO 10007
          IF((C.GT.185))GOTO 10007
          GOTO 10003
10007     IF((C.EQ.223))GOTO 10003
          IF((C.EQ.164))GOTO 10003
          CALL PUTBA0(C)
          SYMTE0(SYMLE0+1)=0
          SYMNA0(I+1)=0
          SYMBO0=1
          GOTO 10008
10009     CONTINUE
10010     IF((176.GT.C))GOTO 10011
          IF((C.GT.185))GOTO 10011
            SYMLE0=SYMLE0+(1)
            SYMTE0(SYMLE0)=C
            CALL NGETCH(C)
          GOTO 10010
10011     IF((C.NE.242))GOTO 10012
            SYMLE0=SYMLE0+(1)
            SYMTE0(SYMLE0)=242
10013       IF((INDEX(AAAAB0,NGETCH(C)).EQ.0))GOTO 10014
              SYMLE0=SYMLE0+(1)
              SYMTE0(SYMLE0)=C
            GOTO 10013
10014     CONTINUE
10012     SYMTE0(SYMLE0+1)=0
          CALL PUTBA0(C)
          SYMBO0=3
          GOTO 10008
10015     SYMBO0=2
          QUOTE=C
10016       SYMLE0=SYMLE0+(1)
            IF((SYMLE0.LT.200))GOTO 10017
              CALL SYNERR('Quoted literal too long.')
              GOTO 10008
10017       SYMTE0(SYMLE0)=C
            IF((C.NE.138))GOTO 10018
              CALL SYNERR('Unmatched quote.')
              CALL PUTBA0(C)
              C=QUOTE
              GOTO 10019
10018     CONTINUE
          IF((NGETCH(C).NE.QUOTE))GOTO 10016
10019     SYMLE0=SYMLE0+(1)
          SYMTE0(SYMLE0)=C
          IF((225.GT.NGETCH(C)))GOTO 10020
          IF((C.GT.'z'))GOTO 10020
            SYMLE0=SYMLE0+(1)
            SYMTE0(SYMLE0)=C
10020     CALL PUTBA0(C)
          SYMTE0(SYMLE0+1)=0
          GOTO 10008
10001   AAAAC0=AAAAA0-161
        GOTO(10015,10021,10021,10021,10021,10015,10021,10021,10021,10021
     *,10021,10021,10021,10021,10009,10009,10009,10009,10009,10009,10009
     *,10009,10009,10009,10021,10021,10021,10021,10021,10021,10021,10002
     *,10002,10002,10002,10002,10002,10002,10002,10002,10002,10002,10002
     *,10002,10002,10002,10002,10002,10002,10002,10002,10002,10002,10002
     *,10002,10002,10002,10021,10021,10021,10021,10021,10021,10002,10002
     *,10002,10002,10002,10002,10002,10002,10002,10002,10002,10002,10002
     *,10002,10002,10002,10002,10002,10002,10002,10002,10002,10002,10002
     *,10002,10002),AAAAC0
10021     SYMBO0=C
          SYMTE0(1)=C
          SYMTE0(2)=0
          SYMLE0=1
          GOTO 10008
10008 RETURN
      END
      SUBROUTINE SKIPB0(C)
      INTEGER C
10022   CONTINUE
10023   IF((C.NE.160))GOTO 10024
          CALL OUTCH(C)
          CALL NGETCH(C)
        GOTO 10023
10024   IF((C.NE.163))GOTO 10025
10026       CALL OUTCH(C)
            CALL NGETCH(C)
          IF((C.NE.138))GOTO 10026
10025 CONTINUE
      IF((C.EQ.160))GOTO 10022
      RETURN
      END
      INTEGER FUNCTION NGETCH(C)
      INTEGER C
      INTEGER A$BUF(200)
      COMMON /OPTCOM/A$BUF
      INTEGER SYMTE0(200),SYMNA0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,SYMNA0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER OUTBU0(102)
      INTEGER OUTPA0,OUTLI0,OUTWI0
      COMMON /OBUFC0/OUTBU0,OUTPA0,OUTLI0,OUTWI0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER GETLIN
      IF((INBUF0(IBPAA0).EQ.0))GOTO 10027
        NGETCH=INBUF0(IBPAA0)
        IBPAA0=IBPAA0+1
        GOTO 10028
10027   CONTINUE
10029     IF((LEVEL0.GE.1))GOTO 10030
            NGETCH=-1
            C=-1
            INBUF0(400)=0
            IBPAA0=400
            RETURN
10030     IF((GETLIN(INBUF0(400),INFIL0(LEVEL0)).EQ.-1))GOTO 10031
            LINEN0(LEVEL0)=LINEN0(LEVEL0)+1
            GOTO 10032
10031     CALL CLOSE(INFIL0(LEVEL0))
          LEVEL0=LEVEL0-1
        GOTO 10029
10032   NGETCH=INBUF0(400)
        IBPAA0=400+1
10028 C=NGETCH
      RETURN
      END
      SUBROUTINE PUTBA0(C)
      INTEGER C
      INTEGER A$BUF(200)
      COMMON /OPTCOM/A$BUF
      INTEGER SYMTE0(200),SYMNA0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,SYMNA0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER OUTBU0(102)
      INTEGER OUTPA0,OUTLI0,OUTWI0
      COMMON /OBUFC0/OUTBU0,OUTPA0,OUTLI0,OUTWI0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      IBPAA0=IBPAA0-1
      IF((IBPAA0.LT.1))GOTO 10033
        INBUF0(IBPAA0)=C
        GOTO 10034
10033   CALL ERROR('too many characters pushed back.')
10034 RETURN
      END
      SUBROUTINE PUTBB0(STR)
      INTEGER STR(1)
      INTEGER A$BUF(200)
      COMMON /OPTCOM/A$BUF
      INTEGER SYMTE0(200),SYMNA0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,SYMNA0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER OUTBU0(102)
      INTEGER OUTPA0,OUTLI0,OUTWI0
      COMMON /OBUFC0/OUTBU0,OUTPA0,OUTLI0,OUTWI0
      INTEGER MEMAA0(30000)
      COMMON /DS$MEM/MEMAA0
      INTEGER I
      INTEGER LENGTH
      I=LENGTH(STR)
      GOTO 10037
10035 I=I-1
10037 IF((I.LE.0))GOTO 10036
        CALL PUTBA0(STR(I))
      GOTO 10035
10036 RETURN
      END
C ---- Long Name Map ----
C compare                        compa0
C initcrossref                   initc0
C putbackstr                     putbb0
C putback                        putba0
C obufcom                        obufc0
C buildcrossref                  build0
C underline                      under0
C Outbuf                         outbu0
C Symbol                         symbo0
C Inbuf                          inbuf0
C Ibp                            ibpaa0
C Symlen                         symle0
C Level                          level0
C Mem                            memaa0
C Symtext                        symte0
C dumpbuffer                     dumpb0
C enterkw                        enter0
C outputkeyword                  outpu0
C Outwidth                       outwi0
C Outp                           outpa0
C boldface                       boldf0
C Infile                         infil0
C Symname                        symna0
C skipblanksandcomments          skipb0
C printcrossref                  print0
C Idtable                        idtab0
C Outline                        outli0
C Linenumber                     linen0
