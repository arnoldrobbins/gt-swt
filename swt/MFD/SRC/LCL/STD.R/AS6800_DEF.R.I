# definitions for object file manipulating programs

# definitions affecting size:
define(MAXSYMTOP,2000)
define(MEMSIZE,10000)
define(MAXTOK,33)
define(INBUFSIZE,10)
define(MAPSIZE,4096)

# definitions related to output code file:
define(HEADER_LENGTH,3)
define(HEADERCODE,0)
define(TEXTCODE,1)
define(RMAPCODE,2)
define(SYMBOLCODE,3)

# symbol types:
define(ABSOLUTE,0)
define(RELOCATABLE,1)
define(ALIAS,2)
define(UNDEFINED,3)
define(EXTERNAL,UNDEFINED)
define(REGISTER,4)

# list manipulation:
define(LAMBDA,-1)
define(ADDR,0)
define(LINK,1)

# definitions to change Ratfor:
define(pointer,integer)

# definitions used for listing
define(MAX_INSTRUCTION, 3)
