# vcg_flow1 --- generate code for flow-of-control context operators



# flow --- handle IMF operators in 'flow' context

   ipointer function flow (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   integer ad (ADDR_DESC_SIZE), branch

   ipointer seq, gen_mr, load, flow_seq, flow_if, flow_convert,
      flow_switch, gen_branch, flow_sand, flow_sor, flow_eq,
      flow_ge, flow_gt, flow_le, flow_lt, flow_ne, flow_not,
      flow_field

   if (expr == 0) {
      flow = 0
      regs = 0
      return
      }

   select (Tmem (expr))

      when (CONVERT_OP)
         flow = flow_convert (expr, regs, cond, label)
      when (EQ_OP)
         flow = flow_eq (expr, regs, cond, label)
      when (GE_OP)
         flow = flow_ge (expr, regs, cond, label)
      when (GT_OP)
         flow = flow_gt (expr, regs, cond, label)
      when (LE_OP)
         flow = flow_le (expr, regs, cond, label)
      when (LT_OP)
         flow = flow_lt (expr, regs, cond, label)
      when (NE_OP)
         flow = flow_ne (expr, regs, cond, label)
      when (NOT_OP)
         flow = flow_not (expr, regs, cond, label)
      when (IF_OP)
         flow = flow_if (expr, regs, cond, label)
      when (SAND_OP)
         flow = flow_sand (expr, regs, cond, label)
      when (SEQ_OP)
         flow = flow_seq (expr, regs, cond, label)
      when (SOR_OP)
         flow = flow_sor (expr, regs, cond, label)
      when (SWITCH_OP)
         flow = flow_switch (expr, regs, cond, label)
      when (FIELD_OP)
         flow = flow_field (expr, regs, cond, label)

      when (DECLARE_STAT_OP, DEFINE_DYNM_OP, DEFINE_STAT_OP,
         BREAK_OP, NEXT_OP, GOTO_OP, UNDEFINE_DYNM_OP, NULL_OP,
         LABEL_OP, DO_LOOP_OP, FOR_LOOP_OP, WHILE_LOOP_OP, RETURN_OP) {
         call warning ("*i: questionable operator in flow context*n"p,
            Tmem (expr))
         flow = load (expr, regs)
         AD_MODE (ad) = LABELED_AM
         AD_LABEL (ad) = label
         flow = seq (flow, gen_mr (JMP_INS, ad))
         }

      when (SELECT_OP, INDEX_OP, OBJECT_OP, PROC_CALL_OP, CONST_OP,
         COMPL_OP, DEREF_OP, NEG_OP, REFTO_OP, ADDAA_OP, ADD_OP,
         ANDAA_OP, AND_OP, ASSIGN_OP, DIVAA_OP, DIV_OP,
         LSHIFTAA_OP, LSHIFT_OP, MULAA_OP,
         MUL_OP, ORAA_OP, OR_OP, POSTDEC_OP, POSTINC_OP,
         PREDEC_OP, PREINC_OP, REMAA_OP, REM_OP, RSHIFTAA_OP,
         RSHIFT_OP, SUBAA_OP, SUB_OP, XORAA_OP,
         XOR_OP) {
         flow = load (expr, regs)
         select (Tmem (expr + 1))
            when (INT_MODE, UNS_MODE)
               if (cond)
                  branch = BNE_INS
               else
                  branch = BEQ_INS
            when (LONG_INT_MODE, LONG_UNS_MODE)
               if (cond)
                  branch = BLNE_INS
               else
                  branch = BLEQ_INS
            when (FLOAT_MODE, LONG_FLOAT_MODE)
               if (cond)
                  branch = BFNE_INS
               else
                  branch = BFEQ_INS
         else
            call panic ("*i: bogus operator data mode*n"p, Tmem (expr + 1))
         flow = seq (flow, gen_branch (branch, label))
         }

   else
      call panic ("*i:  bogus operator in flow*n"p, Tmem (expr))

   return
   end



# flow_convert --- branch on converted value

   ipointer function flow_convert (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer load, gen_branch, seq

   integer branch

   flow_convert = load (expr, regs)

   select (Tmem (expr + 2))
      when (INT_MODE, UNS_MODE)
         if (cond)
            branch = BNE_INS
         else
            branch = BEQ_INS
      when (LONG_INT_MODE, LONG_UNS_MODE)
         if (cond)
            branch = BLNE_INS
         else
            branch = BLEQ_INS
      when (FLOAT_MODE, LONG_FLOAT_MODE)
         if (cond)
            branch = BFNE_INS
         else
            branch = BFEQ_INS
   else
      call panic ("*i:  bad convert destination mode in flow*n"p,
         Tmem (expr + 2))

   flow_convert = seq (flow_convert, gen_branch (branch, label))

   return
   end



# flow_if --- evaluate conditional expression, flow on result

   ipointer function flow_if (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer flow, flow, gen_generic, gen_mr, gen_label, seq

   integer else_lab, exit_lab, ad (ADDR_DESC_SIZE)
   integer mklabel

   regset cregs, tregs, eregs

   if (Tmem (expr + 4) == 0) {         # no 'else' part
      exit_lab = mklabel (1)
      flow_if = seq (flow (Tmem (expr + 2), cregs, FALSE, exit_lab),
         flow (Tmem (expr + 3), tregs, cond, label),
         gen_label (exit_lab))
      eregs = 0
      }
   else if (Tmem (expr + 3) == 0) {    # no 'then' part
      exit_lab = mklabel (1)
      flow_if = seq (flow (Tmem (expr + 2), cregs, TRUE, exit_lab),
         flow (Tmem (expr + 4), eregs, cond, label),
         gen_label (exit_lab))
      tregs = 0
      }
   else {                              # general case
      else_lab = mklabel (1)
      exit_lab = mklabel (1)
      AD_MODE (ad) = LABELED_AM
      AD_LABEL (ad) = exit_lab
      flow_if = seq (flow (Tmem (expr + 2), cregs, FALSE, else_lab),
         flow (Tmem (expr + 3), tregs, cond, label),
         gen_mr (JMP_INS, ad), gen_generic (FIN_INS),
         gen_label (else_lab),
         flow (Tmem (expr + 4), eregs, cond, label),
         gen_label (exit_lab))
      }

   regs = or (cregs, or (tregs, eregs))

   return
   end



# flow_sand --- pass flow-of-control down a sequence of conjunctions

   ipointer function flow_sand (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer flow, seq, gen_label

   integer lab
   integer mklabel

   regset lregs, rregs

   if (cond) {
      lab = mklabel (1)
      flow_sand = flow (Tmem (expr + 2), lregs, FALSE, lab)
      flow_sand = seq (flow_sand,
         flow (Tmem (expr + 3), rregs, TRUE, label),
         gen_label (lab))
      }
   else {
      flow_sand = flow (Tmem (expr + 2), lregs, FALSE, label)
      flow_sand = seq (flow_sand,
         flow (Tmem (expr + 3), rregs, FALSE, label))
      }

   regs = or (lregs, rregs)
   return
   end



# flow_seq --- pass control flow context down a sequence

   ipointer function flow_seq (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer void, flow, seq

   regset lregs, rregs

   if (Tmem (expr + 2) ~= 0) {
      flow_seq = void (Tmem (expr + 1), lregs)
      flow_seq = seq (flow_seq, flow (Tmem (expr + 2), rregs, cond, label))
      regs = or (lregs, rregs)
      }
   else
      flow_seq = flow (Tmem (expr + 1), regs, cond, label)

   return
   end



# flow_sor --- pass flow-of-control down a sequence of disjunctions

   ipointer function flow_sor (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer flow, seq, gen_label

   integer lab
   integer mklabel

   regset lregs, rregs

   if (cond) {
      flow_sor = flow (Tmem (expr + 2), lregs, TRUE, label)
      flow_sor = seq (flow_sor,
         flow (Tmem (expr + 3), rregs, TRUE, label))
      }
   else {
      lab = mklabel (1)
      flow_sor = flow (Tmem (expr + 2), lregs, TRUE, lab)
      flow_sor = seq (flow_sor,
         flow (Tmem (expr + 3), rregs, FALSE, label),
         gen_label (lab))
      }

   regs = or (lregs, rregs)
   return
   end



# flow_switch --- use multiway branch to determine control flow

   ipointer function flow_switch (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer load, seq

   integer branch

   flow_switch = load (expr, regs)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE)
         if (cond)
            branch = BNE_INS
         else
            branch = BEQ_INS
      when (LONG_INT_MODE, LONG_UNS_MODE)
         if (cond)
            branch = BLNE_INS
         else
            branch = BLEQ_INS
      when (FLOAT_MODE, LONG_FLOAT_MODE)
         if (cond)
            branch = BFNE_INS
         else
            branch = BFEQ_INS
   else
      call panic ("*i:  bad switch data mode in flow*n"p,
         Tmem (expr + 2))

   flow_switch = seq (flow_switch, gen_branch (branch, label))
   return
   end



# flow_eq --- branch on equality

   ipointer function flow_eq (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer l, r
   ipointer seq, gen_mr, gen_branch, ld, st, reach, flow

   tpointer right_op, left_op

   integer subtract, branch, opsize, lres, rres, lad (ADDR_DESC_SIZE),
      rad (ADDR_DESC_SIZE), tad (ADDR_DESC_SIZE)

   regset lregs, rregs, opreg

   logical safe

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         if (Tmem (right_op) == CONST_OP && Tmem (right_op + 3) == 0)
            return (flow (left_op, regs, ~cond, label))
         if (Tmem (left_op) == CONST_OP && Tmem (left_op + 3) == 0)
            return (flow (right_op, regs, ~cond, label))
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP && Tmem (right_op + 3) == 0
           && Tmem (right_op + 4) == 0)
            return (flow (left_op, regs, ~cond, label))
         if (Tmem (left_op) == CONST_OP && Tmem (left_op + 3) == 0
           && Tmem (left_op + 4) == 0)
            return (flow (right_op, regs, ~cond, label))
         subtract = SBL_INS
         opreg = L_REG
         opsize = 2
         }
      when (FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP && Tmem (right_op + 3) == 0
           && Tmem (right_op + 4) == 0)
            return (flow (left_op, regs, ~cond, label))
         if (Tmem (left_op) == CONST_OP && Tmem (left_op + 3) == 0
           && Tmem (left_op + 4) == 0)
            return (flow (right_op, regs, ~cond, label))
         subtract = FSB_INS
         opreg = F_REG
         opsize = 2
         }
      when (LONG_FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP && Tmem (right_op + 3) == 0
           && Tmem (right_op + 4) == 0 && Tmem (right_op + 5) == 0
           && Tmem (right_op + 6) == 0)
            return (flow (left_op, regs, ~cond, label))
         if (Tmem (left_op) == CONST_OP && Tmem (left_op + 3) == 0
           && Tmem (left_op + 4) == 0 && Tmem (left_op + 5) == 0
           && Tmem (left_op + 6) == 0)
            return (flow (right_op, regs, ~cond, label))
         subtract = DFSB_INS
         opreg = LF_REG
         opsize = 4
         }
   else
      call panic ("*i: bad flow EQ data mode*n"p, Tmem (expr + 1))

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
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCEQ_INS
            else
               branch = BCNE_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMEQ_INS
            else
               branch = BMNE_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFEQ_INS
            else
               branch = BFNE_INS
      flow_eq = seq (l, ld (opreg, lres, lad), r,
         gen_mr (subtract, rad), gen_branch (branch, label))
      }


   procedure p2 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCEQ_INS
            else
               branch = BCNE_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMEQ_INS
            else
               branch = BMNE_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFEQ_INS
            else
               branch = BFNE_INS
      flow_eq = seq (r, ld (opreg, rres, rad), l,
         gen_mr (subtract, lad), gen_branch (branch, label))
      }


   procedure p3 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCEQ_INS
            else
               branch = BCNE_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMEQ_INS
            else
               branch = BMNE_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFEQ_INS
            else
               branch = BFNE_INS
      flow_eq = seq (r, ld (opreg, rres, rad))
      flow_eq = seq (flow_eq, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subtract, tad), gen_branch (branch, label))
      }


   end



# flow_ge --- branch on greater-or-equal

   ipointer function flow_ge (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer l, r
   ipointer seq, gen_mr, gen_branch, ld, st, reach, flow, load, void

   integer subtract, branch, opsize, lres, rres, lad (ADDR_DESC_SIZE),
      rad (ADDR_DESC_SIZE), tad (ADDR_DESC_SIZE)

   regset lregs, rregs, opreg

   logical safe

   tpointer right_op, left_op

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BGE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BLT_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BLE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BGT_INS, label)))
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (UNS_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0)
            if (cond) {
               AD_MODE (tad) = LABELED_AM
               AD_LABEL (tad) = label
               return (seq (void (left_op, regs), gen_mr (JMP_INS, tad)))
               }
            else
               return (void (left_op, regs))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BEQ_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BNE_INS, label)))
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (LONG_INT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BLGE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BLLT_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BLLE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BLGT_INS, label)))
         subtract = SBL_INS
         opreg = L_REG
         opsize = 2
         }
      when (LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond) {
               AD_MODE (tad) = LABELED_AM
               AD_LABEL (tad) = label
               return (seq (void (left_op, regs), gen_mr (JMP_INS, tad)))
               }
            else
               return (void (left_op, regs))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BLEQ_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BLNE_INS, label)))
         subtract = SBL_INS
         opreg = L_REG
         opsize = 1
         }
      when (FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BFGE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BFLT_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BFLE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BFGT_INS, label)))
         subtract = FSB_INS
         opreg = F_REG
         opsize = 2
         }
      when (LONG_FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0
           && Tmem (right_op + 5) == 0 && Tmem (right_op + 6) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BFGE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BFLT_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0
           && Tmem (left_op + 5) == 0 && Tmem (left_op + 6) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BFLE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BFGT_INS, label)))
         subtract = DFSB_INS
         opreg = LF_REG
         opsize = 4
         }
   else
      call panic ("*i: bad flow GE data mode*n"p, Tmem (expr + 1))

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
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCGE_INS
            else
               branch = BCLT_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMGE_INS
            else
               branch = BMLT_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFGE_INS
            else
               branch = BFLT_INS
      flow_ge = seq (l, ld (opreg, lres, lad), r,
         gen_mr (subtract, rad), gen_branch (branch, label))
      }


   procedure p2 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCLE_INS
            else
               branch = BCGT_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMLE_INS
            else
               branch = BMGT_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFLE_INS
            else
               branch = BFGT_INS
      flow_ge = seq (r, ld (opreg, rres, rad), l,
         gen_mr (subtract, lad), gen_branch (branch, label))
      }


   procedure p3 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCGE_INS
            else
               branch = BCLT_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMGE_INS
            else
               branch = BMLT_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFGE_INS
            else
               branch = BFLT_INS
      flow_ge = seq (r, ld (opreg, rres, rad))
      flow_ge = seq (flow_ge, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subtract, tad), gen_branch (branch, label))
      }


   end
