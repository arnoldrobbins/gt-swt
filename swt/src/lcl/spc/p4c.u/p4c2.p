     PROCEDURE TYP(FSYS: SETOFSYS; VAR FSP: STP; VAR FSIZE: ADDRRANGE);

     VAR
       LSP,LSP1,LSP2: STP; OLDTOP: DISPRANGE; LCP: CTP;
       LSIZE,DISPL: ADDRRANGE; LMIN,LMAX: INTEGER;
       PACKEDFLAG : BOOLEAN;


       PROCEDURE SIMPLETYPE(FSYS:SETOFSYS; VAR FSP:STP; VAR FSIZE:ADDRRANGE);

       VAR
         LSP,LSP1: STP; LCP,LCP1: CTP; TTOP: DISPRANGE;
         LCNT: INTEGER; LVALU: VALU;

       BEGIN FSIZE := 1;
       IF NOT (SY IN SIMPTYPEBEGSYS) THEN
         BEGIN ERROR(1); SKIP(FSYS + SIMPTYPEBEGSYS) END;
       IF SY IN SIMPTYPEBEGSYS THEN
         BEGIN
         IF SY = LPARENT THEN
           BEGIN TTOP := TOP;   (*DECL. CONSTS LOCAL TO INNERMOST BLOCK*)
           WHILE DISPLAY[TOP].OCCUR <> BLCK DO TOP := TOP - 1;
           NEW(LSP,SCALAR,DECLARED);
           WITH LSP^ DO
             BEGIN SIZE := INTSIZE; FORM := SCALAR;
             SCALKIND := DECLARED
             END;
           LCP1 := NIL; LCNT := 0;
           REPEAT INSYMBOL;
             IF SY = IDENT THEN
               BEGIN NEW(LCP,KONST);
               WITH LCP^ DO
                 BEGIN NAME := ID; IDTYPE := LSP; NEXT := LCP1;
                 VALUES.IVAL := LCNT; KLASS := KONST
                 END;
               ENTERID(LCP);
               LCNT := LCNT + 1;
               LCP1 := LCP; INSYMBOL
               END
             ELSE ERROR(2);
             IF NOT (SY IN FSYS + [COMMA,RPARENT]) THEN
               BEGIN ERROR(6); SKIP(FSYS + [COMMA,RPARENT]) END
           UNTIL SY <> COMMA;
           LSP^.FCONST := LCP1; TOP := TTOP;
           IF SY = RPARENT THEN INSYMBOL ELSE ERROR(4)
           END
         ELSE
           BEGIN
           IF SY = IDENT THEN
             BEGIN SEARCHID([TYPES,KONST],LCP);
             INSYMBOL;
             IF LCP^.KLASS = KONST THEN
               BEGIN NEW(LSP,SUBRANGE);
               WITH LSP^, LCP^ DO
                 BEGIN RANGETYPE := IDTYPE; FORM := SUBRANGE;
                 IF STRING(RANGETYPE) THEN
                   BEGIN ERROR(148); RANGETYPE := NIL END;
                 MIN := VALUES; SIZE := INTSIZE
                 END;
               IF SY = COLON THEN INSYMBOL ELSE ERROR(5);
               CONSTANT(FSYS,LSP1,LVALU);
               LSP^.MAX := LVALU;
               IF LSP^.RANGETYPE <> LSP1 THEN ERROR(107)
               END
             ELSE
               BEGIN LSP := LCP^.IDTYPE;
               IF LSP <> NIL THEN FSIZE := LSP^.SIZE
               END
           END (*SY = IDENT*)
         ELSE
           BEGIN NEW(LSP,SUBRANGE); LSP^.FORM := SUBRANGE;
           CONSTANT(FSYS + [COLON],LSP1,LVALU);
           IF STRING(LSP1) THEN
             BEGIN ERROR(148); LSP1 := NIL END;
           WITH LSP^ DO
             BEGIN RANGETYPE:=LSP1; MIN:=LVALU; SIZE:=INTSIZE END;
           IF SY = COLON THEN INSYMBOL ELSE ERROR(5);
           CONSTANT(FSYS,LSP1,LVALU);
           LSP^.MAX := LVALU;
           IF LSP^.RANGETYPE <> LSP1 THEN ERROR(107)
               END;
           IF LSP <> NIL THEN
             WITH LSP^ DO
               IF FORM = SUBRANGE THEN
                 IF RANGETYPE <> NIL THEN
                   IF RANGETYPE = REALPTR THEN ERROR(399)
                   ELSE
                     IF MIN.IVAL > MAX.IVAL THEN ERROR(102)
         END;
       FSP := LSP;
       IF NOT (SY IN FSYS) THEN
         BEGIN ERROR(6); SKIP(FSYS) END
       END
         ELSE FSP := NIL
     END (*SIMPLETYPE*) ;

       PROCEDURE FIELDLIST(FSYS: SETOFSYS; VAR FRECVAR: STP);
         VAR LCP,LCP1,NXT,NXT1: CTP; LSP,LSP1,LSP2,LSP3,LSP4: STP;
             MINSIZE,MAXSIZE,LSIZE: ADDRRANGE; LVALU: VALU;
       BEGIN NXT1 := NIL; LSP := NIL;
         IF NOT (SY IN (FSYS+[IDENT,CASESY])) THEN
           BEGIN ERROR(19); SKIP(FSYS + [IDENT,CASESY]) END;
         WHILE SY = IDENT DO
           BEGIN NXT := NXT1;
             REPEAT
               IF SY = IDENT THEN
                 BEGIN NEW(LCP,FIELD);
                   WITH LCP^ DO
                     BEGIN NAME := ID; IDTYPE := NIL; NEXT := NXT;
                       KLASS := FIELD
                     END;
                   NXT := LCP;
                   ENTERID(LCP);
                   INSYMBOL
                 END
               ELSE ERROR(2);
               IF NOT (SY IN [COMMA,COLON]) THEN
                 BEGIN ERROR(6); SKIP(FSYS + [COMMA,COLON,SEMICOLON,CASESY])
                 END;
             TEST := SY <> COMMA;
               IF NOT TEST  THEN INSYMBOL
             UNTIL TEST;
             IF SY = COLON THEN INSYMBOL ELSE ERROR(5);
             TYP(FSYS + [CASESY,SEMICOLON],LSP,LSIZE);
             WHILE NXT <> NXT1 DO
               WITH NXT^ DO
                 BEGIN ALIGN(LSP,DISPL);
                   IDTYPE := LSP; FLDADDR := DISPL;
                   NXT := NEXT; DISPL := DISPL + LSIZE
                 END;
             NXT1 := LCP;
             IF SY = SEMICOLON THEN
               BEGIN INSYMBOL;
                 IF NOT (SY IN FSYS + [IDENT,CASESY]) THEN     (*PUG*)
                   BEGIN ERROR(19); SKIP(FSYS + [IDENT,CASESY]) END
               END
           END (*WHILE*);
         NXT := NIL;
         WHILE NXT1 <> NIL DO
           WITH NXT1^ DO
             BEGIN LCP := NEXT; NEXT := NXT; NXT := NXT1; NXT1 := LCP END;
         IF SY = CASESY THEN
           BEGIN NEW(LSP,TAGFLD);
             WITH LSP^ DO
               BEGIN TAGFIELDP := NIL; FSTVAR := NIL; FORM:=TAGFLD END;
             FRECVAR := LSP;
             INSYMBOL;
             IF SY = IDENT THEN
               BEGIN NEW(LCP,FIELD);
                 WITH LCP^ DO
                   BEGIN NAME := ID; IDTYPE := NIL; KLASS:=FIELD;
                     NEXT := NIL; FLDADDR := DISPL
                   END;
                 ENTERID(LCP);
                 INSYMBOL;
                 IF SY = COLON THEN INSYMBOL ELSE ERROR(5);
                 IF SY = IDENT THEN
                   BEGIN SEARCHID([TYPES],LCP1);
                     LSP1 := LCP1^.IDTYPE;
                     IF LSP1 <> NIL THEN
                       BEGIN ALIGN(LCP^.IDTYPE,DISPL);
                         LCP^.FLDADDR := DISPL;
                         DISPL := DISPL+LSP1^.SIZE;
                         IF (LSP1^.FORM <= SUBRANGE) OR STRING(LSP1) THEN
                           BEGIN IF COMPTYPES(REALPTR,LSP1) THEN ERROR(109)
                             ELSE IF STRING(LSP1) THEN ERROR(399);
                             LCP^.IDTYPE := LSP1; LSP^.TAGFIELDP := LCP;
                           END
                         ELSE ERROR(110);
                     END;
                     INSYMBOL;
                   END
                 ELSE BEGIN ERROR(2); SKIP(FSYS + [OFSY,LPARENT]) END
               END
             ELSE BEGIN ERROR(2); SKIP(FSYS + [OFSY,LPARENT]) END;
             LSP^.SIZE := DISPL;
             IF SY = OFSY THEN INSYMBOL ELSE ERROR(8);
             LSP1 := NIL; MINSIZE := DISPL; MAXSIZE := DISPL;
             REPEAT LSP2 := NIL;
               IF NOT (SY IN [SEMICOLON,ENDSY]) THEN
               BEGIN
               REPEAT CONSTANT(FSYS + [COMMA,COLON,LPARENT],LSP3,LVALU);
                 IF LSP^.TAGFIELDP <> NIL THEN
                  IF NOT COMPTYPES(LSP^.TAGFIELDP^.IDTYPE,LSP3)THEN ERROR(111);
                 NEW(LSP3,VARIANT);
                 WITH LSP3^ DO
                   BEGIN NXTVAR := LSP1; SUBVAR := LSP2; VARVAL := LVALU;
                     FORM := VARIANT
                   END;
                 LSP4 := LSP1;
                 WHILE LSP4 <> NIL DO
                   WITH LSP4^ DO
                     BEGIN
                       IF VARVAL.IVAL = LVALU.IVAL THEN ERROR(178);
                       LSP4 := NXTVAR
                     END;
                 LSP1 := LSP3; LSP2 := LSP3;
                 TEST := SY <> COMMA;
                 IF NOT TEST THEN INSYMBOL
               UNTIL TEST;
               IF SY = COLON THEN INSYMBOL ELSE ERROR(5);
               IF SY = LPARENT THEN INSYMBOL ELSE ERROR(9);
               FIELDLIST(FSYS + [RPARENT,SEMICOLON],LSP2);
               IF DISPL > MAXSIZE THEN MAXSIZE := DISPL;
               WHILE LSP3 <> NIL DO
                 BEGIN LSP4 := LSP3^.SUBVAR; LSP3^.SUBVAR := LSP2;
                   LSP3^.SIZE := DISPL;
                   LSP3 := LSP4
                 END;
               IF SY = RPARENT THEN
                 BEGIN INSYMBOL;
                   IF NOT (SY IN FSYS + [SEMICOLON]) THEN
                     BEGIN ERROR(6); SKIP(FSYS + [SEMICOLON]) END
                 END
               ELSE ERROR(4);
               END;
               TEST := SY <> SEMICOLON;
               IF NOT TEST THEN
                 BEGIN DISPL := MINSIZE;
                       INSYMBOL
                 END
             UNTIL TEST;
             DISPL := MAXSIZE;
             LSP^.FSTVAR := LSP1;
           END
         ELSE FRECVAR := NIL
       END (*FIELDLIST*) ;

     BEGIN (*TYP*)
       IF NOT (SY IN TYPEBEGSYS) THEN
          BEGIN ERROR(10); SKIP(FSYS + TYPEBEGSYS) END;
       IF SY IN TYPEBEGSYS THEN
         BEGIN
           IF SY IN SIMPTYPEBEGSYS THEN SIMPLETYPE(FSYS,FSP,FSIZE)
           ELSE
     (*^*)     IF SY = ARROW THEN
               BEGIN NEW(LSP,POINTER); FSP := LSP;
                 WITH LSP^ DO
                   BEGIN ELTYPE := NIL; SIZE := PTRSIZE; FORM:=POINTER END;
                 INSYMBOL;
                 IF SY = IDENT THEN
                   BEGIN PRTERR := FALSE; (*NO ERROR IF SEARCH NOT SUCCESSFUL*)
                     SEARCHID([TYPES],LCP); PRTERR := TRUE;
                     IF LCP = NIL THEN   (*FORWARD REFERENCED TYPE ID*)
                       BEGIN NEW(LCP,TYPES);
                         WITH LCP^ DO
                           BEGIN NAME := ID; IDTYPE := LSP;
                             NEXT := FWPTR; KLASS := TYPES
                           END;
                         FWPTR := LCP
                       END
                     ELSE
                       BEGIN
                         IF LCP^.IDTYPE <> NIL THEN
                           IF LCP^.IDTYPE^.FORM = FILES THEN ERROR(108)
                           ELSE LSP^.ELTYPE := LCP^.IDTYPE
                       END;
                     INSYMBOL;
                   END
                 ELSE ERROR(2);
               END
             ELSE
               BEGIN   PACKEDFLAG := FALSE;
                 IF SY = PACKEDSY THEN
                   BEGIN INSYMBOL;    PACKEDFLAG := TRUE;
                     IF NOT (SY IN TYPEDELS) THEN
                       BEGIN
                         ERROR(10); SKIP(FSYS + TYPEDELS)
                       END
                   END;
     (*ARRAY*)     IF SY = ARRAYSY THEN
                   BEGIN INSYMBOL;
                     IF SY = LBRACK THEN INSYMBOL ELSE ERROR(11);
                     LSP1 := NIL;
                     REPEAT NEW(LSP,ARRAYS);
                       WITH LSP^ DO
                         BEGIN AELTYPE := LSP1; INXTYPE := NIL; FORM:=ARRAYS END;
                       LSP1 := LSP;
                       SIMPLETYPE(FSYS + [COMMA,RBRACK,OFSY],LSP2,LSIZE);
                       LSP1^.SIZE := LSIZE;
                       IF LSP2 <> NIL THEN
                         IF LSP2^.FORM <= SUBRANGE THEN
                           BEGIN
                             IF LSP2 = REALPTR THEN
                               BEGIN ERROR(109); LSP2 := NIL END
                             ELSE
                               IF LSP2 = INTPTR THEN
                                 BEGIN ERROR(149); LSP2 := NIL END;
                             LSP^.INXTYPE := LSP2
                           END
                         ELSE BEGIN ERROR(113); LSP2 := NIL END;
                       TEST := SY <> COMMA;
                       IF NOT TEST THEN INSYMBOL
                     UNTIL TEST;
                     IF SY = RBRACK THEN INSYMBOL ELSE ERROR(12);
                     IF SY = OFSY THEN INSYMBOL ELSE ERROR(8);
                     TYP(FSYS,LSP,LSIZE);
                     REPEAT
                       WITH LSP1^ DO
                         BEGIN LSP2 := AELTYPE; AELTYPE := LSP;
                           IF INXTYPE <> NIL THEN
                             BEGIN GETBOUNDS(INXTYPE,LMIN,LMAX);
                               ALIGN(LSP,LSIZE);
                            IF PACKEDFLAG AND (AELTYPE = CHARPTR) THEN
                             LSIZE := ((LMAX - LMIN + 1) + 3) DIV 4
                            ELSE
                               LSIZE := LSIZE*(LMAX - LMIN + 1);
                               SIZE := LSIZE
                             END;   PACKEDSTRUCT := PACKEDFLAG
                         END;
                       LSP := LSP1; LSP1 := LSP2
                     UNTIL LSP1 = NIL
                   END
                 ELSE
     (*RECORD*)      IF SY = RECORDSY THEN
                     BEGIN INSYMBOL;
                       OLDTOP := TOP;
                       IF TOP < DISPLIMIT THEN
                         BEGIN TOP := TOP + 1;
                           WITH DISPLAY[TOP] DO
                             BEGIN FNAME := NIL;
                               FLABEL := NIL;
                                   OCCUR := REC
                             END
                         END
                       ELSE ERROR(250);
                       DISPL := 0;
                       FIELDLIST(FSYS-[SEMICOLON]+[ENDSY],LSP1);
                       NEW(LSP,RECORDS);
                       WITH LSP^ DO
                         BEGIN FSTFLD := DISPLAY[TOP].FNAME;
                           RECVAR := LSP1; SIZE := DISPL; FORM := RECORDS
                         END;
                       TOP := OLDTOP;
                       IF SY = ENDSY THEN INSYMBOL ELSE ERROR(13)
                     END
                   ELSE
     (*SET*)           IF SY = SETSY THEN
                       BEGIN INSYMBOL;
                         IF SY = OFSY THEN INSYMBOL ELSE ERROR(8);
                         SIMPLETYPE(FSYS,LSP1,LSIZE);
                           (* rewrite of PUG correction by LEBLANC *)
                         LSP := NIL;
                         IF LSP1 <> NIL THEN
                           IF LSP1^.FORM > SUBRANGE THEN ERROR (115)
                           ELSE IF LSP1 = REALPTR THEN ERROR (114)
                           ELSE IF LSP1 = INTPTR THEN ERROR (169)
                           ELSE BEGIN
                              GETBOUNDS(LSP1,LMIN,LMAX);
                              IF (LMIN < SETLOW) OR (LMAX > SETHIGH) THEN
                                 ERROR(169)
                              ELSE BEGIN
                                 NEW(LSP,POWER);
                                 WITH LSP^ DO BEGIN
                                    FORM := POWER;  ELSET := LSP1;
                                    SIZE := LMAX DIV 32 - LMIN DIV 32 + 1
                                    END
                                 END
                              END
                             (* end changes *)
                       END
                     ELSE
    (*FILE*)           IF SY = FILESY THEN
                         BEGIN INSYMBOL; NEW(LSP,FILES);
                           IF SY = OFSY THEN INSYMBOL ELSE ERROR(8);
                           IF SY IN SIMPTYPEBEGSYS
                             THEN SIMPLETYPE(FSYS,LSP1,LSIZE)
                           ELSE BEGIN
                             IF SY = PACKEDSY THEN
                               BEGIN INSYMBOL; PACKEDFLAG := TRUE;
                                 IF NOT (SY IN TYPEDELS) THEN
                                   BEGIN ERROR(10); SKIP(FSYS + TYPEDELS) END
                               END;
                             TYP(FSYS,LSP1,LSIZE)
                           END;
                           LSP^.FORM := FILES;  LSP^.SIZE := LSIZE + 1;
                           (* reserve one location per file on stack for *)
                           (* storing the device number assigned to file *)
                           IF LSP1^.FORM <> FILES
                             THEN BEGIN
                               WITH LSP^ DO
                                 BEGIN FILTYPE := LSP1;
                                 PACKEDSTRUCT := PACKEDFLAG;
                                 END
                             END
                           ELSE BEGIN
                             LSP^.FILTYPE := NIL; ERROR(398); ERROR(108)
                           END
                         END;
                 FSP := LSP
               END;
           IF NOT (SY IN FSYS) THEN
             BEGIN ERROR(6); SKIP(FSYS) END
         END
       ELSE FSP := NIL;
       IF FSP = NIL THEN FSIZE := 1 ELSE FSIZE := FSP^.SIZE
     END; (*TYP*)

     PROCEDURE ADDFILE(LCP: CTP; ADR: INTEGER);
     (* adds filename to file list for this level.   *)
       VAR P1: OFLPTR;

       BEGIN (* addfile *)
       WITH DISPLAY[TOP] DO
         BEGIN NEW(P1); P1^.FNAME := LCP^.NAME;
         P1^.FADDR := ADR; P1^.FLEV := LCP^.VLEV;
         P1^.TYP := FINDFILE(LCP); P1^.LNK := FFILE;
         IF LCP^.IDTYPE^.FORM = ARRAYS
           THEN P1^.AFLG := LCP^.VLEV
           ELSE P1^.AFLG := 0;
         FFILE := P1
         END
       END; (* addfile *)

     PROCEDURE DUMMYPROC;
       VAR DUMMY: INTEGER;
       BEGIN
         DUMMY := 10
       END;

     PROCEDURE LABELDECLARATION;
       VAR LLP: LBP; REDEF: BOOLEAN; LBNAME: INTEGER;
     BEGIN
       REPEAT
         IF SY = INTCONST THEN
           WITH DISPLAY[TOP] DO
             BEGIN LLP := FLABEL; REDEF := FALSE;
               WHILE (LLP <> NIL) AND NOT REDEF DO
                 IF LLP^.LABVAL <> VAL.IVAL THEN
                   LLP := LLP^.NEXTLAB
                 ELSE BEGIN REDEF := TRUE; ERROR(166) END;
               IF NOT REDEF THEN
                 BEGIN NEW(LLP);
                   WITH LLP^ DO
                     BEGIN LABVAL := VAL.IVAL; GENLABEL(LBNAME);
                       DEFINED := FALSE; NEXTLAB := FLABEL; LABNAME := LBNAME
                     END;
                   FLABEL := LLP
                 END;
               INSYMBOL
             END
         ELSE ERROR(15);
         IF NOT ( SY IN FSYS + [COMMA, SEMICOLON] ) THEN
           BEGIN ERROR(6); SKIP(FSYS+[COMMA,SEMICOLON]) END;
         TEST := SY <> COMMA;
         IF NOT TEST THEN INSYMBOL
       UNTIL TEST;
       IF SY = SEMICOLON THEN INSYMBOL ELSE ERROR(14)
     END (* LABELDECLARATION *) ;

     PROCEDURE CONSTDECLARATION;
       VAR LCP: CTP; LSP: STP; LVALU: VALU;
     BEGIN
       IF SY <> IDENT THEN
         BEGIN ERROR(2); SKIP(FSYS + [IDENT]) END;
       WHILE SY = IDENT DO
         BEGIN NEW(LCP,KONST);
           WITH LCP^ DO
             BEGIN NAME := ID; IDTYPE := NIL; NEXT := NIL; KLASS:=KONST END;
           INSYMBOL;
           IF (SY = RELOP) AND (OP = EQOP) THEN INSYMBOL ELSE ERROR(16);
           CONSTANT(FSYS + [SEMICOLON],LSP,LVALU);
           ENTERID(LCP);
           LCP^.IDTYPE := LSP; LCP^.VALUES := LVALU;
           IF SY = SEMICOLON THEN
             BEGIN INSYMBOL;
               IF NOT (SY IN FSYS + [IDENT]) THEN
                 BEGIN ERROR(6); SKIP(FSYS + [IDENT]) END
             END
           ELSE ERROR(14)
         END
     END (*CONSTDECLARATION*) ;

     PROCEDURE TYPEDECLARATION;
       VAR LCP,LCP1,LCP2: CTP; LSP: STP; LSIZE: ADDRRANGE;
     BEGIN
       IF SY <> IDENT THEN
         BEGIN ERROR(2); SKIP(FSYS + [IDENT]) END;
       WHILE SY = IDENT DO
         BEGIN NEW(LCP,TYPES);
           WITH LCP^ DO
             BEGIN NAME := ID; IDTYPE := NIL; KLASS := TYPES END;
           INSYMBOL;
           IF (SY = RELOP) AND (OP = EQOP) THEN INSYMBOL ELSE ERROR(16);
           TYP(FSYS + [SEMICOLON],LSP,LSIZE);
           ENTERID(LCP);
           LCP^.IDTYPE := LSP;
           (*HAS ANY FORWARD REFERENCE BEEN SATISFIED:*)
           LCP1 := FWPTR;
           WHILE LCP1 <> NIL DO
             BEGIN
               IF LCP1^.NAME = LCP^.NAME THEN
                 BEGIN LCP1^.IDTYPE^.ELTYPE := LCP^.IDTYPE;
                   IF LCP1 <> FWPTR THEN
                     LCP2^.NEXT := LCP1^.NEXT
                   ELSE FWPTR := LCP1^.NEXT;
                 END            (*PUG*)
               ELSE LCP2 := LCP1; LCP1 := LCP1^.NEXT       (*PUG*)
             END;
           IF SY = SEMICOLON THEN
             BEGIN INSYMBOL;
               IF NOT (SY IN FSYS + [IDENT]) THEN
                 BEGIN ERROR(6); SKIP(FSYS + [IDENT]) END
             END
           ELSE ERROR(14)
         END;
       IF FWPTR <> NIL THEN
         BEGIN ERROR(117); WRITELN(OUTPUT);
           REPEAT WRITELN(OUTPUT,' TYPE-ID ',FWPTR^.NAME);
             FWPTR := FWPTR^.NEXT
           UNTIL FWPTR = NIL;
           IF NOT EOL THEN WRITE(OUTPUT,' ': CHCNT+20)
         END
     END (*TYPEDECLARATION*) ;

     PROCEDURE VARDECLARATION;

       VAR LCP,NXT: CTP; LSP,LSP1: STP; LSIZE: ADDRRANGE;
         FSIZE, FMIN, FMAX, FADDR, I: INTEGER;

     BEGIN NXT := NIL;
       REPEAT
         REPEAT
           IF SY = IDENT THEN
             BEGIN NEW(LCP,VARS);
               WITH LCP^ DO
                BEGIN NAME := ID; NEXT := NXT; KLASS := VARS;
                   IDTYPE := NIL; VKIND := ACTUAL; VLEV := LEVEL
                 END;
               ENTERID(LCP);
               NXT := LCP;
               INSYMBOL;
             END
           ELSE ERROR(2);
           IF NOT (SY IN FSYS + [COMMA,COLON] + TYPEDELS) THEN
             BEGIN ERROR(6); SKIP(FSYS+[COMMA,COLON,SEMICOLON]+TYPEDELS) END;
           TEST := SY <> COMMA;
           IF NOT TEST THEN INSYMBOL
         UNTIL TEST;
         IF SY = COLON THEN INSYMBOL ELSE ERROR(5);
         TYP(FSYS + [SEMICOLON] + TYPEDELS,LSP,LSIZE);
         FSIZE := 1; LSP1 := LSP;
         IF LSP^.FORM IN [ARRAYS, RECORDS] THEN
           CASE LSP^.FORM OF
            ARRAYS: WHILE LSP1^.FORM = ARRAYS DO
                      BEGIN GETBOUNDS(LSP1^.INXTYPE,FMIN,FMAX);
                      FSIZE := (FMAX - FMIN + 1) * FSIZE;
                      LSP1 := LSP1^.AELTYPE
                      END;
           RECORDS: DUMMYPROC
           END;  (* case *)
         WHILE NXT <> NIL DO
           BEGIN ALIGN(LSP,LC);
           NXT^.IDTYPE := LSP; NXT^.VADDR := LC; FADDR := LC;
           IF (LSP1^.FORM = FILES) AND (LSP^.FORM = ARRAYS) THEN
             FOR I := 1 TO FSIZE DO
               BEGIN ADDFILE(NXT,FADDR);
               FADDR := FADDR + LSP1^.SIZE
               END;
           IF LSP^.FORM = FILES THEN ADDFILE(NXT,FADDR);
           LC := LC + LSIZE; NXT := NXT^.NEXT
           END;
         IF SY = SEMICOLON THEN
           BEGIN INSYMBOL;
             IF NOT (SY IN FSYS + [IDENT]) THEN
               BEGIN ERROR(6); SKIP(FSYS + [IDENT]) END
           END
         ELSE ERROR(14)
       UNTIL (SY <> IDENT) AND NOT (SY IN TYPEDELS);
       IF FWPTR <> NIL THEN
         BEGIN ERROR(117); WRITELN(OUTPUT);
           REPEAT WRITELN(OUTPUT,' TYPE-ID ',FWPTR^.NAME);
             FWPTR := FWPTR^.NEXT
           UNTIL FWPTR = NIL;
           IF NOT EOL THEN WRITE(OUTPUT,' ': CHCNT+20)
         END
     END (*VARDECLARATION*) ;

     PROCEDURE PROCDECLARATION(FSY: SYMBOL);
       VAR OLDLEV: 0..MAXLEVEL; LSY: SYMBOL; LCP,LCP1: CTP; LSP: STP;
           FORW: BOOLEAN; OLDTOP: DISPRANGE; PARCNT: INTEGER;
           LLC,LCM: ADDRRANGE; LBNAME: INTEGER; MARKP: ^INTEGER;

       PROCEDURE PARAMETERLIST(FSY: SETOFSYS; VAR FPAR: CTP);
         VAR LCP,LCP1,LCP2,LCP3: CTP; LSP: STP; LKIND: IDKIND;
           LLC: ADDRRANGE; COUNT,LSIZE,OFFSET,MAX,MIN: INTEGER;
       BEGIN LCP1 := NIL;
         IF NOT (SY IN FSY + [LPARENT]) THEN
           BEGIN ERROR(7); SKIP(FSYS + FSY + [LPARENT]) END;
         IF SY = LPARENT THEN
           BEGIN IF FORW THEN ERROR(119);
             INSYMBOL;
             IF NOT (SY IN [IDENT,VARSY,PROCSY,FUNCSY]) THEN
               BEGIN ERROR(7); SKIP(FSYS + [IDENT,RPARENT]) END;
             WHILE SY IN [IDENT,VARSY,PROCSY,FUNCSY] DO
               BEGIN
                 IF SY = PROCSY THEN
                   BEGIN ERROR(399);
                     REPEAT INSYMBOL;
                       IF SY = IDENT THEN
                       BEGIN NEW(LCP,PROC,DECLARED,FORMAL);
                           WITH LCP^ DO
                             BEGIN NAME := ID; IDTYPE := NIL; NEXT := LCP1;
                               PFLEV := LEVEL (*BEWARE OF PARAMETER PROCEDURES*);
                               KLASS:=PROC;PFDECKIND:=DECLARED;PFKIND:=FORMAL
                             END;
                           ENTERID(LCP);
                           LCP1 := LCP;
                           ALIGN(PARMPTR,LC);
                           (*LC := LC + SOME SIZE *)
                           INSYMBOL
                         END
                       ELSE ERROR(2);
                       IF NOT (SY IN FSYS + [COMMA,SEMICOLON,RPARENT]) THEN
                         BEGIN ERROR(7);SKIP(FSYS+[COMMA,SEMICOLON,RPARENT])END
                     UNTIL SY <> COMMA
                   END
                 ELSE
                   BEGIN
                     IF SY = FUNCSY THEN
                       BEGIN ERROR(399); LCP2 := NIL;
                         REPEAT INSYMBOL;
                           IF SY = IDENT THEN
                             BEGIN NEW(LCP,FUNC,DECLARED,FORMAL);
                               WITH LCP^ DO
                                 BEGIN NAME := ID; IDTYPE := NIL; NEXT := LCP2;
                                   PFLEV := LEVEL (*BEWARE PARAM FUNCS*);
                                   KLASS:=FUNC;PFDECKIND:=DECLARED;
                                   PFKIND:=FORMAL
                                 END;
                               ENTERID(LCP);
                              LCP2 := LCP;
                              ALIGN(PARMPTR,LC);
                              (*LC := LC + SOME SIZE*)
                               INSYMBOL;
                             END;
                           IF NOT (SY IN [COMMA,COLON] + FSYS) THEN
                            BEGIN ERROR(7);SKIP(FSYS+[COMMA,SEMICOLON,RPARENT])
                             END
                         UNTIL SY <> COMMA;
                         IF SY = COLON THEN
                           BEGIN INSYMBOL;
                             IF SY = IDENT THEN
                               BEGIN SEARCHID([TYPES],LCP);
                                 LSP := LCP^.IDTYPE;
                                 IF LSP <> NIL THEN
                                  IF NOT(LSP^.FORM IN[SCALAR,SUBRANGE,POINTER])
                                     THEN BEGIN ERROR(120); LSP := NIL END;
                                 LCP3 := LCP2;
                                 WHILE LCP2 <> NIL DO
                                   BEGIN LCP2^.IDTYPE := LSP; LCP := LCP2;
                                     LCP2 := LCP2^.NEXT
                                   END;
                                 LCP^.NEXT := LCP1; LCP1 := LCP3;
                                 INSYMBOL
                               END
                             ELSE ERROR(2);
                             IF NOT (SY IN FSYS + [SEMICOLON,RPARENT]) THEN
                               BEGIN ERROR(7);SKIP(FSYS+[SEMICOLON,RPARENT])END
                           END
                         ELSE ERROR(5)
                       END
                     ELSE
                       BEGIN
                         IF SY = VARSY THEN
                         (* set indicator as to type of parameter *)
                           BEGIN LKIND := FORMAL; INSYMBOL END
                         ELSE LKIND := ACTUAL;
                         LCP2 := NIL;
                         COUNT := 0;
                         REPEAT
                           IF SY = IDENT THEN
                             BEGIN NEW(LCP,VARS);
                               WITH LCP^ DO
                                 BEGIN NAME:=ID; IDTYPE:=NIL; KLASS:=VARS;
                                   VKIND := LKIND; NEXT := LCP2; VLEV := LEVEL;
                                 END;
                               ENTERID(LCP);
                               LCP2 := LCP; COUNT := COUNT+1;
                               INSYMBOL;
                             END;
                           IF NOT (SY IN [COMMA,COLON] + FSYS) THEN
                            BEGIN ERROR(7);SKIP(FSYS+[COMMA,SEMICOLON,RPARENT])
                             END;
                           TEST := SY <> COMMA;
                           IF NOT TEST THEN INSYMBOL
                         UNTIL TEST;
                         IF SY = COLON THEN
                           BEGIN INSYMBOL;
                             IF SY = IDENT THEN
                               BEGIN SEARCHID([TYPES],LCP);
                                 LSP := LCP^.IDTYPE;
                                 LSIZE := PTRSIZE;
                                 OFFSET := 0;
                                 IF LSP <> NIL THEN
                                   IF LKIND=ACTUAL THEN
                                     IF LSP^.FORM<POWER THEN LSIZE := LSP^.SIZE
                                     ELSE IF LSP^.FORM = POWER THEN BEGIN
                                        LSIZE := SETHIGH DIV 32 + 1;
                                        GETBOUNDS (LSP^.ELSET, MIN, MAX);
                                        OFFSET := MIN DIV 32
                                        END (* FORM = POWER *)
                                     ELSE IF LSP^.FORM=FILES THEN ERROR(121);
                                 ALIGN(PARMPTR,LSIZE);
                                 LCP3 := LCP2;
                                 ALIGN(PARMPTR,LC);
                                 LC := LC+COUNT*LSIZE;
                                 LLC := LC;
                                 WHILE LCP2 <> NIL DO
                                   BEGIN LCP := LCP2;
                                     WITH LCP2^ DO
                                       BEGIN IDTYPE := LSP;
                                         LLC := LLC-LSIZE;
                                         VADDR := LLC + OFFSET;
                                       END;
                                     LCP2 := LCP2^.NEXT
                                   END;
                                 LCP^.NEXT := LCP1; LCP1 := LCP3;
                                 INSYMBOL
                               END
                             ELSE ERROR(2);
                             IF NOT (SY IN FSYS + [SEMICOLON,RPARENT]) THEN
                               BEGIN ERROR(7);SKIP(FSYS+[SEMICOLON,RPARENT])END
                           END
                         ELSE ERROR(5);
                       END;
                   END;
                 IF SY = SEMICOLON THEN
                   BEGIN INSYMBOL;
                     IF NOT (SY IN FSYS + [IDENT,VARSY,PROCSY,FUNCSY]) THEN
                       BEGIN ERROR(7); SKIP(FSYS + [IDENT,RPARENT]) END
                   END
               END (*WHILE*) ;
             IF SY = RPARENT THEN
               BEGIN INSYMBOL;
                 IF NOT (SY IN FSY + FSYS) THEN
                   BEGIN ERROR(6); SKIP(FSY + FSYS) END
               END
             ELSE ERROR(4);
             LCP3 := NIL;
             (*REVERSE POINTERS AND RESERVE LOCAL CELLS FOR COPIES OF MULTIPLE
              VALUES*)
             WHILE LCP1 <> NIL DO
               WITH LCP1^ DO
                 BEGIN LCP2 := NEXT; NEXT := LCP3;
                   IF KLASS = VARS THEN
                     IF IDTYPE <> NIL THEN
                       IF (VKIND=ACTUAL)AND(IDTYPE^.FORM>POWER) THEN
                         BEGIN ALIGN(IDTYPE,LC);
                           VADDR := LC;
                           LC := LC+IDTYPE^.SIZE;
                         END;
                   LCP3 := LCP1; LCP1 := LCP2
                 END;
             FPAR := LCP3
           END
             ELSE FPAR := NIL
     END (*PARAMETERLIST*) ;

     BEGIN (*PROCDECLARATION*)
       LLC := LC; LC := LCAFTERMARKSTACK; FORW := FALSE;
       IF SY = IDENT THEN
         BEGIN SEARCHSECTION(DISPLAY[TOP].FNAME,LCP); (*DECIDE WHETHER FORW.*)
           IF LCP <> NIL THEN     (* found ID in symbol table *)
           BEGIN
             IF LCP^.KLASS = PROC THEN
               FORW := LCP^.FORWDECL AND(FSY = PROCSY)AND(LCP^.PFKIND = ACTUAL)
             ELSE
               IF LCP^.KLASS = FUNC THEN
                 FORW:=LCP^.FORWDECL AND(FSY=FUNCSY)AND(LCP^.PFKIND=ACTUAL)
               ELSE FORW := FALSE;
             IF NOT FORW THEN ERROR(160)
           END;
           IF NOT FORW THEN (* not found, so allocate node & enter it *)
             BEGIN
               IF FSY = PROCSY THEN NEW(LCP,PROC,DECLARED,ACTUAL)
               ELSE NEW(LCP,FUNC,DECLARED,ACTUAL);
               WITH LCP^ DO
                 BEGIN NAME := ID; IDTYPE := NIL; FORTDECL := FALSE;
                   EXTDECL := FALSE; PFLEV := LEVEL;
                   GENLABEL(LBNAME);  (* generates integer label name for *)
                                      (* interpreter routine *)
                   PFDECKIND := DECLARED; PFKIND := ACTUAL; PFNAME := LBNAME;
                   IF FSY = PROCSY THEN KLASS := PROC
                   ELSE KLASS := FUNC
                 END;
               ENTERID(LCP)
             END
           ELSE (* it is a forward reference & ID found in symbol table *)
             BEGIN LCP1 := LCP^.NEXT; (* goes through parameters *)
               WHILE LCP1 <> NIL DO
                 BEGIN
                   WITH LCP1^ DO
                     IF KLASS = VARS THEN
                       IF IDTYPE <> NIL THEN
                         BEGIN LCM := VADDR + IDTYPE^.SIZE;
                           IF LCM > LC THEN LC := LCM
                         END;
                   LCP1 := LCP1^.NEXT
                 END
               END;
           INSYMBOL
         END
       ELSE
         BEGIN ERROR(2); LCP := UFCTPTR END;
       (* start new nesting level for symbol table *)
       OLDLEV := LEVEL; OLDTOP := TOP;
       IF LEVEL < MAXLEVEL THEN LEVEL := LEVEL + 1 ELSE ERROR(251);
       IF TOP < DISPLIMIT THEN
         BEGIN TOP := TOP + 1;
           WITH DISPLAY[TOP] DO
             BEGIN
               IF FORW THEN FNAME := LCP^.NEXT
               ELSE FNAME := NIL;
               FLABEL := NIL;
               FFILE := NIL;
               OCCUR := BLCK
             END
         END
       ELSE ERROR(250);
       IF FSY = PROCSY THEN  (* it is a procedure heading *)
         BEGIN PARAMETERLIST([SEMICOLON],LCP1);
           (* LCP1 is NIL if no parameter list found *)
           IF NOT FORW THEN LCP^.NEXT := LCP1
           (* link parameter id's to proc id symbol table entry *)
         END
       ELSE  (* it is a function with ':' outside parameter list *)
         BEGIN PARAMETERLIST([SEMICOLON,COLON],LCP1);
           IF NOT FORW THEN LCP^.NEXT := LCP1;
           (* link parameter id's to func id entry *)
           IF SY = COLON THEN
             BEGIN INSYMBOL;
               IF SY = IDENT THEN
                 BEGIN IF FORW THEN ERROR(122);
                   SEARCHID([TYPES],LCP1);
                   LSP := LCP1^.IDTYPE;
                   LCP^.IDTYPE := LSP;
                   IF LSP <> NIL THEN  (* check function result type *)
                     IF NOT (LSP^.FORM IN [SCALAR,SUBRANGE,POINTER]) THEN
                       BEGIN ERROR(120); LCP^.IDTYPE := NIL END;
                   INSYMBOL
                 END
               ELSE BEGIN ERROR(2); SKIP(FSYS + [SEMICOLON]) END
             END
           ELSE
             IF NOT FORW THEN ERROR(123)
         END;
       IF SY = SEMICOLON THEN INSYMBOL ELSE ERROR(14);
       IF SY = FORWARDSY THEN
         BEGIN
           IF FORW THEN ERROR(161)
           ELSE LCP^.FORWDECL := TRUE;
           INSYMBOL;
           IF SY = SEMICOLON THEN INSYMBOL ELSE ERROR(14);
           IF NOT (SY IN FSYS) THEN
             BEGIN ERROR(6); SKIP(FSYS) END
         END
       ELSE IF SY = EXTERNSY THEN
         BEGIN
         ERROR(400);
         LCP^.EXTDECL := TRUE;
         INSYMBOL;
         IF SY <> SEMICOLON THEN ERROR(14)
         ELSE INSYMBOL;
         SKIP ([BEGINSY, PROCSY, FUNCSY])
         END
       ELSE IF SY = FORTRANSY THEN
         BEGIN
         LCP^.FORTDECL := TRUE;
           (* build list of external fortran *)
           (* functions to use in translation to fortran *)
           IF FORTFUNC = NIL THEN (* first func encountered *)
             BEGIN
             FORTFUNC := LCP;
             LASTFFUNC := LCP;
             LCP^.NEXTFFUNC := NIL
             END
           ELSE                 (* additional functions *)
             BEGIN
             LASTFFUNC^.NEXTFFUNC := LCP;
             LASTFFUNC := LCP;
             LCP^.NEXTFFUNC := NIL
             END;
         IF LCP^.KLASS = FUNC THEN
           IF NOT ((LCP^.IDTYPE = INTPTR) OR (LCP^.IDTYPE = REALPTR)) THEN
             ERROR (397);              (* fortran func type error *)
         INSYMBOL;
         IF SY <> SEMICOLON THEN ERROR(14)
         ELSE INSYMBOL;
         IF NOT (SY IN [BEGINSY, PROCSY, FUNCSY]) THEN
           BEGIN
           ERROR(6);
           SKIP ([BEGINSY, PROCSY, FUNCSY])
           END
         END
       ELSE (* it is not a forward, extern or fortran symbol *)
         BEGIN LCP^.FORWDECL := FALSE; MARK(MARKP);
           REPEAT BLOCK(FSYS,SEMICOLON,LCP);
             IF SY = SEMICOLON THEN
               BEGIN INSYMBOL;
                 IF NOT (SY IN [BEGINSY,PROCSY,FUNCSY]) THEN
                   BEGIN ERROR(6); SKIP(FSYS) END
               END
             ELSE ERROR(14)
           UNTIL (SY IN [BEGINSY,PROCSY,FUNCSY]) OR EOF(INPUT);
           RELEASE(MARKP); (* RETURN LOCAL ENTRIES ON RUNTIME HEAP *)
         END;
       LEVEL := OLDLEV; TOP := OLDTOP; LC := LLC
     END (*PROCDECLARATION*) ;

     PROCEDURE BODY (FSYS: SETOFSYS);
       (* Processes the procedure/function body *)

       CONST CSTOCCMAX=65; CIXMAX=1000;
       VAR
           LLCP:CTP; SAVEID:ALPHA;
           I, ENTNAME, SEGSIZE: INTEGER;
           STACKTOP, TOPNEW, TOPMAX: INTEGER;
           LCMAX,LLC1: ADDRRANGE; LCP: CTP;
           LLP: LBP; FILDEC: BOOLEAN;
           EXTP1,EXTP2,EXFP: EXTFILEP;
           TMPTR: OFLPTR;


       PROCEDURE MES (I: INTEGER);

       (* Keeps track of upper bound TOPMAX on run time stack *)
       (* for use in allocating stack frame. This procedure *)
       (* handles instructions. *)

       BEGIN
       TOPNEW := TOPNEW + CDX [I] * MAXSTACK;
       IF TOPNEW > TOPMAX THEN TOPMAX := TOPNEW
       END;



       PROCEDURE MEP (I: INTEGER);

       (* Manipulates TOPMAX similar to procedure MES, *)
       (* except it handles standard procedures. *)

       BEGIN
       TOPNEW := TOPNEW + I * MAXSTACK;
       IF TOPNEW > TOPMAX THEN TOPMAX := TOPNEW
       END;



       PROCEDURE GEN0 (FOP: OPRANGE);

       (* Generates an interpreter instruction (call) of type *)
       (* type FOP with no arguments (parameters) *)

       BEGIN
       IF PRCODE THEN BEGIN
          WRITELN (PRR, ' ':6, 'CALL', MN [FOP]);
          IC := IC + 1; MES (FOP)
          END
       END (*GEN0*) ;



       PROCEDURE GEN1 (FOP: OPRANGE; FP2: INTEGER);

       (* generates a call of type FOP if FOP <> 30 with 1 argument FP2 *)
       (* else generates a call to standard function of type FP2 with   *)
       (* no arguments --- CSP is a noexistent mnemonic                 *)

       VAR
          K: INTEGER;

       BEGIN
       IF PRCODE THEN
         IF FOP = 30 THEN BEGIN   (* SPECIAL CASE FOR CSP *)
           WRITELN (PRR, ' ':6, 'CALL', SNA [FP2]);
           IC := IC + 1;
           TOPNEW := TOPNEW + PDX [FP2] * MAXSTACK;
           IF TOPNEW > TOPMAX THEN TOPMAX := TOPNEW
           END
         ELSE BEGIN
           WRITE (PRR, ' ':6, 'CALL', MN [FOP], '(');
           WRITE (PRR, FP2:1);
           WRITELN (PRR, ')');
           MES (FOP);
           IC := IC + 1
           END
       END; (*GEN1*)



       PROCEDURE GEN2 (FOP: OPRANGE; FP1, FP2: INTEGER);

       (* Generates a call of type FOP with 2 arguments, FP1 and FP2 *)
       (* if FOP <> 30, else generates a call to standard procedure  *)
       (* FP1 with 1 argument, FP2                                   *)

       VAR   K: INTEGER; C: CHAR;

       BEGIN
       IF PRCODE THEN
         IF FOP = 30 THEN BEGIN   (* SPECIAL CASE FOR CSP *)
           WRITELN (PRR, ' ':6, 'CALL', SNA [FP1], '(', FP2:1, ')');
           IC := IC + 1;
           TOPNEW := TOPNEW + PDX [FP1] * MAXSTACK;
           IF TOPNEW > TOPMAX THEN TOPMAX := TOPNEW
           END
         ELSE BEGIN
           WRITE (PRR, ' ':6, 'CALL', MN [FOP], '(');
           IF FOP = 45 THEN
              WRITE (PRR, 'INTL(', FP1:1, '), INTL(', FP2:1, ')')
           ELSE WRITE (PRR, FP1:1, ',', FP2:1);
           WRITELN (PRR, ')');
           IC := IC + 1;
           MES (FOP)
           END
       END; (*GEN2*)



       PROCEDURE GENTYPINDICATOR (FSP: STP);

       (* Determines the type indicator of the given structure, *)
       (* and prints it on output file PRR in calls to the Fortran *)
       (* (Ratfor) interpreter routines. *)

         BEGIN
            IF FSP <> NIL THEN
               WITH FSP^ DO
                  CASE FORM OF
                     SCALAR:
                        IF FSP = INTPTR THEN WRITE (PRR, '1')
                        ELSE IF FSP = BOOLPTR THEN WRITE (PRR, '3')
                        ELSE IF FSP = CHARPTR THEN WRITE (PRR, '6')
                        ELSE IF SCALKIND = DECLARED THEN WRITE (PRR, '1')
                        ELSE WRITE (PRR, '2');   (* REAL *)
                     SUBRANGE: GENTYPINDICATOR (RANGETYPE);
                     POINTER:  WRITE (PRR, '0');
                     POWER:    WRITE (PRR, '4');
                     RECORDS,
                     ARRAYS:   WRITE (PRR, '5');
                     FILES,
                     TAGFLD,
                     VARIANT:  ERROR(352)
                     END
         END; (* GENTYPINDICATOR *)



       PROCEDURE GENTYPSUFFIX (FSP: STP);

         BEGIN
            IF FSP <> NIL THEN
               IF FSP^.FORM = POWER THEN
                  WRITE (PRR, 'S')
               ELSE IF FSP^.FORM = POINTER THEN
                  WRITE (PRR, 'A')
          END; (* GENTYPSUFFIX *)



       PROCEDURE GEN0T (FOP: OPRANGE; FSP: STP);

         BEGIN
            IF PRCODE THEN BEGIN
               WRITE (PRR, ' ':6, 'CALL', MN [FOP], '(');
               GENTYPINDICATOR (FSP);  WRITELN (PRR, ')');
               IC := IC + 1;  MES (FOP)
               END
         END; (* GEN0T *)



       PROCEDURE GEN1T (FOP: OPRANGE; FP2: INTEGER; FSP: STP);

       (* Generates an interpreter call of type FOP with 2 *)
       (* arguments, 1 of which is the type indicator and the *)
       (* other is FP2. *)

         BEGIN
            IF PRCODE THEN BEGIN
               WRITE (PRR, ' ':6, 'CALL', MN [FOP], '(');
               GENTYPINDICATOR (FSP);
               IF (FOP <> 31) AND (FOP <> 34) AND (FOP <> 51) THEN
                  WRITELN (PRR, ',', FP2:1, ')')
               ELSE
                  WRITELN (PRR, ',', 'INTL(', FP2:1, '))');
               IC := IC + 1;  MES (FOP)
               END
         END; (* GEN1T *)



       PROCEDURE GEN2T (FOP: OPRANGE; FP1, FP2: INTEGER; FSP: STP);

       BEGIN
          IF PRCODE THEN BEGIN
             WRITE (PRR, ' ':6, 'CALL', MN [FOP]);
             GENTYPSUFFIX (FSP);
             IF FOP = 45 THEN  (* CHK *)
                WRITELN (PRR, '(INTL(', FP1:1, '),INTL(', FP2:1, '))')
             ELSE
                WRITELN (PRR, '(', FP1:1, ',', FP2:1, ')');
             IC := IC + 1;  MES (FOP)
             END
       END; (* GEN2T *)



       PROCEDURE GENLDC (FSP: STP; VAR CVAL: VALU);


       BEGIN
          IF PRCODE THEN BEGIN
             WRITE (PRR, ' ':6, 'CALL P$LDC(');
             IF FSP^.FORM = POWER THEN BEGIN
              (* put set descriptor on stack before loading set *)
                GENTYPINDICATOR (INTPTR);
                WRITE (PRR, ',');
                WRITE (PRR, 'INTL(');
                WITH CVAL.VALP^ DO BEGIN
                   WRITELN ( PRR, (FIRST*256+LAST):1, '))' );
                   IC := IC + 1;
                   WRITE (PRR, ' ':6, 'CALL P$LDC(');
                   GENTYPINDICATOR (FSP);
                   WRITE (PRR, ',');
                   WRITE (PRR, 'INTL(', (SETSTART + START):1, ')' );
                   MEP(7);
                   END
                END (* SET CONSTANT *)
             ELSE BEGIN
                GENTYPINDICATOR (FSP);
                WRITE (PRR, ',');
                IF FSP = REALPTR THEN
                   WITH CVAL.VALP^ DO
                      FOR K := 1 TO DIGLIMIT DO
                         WRITE (PRR, RVAL [K])
                ELSE (* INTEGER *)
                   WRITE (PRR, 'INTL(', CVAL.IVAL:1, ')');
                END;
             WRITELN (PRR, ')');
             IC := IC + 1; MES (51)
             END
       END;  (* GENLDC *)



       PROCEDURE LOADSETDESC (P:STP);

       VAR   LMIN, LMAX : INTEGER;

       BEGIN
       IF PRCODE THEN BEGIN
          GETBOUNDS ( P^.ELSET, LMIN, LMAX);
          WRITELN (PRR, ' ':6, 'CALL P$LDC(1,','INTL(',
                   ((LMIN DIV 32) * 256 + (LMAX DIV 32)):1, '))' );
          IC := IC + 1
          END
       END (* LOADSETDESC *);



       PROCEDURE LOAD;

       BEGIN
          WITH GATTR DO
             IF TYPTR <> NIL THEN BEGIN
                CASE KIND OF
                   CST:
                      GENLDC (TYPTR, CVAL); (*LEBLANC*)
                   VARBL:
                      BEGIN
                      IF TYPTR^.FORM = POWER THEN BEGIN
                         LOADSETDESC (TYPTR);
                         MEP(7)   END;
                      CASE ACCESS OF
                         DRCT:
                            IF VLEVEL <= 1 THEN
                               GEN1T (39 (*LDO*), DPLMT, TYPTR)
                            ELSE
                               GEN2T (54 (*LOD*), LEVEL-VLEVEL, DPLMT, TYPTR);
                         INDRCT: GEN1T (35 (*IND*), IDPLMT, TYPTR);
                         INXD:   GEN0 (61  (*LPC*))
                         END;
                      END;
                   EXPR:
                   END;
                KIND := EXPR
                END
       END; (*LOAD*)



       PROCEDURE STORE (VAR FATTR: ATTR);

       BEGIN
         WITH FATTR DO
           IF TYPTR <> NIL THEN
             BEGIN
             IF TYPTR^.FORM = POWER THEN BEGIN
                LOADSETDESC (TYPTR);
                MEP(-7)   END;
             CASE ACCESS OF
               DRCT:   IF VLEVEL <= 1 THEN GEN1T(43(*SRO*),DPLMT,TYPTR)
                       ELSE GEN2T(56(*STR*),LEVEL-VLEVEL,DPLMT,TYPTR);
               INDRCT: IF IDPLMT <> 0 THEN ERROR(353)
                       ELSE GEN0T(26(*STO*),TYPTR);
               INXD:   GEN0(62 (*SPC*))
               END
             END
       END (*STORE*) ;

       PROCEDURE LOADADDRESS;
       BEGIN
         WITH GATTR DO
           IF TYPTR <> NIL THEN
             BEGIN
               CASE KIND OF
                 CST:   IF STRING(TYPTR) THEN
                     WITH CVAL.VALP^ DO
                        GEN1(38(*LCA*),STARTINDEX DIV 4 + STRINGSTART)
                    ELSE ERROR(356);
                 VARBL: BEGIN
                        CASE ACCESS OF
                          DRCT:   IF VLEVEL <= 1 THEN GEN1(37(*LAO*),DPLMT)
                                  ELSE GEN2(50(*LDA*),LEVEL-VLEVEL,DPLMT);
                          INDRCT: IF IDPLMT <> 0 THEN
                                    GEN1T(34(*INC*),IDPLMT,NILPTR);
                          INXD:   ERROR(354)
                          END
                        END;
                 EXPR:  ERROR(355)
               END;
               KIND := VARBL; ACCESS := INDRCT; IDPLMT := 0
             END
       END (*LOADADDRESS*) ;


       PROCEDURE GENFJP(FADDR: INTEGER);
       BEGIN LOAD;
         IF GATTR.TYPTR <> NIL THEN
           IF GATTR.TYPTR <> BOOLPTR THEN ERROR(144);
         IF PRCODE THEN  WRITELN(PRR,' ':6, 'CALL',MN[33],'($',FADDR:1,')');
         IC := IC + 1; MES(33)
       END (*GENFJP*) ;

       PROCEDURE GENUJPXJP(FOP: OPRANGE; FP2: INTEGER);
      BEGIN
        IF PRCODE THEN
             IF FOP=57 THEN WRITELN(PRR,' ':6, 'GOTO ',FP2:1) ELSE
                WRITELN(PRR,' ':6, 'CALL',MN[FOP]:6,'($',FP2:1,')');
               IC := IC + 1; MES(FOP)
       END (*GENUJPENT*);


       PROCEDURE GENCUPENT(FOP: OPRANGE; FP1, FP2: INTEGER);

       (* Generates call FOP and subroutine entry *)
         (* FP1 - # locations needed for proc/func parameters *)
                  (* if FOP is P$CUP, ie. 'call user procedure' *)
         (* FP2 - integer label name of proc/func *)

       BEGIN
       IF PRCODE THEN BEGIN
           WRITELN(PRR,' ':6, 'CALL',MN[FOP]:6,'(',FP1:1,')');
           WRITELN (PRR, ' ':6, 'CALL P', FP2:1) END;
       IC := IC + 2; MES(FOP)
       END;

       PROCEDURE GENFENT(FOP: OPRANGE; LOCS: INTEGER; NAME: ALPHA;
         FCP: CTP);

       (* Generate a Fortran Proc/func entry and return *)

       VAR
         USED : INTEGER;         (* stack locations used so far *)
         FIRST : BOOLEAN;        (* first parameter in list *)
         NXT: CTP;               (* ptr to parameter id's *)

       BEGIN
       NXT := FCP^.NEXT;         (* set ptr to head of parameter list *)
       USED := 1;  FIRST := TRUE;
       NAME[7] := ' ';           (* force the proc/func name to *)
       NAME[8] := ' ';             (* be only 6 characters *)
       IF PRCODE THEN
         BEGIN
                                 (* generate proc/func call *)
         WRITELN(PRR, ' ':6, 'CALL', MN[FOP]:6, '(', LOCS:1, ')');
                                 (* generate block entry calls *)
         GEN2 (32 (*ENT*), 1, LOCS+4);
                                 (* space for stack frame + parameters *)
         GEN2 (32 (*ENT*), 2, 0);  (* no space needed by Fortran *)
                                   (* routine on Pascal stack for *)
                                   (* expr evaluation temporaries *)
         IF FCP^.KLASS = PROC THEN
           WRITE(PRR, ' ':6, 'CALL ')
         ELSE                    (* it is a function *)
           IF FCP^.IDTYPE = REALPTR THEN
             WRITE (PRR, ' ':6, 'STORER (SP -', LOCS+4, ') = ')
           ELSE                  (* use integer STORE *)
             WRITE (PRR, ' ':6, 'STORE (SP -', LOCS+4, ') = ');
         WRITE(PRR, NAME:6);
         WHILE USED <= LOCS DO   (* for each parameter *)
           BEGIN
           IF FIRST THEN
             BEGIN
             FIRST := FALSE;
             WRITE(PRR, '(')
             END
           ELSE
             WRITE(PRR, ', ');
           IF NXT^.VKIND = ACTUAL THEN   (* value parameter *)
             WRITE(PRR, 'STORE(SP-', (LOCS-USED):1, ')')
           ELSE  (* reference parameter (FORMAL) *)
             WRITE(PRR, 'STORE(STORE(SP-', (LOCS-USED):1, '))');
           USED := USED + 1;
           NXT := NXT^.NEXT
           END;
         WRITELN(PRR, ')');
         IF FCP^.KLASS = PROC THEN
           GEN1(42(*RET*),0)
         ELSE
           GEN1(42(*RET*),1);
         IC := IC + 3;
         MES(FOP); MES(42)
         END
       END;  (* GENFENT *)


   (*-------END THIS BLOCK OF ADJUSTMENTS TO 'WRITE' STMTS  ---------*)

       PROCEDURE CHECKBNDS(FSP: STP);
         VAR LMIN,LMAX: INTEGER;
       BEGIN
         IF FSP <> NIL THEN
           IF FSP <> INTPTR THEN
             IF FSP <> REALPTR THEN
               IF FSP^.FORM <= SUBRANGE THEN
                 BEGIN
                   GETBOUNDS(FSP,LMIN,LMAX);
                   GEN2T(45(*CHK*),LMIN,LMAX,FSP)
                 END
       END (*CHECKBNDS*);


       FUNCTION CHECKNEED (TP1, TP2 : STP) : BOOLEAN;

       VAR MIN1, MIN2, MAX1, MAX2 : INTEGER;

       BEGIN
          IF INITCHECKS THEN CHECKNEEDED := TRUE
          ELSE IF NOT RANGECHECKS THEN CHECKNEEDED := FALSE
          ELSE IF TP1 = REALPTR THEN CHECKNEEDED := FALSE
          ELSE BEGIN
             GETBOUNDS (TP1, MIN1, MAX1);
             GETBOUNDS (TP2, MIN2, MAX2);
             CHECKNEEDED := (MIN2 < MIN1) OR (MAX2 > MAX1)
             END
       END (* CHECKNEEDED *);


       PROCEDURE PUTLABEL(LABNAME: INTEGER);
         BEGIN
            IF PRCODE THEN BEGIN
               WRITELN (PRR, LABNAME:5, ' CONTINUE');
               IC := IC + 1
               END
         END;  (* PUTLABEL *)



