# uniq --- strip adjacent duplicate lines

   include ARGUMENT_DEFS

   ARG_DECL
   character buf1 (MAXLINE), buf2 (MAXLINE)
   integer t, count
   integer getlin, equal

   PARSE_COMMAND_LINE ("n"s, "Usage: uniq [-n]"p)

   t = getlin (buf1, STDIN)
   while (t ~= EOF) {
      count = 1
      for (t = getlin (buf2, STDIN); t ~= EOF;
            t = getlin (buf2, STDIN)) {
         if (equal (buf1, buf2) == NO)
            break
         count += 1
         }
      if (ARG_PRESENT (n))
         call putdec (count, 5, STDOUT)
      call putlin (buf1, STDOUT)
      if (t == EOF)
         break
      count = 1
      for (t = getlin (buf1, STDIN); t ~= EOF;
            t = getlin (buf1, STDIN)) {
         if (equal (buf1, buf2) == NO)
            break
         count += 1
         }
      if (ARG_PRESENT (n))
         call putdec (count, 5, STDOUT)
      call putlin (buf2, STDOUT)
      }

   stop
   end
