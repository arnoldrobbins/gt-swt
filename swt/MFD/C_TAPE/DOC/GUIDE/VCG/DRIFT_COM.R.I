# global variables for 'drift' compiler

# dynamic storage used by symbol table routines:
   DS_DECL (Mem, MEMSIZE)

# symbol tables:
   pointer Functions, Globals, Locals, Reserved_words
   common /stcom/ Functions, Globals, Locals, Reserved_words

# lexical stuff:
   character Inbuf (INBUFSIZE), Symtext (MAX_SYM_LEN)
   integer Symbol, Ibp, Current_line
   real Symval
   common /lexcom/ Inbuf, Symtext, Symbol, Ibp, Current_line, Symval

# files for I/O:
   filedes In_stream, Ent_stream, Data_stream, Code_stream
   common /filcom/ In_stream, Ent_stream, Data_stream, Code_stream

# internal form memory:
   integer Ifmem (INTERNAL_FORM_MEMSIZE), Next_ifmem
   common /if1com/ Ifmem
   common /if2com/ Next_ifmem

# semantic stack:
   ifpointer Stack (SEMANTIC_STACK_SIZE)
   integer Sp
   common /semcom/ Sp, Stack

# other junk:
   integer Next_obj_id, Ex$in_id, Ex$out_id, Error_count
   common /miscom/ Next_obj_id, Ex$in_id, Ex$out_id, Error_count
