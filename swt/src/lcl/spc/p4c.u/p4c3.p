      PROCEDURE STATEMENT(FSYS: SETOFSYS);
        LABEL 1;
        VAR LCP: CTP; LLP: LBP; FLLEV: INTEGER; PKEY: 1..16;
            FILELOAD: BOOLEAN;

        PROCEDURE EXPRESSION (FSYS: SETOFSYS); FORWARD;

        PROCEDURE DERANGE (VAR A : ATTR);
         (* CHANGE A SUBRANGE TYPE TO ITS BASE TYPE *)
        BEGIN
          WITH A.TYPTR^ DO
            IF FORM = SUBRANGE
              THEN A.TYPTR := RANGETYPE
        END (* DERANGE *);

        FUNCTION FILEVAR(VAR LSP: STP): BOOLEAN;
        (* test variable type to see if it is a file.  FILEVAR returns *)
        (* true if variable is of type file.  LSP points to the file   *)
        (* variable or variable element of type file                   *)
        BEGIN
          IF (LSP^.FORM = FILES) AND (SY = ARROW) THEN FILEVAR := FALSE
          (* return false if variable is a file buffer *)
          ELSE BEGIN (* if varaible type is complex, check element types *)
            IF LSP^.FORM = ARRAYS THEN (* get element type *)
              WHILE LSP^.FORM = ARRAYS DO
                LSP := LSP^.AELTYPE;
            FILEVAR := LSP^.FORM = FILES
          END
        END;


        PROCEDURE SELECTOR(FSYS: SETOFSYS; FCP: CTP);
        VAR LATTR: ATTR; LCP: CTP; LSP: STP;
         LSIZE,LMIN,LMAX: INTEGER;

        (* this procedure assigns values to GATTR for the variable in   *)
        (* FCP.  If the variable is an array or record element, the     *)
        (* code to calculate the address for the element is printed.    *)
        (* If a procedure requires a file address to be loaded, then    *)
        (* that address must be loaded first.  FILELOAD is a flag which *)
        (* indicates whether or not a file address needs to be loaded.  *)

        BEGIN
          WITH FCP^, GATTR DO
            BEGIN TYPTR := IDTYPE; KIND := VARBL;
              CASE KLASS OF
                VARS:
                  IF VKIND = ACTUAL THEN
                    BEGIN ACCESS := DRCT; VLEVEL := VLEV;
                    FLLEV := VLEV; DPLMT := VADDR
                    END
                  ELSE
                    BEGIN GEN2T(54(*LOD*),LEVEL-VLEV,VADDR,NILPTR);
                    ACCESS := INDRCT; IDPLMT := 0
                    END;
                FIELD:
                  WITH DISPLAY[DISX] DO
                    IF OCCUR = CREC THEN
                      BEGIN ACCESS := DRCT; VLEVEL := CLEV;
                      DPLMT := CDSPL + FLDADDR
                      END
                    ELSE
                      BEGIN
                        IF LEVEL = 1 THEN GEN1T(39(*LDO*),VDSPL,NILPTR)
                        ELSE GEN2T(54(*LOD*),0,VDSPL,NILPTR);
                        ACCESS := INDRCT; IDPLMT := FLDADDR
                      END;
                FUNC:
                  IF PFDECKIND = STANDARD THEN
                    BEGIN ERROR(150); TYPTR := NIL END
                  ELSE
                    BEGIN
                      IF PFKIND = FORMAL THEN ERROR(151)
                      ELSE
                        IF (PFLEV+1<>LEVEL)OR(FPROCP<>FCP) THEN ERROR(177);
                        BEGIN ACCESS := DRCT; VLEVEL := PFLEV + 1;
                          DPLMT := 0   (*IMPL. RELAT. ADDR. OF FCT. RESULT*)
                        END
                    END
              END (*CASE*)
            END (*WITH*);
          IF NOT (SY IN SELECTSYS + FSYS) THEN
            BEGIN ERROR(59); SKIP(SELECTSYS + FSYS) END;
          IF NOT FILELOAD THEN (* address of file has not been loaded *)
            BEGIN LSP := GATTR.TYPTR; FILELOAD := TRUE;
            IF NOT FILEVAR(LSP) THEN (* load address of standard file *)
              IF PKEY IN [2,6,12] THEN BEGIN (* in procedure put or write *)
                IF NOT OUTFLG THEN ERROR(176);
                GEN2(50(*LDA*),LEVEL-1,7)
                END
              ELSE BEGIN
                IF NOT INPFLG THEN ERROR(175);
                GEN2(50(*LDA*),LEVEL-1,5)
                END
            ELSE (* first parameter is a file, load its address *)
              IF GATTR.TYPTR^.FORM <> ARRAYS THEN LOADADDRESS
              (* if array of files, file address loaded below *)
            END;
          WHILE SY IN SELECTSYS DO
            BEGIN
        (*[*)   IF SY = LBRACK THEN
                BEGIN
                  REPEAT LATTR := GATTR;
                    WITH LATTR DO
                      IF TYPTR <> NIL THEN
                        IF TYPTR^.FORM <> ARRAYS THEN
                          BEGIN ERROR(138); TYPTR := NIL END;
                    LOADADDRESS;
                    INSYMBOL; EXPRESSION(FSYS + [COMMA,RBRACK]);
                    LOAD;
                    IF GATTR.TYPTR <> NIL THEN
                      IF GATTR.TYPTR^.FORM > SUBRANGE THEN ERROR(113);
                    IF LATTR.TYPTR <> NIL THEN
                      WITH LATTR.TYPTR^ DO
                        BEGIN
                          IF COMPTYPES(INXTYPE,GATTR.TYPTR) THEN
                            BEGIN
                              IF INXTYPE <> NIL THEN
                                BEGIN GETBOUNDS(INXTYPE,LMIN,LMAX);
                                IF CHECKNEEDED (INXTYPE, GATTR.TYPTR)
                                  THEN GEN2T(45(*CHK*),LMIN,LMAX,INTPTR);
                                IF LMIN>0 THEN GEN1T(31(*DEC*),LMIN,INTPTR)
                                  ELSE IF LMIN<0 THEN
                                  GEN1T(34(*INC*),-LMIN,INTPTR);
                                  (*OR SIMPLY GEN1(31,LMIN)*)
                                END
                            END
                          ELSE ERROR(139);
                          WITH GATTR DO
                            BEGIN TYPTR := AELTYPE; KIND := VARBL;
                          IF (AELTYPE = CHARPTR) AND PACKEDSTRUCT THEN
                           ACCESS := INXD
                          ELSE
                           BEGIN
                              ACCESS := INDRCT; IDPLMT := 0
                           END
                            END;
                          IF (GATTR.TYPTR <> NIL) AND (GATTR.ACCESS = INDRCT) THEN
                            BEGIN
                              LSIZE := GATTR.TYPTR^.SIZE;
                              ALIGN(GATTR.TYPTR,LSIZE);
                              GEN1(36(*IXA*),LSIZE)
                            END
                        END
                  UNTIL SY <> COMMA;
                  IF SY = RBRACK THEN INSYMBOL ELSE ERROR(12)
                END (*IF SY = LBRACK*)
              ELSE
        (*.*)     IF SY = PERIOD THEN
                  BEGIN
                    WITH GATTR DO
                      BEGIN
                        IF TYPTR <> NIL THEN
                          IF TYPTR^.FORM <> RECORDS THEN
                            BEGIN ERROR(140); TYPTR := NIL END;
                        INSYMBOL;
                        IF SY = IDENT THEN
                          BEGIN
                            IF TYPTR <> NIL THEN
                              BEGIN SEARCHSECTION(TYPTR^.FSTFLD,LCP);
                                IF LCP = NIL THEN
                                  BEGIN ERROR(152); TYPTR := NIL END
                                ELSE
                                  WITH LCP^ DO
                                    BEGIN TYPTR := IDTYPE;
                                      CASE ACCESS OF
                                        DRCT:   DPLMT := DPLMT + FLDADDR;
                                        INDRCT: IDPLMT := IDPLMT + FLDADDR;
                                        INXD:   ERROR(350)
                                      END
                                    END
                              END;
                            INSYMBOL
                          END (*SY = IDENT*)
                        ELSE ERROR(2)
                      END (*WITH GATTR*)
                  END (*IF SY = PERIOD*)
                ELSE
        (*^*)       BEGIN
                    IF GATTR.TYPTR <> NIL THEN
                      WITH GATTR,TYPTR^ DO
                        IF FORM = POINTER THEN
                          BEGIN LOAD; TYPTR := ELTYPE;
                            IF PTRCHECKS THEN
                               GEN2T(45(*CHK*),1,MAXADDR,NILPTR);
                            WITH GATTR DO
                              BEGIN KIND := VARBL; ACCESS := INDRCT;
                                IDPLMT := 0
                              END
                          END
                        ELSE
                          IF FORM = FILES THEN BEGIN
                            TYPTR := FILTYPE;
                            DPLMT := DPLMT + 1
                            END
                          ELSE ERROR(141);
                    INSYMBOL
                  END;
              IF NOT (SY IN FSYS + SELECTSYS) THEN
                BEGIN ERROR(6); SKIP(FSYS + SELECTSYS) END
            END; (*WHILE*)
        END; (*SELECTOR*)

        PROCEDURE CALL(FSYS: SETOFSYS; FCP: CTP);
          VAR LKEY: 1..16;
          PROCEDURE VARIABLE(FSYS: SETOFSYS; VAR LCP: CTP);
          BEGIN
            IF SY = IDENT THEN
              BEGIN SEARCHID([VARS,FIELD],LCP); INSYMBOL END
            ELSE BEGIN ERROR(2); LCP := UVARPTR END;
            SELECTOR(FSYS + [COMMA],LCP)
          END (*VARIABLE*);

          PROCEDURE RESETREWRITE;
            VAR
              I,J,SIZE,FLEV: INTEGER;
              LSP: STP; LCP: CTP;
              EXTNAME: BOOLEAN;

          BEGIN
            EXTNAME := FALSE; FILELOAD := FALSE;
            FOR I := 2 TO 100 DO PATHNAME[I] := ' ';
            VARIABLE(FSYS + [RPARENT], LCP); LSP := LCP^.IDTYPE;
            IF GATTR.TYPTR = NIL THEN ERROR(2)
            ELSE IF NOT(LSP^.FORM IN [ARRAYS,FILES,RECORDS]) THEN ERROR(116)
            ELSE BEGIN
              IF SY = COMMA THEN (* read in a pathanme *)
                IF NOT FINDFILE(LCP) THEN
                  BEGIN ERROR(183);
                  (* file is temporary; pathname is not allowed *)
                  SKIP(FSYS + [COMMA,RPARENT])
                  END
                ELSE BEGIN (* get pathname *)
                  INSYMBOL; EXTNAME := TRUE;
                  IF SY <> IDENT THEN ERROR(2);
                  INSYMBOL
                  END;
              IF NOT EXTNAME THEN (* no pathname was givin *)
                FOR J := 1 TO 8 DO PATHNAME[J] := ID[J];
              CASE LSP^.FORM OF
                ARRAYS: IF FILEVAR(LSP)
                          THEN FLEV := LCP^.VLEV
                          ELSE ERROR(116);
                 FILES: FLEV := 0;
               RECORDS: ERROR(400)
                END; (* case *)
              IF (LSP^.FILTYPE = CHARPTR) AND (LKEY = 3)
                THEN SIZE := 0              (* indicates ascii file *)
                ELSE SIZE := LSP^.SIZE - 1; (* size of buffer for binary file ((
              (* open file for either input or output *)
              WRITE(PRR, ' ':6, 'CALL', SNA[LKEY+21], '(', FLEV:1, ',');
              IF LKEY = 3 THEN WRITE(PRR, SIZE:1, ',''') ELSE WRITE(PRR, '''');
              J := 1;
              REPEAT (* print pathname *)
                WRITE(PRR, PATHNAME[J]);
                J := J + 1
                UNTIL (PATHNAME[J] = ' ') OR (J > 100);
              WRITELN(PRR, ';'')');
                IC := IC + 1;
                TOPNEW := TOPNEW + PDX [LKEY+21] * MAXSTACK;
                IF TOPNEW > TOPMAX THEN TOPMAX := TOPNEW
                END
          END; (* resetrewrite *)

          PROCEDURE GETPUT;
            VAR LCP: CTP;
          BEGIN FILELOAD := FALSE; VARIABLE(FSYS + [RPARENT], LCP);
            IF FILEVAR(LCP^.IDTYPE) THEN
              GEN1(30(*CSP*),LKEY(*GET,PUT*))
            ELSE ERROR(116)
          END (*GETPUT*);

          PROCEDURE TEXTPAGE;
            VAR LSP: STP; LCP: CTP;
          BEGIN FILELOAD := FALSE;
            VARIABLE(FSYS + [RPARENT], LCP);
            IF LCP = NIL THEN ERROR(2)
            ELSE BEGIN
              IF FILEVAR(LCP^.IDTYPE) THEN
                IF LCP^.IDTYPE^.FILTYPE <> CHARPTR
                  THEN BEGIN ERROR(182); ERROR(59) END
          (* error 182 -- file must be of type text *)
                  ELSE GEN1(30(*CSP*),26(*PAG*))
              ELSE ERROR(59)
            END
          END;

          PROCEDURE READ;
            VAR LCP: CTP; LSP,VTYPE,FTYPE: STP; SIZE: ADDRRANGE;
          BEGIN
            FTYPE := CHARPTR; FILELOAD := FALSE;
            IF SY = LPARENT THEN
              BEGIN INSYMBOL; TEST := FALSE;
              (* note since each parameter must be a variable, the *)
              (* file address will be loaded onto the stack by the *)
              (* procedure SELECTOR called by VARIABLE.  LCP will  *)
              (* always be assigned a value if the first parameter *)
              (* is defined.                                       *)
              VARIABLE(FSYS + [COMMA,RPARENT], LCP);
              IF LCP <> NIL THEN BEGIN  (* first parameter is defined *)
                VTYPE := LCP^.IDTYPE;
                IF FILEVAR(VTYPE) THEN   (* first parameter is a file *)
                  BEGIN FTYPE := VTYPE^.FILTYPE;
                  IF SY = RPARENT THEN (* should be readln *)
                    BEGIN
                    IF LKEY = 5 THEN ERROR(116);     (*PUG*)
                    TEST := TRUE
                    END
                  ELSE IF SY <> COMMA THEN
                    BEGIN
                    SKIP(FSYS + [COMMA,RPARENT]);
                    ERROR(116)
                    END;
                  IF SY = COMMA THEN (* input next symbol *)
                    BEGIN
                    INSYMBOL;
                    VARIABLE(FSYS + [COMMA,RPARENT], LCP)
                    END
                  ELSE TEST := TRUE
                  END
                END;
              IF NOT TEST THEN
                REPEAT LOADADDRESS;
                  IF GATTR.TYPTR <> NIL THEN
                    BEGIN VTYPE := GATTR.TYPTR;
                    IF FTYPE^.FORM IN [SCALAR, SUBRANGE, ARRAYS, RECORDS] THEN
                      IF COMPTYPES(FTYPE,CHARPTR) THEN (* file is ascii *)
                        IF COMPTYPES(VTYPE,INTPTR)
                          THEN GEN1(30(*csp*),3(*rdi*))
                        ELSE IF COMPTYPES(VTYPE,REALPTR)
                          THEN GEN1(30(*csp*),4(*rdi*))
                        ELSE IF COMPTYPES(VTYPE,CHARPTR)
                          THEN GEN1(30(*csp*),5(*rdc*))
                        ELSE ERROR(145)
                      ELSE IF COMPTYPES(VTYPE,FTYPE) THEN
                        (* variable and file are of the same type *)
                        BEGIN SIZE := FTYPE^.SIZE;
                        GEN2(30(*csp*),27(*brd*),SIZE)
                        END
                      ELSE ERROR(116)
                    END;
                  TEST := SY <> COMMA;
                  IF NOT TEST THEN
                    BEGIN INSYMBOL; VARIABLE(FSYS + [COMMA,RPARENT], LCP) END
                UNTIL TEST;
              IF SY = RPARENT THEN INSYMBOL ELSE ERROR(4)
              END (* if sy = lparent *)
            ELSE IF LKEY = 5 THEN ERROR(116)
              ELSE BEGIN (* load standard input address for readln *)
                FILELOAD := TRUE;
                IF NOT INPFLG THEN ERROR(176);
                GEN2(50(*LDA*),LEVEL-1,5)
                END;
            IF LKEY = 11
              THEN GEN1(30(*CSP*),21(*RLN*))
            ELSE WRITELN(PRR, ' ':6, 'SP=SP-1')  (* decrement stack *)
          END; (*READ*)

          PROCEDURE WRITE;
            VAR LSP,VTYPE,FTYPE: STP; IDEFLT,RDEFLT: BOOLEAN;
                LCP:CTP; LADDR,SIZE,LEN: ADDRRANGE; LLKEY: 1..16;
                HIGH,LOW: INTEGER;
          BEGIN LLKEY := LKEY;
            FTYPE := CHARPTR; FILELOAD := FALSE;
            IF SY = LPARENT THEN
              BEGIN INSYMBOL; TEST := FALSE;
              EXPRESSION(FSYS + [COMMA,COLON,RPARENT]);
              IF GATTR.TYPTR <> NIL THEN BEGIN (* first parameter is a variable *)
                VTYPE := GATTR.TYPTR;
                IF FILEVAR(VTYPE) THEN  (* first parameter is file *)
                  BEGIN FTYPE := VTYPE^.FILTYPE;
                  IF SY = RPARENT THEN (* should be writeln *)
                    BEGIN
                    IF LLKEY = 6 THEN ERROR(116);    (*PUG*)
                    TEST := TRUE
                    END
                  ELSE IF SY <> COMMA THEN
                    BEGIN
                    SKIP(FSYS+[COMMA,RPARENT]);
                    ERROR(116)
                    END;
                  IF SY = COMMA THEN
                    BEGIN INSYMBOL;
                    EXPRESSION(FSYS+[COMMA,COLON,RPARENT])
                    END
                  ELSE TEST := TRUE
                  END
                END;
              IF NOT FILELOAD THEN (* the call to expression did not load file address *)
                BEGIN
                FILELOAD := TRUE;
                IF NOT OUTFLG THEN ERROR(176);
                GEN2(50(*LDA*),LEVEL-1,7)
                END;
              IF NOT TEST THEN
                REPEAT
                DERANGE (GATTR);
                VTYPE := GATTR.TYPTR;
                IF VTYPE <> NIL THEN
                  IF VTYPE^.FORM <= SUBRANGE THEN LOAD ELSE LOADADDRESS;
                IF FTYPE^.FORM IN [SCALAR,SUBRANGE,ARRAYS,RECORDS] THEN
                  IF COMPTYPES(FTYPE,CHARPTR) THEN (* file is ascii *)
                    BEGIN
                    IF SY = COLON THEN
                      BEGIN INSYMBOL;
                      EXPRESSION(FSYS + [COMMA,COLON,RPARENT]);
                      DERANGE (GATTR);
                      IF GATTR.TYPTR <> NIL THEN
                        IF GATTR.TYPTR <> INTPTR THEN ERROR(116);
                      LOAD; IDEFLT := FALSE
                      END
                    ELSE IDEFLT := TRUE;
                    IF SY = COLON THEN
                      BEGIN INSYMBOL;
                      EXPRESSION(FSYS + [COMMA,RPARENT]);
                      DERANGE (GATTR);
                      IF GATTR.TYPTR <> NIL THEN
                        IF VTYPE <> REALPTR THEN ERROR(124);
                      LOAD; RDEFLT := FALSE
                      END
                    ELSE RDEFLT := TRUE;
                    IF VTYPE = INTPTR THEN
                      BEGIN
                      IF IDEFLT THEN GEN1T (51 (*LDC*), 10, INTPTR);
                      GEN1(30(*CSP*),6(*WRI*))
                      END
                    ELSE IF VTYPE = REALPTR THEN
                      BEGIN
                      IF IDEFLT THEN GEN1T (51 (*LDC*), 20, INTPTR);
                      IF RDEFLT THEN GEN1T (51 (*LDC*), 20, INTPTR);
                      GEN1(30(*CSP*),8(*WRR*))
                      END
                    ELSE IF VTYPE = CHARPTR THEN
                      BEGIN
                      IF IDEFLT THEN GEN1T(51(*LDC*),1,INTPTR);
                      GEN1(30(*CSP*),9(*WRC*))
                      END
                    ELSE IF VTYPE^.FORM = SCALAR THEN ERROR(399)
                      ELSE IF STRING(VTYPE) THEN
                        BEGIN GETBOUNDS(VTYPE^.INXTYPE,LOW,HIGH);
                        LEN := HIGH - LOW + 1;
                        IF IDEFLT THEN
                          GEN1T(51(*LDC*),LEN,INTPTR);
                        GEN1T(51(*LDC*),LEN,INTPTR);
                        GEN1(30(*CSP*),10(*WRS*))
                        END
                      ELSE ERROR(145)
                    END
                  ELSE IF COMPTYPES(VTYPE,FTYPE) THEN
                    BEGIN SIZE := FTYPE^.SIZE;
                    GEN2(30(*csp*),28(*bwr*),SIZE)
                    END
                  ELSE ERROR(116);
                TEST := SY <> COMMA;
                IF NOT TEST THEN
                  BEGIN INSYMBOL;
                  EXPRESSION(FSYS + [COMMA,COLON,RPARENT])
                  END
                UNTIL TEST;
              IF SY = RPARENT THEN INSYMBOL ELSE ERROR(4)
              END (* if sy = lparent *)
            ELSE IF LKEY = 6 THEN ERROR(116)
              ELSE BEGIN (* load standard output address for writeln *)
                FILELOAD := TRUE;
                IF NOT OUTFLG THEN ERROR(176);
                GEN2(50(*LDA*),LEVEL-1,7)
                END;
            IF LLKEY = 12 THEN (*WRITELN*)
              GEN1(30(*CSP*),22(*WLN*))
            ELSE
              WRITELN(PRR, ' ':6, 'SP=SP-1')
          END (*WRITE*) ;

          PROCEDURE PACK;
            VAR LSP,LSP1: STP; LCP: CTP;
          BEGIN ERROR(399); VARIABLE(FSYS + [COMMA,RPARENT], LCP);
            LSP := NIL; LSP1 := NIL;
            IF GATTR.TYPTR <> NIL THEN
              WITH GATTR.TYPTR^ DO
                IF FORM = ARRAYS THEN
                  BEGIN LSP := INXTYPE; LSP1 := AELTYPE END
                ELSE ERROR(116);
            IF SY = COMMA THEN INSYMBOL ELSE ERROR(20);
            EXPRESSION(FSYS + [COMMA,RPARENT]);
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR^.FORM > SUBRANGE THEN ERROR(116)
              ELSE
                IF NOT COMPTYPES(LSP,GATTR.TYPTR) THEN ERROR(116);
            IF SY = COMMA THEN INSYMBOL ELSE ERROR(20);
            VARIABLE(FSYS + [RPARENT], LCP);
            IF GATTR.TYPTR <> NIL THEN
              WITH GATTR.TYPTR^ DO
                IF FORM = ARRAYS THEN
                  BEGIN
                    IF NOT COMPTYPES(AELTYPE,LSP1)
                      OR NOT COMPTYPES(INXTYPE,LSP) THEN
                      ERROR(116)
                  END
                ELSE ERROR(116)
          END (*PACK*) ;

          PROCEDURE UNPACK;
            VAR LSP,LSP1: STP; LCP: CTP;
          BEGIN ERROR(399); VARIABLE(FSYS + [COMMA,RPARENT], LCP);
            LSP := NIL; LSP1 := NIL;
            IF GATTR.TYPTR <> NIL THEN
              WITH GATTR.TYPTR^ DO
                IF FORM = ARRAYS THEN
                  BEGIN LSP := INXTYPE; LSP1 := AELTYPE END
                ELSE ERROR(116);
            IF SY = COMMA THEN INSYMBOL ELSE ERROR(20);
            VARIABLE(FSYS + [COMMA,RPARENT], LCP);
            IF GATTR.TYPTR <> NIL THEN
              WITH GATTR.TYPTR^ DO
                IF FORM = ARRAYS THEN
                  BEGIN
                    IF NOT COMPTYPES(AELTYPE,LSP1)
                      OR NOT COMPTYPES(INXTYPE,LSP) THEN
                      ERROR(116)
                  END
                ELSE ERROR(116);
            IF SY = COMMA THEN INSYMBOL ELSE ERROR(20);
            EXPRESSION(FSYS + [RPARENT]);
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR^.FORM > SUBRANGE THEN ERROR(116)
              ELSE
                IF NOT COMPTYPES(LSP,GATTR.TYPTR) THEN ERROR(116);
          END (*UNPACK*) ;

          PROCEDURE NEW;
            LABEL 1;
            VAR LSP,LSP1: STP; VARTS,LMIN,LMAX: INTEGER;
                LSIZE,LSZ: ADDRRANGE; LVAL: VALU; LCP: CTP;
          BEGIN VARIABLE(FSYS + [COMMA,RPARENT], LCP); LOADADDRESS;
            LSP := NIL; VARTS := 0; LSIZE := 0;
            IF GATTR.TYPTR <> NIL THEN
              WITH GATTR.TYPTR^ DO
                IF FORM = POINTER THEN
                  BEGIN
                    IF ELTYPE <> NIL THEN
                      BEGIN LSIZE := ELTYPE^.SIZE;
                        IF ELTYPE^.FORM = RECORDS THEN LSP := ELTYPE^.RECVAR
                      END
                  END
                ELSE ERROR(116);
            WHILE SY = COMMA DO
              BEGIN INSYMBOL;CONSTANT(FSYS + [COMMA,RPARENT],LSP1,LVAL);
                VARTS := VARTS + 1;
                (*CHECK TO INSERT HERE: IS CONSTANT IN TAGFIELDTYPE RANGE*)
                IF LSP = NIL THEN ERROR(158)
                ELSE
                  IF LSP^.FORM <> TAGFLD THEN ERROR(162)
                  ELSE
                    IF LSP^.TAGFIELDP <> NIL THEN
                      IF STRING(LSP1) OR (LSP1 = REALPTR) THEN ERROR(159)
                      ELSE
                        IF COMPTYPES(LSP^.TAGFIELDP^.IDTYPE,LSP1) THEN
                          BEGIN
                            LSP1 := LSP^.FSTVAR;
                            WHILE LSP1 <> NIL DO
                              WITH LSP1^ DO
                                IF VARVAL.IVAL = LVAL.IVAL THEN
                                  BEGIN LSIZE := SIZE; LSP := SUBVAR;
                                    GOTO 1
                                  END
                                ELSE LSP1 := NXTVAR;
                            LSIZE := LSP^.SIZE; LSP := NIL;
                          END
                        ELSE ERROR(116);
          1:  END (*WHILE*) ;
            GEN1T(51(*LDC*),LSIZE,INTPTR);
            GEN1(30(*CSP*),12(*NEW*));
          END (*NEW*) ;

          PROCEDURE MARK;
            VAR LCP: CTP;
          BEGIN VARIABLE(FSYS+[RPARENT], LCP);
             IF GATTR.TYPTR <> NIL THEN
               IF GATTR.TYPTR^.FORM = POINTER THEN
                 BEGIN LOADADDRESS; GEN1(30(*CSP*),23(*SAV*)) END
               ELSE ERROR(116)           (*PUG*)
          END(*MARK*);

          PROCEDURE RELEASE;
            VAR LCP: CTP;
          BEGIN VARIABLE(FSYS+[RPARENT], LCP);
                IF GATTR.TYPTR <> NIL THEN
                   IF GATTR.TYPTR^.FORM = POINTER THEN
                      BEGIN LOAD; GEN1(30(*CSP*),13(*RST*)) END
                   ELSE ERROR(116)          (*PUG*)
          END (*RELEASE*);

          PROCEDURE TIMEDATE;
            VAR LCP: CTP;
          BEGIN VARIABLE(FSYS + [RPARENT], LCP);
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR^.FORM <> ARRAYS THEN ERROR(103)
              ELSE BEGIN
                LOADADDRESS;
                IF LKEY = 15
                  THEN GEN2(30(*CSP*),29(*DAT*),2(*TIME*))
                  ELSE GEN2(30(*CSP*),29(*DAT*),1(*DATE*))
                END
            ELSE ERROR(2)
          END; (*TIMEDATE*)

          PROCEDURE ABS;
          BEGIN
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR = INTPTR THEN GEN0(0(*ABI*))
              ELSE
                IF GATTR.TYPTR = REALPTR THEN GEN0(1(*ABR*))
                ELSE BEGIN ERROR(125); GATTR.TYPTR := INTPTR END
          END (*ABS*) ;

          PROCEDURE SQR;
          BEGIN
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR = INTPTR THEN GEN0(24(*SQI*))
              ELSE
                IF GATTR.TYPTR = REALPTR THEN GEN0(25(*SQR*))
                ELSE BEGIN ERROR(125); GATTR.TYPTR := INTPTR END
          END (*SQR*) ;

          PROCEDURE TRUNC;
          BEGIN
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR <> REALPTR THEN ERROR(125);
            GEN0(27(*TRC*));
            GATTR.TYPTR := INTPTR
          END (*TRUNC*) ;

          PROCEDURE ODD;
          BEGIN
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR <> INTPTR THEN ERROR(125);
            GEN0(20(*ODD*));
            GATTR.TYPTR := BOOLPTR
          END (*ODD*) ;

          PROCEDURE ORD;
          BEGIN
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR^.FORM >= POWER THEN ERROR(125);
           (* GEN0T(58[ORD],GATTR.TYPTR); *)
            GATTR.TYPTR := INTPTR
          END (*ORD*);

          PROCEDURE CHR;
          BEGIN
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR <> INTPTR THEN ERROR(125)
               ELSE IF RANGECHECKS THEN
                 GEN2T (45(*CHK*), ORDMINCHAR, ORDMAXCHAR, INTPTR);
            GATTR.TYPTR := CHARPTR
          END (*CHR*) ;

          PROCEDURE PREDSUCC;
          BEGIN
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR^.FORM <> SCALAR THEN ERROR(125);
            IF LKEY = 7 THEN GEN1T(31(*DEC*),1,GATTR.TYPTR)
            ELSE GEN1T(34(*INC*),1,GATTR.TYPTR)
          END (*PREDSUCC*) ;

(*        PROCEDURE SHORT;                                           *)
(*        (* Only integer, character or array types may be used *)
(*          (* with this function *)
(*        BEGIN                                                      *)
(*        IF GATTR.TYPTR <> NIL THEN                                 *)
(*          IF ((GATTR.TYPTR = INTPTR) OR (GATTR.TYPTR = CHARPTR)) THEN*)
(*            generate left shift                                    *)
(*          ELSE IF GATTR.TYPTR^.FORM = ARRAYS THEN                  *)
(*            GEN1(66(*CPF  , GATTR.TYPTR^.SIZE)                     *)
(*          ELSE ERROR(125)                                          *)
(*        END;                                                       *)

          PROCEDURE EOF;
            VAR LCP: CTP;
          BEGIN
            IF SY = LPARENT THEN
              BEGIN INSYMBOL; VARIABLE(FSYS + [RPARENT], LCP);
                IF SY = RPARENT THEN INSYMBOL ELSE ERROR(4)
              END
            ELSE
              WITH GATTR DO
                BEGIN TYPTR := TEXTPTR; KIND := VARBL; ACCESS := DRCT;
                  VLEVEL := 1; DPLMT := LCAFTERMARKSTACK
                END;
            LOADADDRESS;
            IF GATTR.TYPTR <> NIL THEN
              IF GATTR.TYPTR^.FORM <> FILES THEN ERROR(125);
            IF LKEY = 9 THEN GEN0(8(*EOF*)) ELSE GEN1(30(*CSP*),14(*ELN*));
              GATTR.TYPTR := BOOLPTR
          END (*EOF*) ;

          PROCEDURE CALLNONSTANDARD;
            VAR NXT,LCP: CTP; LSP: STP; LKIND: IDKIND; LB: BOOLEAN;
              LOCPAR,          (* # locations needed for parameters *)
                               (* on run time stack, init to zero *)
              LLC: ADDRRANGE;
          BEGIN LOCPAR := 0;
            WITH FCP^ DO
              BEGIN NXT := NEXT; LKIND := PFKIND;
                IF NOT EXTDECL THEN GEN1(41(*MST*),LEVEL-PFLEV)
                (* LEVEL-PFLEV is static level difference between *)
                (* caller and callee *)
              END;
            IF SY = LPARENT THEN
              BEGIN LLC := LC;
                REPEAT LB := FALSE; (*DECIDE WHETHER PROC/FUNC MUST BE PASSED*)
                  IF LKIND = ACTUAL THEN
                    BEGIN
                      IF NXT = NIL THEN ERROR(126)
                      ELSE LB := NXT^.KLASS IN [PROC,FUNC]
                    END ELSE ERROR(399);
                  (*FOR FORMAL PROC/FUNC LB IS FALSE AND EXPRESSION
                   WILL BE CALLED, WHICH WILL ALLWAYS INTERPRET A PROC/FUNC ID
                  AT ITS BEGINNING AS A CALL RATHER THAN A PARAMETER PASSING.
                  IN THIS IMPLEMENTATION, PARAMETER PROCEDURES/FUNCTIONS
                  ARE THEREFORE NOT ALLOWED TO HAVE PROCEDURE/FUNCTION
                  PARAMETERS*)
                  INSYMBOL;
                  IF LB THEN   (*PASS FUNCTION OR PROCEDURE*)
                    BEGIN ERROR(399);
                      IF SY <> IDENT THEN
                        BEGIN ERROR(2); SKIP(FSYS + [COMMA,RPARENT]) END
                      ELSE
                        BEGIN
                          IF NXT^.KLASS = PROC THEN SEARCHID([PROC],LCP)
                          ELSE
                            BEGIN SEARCHID([FUNC],LCP);
                              IF NOT COMPTYPES(LCP^.IDTYPE,NXT^.IDTYPE) THEN
                                ERROR(128)
                            END;
                          INSYMBOL;
                          IF NOT (SY IN FSYS + [COMMA,RPARENT]) THEN
                            BEGIN ERROR(6); SKIP(FSYS + [COMMA,RPARENT]) END
                        END
                    END (*IF LB*)
                  ELSE (* parameters passed are not func or proc *)
                    (* normal case *)
                    BEGIN EXPRESSION(FSYS + [COMMA,RPARENT]);
                      IF GATTR.TYPTR <> NIL THEN
                        IF LKIND = ACTUAL THEN
                          BEGIN
                            IF NXT <> NIL THEN (* parameters exist *)
                              BEGIN LSP := NXT^.IDTYPE;
                                IF LSP <> NIL THEN
                                  BEGIN
                                    IF (NXT^.VKIND = ACTUAL) THEN
                                      IF LSP^.FORM <= POWER THEN
                                      BEGIN LOAD;
                                        IF COMPTYPES(REALPTR,LSP)
                                           AND COMPTYPES(GATTR.TYPTR,INTPTR)
                                          THEN BEGIN GEN0(10(*FLT*));
                                            GATTR.TYPTR := REALPTR
                                          END;
                                        IF LSP^.FORM <= SUBRANGE THEN
                                         IF CHECKNEEDED (LSP, GATTR.TYPTR)
                                          THEN CHECKBNDS(LSP);
                                        IF LSP^.FORM = POWER THEN
                                           LOCPAR := LOCPAR + SETHIGH DIV 32 + 1
                                        ELSE LOCPAR := LOCPAR + LSP^.SIZE;
                                        ALIGN(PARMPTR,LOCPAR);
                                      END
                                      ELSE
                                      BEGIN
                                        LOADADDRESS;
                                        LOCPAR := LOCPAR+PTRSIZE;
                                        ALIGN(PARMPTR,LOCPAR)
                                      END
                                    ELSE
                                      IF GATTR.KIND = VARBL THEN
                                       BEGIN LOADADDRESS;
                                         LOCPAR := LOCPAR+PARMSIZE
                                        END
                                      ELSE ERROR(154);
                                    IF NOT COMPTYPES(LSP,GATTR.TYPTR) THEN
                                      ERROR(142)
                                  END
                              END
                          END
                      ELSE (*LKIND = FORMAL*)
                        BEGIN (*PASS FORMAL PARAM*)
                        END
                    END;
                  IF (LKIND = ACTUAL) AND (NXT <> NIL) THEN NXT := NXT^.NEXT
                UNTIL SY <> COMMA;
                LC := LLC;
              IF SY = RPARENT THEN INSYMBOL ELSE ERROR(4)
            END (*IF LPARENT*);
            IF LKIND = ACTUAL THEN
              BEGIN IF NXT <> NIL THEN ERROR(126);
                WITH FCP^ DO
                  BEGIN
                    IF EXTDECL THEN GEN1(30(*CSP*),PFNAME)
                    ELSE IF FORTDECL THEN (* Fortran proc/func *)
                      GENFENT(46(*CUP*),LOCPAR,NAME,FCP)
                      (* Assume no parameters need > 1 location *)
                      (* since sets not supported by Fortran, *)
                      (* thus LOCPAR = # entries pushed on stack *)
                    ELSE GENCUPENT(46(*CUP*),LOCPAR,PFNAME)
                  END
              END;
            GATTR.TYPTR := FCP^.IDTYPE
          END (*CALLNONSTANDARD*) ;

        BEGIN (*CALL*)
          IF FCP^.PFDECKIND = STANDARD THEN
            BEGIN
              LKEY := FCP^.KEY;
              IF FCP^.KLASS = PROC THEN
                BEGIN
                PKEY := FCP^.KEY;
                IF NOT(LKEY IN [5,6,11,12]) THEN
                  IF SY = LPARENT THEN INSYMBOL ELSE ERROR(9);
                CASE LKEY OF
                   1,2: GETPUT;
                   3,4: RESETREWRITE;
                  5,11: READ;
                  6,12: WRITE;
                     7: PACK;
                     8: UNPACK;
                     9: NEW;
                    10: RELEASE;
                    13: TEXTPAGE;
                    14: MARK;
                 15,16: TIMEDATE
                END;
                IF NOT(LKEY IN [5,6,11,12]) THEN
                  IF SY = RPARENT THEN INSYMBOL ELSE ERROR(4)
               END
              ELSE
                BEGIN
                  IF LKEY <= 8 THEN
                    BEGIN
                      IF SY = LPARENT THEN INSYMBOL ELSE ERROR(9);
                      EXPRESSION(FSYS+[RPARENT]); LOAD; DERANGE (GATTR)
                    END;
                  CASE LKEY OF
                    1:    ABS;
                    2:    SQR;
                    3:    TRUNC;
                    4:    ODD;
                    5:    ORD;
                    6:    CHR;
                    7,8:  PREDSUCC;
                    9,10:    EOF
                  END;
                  IF LKEY <= 8 THEN
                    IF SY = RPARENT THEN INSYMBOL ELSE ERROR(4)
                END;
            END (*STANDARD PROCEDURES AND FUNCTIONS*)
          ELSE CALLNONSTANDARD
        END (*CALL*) ;

        PROCEDURE EXPRESSION;
          VAR LATTR: ATTR; LOP: OPERATOR; TYPIND: INTEGER; LSIZE: ADDRRANGE;
              LMAX, LMIN : INTEGER;

          PROCEDURE SIMPLEEXPRESSION(FSYS: SETOFSYS);
            VAR LATTR: ATTR; LOP: OPERATOR; SIGNED: BOOLEAN;

            PROCEDURE TERM(FSYS: SETOFSYS);
              VAR LATTR: ATTR; LOP: OPERATOR;

              PROCEDURE FACTOR(FSYS: SETOFSYS);
                VAR LCP: CTP; LVP: CSP; VARPART: BOOLEAN;
                    CSTPART: MAXSET; LSP,INX: STP;
                    OFFSET, LMAX, LMIN, FIRSTWORD, LASTWORD : INTEGER;
                    SETVAL : VALU;

                PROCEDURE ENTERSET (S : MAXSET; VAR FIRST, LAST : INTEGER);
                   VAR OFFSET, I, J : INTEGER;
                       W : WORDSET;

                   PROCEDURE INSERT (W : WORDSET);
                   BEGIN
                   IF SETINDEX <= MAXSETINDEX THEN BEGIN
                      SETTABLE [SETINDEX] := W;
                      SETINDEX := SETINDEX + 1;
                      END
                   ELSE ERROR (254)
                   END (* INSERT *);

                BEGIN (* ENTERSET *)
                IF S = [] THEN BEGIN
                   FIRST := 1;   LAST := 0;
                   END
                ELSE BEGIN
                   FIRST := 7;   LAST := -1;
                   FOR I := 0 TO (SETHIGH DIV 32) DO BEGIN
                      W := [];   OFFSET := I * (MAXBIT + 1);
                      FOR J := 0 TO MAXBIT DO
                         IF J+OFFSET IN S THEN W := W + [J];
                      IF W <> [] THEN BEGIN
                         IF (FIRST <= LAST) AND (LAST < I-1) THEN
                            FOR J := LAST+1 TO I-1 DO INSERT([]);
                         INSERT(W);
                         LAST := I;
                         IF I < FIRST THEN FIRST := I
                         END (* W <> [] *)
                      END (* FOR I *)
                   END (* S <> [] *)
                END (* ENTERSET *);

                FUNCTION CONSTERROR : BOOLEAN;

                BEGIN
                CONSTERROR := FALSE;
                IF GATTR.KIND = CST
                 THEN IF (GATTR.CVAL.IVAL < SETLOW) OR
                         (GATTR.CVAL.IVAL > SETHIGH) THEN
                   BEGIN   ERROR(304);
                   CONSTERROR := TRUE
                   END
                END (* CONSTERROR *);


                FUNCTION VALIDELTYPE : BOOLEAN;

                BEGIN
                VALIDELTYPE := FALSE;
                IF GATTR.TYPTR <> NIL THEN
                  IF GATTR.TYPTR^.FORM > SUBRANGE THEN ERROR(136)
                  ELSE IF COMPTYPES (LSP^.ELSET, GATTR.TYPTR)
                     THEN VALIDELTYPE := TRUE
                     ELSE ERROR (137)
                END (* VALIDELTYPE *);


              BEGIN (* FACTOR *)
                IF NOT (SY IN FACBEGSYS) THEN
                  BEGIN ERROR(58); SKIP(FSYS + FACBEGSYS);
                    GATTR.TYPTR := NIL
                  END;
                WHILE SY IN FACBEGSYS DO
                  BEGIN
                    CASE SY OF
              (*ID*)    IDENT:
                        BEGIN SEARCHID([KONST,VARS,FIELD,FUNC],LCP);
                          INSYMBOL;
                          IF LCP^.KLASS = FUNC THEN
                            BEGIN CALL(FSYS,LCP);
                              GATTR.KIND := EXPR;
                            END
                          ELSE
                            IF LCP^.KLASS = KONST THEN
                              WITH GATTR, LCP^ DO
                                BEGIN TYPTR := IDTYPE; KIND := CST;
                                  CVAL := VALUES
                                END
                            ELSE
                              SELECTOR(FSYS,LCP)
                        END;
              (*CST*)   INTCONST:
                        BEGIN
                          WITH GATTR DO
                            BEGIN TYPTR := INTPTR; KIND := CST;
                              CVAL := VAL
                            END;
                          INSYMBOL
                        END;
                      REALCONST:
                        BEGIN
                          WITH GATTR DO
                            BEGIN TYPTR := REALPTR; KIND := CST;
                              CVAL := VAL
                            END;
                          INSYMBOL
                        END;
                      STRINGCONST:
                        BEGIN
                          WITH GATTR DO
                            BEGIN
                              IF LGTH = 0 THEN TYPTR := NIL
                              ELSE IF LGTH = 1 THEN TYPTR := CHARPTR
                                ELSE
                                  BEGIN NEW(LSP,ARRAYS);
                                  WITH LSP^ DO
                                    BEGIN AELTYPE := CHARPTR; FORM:=ARRAYS;
                                    PACKEDSTRUCT := TRUE;
                                    NEW(INX,SUBRANGE);
                                    INXTYPE := INX;
                                    WITH INXTYPE^ DO
                                      BEGIN FORM := SUBRANGE;
                                      RANGETYPE := INTPTR;
                                      MIN.IVAL := 1;
                                      MAX.IVAL := LGTH
                                      END;
                                    SIZE := (LGTH + 3) DIV 4
                                    END;
                                  TYPTR := LSP
                                  END;
                              KIND := CST; CVAL := VAL
                            END;
                          INSYMBOL
                        END;
              (*(*)     LPARENT:
                        BEGIN INSYMBOL; EXPRESSION(FSYS + [RPARENT]);
                          IF SY = RPARENT THEN INSYMBOL ELSE ERROR(4)
                        END;
              (*NOT*)   NOTSY:
                        BEGIN INSYMBOL; FACTOR(FSYS);
                          LOAD; GEN0(19(*NOT*));
                          IF GATTR.TYPTR <> NIL THEN
                            IF GATTR.TYPTR <> BOOLPTR THEN
                              BEGIN ERROR(135); GATTR.TYPTR := NIL END;
                        END;
              (*[*)     LBRACK:
                        BEGIN INSYMBOL; CSTPART := [ ]; VARPART := FALSE;
                          NEW(LSP,POWER);
                          WITH LSP^ DO
                            BEGIN ELSET:=NIL;SIZE:=SETSIZE;FORM:=POWER END;
                          IF SY = RBRACK THEN
                            BEGIN
                              WITH GATTR DO
                                BEGIN TYPTR := LSP; KIND := CST END;
                              INSYMBOL
                            END
                          ELSE
                            BEGIN
                              REPEAT EXPRESSION(FSYS + [COMMA,COLON,RBRACK]);
                                IF VALIDELTYPE THEN BEGIN
                                  IF SY <> COLON THEN
                                    BEGIN (* SINGLE ELEMENT TO ADD *)
                                    IF GATTR.KIND = CST THEN BEGIN
                                      IF NOT CONSTERROR THEN
                                         CSTPART := CSTPART+[GATTR.CVAL.IVAL]
                                      END
                                    ELSE
                                      BEGIN LOAD;
                                        GEN0(23(*SGS*));
                                        IF VARPART THEN GEN0(28(*UNI*))
                                        ELSE VARPART := TRUE
                                      END;
                                    LSP^.ELSET := GATTR.TYPTR;
                                    END (* SINGLE ELEMENT *)
                                  ELSE BEGIN (* ADD MULTIPLE ELEMENTS *)
                                    IF CONSTERROR THEN GATTR.CVAL.IVAL := SETHIGH;
                                    LOAD;
                                    LSP^.ELSET := GATTR.TYPTR;
                                    INSYMBOL;
                                    EXPRESSION (FSYS + [COMMA,RBRACK]);
                                    IF VALIDELTYPE THEN BEGIN
                                      IF CONSTERROR THEN GATTR.CVAL.IVAL := SETLOW;
                                      LOAD;
                                      GEN0(59(*MTS*));
                                      END
                                    ELSE (* INVALID SECOND ITEM *)
                                      GEN0(23(*SGS*));
                                    IF VARPART THEN GEN0(28(*UNI*))
                                     ELSE VARPART := TRUE
                                    END (* MULTIPLE ELEMENTS *);
                                  GATTR.TYPTR := LSP
                                  END (* VALIDELTYPE *)
                                 ELSE GATTR.TYPTR := NIL;
                                TEST := SY <> COMMA;
                                IF NOT TEST THEN INSYMBOL
                              UNTIL TEST;
                              IF SY = RBRACK THEN INSYMBOL ELSE ERROR(12)
                            END;
                          IF GATTR.TYPTR <> NIL THEN BEGIN
                            GETBOUNDS (GATTR.TYPTR^.ELSET, LMIN, LMAX);
                            OFFSET := LMAX DIV 32 - LMIN DIV 32 + 1;
                            IF OFFSET > 8 THEN GATTR.TYPTR^.SIZE := 8
                             ELSE GATTR.TYPTR^.SIZE := OFFSET;
                            OFFSET := SETINDEX;
                            ENTERSET (CSTPART, FIRSTWORD, LASTWORD);
                            NEW (LVP, PSET);
                            WITH LVP^ DO BEGIN
                               CCLASS := PSET;   START := OFFSET;
                               FIRST := FIRSTWORD; LAST := LASTWORD;
                               END;
                            IF VARPART THEN BEGIN
                               IF CSTPART <> [ ] THEN
                                  BEGIN
                                  SETVAL.VALP := LVP;
                                  GENLDC(LSP,SETVAL);
                                  GEN0(28(*UNI*)); GATTR.KIND := EXPR
                                  END
                               END
                            ELSE
                                GATTR.CVAL.VALP := LVP
                            END (* GATTR.TYPTR <> NIL *)
                        END
                    END (*CASE*) ;
                    IF NOT (SY IN FSYS) THEN
                      BEGIN ERROR(6); SKIP(FSYS + FACBEGSYS) END
                  END (*WHILE*)
              END (*FACTOR*) ;

            BEGIN (*TERM*)
              FACTOR(FSYS + [MULOP]);
              IF SY = MULOP THEN DERANGE(GATTR);
              WHILE SY = MULOP DO
                      BEGIN LOAD; LATTR := GATTR; LOP := OP;
                  INSYMBOL; FACTOR(FSYS + [MULOP]); LOAD; DERANGE(GATTR);
                  IF (LATTR.TYPTR <> NIL) AND (GATTR.TYPTR <> NIL) THEN
                    CASE LOP OF
            (***)       MUL:  IF (LATTR.TYPTR=INTPTR)AND(GATTR.TYPTR=INTPTR)
                              THEN GEN0(15(*MPI*))
                            ELSE
                              BEGIN
                                IF LATTR.TYPTR = INTPTR THEN
                                  BEGIN GEN0(9(*FLO*));
                                    LATTR.TYPTR := REALPTR
                                  END
                                ELSE
                                  IF GATTR.TYPTR = INTPTR THEN
                                    BEGIN GEN0(10(*FLT*));
                                      GATTR.TYPTR := REALPTR
                                    END;
                                IF (LATTR.TYPTR = REALPTR)
                                  AND(GATTR.TYPTR=REALPTR)THEN GEN0(16(*MPR*))
                                ELSE
                                  IF(LATTR.TYPTR^.FORM=POWER)
                                    AND COMPTYPES(LATTR.TYPTR,GATTR.TYPTR)THEN
                                    GEN0(12(*INT*))
                                  ELSE BEGIN ERROR(134);GATTR.TYPTR:=NIL END
                              END;
            (*/*)       RDIV: BEGIN
                              IF GATTR.TYPTR = INTPTR THEN
                                  BEGIN GEN0(10(*FLT*));
                                  GATTR.TYPTR := REALPTR
                                END;
                              IF LATTR.TYPTR = INTPTR THEN
                                BEGIN GEN0(9(*FLO*));
                                  LATTR.TYPTR := REALPTR
                                END;
                              IF (LATTR.TYPTR = REALPTR)
                                AND (GATTR.TYPTR=REALPTR)THEN GEN0(7(*DVR*))
                              ELSE BEGIN ERROR(134); GATTR.TYPTR := NIL END
                            END;
            (*DIV*)     IDIV: IF (LATTR.TYPTR = INTPTR)
                              AND (GATTR.TYPTR = INTPTR) THEN GEN0(6(*DVI*))
                            ELSE BEGIN ERROR(134); GATTR.TYPTR := NIL END;
            (*MOD*)     IMOD: IF (LATTR.TYPTR = INTPTR)
                              AND (GATTR.TYPTR = INTPTR) THEN GEN0(14(*MOD*))
                            ELSE BEGIN ERROR(134); GATTR.TYPTR := NIL END;
            (*AND*)     ANDOP:IF (LATTR.TYPTR = BOOLPTR)
                              AND (GATTR.TYPTR = BOOLPTR) THEN GEN0(4(*AND*))
                            ELSE BEGIN ERROR(134); GATTR.TYPTR := NIL END
                    END (*CASE*)
                  ELSE GATTR.TYPTR := NIL
                END (*WHILE*)
            END (*TERM*) ;

          BEGIN (*SIMPLEEXPRESSION*)
            SIGNED := FALSE;
            IF (SY = ADDOP) AND (OP IN [PLUS,MINUS]) THEN
              BEGIN SIGNED := OP = MINUS; INSYMBOL END;
            TERM(FSYS + [ADDOP]);
            IF SIGNED THEN
              BEGIN LOAD; DERANGE(GATTR);
                IF GATTR.TYPTR = INTPTR THEN GEN0(17(*NGI*))
                ELSE
                  IF GATTR.TYPTR = REALPTR THEN GEN0(18(*NGR*))
                  ELSE BEGIN ERROR(134); GATTR.TYPTR := NIL END
              END;
            IF SY = ADDOP THEN DERANGE(GATTR);
            WHILE SY = ADDOP DO
              BEGIN LOAD; LATTR := GATTR; LOP := OP;
                INSYMBOL; TERM(FSYS + [ADDOP]); LOAD; DERANGE(GATTR);
                IF (LATTR.TYPTR <> NIL) AND (GATTR.TYPTR <> NIL) THEN
                  CASE LOP OF
          (*+*)       PLUS:
                      IF (LATTR.TYPTR = INTPTR)AND(GATTR.TYPTR = INTPTR) THEN
                        GEN0(2(*ADI*))
                      ELSE
                        BEGIN
                          IF LATTR.TYPTR = INTPTR THEN
                            BEGIN GEN0(9(*FLO*));
                              LATTR.TYPTR := REALPTR
                            END
                          ELSE
                            IF GATTR.TYPTR = INTPTR THEN
                              BEGIN GEN0(10(*FLT*));
                                GATTR.TYPTR := REALPTR
                              END;
                          IF (LATTR.TYPTR = REALPTR)AND(GATTR.TYPTR = REALPTR)
                            THEN GEN0(3(*ADR*))
                          ELSE IF(LATTR.TYPTR^.FORM=POWER)
                                 AND COMPTYPES(LATTR.TYPTR,GATTR.TYPTR) THEN
                                 GEN0(28(*UNI*))
                               ELSE BEGIN ERROR(134);GATTR.TYPTR:=NIL END
                        END;
          (*-*)       MINUS:
                      IF (LATTR.TYPTR = INTPTR)AND(GATTR.TYPTR = INTPTR) THEN
                        GEN0(21(*SBI*))
                      ELSE
                        BEGIN
                          IF LATTR.TYPTR = INTPTR THEN
                            BEGIN GEN0(9(*FLO*));
                              LATTR.TYPTR := REALPTR
                            END
                          ELSE
                            IF GATTR.TYPTR = INTPTR THEN
                            BEGIN GEN0(10(*FLT*));
                                GATTR.TYPTR := REALPTR
                              END;
                          IF (LATTR.TYPTR = REALPTR)AND(GATTR.TYPTR = REALPTR)
                            THEN GEN0(22(*SBR*))
                          ELSE
                            IF (LATTR.TYPTR^.FORM = POWER)
                              AND COMPTYPES(LATTR.TYPTR,GATTR.TYPTR) THEN
                              GEN0(5(*DIF*))
                            ELSE BEGIN ERROR(134); GATTR.TYPTR := NIL END
                        END;
          (*OR*)      OROP:
                      IF(LATTR.TYPTR=BOOLPTR)AND(GATTR.TYPTR=BOOLPTR)THEN
                        GEN0(13(*IOR*))
                      ELSE BEGIN ERROR(134); GATTR.TYPTR := NIL END
                  END (*CASE*)
                ELSE GATTR.TYPTR := NIL
              END (*WHILE*)
          END (*SIMPLEEXPRESSION*) ;

        BEGIN (*EXPRESSION*)
          SIMPLEEXPRESSION(FSYS + [RELOP]);
          IF SY = RELOP THEN
            BEGIN
              DERANGE (GATTR);
              IF GATTR.TYPTR <> NIL THEN
                IF GATTR.TYPTR^.FORM <= POWER THEN LOAD
                ELSE LOADADDRESS;
                LATTR := GATTR; LOP := OP;
             (* IF LOP = INOP THEN
                 IF NOT COMPTYPES(GATTR.TYPTR,INTPTR) THEN
                   GEN0T(58[ORD],GATTR.TYPTR);*)
              INSYMBOL; SIMPLEEXPRESSION(FSYS);
              DERANGE (GATTR);
              IF GATTR.TYPTR <> NIL THEN
                IF GATTR.TYPTR^.FORM <= POWER THEN LOAD
                ELSE LOADADDRESS;
              IF (LATTR.TYPTR <> NIL) AND (GATTR.TYPTR <> NIL) THEN
                IF LOP = INOP THEN
                  IF GATTR.TYPTR^.FORM = POWER THEN
                    IF COMPTYPES(LATTR.TYPTR,GATTR.TYPTR^.ELSET) THEN
                      GEN0(11(*INN*))
                    ELSE BEGIN ERROR(129); GATTR.TYPTR := NIL END
                  ELSE BEGIN ERROR(130); GATTR.TYPTR := NIL END
                ELSE
                  BEGIN
                    IF LATTR.TYPTR <> GATTR.TYPTR THEN
                      IF LATTR.TYPTR = INTPTR THEN
                        BEGIN GEN0(9(*FLO*));
                          LATTR.TYPTR := REALPTR
                        END
                      ELSE
                        IF GATTR.TYPTR = INTPTR THEN
                          BEGIN GEN0(10(*FLT*));
                            GATTR.TYPTR := REALPTR
                          END;
                    IF COMPTYPES(LATTR.TYPTR,GATTR.TYPTR) THEN
                      BEGIN LSIZE := LATTR.TYPTR^.SIZE;
                        CASE LATTR.TYPTR^.FORM OF
                          SCALAR:
                            IF LATTR.TYPTR = REALPTR THEN TYPIND := 2
                            ELSE
                              IF LATTR.TYPTR = BOOLPTR THEN TYPIND := 3
                              ELSE
                                IF LATTR.TYPTR = CHARPTR THEN TYPIND := 6
                                ELSE TYPIND := 1;
                          POINTER:
                            BEGIN
                              IF LOP IN [LTOP,LEOP,GTOP,GEOP] THEN ERROR(131);
                              TYPIND := 0
                            END;
                          POWER:
                            BEGIN IF LOP IN [LTOP,GTOP] THEN ERROR(132);
                              TYPIND := 4;   MEP(-15)
                          END;
                          ARRAYS:
                            BEGIN
                              IF NOT STRING(LATTR.TYPTR) THEN ERROR(134);
                              GETBOUNDS (LATTR.TYPTR^.INXTYPE,LMIN,LMAX);
                              LSIZE := LMAX - LMIN + 1;
                              TYPIND := 5
                            END;
                          RECORDS:
                            BEGIN
                               ERROR(134);                 (*PUG*)
                              TYPIND := 5
                            END;
                          FILES:
                            BEGIN ERROR(133); TYPIND := 1 END
                        END;
                        CASE LOP OF
                          LTOP: GEN2(53(*LES*),TYPIND,LSIZE);
                          LEOP: GEN2(52(*LEQ*),TYPIND,LSIZE);
                          GTOP: GEN2(49(*GRT*),TYPIND,LSIZE);
                          GEOP: GEN2(48(*GEQ*),TYPIND,LSIZE);
                          NEOP: GEN2(55(*NEQ*),TYPIND,LSIZE);
                          EQOP: GEN2(47(*EQU*),TYPIND,LSIZE)
                        END
                      END
                    ELSE ERROR(129)
                  END;
              GATTR.TYPTR := BOOLPTR; GATTR.KIND := EXPR
            END (*SY = RELOP*)
        END (*EXPRESSION*) ;


