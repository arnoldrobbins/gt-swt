      INTEGER FUNCTION GENGE0(INSTR)
      INTEGER INSTR
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(4)
      IMEMA0(I)=4
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=INSTR
      GENGE0=I
      RETURN
      END
      INTEGER FUNCTION GENBR0(INSTR,LABEL)
      INTEGER INSTR,LABEL
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=1
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=INSTR
      IMEMA0(I+4)=LABEL
      GENBR0=I
      RETURN
      END
      INTEGER FUNCTION GENMR(INSTR,AD)
      INTEGER INSTR,AD(5)
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      INTEGER J
      I=IALLOC(5+4)
      GENMR=I
      IMEMA0(I)=2
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=INSTR
      I=I+(4)
      J=1
      GOTO 10002
10000 I=I+(1)
      J=J+(1)
10002 IF((J.GT.5))GOTO 10001
        IMEMA0(I)=AD(J)
      GOTO 10000
10001 RETURN
      END
      INTEGER FUNCTION GENLA0(LABEL)
      INTEGER LABEL
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(4)
      IMEMA0(I)=3
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=LABEL
      GENLA0=I
      RETURN
      END
      INTEGER FUNCTION SEQ(I1,I2,I3,I4,I5,I6,I7,I8,I9)
      INTEGER I1,I2,I3,I4,I5,I6,I7,I8,I9
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER FIRST(9),LAST(9)
      INTEGER I,N
      LOGICAL MISSIN
      N=0
      IF((I1.EQ.0))GOTO 10003
        N=N+(1)
        FIRST(N)=I1
        LAST(N)=IMEMA0(I1+2)
10003 IF((I2.EQ.0))GOTO 10004
        N=N+(1)
        FIRST(N)=I2
        LAST(N)=IMEMA0(I2+2)
10004 IF(MISSIN(I3))GOTO 10005
        IF((I3.EQ.0))GOTO 10006
          N=N+(1)
          FIRST(N)=I3
          LAST(N)=IMEMA0(I3+2)
10006   IF(MISSIN(I4))GOTO 10007
          IF((I4.EQ.0))GOTO 10008
            N=N+(1)
            FIRST(N)=I4
            LAST(N)=IMEMA0(I4+2)
10008     IF(MISSIN(I5))GOTO 10009
            IF((I5.EQ.0))GOTO 10010
              N=N+(1)
              FIRST(N)=I5
              LAST(N)=IMEMA0(I5+2)
10010       IF(MISSIN(I6))GOTO 10011
              IF((I6.EQ.0))GOTO 10012
                N=N+(1)
                FIRST(N)=I6
                LAST(N)=IMEMA0(I6+2)
10012         IF(MISSIN(I7))GOTO 10013
                IF((I7.EQ.0))GOTO 10014
                  N=N+(1)
                  FIRST(N)=I7
                  LAST(N)=IMEMA0(I7+2)
10014           IF(MISSIN(I8))GOTO 10015
                  IF((I8.EQ.0))GOTO 10016
                    N=N+(1)
                    FIRST(N)=I8
                    LAST(N)=IMEMA0(I8+2)
10016             IF(MISSIN(I9))GOTO 10017
                    IF((I9.EQ.0))GOTO 10018
                      N=N+(1)
                      FIRST(N)=I9
                      LAST(N)=IMEMA0(I9+2)
10018             CONTINUE
10017           CONTINUE
10015         CONTINUE
10013       CONTINUE
10011     CONTINUE
10009   CONTINUE
10007 CONTINUE
10005 IF((N.NE.0))GOTO 10019
        SEQ=0
        RETURN
10019 I=1
      GOTO 10022
10020 I=I+(1)
10022 IF((I.GE.N))GOTO 10021
        IMEMA0(LAST(I)+1)=FIRST(I+1)
        IMEMA0(FIRST(I+1)+2)=LAST(I)
      GOTO 10020
10021 IMEMA0(LAST(N)+1)=FIRST(1)
      IMEMA0(FIRST(1)+2)=LAST(N)
      SEQ=FIRST(1)
      RETURN
      END
      INTEGER FUNCTION GENENT(EXTNAM,OBJ)
      INTEGER EXTNAM
      INTEGER OBJ
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(6)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=1
      IMEMA0(I+4)=EXTNAM
      IMEMA0(I+5)=OBJ
      GENENT=I
      RETURN
      END
      INTEGER FUNCTION GENECB(PROC,START,DISPL,NARGS,SSIZE)
      INTEGER PROC,START,DISPL,NARGS,SSIZE
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(9)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=2
      IMEMA0(I+4)=PROC
      IMEMA0(I+5)=START
      IMEMA0(I+6)=DISPL
      IMEMA0(I+7)=NARGS
      IMEMA0(I+8)=SSIZE
      GENECB=I
      RETURN
      END
      INTEGER FUNCTION GENSH0(INSTR,AMOUNT)
      INTEGER INSTR,AMOUNT
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=INSTR
      IMEMA0(I+4)=AMOUNT
      GENSH0=I
      RETURN
      END
      INTEGER FUNCTION GENIP(NAME)
      INTEGER NAME
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      IF((SMEMA0(NAME).NE.0))GOTO 10023
        GENIP=0
        RETURN
10023 I=IALLOC(6)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=4
      IMEMA0(I+4)=:707
      IMEMA0(I+5)=NAME
      GENIP=I
      RETURN
      END
      INTEGER FUNCTION GENIQ0(NAME)
      INTEGER NAME
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=20
      IMEMA0(I+4)=NAME
      GENIQ0=I
      RETURN
      END
      INTEGER FUNCTION GENIP0(LABEL)
      INTEGER LABEL
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(6)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=4
      IMEMA0(I+4)=:7070
      IMEMA0(I+5)=LABEL
      GENIP0=I
      RETURN
      END
      INTEGER FUNCTION GENEXT(NAME)
      INTEGER NAME
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      IF((SMEMA0(NAME).NE.0))GOTO 10024
        GENEXT=0
        RETURN
10024 I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=5
      IMEMA0(I+4)=NAME
      GENEXT=I
      RETURN
      END
      INTEGER FUNCTION GENEX0(NAME)
      INTEGER NAME
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=19
      IMEMA0(I+4)=NAME
      GENEX0=I
      RETURN
      END
      INTEGER FUNCTION GENDA0(DATUM)
      INTEGER DATUM
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=6
      IMEMA0(I+4)=DATUM
      GENDA0=I
      RETURN
      END
      INTEGER FUNCTION GENBSZ(SIZE)
      INTEGER SIZE
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=7
      IMEMA0(I+4)=SIZE
      GENBSZ=I
      RETURN
      END
      INTEGER FUNCTION LD(ACC,RES,AD)
      INTEGER ACC
      INTEGER RES,AD(5)
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER GENMR
      INTEGER AAAAA0
      IF((RES.NE.0))GOTO 10025
        AAAAA0=ACC
        GOTO 10026
10027     LD=GENMR(37,AD)
        GOTO 10032
10029     LD=GENMR(38,AD)
        GOTO 10032
10030     LD=GENMR(25,AD)
        GOTO 10032
10031     LD=GENMR(10,AD)
        GOTO 10032
10026   IF(AAAAA0.EQ.128)GOTO 10031
        IF(AAAAA0.EQ.256)GOTO 10030
        IF(AAAAA0.EQ.512)GOTO 10029
        IF(AAAAA0.EQ.1024)GOTO 10027
          CALL PANIC('*i: bad accumulator specified in ld*n.',ACC)
10028   GOTO 10032
10025   LD=0
10032 RETURN
      END
      INTEGER FUNCTION ST(ACC,AD)
      INTEGER ACC
      INTEGER AD(5)
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER GENMR
      INTEGER AAAAB0
      AAAAB0=ACC
      GOTO 10033
10034   ST=GENMR(47,AD)
      GOTO 10035
10036   ST=GENMR(48,AD)
      GOTO 10035
10037   ST=GENMR(29,AD)
      GOTO 10035
10038   ST=GENMR(14,AD)
      GOTO 10035
10033 IF(AAAAB0.EQ.128)GOTO 10038
      IF(AAAAB0.EQ.256)GOTO 10037
      IF(AAAAB0.EQ.512)GOTO 10036
      IF(AAAAB0.EQ.1024)GOTO 10034
        CALL PANIC('*i:  bad accumulator specified in st*n.',ACC)
10035 RETURN
      END
      INTEGER FUNCTION GENAP(AD,STORE,LAST)
      INTEGER AD(5),STORE,LAST
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      INTEGER J
      I=IALLOC(6+5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=11
      IMEMA0(I+4)=STORE
      IMEMA0(I+5)=LAST
      GENAP=I
      I=I+(6)
      J=1
      GOTO 10041
10039 I=I+(1)
      J=J+(1)
10041 IF((J.GT.5))GOTO 10040
        IMEMA0(I)=AD(J)
      GOTO 10039
10040 RETURN
      END
      INTEGER FUNCTION GENCO0(SRCAD,DSTAD,LEN)
      INTEGER SRCAD(5),DSTAD(5),LEN
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC,SEQ,GENAP,GENMR,LOAEU0
      INTEGER LENAD(5),RTRAD(5),JUNK,LOOKX0
      I=LOAEU0(31,RTRID0(31))
      JUNK=LOOKX0(RTRID0(31),RTRAD)
      LENAD(1)=6
      LENAD(2)=LEN
      I=SEQ(I,GENMR(45,RTRAD),GENAP(SRCAD,1,0),GENAP(DSTAD,1,0),GENAP(LE
     *NAD,1,1))
      GENCO0=I
      RETURN
      END
      INTEGER FUNCTION GENSW0(NODE,CLABS,DEFLAB,REGS)
      INTEGER NODE
      INTEGER CLABS(256),DEFLAB
      INTEGER REGS
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER IVAL(256)
      INTEGER * 4 LVAL(256)
      REAL RVAL(256)
      REAL * 8 DVAL(256)
      INTEGER AD(5),ILIT
      INTEGER * 4 LLIT
      REAL RLIT
      REAL * 8 DLIT
      INTEGER LABS(256)
      INTEGER MKLAB0
      INTEGER MODE,RES,I,J,GAP,JG,NCASES
      INTEGER CC
      INTEGER LOAD,SEQ,SETUQ0
      INTEGER CREGS
      INTEGER AAAAC0
      INTEGER AAAAD0
      INTEGER AAAAE0
      INTEGER AAAAF0
      EQUIVALENCE (IVAL(1),LVAL(1)),(IVAL(1),RVAL(1)),(IVAL(1),DVAL(1))
      EQUIVALENCE (ILIT,AD(2)),(ILIT,LLIT),(ILIT,RLIT),(ILIT,DLIT)
      MODE=TMEMA0(NODE+1)
      GENSW0=LOAD(TMEMA0(NODE+2),REGS)
      NCASES=0
      DEFLAB=0
      CC=TMEMA0(NODE+3)
10042 IF((CC.EQ.0))GOTO 10043
        IF((TMEMA0(CC).NE.7))GOTO 10044
          NCASES=NCASES+(1)
          CALL REACH(TMEMA0(CC+1),CREGS,RES,AD)
          IF((RES.EQ.0))GOTO 10045
            CALL WARNI0('case value is not a constant*n.')
            GENSW0=0
            RETURN
10045     MODE=AD(1)
          AAAAC0=MODE
          GOTO 10046
10047       IVAL(NCASES)=ILIT
          GOTO 10048
10049       LVAL(NCASES)=LLIT
          GOTO 10048
10050       RVAL(NCASES)=RLIT
          GOTO 10048
10051       DVAL(NCASES)=DLIT
          GOTO 10048
10046     AAAAD0=AAAAC0-5
          GOTO(10047,10049,10050,10051),AAAAD0
            CALL WARNI0('*i: unacceptable switch mode*n.',MODE)
            GENSW0=0
            RETURN
10048     LABS(NCASES)=MKLAB0(1)
          CLABS(NCASES)=LABS(NCASES)
          CC=TMEMA0(CC+3)
          GOTO 10042
10044     IF((TMEMA0(CC).NE.12))GOTO 10053
            IF((DEFLAB.EQ.0))GOTO 10054
              CALL WARNI0('multiple defaults in switch*n.')
              GENSW0=0
              RETURN
10054       DEFLAB=MKLAB0(1)
            CC=TMEMA0(CC+2)
            GOTO 10055
10053       CALL WARNI0('*i: bad entry in switch case list*n.',TMEMA0(CC
     *))
            GENSW0=0
            RETURN
10055   CONTINUE
10052 GOTO 10042
10043 AAAAE0=MODE
      GOTO 10056
10057   GAP=NCASES/2
        GOTO 10060
10058   GAP=GAP/(2)
10060   IF((GAP.LE.0))GOTO 10068
          I=GAP+1
          GOTO 10063
10061     I=I+(1)
10063     IF((I.GT.NCASES))GOTO 10058
            J=I-GAP
            GOTO 10066
10064       J=J-(GAP)
10066       IF((J.LE.0))GOTO 10061
              JG=J+GAP
              IF((IVAL(J).GT.IVAL(JG)))GOTO 10067
                GOTO 10061
10067         ILIT=IVAL(J)
              IVAL(J)=IVAL(JG)
              IVAL(JG)=ILIT
              ILIT=LABS(J)
              LABS(J)=LABS(JG)
              LABS(JG)=ILIT
            GOTO 10064
10069   GAP=NCASES/2
        GOTO 10072
10070   GAP=GAP/(2)
10072   IF((GAP.LE.0))GOTO 10068
          I=GAP+1
          GOTO 10075
10073     I=I+(1)
10075     IF((I.GT.NCASES))GOTO 10070
            J=I-GAP
            GOTO 10078
10076       J=J-(GAP)
10078       IF((J.LE.0))GOTO 10073
              JG=J+GAP
              IF((LVAL(J).GT.LVAL(JG)))GOTO 10079
                GOTO 10073
10079         LLIT=LVAL(J)
              LVAL(J)=LVAL(JG)
              LVAL(JG)=LLIT
              ILIT=LABS(J)
              LABS(J)=LABS(JG)
              LABS(JG)=ILIT
            GOTO 10076
10080   GAP=NCASES/2
        GOTO 10083
10081   GAP=GAP/(2)
10083   IF((GAP.LE.0))GOTO 10068
          I=GAP+1
          GOTO 10086
10084     I=I+(1)
10086     IF((I.GT.NCASES))GOTO 10081
            J=I-GAP
            GOTO 10089
10087       J=J-(GAP)
10089       IF((J.LE.0))GOTO 10084
              JG=J+GAP
              IF((RVAL(J).GT.RVAL(JG)))GOTO 10090
                GOTO 10084
10090         RLIT=RVAL(J)
              RVAL(J)=RVAL(JG)
              RVAL(JG)=RLIT
              ILIT=LABS(J)
              LABS(J)=LABS(JG)
              LABS(JG)=ILIT
            GOTO 10087
10091   GAP=NCASES/2
        GOTO 10094
10092   GAP=GAP/(2)
10094   IF((GAP.LE.0))GOTO 10068
          I=GAP+1
          GOTO 10097
10095     I=I+(1)
10097     IF((I.GT.NCASES))GOTO 10092
            J=I-GAP
            GOTO 10100
10098       J=J-(GAP)
10100       IF((J.LE.0))GOTO 10095
              JG=J+GAP
              IF((DVAL(J).GT.DVAL(JG)))GOTO 10101
                GOTO 10095
10101         DLIT=DVAL(J)
              DVAL(J)=DVAL(JG)
              DVAL(JG)=DLIT
              ILIT=LABS(J)
              LABS(J)=LABS(JG)
              LABS(JG)=ILIT
            GOTO 10098
10056 AAAAF0=AAAAE0-5
      GOTO(10057,10069,10080,10091),AAAAF0
10068 IF((BREAK0.LT.10))GOTO 10102
        CALL WARNI0('switch nested too deeply to record break label*n.')
        RETURN
10102 BREAK0=BREAK0+(1)
      BREAL0(BREAK0)=MKLAB0(1)
      GENSW0=SEQ(GENSW0,SETUQ0(MODE,IVAL,LVAL,RVAL,DVAL,LABS,NCASES,DEFL
     *AB))
      RETURN
      END
      INTEGER FUNCTION SETUQ0(MODE,IVAL,LVAL,RVAL,DVAL,LABS,NCASES,DEFLA
     *B)
      INTEGER MODE,IVAL(256),NCASES
      INTEGER * 4 LVAL(256)
      REAL RVAL(256)
      REAL * 8 DVAL(256)
      INTEGER LABS(256),DEFLAB
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER AD(5),ILIT
      INTEGER * 4 LLIT
      REAL RLIT
      REAL * 8 DLIT
      INTEGER SEQ,GENMR,GENSJ0,GENSK0,GENGE0,GENDAC,GENDA0
      INTEGER C,LB,UB,I
      INTEGER ESCAP0
      INTEGER AAAAG0
      INTEGER AAAAH0
      EQUIVALENCE (ILIT,AD(2)),(ILIT,LLIT),(ILIT,RLIT),(ILIT,DLIT)
      IF((DEFLAB.NE.0))GOTO 10103
        ESCAP0=BREAL0(BREAK0)
        GOTO 10104
10103   ESCAP0=DEFLAB
10104 SETUQ0=0
      AAAAG0=MODE
      GOTO 10105
10106   AD(1)=6
        C=1
        LB=1
        GOTO 10109
10107   LB=UB+1
10109   IF((LB.GT.NCASES))GOTO 10120
          UB=NCASES
10110     IF(((IVAL(UB)-IVAL(LB)+1)/(UB-LB+1).LE.3))GOTO 10111
            UB=UB-(1)
          GOTO 10110
10111     IF((LB.NE.UB))GOTO 10112
            ILIT=IVAL(LB)-C+1
            SETUQ0=SEQ(SETUQ0,GENMR(5,AD),GENSJ0(3),GENSK0(LABS(LB)),GEN
     *SK0(ESCAP0))
            GOTO 10107
10112       ILIT=IVAL(LB)-C
            IF((ILIT.EQ.0))GOTO 10114
              SETUQ0=SEQ(SETUQ0,GENMR(52,AD))
10114       SETUQ0=SEQ(SETUQ0,GENGE0(7),GENDA0(IVAL(UB)-IVAL(LB)+2))
            C=IVAL(LB)
            I=IVAL(LB)
            GOTO 10117
10115       I=I+(1)
10117       IF((I.GT.IVAL(UB)))GOTO 10116
              IF((IVAL(LB).NE.I))GOTO 10118
                SETUQ0=SEQ(SETUQ0,GENDAC(LABS(LB)))
                LB=LB+(1)
                GOTO 10115
10118           SETUQ0=SEQ(SETUQ0,GENDAC(ESCAP0))
10119       GOTO 10115
10116     CONTINUE
10113   GOTO 10107
10121   AD(1)=7
        C=1
        GOTO 10124
10122   C=C+(1)
10124   IF((C.GT.NCASES))GOTO 10120
          LLIT=LVAL(C)
          SETUQ0=SEQ(SETUQ0,GENMR(6,AD),GENSJ0(3),GENSK0(LABS(C)),GENSK0
     *(ESCAP0))
        GOTO 10122
10125   AD(1)=8
        C=1
        GOTO 10128
10126   C=C+(1)
10128   IF((C.GT.NCASES))GOTO 10120
          RLIT=RVAL(C)
          SETUQ0=SEQ(SETUQ0,GENMR(23,AD),GENSJ0(3),GENSK0(LABS(C)),GENSK
     *0(ESCAP0))
        GOTO 10126
10129   AD(1)=9
        C=1
        GOTO 10132
10130   C=C+(1)
10132   IF((C.GT.NCASES))GOTO 10120
          DLIT=DVAL(C)
          SETUQ0=SEQ(SETUQ0,GENMR(8,AD),GENSJ0(3),GENSK0(LABS(C)),GENSK0
     *(ESCAP0))
        GOTO 10130
10105 AAAAH0=AAAAG0-5
      GOTO(10106,10121,10125,10129),AAAAH0
10120 SETUQ0=SEQ(SETUQ0,GENSK0(ESCAP0),GENGE0(19))
      RETURN
      END
      INTEGER FUNCTION GENDAC(LABEL)
      INTEGER LABEL
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=14
      IMEMA0(I+4)=LABEL
      GENDAC=I
      RETURN
      END
      INTEGER FUNCTION GENSJ0(W)
      INTEGER W
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=12
      IMEMA0(I+4)=W
      GENSJ0=I
      RETURN
      END
      INTEGER FUNCTION GENSK0(LABEL)
      INTEGER LABEL
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=13
      IMEMA0(I+4)=LABEL
      GENSK0=I
      RETURN
      END
      INTEGER FUNCTION SETUP0(PROCO0)
      INTEGER PROCO0
      INTEGER IMEMA0(65530),TMEMA0(65000),ERROR0,BREAK0,CONTI0
      INTEGER SMEMA0(32767)
      INTEGER BREAL0(10),CONTJ0(10)
      INTEGER OUTFI0,INFIL0,STREA0,STREB0,STREC0
      INTEGER RTRID0(31)
      INTEGER EMITP0,EMITO0
      COMMON /VCGCOM/ERROR0,BREAK0,CONTI0,BREAL0,CONTJ0,OUTFI0,INFIL0,ST
     *REA0,STREB0,STREC0,RTRID0,EMITP0,EMITO0
      COMMON /VCGCM1/IMEMA0
      COMMON /VCGCM2/TMEMA0
      COMMON /VCGCM3/SMEMA0
      INTEGER I
      INTEGER IALLOC
      I=IALLOC(5)
      IMEMA0(I)=5
      IMEMA0(I+1)=I
      IMEMA0(I+2)=I
      IMEMA0(I+3)=17
      IMEMA0(I+4)=PROCO0
      SETUP0=I
      RETURN
      END
C ---- Long Name Map ----
C loadcompl                      loadj0
C loadxoraa                      loafg0
C deletelit                      delev0
C enterent                       enter0
C flowfield                      flowf0
C geniplabel                     genip0
C genlabel                       genla0
C loaddiv                        loadq0
C loadlshiftaa                   loaea0
C loadpredec                     loael0
C otg$aentpb                     otg$a0
C Imem                           imema0
C procobjid                      proco0
C loadrem                        loaep0
C putmoduleheader                putmo0
C enterlit                       enteu0
C generatestaticstuff            geneu0
C loadchecklower                 loadg0
C loaddefinestat                 loado0
C loadreturn                     loaer0
C setupswitch                    setuq0
C gengeneric                     genge0
C linksize                       links0
C loadandaa                      loadd0
C loadobject                     loaeh0
C loadproccall                   loaen0
C loadrefto                      loaeo0
C lookupext                      looku0
C alloctemp                      alloc0
C loadcheckupper                 loadi0
C loadwhileloop                  loafe0
C geniprtr                       geniq0
C loadrshiftaa                   loaet0
C loadseq                        loaex0
C voidswitch                     voidt0
C initializelabels               initi0
C loadsub                        loafa0
C clearobj                       cleax0
C deleteext                      delet0
C loadundefinedynm               loafd0
C reachindex                     reack0
C simplify                       simpl0
C stfield                        stfie0
C lfieldmask                     lfiel0
C loadoraa                       loaei0
C otg$dac                        otg$e0
C otg$mref                       otg$m0
C putmoduletrailer               putmp0
C resolveent                     resol0
C clearstack                     cleay0
C enterext                       entes0
C lshiftaby                      lshif0
C putstartdata                   putst0
C Smem                           smema0
C loadconst                      loadk0
C loadmul                        loaeb0
C loadpostinc                    loaek0
C otg$ecb                        otg$g0
C putbranch                      putbr0
C resolvelit                     reson0
C voidfieldasgop                 voidf0
C Tmem                           tmema0
C EmitPMA                        emitp0
C flowswitch                     flowv0
C loadconvert                    loadl0
C loadforloop                    loadv0
C loadsand                       loaev0
C optimize                       optim0
C rsvstack                       rsvst0
C voidaddaa                      voida0
C gettreegettr0
C loadselect                     loaew0
C lookuplab                      lookv0
C otg$endlb                      otg$h0
C otg$rentlb                     otg$r0
C loadnot                        loaef0
C loadpreinc                     loaem0
C otg$rorglb                     otg$t0
C loadlabel                      loady0
C voidpostdec                    voidp0
C escapelab                      escap0
C framecom                       frame0
C generateprocedures             genet0
C genswitch                      gensw0
C loaddeclarestat                loadm0
C otglabel                       otgla0
C reachobject                    reacl0
C rshiftaby                      rshif0
C Breaksp                        break0
C Stream1                        strea0
C deletelab                      deleu0
C getlitaddr                     getli0
C loadadd                        loada0
C loadcheckrange                 loadh0
C loadsor                        loaez0
C otg$endpb                      otg$i0
C Stream2                        streb0
C gencopy                        genco0
C loadassign                     loade0
C reachseq                       reacn0
C Stream3                        strec0
C enterlab                       entet0
C generateproc                   genes0
C initshfttableids               inits0
C loadfield                      loadt0
C otg$proc                       otg$p0
C otgmisc                        otgmi0
C resolveext                     resom0
C warning                        warni0
C Breakstack                     breal0
C clearent                       clear0
C loadbreak                      loadf0
C loaddivaa                      loadr0
C loadderef                      loadp0
C loadremaa                      loaeq0
C loadrtrip                      loaeu0
C lshiftlby                      lshig0
C otg$brnch                      otg$d0
C stacksize                      stack0
C Continuesp                     conti0
C andawith                       andaw0
C clearlit                       cleaw0
C gensjtolab                     gensk0
C loadxor                        loaff0
C overlap                        overl0
C genbranch                      genbr0
C loadlshift                     loadz0
C reachconst                     reaci0
C Rtrids                         rtrid0
C voidseq                        voids0
C Continuestack                  contj0
C getextaddr                     getex0
C lookupobj                      lookx0
C otg$rorg                       otg$s0
C reachselect                    reacm0
C arshiftaby                     arshi0
C getlabeladdr                   getla0
C loaddoloop                     loads0
C otg$blk                        otg$c0
C initotg                        inito0
C loadand                        loadc0
C loadsubaa                      loafb0
C otg$gen                        otg$l0
C rshiftlby                      rshig0
C gendata                        genda0
C ldfield                        ldfie0
C loadshiftins                   loaey0
C Errors                         error0
C deleteobj                      delew0
C loadrshift                     loaes0
C otg$entlb                      otg$j0
C voidpostinc                    voidq0
C EmitObj                        emito0
C clearext                       cleas0
C flfield                        flfie0
C flowseq                        flowt0
C freetemp                       freet0
C genshift                       gensh0
C otg$orglb                      otg$o0
C otgpseudo                      otgps0
C reachassign                    reach0
C enterobj                       entev0
C loadgoto                       loadw0
C loadmulaa                      loaec0
C loadswitch                     loafc0
C putlabel                       putla0
C gensjforward                   gensj0
C mklabel                        mklab0
C setupframeowner                setup0
C voidpreinc                     voidr0
C Outfile                        outfi0
C andlwith                       andlw0
C loadnull                       loaeg0
C otg$entpb                      otg$k0
C reachderef                     reacj0
C Infile                         infil0
C loadneg                        loaed0
C putmisc                        putmi0
C otg$apins                      otg$b0
C putgeneric                     putge0
C clearinstr                     cleat0
C clearlink                      cleav0
C flowconvert                    flowc0
C flowsand                       flows0
C loadfieldasgop                 loadu0
C otg$data                       otg$f0
C otg$xtip                       otg$x0
C putinstr                       putin0
C voidassign                     voidb0
C adequal                        adequ0
C arshiftlby                     arshj0
C loadaddaa                      loadb0
C loadnext                       loaee0
C ophasvalue                     ophas0
C strsave                        strsa0
C clearstr                       cleaz0
C cleartree                      cleba0
C flownot                        flown0
C otg$rslv                       otg$u0
C rsvlink                        rsvli0
C zerolit                        zerol0
C clearlab                       cleau0
C freestack                      frees0
C genextrtr                      genex0
C loadindex                      loadx0
C lookuplit                      lookw0
C otgbranch                      otgbr0
C loadpostdec                    loaej0
C otg$uii                        otg$v0
C afieldmask                     afiel0
C flowsor                        flowu0
C generateentries                gener0
C loaddefinedynm                 loadn0
