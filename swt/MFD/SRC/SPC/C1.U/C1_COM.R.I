# Common areas for C compiler

  # Lexical Analyzer:
   character Symtext (MAXTOK), Nsymtext (MAXTOK)
   integer Symlen, Symbol, Symline, Nsymlen, Nsymbol, Nsymline
   pointer Symptr, Nsymptr

   common /lexcom/ Symbol, Nsymbol, Symlen, Nsymlen, Symptr, Nsymptr,
      Symtext, Nsymtext, Symline, Nsymline


  # Input/Pushback Buffer and File Control:
   character Inbuf (INBUFSIZE)
   integer Ibp, Line_number (MAXLEVEL), Level
   file_des Infile (MAXLEVEL)

   common /incom/ Inbuf, Ibp, Line_number, Infile, Level


  # Preprocessor
   integer Dir_top, Dfo_top
   pointer Pp_tbl
   character Dir_name (MAXDIR), Dfo_name (MAXDFO)

   common /ppcom/ Pp_tbl, Dir_top, Dir_name, Dfo_top, Dfo_name


  # Keyword and identifier tables
   pointer Keywd_tbl, Id_tbl (MAXSCOPE), Sm_tbl (MAXSCOPE)
   integer Ll

   common /idcom/ Ll, Keywd_tbl, Id_tbl, Sm_tbl


  # Dynamic Storage Area:
   untyped Mem (MEMSIZE)

   common /ds$mem/ Mem


  # Parser:
   integer Sem_sk (MAXSEMSTACK), Ctl_sk (MAXCTLSTACK)
   integer Sem_sp, Ctl_sp

   common /parcom/ Sem_sk, Sem_sp, Ctl_sk, Ctl_sp


  # Mode table pointers
   pointer Int_mode_ptr, Char_mode_ptr, Short_mode_ptr, Long_mode_ptr,
      Unsigned_mode_ptr, Float_mode_ptr, Double_mode_ptr, Label_mode_ptr,
      Pointer_mode_ptr, Shortuns_mode_ptr, Longuns_mode_ptr,
      Charuns_mode_ptr, Mode_table, Mode_list, Mode_save_type (MAXMODESAVE),
      Mode_save_len (MAXMODESAVE), Mode_save_ct

   common /modcom/ Int_mode_ptr, Char_mode_ptr, Short_mode_ptr, Long_mode_ptr,
      Unsigned_mode_ptr, Float_mode_ptr, Double_mode_ptr, Label_mode_ptr,
      Pointer_mode_ptr, Shortuns_mode_ptr, Longuns_mode_ptr,
      Charuns_mode_ptr, Mode_table, Mode_list, Mode_save_type,
      Mode_save_len, Mode_save_ct


  # Code Generation
   pointer Exp_sk (MAXEXPRSTACK), Proc_mode, Proc_rtnv
   integer Exp_sp, Obj_no
   longint Zinit_len

   common /expcom/ Exp_sk, Exp_sp, Obj_no, Proc_mode, Proc_rtnv,
      Zinit_len


  # Debugging
DB integer Dbg_flag (MAXDBFLAG)

DB common /dbcom/ Dbg_flag


  # Miscellaneous Junk:
   integer Outfp, Nerrs
   character Module_name (MAXTOK), Error_sym (MAXTOK)
   ARG_DECL
   file_des Outfile (MAXSTREAMS), Ckfile
   pointer Fname_table (MAXLEVEL)         # to keep track of #includes


   common /miscom/ Module_name, Error_sym, ARG_BUF, Outfile, Outfp,
      Ckfile, Nerrs, Fname_table
