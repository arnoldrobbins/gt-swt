#  otg$ap --- generate an offset pointer group

   subroutine otg$ap (mod, br, offset, bit, fwd_ref)
   integer mod, br, offset, bit
   bool fwd_ref

   include OTG_COMMON


   integer group_data (4), bit_offset, fwd_ref_bit, proc_rel_bit

   bool missin

   if (missin (fwd_ref) || ~fwd_ref)
      fwd_ref_bit = 0
   else
      fwd_ref_bit = BIT14


   if (missin (bit))
      bit_offset = 0
   else
      bit_offset = bit

   proc_rel_bit = 0
   if (br == PB_REG)                   # mem refs to known locs must
      {                                # be proc relative
      if (fwd_ref_bit == 0)
         proc_rel_bit = BIT15
      else if (offset ~= 0)
         proc_rel_bit = BIT15
      else
         fwd_ref_bit = 0
      }

   if (br == LB_REG && fwd_ref_bit ~= 0 && offset == 0)
      fwd_ref_bit = 0

DB call print (ERROUT, "otg$ap:*n"s)
DB if (fwd_ref_bit ~= 0)
DB    call print (ERROUT, "   fwd ref*n"s)

   group_data (1) = MEMREF_GROUP * BIT8 + 3
   group_data (2) = BIT10 + BIT16 + fwd_ref_bit + proc_rel_bit
   group_data (4) = offset

   group_data (3) = bit_offset * BIT4 + br * BIT8
DB call print (ERROUT, "   mod = *,-8i*n"s, mod)
   select (mod)
   when (AP_DL)
      {
DB    call print (ERROUT, "   AP_DL*n"s)
      group_data (3) += BIT9
      }
   when (AP_DS)
      {
DB    call print (ERROUT, "   AP_DS*n"s)
      group_data (3) += BIT10
      }
   when (AP_DLS)
      {
DB    call print (ERROUT, "   AP_DSL*n"s)
      group_data (3) += BIT9 + BIT10
      }
   when (AP_I)
      {
DB    call print (ERROUT, "   AP_I*n"s)
      group_data (3) += BIT5
      }
   when (AP_IL)
      {
DB    call print (ERROUT, "   AP_IL*n"s)
      group_data (3) += BIT5 + BIT9
      }
   when (AP_IS)
      {
DB    call print (ERROUT, "   AP_IS*n"s)
      group_data (3) += BIT5 + BIT10
      }
   when (AP_ILS)
      {
DB    call print (ERROUT, "   AP_ISL*n"s)
      group_data (3) += BIT5 + BIT9 + BIT10
      }

   PB_here += 2

   call group (group_data)
   return
   end
