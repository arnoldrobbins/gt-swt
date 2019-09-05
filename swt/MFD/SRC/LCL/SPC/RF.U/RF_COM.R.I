##########Begin commonblocks##########
common /cdefio/ bp, buf(BUFSIZE)
   integer bp      # next available character; init = 0
   character buf   # pushed-back characters

common /cfor/ fordep, forstk(MAXFORSTK)
   integer fordep   # current depth of for statements
   character forstk   # stack of reinit strings

common /cline/ level, linect(NFILES), infile(NFILES)
   integer level,  # level of file inclusion; init = 1
      linect,      # line count on input file(level); init = 1
      infile       # file number(level); init infile(1) = STDIN

common /coutln/ outfil, outp, outbuf(MAXLINE)
   integer outfil,   # output file descriptor
      outp           # last position filled in outbuf; init = 0
   character outbuf   # output lines collected here

common /csym/ symtbl(MAXSYM), nextsy
   integer symtbl,    # symbol table for holding unique names
      nextsy          # next available position in symtbl

common /ccase/ csp, cstack(MAXCASENEST), ctop, clab(MAXCASELAB)
   integer csp,       # case stack depth; init = 0
      cstack,         # start of level in clab
      ctop,           # next avail in clab; init = 0
      clab            # case labels and variables

common /ctrace/ spname, time_profile, in_declarations, spnum,
      dictionary, program_trace, stc_profile
   character spname (MAXTOK)       # last subprogram name, for trace
   integer time_profile,           # YES if time profile is desired
      program_trace,               # YES if trace is desired
      in_declarations,             # YES if trace code is to be output
      spnum,                       # subprogram number
      dictionary,                  # fd of dictionary file for postprocessor
      stc_profile                  # YES if statement count is to be performed

common /cstr/ strbuf(MAXSTRING), strtop
   integer strbuf,             # buffer for string declarations
      strtop                   # pointer to last used strbuf position

common /tabcom/ def_table, keyword_table
   pointer def_table,          # symbol table for 'define's
      keyword_table            # symbol table for Ratfor keywords

common /typcom/ type
   character type (MAXCHARVAL_P_1)  # character type array
                               # (replaces K&P's 'type' function)

common /DS$MEM/ mem
   untyped mem (MEMSIZE)       # dynamic storage space

##########End commonblocks##########
