# x --- execute Primos commands

   subroutine x_cmd

   character cmd (MAXCMD), arg (MAXARG)
   integer i, len, status
   integer ctoc, equal, follow, getarg, input, sys$$, isatty

   if (getarg (1, arg, MAXARG) ~= EOF && equal (arg, "-d"s) == YES)
      if (getarg (2, arg, MAXARG) == EOF)
         call error ("Usage: x [-d <pathname>] { <primos command> }"p)
      elif (follow (arg, 0) ~= OK) {
         call putlin (arg, ERROUT)
         call error (": bad pathname"p)
         }
      else {
         call delarg (1)
         call delarg (1)
         }

   len = 0
   for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i += 1) {
      if (len > 0) {
         len += 1
         cmd (len) = ' 'c
         }
      len += ctoc (arg, cmd (len + 1), MAXCMD - len)
      }

   if (i > 1)  # some argument seen
      status = sys$$ (cmd, ERR)
   else
      repeat {
         if (input (STDIN, "ok, *,#,s"p, MAXCMD, cmd) == EOF) {
            if (isatty (STDIN) == YES)
               call putch (NEWLINE, TTY)
            break
            }
         status = sys$$ (cmd, STDIN)
         } until (status ~= OK)

   if (status == ERR)
      call seterr (1000)

   call follow (EOS, 0)

   stop
   end
