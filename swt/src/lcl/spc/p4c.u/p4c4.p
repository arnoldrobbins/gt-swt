        PROCEDURE ASSIGNMENT(FCP: CTP);
          VAR LATTR: ATTR;
        BEGIN SELECTOR(FSYS + [BECOMES],FCP);
          IF SY = BECOMES THEN
            BEGIN
              IF GATTR.TYPTR <> NIL THEN
                IF (GATTR.ACCESS=INDRCT) OR (GATTR.TYPTR^.FORM>POWER) THEN
                  LOADADDRESS;
              LATTR := GATTR;
              INSYMBOL; EXPRESSION(FSYS);
              IF GATTR.TYPTR <> NIL THEN
                IF GATTR.TYPTR^.FORM <= POWER THEN LOAD
                ELSE LOADADDRESS;
              IF (LATTR.TYPTR <> NIL) AND (GATTR.TYPTR <> NIL) THEN
                BEGIN
                  IF COMPTYPES(REALPTR,LATTR.TYPTR) AND
                     COMPTYPES(GATTR.TYPTR,INTPTR) THEN
                    BEGIN GEN0(10(*FLT*));
                      GATTR.TYPTR := REALPTR
                    END;
                  IF COMPTYPES(LATTR.TYPTR,GATTR.TYPTR) THEN
                    CASE LATTR.TYPTR^.FORM OF
                      SCALAR,
                      SUBRANGE: BEGIN
                                  IF CHECKNEEDED(LATTR.TYPTR,GATTR.TYPTR)
                                    THEN CHECKBNDS(LATTR.TYPTR);
                                  STORE(LATTR)
                                END;
                      POINTER: BEGIN
                                 IF PTRCHECKS AND INITCHECKS THEN
                                   GEN2T(45(*CHK*),0,MAXADDR,NILPTR);
                                 STORE(LATTR)
                               END;
                      POWER:   STORE(LATTR);
                      ARRAYS,
                      RECORDS: GEN1(40(*MOV*),LATTR.TYPTR^.SIZE);
                      FILES: ERROR(146)
                    END
                  ELSE ERROR(129)
                END
            END (*SY = BECOMES*)
          ELSE ERROR(51)
        END (*ASSIGNMENT*) ;

        PROCEDURE GOTOSTATEMENT;
          VAR LLP: LBP; FOUND: BOOLEAN; TTOP,TTOP1: DISPRANGE; LLAB: INTEGER;
        BEGIN
          IF SY = INTCONST THEN
            BEGIN
              FOUND := FALSE;
              TTOP := TOP;
            WHILE DISPLAY[TTOP].OCCUR <> BLCK DO TTOP := TTOP - 1;  (*PUG*)
            TTOP1 := TTOP;           (*PUG*)
              REPEAT
                 LLP := DISPLAY[TTOP].FLABEL;     (*PUG*)
                WHILE (LLP <> NIL) AND NOT FOUND DO
                  WITH LLP^ DO
                    IF LABVAL = VAL.IVAL THEN
                      BEGIN FOUND := TRUE;
                        IF TTOP = TTOP1 THEN BEGIN
                          GENUJPXJP(57(*UJP*),LABNAME); GENLABEL(LLAB);
                          PUTLABEL (LLAB) END
                        ELSE (*GOTO LEADS OUT OF PROCEDURE*) ERROR(399)
                      END
                    ELSE LLP := NEXTLAB;
                TTOP := TTOP - 1
              UNTIL FOUND OR (TTOP <= 0);
              IF NOT FOUND THEN ERROR(167);
              INSYMBOL
            END
          ELSE ERROR(15)
        END (*GOTOSTATEMENT*) ;

        PROCEDURE COMPOUNDSTATEMENT;
        BEGIN
          REPEAT
            REPEAT STATEMENT(FSYS + [SEMICOLON,ENDSY])
            UNTIL NOT (SY IN STATBEGSYS);
            TEST := SY <> SEMICOLON;
            IF NOT TEST THEN INSYMBOL
          UNTIL TEST;
          IF SY = ENDSY THEN BEGIN
             BEGINLEVEL := BEGINLEVEL - 1; INSYMBOL END
          ELSE ERROR (13);
        END (*COMPOUNDSTATEMENET*) ;

        PROCEDURE IFSTATEMENT;
          VAR LCIX1,LCIX2: INTEGER;
        BEGIN EXPRESSION(FSYS + [THENSY]);
          GENLABEL(LCIX1); GENFJP(LCIX1);
          IF SY = THENSY THEN INSYMBOL ELSE ERROR(52);
          STATEMENT(FSYS + [ELSESY]);
          IF SY = ELSESY THEN
            BEGIN GENLABEL(LCIX2); GENUJPXJP(57(*UJP*),LCIX2);
              PUTLABEL(LCIX1);
              INSYMBOL; STATEMENT(FSYS);
              PUTLABEL(LCIX2)
            END
          ELSE PUTLABEL(LCIX1)
        END (*IFSTATEMENT*) ;

        PROCEDURE CASESTATEMENT;
          LABEL 1;
          TYPE CIP = ^CASEINFO;
               CASEINFO = PACKED
                          RECORD NEXT: CIP;
                            CSSTART: INTEGER;
                            CSLAB: INTEGER
                          END;
          VAR LSP,LSP1: STP; FSTPTR,LPT1,LPT2,LPT3: CIP; LVAL: VALU;
              LADDR, LCIX, LCIX1, LMIN, LMAX: INTEGER;
        BEGIN EXPRESSION(FSYS + [OFSY,COMMA,COLON]);
          LOAD;
          LSP := GATTR.TYPTR;
          IF LSP <> NIL THEN
            IF (LSP^.FORM > SUBRANGE) OR (LSP = REALPTR) THEN
             BEGIN ERROR(144); LSP := NIL END;
           GENLABEL(LCIX);
           GENUJPXJP(57(*UJP*),LCIX);
          IF SY = OFSY THEN INSYMBOL ELSE ERROR(8);
          FSTPTR := NIL; GENLABEL(LADDR);
          REPEAT
            LPT3 := NIL; GENLABEL(LCIX1);
            IF NOT(SY IN [SEMICOLON,ENDSY]) THEN
            BEGIN
            REPEAT CONSTANT(FSYS + [COMMA,COLON],LSP1,LVAL);
              IF LSP <> NIL THEN
                IF COMPTYPES(LSP,LSP1) THEN
                  BEGIN LPT1 := FSTPTR; LPT2 := NIL;
                    WHILE LPT1 <> NIL DO
                      WITH LPT1^ DO
                        BEGIN
                          IF CSLAB <= LVAL.IVAL THEN
                            BEGIN IF CSLAB = LVAL.IVAL THEN ERROR(156);
                              GOTO 1
                            END;
                          LPT2 := LPT1; LPT1 := NEXT
                        END;
        1:          NEW(LPT3);
                    WITH LPT3^ DO
                      BEGIN NEXT := LPT1; CSLAB := LVAL.IVAL;
                        CSSTART := LCIX1
                      END;
                    IF LPT2 = NIL THEN FSTPTR := LPT3
                    ELSE LPT2^.NEXT := LPT3
                  END
                ELSE ERROR(147);
              TEST := SY <> COMMA;
              IF NOT TEST THEN INSYMBOL
            UNTIL TEST;
            IF SY = COLON THEN INSYMBOL ELSE ERROR(5);
            PUTLABEL(LCIX1);
            REPEAT STATEMENT(FSYS + [SEMICOLON])
            UNTIL NOT (SY IN STATBEGSYS);
            IF LPT3 <> NIL THEN
              GENUJPXJP(57(*UJP*),LADDR);
            END;
            TEST := SY <> SEMICOLON;
            IF NOT TEST THEN INSYMBOL
          UNTIL TEST;
          PUTLABEL(LCIX);
          IF FSTPTR <> NIL THEN
            BEGIN LMAX := FSTPTR^.CSLAB;
              (*REVERSE POINTERS*)
              LPT1 := FSTPTR; FSTPTR := NIL;
              REPEAT LPT2 := LPT1^.NEXT; LPT1^.NEXT := FSTPTR;
                FSTPTR := LPT1; LPT1 := LPT2
              UNTIL LPT1 = NIL;
              LMIN := FSTPTR^.CSLAB;
              IF LMAX - LMIN < CIXMAX THEN
                BEGIN
                  GEN2T(45(*CHK*),LMIN,LMAX,INTPTR);
                  GEN1T(51(*LDC*),LMIN,INTPTR); GEN0(21(*SBI*)); GENLABEL(LCIX);
                  GENUJPXJP(44(*XJP*),LCIX); PUTLABEL(LCIX);
                  REPEAT
                    WITH FSTPTR^ DO
                      BEGIN
                       IF PRCODE THEN BEGIN
                        WHILE CSLAB > LMIN DO
                           BEGIN GENLABEL(LCIX);
                                WRITELN(PRR,LCIX:5,' GOTO 99998');
                             LMIN := LMIN+1; IC := IC + 1
                           END;
                        GENLABEL(LCIX);
                        WRITELN (PRR, LCIX:5, ' GOTO ', CSSTART:1);
                       LMIN := LMIN + 1; IC := IC + 1 END;
                        FSTPTR := NEXT
                      END
                  UNTIL FSTPTR = NIL;
                  PUTLABEL(LADDR)
                END
              ELSE ERROR(157)
            END;
            IF SY = ENDSY THEN INSYMBOL ELSE ERROR(13)
        END (*CASESTATEMENT*) ;

        PROCEDURE PUTLINENO;

        (* Prints the line numbers of corresponding source code *)
        (* lines preceding blocks of Fortran code generated. *)

        BEGIN
        IF LASTLINENO <> LINECOUNT THEN BEGIN
           WRITELN (PRR, ' ':6, 'LINENO = ', LINECOUNT:1);
           IC := IC + 1;
           LASTLINENO := LINECOUNT;
           END
        END (* PUTLINENO *);

        PROCEDURE REPEATSTATEMENT;
          VAR LADDR: INTEGER;
        BEGIN GENLABEL(LADDR); PUTLABEL(LADDR);
          REPEAT STATEMENT(FSYS + [SEMICOLON,UNTILSY]);
            IF SY IN STATBEGSYS THEN ERROR(14)
          UNTIL NOT(SY IN STATBEGSYS);
          WHILE SY = SEMICOLON DO
            BEGIN INSYMBOL;
              REPEAT STATEMENT(FSYS + [SEMICOLON,UNTILSY]);
                IF SY IN STATBEGSYS THEN ERROR(14)
              UNTIL NOT (SY IN STATBEGSYS);
            END;
          IF SY = UNTILSY THEN
            BEGIN INSYMBOL;
            PUTLINENO;
            EXPRESSION(FSYS); GENFJP(LADDR)
            END
          ELSE ERROR(53)
        END (*REPEATSTATEMENT*) ;

        PROCEDURE WHILESTATEMENT;
          VAR LADDR, LCIX: INTEGER;
        BEGIN GENLABEL(LADDR); PUTLABEL(LADDR);
          WRITELN (PRR, ' ':6, 'LINENO = ', LINECOUNT:1); IC := IC + 1;
          EXPRESSION(FSYS + [DOSY]); GENLABEL(LCIX); GENFJP(LCIX);
          IF SY = DOSY THEN INSYMBOL ELSE ERROR(54);
          STATEMENT(FSYS); GENUJPXJP(57(*UJP*),LADDR); PUTLABEL(LCIX)
        END (*WHILESTATEMENT*) ;

        PROCEDURE FORSTATEMENT;
          VAR LATTR: ATTR; LSP: STP;  LSY: SYMBOL;
              LCIX, LADDR: INTEGER;
                    LLC: ADDRRANGE;
        BEGIN LLC := LC;
          WITH LATTR DO
            BEGIN TYPTR := NIL; KIND := VARBL;
              ACCESS := DRCT; VLEVEL := LEVEL; DPLMT := 0
            END;
          IF SY = IDENT THEN
            BEGIN SEARCHID([VARS],LCP);
              WITH LCP^, LATTR DO
                BEGIN TYPTR := IDTYPE; KIND := VARBL;
                  IF VKIND = ACTUAL THEN
                    BEGIN ACCESS := DRCT; VLEVEL := VLEV;
                      DPLMT := VADDR
                    END
                  ELSE BEGIN ERROR(155); TYPTR := NIL END
                END;
              IF LATTR.TYPTR <> NIL THEN
                IF (LATTR.TYPTR^.FORM > SUBRANGE)
                   OR COMPTYPES(REALPTR,LATTR.TYPTR) THEN
                  BEGIN ERROR(143); LATTR.TYPTR := NIL END;
              INSYMBOL
            END
          ELSE
            BEGIN ERROR(2); SKIP(FSYS + [BECOMES,TOSY,DOWNTOSY,DOSY]) END;
          IF SY = BECOMES THEN
            BEGIN INSYMBOL; EXPRESSION(FSYS + [TOSY,DOWNTOSY,DOSY]);
              IF GATTR.TYPTR <> NIL THEN
                  IF GATTR.TYPTR^.FORM > SUBRANGE THEN ERROR(144)
                  ELSE
                    IF COMPTYPES(LATTR.TYPTR,GATTR.TYPTR) THEN
                      BEGIN LOAD; STORE(LATTR) END
                    ELSE ERROR(145)
            END
          ELSE
            BEGIN ERROR(51); SKIP(FSYS + [TOSY,DOWNTOSY,DOSY]) END;
          IF SY IN [TOSY,DOWNTOSY] THEN
            BEGIN LSY := SY; INSYMBOL; EXPRESSION(FSYS + [DOSY]);
              IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR^.FORM > SUBRANGE THEN ERROR(144)
                ELSE
                  IF COMPTYPES(LATTR.TYPTR,GATTR.TYPTR) THEN
                    BEGIN LOAD;
                      GEN2T(56(*STR*),0,LC,GATTR.TYPTR);
                      GENLABEL(LADDR); PUTLABEL(LADDR);
                      GATTR := LATTR; LOAD;
                      GEN2T(54(*LOD*),0,LC,GATTR.TYPTR);
                      LC := LC + GATTR.TYPTR^.SIZE;
                      IF LC > LCMAX THEN LCMAX := LC;
                      IF LSY = TOSY THEN GEN1 (52 (*LEQ*), 1)
                      ELSE GEN1 (48 (*GEQ*), 1);
                    END
                  ELSE ERROR(145)
            END
          ELSE BEGIN ERROR(55); SKIP(FSYS + [DOSY]) END;
          GENLABEL(LCIX); GENUJPXJP(33(*FJP*),LCIX);
          IF SY = DOSY THEN INSYMBOL ELSE ERROR(54);
          STATEMENT(FSYS);
          GATTR := LATTR; LOAD;
          IF LSY=TOSY THEN GEN1T(34(*INC*),1,GATTR.TYPTR)
          ELSE  GEN1T(31(*DEC*),1,GATTR.TYPTR);
          STORE(LATTR); GENUJPXJP(57(*UJP*),LADDR); PUTLABEL(LCIX);
          LC := LLC;
        END (*FORSTATEMENT*) ;


        PROCEDURE WITHSTATEMENT;
          VAR LCP: CTP; LCNT1: DISPRANGE; LLC: ADDRRANGE;
        BEGIN LCNT1 := 0; LLC := LC;
          REPEAT
            IF SY = IDENT THEN
              BEGIN SEARCHID([VARS,FIELD],LCP); INSYMBOL END
            ELSE BEGIN ERROR(2); LCP := UVARPTR END;
            SELECTOR(FSYS + [COMMA,DOSY],LCP);
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR^.FORM = RECORDS THEN
                IF TOP < DISPLIMIT THEN
                  BEGIN TOP := TOP + 1; LCNT1 := LCNT1 + 1;
                    WITH DISPLAY[TOP] DO
                      BEGIN FNAME := GATTR.TYPTR^.FSTFLD;
                        FLABEL := NIL
                      END;
                    IF GATTR.ACCESS = DRCT THEN
                      WITH DISPLAY[TOP] DO
                        BEGIN OCCUR := CREC; CLEV := GATTR.VLEVEL;
                          CDSPL := GATTR.DPLMT
                        END
                    ELSE
                      BEGIN LOADADDRESS;
                        ALIGN(NILPTR,LC);
                        GEN2T(56(*STR*),0,LC,NILPTR);
                        WITH DISPLAY[TOP] DO
                          BEGIN OCCUR := VREC; VDSPL := LC END;
                        LC := LC+PTRSIZE;
                        IF LC > LCMAX THEN LCMAX := LC
                      END
                  END
                ELSE ERROR(250)
              ELSE ERROR(140);
            TEST := SY <> COMMA;
            IF NOT TEST THEN INSYMBOL
          UNTIL TEST;
          IF SY = DOSY THEN INSYMBOL ELSE ERROR(54);
          STATEMENT(FSYS);
          TOP := TOP-LCNT1; LC := LLC;
        END (*WITHSTATEMENT*) ;

      BEGIN (*STATEMENT*)
        FILELOAD := TRUE; (* indicates file address has been loaded *)
        (* this value is set to FALSE initially by those procedures *)
        (* which require the use of a file variable.  It is used to *)
        (* tell procedure SELECTOR whether the address of a file    *)
        (* variable must be loaded onto the stack at that time.     *)
        IF SY = INTCONST THEN (*LABEL*)
          BEGIN LLP := DISPLAY[LEVEL].FLABEL;     (*PUG*)
            WHILE LLP <> NIL DO
              WITH LLP^ DO
                IF LABVAL = VAL.IVAL THEN
                  BEGIN IF DEFINED THEN ERROR(165);
                    PUTLABEL(LABNAME); DEFINED := TRUE;
                    GOTO 1
                  END
                ELSE LLP := NEXTLAB;
            ERROR(167);
      1:    INSYMBOL;
            IF SY = COLON THEN INSYMBOL ELSE ERROR(5)
          END;
        IF NOT (SY IN FSYS + [IDENT]) THEN
          BEGIN ERROR(6); SKIP(FSYS) END;
        IF SY IN STATBEGSYS + [IDENT] THEN
          BEGIN
            PUTLINENO;
            CASE SY OF
              IDENT:    BEGIN SEARCHID([VARS,FIELD,FUNC,PROC],LCP); INSYMBOL;
                          IF LCP^.KLASS = PROC THEN CALL(FSYS,LCP)
                          ELSE ASSIGNMENT(LCP)
                        END;
              BEGINSY:  BEGIN BEGINLEVEL := BEGINLEVEL + 1;
                 INSYMBOL; COMPOUNDSTATEMENT END;
              GOTOSY:   BEGIN INSYMBOL; GOTOSTATEMENT END;
              IFSY:     BEGIN INSYMBOL; IFSTATEMENT END;
              CASESY:   BEGIN INSYMBOL; CASESTATEMENT END;
              WHILESY:  BEGIN INSYMBOL; WHILESTATEMENT END;
              REPEATSY: BEGIN INSYMBOL; REPEATSTATEMENT END;
              FORSY:    BEGIN INSYMBOL; FORSTATEMENT END;
              WITHSY:   BEGIN INSYMBOL; WITHSTATEMENT END
            END;
            IF NOT (SY IN [SEMICOLON,ENDSY,ELSESY,UNTILSY]) THEN
              BEGIN ERROR(6); SKIP(FSYS) END
          END
      END (*STATEMENT*) ;

    BEGIN (*BODY*)
      IF FPROCP <> NIL THEN BEGIN   (* generate code for subroutine *)
         ENTNAME := FPROCP^.PFNAME;
         IF PRCODE THEN BEGIN
            WRITELN (PRR);
            WRITELN (PRR, ' ':6, 'SUBROUTINE P', ENTNAME:1);
            IC := IC + 2
            END
         END
      ELSE BEGIN                    (* generate code for MAIN program *)
         GENLABEL (ENTNAME);
         IF PRCODE THEN BEGIN
            WRITELN (PRR);
            WRITELN (PRR, ' ':6, 'SUBROUTINE P$MAI', 'N');
            IC := IC + 2
            END
         END;
      IF FORTFUNC <> NIL THEN       (* look for fortran functions at *)
                                      (* this level *)
        WHILE ((FORTFUNC <> NIL) AND (FORTFUNC^.PFLEV = LEVEL)) DO
          BEGIN
          IF PRCODE THEN
            BEGIN
            IF FORTFUNC^.IDTYPE = INTPTR THEN
              WRITELN (PRR, ' ':6, 'INTEGER*4 ', FORTFUNC^.NAME:6)
            ELSE IF FORTFUNC^.IDTYPE = REALPTR THEN
              WRITELN (PRR, ' ':6, 'REAL ', FORTFUNC^.NAME:6);
            IC := IC + 1
            END;
          FORTFUNC := FORTFUNC^.NEXTFFUNC
          END;
      IF PRCODE THEN GENCREG;       (* generate definitions (creg) *)
      TOPNEW := 5; TOPMAX := 5;
      GENLABEL(SEGSIZE); GENLABEL(STACKTOP);
     IF PRCODE THEN BEGIN
        IF TRACEOPT THEN BEGIN
           WRITE (PRR, ' ':6, 'CALL T$TRAC(1,''');
           IF FPROCP <> NIL THEN
              WRITE (PRR, FPROCP^.NAME:8)
           ELSE
              WRITE (PRR, 'OUTER BLOCK');
           WRITELN (PRR, '.'')'); IC := IC + 1
           END;
        WRITELN(PRR,' ':6, 'GOTO ',SEGSIZE:1);
        WRITELN (PRR, '99998 CALL P$UJC'); IC := IC + 2 END;
     PUTLABEL(STACKTOP);
     IF PRCODE THEN BEGIN WRITELN(PRR,' ':6, 'CALL',' P$ENT(1,SG1SIZ)');
        WRITELN(PRR,' ':6, 'CALL',' P$ENT(2,SG2SIZ)'); IC := IC + 2 END;
     TMPTR := DISPLAY[TOP].FFILE;
     WHILE TMPTR <> NIL DO (* initialize all files for this level *)
       BEGIN IC := IC + 2;
       IF TMPTR^.FLEV <= 1 THEN GEN1(37(*LAO*),TMPTR^.FADDR)
       ELSE GEN2(50(*LDA*),LEVEL-TMPTR^.FLEV,TMPTR^.FADDR);
       GEN0(65(*INF*));
       TMPTR := TMPTR^.LNK
       END;
     IF FPROCP <> NIL THEN (*COPY MULTIPLE VALUES INTO LOACAL CELLS*)
        BEGIN LLC1 := LCAFTERMARKSTACK;
          LCP := FPROCP^.NEXT;
          WHILE LCP <> NIL DO
            WITH LCP^ DO
              BEGIN
                IF KLASS = VARS THEN
                  IF IDTYPE <> NIL THEN
                    IF (VKIND=ACTUAL) AND (IDTYPE^.FORM>POWER) THEN
                      BEGIN
                        GEN2(50(*LDA*),0,VADDR);
                        GEN2T(54(*LOD*),0,LLC1,NILPTR);
                        GEN1(40(*MOV*),IDTYPE^.SIZE);
                        LLC1 := LLC1 + PTRSIZE
                      END
                    ELSE LLC1 := LLC1 + IDTYPE^.SIZE;
                LCP := LCP^.NEXT;
              END;
        END;
      LCMAX := LC;
      REPEAT
        REPEAT STATEMENT(FSYS + [SEMICOLON,ENDSY])
        UNTIL NOT (SY IN STATBEGSYS);
        TEST := SY <> SEMICOLON;
        IF NOT TEST THEN INSYMBOL
      UNTIL TEST;
      IF SY = ENDSY THEN BEGIN
         BEGINLEVEL := BEGINLEVEL - 1; INSYMBOL END
      ELSE ERROR (13);
      LLP := DISPLAY[TOP].FLABEL; (*TEST FOR UNDEFINED LABELS*)
      WHILE LLP <> NIL DO
        WITH LLP^ DO
          BEGIN
            IF NOT DEFINED THEN
              BEGIN ERROR(168);
                WRITELN(OUTPUT); WRITELN(OUTPUT,' LABEL ',LABVAL);
               WRITE(OUTPUT,' ':CHCNT+20)
              END;
            LLP := NEXTLAB
          END;
      TMPTR := DISPLAY[TOP].FFILE;
      WHILE TMPTR <> NIL DO
      (* go down open-file list, producing code to close each file *)
        BEGIN
        IF TMPTR^.FLEV <= 1 THEN GEN1(37(*LAO*),TMPTR^.FADDR)
        ELSE GEN2(50(*LDA*),LEVEL-TMPTR^.FLEV,TMPTR^.FADDR);
        IF TMPTR^.TYP THEN GEN0(63(*P$CLS*))
        ELSE BEGIN IC := IC + 1;
          WRITE(PRR, ' ':6, 'CALL', MN[64], '(', TMPTR^.AFLG:1, ',''');
          FOR I := 1 TO 8 DO WRITE(PRR, TMPTR^.FNAME[I]);
          WRITELN(PRR, ';'')')
          END;
        TMPTR := TMPTR^.LNK
        END;
      DISPLAY[TOP].FFILE := NIL;
      IF FPROCP <> NIL THEN       (* generate return from routine *)
        BEGIN
          IF FPROCP^.IDTYPE = NIL THEN GEN1(42(*RET*),0)
              ELSE GEN1(42(*RET*), 1);
          ALIGN(PARMPTR,LCMAX);
          IF PRCODE THEN BEGIN
              IF TRACEOPT THEN BEGIN
                 WRITELN (PRR, ' ':6, 'CALL T$TRAC(2,0)');
                 IC := IC + 1
                 END;
              WRITELN (PRR, ' ':6, 'RETURN');
              PUTLABEL(SEGSIZE);
              WRITELN(PRR,' ':6, 'SG1SIZ = ',LCMAX:1);
              WRITELN(PRR,' ':6, 'SG2SIZ = ',TOPMAX:1);
              WRITELN(PRR,' ':6, 'GOTO ',STACKTOP:1);
              WRITELN (PRR, ' ':6, 'END'); IC := IC + 5
            END
        END
      ELSE
        BEGIN GEN1(42(*RET*),0);
          ALIGN(PARMPTR,LCMAX);
          IF PRCODE THEN
            BEGIN
              IF TRACEOPT THEN BEGIN
                WRITELN (PRR, ' ':6, 'CALL T$TRAC(2,0)');
                IC := IC + 1
                END;
              WRITELN (PRR, ' ':6, 'RETURN');
              PUTLABEL(SEGSIZE);
              WRITELN(PRR,' ':6, 'SG1SIZ = ',LCMAX:1);
              WRITELN(PRR,' ':6, 'SG2SIZ = ',TOPMAX:1);
              WRITELN(PRR,' ':6, 'GOTO ',STACKTOP:1);
              WRITELN(PRR,' ':6, 'END'); IC := IC + 5
            END;
          SAVEID := ID;
          WHILE FEXTFILEP <> NIL DO
            BEGIN FILDEC := TRUE;
              WITH FEXTFILEP^ DO
                BEGIN ID := FILENAME; PRTERR := FALSE;
                SEARCHID([VARS],LLCP);
                IF LLCP = NIL THEN FILDEC := FALSE
                ELSE IF LLCP^.IDTYPE = NIL THEN FILDEC := FALSE
                ELSE IF LLCP^.IDTYPE^.FORM <> FILES THEN FILDEC := FALSE;
                IF NOT FILDEC THEN
                  BEGIN WRITELN(OUTPUT);
                  WRITELN(OUTPUT,' *****  ','UNDECLARED ','EXTERNAL ',
                       'FILE',FEXTFILEP^.FILENAME:9);
                  WRITE(OUTPUT,' ':CHCNT+20)
                  END
                END;
              FEXTFILEP := FEXTFILEP^.NEXTFILE
            END;
          ID := SAVEID
        END;
    END (*BODY*) ;

  BEGIN (*BLOCK*)
    DP := TRUE;
    REPEAT
      IF SY = LABELSY THEN
        BEGIN INSYMBOL; LABELDECLARATION END;
      IF SY = CONSTSY THEN
        BEGIN INSYMBOL; CONSTDECLARATION END;
      IF SY = TYPESY THEN
        BEGIN INSYMBOL; TYPEDECLARATION END;
      IF SY = VARSY THEN
        BEGIN INSYMBOL; VARDECLARATION END;
      WHILE SY IN [PROCSY,FUNCSY] DO
        BEGIN LSY := SY; INSYMBOL; PROCDECLARATION(LSY) END;
      IF SY <> BEGINSY THEN

        BEGIN ERROR (18); SKIP (FSYS) END
    UNTIL (SY IN STATBEGSYS) OR EOF(INPUT);
    DP := FALSE;
    IF SY = BEGINSY THEN BEGIN
       BEGINLEVEL := BEGINLEVEL + 1; INSYMBOL END
    ELSE ERROR (17);
    REPEAT BODY(FSYS + [CASESY]);
      IF SY <> FSY THEN
        BEGIN ERROR(6); SKIP(FSYS) END
    UNTIL ((SY = FSY) OR (SY IN BLOCKBEGSYS)) OR EOF(INPUT);
  END (*BLOCK*) ;

  PROCEDURE PROGRAMME(FSYS:SETOFSYS);
    (* parses program heading, calls BLOCK repeatedly *)
    VAR EXTFP:EXTFILEP;
  BEGIN
    IF SY = PROGSY THEN
      BEGIN INSYMBOL; IF SY <> IDENT THEN ERROR(2); INSYMBOL;
        IF NOT (SY IN [LPARENT,SEMICOLON]) THEN ERROR(14);
        IF SY = LPARENT  THEN
          BEGIN
            REPEAT INSYMBOL;
              IF SY = IDENT THEN
                BEGIN
                  IF ID = 'INPUT   ' THEN INPFLG := TRUE
                  ELSE IF ID = 'OUTPUT  ' THEN OUTFLG := TRUE
                  ELSE IF ID = 'PRR     ' THEN PRRFLG := TRUE
                  ELSE IF ID = 'KEYBOARD' THEN KBDFLG := TRUE
                  ELSE BEGIN NEW(EXTFP);
                    EXTFP^.FILENAME := ID;
                    EXTFP^.NEXTFILE := FEXTFILEP;
                    FEXTFILEP := EXTFP
                    END;
                  INSYMBOL;
                  IF NOT (SY IN [COMMA,RPARENT]) THEN ERROR(20)
                END
              ELSE ERROR(2)
            UNTIL SY <> COMMA;
            IF SY <> RPARENT THEN ERROR(4);
            INSYMBOL
          END;
        IF SY <> SEMICOLON THEN ERROR(14)
        ELSE INSYMBOL;
      END;
    REPEAT BLOCK(FSYS,PERIOD,NIL);
      IF SY <> PERIOD THEN ERROR(21)
    UNTIL (SY = PERIOD) OR EOF(INPUT);
    IF LIST THEN WRITELN(OUTPUT);      (*PUG*)
    IF ERRINX > 0 THEN                 (*PUG*)
     BEGIN LIST := FALSE; ENDOFLINE END    (*PUG*)
  END (*PROGRAMME*) ;


  PROCEDURE STDNAMES;
  BEGIN
    NA[ 1] := 'FALSE   '; NA[ 2] := 'TRUE    '; NA[ 3] := 'INPUT   ';
    NA[ 4] := 'OUTPUT  '; NA[ 5] := 'GET     '; NA[ 6] := 'PUT     ';
    NA[ 7] := 'RESET   '; NA[ 8] := 'REWRITE '; NA[ 9] := 'READ    ';
    NA[10] := 'WRITE   '; NA[11] := 'PACK    '; NA[12] := 'UNPACK  ';
    NA[13] := 'NEW     '; NA[14] := 'RELEASE '; NA[15] := 'READLN  ';
    NA[16] := 'WRITELN '; NA[17] := 'PAGE    '; NA[18] := 'ABS     ';
    NA[19] := 'SQR     '; NA[20] := 'TRUNC   '; NA[21] := 'ODD     ';
    NA[22] := 'ORD     '; NA[23] := 'CHR     '; NA[24] := 'PRED    ';
    NA[25] := 'SUCC    '; NA[26] := 'EOF     '; NA[27] := 'EOLN    ';
    NA[28] := 'SIN     '; NA[29] := 'COS     '; NA[30] := 'EXP     ';
    NA[31] := 'SQRT    '; NA[32] := 'LN      '; NA[33] := 'ARCTAN  ';
    NA[34] := 'KEYBOARD'; NA[35] := 'PRR     '; NA[36] := 'MARK    ';
    NA[37] := 'TIME    '; NA[38] := 'DATE    ';
  END (*STDNAMES*) ;

  PROCEDURE ENTERSTDTYPES;
    (* allocates a STRUCTURE node which details structure form *)
    (* for each standard type *)
    VAR SP: STP;
  BEGIN                                                  (*TYPE UNDERLIEING:*)
                                                         (*******************)

    NEW(INTPTR,SCALAR,STANDARD);                              (*INTEGER*)
    WITH INTPTR^ DO
      BEGIN SIZE := INTSIZE; FORM := SCALAR; SCALKIND := STANDARD END;
    NEW(REALPTR,SCALAR,STANDARD);                             (*REAL*)
    WITH REALPTR^ DO
      BEGIN SIZE := REALSIZE; FORM := SCALAR; SCALKIND := STANDARD END;
    NEW(CHARPTR,SCALAR,STANDARD);                             (*CHAR*)
    WITH CHARPTR^ DO
      BEGIN SIZE := CHARSIZE; FORM := SCALAR; SCALKIND := STANDARD END;
    NEW(BOOLPTR,SCALAR,DECLARED);                             (*BOOLEAN*)
    WITH BOOLPTR^ DO
      BEGIN SIZE := BOOLSIZE; FORM := SCALAR; SCALKIND := DECLARED END;
    NEW(NILPTR,POINTER);                                      (*NIL*)
    WITH NILPTR^ DO
      BEGIN ELTYPE := NIL; SIZE := PTRSIZE; FORM := POINTER END;
    NEW(PARMPTR,SCALAR,STANDARD); (*FOR ALIGNMENT OF PARAMETERS*)
    WITH PARMPTR^ DO
      BEGIN SIZE := PARMSIZE; FORM := SCALAR; SCALKIND := STANDARD END ;
    NEW(TEXTPTR,FILES);                                       (*TEXT*)
    WITH TEXTPTR^ DO
      BEGIN FILTYPE := CHARPTR; SIZE := CHARSIZE+1; FORM := FILES END
  END (*ENTERSTDTYPES*) ;

  PROCEDURE ENTSTDNAMES;
    VAR CP,CP1: CTP; I: INTEGER;
  BEGIN                                                       (*NAME:*)
                                                              (*******)

    NEW(CP,TYPES);                                            (*INTEGER*)
    WITH CP^ DO
      BEGIN NAME := 'INTEGER '; IDTYPE := INTPTR; KLASS := TYPES END;
    ENTERID(CP);
    NEW(CP,TYPES);                                            (*REAL*)
    WITH CP^ DO
      BEGIN NAME := 'REAL    '; IDTYPE := REALPTR; KLASS := TYPES END;
    ENTERID(CP);
    NEW(CP,TYPES);                                            (*CHAR*)
    WITH CP^ DO
      BEGIN NAME := 'CHAR    '; IDTYPE := CHARPTR; KLASS := TYPES END;
    ENTERID(CP);
    NEW(CP,TYPES);                                            (*BOOLEAN*)
    WITH CP^ DO
      BEGIN NAME := 'BOOLEAN '; IDTYPE := BOOLPTR; KLASS := TYPES END;
    ENTERID(CP);
    NEW(CP,TYPES);                                            (*TEXT*)
    WITH CP^ DO
      BEGIN NAME := 'TEXT    '; IDTYPE := TEXTPTR; KLASS := TYPES END;
    ENTERID(CP);
    CP1 := NIL;
    FOR I := 1 TO 2 DO
      BEGIN NEW(CP,KONST);                                    (*FALSE,TRUE*)
        WITH CP^ DO
          BEGIN NAME := NA[I]; IDTYPE := BOOLPTR;
            NEXT := CP1; VALUES.IVAL := I - 1; KLASS := KONST
          END;
        ENTERID(CP); CP1 := CP
      END;
    BOOLPTR^.FCONST := CP;
    NEW(CP,KONST);                                             (*NIL*)
    WITH CP^ DO
      BEGIN NAME := 'NIL     '; IDTYPE := NILPTR;
        NEXT := NIL; VALUES.IVAL := 0; KLASS := KONST
      END;
    ENTERID(CP);
    NEW(CP,KONST);                                             (*MAXINT*)
    WITH CP^ DO
      BEGIN NAME := 'MAXINT  '; IDTYPE := INTPTR; KLASS := KONST;
        VALUES.IVAL := MAXINT; NEXT := NIL
      END;
    ENTERID(CP);
    FOR I := 3 TO 4 DO
      BEGIN NEW(CP,VARS);                                     (*INPUT,OUTPUT*)
        WITH CP^ DO
          BEGIN NAME := NA[I]; IDTYPE := TEXTPTR; KLASS := VARS;
            VKIND := ACTUAL; NEXT := NIL; VLEV := 1;
            VADDR := LCAFTERMARKSTACK+(I-3)*CHARMAX*2;
   (* note that two locations are reserved for each textfile *)
          END;
        ENTERID(CP)
      END;
    FOR I := 34 TO 35 DO
      BEGIN NEW(CP,VARS);                                     (*KEYBOARD,PRR FILES*)
         WITH CP^ DO
           BEGIN NAME := NA[I]; IDTYPE := TEXTPTR; KLASS := VARS;
              VKIND := ACTUAL; NEXT := NIL; VLEV := 1;
              VADDR := LCAFTERMARKSTACK+(I-32)*CHARMAX*2;
           END;
         ENTERID(CP)
      END;
    FOR I := 37 TO 38 DO                                      (*TIME,DATE*)
      BEGIN NEW(CP,PROC,STANDARD);
        WITH CP^ DO
          BEGIN NAME := NA[I]; IDTYPE := NIL;
          NEXT := NIL; KEY := I - 22; KLASS := PROC;
          PFDECKIND := STANDARD
          END;
        ENTERID(CP)
      END;
    FOR I := 5 TO 17 DO
      BEGIN NEW(CP,PROC,STANDARD);                         (*GET,PUT,RESET*)
        WITH CP^ DO                                           (*REWRITE,READ*)
          BEGIN NAME := NA[I]; IDTYPE := NIL;                 (*WRITE,PACK*)
            NEXT := NIL; KEY := I - 4;                        (*UNPACK,PACK*)
            KLASS := PROC; PFDECKIND := STANDARD             (*WRITELN,READLN*)
          END;                                                   (*PAGE*)
        ENTERID(CP)
      END;
    NEW(CP,PROC,STANDARD);
    WITH CP^ DO
        BEGIN NAME:=NA[36]; IDTYPE:=NIL;
              NEXT:= NIL; KEY:=14;
              KLASS:=PROC; PFDECKIND:= STANDARD
        END; ENTERID(CP);
    FOR I := 18 TO 27 DO
      BEGIN NEW(CP,FUNC,STANDARD);                         (*ABS,SQR,TRUNC*)
        WITH CP^ DO                                           (*ODD,ORD,CHR*)
          BEGIN NAME := NA[I]; IDTYPE := NIL;              (*PRED,SUCC,EOF*)
            NEXT := NIL; KEY := I - 17;
            KLASS := FUNC; PFDECKIND := STANDARD
          END;
        ENTERID(CP)
      END;
    NEW(CP,VARS);                      (*PARAMETER OF PREDECLARED FUNCTIONS*)
    WITH CP^ DO
      BEGIN NAME := '        '; IDTYPE := REALPTR; KLASS := VARS;
        VKIND := ACTUAL; NEXT := NIL; VLEV := 1; VADDR := 0
      END;
    FOR I := 28 TO 33 DO
      BEGIN NEW(CP1,FUNC,DECLARED,ACTUAL);                    (*SIN,COS,EXP*)
        WITH CP1^ DO                                       (*SQRT,LN,ARCTAN*)
          BEGIN NAME := NA[I]; IDTYPE := REALPTR; NEXT := CP;
            FORWDECL := FALSE; EXTDECL := TRUE; PFLEV := 0; PFNAME := I - 13;
            FORTDECL := FALSE;
            KLASS := FUNC; PFDECKIND := DECLARED; PFKIND := ACTUAL
          END;
        ENTERID(CP1)
      END
  END (*ENTSTDNAMES*) ;

  PROCEDURE ENTERUNDECL;
  BEGIN
    NEW(UTYPPTR,TYPES);
    WITH UTYPPTR^ DO
      BEGIN NAME := '        '; IDTYPE := NIL; KLASS := TYPES END;
    NEW(UCSTPTR,KONST);
    WITH UCSTPTR^ DO
      BEGIN NAME := '        '; IDTYPE := NIL; NEXT := NIL;
        VALUES.IVAL := 0; KLASS := KONST
      END;
    NEW(UVARPTR,VARS);
    WITH UVARPTR^ DO
      BEGIN NAME := '        '; IDTYPE := NIL; VKIND := ACTUAL;
        NEXT := NIL; VLEV := 0; VADDR := 0; KLASS := VARS
      END;
    NEW(UFLDPTR,FIELD);
    WITH UFLDPTR^ DO
      BEGIN NAME := '        '; IDTYPE := NIL; NEXT := NIL; FLDADDR := 0;
        KLASS := FIELD
      END;
    NEW(UPRCPTR,PROC,DECLARED,ACTUAL);
    WITH UPRCPTR^ DO
      BEGIN NAME := '        '; IDTYPE := NIL; FORWDECL := FALSE;
        FORTDECL := FALSE;
        NEXT := NIL; EXTDECL := FALSE; PFLEV := 0; GENLABEL(PFNAME);
        KLASS := PROC; PFDECKIND := DECLARED; PFKIND := ACTUAL
      END;
    NEW(UFCTPTR,FUNC,DECLARED,ACTUAL);
    WITH UFCTPTR^ DO
      BEGIN NAME := '        '; IDTYPE := NIL; NEXT := NIL;
        FORTDECL := FALSE;
        FORWDECL := FALSE; EXTDECL := FALSE; PFLEV := 0; GENLABEL(PFNAME);
        KLASS := FUNC; PFDECKIND := DECLARED; PFKIND := ACTUAL
      END
  END (*ENTERUNDECL*) ;

   PROCEDURE INITSCALARS;
     VAR  I: INTEGER;
   BEGIN
      TRACEOPT := FALSE;              (* compiler options defaults *)
      PRTABLES := FALSE;
      LIST := TRUE;
      PRCODE := TRUE;
      COMPCODE := FALSE;
      RANGECHECKS := TRUE;
      INITCHECKS := FALSE;
      PTRCHECKS := TRUE;
      INPFLG := FALSE; OUTFLG := FALSE; (* file flags *)
      KBDFLG := FALSE; PRRFLG := FALSE;
      STRGINDEX := 0;
      SETINDEX  := 0;
      BEGINLEVEL := 0; LINENUMBER := 0; PAGENUMBER := 0;
      LASTLINENO := 0;
      DP := TRUE; PRTERR := TRUE; ERRINX := 0;
      FWPTR := NIL;
      INTLABEL := 0; FEXTFILEP := NIL;
      LC := LCAFTERMARKSTACK+FILEBUFFER*CHARMAX;
      (* NOTE IN THE ABOVE RESERVATION OF BUFFER STORE FOR 4 TEXT FILES *)
      IC := 1; EOL := TRUE; LINECOUNT := 0;
      CH := ' '; CHCNT := 0;
      ERRSET1 := [ ];
      ERRSET2 := [ ];
      ERRLASTLIN := 0;
      GLOBTESTP := NIL;
      FORTFUNC := NIL;  LASTFFUNC := NIL;
      FOR I := 1 TO 8 DO
        BEGIN THEDATE[I] := ' '; THETIME[I] := ' ' END;
      DATE(THEDATE); TIME(THETIME)
   END; (*INITSCALARS*)


  PROCEDURE INITSETS;
  BEGIN
    CONSTBEGSYS := [ADDOP,INTCONST,REALCONST,STRINGCONST,IDENT];
    SIMPTYPEBEGSYS := [LPARENT] + CONSTBEGSYS;
    TYPEBEGSYS:=[ARROW,PACKEDSY,ARRAYSY,RECORDSY,SETSY,FILESY]+SIMPTYPEBEGSYS;
    TYPEDELS := [ARRAYSY,RECORDSY,SETSY,FILESY];
    BLOCKBEGSYS := [LABELSY,CONSTSY,TYPESY,VARSY,PROCSY,FUNCSY,
                    BEGINSY];
    SELECTSYS := [ARROW,PERIOD,LBRACK];
    FACBEGSYS := [INTCONST,REALCONST,STRINGCONST,IDENT,LPARENT,LBRACK,NOTSY];
    STATBEGSYS := [BEGINSY,GOTOSY,IFSY,WHILESY,REPEATSY,FORSY,WITHSY,
                   CASESY];
  END (*INITSETS*) ;

  PROCEDURE INITTABLES;

    PROCEDURE RESWORDS;
    BEGIN
      RW[ 1] := 'IF      '; RW[ 2] := 'DO      '; RW[ 3] := 'OF      ';
      RW[ 4] := 'TO      '; RW[ 5] := 'IN      '; RW[ 6] := 'OR      ';
      RW[ 7] := 'END     '; RW[ 8] := 'FOR     '; RW[ 9] := 'VAR     ';
      RW[10] := 'DIV     '; RW[11] := 'MOD     '; RW[12] := 'SET     ';
      RW[13] := 'AND     '; RW[14] := 'NOT     '; RW[15] := 'THEN    ';
      RW[16] := 'ELSE    '; RW[17] := 'WITH    '; RW[18] := 'GOTO    ';
      RW[19] := 'CASE    '; RW[20] := 'TYPE    ';
      RW[21] := 'FILE    '; RW[22] := 'BEGIN   ';
      RW[23] := 'UNTIL   '; RW[24] := 'WHILE   '; RW[25] := 'ARRAY   ';
      RW[26] := 'CONST   '; RW[27] := 'LABEL   ';
      RW[28] := 'REPEAT  '; RW[29] := 'RECORD  '; RW[30] := 'DOWNTO  ';
      RW[31] := 'PACKED  '; RW[32] := 'EXTERN  '; RW[33] := 'FORWARD ';
      RW[34] := 'PROGRAM '; RW[35] := 'FORTRAN ';
      RW[36] := 'FUNCTION'; RW[37] := 'PROCEDUR';
      FRW[1] :=  1; FRW[2] :=  1; FRW[3] :=  7; FRW[4] := 15; FRW[5] := 22;
      FRW[6] := 28; FRW[7] := 33; FRW[8] := 36; FRW[9] := 38;
    END (*RESWORDS*) ;

    PROCEDURE ERRMSGS;
      VAR I : 1..400;

    BEGIN
      FOR I := 1 TO 400 DO
        EM[I] := '                                                  ';
      EM[1] := 'error in simple type                              ';
      EM[2] := 'identifier expected                               ';
      EM[3] := '''program'' expected                                ';
      EM[4] := ''')'' expected                                      ';
      EM[5] := ''':'' expected                                      ';
      EM[6] := 'illegal symbol                                    ';
      EM[7] := 'error in parameter list                           ';
      EM[8] := '''of'' expected                                     ';
      EM[9] := '''('' expected                                      ';
      EM[10] := 'error in type                                     ';
      EM[11] := '''['' expected                                      ';
      EM[12] := ''']'' expected                                      ';
      EM[13] := '''end'' expected                                    ';
      EM[14] := ''';'' expected                                      ';
      EM[15] := 'integer expected                                  ';
      EM[16] := '''='' expected                                      ';
      EM[17] := '''begin'' expected                                  ';
      EM[18] := 'error in declaration part                         ';
      EM[19] := 'error in field-list                               ';
      EM[20] := ''','' expected                                      ';
      EM[21] := '''*'' expected                                      ';
      EM[50] := 'error in constant                                 ';
      EM[51] := ''':='' expected                                     ';
      EM[52] := '''then'' expected                                   ';
      EM[53] := '''until'' expected                                  ';
      EM[54] := '''do'' expected                                     ';
      EM[55] := '''to''/''downto'' expected                            ';
      EM[56] := '''if'' expected                                     ';
      EM[57] := '''file'' expected                                   ';
      EM[58] := 'error in factor                                   ';
      EM[59] := 'error in variable                                 ';
      EM[60] := ''':'' or ''/'' expected                               ';
      EM[101] := 'identifier declared twice                         ';
      EM[102] := 'low bound exceeds highbound                       ';
      EM[103] := 'identifier is not of appropriate class            ';
      EM[104] := 'identifier not declared                           ';
      EM[105] := 'sign not allowed                                  ';
      EM[106] := 'number expected                                   ';
      EM[107] := 'incompatible subrange types                       ';
      EM[108] := 'file not allowed here                             ';
      EM[109] := 'type must not be real                             ';
      EM[110] := 'tagfield type must be scalar or subrange          ';
      EM[111] := 'incompatible with tagfield type                   ';
      EM[112] := 'index type must not be real                       ';
      EM[113] := 'index type must be scalar or subrange             ';
      EM[114] := 'base type must not be real                        ';
      EM[115] := 'base type must be scalar or subrange              ';
      EM[116] := 'error in type of standard procedure parameter     ';
      EM[117] := 'unsatisfied forward reference                     ';
      EM[118] := 'forward reference type id in variable decln       ';
      EM[119] := 'fwd declared; repetition of param list illegal    ';
      EM[120] := 'func result type must be scalar, subrange or ptr  ';
      EM[121] := 'file value parameter not allowed                  ';
      EM[122] := 'fwd declared function; cannot repeat result type  ';
      EM[123] := 'missing result type in function declaration       ';
      EM[124] := 'F-format for real only                            ';
      EM[125] := 'error in type of standard function parameter      ';
      EM[126] := 'number of params does not agree with declaration  ';
      EM[127] := 'illegal parameter substitution                    ';
      EM[128] := 'result type of param func does not agree with decl';
      EM[129] := 'type conflict of operands                         ';
      EM[130] := 'expression is not of set type                     ';
      EM[131] := 'tests on equality allowed only                    ';
      EM[132] := 'strict inclusion not allowed                      ';
      EM[133] := 'file comparison not allowed                       ';
      EM[134] := 'illegal type of operand(s)                        ';
      EM[135] := 'type of operand must be Boolean                   ';
      EM[136] := 'set element type must be scalar or subrange       ';
      EM[137] := 'set element types not compatible                  ';
      EM[138] := 'type of variable is not array                     ';
      EM[139] := 'index type is not compatible with declaration     ';
      EM[140] := 'type of variable is not record                    ';
      EM[141] := 'type of variable must be file or pointer          ';
      EM[142] := 'illegal parameter substitution                    ';
      EM[143] := 'illegal type of loop control variable             ';
      EM[144] := 'illegal type of expression                        ';
      EM[145] := 'type conflict                                     ';
      EM[146] := 'assignment of files not allowed                   ';
      EM[147] := 'label type incompatible with selecting expr       ';
      EM[148] := 'subrange bounds must be scalar                    ';
      EM[149] := 'index type must not be integer                    ';
      EM[150] := 'assignment to standard function is not allowed    ';
      EM[151] := 'assignment to formal function is not allowed      ';
      EM[152] := 'no such field in this record                      ';
      EM[153] := 'type error in read                                ';
      EM[154] := 'actual parameter must be a variable               ';
      EM[155] := 'control variable can''t be formal or non local     ';
      EM[156] := 'multidefined case label                           ';
      EM[157] := 'too many cases in case statement                  ';
      EM[158] := 'missing corresponding variant declaration         ';
      EM[159] := 'real or string tagfields not allowed              ';
      EM[160] := 'previous declaration was not forward              ';
      EM[161] := 'again forward declared                            ';
      EM[162] := 'parameter size must be constant                   ';
      EM[163] := 'missing variant in declaration                    ';
      EM[164] := 'substitution of standard proc/func not allowed    ';
      EM[165] := 'multidefined label                                ';
      EM[166] := 'multideclared label                               ';
      EM[167] := 'undeclared label                                  ';
      EM[168] := 'undefined label                                   ';
      EM[169] := 'error in base set                                 ';
      EM[170] := 'value parameter expected                          ';
      EM[171] := 'standard file was redeclared                      ';
      EM[172] := 'undeclared external file                          ';
      EM[173] := 'Fortran procedure or function expected            ';
      EM[174] := 'Pascal procedure or function expected             ';
      EM[175] := 'missing file ''input'' in program heading           ';
      EM[176] := 'missing file ''output'' in program heading          ';
      EM[177] := 'assgt to function identifier not allowed here     ';
      EM[178] := 'multidefined record variant                       ';
      EM[179] := 'X-opt of actual proc/func does not match decl     ';
      EM[180] := 'control variable must not be formal               ';
      EM[181] := 'constant part of address out of range             ';
      EM[182] := 'file must be file of char                         ';
      EM[183] := 'pathname linkage not allowed for temporary files  ';
      EM[201] := 'error in real constant: digit expected            ';
      EM[202] := 'string constant must not exceed source line       ';
      EM[203] := 'integer constant exceeds range                    ';
      EM[204] := '8 or 9 in octal number                            ';
      EM[205] := 'string constant length must not be zero           ';
      EM[206] := 'integer part of real constant exceeds range       ';
      EM[250] := 'too many nested scopes of identifiers             ';
      EM[251] := 'too many nested procedures and/or functions       ';
      EM[252] := 'too many forward references of procedure entries  ';
      EM[253] := 'procedure too long                                ';
      EM[254] := 'too many long constants in this procedure         ';
      EM[255] := 'too many errors on this source line               ';
      EM[256] := 'too many external references                      ';
      EM[257] := 'too many externals                                ';
      EM[258] := 'too many local files                              ';
      EM[259] := 'expression too complicated                        ';
      EM[260] := 'too many exit labels                              ';
      EM[261] := 'pathname too long                                 ';
      EM[300] := 'division by zero                                  ';
      EM[301] := 'no case provided for this value                   ';
      EM[302] := 'index expression out of bounds                    ';
      EM[303] := 'value to be assigned is out of bounds             ';
      EM[304] := 'element expression out of range                   ';
      EM[350] := 'unknown -- see procedure selector                 ';
      EM[351] := 'unknown -- see recog of string const in insymbol  ';
      EM[352] := 'unknown -- see procedure gentypindicator          ';
      EM[353] := 'unknown -- see procedure store                    ';
      EM[354] := 'reading of packed arrays not implemented          ';
      EM[355] := 'unknown -- see procedure loadaddress              ';
      EM[356] := 'unknown -- see procedure loadaddress              ';
      EM[397] := 'fortran func result type must be integer or real  ';
      EM[398] := 'implementation restriction                        ';
      EM[399] := 'miscellaneous                                     ';
      EM[400] := 'not implemented in this version                   '
    END;   (* error messages *)

    PROCEDURE SYMBOLS;
    BEGIN
      RSY[1] := IFSY; RSY[2] := DOSY; RSY[3] := OFSY; RSY[4] := TOSY;
      RSY[5] := RELOP; RSY[6] := ADDOP; RSY[7] := ENDSY; RSY[8] := FORSY;
      RSY[9] := VARSY; RSY[10] := MULOP; RSY[11] := MULOP; RSY[12] := SETSY;
      RSY[13] := MULOP; RSY[14] := NOTSY; RSY[15] := THENSY;
      RSY[16] := ELSESY; RSY[17] := WITHSY; RSY[18] := GOTOSY;
      RSY[19] := CASESY; RSY[20] := TYPESY;
      RSY[21] := FILESY; RSY[22] := BEGINSY;
      RSY[23] := UNTILSY; RSY[24] := WHILESY; RSY[25] := ARRAYSY;
      RSY[26] := CONSTSY; RSY[27] := LABELSY;
      RSY[28] := REPEATSY; RSY[29] := RECORDSY; RSY[30] := DOWNTOSY;
      RSY[31] := PACKEDSY; RSY[32] := EXTERNSY; RSY[33] := FORWARDSY;
      RSY[34] := PROGSY; RSY[35] := FORTRANSY;
      RSY[36] := FUNCSY; RSY[37] := PROCSY;
      SSY['+'] := ADDOP; SSY['-'] := ADDOP; SSY['*'] := MULOP;
      SSY['/'] := MULOP; SSY['('] := LPARENT; SSY[')'] := RPARENT;
      SSY['$'] := OTHERSY; SSY['='] := RELOP; SSY[' '] := OTHERSY;
      SSY[','] := COMMA; SSY['.'] := PERIOD; SSY[''''] := OTHERSY;
      SSY['['] := LBRACK; SSY[']'] := RBRACK; SSY[':'] := COLON;
      SSY['^'] := ARROW; SSY['{'] := LCURBRK; SSY['}'] := RCURBRK;
      SSY['<'] := RELOP; SSY['>'] := RELOP; SSY['"'] := DQUOTE;
      SSY[';'] := SEMICOLON;
    END (*SYMBOLS*) ;

    PROCEDURE RATORS;
      VAR I: INTEGER; CH: CHAR;
    BEGIN
      FOR I := 1 TO 37 (*NR OF RES WORDS*) DO ROP[I] := NOOP;
      ROP[5] := INOP; ROP[10] := IDIV; ROP[11] := IMOD;
      ROP[6] := OROP; ROP[13] := ANDOP;
      FOR CH := CHR(ORDMINCHAR) TO CHR(ORDMAXCHAR) DO SOP[CH] := NOOP;
      SOP['+'] := PLUS; SOP['-'] := MINUS; SOP['*'] := MUL; SOP['/'] := RDIV;
      SOP['='] := EQOP;
      SOP['<'] := LTOP; SOP['>'] := GTOP;
    END (*RATORS*) ;

    PROCEDURE PROCMNEMONICS;

    (* Standard procedure names *)

    BEGIN
      SNA[ 1]:=' P$GET';SNA[ 2]:=' P$PUT';SNA[ 3]:=' P$RDI';SNA[ 4]:=' P$RDR';
      SNA[ 5]:=' P$RDC';SNA[ 6]:=' P$WRI';SNA[ 7]:=' P$WRO';SNA[ 8]:=' P$WRR';
      SNA[ 9]:=' P$WRC';SNA[10]:=' P$WRS';SNA[11]:=' P$PAK';SNA[12]:=' P$NEW';
      SNA[13]:=' P$RST';SNA[14]:=' P$ELN';SNA[15]:=' P$SIN';SNA[16]:=' P$COS';
      SNA[17]:=' P$EXP';SNA[18]:=' P$SQT';SNA[19]:=' P$LOG';SNA[20]:=' P$ATN';
      SNA[21]:=' P$RLN';SNA[22]:=' P$WLN';SNA[23]:=' P$SAV';SNA[24]:=' P$RES';
      SNA[25]:=' P$RWR';SNA[26]:=' P$PAG';SNA[27]:=' P$BRD';SNA[28]:=' P$BWR';
      SNA[29]:=' P$DAT'
    END (*PROCMNEMONICS*) ;

    PROCEDURE INSTRMNEMONICS;

    (* Interpreter instruction mnemonics (calls) *)

    BEGIN
      MN[0] :=' P$ABI'; MN[1] :=' P$ABR'; MN[2] :=' P$ADI'; MN[3] :=' P$ADR';
      MN[4] :=' P$AND'; MN[5] :=' P$DIF'; MN[6] :=' P$DVI'; MN[7] :=' P$DVR';
      MN[8] :=' P$EOF'; MN[9] :=' P$FLO'; MN[10]:=' P$FLT'; MN[11]:=' P$INN';
      MN[12]:=' P$INT'; MN[13]:=' P$IOR'; MN[14]:=' P$MOD'; MN[15]:=' P$MPI';
      MN[16]:=' P$MPR'; MN[17]:=' P$NGI'; MN[18]:=' P$NGR'; MN[19]:=' P$NOT';
      MN[20]:=' P$ODD'; MN[21]:=' P$SBI'; MN[22]:=' P$SBR'; MN[23]:=' P$SGS';
      MN[24]:=' P$SQI'; MN[25]:=' P$SQR'; MN[26]:=' P$STO'; MN[27]:=' P$TRC';
      MN[28]:=' P$UNI'; MN[29]:=' P$STP'; MN[30]:=' P$CSP'; MN[31]:=' P$DEC';
      MN[32]:=' P$ENT'; MN[33]:=' P$FJP'; MN[34]:=' P$INC'; MN[35]:=' P$IND';
      MN[36]:=' P$IXA'; MN[37]:=' P$LAO'; MN[38]:=' P$LCA'; MN[39]:=' P$LDO';
      MN[40]:=' P$MOV'; MN[41]:=' P$MST'; MN[42]:=' P$RET'; MN[43]:=' P$SRO';
      MN[44]:=' P$XJP'; MN[45]:=' P$CHK'; MN[46]:=' P$CUP'; MN[47]:=' P$EQU';
      MN[48]:=' P$GEQ'; MN[49]:=' P$GRT'; MN[50]:=' P$LDA'; MN[51]:=' P$LDC';
      MN[52]:=' P$LEQ'; MN[53]:=' P$LES'; MN[54]:=' P$LOD'; MN[55]:=' P$NEQ';
      MN[56]:=' P$STR'; MN[57]:=' P$UJP'; MN[58]:='      '; MN[59]:=' P$MTS';
      MN[60]:=' P$UJC'; MN[61]:=' P$LPC'; MN[62]:=' P$SPC'; MN[63]:=' P$CLS';
      MN[64]:=' P$REM'; MN[65]:=' P$INF';
    END (*INSTRMNEMONICS*) ;


     PROCEDURE CHARTYPES;
     VAR C : CHAR;
     BEGIN
       FOR C := CHR (ORDMINCHAR) TO CHR (ORDMAXCHAR) DO CHARTP[C] := ILLEGAL;
       FOR C := 'A' TO 'Z' DO CHARTP [C] := LETTER;
       FOR C := 'a' TO 'z' DO CHARTP [C] := LETTER;
       FOR C := '0' TO '9' DO CHARTP [C] := NUMBER;
       CHARTP['_'] := LETTER ; CHARTP['+'] := SPECIAL;
       CHARTP['-'] := SPECIAL; CHARTP['*'] := SPECIAL;
       CHARTP['/'] := SPECIAL; CHARTP['('] := SPECIAL;
       CHARTP[')'] := SPECIAL; CHARTP['$'] := SPECIAL;
       CHARTP['='] := SPECIAL; CHARTP[' '] := SPECIAL;
       CHARTP[','] := SPECIAL; CHARTP['.'] := SPECIAL;
       CHARTP['''']:= SPECIAL; CHARTP['['] := SPECIAL;
       CHARTP[']'] := SPECIAL; CHARTP[':'] := SPECIAL;
       CHARTP['^'] := SPECIAL; CHARTP[';'] := SPECIAL;
       CHARTP['<'] := SPECIAL; CHARTP['>'] := SPECIAL;
       CHARTP['{'] := SPECIAL; CHARTP['}'] := SPECIAL;
       CHARTP['"'] := SPECIAL;

       ORDINT['0'] := 0; ORDINT['1'] := 1; ORDINT['2'] := 2;
       ORDINT['3'] := 3;
       ORDINT['4'] := 4; ORDINT['5'] := 5; ORDINT['6'] := 6;
       ORDINT['7'] := 7; ORDINT['8'] := 8; ORDINT['9'] := 9

     END;

    PROCEDURE INITDX;
    BEGIN
      CDX[ 0] :=  0; CDX[ 1] :=  0; CDX[ 2] := -1; CDX[ 3] := -1;
      CDX[ 4] := -1; CDX[ 5] := -8; CDX[ 6] := -1; CDX[ 7] := -1;
      CDX[ 8] :=  0; CDX[ 9] :=  0; CDX[10] :=  0; CDX[11] := -8;
      CDX[12] := -8; CDX[13] := -1; CDX[14] := -1; CDX[15] := -1;
      CDX[16] := -1; CDX[17] :=  0; CDX[18] :=  0; CDX[19] :=  0;
      CDX[20] :=  0; CDX[21] := -1; CDX[22] := -1; CDX[23] := +7;
      CDX[24] :=  0; CDX[25] :=  0; CDX[26] := -2; CDX[27] :=  0;
      CDX[28] := -8; CDX[29] :=  0; CDX[30] :=  0; CDX[31] :=  0;
      CDX[32] :=  0; CDX[33] := -1; CDX[34] :=  0; CDX[35] :=  0;
      CDX[36] := -1; CDX[37] := +1; CDX[38] := +1; CDX[39] := +1;
      CDX[40] := -2; CDX[41] :=  0; CDX[42] :=  0; CDX[43] := -1;
      CDX[44] := -1; CDX[45] :=  0; CDX[46] :=  0; CDX[47] := -1;
      CDX[48] := -1; CDX[49] := -1; CDX[50] := +1; CDX[51] := +1;
      CDX[52] := -1; CDX[53] := -1; CDX[54] := +1; CDX[55] := -1;
      CDX[56] := -1; CDX[57] :=  0; CDX[58] :=  0; CDX[59] := +6;
      CDX[60] :=  0; CDX[61] := -1; CDX[62] := -3; CDX[63] := -1;
      CDX[64] := -1; CDX[65] := -1;
      PDX[ 1] := -1; PDX[ 2] := -1; PDX[ 3] := -1; PDX[ 4] := -1;
      PDX[ 5] := -1; PDX[ 6] := -2; PDX[ 7] := -3; PDX[ 8] := -3;
      PDX[ 9] := -2; PDX[10] := -3; PDX[11] :=  0; PDX[12] := -2;
      PDX[13] := -1; PDX[14] :=  0; PDX[15] :=  0; PDX[16] :=  0;
      PDX[17] :=  0; PDX[18] :=  0; PDX[19] :=  0; PDX[20] :=  0;
      PDX[21] := -1; PDX[22] := -1; PDX[23] := -1; PDX[24] := -1;
      PDX[25] := -1; PDX[26] := -1; PDX[27] := -1; PDX[28] := -1;
      PDX[29] := -2;
    END;

   BEGIN (*INITTABLES*)
     RESWORDS; SYMBOLS; RATORS;
     INSTRMNEMONICS; PROCMNEMONICS;
     CHARTYPES; INITDX;
     ERRMSGS
   END (*INITTABLES*) ;

 BEGIN   (* main body of compiler *)
   (*INITIALIZE*)
   (************)
   INITSCALARS; INITSETS; INITTABLES;


   (*ENTER STANDARD NAMES AND STANDARD TYPES:*)
   (******************************************)

   LEVEL := 0; TOP := 0;
   (* level 0 contains the standard names and standard types *)
   (* in the symbol table *)
   IF PRCODE THEN BEGIN
      WRITELN (PRR, ' ':6, 'CALL MAIN');
      WRITELN (PRR, ' ':6, 'END');
      IC := IC + 2
      END;

   WITH DISPLAY [0] DO BEGIN
      FNAME := NIL; FLABEL := NIL; OCCUR := BLCK
      END;

   ENTERSTDTYPES; STDNAMES; ENTSTDNAMES; ENTERUNDECL;

   (* initialize for first level of user symbol table entries *)
   TOP := 1; LEVEL := 1;
   WITH DISPLAY [1] DO BEGIN
      FNAME := NIL; FLABEL := NIL; FFILE := NIL; OCCUR := BLCK
      END;


   (* COMPILE *)
   (***********)

   INSYMBOL;
   PROGRAMME (BLOCKBEGSYS + STATBEGSYS - [CASESY]);
   PRINTERRMSGS;

   IF PRCODE THEN BEGIN
      WRITELN (PRR, ' ':6, 'SUBROUTINE MAIN');
      WRITELN (PRR, ' ':6, 'INTEGER*4 STRGS (',
                   ((MAXSTRGINDEX+1) DIV 4):4, '), SETS (400)');
      PUTCOMDEFS;
      IF SETINDEX > 0 THEN BEGIN
         WRITELN(PRR);
         WRITELN(PRR,' ':6, 'DATA SETS /');
         FOR I := 0 TO SETINDEX-1 DO BEGIN
            WRITE(PRR,'     +:');
            IF 31 IN SETTABLE [I] THEN K := 2 ELSE K := 0;
            IF 30 IN SETTABLE [I] THEN K := K + 1;
            WRITE(PRR,K:1);
            J := 29;
            WHILE J > -1 DO BEGIN
               K := 0;
               IF J IN SETTABLE[I] THEN K := K + 4;
               IF (J-1) IN SETTABLE[I] THEN K := K + 2;
               IF (J-2) IN SETTABLE[I] THEN K := K + 1;
               WRITE(PRR,K:1);
               J := J - 3
               END;
            WRITELN(PRR,',')
            END;
         IF (MAXSETINDEX - SETINDEX + 1) > 0 THEN
            WRITELN (PRR, ' ':5, '+', (MAXSETINDEX-SETINDEX+1):1, '*0/')
         END;

      IF STRGINDEX > 0 THEN BEGIN
         WRITELN(PRR);
         WRITELN(PRR,' ':6, 'DATA STRGS /');
         K := STRGINDEX - 32; I := 0;
         WHILE I < K DO BEGIN
            WRITE (PRR, ' ':5, '+32H');
            FOR J := I TO I + 31 DO
               WRITE (PRR, STRGTABLE [J]);
            I := I + 32; WRITELN (PRR, ',')
            END;
         IF (STRGINDEX - I) > 0 THEN BEGIN
            WRITE (PRR, ' ':5, '+', (STRGINDEX - I):1, 'H');
            FOR J := I TO STRGINDEX - 1 DO
               WRITE (PRR, STRGTABLE [J])
            END;
         IF (MAXSTRGINDEX - STRGINDEX + 1) > 0 THEN
            WRITE (PRR, ',', ((MAXSTRGINDEX-STRGINDEX+1) DIV 4):1, '*0');
         WRITELN (PRR, '/')
         END;
      WRITELN (PRR);
      WRITELN (PRR, ' ':6, 'CALL MOVE2S(LOC(STRGS), LOC(STRTBL), ',
               STRGINDEX DIV 2:1, ')');
      WRITELN (PRR, ' ':6, 'CALL MOVE2S(LOC(SETS), LOC(SETTBL), ',
               SETINDEX * 2:1, ')');
      IF INPFLG THEN K := 1 ELSE K := 0;
      WRITELN (PRR, ' ':6, 'CALL P$INIT(', K:1, ')');
      WRITELN (PRR, ' ':6, 'CALL P$MST(0)');
      WRITELN (PRR, ' ':6, 'CALL P$CUP(0)');
      WRITELN (PRR, ' ':6, 'CALL P$MAIN');
      IF COMPCODE THEN
        BEGIN
        ID := 'ERRKTR  ';
        SEARCHID([VARS],LCP);
        WRITELN(PRR, ' ':6, 'CALL P$LAO(', LCP^.VADDR:1, ')');
        WRITELN(PRR, ' ':6, 'CALL P$FMS('' errors in pascal program.'')')
        END;
      WRITELN (PRR, ' ':6, 'CALL P$STP');
      WRITELN (PRR, ' ':6, 'END');
      END
END.



