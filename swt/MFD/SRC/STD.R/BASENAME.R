# basename --- handle all the nonsense of file naming conventions

# Usage:
#     basename -b {<pathname>}    print the base file name only
#     basename -f {<pathname>}    print the directory path and base name
#     basename -s {<pathname>}    print the file suffix only
#     basename -d {<pathname>}    print the directory path only
#     basename -g {<pathname>}    print the base name and suffix only

   include ARGUMENT_DEFS

   integer last_colon, last_slash, last_dot, last_char, arg_ct, ap
   integer i, j, spos, epos
   integer getarg, getlin, index
   character arg (MAXLINE), name (MAXLINE)
   ARG_DECL
   string usage_msg "Usage:  basename -(b|f|s|d|g) { <pathname> }"

   procedure do_arg forward

   PARSE_COMMAND_LINE ("bfgsdn<ign>"s, usage_msg)

   arg_ct = 0
   if (ARG_PRESENT (b))
        arg_ct += 1
   if (ARG_PRESENT (f))
        arg_ct += 1
   if (ARG_PRESENT (s))
        arg_ct += 1
   if (ARG_PRESENT (d))
        arg_ct += 1
   if (ARG_PRESENT (g))
        arg_ct += 1
   if (arg_ct > 1)
      call error (usage_msg)

   for (ap = 1; getarg (ap, arg, MAXLINE) ~= EOF; ap += 1)
      do_arg

   if (ap == 1)      # no arguments
      while (getlin (arg, STDIN) ~= EOF) {
         i = index (arg, NEWLINE)
         if (i ~= 0)
            arg (i) = EOS
         do_arg
         }

   stop

   # do_arg --- select the component of a name and print it

      procedure do_arg {

      last_colon = 0
      last_slash = 0
      last_dot = 0
      for (i = 1; arg (i) ~= EOS; i += 1)
         select (arg (i))
            when (ESCAPE)
               if (arg (i + 1) ~= EOS)
                  i += 1
            when (':'c)
               last_colon = i
            when ('/'c)
               last_slash = i
            when ('.'c)
               last_dot = i
      last_char = i - 1

      if (ARG_PRESENT (d)) {
         spos = 1
         epos = last_slash - 1
         }
      else if (ARG_PRESENT (s)) {
         epos = last_char
         if (last_dot > last_slash)
            spos = last_dot + 1
         else
            spos = epos + 1
         }
      else if (ARG_PRESENT (f)) {
         spos = 1
         if (last_dot > last_slash)
            epos = last_dot - 1
         else
            epos = last_char
         }
      else if (ARG_PRESENT (g)) {
         spos = last_slash + 1
         epos = last_char
         }
      else {
         spos = last_slash + 1
         if (last_dot > last_slash)
            epos = last_dot - 1
         else
            epos = last_char
         }

      for ({i = spos; j = 1}; i <= epos; {i += 1; j += 1})
         name (j) = arg (i)
      name (j) = EOS
      call print (STDOUT, "*s*n"s, name)

      }

   end
