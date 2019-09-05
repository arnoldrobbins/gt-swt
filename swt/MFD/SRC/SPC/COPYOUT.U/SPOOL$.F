C SPOOL$.F, =src=/spc/copyout.u, TLC, 09/16/83
C
C SPOOL$.FTN, SPOOL>SOURCE, GAM-JCB, 06/29/81
C Insert entry into spool queue
C Copyright (c) 1979, Prime Computer, Inc., Wellesley, MA 02181
C
       SUBROUTINE SPOOL$(KEY,NAME,NAMLEN,INFO,BUF,BUFLEN,CODE)
C
       INTEGER  KEY,    /* ACTION KEY:
C                            1 - COPY (NAME) INTO QUEUE
C                            2 - OPEN FILE ON UNIT (INFO(2)) IN QUEUE
     +          NAME,   /* FILE NAME TO BE COPIED AND/OR NAME TO APPEAR ON
C                          HEADER PAGE WHEN FILE IS PRINTED
     +          NAMLEN, /* LENGTH OF (NAME)
     +          INFO(1),/* INFORMATION ARRAY, 29 ELEMENTS, AS FOLLOWS:
C                            1    - OBSOLETE
C                            2    - OPEN PRINT FILE ON THIS UNIT (KEY=2)
C                            3    - PRINT OPTION WORD, SEE BELOW
C                           4-6   - FORM TYPE DESIGNATION (ASCII, 1-6 CHAR'S)
C                            7    - WORDS PER RASTER SCAN (PLOT MODE ONLY)
C                           8-10  - SPOOL FILE NAME (RETURNED)
C                            11   - DEFERRED PRINT TIME
C                            12   - FILE SIZE (RETURNED IF KEY=1)
C                          13-20  - STRING SPECIFYING LOGICAL LOCATION FOR
C                                   OUTPUT (ASCII, 16 CHAR'S, BLANK FILLED)
C                          21-28  - STRING TO USE AS REPLACEMENT FOR (NAME) ON
C                                   HEADER PAGE (16 CHAR'S, BLANK FILLED)
C                            29   - NUMBER OF COPIES
     +          BUF(1), /* SCRATCH BUFFER - THIS IS USED TO SET UP CONTROL INFO
C                          & COPY THE SPOOL FILE (KEY=1).  IT MUST BE AT LEAST
C                          40 WORDS LONG.  COPY TIME IS INVERSELY PROPOR-
C                          TIONAL TO BUFFER SIZE - NOMINAL SIZE IS 300-1000.
     +          BUFLEN, /* LENGTH OF (BUF)
     +          CODE    /* RETURN CODE (NON-ZERO IF ERROR OCCURRED)
C
C   THE PRINT OPTION WORD (INFO(3)) SPECIFIES VARIOUS PRINT(/PLOT) INFORMATION
C   AND IS SET UP AS FOLLOWS:
C
C         BIT   DESIGNATION
C         ---   -----------
C          1    FORTRAN FORMAT CONTROL
C          2    EXPAND COMPRESSED LISTING
C          3    GENERATE LINE #'S AT LEFT MARGIN
C          4    SUPPRESS HEADER PAGE
C          5    DON'T EJECT PAGE WHEN DONE
C          6    NO FORMAT CONTROL
C          7    PLOT THIS FILE - INFO(7) SPECIFIES WORDS/RASTER SCAN
C          8    DON'T PRINT THIS FILE UNTIL THE TIME SPECIFIED IN INFO(11)
C          9    FORCE THIS FILE TO PRINT ON HOME PRINTER
C         10    PRINT/PLOT FILE AT LOCATION SPECIFIED BY STRING AT INFO(13)
C         11    REPLACE (NAME) WITH STRING AT INFO(21)
C         12    OUTPUT THE NUMBER OF COPIES SPECIFIED IN INFO(29)
C         16    USE HASP CARRIAGE CONTROL
C
       INTEGER SPLDIR(3),SPLPAS(3),CODE,QENTNO,OPKEY,C,GCHAR,
     +         QNAM(3),I,TIM(28),GU,GU2,GU3,J,ENTNAM(17),TA$
       INTEGER*4 LINFO,POS4
      LOGICAL ENTFLG
C
C
C---Begin GT changes
C
include "=syscom=/errd.ins.ftn"
include "=syscom=/keys.ins.ftn"
include "q$com.ins.ftn"
include "newscom.ins.ftn"
C
C---End   GT changes
C
C
       INTEGER*4 RECSIZ
       PARAMETER ( RECSIZ=001024 )
       DATA SPLDIR /'SPOOLQ'/, SPLPAS /'      '/, QNAM /'Q.CTRL'/
C
       CODE=E$BKEY
       IF( KEY.EQ.2 ) GOTO 90
       IF( KEY.NE.1 ) RETURN
C
C---Try to open file for copy if KEY=1
C
      I=TA$(NAME,INTL(NAMLEN),2,ENTNAM(2),ENTNAM(1),ENTFLG,CODE)
      IF (CODE.NE.0) GO TO 270
      CALL SRCH$$(K$READ+K$GETU,ENTNAM(2),ENTNAM(1),GU2,I,CODE)
      IF (CODE.NE.0) GO TO 270
C
      S$BUFF(S$DTMD)=0
      S$BUFF(S$DTMD+1)=0
C
      DO 70 I=S$EXTR,S$NLEN
         S$BUFF(I)=0
70    CONTINUE
C
      CALL SRCH$$(K$READ+K$GETU,K$CURR,0,GU,I,CODE)
      IF (CODE.NE.0) GO TO 80
C
      CALL RDEN$$(K$NAME,GU,BUF,24,I,ENTNAM(2),ENTNAM(1),CODE)
      CALL SRCH$$(K$CLOS,0,0,GU,0,I)
      IF (CODE.NE.0) GO TO 80
C
      S$BUFF(S$DTMD)=BUF(21)  /* Get dtm of file.
      S$BUFF(S$DTMD+1)=BUF(22)
C
C ---  LINFO=NAMLEN                    /* set up 0,length pair for TSRC$$
C ---  CALL TSRC$$(K$READ+K$GETU,NAME,GU2,LINFO,I,CODE)
C ---  IF( CODE.NE.0 ) GOTO 270
C
80    CALL ATCH$$(K$HOME,0,0,0,0,I)
       CALL GPATH$(K$UNIT,GU2,S$BUFF(S$PATH+1),80,S$BUFF(S$PATH),CODE)
      IF(CODE.NE.0) CALL SPL$MB('(info unavailable)',S$BUFF(S$PATH+1),9)
      IF (CODE.NE.0) S$BUFF(S$PATH)=18
      GO TO 100
C
C---Create queue entry in buffer
C
90    CALL GPATH$(K$HOMA,0,S$BUFF(S$PATH+1),80,S$BUFF(S$PATH),CODE)
      IF(CODE.NE.0) CALL SPL$MB('(info unavailable)',S$BUFF(S$PATH+1),9)
      IF (CODE.NE.0) S$BUFF(S$PATH)=18
C
100    CALL ATCH$$(SPLDIR,6,K$ALLD,SPLPAS,K$IMFD,CODE)
       IF( CODE.NE.0 ) GOTO 260
       CALL TIMDAT(TIM,28)             /* need user and date/time info
C
       BUF(1)=2                        /* set valid word
       CALL SPL$MB(TIM(13),BUF(2),3)   /* move user name
       CALL SPL$MB(TIM(13),S$BUFF(S$UNAM),16)  /* Move entire username.
       S$BUFF(S$COPY)=KEY
       CALL SPL$MB(TIM,BUF(24),4)      /* move date/time
      S$BUFF(S$SECS)=TIM(5)  /* Now handles seconds too.  JCB
C
       IF( AND(INFO(3),:40 ).EQ.0) GOTO 110
       CALL SPL$MB(INFO(21),BUF(5),8)
       J=16
       GOTO 140
110    I=0
120    J=0
130    C=GCHAR(LOC(NAME),I)
       IF( I.GT.NAMLEN ) GOTO 140
       IF( C.EQ.RT(' >',8) ) GOTO 120
       IF( J.GT.31 ) GOTO 140
       CALL SCHAR(LOC(BUF(5)),J,C)
       GOTO 130
140    CALL SCHAR(LOC(BUF(5)),J,:240)
       IF( J.LT.32 ) GOTO 140
C
       CALL SPL$MB(INFO(4),BUF(21),3)  /* move -FORM name
       BUF(28)=INFO(3)                 /* set print option word
       BUF(29)=INFO(11)                /* get -DEFER time
       BUF(30)=-1                      /* size is currently unknown
       BUF(40)=INFO(29)                /* number of -COPIES
C
C---Try to get this system's default -AT name
C
       IF( AND(BUF(28),:100).NE.0 ) GOTO 160           /* did user supply one?
         CALL SRCH$$(K$READ+K$GETU,'L.DFLT',6,GU,J,CODE)
         IF( CODE.EQ.E$FNTF ) GOTO 170 /* default supplied?
         IF( CODE.NE.0      ) GOTO 260
           CALL RDLIN$(GU,BUF(32),8,CODE)             /* get the default
           CALL SRCH$$(K$CLOS,0,0,GU,0,CODE)
           BUF(28)=BUF(28)+:100        /* indicate we have a name
           CALL SPL$MB(BUF(32),BUF(31),3)             /* -AT field is split
           GOTO 170
160    CALL SPL$MB(INFO(13),BUF(31),3) /* move first part
       CALL SPL$MB(INFO(16),BUF(35),5) /* move rest after hole
170    BUF(34)=INFO(7)                 /* this is what made hole
C
C---Open queue
C
       CALL SRCH$$(K$EXST,QNAM,6,1,0,CODE)
       IF( CODE.EQ.E$FNTF ) GOTO 180
       IF( KEY.EQ.2 ) CALL SRCH$$(K$READ,'SPPHN.SEG',9,INFO(2),J,CODE)
       CALL Q$OFFC(GU,QNAM,6,K$RDWR+K$GETU,CODE)
       CALL SRCH$$(K$CLOS,'SPPHN.SEG',9,0,0,J)  /* free unit for the -OPEN
       IF( CODE.NE.0 ) GOTO 260
       CALL PRWF$$(K$READ,GU,LOC(HBUF),HSIZE,000000,J,CODE)
       IF( CODE.NE.0 ) GOTO 250
       GOTO 190
C
C---Queue not found, create one
C
180    CALL SRCH$$(K$WRIT+K$GETU,QNAM,6,GU,I,CODE)    /* create it
       IF( CODE.NE.0 ) GOTO 260
C
       HBUF(1)=0                       /* obsolete
       HBUF(2)=0                       /* obsolete
       CHEAD=1                         /* head pointer
       CTAIL=1                         /* tail pointer
       HBUF(5)=CENTS                   /* maximum number of entries
       HBUF(6)=CSIZE                   /* entry size minus one
       CEMTY=.FALSE.                   /* .FALSE. means queue empty!
C
       CALL PRWF$$(K$WRIT,GU,LOC(HBUF),HSIZE+CENTS*(CSIZE+1),
     +             000000,I,CODE)      /* write header and fill
       IF( CODE.NE.0 ) GOTO 250
       CALL PRWF$$(K$WRIT,GU,LOC(HBUF),CENTS*S$NLEN,000000,I,CODE)
       IF (CODE.NE.0) GO TO 250
C
C---Insert entry
C
190    CODE=E$ROOM                     /* in case queue is full
       IF( CEMTY .AND. CHEAD.EQ.CTAIL ) GOTO 250      /* queue full?
C
       POS4=(CTAIL-1)*(CSIZE+1)+HSIZE  /* get position of entry
       CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(BUF),CSIZE+1,POS4,I,CODE)
       IF( CODE.NE.0 ) GOTO 250
      IF (CTAIL.NE.1) GO TO 188
      CALL PRWF$$(K$POSN+K$PREA,GU,LOC(0),0,008208,0,CODE)
      IF (CODE.EQ.E$EOF) GO TO 189
C
188    CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(S$BUFF),S$NLEN,
     &   INTL(HSIZE+CENTS*(CSIZE+1)+(CTAIL-1)*S$NLEN),I,CODE)
       IF (CODE.NE.E$EOF) GO TO 195
C
189    CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(HBUF),CENTS*S$NLEN,
     &   INTL(HSIZE+CENTS*(CSIZE+1)),I,CODE)
       IF (CODE.NE.0) GO TO 250
       CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(S$BUFF),S$NLEN,
     &   INTL(HSIZE+CENTS*(CSIZE+1)+(CTAIL-1)*S$NLEN),I,CODE)
       IF (CODE.NE.0) GO TO 250
C
195   IF (CODE.NE.0) GO TO 250
C
C
       QENTNO=CTAIL                    /* store entry number
       CTAIL=MOD(CTAIL,CENTS)+1        /* increment and check wrap
       CEMTY=.TRUE.                    /* queue not empty
C
       CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(HBUF),HSIZE,000000,I,CODE)
       IF( CODE.NE.0 ) GOTO 250
C
C---Build name and open print file
C
       INFO(8)='PR'
       INFO(9)='T0'+QENTNO/100
       I=MOD(QENTNO,100)
       INFO(10)=LS(I/10,8)+MOD(I,10)+'00'
C
       OPKEY=K$RDWR+K$GETU             /* use this when KEY=1
       IF( KEY.EQ.1 ) GOTO 200
       OPKEY=K$RDWR
       GU3=INFO(2)                     /* use the user's unit
C
C---Begin GT changes
C
C200    CALL SRCH$$(OPKEY,INFO(8),6,GU3,I,CODE)
C
200    CALL COMO$$(:120,INFO(8),6,0,CODE) /* ****SPECIAL MODS**** gt */
       CALL SRCH$$(K$CLOS,0,0,GU,0,I)
       CALL BREAK$(.FALSE.)  /* queue is safe now
       IF( CODE.NE.0 ) GOTO 225
C       CALL PRWF$$(K$TRNC,GU3,LOC(0),0,000000,0,CODE) /* delete what's here
C       IF ( CODE.NE.0 ) GOTO 225
C
C---End   GT changes
C
       IF( KEY.NE.1 ) GOTO 270         /* done if -OPEN operation
C
C---Copy another block of the file
C
210    CALL PRWF$$(K$READ+K$CONV,GU2,LOC(BUF),BUFLEN,000000,I,CODE)
       IF( CODE.NE.0 .AND. CODE.NE.E$EOF ) GOTO 220   /* go delete if error
C
       IF( I.EQ.0 ) GOTO 230           /* EOF, finish up
       CALL PRWF$$(K$WRIT,GU3,LOC(BUF),I,000000,J,CODE)
       IF( CODE.EQ.0 ) GOTO 210
C
C---A read/write error, get rid of the evidence, watch locking (tricky)
C
220    CALL PRWF$$(K$TRNC+K$PREA,GU3,LOC(0),0,000000,0,I) /* delete most
225    CALL Q$REM(QNAM,GU,QENTNO,I)    /* remove entry
       IF( CODE.EQ.E$UIUS ) GOTO 250
       CALL SRCH$$(K$CLOS,0,0,GU3,0,I)
       CALL SRCH$$(K$DELE,INFO(8),6,GU3,0,I)
       GOTO 250
C
C---Transfer complete
C
230    CALL PRWF$$(K$RPOS,GU3,LOC(0),0,LINFO,0,CODE)  /* get file length
       IF( CODE.NE.0 ) GOTO 220
      LINFO=(LINFO+RECSIZ-INTL(1))/RECSIZ       /* calculate size (normalized)
       IF( AND(INFO(3),:20).NE.0 ) LINFO=LINFO*INTL(INFO(29)) /* copies
       IF (LINFO.GT.032767) LINFO=032767
       INFO(12)=INTS(LINFO)
C
C---Update queue with size
C
       CALL Q$OFFC(GU,QNAM,6,K$RDWR,CODE)
       IF( CODE.NE.0 ) GOTO 250
C
       CALL PRWF$$(K$WRIT+K$PREA,GU,LOC(INFO(12)),1,POS4+29,J,CODE)
C
       CALL SRCH$$(K$CLOS,0,0,GU3,0,I) /* unit used for print file
       CALL SEM$DR(-32,I)
250    CALL SRCH$$(K$CLOS,0,0,GU,0,I)  /* unit used for queue
       CALL BREAK$(.FALSE.)
260    CALL SRCH$$(K$CLOS,0,0,GU2,0,I) /* unit used for user's file
270    CALL ATCH$$(K$HOME,0,0,0,0,I)
C
       RETURN
C
       END
