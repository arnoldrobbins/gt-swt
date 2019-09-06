# define_def.r.i --- definitions for the 'define' program

   define(DEFINE_COMMON,"define_com.r.i")    # common definitions for 'define'

   define(MEMSIZE,25000)      # maximum memory size
   define(MAXTOKEN,200)       # maximum characters in a token
   define(MAXDEF,400)         # maximum length of a definition
   define(MAXLEVEL,5)         # maximum number of nested files
   define(PBLIMIT,400)        # maximum number of characters in In_line
   define(NOT_EOF,1)          # read_line returns NOT_EOF if it could
                              # read a line

   define(INFOSIZE,3)         # the size of a node in the definition table
   define(POINTER,1)          # the fields in the node - a pointer to the
   define(NUM_ARGS,2)         # definition string, the number of arguments,
   define(LENGTH,3)           # and the length of the definition

   define(MAXCALLSIZE,36)     # maximum number of parameters plus
                              # the other information needed during
                              # expansion
   define(MAXPARAMS,32)       # maximum number of parameters
   define(TEXT_POINTER,33)    # fields in the stack entries - a pointer
   define(NUM_ARGUMENTS,34)   # to the definition string, the number of
   define(TEXT_LENGTH,35)     # arguments, the length of the definition,
   define(NUMBER_READ,36)     # the number of arguments read, and the

   define (DEBUG,#)           # debugging switch

   undefine (file_mark)       # so we don't get mixed up with the
                              # system definition
