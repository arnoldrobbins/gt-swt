# port description common areas for shell

   integer   Next_iport (MAXNODES),    # next slot in Ipd (per node)
             Next_oport (MAXNODES),    # next slot in Opd (per node)
             Ipd (5, MAXIPORTS, MAXNODES),   # input port descriptions
             Opd (5, MAXOPORTS, MAXNODES),   # output port descriptions
             Default_port_table (MAX_STD_PORTS) # default ports

   common /portcm/ Next_iport, Next_oport, Ipd, Opd,
      Default_port_table

# end port description common areas for shell
