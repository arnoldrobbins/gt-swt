# iota --- print natural numbers up to specified limit;
#          lower limit may also be specified

   include ARGUMENT_DEFS

   ARG_DECL

   integer i, limlo, limhi
   integer getarg, gctoi

   character arg (MAXLINE)

   string umsg "Usage: iota [-f <format>] [<lower_lim>] <upper_lim>"

   PARSE_COMMAND_LINE ("f<rs>"s, umsg)
   ARG_DEFAULT_STR (f, "*i"s)

   if (getarg (1, arg, MAXLINE) == EOF)
      call error (umsg)

   limlo = 1      # the default

   i = 1
   limhi = gctoi (arg, i, 10)
   if (arg (i) ~= EOS)
      call error (umsg)

   if (getarg (2, arg, MAXLINE) ~= EOF) {
      limlo = limhi
      i = 1
      limhi = gctoi (arg, i, 10)
      if (arg (i) ~= EOS)
         call error (umsg)
      }

   if (limlo < limhi)
      for (i = limlo; i <= limhi; i += 1) {
         call print (STDOUT, ARG_TEXT (f), i)
         call putch (NEWLINE, STDOUT)
         }
   else
      for (i = limlo; i >= limhi; i -= 1) {
         call print (STDOUT, ARG_TEXT (f), i)
         call putch (NEWLINE, STDOUT)
         }

   stop
   end
