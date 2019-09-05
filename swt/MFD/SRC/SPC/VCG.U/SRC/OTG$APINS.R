#  otg$apins --- generate a generic ap instruction group set

   subroutine otg$apins (opcode, mod, br, address, bit, fwd_ref)
   integer opcode, mod, br, address, bit
   bool fwd_ref

   call otg$gen (opcode)
   call otg$ap (mod, br, address, bit, fwd_ref)
   return
   end
