#  repeat_cmd --- repeat loop for the shell

   subroutine repeat_cmd

#  Syntax:
#     repeat
#        {<command>}
#     until <value>

   include CI_COMMON
   include ARGS_COMMON
   include SAVE_COMMON
   include PARSE_COMMON

   character args(2048), cmd(MAXLINE), lab(1024)
   integer getneta, equal, ctoc, shell, putarg
   integer nesting, alen, len, code, i, j
   file_des mktemp
   pointer tptr
   file_des fd

   integer first, last
   integer next_arg, curnode
   character arg_table(2, MAXARGS)

   fd = mktemp(READWRITE)
   if (fd == ERR)
      call error("can't create temporary file for repeat loop"p)

#  the repeat command needs the arguments from where it was called,
#  so we must fix them before anything else. first, remove any
#  possible arguments for the repeat loop and pack the remaining
#  ones together, again

   for ({i = 1; j = 1}; i < Next_arg; i += 1)
      if (Arg_table(ARG_NODE, i) ~= Curnode) {
         Arg_table(ARG_NODE, j) = Arg_table(ARG_NODE, i)
         Arg_table(ARG_TEXTPTR, j) = Arg_table(ARG_TEXTPTR, i)

         j += 1
         }
      else
         call lsfree(Arg_table(ARG_TEXTPTR, i), ALL)

   Next_arg = j

#  now copy the arguments from where we were called into linked
#  string storage and set them up as the arguments to the current
#  node.

   if (Ci_file > 1) {
      curnode = Save_curnode(Ci_file)
      next_arg = Save_next_arg(Ci_file)
      call move$(Save_arg_table(1, Ci_file), arg_table, ARG_TABLE_SIZE)

      for (last = next_arg - 1; last > 0; last -= 1)
         if (arg_table(ARG_NODE, last) <= curnode)
            break

      for (first = last - 1; first > 0; first -= 1)
         if (arg_table(ARG_NODE, first) ~= curnode)
            break

      for (first += 1; first > 0 && first <= last; first += 1) {
         tptr = 0
         call lscopy(arg_table(ARG_TEXTPTR, first), 1, tptr, 1)

         if (putarg(tptr, Curnode) == ERR) {
            call seterr(1000)
            stop
            }
         }
      }

   call print(fd, ":L*2,,0it*n"s, Ci_file)

   nesting = 0
   repeat {
      if (getneta(cmd, args, lab) == EOF)
         call error("missing 'until'"p)
      select
         when (equal(cmd, "until"s) ~= NO) {
            if (nesting == 0) {
               call putlin(lab, fd)
               call putlin("if "s, fd)
               call putlin(args, fd)
               call print(fd, "else*ngoto L*2,,0it*nfi*n"s, Ci_file)
               break
               }
            nesting -= 1
            call putlin(lab, fd)
            call putlin(cmd, fd)
            call putlin(args, fd)
            }
         when (equal(cmd, "repeat"s) ~= NO) {
            nesting += 1
            call putlin(lab, fd)
            call putlin(cmd, fd)
            call putlin(args, fd)
            }
         else {
            call putlin(lab, fd)
            call putlin(cmd, fd)
            call putlin(args, fd)
            }
      }

   call rewind(fd)
   code = shell(fd)
   call rmtemp(fd)

   if (code == ERR)
      call seterr(1000)

   stop
   end



#  getneta --- get a command and all arguments from the next net

   integer function getneta(cmd, args, lab)
   character cmd(ARB), args(ARB), lab(ARB)

   integer status, alen, len
   integer get_cl, next_repeat_token
   pointer command, c2

   if (get_cl(command) == EOF) {
      cmd(1) = EOS
      args(1) = EOS
      return(EOF)
      }

   call eval_netsep(command, status)

   len = 0
   c2 = command
   alen = next_repeat_token(c2, cmd)
   while (alen ~= EOF && cmd(1) == ':'c) {
      call ctoc(cmd, lab(len + 1), MAXARG)

      len += alen + 1
      lab(len) = ' 'c
      alen = next_repeat_token(c2, cmd)
      }

   if (len > 0) {
      lab(len) = ' 'c
      lab(len + 1) = EOS
      }
   else
      lab(1) = EOS

   len = 1
   args(len) = ' 'c
   alen = next_repeat_token(c2, args(len + 1))
   while (alen ~= EOF) {
      len += alen + 1
      args(len) = ' 'c
      alen = next_repeat_token(c2, args(len + 1))
      }

   args(len) = NEWLINE
   args(len + 1) = EOS
   call lsfree(command, ALL)

   return(OK)
   end



#  next_repeat_token --- return the next token including quotes

   integer function next_repeat_token(lsline, token)
   character token(ARB)
   pointer lsline

   integer i
   character c
   character lsgetc

   repeat
      if (lsgetc (lsline, c) ~= ' 'c && c ~= TAB)
         break

   i = 1
   repeat {
      token(i) = c
      if (c == EOS || c == ' 'c || c == TAB)
         break

      i += 1
      c = lsgetc(lsline, c)
      }

   token(i) = EOS
   if (i == 1 && c == EOS)
      return(EOF)

   return(i - 1)
   end
