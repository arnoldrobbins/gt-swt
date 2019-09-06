  common /csym/ Symtab, srptflg
     integer Symtab             # storage for all symbols
     integer srptflg            # store report flag

  common /cpb/ pbchar, Inbuf, Ibp
     character pbchar           # put back character
     character Inbuf (MAXLINE)  # input buffer
     integer Ibp                # input buffer pointer

  common /ctkstk/ token_stack (PUTBACKDEPTH), token_sp
     integer token_stack        # for putting back tokens
     integer token_sp           # points to top of stack

  common /cmisc/ lctr, saddr, dbase, newlinex, nundef,
    errors_found, generate_code, generate_list, report_undef,
    lineno, read_input, newlines_behind
     integer lctr,              # location counter's symbol table index
             saddr,             # symtab index of start address
             dbase,             # symtab index of default number base
             newlinex,          # symtab index of newline
           newlines_behind, # bump lineno on next token
             nundef,            # number of undefined bytes
             errors_found,      # at least one error found
             generate_code,     # write out GT40 loader format code
             generate_list,     # write human-readable code
             read_input,        # do lexical analysis this pass
             report_undef,      # report lines causing undefined bytes
             lineno             # source line number

  common /ctkrcd/ token_record (MAXTOKENS), tr_ptr
     integer token_record       # stores program between passes
     integer tr_ptr             # token_record pointer

  common /cmembf/ membuf (MEMBUFSIZE), bufstart, bufptr
     integer membuf             # buffer for transmission block
     integer bufstart           # starting PDP-11 address
     integer bufptr             # where buffer is being loaded

  common /cgtld/ triple (3), checksum, triple_index
     integer triple       # three bytes to be encoded as four sixbits
     integer checksum     # byte checksum for .lda format
     integer triple_index

   DS_DECL(Mem,MEMSIZE)
