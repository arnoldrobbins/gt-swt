# shar --- make a SWT shell archive of the named files

   integer fd
   integer state (4)
   integer open, gfnarg
   integer getarg
   character name (MAXLINE)

   if (getarg (1, name, MAXLINE) == EOF)  # no files at all given
      call error ("usage: shar <file> { <file> ... }"p)

   state (1) = 1

   repeat
      select (gfnarg (name, state))
         when (EOF)
            break
         when (OK) {
            fd = open (name, READ)
            if (fd ~= ERR) {
               call print (STDOUT, "echo extracting '*s' >/dev/stdout3*n"s, name)
               call print (STDOUT, ">> cto 'End of *s' | cat >*s*n"s,
                                        name, name)
               call fcopy (fd, STDOUT)
               call close (fd)
               call print (STDOUT, "End of *s*n"s, name)
               }
            else
               call print (ERROUT, "*s: can't open*n"s, name)
            }
         when (ERR)
            call error ("usage: shar <file> { <file> ... }"p)

   stop
   end
