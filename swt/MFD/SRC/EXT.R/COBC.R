define (COMPILER_DEFS,"comp_def.i")
# cobc --- Primos COBOL compiler interface

   include ARGUMENT_DEFS
   include COMPILER_DEFS

# options understood by COBOL, exclusive of file manipulation:

   define (DEBUG,1)
   define (NODEBUG,2)
   define (EXPLIST,3)
   define (NOEXPLIST,4)
   define (MODE_64V,5)
   define (XREF,6)
   define (NOXREF,7)

# table of COBOL options, their current state, their default value,
#     and their text representation:

   string_table cpos, ctab _
      / DEBUG,          NO, NO,  "debug",
      / NODEBUG,        NO, YES, "nodebug",
      / EXPLIST,        NO, NO,  "explist",
      / NOEXPLIST,      NO, YES, "noexplist",
      / MODE_64V,       NO, NO,  "64v",
      / XREF,           NO, NO,  "xref",
      / NOXREF,         NO, YES, "noxref"

# table of interface options, minimum and maximum levels, default level,
#     restricted minimum and maximum levels, selected level, effects
#     on compiler options, and restrictions on other interface options.

   string_table ipos, itab _

      / D_OPT, 0, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NODEBUG,
               DESELECT, DEBUG,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, NODEBUG,
               DESELECT, DEBUG,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, DEBUG,
               DESELECT, NODEBUG,
               END_OF_LEVEL,
            END_OF_OPTION,

      / M_OPT, 1, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 1,
               DESELECT, MODE_64V,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, MODE_64V,
               END_OF_LEVEL,
            END_OF_OPTION,

      / V_OPT, 1, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 1,
               SELECT, NOEXPLIST,
               DESELECT, EXPLIST,
               END_OF_LEVEL,
            LEVEL, 2,
               DESELECT, NOEXPLIST,
               SELECT, EXPLIST,
               END_OF_LEVEL,
            END_OF_OPTION _

      / X_OPT, 0, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, NOXREF,
               DESELECT, XREF,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, NOXREF,
               DESELECT, XREF,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, XREF,
               DESELECT, NOXREF,
               END_OF_LEVEL,
            END_OF_OPTION

# table of compiler options to be reset if no listing is generated:
   string_table nloffpos, nlofftab,
      EXPLIST, XREF, EOS

# table of compiler options to be set if no listing is generated:
   string_table nlonpos, nlontab,
      NOEXPLIST, NOXREF, EOS


   ARG_DECL
   character inpf (MAXPATH), listf (MAXPATH), binf (MAXPATH)

   integer i
   integer comopt, comfn, parscl, equal

   if (parscl ("d<oi>m<oi>v<oi>x<oi>" _
               "b<os>l<os>z<os>"s, ARG_BUF) ~= OK) {
      call error ("Usage: cobc {-(d|m|v|x)[<level>]} <file> " _
                              "{-(b|l) [<file>]} [-z <string>]"p)
      }

   if (ARG_PRESENT (l))          # set the default listing file name
      ARG_DEFAULT_STR (l, ""s)
   else
      ARG_DEFAULT_STR (l, "/dev/null"s)
   ARG_DEFAULT_STR (b, ""s)      # set the default binary file name

   if (comopt (ARG_BUF, cpos, ctab, ipos, itab) == ERR
         || comfn (ARG_BUF, inpf, ".cob,.cobol,dcob"s,
                              listf, ".l"s, binf, ".b"s) == ERR) {
      call seterr (1000)
      stop
      }

   if (equal (listf, "no"s) ~= NO)
      call comnl (cpos, ctab, nlofftab, nlontab)

   call print (STDOUT, "cobol -i *s -b *s -l *s"p, inpf, binf, listf)
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
