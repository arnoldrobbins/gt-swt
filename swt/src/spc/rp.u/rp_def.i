include "rp_def.stacc.i"
include ARGUMENT_DEFS

define(SYMINFOSIZE,3)         # size of symbol table node
define(SYMBOLTYPE,1)          # type field of symbol table node
define(SYMBOLVAL,2)           # value field of symbol table node
define(SYMBOLDATA,3)          # data field of symbol table node
define(KEYWD_SYMBOLTYPE,1)    # symbol table type of Ratfor/Fortran keywords
define(LNAME_SYMBOLTYPE,2)    # symbol table type of long name
define(DEFID_SYMBOLTYPE,3)    # symbol table type of defined identifier

define(TREETYPE, 0)           # expression tree node type
define(TREELEFT, 1)           # expression tree left child pointer
define(TREERIGHT, 2)          # expression tree right child pointer
define(TREEVALUE, 3)          # expression tree node value
define(TREESIZE, 4)           # size of tree node

define(SAVELINK, 0)           # symbol save link
define(SAVETYPE, 1)           # symbol save type
define(SAVETEXT, 2)           # symbol save text
define(SAVESIZE, 3)           # size increment for save node

define(PROCINFOSIZE,9)        # size of procedure head
define(PROCRETURN,0)          # label for return 'goto' statement
define(PROCSTART,1)           # label for procedure start
define(PROCLABELS,2)          # list of labels for return 'goto'
define(PROCPARAMS,3)          # list of parameters
define(PROCFWD,4)             # YES == forward declaration seen
define(PROCSTACKP,5)          # stack pointer variable
define(PROCSTACKV,6)          # stack array variable
define(PROCRECURSION,7)       # max. recursion depth
define(PROCNAME,8)            # pointer to procedure name

define(LABELINFOSIZE,2)       # size of label list node
define(LABELNEXT,0)           # link to next label
define(LABELVAL,1)            # label value

define(PARAMINFOSIZE,3)       # size of parameter node
define(PARAMNEXT,0)           # link to next parameter
define(PARAMTEXT1,1)          # pointer to long parameter text
define(PARAMTEXT2,2)          # pointer to short parameter text

define(MAXIDLENGTH,6)         # max. length of a Fortran identifier
define(UFCHAR,'0'c)           # unique fill character
define(DEFINEFILE,"=incl=/swt_def.r.i"s)

define(MEMSIZE,32767)         # dynamic storage space available
define(MAXCASEALTS,100)       # max. no. statements in a 'case'
define(MAXCGOTO,500)          # max. no. of computed goto labels
define(MAXLOOPS,10)           # maximum no. of nested loops
define(MAXSCOPE,100)          # maximum scope depth
define(MAXTOK,200)            # maximum size of a token
define(MAXDEF,400)            # maximum size of define text
define(INBUFSIZE,505)         # must be > MAXLINE
define(PBLIMIT,400)           # max no. chars pushed back before full line
define(MAXLHS,100)            # max size of left side of assignment operator
define(MAXLEVEL,5)            # max. no. include files
define(MAXEXPR,20)            # max. expression nesting depth
define(MAXSEL,256)            # max. number of alternatives in 'select'
define(MAXSTABLE,600)         # max. no. of elements in 'stringtable'
define(MAXINDENT,20)          # max. number of characters to indent
define(MAXPARAMS,32)          # max. number of actual parameters to define
define(MAXLINE,128)           # max. line size
define(SELRATIO,7)            # ratio of bad to good branches in 'select'
define(MAXGOHASH,407)         # goto hash table size
define(MAXGOLIST,1000)        # max. number of goto labels
define(MAXCHARVAL,256)        # 1 + largest character value

define(START_LAB,10000)       # starting Ratfor-generated label
                              #     (must be >= 10000)
define(DECL, 1)               # declaration output stream
define(DATA, 2)               # data output stream
define(CODE, 3)               # code output stream
define(EQUIV, 4)              # equivalence output stream
define(MAXSTREAM, 4)          # number of output streams

define(SYNERR,call synerr)    # shorthands
define(FATAL,call fatalerr)
define(ERROR_SYMBOL (s), call ctoc (s, Error_sym, MAXTOK))
define(pointer,integer)
define(file_des,integer)
define(parse_state,integer)
define(untyped,integer)
define(packed_char,integer)

define(DEBUG,#)

define(ngetch(c),{
if (Inbuf (Ibp) ~= EOS) {
   c = Inbuf (Ibp)
   Ibp += 1
   }
else
   call refill_buffer (c)})
