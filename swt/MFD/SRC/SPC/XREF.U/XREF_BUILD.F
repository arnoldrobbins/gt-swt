      SUBROUTINE BUILD0(IFD,TFD)
      INTEGER IFD,TFD
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
      INTEGER L
      INTEGER LOOKUP,EQUAL,SCOPY
      INTEGER OPEN
      INTEGER FILEN0(180)
      INTEGER INFO(1)
      INTEGER AAAAA0(8)
      DATA AAAAA0/233,238,227,236,245,228,229,0/
      LEVEL0=1
      INFIL0(LEVEL0)=IFD
      LINEN0(LEVEL0)=0
      CALL GETSYM
10000   IF((SYMBO0.NE.1))GOTO 10001
          IF((LOOKUP(SYMNA0,INFO,IDTAB0).NE.1))GOTO 10002
            CALL OUTPU0
            IF((A$BUF(233-225+1).EQ.0))GOTO 10003
            IF((EQUAL(SYMTE0,AAAAA0).EQ.0))GOTO 10003
              CALL GETSYM
              CALL OUTSTR(SYMTE0)
              IF((SYMBO0.NE.2))GOTO 10004
                L=SCOPY(SYMTE0,2,FILEN0,1)
                FILEN0(L)=0
                GOTO 10005
10004           CALL SCOPY(SYMTE0,1,FILEN0,1)
10005         CONTINUE
10006           CALL GETSYM
                CALL OUTSTR(SYMTE0)
              IF((SYMBO0.NE.138))GOTO 10006
              IF((LEVEL0.LT.5))GOTO 10007
                CALL SYNERR('includes nested too deeply.')
                GOTO 10008
10007           LEVEL0=LEVEL0+(1)
                LINEN0(LEVEL0)=0
                INFIL0(LEVEL0)=OPEN(FILEN0,1)
                IF((INFIL0(LEVEL0).NE.-3))GOTO 10009
                  LEVEL0=LEVEL0-(1)
                  CALL SYNERR('can''t open include file.')
                  CALL PRINT(-15,'File name: *s*n.',FILEN0)
10009         CONTINUE
10008       CONTINUE
10003       GOTO 10010
10002       CALL PRINT(TFD,'*s,*6i*n.',SYMNA0,OUTLI0)
            CALL OUTSTR(SYMTE0)
10010     GOTO 10011
10001     IF((A$BUF(236-225+1).EQ.0))GOTO 10012
          IF((SYMBO0.NE.3))GOTO 10012
            CALL PRINT(TFD,'*s,*6i*n.',SYMTE0,OUTLI0)
            CALL OUTSTR(SYMTE0)
            GOTO 10013
10012       CALL OUTSTR(SYMTE0)
10013   CONTINUE
10011   CALL GETSYM
      IF((SYMBO0.NE.-1))GOTO 10000
      RETURN
      END
      SUBROUTINE OUTPU0
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
      INTEGER SYMBUF(102)
      IF((A$BUF(226-225+1).EQ.0))GOTO 10014
        CALL BOLDF0(SYMTE0,SYMBUF)
        CALL OUTSTR(SYMBUF)
        GOTO 10015
10014   IF((A$BUF(245-225+1).EQ.0))GOTO 10016
          CALL UNDER0(SYMTE0,SYMBUF)
          CALL OUTSTR(SYMBUF)
          GOTO 10017
10016     CALL OUTSTR(SYMTE0)
10017 CONTINUE
10015 RETURN
      END
      SUBROUTINE BOLDF0(IN,OUT)
      INTEGER IN(1),OUT(102)
      INTEGER I,J
      J=1
      I=1
      GOTO 10020
10018 I=I+(1)
10020 IF((IN(I).EQ.0))GOTO 10019
        OUT(J)=IN(I)
        OUT(J+1)=136
        OUT(J+2)=IN(I)
        J=J+(3)
      GOTO 10018
10019 OUT(J)=0
      RETURN
      END
      SUBROUTINE UNDER0(IN,OUT)
      INTEGER IN(1),OUT(102)
      INTEGER I,J
      J=1
      I=1
      GOTO 10023
10021 I=I+(1)
10023 IF((IN(I).EQ.0))GOTO 10022
        OUT(J)=223
        OUT(J+1)=136
        OUT(J+2)=IN(I)
        J=J+(3)
      GOTO 10021
10022 OUT(J)=0
      RETURN
      END
      SUBROUTINE OUTCH(C)
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
      IF((C.NE.138))GOTO 10024
        CALL DUMPB0
        GOTO 10025
10024   IF((OUTPA0.GE.OUTWI0))GOTO 10026
          OUTBU0(OUTPA0)=C
          OUTPA0=OUTPA0+(1)
10026 CONTINUE
10025 RETURN
      END
      SUBROUTINE OUTSTR(STR)
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
      I=1
      GOTO 10029
10027 I=I+(1)
10029 IF((STR(I).EQ.0))GOTO 10028
        IF((STR(I).NE.138))GOTO 10030
          CALL DUMPB0
          GOTO 10031
10030     IF((OUTPA0.GE.OUTWI0))GOTO 10032
            OUTBU0(OUTPA0)=STR(I)
            OUTPA0=OUTPA0+(1)
10032   CONTINUE
10031 GOTO 10027
10028 RETURN
      END
      SUBROUTINE DUMPB0
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
      INTEGER AAAAB0(3)
      DATA AAAAB0/160,160,0/
      IF((LEVEL0.LE.1))GOTO 10033
        CALL PRINT(-11,'*i .',LEVEL0-1)
        GOTO 10034
10033   CALL PUTLIN(AAAAB0,-11)
10034 OUTBU0(OUTPA0)=0
      CALL PRINT(-11,'*4i: *s*n.',OUTLI0,OUTBU0)
      OUTPA0=1
      OUTLI0=OUTLI0+(1)
      RETURN
      END
      SUBROUTINE PRINT0(TFD)
      INTEGER TFD
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
      INTEGER I,PTR,NUM,S,J,L
      INTEGER INPUT,EQUAL
      INTEGER NAME(102),OLDNA0(102)
      INTEGER AAAAC0(8)
      INTEGER AAAAD0(8)
      DATA AAAAC0/170,172,172,172,243,170,233,0/
      DATA AAAAD0/170,172,172,172,243,170,233,0/
      OLDNA0(1)=0
      S=INPUT(TFD,AAAAC0,NAME,NUM)
10035 IF((S.EQ.-1))GOTO 10036
        CALL PUTLIN(NAME,-11)
        L=LENGTH(NAME)
        J=MAX0(18,((LENGTH(NAME)-1)/6+1)*6)
        I=L+1
        GOTO 10039
10037   I=I+(1)
10039   IF((I.GT.J))GOTO 10038
          CALL PUTCH(160,-11)
        GOTO 10037
10038   PTR=18+1
        CALL SCOPY(NAME,1,OLDNA0,1)
10040   IF((EQUAL(NAME,OLDNA0).NE.1))GOTO 10041
        IF((S.EQ.-1))GOTO 10041
          IF((PTR.LE.OUTWI0))GOTO 10042
            CALL PUTCH(138,-11)
            DO 10043 I=1,18
              CALL PUTCH(160,-11)
10043       CONTINUE
10044       PTR=18+1
10042     CALL PRINT(-11,'*6i.',NUM)
          PTR=PTR+(6)
          S=INPUT(TFD,AAAAD0,NAME,NUM)
        GOTO 10040
10041   CALL PUTCH(138,-11)
      GOTO 10035
10036 RETURN
      END
C ---- Long Name Map ----
C compare                        compa0
C initcrossref                   initc0
C putbackstr                     putbb0
C putback                        putba0
C filename                       filen0
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
C oldname                        oldna0
C Linenumber                     linen0
