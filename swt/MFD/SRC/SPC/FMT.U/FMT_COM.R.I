# fmt_com.r.i --- common blocks for 'fmt'

common /cout/ Outp, Outw, Outwds, Outbuf (MAXOUT)

   integer   Outp,   # last char position in outbuf; init = 0
             Outw,   # width of text currently in outbuf; init = 0
             Outwds  # number of words in outbuf; init = 0
   character Outbuf  # lines to be filled collect here


common /cpage/ Start_page, End_page, Curpag, Newpag, Lineno,
   Plval, M1val, M2val, M3val, M4val, Bottom, Even_header (MAXOUT),
   Odd_header (MAXOUT), Even_footer (MAXOUT), Odd_footer (MAXOUT)

   integer   Start_page,   # page on which printing begins; init = 0
             End_page,     # page on which printing ends; init = HUGE
             Curpag,       # current output page number; init = 0
             Newpag,       # next output page number; init = 1
             Lineno,       # next line to be printed; init = 0
             Plval,        # page length in lines; init = PAGELEN = 66
             M1val,        # margin before and including header
             M2val,        # margin after header
             M3val,        # margin after last text line
             M4val,        # bottom margin, including footer
             Bottom        # last live line on page, = plval-m3val-m4val
   character Even_header,  # heading for even pages; init = EOS
             Odd_header,   # heading for odd pages; init = EOS
             Even_footer,  # footing for even pages; init = EOS
             Odd_footer    # footing for odd pages; init = EOS


common /cparam/ Fill, Nospace, Adjust, Dvflag, Tiwidth, Poval, Moval,
   Inval, Tival, Lmval, Rmval, Bfval, Ceval, Ulval, Lsval, Ooval, Eoval,
   Itval

   integer Fill,     # fill if YES; init = YES
           Nospace,  # inhibit spacing; init = NO
           Adjust,   # adjustment mode; init = BOTH
           Dvflag,   # divert unformatted output; init = NO
           Tiwidth,  # title width; init = PAGEWIDTH = 60
           Poval,    # page offset; init = 0
           Moval,    # marginal character offset; init = 0
           Inval,    # current indent; >= 0; init = 0; always = lmval - 1
           Tival,    # current temporary indent; init = 0
           Lmval,    # left margin; always equals inval + 1; init 1
           Rmval,    # current right margin; init = PAGEWIDTH = 60
           Bfval,    # number of lines to boldface; init = 0
           Ceval,    # number of lines to center; init = 0
           Ulval,    # number of lines to underline; init = 0
           Lsval,    # current line spacing; init = 1
           Ooval,    # odd page offset value; init = 0
           Eoval,    # even page offset value; init = 0
           Itval     # number of lines to italicize; init = 0


common /cmisc/ Hyphenation, Extra_blank_mode, Nobreak, Word_last,
   F_ptr, F_list (MAXFILES), F_type (MAXFILES), O_list (MAXFILES),
   Out_file, Next_arg, Tabs (MAXLINE), Numreg (MAXNUMREGS), Mcout,
   Mcch, Tmcch, Cmdch, Nbcch, Replch, Tabch, File_name (MAXPATH)

   integer   Hyphenation,      # YES if hyphenation is on
             Extra_blank_mode, # YES if extra blanks wanted after periods
             Nobreak,    # YES if no-break char specified
             Word_last,  # YES if word was just put in outbuf
             F_ptr,      # index into f_list, indicates current input file
             F_list,     # stack of currently-open input files
             F_type,     # type of each input source (FILE or MACRO)
             O_list,     # descriptors of output temporaries; init = ERR
             Out_file,   # output file descriptor for divert
             Next_arg,   # next argument to be checked for file name
             Tabs,       # tab stops for tab expansion
             Numreg,     # number registers for general use
             Mcout       # YES if current marginal char has been output
   character Mcch,       # marginal character
             Tmcch,      # temporary marginal character
             Cmdch,      # command character
             Nbcch,      # no-break command character
             Replch,     # tab replacement character
             Tabch,      # tab character
             File_name   # buffer used by various file handlers


common /cmacro/ Maclvl, Argv (MAXMACLVL), Argtop, First_macro, Mactop,
   Macbuf (MACBUFSIZE), Argbuf (ARGBUFSIZE)

   integer   Maclvl,       # nesting level for macro calls; init = 1
             Argv,         # beginning of arg list for each macro level
             Argtop,       # next free location in argbuf
             First_macro,  # location of first macro in macbuf
             Mactop        # next free location in macbuf
   character Macbuf,       # macro text buffer area
             Argbuf        # buffer for macro arguments


common /copts/ Stop_mode

   integer Stop_mode       # YES iff -s option on command


common /tabcom/ Com_table, Fn_table, Spchar_table

   pointer Com_table,      # symbol table that holds allowable requests
           Fn_table,       # symbol table that holds function names
           Spchar_table    # special character names (Greek, etc.)


common /ds$mem/ Mem (MEMSIZE)

   integer Mem             # dynamic storage space for symbol tables, etc.
