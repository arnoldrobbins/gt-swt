# Variables global to the entire code generator

   integer Imem (MAX_INS_MEMORY), Tmem (MAX_TREE_MEMORY),
      Errors, Break_sp, Continue_sp
   character Smem (MAX_STR_MEMORY)
   unsigned Break_stack (MAX_BREAK_SP), Continue_stack (MAX_CONTINUE_SP)
   filedes Outfile, Infile, Stream_1, Stream_2, Stream_3

   unsigned Rtr_ids (NUM_RTR_IDS)
   integer Emit_PMA, Emit_Obj

   common /vcg_com/ Errors, Break_sp, Continue_sp,
      Break_stack, Continue_stack, Outfile, Infile, Stream_1, Stream_2,
      Stream_3, Rtr_ids, Emit_PMA, Emit_Obj
   common /vcg_cm1/ Imem
   common /vcg_cm2/ Tmem
   common /vcg_cm3/ Smem
