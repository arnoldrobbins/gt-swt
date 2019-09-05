# vcg_output --- PMA output module for code generator

define(DB,#)
define(put_mr,out$01)
define(put_label,out$02)
define(put_branch,out$03)
define(put_generic,out$04)
define(put_misc,out$05)

# put_instr --- write PMA equivalent of code string

   subroutine put_instr (code)
   ipointer code

   include VCG_COMMON

   ipointer i

   i = code
   repeat {
      select (Imem (i))
         when (GENERIC_INSTRUCTION)
            call put_generic (i)
         when (BRANCH_INSTRUCTION)
            call put_branch (i)
         when (MR_INSTRUCTION)
            call put_mr (i)
         when (LABEL_INSTRUCTION)
            call put_label (i)
         when (MISC_INSTRUCTION)
            call put_misc (i)
      else
         call panic ("put_instr: bad instr type (*i)*n"p,
            Imem (i))
      i = Imem (i + 1)
      } until (i == code)

   return
   end



include "vcg_output.put_branch.r.i"
include "vcg_output.put_mr.r.i"
include "vcg_output.put_label.r.i"
include "vcg_output.put_generic.r.i"
include "vcg_output.put_misc.r.i"
include "vcg_output.put_ent.r.i"



# put_module_header --- output pseudo-ops signalling start of module

   subroutine put_module_header

   define (MODULE_INS,5)

   include VCG_COMMON

   integer dummy (1)

DB call print (ERROUT, "put_module_header*n"p)


   if (Emit_PMA == YES)
      call print (Outfile, " SEG*n RLIT*n SYML*n"s)

   if (Emit_Obj == YES)
      call otg (PSEUDO_INSTRUCTION, dummy, MODULE_INS)

   return
   end

   undefine (MODULE_INS)


# put_start_data --- signal the end of the prefix block to otg

   subroutine put_start_data

   define (END_PREFIX_INS,6)

   include VCG_COMMON

   integer dummy (1)

DB call print (ERROUT, "put_start_data*n"p)

   if (Emit_Obj == YES)
      call otg (PSEUDO_INSTRUCTION, dummy, END_PREFIX_INS)

   return
   end

   undefine (END_PREFIX_INS)


# put_module_trailer --- output pseudo-ops signalling end of module

   subroutine put_module_trailer

   define (END_INS,4)

   include VCG_COMMON

   integer dummy (1)

DB call print (ERROUT, "put_module_trailer*n"p)

   if (Emit_PMA == YES)
      call print (Outfile, " END*n"s)

   if (Emit_Obj == YES)
      call otg (PSEUDO_INSTRUCTION, dummy, END_INS)

   return
   end

   undefine (END_INS)





undefine(put_mr)
undefine(put_label)
undefine(put_branch)
undefine(put_generic)
undefine(putone)
undefine(put_misc)
undefine(DB)

