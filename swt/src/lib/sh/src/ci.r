# start_logging --- open file for recording command usage

   subroutine start_logging

   include CI_COMMON

   integer open, equal
   character buf (MAXLINE)

   call expand ("=statistics="s, buf, MAXLINE)
   if (equal (buf, "yes"s) == YES) {
      Ci_record = open ("=statsdir=/sh=pid="s, READWRITE)
      if (Ci_record == ERR)
         call print (TTY, "can't open record file*n"p)
      else
         call wind (Ci_record)
      }
   else
      Ci_record = ERR

   return
   end



# stop_logging --- close file used for logging command usage

   subroutine stop_logging

   include CI_COMMON

   if (Ci_record ~= ERR)
      call close (Ci_record)

   return
   end



# log_info --- place some information on the record file

   subroutine log_info (info_fmt, info)
   character info_fmt (ARB), info (ARB)

   include CI_COMMON

   character fmt (MAXLINE)

   if (Ci_record ~= ERR) {
      call expand ("=date= =time= =pid= =user=*51t*2i "s, fmt, MAXLINE)
      call print (Ci_record, fmt, Ci_file)
      call print (Ci_record, info_fmt, info)
      call putch (NEWLINE, Ci_record)
      call flush$ (Ci_record)
      }

   return
   end



# process_hello --- set up for user's "hello" commands

   subroutine process_hello

   include CI_COMMON

   character str (MAXLINE)
   pointer commands
   integer svget

   if (svget ("_hello"s, str, MAXLINE) ~= EOF && str (1) ~= EOS) {
      call lsmake (commands, str)
      call put_back_command (commands)
      if (and (Ci_trace, CL_TRACE) ~= 0)
         call net_trace (commands, Ci_file)
      }

   return
   end



# shell --- top level routine for command interpreter

   integer function shell (fd)
   filedes fd

   include CI_COMMON
   include SWT_COMMON
   include HIST_COMMON

   bool trace
   pointer command
   integer status
   character val (2)
   integer get_cl, eval_netsep, eval_fn, eval_it, eval_cn
   integer svget, isatty
   external shany$
   shortcall mkonu$ (24)

   call mkonu$ ("ANY$"v, loc (shany$))

   if (Ci_file >= CIDEPTH) {  # overflow?
      call print (TTY, "Shell Recursion Limit Exceeded!*n"s)
      return (ERR)
      }
   Ci_file += 1
   Ci_buf (Ci_file) = 0
   Ci_fd (Ci_file) = fd
   if (Ci_file == 1) {  # this is the top level
      Ci_cnodes (1) = 0
      trace = (and (Ci_trace, SR_TRACE) ~= 0)
      call svrest ("=varsfile="s, trace)
      call process_hello
      }
   else {
      Ci_cnodes (Ci_file) = Ci_cnodes (Ci_file - 1)
      call svpush       # enter a new variable scope
      call save_state   # save critical common blocks
      }

1  status = OK
   while (get_cl (command) ~= EOF) {
      if (Cmdstat == 0 && and (Ci_trace, SS_TRACE) ~= 0)
         call single_step (status)
      if (status ~= ERR && Cmdstat == 0
            && eval_netsep (command, status) ~= ERR
            && eval_cn (command, status) ~= ERR
            && eval_fn (command, status) ~= ERR
            && eval_netsep (command, status) ~= ERR
            && eval_it (command, status) ~= ERR
            && eval_netsep (command, status) ~= ERR)
         call parse (command, status)
      call lsfree (command, ALL)
      call remove_cn
      call break$ (DISABLE)
      if (Cmdstat ~= 0)
         status = ERR
      if (status == ERR) {
         call errmsg (0, 0, 0)
         if (Ci_file > 1 && isatty(Ci_fd(Ci_file)) ~= YES) {
            call break$ (ENABLE)
            break
            }
         }
      status = OK
      Cmdstat = 0
      call break$ (ENABLE)
      }

   if (Isphantom == NO && Ci_file <= 1)
      if (svget("_nottyeof"s, val, 2) >= 0) {
         call print(TTY, "use 'stop' to exit the subsystem*n"s)
         goto 1         # blech
         }

   if (Ci_file == 1) {
      trace = (and (Ci_trace, SR_TRACE) ~= 0)
      call svsave ("=varsfile="s, trace)

      if (H_on == YES && Isphantom == NO)
         call histsave("=histfile="s)
      }
   else {
      call restore_state
      call svpop
      }
   Ci_file -= 1

   return (status)
   end



# single_step --- wait for user to OK next net to be executed

   subroutine single_step (status)
   integer status

   character c
   character getch

   call print (TTY, "continue? "p)
   while (getch (c, TTY) == ' 'c)
      ;
   if (c == EOF || c == 'n'c || c == 'N'c)
      status = ERR
   else
      status = OK
   while (c ~= NEWLINE && c ~= EOF)
      call getch (c, TTY)

   return
   end



# net_trace --- print network trace information

   subroutine net_trace (cmd, level, type)
   pointer cmd
   integer level
   character type (ARB)

   logical missin

   if (missin (type))
      call print (TTY, "[*2i] "s, level)
   else
      call print (TTY, "[*2i:*s] "s, level, type)
   call lsputf (cmd, TTY)
   call putch (NEWLINE, TTY)

   return
   end



# search_for --- search for the innermost pair of characters

   subroutine search_for (p, c1, c1_pos, c2, c2_pos)
   pointer p
   character c1, c2
   integer c1_pos, c2_pos

   include SWT_COMMON

   integer pos
   pointer ptr
   character c, quote

   procedure getchar forward     # internal version of 'lsgetc'

   c1_pos = 0
   c2_pos = 0
   pos = 0
   ptr = p

   repeat {    # until brackets are found or string ends
      getchar
      while (c == '"'c || c == "'"c) {
         quote = c
         repeat getchar    # until the matching quote is found
            until (c == quote || c == EOS)
         if (c ~= EOS)
            getchar
         }
      if (c == EOS)     # we ran out of string
         return
      elif (c == c1)    # we found the left bracketing character
         c1_pos = pos
      elif (c == c2) {  # we found the right bracketing character
         c2_pos = pos
         return
         }
      }


   # getchar --- get next character from linked string, increment 'pos'

      procedure getchar {

      while (Ls_ref (ptr) >= OS)
         ptr = Ls_ref (ptr) - OS
      c = Ls_ref (ptr)
      if (c ~= EOS)
         ptr += 1
      pos += 1

      }

   end



# next_unquoted_char --- fetch next unquoted character from string

   character function next_unquoted_char (ptr, pos, c)
   pointer ptr
   integer pos
   character c

   include SWT_COMMON     # for linked strings

   character quote

   procedure getchar forward     # internal version of 'lsgetc'

   getchar
   while (c == "'"c || c == '"'c) {
      quote = c
      repeat getchar
         until (c == quote || c == EOS)
      if (c ~= EOS)
         getchar
      }

   return (c)

   # getchar --- get next character from linked string, increment 'pos'

      procedure getchar {

      while (Ls_ref (ptr) >= OS)
         ptr = Ls_ref (ptr) - OS
      c = Ls_ref (ptr)
      if (c ~= EOS)
         ptr += 1
      pos += 1

      }

   end



# get_cl --- get a non-blank line from the current command file

   integer function get_cl (command)
   pointer command

####  WARNING:  This routine is intimately involved with
####            lsgetf and lsgetf in sh_ls.r

   include CI_COMMON
   include SWT_COMMON

   character c, prompt (MAXLINE)
   pointer buf, p
   integer comment_pos, len, junk
   integer lsgetf, svget, lspos, histsub
   bool continued
   bool isatty
   string std_prompt DEFAULT_PROMPT

   shortcall mkonu$ (18)
   external lsquit

   procedure getchar forward     # internal version of 'lsgetc'

   call break$ (DISABLE)
   if (isatty (Ci_fd (Ci_file)))
      call mkonu$ ("QUIT$"v, loc (lsquit))

   command = Ci_buf (Ci_file)
   Ci_buf (Ci_file) = 0

   if (svget ("_prompt"s, prompt, MAXLINE) == EOF)
      call scopy (std_prompt, 1, prompt, 1)

   get_cl = OK
   while (command == 0 && Cmdstat == 0) {

      if (isatty (Ci_fd (Ci_file))) {  # prompt only when reading TTY
         call gossip    # check for 'to' messages
         call mailchk   # check for pending mail
         call putlin (prompt, TTY)
         }

      continued = TRUE
      while (continued && Cmdstat == 0) {
         len = lsgetf (buf, Ci_fd (Ci_file))
         if (len == EOF)
            break
         call lsdel (buf, len, 1)   # clobber NEWLINE
         if (command == 0)
            command = buf
         else
            call lsjoin (command, buf)
         if (and (Ci_trace, CL_TRACE) ~= 0)
            call net_trace (buf, Ci_file)
         if (len > 1 && lspos (buf, len - 1) == '_'c)
            call lsdel (buf, 1, ALL)  # clobber trailing '_'
         else
            continued = FALSE
         }  # while (continued)

      if (command == 0) {
         get_cl = EOF
         break
         }

      call search_for (command, 0, junk, COMMENT_CHAR, comment_pos)
      if (comment_pos > 0)
         call lsdel (command, comment_pos, ALL)

      for ({p = command; getchar}; c == ' 'c || c == TAB; getchar)
         ;
      if (c == EOS)  # empty command line
         call lsfree (command, ALL)

      if (isatty(Ci_fd(Ci_file)))
         if (histsub(command) == ERR)  # perform history substitutions
            call lsfree (command, ALL)

      }  # while (command == 0)

   call rvonu$ ("QUIT$"v)
   call break$ (ENABLE)

   return


   # getchar --- get next character from linked string

      procedure getchar {

      while (Ls_ref (p) >= OS)
         p = Ls_ref (p) - OS
      c = Ls_ref (p)
      if (c ~= EOS)
         p += 1

      }

   end



# put_back_command --- 'push' a string back into command input

   subroutine put_back_command (ptr)
   pointer ptr

   include CI_COMMON

   pointer junk

   if (Ci_buf (Ci_file) == 0)
      Ci_buf (Ci_file) = ptr
   else
      Ci_buf (Ci_file) = lsjoin (ptr,
         lsjoin (lsmake (junk, ";"s), Ci_buf (Ci_file)))

   ptr = 0

   return
   end



# eval_netsep --- look for semicolon; push back following commands

   integer function eval_netsep (command, status)
   pointer command
   integer status

   include SWT_COMMON      # for linked strings

   integer pos, brace_count, bracket_count
   character c, quote
   pointer rest, ptr

   procedure getchar forward  # internal version of 'lsgetc'

   bracket_count = 0
   brace_count = 0
   ptr = command
   pos = 0

   repeat {    # until brackets are found or string ends
      getchar
      while (c == '"'c || c == "'"c) {
         quote = c
         repeat getchar    # until the matching quote is found
            until (c == quote || c == EOS)
         if (c ~= EOS)
            getchar
         }
      select (c)
         when ('['c)
            bracket_count += 1
         when (']'c)
            bracket_count -= 1
         when ('{'c)
            brace_count += 1
         when ('}'c)
            brace_count -= 1
         when (EOS)
            break
         when (';'c)
            if (brace_count == 0 && bracket_count == 0)
               break
      }  # end of outermost repeat

   if (c == ';'c) {
      call lscut (command, pos - 1, rest)
      call lsdel (rest, 1, 1)  # clobber semicolon
      call put_back_command (rest)
      }

   status = OK

   return (status)


   # getchar --- get next character from linked string, increment 'pos'

      procedure getchar {

      while (Ls_ref (ptr) >= OS)
         ptr = Ls_ref (ptr) - OS
      c = Ls_ref (ptr)
      if (c ~= EOS)
         ptr += 1
      pos += 1

      }

   end



# eval_fn --- find and evaluate function & variable calls

   integer function eval_fn (command, status)
   pointer command
   integer status

   include CI_COMMON
   include PORT_COMMON
   include SWT_COMMON

   integer fn_start, fn_end, fn_size, pos, quote_option
   integer lsgetf, shell, svget, equal
   filedes ifd, ofd
   filedes mktemp
   pointer ptr, fn_call, arg_ptr, p
   character c, quote_value (5)

   procedure getchar forward     # internal version of 'lsgetc'

   status = ERR      # preset error status
   ifd = ERR
   ofd = ERR

   repeat {
      call search_for (command, '['c, fn_start, ']'c, fn_end)
      select
         when (fn_start == 0 && fn_end ~= 0)       # missing bracket
            call errmsg (command, fn_end, "unpaired right bracket"p)
         when (fn_start ~= 0 && fn_end == 0)       # missing bracket
            call errmsg (command, fn_start, "unpaired left bracket"p)
         when (fn_start == 0 && fn_end == 0)       # no more calls
            status = OK          # no errors detected
         ifany
            break

      if (ofd == ERR) {    # create file to capture function's output
         ofd = mktemp (READWRITE)
         if (ofd == ERR) {
            call errmsg (command, fn_end,
                  "can't create temp for function output"p)
            break
            }
         }
      else {
         call rewind (ofd)
         call trunc (ofd)
         }

      if (ifd == ERR) {    # create file to capture function's output
         ifd = mktemp (READWRITE)
         if (ifd == ERR) {
            call errmsg (command, fn_end,
                  "can't create function temp"p)
            break
            }
         }
      else {
         call rewind (ifd)
         call trunc (ifd)
         }

      fn_size = fn_end - fn_start + 1  # include brackets in count
      fn_call = lssubs (command,                # trim out function call
         fn_start + 1, fn_size - 2)
      call lsdel (command, fn_start, fn_size)   # delete from command
      call lsputf (fn_call, ifd)
      call putch (NEWLINE, ifd)
      call rewind (ifd)
      call lsfree (fn_call, ALL)

      Std_port_tbl (2) = ofd     # connect STDOUT1 to output temp
      if (shell (ifd) == ERR) {
         call errmsg (0, 0, 0)   # bomb out at current lexic level
         break
         }

      call rewind (ofd)
      if (svget ("_quote_opt"s, quote_value, 5) ~= EOF
            && equal (quote_value, "YES"s) ~= NO)
         quote_option = YES
      else
         quote_option = NO

      call lsallo (arg_ptr, 0)

      call break$ (DISABLE)   # because 'lsgetf' runs with breaks off
      while (lsgetf (ptr, ofd) ~= EOF) {
         pos = 0
         for ({p = ptr; getchar}; c ~= EOS; getchar)
            if (c == '"'c && quote_option ~= NO) {
               call lsins (ptr, pos, Ci_quote, 1, 4)
               pos += 4
               }
            elif (c == NEWLINE) {
               call lsdel (ptr, pos, 1)
               pos -= 1
               }
         if (quote_option ~= NO)
            ptr = lsjoin (lsmake (p, '"'s), ptr)   # add initial quote
         ptr = lsjoin (lsmake (p, " "s), ptr)      # add initial blank
         call lsjoin (arg_ptr, ptr)    # add to argument string
         if (quote_option == YES)
            call lsjoin (arg_ptr, lsmake (p, '"'s))   # add final quote
         }
      call break$ (ENABLE)    # because 'lsgetf' runs with breaks off

      call lsdel (arg_ptr, 1, 1)    # strip leading blank
      call lsins (command, fn_start - 1, arg_ptr, 1, ALL)
      call lsfree (arg_ptr, ALL)
      } #  end repeat

   if (ifd ~= ERR)
      call rmtemp (ifd)
   if (ofd ~= ERR)
      call rmtemp (ofd)

   if (status == OK && and (Ci_trace, FN_TRACE) ~= 0)
      call net_trace (command, Ci_file, "fn"s)

   return (status)


   # getchar --- get next character from linked string; increment pos

      procedure getchar {

      while (Ls_ref (p) >= OS)
         p = Ls_ref (p) - OS
      c = Ls_ref (p)
      if (c ~= EOS)
         p += 1
      pos += 1

      }

   end



# eval_it --- expand iterated command lines

   integer function eval_it (command, status)
   pointer command
   integer status

   include CI_COMMON
   include SWT_COMMON

   integer it_start_pos (MAXITERATION), it_blank_pos (MAXITERATION)
   integer it_start, it_end, it_length, it_groups, j, junk
   pointer it_ptr (MAXITERATION), ptr, p, m
   character c

   procedure getchar forward     # internal version of 'lsgetc'

   it_groups = 0
   status = ERR      # preset error status

   repeat {
      call search_for (command, '('c, it_start, ')'c, it_end)
      select
         when (it_start == 0 && it_end ~= 0)
            call errmsg (command, it_end, "unpaired right paren"p)
         when (it_start ~= 0 && it_end == 0)
            call errmsg (command, it_start, "unpaired left paren"p)
         when (it_start == 0 && it_end == 0)
            status = OK
         ifany
            break

      if (it_groups >= MAXITERATION) {
         call errmsg (command, it_start, "too many iteration groups"p)
         break
         }

      it_groups += 1
      it_length = it_end - it_start + 1
      it_start_pos (it_groups) = it_start - 1
      it_ptr (it_groups) = lssubs (command, it_start + 1, it_length - 2)
      call lsjoin (it_ptr (it_groups), lsmake (p, " "s))
      call lsdel (command, it_start, it_length)
      }  # repeat

   if (it_groups > 0) {       # skip the rest if iteration not used

      if (status ~= ERR)
         for (j = 2; j <= it_groups; j += 1)
            if (it_start_pos (j) < it_start_pos (j - 1)) {
               call errmsg (it_ptr (j - 1), 1,
                              "nested iteration not supported"p)
               status = ERR
               break
            }

      if (status ~= ERR) {    # continue only if error-free
         status = ERR   # preset error status
         call lsallo (ptr, 0)
         repeat {    # for each element in the first group

            # for all groups, trim leading blanks then find
            # the end of the first element in the group
            do j = 1, it_groups; {
               p = it_ptr (j)
               getchar
               while (c == ' 'c) {
                  call lsdel (it_ptr (j), 1, 1)
                  p = it_ptr (j)
                  getchar
                  }
               call search_for (it_ptr (j), NEWLINE, junk,
                                             ' 'c, it_blank_pos (j))
               }

            if (it_blank_pos (1) == 0) {
               # the first group has no more elements, make sure
               # all other groups agree, then exit this loop
               for (j = 2; j <= it_groups; j += 1)
                  if (it_blank_pos (j) ~= 0) {
                     call errmsg (it_ptr (j), 1,
                                    "unbalanced iteration groups"p)
                     break 2
                     }
               status = OK
               break
               }

            # there's at least one more element in the first group;
            # make sure each other group has at least one more
            for (j = 2; j <= it_groups; j += 1)
               if (it_blank_pos (j) == 0) {
                  call errmsg (it_ptr (1), 1,
                                 "unbalanced iteration groups"p)
                  break 2
                  }

            # all groups have at least one element left; make a copy
            # of the command using the first element from each group
            m = 0
            call lscopy (command, 1, m, 1)
            for (j = it_groups; j >= 1; j -= 1) {
               call lscut (it_ptr (j), it_blank_pos (j) - 1, p)
               call lsins (m, it_start_pos (j), it_ptr (j), 1, ALL)
               call lsfree (it_ptr (j), ALL)    # delete the element
               it_ptr (j) = p
               }

            # join this copy of the command to the new command line
            call lsjoin (ptr, lsmake (p, ";"s))
            call lsjoin (ptr, m)
            }  # repeat
         }  # if (status ~= ERR) ...

      do j = 1, it_groups     # release linked-string space
         call lsfree (it_ptr (j), ALL)

      if (status ~= ERR) {    # if error-free, replace old command line
         call lsdel (ptr, 1, 1)        # trim off initial semicolon
         call lsfree (command, ALL)    # release old command line
         command = ptr                 # substitute the new one
         }
      else
         call lsfree (ptr, ALL)
      }  # if (it_groups > 0) ...

   if (status ~= ERR && and (Ci_trace, IT_TRACE) ~= 0)
      call net_trace (command, Ci_file, "it"s)

   return (status)


   # getchar --- get next character from linked string

      procedure getchar {

      while (Ls_ref (p) >= OS)
         p = Ls_ref (p) - OS
      c = Ls_ref (p)
      if (c ~= EOS)
         p += 1

      }

   end



# initialize_everything --- initialize all tables

   subroutine initialize_everything

   include CI_COMMON
   include ARGS_COMMON
   include PORT_COMMON
   include HIST_COMMON

   integer i

   H_on = NO            # history is initially off
   Ci_file = 0

   Next_arg = 1
   do i = 1, MAXNODES; {
      Next_iport (i) = 1
      Next_oport (i) = 1
      }

   do i = 1, MAX_STD_PORTS
      Default_port_table (i) = TTY

   call lsinit
   call lsmake (Ci_quote, "'" '"' "'" '"'s)

   call svinit
   call histinit
   call mailinit

   return
   end



# save_state --- save state of command interpreter

   subroutine save_state

   include ARGS_COMMON
   include CI_COMMON
   include PARSE_COMMON
   include PORT_COMMON
   include SAVE_COMMON
   include SWT_COMMON

   call move$ (Arg_table, Save_arg_table (1, Ci_file), ARG_TABLE_SIZE)
   Save_next_arg (Ci_file) = Next_arg
   Next_arg = 1

   call move$ (Next_iport, Save_next_iport (1, Ci_file), MAXNODES)
   call move$ (Next_oport, Save_next_oport (1, Ci_file), MAXNODES)
   call move$ (Ipd, Save_ipd (1, Ci_file), IPD_SIZE)
   call move$ (Opd, Save_opd (1, Ci_file), OPD_SIZE)
   call move$ (Default_port_table, Save_port_table (1, Ci_file),
      MAX_STD_PORTS)
   call move$ (Std_port_tbl, Default_port_table, MAX_STD_PORTS)

   Save_curnode (Ci_file) = Curnode

   return
   end



# restore_state --- restore state of command interpreter

   subroutine restore_state

   include ARGS_COMMON
   include CI_COMMON
   include PORT_COMMON
   include PARSE_COMMON
   include SAVE_COMMON
   include SWT_COMMON

   Next_arg = Save_next_arg (Ci_file)

   call move$ (Save_arg_table (1, Ci_file), Arg_table, ARG_TABLE_SIZE)
   call move$ (Save_next_iport (1, Ci_file), Next_iport, MAXNODES)
   call move$ (Save_next_oport (1, Ci_file), Next_oport, MAXNODES)
   call move$ (Save_ipd (1, Ci_file), Ipd, IPD_SIZE)
   call move$ (Save_opd (1, Ci_file), Opd, OPD_SIZE)
   call move$ (Default_port_table, Std_port_tbl, MAX_STD_PORTS)
   call move$ (Save_port_table (1, Ci_file), Default_port_table,
      MAX_STD_PORTS)

   Curnode = Save_curnode (Ci_file)

   return
   end



# errmsg --- handle error conditions [s.a. synerr, semerr]

   subroutine errmsg (cmd, cp, msg)
   pointer cmd
   integer cp, msg

   include CI_COMMON

   call context (cmd, cp)

   if (msg ~= 0) {
      call print (TTY, "*p*n"p, msg)
      call log_info ("E *p"s, msg)
      }

   call wind (Ci_fd (Ci_file))            # \
   call lsfree (Ci_buf (Ci_file), ALL)    #  > kill current lexic level
   Ci_buf (Ci_file) = 0                   # /

   return
   end



# context --- print error context

   subroutine context (cmd, cp)
   pointer cmd
   integer cp

   include CI_COMMON

   character logstr (60)

   if (cmd == 0)
      return

   call lsputf (cmd, TTY)
   call putch (NEWLINE, TTY)
   call print (TTY, "*#c*n"p, -cp, '^'c)
   if (Ci_record ~= ERR) {
      call lsextr (cmd, logstr, 60)
      call log_info ("C *s"s, logstr)
      }

   return
   end



# gossip --- process inter-user real-time communication

   subroutine gossip

   include SWT_COMMON

   integer svget
   file_des open, mktemp

   file_des fd, tfd
   character buf (1)
   integer pause_val, display
   string g1 "=gossip=/=user="
   string g2 "=gossip=/*=pid="

   pause_val = PG_END
   if (svget ("_pause_gossip"s, buf, 1) ~= EOF)
      pause_val = 0
   if (svget ("_vth_gossip"s, buf, 1) ~= EOF)
      pause_val += PG_VTH

   display = NO
   tfd = mktemp (READWRITE)
   if (tfd == ERR)
      return

   if (Is_phantom == NO) { # dont let phantoms read gossip for =user=
      fd = open (g1, READ)
      if (fd ~= ERR) {
         display = YES
         call fcopy (fd, tfd)
         call close (fd)
         call remove (g1)
         }
      }
   fd = open (g2, READ)
   if (fd ~= ERR) {
      display = YES
      call fcopy (fd, tfd)
      call close (fd)
      call remove (g2)
      }

   if (display == NO) {
      call rmtemp (tfd)
      return
      }

   call rewind (tfd)
   if (Is_phantom == NO)
      call page (tfd, "gossip [*i+]? "s, "gossip [*i$]? "s, 23, TTY, pause_val)
   else
      call fcopy (tfd, TTY)

   call rmtemp (tfd)

   return
   end



# eval_cn --- transform compound nodes into command files

   integer function eval_cn (command, status)
   pointer command
   integer status

   include CI_COMMON

   integer cn_start, cn_end, fd
   integer create
   pointer node_text, pname
   pointer lssubs
   character name (MAXCNAME)

   status = ERR

   repeat {
      call search_for (command, '{'c, cn_start, '}'c, cn_end)

      select
         when (cn_start == 0 && cn_end ~= 0)
            call errmsg (command, cn_end, "unpaired right brace"p)
         when (cn_start ~= 0 && cn_end == 0)
            call errmsg (command, cn_start, "unpaired left brace"p)
         when (cn_start == 0 && cn_end == 0)
            status = OK
         ifany
            break

      Ci_cnodes (Ci_file) += 1
      call encode (name, MAXCNAME,
                     "=temp=/cn=pid=*i"s, Ci_cnodes (Ci_file))
      fd = create (name, WRITE)
      if (fd == ERR) {
         call errmsg (command, cn_start,
                        "can't create compound node temp"p)
         break
         }

      call encode (name, MAXCNAME, "^cn/*i"s, Ci_cnodes (Ci_file))
      node_text = lssubs (command, cn_start + 1, cn_end - cn_start - 1)
      call lsputf (node_text, fd)
      call putch (NEWLINE, fd)
      call close (fd)
      call lsdel (command, cn_start, cn_end - cn_start + 1)
      call lsmake (pname, name)
      call lsins (command, cn_start - 1, pname, 1, ALL)
      call lsfree (pname, ALL)
      call lsfree (node_text, ALL)
      }

   if (status == OK && and (Ci_trace, CN_TRACE) ~= 0)
      call net_trace (command, Ci_file, "cn"s)

   return (status)

   end



# remove_cn --- delete files containing compound node text

   subroutine remove_cn

   include CI_COMMON

   integer bottom
   character name (MAXCNAME)

   if (Ci_file <= 1)
      bottom = 0
   else
      bottom = Ci_cnodes (Ci_file - 1)

   while (Ci_cnodes (Ci_file) > bottom) {
      call encode (name, MAXCNAME,
                     "=temp=/cn=pid=*i"s, Ci_cnodes (Ci_file))
      call remove (name)
      Ci_cnodes (Ci_file) -= 1
      }

   return
   end



#  mailinit --- initialize the command interpreter mail checking common

   subroutine mailinit

   include CI_COMMON

   integer at
   filedes fd, pfd
   integer entry(MAXDIRENTRY)

   filedes open
   longint szfil$
   integer finfo$, mapfd

   string m1 "=mail=/=user="

   call gettim(Ci_check)         # remember the last time we checked
   Ci_mdate = Ci_check
   Ci_msize = 0

   if (finfo$(m1, entry, at) ~= OK) {
      call follow(EOS, 0)
      return
      }

   call follow(EOS, 0)
   call cv$dqs(entry(21), Ci_mdate) # obtain the last time modified
   fd = open(m1, READ)
   if (fd == ERR)
      return

   pfd = mapfd(fd)
   if (pfd == ERR) {
      call close(fd)
      return
      }

   Ci_msize = szfil$(pfd)        # check the current size
   if (Ci_msize == ERR)
      Ci_msize = 0

   call close(fd)
   return
   end



#  mailchk --- see if we have any mail awaiting our perusal

   subroutine mailchk

   include CI_COMMON

   integer at, i
   filedes fd, pfd
   longint curr, delta
   character chk(MAXLINE)
   integer entry(MAXDIRENTRY)

   filedes open
   longint szfil$, ctol
   integer finfo$, mapfd, svget

   string m1 "=mail=/=user="

   if (svget("_mail_check"s, chk, MAXLINE) == EOF)
      return

   i = 1
   delta = ctol(chk, i) / 4            # convert to quadseconds
   if (delta == 0)
      delta = 15                       # default to 60 (15 quadseconds)

   call gettim(curr)
   if (curr < Ci_check + delta)
      return

   Ci_check = curr                     # reset to the current time
   if (finfo$(m1, entry, at) ~= OK) {
      Ci_mdate = Ci_check - delta - 1  # so it show up when we get some
      call follow(EOS, 0)
      Ci_msize = 0
      return
      }

   call follow(EOS, 0)
   call cv$dqs(entry(21), curr)        # convert current file date
   if (curr <= Ci_mdate)
      return                           # file hasn't changed

   Ci_mdate = curr
   fd = open(m1, READ)
   if (fd == ERR)
      return

   pfd = mapfd(fd)
   if (pfd == ERR) {
      call close(fd)
      return
      }

   curr = szfil$(pfd)
   if (curr <= Ci_msize) {
      Ci_msize = curr                  # save the current size, but the
      call close(fd)                   # file hasn't really changed
      return
      }

   Ci_msize = curr                     # save the new file size
   call close(fd)

   call print(TTY, "You have new mail*n"s)
   return
   end
