# parser common areas for shell

   integer   Curnode,            # current node number
             Cmd_cursor,         # current position in command line
             Sym_type,           # type of last-scanned symbol
             Sym_iport,          # input port for pipes and redirectors
             Sym_oport,          # output port for pipes and redirectors
             Sym_node,           # destination node number for pipes
             Sym_len             # length of last-scanned symbol text

   character Sym_text (MAXLINE), # text of last-scanned symbol
             Sym_str (MAXLINE)   # text of pathname or label

   pointer   Cmd,                # pointer to beginning of command line
             Cmd_ptr             # pointer to next command line character

   common /parcom/ Curnode, Cmd, Cmd_ptr, Cmd_cursor, Sym_type,
      Sym_iport, Sym_oport, Sym_node, Sym_len, Sym_text, Sym_str

# end parser common areas for shell
