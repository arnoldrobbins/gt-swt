define(DB,#)                        # Debug mode ("#" = off, "" = on)
define(RING_COMMON,"ring_com.r.i")  # Name of common block definitions


#  Miscellaneous definitions:

define(NULL,0)                # Null pointer value
define(ALL,-1)                # Ring address for all nodes
define(HOME,1)                # Index of home system name

define(USERNAME,5)            # Index of user name from gmetr$


#  Port definitions:

define(RING,97)               # Ring port number
define(CHCK,98)               # Validation port number
define(USER,99)               # User port number


#  Buffer sizes:

define(ADDRSIZE,128)          # Maximum space for ring addresses
#define(BUFFSIZE,274)          # Buffer size in bytes (2 * (128 + 9))
define(BUFFSIZE,272)          # Buffer size in bytes (2 * (128 + 8))
define(HEAPSIZE,10000)        # Maximum amount of dynamic space
define(INFOSIZE,15)           # Maximum TIMDAT request array size
define(MESGSIZE,128)          # Maximum number of words in message
define(NAMESIZE,3)            # Maximum ring/user name size in words
define(NODESIZE,21)           # Number of words in dynamic node
define(PCKTSIZE,9)            # Number of words in packet header
define(RINGSIZE,16)           # Maximum number of nodes in ring
define(TIMESIZE,12)           # Number of bytes in SETTIME request
define(USERSIZE,4)            # Number of bytes in user request


#  Timing definitions:

define(INTERVAL,15)           # X$WAIT delay interval in seconds
define(MODULUS,3600)          # SYNCHRONIZE time modulus in seconds
define(TOLERANCE,1)           # Allowable error in SYNCHRONIZE time


#  List node types:

define(CLEAR,0)               # VC hasn't been initialized
define(DUMMY,1)               # VC is a dummy header node
define(BOGUS,2)               # VC has not been validated
define(VALID,3)               # VC has passed validation


#  Fields of node record:

define(TYPE(i),heap(i))                   # VC node type
define(BACK(i),heap(i + 1))               # Last VC in list
define(NEXT(i),heap(i + 2))               # Next VC in list
define(TIME(i),heap(i + 3))               # Creation time in minutes
define(HOLD(i),heap(i + 4))               # YES if node is on hold
define(SENT(i),heap(i + 5))               # YES if node has been transmitted
define(EXEC(i),heap(i + 6))               # YES if node has been executed
define(TOLD(i),heap(i + 7))               # YES if node has been reported
define(DONE(i),heap(i + 8))               # YES if node has been completed
define(NODE(i),heap(i + 9))               # Index of VC system
define(NAME(j, i),heap(i + j + 9))        # User name of VC owner
define(PROC(i),heap(i + NAMESIZE + 10))   # Process id of VC owner
define(CODE(i),heap(i + NAMESIZE + 11))   # Unique identification
define(VCID(i),heap(i + NAMESIZE + 12))   # VC identification number
define(STAT(i),heap(i + NAMESIZE + 13))   # 2 word VC status array
define(CLRS(i),heap(i + NAMESIZE + 14))   # Status array clearing cause
define(XMTS(i),heap(i + NAMESIZE + 15))   # Transmit status
define(RCVS(i),heap(i + NAMESIZE + 16))   # Receive status        Word 1
define(RCVL(i),heap(i + NAMESIZE + 17))   # Receive level         Word 2
define(RCVN(i),heap(i + NAMESIZE + 18))   # Receive byte count    Word 3
define(ANSR(i),heap(i + NAMESIZE + 19))   # Number of responses expected
define(INDX(i),heap(i + NAMESIZE + 20))   # Current index in buffer
define(BUFF(i),heap(i + NAMESIZE + 21))   # Receive buffer start


#  Packet types:

define(REQUEST,0)             # Request packet
define(RESPONSE,1)            # Response packet


#  Ring requests:

define(VALIDATE,-1)           # Ring request to validate connections
define(INITIALIZE,-2)         # Ring request to signal restructuring
define(SYNCHRONIZE,-3)        # Ring request to reset Prime day/date
define(SHUTDOWN,-4)           # Ring request to shut down ring nodes

define(MINREQUEST,0)          # Lower bound on valid user requests

define(BROADCAST,1)           # User request to broadcast a message
define(EXECUTE,2)             # User request to execute a swt phantom
define(TERMINATE,3)           # User request to terminate ring nodes
define(SETTIME,4)             # User request to set the current time

define(MAXREQUEST,5)          # Upper bound on valid user requests


#  Ring responses:

define(INITIATED,1)           # Request has been received by ring
define(REJECTED,2)            # Requesting user is not validated
define(NOTFOUND,3)            # Destination system is not in ring
define(NOREQUEST,4)           # User request code was not known
define(WRONGSIZE,5)           # Request packet was the wrong size
define(COMPLETED,6)           # Operation has completed
define(SUCCEEDED,7)           # Request executed successfully
define(FAILED,8)              # Request could not be executed


#  Fields of ring request:

define(PACKET(i),BUFF(i))           # Message packet type
define(SOURCE(i),BUFF(i + 1))       # Message source node
define(ADDRESS(i),BUFF(i + 2))      # Message destination node
define(NUMBER(i),BUFF(i + 3))       # Message transmission count
define(PROCESS(i),BUFF(i + 4))      # Process making request
define(JOBNAME(i),BUFF(i + 5))      # Unique identifying code
define(COMMAND(i),BUFF(i + 6))      # Message command number
define(STATUS(i),BUFF(i + 7))       # Command result code
define(RESULT(i),BUFF(i + 8))       # Secondary result code

define(WORD(j, i),BUFF(i + j + 8))  # First word of message


#  Arguments to INITIALIZE request:

define(COUNT(i),WORD(1, i))         # Number of active systems
define(STATE(i),WORD(2, i))         # State of ring initialization


#  Arguments to SYNCHRONIZE request:

define(MONTH(i),WORD(1, i))   # Synchronization hour
define(DATE(i),WORD(2, i))    # Synchronization date
define(YEAR(i),WORD(3, i))    # Synchronization year
define(HOUR(i),WORD(4, i))    # Synchronization hour
define(MINUTE(i),WORD(5, i))  # Synchronization minute


#  Arguments to BROADCAST request:

define(TARGET(j, i),WORD(j, i))              # target user name
define(MESSAGE(j, i),WORD(j + NAMESIZE, i))  # text of message


#  Arguments to EXECUTE request:

define(USERID(j, i),WORD(j, i))              # phantom user name
define(CMDLINE(j, i),WORD(j + NAMESIZE, i))  # swt command line


#  Expression/statement macros:

define(ELAPSED,(Time_info(4) * 20 + Time_info(5) / 3))
define(SEARCH(l,k,t,p,d),{k(l)=t;p=l;repeat p=NEXT(p);until(k(p)==t);k(l)=d})


#  PMA random number generator.

linkage uniform   # UNIFO0 in fortran/pma
