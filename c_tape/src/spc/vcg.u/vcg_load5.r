# vcg_load5 --- load expression values for code generator (part 5)



# load_sor --- evaluate sequential 'or', result in accumulator

   ipointer function load_sor (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer l, r
   ipointer seq, load, gen_branch, gen_label

   integer lab, branch
   integer mklabel

   regset rregs, lregs

   lab = mklabel (1)
   l = load (Tmem (expr + 2), lregs)
   r = load (Tmem (expr + 3), rregs)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE)
         branch = BNE_INS
      when (LONG_INT_MODE, LONG_UNS_MODE)
         branch = BLNE_INS
      when (FLOAT_MODE, LONG_FLOAT_MODE)
         branch = BFNE_INS
   else
      call panic ("load_sor: bad data mode*i*n"p, Tmem (expr + 1))

   load_sor = seq (l, gen_branch (branch, lab), r, gen_label (lab))
   regs = or (lregs, rregs)

   return
   end



# load_subaa --- subtract, assign difference to left operand

   ipointer function load_subaa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, gen_generic, load_field_asg_op

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opsize, opins, tad (ADDR_DESC_SIZE), compins

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opsize = 1
         opins = SUB_INS
         compins = TCA_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opsize = 2
         opins = SBL_INS
         compins = TCL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         opsize = 2
         opins = FSB_INS
         compins = FCM_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         opsize = 4
         opins = DFSB_INS
         compins = DFCM_INS
         }
   else
      call panic ("load_subaa: bad data mode *i*n"p, Tmem (expr + 1))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select
      when (safe (lregs, opreg) && safe (rregs, opreg))
         if (safe (lregs, rregs))
            p1
         else
            p2
      when (~safe (lregs, opreg) && safe (rregs, opreg))
         if (safe (lregs, rregs))
            p1
         else
            p3
      when (safe (lregs, opreg) && ~safe (rregs, opreg))
         p2
   else
      p3

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   return


   procedure p1 {
      load_subaa = seq (l, ld (opreg, lres, lad), r, gen_mr (opins, rad),
         st (opreg, lad))
      }


   procedure p2 {
      load_subaa = seq (r, ld (opreg, rres, rad), l, gen_mr (opins, lad),
         gen_generic (compins), st (opreg, lad))
      }


   procedure p3 {
      load_subaa = seq (r, ld (opreg, rres, rad))
      load_subaa = seq (load_subaa, st (opreg, tad), l,
         ld (opreg, lres, lad), gen_mr (opins, tad), st (opreg, lad))
      }


   end



# load_sub --- subtract, leave result in accumulator

   ipointer function load_sub (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe, op_has_value

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, gen_generic, load

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opsize, opins, tad (ADDR_DESC_SIZE), compins, i

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opsize = 1
         opins = SUB_INS
         compins = TCA_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opsize = 2
         opins = SBL_INS
         compins = TCL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         opsize = 2
         opins = FSB_INS
         compins = FCM_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         opsize = 4
         opins = DFSB_INS
         compins = DFCM_INS
         }
   else
      call panic ("load_sub: bad data mode *i*n"p, Tmem (expr + 1))

   if (op_has_value (Tmem (expr + 3), 0))
      return (load (Tmem (expr + 2), regs))

   if (op_has_value (Tmem (expr + 2), 0))
      return (seq (load (Tmem (expr + 3), regs), gen_generic (compins)))

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
      load_sub = seq (l, ld (opreg, lres, lad), r, gen_mr (opins, rad))
      }


   procedure p2 {
      load_sub = seq (r, ld (opreg, rres, rad), l, gen_mr (opins, lad),
         gen_generic (compins))
      }


   procedure p3 {
      load_sub = seq (r, ld (opreg, rres, rad))
      load_sub = seq (load_sub, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (opins, tad))
      }


   end



# load_switch --- evaluate multiway branch

   ipointer function load_switch (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer load, seq, gen_label, gen_switch

   tpointer cc

   integer cn

   unsigned clabs (MAXCASES), deflab

   regset cregs

   load_switch = gen_switch (expr, clabs, deflab, regs)

   cn = 0
   cc = Tmem (expr + 3)
   while (cc ~= 0)
      if (Tmem (cc) == CASE_OP) {
         cn += 1
         load_switch = seq (load_switch, gen_label (clabs (cn)),
            load (Tmem (cc + 2), cregs))
         regs |= cregs
         cc = Tmem (cc + 3)
         }
      else {   # Tmem (cc) == DEFAULT_OP
         load_switch = seq (load_switch, gen_label (deflab),
            load (Tmem (cc + 1), cregs))
         regs |= cregs
         cc = Tmem (cc + 2)
         }

   load_switch = seq (load_switch, gen_label (Break_stack (Break_sp)))
   Break_sp -= 1

   return
   end



# load_undefine_dynm --- deallocate space for local object

   ipointer function load_undefine_dynm (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer ad (ADDR_DESC_SIZE)
   integer lookup_obj

DB call print (ERROUT, "load_undefine_dynm:*n"s)
   if (lookup_obj (Tmem (expr + 1), ad) == YES) {
      call free_stack (AD_OFFSET (ad))
      call delete_obj (Tmem (expr + 1))
      }
   else
      call warning ("load_undefine_dynm: bad object *i*n"p,
         Tmem (expr + 1))

   load_undefine_dynm = 0
   regs = 0
   return
   end



# load_while_loop --- generate iteration with test-at-the-top

   ipointer function load_while_loop (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer cad (ADDR_DESC_SIZE), bodylab
   integer mklabel

   ipointer seq, gen_label, gen_mr, gen_generic, void, flow, code

   regset cregs

   if (Break_sp + 1 > MAX_BREAK_SP)
      call panic ("while loops nested too deeply: break stack overflow*n"p)
   Break_sp += 1
   Break_stack (Break_sp) = mklabel (1)
DB call print (ERROUT, "   break label = *,-8i*n"s, Break_stack (Break_sp))

   if (Continue_sp + 1 > MAX_CONTINUE_SP)
      call panic ("while loops nested too deeply: continue stack overflow*n"p)
   Continue_sp += 1
   Continue_stack (Continue_sp) = mklabel (1)
DB call print (ERROUT, "   contin label = *,-8i*n"s, Continue_stack (Continue_sp))

   bodylab = mklabel (1)
DB call print (ERROUT, "   body label = *,-8i*n"s, bodylab)

   AD_MODE (cad) = LABELED_AM
   AD_LABEL (cad) = Continue_stack (Continue_sp)
   load_while_loop = seq (gen_mr (JMP_INS, cad),      # start labels
      gen_generic (FIN_INS),
      gen_label (bodylab))
   load_while_loop = seq (load_while_loop,            # body
      void (Tmem (expr + 2), regs),
      gen_label (Continue_stack (Continue_sp)))
   load_while_loop = seq (load_while_loop,            # check condition
      flow (Tmem (expr + 1), cregs, TRUE, bodylab),
      gen_label (Break_stack (Break_sp)))
   regs |= cregs

   Break_sp -= 1
   Continue_sp -= 1

   return
   end



# load_xoraa --- exclusive or, assign result to left operand

   ipointer function load_xoraa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   regset lregs, rregs, opreg

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins, opsize, tad (ADDR_DESC_SIZE)

   ipointer l, r
   ipointer seq, gen_mr, ld, st, reach, load_field_asg_op

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opins = ERA_INS
         opsize = 1
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opins = ERL_INS
         opsize = 2
         }
   else
      call panic ("load_xoraa: bad data mode *i*n"p, Tmem (expr + 1))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select
      when (safe (opreg, lregs) && safe (opreg, rregs))
         if (safe (lregs, rregs))
            p1
         else
            p2
      when (safe (opreg, rregs) && ~safe (opreg, lregs))
         if (safe (lregs, rregs))
            p1
         else
            p3
      when (~safe (opreg, rregs) && safe (opreg, lregs))
         p2
   else
      p3

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   return


   procedure p1 {
      load_xoraa = seq (l, ld (opreg, lres, lad), r,
         gen_mr (opins, rad), st (opreg, lad))
      }


   procedure p2 {
      load_xoraa = seq (r, ld (opreg, rres, rad), l,
         gen_mr (opins, lad), st (opreg, lad))
      }


   procedure p3 {
      load_xoraa = seq (r, ld (opreg, rres, rad))
      load_xoraa = seq (load_xoraa, st (opreg, tad), l,
         ld (opreg, lres, lad), gen_mr (opins, tad), st (opreg, lad))
      }

   end



# load_xor --- exclusive or, leave result in accumulator

   ipointer function load_xor (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   regset lregs, rregs, opreg

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins, opsize, tad (ADDR_DESC_SIZE)

   ipointer l, r
   ipointer seq, gen_mr, ld, st, reach

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opins = ERA_INS
         opsize = 1
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opins = ERL_INS
         opsize = 2
         }
   else
      call panic ("load_xor: bad data mode *i*n"p, Tmem (expr + 1))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select
      when (safe (opreg, lregs) && safe (opreg, rregs))
         p1
      when (~safe (opreg, rregs) && safe (opreg, lregs))
         p2
      when (safe (opreg, rregs) && ~safe (opreg, lregs))
         p1
   else
      p3

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   return


   procedure p1 {
      load_xor = seq (l, ld (opreg, lres, lad), r, gen_mr (opins, rad))
      }


   procedure p2 {
      load_xor = seq (r, ld (opreg, rres, rad), l, gen_mr (opins, lad))
      }


   procedure p3 {
      load_xor = seq (r, ld (opreg, rres, rad))
      load_xor = seq (load_xor, st (opreg, tad), l,
         ld (opreg, lres, lad), gen_mr (opins, tad))
      }


   end



# load_check_range --- see if value is within a given range

   ipointer function load_check_range (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer i, l, u
   ipointer load, reach, seq, ld, st, load_rtr_ip, gen_data, gen_mr

   integer lad (ADDR_DESC_SIZE), uad (ADDR_DESC_SIZE), rtr_ad (ADDR_DESC_SIZE),
      temps_used, lres, ures, opsize, rtr, rtr_id, junk, lookup_obj

   regset lregs, uregs, opreg

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opsize = 1
         opreg = A_REG
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opsize = 2
         opreg = L_REG
         }
   else {
      call warning ("load_check_range: bad data mode *i*n"p,
         Tmem (expr + 1))
      return (0)
      }

   l = reach (Tmem (expr + 3), lregs, lres, lad)
   u = reach (Tmem (expr + 4), uregs, ures, uad)

   if (lres ~= IN_MEMORY || ures ~= IN_MEMORY
     || (AD_MODE (lad) ~= ILIT_AM && AD_MODE (lad) ~= LLIT_AM)
     || (AD_MODE (uad) ~= ILIT_AM && AD_MODE (uad) ~= LLIT_AM)) {
      temps_used = YES
      l = seq (l, ld (opreg, lres, lad))
      call alloc_temp (opsize, lad)
      l = seq (l, st (opreg, lad))
      u = seq (u, ld (opreg, ures, uad))
      call alloc_temp (opsize, uad)
      u = seq (u, st (opreg, uad))
      }
   else
      temps_used = NO

   select (Tmem (expr + 1))
      when (INT_MODE)
         if (temps_used == NO)
            {
            rtr = V$CIRNG
            rtr_id = v$cirng_id
            }
         else
            {
            rtr = V$VIRNG
            rtr_id = v$virng_id
            }
      when (UNS_MODE)
         if (temps_used == NO)
            {
            rtr = V$CURNG
            rtr_id = v$curng_id
            }
         else
            {
            rtr = V$VURNG
            rtr_id = v$vurng_id
            }
      when (LONG_INT_MODE)
         if (temps_used == NO)
            {
            rtr = V$CLRNG
            rtr_id = v$clrng_id
            }
         else
            {
            rtr = V$VLRNG
            rtr_id = v$vlrng_id
            }
      when (LONG_UNS_MODE)
         if (temps_used == NO)
            {
            rtr = V$CVRNG
            rtr_id = v$cvrng_id
            }
         else
            {
            rtr = V$VVRNG
            rtr_id = v$vvrng_id
            }

   i = seq (l, load (Tmem (expr + 2), regs),
      load_rtr_ip (rtr, rtr_id))
   junk = lookup_obj (rtr_id, rtr_ad)
   i = seq (i, gen_mr (JSXB_INS, rtr_ad))

   if (temps_used == YES) {
      i = seq (i, gen_data (AD_OFFSET (lad)), gen_data (AD_OFFSET (uad)))
      call free_temp (lad)
      call free_temp (uad)
      }
   else {
      if (Tmem (expr + 1) == INT_MODE || Tmem (expr + 1) == UNS_MODE)
         i = seq (i, gen_data (AD_LIT1 (lad)), gen_data (AD_LIT1 (uad)))
      else
         i = seq (i, gen_data (AD_LIT1 (lad)), gen_data (AD_LIT2 (lad)),
               gen_data (AD_LIT1 (uad)), gen_data (AD_LIT2 (uad)))
      }
   i = seq (i, gen_data (Tmem (expr + 5)))

   regs = ALL_REGS
   return (i)
   end



# load_check_upper --- see if value is less than or equal to an upper bound

   ipointer function load_check_upper (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer i, u
   ipointer load, reach, seq, ld, st, load_rtr_ip, gen_data, gen_mr

   integer uad (ADDR_DESC_SIZE), rtr_ad (ADDR_DESC_SIZE),
      temps_used, ures, opsize, rtr, junk, rtr_id, lookup_obj

   regset uregs, opreg


   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opsize = 1
         opreg = A_REG
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opsize = 2
         opreg = L_REG
         }
   else {
      call warning ("load_check_upper: bad data mode *i*n"p,
         Tmem (expr + 1))
      return (0)
      }

   u = reach (Tmem (expr + 3), uregs, ures, uad)

   if (ures ~= IN_MEMORY
     || (AD_MODE (uad) ~= ILIT_AM && AD_MODE (uad) ~= LLIT_AM)) {
      temps_used = YES
      u = seq (u, ld (opreg, ures, uad))
      call alloc_temp (opsize, uad)
      u = seq (u, st (opreg, uad))
      }
   else
      temps_used = NO

   select (Tmem (expr + 1))
      when (INT_MODE)
         if (temps_used == NO)
            {
            rtr_id = v$ciupb_id
            rtr = V$CIUPB
            }
         else
            {
            rtr_id = v$viupb_id
            rtr = V$VIUPB
            }
      when (UNS_MODE)
         if (temps_used == NO)
            {
            rtr_id = v$cuupb_id
            rtr = V$CUUPB
            }
         else
            {
            rtr_id = v$vuupb_id
            rtr = V$VUUPB
            }
      when (LONG_INT_MODE)
         if (temps_used == NO)
            {
            rtr_id = v$clupb_id
            rtr = V$CLUPB
            }
         else
            {
            rtr_id = v$vlupb_id
            rtr = V$VLUPB
            }
      when (LONG_UNS_MODE)
         if (temps_used == NO)
            {
            rtr_id = v$cvupb_id
            rtr = V$CVUPB
            }
         else
            {
            rtr_id = v$vvupb_id
            rtr = V$VVUPB
            }

   i = seq (u, load (Tmem (expr + 2), regs),
      load_rtr_ip (rtr, rtr_id))
   junk = lookup_obj (rtr_id, rtr_ad)
   i = seq (i, gen_mr (JSXB_INS, rtr_ad))

   if (temps_used == YES) {
      i = seq (i, gen_data (AD_OFFSET (uad)))
      call free_temp (uad)
      }
   else {
      if (Tmem (expr + 1) == INT_MODE || Tmem (expr + 1) == UNS_MODE)
         i = seq (i, gen_data (AD_LIT1 (uad)))
      else
         i = seq (i, gen_data (AD_LIT1 (uad)), gen_data (AD_LIT2 (uad)))
      }
   i = seq (i, gen_data (Tmem (expr + 4)))

   regs = ALL_REGS
   return (i)
   end



# load_check_lower --- see if value is greater than or equal to a lower bound



   ipointer function load_check_lower (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer i, l
   ipointer load, reach, seq, ld, st, load_rtr_ip, gen_data, gen_mr

   integer lad (ADDR_DESC_SIZE), rtr_ad (ADDR_DESC_SIZE), rtr_id,
      temps_used, lres, opsize, rtr, junk, lookup_obj

   regset lregs, opreg

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opsize = 1
         opreg = A_REG
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opsize = 2
         opreg = L_REG
         }
   else {
      call warning ("load_check_lower: bad data mode *i*n"p,
         Tmem (expr + 1))
      return (0)
      }

   l = reach (Tmem (expr + 3), lregs, lres, lad)

   if (lres ~= IN_MEMORY
     || (AD_MODE (lad) ~= ILIT_AM && AD_MODE (lad) ~= LLIT_AM)) {
      temps_used = YES
      l = seq (l, ld (opreg, lres, lad))
      call alloc_temp (opsize, lad)
      l = seq (l, st (opreg, lad))
      }
   else
      temps_used = NO

   select (Tmem (expr + 1))
      when (INT_MODE)
         if (temps_used == NO)
            {
            rtr_id = v$cilwb_id
            rtr = V$CILWB
            }
         else
            {
            rtr_id = v$vilwb_id
            rtr = V$VILWB
            }
      when (UNS_MODE)
         if (temps_used == NO)
            {
            rtr_id = v$culwb_id
            rtr = V$CULWB
            }
         else
            {
            rtr_id = v$vulwb_id
            rtr = V$VULWB
            }
      when (LONG_INT_MODE)
         if (temps_used == NO)
            {
            rtr_id = v$cllwb_id
            rtr = V$CLLWB
            }
         else
            {
            rtr_id = v$vllwb_id
            rtr = V$VLLWB
            }
      when (LONG_UNS_MODE)
         if (temps_used == NO)
            {
            rtr_id = v$cvlwb_id
            rtr = V$CVLWB
            }
         else
            {
            rtr_id = v$vvlwb_id
            rtr = V$VVLWB
            }

   i = seq (l, load (Tmem (expr + 2), regs),
      load_rtr_ip (rtr, rtr_id))
   junk = lookup_obj (rtr_id, rtr_ad)
   i = seq (i, gen_mr (JSXB_INS, rtr_ad))

   if (temps_used == YES) {
      i = seq (i, gen_data (AD_OFFSET (lad)))
      call free_temp (lad)
      }
   else {
      if (Tmem (expr + 1) == INT_MODE || Tmem (expr + 1) == UNS_MODE)
         i = seq (i, gen_data (AD_LIT1 (lad)))
      else
         i = seq (i, gen_data (AD_LIT1 (lad)), gen_data (AD_LIT2 (lad)))
      }
   i = seq (i, gen_data (Tmem (expr + 4)))

   regs = ALL_REGS
   return (i)
   end
