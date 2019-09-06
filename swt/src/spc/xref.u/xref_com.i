# Common areas for Ratfor cross reference generator

  # Global options
   ARG_DECL

   common /optcom/ ARG_BUF


  # Lexical Analyzer:
   character Symtext (MAXTOK), Sym_name (MAXTOK)
   integer Symlen, Symbol
   pointer Id_table

   common /lexcom/ Symtext, Symlen, Symbol, Id_table,
      Sym_name


  # Input/Pushback Buffer and File Control:
   character Inbuf (INBUFSIZE)
   integer Ibp, Line_number (MAXLEVEL), Level
   filedes Infile (MAXLEVEL)

   common /incom/ Inbuf, Ibp, Line_number, Infile, Level


  # Output Buffers:
   character Outbuf (MAXLINE)
   integer  Outp, Out_line, Out_width

   common /obufcom/ Outbuf, Outp, Out_line, Out_width


  # Dynamic Storage Area:
   DS_DECL (Mem, MEMSIZE)
