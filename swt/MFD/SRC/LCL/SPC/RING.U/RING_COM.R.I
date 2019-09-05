   integer Ring_size                      # Maximum nodes in ring
   integer Active_ring                    # Current nodes in ring
   integer Home_index                     # Index of current node
   integer Index_ring(RINGSIZE)           # Indices to sorted nodes
   integer Ring_address(ADDRSIZE)         # Addresses of ring nodes
   integer Address_index(RINGSIZE)        # Indices of ring addresses
   integer Address_size(RINGSIZE)         # Character size of address
   integer Node_name(NAMESIZE, RINGSIZE)  # System names in packed format
   integer Name_size(RINGSIZE)            # Number of characters in names

   integer Home_pid                       # Process id of current node
   integer Sequence                       # Current job sequence number
   integer Time_info(INFOSIZE)            # Timdat information array

   logical Priviledged                    # TRUE if running at GaTech
   logical Initialized                    # Ring initialized flag
   logical Synchronize                    # Ring synchronize flag
   logical Terminated                     # Ring termination flag

   pointer Transmit                       # Start of transmission VC's
   pointer Receive                        # Start of reception VC's
   pointer Validate                       # Start of validation VC's
   pointer Response                       # Start of response VC's
   pointer Request                        # Start of user request VC's
   pointer Complete                       # Start of completed VC's

   common /ring/ Ring_size, Active_ring, Home_index, Index_ring,
      Ring_address, Address_index, Address_size, Node_name, Name_size,
      Home_pid, Sequence, Time_info, Priviledged, Initialized,
      Synchronize, Terminated, Transmit, Receive, Validate, Response,
      Request, Complete

   DS_DECL (heap, HEAPSIZE)
