define (COMPILER_DEFS,"comp_def.i")
# splc --- Primos SPL compiler interface

   include ARGUMENT_DEFS
   include COMPILER_DEFS

# options understood by SPL, exclusive of file manipulation:

   define (MODE_64V,1)
   define (BIG,2)
   define (COPY,3)
   define (DEBUG,4)
   define (ERRLIST,5)
   define (ERRTTY,6)
   define (EXPLIST,7)
   define (FRN,8)
   define (LCASE,9)
   define (MAP,10)
   define (NESTING,11)
   define (NOBIG,12)
   define (NOCOPY,13)
   define (NODEBUG,14)
   define (NOERRLIST,15)
   define (NOERRTTY,16)
   define (NOEXPLIST,17)
   define (NOMAP,18)
   define (NOOFFSET,19)
   define (NOOPT,20)
   define (NONESTING,21)
   define (NOPROD,22)
   define (NOQUICK,23)
   define (NORANGE,24)
   define (NOSILENT,25)
   define (NOSTAT,26)
   define (NOXREF,27)
   define (OFFSET,28)
   define (OPTIMIZE,29)
   define (PROD,30)
   define (QUICK,31)
   define (RANGE,32)
   define (SILENT,33)
   define (STATISTICS,34)
   define (UPCASE,35)
   define (XREF,36)

# table of SPL options, their current state, their default value,
#     and their text representation:

   string_table cpos, ctab _
      / MODE_64V,    NO, YES, "6",
      / BIG,         NO, NO,  "big",
      / COPY,        NO, YES, "copy",
      / DEBUG,       NO, NO,  "de",
      / ERRLIST,     NO, NO,  "errl",
      / ERRTTY,      NO, YES, "errt",
      / EXPLIST,     NO, NO,  "ex",
      / FRN,         NO, NO,  "frn",
      / LCASE,       NO, NO,  "lc",
      / MAP,         NO, YES, "map",
      / NESTING,     NO, NO,  "ne",
      / NOBIG,       NO, YES, "nob",
      / NOCOPY,      NO, NO,  "no_copy",
      / NODEBUG,     NO, YES, "nod",
      / NOERRLIST,   NO, YES, "noerrl",
      / NOERRTTY,    NO, NO,  "noerrt",
      / NOEXPLIST,   NO, YES, "noex",
      / NOMAP,       NO, NO,  "no_map",
      / NOOFFSET,    NO, YES, "noof",
      / NOOPT,       NO, NO,  "noop",
      / NONESTING,   NO, YES, "non",
      / NOPROD,      NO, YES, "nop",
      / NOQUICK,     NO, YES, "no_quick",
      / NORANGE,     NO, YES, "nor",
      / NOSILENT,    NO, YES, "nosi",
      / NOSTAT,      NO, YES, "nost",
      / NOXREF,      NO, YES, "nox",
      / OFFSET,      NO, NO,  "of",
      / OPTIMIZE,    NO, YES, "op",
      / PROD,        NO, NO,  "p",
      / QUICK,       NO, NO,  "quick",
      / RANGE,       NO, NO,  "r",
      / SILENT,      NO, NO,  "si",
      / STATISTICS,  NO, NO,  "st",
      / UPCASE,      NO, YES, "u",
      / XREF,        NO, NO,  "x"

# table of interface options, defaults for non-specification and omitted
#     levels, maximum allowable level, effects on the compiler, and
#     internal consistency checks:

   string_table ipos, itab _

      / C_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, UPCASE,
               DESELECT, LCASE,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, LCASE,
               DESELECT, UPCASE,
               END_OF_LEVEL,
            END_OF_OPTION _

      / D_OPT, 0, 2, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NODEBUG, NOPROD,
               DESELECT, DEBUG, PROD,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, PROD, NODEBUG,
               DESELECT, DEBUG, NOPROD,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, DEBUG, NOPROD,
               DESELECT, PROD, NODEBUG,
               RESTRICT, O_OPT, 0, 0, "can't debug with optimization",
               RESTRICT, P_OPT, 0, 0, "can't quick call with full debug",
               END_OF_LEVEL,
            END_OF_OPTION _

      / E_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOERRTTY,
               DESELECT, ERRTTY,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, ERRTTY,
               DESELECT, NOERRTTY,
               END_OF_LEVEL,
            END_OF_OPTION _

      / F_OPT, 0, 3, 2, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOMAP,
               DESELECT, MAP, OFFSET,
               RESTRICT, X_OPT, 0, 0, "cross-reference meaningless without symbol table map",
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, NOMAP, OFFSET,
               DESELECT, MAP,
               RESTRICT, X_OPT, 0, 0, "cross-reference meaningless without symbol table map",
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, MAP,
               DESELECT, NOMAP, OFFSET,
               END_OF_LEVEL,
            LEVEL, 3,
               SELECT, MAP, OFFSET,
               DESELECT, NOMAP,
               END_OF_LEVEL,
            END_OF_OPTION _

      / H_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOBIG,
               DESELECT, BIG,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, BIG,
               DESELECT, NOBIG,
               END_OF_LEVEL,
            END_OF_OPTION _

      / K_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOSTAT,
               DESELECT, STATISTICS,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, STATISTICS,
               DESELECT, NOSTAT,
               END_OF_LEVEL,
            END_OF_OPTION _

      / M_OPT, 2, 2, 2, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 2,
               SELECT, MODE_64V,
               END_OF_LEVEL,
            END_OF_OPTION _

      / N_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NONESTING,
               DESELECT, NESTING,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, NESTING,
               DESELECT, NONESTING,
               END_OF_LEVEL,
            END_OF_OPTION _

      / O_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOOPT,
               DESELECT, OPTIMIZE,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, OPTIMIZE,
               DESELECT, NOOPT,
               RESTRICT, D_OPT, 0, 1, "can't optimize with full debug",
               END_OF_LEVEL,
            END_OF_OPTION _

      / P_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOQUICK,
               DESELECT, QUICK,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, QUICK,
               DESELECT, NOQUICK,
               RESTRICT, D_OPT, 0, 0, "can't quick call with full debug",
               END_OF_LEVEL,
            END_OF_OPTION _

      / Q_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, SILENT,
               DESELECT, NOSILENT,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, NOSILENT,
               DESELECT, SILENT,
               END_OF_LEVEL,
            END_OF_OPTION _

      / R_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NORANGE,
               DESELECT, RANGE,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, RANGE,
               DESELECT, NORANGE,
               END_OF_LEVEL,
            END_OF_OPTION _

      / S_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOCOPY,
               DESELECT, COPY,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, COPY,
               DESELECT, NOCOPY,
               END_OF_LEVEL,
            END_OF_OPTION _

      / V_OPT, 0, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, ERRLIST, NOEXPLIST,
               DESELECT, EXPLIST, NOERRLIST,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, NOERRLIST, NOEXPLIST,
               DESELECT, ERRLIST, EXPLIST,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, EXPLIST, NOERRLIST,
               DESELECT, ERRLIST, NOEXPLIST,
               END_OF_LEVEL,
            END_OF_OPTION _

      / W_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               DESELECT, FRN,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, FRN,
               END_OF_LEVEL,
            END_OF_OPTION _

      / X_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               DESELECT, XREF,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, XREF,
               RESTRICT, F_OPT, 2, 3, "cross-reference meaningless without symbol table map",
               END_OF_LEVEL,
            END_OF_OPTION

# table of compiler options to be reset if no listing is generated:
   string_table nloffpos, nlofftab,
      ERRLIST, EXPLIST, MAP, NESTING, NOMAP, OFFSET, XREF, EOS

# table of compiler options to be set if no listing is generated:
   string_table nlonpos, nlontab,
      NOERRLIST, NOEXPLIST, NONESTING, NOOFFSET, NOXREF, EOS


   ARG_DECL
   character inpf (MAXPATH), listf (MAXPATH), binf (MAXPATH)

   integer i
   integer comopt, comfn, parscl, equal

   if (parscl ("c<oi>d<oi>e<oi>f<oi>h<oi>k<oi>" _
               "m<oi>n<oi>o<oi>p<oi>q<oi>r<oi>" _
               "s<oi>v<oi>w<oi>x<oi>" _
               "b<os>l<os>z<os>"s, ARG_BUF) ~= OK) {
      call remark ("Usage: splc {-<opt>[<level>]} <file> " _
                              "{-(b|l) [<file>]} [-z <string>]"p)
      call error  ("       <opt> -> c|d|e|f|h|k|m|n|o|p|q|r|s|v|w|x"p)
      }

   if (ARG_PRESENT (l))          # set the default listing file name
      ARG_DEFAULT_STR (l, ""s)
   else
      ARG_DEFAULT_STR (l, "/dev/null"s)
   ARG_DEFAULT_STR (b, ""s)      # set the default binary file name

   if (comopt (ARG_BUF, cpos, ctab, ipos, itab) == ERR
         || comfn (ARG_BUF, inpf, ".spl"s,
                              listf, ".l"s, binf, ".b"s) == ERR) {
      call seterr (1000)
      stop
      }

   if (equal (listf, "no"s) ~= NO)
      call comnl (cpos, ctab, nlofftab, nlontab)

   call print (STDOUT, "spl -i *s -b *s -l *s"p, inpf, binf, listf)
   for (i = 1; i <= cpos (1); i += 1)
      if (CURRENT_STATE (cpos (i + 1)) == YES
            && DEFAULT_STATE (cpos (i + 1)) == NO)
         call print (STDOUT, " -*s"p, REPRESENTATION (cpos (i + 1)))
   if (ARG_PRESENT (z))
      call print (STDOUT, " *s"p, ARG_TEXT (z))
   call putch (NEWLINE, STDOUT)

   stop
   end

   include "comp_sub.r.i"
