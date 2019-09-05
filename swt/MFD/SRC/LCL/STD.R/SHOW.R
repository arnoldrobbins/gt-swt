# show --- display non-printing characters

   include ARGUMENT_DEFS

   ARG_DECL
   character fname (MAXLINE)
   integer state (4)
   integer gfnarg
   filedes fd
   filedes open

   procedure do_file forward

   PARSE_COMMAND_LINE ("mon<ign>"s, "Usage: show [-m|-o] { <file> }"p)

   state (1) = 1
   repeat {
      select (gfnarg (fname, state))
         when (EOF)
            break
         when (ERR)
            call print (ERROUT, "*s: can't open*n"p, fname)
         when (OK) {
            fd = open (fname, READ)
            if (fd == ERR)
               call print (ERROUT, "*s: can't open*n"p, fname)
            else {
               do_file
               call close (fd)
               }
            }
      }

   stop


# do_file --- show the characters in a single file

   procedure do_file {

      local line, rep, c, i, line_size
      character line (MAXLINE), rep (4), c
      integer i, line_size
      integer getlin

      for (line_size = getlin (line, fd); line_size ~= EOF;
                              line_size = getlin (line, fd))
         for (i = 1; i <= line_size; i += 1) {
            c = or (line (i), NUL)
            if (line (i) ~= NEWLINE
                  && (c < ' 'c || c == DEL))
               if (ARG_PRESENT (m)) {
                  call ctomn (c, rep)
                  call print (STDOUT, "<*s>"p, rep)
                  }
               elif (ARG_PRESENT (o))
                  call print (STDOUT, "<*3,-8,0i>"p, c)
               else {
                  call putch ('^'c, STDOUT)
                  if (c == DEL)
                     call putch ('#'c, STDOUT)
                  else
                     call putch (c + '@'c - NUL, STDOUT)
                  }
            else
               call putch (line (i), STDOUT)
            }

      }


   end
