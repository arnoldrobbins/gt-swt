# xref_def.i --- definitions for the 'xref' program

   define(XREF_COMMON,"xref_com.i")

   define(MEMSIZE,30000)         # dynamic storage space available
   define(MAXTOK,200)            # maximum size of a token
   define(INBUFSIZE,505)         # must be > MAXLINE
   define(PBLIMIT,400)           # max no. chars pushed back before full line
   define(MAXLEVEL,5)            # max. no. include files

   define(TABFIRST,18)
   define(TABWIDTH,7)

   define(SYMINFOSIZE,1)         # size of symbol info
   define(SYMBOLTYPE,0)
   define(KEYWD_SYMBOLTYPE,1)
   define(IDENT_SYMBOLTYPE,2)

   define(SYNERR,call synerr)    # shorthands
   define(parse_state,integer)
   define(untyped,integer)
   define(packed_char,integer)

   define(IDSYM,1)
   define(STRCONSTANTSYM,2)
   define(NUMBERSYM,3)

   define(DB,#)

   include ARGUMENT_DEFS
