# Common areas for Ratfor preprocessor

  # Lexical Analyzer:
   character Symtext (MAXTOK), Sym_long_text (MAXTOK)
   integer Symlen, Symbol
   pointer Id_table, Uname_table

   common /lexcom/ Symtext, Symlen, Symbol, Id_table, Uname_table,
      Sym_long_text


  # Input/Pushback Buffer and File Control:
   character Inbuf (INBUFSIZE)
   integer Ibp, Line_number (MAXLEVEL), Level
   file_des Infile (MAXLEVEL)

   common /incom/ Inbuf, Ibp, Line_number, Infile, Level


  # Loop Control:
   integer Loop_sp, Next_lab (MAXLOOPS), Break_lab (MAXLOOPS)

   common /loopcom/ Loop_sp, Next_lab, Break_lab


  # Output Buffers:
   character Outbuf (MAXLINE, MAXSTREAM)
   integer  Outp (MAXSTREAM)

   common /obufcom/ Outbuf, Outp


  # Dynamic Storage Area:
   untyped Mem (MEMSIZE)

   common /ds$mem/ Mem


  # Output Files (work files and output file):
   file_des Outfile (MAXSTREAM), Fortfile

   common /outfil/ Outfile, Fortfile


   # Expression Generation
   integer Expr_stack (MAXEXPR), Expr_stack_ptr, False_branch

   common /codegen/ Expr_stack, Expr_stack_ptr, False_branch


  # Select Statement Generation
   integer Scvalue (MAXSEL), Sclabel (MAXSEL), Slt, Result (10)

   common /selgen/ Scvalue, Sclabel, Scl, Result


  # Internal Procedures
   integer Scope_sp
   pointer Scope_table (MAXSCOPE), Proc_head, Proc_table

   common /prccom/ Scope_sp, Scope_table, Proc_head, Proc_table


  # Miscellaneous Junk:
   character Module_name (MAXTOK), Module_long_name (MAXTOK),
      Error_sym (MAXTOK)
   integer Curlab, Brace_count, Dispatch_flag, Indent,
      First_stmt, Spnum
   file_des Prof_dict_file
   ARG_DECL

   common /miscom/ Module_name, Curlab, Brace_count, Dispatch_flag,
      Indent, Module_long_name, First_stmt, Prof_dict_file, Spnum,
      Error_sym, ARG_BUF
