include "c1_def.stacc.i"
include ARGUMENT_DEFS

define(IDSIZE,3)              # Identifier and keyword node size
define(IDTYPE(i),i(1))        # Identifier type
   define(DEFIDTYPE,1)        # Define identifier
   define(KEYWDIDTYPE,2)      # Keyword
   define(USERIDTYPE,3)       # Data/structure identifier
define(IDPTR(i),i(2))         # Symtbl pointer/keyword value/define pointer
define(IDVAL(i),i(3))         # Define no. of parameters
   define(LINEIDVAL,-2)       # Special __LINE__ macro
   define(FILEIDVAL,-3)       # Special __FILE__ macro

define(CSSIZE,1)              # Control stack entry size
define(CSTYPE(i),Ctl_sk(i))   # Control stack entry type
   define(WHILECS,1)          # While loop
   define(FORCS,2)            # For loop
   define(DOCS,3)             # Do loop
   define(SWITCHCS,4)         # Switch statement

define(EXPSIZE,6)             # Expression node entry size
define(EXPTYPE(i),Mem(i))     # Expression node type (different from
   define(EXPSYMTYPE,8)       #     any SYMTYPE & in same position)
define(EXPMODE(i),Mem(i+1))   # Resulting mode
define(EXPOP(i),Mem(i+2))     # Operator code
   define(ADDAA_OP,1)
   define(ADD_OP,2)
   define(ANDAA_OP,3)
   define(AND_OP,4)
   define(ASSIGN_OP,5)        ########################################
   define(BREAK_OP,6)         ########################################
   define(CASE_OP,7)          ###            WARNING               ###
   define(COMPL_OP,8)         ###  There is a table in 'gen_oper'  ###
   define(CONST_OP,9)         ###    that depends on the values    ###
   define(CONVERT_OP,10)      ###      of these definitions.       ###
   define(DECLARE_STAT_OP,11) ########################################
   define(DEFAULT_OP,12)      ########################################
   define(DEFINE_DYNM_OP,13)
   define(DEFINE_STAT_OP,14)
   define(DEREF_OP,15)
   define(DIVAA_OP,16)
   define(DIV_OP,17)
   define(DO_OP,18)
   define(EQ_OP,19)
   define(FOR_OP,20)
   define(GE_OP,21)
   define(GOTO_OP,22)
   define(GT_OP,23)
   define(IF_OP,24)
   define(INDEX_OP,25)
   define(INIT_OP,26)
   define(LABEL_OP,27)
   define(LE_OP,28)
   define(LSHIFTAA_OP,29)
   define(LSHIFT_OP,30)
   define(LT_OP,31)
   define(MODULE_OP,32)
   define(MULAA_OP,33)
   define(MUL_OP,34)
   define(NEG_OP,35)
   define(NEXT_OP,36)
   define(NE_OP,37)
   define(NOT_OP,38)
   define(NULL_OP,39)
   define(OBJECT_OP,40)
   define(ORAA_OP,41)
   define(OR_OP,42)
   define(POSTDEC_OP,43)
   define(POSTINC_OP,44)
   define(PREDEC_OP,45)
   define(PREINC_OP,46)
   define(PROC_CALL_ARG_OP,47)
   define(PROC_CALL_OP,48)
   define(PROC_DEFN_ARG_OP,49)
   define(PROC_DEFN_OP,50)
   define(REFTO_OP,51)
   define(REMAA_OP,52)
   define(REM_OP,53)
   define(RETURN_OP,54)
   define(RSHIFTAA_OP,55)
   define(RSHIFT_OP,56)
   define(SAND_OP,57)
   define(SELECT_OP,58)
   define(SEQ_OP,59)
   define(SOR_OP,60)
   define(SUBAA_OP,61)
   define(SUB_OP,62)
   define(SWITCH_OP,63)
   define(UNDEFINE_OP,64)
   define(WHILE_OP,65)
   define(XORAA_OP,66)
   define(XOR_OP,67)
   define(ZERO_INIT_OP,68)
   define(FIELD_OP,69)
   define(COND1_OP,70)        # operators that 'vcg' doesn't know about
   define(COND2_OP,71)
define(EXPRIGHT(i),Mem(i+3))  # Right pointer
define(EXPLEFT(i),Mem(i+4))   # Left pointer
define(EXPLVALUE(i),Mem(i+5)) # Node is an lvalue

define(SYMSIZE,10)            # Symbol table node size
define(SYMTYPE(i),Mem(i))     # Symbol table node type
   define(IDSYMTYPE,1)        # Identifier
   define(SMSYMTYPE,2)        # Structure member
   define(LITSYMTYPE,3)       # Literal
   define(STSYMTYPE,4)        # Structure tag
   define(ENSYMTYPE,5)        # Enumeration tag
   define(COSYMTYPE,6)        # Enumeration constant
define(SYMMODE(i),Mem(i+1))   # Symbol mode pointer
define(SYMSC(i),Mem(i+2))     # Symbol table storage class
   define(DEFAULTSC,1)        # No storage class specified
   define(AUTOSC,2)           # Automatic storage class
   define(EXTERNSC,3)         # External storage class
   define(REGISTERSC,4)       # Register storage class
   define(STATICSC,5)         # Static storage class
   define(TYPEDEFSC,6)        # Typedef storage class
define(SYMLL(i),Mem(i+3))     # Symbol lexic level
define(SYMPARAM(i),Mem(i+4))  # Is symbol a parameter (YES/NO)
define(SYMOBJ(i),Mem(i+5))    # Object number for code generator
define(SYMTEXT(i),Mem(i+6))   # Pointer to stored symbol text
define(SYMISDEF(i),Mem(i+7))  # Is the object defined (YES/NO)
define(SYMPLIST(i),Mem(i+8))  # Parameter list of function (OVERLAP!)
define(SYMOFFS(i),Mem(i+8))   # Offset from beginning of struct
#                 Mem(i+9)    # Continuation

define(MODESIZE,8)            # Mode table node size
define(MODEPARENT(i),Mem(i))  # Pointer to parent mode
define(MODESIBLING(i),Mem(i+1))# Pointer to sibling mode entry
define(MODECHILD(i),Mem(i+2)) # Pointer to child mode
define(MODETYPE(i),Mem(i+3))  # Mode data structure type
   define(CHARMODE,1)         # Character
   define(CHARUNSMODE,2)      # Character unsigned
   define(INTMODE,3)          # Integer
   define(SHORTMODE,4)        # Short integer   #########################
   define(LONGMODE,5)         # Long integer    #       WARNING         #
   define(UNSIGNEDMODE,6)     # Unsigned integer#  There is a table in  #
   define(SHORTUNSMODE,7)     # Short unsigned  #    'conv_type' that   #
   define(LONGUNSMODE,8)      # Long unsigned   # depends on the values #
   define(FLOATMODE,9)        # Short floating  # of these definitions  #
   define(DOUBLEMODE,10)      # Long floating   #########################
   define(FIELDMODE,11)       # Field
   define(POINTERMODE,12)     # Pointer
   define(ARRAYMODE,13)       # Array
   define(ENUMMODE,14)        # Enumeration
   define(FUNCTIONMODE,15)    # Function
   define(STRUCTMODE,16)      # Structure
   define(UNIONMODE,17)       # Union
   define(LABELMODE,18)       # Label
   define(TYPEDEFMODE,19)     # Typedef
   define(DEFAULTMODE,20)     # No mode specified
define(MODENEXT(i),Mem(i+4))  # Pointer to next entry in mode table
define(MODESMLIST(i),Mem(i+5))# Pointer to list of structure members
define(MODELEN(i),Mem(i+6))   # Length of mode entry in bits
#                 Mem(i+7)    # Continuation

define(SMSIZE,2)              # Structure member list node size
define(SMSIBLING(i),Mem(i))   # Pointer to sibling structure member
define(SMSYM(i),Mem(i+1))     # Pointer to symbol table entry of member

define(PARAMSIZE,3)           # Parameter table node size
define(PARAMNEXT(i),Mem(i))   # Pointer to next entry in parameter list
define(PARAMTEXT(i),Mem(i+1)) # Pointer to text of parameter
define(PARAMMODE(i),Mem(i+2)) # Pointer to mode of parameter

define(REF_DISP,1)            # Parameter is passed by address
define(VALUE_DISP,0)          # Parameter is passed by value

define(SMCLASS,2)             # Symbol goes in struct tag/member table
define(IDCLASS,1)             # Symbol goes in identifier table

define(SS(n),Sem_sk(Sem_sp-n))# Semantic stack entry

define(CALL1(a1),call ss_alloc(1);SS(1)=a1)
define(RETURN1(a),a=SS(1);call ss_dealloc(1))
define(ENTER1(a),a=SS(1))
define(EXIT1(a),SS(1)=a)
define(CALL2(a,b),call ss_alloc(2);SS(1)=a;SS(2)=b)
define(RETURN2(a,b),a=SS(1);b=SS(2);call ss_dealloc(2))
define(ENTER2(a,b),a=SS(1);b=SS(2))
define(EXIT2(a,b),SS(1)=a;SS(2)=b)
define(CALL3(a,b,c),call ss_alloc(3);SS(1)=a;SS(2)=b;SS(3)=c)
define(RETURN3(a,b,c),a=SS(1);b=SS(2);c=SS(3);call ss_dealloc(3))
define(ENTER3(a,b,c),a=SS(1);b=SS(2);c=SS(3))
define(EXIT3(a,b,c),SS(1)=a;SS(2)=b;SS(3)=c)

define(MAXSHORT,32767)        # Largest short integer
define(MAXUNSIGNED,65535)     # Largest unsigned integer

define(DEFINEFILE,"=cdefs="s)

define(MEMSIZE,30000)         # dynamic storage space available
define(MAXERRS,50)            # number of fatal errors allowed
define(MAXDFO,300)            # aggregate size of -D definitions
define(MAXDIR,300)            # aggregate size of -I search rule
define(MAXSCOPE,50)           # maximum scope depth
define(MAXSEMSTACK,300)       # maximum depth of semantic stack
define(MAXCTLSTACK,50)        # maximum depth of control stack
define(MAXEXPRSTACK,100)      # maximum depth of expression stack
define(MAXMODESAVE,20)        # maximum depth of nested modes
define(MAXTOK,200)            # maximum size of a token
define(MAXDEF,1000)           # maximum size of define text
define(INBUFSIZE,1105)        # must be > MAXLINE
define(PBLIMIT,1000)          # max no. chars pushed back before full line
define(MAXLEVEL,5)            # max. no. include files
define(MAXPARAMS,32)          # max. number of actual parameters to define
define(MAXLL,52)              # max. number of nested scopes
define(MAXDBFLAG,99)          # max. number of debugging flags
define(MAXEXTNAME,9)          # max. characters in an external name (+1)
define(MAXSTREAMS,3)          # max. number of output streams

define(ENTSTREAM,1)           # output stream for entry points
define(EXTDEFSTREAM,2)        # output stream for external definitions
define(INTDEFSTREAM,3)        # output stream for everything else

define(SETSTREAM(i),Outfp=i)
define(OUTFILE,Outfile(Outfp))
define(SYNERR(m),call synerr(m,NO))
define(WARNING(m),call synerr(m,YES))
define(FATAL,call fatalerr)
define(ERROR_SYMBOL (s), call ctoc (s, Error_sym, MAXTOK))
define(pointer,integer)
define(file_des,integer)
define(parse_state,integer)
define(untyped,integer)
define(packed_char,integer)

define(DB,#)
define(DBG(n,x),DB if (Dbg_flag(n) == YES){x})

define(ngetch(c),{
if (Inbuf (Ibp) ~= EOS) {
   c = Inbuf (Ibp)
   Ibp += 1
   }
else
   call refill_buffer (c)})


