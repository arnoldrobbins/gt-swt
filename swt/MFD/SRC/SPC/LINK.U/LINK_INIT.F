      SUBROUTINE INITI0
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
      INTEGER I
      INTEGER CREATE
      INTEGER MKTABL
      INTEGER AAAAA0(7)
      INTEGER AAAAB0(7)
      INTEGER AAAAC0(7)
      INTEGER AAAAD0(12)
      INTEGER AAAAE0(8)
      INTEGER AAAAF0(10)
      INTEGER AAAAG0(10)
      INTEGER AAAAH0(8)
      INTEGER AAAAI0(6)
      INTEGER AAAAJ0(3)
      INTEGER AAAAK0(5)
      INTEGER AAAAL0(4)
      INTEGER AAAAM0(6)
      INTEGER AAAAN0(7)
      INTEGER AAAAO0(6)
      INTEGER AAAAP0(5)
      INTEGER AAAAQ0(3)
      INTEGER AAAAR0(7)
      INTEGER AAAAS0(6)
      INTEGER AAAAT0(5)
      INTEGER AAAAU0(5)
      INTEGER AAAAV0(5)
      INTEGER AAAAW0(5)
      INTEGER AAAAX0(4)
      INTEGER AAAAY0(8)
      INTEGER AAAAZ0(7)
      INTEGER AAABA0(9)
      INTEGER AAABB0(7)
      INTEGER AAABC0(5)
      INTEGER AAABD0(6)
      INTEGER AAABE0(9)
      INTEGER AAABF0(8)
      INTEGER AAABG0(8)
      INTEGER AAABH0(9)
      INTEGER AAABI0(10)
      INTEGER AAABJ0(9)
      INTEGER AAABK0(10)
      INTEGER AAABL0(8)
      INTEGER AAABM0(12)
      INTEGER AAABN0(9)
      INTEGER AAABO0(11)
      INTEGER AAABP0(7)
      INTEGER AAABQ0(5)
      INTEGER AAABR0(6)
      INTEGER AAABS0(5)
      INTEGER AAABT0(5)
      INTEGER AAABU0(16)
      INTEGER AAABV0(10)
      INTEGER AAABW0(12)
      INTEGER AAABX0(10)
      INTEGER AAABY0(9)
      DATA AAAAA0/174,237,225,233,238,174,0/
      DATA AAAAB0/174,237,225,233,238,174,0/
      DATA AAAAC0/243,244,242,233,238,231,0/
      DATA AAAAD0/243,244,242,233,238,231,244,225,226,236,229,0/
      DATA AAAAE0/236,233,238,235,225,231,229,0/
      DATA AAAAF0/240,242,239,227,229,228,245,242,229,0/
      DATA AAAAG0/242,229,227,245,242,243,233,246,229,0/
      DATA AAAAH0/230,239,242,247,225,242,228,0/
      DATA AAAAI0/236,239,227,225,236,0/
      DATA AAAAJ0/233,230,0/
      DATA AAAAK0/229,236,243,229,0/
      DATA AAAAL0/230,239,242,0/
      DATA AAAAM0/247,232,233,236,229,0/
      DATA AAAAN0/242,229,240,229,225,244,0/
      DATA AAAAO0/245,238,244,233,236,0/
      DATA AAAAP0/227,225,243,229,0/
      DATA AAAAQ0/228,239,0/
      DATA AAAAR0/242,229,244,245,242,238,0/
      DATA AAAAS0/226,242,229,225,235,0/
      DATA AAAAT0/238,229,248,244,0/
      DATA AAAAU0/243,244,239,240,0/
      DATA AAAAV0/231,239,244,239,0/
      DATA AAAAW0/227,225,236,236,0/
      DATA AAAAX0/229,238,228,0/
      DATA AAAAY0/233,238,227,236,245,228,229,0/
      DATA AAAAZ0/228,229,230,233,238,229,0/
      DATA AAABA0/245,238,228,229,230,233,238,229,0/
      DATA AAABB0/243,229,236,229,227,244,0/
      DATA AAABC0/247,232,229,238,0/
      DATA AAABD0/233,230,225,238,249,0/
      DATA AAABE0/227,239,238,244,233,238,245,229,0/
      DATA AAABF0/227,239,237,240,236,229,248,0/
      DATA AAABG0/236,239,231,233,227,225,236,0/
      DATA AAABH0/233,237,240,236,233,227,233,244,0/
      DATA AAABI0/240,225,242,225,237,229,244,229,242,0/
      DATA AAABJ0/229,248,244,229,242,238,225,236,0/
      DATA AAABK0/228,233,237,229,238,243,233,239,238,0/
      DATA AAABL0/233,238,244,229,231,229,242,0/
      DATA AAABM0/229,241,245,233,246,225,236,229,238,227,229,0/
      DATA AAABN0/230,245,238,227,244,233,239,238,0/
      DATA AAABO0/243,245,226,242,239,245,244,233,238,229,0/
      DATA AAABP0/227,239,237,237,239,238,0/
      DATA AAABQ0/228,225,244,225,0/
      DATA AAABR0/244,242,225,227,229,0/
      DATA AAABS0/243,225,246,229,0/
      DATA AAABT0/242,229,225,236,0/
      DATA AAABU0/228,239,245,226,236,229,240,242,229,227,233,243,233,23
     *9,238,0/
      DATA AAABV0/226,236,239,227,235,228,225,244,225,0/
      DATA AAABW0/243,244,225,227,235,232,229,225,228,229,242,0/
      DATA AAABX0/243,232,239,242,244,227,225,236,236,0/
      DATA AAABY0/243,244,237,244,230,245,238,227,0/
      FIRST0=0
      SCOPE0=0
      PROCT0=0
      SPNUM0=0
      ERROR0(1)=0
      IBPAA0=400
      INBUF0(IBPAA0)=0
      DO 10000 I=1,3
        OUTPA0(I)=0
10000 CONTINUE
10001 DO 10002 I=1,3
        OUTFI0(I)=MKTEMP(3)
10002 CONTINUE
10003 LOOPS0=0
      EXPRT0=0
      CURLA0=10000
      BRACE0=0
      DISPA0=0
      INDEN0=0
      CALL SCOPY(AAAAA0,1,MODUL0,1)
      CALL SCOPY(AAAAB0,1,MODUM0,1)
      CALL DSINIT(25000)
      IDTAB0=MKTABL(3)
      UNAME0=MKTABL(0)
      CALL ENTES0(AAAAC0,1041)
      CALL ENTES0(AAAAD0,1042)
      CALL ENTES0(AAAAE0,1027)
      CALL ENTES0(AAAAF0,1033)
      CALL ENTES0(AAAAG0,1034)
      CALL ENTES0(AAAAH0,1020)
      CALL ENTES0(AAAAI0,1028)
      CALL ENTES0(AAAAJ0,1025)
      CALL ENTES0(AAAAK0,1016)
      CALL ENTES0(AAAAL0,1018)
      CALL ENTES0(AAAAM0,1048)
      CALL ENTES0(AAAAN0,1035)
      CALL ENTES0(AAAAO0,1046)
      CALL ENTES0(AAAAP0,1012)
      CALL ENTES0(AAAAQ0,1015)
      CALL ENTES0(AAAAR0,1036)
      CALL ENTES0(AAAAS0,1010)
      CALL ENTES0(AAAAT0,1030)
      CALL ENTES0(AAAAU0,1039)
      CALL ENTES0(AAAAV0,1022)
      CALL ENTES0(AAAAW0,1011)
      CALL ENTES0(AAAAX0,1017)
      CALL ENTES0(AAAAY0,1026)
      CALL ENTES0(AAAAZ0,1014)
      CALL ENTES0(AAABA0,1045)
      CALL ENTES0(AAABB0,1037)
      CALL ENTES0(AAABC0,1047)
      CALL ENTES0(AAABD0,1024)
      CALL ENTES0(AAABE0,1019)
      CALL ENTES0(AAABF0,1044)
      CALL ENTES0(AAABG0,1044)
      CALL ENTES0(AAABH0,1029)
      CALL ENTES0(AAABI0,1029)
      CALL ENTES0(AAABJ0,1057)
      CALL ENTES0(AAABK0,1029)
      CALL ENTES0(AAABL0,1044)
      CALL ENTES0(AAABM0,1029)
      CALL ENTES0(AAABN0,1021)
      CALL ENTES0(AAABO0,1043)
      CALL ENTES0(AAABP0,1058)
      CALL ENTES0(AAABQ0,1013)
      CALL ENTES0(AAABR0,1019)
      CALL ENTES0(AAABS0,1029)
      CALL ENTES0(AAABT0,1044)
      CALL ENTES0(AAABU0,1044)
      CALL ENTES0(AAABV0,1009)
      CALL ENTES0(AAABW0,1029)
      CALL ENTES0(AAABX0,1029)
      CALL ENTES0(AAABY0,1038)
      RETURN
      END
      SUBROUTINE ENTES0(KW,VAL)
      INTEGER KW(1)
      INTEGER VAL
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
      INTEGER INFO(3)
      INFO(1)=1
      INFO(2)=VAL
      CALL ENTER(KW,INFO,IDTAB0)
      RETURN
      END
      SUBROUTINE CLEAN0
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
      INTEGER I
      DO 10004 I=1,3
        CALL RMTEMP(OUTFI0(I))
10004 CONTINUE
10005 RETURN
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
C makeunique                     makeu0
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
