      INTEGER SYMTE0(200),SYMLO0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAK0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAK0
      INTEGER OUTBU0(102,3)
      INTEGER OUTPA0(3)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(25000)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(3),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRS0(20),EXPRT0,FALSE0
      COMMON /CODEG0/EXPRS0,EXPRT0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SCLAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200)
      INTEGER CURLA0,BRACE0,DISPA0,INDEN0,FIRST0,SPNUM0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,DISPA0,INDEN0,MODUM0,FIRST0,PR
     *OFD0,SPNUM0,ERROR0,A$BUF
      INTEGER FNAME(200),BUF(102),KEEP(102)
      INTEGER TEMPF0,TEMPG0
      INTEGER OPEN,MKTEMP
      INTEGER GFNARG,STATE(4)
      INTEGER GETLIN,EQUAL,LENGTH
      INTEGER PARSCL
      INTEGER AAAAA0(21)
      INTEGER AAAAB0(19)
      DATA AAAAA0/219,173,230,237,221,160,219,173,238,160,188,233,231,23
     *8,239,242,229,228,190,221,0/
      DATA AAAAB0/189,233,238,227,236,189,175,243,247,244,223,228,229,23
     *0,174,242,174,233,0/
      IF((PARSCL(AAAAA0,A$BUF).NE.-3))GOTO 10000
        CALL ERROR('Usage: link [-fm] [-n<filename>].')
10000 CALL INITI0
      TEMPF0=MKTEMP(3)
      TEMPG0=MKTEMP(3)
      IF((A$BUF(230-225+1).NE.0))GOTO 10001
        LEVEL0=1
        INFIL0(LEVEL0)=OPEN(AAAAB0,1)
        CALL GETLI0(TEMPF0)
10001 STATE(1)=1
10002 IF((GFNARG(FNAME,STATE).EQ.-1))GOTO 10003
        LEVEL0=1
        INFIL0(LEVEL0)=OPEN(FNAME,1)
        LINEN0(LEVEL0)=0
        CALL GETLI0(TEMPF0)
      GOTO 10002
10003 CALL REWIND(TEMPF0)
      CALL SORT(TEMPF0,TEMPG0)
      CALL RMTEMP(TEMPF0)
      CALL PRINT(-11,'linkage  _*n.')
      CALL REWIND(TEMPG0)
      IF((GETLIN(KEEP,TEMPG0).EQ.-1))GOTO 10004
10005   IF((GETLIN(BUF,TEMPG0).EQ.-1))GOTO 10006
          IF((EQUAL(KEEP,BUF).NE.0))GOTO 10007
            KEEP(LENGTH(KEEP))=172
            CALL PRINT(-11,'   *s*n.',KEEP)
            CALL SCOPY(BUF,1,KEEP,1)
10007   GOTO 10005
10006   CALL PRINT(-11,'   *s.',KEEP)
10004 CALL RMTEMP(TEMPG0)
      CALL SWT
      END
      SUBROUTINE GETLI0(TEMPH0)
      INTEGER TEMPH0
      INTEGER SYMTE0(200),SYMLO0(200)
      INTEGER SYMLE0,SYMBO0
      INTEGER IDTAB0,UNAME0
      COMMON /LEXCOM/SYMTE0,SYMLE0,SYMBO0,IDTAB0,UNAME0,SYMLO0
      INTEGER INBUF0(505)
      INTEGER IBPAA0,LINEN0(5),LEVEL0
      INTEGER INFIL0(5)
      COMMON /INCOM/INBUF0,IBPAA0,LINEN0,INFIL0,LEVEL0
      INTEGER LOOPS0,NEXTL0(10),BREAK0(10)
      COMMON /LOOPC0/LOOPS0,NEXTL0,BREAK0
      INTEGER OUTBU0(102,3)
      INTEGER OUTPA0(3)
      COMMON /OBUFC0/OUTBU0,OUTPA0
      INTEGER MEMAA0(25000)
      COMMON /DS$MEM/MEMAA0
      INTEGER OUTFI0(3),FORTF0
      COMMON /OUTFIL/OUTFI0,FORTF0
      INTEGER EXPRS0(20),EXPRT0,FALSE0
      COMMON /CODEG0/EXPRS0,EXPRT0,FALSE0
      INTEGER SCVAL0(256),SCLAB0(256),SLTAA0,RESUL0(10)
      COMMON /SELGEN/SCVAL0,SCLAB0,SCLAA0,RESUL0
      INTEGER SCOPE0
      INTEGER SCOPF0(100),PROCH0,PROCT0
      COMMON /PRCCOM/SCOPE0,SCOPF0,PROCH0,PROCT0
      INTEGER MODUL0(200),MODUM0(200),ERROR0(200)
      INTEGER CURLA0,BRACE0,DISPA0,INDEN0,FIRST0,SPNUM0
      INTEGER PROFD0
      INTEGER A$BUF(200)
      COMMON /MISCOM/MODUL0,CURLA0,BRACE0,DISPA0,INDEN0,MODUM0,FIRST0,PR
     *OFD0,SPNUM0,ERROR0,A$BUF
      INTEGER ID(200)
      INTEGER OPEN
      INTEGER AAAAC0
      INTEGER AAAAD0
      CALL GETSYM
10008 IF((SYMBO0.EQ.-1))GOTO 10009
        AAAAC0=SYMBO0
        GOTO 10010
10011     CALL GETSYM
          IF((SYMBO0.NE.168))GOTO 10012
            CALL ENTER0
            GOTO 10013
10012       CALL SYNERR('Left paren must follow ''define''.')
10013   GOTO 10014
10015     CALL GETSYM
          IF((SYMBO0.NE.168))GOTO 10016
            CALL REMOV0
            GOTO 10017
10016       CALL SYNERR('Left paren must follow ''undefine''.')
10017   GOTO 10014
10018     IF((LEVEL0.LT.5))GOTO 10019
            CALL ERROR('Includes nested too deeply.')
10019     CALL GETSYM
          CALL GETLO0(ID)
          LEVEL0=LEVEL0+(1)
          LINEN0(LEVEL0)=0
          INFIL0(LEVEL0)=OPEN(ID,1)
          IF((INFIL0(LEVEL0).NE.-3))GOTO 10020
            CALL ERROR('can''t open include file.')
            LEVEL0=LEVEL0-1
10020   GOTO 10014
10021     CALL GETSYM
          IF((SYMBO0.NE.1023))GOTO 10022
            CALL GETLO0(ID)
            CALL PRINT(TEMPH0,'*s*n.',ID)
            GOTO 10023
10022       CALL SYNERR('identifier expected in subprogram declaration.'
     *)
10023   GOTO 10014
10024     CALL GETSYM
10025     IF((SYMBO0.EQ.138))GOTO 10026
            IF((SYMBO0.NE.1023))GOTO 10027
              CALL GETLO0(ID)
              CALL PRINT(TEMPH0,'*s*n.',ID)
10027       CALL GETSYM
          GOTO 10025
10026   GOTO 10014
10028     CALL GETSYM
          IF((SYMBO0.NE.175))GOTO 10029
            CALL GETSYM
            IF((SYMBO0.NE.1023))GOTO 10030
              CALL GETLO0(ID)
              CALL PRINT(TEMPH0,'*s*n.',ID)
              GOTO 10031
10030         CALL SYNERR('identifier expected in named common statement
     *.')
10031     CONTINUE
10029   GOTO 10014
10010   AAAAD0=AAAAC0-1013
        GOTO(10011,10032,10032,10032,10032,10032,10032,10021,10032,10032
     *,10032,10032,10018),AAAAD0
        AAAAD0=AAAAC0-1042
        GOTO(10021,10032,10015,10032,10032,10032,10032,10032,10032,10032
     *,10032,10032,10032,10032,10024,10028),AAAAD0
10032   CONTINUE
10014   CALL GETSYM
      GOTO 10008
10009 RETURN
      END
C ---- Long Name Map ----
C getlinkid                      getli0
C deleteunderscores              delet0
C enterdefinition                enter0
C enterlongname                  entet0
C Fortfile                       fortf0
C Indent                         inden0
C Slt                            sltaa0
C compare                        compa0
C cleanup                        clean0
C convertstringconstant          conve0
C putbackstr                     putbc0
C Breaklab                       break0
C putback                        putba0
C obufcom                        obufc0
C invokemacro                    invok0
C Dispatchflag                   dispa0
C Spnum                          spnum0
C Proctable                      proct0
C refillbuffer                   refil0
C savemodulename                 savem0
C Outbuf                         outbu0
C Firststmt                      first0
C Symbol                         symbo0
C Inbuf                          inbuf0
C Ibp                            ibpaa0
C loopcom                        loopc0
C Unametable                     uname0
C Nextlab                        nextl0
C fatalerr                       fatal0
C Symlen                         symle0
C Prochead                       proch0
C removedefinition               remov0
C Symlongtext                    symlo0
C Level                          level0
C Mem                            memaa0
C dgetsym                        dgets0
C Falsebranch                    false0
C Scopetable                     scopf0
C Profdictfile                   profd0
C Symtext                        symte0
C Scvalue                        scval0
C Loopsp                         loops0
C Scl                            sclaa0
C tempfile                       temph0
C codegen                        codeg0
C enterkw                        entes0
C Modulelongname                 modum0
C Result                         resul0
C Bracecount                     brace0
C initialize                     initi0
C skipwhitespace                 skipw0
C Exprstackptr                   exprt0
C Modulename                     modul0
C getactualparameters            getac0
C Outp                           outpa0
C Outfile                        outfi0
C Infile                         infil0
C tempfile1                      tempf0
C makeunique                     makeu0
C tempfile2                      tempg0
C collectactualparameter         colle0
C Curlab                         curla0
C Exprstack                      exprs0
C Scopesp                        scope0
C getdefinition                  getde0
C getformalparameters            getfo0
C getlongname                    getlo0
C putbacknum                     putbb0
C Idtable                        idtab0
C Linenumber                     linen0
C Sclabel                        sclab0
C Errorsym                       error0
