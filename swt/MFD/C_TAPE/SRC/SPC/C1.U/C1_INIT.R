# initialize --- initialize everything

   subroutine initialize

   include "c1_com.r.i"

   integer i, j
   character nm (MAXLINE)
   pointer mktabl, enter_sibling_mode, sdupl

  # Lexical analyzer symbols:
   Symlen = 0
   Symtext (1) = EOS
   Symline = 0
   Nsymlen = 0
   Nsymtext (1) = EOS
   Nsymline = 0

  # Debugging flags:
DB for (i = 1; i <= MAXDBFLAG; i += 1)
DB    Dbg_flag (i) = NO

  # Error context area:
   Error_sym (1) = EOS

  # Error count:
   Nerrs = 0

  # Input buffer:
   Ibp = PBLIMIT
   Inbuf (Ibp) = EOS

  # Module name:
   call scopy (""s, 1, Module_name, 1)

  # Dynamic storage area:
   call dsinit (MEMSIZE)

  # Keyword and #define table:
   Keywd_tbl = mktabl (IDSIZE)

  # Identifier table stack:
   Id_tbl (1) = LAMBDA
   Sm_tbl (1) = LAMBDA

  # Preprocessor keyword table:
   Pp_tbl = mktabl (IDSIZE)

  # C keywords
   call enter_kw (Keywd_tbl, "asm"s,      ASMSYM)
   call enter_kw (Keywd_tbl, "auto"s,     AUTOSYM)
   call enter_kw (Keywd_tbl, "break"s,    BREAKSYM)
   call enter_kw (Keywd_tbl, "case"s,     CASESYM)
   call enter_kw (Keywd_tbl, "char"s,     CHARSYM)
   call enter_kw (Keywd_tbl, "continue"s, CONTINUESYM)
   call enter_kw (Keywd_tbl, "default"s,  DEFAULTSYM)
   call enter_kw (Keywd_tbl, "do"s,       DOSYM)
   call enter_kw (Keywd_tbl, "double"s,   DOUBLESYM)
   call enter_kw (Keywd_tbl, "else"s,     ELSESYM)
   call enter_kw (Keywd_tbl, "entry"s,    ENTRYSYM)
   call enter_kw (Keywd_tbl, "enum"s,     ENUMSYM)
   call enter_kw (Keywd_tbl, "extern"s,   EXTERNSYM)
   call enter_kw (Keywd_tbl, "float"s,    FLOATSYM)
   call enter_kw (Keywd_tbl, "for"s,      FORSYM)
   call enter_kw (Keywd_tbl, "fortran"s,  FORTRANSYM)
   call enter_kw (Keywd_tbl, "goto"s,     GOTOSYM)
   call enter_kw (Keywd_tbl, "if"s,       IFSYM)
   call enter_kw (Keywd_tbl, "int"s,      INTSYM)
   call enter_kw (Keywd_tbl, "long"s,     LONGSYM)
   call enter_kw (Keywd_tbl, "register"s, REGISTERSYM)
   call enter_kw (Keywd_tbl, "return"s,   RETURNSYM)
   call enter_kw (Keywd_tbl, "short"s,    SHORTSYM)
   call enter_kw (Keywd_tbl, "sizeof"s,   SIZEOFSYM)
   call enter_kw (Keywd_tbl, "static"s,   STATICSYM)
   call enter_kw (Keywd_tbl, "struct"s,   STRUCTSYM)
   call enter_kw (Keywd_tbl, "switch"s,   SWITCHSYM)
   call enter_kw (Keywd_tbl, "typedef"s,  TYPEDEFSYM)
   call enter_kw (Keywd_tbl, "union"s,    UNIONSYM)
   call enter_kw (Keywd_tbl, "unsigned"s, UNSIGNEDSYM)
   call enter_kw (Keywd_tbl, "while"s,    WHILESYM)

  # C preprocessor keywords:
   call enter_kw (Pp_tbl,    "define"s,   DEFINESYM)
DB call enter_kw (Pp_tbl,    "debug"s,    DEBUGSYM)
   call enter_kw (Pp_tbl,    "undef"s,    UNDEFSYM)
   call enter_kw (Pp_tbl,    "include"s,  INCLUDESYM)
   call enter_kw (Pp_tbl,    "line"s,     LINESYM)
   call enter_kw (Pp_tbl,    "if"s,       IFSYM)
   call enter_kw (Pp_tbl,    "ifdef"s,    IFDEFSYM)
   call enter_kw (Pp_tbl,    "ifndef"s,   IFNDEFSYM)
   call enter_kw (Pp_tbl,    "else"s,     ELSESYM)
   call enter_kw (Pp_tbl,    "endif"s,    ENDIFSYM)

  # Special macro definitions:
   call install_definition ("__LINE__"s, LINEIDVAL, sdupl (""s))
   call install_definition ("__FILE__"s, FILEIDVAL, sdupl (""s))

  # Definitions from the -D options
   for (i = 1; i < Dfo_top; i += length (Dfo_name (i)) + 1) {
      for (j = i; Dfo_name (j) ~= '='c && Dfo_name (j) ~= EOS; j += 1)
         ;
      if (Dfo_name (j) ~= '='c)
         call install_definition (Dfo_name (i), -1, sdupl ("1"s))
      else {
         call ctoc (Dfo_name (i), nm, j - i + 1)
         call install_definition (nm, -1, sdupl (Dfo_name (j + 1)))
         }
      }

  # Parse stack pointers:
   Sem_sp = 1
   Ctl_sp = 1

  # Expression stack pointers:
   Exp_sp = 1

  # Object number generator:
   Obj_no = 1

  # Current lexic level:
   Ll = 1

  # Mode save area:
   Mode_save_ct = 1

  # Mode table:
   Modelist = LAMBDA
   Modetable = make_mode (INTMODE, 0)
   MODEPARENT (Modetable) = LAMBDA
   MODESIBLING (Modetable) = LAMBDA
   MODECHILD (Modetable) = LAMBDA

   Intmodeptr = Modetable
   Charmodeptr = enter_sibling_mode (Modetable, CHARMODE, 0)
   Charunsmodeptr = enter_sibling_mode (Modetable, CHARUNSMODE, 0)
   Shortmodeptr = enter_sibling_mode (Modetable, SHORTMODE, 0)
   Longmodeptr = enter_sibling_mode (Modetable, LONGMODE, 0)
   Unsignedmodeptr = enter_sibling_mode (Modetable, UNSIGNEDMODE, 0)
   Floatmodeptr = enter_sibling_mode (Modetable, FLOATMODE, 0)
   Doublemodeptr = enter_sibling_mode (Modetable, DOUBLEMODE, 0)
   Labelmodeptr = enter_sibling_mode (Modetable, LABELMODE, 0)
   Shortunsmodeptr = enter_sibling_mode (Modetable, SHORTUNSMODE, 0)
   Longunsmodeptr = enter_sibling_mode (Modetable, LONGUNSMODE, 0)
   Pointermodeptr = Intmodeptr
   call create_mode (Pointermode_ptr, POINTERMODE, 0)

   return
   end



# enter_kw --- place key word in an identifier table

   subroutine enter_kw (tbl, kw, val)
   pointer tbl
   character kw (ARB)
   integer val

   untyped info (IDSIZE)

   IDTYPE (info) = KEYWDIDTYPE
   IDPTR  (info) = val
   IDVAL  (info) = 0
   call enter (kw, info, tbl)

   return
   end
