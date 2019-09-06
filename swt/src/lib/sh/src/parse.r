# parse --- parse command line and execute it

   integer function parse (command, status)
   pointer command
   integer status

   include PARSE_COMMON
   include CI_COMMON

   integer net, check_labels

   if (and (Ci_trace, EX_TRACE) ~= 0)
      call net_trace (command, Ci_file, "ex"s)

   call init_ports            # initialize port tables
   call init_args             # initialize argument list
   call init_labels           # initialize label table

   Curnode = 1                # set current node number

   Cmd_cursor = 0             # initialize 'synerr's context cursor
   Cmd = command              # initialize 'synerr's command pointer
   Cmd_ptr = command          # initialize 'get_sym's command pointer
   call get_sym               # fire up the lexical analyzer

   # this section recognizes the syntax:
   #   <command> ::= <net> <net_terminator>

   if (net (status) ~= OK)          # parse a network
      ;

   elif (Sym_type ~= NETTERM_SYM) {
      call synerr ("semicolon or newline expected"p)
      status = ERR
      }

   else
      call check_labels (status)    # all labels defined?

   call clr_labels    # throw away label strings

   if (status == OK)
      call execute (status)

   call clr_ports     # throw away pathname strings
   call clr_args      # throw away argument strings

   return (status)

   end



# net --- parse a <net>, storing pertinent semantic information

   integer function net (status)
   integer status

   include PARSE_COMMON

   integer node, node_sepr, enter_label

   # scan the following syntax:
   #   <net> ::= {<node> <node_sepr> {<node_sepr>}} <node> {<node_sepr>}

   for ( ; Curnode <= MAXNODES && node (status) == OK; Curnode += 1) {
      if (node_sepr (status) == EOF)      # look for a node separator
         break # none; this must be the last node
      while (node_sepr (status) == OK)    # parse the rest of them
         ;
      if (status == ERR)      # error in node separator
         break
      }

   if (status == EOF)         # tried to parse non-existent node
      status = OK

   if (Curnode > MAXNODES)    # too many nodes?
      if (Sym_type ~= NETTERM_SYM) {
         call synerr ("too many nodes in net"p)
         status = ERR
         }
      else
         Curnode -= 1

   if (status == OK)
      status = enter_label ("$"s, Curnode)   # define "$" as last node

   return (status)

   end



# node_sepr --- parse a <node separator>, recording i/o port information

   integer function node_sepr (status)
   integer status

   include PARSE_COMMON

   integer make_oport, lookup_label

   if (Sym_type == COMMA_SYM)       # check for null i/o connector
      status = OK

   elif (Sym_type == PIPE_SYM) {    # check for a pipe connection
      if (Sym_node == ERR) {        # handle symbolic node spec (label)
         if (make_oport (Curnode, PIPE_SYM, Sym_oport, 0, Sym_iport) == ERR
               || lookup_label (Sym_str) == ERR)
            status = ERR
         else
            status = OK
         }
      else {                        # handle numeric node spec
         if (Sym_node == 0)         # omitted, use default (Curnode+1)
            Sym_node = Curnode + 1
         status = make_oport (Curnode, PIPE_SYM, Sym_oport,
                                          Sym_node, Sym_iport)
         }
      }

   elif (Sym_type == ERR_SYM)
      status = ERR                  # lexical analyzer spotted an error

   else
      status = EOF                  # not a node separator

   if (status == OK)                # scan next symbol
      call get_sym

   return (status)

   end



# node --- parse a <node>, storing pertinent semantic information

   integer function node (status)
   integer status

   include PARSE_COMMON

   integer num_args, num_funnels
   integer enter_label, redirector, argument

   num_args = 0      # no args seen yet
   num_funnels = 0   # no redirectors seen yet

   status = EOF      # nothing parsed yet

   while (Sym_type == LABEL_SYM) {  # check for node labels
      status = enter_label (Sym_str, Curnode)   # define the label
      if (status == ERR)
         return (status)
      call get_sym
      }

   repeat {
      select (Sym_type)
         when (ARG_SYM, LABEL_SYM) {   # labels are args in mid-node
            num_args += 1
            if (argument (status) == ERR)
               break
            }
         when (CMDSRC_SYM, FROM_SYM, TOWARD_SYM, APPEND_SYM) {
            num_funnels += 1
            if (redirector (status) == ERR)
               break
            }
         when (ERR_SYM) {
            status = ERR
            break
            }
         ifany
            call get_sym
      else  # nothing we're interested in
         break
      }

   if (status == OK && num_args == 0)
      if (num_funnels ~= 0) {
         status = ERR
         call synerr ("missing command name"p)
         }

   return (status)

   end



# argument --- process an argument string

   integer function argument (status)
   integer status

   include PARSE_COMMON

   integer putarg
   pointer ptr
   pointer lsmake

   status = putarg (lsmake (ptr, Sym_text), Curnode)

   return (status)

   end



# redirector --- process an i/o redirector

   integer function redirector (status)
   integer status

   include PARSE_COMMON

   pointer pathname
   integer make_iport, make_oport

   if (Sym_type ~= CMDSRCSYM)
      call lsmake (pathname, Sym_str)

   if (Sym_type == FROM_SYM || Sym_type == CMDSRC_SYM)
      status = make_iport (Curnode, Sym_type, Sym_iport, pathname, 0)
   else
      status = make_oport (Curnode, Sym_type, Sym_oport, pathname, 0)

   return (status)

   end



# get_sym --- scan the next symbol in the command line

   subroutine get_sym

   include PARSE_COMMON
   include CI_COMMON

   integer i, j, chrpos
   integer cknum, ckalf, equal
   pointer backup
   character c, quote
   character lsgetc
   bool first_char

   procedure return_err forward

   repeat {
      call lsgetc (Cmd_ptr, c)
      Cmd_cursor += 1
      } until (c ~= ' 'c && c ~= TAB)

   Sym_type = 0
   Sym_len = 0
   Sym_node = 0
   Sym_iport = 0
   Sym_oport = 0
   Sym_str (1) = EOS

   first_char = TRUE

   repeat {
      select (c)

         when (' 'c, TAB)  # end of symbol
            break

         when (','c, ';'c, EOS) {   # end of symbol or single char sym
            if (~first_char) {   # end of symbol
               Cmd_ptr = backup  # "push back" the special character
               Cmd_cursor -= 1
               }
            else {
               select (c)
                  when (','c)
                     Sym_type = COMMA_SYM
                  when (';'c, EOS)
                     Sym_type = NETTERM_SYM
               Sym_len = 1
               Sym_text (1) = c
               }
            break
            }

         when ('|'c)    # pipe connector
            if (Sym_type == 0) {
               Sym_type = PIPE_SYM
               chrpos = Symlen + 1     # save position of bar
               }
            else {
               call synerr ("whitespace needed around pipe connector"p)
               return_err
               }

         when ('>'c)    # i/o redirector
            if (Sym_type == 0) {
               Sym_type = FUNNEL_SYM
               chrpos = Sym_len + 1    # save position of funnel
               }
            elif (Sym_type == FUNNEL_SYM)
               Sym_type = DBLFUNNEL_SYM
            else {
               call synerr ("whitespace needed around redirector"p)
               return_err
               }

         when (':'c)
            if (Sym_len > 0)  # only significant at beginning
               ;
            else
               Sym_type = LABEL_SYM

         when ("'"c, '"'c) {
            quote = c
            while (lsgetc (Cmd_ptr, c) ~= quote && c ~= EOS) {
               Cmd_cursor += 1
               if (Sym_len >= MAXLINE - 1) {
                  call synerr ("token too long"p)
                  return_err
                  }
               Sym_len += 1
               Sym_text (Sym_len) = c
               }
            Cmd_cursor += 1
            if (c == EOS) {
               call synerr ("missing quote"p)
               return_err
               }
            backup = Cmd_ptr
            call lsgetc (Cmd_ptr, c)
            Cmd_cursor += 1
            first_char = FALSE
            next
            }

      if (Sym_len >= MAXLINE - 1) {
         call synerr ("token too long"p)
         return_err
         }
      Sym_len += 1
      Sym_text (Sym_len) = c
      backup = Cmd_ptr  # save position of next character
      call lsgetc (Cmd_ptr, c)
      Cmd_cursor += 1
      first_char = FALSE
      }  # repeat

   Sym_text (Sym_len + 1) = EOS
   if (Sym_type == 0)   # no distinguishing characteristics
      Sym_type = ARG_SYM   # must be an argument


   select (Sym_type)    # parse parts of labels, pipes & redirectors

      when (LABEL_SYM) {
         call sdrop (Sym_text, Sym_str, 1)   # elide the colon
         if (ckalf (Sym_str) == NO) {
            call synerr ("non-alphanumeric label"p)
            return_err
            }
         }

      when (PIPE_SYM) {
         call stake (Sym_text, Sym_str, chrpos - 1)
         Sym_oport = cknum (Sym_str)
         if (Sym_oport == ERR) {
            call synerr ("non-numeric output port"p)
            return_err
            }
         j = chrpos + 1
         for (i = j; Sym_text (i) ~= EOS && Sym_text (i) ~= '.'c; i += 1)
            ;
         call substr (Sym_text, Sym_str, j, i - j) # extract node spec.
         Sym_node = cknum (Sym_str)    # see if it's numeric
         if (Sym_node == ERR && ckalf (Sym_str) == NO
                                    && equal (Sym_str, "$"s) == NO) {
            call synerr ("destination is neither label nor node number"p)
            return_err
            }
         if (Sym_text (i) == '.'c) {   # parse destination input port
            Sym_iport = cknum (Sym_text (i + 1))
            if (Sym_iport == ERR) {
               call synerr ("non-numeric destination input port"p)
               return_err
               }
            }
         else
            Sym_iport = 0  # default
         }  # when (PIPE_SYM)

      when (FUNNEL_SYM, DBLFUNNEL_SYM) {
         call stake (Sym_text, Sym_str, chrpos - 1)
         Sym_oport = cknum (Sym_str)
         if (Sym_oport == ERR || (Sym_text (1) == '>'c &&
               Sym_text (2) == '>'c && cknum (Sym_text (3)) ~= ERR)) {
            chrpos += 1
            if (Sym_text (chrpos) == '>'c)   # a double funnel
               if (Sym_str (1) == EOS) {
                  Sym_type = CMDSRC_SYM
                  chrpos += 1
                  }
               else {
                  call synerr ("pathname not allowed on CMDSRC redirector"p)
                  return_err
                  }
            else
               Sym_type = FROM_SYM
            Sym_iport = cknum (Sym_text (chrpos))
            if (Sym_iport == ERR) {
               call synerr ("non-numeric input port"p)
               return_err
               }
            }
         else {   # output redirector
            if (Sym_text (chrpos + 1) == '>'c) {
               chrpos += 1
               Sym_type = APPEND_SYM
               }
            else
               Sym_type = TOWARD_SYM
            call sdrop (Sym_text, Sym_str, chrpos)
            if (Sym_str (1) == EOS) {
               call synerr ("missing pathname in redirector"p)
               return_err
               }
            }
         }  # when (FUNNEL_SYM, DBLFUNNEL_SYM)

   if (and (Ci_trace, SY_TRACE) ~= 0)
      call symbol_trace

   return


   # return_err --- set Sym_type to ERR_SYM and return

      procedure return_err {

         Sym_type = ERR_SYM
         if (and (Ci_trace, SY_TRACE) ~= 0)
            call symbol_trace
         return

         }


   end



# cknum --- see if a string is numeric

   integer function cknum (str)
   character str (ARB)

   integer i
   integer ctoi

   i = 1
   cknum = ctoi (str, i)
   if (str (i) ~= EOS)
      cknum = ERR

   return
   end



# ckalf --- see if a string is alphanumeric

   integer function ckalf (str)
   character str (ARB)

   integer i

   if (str (1) ~= EOS) {
      if (~IS_LETTER (str (1)))
         return (NO)
      for (i = 2; str (i) ~= EOS; i += 1)
         if (~IS_LETTER (str (i)) && ~IS_DIGIT (str (i))
               && str (i) ~= '_'c)
            return (NO)
      }

   return (YES)

   end



# synerr --- report syntax error

   subroutine synerr (msg)
   integer msg (ARB)

   include PARSE_COMMON

   call errmsg (Cmd, Cmd_cursor, msg)

   return
   end



# semerr --- report semantic error

   subroutine semerr (msg)
   integer msg (ARB)

   call errmsg (0, 0, msg)

   return
   end



# symbol_trace --- trace the just-parsed symbol

   subroutine symbol_trace

   include PARSE_COMMON

   integer l
   string_table symbol_pos, symbol_text,
      /NETTERM_SYM,  "NETTERM_SYM" _
      /COMMA_SYM,    "COMMA_SYM" _
      /PIPE_SYM,     "PIPE_SYM" _
      /LABEL_SYM,    "LABEL_SYM" _
      /ARG_SYM,      "ARG_SYM" _
      /CMDSRC_SYM,   "CMDSRC_SYM" _
      /FROM_SYM,     "FROM_SYM" _
      /TOWARD_SYM,   "TOWARD_SYM" _
      /APPEND_SYM,   "APPEND_SYM" _
      /ERR_SYM,      "ERR_SYM" _
      /0,            "UNKNOWN"

   for (l = 1; l < symbol_pos (1); l += 1)
      if (Sym_type == symbol_text (symbol_pos (l + 1)))
         break

   call print (TTY, "Sym_type = *s, Sym_text = '*s'*n"p,
         symbol_text (symbol_pos (l + 1) + 1), Sym_text)

   return
   end
