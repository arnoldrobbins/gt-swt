# vcg_void --- evaluate side-effect expressions for code generator



# void --- evaluate expression for side effects (value not always returned)

   ipointer function void (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer load, void_addaa, void_postdec, void_postinc, void_seq,
      void_preinc, void_assign, void_if, void_switch, seq, gen_generic

DB call print (ERROUT, "void:*n"s)

   if (expr == 0) {
      void = 0
      regs = 0
      return
      }

   select (Tmem (expr))
      when (ADDAA_OP)
         {
DB       call print (ERROUT, "   ADDAA_OP*n"s)
         void = void_addaa (expr, regs)
         }
      when (ASSIGN_OP)
         {
DB       call print (ERROUT, "   ASSIGN_OP*n"s)
         void = void_assign (expr, regs)
         }
      when (IF_OP)
         {
DB       call print (ERROUT, "   IF_OP*n"s)
         void = void_if (expr, regs)
         }
      when (POSTDEC_OP)
         {
DB       call print (ERROUT, "   POSTDEC_OP*n"s)
         void = void_postdec (expr, regs)
         }
      when (POSTINC_OP)
         {
DB       call print (ERROUT, "   POSTINC_OP*n"s)
         void = void_postinc (expr, regs)
         }
      when (PREINC_OP)
         {
DB       call print (ERROUT, "   PREINC_OP*n"s)
         void = void_preinc (expr, regs)
         }
      when (SEQ_OP)
         {
DB       call print (ERROUT, "   SEQ_OP*n"s)
         void = void_seq (expr, regs)
         }
      when (SWITCH_OP)
         {
DB       call print (ERROUT, "   SWITCH_OP*n"s)
         void = void_switch (expr, regs)
         }
      when (DEFINE_STAT_OP)
         {
DB       call print (ERROUT, "   DEFINE_STAT_OP*n"s)
         void = seq (gen_generic (LINK_INS),
            load (expr, regs),
            gen_generic (PROC_INS))
         }
   else
      void = load (expr, regs)      # temporary kluge

   return
   end



# void_addaa --- calculate sum, store in left operand, void result

   ipointer function void_addaa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer gen_mr, gen_generic, load, seq, reach, void_field_asg_op

   integer res, ad (ADDR_DESC_SIZE)

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (void_field_asg_op (expr, regs))

   if (Tmem (expr + 1) == INT_MODE
     && Tmem (Tmem (expr + 3)) == CONST_OP
     && Tmem (Tmem (expr + 3) + 3) == 1) {
      void_addaa = reach (Tmem (expr + 2), regs, res, ad)
      if (res ~= IN_MEMORY) {
         call warning ("ADDAA left operand is not an lvalue*n"p)
         return (0)
         }
      return (seq (void_addaa, gen_mr (IRS_INS, ad),
         gen_generic (RCB_INS)))
      }

   return (load (expr, regs))
   end



# void_assign --- perform assignment, void the resulting value

   ipointer function void_assign (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer lregs, rregs

   ipointer st_field, load, seq

   if (Tmem (Tmem (expr + 2)) == FIELD_OP) {
      select (Tmem (expr + 1))
         when (INT_MODE, UNS_MODE, LONG_INT_MODE, LONG_UNS_MODE) {
            void_assign = seq (load (Tmem (expr + 3), rregs),
               st_field (Tmem (expr + 2), lregs))
            regs = or (lregs, rregs)
            return
            }
      else {
         call warning ("*i:  bad data mode used with bit field*n"p,
            Tmem (expr + 1))
         return (0)
         }
      }

   return (load (expr, regs))
   end



# void_if --- evaluate conditional expression; side effects only

   ipointer function void_if (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer void, flow, gen_generic, gen_mr, gen_label, seq

   integer else_lab, exit_lab, ad (ADDR_DESC_SIZE)
   integer mklabel

   regset cregs, tregs, eregs

   if (Tmem (expr + 4) == 0) {         # no 'else' part
      exit_lab = mklabel (1)
      void_if = flow (Tmem (expr + 2), cregs, FALSE, exit_lab)
      void_if = seq (void_if, void (Tmem (expr + 3), tregs),
         gen_label (exit_lab))
      eregs = 0
      }
   else if (Tmem (expr + 3) == 0) {    # no 'then' part
      exit_lab = mklabel (1)
      void_if = flow (Tmem (expr + 2), cregs, TRUE, exit_lab)
      void_if = seq (void_if, void (Tmem (expr + 4), eregs),
         gen_label (exit_lab))
      tregs = 0
      }
   else {                              # general case
      else_lab = mklabel (1)
      exit_lab = mklabel (1)
      AD_MODE (ad) = LABELED_AM
      AD_LABEL (ad) = exit_lab
      void_if = flow (Tmem (expr + 2), cregs, FALSE, else_lab)
      void_if = seq (void_if,
         void (Tmem (expr + 3), tregs),
         gen_mr (JMP_INS, ad), gen_generic (FIN_INS),
         gen_label (else_lab))
      void_if = seq (void_if,
         void (Tmem (expr + 4), eregs),
         gen_label (exit_lab))
      }

   regs = or (cregs, or (tregs, eregs))

   return
   end



# void_postdec --- decrement object, void the result

   ipointer function void_postdec (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, void_field_asg_op

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (void_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opins = SUB_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opins = SBL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         opins = FSB_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         opins = DFSB_INS
         }
   else {
      call warning ("*i: bad POSTDEC data mode*n"p, Tmem (expr + 1))
      regs = 0
      return (0)
      }

   l = reach (Tmem (expr + 2), lregs, lres, lad)
   r = reach (Tmem (expr + 3), rregs, rres, rad)

   if (rres == IN_ACCUMULATOR) {
      call warning ("right POSTDEC operand is not constant*n"p)
      regs = 0
      return (0)
      }
   select (AD_MODE (rad))
      when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM)
         ;
   else {
      call warning ("right POSTDEC operand is not constant*n"p)
      regs = 0
      return (0)
      }

   if (lres == IN_ACCUMULATOR) {
      call warning ("left POSTDEC operand is not an lvalue*n"p)
      regs = 0
      return (0)
      }

   void_postdec = seq (l,
      ld (opreg, lres, lad),
      gen_mr (opins, rad),
      st (opreg, lad))

   regs = or (opreg, lregs)
   return
   end



# void_postinc --- increment object, void result

   ipointer function void_postinc (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, gen_generic, void_field_asg_op

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (void_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opins = ADD_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opins = ADL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         opins = FAD_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         opins = DFAD_INS
         }
   else {
      call warning ("*i: bad POSTINC data mode*n"p, Tmem (expr + 1))
      regs = 0
      return (0)
      }

   l = reach (Tmem (expr + 2), lregs, lres, lad)
   r = reach (Tmem (expr + 3), rregs, rres, rad)

   if (rres == IN_ACCUMULATOR) {
      call warning ("right POSTINC operand is not constant*n"p)
      regs = 0
      return (0)
      }
   select (AD_MODE (rad))
      when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM)
         ;
   else {
      call warning ("right POSTINC operand is not constant*n"p)
      regs = 0
      return (0)
      }

   if (lres == IN_ACCUMULATOR) {
      call warning ("left POSTINC operand is not an lvalue*n"p)
      regs = 0
      return (0)
      }

   if (Tmem (expr + 1) == INT_MODE && AD_LIT1 (rad) == 1) {
      regs = lregs
      return (seq (l, gen_mr (IRS_INS, lad), gen_generic (RCB_INS)))
      }

   void_postinc = seq (l,
      ld (opreg, lres, lad),
      gen_mr (opins, rad),
      st (opreg, lad))

   regs = or (opreg, lregs)
   return
   end



# void_seq --- evaluate a sequence of ops for side effects only

   ipointer function void_seq (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer void, seq

   regset lregs, rregs

   void_seq = void (Tmem (expr + 1), lregs)
   void_seq = seq (void_seq, void (Tmem (expr + 2), rregs))
   regs = or (lregs, rregs)

   return
   end



# void_preinc --- increment object, void the result

   ipointer function void_preinc (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer load, seq, gen_generic, gen_mr, reach, void_field_asg_op

   integer res, ad (ADDR_DESC_SIZE)

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (void_field_asg_op (expr, regs))

   if (Tmem (expr + 1) == INT_MODE
     && Tmem (Tmem (expr + 3)) == CONST_OP
     && Tmem (Tmem (expr + 3) + 3) == 1) {
      void_preinc = reach (Tmem (expr + 2), regs, res, ad)
      if (res ~= IN_MEMORY) {
         call warning ("PREINC left operand is not an lvalue*n"p)
         return (0)
         }
      return (seq (void_preinc, gen_mr (IRS_INS, ad),
         gen_generic (RCB_INS)))
      }

   return (load (expr, regs))
   end



# void_switch --- evaluate multiway branch

   ipointer function void_switch (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer void, seq, gen_label, gen_switch

   tpointer cc

   integer cn

   unsigned clabs (MAXCASES), deflab

   regset cregs

   void_switch = gen_switch (expr, clabs, deflab, regs)

   cn = 0
   cc = Tmem (expr + 3)
   while (cc ~= 0)
      if (Tmem (cc) == CASE_OP) {
         cn += 1
         void_switch = seq (void_switch, gen_label (clabs (cn)),
            void (Tmem (cc + 2), cregs))
         regs |= cregs
         cc = Tmem (cc + 3)
         }
      else {   # Tmem (cc) == DEFAULT_OP
         void_switch = seq (void_switch, gen_label (deflab),
            void (Tmem (cc + 1), cregs))
         regs |= cregs
         cc = Tmem (cc + 2)
         }

   void_switch = seq (void_switch, gen_label (Break_stack (Break_sp)))
   Break_sp -= 1

   return
   end



