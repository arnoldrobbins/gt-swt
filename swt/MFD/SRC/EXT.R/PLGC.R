define (COMPILER_DEFS,"comp_def.i")
# plgc --- Primos PL1G compiler interface

   include ARGUMENT_DEFS
   include COMPILER_DEFS

# options understood by PL1G, exclusive of file manipulation:

   define (MODE_32I,1)
   define (MODE_64V,2)
   define (BIG,3)
   define (COPY,4)
   define (DEBUG,5)
   define (ERRLIST,6)
   define (ERRTTY,7)
   define (EXPLIST,8)
   define (FRN,9)
   define (LCASE,10)
   define (MAP,11)
   define (NESTING,12)
   define (NOCOPY,13)
   define (NOERRTTY,14)
   define (NOMAP,15)
   define (NOOPT,16)
   define (NOQUICK,17)
   define (OFFSET,18)
   define (OPTIMIZE,19)
   define (PROD,20)
   define (QUICK,21)
   define (RANGE,22)
   define (SILENT,23)
   define (STATISTICS,24)
   define (UPCASE,25)
   define (XREF,26)

# table of PL1G options, their current state, their default value,
#     and their text representation:

   string_table cpos, ctab _
      / MODE_32I,    NO, NO,  "3",
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
      / NOCOPY,      NO, NO,  "no_copy",
      / NOERRTTY,    NO, NO,  "noerrt",
      / NOMAP,       NO, NO,  "no_map",
      / NOOPT,       NO, NO,  "noop",
      / NOQUICK,     NO, YES, "no_quick",
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
               DESELECT, PROD, DEBUG,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, PROD,
               DESELECT, DEBUG,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, DEBUG,
               DESELECT, PROD,
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
               DESELECT, BIG,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, BIG,
               END_OF_LEVEL,
            END_OF_OPTION _

      / K_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               DESELECT, STATISTICS,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, STATISTICS,
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

      / N_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               DESELECT, NESTING,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, NESTING,
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
               END_OF_LEVEL,
            LEVEL, 1,
               DESELECT, SILENT,
               END_OF_LEVEL,
            END_OF_OPTION _

      / R_OPT, 0, 1, 0, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               DESELECT, RANGE,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, RANGE,
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
               SELECT, ERRLIST,
               DESELECT, EXPLIST,
               END_OF_LEVEL,
            LEVEL, 1,
               DESELECT, ERRLIST, EXPLIST,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, EXPLIST,
               DESELECT, ERRLIST,
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
      EOS


   ARG_DECL
   character inpf (MAXPATH), listf (MAXPATH), binf (MAXPATH)

   integer i
   integer comopt, comfn, parscl, equal

   if (parscl ("c<oi>d<oi>e<oi>f<oi>h<oi>k<oi>" _
               "m<oi>n<oi>o<oi>p<oi>q<oi>r<oi>" _
               "s<oi>v<oi>w<oi>x<oi>" _
               "b<os>l<os>z<os>"s, ARG_BUF) ~= OK) {
      call remark ("Usage: plgc {-<opt>[<level>]} <file> " _
                              "{-(b|l) [<file>]} [-z <string>]"p)
      call error  ("       <opt> -> c|d|e|f|h|k|m|n|o|p|q|r|s|v|w|x"p)
      }

   if (ARG_PRESENT (l))          # set the default listing file name
      ARG_DEFAULT_STR (l, ""s)
   else
      ARG_DEFAULT_STR (l, "/dev/null"s)
   ARG_DEFAULT_STR (b, ""s)      # set the default binary file name

   if (comopt (ARG_BUF, cpos, ctab, ipos, itab) == ERR
         || comfn (ARG_BUF, inpf, ".plg,.pl1g"s,
                              listf, ".l"s, binf, ".b"s) == ERR) {
      call seterr (1000)
      stop
      }

   if (equal (listf, "no"s) ~= NO)
      call comnl (cpos, ctab, nlofftab, nlontab)

   call print (STDOUT, "pl1g -i *s -b *s -l *s"p, inpf, binf, listf)
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
