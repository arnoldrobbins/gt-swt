# drift --- sample compiler for VCG demonstration

define (GLOBAL_VARIABLES,"drift_com.r.i")

define (MAX_SYM_LEN, MAXLINE)
define (MEMSIZE, 4096)
define (SEMANTIC_STACK_SIZE, 100)
define (INTERNAL_FORM_MEMSIZE, 20000)
define (INBUFSIZE, 300)
define (PBLIMIT, 150)

define (UNDEFINED, 0)
define (DEFINED, 1)

define (ifpointer, integer)
define (unknown, integer)

# Types of internal form nodes:
define (ADD_NODE,1)
define (ARG_NODE,2)
define (ASSIGN_NODE,3)
define (CALL_NODE,4)
define (COND_NODE,5)
define (CONSTANT_NODE,6)
define (DECLARE_VAR_NODE,7)
define (DIVIDE_NODE,8)
define (FUNCTION_NODE,9)
define (IO_NODE,10)
define (LOOP_NODE,11)
define (MULTIPLY_NODE,12)
define (NULL_NODE,13)
define (PARAM_NODE,14)
define (SEQ_NODE,15)
define (SUBTRACT_NODE,16)
define (VAR_NODE,17)
define (LAST_NODE_TYPE,VAR_NODE)

# Elements of internal form records:
define (ARG_EXPR (n), Ifmem (n + 2))
define (ARG_LIST (n), Ifmem (n + 3))
define (COND (n), Ifmem (n + 2))
define (ELSE_PART (n), Ifmem (n + 4))
define (FUNC_BODY (n), Ifmem (n + 5))
define (LEFT (n), Ifmem (n + 2))
define (LINE_NUM (n), Ifmem (n + 1))
define (LOOP_BODY (n), Ifmem (n + 3))
define (NODE_TYPE (n), Ifmem (n))
define (NPARAMS (n), Ifmem (n + 4))
define (OBJ_ID (n), Ifmem (n + 2))
define (PARAM_LIST (n), Ifmem (n + 3))
define (RIGHT (n), Ifmem (n + 3))
define (THEN_PART (n), Ifmem (n + 3))
define (WORD1 (n), Ifmem (n + 2))
define (WORD2 (n), Ifmem (n + 3))

include "drift.stacc.defs"             # macro defns. produced by 'stacc'
include "/uc/allen/vcg/vcg_defs.r.i"   # macro defns. for IMF operators



   integer state

   call program (state)
   if (state ~= ACCEPT)
      call error ("syntactically incorrect program"p)
   stop
   end



include "drift.stacc.r"    # Ratfor source code produced by 'stacc'



# begin_function --- set up environment for compiling a function

   subroutine begin_function (name)
   character name (ARB)

   include GLOBAL_VARIABLES

   pointer mktabl

   integer info2 (2)
   integer lookup, gen_id

   ifpointer func_node
   ifpointer ialloc

   Next_ifmem = 1          # initialize internal form memory
   Locals = mktabl (1)     # initialize local variable symbol table
   Sp = 0                  # initialize semantic stack pointer

  # Place function name in 'Functions' table, if it's not already there
   if (lookup (name, info2, Functions) == YES)
      if (info2 (2) == DEFINED)
         call warning ("function *s multiply defined*n"p, name)
      else {
         info2 (2) = DEFINED
         call enter (name, info2, Functions)
         }
   else {
      info2 (1) = gen_id (1)
      info2 (2) = DEFINED
      call enter (name, info2, Functions)
      }

  # Output an entry point definition for the procedure:
   call emit (SEQ_OP, Ent_stream)
   call emit (info2 (1), Ent_stream)      # object id of function
   call emit_string (name, Ent_stream)    # function name

  # Put function node on semantic stack:
   func_node = ifalloc (FUNCTION_NODE)
   NPARAMS (func_node) = 0
   OBJ_ID (func_node) = info2 (1)
   call push (func_node)

   return
   end



# begin_program --- do pre-program initialization

   subroutine begin_program

   include GLOBAL_VARIABLES

   pointer mktabl

   filedes create, open

   character infile (MAXARG)

   integer getarg, gen_id

   call dsinit (MEMSIZE)      # init. dynamic storage
   Functions = mktabl (2)     # symbol table for function names
   Globals = mktabl (1)       # symbol table for global variables
   Reserved_words = mktabl (1)   # symbol table for reserved words
   Next_obj_id = 1            # for object id generator
   Error_count = 0
   Ibp = 1                    # buffer pointer...
   Inbuf (Ibp) = EOS          # ...and input buffer used by lexer
   Current_line = 0

  # open input file specified on command line:
   if (getarg (1, infile, MAXARG) == EOF)
      In_stream = STDIN
   else {
      In_stream = open (infile, READ)
      if (In_stream == ERR)
         call cant (infile)
      }

  # create temporary files for passing the IMF to the code generator:
   Ent_stream = create ("_drift_.ct1"s, READWRITE)
   Data_stream = create ("_drift_.ct2"s, READWRITE)
   Code_stream = create ("_drift_.ct3"s, READWRITE)
   if (Ent_stream == ERR || Data_stream == ERR || Code_stream == ERR)
      call error ("can't open temporary files _drift_.ct[1-3]"p)

   call emit (MODULE_OP, Ent_stream)
   call emit (MODULE_OP, Data_stream)
   call emit (MODULE_OP, Code_stream)

  # define object id's for the two run-time routines we'll need:
   Ex$in_id = gen_id (1)            # run-time routine for input
   call emit (SEQ_OP, Data_stream)
   call emit (DECLARE_STAT_OP, Data_stream)
   call emit (Ex$in_id, Data_stream)
   call emit_string ("EX$IN"s, Data_stream)

   Ex$out_id = gen_id (1)           # run-time routine for output
   call emit (SEQ_OP, Data_stream)
   call emit (DECLARE_STAT_OP, Data_stream)
   call emit (Ex$out_id, Data_stream)
   call emit_string ("EX$OUT"s, Data_stream)

  # build the reserved-word table used by the lexical analyzer:
   call enter ("do"s, DO_SYM, Reserved_words)
   call enter ("else"s, ELSE_SYM, Reserved_words)
   call enter ("end_function"s, END_FUNCTION_SYM, Reserved_words)
   call enter ("fi"s, FI_SYM, Reserved_words)
   call enter ("float"s, FLOAT_SYM, Reserved_words)
   call enter ("function"s, FUNCTION_SYM, Reserved_words)
   call enter ("if"s, IF_SYM, Reserved_words)
   call enter ("null"s, NULL_SYM, Reserved_words)
   call enter ("od"s, OD_SYM, Reserved_words)
   call enter ("then"s, THEN_SYM, Reserved_words)
   call enter ("while"s, WHILE_SYM, Reserved_words)

  # fire up lexical analysis:
   call getsym

   return
   end



# declare_formal_parameter --- put formal param name in table, assign obj id

   subroutine declare_formal_parameter (name)
   character name (ARB)

   include GLOBAL_VARIABLES

   integer obj_id
   integer lookup, gen_id

   ifpointer param_node
   ifpointer ifalloc

   if (lookup (name, obj_id, Locals) == YES) {
      call warning ("*s:  multiply declared*n"p, name)
      return
      }

   obj_id = gen_id (1)
   call enter (name, obj_id, Locals)

  # create new parameter node and combine it with previous sequence
  #   on the semantic stack:
   param_node = ifalloc (PARAM_NODE)
   OBJ_ID (param_node) = obj_id
   call push (param_node)
   call sequentialize
   NPARAMS (Stack (Sp - 1)) += 1

   return
   end



# declare_global_variable --- put name in global table, assign object id

   subroutine declare_global_variable (name)
   character name (ARB)

   include GLOBAL_VARIABLES

   integer obj_id
   integer lookup, gen_id

   if (lookup (name, obj_id, Globals) == YES) {
      call warning ("*s:  multiply declared*n"p, name)
      return
      }

   obj_id = gen_id (1)
   call enter (name, obj_id, Globals)

  # go ahead and reserve space in the static data storage area for
  #   the variable we just declared:
   call emit (SEQ_OP, Data_stream)
   call emit (DEFINE_STAT_OP, Data_stream)
   call emit (obj_id, Data_stream)
   call emit (NULL_OP, Data_stream)    # no initializers
   call emit (2, Data_stream)          # 2 words for a floating object

   return
   end



# declare_local_variable --- enter name in local table, assign object id

   subroutine declare_local_variable (name)
   character name (ARB)

   include GLOBAL_VARIABLES

   integer obj_id
   integer lookup, gen_id

   ifpointer decl_var_node
   ifpointer ifalloc

   if (lookup (name, obj_id, Locals) == YES) {
      call warning ("*s:  multiply declared*n"p, name)
      return
      }

   obj_id = gen_id (1)
   call enter (name, obj_id, Locals)

  # make new variable declaration node and put it into a sequence
  #   following all previously declared variables:
   decl_var_node = ifalloc (DECLARE_VAR_NODE)
   OBJ_ID (decl_var_node) = obj_id
   call push (decl_var_node)
   call sequentialize

   return
   end



# emit --- place value on an output stream

   subroutine emit (val, stream)
   integer val
   filedes stream

   call print (stream, "*i*n"s, val)

   return
   end



# emit_string --- place length of string and string on an output stream

   subroutine emit_string (str, stream)
   character str (ARB)
   filedes stream

   integer i
   integer length

   call emit (length (str), stream)
   for (i = 1; str (i) ~= EOS; i += 1)
      call emit (str (i), stream)

   return
   end



# end_function --- clean up after parse of a function is completed

   subroutine end_function

   include GLOBAL_VARIABLES

   call semantic_analysis (Stack (Sp))
   call rmtabl (Locals)    # get rid of all local variable information

   return
   end



# end_program --- clean up after the entire program is parsed

   subroutine end_program

   include GLOBAL_VARIABLES

   pointer position

   integer info2 (2)
   integer sctabl

   character sym (MAX_SYM_LEN)

   logical first

   call close (In_stream)

  # terminate IMF streams by ending sequence of definitions, then
  #   ending sequence of modules:
   call emit (NULL_OP, Ent_stream);  call emit (NULL_OP, Ent_stream)
   call emit (NULL_OP, Data_stream); call emit (NULL_OP, Data_stream)
   call emit (NULL_OP, Code_stream); call emit (NULL_OP, Code_stream)

   call close (Ent_stream)
   call close (Data_stream)
   call close (Code_stream)

  # check function table for names that were referenced but not
  #   declared; presumably these are externally compiled
   first = TRUE
   position = 0
   while (sctabl (Functions, sym, info2, position) ~= EOF)
      if (info2 (2) == UNDEFINED) {
         if (first) {
            call print (STDOUT, "External symbols:*n"p)
            first = FALSE
            }
         call print (STDOUT, "*s*n"p, sym)
         }

   return
   end



# gen_id --- generate new object identifiers

   integer function gen_id (num_ids)
   integer num_ids

   include GLOBAL_VARIABLES

   gen_id = Next_obj_id
   Next_obj_id += num_ids

   return
   end



# getsym --- get next symbol from input stream

   subroutine getsym

   include GLOBAL_VARIABLES

   procedure getchar forward
   procedure putback (c) forward
   procedure empty_buffer forward

   character c

   integer i
   integer getlin, lookup

   real ctor

   logical too_long, continuation

   continuation = FALSE    # true if we want to ignore a line boundary
   repeat { # until we find a legal symbol

      repeat
         getchar
         until (c ~= ' 'c)

      select (c)

         when (NEWLINE) {
            Current_line += 1
            Symbol = NEWLINE
            if (~continuation)
               break
            }

         when (';'c) {
            Symbol = NEWLINE     # but no line number advance
            if (~continuation)
               break
            }

         when ('-'c) {
            getchar
            if (c == '-'c) {     # -- begins comments
               empty_buffer
               Current_line += 1
               Symbol = NEWLINE
               if (~continuation)
                  break
               }
            else {
               putback (c)
               Symbol = '-'c
               break
               }
            }

         when ('&'c)
            continuation = TRUE

         when ('+'c, '*'c, '/'c, '#'c, '('c, ')'c, ','c, '='c, EOF) {
            Symbol = c
            break
            }

         when (SET_OF_LETTERS) {    # a-z or A-Z; starting an identifier
            too_long = FALSE
            i = 1
            while (IS_LETTER (c) || IS_DIGIT (c) || c == '_'c) {
               Symtext (i) = c
               i += 1
               if (i > MAX_SYM_LEN) {
                  i -= 1
                  too_long = TRUE
                  }
               getchar
               }
            putback (c)
            Symtext (i) = EOS
            if (too_long)
               call warning ("symbol beginning *s is too long*n"p, Symtext)
            if (lookup (Symtext, Symbol, Reserved_words) == NO)
               Symbol = ID_SYM
            break
            }

         when ('.'c, SET_OF_DIGITS) {
            putback (c)
            Symval = ctor (Inbuf, Ibp)    # advances Ibp
            Symbol = NUMBER_SYM
            break
            }

      else
         call warning ("'*c':  unrecognized character*n"p, c)

      }  # repeat until a valid symbol is found

   return


   # getchar --- get the next character from the input stream

      procedure getchar {

         if (Inbuf (Ibp) == EOS)       # time to read a new buffer?
            if (getlin (Inbuf (PBLIMIT), In_stream) == EOF)
               c = EOF
            else {
               c = Inbuf (PBLIMIT)     # pick up the first char read
               Ibp = PBLIMIT + 1
               }
         else {                        # text was already available
            c = Inbuf (Ibp)
            Ibp += 1
            }

         }


   # putback --- push a character back onto the input stream

      procedure putback (c) {
         character c

         if (Ibp <= 1)
            call error ("too many characters pushed back"p)
         else {
            Ibp -= 1
            Inbuf (Ibp) = c
            }

         }


   # empty_buffer --- kill remainder of line in input buffer

      procedure empty_buffer {

         Inbuf (Ibp) = EOS          # will force a read in 'getchar'

         }

   end



# ifalloc --- allocate space for a particular type node in internal form memory

   ifpointer function ifalloc (node_type)
   integer node_type

   include GLOBAL_VARIABLES

  # These declarations assume that the internal form node types form
  #   a dense ascending sequence of integers from 1 to LAST_NODE_TYPE:
   integer sizeof (LAST_NODE_TYPE)
   data sizeof / _
      4,    # ADD_NODE
      3,    # ARG_NODE
      4,    # ASSIGN_NODE
      4,    # CALL_NODE
      5,    # COND_NODE
      4,    # CONSTANT_NODE
      3,    # DECLARE_VAR_NODE
      4,    # DIVIDE_NODE
      6,    # FUNCTION_NODE
      2,    # IO_NODE
      4,    # LOOP_NODE
      4,    # MULTIPLY_NODE
      2,    # NULL_NODE
      3,    # PARAM_NODE
      4,    # SEQ_NODE
      4,    # SUBTRACT_NODE
      3 _   # VAR_NODE
      /

   if (node_type < 1 || node_type > LAST_NODE_TYPE)
      call error ("ifalloc received bad node type"p)

   if (Next_ifmem + sizeof (node_type) > INTERNAL_FORM_MEMSIZE)
      call error ("insufficient internal form memory"p)

   ifalloc = Next_ifmem
   Next_ifmem += sizeof (node_type)

   NODE_TYPE (ifalloc) = node_type
   LINE_NUM (ifalloc) = Current_line

   return
   end



# lvalue_context --- generate VCG code for constructs used as lvalues
#     (assumes I/O quads have already been eliminated from LHS's)

   subroutine lvalue_context (node)
   ifpointer node

   include GLOBAL_VARIABLES

   select (NODE_TYPE (node))

      when (VAR_NODE) {
         call emit (OBJECT_OP, Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call emit (OBJ_ID (node), Code_stream)
         }

      when (SEQ_NODE) {
         if (NODE_TYPE (RIGHT (node)) == NULL_NODE)
            call lvalue_context (LEFT (node))
         else {
            call emit (SEQ_OP, Code_stream)
            call void_context (LEFT (node))
            call lvalue_context (RIGHT (node))
            }
         }

   else
      call warning ("assignment on line *i has an illegal left side*n"p,
         LINE_NUM (node))

   return
   end



# make_actual_parameter --- link actual parameter expression to list

   subroutine make_actual_parameter

   include GLOBAL_VARIABLES

   ifpointer act_param
   ifpointer ifalloc, pop

   act_param = ifalloc (ARG_NODE)
   ARG_EXPR (act_param) = pop (0)
   call push (act_param)
   call sequentialize

   return
   end



# make_call --- generate a call to a function

   subroutine make_call (name)
   character name (ARB)

   include GLOBAL_VARIABLES

   integer info2 (2)
   integer lookup, gen_id

   ifpointer call_node
   ifpointer ifalloc, pop

  # if function name is in Functions table, all is well; if not,
  #   we add it provisionally (it may be defined later).
   if (lookup (name, info2, Functions) == NO) {
      info2 (1) = gen_id (1)
      info2 (2) = UNDEFINED
      call enter (name, info2, Functions)
      }

   call_node = ifalloc (CALL_NODE)
   OBJ_ID (call_node) = info2 (1)
   ARG_LIST (call_node) = pop (0)
   call push (call_node)

   return
   end



# make_conditional --- make conditional (if-then-else-fi) node

   subroutine make_conditional

   include GLOBAL_VARIABLES

   ifpointer cond
   ifpointer if_alloc, pop

   cond = if_alloc (COND_NODE)
   ELSE_PART (cond) = pop (0)
   THEN_PART (cond) = pop (0)
   COND (cond) = pop (0)

   call push (cond)
   return
   end



# make_constant --- make constant node from given value

   subroutine make_constant (val)
   real val

   include GLOBAL_VARIABLES

   real rkluge
   integer ikluge (2)
   equivalence (rkluge, ikluge)  # used to unpack floating point constants

   ifpointer cnode
   ifpointer ifalloc

   cnode = ifalloc (CONSTANT_NODE)
   rkluge = val
   WORD1 (cnode) = ikluge (1)
   WORD2 (cnode) = ikluge (2)

   call push (cnode)
   return
   end



# make_dyad --- make node for a dyadic operator (=, +, -, *, /)

   subroutine make_dyad (node_type)
   integer node_type

   include GLOBAL_VARIABLES

   ifpointer node
   ifpointer ifalloc, pop

   node = ifalloc (node_type)
   RIGHT (node) = pop (0)
   LEFT (node) = pop (0)
   call push (node)

   return
   end



# make_function_body --- add function body to function definition node

   subroutine make_function_body

   include GLOBAL_VARIABLES

   ifpointer body
   ifpointer pop

   call sequentialize      # combine declarations and code
   body = pop (0)          # note deep-stack addressing makes sequencing
   FUNC_BODY (Stack (Sp)) = body       # necessary...

   return
   end



# make_function_parameters --- add params to function definition node

   subroutine make_function_parameters

   include GLOBAL_VARIABLES

   ifpointer params
   ifpointer pop

   params = pop (0)     # note:  deep-stack addressing makes use of
   PARAM_LIST (Stack (Sp)) = params    # a particular sequence necessary

   return
   end



# make_loop --- pop cond and body off stack, generate a loop node

   subroutine make_loop

   include GLOBAL_VARIABLES

   ifpointer loop
   ifpointer ifalloc, pop

   loop = ifalloc (LOOP_NODE)
   LOOP_BODY (loop) = pop (0)
   COND (loop) = pop (0)
   call push (loop)

   return
   end



# make_null --- push new "null operator" node on stack

   subroutine make_null

   include GLOBAL_VARIABLES

   ifpointer ifalloc

   call push (ifalloc (NULL_NODE))

   return
   end



# make_object --- push node referencing a variable on the stack

   subroutine make_object (name)
   character name (ARB)

   include GLOBAL_VARIABLES

   ifpointer node
   ifpointer ifalloc

   integer obj_id
   integer lookup

   node = ifalloc (VAR_NODE)

   if (lookup (name, obj_id, Locals) == NO
     && lookup (name, obj_id, Globals) == NO) {
      call warning ("*s:  undeclared identifier*n"p, name)
      obj_id = 0
      }

   OBJ_ID (node) = obj_id
   call push (node)

   return
   end



# make_quad --- generate an input/output operation node

   subroutine make_quad

   include GLOBAL_VARIABLES

   ifpointer ifalloc

   call push (ifalloc (IO_NODE))

   return
   end



# output_arguments --- output IMF for procedure call arguments

   subroutine output_arguments (arg_node)
   ifpointer arg_node

   include GLOBAL_VARIABLES

   select (NODE_TYPE (arg_node))

      when (ARG_NODE) {
         call emit (PROC_CALL_ARG_OP, Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call rvalue_context (ARG_EXPR (arg_node))
         }

      when (NULL_NODE)
         ;

      when (SEQ_NODE) {
         call output_arguments (LEFT (arg_node))
         call output_arguments (RIGHT (arg_node))
         }

   else
      call error ("in output_argument:  shouldn't happen"p)

   return
   end



# output_params --- output IMF for procedure formal parameter definitions

   subroutine output_params (param_node)
   ifpointer param_node

   include GLOBAL_VARIABLES

   select (NODE_TYPE (param_node))

      when (PARAM_NODE) {
         call emit (PROC_DEFN_ARG_OP, Code_stream)
         call emit (OBJ_ID (param_node), Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call emit (VALUE_DISP, Code_stream)
         call emit (2, Code_stream) # FLOATs are 2 words long
         }

      when (NULL_NODE)
         ;

      when (SEQ_NODE) {
         call output_params (LEFT (param_node))
         call output_params (RIGHT (param_node))
         }

   else
      call error ("in output_param:  shouldn't happen"p)

   return
   end



# pmr --- panic mode recovery for parser

   subroutine pmr (message, state)
   character message (ARB)
   integer state

   include GLOBAL_VARIABLES

   call warning (message)
   state = ACCEPT

   while (Symbol ~= EOF && Symbol ~= ')'c && Symbol ~= NEWLINE
     && Symbol ~= END_FUNCTION_SYM && Symbol ~= THEN_SYM
     && Symbol ~= ELSE_SYM && Symbol ~= FI_SYM && Symbol ~= DO_SYM
     && Symbol ~= OD_SYM && Symbol ~= ','c)
      call getsym

   return
   end



# pop --- pop a node pointer off the semantic stack

   ifpointer function pop (dummy)
   integer dummy     # needed to satisfy FORTRAN syntax requirements

   include GLOBAL_VARIABLES

   if (Sp < 1)
      call error ("semantic stack underflow"p)

   pop = Stack (Sp)
   Sp -= 1

   return
   end



# push --- push a node pointer onto the semantic stack

   subroutine push (node)
   ifpointer node

   include GLOBAL_VARIABLES

   if (Sp >= SEMANTIC_STACK_SIZE)
      call error ("semantic stack overflow"p)

   Sp += 1
   Stack (Sp) = node

   return
   end



# rvalue_context --- generate VCG code for constructs used as rvalues

   subroutine rvalue_context (node)
   ifpointer node

   include GLOBAL_VARIABLES

   select (NODE_TYPE (node))

      when (ADD_NODE, SUBTRACT_NODE, MULTIPLY_NODE, DIVIDE_NODE) {
         select (NODE_TYPE (node))
            when (ADD_NODE)
               call emit (ADD_OP, Code_stream)
            when (SUBTRACT_NODE)
               call emit (SUB_OP, Code_stream)
            when (MULTIPLY_NODE)
               call emit (MUL_OP, Code_stream)
            when (DIVIDE_NODE)
               call emit (DIV_OP, Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call rvalue_context (LEFT (node))
         call rvalue_context (RIGHT (node))
         }

      when (ASSIGN_NODE) {
         if (NODE_TYPE (LEFT (node)) == IO_NODE) {
           # fake up output by calling 'ex$out' at run time:
            call emit (PROC_CALL_OP, Code_stream)
            call emit (FLOAT_MODE, Code_stream)
            call emit (OBJECT_OP, Code_stream)
            call emit (STOWED_MODE, Code_stream)
            call emit (Ex$out_id, Code_stream)
            call emit (PROC_CALL_ARG_OP, Code_stream)
            call emit (FLOAT_MODE, Code_stream)
            call rvalue_context (RIGHT (node))
            call emit (NULL_OP, Code_stream)
            }
         else {
            call emit (ASSIGN_OP, Code_stream)
            call emit (FLOAT_MODE, Code_stream)
            call lvalue_context (LEFT (node))
            call rvalue_context (RIGHT (node))
            call emit (2, Code_stream)    # assign 2 words
            }
         }

      when (CALL_NODE) {
         call emit (PROC_CALL_OP, Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call emit (OBJECT_OP, Code_stream)
         call emit (STOWED_MODE, Code_stream)
         call emit (OBJ_ID (node), Code_stream)
         call output_arguments (ARG_LIST (node))
         call emit (NULL_OP, Code_stream)
         }

      when (COND_NODE) {
         call emit (IF_OP, Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call rvalue_context (COND (node))
         call rvalue_context (THEN_PART (node))
         if (NODE_TYPE (ELSE_PART (node)) == NULL_NODE)
            call warning ("'if' on line *i needs an 'else' part*n"p,
               LINE_NUM (node))
         call rvalue_context (ELSE_PART (node))
         }

      when (CONSTANT_NODE) {
         call emit (CONST_OP, Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call emit (2, Code_stream)    # 2-word floats
         call emit (WORD1 (node), Code_stream)
         call emit (WORD2 (node), Code_stream)
         }

      when (DECLARE_VAR_NODE) {
         call emit (DEFINE_DYNM_OP, Code_stream)
         call emit (OBJ_ID (node), Code_stream)
         call emit (NULL_OP, Code_stream)    # no initializers
         call emit (2, Code_stream)    # size is 2 words
         }

      when (IO_NODE) {
        # fake up input by calling 'ex$in' at run time:
         call emit (PROC_CALL_OP, Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call emit (OBJECT_OP, Code_stream)
         call emit (STOWED_MODE, Code_stream)
         call emit (Ex$in_id, Code_stream)
         call emit (NULL_OP, Code_stream)    # no arguments
         }

      when (LOOP_NODE)
         call warning ("while-loop at line *i is used as an rvalue*n"p,
            LINE_NUM (node))

      when (NULL_NODE)
         call emit (NULL_OP, Code_stream)

      when (SEQ_NODE) {
         if (NODE_TYPE (RIGHT (node)) == NULL_NODE)
            call rvalue_context (LEFT (node))
         else {
            call emit (SEQ_OP, Code_stream)
            call void_context (LEFT (node))  # can never yield a value
            call rvalue_context (RIGHT (node))
            }
         }

      when (VAR_NODE) {
         call emit (OBJECT_OP, Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call emit (OBJ_ID (node), Code_stream)
         }

   else
      call error ("in rvalue_context:  shouldn't happen"p)

   return
   end



# semantic_analysis --- check function and output VCG code for it

   subroutine semantic_analysis (func)
   ifpointer func

   include GLOBAL_VARIABLES

  # output the procedure definition node:
   call emit (SEQ_OP, Code_stream)
   call emit (PROC_DEFN_OP, Code_stream)
   call emit (OBJ_ID (func), Code_stream)
   call emit (NPARAMS (func), Code_stream)
   call emit_string (EOS, Code_stream) # we'll ignore this for now

  # take care of the formal parameter declarations:
   call output_params (ARG_LIST (func))
   call emit (NULL_OP, Code_stream)

  # finally, take care of local variables and the function code:
   call rvalue_context (FUNC_BODY (func))

   return
   end



# sequentialize --- combine two nodes with a "sequence" node

   subroutine sequentialize

   include GLOBAL_VARIABLES

   ifpointer seq_node
   ifpointer ifalloc, pop

   seq_node = ifalloc (SEQ_NODE)
   RIGHT (seq_node) = pop (0)
   LEFT (seq_node) = pop (0)
   call push (seq_node)

   return
   end



# void_context --- generate VCG code for constructs that yield no value

   subroutine void_context (node)
   ifpointer node

   include GLOBAL_VARIABLES

   select (NODE_TYPE (node))

      when (COND_NODE) {      # an 'if' used as a statement
         call emit (IF_OP, Code_stream)
         call emit (FLOAT_MODE, Code_stream)
         call rvalue_context (COND (node))
         call void_context (THEN_PART (node))
         call void_context (ELSE_PART (node))
         }

      when (LOOP_NODE) {
         call emit (WHILE_LOOP_OP, Code_stream)
         call rvalue_context (COND (node))
         call void_context (LOOP_BODY (node))
         }

      when (SEQ_NODE) {
         call emit (SEQ_OP, Code_stream)
         call void_context (LEFT (node))
         call void_context (RIGHT (node))
         }

   else
      call rvalue_context (node)

   return
   end



# warning --- print warning message

   subroutine warning (format, a1, a2, a3, a4, a5, a6, a7, a8, a9)
   character format (ARB)
   unknown a1, a2, a3, a4, a5, a6, a7, a8, a9

   include GLOBAL_VARIABLES

   call print (ERROUT, "*i:  "s, Current_line)
   call print (ERROUT, format, a1, a2, a3, a4, a5, a6, a7, a8, a9)
   Error_count += 1

   return
   end
