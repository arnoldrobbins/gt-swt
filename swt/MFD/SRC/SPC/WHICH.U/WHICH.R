# which --- locate a command

   file_des open
   integer getarg, svget, strbsr, index, ctoc

   character search(MAXLINE), command(MAXLINE), location(MAXLINE),
      execute(MAXLINE)

   file_des fd
   integer i, j, k, l

   string_table int_pos, int_cmd _
      /'a'c,    "arg" _
      /'a'c,    "args" _
      /'a'c,    "argsto" _
      /'c'c,    "case" _
      /'d'c,    "cd" _
      /'h'c,    "date" _
      /'h'c,    "day" _
      /'x'c,    "dbg" _
      /'v'c,    "declare" _
      /'v'c,    "declared" _
      /'m'c,    "drop" _
      /'b'c,    "dump" _
      /'h'c,    "echo" _
      /'c'c,    "elif" _
      /'c'c,    "else" _
      /'c'c,    "esac" _
      /'h'c,    "eval" _
      /'c'c,    "exit" _
      /'c'c,    "fi" _
      /'s'c,    "forget" _
      /'c'c,    "goto" _
      /'s'c,    "hist" _
      /'c'c,    "if" _
      /'m'c,    "index" _
      /'h'c,    "installation" _
      /'c'c,    "label" _
      /'h'c,    "line" _
      /'h'c,    "login_name" _
      /'a'c,    "nargs" _
      /'c'c,    "out" _
      /'x'c,    "primos" _
      /'a'c,    "quote" _
      /'c'c,    "repeat" _
      /'s'c,    "set" _
      /'s'c,    "sh" _
      /'b'c,    "shtrace" _
      /'q'c,    "stop" _
      /'m'c,    "substr" _
      /'m'c,    "take" _
      /'c'c,    "then" _
      /'h'c,    "time" _
      /'c'c,    "until" _
      /'v'c,    "vars" _
      /'x'c,    "vpsd" _
      /'c'c,    "when" _
      /'x'c,    "x"

   if (getarg(1, command, MAXLINE) ~= EOF)
   {
      if (svget("_search_rule"s, search, MAXLINE) == EOF)
         call scopy("^int,^var,&,=lbin=/&,=bin=/&"s, 1, search, 1)
   }
   else
      call error("Usage: which <command>"p)

   for (i = 1; search(i) ~= EOS; i += 1)
   {
      for (j = 1; search(i) ~= ","c && search(i) ~= EOS; {i += 1; j += 1})
         location(j) = search(i)
      location(j) = EOS

      if (search(i) == EOS)
         i -= 1

      if (location(1) == "^"c && location(2) == "i"c &&
          location(3) == "n"c && location(4) == "t"c)
      {
         k = strbsr(int_pos, int_cmd, 1, command)

         if (k ~= EOF)
            if (location(5) == "/"c)
            {
               if (index(location(6), int_cmd(int_pos(k))) == 0)
               {
                  call print(STDOUT, "^int*n"s)
                  stop
               }
            }
            else
            {
               call print(STDOUT, "^int*n"s)
               stop
            }
      }
      else
         if (location(1) == "^"c && location(2) == "v"c &&
             location(3) == "a"c && location(4) == "r"c)
         {
            if (svget(command, k, 1) ~= EOF)
            {
               call print(STDOUT, "^var*n"s)
               stop
            }
         }
         else
         {
            k = 1
            for (l = 1; location(l) ~= EOS && k < MAXLINE; l += 1)
               if (location(l) ~= '&'c)
               {
                  execute(k) = location(l)
                  k += 1
               }
               else
                  k += ctoc(command, execute(k), MAXLINE - k + 1)
            execute(k) = EOS

            fd = open(execute, READ)
            if (fd ~= ERR)
            {
               call close(fd)

               call print(STDOUT, "*s*n"s, execute)
               stop
            }
         }
   }

   call print(ERROUT, "*s: not found in *s*n"s, command, search)
   stop
   end
