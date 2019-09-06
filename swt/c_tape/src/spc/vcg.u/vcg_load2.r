# vcg_load2 --- load expression values for code generator (part 2)



# load_divaa --- perform division, assign quotient to left operand

   ipointer function load_divaa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   procedure p1 forward
   procedure p2 forward

   ipointer prep, l, r
   ipointer gen_generic, gen_mr, ld, st, reach, seq, div_a_by, div_l_by,
      load_field_asg_op

   regset opreg, lregs, rregs

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opsize, opins

   tpointer left_op, right_op

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   if (Tmem (left_op) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, lres, lad)
            regs |= A_REG
            return (seq (l, ld (A_REG, lres, lad),
               div_a_by (Tmem (right_op + 3), INT_MODE),
               st (A_REG, lad)))
            }
         opreg = A_REG     # and L register; we treat them similarly
         prep = gen_generic (PIDA_INS)
         opsize = 1
         opins = DIV_INS
         }
      when (UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, lres, lad)
            regs |= A_REG
            return (seq (l, ld (A_REG, lres, lad),
               div_a_by (Tmem (right_op + 3), UNS_MODE),
               st (A_REG, lad)))
            }
         opreg = A_REG
         prep = gen_generic (XCA_INS)
         opsize = 1
         opins = DIV_INS
         }
      when (LONG_INT_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, lres, lad)
            regs |= L_REG
            return (seq (l, ld (L_REG, lres, lad),
               div_l_by (Tmem (right_op + 3), INT_MODE),
               st (L_REG, lad)))
            }
         opreg = L_REG     # and also E, but we ignore that for now
         prep = gen_generic (PIDL_INS)
         opsize = 2
         opins = DVL_INS
         }
      when (LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, lres, lad)
            regs |= L_REG
            return (seq (l, ld (L_REG, lres, lad),
               div_l_by (Tmem (right_op + 3), UNS_MODE),
               st (L_REG, lad)))
            }
         opreg = L_REG
         prep = seq (gen_generic (ILE_INS), gen_generic (CRL_INS))
         opsize = 2
         opins = DVL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         prep = 0
         opsize = 2
         opins = FDV_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         prep = 0
         opsize = 4
         opins = DFDV_INS
         }
   else
      call panic ("load_divaa: bad operand mode *i*n"p, Tmem (expr + 1))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   if (lres ~= IN_MEMORY) {
      call warning ("load_divaa: left operand not lvalue*n"p)
      return (0)
      }

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
            p2
   else
      p2

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   return


   procedure p1 {
      load_divaa = seq (l, ld (opreg, lres, lad), prep,
         r, gen_mr (opins, rad), st (opreg, lad))
      }


   procedure p2 {
      load_divaa = seq (r, ld (opreg, rres, rad))
      load_divaa = seq (load_divaa, st (opreg, tad), l,
         ld (opreg, lres, lad), prep, gen_mr (opins, tad), st (opreg, lad))
      }


   end



# load_div --- perform division, leave result in accumulator

   ipointer function load_div (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   procedure p1 forward
   procedure p2 forward

   ipointer prep, l, r
   ipointer gen_generic, gen_mr, ld, st, reach, seq, div_a_by, div_l_by,
      load

   regset opreg, lregs, rregs

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opsize, opins

   tpointer left_op, right_op

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               div_a_by (Tmem (right_op + 3), INT_MODE)))
         opreg = A_REG     # and L register; we treat them similarly
         prep = gen_generic (PIDA_INS)
         opsize = 1
         opins = DIV_INS
         }
      when (UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               div_a_by (Tmem (right_op + 3), UNS_MODE)))
         opreg = A_REG
         prep = gen_generic (XCA_INS)
         opsize = 1
         opins = DIV_INS
         }
      when (LONG_INT_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               div_l_by (Tmem (right_op + 3), INT_MODE)))
         opreg = L_REG     # and also E, but we ignore that for now
         prep = gen_generic (PIDL_INS)
         opsize = 2
         opins = DVL_INS
         }
      when (LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               div_l_by (Tmem (right_op + 3), UNS_MODE)))
         opreg = L_REG
         prep = seq (gen_generic (ILE_INS), gen_generic (CRL_INS))
         opsize = 2
         opins = DVL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         prep = 0
         opsize = 2
         opins = FDV_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         prep = 0
         opsize = 4
         opins = DFDV_INS
         }
   else
      call panic ("load_div: bad operand mode *i*n"p, Tmem (expr + 1))

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
      p2

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   return


   procedure p1 {
      load_div = seq (l, ld (opreg, lres, lad), prep,
         r, gen_mr (opins, rad))
      }


   procedure p2 {
      load_div = seq (r, ld (opreg, rres, rad))
      load_div = seq (load_div, st (opreg, tad), l,
         ld (opreg, lres, lad), prep, gen_mr (opins, tad))
      }


   end



# load_do_loop --- generate a test-at-the-bottom loop

   ipointer function load_do_loop (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer cad (ADDR_DESC_SIZE)
   integer mklabel

   ipointer seq, gen_label, gen_mr, gen_generic, void, flow

   regset cregs

   if (Break_sp + 1 > MAX_BREAK_SP)
      call panic ("do loops nested too deeply: break stack overflow*n"p)
   Break_sp += 1
   Break_stack (Break_sp) = mklabel (1)

   if (Continue_sp + 1 > MAX_CONTINUE_SP)
      call panic ("do loops nested too deeply: continue stack overflow*n"p)
   Continue_sp += 1
   Continue_stack (Continue_sp) = mklabel (1)

   if (Tmem (expr + 2) == 0) {      # no condition
      AD_MODE (cad) = LABELED_AM
      AD_LABEL (cad) = Continue_stack (Continue_sp)
      load_do_loop = seq (gen_label (AD_LABEL (cad)),
         void (Tmem (expr + 1), regs), gen_mr (JMP_INS, cad),
         gen_generic (FIN_INS), gen_label (Break_stack (Break_sp)))
      }
   else {                           # got a condition
      AD_MODE (cad) = LABELED_AM
      AD_LABEL (cad) = mklabel (1)
      load_do_loop = seq (gen_label (AD_LABEL (cad)),
         void (Tmem (expr + 1), regs),
         gen_label (Continue_stack (Continue_sp)))
      load_do_loop = seq (load_do_loop,
         flow (Tmem (expr + 2), cregs, FALSE, AD_LABEL (cad)),
         gen_label (Break_stack (Break_sp)))
      regs |= cregs
      }

   Break_sp -= 1
   Continue_sp -= 1

   return
   end



# load_eq --- test for equality of operands, put 1 or 0 in A

   ipointer function load_eq (expr, regs)
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
            return (seq (load (left_op, regs), gen_generic (LEQ_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LEQ_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         logins = LCEQ_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LLEQ_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LLEQ_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         logins = LCEQ_INS
         }
      when (FLOAT_MODE) {
         if (rzero) {
            load_eq = load (left_op, regs)
            regs |= A_REG
            return (seq (load_eq, gen_generic (LFEQ_INS)))
            }
         if (lzero) {
            load_eq = load (right_op, regs)
            regs |= A_REG
            return (seq (load_eq, gen_generic (LFEQ_INS)))
            }
         opreg = F_REG
         opsize = 2
         subins = FSB_INS
         logins = LFEQ_INS
         }
      when (LONG_FLOAT_MODE) {
         if (rzero) {
            load_eq = load (left_op, regs)
            regs |= A_REG
            return (seq (load_eq, gen_generic (LFEQ_INS)))
            }
         if (lzero) {
            load_eq = load (right_op, regs)
            regs |= A_REG
            return (seq (load_eq, gen_generic (LFEQ_INS)))
            }
         opreg = LF_REG
         opsize = 4
         subins = DFSB_INS
         logins = LFEQ_INS
         }
   else
      call panic ("load_eq: bad op mode *i*n"p, Tmem (expr + 1))

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
      load_eq = seq (l, ld (opreg, lres, lad), r, gen_mr (subins, rad),
         gen_generic (logins))
      }


   procedure p2 {
      load_eq = seq (r, ld (opreg, rres, rad), l, gen_mr (subins, lad),
         gen_generic (logins))
      }


   procedure p3 {
      load_eq = seq (r, ld (opreg, rres, rad))
      load_eq = seq (load_eq, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (sub_ins, tad), gen_generic (logins))
      }


   end



# load_field --- place contents of bit field in appropriate accumulator

   ipointer function load_field (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer ld_field

   return (ld_field (expr, regs))
   end



# load_for_loop --- evaluate general looping construct

   ipointer function load_for_loop (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer ad (ADDR_DESC_SIZE), looplab, testlab
   integer mklabel

   ipointer seq, gen_label, gen_mr, gen_generic, load, flow, void

   regset iregs, cregs, rregs, bregs

   testlab = mklabel (1)
   looplab = mklabel (1)

   if (Break_sp + 1 > MAX_BREAK_SP)
      call panic ("for loops nested too deeply: break stack overflow*n"p)
   Break_sp += 1
   Break_stack (Break_sp) = mklabel (1)

   if (Continue_sp + 1 > MAX_CONTINUE_SP)
      call panic ("for loops nested too deeply: continue stack overflow*n"p)
   Continue_sp += 1
   Continue_stack (Continue_sp) = mklabel (1)

   load_for_loop = void (Tmem (expr + 1), iregs)      # init
   AD_MODE (ad) = LABELED_AM

   if (Tmem (expr + 2) == 0) {      # no condition present, assume TRUE
      AD_LABEL (ad) = looplab
      load_for_loop = seq (load_for_loop,
         gen_label (looplab))
      load_for_loop = seq (load_for_loop,
         void (Tmem (expr + 4), bregs),               # body
         gen_label (Continue_stack (Continue_sp)))
      load_for_loop = seq (load_for_loop,
         void (Tmem (expr + 3), rregs),               # reinit
         gen_mr (JMP_INS, ad),
         gen_generic (FIN_INS),
         gen_label (Break_stack (Break_sp)))
      cregs = 0
      }
   else {                           # condition present, generate full loop
      AD_LABEL (ad) = testlab
      load_for_loop = seq (load_for_loop,
         gen_mr (JMP_INS, ad),
         gen_generic (FIN_INS),
         gen_label (looplab))
      load_for_loop = seq (load_for_loop,
         void (Tmem (expr + 4), bregs),               # body
         gen_label (Continue_stack (Continue_sp)))
      load_for_loop = seq (load_for_loop,
         void (Tmem (expr + 3), rregs),               # reinit
         gen_label (testlab))
      load_for_loop = seq (load_for_loop,
         flow (Tmem (expr + 2), cregs, TRUE, looplab),# condition
         gen_label (Break_stack (Break_sp)))
      }

   Break_sp -= 1
   Continue_sp -= 1

   regs = or (iregs, or (cregs, or (rregs, bregs)))

   return
   end



# load_ge --- test for greater-or-equal, put 1 or 0 in A

   ipointer function load_ge (expr, regs)
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
            return (seq (load (left_op, regs), gen_generic (LGE_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LLE_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         }
      when (UNS_MODE) {
         if (rzero)
            return (seq (void (left_op, regs), gen_generic (LT_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LEQ_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         }
      when (LONG_INT_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LLGE_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LLLE_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         }
      when (LONG_UNS_MODE) {
         if (rzero)
            return (seq (void (left_op, regs), gen_generic (LT_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LLEQ_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         }
      when (FLOAT_MODE) {
         if (rzero) {
            load_ge = load (left_op, regs)
            regs |= A_REG
            return (seq (load_ge, gen_generic (LFGE_INS)))
            }
         if (lzero) {
            load_ge = load (right_op, regs)
            regs |= A_REG
            return (seq (load_ge, gen_generic (LFLE_INS)))
            }
         opreg = F_REG
         opsize = 2
         subins = FSB_INS
         }
      when (LONG_FLOAT_MODE) {
         if (rzero) {
            load_ge = load (left_op, regs)
            regs |= A_REG
            return (seq (load_ge, gen_generic (LFGE_INS)))
            }
         if (lzero) {
            load_ge = load (right_op, regs)
            regs |= A_REG
            return (seq (load_ge, gen_generic (LFLE_INS)))
            }
         opreg = LF_REG
         opsize = 4
         subins = DFSB_INS
         }
   else
      call panic ("load_ge: bad op mode *i*n"p, Tmem (expr + 1))

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
      load_ge = seq (l, ld (opreg, lres, lad), r, gen_mr (subins, rad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_ge = seq (load_ge, gen_generic (LCGE_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_ge = seq (load_ge,
               gen_generic (CRA_INS),
               gen_branch (BMLT_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_ge = seq (load_ge, gen_generic (LFGE_INS))
      }


   procedure p2 {
      load_ge = seq (r, ld (opreg, rres, rad), l, gen_mr (subins, lad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_ge = seq (load_ge, gen_generic (LCLE_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_ge = seq (load_ge,
               gen_generic (CRA_INS),
               gen_branch (BMGT_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_ge = seq (load_ge, gen_generic (LFLE_INS))
      }


   procedure p3 {
      load_ge = seq (r, ld (opreg, rres, rad))
      load_ge = seq (load_ge, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subins, tad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_ge = seq (load_ge, gen_generic (LCGE_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_ge = seq (load_ge,
               gen_generic (CRA_INS),
               gen_branch (BMLT_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_ge = seq (load_ge, gen_generic (LFGE_INS))
      }


   end



# load_goto --- generate arbitrary control transfer

   ipointer function load_goto (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer gen_mr, gen_generic, seq

   integer ad (ADDR_DESC_SIZE)

   AD_MODE (ad) = LABELED_AM
   AD_LABEL (ad) = Tmem (expr + 1)

   load_goto = seq (gen_mr (JMP_INS, ad), gen_generic (FIN_INS))
   regs = 0

   return
   end



# load_gt --- test for greater, put 1 or 0 in A

   ipointer function load_gt (expr, regs)
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
            return (seq (load (left_op, regs), gen_generic (LGT_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LLT_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         }
      when (UNS_MODE) {
         if (rzero)
            return (seq (void (left_op, regs), gen_generic (LT_INS)))
         if (lzero)
            return (seq (void (right_op, regs), gen_generic (CRA_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         }
      when (LONG_INT_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LLGT_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LLLT_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         }
      when (LONG_UNS_MODE) {
         if (rzero)
            return (seq (void (left_op, regs), gen_generic (LT_INS)))
         if (lzero)
            return (seq (void (right_op, regs), gen_generic (CRA_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         }
      when (FLOAT_MODE) {
         if (rzero) {
            load_gt = load (left_op, regs)
            regs |= A_REG
            return (seq (load_gt, gen_generic (LFGT_INS)))
            }
         if (lzero) {
            load_gt = load (right_op, regs)
            regs |= A_REG
            return (seq (load_gt, gen_generic (LFLT_INS)))
            }
         opreg = F_REG
         opsize = 2
         subins = FSB_INS
         }
      when (LONG_FLOAT_MODE) {
         if (rzero) {
            load_gt = load (left_op, regs)
            regs |= A_REG
            return (seq (load_gt, gen_generic (LFGT_INS)))
            }
         if (lzero) {
            load_gt = load (right_op, regs)
            regs |= A_REG
            return (seq (load_gt, gen_generic (LFLT_INS)))
            }
         opreg = LF_REG
         opsize = 4
         subins = DFSB_INS
         }
   else
      call panic ("load_gt: bad op mode *i*n"p, Tmem (expr + 1))

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
      load_gt = seq (l, ld (opreg, lres, lad), r, gen_mr (subins, rad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_gt = seq (load_gt, gen_generic (LCGT_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_gt = seq (load_gt,
               gen_generic (CRA_INS),
               gen_branch (BMLE_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_gt = seq (load_gt, gen_generic (LFGT_INS))
      }


   procedure p2 {
      load_gt = seq (r, ld (opreg, rres, rad), l, gen_mr (subins, lad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_gt = seq (load_gt, gen_generic (LCLT_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_gt = seq (load_gt,
               gen_generic (CRA_INS),
               gen_branch (BMGE_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_gt = seq (load_gt, gen_generic (LFLT_INS))
      }


   procedure p3 {
      load_gt = seq (r, ld (opreg, rres, rad))
      load_gt = seq (load_gt, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subins, tad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_gt = seq (load_gt, gen_generic (LCGT_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_gt = seq (load_gt,
               gen_generic (CRA_INS),
               gen_branch (BMLE_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_gt = seq (load_gt, gen_generic (LFGT_INS))
      }


   end



# load_if --- evaluate conditional expression; result in accumulator

   ipointer function load_if (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer load, flow, gen_generic, gen_mr, gen_label, seq

   integer else_lab, exit_lab, ad (ADDR_DESC_SIZE)
   integer mklabel

   regset cregs, tregs, eregs

   if (Tmem (expr + 4) == 0) {         # no 'else' part
      exit_lab = mklabel (1)
      load_if = flow (Tmem (expr + 2), cregs, FALSE, exit_lab)
      load_if = seq (load_if, load (Tmem (expr + 3), tregs),
         gen_label (exit_lab))
      eregs = 0
      }
   else if (Tmem (expr + 3) == 0) {    # no 'then' part
      exit_lab = mklabel (1)
      load_if = flow (Tmem (expr + 2), cregs, TRUE, exit_lab)
      load_if = seq (load_if, load (Tmem (expr + 4), eregs),
         gen_label (exit_lab))
      tregs = 0
      }
   else {                              # general case
      else_lab = mklabel (1)
      exit_lab = mklabel (1)
      AD_MODE (ad) = LABELED_AM
      AD_LABEL (ad) = exit_lab
      load_if = flow (Tmem (expr + 2), cregs, FALSE, else_lab)
      load_if = seq (load_if,
         load (Tmem (expr + 3), tregs),
         gen_mr (JMP_INS, ad), gen_generic (FIN_INS),
         gen_label (else_lab))
      load_if = seq (load_if,
         load (Tmem (expr + 4), eregs),
         gen_label (exit_lab))
      }

   regs = or (cregs, or (tregs, eregs))

   return
   end



# load_index --- load value selected by indexing an array

   ipointer function load_index (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer reach, gen_mr, ld, seq

   integer res, ad (ADDR_DESC_SIZE)

   regset opreg

   load_index = reach (expr, regs, res, ad)
   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE)
         opreg = A_REG
      when (LONG_INT_MODE, LONG_UNS_MODE)
         opreg = L_REG
      when (FLOAT_MODE)
         opreg = F_REG
      when (LONG_FLOAT_MODE)
         opreg = LF_REG
   else
      call panic ("load_index: bad data mode *i*n"p, Tmem (expr + 1))

   load_index = seq (load_index, ld (opreg, res, ad))
   regs |= opreg

   return
   end



# load_label --- generate label placement code

   ipointer function load_label (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer gen_label

   load_label = gen_label (Tmem (expr + 1))
   regs = 0

   return
   end


# load_le --- test for greater, put 1 or 0 in A

   ipointer function load_le (expr, regs)
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
            return (seq (load (left_op, regs), gen_generic (LLE_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LGE_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         }
      when (UNS_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LEQ_INS)))
         if (lzero)
            return (seq (void (right_op, regs), gen_generic (LT_INS)))
         opreg = A_REG
         opsize = 1
         subins = SUB_INS
         }
      when (LONG_INT_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LLLE_INS)))
         if (lzero)
            return (seq (load (right_op, regs), gen_generic (LLGE_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         }
      when (LONG_UNS_MODE) {
         if (rzero)
            return (seq (load (left_op, regs), gen_generic (LLEQ_INS)))
         if (lzero)
            return (seq (void (right_op, regs), gen_generic (LT_INS)))
         opreg = L_REG
         opsize = 2
         subins = SBL_INS
         }
      when (FLOAT_MODE) {
         if (rzero) {
            load_le = load (left_op, regs)
            regs |= A_REG
            return (seq (load_le, gen_generic (LFLE_INS)))
            }
         if (lzero) {
            load_le = load (right_op, regs)
            regs |= A_REG
            return (seq (load_le, gen_generic (LFGE_INS)))
            }
         opreg = F_REG
         opsize = 2
         subins = FSB_INS
         }
      when (LONG_FLOAT_MODE) {
         if (rzero) {
            load_le = load (left_op, regs)
            regs |= A_REG
            return (seq (load_le, gen_generic (LFLE_INS)))
            }
         if (lzero) {
            load_le = load (right_op, regs)
            regs |= A_REG
            return (seq (load_le, gen_generic (LFGE_INS)))
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
      load_le = seq (l, ld (opreg, lres, lad), r, gen_mr (subins, rad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_le = seq (load_le, gen_generic (LCLE_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_le = seq (load_le,
               gen_generic (CRA_INS),
               gen_branch (BMGT_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_le = seq (load_le, gen_generic (LFLE_INS))
      }


   procedure p2 {
      load_le = seq (r, ld (opreg, rres, rad), l, gen_mr (subins, lad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_le = seq (load_le, gen_generic (LCGE_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_le = seq (load_le,
               gen_generic (CRA_INS),
               gen_branch (BMLT_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_le = seq (load_le, gen_generic (LFGE_INS))
      }


   procedure p3 {
      load_le = seq (r, ld (opreg, rres, rad))
      load_le = seq (load_le, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subins, tad))
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            load_le = seq (load_le, gen_generic (LCLE_INS))
         when (UNS_MODE, LONG_UNS_MODE)
            load_le = seq (load_le,
               gen_generic (CRA_INS),
               gen_branch (BMGT_INS, lab),
               gen_generic (LT_INS),
               gen_label (lab))
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            load_le = seq (load_le, gen_generic (LFLE_INS))
      }


   end
