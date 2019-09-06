# pg --- print a file page by page on a terminal
# Copyright (c) 1981, Georgia Tech Research Institute

include ARGUMENT_DEFS

define (SCREENSIZE,23)

   ARG_DECL

   character name (MAXARG), message (MAXLINE), eprompt (MAXLINE),
         str (MAXLINE)
   integer i, j, lines_per_page, fd, status, default_prompt, options
   integer state (4)
   integer open, gfnarg, page

   string usage _
      "usage: pg [-e] [-v] [-s <screensize>] [-m <message>] {<pathname>}"

   PARSE_COMMAND_LINE ("[elv]n<ign>s<ri>m<rs>"s, usage)

   options = PG_VTH
   status = OK
   state (1) = 1

   if (ARG_PRESENT (e))
      options += PG_END
   if (ARG_PRESENT (v))
      options -= PG_VTH

   if (ARG_PRESENT (m)) {
      call scopy (ARG_TEXT (m), 1, message, 1)
      call ctoc (message, eprompt, MAXLINE)
      default_prompt = NO
      }
   else
      default_prompt = YES

   ARG_DEFAULT_INT (s, SCREENSIZE)
   lines_per_page = ARG_VALUE (s)

   while (status == OK)
      select (gfnarg (name, state))
         when (EOF)
            break
         when (OK) {
            fd = open (name, READ)
            if (fd ~= ERR) {
               if (default_prompt == YES) {
                  # double-up all asterisks in the file name so that
                  # print doesn't mistake them for format flags
                  for ({i = 1; j = 1}; name (i) ~= EOS; i += 1)
                     if (j < MAXLINE - 1) {
                        str (j) = name (i)
                        if (str (j) == '*'c) {
                           str (j + 1) = '*'c
                           j += 1
                           }
                        j += 1
                        }
                  str (j) = EOS
                  call encode (message, MAXLINE, "*s [**i+]? "s, str)
                  call encode (eprompt, MAXLINE, "*s [**i$]? "s, str)
                  }
               status = page (fd, message, eprompt, lines_per_page, STDOUT, options)
               call close (fd)
               }
            else
               call print (ERROUT, "*s: can't open*n"p, name)
            }
         when (ERR) {
            break
            }

   stop
   end
