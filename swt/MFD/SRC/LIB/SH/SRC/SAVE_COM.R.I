# common area for save_state

   # portcm:
   integer Save_next_iport (MAXNODES, CIDEPTH),
           Save_next_oport (MAXNODES, CIDEPTH),
           Save_ipd (IPD_SIZE, CIDEPTH),
           Save_opd (OPD_SIZE, CIDEPTH)

   integer Save_port_table (MAX_STD_PORTS, CIDEPTH)

   # argcom:
   pointer Save_arg_table (ARG_TABLE_SIZE, CIDEPTH)
   integer Save_next_arg (CIDEPTH)

   # parcom
   integer Save_curnode (CIDEPTH)

   common /savcom/ Save_next_iport, Save_next_oport, Save_ipd,
      Save_opd, Save_port_table, Save_arg_table, Save_next_arg,
      Save_curnode

# end common area for save_state
