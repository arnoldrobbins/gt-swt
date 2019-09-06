# diff_com.r.i --- common declarations for the 'diff' program

   sym_pointer Old_count (MAX_FILE_SIZE),
      New_count (MAX_FILE_SIZE),
      Old_xref (MAX_FILE_SIZE),
      New_xref (MAX_FILE_SIZE),
      Old_lno (MAX_UNIQUE_LINES),
      Bucket (HASH_TABLE_SIZE),
      Sym_store (MAX_UNIQUE_LINES2)
   file_mark Text_loc (MAX_UNIQUE_LINES)

   common /c1/ Old_count
   common /c2/ New_count
   common /c3/ Old_xref
   common /c4/ New_xref
   common /c5/ Old_lno
   common /c6/ Bucket
   common /c7/ Sym_store
   common /c8/ Text_loc

   sym_pointer Next_sym,
      Next_inx,
      New_size,
      Old_size
   file_des Old_file,
      New_file,
      Text_file,
      Old_copy,
      New_copy
   integer Option,
      Verbose

   common /diffcom/ Next_sym, Next_inx, Old_file, New_file, Text_file,
      New_size, Old_size, Old_copy, New_copy, Option, Verbose
