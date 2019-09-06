# vcg_load3 --- load expression values for code generator (part 3)


# load_lshiftaa --- evaluate left shift, assign result to left operand

   ipointer function load_lshiftaa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON
   include RTR_COMMON

   ipointer l, r
   ipointer gen_generic, gen_mr, reach, ld, st, seq,
      lshift_a_by, lshift_l_by, load_field_asg_op,
      load_rtr_ip

   integer tad (ADDR_DESC_SIZE), cad (ADDR_DESC_SIZE),
      rad (ADDR_DESC_SIZE), opreg, res, rres,
      lad (ADDR_DESC_SIZE), lookup_obj, junk, shift

   unsigned shift_id

   tpointer left_op, right_op

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   if (Tmem (left_op) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   regset rregs

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, res, tad)
            regs |= A_REG
            return (seq (l, ld (A_REG, res, tad),
               lshift_a_by (Tmem (right_op + 3)),
               st (A_REG, tad)))
            }
         opreg = A_REG
         shift_id = lf_shft_int                 # object id
         shift = C$LSHFS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, res, tad)
            regs |= L_REG
            return (seq (l, ld (L_REG, res, tad),
               lshift_l_by (Tmem (right_op + 3)),
               st (L_REG, tad)))
            }
         opreg = L_REG
         shift_id = lf_shft_long                 # object id
         shift = C$LSHFL
         }
   else
      call panic ("load_lshiftaa: bad data mode *i*n"p, Tmem (expr + 1))

   r = load_rtr_ip (shift, shift_id)

   # load shift count into X register
   r = seq (r, reach (Tmem (expr + 3), rregs, rres, rad))
   r = seq (r, ld (A_REG, rres,rad), gen_generic (TAX_INS))

DB call print (ERROUT, "load_lshiftaa:*n"s)
   junk = lookup_obj (shift_id, tad)

   # get the operand to be shifted
   l = reach (Tmem (expr + 2), regs, res, lad)
   regs |= rregs
   l = seq (l, ld (opreg, res, lad), gen_mr (JSXB_INS, tad),
      st (opreg, lad))

   regs |= A_REG
   load_lshiftaa = seq (r, l)

   return
   end



# load_lshift --- evaluate left shift, result in accumulator

   ipointer function load_lshift (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON
   include RTR_COMMON

   ipointer l, r
   ipointer gen_generic, gen_mr, reach, ld, st, seq,
      lshift_a_by, load, lshift_l_by, load_rtr_ip

   integer tad (ADDR_DESC_SIZE), cad (ADDR_DESC_SIZE),
      rad (ADDR_DESC_SIZE), opreg, opsize, res, rres,
      lad (ADDR_DESC_SIZE), junk, shift

   tpointer left_op, right_op

   regset rregs

   unsigned shift_id

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               lshift_a_by (Tmem (right_op + 3))))
         opreg = A_REG
         shift_id = lf_shft_int                 # object id
         shift = C$LSHFS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               lshift_l_by (Tmem (right_op + 3))))
         opreg = L_REG
         shift_id = lf_shft_long                 # object id
         shift = C$LSHFL
         }
   else
      call panic ("load_lshift: bad data mode *i*n"p, Tmem (expr + 1))

   r = load_rtr_ip (shift, shift_id)

   # load shift count into X register
   r = seq (r, reach (Tmem (expr + 3), rregs, rres, rad))
   r = seq (r, ld (A_REG, rres, rad), gen_generic (TAX_INS))

DB call print (ERROUT, "load_lshift:*n"s)
   junk = lookup_obj (shift_id, tad)

   # go get left-hand operand & execute the instruction
   l = reach (Tmem (expr + 2), regs, res, lad)
   regs |= rregs
   l = seq (l, ld (opreg, res, lad), gen_mr (JSXB_INS, tad))

   regs |= A_REG
   load_lshift = seq (r, l)

   return
   end



# load_lt --- test for less than, put 1 or 0 in A

   ipointer function load_lt (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical lzero, rzero
   logical safe, op_has_value

   ipointer l, r
   ipointer seq, reach, ld, st, gen_generic, gen_mr, gen_branch,
      gen_label, load, void

   regset lregs, rregs

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opsize, opreg, subins, lab
   integer mklabel

   tpointer left_op, right_op

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)
   lzero = op_has_value (left_op, 0)
   rzero = op_has_value (right_op, 0)

   select (Tmem (expr + 1))
      when (INT_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LLT_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LGT_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         }
      when (UNS_MODE) {
         if (rzero)
            return (seq (void (left_op, regs), gen_generic (CRA_INS)))
         if (lzero)
            return (seq (void (right_op, regs), gen_generic (LT_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         }
      when (LONG_INT_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LLLT_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LLGT_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         }
      when (LONG_UNS_MODE) {
         if (rzero)
            return (seq (void (left_op, regs), gen_generic (CRA_INS)))
         if (lzero)
            return (seq (void (right_op, regs), gen_generic (LT_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         }
      when (FLOAT_MODE) {
         if (rzero) {
            load_lt = load (left_op, regs)
            regs |= A_REG
            return (seq (load_lt, gen_generic (LFLT_INS)))
            }
         if (lzero)  {
            load_lt = load (right_op, regs)
            regs |= A_REG
            return (seq (load_lt, gen_generic (LFGT_INS)))
            }
         opreg = F_REG
         opsize = 2
         subins = FSB_INS
         }
      when (LONG_FLOAT_MODE) {
         if (rzero) {
            load_lt = load (left_op, regs)
            regs |= A_REG
            return (seq (load_lt, gen_generic (LFLT_INS)))
            }
         if (lzero)  {
            load_lt = load (right_op, regs)
            regs |= A_REG
            return (seq (load_lt, gen_generic (LFGT_INS)))
            }
         opreg = LF_REG
         opsize = 4
         subins = DFSB_INS
         }
   else
      call panic ("load_le: bad op mode *i*n"p, Tmem (expr + 1))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)
   lab = mklabel (1)

   select
      when (safe (opreg, lregs) && safe (opreg, rregs))
         p1
      when (safe (opreg, lregs) && ~safe (opreg, rregs))
         p2
      when (~safe (opreg, lregs) && safe (opreg, rregs))
         p1
   else
      p3

   call free_temp (tad)

   regs = or (A_REG, or (opreg, or (lregs, rregs)))
   return


   procedure p1 {
      load_lt = seq (l, ld (opreg, lres, lad), r, gen_mr (subins, rad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_lt = seq (load_lt, gen_generic (LCLT_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_lt = seq (load_lt,
               gen_generic (CRA_INS),
               gen_branch (BMGE_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_lt = seq (load_lt, gen_generic (LFLT_INS))
      }


   procedure p2 {
      load_lt = seq (r, ld (opreg, rres, rad), l, gen_mr (subins, lad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_lt = seq (load_lt, gen_generic (LCGT_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_lt = seq (load_lt,
               gen_generic (CRA_INS),
               gen_branch (BMLE_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_lt = seq (load_lt, gen_generic (LFGT_INS))
      }


   procedure p3 {
      load_lt = seq (r, ld (opreg, rres, rad))
      load_lt = seq (load_lt, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subins, tad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_lt = seq (load_lt, gen_generic (LCLT_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_lt = seq (load_lt,
               gen_generic (CRA_INS),
               gen_branch (BMGE_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_lt = seq (load_lt, gen_generic (LFLT_INS))
      }


   end



# load_mulaa --- multiply operands, store result in left operand

   ipointer function load_mulaa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   ipointer l, r, cleanup
   ipointer reach, seq, ld, st, gen_generic, gen_mr, mul_a_by, mul_l_by,
      load_field_asg_op

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opins, opsize

   regset rregs, lregs, opreg

   tpointer left_op, right_op

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   if (Tmem (left_op) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, lres, lad)
            regs |= A_REG
            return (seq (l, ld (A_REG, lres, lad),
               mul_a_by (Tmem (right_op + 3)),
               st (A_REG, lad)))
            }
         opsize = 1
         opins = MPY_INS
         opreg = A_REG
         cleanup = gen_generic (XCB_INS)
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, lres, lad)
            regs |= L_REG
            return (seq (l, ld (L_REG, lres, lad),
               mul_l_by (Tmem (right_op + 3)),
               st (L_REG, lad)))
            }
         opsize = 2
         opins = MPL_INS
         opreg = L_REG
         cleanup = gen_generic (ILE_INS)
         }
      when (FLOAT_MODE) {
         opsize = 2
         opins = FMP_INS
         opreg = F_REG
         cleanup = 0
         }
      when (LONG_FLOAT_MODE) {
         opsize = 4
         opins = DFMP_INS
         opreg = LF_REG
         cleanup = 0
         }
   else
      call panic ("load_mulaa: bad data mode *i*n"p, Tmem (expr + 1))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select
      when (safe (opreg, lregs) && safe (opreg, rregs))
         if (safe (lregs, rregs))
            p1
         else
            p2
      when (safe (opreg, lregs) && ~safe (opreg, rregs))
         p2
      when (~safe (opreg, lregs) && safe (opreg, rregs))
         if (safe (lregs, rregs))
            p1
         else
            p3
   else
      p3

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   return


   procedure p1 {
      load_mulaa = seq (l, ld (opreg, lres, lad), r,
         gen_mr (opins, rad), cleanup, st (opreg, lad))
      }


   procedure p2 {
      load_mulaa = seq (r, ld (opreg, rres, rad), l,
         gen_mr (opins, lad), cleanup, st (opreg, lad))
      }


   procedure p3 {
      load_mulaa = seq (r, ld (opreg, rres, rad))
      load_mulaa = seq (load_mulaa, st (opreg, tad), l,
         ld (opreg, lres, lad), gen_mr (opins, tad), cleanup,
         st (opreg, lad))
      }


   end



# load_mul --- multiply operands, result in accumulator

   ipointer function load_mul (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   ipointer l, r, cleanup
   ipointer reach, seq, ld, st, gen_generic, gen_mr, mul_a_by, load,
      mul_l_by

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opins, opsize

   regset rregs, lregs, opreg

   tpointer right_op, left_op

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs), mul_a_by (Tmem (right_op + 3))))
         if (Tmem (left_op) == CONST_OP)
            return (seq (load (right_op, regs), mul_a_by (Tmem (left_op + 3))))
         opsize = 1
         opins = MPY_INS
         opreg = A_REG
         cleanup = gen_generic (XCB_INS)
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs), mul_l_by (Tmem (right_op + 3))))
         if (Tmem (left_op) == CONST_OP)
            return (seq (load (right_op, regs), mul_l_by (Tmem (left_op + 3))))
         opsize = 2
         opins = MPL_INS
         opreg = L_REG
         cleanup = gen_generic (ILE_INS)
         }
      when (FLOAT_MODE) {
         opsize = 2
         opins = FMP_INS
         opreg = F_REG
         cleanup = 0
         }
      when (LONG_FLOAT_MODE) {
         opsize = 4
         opins = DFMP_INS
         opreg = LF_REG
         cleanup = 0
         }
   else
      call panic ("load_mul: bad data mode *i*n"p, Tmem (expr + 1))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select
      when (safe (opreg, lregs) && safe (opreg, rregs))
         p1
      when (safe (opreg, lregs) && ~safe (opreg, rregs))
         p2
      when (~safe (opreg, lregs) && safe (opreg, rregs))
         p1
   else
      p3

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   return


   procedure p1 {
      load_mul = seq (l, ld (opreg, lres, lad), r,
         gen_mr (opins, rad), cleanup)
      }


   procedure p2 {
      load_mul = seq (r, ld (opreg, rres, rad), l,
         gen_mr (opins, lad), cleanup)
      }


   procedure p3 {
      load_mul = seq (r, ld (opreg, rres, rad))
      load_mul = seq (load_mul, st (opreg, tad), l,
         ld (opreg, lres, lad), gen_mr (opins, tad), cleanup)
      }


   end



# load_neg --- evaluate two's-complement negation, result in accumulator

   ipointer function load_neg (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer load, gen_generic, seq

   load_neg = load (Tmem (expr + 2), regs)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE)
         load_neg = seq (load_neg, gen_generic (TCA_INS))
      when (LONG_INT_MODE, LONG_UNS_MODE)
         load_neg = seq (load_neg, gen_generic (TCL_INS))
      when (FLOAT_MODE)
         load_neg = seq (load_neg, gen_generic (FCM_INS))
      when (LONG_FLOAT_MODE)
         load_neg = seq (load_neg, gen_generic (DFCM_INS))
   else
      call panic ("load_neg: bad data mode *i*n"p, Tmem (expr + 1))

   return
   end



# load_next --- generate code to continue a loop

   ipointer function load_next (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer level, lad (ADDR_DESC_SIZE)

   ipointer seq, gen_generic, gen_mr

   load_next = 0
   regs = 0

   level = Tmem (expr + 1)
   if (level > Continue_sp || level < 1)
      call warning ("load_next: improper continue level (*i)*n"p, level)
   else {
      level = Continue_sp - level + 1
      AD_MODE (lad) = LABELED_AM
      AD_LABEL (lad) = Continue_stack (level)
      load_next = seq (gen_mr (JMP_INS, lad), gen_generic (FIN_INS))
      }

   return
   end



# load_ne --- test for inequality of operands, put 1 or 0 in A

   ipointer function load_ne (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical lzero, rzero
   logical safe, op_has_value

   ipointer l, r
   ipointer seq, reach, ld, st, gen_generic, gen_mr, load

   regset lregs, rregs

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opsize, opreg, subins, logins

   tpointer left_op, right_op

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)
   lzero = op_has_value (left_op, 0)
   rzero = op_has_value (right_op, 0)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LNE_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LNE_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         logins = LCNE_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LLNE_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LLNE_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         logins = LCNE_INS
         }
      when (FLOAT_MODE) {
         if (rzero) {
            load_ne = load (left_op, regs)
            regs |= A_REG
            return (seq (load_ne, gen_generic (LFNE_INS)))
            }
         if (lzero) {
            load_ne = load (right_op, regs)
            regs |= A_REG
            return (seq (load_ne, gen_generic (LFNE_INS)))
            }
         opreg = F_REG
         opsize = 2
         subins = FSB_INS
         logins = LFNE_INS
         }
      when (LONG_FLOAT_MODE) {
         if (rzero) {
            load_ne = load (left_op, regs)
            regs |= A_REG
            return (seq (load_ne, gen_generic (LFNE_INS)))
            }
         if (lzero) {
            load_ne = load (right_op, regs)
            regs |= A_REG
            return (seq (load_ne, gen_generic (LFNE_INS)))
            }
         opreg = LF_REG
         opsize = 4
         subins = DFSB_INS
         logins = LFNE_INS
         }
   else
      call panic ("load_ne: bad op mode *i*n"p, Tmem (expr + 1))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select
      when (safe (opreg, lregs) && safe (opreg, rregs))
         p1
      when (safe (opreg, lregs) && ~safe (opreg, rregs))
         p2
      when (~safe (opreg, lregs) && safe (opreg, rregs))
         p1
   else
      p3

   call free_temp (tad)

   regs = or (A_REG, or (opreg, or (lregs, rregs)))
   return


   procedure p1 {
      load_ne = seq (l, ld (opreg, lres, lad), r, gen_mr (subins, rad),
         gen_generic (logins))
      }


   procedure p2 {
      load_ne = seq (r, ld (opreg, rres, rad), l, gen_mr (subins, lad),
         gen_generic (logins))
      }


   procedure p3 {
      load_ne = seq (r, ld (opreg, rres, rad))
      load_ne = seq (load_ne, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (sub_ins, tad), gen_generic (logins))
      }


   end



# load_not --- evaluate logical negation, result in A_REG

   ipointer function load_not (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer load, gen_generic, seq

   load_not = load (Tmem (expr + 2), regs)
   regs |= A_REG

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE)
         load_not = seq (load_not, gen_generic (LEQ_INS))
      when (LONG_INT_MODE, LONG_UNS_MODE)
         load_not = seq (load_not, gen_generic (LLEQ_INS))
      when (FLOAT_MODE, LONG_FLOAT_MODE)
         load_not = seq (load_not, gen_generic (LFEQ_INS))
   else
      call panic ("load_not: bad data mode *i*n"p, Tmem (expr + 1))

   return
   end



# load_null --- don't do anything at all

   ipointer function load_null (expr, regs)
   tpointer expr
   regset regs

   regs = 0
   load_null = 0

   return
   end



# load_object --- load contents of object into accumulator

   ipointer function load_object (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer gen_mr

   integer res, ad (ADDR_DESC_SIZE)

   call reach (expr, regs, res, ad)
   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         load_object = gen_mr (LDA_INS, ad)
         regs |= A_REG
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         load_object = gen_mr (LDL_INS, ad)
         regs |= L_REG
         }
      when (FLOAT_MODE) {
         load_object = gen_mr (FLD_INS, ad)
         regs |= F_REG
         }
      when (LONG_FLOAT_MODE) {
         load_object = gen_mr (DFLD_INS, ad)
         regs |= LF_REG
         }
   else
      call panic ("load_object: bad mode *i*n"p, Tmem (expr + 1))

   return
   end



# load_oraa --- evaluate logical or, store product in left operand

   ipointer function load_oraa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   regset lregs, rregs

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opsize, tad (ADDR_DESC_SIZE)

   ipointer l, r
   ipointer seq, gen_mr, ld, st, reach, gen_generic, load_field_asg_op

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward
   procedure p4 forward
   procedure p5 forward
   procedure p6 forward

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (2, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         select
            when (safe (A_REG, lregs) && safe (A_REG, rregs))
               if (safe (lregs, rregs))
                  p1
               else
                  p2
            when (safe (A_REG, lregs) && ~safe (A_REG, rregs))
               p2
            when (~safe (A_REG, lregs) && safe (A_REG, rregs))
               if (safe (lregs, rregs))
                  p1
               else
                  p3
         else
            p3
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (rres == IN_ACCUMULATOR)
            p4
         else if (AD_MODE (rad) == LLIT_AM)
            p5
         else if (AD_MODE (rad) == DIRECT_AM
          && safe (or (lregs, L_REG), rregs))
            p6
         else if (AD_MODE (rad) == INDEXED_AM
          && safe (or (lregs, L_REG), rregs))
            p6
         else
            p4
         }
   else
      call panic ("load_oraa: bad data mode *i*n"p, Tmem (expr + 1))

   call free_temp (tad)

   regs = or (A_REG, or (lregs, rregs))
   return


   procedure p1 {
      load_oraa = seq (l, ld (A_REG, lres, lad), r, gen_mr (ORA_INS, rad),
         st (A_REG, lad))
      }


   procedure p2 {
      load_oraa = seq (r, ld (A_REG, rres, rad), l, gen_mr (ORA_INS, lad),
         st (A_REG, lad))
      }


   procedure p3 {
      load_oraa = seq (r, ld (A_REG, rres, rad))
      load_oraa = seq (load_oraa, st (A_REG, tad), l, ld (A_REG, lres, lad),
         gen_mr (ORA_INS, tad), st (A_REG, lad))
      }


   procedure p4 {
      load_oraa = seq (r, ld (L_REG, rres, rad), st (L_REG, tad),
         l, ld (L_REG, lres, lad), gen_mr (ORA_INS, tad),
         gen_generic (IAB_INS))
      AD_OFFSET (tad) += 1
      load_oraa = seq (load_oraa, gen_mr (ORA_INS, tad),
         gen_generic (IAB_INS), st (L_REG, lad))
      AD_OFFSET (tad) -= 1
      }


   procedure p5 {
      AD_MODE (tad) = ILIT_AM
      AD_LIT1 (tad) = AD_LIT1 (rad)
      load_oraa = seq (l, ld (L_REG, lres, lad), gen_mr (ORA_INS, tad),
         gen_generic (IAB_INS))
      AD_LIT1 (tad) = AD_LIT2 (rad)
      load_oraa = seq (load_oraa, gen_mr (ORA_INS, tad),
         gen_generic (IAB_INS), st (L_REG, lad))
      }


   procedure p6 {
      load_oraa = seq (l, ld (L_REG, lres, lad), r,
         gen_mr (ORA_INS, rad), gen_generic (IAB_INS))
      AD_OFFSET (rad) += 1
      load_oraa = seq (load_oraa, gen_mr (ORA_INS, rad),
         gen_generic (IAB_INS), st (L_REG, lad))
      }


   end



# load_or --- evaluate logical or, result in accumulator

   ipointer function load_or (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   regset lregs, rregs

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opsize, tad (ADDR_DESC_SIZE)

   ipointer l, r
   ipointer seq, gen_mr, ld, st, reach, gen_generic

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward
   procedure p4 forward
   procedure p5 forward
   procedure p6 forward

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (2, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         select
            when (safe (A_REG, lregs) && safe (A_REG, rregs))
               p1
            when (safe (A_REG, lregs) && ~safe (A_REG, rregs))
               p2
            when (~safe (A_REG, lregs) && safe (A_REG, rregs))
               p1
         else
            p3
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (rres == IN_ACCUMULATOR)
            p4
         else if (AD_MODE (rad) == LLIT_AM)
            p5
         else if (AD_MODE (rad) == DIRECT_AM && safe (L_REG, rregs))
            p6
         else if (AD_MODE (rad) == INDEXED_AM && safe (L_REG, rregs))
            p6
         else
            p4
         }
   else
      call panic ("load_or: bad data mode *i*n"p, Tmem (expr + 1))

   call free_temp (tad)

   regs = or (A_REG, or (lregs, rregs))
   return


   procedure p1 {
      load_or = seq (l, ld (A_REG, lres, lad), r, gen_mr (ORA_INS, rad))
      }


   procedure p2 {
      load_or = seq (r, ld (A_REG, rres, rad), l, gen_mr (ORA_INS, lad))
      }


   procedure p3 {
      load_or = seq (r, ld (A_REG, rres, rad))
      load_or = seq (load_or, st (A_REG, tad), l, ld (A_REG, lres, lad),
         gen_mr (ORA_INS, tad))
      }


   procedure p4 {
      load_or = seq (r, ld (L_REG, rres, rad), st (L_REG, tad),
         l, ld (L_REG, lres, lad), gen_mr (ORA_INS, tad),
         gen_generic (IAB_INS))
      AD_OFFSET (tad) += 1
      load_or = seq (load_or, gen_mr (ORA_INS, tad),
         gen_generic (IAB_INS))
      AD_OFFSET (tad) -= 1
      }


   procedure p5 {
      AD_MODE (tad) = ILIT_AM
      AD_LIT1 (tad) = AD_LIT1 (rad)
      load_or = seq (l, ld (L_REG, lres, lad), gen_mr (ORA_INS, tad),
         gen_generic (IAB_INS))
      AD_LIT1 (tad) = AD_LIT2 (rad)
      load_or = seq (load_or, gen_mr (ORA_INS, tad),
         gen_generic (IAB_INS))
      }


   procedure p6 {
      load_or = seq (l, ld (L_REG, lres, lad), r,
         gen_mr (ORA_INS, rad), gen_generic (IAB_INS))
      AD_OFFSET (rad) += 1
      load_or = seq (load_or, gen_mr (ORA_INS, rad),
         gen_generic (IAB_INS))
      }


   end



# load_postdec --- load object value, decrement object

   ipointer function load_postdec (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, load_field_asg_op

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins, invins

   string mesg "load_postdec: "

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opins = SUB_INS
         invins = ADD_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opins = SBL_INS
         invins = ADL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         opins = FSB_INS
         invins = FAD_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         opins = DFSB_INS
         invins = DFAD_INS
         }
   else {
      call warning ("*sbad data mode*i*n"p, mesg, Tmem (expr + 1))
      regs = 0
      return (0)
      }

   l = reach (Tmem (expr + 2), lregs, lres, lad)
   r = reach (Tmem (expr + 3), rregs, rres, rad)

   if (rres == IN_ACCUMULATOR) {
      call warning ("*sright op not a constant*n"p, mesg)
      regs = 0
      return (0)
      }
   select (AD_MODE (rad))
      when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM)
         ;
   else {
      call warning ("*sright op not a constant*n"p, mesg)
      regs = 0
      return (0)
      }

   if (lres == IN_ACCUMULATOR) {
      call warning ("*sleft op not an lvalue*n"p, mesg)
      regs = 0
      return (0)
      }

   load_postdec = seq (l,
      ld (opreg, lres, lad),
      gen_mr (opins, rad),
      st (opreg, lad),
      gen_mr (invins, rad))

   regs = or (opreg, lregs)
   return
   end
