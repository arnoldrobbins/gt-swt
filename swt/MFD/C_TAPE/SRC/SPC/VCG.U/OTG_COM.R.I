#     otg_com.r.i -- common block insert for the object text generator
#     Jeff Lee - May, 1982


   integer Block (MAX_BLOCK)
   file_des Fd
   file_mark Mark, Proc_start, End_mark
   integer Emit_PMA, Emit_Obj, PB_here, LB_here, Current_Base,
           Resolve_proc, ECB_start, Data_ptr

   common /otgcom/ Block, Fd, Mark, Proc_start, End_mark, Emit_PMA,
                   Emit_Obj, PB_here, LB_here, Current_Base,
                   Resolve_proc, ECB_start, Data_ptr
