define(COMMONBLOCKS,"translang_com.r.i")
define(PRODUCTIONS,"translang.stacc.r")
define(TERMINAL_SYMBOLS,"translang.stacc.defs")

define(MWORD,Micro_mem(Micro_lc+1))
define(NWORD,Nano_mem(1,Nano_lc+1))

define(SAY(stuff),call errmsg(stuff))

define(UNCONDITIONAL,1)
define(THEN_PART,2)
define(ELSE_PART,3)

define(MEMSIZE,8192)
define(MICRO_MEM_SIZE,2048)
define(NANO_MEM_SIZE,2048)
define(BITS_PER_WORD,16)
define(LABEL_INFO_SIZE,1)

define(packed_char,integer)

include ARGUMENT_DEFS

include TERMINAL_SYMBOLS
