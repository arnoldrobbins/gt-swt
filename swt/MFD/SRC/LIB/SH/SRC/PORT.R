# make_iport --- make an entry in the input port descriptor table

   integer function make_iport (node, type, port, path, sopde)
   integer node, type, port, sopde
   pointer path

   include PORT_COMMON

   integer i

   i = Next_iport (node)
   if (i > MAXIPORTS) {
      call synerr ("too many input ports"p)
      return (ERR)
      }

   Next_iport (node) += 1
   Ipd (PD_TYPE, i, node) = type    # FROM_SYM, CMDSRC_SYM or PIPESYM
   Ipd (PD_PORT, i, node) = port    # 1:MAXIPORTS; 0 => defaulted
   Ipd (PD_PATH, i, node) = path    # pointer to pathname
   Ipd (PD_SOPDE, i, node) = sopde  # Opd entry for source port of pipe
   Ipd (PD_FD, i, node) = TTY       # fd, changed by 'setup_ports'

   return (OK)

   end



# make_oport --- make an entry in the output port descriptor table

   integer function make_oport (node, type, port, path, dport)
   integer node, type, port, dport
   pointer path

   include PORT_COMMON

   integer i

   i = Next_oport (node)
   if (i > MAXOPORTS) {
      call synerr ("too many output ports"p)
      return (ERR)
      }

   Next_oport (node) += 1
   Opd (PD_TYPE, i, node) = type    # TOWARD_SYM, APPEND_SYM or PIPE_SYM
   Opd (PD_PORT, i, node) = port    # 1:MAXOPORTS; 0 => defaulted
   Opd (PD_PATH, i, node) = path    # pointer to pathname
   Opd (PD_DPORT, i, node) = dport  # destination  port of pipe
   Opd (PD_FD, i, node) = TTY       # fd, changed by 'setup_ports'

   return (OK)

   end



# init_ports --- initialize port descriptor tables

   subroutine init_ports

   include PORT_COMMON

   integer i

   do i = 1, MAXNODES; {
      Next_iport (i) = 1
      Next_oport (i) = 1
      }

   return
   end



# clr_ports --- reinitialize port descriptor tables

   subroutine clr_ports

   include PORT_COMMON

   integer i, j

   do i = 1, MAXNODES; {
      for (j = 1; j < Next_iport (i); j += 1)
         if (Ipd (PD_TYPE, j, i) == FROM_SYM)
            call lsfree (Ipd (PD_PATH, j, i), ALL)
      Next_iport (i) = 1
      for (j = 1; j < Next_oport (i); j += 1)
         if (Opd (PD_TYPE, j, i) == TOWARD_SYM
               || Opd (PD_TYPE, j, i) == APPEND_SYM)
            call lsfree (Opd (PD_PATH, j, i), ALL)
      Next_oport (i) = 1
      }

   return
   end



# assign_ports --- make port number assignments to defaulted ports

   integer function assign_ports (status)
   integer status

   include PARSE_COMMON

   integer node
   integer assign_oports, assign_iports

   for (node = 1; node <= Curnode; node += 1)
      if (assign_oports (node) == ERR) {
         status = ERR
         return (status)
         }

   for (node = 1; node <= Curnode; node += 1)
      if (assign_iports (node) == ERR) {
         status = ERR
         return (status)
         }

   status = OK

   return (status)

   end



# assign_oports --- make output port number assignments

   integer function assign_oports (node)
   integer node

   include PORT_COMMON
   include PARSE_COMMON
   include CI_COMMON
   include EXEC_COMMON

   integer i, list (MAXOPORTS), port, dnode
   integer reserve_port, make_iport, select_port

   call make_portlist (list, MAXOPORTS)

   ### handle user-specified ports:
   for (i = 1; i < Next_oport (node); i += 1)
      if (Opd (PD_PORT, i, node) ~= 0)    # non-defaulted port no.
         if (reserve_port (Opd (PD_PORT, i, node), list, MAXOPORTS) == ERR)
            return (ERR)

   ### handle defaulted ports:
   for (i = 1; i < Next_oport (node); i += 1) {
      if (Opd (PD_PORT, i, node) == 0) {  # defaulted port
         port = select_port (list, MAXOPORTS)
         if (port == ERR)
            return (port)
         Opd (PD_PORT, i, node) = port
         }
      if (Opd (PD_TYPE, i, node) == PIPE_SYM) { # make ipd entry for dest
         if (Opd (PD_DNODE, i, node) > Curnode) {  # illegal node
            call semerr ("pipe destination not found"p)
            return (ERR)
            }
         dnode = Opd (PD_DNODE, i, node)
         if (make_iport (dnode, PIPE_SYM,
               Opd (PD_DPORT, i, node), node, i) == ERR)
            return (ERR)
         Connect (node, dnode) = 1  # enter in connectivity matrix
         }
      }

   return (OK)

   end



# assign_iports --- make input port number assignments

   integer function assign_iports (node)
   integer node

   include PORT_COMMON

   integer i, list (MAXIPORTS), port, snode, sopde
   integer reserve_port, select_port

   call make_portlist (list, MAXIPORTS)

   ### handle user-specified ports:
   for (i = 1; i < Next_iport (node); i += 1)
      if (Ipd (PD_PORT, i, node) ~= 0)    # non-defaulted port
         if (reserve_port (Ipd (PD_PORT, i, node), list, MAXIPORTS) == ERR)
            return (ERR)

   ### handle defaulted pipes from previous nodes:
   for (i = 1; i < Next_iport (node); i += 1)
      if (Ipd (PD_TYPE, i, node) == PIPE_SYM
            && Ipd (PD_PORT, i, node) == 0
            && Ipd (PD_SNODE, i, node) < node) {
         port = select_port (list, MAXIPORTS)
         if (port == ERR)
            return (ERR)
         Ipd (PD_PORT, i, node) = port
         snode = Ipd (PD_SNODE, i, node)
         sopde = Ipd (PD_SOPDE, i, node)
         Opd (PD_DPORT, sopde, snode) = port
         }

   ### handle remaining defaulted ports:
   for (i = 1; i < Next_iport (node); i += 1)
      if (Ipd (PD_PORT, i, node) == 0) {
         port = select_port (list, MAXIPORTS)
         if (port == ERR)
            return (port)
         Ipd (PD_PORT, i, node) = port
         if (Ipd (PD_TYPE, i, node) == PIPE_SYM) {
            snode = Ipd (PD_SNODE, i, node)
            sopde = Ipd (PD_SOPDE, i, node)
            Opd (PD_DPORT, sopde, snode) = port
            }
         }

   return (OK)

   end



# make_portlist --- make a list of all possible i/o ports for a node

   subroutine make_portlist (list, maxport)
   integer maxport, list (maxport)

   integer i

   do i = 1, maxport
      list (i) = i

   return
   end



# reserve_port --- reserve a particular port in a port list

   integer function reserve_port (portno, list, maxport)
   integer portno, maxport, list (maxport)

   if (portno > maxport) {
      call semerr ("illegal port number"p)
      reserve_port = ERR
      }

   elif (list (portno) == 0) {
      call semerr ("port referenced more than once"p)
      reserve_port = ERR
      }

   else {
      list (portno) = 0
      reserve_port = OK
      }

   return
   end



# select_port --- pick an i/o port to satisfy a default

   integer function select_port (list, maxport)
   integer maxport, list (maxport)

   integer i

   do i = 1, maxport
      if (list (i) ~= 0) {
         select_port = list (i)
         list (i) = 0
         return
         }

   call semerr ("too many ports referenced"p)

   return (ERR)

   end



# setup_ports --- prepare port tables for node execution

   integer function setup_ports (n)
   integer n

   include PORT_COMMON
   include CI_COMMON
   include SWT_COMMON

   integer i, fd, p, sn
   integer open, create, mktemp

   character pathname (MAXLINE)

   setup_ports = ERR
   do i = 1, MAX_STD_PORTS
      Std_port_tbl (i) = Default_port_table (i)

   for (i = 1; i < Next_iport (n); i += 1) {
      select (Ipd (PD_TYPE, i, n))
         when (CMDSRC_SYM)
            fd = Ci_fd (Ci_file)
         when (FROM_SYM) {
            call lsextr (Ipd (PD_PATH, i, n), pathname, MAXLINE)
            fd = open (pathname, READ)
            if (fd == ERR) {
               call putlin (pathname, TTY)
               call semerr (": can't open"p)
               return
               }
            }
         when (PIPE_SYM) {
            p = Ipd (PD_SOPDE, i, n)
            sn = Ipd (PD_SNODE, i, n)
            fd = Opd (PD_FD, p, sn)
            call rewind (fd)
            }
      Ipd (PD_FD, i, n) = fd
      p = 2 * Ipd (PD_PORT, i, n) - 1  # STDINx = 1, 3, 5, ...
      Std_port_tbl (p) = fd
      }

   for (i = 1; i < Next_oport (n); i += 1) {
      select (Opd (PD_TYPE, i, n))
         when (TOWARD_SYM) {
            call lsextr (Opd (PD_PATH, i, n), pathname, MAXLINE)
            fd = create (pathname, WRITE)
            if (fd == ERR) {
               call putlin (pathname, TTY)
               call semerr (": can't create"p)
               return
               }
            }
         when (APPEND_SYM) {
            call lsextr (Opd (PD_PATH, i, n), pathname, MAXLINE)
            fd = open (pathname, READWRITE)
            if (fd == ERR) {
               call putlin (pathname, TTY)
               call semerr (": can't open"p)
               return
               }
            call wind (fd)
            }
         when (PIPE_SYM) {
            fd = mktemp (READWRITE)
            if (fd == ERR) {
               call semerr ("can't open pipe temporary"p)
               return
               }
            }
      Opd (PD_FD, i, n) = fd
      p = 2 * Opd (PD_PORT, i, n)   # STDOUTx = 2, 4, 6, . . .
      Std_port_tbl (p) = fd
      }

   return (OK)

   end



# cleanup_ports --- close all ports associated with a node

   subroutine cleanup_ports (n)
   integer n

   include PORT_COMMON
   include SWT_COMMON

   integer i

   for (i = 1; i < Next_iport (n); i += 1)
      select (Ipd (PD_TYPE, i, n))
         when (FROM_SYM)
            call close (Ipd (PD_FD, i, n))
         when (PIPE_SYM)
            call rmtemp (Ipd (PD_FD, i, n))

   for (i = 1; i < Next_oport (n); i += 1)
      select (Opd (PD_TYPE, i, n))
         when (TOWARD_SYM, APPEND_SYM)
            call close (Opd (PD_FD, i, n))

   do i = 1, MAX_STD_PORTS
      Std_port_tbl (i) = Default_port_table (i)

   return
   end



# dump_ports --- dump port descriptor tables for debugging

   subroutine dump_ports (node)
   integer node

   include PORT_COMMON
   include SWT_COMMON

   integer i, j, p, sn

   do i = 1, MAX_IPORTS; {
      call print (TTY, "STDIN*i   "p, i)
      if (Std_port_tbl (2 * i - 1) == TTY)
         call print (TTY, "TTY  "p)
      else
         call print (TTY, "*3i  "p, Std_port_tbl (2 * i - 1))
      for (j = 1; j < Next_iport (node); j += 1)
         if (Ipd (PD_PORT, j, node) == i) {
            select (Ipd (PD_TYPE, j, node))
               when (CMDSRC_SYM)
                  call print (TTY, "command source*n"p)
               when (FROM_SYM) {
                  call print (TTY, "from "p)
                  call lsputf (Ipd (PD_PATH, j, node), TTY)
                  call putch (NEWLINE, TTY)
                  }
               when (PIPE_SYM) {
                  sn = Ipd (PD_SNODE, j, node)
                  p  = Ipd (PD_SOPDE, j, node)
                  call print (TTY, "pipe from node *i port *i*n"p,
                     sn, Opd (PD_PORT, p, sn))
                  }
            next 2
            }
      call print (TTY, "defaulted*n"p)
      }

   do i = 1, MAX_OPORTS; {
      call print (TTY, "STDOUT*i  "p, i)
      if (Std_port_tbl (2 * i) == TTY)
         call print (TTY, "TTY  "p)
      else
         call print (TTY, "*3i  "p, Std_port_tbl (2 * i))
      for (j = 1; j < Next_oport (node); j += 1)
         if (Opd (PD_PORT, j, node) == i) {
            select (Opd (PD_TYPE, j, node))
               when (TOWARD_SYM) {
                  call print (TTY, "toward "p)
                  call lsputf (Opd (PD_PATH, j, node), TTY)
                  call putch (NEWLINE, TTY)
                  }
               when (APPEND_SYM) {
                  call print (TTY, "append to "p)
                  call lsputf (Opd (PD_PATH, j, node), TTY)
                  call putch (NEWLINE, TTY)
                  }
               when (PIPE_SYM)
                  call print (TTY, "pipe to node *i port *i*n"p,
                     Opd (PD_DNODE, j, node), Opd (PD_DPORT, j, node))
            next 2
            }
      call print (TTY, "defaulted*n"p)
      }

   return
   end
