# otg$brnch --- generate a branch group

   subroutine otg$brnch (opcode, offset, fwd_ref)
   integer opcode, offset
   bool fwd_ref

   include OTG_COMMON

   bool missin, fwd_branch

   if (missin (fwd_ref) || ~fwd_ref)
      fwd_branch = FALSE
   else
      fwd_branch = TRUE

DB call print (ERROUT, "otg$brnch: PB%+'*,-8i_*n"s, offset)

   call otg$gen (opcode)
   call otg$dac (offset, fwd_branch)
   return
   end
