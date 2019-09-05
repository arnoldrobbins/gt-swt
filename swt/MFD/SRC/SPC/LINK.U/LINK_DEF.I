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

define(MEMSIZE,25000)         # dynamic storage space available
define(MAXCASEALTS,100)       # max. no. statements in a 'case'
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
define(MAXSTABLE,500)         # max. no. of elements in 'stringtable'
define(MAXINDENT,20)          # max. number of characters to indent
define(MAXPARAMS,32)          # max. number of actual parameters to define
define(SELRATIO,7)            # ratio of bad to good branches in 'select'

define(START_LAB,10000)       # starting Ratfor-generated label

define(DECL, 1)               # declaration output stream
define(DATA, 2)               # data output stream
define(CODE, 3)               # code output stream
define(MAXSTREAM, 3)          # number of output streams

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

define(ANDIFSYM,1000)
define(EQSYM,1001)
define(GESYM,1002)
define(GTSYM,1003)
define(LESYM,1004)
define(LTSYM,1005)
define(NESYM,1006)
define(NOTSYM,1007)
define(ORIFSYM,1008)
define(BLOCKDATASYM,1009)
define(BREAKSYM,1010)
define(CALLSYM,1011)
define(CASESYM,1012)
define(DATASYM,1013)
define(DEFINESYM,1014)
define(DOSYM,1015)
define(ELSESYM,1016)
define(ENDSYM,1017)
define(FORSYM,1018)
define(FORTSYM,1019)
define(FORWARDSYM,1020)
define(FUNCTIONSYM,1021)
define(GOTOSYM,1022)
define(IDSYM,1023)
define(IFANYSYM,1024)
define(IFSYM,1025)
define(INCLUDESYM,1026)
define(LINKAGESYM,1027)
define(LOCALSYM,1028)
define(MISCDECLSYM,1029)
define(NEXTSYM,1030)
define(NUMBERSYM,1031)
define(PROCIDSYM,1032)
define(PROCEDURESYM,1033)
define(RECURSIVESYM,1034)
define(REPEATSYM,1035)
define(RETURNSYM,1036)
define(SELECTSYM,1037)
define(STMTFUNCSYM,1038)
define(STOPSYM,1039)
define(STRCONSTANTSYM,1040)
define(STRINGSYM,1041)
define(STRINGTABLESYM,1042)
define(SUBROUTINESYM,1043)
define(TYPESYM,1044)
define(UNDEFINESYM,1045)
define(UNTILSYM,1046)
define(WHENSYM,1047)
define(WHILESYM,1048)
define(PLUSABSYM,1049)
define(MINUSABSYM,1050)
define(TIMESABSYM,1051)
define(DIVABSYM,1052)
define(MODABSYM,1053)
define(XORABSYM,1054)
define(ANDABSYM,1055)
define(ORABSYM,1056)


define(EXTERNALSYM,1057)
define(COMMONSYM,1058)
