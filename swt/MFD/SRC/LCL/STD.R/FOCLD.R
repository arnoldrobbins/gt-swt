# load --- try to get a program into bogus gt40

   define(DELAY, 7500)

   integer getch, getarg, open

   character ch, arg (MAXLINE)
   integer count, fd

   if (getarg (1, arg, MAXLINE) == EOF)
      fd = STDIN
   else {
      fd = open (arg, READ)
      if (fd == ERR)
         call cant (arg)
      }

   while (getch (ch, fd) ~= EOF) {
      call putch (ch, STDOUT)
      for (count = 1; count <= DELAY; count = count + 1)
         ;
      if (ch == NEWLINE)
         call sleep$ (intl (300))
      }

   if (fd ~= STDIN)
      call close (fd)

   stop
   end
