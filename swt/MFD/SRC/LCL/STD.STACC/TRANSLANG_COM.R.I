   file_des _
      Infile,
      Outfile

   bool _
      Listing,
      Binary,
      Comp_y,
      Mar_used,
      Br_used,
      Ctr_used,
      Mdop_used,
      Caj_used,
      Lunit_used

   integer _
      Micro_lc,
      Nano_lc,
      Micro_mem (MICRO_MEM_SIZE),
      Nano_mem (4, NANO_MEM_SIZE),
      Litval,
      Shiftval,
      Symbol,
      Sym_val,
      Successor_context,
      Line_number,
      Ibp

   pointer _
      Ltab

   character _
      Sym_text (MAXLINE),
      Inbuf (MAXLINE)

   common /tlang_com/ _
      Infile,
      Outfile,
      Listing,
      Binary,
      Comp_y,
      Mar_used,
      Br_used,
      Ctr_used,
      Mdop_used,
      Caj_used,
      Lunit_used,
      Micro_lc,
      Nano_lc,
      Micro_mem,
      Nano_mem,
      Litval,
      Shiftval,
      Symbol,
      Sym_val,
      Successor_context,
      Line_number,
      Ibp,
      Ltab,
      Sym_text,
      Inbuf

   integer Mem (MEMSIZE)
   common /ds$mem/ Mem
