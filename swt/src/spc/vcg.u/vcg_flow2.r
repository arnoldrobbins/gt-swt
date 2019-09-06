# vcg_flow2 --- generate code for flow-of-control context operators



# flow_gt --- branch on greater-than

   ipointer function flow_gt (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer l, r
   ipointer seq, gen_mr, gen_branch, ld, st, reach, load, void

   integer subtract, branch, opsize, lres, rres, lad (ADDR_DESC_SIZE),
      rad (ADDR_DESC_SIZE), tad (ADDR_DESC_SIZE)

   regset lregs, rregs, opreg

   logical safe

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   tpointer left_op, right_op

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BGT_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BLE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BLT_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BGE_INS, label)))
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (UNS_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BNE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BEQ_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0)
            if (cond)
               return (void (right_op, regs))   # never branch
            else {
               AD_MODE (tad) = LABELED_AM
               AD_LABEL (tad) = label
               return (seq (void (right_op, regs),
                            gen_mr (JMP_INS, tad)))   # always branch
               }
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (LONG_INT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BLGT_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BLLE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BLLT_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BLGE_INS, label)))
         subtract = SBL_INS
         opreg = L_REG
         opsize = 2
         }
      when (LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BLNE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BLEQ_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
               return (void (right_op, regs))   # never branch
            else {
               AD_MODE (tad) = LABELED_AM
               AD_LABEL (tad) = label
               return (seq (void (right_op, regs),
                            gen_mr (JMP_INS, tad)))   # always branch
               }
         subtract = SBL_INS
         opreg = L_REG
         opsize = 2
         }
      when (FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BFGT_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BFLE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BFLT_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BFGE_INS, label)))
         subtract = FSB_INS
         opreg = F_REG
         opsize = 2
         }
      when (LONG_FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0
           && Tmem (right_op + 5) == 0 && Tmem (right_op + 6) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BFGT_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BFLE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0
           && Tmem (left_op + 5) == 0 && Tmem (left_op + 6) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BFLT_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BFGE_INS, label)))
         subtract = DFSB_INS
         opreg = LF_REG
         opsize = 4
         }
   else
      call panic ("*i: bad flow GT data mode*n"p, Tmem (expr + 1))

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
               branch = BCGT_INS
            else
               branch = BCLE_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMGT_INS
            else
               branch = BMLE_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFGT_INS
            else
               branch = BFLE_INS
      flow_gt = seq (l, ld (opreg, lres, lad), r,
         gen_mr (subtract, rad), gen_branch (branch, label))
      }


   procedure p2 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCLT_INS
            else
               branch = BCGE_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMLT_INS
            else
               branch = BMGE_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFLT_INS
            else
               branch = BFGE_INS
      flow_gt = seq (r, ld (opreg, rres, rad), l,
         gen_mr (subtract, lad), gen_branch (branch, label))
      }


   procedure p3 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCGT_INS
            else
               branch = BCLE_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMGT_INS
            else
               branch = BMLE_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFGT_INS
            else
               branch = BFLE_INS
      flow_gt = seq (r, ld (opreg, rres, rad))
      flow_gt = seq (flow_gt, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subtract, tad), gen_branch (branch, label))
      }


   end



# flow_le --- branch on less-than-or-equal

   ipointer function flow_le (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer l, r
   ipointer seq, gen_mr, gen_branch, ld, st, reach, load, void

   integer subtract, branch, opsize, lres, rres, lad (ADDR_DESC_SIZE),
      rad (ADDR_DESC_SIZE), tad (ADDR_DESC_SIZE)

   regset lregs, rregs, opreg

   logical safe

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   tpointer left_op, right_op

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BLE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BGT_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BGE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BLT_INS, label)))
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (UNS_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BEQ_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BNE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0)
            if (cond) {
               AD_MODE (tad) = LABELED_AM
               AD_LABEL (tad) = label
               return (seq (void (right_op, regs), gen_mr (JMP_INS, tad)))
               }
            else
               return (void (right_op, regs))
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (LONG_INT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BLLE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BLGT_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BLGE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BLLT_INS, label)))
         subtract = SBL_INS
         opreg = L_REG
         opsize = 2
         }
      when (LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BLEQ_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BLNE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond) {
               AD_MODE (tad) = LABELED_AM
               AD_LABEL (tad) = label
               return (seq (void (right_op, regs), gen_mr (JMP_INS, tad)))
               }
            else
               return (void (right_op, regs))
         subtract = SBL_INS
         opreg = L_REG
         opsize = 2
         }
      when (FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BFLE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BFGT_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BFGE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BFLT_INS, label)))
         subtract = FSB_INS
         opreg = F_REG
         opsize = 2
         }
      when (LONG_FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0
           && Tmem (right_op + 5) == 0 && Tmem (right_op + 6) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BFLE_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BFGT_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0
           && Tmem (left_op + 5) == 0 && Tmem (left_op + 6) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BFGE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BFLT_INS, label)))
         subtract = DFSB_INS
         opreg = LF_REG
         opsize = 4
         }
   else
      call panic ("*i: bad flow LE data mode*n"p, Tmem (expr + 1))

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
      flow_le = seq (l, ld (opreg, lres, lad), r,
         gen_mr (subtract, rad), gen_branch (branch, label))
      }


   procedure p2 {
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
      flow_le = seq (r, ld (opreg, rres, rad), l,
         gen_mr (subtract, lad), gen_branch (branch, label))
      }


   procedure p3 {
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
      flow_le = seq (r, ld (opreg, rres, rad))
      flow_le = seq (flow_le, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subtract, tad), gen_branch (branch, label))
      }


   end



# flow_lt --- branch on less-than

   ipointer function flow_lt (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer l, r
   ipointer seq, gen_mr, gen_branch, ld, st, reach, load, void

   integer subtract, branch, opsize, lres, rres, lad (ADDR_DESC_SIZE),
      rad (ADDR_DESC_SIZE), tad (ADDR_DESC_SIZE)

   regset lregs, rregs, opreg

   logical safe

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   tpointer left_op, right_op

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BLT_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BGE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BGT_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BLE_INS, label)))
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (UNS_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0)
            if (cond)
               return (void (left_op, regs))
            else {
               AD_MODE (tad) = LABELED_AM
               AD_LABEL (tad) = label
               return (seq (void (left_op, regs),
                            gen_mr (JMP_INS, tad)))
               }
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BNE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BEQ_INS, label)))
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (LONG_INT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BLLT_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BLGE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BLGT_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BLLE_INS, label)))
         subtract = SBL_INS
         opreg = L_REG
         opsize = 2
         }
      when (LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
               return (void (left_op, regs))
            else {
               AD_MODE (tad) = LABELED_AM
               AD_LABEL (tad) = label
               return (seq (void (left_op, regs),
                            gen_mr (JMP_INS, tad)))
               }
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BLNE_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BLEQ_INS, label)))
         subtract = SBL_INS
         opreg = L_REG
         opsize = 2
         }
      when (FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BFLT_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BFGE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BFGT_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BFLE_INS, label)))
         subtract = FSB_INS
         opreg = F_REG
         opsize = 2
         }
      when (LONG_FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP
           && Tmem (right_op + 3) == 0 && Tmem (right_op + 4) == 0
           && Tmem (right_op + 5) == 0 && Tmem (right_op + 6) == 0)
            if (cond)
            return (seq (load (left_op, regs), gen_branch (BFLT_INS, label)))
            else
            return (seq (load (left_op, regs), gen_branch (BFGE_INS, label)))
         if (Tmem (left_op) == CONST_OP
           && Tmem (left_op + 3) == 0 && Tmem (left_op + 4) == 0
           && Tmem (left_op + 5) == 0 && Tmem (left_op + 6) == 0)
            if (cond)
            return (seq (load (right_op, regs), gen_branch (BFGT_INS, label)))
            else
            return (seq (load (right_op, regs), gen_branch (BFLE_INS, label)))
         subtract = DFSB_INS
         opreg = LF_REG
         opsize = 4
         }
   else
      call panic ("*i: bad flow LT data mode*n"p, Tmem (expr + 1))

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
               branch = BCLT_INS
            else
               branch = BCGE_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMLT_INS
            else
               branch = BMGE_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFLT_INS
            else
               branch = BFGE_INS
      flow_lt = seq (l, ld (opreg, lres, lad), r,
         gen_mr (subtract, rad), gen_branch (branch, label))
      }


   procedure p2 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCGT_INS
            else
               branch = BCLE_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMGT_INS
            else
               branch = BMLE_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFGT_INS
            else
               branch = BFLE_INS
      flow_lt = seq (r, ld (opreg, rres, rad), l,
         gen_mr (subtract, lad), gen_branch (branch, label))
      }


   procedure p3 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCLT_INS
            else
               branch = BCGE_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMLT_INS
            else
               branch = BMGE_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFLT_INS
            else
               branch = BFGE_INS
      flow_lt = seq (r, ld (opreg, rres, rad))
      flow_lt = seq (flow_lt, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subtract, tad), gen_branch (branch, label))
      }


   end



# flow_ne --- branch on inequality

   ipointer function flow_ne (expr, regs, cond, label)
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
            return (flow (left_op, regs, cond, label))
         if (Tmem (left_op) == CONST_OP && Tmem (left_op + 3) == 0)
            return (flow (right_op, regs, cond, label))
         subtract = SUB_INS
         opreg = A_REG
         opsize = 1
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP && Tmem (right_op + 3) == 0
           && Tmem (right_op + 4) == 0)
            return (flow (left_op, regs, cond, label))
         if (Tmem (left_op) == CONST_OP && Tmem (left_op + 3) == 0
           && Tmem (left_op + 4) == 0)
            return (flow (right_op, regs, cond, label))
         subtract = SBL_INS
         opreg = L_REG
         opsize = 2
         }
      when (FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP && Tmem (right_op + 3) == 0
           && Tmem (right_op + 4) == 0)
            return (flow (left_op, regs, cond, label))
         if (Tmem (left_op) == CONST_OP && Tmem (left_op + 3) == 0
           && Tmem (left_op + 4) == 0)
            return (flow (right_op, regs, cond, label))
         subtract = FSB_INS
         opreg = F_REG
         opsize = 2
         }
      when (LONG_FLOAT_MODE) {
         if (Tmem (right_op) == CONST_OP && Tmem (right_op + 3) == 0
           && Tmem (right_op + 4) == 0 && Tmem (right_op + 5) == 0
           && Tmem (right_op + 6) == 0)
            return (flow (left_op, regs, cond, label))
         if (Tmem (left_op) == CONST_OP && Tmem (left_op + 3) == 0
           && Tmem (left_op + 4) == 0 && Tmem (left_op + 5) == 0
           && Tmem (left_op + 6) == 0)
            return (flow (right_op, regs, cond, label))
         subtract = DFSB_INS
         opreg = LF_REG
         opsize = 4
         }
   else
      call panic ("*i: bad flow NE data mode*n"p, Tmem (expr + 1))

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
               branch = BCNE_INS
            else
               branch = BCEQ_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMNE_INS
            else
               branch = BMEQ_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFNE_INS
            else
               branch = BFEQ_INS
      flow_ne = seq (l, ld (opreg, lres, lad), r,
         gen_mr (subtract, rad), gen_branch (branch, label))
      }


   procedure p2 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCNE_INS
            else
               branch = BCEQ_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMNE_INS
            else
               branch = BMEQ_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFNE_INS
            else
               branch = BFEQ_INS
      flow_ne = seq (r, ld (opreg, rres, rad), l,
         gen_mr (subtract, lad), gen_branch (branch, label))
      }


   procedure p3 {
      select (Tmem (expr + 1))
         when (INT_MODE, LONG_INT_MODE)
            if (cond)
               branch = BCNE_INS
            else
               branch = BCEQ_INS
         when (UNS_MODE, LONG_UNS_MODE)
            if (cond)
               branch = BMNE_INS
            else
               branch = BMEQ_INS
         when (FLOAT_MODE, LONG_FLOAT_MODE)
            if (cond)
               branch = BFNE_INS
            else
               branch = BFEQ_INS
      flow_ne = seq (r, ld (opreg, rres, rad))
      flow_ne = seq (flow_ne, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (subtract, tad), gen_branch (branch, label))
      }


   end



# flow_not --- branch on negated condition

   ipointer function flow_not (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   include VCG_COMMON

   ipointer flow

   return (flow (Tmem (expr + 2), regs, ~cond, label))
   end



# flow_field --- evaluate bit field in FLOW context

   ipointer function flow_field (expr, regs, cond, label)
   tpointer expr
   regset regs
   logical cond
   unsigned label

   ipointer fl_field

   return (fl_field (expr, regs, cond, label))
   end
