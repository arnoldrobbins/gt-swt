define (COMPILER_DEFS,"comp_def.i")
# ddlc --- Prime DBMS schema compiler interface

   include ARGUMENT_DEFS
   include COMPILER_DEFS

# options understood by SCHEMA, exclusive of file manipulation:

   define (ERRLIST,1)

# table of SCHEMA options, their current state, their default value,
#     and their text representation:

   string_table cpos, ctab _
      / ERRLIST,     NO, NO, "tr 020000"

# table of interface options, minimum and maximum levels, default level,
#     restricted minimum and maximum levels, selected level, effects
#     on compiler options, and restrictions on other interface options.

   string_table ipos, itab _

      / V_OPT, 0, 1, 1, UNDEFINED, UNDEFINED, UNDEFINED,
            LEVEL, 0,
               SELECT, ERRLIST,
               END_OF_LEVEL,
            LEVEL, 1,
               DESELECT, ERRLIST,
               END_OF_LEVEL,
            END_OF_OPTION


   ARG_DECL
   character inpf (MAXPATH), listf (MAXPATH), binf (MAXPATH)

   integer i
   integer comopt, comfn, parscl, equal

   if (parscl ("v<oi> l<os>z<os>"s, ARG_BUF) ~= OK) {
      call error ("Usage: ddlc {-v[<level>]} <file> " _
                               "{-l [<file>]} [-z <string>]"p)
      }

   ARG_DEFAULT_STR (l, ""s)      # set the default listing file name
   ARG_DEFAULT_STR (b, ""s)      # set the default output file name

   if (comopt (ARG_BUF, cpos, ctab, ipos, itab) == ERR
         || comfn (ARG_BUF, inpf, ".ddl"s,
                           listf, ".l"s, binf, ""s) == ERR) {
      call seterr (1000)
      stop
      }

   if (equal (listf, "no"s) == YES || equal (listf, "tty"s) == YES
            || equal (listf, "spool"s) == YES)
      call error ("Sorry, listing must go to a disk file"p)

   call print (STDOUT, "schema -i *s -l *s"p, inpf, listf)
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
