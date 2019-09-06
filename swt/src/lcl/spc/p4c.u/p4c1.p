  (**********************************************
   *                                            *
   *         PORTABLE PASCAL COMPILER           *
   *         ************************           *
   *                                            *
   *                PASCAL P4                   *
   *                                            *
   *                                            *
   *     AUTHORS:                               *
   *              URS AMMANN                    *
   *              KESAV NORI                    *
   *              CHRISTIAN JACOBI              *
   *                                            *
   *     ADDRESS:                               *
   *                                            *
   *          INSTITUT FUER INFORMATIK          *
   *          EIDG. TECHNISCHE HOCHSCHULE       *
   *          CH-8096 ZUERICH                   *
   *                                            *
   *                                            *
   *     LAST CHANGES COMPLETED IN MAY 79       *
   *                                            *
   *     MODIFIED FOR PR1ME 400 AT GEORGIA      *
   *          INSTITUTE OF TECHNOLOGY           *
   **********************************************)


 PROGRAM  PASCALCOMPILER (INPUT, OUTPUT, PRR);

 (*$C   indicates to the compiler that a new version is being compiled *)

 CONST
   REVISION         = 3;
   VERSION          = 2;
   LINESPERPAGE     = 56;
   DISPLIMIT        = 20;
   MAXLEVEL         = 10;          (* max procedure nesting level *)
   INTSIZE          = 1;
   MAXSTRGINDEX     = 24575;
   MAXSETINDEX      = 399;
   STRINGSTART      = 26223;
   SETSTART         = 32367;
   INTAL            = 1;
   REALSIZE         = 1;
   REALAL           = 1;
   CHARSIZE         = 1;
   CHARAL           = 1;
   CHARMAX          = 1;
   BOOLSIZE         = 1;
   BOOLAL           = 1;
   PTRSIZE          = 1;
   ADRAL            = 1;
   SETSIZE          = 2;
   SETAL            = 1;
   STACKELSIZE      = 1;
   STACKAL          = 1;
   STRGLGTH         = 128;
   SETHIGH          = 255;
   SETLOW           = 0;
   MAXBIT           = 31;
   ORDMAXCHAR       = 377B;
   ORDMINCHAR       = 200B;
   LCAFTERMARKSTACK = 5;
   MAXINT           = 17777777777B;
   FILEAL           = CHARAL;

   (* STACKELSIZE   = MINIMUM SIZE FOR 1 STACKELEMENT
                    = K * STACKAL
      STACKAL       = SCM (ALL OTHER ALIGNMENT CONSTANTS)
      CHARMAX       = SCM (CHARSIZE, CHARAL)
      LCAFTERMARKSTACK >= 4 * PTRSIZE + MAX (X - SIZE)
                        = K1 * STACKELSIZE          *)
   MAXSTACK         = 2;
   PARMAL           = STACKAL;
   PARMSIZE         = STACKELSIZE;
   RECAL            = STACKAL;
   FILEBUFFER       = 8;   (* allocation for 4 standard text files *)
   MAXADDR          = 32767;
   DIGMAX           = 15;
   DIGLIMIT         = 16; (* DIGMAX + 1 *)



 TYPE                              (*DESCRIBING:*)
                                   (*************)


                                   (*BASIC SYMBOLS*)
                                   (***************)

   SYMBOL =   (IDENT, INTCONST, REALCONST, STRINGCONST, NOTSY,
               MULOP, ADDOP, RELOP, LPARENT, RPARENT, LBRACK,
               RBRACK, COMMA, SEMICOLON, PERIOD, ARROW, COLON,
               BECOMES, LABELSY, CONSTSY, TYPESY, VARSY, FUNCSY,
               PROGSY, PROCSY, SETSY, PACKEDSY, ARRAYSY, RECORDSY,
               FILESY, FORWARDSY, BEGINSY, IFSY, CASESY, REPEATSY,
               WHILESY, FORSY, WITHSY, GOTOSY, ENDSY, ELSESY,
               EXTERNSY, FORTRANSY, LCURBRK, RCURBRK, DQUOTE,
               UNTILSY, OFSY, DOSY, TOSY, DOWNTOSY, THENSY, OTHERSY);

   OPERATOR = (MUL, RDIV, ANDOP, IDIV, IMOD, PLUS, MINUS, OROP,
               LTOP, LEOP, GEOP, GTOP, NEOP,EQOP,INOP,NOOP);

   SETOFSYS = SET OF SYMBOL;

   CHTP = (LETTER, NUMBER, SPECIAL, ILLEGAL);

                                   (*CONSTANTS*)
                                   (***********)

   CSTCLASS = (REEL, PSET, STRG);

   STRINGBUFFER = PACKED ARRAY [1..STRGLGTH] OF CHAR;

   CSP = ^ CONSTANT;
   CONSTANT = RECORD
     CASE CCLASS: CSTCLASS OF
       REEL: (RVAL: PACKED ARRAY [1..DIGLIMIT] OF CHAR);
       PSET: (START: 0..MAXSETINDEX;
              FIRST, LAST : 0..7);
       STRG: (SLGTH: 0..STRGLGTH;
              STARTINDEX : 0..MAXSTRGINDEX)
     END;

   VALU = RECORD
     CASE INTVAL: BOOLEAN OF
       TRUE:  (IVAL: INTEGER);
       FALSE: (VALP: CSP)
     END;

                                    (*DATA STRUCTURES*)
                                    (*****************)
   LEVRANGE = 0..MAXLEVEL;
   ADDRRANGE = 0..MAXADDR;
   OPRANGE = 0..65;
   SNRANGE = 1..29;

   STRUCTFORM =  (SCALAR, SUBRANGE, POINTER, POWER, ARRAYS,
                  RECORDS, FILES, TAGFLD, VARIANT);

   DECLKIND = (STANDARD, DECLARED);

   STP = ^STRUCTURE;
   CTP = ^IDENTIFIER;

   STRUCTURE = PACKED RECORD
     MARKED: BOOLEAN;              (* for test phase only *)
     PACKEDSTRUCT: BOOLEAN;
     SIZE: ADDRRANGE;
     CASE FORM: STRUCTFORM OF
       SCALAR:   (
         CASE SCALKIND: DECLKIND OF
           DECLARED: (FCONST: CTP));
       SUBRANGE: (
       RANGETYPE: STP;
         MIN, MAX:  VALU);
       POINTER:  (ELTYPE: STP);
       POWER:    (ELSET: STP);
       ARRAYS:   (AELTYPE, INXTYPE: STP);
       RECORDS:  (
         FSTFLD: CTP;
         RECVAR: STP);
       FILES:    (FILTYPE: STP);
       TAGFLD:   (
         TAGFIELDP: CTP;
         FSTVAR: STP);
       VARIANT:  (
         NXTVAR, SUBVAR: STP;
         VARVAL: VALU)
     END;

                                   (*NAMES*)
                                   (*******)

   IDCLASS = (TYPES, KONST, VARS, FIELD, PROC, FUNC);
   SETOFIDS = SET OF IDCLASS;
   IDKIND = (ACTUAL, FORMAL);
   ALPHA = PACKED ARRAY [1..8] OF CHAR;

   IDENTIFIER = PACKED RECORD
     NAME: ALPHA;
     LLINK, RLINK: CTP;
     IDTYPE: STP;
     NEXT: CTP;
     CASE KLASS: IDCLASS OF
       KONST: (VALUES: VALU);
       VARS:  (
         VKIND: IDKIND;
         VLEV:  LEVRANGE;
         VADDR: ADDRRANGE);
       FIELD: (FLDADDR: ADDRRANGE);
       PROC,
       FUNC: (
         CASE PFDECKIND: DECLKIND OF
           STANDARD: (KEY: 1..16);
           DECLARED: (
             PFLEV: LEVRANGE;
             (* static level at which proc was declared *)
             PFNAME: INTEGER;
             CASE PFKIND: IDKIND OF
               (* forward, external, fortran procedure declarations *)
               ACTUAL: (
                 FORWDECL: BOOLEAN;
                 EXTDECL: BOOLEAN;
                 CASE FORTDECL: BOOLEAN OF
                   TRUE: (NEXTFFUNC: CTP))))
     END;


   DISPRANGE = 0..DISPLIMIT;
   WHERE = (BLCK, CREC, VREC, REC);

                                   (*EXPRESSIONS*)
                                   (*************)
   ATTRKIND = (CST, VARBL, EXPR);
   VACCESS = (DRCT, INDRCT, INXD);

   ATTR = RECORD
     TYPTR: STP;
     CASE KIND: ATTRKIND OF
       CST:   (CVAL: VALU);
       VARBL: (
         CASE ACCESS: VACCESS OF
           DRCT: (
             VLEVEL: LEVRANGE;
             DPLMT: ADDRRANGE);
           INDRCT: (IDPLMT: ADDRRANGE))
     END;

   MAXSET = SET OF 0 .. SETHIGH;
   WORDSET = SET OF 0 .. MAXBIT;

   TESTP = ^TESTPOINTER;
   TESTPOINTER = PACKED RECORD
     ELT1, ELT2: STP;
     LASTTESTP:  TESTP
     END;

                                   (*LABELS*)
                                   (********)
   LBP = ^LABL;
   LABL = RECORD
     NEXTLAB: LBP;
     DEFINED: BOOLEAN;
     LABVAL, LABNAME: INTEGER
     END;

   EXTFILEP = ^FILEREC;
   FILEREC = RECORD
     FILENAME: ALPHA;
     NEXTFILE: EXTFILEP
     END;

   OFLPTR = ^OFLNODE;
   OFLNODE = RECORD
     TYP: BOOLEAN;
     AFLG: LEVRANGE;
     FADDR,FLEV: INTEGER;
     FNAME: ALPHA;
     LNK: OFLPTR
     END;

 (*-------------------------------------------------------------------------*)


 VAR
                                   (*RETURNED BY SOURCE PROGRAM SCANNER*)
                                   (************************************)

   SY:         SYMBOL;             (* last symbol *)
   OP:         OPERATOR;           (* classification of last symbol *)
   VAL:        VALU;               (* value of last constant *)
   LGTH:       INTEGER;            (* length of last string constant *)
   ID:         ALPHA;              (* last ident (possibly truncated) *)
   CH:         CHAR;               (* last character *)
   EOL:        BOOLEAN;            (* end of line flag *)


                                   (*COUNTERS:*)
                                   (***********)

   CHCNT:      INTEGER;            (* character counter *)
   LC:         ADDRRANGE;          (* data location counter *)
   IC:         ADDRRANGE;          (* instruction counter *)
   LINECOUNT:  INTEGER;            (* lines remaining on listing page *)
   LINENUMBER: INTEGER;            (* current source line number *)
   PAGENUMBER: INTEGER;            (* current listing page number *)
   BEGINLEVEL: INTEGER;            (* number of unpaired begins *)
   LASTLINENO: INTEGER;            (* last lineno value in code *)


                                   (*SWITCHES:*)
                                   (***********)

   DP:         BOOLEAN;            (* declaration part *)
   PRTERR:     BOOLEAN;            (* allow forward refs in ptr type *)
                                   (* compiler output options for: *)
   LIST:       BOOLEAN;            (*   source program listing *)
   PRCODE:     BOOLEAN;            (*   printing symbolic code *)
   PRTABLES:   BOOLEAN;            (*   internal tables *)
   COMPCODE:   BOOLEAN;            (*   compiling new compiler *)
   RANGECHECKS:BOOLEAN;            (* flags controlling runtime checks *)
   INITCHECKS: BOOLEAN;
   PTRCHECKS:  BOOLEAN;
   TRACEOPT:   BOOLEAN;            (* generate code for runtime trace *)
   INPFLG,OUTFLG,
   KBDFLG,PRRFLG: BOOLEAN;         (* indicates presence of file in heading *)


                                   (*POINTERS:*)
                                   (***********)

   PARMPTR:    STP;

   INTPTR:     STP;                (* pointers to standard ids *)
   REALPTR:    STP;
   CHARPTR:    STP;
   BOOLPTR:    STP;
   NILPTR:     STP;
   TEXTPTR:    STP;

   UTYPPTR:    CTP;                (* pointers to undeclared ids *)
   UCSTPTR:    CTP;
   UVARPTR:    CTP;
   UFLDPTR:    CTP;
   UPRCPTR:    CTP;
   UFCTPTR:    CTP;

   FWPTR:      CTP;                (* head of list of FORWDECL type ids *)
   FORTFUNC:   CTP;                (* head of list of external *)
                                     (* Fortran functions *)
   LASTFFUNC:  CTP;                (* ptr to last node added to list *)
   FEXTFILEP:  EXTFILEP;           (* head of list of external files *)
   GLOBTESTP:  TESTP;              (* last testpointer *)


                                   (*BOOKKEEPING OF DECLARATION LEVELS:*)
                                   (************************************)

   LEVEL:      LEVRANGE;           (* current static level *)
   DISX:       DISPRANGE;          (* level of last id searched *)
   TOP:        DISPRANGE;          (* top of display *)

   DISPLAY:
     ARRAY [DISPRANGE] OF
       PACKED RECORD
         FNAME:  CTP;
         FLABEL: LBP;
         FFILE: OFLPTR;
         CASE OCCUR: WHERE OF      (*
           BLCK:                         id is variable id *)
           CREC: (CLEV:  LEVRANGE; (* rec field with constant address *)
                  CDSPL: ADDRRANGE);
           VREC: (VDSPL: ADDRRANGE) (* rec field with variable address *)
         END;


                                   (*ERROR MESSAGES:*)
                                   (*****************)

   ERRINX: 0..10;                  (* # of errors in current source line *)
   ERRKTR: 0..400;                 (* number of errors in program *)
   ERRLIST:
     ARRAY [1..10] OF
       PACKED RECORD
         POS: INTEGER;             (* position of error in line *)
         NMR: 1..400               (* number of error that occurred *)
         END;
   ERRSET1: SET OF 1..255;         (* indicates errors found *)
   ERRSET2: SET OF 1..150;
   ERRLASTLIN: INTEGER;            (* last source line with an error *)




                                   (*EXPRESSION COMPILATION:*)
                                   (*************************)

   GATTR:         ATTR;            (* describes the expr currently compiled *)


                                   (*STRUCTURED CONSTANTS:*)
                                   (***********************)

   CONSTBEGSYS:   SETOFSYS;
   SIMPTYPEBEGSYS:SETOFSYS;
   TYPEBEGSYS:    SETOFSYS;
   BLOCKBEGSYS:   SETOFSYS;
   SELECTSYS:     SETOFSYS;
   FACBEGSYS:     SETOFSYS;
   STATBEGSYS:    SETOFSYS;
   TYPEDELS:      SETOFSYS;

   CHARTP :       ARRAY [CHAR] OF CHTP;
   RW:            ARRAY [1..37] OF ALPHA;
   FRW:           ARRAY [1..9] OF 1..38;
   RSY:           ARRAY [1..37] OF SYMBOL;
   SSY:           ARRAY [CHAR] OF SYMBOL;
   ROP:           ARRAY [1..37] OF OPERATOR;
   SOP:           ARRAY [CHAR] OF OPERATOR;
   NA:            ARRAY [1..38] OF ALPHA;
   EM:            ARRAY [1..400] OF PACKED ARRAY [1..50] OF CHAR; (* error messages table *)
   MN:            ARRAY [OPRANGE] OF PACKED ARRAY [1..6] OF CHAR;
   SNA:           ARRAY [SNRANGE] OF PACKED ARRAY [1..6] OF CHAR;
   CDX:           ARRAY [OPRANGE] OF -8..+8;
   PDX:           ARRAY [SNRANGE] OF -7..+7;
   ORDINT:        ARRAY ['0'..'9'] OF INTEGER;
   PATHNAME:      ARRAY [1..101] OF CHAR;
   THETIME,                        (* time and date for page heading *)
   THEDATE:       ARRAY [1..8] OF CHAR;

   MXINT10:       INTEGER;
   INTLABEL:      INTEGER;
   LCP:           CTP;


 (*--------------BEGIN  CONSTANT TABLE VARIABLES------------------*)

   STRGTABLE:     PACKED ARRAY [0..MAXSTRGINDEX] OF CHAR;
   SETTABLE:      ARRAY [0..MAXSETINDEX] OF WORDSET;
   I:             INTEGER;
   J:             INTEGER;
   K:             INTEGER;
   STRGINDEX:     INTEGER;
   SETINDEX:      INTEGER;

 (*---------------END  CONSTANT TABLE VARIABLES-------------------*)

 (*-------------------------------------------------------------------------*)




   PROCEDURE PRINTHEADINGS;

   BEGIN
     PAGENUMBER := PAGENUMBER + 1;
  (* WRITELN (OUTPUT, '1'); *)
     PAGE(OUTPUT); WRITELN (OUTPUT, ' ');
     WRITE (OUTPUT, ' ', 'GEORGIA TECH ', 'PASCAL P4 - ');
     WRITE (OUTPUT, 'REVISION ', REVISION:1, '.', VERSION:1, ' ':8);
     FOR K := 1 TO 8 DO WRITE (OUTPUT, THETIME[K]); WRITE(OUTPUT, ' ':4);
     FOR K := 1 TO 8 DO WRITE (OUTPUT, THEDATE[K]);
     WRITELN (OUTPUT, ' ':24, 'PAGE ', PAGENUMBER:1);
     WRITELN (OUTPUT, ' '); WRITELN (OUTPUT, ' ');
     LINENUMBER := LINESPERPAGE
   END;



   PROCEDURE ENDOFLINE;

   VAR
     LASTPOS,                      (* saves last error position *)
     FREEPOS,                      (* position of blanks *)
     CURRPOS,                      (* current position of an error *)
                                      (* in the source listing line *)
     CURRNMR,                      (* current error number *)
     F,                            (* number of digits in error number *)
     K: INTEGER;                   (* index *)

   BEGIN
   IF ERRINX > 0 THEN BEGIN        (* output error messages *)
     LINENUMBER := LINENUMBER - 2; (* decrement lines left on page *)
     WRITE (OUTPUT, ' ', '*****':5, ' ':15);
     LASTPOS := 0; FREEPOS := 1;
     FOR K := 1 TO ERRINX DO BEGIN
       WITH ERRLIST [K] DO BEGIN
         CURRPOS := POS; CURRNMR := NMR END;
       IF CURRPOS = LASTPOS THEN WRITE (OUTPUT,',') (* put ',' between error #s *)
       ELSE BEGIN
         WHILE FREEPOS < CURRPOS DO BEGIN
           WRITE (OUTPUT,' '); FREEPOS := FREEPOS + 1 END; (* skip to next error *)
         WRITE (OUTPUT,'^');
         LASTPOS := CURRPOS
         END;
       IF CURRNMR < 10 THEN F := 1 (* leave space for error number *)
       ELSE IF CURRNMR < 100 THEN F := 2
       ELSE F := 3;
       WRITE(OUTPUT,CURRNMR:F);
       FREEPOS := FREEPOS + F + 1
       END;
     WRITELN (OUTPUT);
     IF ERRLASTLIN > 0 THEN        (* this is not first error *)
        WRITELN (OUTPUT, ' ':21, 'LAST ERROR AT LINE ', ERRLASTLIN)
     ELSE                          (* first error *)
        WRITELN (OUTPUT, ' ':21, 'FIRST ERROR');
     ERRLASTLIN := LINECOUNT;      (* save line # for next error *)
     ERRINX := 0
     END;
   LINECOUNT := LINECOUNT + 1;     (* increment line counter *)
   IF LIST AND (NOT EOF (INPUT)) THEN BEGIN
     LINENUMBER := LINENUMBER - 1;
     IF LINENUMBER < 1 THEN PRINTHEADINGS;
     WRITE (OUTPUT, ' ', LINECOUNT:5);
     WRITE (OUTPUT, (LEVEL - 1):4, BEGINLEVEL:3);
     IF DP THEN WRITE (OUTPUT, LC:7) ELSE BEGIN
       WRITE (OUTPUT, IC:7);
       END;
     WRITE (OUTPUT, ' ':1)
     END;
   CHCNT := 0
   END;  (*ENDOFLINE*)



   PROCEDURE ERROR (FERRNR: INTEGER);

   (* Saves up to 10 errors per source line and their positions *)

     PROCEDURE ADDERR (ERRNUM: INTEGER);

     (* Changes the set of errors found to include the latest one *)

     BEGIN
     IF ERRNUM <= 255 THEN         (* it goes in the first set *)
       ERRSET1 := ERRSET1 + [ERRNUM]
     ELSE    (* IT IS > 255 *)
       ERRSET2 := ERRSET2 + [ERRNUM - 255]
     END; (* ADDERR *)

   BEGIN
   IF ERRINX >= 9 THEN BEGIN
     ERRLIST [10].NMR := 255; ADDERR(FERRNR); ERRINX := 10 END
   ELSE BEGIN
     ERRINX := ERRINX + 1;
     ERRLIST [ERRINX].NMR := FERRNR;
     ADDERR(FERRNR)
     END;
   ERRLIST [ERRINX].POS := CHCNT - 1
   END; (*ERROR*)



   PROCEDURE PRINTERRMSGS;

   (* Print the error messages for the errors found *)

   VAR
     I: INTEGER;                   (* an index *)

   BEGIN
   WRITELN (OUTPUT); ERRKTR := 0;
   IF (ERRLASTLIN > 0) AND (ERRLASTLIN <> LINECOUNT) THEN
   (* if errlastlin = linecount message has already been printed *)
     WRITELN (OUTPUT, ' ':21, 'LAST ERROR AT LINE ', ERRLASTLIN);
   LINENUMBER := LINENUMBER - 1;
   IF LINENUMBER <= 7 THEN PRINTHEADINGS;
   WRITELN(OUTPUT, ' ');
   WRITELN(OUTPUT, ' ');
   IF (ERRSET1 <> [ ]) OR (ERRSET2 <> [ ]) THEN BEGIN (* errors exist *)
     WRITELN(OUTPUT, ' ':5, 'ERROR');     (* print column headings *)
     WRITELN(OUTPUT, ' ':5, 'NUMBER', ' ':5, 'MESSAGE');
     WRITELN(OUTPUT, ' ':5, '******':6, ' ':5, '*******':7);
     WRITELN(OUTPUT, ' ');
     LINENUMBER := LINENUMBER - 6;
     FOR I := 1 TO 255 DO          (* print each different error found *)
       IF I IN ERRSET1 THEN BEGIN
         WRITELN(OUTPUT, ' ':6, I:3, ' ':7, EM[I]);
         LINENUMBER := LINENUMBER - 1;
         IF LINENUMBER < 1 THEN PRINTHEADINGS;
         ERRKTR := ERRKTR + 1
         END;
     FOR I := 1 TO 145 DO
       IF I IN ERRSET2 THEN BEGIN
         WRITELN(OUTPUT, ' ':6, (I+255):3, ' ':7, EM[I + 255]);
         LINENUMBER := LINENUMBER - 1;
         IF LINENUMBER < 1 THEN PRINTHEADINGS;
         ERRKTR := ERRKTR + 1
         END
     END  (* printing *)
   END;  (* PRINTERRMSGS *)



   PROCEDURE NEXTCH(VAR TEST: BOOLEAN);

   (* Get the next character from input, ie. source program *)

   BEGIN
   IF EOL THEN BEGIN
     IF LIST THEN WRITELN (OUTPUT);
     ENDOFLINE
     END;
   IF NOT EOF (INPUT) THEN BEGIN
     EOL := EOLN (INPUT); READ (INPUT,CH);
     IF LIST AND NOT EOL THEN WRITE (OUTPUT,CH);
     CHCNT := CHCNT + 1
     END
   ELSE BEGIN
     WRITELN (OUTPUT,' ***** EOF ','ENCOUNTERED');
     TEST := FALSE
     END
   END;



   PROCEDURE INSYMBOL;
   (* Read next basic symbol of source program and return its *)
   (* description in the global variables SY, OP, ID, VAL and LGTH *)
   LABEL 1, 2, 3;
   VAR
     BASE: 8..10;    (* describes the base of integer constants *)
     I, K: INTEGER;
     DIGIT: PACKED ARRAY [1..DIGLIMIT] OF CHAR;
     STRING: STRINGBUFFER;
     LVP: CSP;
     TEST: BOOLEAN;
     C : CHAR;


     FUNCTION MAPUP (C: CHAR): CHAR;
     (* This function assumes the use of ASCII, and converts all *)
     (* letters to upper case *)
     BEGIN
     IF (C >= 'a') AND (C <= 'z') THEN
       MAPUP := CHR (ORD (C) - 32)
     ELSE
       MAPUP := C
     END;


     PROCEDURE OPTIONS;
     (* Sets compiler options *)
     VAR C : CHAR;
     BEGIN
     REPEAT
       NEXTCH(TEST);
       IF CH <> '*' THEN BEGIN
         C := CH; NEXTCH(TEST);
         IF C IN ['B','C','D','L','P','R','T'] THEN
           CASE C OF
             'T': TRACEOPT := CH = '+' ;
             'L': BEGIN
                  LIST := CH = '+';
                  IF NOT LIST THEN WRITELN (OUTPUT)
                  END;
             'B': PRCODE := CH = '+' ;
             'D': PRTABLES := CH = '+' ;
             'P': PTRCHECKS := CH = '+';
             'R': IF CH = '1' THEN BEGIN
                    RANGECHECKS := TRUE;
                    INITCHECKS := FALSE   END
                  ELSE IF CH = '2' THEN BEGIN
                    RANGECHECKS := TRUE;
                    INITCHECKS := TRUE   END
                  ELSE BEGIN
                    RANGECHECKS := FALSE;
                    INITCHECKS := FALSE   END;
             'C': COMPCODE := CH = '+'
           END (* CASE C *);
         NEXTCH(TEST)
         END
     UNTIL CH <> ','
     END; (*OPTIONS*)


   BEGIN (*INSYMBOL*)
   1:
   REPEAT
     WHILE (CH = ' ') AND NOT EOL DO NEXTCH(TEST);
     TEST := EOL;
     IF TEST THEN NEXTCH(TEST)
   UNTIL NOT TEST;
   IF CHARTP[CH] = ILLEGAL THEN BEGIN
     SY := OTHERSY; OP := NOOP;
     ERROR(399); NEXTCH(TEST)
     END
   ELSE
     CASE CH OF
       'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
       'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
       'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
       'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
       'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
       's', 't', 'u', 'v', 'w', 'x', 'y', 'z': BEGIN

         K := 0; ID := '        ';
         REPEAT
           IF K < 8 THEN BEGIN
             K := K + 1; ID [K] := MAPUP (CH) END;
           NEXTCH(TEST)
         UNTIL CHARTP [CH] IN [SPECIAL,ILLEGAL];
         FOR I := FRW [K] TO FRW [K+1] - 1 DO BEGIN
           IF RW [I] = ID THEN BEGIN
             SY := RSY [I]; OP := ROP [I]; GOTO 2 END
           END;
         SY := IDENT; OP := NOOP;
         2:
         END;


       '0', '1', '2', '3', '4', '5', '6', '7', '8', '9': BEGIN

         OP := NOOP; I := 0;
         REPEAT
           I := I + 1;
           IF I <= DIGMAX THEN DIGIT [I] := CH;
           NEXTCH(TEST)
         UNTIL CHARTP [CH] <> NUMBER;
         IF (CH = '.') OR (MAPUP (CH) = 'E') THEN BEGIN
           K := I;
           IF CH = '.' THEN BEGIN
             K := K + 1;
             IF K <= DIGMAX THEN DIGIT [K] := CH;
             NEXTCH(TEST);
               IF CH = '.' THEN BEGIN CH := ':'; GOTO 3 END;
               IF CHARTP [CH] <> NUMBER THEN ERROR (201)
               ELSE
                 REPEAT
                   K := K + 1;
                   IF K <= DIGMAX THEN DIGIT [K] := CH;
                   NEXTCH(TEST)
                 UNTIL CHARTP [CH] <>  NUMBER
               END;
             IF MAPUP (CH) = 'E' THEN BEGIN
               K := K + 1;
               IF K <= DIGMAX THEN DIGIT [K] := CH;
               NEXTCH(TEST);
               IF (CH = '+') OR (CH = '-') THEN BEGIN
                 K := K+ 1;
                 IF K <= DIGMAX THEN DIGIT [K] := CH;
                 NEXTCH(TEST)
                 END;
               IF CHARTP [CH] <> NUMBER THEN ERROR (201)
               ELSE
                 REPEAT
                   K := K + 1;
                   IF K <= DIGMAX THEN DIGIT [K] := CH;
                   NEXTCH(TEST)
                 UNTIL CHARTP [CH] <> NUMBER
               END;
             NEW(LVP,REEL); SY:= REALCONST; LVP^.CCLASS := REEL;
             WITH LVP^ DO BEGIN
               FOR I := 1 TO DIGLIMIT DO RVAL[I] := ' ';
               IF K <= DIGMAX THEN
                 FOR I := 2 TO K + 1 DO RVAL[I] := DIGIT[I-1]
               ELSE BEGIN
                 ERROR (203); RVAL [2] := '0';
                 RVAL[3] := '.'; RVAL[4] := '0'
                 END
               END;
             VAL.VALP := LVP
             END
           ELSE BEGIN
             3:
             IF CH = 'B' THEN BEGIN BASE := 8; NEXTCH(TEST) END
             ELSE BASE := 10;
             IF I > DIGMAX THEN BEGIN ERROR(203); VAL.IVAL := 0 END
             ELSE
               WITH VAL DO BEGIN
                 IVAL := 0;
                 FOR K := 1 TO I DO
                   IVAL := IVAL * BASE + ORDINT[DIGIT[K]];
                 SY := INTCONST
                 END
             END
         END;


       '''': BEGIN

         LGTH := 0; SY := STRINGCONST;  OP := NOOP;
         REPEAT
           REPEAT
             NEXTCH(TEST); LGTH := LGTH + 1;
             IF LGTH <= STRGLGTH THEN STRING[LGTH] := CH
           UNTIL (EOL) OR (CH = '''');
           IF EOL THEN ERROR(202) ELSE NEXTCH(TEST)
         UNTIL CH <> '''';
         LGTH := LGTH - 1;   (*NOW LGTH = NR OF CHARS IN STRING*)
         IF LGTH = 0 THEN ERROR(205)       (*PUG*)
         ELSE IF LGTH = 1 THEN
           VAL.IVAL := ORD (STRING [1])
         ELSE BEGIN
           NEW(LVP,STRG); LVP^.CCLASS:=STRG;
           IF LGTH > STRGLGTH THEN BEGIN
             ERROR(399); LGTH := STRGLGTH END;
           WITH LVP^ DO BEGIN
             SLGTH := LGTH;
             STARTINDEX := STRGINDEX;
             IF (STRGINDEX+SLGTH) <= (MAXSTRGINDEX-3) THEN BEGIN
               FOR K := 1 TO SLGTH DO BEGIN
                 STRGTABLE [STRGINDEX] := STRING [K];
                 STRGINDEX := STRGINDEX + 1
                 END;
               WHILE STRGINDEX MOD 4 <> 0 DO BEGIN
                 STRGTABLE [STRGINDEX] := ' ';
                 STRGINDEX := STRGINDEX + 1
                 END
               END
             ELSE ERROR(351)
             END;
           VAL.VALP := LVP
           END
         END;


       ':': BEGIN

          OP := NOOP; NEXTCH(TEST);
          IF CH = '=' THEN BEGIN
            SY := BECOMES; NEXTCH(TEST) END
          ELSE SY := COLON
          END;


       '.': BEGIN

          OP := NOOP; NEXTCH(TEST);
          IF CH = '.' THEN BEGIN
            SY := COLON; NEXTCH(TEST) END
          ELSE SY := PERIOD
          END;


       '<': BEGIN

          NEXTCH(TEST); SY := RELOP;
          IF CH = '=' THEN BEGIN
            OP := LEOP; NEXTCH(TEST) END
          ELSE IF CH = '>' THEN BEGIN
             OP := NEOP; NEXTCH(TEST) END
          ELSE OP := LTOP
          END;


       '>': BEGIN

          NEXTCH(TEST); SY := RELOP;
          IF CH = '=' THEN BEGIN
            OP := GEOP; NEXTCH(TEST) END
          ELSE OP := GTOP
          END;


       '(': BEGIN
          NEXTCH(TEST);
          IF CH = '*' THEN BEGIN
            NEXTCH(TEST);
            IF CH = '$' THEN OPTIONS;
            REPEAT
              WHILE (CH <> '*') AND NOT EOF(INPUT)  DO NEXTCH(TEST);
              NEXTCH(TEST)
            UNTIL (CH = ')') OR EOF(INPUT);
            NEXTCH(TEST); GOTO 1
            END;
          SY := LPARENT; OP := NOOP
          END;


       '{': BEGIN                  (* standard comment symbol *)

          NEXTCH(TEST);
          IF CH = '$' THEN OPTIONS;
          WHILE (CH <> '}') AND NOT EOF(INPUT) DO NEXTCH(TEST);
          NEXTCH(TEST); GOTO 1
          END;


       '"': BEGIN                 (* should be a pathname *)

          NEXTCH (TEST);
          I := 1;
          REPEAT
            REPEAT
              IF CHARTP[CH] IN [LETTER]
                THEN PATHNAME[I] := MAPUP(CH)
                ELSE PATHNAME[I] := CH;
              I := I + 1;
              NEXTCH(TEST);
              UNTIL (CH = '"') OR (I > 100);
            NEXTCH(TEST)
            UNTIL (CH <> '"') OR (I > 100);
          IF I > 100 THEN ERROR(261); SY := IDENT
          END;


       '*', '+', '-', '=', '/', ')','}',
       '[', ']', ',', ';', '^', '$': BEGIN

          SY := SSY [CH]; OP := SOP [CH];
          NEXTCH(TEST)
          END;


       ' ': SY := OTHERSY
       END    (* CASE *)
   END; (*INSYMBOL*)



   PROCEDURE SKIP(FSYS: SETOFSYS);

   (* Skip input string until relevant symbol found *)

   BEGIN
   IF NOT EOF(INPUT) THEN
     BEGIN WHILE NOT (SY IN FSYS) AND (NOT EOF(INPUT)) DO INSYMBOL;
     IF NOT (SY IN FSYS) THEN INSYMBOL
     END
   END; (*SKIP*)



   PROCEDURE ENTERID (FCP: CTP);

   (* Enter ID pointed at by FCP into the symbol table, *)
   (* which on each declaration level is organized as an *)
   (* unbalanced binary tree. *)

   VAR
     NAM: ALPHA;
     LCP, LCP1: CTP;
     LLEFT: BOOLEAN;

 BEGIN
   NAM := FCP^.NAME;
   LCP := DISPLAY [TOP].FNAME;
   IF LCP = NIL THEN
     DISPLAY [TOP].FNAME := FCP
   ELSE BEGIN
     REPEAT
       LCP1 := LCP;
       IF LCP^.NAME = NAM THEN BEGIN
          ERROR (101); LCP := LCP^.RLINK; LLEFT := FALSE END
       ELSE
          IF LCP^.NAME < NAM THEN BEGIN
            LCP := LCP^.RLINK; LLEFT := FALSE END
          ELSE BEGIN
             LCP := LCP^.LLINK; LLEFT := TRUE END
     UNTIL LCP = NIL;
     IF LLEFT THEN LCP1^.LLINK := FCP
     ELSE LCP1^.RLINK := FCP
     END;
   FCP^.LLINK := NIL; FCP^.RLINK := NIL
   END;  (* ENTERID *)



   PROCEDURE SEARCHSECTION(FCP: CTP; VAR FCP1: CTP);

   (* To find record fields and forward declared procedure id's *)
     (* --> PROCEDURE PROCDECLARATION *)
     (* --> PROCEDURE SELECTOR *)

   LABEL 1;

   BEGIN
   WHILE FCP <> NIL DO
     IF FCP^.NAME = ID THEN GOTO 1
     ELSE IF FCP^.NAME < ID THEN FCP := FCP^.RLINK
       ELSE FCP := FCP^.LLINK;
   1: FCP1 := FCP
   END; (* SEARCHSECTION *)



   PROCEDURE SEARCHID(FIDCLS: SETOFIDS; VAR FCP: CTP);

   (* Search symbol table for id *)

   LABEL 1;

   VAR LCP: CTP;

   BEGIN
   FOR DISX := TOP DOWNTO 0 DO
     BEGIN LCP := DISPLAY[DISX].FNAME;
     WHILE LCP <> NIL DO
       IF LCP^.NAME = ID THEN
         IF LCP^.KLASS IN FIDCLS THEN GOTO 1
         ELSE
           BEGIN IF PRTERR THEN ERROR(103);
           LCP := LCP^.RLINK
           END
       ELSE
         IF LCP^.NAME < ID THEN
           LCP := LCP^.RLINK
         ELSE LCP := LCP^.LLINK
     END;
     (* Search not successful; suppress error message in case *)
     (* of forward referenced type id in pointer type definition *)
     (* --> PROCEDURE SIMPLETYPE *)
     IF PRTERR THEN
       BEGIN ERROR(104);
       (* to avoid returning NIL, reference an entry *)
       (* for an undeclared id of appropriate class *)
       (* --> PROCEDURE ENTERUNDECL *)
       IF TYPES IN FIDCLS THEN LCP := UTYPPTR
       ELSE
         IF VARS IN FIDCLS THEN LCP := UVARPTR
         ELSE
           IF FIELD IN FIDCLS THEN LCP := UFLDPTR
           ELSE
             IF KONST IN FIDCLS THEN LCP := UCSTPTR
             ELSE
               IF PROC IN FIDCLS THEN LCP := UPRCPTR
               ELSE LCP := UFCTPTR;
       END;
     1: FCP := LCP
   END; (* SEARCHID *)



   PROCEDURE GETBOUNDS(FSP: STP; VAR FMIN,FMAX: INTEGER);

   (* Get internal bounds of subrange or scalar type. *)
   (* Assume FSP <> INTPTR and FSP <> REALPTR *)

   BEGIN
   FMIN := 0; FMAX := 0;
   IF FSP <> NIL THEN
   WITH FSP^ DO
     IF FORM = SUBRANGE THEN
       BEGIN FMIN := MIN.IVAL; FMAX := MAX.IVAL END
     ELSE
       IF FSP = CHARPTR THEN
         BEGIN FMIN := ORDMINCHAR; FMAX := ORDMAXCHAR
         END
       ELSE IF FSP = INTPTR THEN BEGIN
         FMAX := MAXINT; FMIN := -MAXINT  END
       ELSE
         IF FCONST <> NIL THEN
           FMAX := FCONST^.VALUES.IVAL
   END; (* GETBOUNDS *)



   FUNCTION ALIGNQUOT(FSP: STP): INTEGER;

   BEGIN
   ALIGNQUOT := 1;
   IF FSP <> NIL THEN
     WITH FSP^ DO
       CASE FORM OF
         SCALAR:   IF FSP=INTPTR THEN ALIGNQUOT := INTAL
                   ELSE IF FSP=BOOLPTR THEN ALIGNQUOT := BOOLAL
                   ELSE IF SCALKIND=DECLARED THEN ALIGNQUOT := INTAL
                   ELSE IF FSP=CHARPTR THEN ALIGNQUOT := CHARAL
                   ELSE IF FSP=REALPTR THEN ALIGNQUOT := REALAL
                   ELSE (*PARMPTR*) ALIGNQUOT := PARMAL;
         SUBRANGE: ALIGNQUOT := ALIGNQUOT(RANGETYPE);
         POINTER:  ALIGNQUOT := ADRAL;
         POWER:    ALIGNQUOT := SETAL;
         FILES:    ALIGNQUOT := FILEAL;
         ARRAYS:   ALIGNQUOT := ALIGNQUOT(AELTYPE);
         RECORDS:  ALIGNQUOT := RECAL;
         VARIANT,TAGFLD: ERROR(301)
       END
   END; (* ALIGNQUOT *)



   PROCEDURE ALIGN(FSP: STP; VAR FLC: INTEGER);

   VAR K,L: INTEGER;

   BEGIN
   K := ALIGNQUOT(FSP);
   L := FLC-1;
   FLC := L + K  -  L MOD K
   END; (* ALIGN *)



   PROCEDURE GENLABEL (VAR NXTLAB: INTEGER);

   (* Produces unique integer labels, used in Fortran *)
   (* code generated *)

   BEGIN
   INTLABEL := INTLABEL + 1;
   NXTLAB := INTLABEL
   END; (*GENLABEL*)



   PROCEDURE GENCREG;

   (* Generates declarations for the Fortran routines *)

   BEGIN
   WRITELN (PRR, ' ':6, 'INTEGER*2 LINENO', ', SG1SIZ, SG2SIZ');
   WRITELN (PRR, ' ':6, 'INTEGER*4 STORE(', '1), STOREX(32767)');
   WRITELN (PRR, ' ':6, 'REAL STORER(1)');
   WRITELN (PRR, ' ':6, 'COMMON /CSTORE/ STOREX');
   WRITELN (PRR, ' ':6, 'EQUIVALENCE(STOREX(2),STORE(1),STORER(1))');
   WRITELN (PRR, ' ':6, 'INTEGER SP, MP, EP, NP');
   WRITELN (PRR, ' ':6, 'COMMON /SP/ SP');
   WRITELN (PRR, ' ':6, 'COMMON /MP/ MP');
   WRITELN (PRR, ' ':6, 'COMMON /EP/ EP');
   WRITELN (PRR, ' ':6, 'COMMON /NP/ NP');
   IC := IC + 10
   END;



   PROCEDURE PUTCOMDEFS;
   BEGIN
   IF PRCODE THEN BEGIN
     WRITELN (PRR, ' ':6, 'INTEGER*4 STOREX', ', STRTBL (',
                     ((MAXSTRGINDEX + 1) DIV 4):4, '), SETTBL (400)');
     WRITELN (PRR, ' ':6, 'INTEGER*4 STORE(', '1), STOREX(32767)');
     WRITELN (PRR, ' ':6, 'REAL STORER(1)');
     WRITELN (PRR, ' ':6, 'INTEGER*2 SP, MP, EP, NP');
     WRITELN (PRR, ' ':6, 'COMMON /SP/ SP');
     WRITELN (PRR, ' ':6, 'COMMON /MP/ MP');
     WRITELN (PRR, ' ':6, 'COMMON /EP/ EP');
     WRITELN (PRR, ' ':6, 'COMMON /NP/ NP');
     WRITELN (PRR, ' ':6, 'COMMON /CSTORE/ ', 'STOREX');
     WRITELN (PRR, ' ':6, 'EQUIVALENCE(STOREX(2),STORE(1),STORER(1))');
     WRITELN (PRR, ' ':6, 'EQUIVALENCE(STOREX(', STRINGSTART+1:5, '),',
                          ' STRTBL (1))');
     WRITELN (PRR, ' ':6, 'EQUIVALENCE(STOREX(', SETSTART+1:5, '),',
                          ' SETTBL (1))');
     WRITELN (PRR);
     IC := IC + 5
     END
   END;  (* PUTCOMDEFS *)



   PROCEDURE BLOCK(FSYS: SETOFSYS; FSY: SYMBOL; FPROCP: CTP);

   VAR LSY: SYMBOL; TEST: BOOLEAN;


     PROCEDURE CONSTANT(FSYS: SETOFSYS; VAR FSP: STP; VAR FVALU: VALU);

     VAR LSP: STP; LCP: CTP; SIGN: (NONE,POS,NEG);
       LVP: CSP; I: 2..STRGLGTH;

     BEGIN LSP := NIL; FVALU.IVAL := 0;
     IF NOT(SY IN CONSTBEGSYS) THEN
       BEGIN ERROR(50); SKIP(FSYS+CONSTBEGSYS) END;
     IF SY IN CONSTBEGSYS THEN
       BEGIN
       IF SY = STRINGCONSTSY THEN
         BEGIN
         IF LGTH = 1 THEN LSP := CHARPTR
         ELSE
           BEGIN
           NEW(LSP,ARRAYS);
           WITH LSP^ DO
             BEGIN AELTYPE := CHARPTR;
             NEW (INXTYPE, SUBRANGE);
             WITH INXTYPE^ DO BEGIN
               FORM := SUBRANGE;
               RANGETYPE := INTPTR;
               MIN.IVAL := 1;
               MAX.IVAL := LGTH;
               END (* WITH INXTYPE^ *);
             SIZE := (LGTH + 3) DIV 4; FORM := ARRAYS;
             PACKEDSTRUCT := TRUE
             END
           END;
           FVALU := VAL; INSYMBOL
         END
       ELSE
         BEGIN
         SIGN := NONE;
         IF (SY = ADDOP) AND (OP IN [PLUS,MINUS]) THEN
           BEGIN IF OP = PLUS THEN SIGN := POS ELSE SIGN := NEG;
           INSYMBOL
           END;
         IF SY = IDENT THEN
           BEGIN SEARCHID([KONST],LCP);
           WITH LCP^ DO
             BEGIN LSP := IDTYPE; FVALU := VALUES END;
           IF SIGN <> NONE THEN
             IF LSP = INTPTR THEN
               BEGIN IF SIGN = NEG THEN FVALU.IVAL := -FVALU.IVAL END
             ELSE
               IF LSP = REALPTR THEN
                 BEGIN
                 IF SIGN = NEG THEN
                   BEGIN NEW(LVP,REEL);
                   IF FVALU.VALP^.RVAL[1] = '-' THEN
                     LVP^.RVAL[1] := '+'
                   ELSE LVP^.RVAL[1] := '-';
                   FOR I := 2 TO STRGLGTH DO
                     LVP^.RVAL[I] := FVALU.VALP^.RVAL[I];
                   FVALU.VALP := LVP;
                   END
                 END
               ELSE ERROR(105);
           INSYMBOL;
           END
         ELSE
           IF SY = INTCONST THEN
             BEGIN IF SIGN = NEG THEN VAL.IVAL := -VAL.IVAL;
             LSP := INTPTR; FVALU := VAL; INSYMBOL
             END
           ELSE
             IF SY = REALCONST THEN
               BEGIN IF SIGN = NEG THEN VAL.VALP^.RVAL[1] := '-';
               LSP := REALPTR; FVALU := VAL; INSYMBOL
               END
             ELSE
               BEGIN ERROR(106); SKIP(FSYS) END
       END;
       IF NOT (SY IN FSYS) THEN
         BEGIN ERROR(6); SKIP(FSYS) END
       END;
     FSP := LSP
     END; (* CONSTANT *)


     FUNCTION EQUALBOUNDS(FSP1,FSP2: STP): BOOLEAN;

     VAR LMIN1,LMIN2,LMAX1,LMAX2: INTEGER;

     BEGIN
     IF (FSP1=NIL) OR (FSP2=NIL) THEN EQUALBOUNDS := TRUE
     ELSE
       BEGIN
       GETBOUNDS(FSP1,LMIN1,LMAX1);
       GETBOUNDS(FSP2,LMIN2,LMAX2);
       EQUALBOUNDS := (LMIN1=LMIN2) AND (LMAX1=LMAX2)
       END
     END; (* EQUALBOUNDS *)


     FUNCTION COMPTYPES(FSP1,FSP2: STP) : BOOLEAN;

     (* Decide whether structures pointed at by FSP1 and FSP2 *)
     (* are compatible *)

     VAR
       NXT1, NXT2: CTP;
       COMP: BOOLEAN;
       LTESTP1,LTESTP2 : TESTP;

     BEGIN
     IF FSP1 = FSP2 THEN COMPTYPES := TRUE
     ELSE
       IF (FSP1 <> NIL) AND (FSP2 <> NIL) THEN
         IF FSP1^.FORM = FSP2^.FORM THEN
           CASE FSP1^.FORM OF
             SCALAR:
               COMPTYPES := FALSE;
               (* Identical scalars declared on different levels are *)
               (* not recognized to be compatible *)
             SUBRANGE:
               COMPTYPES := COMPTYPES(FSP1^.RANGETYPE,FSP2^.RANGETYPE);
             POINTER:
               BEGIN
               COMP := FALSE; LTESTP1 := GLOBTESTP;
               LTESTP2 := GLOBTESTP;
               WHILE LTESTP1 <> NIL DO
                 WITH LTESTP1^ DO
                   BEGIN
                   IF (ELT1 = FSP1^.ELTYPE) AND
                     (ELT2 = FSP2^.ELTYPE) THEN COMP := TRUE;
                   LTESTP1 := LASTTESTP
                   END;
               IF NOT COMP THEN
                 BEGIN NEW(LTESTP1);
                 WITH LTESTP1^ DO
                   BEGIN ELT1 := FSP1^.ELTYPE;
                   ELT2 := FSP2^.ELTYPE;
                   LASTTESTP := GLOBTESTP
                   END;
                 GLOBTESTP := LTESTP1;
                 COMP := COMPTYPES(FSP1^.ELTYPE,FSP2^.ELTYPE)
                 END;
               COMPTYPES := COMP; GLOBTESTP := LTESTP2
               END;
             POWER:
               COMPTYPES := COMPTYPES(FSP1^.ELSET,FSP2^.ELSET);
             ARRAYS:
               BEGIN
               COMP := COMPTYPES(FSP1^.AELTYPE,FSP2^.AELTYPE)
                   AND COMPTYPES(FSP1^.INXTYPE,FSP2^.INXTYPE);
               COMPTYPES := COMP AND
                   EQUALBOUNDS(FSP1^.INXTYPE,FSP2^.INXTYPE) AND
                   (FSP1^.PACKEDSTRUCT = FSP2^.PACKEDSTRUCT) AND
                   (FSP1^.SIZE = FSP2^.SIZE)        (*PUG*)
               END;
             RECORDS:
               BEGIN NXT1 := FSP1^.FSTFLD; NXT2 := FSP2^.FSTFLD; COMP:=TRUE;
               WHILE (NXT1 <> NIL) AND (NXT2 <> NIL) DO
                 BEGIN COMP:=COMP AND COMPTYPES(NXT1^.IDTYPE,NXT2^.IDTYPE);
                 NXT1 := NXT1^.NEXT; NXT2 := NXT2^.NEXT
                 END;
               COMPTYPES := COMP AND (NXT1 = NIL) AND (NXT2 = NIL)
                           AND(FSP1^.RECVAR = NIL)AND(FSP2^.RECVAR = NIL)
               END;
               (* Identical records are recognized to be compatible *)
               (* iff no variants occur. *)
             FILES:
               COMPTYPES := COMPTYPES(FSP1^.FILTYPE,FSP2^.FILTYPE)
           END (* CASE *)
         ELSE (*FSP1^.FORM <> FSP2^.FORM*)
           IF FSP1^.FORM = SUBRANGE THEN
             COMPTYPES := COMPTYPES(FSP1^.RANGETYPE,FSP2)
           ELSE
             IF FSP2^.FORM = SUBRANGE THEN
               COMPTYPES := COMPTYPES(FSP1,FSP2^.RANGETYPE)
             ELSE COMPTYPES := FALSE
       ELSE COMPTYPES := TRUE
     END (* COMPTYPES *) ;


     FUNCTION STRING(FSP: STP) : BOOLEAN;

     BEGIN STRING := FALSE;
     IF FSP <> NIL THEN
       IF FSP^.FORM = ARRAYS THEN
         IF COMPTYPES(FSP^.AELTYPE,CHARPTR) THEN STRING := TRUE
     END; (* STRING *)


     FUNCTION FINDFILE(LCP: CTP) : BOOLEAN;

     (* searches the external file list for current file being opened *)
     (* returning a value of true if the file is in the list          *)

      VAR  EXTP1: EXTFILEP;
      BEGIN
        EXTP1 := FEXTFILEP;
        WHILE (LCP^.NAME <> EXTP1^.FILENAME) AND (EXTP1 <> NIL)
          DO EXTP1 := EXTP1^.NEXTFILE;
        IF EXTP1 = NIL THEN
          FINDFILE := FALSE
        ELSE FINDFILE := TRUE
      END; (* FINDFILE *)



