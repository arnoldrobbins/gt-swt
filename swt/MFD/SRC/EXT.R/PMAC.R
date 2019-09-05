define (COMPILER_DEFS,"comp_def.i")
# pmac --- Primos PMA assembler interface

   include ARGUMENT_DEFS
   include COMPILER_DEFS

# options understood by PMA, exclusive of file manipulation:

   define (ERRLIST,1)
   define (EXPLIST,2)
   define (XREFL,3)
   define (XREFS,4)

# table of PMA options, their current state, their default value,
#     and their text representation:

   string_table cpos, ctab _
      / ERRLIST,     NO, NO,  "er",
      / EXPLIST,     NO, NO,  "ex",
      / XREFL,       NO, YES, "xrefl",
      / XREFS,       NO, NO,  "xrefs"

# table of interface options, minimum and maximum levels, default level,
#     restricted minimum and maximum levels, selected level, effects
#     on assembler options, and restrictions on other interface options.

   string_table ipos, itab _

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

      / X_OPT, 1, 2, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 1,
               SELECT, XREFS,
               DESELECT, XREFL,
               END_OF_LEVEL,
            LEVEL, 2,
               SELECT, XREFL,
               DESELECT, XREFS,
               END_OF_LEVEL,
            END_OF_OPTION

# table of assembler options to be reset if no listing is generated:
   string_table nloffpos, nlofftab,
      ERRLIST, EXPLIST, XREFL, XREFS, EOS

# table of assembler options to be set if no listing is generated:
   string_table nlonpos, nlontab,
      EOS


   ARG_DECL
   character inpf (MAXPATH), listf (MAXPATH), binf (MAXPATH)

   integer i
   integer comopt, comfn, parscl, equal

   if (parscl ("v<oi>x<oi> b<os>l<os>z<os>"s, ARG_BUF) ~= OK) {
      call error ("Usage: pmac {-(v|x)[<level>]} <file> " _
                              "{-(b|l) [<file>]} [-z <string>]"p)
      }

   if (ARG_PRESENT (l))          # set the default listing file name
      ARG_DEFAULT_STR (l, ""s)
   else
      ARG_DEFAULT_STR (l, "/dev/null"s)
   ARG_DEFAULT_STR (b, ""s)      # set the default binary file name

   if (comopt (ARG_BUF, cpos, ctab, ipos, itab) == ERR
         || comfn (ARG_BUF, inpf, ".s,.pma"s,
                              listf, ".l"s, binf, ".b"s) == ERR) {
      call seterr (1000)
      stop
      }

   if (equal (listf, "no"s) ~= NO)
      call comnl (cpos, ctab, nlofftab, nlontab)

   call print (STDOUT, "pma -i *s -b *s -l *s"p, inpf, binf, listf)
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
