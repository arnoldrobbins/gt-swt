# otg$dac --- generate a data address constant group in PB%
#             (don't use for generating data constants)

   subroutine otg$dac (offset, fwd_ref)
   integer offset
   bool fwd_ref

   integer group_data (3), fwd_ref_bit, proc_rel_bit
   bool missin

   include OTG_COMMON

   # proc_rel_bit (R) is always set except for a
   # forward referencing DAC that is the first in
   # a chain; i.e., where offset = 0

   proc_rel_bit = BIT15
   if (missin (fwd_ref) || ~fwd_ref)      # regular dac
      fwd_ref_bit = 0
   else if (offset ~= 0)                  # link in fwd ref chain
      fwd_ref_bit = BIT14
   else                                   # begin fwd ref chain
      {
      fwd_ref_bit = 0
      proc_rel_bit = 0
      }

DB call print (ERROUT, "otg$dac: *,-8i*n"s, offset)

   # PB relative address constant
   group_data (1) = MEMREF_GROUP * BIT8 + 2
   group_data (2) = BIT16 + proc_rel_bit + fwd_ref_bit
   group_data (3) = offset
   PB_here += 1            # I guess
   call group (group_data)
   return
   end
