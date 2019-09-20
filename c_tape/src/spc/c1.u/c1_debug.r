#
# Conditional Debug Statement Locations
#
#  Debug #   Routine          Action
#  -------   -------          ------
#
#     1     getsym      Prints current value of "Symbol"
#     2     gettok      Prints current value of "Nsymbol"
#     3     ss_dealloc  Prints values of semantic stack to be
#                       deallocated
#     4     makemode    Prints pointer of new mode table entry
#     5     enter_sibling_mode
#                       Prints pointers that are changed
#     6     enter_child_mode
#                       Prints pointers that are changed
#     7     create_mode Dumps the mode table
#     8     invoke_macro
#                       Prints the number of formal parameters
#     9     invoke_macro
#                       Prints the text to be substituted
#     10    enter_definition
#                       Prints the number of formal parameters
#     11    enter_definition
#                       Prints the enter definition string
#     12    dgetsym     Prints the returned token
#     13    get_definition
#                       Prints the raw definition string
#     14    collect_actual_parameters
#                       Prints the actual parameter strings
#     15    findsym     Prints the symbol and the results
#     16    makesym     Prints the symbol text and pointer
#     17    refill_buffer
#                       Print the input line
#     18    exit_ll     Dump the mode table on lexic level exit
#     19    process,
#           exit_ll     Dump the symbol table on lexic level exit
#     20    t$trac      Trace parser production entry and exit
#     22    cs_push,    Display each frame allocated and deallocated
#           cs_pop
#     23    es_push,    Print the pointer of each tree pushed and popped
#           es_pop
#     24    es_pop,     Print each tree pushed and popped
#           es_push
#     25    dealloc_expr
#                       Print each node as it is deallocated.
#     26    sizeof_mode Print size of each mode as calculated
#     27    align_mode  Print alignment of each mode
#     28    compare_mode
#                       Print the result of each recursion
#     29    allocate_storage
#                       Print the result of storage allocation
#     30    out_expr    Dump the expression tree before output
#     31    out_oper    Output the IMF in a readable (?) format
#     32    process     Dump the mode table at the end of the compile
#     33    gen_oper    Dump the expression tree after each entry
#     34    gen_oper    Trace the operation of 'gen_oper'
#     35    conv_oper   Trace the input parameters
#     36
#     37
#     38    wsize       Trace execution
#     39    gen_int     Trace execution
#     40    out_declaration
#                       Print the external defs and refs
#     41    gobble_else_or_endif
#                       Print the nesting level.
#     42    check_declaration,
#           check_function_declaration,
#           clean_up_ll
#                       Trace setting the object number of external objects
#                       only on reference.
#     43    open_include
#                       Print file name and search rule.





# display_symbol --- supply a character string for a symbol (debugging)

   subroutine display_symbol (fmt, sym)
   character fmt (ARB)
   integer sym

   include "c1_com.r.i"

   character str (MAXTOK)

   select (sym)
      when (ANDAASYM)
         call ctoc ("&="s, str, MAXTOK)
      when (SANDSYM)
         call ctoc ("&&"s, str, MAXTOK)
      when (DECSYM)
         call ctoc ("--"s, str, MAXTOK)
      when (DIVAASYM)
         call ctoc ("/="s, str, MAXTOK)
      when (EQSYM)
         call ctoc ("=="s, str, MAXTOK)
      when (GESYM)
         call ctoc (">="s, str, MAXTOK)
      when (INCSYM)
         call ctoc ("++"s, str, MAXTOK)
      when (LESYM)
         call ctoc ("<="s, str, MAXTOK)
      when (SUBAASYM)
         call ctoc ("-="s, str, MAXTOK)
      when (REMAASYM)
         call ctoc ("%="s, str, MAXTOK)
      when (NESYM)
         call ctoc ("!="s, str, MAXTOK)
      when (ORAASYM)
         call ctoc ("|="s, str, MAXTOK)
      when (SORSYM)
         call ctoc ("||"s, str, MAXTOK)
      when (ADDAASYM)
         call ctoc ("+="s, str, MAXTOK)
      when (POINTSTOSYM)
         call ctoc ("->"s, str, MAXTOK)
      when (LSHIFTAASYM)
         call ctoc ("<<="s, str, MAXTOK)
      when (LSHIFTSYM)
         call ctoc ("<<"s, str, MAXTOK)
      when (RSHIFTAASYM)
         call ctoc (">>="s, str, MAXTOK)
      when (RSHIFTSYM)
         call ctoc (">>"s, str, MAXTOK)
      when (MULAASYM)
         call ctoc ("*="s, str, MAXTOK)
      when (XORAASYM)
         call ctoc ("^="s, str, MAXTOK)
      when (EOF)
         call ctoc ("<EOF>"s, str, MAXTOK)
      when (NEWLINE)
         call ctoc ("<NEWLINE>"s, str, MAXTOK)
      when (CHARLITSYM)
         call ctoc ("charlit"s, str, MAXTOK)
      when (DOUBLELITSYM)
         call ctoc ("doublelit"s, str, MAXTOK)
      when (IDSYM)
         call ctoc ("id"s, str, MAXTOK)
      when (LONGLITSYM)
         call ctoc ("longlit"s, str, MAXTOK)
      when (SHORTLITSYM)
         call ctoc ("shortlit"s, str, MAXTOK)
      when (STRLITSYM)
         call ctoc ("strlit"s, str, MAXTOK)
      when (ASMSYM)
         call ctoc ("asm"s, str, MAXTOK)
      when (AUTOSYM)
         call ctoc ("auto"s, str, MAXTOK)
      when (BREAKSYM)
         call ctoc ("break"s, str, MAXTOK)
      when (CASESYM)
         call ctoc ("case"s, str, MAXTOK)
      when (CHARSYM)
         call ctoc ("char"s, str, MAXTOK)
      when (CONTINUESYM)
         call ctoc ("continue"s, str, MAXTOK)
      when (DEFAULTSYM)
         call ctoc ("default"s, str, MAXTOK)
      when (DEFINESYM)
         call ctoc ("define"s, str, MAXTOK)
      when (DOSYM)
         call ctoc ("do"s, str, MAXTOK)
      when (DOUBLESYM)
         call ctoc ("double"s, str, MAXTOK)
      when (ELSESYM)
         call ctoc ("else"s, str, MAXTOK)
      when (ENDIFSYM)
         call ctoc ("endif"s, str, MAXTOK)
      when (ENTRYSYM)
         call ctoc ("entry"s, str, MAXTOK)
      when (ENUMSYM)
         call ctoc ("enum"s, str, MAXTOK)
      when (EXTERNSYM)
         call ctoc ("extern"s, str, MAXTOK)
      when (FLOATSYM)
         call ctoc ("float"s, str, MAXTOK)
      when (FORSYM)
         call ctoc ("for"s, str, MAXTOK)
      when (FORTRANSYM)
         call ctoc ("fortran"s, str, MAXTOK)
      when (GOTOSYM)
         call ctoc ("goto"s, str, MAXTOK)
      when (IFDEFSYM)
         call ctoc ("ifdef"s, str, MAXTOK)
      when (IFNDEFSYM)
         call ctoc ("ifndef"s, str, MAXTOK)
      when (IFSYM)
         call ctoc ("if"s, str, MAXTOK)
      when (INCLUDESYM)
         call ctoc ("include"s, str, MAXTOK)
      when (INTSYM)
         call ctoc ("int"s, str, MAXTOK)
      when (LINESYM)
         call ctoc ("line"s, str, MAXTOK)
      when (LONGSYM)
         call ctoc ("long"s, str, MAXTOK)
      when (REGISTERSYM)
         call ctoc ("register"s, str, MAXTOK)
      when (RETURNSYM)
         call ctoc ("return"s, str, MAXTOK)
      when (SHORTSYM)
         call ctoc ("short"s, str, MAXTOK)
      when (SIZEOFSYM)
         call ctoc ("sizeof"s, str, MAXTOK)
      when (STATICSYM)
         call ctoc ("static"s, str, MAXTOK)
      when (STRUCTSYM)
         call ctoc ("struct"s, str, MAXTOK)
      when (SWITCHSYM)
         call ctoc ("switch"s, str, MAXTOK)
      when (TYPEDEFSYM)
         call ctoc ("typedef"s, str, MAXTOK)
      when (UNDEFSYM)
         call ctoc ("undef"s, str, MAXTOK)
      when (UNIONSYM)
         call ctoc ("union"s, str, MAXTOK)
      when (UNSIGNEDSYM)
         call ctoc ("unsigned"s, str, MAXTOK)
      when (WHILESYM)
         call ctoc ("while"s, str, MAXTOK)
   else if (' 'c <= sym && sym < DEL) {
      str (1) = sym
      str (2) = EOS
      }
   else
      call encode (str, MAXLINE, "(*i)"s, sym)

   call print (ERROUT, fmt, str)

   return
   end



# display_mode --- display the name of a mode

   subroutine display_mode (mode)
   pointer mode

   include "c1_com.r.i"

   select (MODETYPE (mode))
      when (DEFAULTMODE)
         call print (ERROUT, "dflt"s)
      when (INTMODE)
         call print (ERROUT, "int"s)
      when (CHARMODE)
         call print (ERROUT, "char"s)
      when (SHORTMODE)
         call print (ERROUT, "short"s)
      when (LONGMODE)
         call print (ERROUT, "long"s)
      when (UNSIGNEDMODE)
         call print (ERROUT, "unsigned"s)
      when (FLOATMODE)
         call print (ERROUT, "float"s)
      when (DOUBLEMODE)
         call print (ERROUT, "double"s)
      when (STRUCTMODE)
         call print (ERROUT, "struct(*l)"s, MODELEN (mode))
      when (UNIONMODE)
         call print (ERROUT, "union(*l)"s, MODELEN (mode))
      when (POINTERMODE)
         call print (ERROUT, "ptr to"s)
      when (FUNCTIONMODE)
         call print (ERROUT, "fn ret"s)
      when (ARRAYMODE)
         call print (ERROUT, "array[*l] of"s, MODELEN (mode))
      when (FIELDMODE)
         call print (ERROUT, "field[*l] of"s, MODELEN (mode))
      when (LABELMODE)
         call print (ERROUT, "label"s)
      when (TYPEDEFMODE)
         call print (ERROUT, "typedef"s)
      when (CHARUNSMODE)
         call print (ERROUT, "charuns"s)
      when (SHORTUNSMODE)
         call print (ERROUT, "shortuns"s)
      when (LONGUNSMODE)
         call print (ERROUT, "longuns"s)
      when (ENUMMODE)
         call print (ERROUT, "enum"s)
   else
      call print (ERROUT, "undef(*i)[*l]"s, MODETYPE (mode), MODELEN (mode))

   return
   end



# pmode --- print the full description of a mode

   subroutine pmode (mp)
   integer mp

   include "c1_com.r.i"

   if (mp ~= LAMBDA) {
      call display_mode (mp)
      call print (ERROUT, " "s)
      call pmode (MODEPARENT (mp))
      }

   return
   end




# display_sc --- display storage class

   subroutine display_sc (sc)
   integer sc

   select (sc)
      when (DEFAULTSC)
         call print (ERROUT, "default"s)
      when (AUTOSC)
         call print (ERROUT, "auto"s)
      when (EXTERNSC)
         call print (ERROUT, "extern"s)
      when (REGISTERSC)
         call print (ERROUT, "register"s)
      when (STATICSC)
         call print (ERROUT, "static"s)
      when (TYPEDEFSC)
         call print (ERROUT, "typedef"s)
   else
      call print (ERROUT, "undef"s)

   return
   end



# dump_mode --- dump the mode table in raw form

   subroutine dump_mode

   include "c1_com.r.i"

   call dmpr (Modetable, 0)

   return
   end



# dmpr --- dump mode table recursively

   subroutine dmpr (mp, in)
   pointer mp
   integer in

   include "c1_com.r.i"

   pointer q

   for (q = mp; q ~= LAMBDA; q = MODESIBLING (q)) {
      call dmpm (q, in)
      if (MODETYPE (q) == STRUCTMODE || MODETYPE (q) == UNIONMODE)
         call dmps (MODESMLIST (q), in + 8)
      call dmpr (MODECHILD (q), in + 3)
      }

   return
   end



# dmpm --- dump mode table entry

   subroutine dmpm (mp, in)

   include "c1_com.r.i"

   call print (ERROUT, "*#x(*5i) "s, in, mp)
   call pmode (mp)
   call print (ERROUT, "*n"s)

   return
   end



# dmps --- dump a structure table entry

   subroutine dmps (mp, in)
   pointer mp
   integer in

   include "c1_com.r.i"

   pointer q

   for (q = mp; q ~= LAMBDA; q = SMSIBLING (q)) {
      call print (ERROUT, "*#xmember (*5i)"s, in, q)
      call dmpm (SYMMODE (SMSYM (q)), 1)
      }

   return
   end



# dump_sym_entry --- dump an identifier, literal, struct entry, or expr

   subroutine dump_sym_entry (p)
   pointer p

   include "c1_com.r.i"

   integer r (MAXTOK), l
   integer get_lit_val
   pointer i

   procedure display_char (c) forward

   call print (ERROUT, "(*5i) "s, p)
   select (SYMTYPE (p))
      when (IDSYMTYPE) {
         call print (ERROUT, "id "s)
         call display_sc (SYMSC (p))
         call print (ERROUT, " "s)
         call pmode (SYMMODE (p))
         call print (ERROUT, "(m*i l*i p*i n*i d*i)"s, SYMMODE (p),
                          SYMLL (p), SYMPARAM (p), SYMOBJ (p), SYMISDEF (p))
         if (SYMPLIST (p) ~= LAMBDA) {
            call print (ERROUT, "  ["s)
            for (i = SYMPLIST (p); i ~= LAMBDA; i = PARAMNEXT (i)) {
               if (PARAMTEXT (i) ~= LAMBDA)
                  call print (ERROUT, "*s"s, Mem (PARAMTEXT (i)))
               if (PARAMMODE (i) ~= LAMBDA)
                  call print (ERROUT, "="s)
               call pmode (PARAMMODE (i))
               if (PARAMNEXT (i) ~= LAMBDA)
                  call print (ERROUT, ","s)
               }
            call print (ERROUT, "]"s)
            }
         }
      when (SMSYMTYPE) {
         call print (ERROUT, "sm "s)
         call pmode (SYMMODE (p))
         call print (ERROUT, "(m*i l*i o*l)"s, SYMMODE (p), SYMLL (p),
                           SYMOFFS (p))
         }
      when (STSYMTYPE) {
         call print (ERROUT, "st "s)
         call pmode (SYMMODE (p))
         call print (ERROUT, "(m*i l*i)"s, SYMMODE (p), SYMLL (p))
         }
      when (EXPSYMTYPE) {
         call print (ERROUT, "ex "s)
         call display_op (EXPOP (p))
         call print (ERROUT, " "s)
         call pmode (EXPMODE (p))
         call print (ERROUT, "(l*i r*i m*i)"s, EXPLEFT (p),
                     EXPRIGHT (p), EXPMODE (p))
         }
      when (ENSYMTYPE) {
         call print (ERROUT, "en "s)
         call pmode (SYMMODE (p))
         call print (ERROUT, "(m*i l*i n*i)"s, SYMMODE (p), SYMLL (p),
                     SYMOBJ (p))
         }
      when (COSYMTYPE) {
         call print (ERROUT, "co "s)
         call display_sc (SYMSC (p))
         call print (ERROUT, " "s)
         call pmode (SYMMODE (p))
         call print (ERROUT, " #*i (m*i l*i p*i d*i)"s, SYMOBJ (p),
                     SYMMODE (p), SYMLL (p), SYMPARAM (p), SYMISDEF (p))
         }
      when (LITSYMTYPE) {
         call print (ERROUT, "lt "s)
         call pmode (SYMMODE (p))
         l = get_lit_val (p, r, MAXTOK)
         select (MODETYPE (SYMMODE (p)))
            when (SHORT_MODE, UNSIGNED_MODE, INT_MODE,
                  SHORT_UNS_MODE, ENUM_MODE)
               call print (ERROUT, "#*i"s, r)
            when (LONG_MODE, LONG_UNS_MODE, POINTER_MODE)
               call print (ERROUT, "#*l"s, r)
            when (FLOAT_MODE)
               call print (ERROUT, "#*r"s, r)
            when (DOUBLE_MODE)
               call print (ERROUT, "#*d"s, r)
            when (CHAR_MODE) {
               call print (ERROUT, "'"s)
               display_char (r (1))
               call print (ERROUT, "'"s)
               }
            when (ARRAY_MODE) {
               if (MODETYPE (MODEPARENT (SYMMODE (p))) == CHAR_MODE) {
                  call print (ERROUT, '"'s)
                  for (i = 1; i <= l; i += 1)
                     display_char (r (i))
                  call print (ERROUT, '"'s)
                  }
               else
                  for (i = 1; i <= l; i += 1)
                     call print (ERROUT, "*,-8i "s, r (i))
               }
         }
   else
      call print (ERROUT, "Symtype=*i"s, SYMTYPE (p))

   return


   # display_char --- dump a printable representation of a character

      procedure display_char (c) {

      character c

      if (c >= ' 'c && c < DEL)
         call print (ERROUT, "*c"s, c)
      else
         call print (ERROUT, "<*,-8i>"s, c)

      }

   end



# dump_sym --- dump the symbol buffers for a lexic level

   subroutine dump_sym (ll)
   integer ll

   include "c1_com.r.i"


   pointer p, q
   pointer accesssym
   character str (MAXTOK)

   call print (ERROUT, "*nIdentifier table for lexic level *i*n*n"s, ll)
   p = LAMBDA
   for (q = accesssym (ll, str, p, IDCLASS); q ~= LAMBDA;
               q = accesssym (ll, str, p, IDCLASS)) {
      call print (ERROUT, "   '*10s' "s, str)
      call dump_sym_entry (q)
      call print (ERROUT, "*n"s)
      }
   call print (ERROUT, "*nStructure table for lexic level *i*n*n"s, ll)
   p = LAMBDA
   for (q = accesssym (ll, str, p, SMCLASS); q ~= LAMBDA;
               q = accesssym (ll, str, p, SMCLASS)) {
      call print (ERROUT, "   '*10s' "s, str)
      call dump_sym_entry (q)
      call print (ERROUT, "*n"s)
      }
   call print (ERROUT, "*n"s)

   return
   end



# t$trac --- trace subroutine for Ratfor programs

   subroutine t$trac (mode, name)
   integer mode
   character name

   include "c1_com.r.i"

   integer level, i

   data level / 0 /

   select (mode)
      when (1) {
         DBG (20,
         DB for (i = 1; i <= level & level <= 40; i = i + 1) {
         DB    call putch ('|'c, ERROUT)
         DB    call putch (' 'c, ERROUT)
         DB    call putch (' 'c, ERROUT)
         DB    }
         DB call print (ERROUT, "*p {*n"p, name)
         DB )
         level = level + 1
         }
      when (2) {
         level = level - 1
         DBG (20,
         DB for (i = 1; i <= level & level <= 40; i = i + 1) {
         DB    call putch ('|'c, ERROUT)
         DB    call putch (' 'c, ERROUT)
         DB    call putch (' 'c, ERROUT)
         DB    }
         DB call print (ERROUT, "..}*n"p)
         DB )
         }
      when (3) {
         level = 0
         }

   return
   end



# display_op --- display the name of an operator

   subroutine display_op (op)
   integer op

   call display_oper (op, ERROUT)

   return
   end



# display_oper --- display the name of an operator to any file

   subroutine display_oper (op, fd)
   integer op
   file_des fd

   select (op)
      when (ADDAA_OP)
         call print (fd, "+="s)
      when (ADD_OP)
         call print (fd, "+"s)
      when (ANDAA_OP)
         call print (fd, "&="s)
      when (AND_OP)
         call print (fd, "&"s)
      when (ASSIGN_OP)
         call print (fd, "="s)
      when (BREAK_OP)
         call print (fd, "break"s)
      when (CASE_OP)
         call print (fd, "case"s)
      when (COMPL_OP)
         call print (fd, "compl"s)
      when (COND1_OP)
         call print (fd, "cond1"s)
      when (COND2_OP)
         call print (fd, "cond2"s)
      when (CONST_OP)
         call print (fd, "const"s)
      when (CONVERT_OP)
         call print (fd, "convert"s)
      when (DECLARE_STAT_OP)
         call print (fd, "declare_stat"s)
      when (DEFAULT_OP)
         call print (fd, "default"s)
      when (DEFINE_DYNM_OP)
         call print (fd, "define_dynm"s)
      when (DEFINE_STAT_OP)
         call print (fd, "define_stat"s)
      when (DEREF_OP)
         call print (fd, "deref"s)
      when (DIVAA_OP)
         call print (fd, "/="s)
      when (DIV_OP)
         call print (fd, "/"s)
      when (DO_OP)
         call print (fd, "do"s)
      when (EQ_OP)
         call print (fd, "=="s)
      when (FIELD_OP)
         call print (fd, "field"s)
      when (FOR_OP)
         call print (fd, "for"s)
      when (GE_OP)
         call print (fd, ">="s)
      when (GOTO_OP)
         call print (fd, "goto"s)
      when (GT_OP)
         call print (fd, ">"s)
      when (IF_OP)
         call print (fd, "if"s)
      when (INDEX_OP)
         call print (fd, "index"s)
      when (INIT_OP)
         call print (fd, "init"s)
      when (LABEL_OP)
         call print (fd, "label"s)
      when (LE_OP)
         call print (fd, "<="s)
      when (LSHIFTAA_OP)
         call print (fd, "<<="s)
      when (LSHIFT_OP)
         call print (fd, "<<"s)
      when (LT_OP)
         call print (fd, "<"s)
      when (MODULE_OP)
         call print (fd, "module"s)
      when (MULAA_OP)
         call print (fd, "**="s)
      when (MUL_OP)
         call print (fd, "**"s)
      when (NEG_OP)
         call print (fd, "-"s)
      when (NEXT_OP)
         call print (fd, "next"s)
      when (NE_OP)
         call print (fd, "!="s)
      when (NOT_OP)
         call print (fd, "!"s)
      when (NULL_OP)
         call print (fd, "null"s)
      when (OBJECT_OP)
         call print (fd, "object"s)
      when (ORAA_OP)
         call print (fd, "|="s)
      when (OR_OP)
         call print (fd, "|"s)
      when (POSTDEC_OP)
         call print (fd, "postdec"s)
      when (POSTINC_OP)
         call print (fd, "postinc"s)
      when (PREDEC_OP)
         call print (fd, "predec"s)
      when (PREINC_OP)
         call print (fd, "preinc"s)
      when (PROC_CALL_ARG_OP)
         call print (fd, "proc_call_arg"s)
      when (PROC_CALL_OP)
         call print (fd, "proc_call"s)
      when (PROC_DEFN_ARG_OP)
         call print (fd, "proc_defn_arg"s)
      when (PROC_DEFN_OP)
         call print (fd, "proc_defn"s)
      when (REFTO_OP)
         call print (fd, "refto"s)
      when (REMAA_OP)
         call print (fd, "%="s)
      when (REM_OP)
         call print (fd, "%"s)
      when (RETURN_OP)
         call print (fd, "return"s)
      when (RSHIFTAA_OP)
         call print (fd, ">>="s)
      when (RSHIFT_OP)
         call print (fd, ">>"s)
      when (SAND_OP)
         call print (fd, "&&"s)
      when (SELECT_OP)
         call print (fd, "select"s)
      when (SEQ_OP)
         call print (fd, "seq"s)
      when (SOR_OP)
         call print (fd, "||"s)
      when (SUBAA_OP)
         call print (fd, "-="s)
      when (SUB_OP)
         call print (fd, "-"s)
      when (SWITCH_OP)
         call print (fd, "switch"s)
      when (UNDEFINE_OP)
         call print (fd, "undefine"s)
      when (WHILE_OP)
         call print (fd, "while"s)
      when (XORAA_OP)
         call print (fd, "^="s)
      when (XOR_OP)
         call print (fd, "^"s)
   else
      call print (ERROUT, "undef(*i)"s, op)

   return
   end



# dump_expr --- dump an entry on the expression stack

   subroutine dump_expr (p)
   pointer p

   include "c1_com.r.i"

   character marg (71)

   call print (ERROUT, "*nExpression tree:*n"s)
   call dmpe (p, 0, marg, 0)

   return
   end



# dmpe --- dump an expression tree recursively

   subroutine dmpe (p, in, marg, son)
   pointer p
   integer in, son
   character marg (ARB)

   include "c1_com.r.i"

   integer i

   if (p == LAMBDA)
      return

   if (EXPTYPE (p) ~= EXPSYMTYPE) {
      if (son == 0)
         call ctoc ("/-"s, marg (in + 1), 71 - in)
      else
         call ctoc ("\-"s, marg (in + 1), 71 -in)
      call print (ERROUT, "*s"s, marg)
      call dump_sym_entry (p)
      call print (ERROUT, "*n"s)
      }

   else {
      if (son == 0)
         call ctoc ("  "s, marg (in + 1), 71 - in)
      else
         call ctoc ("| "s, marg (in + 1), 71 - in)
      call dmpe (EXPLEFT (p), in + 2, marg, 0)

      if (son == 0)
         call ctoc ("/-"s, marg (in + 1), 71 - in)
      else
         call ctoc ("\-"s, marg (in + 1), 71 -in)
      call print (ERROUT, "*s"s, marg)
      call dump_sym_entry (p)
      call print (ERROUT, "*n"s)

      if (son == 0)
         call ctoc ("| "s, marg (in + 1), 71 - in)
      else
         call ctoc ("  "s, marg (in + 1), 71 - in)
      call dmpe (EXPRIGHT (p), in + 2, marg, 1)
      }

   return
   end



