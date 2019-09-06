# vcg_reach --- 'reach' context code generation



# The bit definitions for the base registers (PB_REG, LB_REG,
# SB_REG, and XB_REG) were changed to match the definitions
# that otg uses.  This shouldn't make any difference because
# the XB_REG is the only one ored into the register flag word:
# none of the other base registers can be loaded directly by
# the code being generated. This allows us to avoid extra code
# to switch back & forth between macro definitions for the base
# registers.


# reach --- reach operand, if possible; otherwise evaluate expression

   ipointer function reach (tree, regs, res, ad)
   tpointer tree
   regset regs
   integer res, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   ipointer reach_const, reach_object, reach_deref, reach_select,
      reach_index, load, reach_seq, reach_assign

   if (tree == 0) {
      reach = 0
      regs = 0
      res = IN_ACCUMULATOR
      AD_MODE (ad) = DIRECT_AM
      AD_BASE (ad) = PB_REG
      AD_OFFSET (ad) = 0
      return
      }

   select (Tmem (tree))
      when (CONST_OP)
         reach = reach_const (tree, regs, res, ad)
      when (OBJECT_OP)
         reach = reach_object (tree, regs, res, ad)
      when (DEREF_OP)
         reach = reach_deref (tree, regs, res, ad)
      when (SELECT_OP)
         reach = reach_select (tree, regs, res, ad)
      when (INDEX_OP)
         reach = reach_index (tree, regs, res, ad)
      when (SEQ_OP)
         reach = reach_seq (tree, regs, res, ad)
      when (ASSIGN_OP)
         reach = reach_assign (tree, regs, res, ad)
      # at present, no other constructs yield reachable operands
   else {
      reach = load (tree, regs)
      res = IN_ACCUMULATOR
      }

   return
   end



# reach_const --- reach a literal value

   ipointer function reach_const (tree, regs, res, ad)
   tpointer tree
   regset regs
   integer res, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   unsigned rsv_link

   ipointer seq, gen_data, gen_generic

   integer i

   regs = 0
   res = IN_MEMORY

   select (Tmem (tree + 1))      # the mode of the constant

      when (INT_MODE, UNS_MODE) {
         AD_MODE (ad) = ILIT_AM
         AD_LIT1 (ad) = Tmem (tree + 3)
         reach_const = 0
         }

      when (LONG_INT_MODE, LONG_UNS_MODE) {
         AD_MODE (ad) = LLIT_AM
         AD_LIT1 (ad) = Tmem (tree + 3)
         AD_LIT2 (ad) = Tmem (tree + 4)
         reach_const = 0
         }

      when (FLOAT_MODE) {
         AD_MODE (ad) = FLIT_AM
         AD_LIT1 (ad) = Tmem (tree + 3)
         AD_LIT2 (ad) = Tmem (tree + 4)
         reach_const = 0
         }

      when (LONG_FLOAT_MODE) {
         AD_MODE (ad) = DLIT_AM
         AD_LIT1 (ad) = Tmem (tree + 3)
         AD_LIT2 (ad) = Tmem (tree + 4)
         AD_LIT3 (ad) = Tmem (tree + 5)
         AD_LIT4 (ad) = Tmem (tree + 6)
         reach_const = 0
         }

      when (STOWED_MODE) {
         AD_MODE (ad) = DIRECT_AM
         AD_BASE (ad) = LB_REG
         AD_OFFSET (ad) = rsv_link (Tmem (tree + 2))
         reach_const = gen_generic (LINK_INS)
         for (i = 1; i <= Tmem (tree + 2); i += 1)
            reach_const = seq (reach_const,
               gen_data (Tmem (tree + 2 + i)))
         reach_const = seq (reach_const, gen_generic (PROC_INS))
         }

   else
      call panic ("reach_const: bad constant mode (*i)*n"p,
         Tmem (tree + 1))

   return
   end



# reach_object --- reach an addressable object

   ipointer function reach_object (tree, regs, res, ad)
   tpointer tree
   regset regs
   integer res, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   integer lookup_obj

   regs = 0
   res = IN_MEMORY

   if (lookup_obj (Tmem (tree + 2), ad) == NO) {
#      call warning ("reference to undefined object *i*n"p, Tmem (tree + 2))
#      AD_MODE (ad) = DIRECT_AM
#      AD_BASE (ad) = PB_REG
#      AD_OFFSET (ad) = 0
      AD_MODE (ad) = LABELED_AM      # assume it's a local procedure
      AD_LABEL (ad) = Tmem (tree + 2)     # address the object
      }

   return (0)
   end



# reach_deref --- reach object referenced by a pointer

   ipointer function reach_deref (tree, regs, res, ad)
   tpointer tree
   regset regs
   integer res, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   ipointer pr
   ipointer reach, seq, gen_mr

   regset pregs

   integer pres, pad (ADDR_DESC_SIZE), tad (ADDR_DESC_SIZE)

   if (Tmem (Tmem (tree + 2)) == REFTO_OP)
      return (reach (Tmem (Tmem (tree + 2) + 2), regs, res, ad))

   pr = reach (Tmem (tree + 2), pregs, pres, pad)

   if (pres == IN_ACCUMULATOR) {
      AD_MODE (tad) = DIRECT_AM
      AD_BASE (tad) = PB_REG
      AD_OFFSET (tad) = :17
      reach_deref = seq (pr, gen_mr (STLR_INS, tad))  # STLR to XB reg
      AD_MODE (ad) = DIRECT_AM
      AD_BASE (ad) = XB_REG
      AD_OFFSET (ad) = 0
      regs = or (XB_REG, pregs)
      }

   else        # pointer is in memory and is addressable
      if (AD_MODE (pad) == DIRECT_AM) {         # pointer at base%+offset
         AD_MODE (ad) = INDIRECT_AM
         AD_BASE (ad) = AD_BASE (pad)
         AD_OFFSET (ad) = AD_OFFSET (pad)
         regs = pregs
         reach_deref = pr
         }
      else if (AD_MODE (pad) == INDEXED_AM) {   # pointer at base%+offset,X
         AD_MODE (ad) = PREX_INDIRECT_AM
         AD_BASE (ad) = AD_BASE (pad)
         AD_OFFSET (ad) = AD_OFFSET (pad)
         regs = pregs
         reach_deref = pr
         }
      else {                                    # pointer somewhere else
         reach_deref = seq (pr, gen_mr (EAXB_INS, pad))
         AD_MODE (ad) = INDIRECT_AM
         AD_BASE (ad) = XB_REG
         AD_OFFSET (ad) = 0
         regs = or (XB_REG, pregs)
         }

   res = IN_MEMORY
   return
   end



# reach_select --- reach operand addressed by a structure field selector

   ipointer function reach_select (tree, regs, res, ad)
   tpointer tree
   regset regs
   integer res, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   ipointer br
   ipointer reach, seq, gen_mr

   integer bad (ADDR_DESC_SIZE), fad (ADDR_DESC_SIZE), bres

   regset bregs

   br = reach (Tmem (tree + 3), bregs, bres, bad)

   if (bres == IN_ACCUMULATOR) {
      AD_MODE (fad) = DIRECT_AM
      AD_BASE (fad) = PB_REG
      AD_OFFSET (fad) = :17
      reach_select = seq (br, gen_mr (STLR_INS, fad)) # move L to XB
      regs = or (XB_REG, bregs)
      AD_MODE (ad) = DIRECT_AM
      AD_BASE (ad) = XB_REG
      AD_OFFSET (ad) = Tmem (tree + 2)
      }

   else {      # base of structure is addressable
      if (Tmem (tree + 2) == 0) {      # field offset is zero!
         regs = bregs
         res = IN_MEMORY
         call ad_copy (bad, ad)
         return (br)
         }
      if (AD_MODE (bad) == DIRECT_AM || AD_MODE (bad) == INDEXED_AM) {
         reach_select = br
         regs = bregs
         AD_MODE (ad) = AD_MODE (bad)
         AD_BASE (ad) = AD_BASE (bad)
         AD_OFFSET (ad) = AD_OFFSET (bad) + Tmem (tree + 2)
         }
      else if (AD_MODE (bad) == INDIRECT_AM) {
         AD_MODE (fad) = ILIT_AM
         AD_LIT1 (fad) = Tmem (tree + 2)
         reach_select = seq (br, gen_mr (LDX_INS, fad))  # put field offset in X
         regs = or (X_REG, bregs)
         AD_MODE (ad) = INDIRECT_POSTX_AM
         AD_BASE (ad) = AD_BASE (bad)
         AD_OFFSET (ad) = AD_OFFSET (bad)
         }
      else {
         reach_select = seq (br, gen_mr (EAXB_INS, bad)) # base adrs in XB
         regs = or (XB_REG, bregs)
         AD_MODE (ad) = DIRECT_AM
         AD_BASE (ad) = XB_REG
         AD_OFFSET (ad) = Tmem (tree + 2)
         }
      }

   res = IN_MEMORY
   return
   end



# reach_index --- reach addressable array element

   ipointer function reach_index (tree, regs, res, ad)
   tpointer tree
   regset regs
   integer res, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   regset aregs, iregs

   integer ares, ires, aad (ADDR_DESC_SIZE), iad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE)

   ipointer ar, ir
   ipointer reach, seq, gen_mr, gen_generic, mul_a_by

   procedure pathological forward

   res = IN_MEMORY   # (it has to, no matter what happens)

   ar = reach (Tmem (tree + 2), aregs, ares, aad)
   ir = reach (Tmem (tree + 3), iregs, ires, iad)

   # Generate code needed to get the index in the X register:

   if (ires == IN_ACCUMULATOR)
      ir = seq (ir, mul_a_by (Tmem (tree + 4)), gen_generic (TAX_INS))
   else {
      # case 1:  constant subscript
      if (AD_MODE (iad) == ILIT_AM) {
         if (AD_LIT1 (iad) == 0) {
            call ad_copy (aad, ad)
            regs = aregs
            return (ar)
            }
         if (AD_MODE (aad) == DIRECT_AM || AD_MODE (aad) == INDEXED_AM) {
            AD_MODE (ad) = AD_MODE (aad)
            AD_BASE (ad) = AD_BASE (aad)
            AD_OFFSET (ad) = AD_OFFSET (aad) + _
               AD_LIT1 (iad) * Tmem (tree + 4)
            regs = aregs
            return (ar)
            }
         AD_LIT1 (iad) *= Tmem (tree + 4)
         ir = gen_mr (LDX_INS, iad)
         }

      # case 2:  simple subscript hopefully with element size = 1, 2, or 4
      #     (allows use of the LDX/FLX/DFLX instructions)
      else if (AD_MODE (iad) == DIRECT_AM || AD_MODE (iad) == INDIRECT_AM) {
         if (Tmem (tree + 4) == 1)
            ir = seq (ir, gen_mr (LDX_INS, iad))
         else if (Tmem (tree + 4) == 2)
            ir = seq (ir, gen_mr (FLX_INS, iad))
         else if (Tmem (tree + 4) == 4)
            ir = seq (ir, gen_mr (DFLX_INS, iad))
         else {
            ir = seq (ir, gen_mr (LDA_INS, iad),
               mul_a_by (Tmem (tree + 4)), gen_generic (TAX_INS))
            iregs |= A_REG
            }
         }

      # case 3:  non-simple subscript
      else {
         ir = seq (ir, gen_mr (LDA_INS, iad), mul_a_by (Tmem (tree + 4)),
            gen_generic (TAX_INS))
         iregs |= A_REG
         }
      }

   # at this point, the instruction sequence in 'ir' will place the
   # offset of the desired element in X with a minimum of fuss.

   # we now attempt to wrestle the array base address into some
   # convenient place so that indexed addressing can be used.

   if (ares == IN_MEMORY) {

      if (AD_MODE (aad) == DIRECT_AM) {
         if (AD_BASE (aad) == XB_REG && and (iregs, XB_REG) ~= 0)
            # something already in XB
            pathological
         else {
            reach_index = seq (ar, ir)
            regs = or (X_REG, or (aregs, iregs))
            AD_MODE (ad) = INDEXED_AM
            AD_BASE (ad) = AD_BASE (aad)
            AD_OFFSET (ad) = AD_OFFSET (aad)
            }
         }

      else if (AD_MODE (aad) == INDIRECT_AM) {
         if (AD_BASE (aad) == XB_REG && and (iregs, XB_REG) ~= 0)
            # something already in XB
            pathological
         else {
            reach_index = seq (ar, ir)
            regs = or (X_REG, or (aregs, iregs))
            AD_MODE (ad) = INDIRECT_POSTX_AM
            AD_BASE (ad) = AD_BASE (aad)
            AD_OFFSET (ad) = AD_OFFSET (aad)
            }
         }

      else {   # array base address uses indexing or other obscenities
         if (and (iregs, XB_REG) ~= 0)
            pathological
         else {
            reach_index = seq (ar, gen_mr (EAXB_INS, aad), ir)
            regs = or (X_REG, or (XB_REG, or (aregs, iregs)))
            AD_MODE (ad) = INDEXED_AM
            AD_BASE (ad) = XB_REG
            AD_OFFSET (ad) = 0
            }
         }

      }

   else {   # array base address is a value residing in the L register

      if (and (iregs, XB_REG) == 0) {
         AD_MODE (tad) = DIRECT_AM
         AD_BASE (tad) = PB_REG
         AD_OFFSET (tad) = :17
         reach_index = seq (ar, gen_mr (STLR_INS, tad), ir)
         regs = or (X_REG, or (XB_REG, or (aregs, iregs)))
         AD_MODE (ad) = INDEXED_AM
         AD_BASE (ad) = XB_REG
         AD_OFFSET (ad) = 0
         }

      else {      # everybody needs to use XB...sigh...
         call alloc_temp (2, tad)
         reach_index = seq (ar, gen_mr (STL_INS, tad), ir)
         AD_MODE (tad) = INDIRECT_POSTX_AM
         reach_index = seq (reach_index, gen_mr (EAXB_INS, tad))
         call free_temp (tad)
         regs = or (X_REG, or (XB_REG, or (aregs, iregs)))
         AD_MODE (ad) = DIRECT_AM
         AD_BASE (ad) = XB_REG
         AD_OFFSET (ad) = 0
         # Note this can lead to suboptimal code sequences of the form
         # STL temp; EAXB temp,*X; FST XB%+0
         # since higher-level routines can't be allowed to know of the
         # existence of the temporary used here...
         }
      }

   return


   # pathological --- array base reachable using XB; index also needs XB

   procedure pathological {
      call alloc_temp (2, tad)
      reach_index = seq (ar, gen_mr (EAL_INS, aad),
         gen_mr (STL_INS, tad), ir)
      AD_MODE (tad) = INDIRECT_POSTX_AM
      reach_index = seq (reach_index, gen_mr (EAXB_INS, tad))
      call free_temp (tad)
      regs = or (X_REG, or (XB_REG, or (aregs, iregs)))
      AD_MODE (ad) = DIRECT_AM
      AD_BASE (ad) = XB_REG
      AD_OFFSET (ad) = 0
      }

   end



# reach_seq --- reach RHS of a sequence operation

   ipointer function reach_seq (tree, regs, res, ad)
   tpointer tree
   regset regs
   integer res, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   regset lregs

   ipointer void, reach, seq

   if (Tmem (tree + 2) == 0)
      reach_seq = reach (Tmem (tree + 1), regs, res, ad)
   else {
      reach_seq = seq (void (Tmem (tree + 1), lregs),
         reach (Tmem (tree + 2), regs, res, ad))
      regs |= lregs
      }

   return
   end



# reach_assign --- perform assignment, yield lhs for structs, rhs for others

   ipointer function reach_assign (expr, regs, res, ad)
   tpointer expr
   regset regs
   integer res, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   logical safe

   regset lregs, rregs, opreg

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opsize, l_is_temp, r_is_temp,
      l_temp_ad (ADDR_DESC_SIZE), r_temp_ad (ADDR_DESC_SIZE)

   ipointer l, r
   ipointer seq, ld, st, reach, load, st_field, gen_mr, gen_copy

   string mesg "reach_assign: "

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   if (Tmem (Tmem (expr + 2)) == FIELD_OP) {    # sigh...case bit fields
      reach_assign = load (Tmem (expr + 3), rregs)
      select (Tmem (expr + 1))
         when (INT_MODE, UNS_MODE) {
            call alloc_temp (1, tad)
            reach_assign = seq (reach_assign,
               gen_mr (STA_INS, tad),
               st_field (Tmem (expr + 2), lregs),
               gen_mr (LDA_INS, tad))
            call free_temp (tad)
            regs = or (lregs, rregs)
            res = IN_ACCUMULATOR
            return
            }
         when (LONG_INT_MODE, LONG_UNS_MODE) {
            call alloc_temp (2, tad)
            reach_assign = seq (reach_assign,
               gen_mr (STL_INS, tad),
               st_field (Tmem (expr + 2), lregs),
               gen_mr (LDL_INS, tad))
            call free_temp (tad)
            regs = or (lregs, rregs)
            res = IN_ACCUMULATOR
            return
            }
      else {
         call warning ("*sbad data mode in bit field *i*n"p, mesg,
            Tmem (expr + 1))
         return (0)
         }
      }

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opsize = 1
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opsize = 2
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         opsize = 2
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         opsize = 4
         }
      when (STOWED_MODE) {    # sigh...handle structure assignments
         select (Tmem (expr + 4))
            when (1) {
               opreg = A_REG
               opsize = 1
               }
            when (2) {
               opreg = L_REG
               opsize = 2
               }
            when (4) {
               opreg = LF_REG
               opsize = 4
               }
         else {
            call alloc_temp (2, l_temp_ad)
            call alloc_temp (2, r_temp_ad)

            l = reach (Tmem (expr + 2), lregs, lres, lad)
            if (lres ~= IN_MEMORY) {
               call warning ("*sleft struct op not lvalue*n"p, mesg)
               return (0)
               }

            select (AD_MODE (lad))
               when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM, LABELED_AM)
                  l_is_temp = NO
               when (DIRECT_AM, INDIRECT_AM)
                  if (AD_BASE (lad) == SB_REG || AD_BASE (lad) == LB_REG)
                     l_is_temp = NO
                  else
                     l_is_temp = YES
               when (INDEXED_AM, INDIRECT_POSTX_AM, PREX_INDIRECT_AM)
                  l_is_temp = YES
            ifany {
               if (l_is_temp == YES) {
                  l = seq (l, gen_mr (EAL_INS, lad))
                  call ad_copy (l_temp_ad, lad)
                  l = seq (l, gen_mr (STL_INS, lad))
                  AD_MODE (lad) = INDIRECT_AM
                  }
               }
            else {
               call warning ("*sbad left op addr mode *i*n"p, mesg,
                  AD_MODE (lad))
               return (0)
               }

            r = reach (Tmem (expr + 3), rregs, rres, rad)
            if (rres ~= IN_MEMORY) {
               call warning ("*sright struct op not lvalue*n"p, mesg)
               return (0)
               }

            select (AD_MODE (rad))
               when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM, LABELED_AM)
                  r_is_temp = NO
               when (DIRECT_AM, INDIRECT_AM)
                  if (AD_BASE (lad) == SB_REG || AD_BASE (lad) == LB_REG)
                     r_is_temp = NO
                  else
                     r_is_temp = YES
               when (INDEXED_AM, INDIRECT_POSTX_AM, PREX_INDIRECT_AM)
                  r_is_temp = YES
            ifany {
               if (r_is_temp == YES) {
                  r = seq (r, gen_mr (EAL_INS, rad))
                  call ad_copy (r_temp_ad, rad)
                  r = seq (r, gen_mr (STL_INS, rad))
                  AD_MODE (rad) = INDIRECT_AM
                  }
               }
            else {
               call warning ("*sbad right op addr mode *i*n"p, mesg,
                  AD_MODE (rad))
               return (0)
               }

            regs = ALL_REGS
            reach_assign = seq (l,
               r,
               gen_copy (rad, lad, Tmem (expr + 4)))

            if (r_is_temp == YES)
               call free_temp (r_temp_ad)
            # Don't free l_temp_ad; it might be needed later.

            call ad_copy (lad, ad)
            res = IN_MEMORY
            return
            }
         }

   else
      call panic ("*sbad data mode *i*n"p, mesg, Tmem (expr + 1))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select
      when (safe (opreg, lregs) && safe (opreg, rregs))
         p1
      when (safe (opreg, lregs) && ~safe (opreg, rregs))
         p1
      when (~safe (opreg, lregs) && safe (opreg, rregs))
         if (safe (lregs, rregs))
            p2
         else
            p3
   else
      p3

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   res = IN_ACCUMULATOR
   return


   procedure p1 {
      reach_assign = seq (r, ld (opreg, rres, rad), l, st (opreg, lad))
      }


   procedure p2 {
      reach_assign = seq (l, r, ld (opreg, rres, rad), st (opreg, lad))
      }


   procedure p3 {
      reach_assign = seq (r, ld (opreg, rres, rad))
      reach_assign = seq (reach_assign, st (opreg, tad), l,
         ld (opreg, IN_MEMORY, tad), st (opreg, lad))
      }


   end
