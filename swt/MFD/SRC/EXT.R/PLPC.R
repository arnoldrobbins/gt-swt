define (COMPILER_DEFS,"comp_def.i")
# plpc --- Primos PLP compiler interface

   include ARGUMENT_DEFS
   include COMPILER_DEFS

# options understood by PLP, exclusive of file manipulation:

   define (DEBUG,1)
   define (ERRTTY, 2)
   define (EXPLIST,3)
   define (NOERRTTY,4)
   define (OFFSET,5)
   define (SILENT,6)
   define (XREF,7)

# table of PLP options, their current state, their default value,
#     and their text representation:

   string_table cpos, ctab _
      / DEBUG,       NO, NO,  "debug",
      / ERRTTY,      NO, YES, "errt",
      / EXPLIST,     NO, NO,  "exp",
      / NOERRTTY,    NO, NO,  "noerrt",
      / OFFSET,      NO, NO,  "offset",
      / SILENT,      NO, NO,  "sil",
      / XREF,        NO, NO,  "xref"

# table of interface options, defaults for non-specification and omitted
#     levels, maximum allowable level, effects on the compiler, and
#     internal consistency checks:

   string_table ipos, itab _

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
               DESELECT, OFFSET,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, OFFSET,
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

      / V_OPT, 1, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 1,
               DESELECT, EXPLIST,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, EXPLIST,
               END_OF_LEVEL,
            END_OF_OPTION _

      / X_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               DESELECT, XREF,
               END_OF_LEVEL,
            LEVEL, 1,
               SELECT, XREF,
               END_OF_LEVEL,
            END_OF_OPTION

# table of compiler options to be reset if no listing is generated:
   string_table nloffpos, nlofftab,
      EXPLIST, OFFSET, XREF, EOS

# table of compiler options to be set if no listing is generated:
   string_table nlonpos, nlontab,
      EOS


   ARG_DECL
   character inpf (MAXPATH), listf (MAXPATH), binf (MAXPATH)

   integer i
   integer comopt, comfn, parscl, equal

   if (parscl ("e<oi>f<oi>q<oi>v<oi>x<oi>" _
               "b<os>l<os>z<os>"s, ARG_BUF) ~= OK) {
      call remark ("Usage: plpc {-<opt>[<level>]} <file> " _
                              "{-(b|l) [<file>]} [-z <string>]"p)
      call error  ("       <opt> -> e|f|q|v|x"p)
      }

   if (ARG_PRESENT (l))          # set the default listing file name
      ARG_DEFAULT_STR (l, ""s)
   else
      ARG_DEFAULT_STR (l, "/dev/null"s)
   ARG_DEFAULT_STR (b, ""s)      # set the default binary file name

   if (comopt (ARG_BUF, cpos, ctab, ipos, itab) == ERR
         || comfn (ARG_BUF, inpf, ".plp"s,
                                 listf, ".l"s, binf, ".b"s) == ERR) {
      call seterr (1000)
      stop
      }

   if (equal (listf, "no"s) ~= NO)
      call comnl (cpos, ctab, nlofftab, nlontab)

   call print (STDOUT, "plp -i *s -b *s -l *s"p, inpf, binf, listf)
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
