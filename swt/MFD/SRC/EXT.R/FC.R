define (COMPILER_DEFS,"comp_def.i")
# fc --- Primos FORTRAN compiler interface

   include ARGUMENT_DEFS
   include COMPILER_DEFS

# options understood by FTN, exclusive of file manipulation:

   define (MODE_32R,1)
   define (MODE_64R,2)
   define (MODE_64V,3)
   define (BIG,4)
   define (DCLVAR,5)
   define (DEBASE,6)
   define (DEBUG,7)
   define (DYNM,8)
   define (ERRL,9)
   define (ERRTTY,10)
   define (EXPLIST,11)
   define (FP,12)
   define (FRN,13)
   define (INTL,14)
   define (INTS,15)
   define (NOBIG,16)
   define (NODCLVAR,17)
   define (NODEBUG,18)
   define (NOERRTTY,19)
   define (NOFP,20)
   define (NOFRN,21)
   define (NOSTAT,22)
   define (NOTRACE,23)
   define (NOXREF,24)
   define (OPT,25)
   define (PBECB,26)
   define (PROD,27)
   define (SAVE,28)
   define (SPO,29)
   define (STAT,30)
   define (STDOPT,31)
   define (TRACE,32)
   define (UNCOPT,33)
   define (XREFL,34)
   define (XREFS,35)

# table of FTN options, their current state, their default value,
#     and their text representation:

   string_table cpos, ctab _
      / MODE_32R,       NO, YES,  "3" _
      / MODE_64R,       NO, NO,   "64r" _
      / MODE_64V,       NO, NO,   "64v" _
      / BIG,            NO, NO,   "big" _
      / DCLVAR,         NO, NO,   "dc" _
      / DEBASE,         NO, NO,   "deba" _
      / DEBUG,          NO, NO,   "debu" _
      / DYNM,           NO, NO,   "dy" _
      / ERRL,           NO, NO,   "errl" _
      / ERRTTY,         NO, YES,  "errt" _
      / EXPLIST,        NO, NO,   "ex" _
      / FP,             NO, YES,  "fp" _
      / FRN,            NO, NO,   "frn" _
      / INTL,           NO, NO,   "intl" _
      / INTS,           NO, YES,  "ints" _
      / NOBIG,          NO, YES,  "nob" _
      / NODCLVAR,       NO, YES,  "nodc" _
      / NODEBUG,        NO, YES,  "node" _
      / NOERRTTY,       NO, NO,   "noe" _
      / NOFP,           NO, NO,   "nofp" _
      / NOFRN,          NO, YES,  "nofrn" _
      / NOSTAT,         NO, YES,  "nostat" _
      / NOTRACE,        NO, YES,  "not" _
      / NOXREF,         NO, YES,  "nox" _
      / OPT,            NO, NO,   "o" _
      / PBECB,          NO, NO,   "pb" _
      / PROD,           NO, NO,   "pr" _
      / SAVE,           NO, YES,  "sa" _
      / SPO,            NO, NO,   "sp" _
      / STAT,           NO, NO,   "stat" _
      / STDOPT,         NO, YES,  "std" _
      / TRACE,          NO, NO,   "t" _
      / UNCOPT,         NO, NO,   "u" _
      / XREFL,          NO, NO,   "xrefl" _
      / XREFS,          NO, NO,   "xrefs"

# table of interface options, defaults for non-specification and omitted
#     levels, maximum allowable level, effects on the compiler, and
#     internal consistency checks:

   string_table ipos, itab _

      / D_OPT, 0, 2, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NODEBUG,
               DESELECT, DEBUG, PROD,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, PROD,
               DESELECT, NODEBUG, DEBUG,
               RESTRICT, M_OPT, 2, 2, "debugging not allowed in R-mode",
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, DEBUG,
               DESELECT, PROD, NODEBUG,
               RESTRICT, O_OPT, 0, 0, "can't debug with optimization",
               RESTRICT, M_OPT, 2, 2, "debugging not allowed in R-mode",
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

      / F_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOFP,
               DESELECT, FP,
               RESTRICT, M_OPT, 0, 1, "-f0 only meaningful in R-mode",
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, FP,
               DESELECT, NOFP,
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
               RESTRICT, M_OPT, 2, 2, "big arrays not allowed in R-mode",
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
               DESELECT, STAT,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, STAT,
               DESELECT, NOSTAT,
               END_OF_LEVEL,
            END_OF_OPTION _

      / M_OPT, 0, 2, 2, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, MODE_32R,
               DESELECT, MODE_64R, MODE_64V,
               RESTRICT, D_OPT, 0, 0, "debugging not allowed in 32R mode",
               RESTRICT, H_OPT, 0, 0, "big arrays not allowed in 32R mode",
               RESTRICT, S_OPT, 0, 0, "stack allocation not allowed in 32R mode",
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, MODE_64R,
               DESELECT, MODE_32R, MODE_64V,
               RESTRICT, D_OPT, 0, 0, "debugging not allowed in 64R mode",
               RESTRICT, H_OPT, 0, 0, "big arrays not allowed in 64R mode",
               RESTRICT, S_OPT, 0, 0, "stack allocation not allowed in 64R mode",
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, MODE_64V,
               DESELECT, MODE_32R, MODE_64R,
               RESTRICT, F_OPT, 1, 1, "-f0 meaningless in 64V mode",
               RESTRICT, R_OPT, 0, 0, "-r1 meaningless in 64V mode",
               END_OF_LEVEL,
            END_OF_OPTION _

      / O_OPT, 0, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, STDOPT,
               DESELECT, OPT, UNCOPT,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, OPT,
               DESELECT, UNCOPT, STDOPT,
               RESTRICT, D_OPT, 0, 1, "can't optimize with full debug",
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, UNCOPT,
               DESELECT, STDOPT, OPT,
               RESTRICT, D_OPT, 0, 1, "can't optimize with full debug",
               END_OF_LEVEL,
            END_OF_OPTION _

      / P_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               DESELECT, PBECB,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, PBECB,
               RESTRICT, M_OPT, 2, 2, "-p1 meaningless in R-mode",
               END_OF_LEVEL,
            END_OF_OPTION _

      / Q_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               DESELECT, SPO,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, SPO,
               END_OF_LEVEL,
            END_OF_OPTION _

      / R_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               DESELECT, DEBASE,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, DEBASE,
               RESTRICT, M_OPT, 0, 1, "-r1 available only in R-mode",
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
               RESTRICT, M_OPT, 2, 2, "-s1 not allowed in R-mode",
               END_OF_LEVEL,
            END_OF_OPTION _

      / T_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOTRACE,
               DESELECT, TRACE,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, TRACE,
               DESELECT, NOTRACE,
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
               SELECT, ERRL,
               DESELECT, EXPLIST,
               END_OF_LEVEL,
            LEVEL, 1,
               DESELECT, ERRL, EXPLIST,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, EXPLIST,
               DESELECT, ERRL,
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
      ERRL, EXPLIST, XREFL, XREFS, EOS

# table of compiler options to be set if no listing is generated:
   string_table nlonpos, nlontab,
      NOXREF, EOS


   ARG_DECL
   character inpf (MAXPATH), listf (MAXPATH), binf (MAXPATH)

   integer i
   integer comopt, comfn, parscl, equal

   if (parscl ("d<oi>e<oi>f<oi>h<oi>i<oi>k<oi>m<oi>" _
               "o<oi>p<oi>q<oi>r<oi>s<oi>"_
               "t<oi>u<oi>v<oi>w<oi>x<oi>" _
               "b<os>l<os>z<os>"s, ARG_BUF) ~= OK) {
      call remark ("Usage: fc {-<opt>[<level>]} <file> " _
                              "{-(b|l) [<file>]} [-z <string>]"p)
      call error  ("       <opt> -> d|e|f|h|i|k|m|o|p|q|r|s|t|u|v|w|x"p)
      }

   if (ARG_PRESENT (l))          # set the default listing file name
      ARG_DEFAULT_STR (l, ""s)
   else
      ARG_DEFAULT_STR (l, "/dev/null"s)
   ARG_DEFAULT_STR (b, ""s)      # set the default binary file name

   if (comopt (ARG_BUF, cpos, ctab, ipos, itab) == ERR
         || comfn (ARG_BUF, inpf, ".f,.ftn,.df"s,
                        listf, ".l"s, binf, ".b"s) == ERR) {
      call seterr (1000)
      stop
      }

   if (equal (listf, "no"s) ~= NO)
      call comnl (cpos, ctab, nlofftab, nlontab)

   call print (STDOUT, "ftn -i *s -b *s -l *s"p, inpf, binf, listf)
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
