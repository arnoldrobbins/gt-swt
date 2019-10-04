      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER OPENS0,SEGME0,UNRES0
      INTEGER JUNK
      CALL INITI0
      IF((OPENS0(JUNK).EQ.-2))GOTO 10000
        CALL ERROR('Nothing to link.')
10000 CALL LINK
      CALL NEXTS0
10001 IF((OPENS0(JUNK).EQ.-1))GOTO 10002
        IF(((MODEA0.NE.0).AND.(SEGME0(JUNK).NE.1)))GOTO 10003
          CALL LINK
10003   CALL NEXTS0
      GOTO 10001
10002 CALL CLEAN0
      CALL SWT
      END
      SUBROUTINE CHAIN0(ADDR,VAL,TYPE)
      INTEGER ADDR,VAL
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER P,NEXT
      P=ADDR
10004 IF((P.EQ.-1))GOTO 10005
        CALL PUTREL(TYPE,P)
        CALL XSEEK(P,OUTFI0)
        CALL GETWO0(NEXT,OUTFI0)
        CALL XSEEK(P,OUTFI0)
        CALL PUTWO0(VAL,OUTFI0)
        P=NEXT
      GOTO 10004
10005 RETURN
      END
      SUBROUTINE CLEAN0
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER LENGTH,CTOA
      INTEGER I,J,MAPLEN
      CALL SEEK(1,OUTFI0)
      CALL PUTWO0(SEGST0(OUTFI0),OUTFI0)
      CALL XSEEK(SEGST0(OUTFI0),OUTFI0)
      CALL PUTBY0(2,OUTFI0)
      MAPLEN=(SEGST0(OUTFI0)+7)/8
      CALL PUTWO0(MAPLEN,OUTFI0)
      I=1
      GOTO 10008
10006 I=I+1
10008 IF((I.GT.MAPLEN))GOTO 10007
        CALL PUTBY0(RMAPA0(I),OUTFI0)
      GOTO 10006
10007 I=1
      GOTO 10011
10009 I=I+1
10011 IF((I.GT.SYMTO0))GOTO 10010
        CALL PUTBY0(3,OUTFI0)
        CALL PUTWO0(LENGTH(MEMAA0(SYMSY0(I)))+5,OUTFI0)
        CALL PUTWO0(SYMTY0(I),OUTFI0)
        CALL PUTWO0(SYMVA0(I),OUTFI0)
        J=SYMSY0(I)
        GOTO 10014
10012   J=J+1
10014   IF((MEMAA0(J).EQ.0))GOTO 10013
          CALL PUTBY0(CTOA(MEMAA0(J)),OUTFI0)
        GOTO 10012
10013   CALL PUTBY0(0,OUTFI0)
      GOTO 10009
10010 CALL CLOSE(INFIL0)
      CALL CLOSE(OUTFI0)
      RETURN
      END
      INTEGER FUNCTION COMPA0(STR1,STR2)
      INTEGER STR1(1),STR2(1)
      INTEGER I
      I=1
      GOTO 10017
10015 I=I+1
10017 IF((STR1(I).NE.STR2(I)))GOTO 10016
        IF((STR1(I).NE.0))GOTO 10018
          COMPA0=0
          RETURN
10018 GOTO 10015
10016 IF((STR1(I).LE.STR2(I)))GOTO 10019
        COMPA0=1
        GOTO 10020
10019   COMPA0=-1
10020 RETURN
      END
      SUBROUTINE CONNE0(CHAIN1,CHAIN2)
      INTEGER CHAIN1,CHAIN2
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER P,NEXTP
      IF((CHAIN1.NE.-1))GOTO 10021
        CHAIN1=CHAIN2
        GOTO 10022
10021   P=CHAIN1
10023     CALL XSEEK(P,OUTFI0)
          CALL GETWO0(NEXTP,OUTFI0)
          IF((NEXTP.NE.-1))GOTO 10024
            GOTO 10025
10024     P=NEXTP
        GOTO 10023
10025   CALL XSEEK(P,OUTFI0)
        CALL PUTWO0(CHAIN2,OUTFI0)
10022 RETURN
      END
      INTEGER FUNCTION COPYT0(JUNK)
      INTEGER JUNK
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER GETBY0,GETWO0
      INTEGER B,LEN,TYP
      IF((GETBY0(TYP,INFIL0).EQ.-1))GOTO 10026
        COPYT0=GETWO0(LEN,INFIL0)
        GOTO 10029
10027   LEN=LEN-1
10029   IF((LEN.EQ.0))GOTO 10028
          CALL GETBY0(B,INFIL0)
          CALL PUTBY0(B,OUTFI0)
        GOTO 10027
10028   RETURN
10026 CALL ERROR('Unexpected EOF in text section.')
      RETURN
      END
      INTEGER FUNCTION CTOA(C)
      INTEGER C
      CTOA=RT(C,7)
      RETURN
      END
      SUBROUTINE ENTER(SYM,TYPE,VAL)
      INTEGER SYM(1)
      INTEGER TYPE,VAL
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER EQUAL
      INTEGER SDUP
      INTEGER I
      I=1
      GOTO 10032
10030 I=I+1
10032 IF((I.GT.SYMTO0))GOTO 10031
        IF((EQUAL(SYM,MEMAA0(SYMSY0(I))).NE.1))GOTO 10033
          CALL ERROR('symbol redefined.')
10033 GOTO 10030
10031 IF((SYMTO0.LT.2000))GOTO 10034
        CALL ERROR('too many symbols --- link stopped.')
10034 SYMTO0=SYMTO0+1
      SYMSY0(SYMTO0)=SDUP(SYM)
      SYMTY0(SYMTO0)=TYPE
      SYMVA0(SYMTO0)=VAL
      RETURN
      END
      SUBROUTINE FIXCH0(ADDR)
      INTEGER ADDR
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER P,NEXTP
      IF((ADDR.EQ.-1))GOTO 10035
        P=ADDR
10036     CALL XSEEK(P,OUTFI0)
          CALL GETWO0(NEXTP,OUTFI0)
          IF((NEXTP.NE.-1))GOTO 10037
            GOTO 10038
10037     CALL XSEEK(P,OUTFI0)
          P=NEXTP+SEGST0(OUTFI0)
          CALL PUTWO0(P,OUTFI0)
        GOTO 10036
10038 CONTINUE
10035 RETURN
      END
      INTEGER FUNCTION GETBY0(B,FD)
      INTEGER B,FD
      INTEGER JUNK,RC
      INTEGER MAPFD
      CALL PRWF$$(:1,MAPFD(FD),LOC(B),1,INTL(0),JUNK,RC)
      IF((RC.NE.0))GOTO 10039
        GETBY0=B
        GOTO 10040
10039   B=-1
        GETBY0=-1
10040 RETURN
      END
      INTEGER FUNCTION GETNE0(ARG)
      INTEGER ARG(1)
      INTEGER GETARG,GETLIN
      INTEGER COUNT,LEN
      DATA COUNT/0/
      IF((GETARG(1,ARG,128).EQ.-1))GOTO 10041
        COUNT=COUNT+1
        GETNE0=GETARG(COUNT,ARG,128)
        GOTO 10042
10041   LEN=GETLIN(ARG,-10,128)
        IF((LEN.GT.1))GOTO 10043
          GETNE0=-1
          GOTO 10044
10043     ARG(LEN)=0
          GETNE0=LEN
10044 CONTINUE
10042 RETURN
      END
      INTEGER FUNCTION GETWO0(W,FD)
      INTEGER W,FD
      INTEGER GETBY0
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER HI,LO
      IF((MACHI0.NE.2))GOTO 10045
        CALL GETBY0(LO,FD)
        CALL GETBY0(HI,FD)
        GOTO 10046
10045   CALL GETBY0(HI,FD)
        CALL GETBY0(LO,FD)
10046 W=OR(LS(HI,8),LO)
      GETWO0=W
      RETURN
      END
      INTEGER FUNCTION GETSY0(SYM,TYPE,VAL)
      INTEGER SYM(1)
      INTEGER TYPE,VAL
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER GETBY0,GETWO0
      INTEGER I,LEN,STRIN0
      GETSY0=GETWO0(LEN,INFIL0)
      CALL GETWO0(TYPE,INFIL0)
      CALL GETWO0(VAL,INFIL0)
      I=1
      LEN=LEN-4
      GOTO 10049
10047 LEN=LEN-1
10049 IF((LEN.LE.1))GOTO 10048
        CALL GETBY0(SYM(I),INFIL0)
        SYM(I)=AND(SYM(I),:177)
        I=I+1
      GOTO 10047
10048 SYM(I)=0
      IF((GETBY0(STRIN0,INFIL0).EQ.-1))GOTO 10051
      IF((STRIN0.NE.0))GOTO 10051
      GOTO 10050
10051   CALL ERROR('Can''t happen: symbol section garbled.')
10050 RETURN
      END
      SUBROUTINE INITI0
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER CREATE,NEXTF0
      INTEGER I,JUNK
      INTEGER OUTFJ0(6)
      DATA OUTFJ0/236,174,239,245,244,0/
      SYMTO0=0
      CALL DSINIT(10000)
      MODEA0=0
      MACHI0=0
      FIRST0=1
      OUTFI0=CREATE(OUTFJ0,3)
      IF((OUTFI0.NE.-3))GOTO 10052
        CALL ERROR('Can''t create output file.')
10052 SEGST0(OUTFI0)=0
      CALL PUTBY0(1,OUTFI0)
      I=2
      GOTO 10055
10053 I=I+1
10055 IF((I.GT.3))GOTO 10054
        CALL PUTBY0(0,OUTFI0)
      GOTO 10053
10054 IF((NEXTF0(JUNK).NE.-1))GOTO 10056
        CALL ERROR('Usage: lk -(6800 | 8080) {[-(i | l | n)] file}.')
        GOTO 10057
10056   IF((MACHI0.NE.0))GOTO 10058
          CALL ERROR('Usage: lk -(6800 | 8080) {[-(i | l | n)] file}.')
10058 CONTINUE
10057 RETURN
      END
      SUBROUTINE LINK
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER COPYT0,LOOKUP,GETSY0,GETBY0
      INTEGER NEWSY0(102)
      INTEGER B,I,JUNK,L,NEWSZ0,NEWTA0
      INTEGER TEXTS0,LEN,POSN
      CALL SEEK(SEGST0(INFIL0),INFIL0)
      IF((MODEA0.NE.2))GOTO 10059
        POSN=SEGST0(INFIL0)
        I=1
        GOTO 10062
10060   I=I+1
10062   IF((I.GT.2))GOTO 10061
          CALL GETBY0(B,INFIL0)
          CALL GETWO0(LEN,INFIL0)
          POSN=POSN+3+LEN
          CALL SEEK(POSN,INFIL0)
        GOTO 10060
10061   CONTINUE
10063   IF((GETBY0(B,INFIL0).NE.3))GOTO 10064
          CALL GETSY0(NEWSY0,NEWSZ0,NEWTA0)
          IF((NEWSZ0.EQ.3))GOTO 10065
            NEWSZ0=0
            L=LOOKUP(NEWSY0)
            IF((L.NE.-3))GOTO 10066
              GOTO 10063
10066         IF((SYMTY0(L).NE.3))GOTO 10067
                CALL CHAIN0(SYMVA0(L),NEWTA0,NEWSZ0)
                SYMTY0(L)=NEWSZ0
                SYMVA0(L)=NEWTA0
10067       CONTINUE
10065   GOTO 10063
10064   GOTO 10068
10059   TEXTS0=COPYT0(JUNK)
        CALL UPDAT0(TEXTS0)
10069   IF((GETBY0(B,INFIL0).NE.3))GOTO 10070
          CALL GETSY0(NEWSY0,NEWSZ0,NEWTA0)
          IF((NEWSZ0.EQ.1))GOTO 10072
          IF(((NEWSZ0.EQ.3).AND.(NEWTA0.NE.-1)))GOTO 10072
          GOTO 10071
10072       NEWTA0=NEWTA0+SEGST0(OUTFI0)
10071     L=LOOKUP(NEWSY0)
          IF((NEWSZ0.EQ.3))GOTO 10073
            IF((L.NE.-3))GOTO 10074
              CALL ENTER(NEWSY0,NEWSZ0,NEWTA0)
              GOTO 10075
10074         IF((SYMTY0(L).NE.3))GOTO 10076
                CALL CHAIN0(SYMVA0(L),NEWTA0,NEWSZ0)
                SYMTY0(L)=NEWSZ0
                SYMVA0(L)=NEWTA0
                GOTO 10077
10076           CALL PRINT(-15,'Doubly defined: *s*n.',MEMAA0(SYMSY0(L))
     *)
10077       CONTINUE
10075       GOTO 10078
10073       CALL FIXCH0(NEWTA0)
            IF((L.NE.-3))GOTO 10079
              CALL ENTER(NEWSY0,NEWSZ0,NEWTA0)
              GOTO 10080
10079         IF((SYMTY0(L).EQ.3))GOTO 10081
                CALL CHAIN0(NEWTA0,SYMVA0(L),SYMTY0(L))
                GOTO 10082
10081           CALL CONNE0(NEWTA0,SYMVA0(L))
                SYMVA0(L)=NEWTA0
10082       CONTINUE
10080     CONTINUE
10078   GOTO 10069
10070   SEGST0(OUTFI0)=SEGST0(OUTFI0)+TEXTS0
10068 CALL XSEEK(SEGST0(OUTFI0),OUTFI0)
      RETURN
      END
      INTEGER FUNCTION LOOKUP(SYM)
      INTEGER SYM(1)
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER EQUAL
      INTEGER I
      LOOKUP=-3
      I=1
      GOTO 10085
10083 I=I+1
10085 IF((I.GT.SYMTO0))GOTO 10084
        IF((EQUAL(SYM,MEMAA0(SYMSY0(I))).NE.1))GOTO 10086
          IF((SYMTY0(I).NE.2))GOTO 10087
            LOOKUP=SYMVA0(I)
            GOTO 10088
10087       LOOKUP=I
10088     GOTO 10084
10086 GOTO 10083
10084 RETURN
      END
      INTEGER FUNCTION NEXTF0(JUNK)
      INTEGER JUNK
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER EQUAL,GETNE0,OPEN
      INTEGER ARG(102)
      INTEGER M68000(6)
      INTEGER I80800(6)
      INTEGER INCFL0(3)
      INTEGER LIBFL0(3)
      INTEGER NAMEF0(3)
      DATA M68000/173,182,184,176,176,0/
      DATA I80800/173,184,176,184,176,0/
      DATA INCFL0/173,233,0/
      DATA LIBFL0/173,236,0/
      DATA NAMEF0/173,238,0/
10089   IF((GETNE0(ARG).NE.-1))GOTO 10090
          NEXTF0=-1
          RETURN
10090     IF((EQUAL(ARG,M68000).NE.1))GOTO 10091
            MACHI0=1
            GOTO 10092
10091       IF((EQUAL(ARG,I80800).NE.1))GOTO 10093
              MACHI0=2
              GOTO 10092
10093         IF((EQUAL(ARG,INCFL0).NE.1))GOTO 10094
                MODEA0=0
                GOTO 10092
10094           IF((EQUAL(ARG,LIBFL0).NE.1))GOTO 10095
                  MODEA0=1
                  GOTO 10092
10095             IF((EQUAL(ARG,NAMEF0).NE.1))GOTO 10096
                    MODEA0=2
                    GOTO 10092
10096               GOTO 10097
10092 GOTO 10089
10097 INFIL0=OPEN(ARG,1)
      IF((INFIL0.NE.-3))GOTO 10098
        CALL CANT(ARG)
10098 SEGST0(INFIL0)=0
      NEXTF0=-2
      RETURN
      END
      SUBROUTINE NEXTS0
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER GETBY0,GETWO0
      INTEGER LEN,POSN,TYPE
      POSN=SEGST0(INFIL0)
      CALL SEEK(POSN,INFIL0)
      IF((GETBY0(TYPE,INFIL0).NE.-1))GOTO 10099
        CALL ERROR('Can''t happen: no segment.')
10099 CONTINUE
10100   CALL GETWO0(LEN,INFIL0)
        POSN=POSN+3+LEN
        CALL SEEK(POSN,INFIL0)
        IF((GETBY0(TYPE,INFIL0).NE.-1))GOTO 10101
          GOTO 10102
10101   IF((TYPE.NE.1))GOTO 10103
          CALL SEEK(POSN,INFIL0)
          SEGST0(INFIL0)=POSN
          GOTO 10102
10103 CONTINUE
      GOTO 10100
10102 RETURN
      END
      INTEGER FUNCTION OPENS0(JUNK)
      INTEGER JUNK
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER GETBY0,NEXTF0
      INTEGER TYPE
10104 IF((GETBY0(TYPE,INFIL0).NE.-1))GOTO 10105
        CALL CLOSE(INFIL0)
        IF((NEXTF0(JUNK).NE.-1))GOTO 10106
          OPENS0=-1
          RETURN
10106 GOTO 10104
10105 IF((TYPE.EQ.1))GOTO 10107
        CALL ERROR('Format error in link segment.')
10107 OPENS0=-2
      RETURN
      END
      SUBROUTINE PUTBY0(B,FD)
      INTEGER B,FD
      INTEGER W,JUNK
      INTEGER MAPFD
      W=RT(B,8)
      CALL PRWF$$(:2,MAPFD(FD),LOC(W),1,INTL(0),JUNK,JUNK)
      RETURN
      END
      SUBROUTINE PUTREL(RELOC,ADDRE0)
      INTEGER RELOC,ADDRE0
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER WORD,MASK
      WORD=ADDRE0/8+1
      MASK=LS(1,7-MOD(ADDRE0,8))
      IF((RELOC.NE.1))GOTO 10108
        RMAPA0(WORD)=OR(RMAPA0(WORD),MASK)
        GOTO 10109
10108   RMAPA0(WORD)=AND(RMAPA0(WORD),NOT(MASK))
10109 RETURN
      END
      SUBROUTINE PUTWO0(W,FD)
      INTEGER W,FD
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      IF((MACHI0.NE.2))GOTO 10110
        CALL PUTBY0(RT(W,8),FD)
        CALL PUTBY0(RS(W,8),FD)
        GOTO 10111
10110   CALL PUTBY0(RS(W,8),FD)
        CALL PUTBY0(RT(W,8),FD)
10111 RETURN
      END
      SUBROUTINE RELOC(ADDR,OFFSET)
      INTEGER ADDR,OFFSET
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER W
      CALL XSEEK(ADDR,OUTFI0)
      CALL GETWO0(W,OUTFI0)
      W=W+OFFSET
      CALL XSEEK(ADDR,OUTFI0)
      CALL PUTWO0(W,OUTFI0)
      RETURN
      END
      INTEGER FUNCTION SDUP(STR)
      INTEGER STR(1)
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER P
      INTEGER LENGTH,DSGET
      P=DSGET(LENGTH(STR)+1)
      CALL SCOPY(STR,1,MEMAA0,P)
      SDUP=P
      RETURN
      END
      SUBROUTINE SEEK(POSN,FD)
      INTEGER POSN,FD
      INTEGER JUNK
      INTEGER MAPFD
      CALL PRWF$$(:3+:10,MAPFD(FD),LOC(0),0,INTL(POSN),JUNK,JUNK)
      RETURN
      END
      INTEGER FUNCTION SEGME0(JUNK)
      INTEGER JUNK
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER GETBY0,GETWO0,GETSY0,LOOKUP
      INTEGER L,LEN,NEWSZ0,NEWTA0,POSN,TYPE
      INTEGER NEWSY0(102)
      POSN=SEGST0(INFIL0)
      CALL SEEK(POSN,INFIL0)
      IF((GETBY0(TYPE,INFIL0).NE.-1))GOTO 10112
        CALL ERROR('Can''t happen: no segment.')
10112 CONTINUE
10113   IF((TYPE.EQ.3))GOTO 10114
          CALL GETWO0(LEN,INFIL0)
          POSN=POSN+3+LEN
          CALL SEEK(POSN,INFIL0)
          GOTO 10115
10114     LEN=GETSY0(NEWSY0,NEWSZ0,NEWTA0)
          POSN=POSN+3+LEN
          IF((NEWSZ0.EQ.3))GOTO 10116
            L=LOOKUP(NEWSY0)
            IF((L.EQ.-3))GOTO 10117
              IF((SYMTY0(L).NE.3))GOTO 10118
                SEGME0=1
                RETURN
10118       CONTINUE
10117     CONTINUE
10116   CONTINUE
10115   IF((GETBY0(TYPE,INFIL0).NE.-1))GOTO 10119
          GOTO 10120
10119 CONTINUE
      IF((TYPE.NE.1))GOTO 10113
10120 SEGME0=0
      RETURN
      END
      SUBROUTINE UPDAT0(TEXTS0)
      INTEGER GETBY0,GETWO0
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER TEXTC0,I,LEN,PLACE0,RBYTE,TEXTS0,TYP
      IF((GETBY0(TYP,INFIL0).EQ.-1))GOTO 10121
        CALL GETWO0(LEN,INFIL0)
        TEXTC0=TEXTS0
        PLACE0=SEGST0(OUTFI0)
        GOTO 10124
10122   LEN=LEN-1
10124   IF((LEN.LE.0))GOTO 10123
          CALL GETBY0(RBYTE,INFIL0)
          I=7
          GOTO 10127
10125     I=I-1
10127     IF(((I.LT.0).OR.(TEXTC0.LE.0)))GOTO 10126
            IF((AND(RBYTE,LS(1,I)).EQ.0))GOTO 10128
              CALL PUTREL(1,PLACE0)
              CALL RELOC(PLACE0,SEGST0(OUTFI0))
              GOTO 10129
10128         CALL PUTREL(0,PLACE0)
10129       PLACE0=PLACE0+1
            TEXTC0=TEXTC0-1
          GOTO 10125
10126   GOTO 10122
10123   RETURN
10121 CALL ERROR('Unexpected EOF in relocation section.')
      RETURN
      END
      INTEGER FUNCTION UNRES0(JUNK)
      INTEGER JUNK
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      INTEGER I
      UNRES0=0
      I=1
      GOTO 10132
10130 I=I+1
10132 IF((I.GT.SYMTO0))GOTO 10131
        IF((SYMTY0(I).NE.3))GOTO 10133
          UNRES0=1
          GOTO 10131
10133 GOTO 10130
10131 RETURN
      END
      SUBROUTINE XSEEK(POSN,FD)
      INTEGER POSN
      INTEGER MEMAA0(10000)
      COMMON /DS$MEM/MEMAA0
      INTEGER SYMSY0(2000),SYMTY0(2000),SYMVA0(2000),SYMTO0
      COMMON /SYMTAB/SYMSY0,SYMTY0,SYMVA0,SYMTO0
      INTEGER RMAPA0(4096)
      COMMON /RELMAP/RMAPA0
      INTEGER FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0(128)
      COMMON /LKSTUF/FIRST0,INFIL0,MACHI0,MODEA0,OUTFI0,SEGST0
      CALL SEEK(POSN+3,FD)
      RETURN
      END
C ---- Long Name Map ----
C putbyte                        putby0
C newsymval                      newta0
C Symtop                         symto0
C nameflag                       namef0
C chainback                      chain0
C address                        addre0
C compare                        compa0
C outfilename                    outfj0
C cleanup                        clean0
C Symsym                         symsy0
C putword                        putwo0
C connect                        conne0
C textcount                      textc0
C Rmap                           rmapa0
C unresolved                     unres0
C Symtyp                         symty0
C opensegment                    opens0
C fixchain                       fixch0
C getbyte                        getby0
C stringend                      strin0
C updaterbits                    updat0
C Segstart                       segst0
C newsymsym                      newsy0
C Mem                            memaa0
C segmentuseful                  segme0
C getword                        getwo0
C newsymtyp                      newsz0
C i8080flag                      i80800
C libflag                        libfl0
C getsymbol                      getsy0
C Symval                         symva0
C copytext                       copyt0
C textsize                       texts0
C m6800flag                      m68000
C placecount                     place0
C getnext                        getne0
C incflag                        incfl0
C nextsegment                    nexts0
C initialize                     initi0
C Outfile                        outfi0
C Infile                         infil0
C nextfile                       nextf0
C Firsttime                      first0
C Machine                        machi0
C Mode                           modea0