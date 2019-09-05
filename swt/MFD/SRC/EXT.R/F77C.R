define (COMPILER_DEFS,"comp_def.i")
# f77c --- Primos F77 compiler interface

   include ARGUMENT_DEFS
   include COMPILER_DEFS

# options understood by F77, exclusive of file manipulation:

   define (MODE_64V,1)
   define (MODE_32I,2)
   define (BIG,3)
   define (DCLVAR,4)
   define (DEBUG,5)
   define (DO1,6)
   define (DYNM,7)
   define (ERRLIST,8)
   define (ERRTTY,9)
   define (EXPLIST,10)
   define (FRN,11)
   define (INTL,12)
   define (INTS,13)
   define (LCASE,14)
   define (LOGL,15)
   define (LOGS,16)
   define (NOBIG,17)
   define (NODCLVAR,18)
   define (NODEBUG,19)
   define (NODO1,20)
   define (NOERRLIST,21)
   define (NOERRTTY,22)
   define (NOEXPLIST,23)
   define (NOFRN,24)
   define (NOOFFSET,25)
   define (NOOPT,26)
   define (NOPROD,27)
   define (NORANGE,28)
   define (NOSILENT,29)
   define (NOSTAT,30)
   define (NOXREF,31)
   define (OFFSET,32)
   define (OPT1,33)
   define (OPT2,34)
   define (OPT3,35)
   define (PROD,36)
   define (RANGE,37)
   define (SAVE,38)
   define (SILENT,39)
   define (STATISTICS,40)
   define (UPCASE,41)
   define (XREFL,42)
   define (XREFS,43)

# table of F77 options, their current state, their default value,
#     and their text representation:

   string_table cpos, ctab _
      / MODE_64V,    NO, YES, "6",
      / MODE_32I,    NO, NO,  "3",
      / BIG,         NO, NO,  "big",
      / DCLVAR,      NO, NO,  "dc",
      / DEBUG,       NO, NO,  "de",
      / DO1,         NO, NO,  "do",
      / DYNM,        NO, YES, "dy",
      / ERRLIST,     NO, NO,  "errl",
      / ERRTTY,      NO, YES, "errt",
      / EXPLIST,     NO, NO,  "ex",
      / FRN,         NO, NO,  "frn",
      / INTL,        NO, YES, "intl",
      / INTS,        NO, NO,  "ints",
      / LCASE,       NO, NO,  "lc",
      / LOGL,        NO, YES, "logl",
      / LOGS,        NO, NO,  "logs",
      / NOBIG,       NO, YES, "nob",
      / NODCLVAR,    NO, YES, "nodc",
      / NODEBUG,     NO, YES, "node",
      / NODO1,       NO, YES, "nodo",
      / NOERRLIST,   NO, YES, "noerrl",
      / NOERRTTY,    NO, NO,  "noerrt",
      / NOEXPLIST,   NO, YES, "noex",
      / NOFRN,       NO, YES, "nof",
      / NOOFFSET,    NO, YES, "noof",
      / NOOPT,       NO, NO,  "noop",
      / NOPROD,      NO, YES, "nop",
      / NORANGE,     NO, YES, "nor",
      / NOSILENT,    NO, YES, "nosi",
      / NOSTAT,      NO, YES, "nost",
      / NOXREF,      NO, YES, "nox",
      / OFFSET,      NO, NO,  "of",
      / OPT1,        NO, NO,  "opt1",
      / OPT2,        NO, YES, "opt2",
      / OPT3,        NO, NO,  "opt3",
      / PROD,        NO, NO,  "p",
      / RANGE,       NO, NO,  "r",
      / SAVE,        NO, NO,  "sa",
      / SILENT,      NO, NO,  "si",
      / STATISTICS,  NO, NO,  "st",
      / UPCASE,      NO, YES, "u",
      / XREFL,       NO, NO,  "x",
      / XREFS,       NO, NO,  "xrefs"

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
               DESELECT, PROD, DEBUG,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, PROD, NODEBUG,
               DESELECT, DEBUG, NOPROD,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, DEBUG, NOPROD,
               DESELECT, PROD, NODEBUG,
               RESTRICT, O_OPT, 0, 2, "can't debug with full optimization",
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

      / F_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOOFFSET,
               DESELECT, OFFSET,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, OFFSET,
               DESELECT, NOOFFSET,
               END_OF_LEVEL,
            END_OF_OPTION _

      / G_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, LOGS,
               DESELECT, LOGL,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, LOGL,
               DESELECT, LOGS,
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

      / I_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, INTS,
               DESELECT, INTL,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, INTL,
               DESELECT, INTS,
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

      / M_OPT, 2, 3, 2, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 2,
               SELECT, MODE_64V,
               DESELECT, MODE_32I,
               END_OF_LEVEL,
            LEVEL, 3,
               SELECT, MODE_32I,
               DESELECT, MODE_64V,
               END_OF_LEVEL,
            END_OF_OPTION _

      / O_OPT, 0, 3, 2, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOOPT,
               DESELECT, OPT1, OPT2, OPT3,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, OPT1,
               DESELECT, NOOPT, OPT2, OPT3,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, OPT2,
               DESELECT, NOOPT, OPT1, OPT3,
               END_OF_LEVEL,
            LEVEL, 3,
               SELECT, OPT3,
               DESELECT, NOOPT, OPT1, OPT2,
               RESTRICT, D_OPT, 0, 1, "can't fully optimize with full debug",
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
               SELECT, SAVE,
               DESELECT, DYNM,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, DYNM,
               DESELECT, SAVE,
               END_OF_LEVEL,
            END_OF_OPTION _

      / T_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NODO1,
               DESELECT, DO1,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, DO1,
               DESELECT, NODO1,
               END_OF_LEVEL,
            END_OF_OPTION _

      / U_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NODCLVAR,
               DESELECT, DCLVAR,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, DCLVAR,
               DESELECT, NODCLVAR,
               END_OF_LEVEL,
            END_OF_OPTION _

      / V_OPT, 0, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, ERRLIST, NOEXPLIST,
               DESELECT, NOERRLIST, EXPLIST,
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
               SELECT, NOFRN,
               DESELECT, FRN,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, FRN,
               DESELECT, NOFRN,
               END_OF_LEVEL,
            END_OF_OPTION _

      / X_OPT, 0, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOXREF,
               DESELECT, XREFL, XREFS,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, XREFS,
               DESELECT, NOXREF, XREFL,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, XREFL,
               DESELECT, NOXREF, XREFS,
               END_OF_LEVEL,
            END_OF_OPTION

# table of compiler options to be reset if no listing is generated:
   string_table nloffpos, nlofftab,
      ERRLIST, EXPLIST, OFFSET, XREFL, XREFS, EOS

# table of compiler options to be set if no listing is generated:
   string_table nlonpos, nlontab,
      NOERRLIST, NOEXPLIST, NOOFFSET, NOXREF, EOS


   ARG_DECL
   character inpf (MAXPATH), listf (MAXPATH), binf (MAXPATH)

   integer i
   integer comopt, comfn, parscl, equal

   if (parscl ("c<oi>d<oi>e<oi>f<oi>g<oi>h<oi>" _
               "i<oi>k<oi>m<oi>o<oi>q<oi>r<oi>" _
               "s<oi>t<oi>u<oi>v<oi>w<oi>x<oi>" _
               "b<os>l<os>z<os>"s, ARG_BUF) ~= OK) {
      call remark ("Usage: f77c {-<opt>[<level>]} <file> " _
                              "{-(b|l) [<file>]} [-z <string>]"p)
      call error  ("       <opt> -> c|d|e|f|g|h|i|k|m|o|q|r|s|t|u|v|w|x"p)
      }

   if (ARG_PRESENT (l))          # set the default listing file name
      ARG_DEFAULT_STR (l, ""s)
   else
      ARG_DEFAULT_STR (l, "/dev/null"s)
   ARG_DEFAULT_STR (b, ""s)      # set the default binary file name

   if (comopt (ARG_BUF, cpos, ctab, ipos, itab) == ERR
         || comfn (ARG_BUF, inpf, ".f77,.f,.df"s,
                        listf, ".l"s, binf, ".b"s) == ERR) {
      call seterr (1000)
      stop
      }

   if (equal (listf, "no"s) ~= NO)
      call comnl (cpos, ctab, nlofftab, nlontab)

   call print (STDOUT, "f77 -i *s -b *s -l *s"p, inpf, binf, listf)
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
