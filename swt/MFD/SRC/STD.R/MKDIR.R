# mkdir --- make a new user file directory

   include ARGUMENT_DEFS

   ARG_DECL
   integer getarg, mkdir$
   character dirnam (MAXPATH)
   string usage "Usage: mkdir dirnam [-o owner] [-n non-owner]"

   PARSE_COMMAND_LINE ("o<rs> n<rs>"s, usage)
   ARG_DEFAULT_STR (o, EOS)
   ARG_DEFAULT_STR (n, EOS)
   if (getarg (1, dirnam, MAXPATH) == EOF)
      call error (usage)

   call mapstr (ARG_TEXT (o), UPPER)
   call mapstr (ARG_TEXT (n), UPPER)

   if (mkdir$ (dirnam, ARG_TEXT (o), ARG_TEXT (n)) == ERR) {
      call putlin (dirnam, ERROUT)
      call error (": can't create"s)
      }

   stop
   end
