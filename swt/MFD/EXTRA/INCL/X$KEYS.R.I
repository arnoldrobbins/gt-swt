# x$keys.r.i --- codes and parameters for using Primenet primitives

# Connect keys:

   define (XK$ANY,:77600)     # ANY PATH IS OK
   define (XK$HDX,:40000)     # HALF DUPLEX PATH OK
   define (XK$SYN,:20000)     # SYNCH PATH OK
   define (XK$RNG,:10000)     # RING  PATH OK
   define (XK$PDN,:04000)     # PDN   PATH OK
   define (XK$RTE,:02000)     # ROUTE THRU OK
   define (XK$FCT,:00100)     # LET OS SUPPLY FCTY
   define (XK$MDB,:00040)     # LET USER SEE MORE DATA BIT
   define (XK$SVC,:00020)     # MAKE VC A SYSTEM VC
   define (XK$UVC,:00010)     # XLCLRA ONLY - CLEAR USER VC'S
   define (XK$ADR,:00001)     # CONNECT BY ADDRESS
   define (XK$NAM,:00000)     # CONNECT BY NAME


#  Keys for 'xlgvvc' - which input field is to be used for passing of
#                    the circuit

   define (XK$USR,:00000)     # Pass call to specified user
#  define (XK$ADR,:00001)     # Pass call to owner of spec'd adr (unused)
   define (XK$PRT,:00002)     # Pass call to owner of specified port


# Message types for 'x$tran' and 'x$rcv':

   define (XT$LV0,:00000)     # Level 0 data packets
   define (XT$LV1,:00001)     # Level 1 data packets
   define (XT$INT,:00002)     # Interrupt
                              # ** OPTIONS **
   define (XT$MDB,:00400)     # More Data Bit set flag


# Clearing causes:

   define (CC$CLR,0)          # DTE CLEARING
   define (CC$BSY,:00400)     # DTE BUSY
   define (CC$DWN,:04400)     # DTE OUT OF ORDER
   define (CC$RPE,:10400)     # REMOTE PROCEDURE ERROR
   define (CC$RRC,:14400)     # CALLEE REFUSES COLLECT CALL
   define (CC$BAD,:01400)     # INVALID CALL
   define (CC$BAR,:05400)     # ACCESS BARRED
   define (CC$LPE,:11400)     # LOCAL PROCEDURE ERROR
   define (CC$NET,:02400)     # NETWORK CONGESTION
   define (CC$NOB,:06400)     # NOT OBTAINABLE
   define (CC$IAD,CC$BAD)     # ILLEGAL OR UNKNOWN ADDRESS


# Diagnostic byte definitions:

   define (CD$PNA,:377)       # PORT NOT ASSIGNED
   define (CD$SNU,:376)       # SYSTEM NOT UP YET (NO SET TIME)
   define (CD$BSY,:375)       # NO VC'S LEFT TO ACCEPT CALL WITH
   define (CD$NRU,:374)       # NO REMOTE USERS
   define (CD$IAD,:373)       # ILLEGAL ADDRESS
   define (CD$DWN,:372)       # HOST IS DOWN
   define (CD$LPE,:371)       # LOCAL PROCEDURE ERROR


# Call completion codes:

   define (XS$NET,-1)         # NETWORKS NOT CONFIGURED
   define (XS$IP,1)           # OP IN PROGRESS
   define (XS$CMP,0)          # OP COMPLETE
   define (XS$BVC,2)          # USER DOES NOT OWN VC
   define (XS$BPM,3)          # BAD PARAMETERS
   define (XS$CLR,4)          # CIRCUIT IS CLEARED
   define (XS$RST,5)          # CIRCUIT IS RESET
   define (XS$IDL,6)          # CIRCUIT IS IDLE
   define (XS$UNK,7)          # ADDRESS IS UNKNOWN
   define (XS$MEM,8)          # SYSTEM DOESN'T HAVE MEMORY FOR THAT
   define (XS$NOP,9)          # NO CALL REQUESTS PENDING
   define (XS$ILL,10)         # OP ILLEGAL NOW
   define (XS$DWN,11)         # NOT OPERATING
   define (XS$MAX,12)         # MAX NUMBER OF PENDING OPERATIONS EXCEEDED
   define (XS$QUE,13)         # BEHIND ANOTHER USER IN THE SUBPRC ASSIGN LIST


# Status information keys for calls to 'x$stat':

   define (XI$ADR,1)          # NUMBER OF AVAILABLE NETWORK ADDRESSES
   define (XI$AVC,2)          # VCID'S TO AN ADDRESS
   define (XI$VCN,2)          # NUMBER OF VCID'S OPEN TO A GIVEN ADDRESS
   define (XI$VCD,3)          # DETAILED INFORMATION ABOUT A SPECIFIC VC
   define (XI$XTP,4)          # PRIMNET NAME FOR X25 ADDRESS
   define (XI$PTX,5)          # X25 ADDRESS FOR A PRIMNET NAME
   define (XI$MYN,6)          # PRIMNET NAME AND X25 ADDRESS FOR 'ME'
   define (XI$PDN,7)          # RETURN PDN NAMES
   define (XI$PVC,8)          # RETURN ALL VCID'S TO SPECIFIED PDN
   define (XI$PVD,3)          # RETURN INFO ABOUT VC TO PDN
   define (XI$LNK,9)          # DIALUP LINKS
   define (XI$RLG,:40000)     # GET REMOTE LOGIN CIRCUIT
