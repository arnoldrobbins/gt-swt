# vcg_shift --- generate a variety of shift-related code sequences


# mul_a_by --- generate code to multiply A_REG by a constant, quickly

   ipointer function mul_a_by (constant)
   integer constant

   ipointer gen_shift, gen_generic, seq, gen_mr, lshift_a_by

   integer ad (ADDR_DESC_SIZE)

   select (constant)
      when (-1)
         return (gen_generic (TCA_INS))
      when (0)
         return (gen_generic (CRA_INS))
      when (1)
         return (0)
      when (2)
         return (lshift_a_by (1))
      when (4)
         return (lshift_a_by (2))
      when (8)
         return (lshift_a_by (3))
      when (16)
         return (lshift_a_by (4))
      when (32)
         return (lshift_a_by (5))
      when (64)
         return (lshift_a_by (6))
      when (128)
         return (lshift_a_by (7))
      when (256)
         return (lshift_a_by (8))
      when (512)
         return (lshift_a_by (9))
      when (1024)
         return (lshift_a_by (10))
      when (2048)
         return (lshift_a_by (11))
      when (4096)
         return (lshift_a_by (12))
      when (8192)
         return (lshift_a_by (13))
      when (16384)
         return (lshift_a_by (14))

   else {
      if (constant == :100000)
         return (lshift_a_by (15))
      else {
         AD_MODE (ad) = ILIT_AM
         AD_LIT1 (ad) = constant
         return (seq (gen_mr (MPY_INS, ad), gen_generic (XCB_INS)))
         }
      }

   end



# mul_l_by --- generate code to multiply L_REG by a constant, quickly

   ipointer function mul_l_by (amount)
   long_int amount

   ipointer lshift_l_by, gen_generic, seq, gen_mr

   integer ad (ADDR_DESC_SIZE), power
   long_int kluge
   equivalence (kluge, AD_LIT1 (ad))

#  long_int powers_of_two (32)
#  data powers_of_two / _
#     0000001, 0000002, 0000004, 0000008, 0000016, 0000032, 0000064,
#     0000128, 0000256, 0000512, 0001024, 0002048, 0004096, 0008192,
#     0016384, 0032768, 0065536, 131072, 262144, 524288,
#     1048576, 2097152, 4194304, 8388608, 16777216, 33554432,
#     67108864, 134217728, 268435456, 536870912, 1073741824,
#     :20000000000/

   include POWER_COM

   for (power = 0; power <= 31; power += 1)
      if (amount == powers_of_two (power + 1))
         return (lshift_l_by (power))

   if (amount == -1)
      return (gen_generic (TCL_INS))
   else if (amount == 0)
      return (gen_generic (CRL_INS))
   else {
      AD_MODE (ad) = LLIT_AM
      kluge = amount
      return (seq (gen_mr (MPL_INS, ad), gen_generic (ILE_INS)))
      }

   end



# div_a_by --- generate code to divide A_REG by a constant, quickly

   ipointer function div_a_by (amount, mode)
   integer amount
   integer mode      # INT or UNS

   ipointer rshift_a_by, seq, gen_generic, gen_mr

   integer ad (ADDR_DESC_SIZE)

   select (amount)
      when (-1)
         return (gen_generic (TCA_INS))
      when (0) {
         call warning ("divide by zero in input*n"p)
         return (0)
         }
      when (1)
         return (0)

   if (mode == UNS_MODE)      # we can try for a logical right shift
      select (amount)
         when (2)
            return (rshift_a_by (1))
         when (4)
            return (rshift_a_by (2))
         when (8)
            return (rshift_a_by (3))
         when (16)
            return (rshift_a_by (4))
         when (32 )
            return (rshift_a_by (5))
         when (64)
            return (rshift_a_by (6))
         when (128)
            return (rshift_a_by (7))
         when (256)
            return (rshift_a_by (8))
         when (512)
            return (rshift_a_by (9))
         when (1024)
            return (rshift_a_by (10))
         when (2048)
            return (rshift_a_by (11))
         when (4096)
            return (rshift_a_by (12))
         when (8192)
            return (rshift_a_by (13))
         when (16384)
            return (rshift_a_by (14))
         when (-32768)
            return (rshift_a_by (15))

   # Sigh.  Have to generate a division operation.
   AD_MODE (ad) = ILIT_AM
   AD_LIT1 (ad) = amount
   if (mode == INT_MODE)
      return (seq (gen_generic (PIDA_INS), gen_mr (DIV_INS, ad)))
   else
      return (seq (gen_generic (XCA_INS), gen_mr (DIV_INS, ad)))

   end



# div_l_by --- generate code to divide L_REG by a constant, quickly

   ipointer function div_l_by (amount, mode)
   long_int amount
   integer mode      # INT_MODE or UNS_MODE

   ipointer rshift_l_by, gen_generic, seq, gen_mr

   integer ad (ADDR_DESC_SIZE), power
   long_int kluge
   equivalence (kluge, AD_LIT1 (ad))

#  long_int powers_of_two (32)
#  data powers_of_two / _
#     0000001, 0000002, 0000004, 0000008, 0000016, 0000032, 0000064,
#     0000128, 0000256, 0000512, 0001024, 0002048, 0004096, 0008192,
#     0016384, 0032768, 0065536, 131072, 262144, 524288,
#     1048576, 2097152, 4194304, 8388608, 16777216, 33554432,
#     67108864, 134217728, 268435456, 536870912, 1073741824,
#     :20000000000/

   include POWER_COM

   if (mode == UNS_MODE)      # we can logical right shift for powers of 2
      for (power = 0; power <= 31; power += 1)
         if (amount == powers_of_two (power + 1))
            return (rshift_l_by (power))

   if (amount == -1)
      return (gen_generic (TCL_INS))
   else if (amount == 0) {
      call warning ("divide by zero in input*n"p)
      return (0)
      }
   else if (amount == 1)
      return (0)
   else {
      AD_MODE (ad) = LLIT_AM
      kluge = amount
      if (mode == INT_MODE)
         return (seq (gen_generic (PIDL_INS), gen_mr (DVL_INS, ad)))
      return (seq (gen_generic (ILE_INS), gen_generic (CRL_INS),
         gen_mr (DVL_INS, ad)))
      }

   end



# lshift_a_by --- generate code to shift A_REG left, quickly

   ipointer function lshift_a_by (amount)
   integer amount

   include VCG_COMMON

   ipointer gen_shift, gen_generic, seq

   if (amount > 15)
      return (gen_generic (CRA_INS))

   if (amount < 0) {
      call warning ("lshift_a_by: shift count < 0*n"p)
      return (0)
      }

   select (amount)
      when (0)
         return (0)
      when (1, 2, 3, 4, 5, 6, 7)
         return (gen_shift (ALL_INS, amount))
      when (8)
         return (gen_generic (ICR_INS))
      when (9, 10, 11, 12, 13, 14, 15)
         return (seq (gen_generic (ICR_INS),
            gen_shift (ALL_INS, amount - 8)))
   else
      call panic ("lshift_a_by: shift count > 15*n"p)

   end




# lshift_l_by --- generate code to shift L_REG left, quickly

   ipointer function lshift_l_by (amount)
   integer amount

   include VCG_COMMON

   ipointer gen_shift, gen_generic, seq

   if (amount > 31)
      return (gen_generic (CRL_INS))

   if (amount < 0) {
      call warning ("lshift_l_by: shift count < 0*n"p)
      return (0)
      }

   select (amount)
      when (0)
         return (0)
      when (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
         return (gen_shift (LLL_INS, amount))
      when (16)
         return (gen_generic (XCB_INS))
      when (17, 18, 19, 20, 21, 22, 23)
         return (seq (gen_generic (XCB_INS),
            gen_shift (ALL_INS, amount - 16)))
      when (24)
         return (seq (gen_generic (XCB_INS), gen_generic (ICR_INS)))
      when (25, 26, 27, 28, 29, 30, 31)
         return (seq (gen_generic (XCB_INS), gen_generic (ICR_INS),
            gen_shift (ALL_INS, amount - 24)))
   else
      call panic ("lshift_l_by: shift count > 31*n"p)

   end




# rshift_a_by --- generate code to shift A_REG right, quickly

   ipointer function rshift_a_by (amount)
   integer amount

   include VCG_COMMON

   ipointer gen_shift, gen_generic, seq

   if (amount > 15)
      return (gen_generic (CRA_INS))

   if (amount < 0) {
      call warning ("rshift_a_by: shift count < 0*n"p)
      return (0)
      }

   select (amount)
      when (0)
         return (0)
      when (1, 2, 3, 4, 5, 6, 7)
         return (gen_shift (ARL_INS, amount))
      when (8)
         return (gen_generic (ICL_INS))
      when (9, 10, 11, 12, 13, 14, 15)
         return (seq (gen_generic (ICL_INS),
            gen_shift (ARL_INS, amount - 8)))
   else
      call panic ("rshift_a_by: shift count > 15*n"p)

   end



# rshift_l_by --- generate code to shift A_REG right, quickly

   ipointer function rshift_l_by (amount)
   integer amount

   include VCG_COMMON

   ipointer gen_shift, gen_generic, seq

   if (amount > 31)
      return (gen_generic (CRL_INS))

   if (amount < 0) {
      call warning ("rshift_l_by: shift count < 0*n"p)
      return (0)
      }

   select (amount)
      when (0)
         return (0)
      when (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
         return (gen_shift (LRL_INS, amount))
      when (16)
         return (gen_generic (XCA_INS))
      when (17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31)
         return (seq (gen_generic (XCA_INS),
            gen_shift (LRL_INS, amount - 16)))
   else
      call panic ("rshift_l_by: shift count > 31*n"p)

   end



# arshift_a_by --- arithmetic right shift A_REG, quickly

   ipointer function arshift_a_by (amount)
   integer amount

   ipointer gen_shift

   if (amount < 0 || amount > 16) {
      call warning ("arshift_a_by: shift count out of range*n"p)
      return (0)
      }

   if (amount == 0)
      return (0)

   return (gen_shift (ARS_INS, amount))
   end



# arshift_l_by --- arithmetic right shift L_REG, quickly

   ipointer function arshift_l_by (amount)
   integer amount

   ipointer gen_shift

   if (amount < 0 || amount > 32) {
      call warning ("arshift_l_by: shift count out of range*n"p)
      return (0)
      }

   if (amount == 0)
      return (0)

   return (gen_shift (LRS_INS, amount))
   end
