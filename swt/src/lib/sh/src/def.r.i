# Definitions for Shell:

include LIBRARY_DEFS
include PRIMOS_KEYS
include ARGUMENT_DEFS

# Configurable default shell variable values:
define (DEFAULT_SEARCH_RULE,"^int,^var,&,=lbin=/&,=bin=/&"s)
define (DEFAULT_PROMPT,"] ")
define (INSTALLATION,"Georgia Institute of Technology")

# Configurable table size constants:
define (CIDEPTH,10)        # maximum recursion depth for shell
define (MAXARGS,64)        # maximum number of command line arguments
define (MAXCMD,255)        # maximum size of a Primos command line
define (MAXCNAME,20)       # maximum length of a compound node name
define (MAXIPORTS,3)       # maximum number of standard input ports
define (MAXITERATION,10)   # maximum number of iteration groups
define (MAXLABELS,20)      # maximum number of labels in a net
define (MAXNODES,10)       # maximum number of nodes in a net
define (MAXOPORTS,3)       # maximum number of standard output ports

define (MAXHIST,128)       # maximum backup of command history
define (HISTSIZE,4096)     # maximum number of characters of history

define (SV_MEMSIZE,4096)
define (SV_MEMEND,1)    # index of pointer to end of memory
define (SV_AVAIL,2)     # start of available space list
define (SV_CLOSE,8)     # threshhold for close-fitting blocks
define (SV_OHEAD,2)     # total words of overhead per block
define (SV_LINK,1)      # offset of link field of storage block
define (SV_SIZE,0)      # offset of size field of storage block
define (SV_HLINK,0)     # offset of hash link field of sv descriptor
define (SV_NAME,1)      # offset of name pointer field of sv descriptor
define (SV_VALUE,2)     # offset of value pointer field of sv descriptor
define (SV_MAXHASH,13)  # number of shell variable hash threads
define (SVDEPTH,32)     # maximum number of shell variable scope levels

# Additional constants derived from above values:
define (IPD_SIZE,150)         # MAXNODES * MAXIPORTS * 5
define (OPD_SIZE,150)         # MAXNODES * MAXOPORTS * 5
define (ARG_TABLE_SIZE,128)   # MAXARGS * 2

# Shell trace flag bit definitions:
define (CL_TRACE,:100000)  # trace command lines as read
define (CN_TRACE,:40000)   # trace compound node conversion
define (FN_TRACE,:20000)   # trace function results
define (IT_TRACE,:10000)   # trace iteration conversion
define (PD_TRACE,:4000)    # trace port assignments
define (SS_TRACE,:2000)    # single-step network execution
define (OU_TRACE,:1000)    # trace default onunit invocation
define (SY_TRACE,:100)     # trace lexical analysis
define (LO_TRACE,:40)      # trace location of command
define (LS_TRACE,:20)      # trace linked-string garbage collection
define (ND_TRACE,:10)      # trace node execution
define (SR_TRACE,:4)       # trace shell variable restores
define (SV_TRACE,:2)       # trace shell variable saves
define (EX_TRACE,:1)       # trace network execution

# File type definitions (used by 'call_program'):
define (UNKNOWN_FTYPE,1)   # file type can't be ascertained
define (TEXT_FTYPE,2)      # file contains text
define (BINARY_FTYPE,3)    # file contains binary data

# Miscellaneous special character definitions:
define (COMMENT_CHAR,'#'c) # command line comment delimiter
define (HISTCHAR,'!'c)     # history flag character
define (HISTLOOK,'?'c)     # history global search command
define (HISTARG,'`'c)      # history argument character
define (HISTSUB,'^'c)      # history substitution character
define (FUNNEL,'>'c)       # funnel character

# Symbol type definitions (see sh_parse.r):
define (NETTERM_SYM,1)
define (COMMA_SYM,2)
define (PIPE_SYM,3)
define (LABEL_SYM,4)
define (ARG_SYM,5)
define (CMDSRC_SYM,6)
define (FROM_SYM,7)
define (TOWARD_SYM,8)
define (APPEND_SYM,9)
define (FUNNEL_SYM,10)
define (DBLFUNNEL_SYM,11)
define (ERR_SYM,12)

# Label table field definitions (see sh_label.r):
define (LB_TEXTPTR,1)   # linked string pointer to text of label
define (LB_NODE,2)      # label value (node number)
define (LB_LINK,3)      # forward reference pointer
define (UNDEFINED,0)    # value of LB_NODE to indicate undefined label

# Port descriptor table field definitions (see sh_port.r):
define (PD_TYPE,1)      # type of redirection (FROM_SYM, PIPE_SYM, etc.)
define (PD_PORT,2)      # standard (input or output) port number
define (PD_DEST,3)      # pointer to pathname (or node number for pipes)
define (PD_DNODE,3)     # node number of pipe destination
define (PD_SNODE,3)     # node number of pipe source
define (PD_PATH,3)      # pointer to pathname for redirector
define (PD_PIPE,4)      # port number at other end of pipe
define (PD_DPORT,4)     # destination port number for pipe connection
define (PD_SOPDE,4)     # Opd entry number of source port of a pipe
define (PD_FD,5)        # file descriptor associated with this port

# Argument table field definitions (see sh_args.r):
define (ARG_TEXTPTR,1)  # linked string pointer to text of argument
define (ARG_NODE,2)     # node number to which argument belongs

# Names of 'include'd files:
define (ARGS_COMMON,"src/args_com.r.i")
define (CI_COMMON,"src/ci_com.r.i")
define (HIST_COMMON,"src/hist_com.r.i")
define (EXEC_COMMON,"src/exec_com.r.i")
define (LABEL_COMMON,"src/label_com.r.i")
define (PARSE_COMMON,"src/parse_com.r.i")
define (PORT_COMMON,"src/port_com.r.i")
define (SAVE_COMMON,"src/save_com.r.i")
define (SV_COMMON,"src/sv_com.r.i")
define (INTCMD_DEFINES,"src/intcmd_def.r.i")

# Miscellaneous linked string definitions:
define (ALL,10000)      # a very large string length (for deallocating)
define (LSNULL,-1)      # special value indicating unallocated space
define (LSVOID,-2)      # indicates unused elements of a string
define (OS,300)         # 'bias' distinguishing pointers from characters
