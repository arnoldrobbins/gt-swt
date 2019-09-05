# radix --- change the radix of numbers

   include ARGUMENT_DEFS

   integer i, ap, ir, or
   integer getarg, getlin
   character arg (MAXLINE)
   longint num
   longint gctol
   ARG_DECL

   PARSE_COMMAND_LINE ("i<req int> o<req int>"s,
         "Usage:  radix [-i <radix in>] [-o <radix out>] { <number> }"s)

   ARG_DEFAULT_INT (i, 10)
   ARG_DEFAULT_INT (o, 10)

   ir = ARG_VALUE (i)
   or = ARG_VALUE (o)

   for (ap = 1; getarg (ap, arg, MAXLINE) ~= EOF; ap += 1) {
      i = 1
      num = gctol (arg, i, ir)
      call print (STDOUT, "*,#l*n"s, or, num)
      }

   if (ap <= 1)
      while (getlin (arg, STDIN) ~= EOF) {
         i = 1
         num = gctol (arg, i, ir)
         call print (STDOUT, "*,#l*n"s, or, num)
         }

   stop
   end
