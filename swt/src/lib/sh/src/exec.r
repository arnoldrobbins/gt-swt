# execute --- execute parsed command line

   integer function execute (status)
   integer status

   include EXEC_COMMON
   include PARSE_COMMON

   integer assign_ports, order, execute_node
   integer execution_order (MAXNODES), i, nodes

   call init_connect

   if (assign_ports (status) == ERR)
      return (status)

   nodes = Curnode      # use Curnode for saving current node number
   if (order (Connect, nodes, execution_order) ~= ERR) {
      do i = 1, nodes; {
         Curnode = execution_order (i)
         status = execute_node (Curnode)
         if (status ~= OK)
            break
         }
      }
   else {
      call semerr ("net is not serially executable"p)
      status = ERR
      }

   return (status)

   end



# init_connect --- initialize connectivity matrix

   subroutine init_connect

   include EXEC_COMMON

   integer i, j

   do i = 1, MAXNODES
      do j = 1, MAXNODES
         Connect (i, j) = 0

   return
   end



# execute_node --- execute one node of a network

   integer function execute_node (n)
   integer n

   include CI_COMMON
   include SWT_COMMON

   integer i, j, len, rp, status
   integer ctoc, getarg, get_element, invoke_ext, invoke_int, invoke_var,
         setup_args, setup_ports, svget
   character cmd (MAXLINE), cmd2 (MAXLINE), elem (MAXLINE), sr (MAXLINE)
   logical trace

   execute_node = ERR   # guilty until proven innocent

   if (Cmdstat ~= 0)
      return   # before opening standard ports

   if (setup_ports (n) ~= OK || setup_args (n) ~= OK) {
      call cleanup_ports (n)
      return
      }

   if (and (Ci_trace, ND_TRACE) ~= 0) {
      call print (TTY, "[*2i.*i]"s, Ci_file, n)
      for (i = 0; getarg (i, cmd, MAXLINE) ~= EOF; i += 1)
         call print (TTY, " '*s'"p, cmd)
      call putch (NEWLINE, TTY)
      }

   if (and (Ci_trace, PD_TRACE) ~= 0)
      call dump_ports (n)

   if (getarg (0, cmd, MAXLINE) == EOF) {
      call cleanup_ports (n)
      return (OK)
      }

   if (cmd (1) == '^'c && cmd (2) == 'c'c && cmd (3) == 'n'c) {
      call encode (cmd2, MAXLINE, "=temp=/cn=pid=*s"s, cmd (5))
      status = invoke_ext (cmd2)
      }
   else {
      status = EOF
      if (svget ("_search_rule"s, sr, MAXLINE) == EOF
            || sr (1) == EOS)
         call scopy (DEFAULT_SEARCH_RULE, 1, sr, 1)
      trace = (and (Ci_trace, LO_TRACE) ~= 0)
      rp = 1
      while (Cmdstat == 0 && status == EOF) {
         len = get_element (sr, rp, elem)
         if (len == EOF)
            break
         if (trace)
            call print (TTY, "searching *s ...*n"s, elem)
         select
            when (elem (1) == '^'c && elem (2) == 'i'c &&
                  elem (3) == 'n'c && elem (4) == 't'c) {   # ^int?*
               status = invoke_int (cmd, elem (5))
               if (status ~= EOF && Ci_record ~= ERR) {
                  i = ctoc (elem, cmd2, MAXLINE)
                  i += ctoc ("/"s, cmd2 (i + 1), MAXLINE - i - 1)
                  i = ctoc (cmd, cmd2 (i + 1), MAXLINE - i - 1)
                  call log_info ("F *s"s, cmd2)
                  }
               }
            when (elem (1) == '^'c && elem (2) == 'v'c &&
                  elem (3) == 'a'c && elem (4) == 'r'c) {   # ^var?*
               status = invoke_var (cmd)
               if (status ~= EOF && Ci_record ~= ERR) {
                  i = ctoc (elem, cmd2, MAXLINE)
                  i += ctoc ("/"s, cmd2 (i + 1), MAXLINE - i - 1)
                  i = ctoc (cmd, cmd2 (i + 1), MAXLINE - i - 1)
                  call log_info ("F *s"s, cmd2)
                  }
               }
            when (len >= 1 || elem (len - 1) ~= '/'c ||
                  elem (len) ~= '&'c || cmd (1) ~= '/'c) {  # external
               j = 1
               for (i = 1; elem (i) ~= EOS && j < MAXLINE; i += 1)
                  if (elem (i) == '&'c)
                     j += ctoc (cmd, cmd2 (j), MAXLINE - j + 1)
                  else {
                     cmd2 (j) = elem (i)
                     j += 1
                     }
               cmd2 (j) = EOS
               status = invoke_ext (cmd2)
               if (status ~= EOF && Ci_record ~= ERR) {
                  call expand (cmd2, cmd, MAXLINE)
                  call log_info ("F *s"s, cmd)
                  }
               }

         }  # while (Cmdstat == 0 && status == EOF) ...

      if (status ~= EOF && trace)
         call print (TTY, "found in *s*n"s, elem)
      }

   call cleanup_ports (n)
   if (Cmdstat ~= 0)
      return

   if (status == EOF) {
      status = ERR
      if (Ci_record ~= ERR)
         call log_info ("N *s"s, cmd)
      call print (TTY, "*s: not found*n"s, cmd)
      }
   if (status == ERR)
      call errmsg (0, 0, 0)

   return (status)
   end



# get_element --- extract next element of search rule

   integer function get_element (rule, ptr, str)
   character rule (ARB), str (ARB)
   integer ptr

   integer i

   for (i = 1; rule (ptr) ~= ','c && rule (ptr) ~= EOS; i += 1) {
      str (i) = rule (ptr)
      ptr += 1
      }

   str (i) = EOS

   if (rule (ptr) == EOS) {
      if (i <= 1)
         return (EOF)
      }
   else
      ptr += 1

   return (i - 1)
   end



# invoke_ext --- invoke an external command or shell program

   integer function invoke_ext (cmd)
   character cmd (ARB)

   integer status, junk (3), at, file (16)
   integer file_type, call$$, shell
   filedes fd
   filedes open
   external onany$

   status = EOF
   select (file_type (cmd))
      when (BINARY_FTYPE) {
         call getto (cmd, file, junk, at)
         status = call$$ (file, 32, onany$)
         if (at ~= NO)
            call follow (EOS, 0)
         }
      when (TEXT_FTYPE) {
         fd = open (cmd, READ)
         if (fd == ERR)
            status = EOF
         else {
            status = shell (fd)
            call close (fd)
            }
         }

   return (status)
   end



# invoke_var --- invoke a shell variable (print its value)

   integer function invoke_var (cmd)
   character cmd (ARB)

   integer svget
   character val (MAXLINE)

   if (svget (cmd, val, MAXLINE) == EOF)
      return (EOF)

   call putlin (val, STDOUT)
   call putch (NEWLINE, STDOUT)

   return (OK)
   end



# file_type --- determine type of a file (binary or text)

   integer function file_type (file)
   character file (ARB)

   integer fd, i, len, typ
   integer open, getlin
   character line (20)

   fd = open (file, READ, typ)
   if (fd == ERR || typ == 4) {  # file not found or is a UFD
      if (typ == 4 && fd ~= ERR)
         call close (fd)
      return (UNKNOWN_FTYPE)
      }

   if (typ >= 2)  # file is a segment directory
      file_type = BINARY_FTYPE
   else {
      len = getlin (line, fd, 20)
      file_type = TEXT_FTYPE
      for (i = 1; i < len; i += 1)
         if (line (i) < NUL || line (i) > DEL) {
            file_type = BINARY_FTYPE
            break
            }
      }

   call close (fd)

   return
   end
