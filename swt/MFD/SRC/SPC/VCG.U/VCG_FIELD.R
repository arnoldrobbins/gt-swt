# vcg_field --- procedures for bit-field manipulation



# ld_field --- fetch contents of field, place in proper accumulator

   ipointer function ld_field (fld, regs)
   tpointer fld
   regset regs

   include VCG_COMMON

   integer length, offset, bad (ADDR_DESC_SIZE), res, amask

   long_int lmask

   ipointer c
   ipointer reach, seq, gen_mr, rshift_l_by, lshift_l_by, rshift_a_by,
      and_a_with, and_l_with

   length = Tmem (fld + 3)
   offset = Tmem (fld + 2)    # offset is no. of bits from MSB of word

   c = reach (Tmem (fld + 4), regs, res, bad)
   if (res ~= IN_MEMORY) {
      call warning ("ld_field: bit field base must be in memory*n"p)
      return (0)
      }

   if (offset + length > 16) {      # field crosses a word boundary
      c = seq (c, gen_mr (LDL_INS, bad))

      if (length > 16) {            # field value must go in L register
         call l_field_mask (length, 32 - length, lmask)
         c = seq (c,
            rshift_l_by (32 - (offset + length)))
         if (offset ~= 0)
            c = seq (c,
               and_l_with (lmask))
         }

      else {                        # field value must go in A register
         call a_field_mask (length, 16 - length, amask)
         c = seq (c,
            lshift_l_by (offset - (16 - length)))
         if (offset ~= 0)
            c = seq (c,
               and_a_with (amask))
         }

      regs |= L_REG
      }

   else {                           # field is entirely in one word
      call a_field_mask (length, 16 - length, amask)
      c = seq (c,
         gen_mr (LDA_INS, bad),
         rshift_a_by (16 - (offset + length)))
      if (offset ~= 0)
         c = seq (c,
            and_a_with (amask))
      regs |= A_REG
      }

   return (c)
   end



# st_field --- store contents of proper accumulator in bit field

   ipointer function st_field (fld, regs)
   tpointer fld
   regset regs

   include VCG_COMMON

   ipointer c
   ipointer gen_mr, seq, reach, rshift_l_by, lshift_l_by,
      lshift_a_by, and_a_with, and_l_with

   integer length, offset
   integer tad (ADDR_DESC_SIZE), bad (ADDR_DESC_SIZE), res, amask

   long_int lmask

   string mesg "st_field: field base addr not lvalue"

   length = Tmem (fld + 3)
   offset = Tmem (fld + 2)

   if (offset + length > 16) {      # field overlaps a word boundary

      if (length <= 16)             # move contents from A into L
         c = rshift_l_by (offset + length - 16)
      else                          # adjust contents in L
         c = lshift_l_by (32 - (offset + length))

      call l_field_mask (length, offset, lmask)
      if (offset ~= 0)
         c = seq (c,
            and_l_with (lmask))
      call alloc_temp (2, tad)
      c = seq (c,
         gen_mr (STL_INS, tad),
         reach (Tmem (fld + 4), regs, res, bad))

      if (res ~= IN_MEMORY) {
         call warning ("*s*n"p, mesg)
         return (0)
         }

      c = seq (c,
         gen_mr (LDL_INS, bad),
         and_l_with (not (lmask)),
         gen_mr (ERL_INS, tad),
         gen_mr (STL_INS, bad))
      call free_temp (tad)

      regs |= L_REG
      }

   else {            # field does not overlap boundary; length must be <= 16
      c = lshift_a_by (16 - (offset + length))
      call a_field_mask (length, offset, amask)
      call alloc_temp (1, tad)

      if (offset ~= 0)
         c = seq (c,
            and_a_with (amask))
      c = seq (c,
         gen_mr (STA_INS, tad),
         reach (Tmem (fld + 4), regs, res, bad))

      if (res ~= IN_MEMORY) {
         call warning ("*s*n"p, mesg)
         return (0)
         }

      c = seq (c,
         gen_mr (LDA_INS, bad),
         and_a_with (not (amask)),
         gen_mr (ERA_INS, tad),
         gen_mr (STA_INS, bad))
      call free_temp (tad)

      regs |= A_REG
      }

   return (c)
   end



# a_field_mask --- get mask for field with given offset and length <= 16

   subroutine a_field_mask (length, offset, amask)
   integer length, offset, amask

   integer masks (16)
   data masks / _
      :100000, :140000, :160000, :170000,
      :174000, :176000, :177000, :177400,
      :177600, :177700, :177740, :177760,
      :177770, :177774, :177776, :177777 /

   string mesg "a_field_mask: bad bit field "

   if (length < 1 || length > 16)
      call panic ("*slength *i*n"p, mesg, length)
   if (offset < 0 || offset > 15)
      call panic ("*soffset *i*n"p, mesg, offset)

   amask = rs (masks (length), offset)

   return
   end



# l_field_mask --- get mask for bit field with given offset and length > 16

   subroutine l_field_mask (length, offset, lmask)
   integer length, offset
   long_int lmask

   long_int masks (32)
   data masks / _
      :20000000000, :30000000000, :34000000000, :36000000000,
      :37000000000, :37400000000, :37600000000, :37700000000,
      :37740000000, :37760000000, :37770000000, :37774000000,
      :37776000000, :37777000000, :37777400000, :37777600000,
      :37777700000, :37777740000, :37777760000, :37777770000,
      :37777774000, :37777776000, :37777777000, :37777777400,
      :37777777600, :37777777700, :37777777740, :37777777760,
      :37777777770, :37777777774, :37777777776, :37777777777 /

   string mesg "l_field_mask: bad bit field "

   if (length < 1 || length > 32)
      call panic ("*slength *i*n"p, mesg, length)
   if (offset < 0 || offset > 31)
      call panic ("*soffset *i*n"p, mesg, offset)

   lmask = rs (masks (length), offset)

   return
   end



# and_a_with --- generate code to AND A_REG with mask, quickly

   ipointer function and_a_with (mask)
   integer mask

   ipointer gen_mr, gen_generic

   integer ad (ADDR_DESC_SIZE)

   select (mask)
      when (0)
         return (gen_generic (CRA_INS))
      when (:000377)
         return (gen_generic (CAL_INS))
      when (:177400)
         return (gen_generic (CAR_INS))
      when (:177777)
         return (0)
   else {
      AD_MODE (ad) = ILIT_AM
      AD_LIT1 (ad) = mask
      return (gen_mr (ANA_INS, ad))
      }

   end



# and_l_with --- generate code to and L_REG with a mask, quickly

   ipointer function and_l_with (mask)
   long_int mask

   ipointer gen_mr, gen_generic, seq

   integer ad (ADDR_DESC_SIZE)

   select
      when (mask == :00000177777)
         return (gen_generic (CRA_INS))
      when (mask == :37777600000)
         return (gen_generic (CRB_INS))
      when (mask == 0)
         return (gen_generic (CRL_INS))
      when (mask == :37777777777)
         return (0)
      when (mask == :00077777777)
         return (gen_generic (CAL_INS))
      when (mask == :37700177777)
         return (gen_generic (CAR_INS))
      when (rt (mask, 16) == :00000177777) {
         AD_MODE (ad) = ILIT_AM
         AD_LIT1 (ad) = rs (mask, 16)
         return (gen_mr (ANA_INS, ad))
         }
      when (rt (mask, 16) == 0) {
         AD_MODE (ad) = ILIT_AM
         AD_LIT1 (ad) = rs (mask, 16)
         return (seq (gen_generic (CRB_INS), gen_mr (ANA_INS, ad)))
         }

   AD_MODE (ad) = LLIT_AM
   AD_LIT1 (ad) = rs (mask, 16)
   AD_LIT2 (ad) = rt (mask, 16)
   return (gen_mr (ANL_INS, ad))

   end



# load_field_asg_op --- load assignment operator with field LHS

   ipointer function load_field_asg_op (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer c
   ipointer reach, load, gen_mr, seq

   tpointer field, base, asg_node, op_node, rev_node, obj_node
   tpointer talloc

   regset fregs

   integer fres, bad (ADDR_DESC_SIZE), tad (ADDR_DESC_SIZE), obj_id,
      op
   integer mklabel

   string mesg "load_field_asg_op: "

   field = Tmem (expr + 2)
   c = reach (Tmem (field + 4), fregs, fres, bad)
   if (fres ~= IN_MEMORY) {
      call warning ("*sfield base addr must be lvalue*n"p, mesg)
      return (0)
      }

   obj_id = 0
   if (c ~= 0) {
      call alloc_temp (2, tad)
      obj_id = mklabel (1)
      call enter_obj (obj_id, tad)
      c = seq (c, gen_mr (EAL_INS, bad), gen_mr (STL_INS, tad))
      base = talloc (3)
      Tmem (base) = DEREF_OP
      Tmem (base + 1) = STOWED_MODE
      obj_node = talloc (3)
      Tmem (obj_node) = OBJECT_OP
      Tmem (obj_node + 1) = LONG_UNS_MODE
      Tmem (obj_node + 2) = obj_id
      Tmem (base + 2) = obj_node
      Tmem (field + 4) = base
      }

   asg_node = talloc (5)
   Tmem (asg_node) = ASSIGN_OP
   Tmem (asg_node + 1) = Tmem (expr + 1)  # same assignment mode
   Tmem (asg_node + 2) = field

   op_node = talloc (4)
   select (Tmem (expr))
      when (ADDAA_OP, POSTINC_OP, PREINC_OP)
         op = ADD_OP
      when (ANDAA_OP)
         op = AND_OP
      when (DIVAA_OP)
         op = DIV_OP
      when (LSHIFTAA_OP)
         op = LSHIFT_OP
      when (MULAA_OP)
         op = MUL_OP
      when (ORAA_OP)
         op = OR_OP
      when (REMAA_OP)
         op = REM_OP
      when (RSHIFTAA_OP)
         op = RSHIFT_OP
      when (SUBAA_OP, POSTDEC_OP, PREDEC_OP)
         op = SUB_OP
      when (XORAA_OP)
         op = XOR_OP
   else {
      call warning ("*sbad field assg op *i*n"p, mesg, Tmem (expr))
      return (0)
      }
   Tmem (op_node) = op
   Tmem (op_node + 1) = Tmem (expr + 1)
   Tmem (op_node + 2) = field
   Tmem (op_node + 3) = Tmem (expr + 3)
   Tmem (asg_node + 3) = op_node
   Tmem (asg_node + 4) = 0    # length ignored --- left operand is a field

   if (Tmem (expr) == POSTINC_OP || Tmem (expr) == POSTDEC_OP) {
      rev_node = talloc (4)
      if (Tmem (expr) == POSTINC_OP)
         Tmem (rev_node) = SUB_OP
      else
         Tmem (rev_node) = ADD_OP
      Tmem (rev_node + 1) = Tmem (expr + 1)
      Tmem (rev_node + 2) = asg_node
      Tmem (rev_node + 3) = Tmem (expr + 3)
      c = seq (c, load (rev_node, regs))
      }
   else
      c = seq (c, load (asg_node, regs))

   regs |= fregs

   if (obj_id ~= 0) {
      call free_temp (tad)
      call delete_obj (obj_id)
      }

   return (c)
   end



# void_field_asg_op --- void assignment operator with field LHS

   ipointer function void_field_asg_op (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer c
   ipointer reach, load, gen_mr, seq, void

   tpointer field, base, asg_node, op_node, rev_node, obj_node
   tpointer talloc

   regset fregs

   integer fres, bad (ADDR_DESC_SIZE), tad (ADDR_DESC_SIZE), obj_id,
      op

   string mesg "void_field_asg_op: "

   field = Tmem (expr + 2)
   c = reach (Tmem (field + 4), fregs, fres, bad)
   if (fres ~= IN_MEMORY) {
      call warning ("*sfield base addr must be lvalue*n"p, mesg)
      return (0)
      }

   obj_id = 0
   if (c ~= 0) {
      call alloc_temp (2, tad)
      obj_id = mklabel (1)
      call enter_obj (obj_id, tad)
      c = seq (c, gen_mr (EAL_INS, bad), gen_mr (STL_INS, tad))
      base = talloc (3)
      Tmem (base) = DEREF_OP
      Tmem (base + 1) = STOWED_MODE
      obj_node = talloc (3)
      Tmem (obj_node) = OBJECT_OP
      Tmem (obj_node + 1) = LONG_UNS_MODE
      Tmem (obj_node + 2) = obj_id
      Tmem (base + 2) = obj_node
      Tmem (field + 4) = base
      }

   asg_node = talloc (5)
   Tmem (asg_node) = ASSIGN_OP
   Tmem (asg_node + 1) = Tmem (expr + 1)  # same assignment mode
   Tmem (asg_node + 2) = field

   op_node = talloc (4)
   select (Tmem (expr))
      when (ADDAA_OP, POSTINC_OP, PREINC_OP)
         op = ADD_OP
      when (ANDAA_OP)
         op = AND_OP
      when (DIVAA_OP)
         op = DIV_OP
      when (LSHIFTAA_OP)
         op = LSHIFT_OP
      when (MULAA_OP)
         op = MUL_OP
      when (ORAA_OP)
         op = OR_OP
      when (REMAA_OP)
         op = REM_OP
      when (RSHIFTAA_OP)
         op = RSHIFT_OP
      when (SUBAA_OP, POSTDEC_OP, PREDEC_OP)
         op = SUB_OP
      when (XORAA_OP)
         op = XOR_OP
   else {
      call warning ("*sbad field assg op *i*n"p, mesg, Tmem (expr))
      return (0)
      }
   Tmem (op_node) = op
   Tmem (op_node + 1) = Tmem (expr + 1)
   Tmem (op_node + 2) = field
   Tmem (op_node + 3) = Tmem (expr + 3)
   Tmem (asg_node + 3) = op_node
   Tmem (asg_node + 4) = 0    # value ignored --- left operand is a field

   c = seq (c, void (asg_node, regs))
   regs |= fregs

   if (obj_id ~= 0) {
      call free_temp (tad)
      call delete_obj (obj_id)
      }

   return (c)
   end



# fl_field --- evaluate bit field in flow context, elide shifts

   ipointer function fl_field (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   integer length, offset, bad (ADDR_DESC_SIZE), res, amask

   long_int lmask

   ipointer c
   ipointer reach, seq, gen_mr, and_a_with, and_l_with, gen_branch

   length = Tmem (expr + 3)
   offset = Tmem (expr + 2)

   c = reach (Tmem (expr + 4), regs, res, bad)
   if (res ~= IN_MEMORY) {
      call warning ("fl_field: bit field base not addressable*n"p)
      return (0)
      }

   if (offset + length > 16) {      # crosses a word boundary...
      c = seq (c, gen_mr (LDL_INS, bad))
      call l_field_mask (length, offset, lmask)
      c = seq (c, and_l_with (lmask))
      if (cond)
         c = seq (c, gen_branch (BLNE_INS, label))
      else
         c = seq (c, gen_branch (BLEQ_INS, label))
      regs |= L_REG
      }

   else {                           # field is all in one word
      c = seq (c, gen_mr (LDA_INS, bad))
      call a_field_mask (length, offset, amask)
      c = seq (c, and_a_with (amask))
      if (cond)
         c = seq (c, gen_branch (BNE_INS, label))
      else
         c = seq (c, gen_branch (BEQ_INS, label))
      regs |= A_REG
      }

   return (c)
   end
