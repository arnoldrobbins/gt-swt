      INTEGER GETLIN,GETFLD
      INTEGER IN(256),OUT(256)
      INTEGER FIELDS(20,2),I,OPTF,ARGNO,WIDTH
      INTEGER PADS(100)
      CALL GETOPT(OPTF,WIDTH,ARGNO)
      IF((GETFLD(ARGNO,FIELDS,PADS,WIDTH).NE.-3))GOTO 10000
        CALL ERROR('Usage: field [-f[<width>]] {<col>[-<col>] | s<pad> |
     * c<column>}.')
10000 CONTINUE
10001 IF((GETLIN(IN,-10,256).EQ.-1))GOTO 10002
        CALL MOVFLD(IN,FIELDS,PADS,OUT,WIDTH)
        IF((OPTF.NE.0))GOTO 10003
          I=1
          GOTO 10006
10004     I=I+1
10006     IF((OUT(I).EQ.0))GOTO 10005
          GOTO 10004
10005     CONTINUE
10007       I=I-1
            IF((I.LT.1))GOTO 10009
            IF((OUT(I).NE.160))GOTO 10009
            GOTO 10008
10009         GOTO 10010
10008     CONTINUE
          GOTO 10007
10010     OUT(I+1)=0
10003   CALL PUTLIN(OUT,-11)
        CALL PUTCH(138,-11)
      GOTO 10001
10002 CALL SWT
      END
      INTEGER FUNCTION GETFLD(ARGNO,FIELDS,PADS,RECWI0)
      INTEGER FIELDS(20,2),ARGNO,RECWI0
      INTEGER PADS(100)
      INTEGER ARG(102)
      INTEGER LASFLD,LASPAD,FROM,TO,PTR,NARG
      INTEGER GETARG,CTOI,LENGTH
      LASFLD=0
      LASPAD=0
      NARG=ARGNO
      GOTO 10013
10011 NARG=NARG+1
10013 IF((GETARG(NARG,ARG,102).EQ.-1))GOTO 10012
        IF((ARG(1).EQ.243))GOTO 10015
        IF((ARG(1).EQ.211))GOTO 10015
        GOTO 10014
10015     LASPAD=LASPAD+1
          IF((LASPAD+LENGTH(ARG)+1.LE.100))GOTO 10016
            CALL PRINT(-15,'*s: too many padding strings*n.',ARG)
            CALL SWT
10016     CALL SCOPY(ARG,2,PADS,LASPAD)
          LASFLD=LASFLD+1
          IF((LASFLD.LT.20))GOTO 10017
            CALL PRINT(-15,'*s: too many fields*n.',ARG)
            CALL SWT
10017     FIELDS(LASFLD,1)=0
          FIELDS(LASFLD,2)=LASPAD
          LASPAD=LASPAD+LENGTH(ARG)
          GOTO 10018
10014     IF((ARG(1).EQ.227))GOTO 10020
          IF((ARG(1).EQ.195))GOTO 10020
          GOTO 10019
10020       PTR=2
            TO=CTOI(ARG,PTR)
            IF((TO.LT.1))GOTO 10022
            IF((TO.GT.RECWI0))GOTO 10022
            GOTO 10021
10022         CALL PRINT(-15,'*s: column out of range*n.',ARG)
              CALL SWT
10021       LASFLD=LASFLD+1
            IF((LASFLD.LE.20))GOTO 10023
              CALL PRINT(-15,'*s: too many fields*n.',ARG)
              CALL SWT
10023       FIELDS(LASFLD,1)=-2
            FIELDS(LASFLD,2)=TO
            GOTO 10024
10019       PTR=1
            FROM=CTOI(ARG,PTR)
            IF((FROM.LT.1))GOTO 10026
            IF((FROM.GT.RECWI0))GOTO 10026
            GOTO 10025
10026         CALL PRINT(-15,'*s: column out of range*n.',ARG)
              CALL SWT
10025       IF((ARG(PTR).NE.0))GOTO 10027
              TO=FROM
              GOTO 10028
10027         IF((ARG(PTR).EQ.173))GOTO 10029
                CALL PRINT(-15,'*s: bad column syntax*n.',ARG)
                CALL SWT
10029           PTR=PTR+1
                TO=CTOI(ARG,PTR)
                IF((TO.LT.1))GOTO 10031
                IF((TO.GT.RECWI0))GOTO 10031
                GOTO 10030
10031             CALL PRINT(-15,'*s: column out of range*n.',ARG)
                  CALL SWT
10030         CONTINUE
10028       LASFLD=LASFLD+1
            IF((LASFLD.LT.20))GOTO 10032
              CALL PRINT(-15,'*s: too many fields*n.',ARG)
              CALL SWT
10032       FIELDS(LASFLD,1)=FROM
            FIELDS(LASFLD,2)=TO
10024   CONTINUE
10018 GOTO 10011
10012 IF((NARG.NE.ARGNO))GOTO 10033
        FIELDS(1,1)=1
        FIELDS(1,2)=RECWI0
        LASFLD=1
10033 FIELDS(LASFLD+1,1)=-1
      GETFLD=-2
      RETURN
      END
      SUBROUTINE MOVFLD(IN,FIELDS,PADS,OUT,RECWI0)
      INTEGER IN(256),OUT(256),PADS(100)
      INTEGER FIELDS(20,2),RECWI0
      INTEGER OUTPTR,I,FLD
      INTEGER INDEX,LENGTH
      I=INDEX(IN,138)
      IF((I.NE.0))GOTO 10034
        I=LENGTH(IN)
10034 GOTO 10037
10035 I=I+1
10037 IF((I.GT.RECWI0))GOTO 10036
        IN(I)=160
      GOTO 10035
10036 IN(I)=0
      OUTPTR=1
      GOTO 10040
10038 OUTPTR=OUTPTR+1
10040 IF((OUTPTR.GT.RECWI0))GOTO 10039
        OUT(OUTPTR)=160
      GOTO 10038
10039 OUTPTR=0
      FLD=1
      GOTO 10043
10041 FLD=FLD+1
10043 IF((FIELDS(FLD,1).EQ.-1))GOTO 10042
        IF((FIELDS(FLD,1).NE.0))GOTO 10044
          I=FIELDS(FLD,2)
          GOTO 10047
10045     I=I+1
10047     IF((PADS(I).EQ.0))GOTO 10046
            OUTPTR=OUTPTR+1
            OUT(OUTPTR)=PADS(I)
          GOTO 10045
10046     GOTO 10048
10044     IF((FIELDS(FLD,1).NE.-2))GOTO 10049
            OUTPTR=FIELDS(FLD,2)-1
            GOTO 10050
10049       I=FIELDS(FLD,1)
            GOTO 10053
10051       I=I+1
10053       IF((I.GT.FIELDS(FLD,2)))GOTO 10052
              OUTPTR=OUTPTR+1
              OUT(OUTPTR)=IN(I)
            GOTO 10051
10052     CONTINUE
10050   CONTINUE
10048 GOTO 10041
10042 OUT(OUTPTR+1)=0
      RETURN
      END
      SUBROUTINE GETOPT(OPTF,WIDTH,ARGNO)
      INTEGER OPTF,ARGNO,WIDTH
      INTEGER ARG(102)
      INTEGER GETARG,CTOI
      INTEGER J
      WIDTH=256-1
      OPTF=0
      IF((GETARG(1,ARG,102).EQ.-1))GOTO 10055
      IF((ARG(1).NE.173))GOTO 10055
      GOTO 10054
10055   ARGNO=1
        RETURN
10054 IF((ARG(2).EQ.230))GOTO 10057
      IF((ARG(2).EQ.198))GOTO 10057
      GOTO 10056
10057   OPTF=1
        J=3
        WIDTH=CTOI(ARG,J)
        IF((WIDTH.LT.1))GOTO 10059
        IF((WIDTH.GE.256))GOTO 10059
        GOTO 10058
10059     WIDTH=72
10058   ARGNO=2
        GOTO 10060
10056   ARGNO=1
10060 RETURN
      END
C ---- Long Name Map ----
C recwidth                       recwi0
