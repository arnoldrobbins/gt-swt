# vcg_load4 --- load expression values for code generator (part 4)



# load_postinc --- load object value, increment object

   ipointer function load_postinc (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, load_field_asg_op

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins, invins

   string mesg "load_postinc: "

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opins = ADD_INS
         invins = SUB_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opins = ADL_INS
         invins = SBL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         opins = FAD_INS
         invins = FSB_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         opins = DFAD_INS
         invins = DFSB_INS
         }
   else {
      call warning ("*sbad data mode *i*n"p, mesg, Tmem (expr + 1))
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

   load_postinc = seq (l,
      ld (opreg, lres, lad),
      gen_mr (opins, rad),
      st (opreg, lad),
      gen_mr (invins, rad))

   regs = or (opreg, lregs)
   return
   end



# load_predec --- decrement object, load new value

   ipointer function load_predec (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, load_field_asg_op

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins

   string mesg "load_predec: "

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

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
      call warning ("*sbad data mode *i*n"p, mesg, Tmem (expr + 1))
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

   load_predec = seq (l,
      ld (opreg, lres, lad),
      gen_mr (opins, rad),
      st (opreg, lad))

   regs = or (opreg, lregs)
   return
   end



# load_preinc --- increment object, load new value

   ipointer function load_preinc (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, load_field_asg_op

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins

   string mesg "load_predec: "

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

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
      call warning ("*sbad data mode *i*n"p, mesg, Tmem (expr + 1))
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

   load_preinc = seq (l,
      ld (opreg, lres, lad),
      gen_mr (opins, rad),
      st (opreg, lad))

   regs = or (opreg, lregs)
   return
   end



# load_proc_call --- call procedure, leave return value in accumulator

   ipointer function load_proc_call (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer arglist (ADDR_DESC_SIZE, MAXARGS), is_temp (MAXARGS),
      pad (ADDR_DESC_SIZE), i, nargs, opsize, res
   integer lookup_obj

   ipointer pc, ra
   ipointer seq, gen_mr, gen_ap, ld, st, reach

   tpointer arg

   logical safe

   regset opreg

DB call print (ERROUT, "load_proc_call:*n"s)
   pc = 0
   nargs = 0
   for (arg = Tmem (expr + 3); arg ~= 0; arg = Tmem (arg + 3)) {
      nargs += 1
      ra = reach (Tmem (arg + 2), regs, res, arglist (1, nargs))

      opsize = 0
      select (Tmem (arg + 1))
         when (INT_MODE, UNS_MODE) {
            opsize = 1
            opreg = A_REG
            }
         when (LONG_INT_MODE, LONG_UNS_MODE) {
            opsize = 2
            opreg = L_REG
            }
         when (FLOAT_MODE) {
            opsize = 2
            opreg = F_REG
            }
         when (LONG_FLOAT_MODE) {
            opsize = 4
            opreg = LF_REG
            }

      if (res == IN_ACCUMULATOR) {
         call alloc_temp (opsize, arglist (1, nargs))
         is_temp (nargs) = YES
         pc = seq (pc, ra, st (opreg, arglist (1, nargs)))
         }
      else if (~safe (regs, or (A_REG, or (F_REG, or (X_REG, XB_REG))))) {
         pc = seq (pc, ra, gen_mr (EAL_INS, arglist (1, nargs)))
         call alloc_temp (2, arglist (1, nargs))
         pc = seq (pc, gen_mr (STL_INS, arglist (1, nargs)))
         arglist (1, nargs) = INDIRECT_AM # SECRET KNOWLEDGE OF AD_MODE
         is_temp (nargs) = YES
         }
      else {   # arg is addressable by the AP itself
         pc = seq (pc, ra)
         is_temp (nargs) = NO
         }

      }  # for all args

   # Case the handling of the procedure address as follows:
   #  If the procedure address is an object that has not been
   #  declared, assume it is a procedure in the current module
   #  and forward-reference it using a label.
   #  If the procedure address is anything else, 'reach' it and
   #  proceed in the usual way.
   #  Note this kluge is necessary for C, where procedures can be
   #  referenced before any definition of them, but not for
   #  languages in the Algol/Pascal family.

   if (Tmem (expr + 2) ~= 0
     && Tmem (Tmem (expr + 2)) == OBJECT_OP
     && lookup_obj (Tmem (Tmem (expr + 2) + 2), pad) == NO) {
      AD_MODE (pad) = LABELED_AM
      AD_LABEL (pad) = Tmem (Tmem (expr + 2) + 2)  # the object id,
      pc = seq (pc, gen_mr (PCL_INS, pad))         # which labels the ECB
      }
   else {
      pc = seq (pc, reach (Tmem (expr + 2), regs, res, pad))
      if (res == IN_ACCUMULATOR) {
         call alloc_temp (2, pad)
         pc = seq (pc, st (L_REG, pad))
         AD_MODE (pad) = INDIRECT_AM
         pc = seq (pc, gen_mr (PCL_INS, pad))
         call free_temp (pad)
         }
      else
         pc = seq (pc, gen_mr (PCL_INS, pad))
      }

   for (i = 1; i < nargs; i += 1) {
      pc = seq (pc, gen_ap (arglist (1, i), STORE_AP, NOT_LAST_AP))
      if (is_temp (i) == YES)
         call free_temp (arglist (1, i))
      }
   if (i <= nargs) {
      pc = seq (pc, gen_ap (arglist (1, i), STORE_AP, LAST_AP))
      if (is_temp (i) == YES)
         call free_temp (arglist (1, i))
      }

   regs = ALL_REGS
   load_proc_call = pc
   return
   end



# load_refto --- place pointer to object in L_REG

   ipointer function load_refto (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer res, ad (ADDR_DESC_SIZE)

   ipointer reach, gen_mr, seq

   load_refto = reach (Tmem (expr + 2), regs, res, ad)

   if (res == IN_ACCUMULATOR) {
      call warning ("load_refto: expression must be lvalue*n"p)
      regs = 0
      return (0)
      }

   load_refto = seq (load_refto, gen_mr (EAL_INS, ad))
   regs |= L_REG

   return
   end



# load_remaa --- evaluate remainder, assign to left operand

   ipointer function load_remaa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   procedure p1 forward
   procedure p2 forward

   ipointer prep, l, r, post
   ipointer gen_generic, gen_mr, ld, st, reach, seq, load_field_asg_op

   regset opreg, lregs, rregs

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opsize, opins

   if (Tmem (Tmem (expr + 2)) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE) {
         opreg = A_REG     # and L register; we treat them similarly
         prep = gen_generic (PIDA_INS)
         post = gen_generic (TBA_INS)
         opsize = 1
         opins = DIV_INS
         }
      when (UNS_MODE) {
         opreg = A_REG
         prep = gen_generic (XCA_INS)
         post = gen_generic (TBA_INS)
         opsize = 1
         opins = DIV_INS
         }
      when (LONG_INT_MODE) {
         opreg = L_REG     # and also E, but we ignore that for now
         prep = gen_generic (PIDL_INS)
         post = gen_generic (ILE_INS)
         opsize = 2
         opins = DVL_INS
         }
      when (LONG_UNS_MODE) {
         opreg = L_REG
         prep = seq (gen_generic (ILE_INS), gen_generic (CRL_INS))
         post = gen_generic (ILE_INS)
         opsize = 2
         opins = DVL_INS
         }
   else
      call panic ("load_remaa: bad op mode *i*n"p, Tmem (expr + 1))

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
            p2
   else
      p2

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   return


   procedure p1 {
      load_remaa = seq (l, ld (opreg, lres, lad), prep,
         r, gen_mr (opins, rad), post, st (opreg, lad))
      }


   procedure p2 {
      load_remaa = seq (r, ld (opreg, rres, rad))
      load_remaa = seq (load_remaa, st (opreg, tad), l,
         ld (opreg, lres, lad), prep, gen_mr (opins, tad),
         post, st (opreg, lad))
      }


   end



# load_rem --- evaluate remainder, result in accumulator

   ipointer function load_rem (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   procedure p1 forward
   procedure p2 forward

   ipointer prep, l, r, post
   ipointer gen_generic, gen_mr, ld, st, reach, seq

   regset opreg, lregs, rregs

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opsize, opins

   select (Tmem (expr + 1))
      when (INT_MODE) {
         opreg = A_REG     # and L register; we treat them similarly
         prep = gen_generic (PIDA_INS)
         post = gen_generic (TBA_INS)
         opsize = 1
         opins = DIV_INS
         }
      when (UNS_MODE) {
         opreg = A_REG
         prep = gen_generic (XCA_INS)
         post = gen_generic (TBA_INS)
         opsize = 1
         opins = DIV_INS
         }
      when (LONG_INT_MODE) {
         opreg = L_REG     # and also E, but we ignore that for now
         prep = gen_generic (PIDL_INS)
         post = gen_generic (ILE_INS)
         opsize = 2
         opins = DVL_INS
         }
      when (LONG_UNS_MODE) {
         opreg = L_REG
         prep = seq (gen_generic (ILE_INS), gen_generic (CRL_INS))
         post = gen_generic (ILE_INS)
         opsize = 2
         opins = DVL_INS
         }
   else
      call panic ("load_rem: bad op mode *i*n"p, Tmem (expr + 1))

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
      load_rem = seq (l, ld (opreg, lres, lad), prep,
         r, gen_mr (opins, rad), post)
      }


   procedure p2 {
      load_rem = seq (r, ld (opreg, rres, rad))
      load_rem = seq (load_rem, st (opreg, tad), l,
         ld (opreg, lres, lad), prep, gen_mr (opins, tad), post)
      }


   end



# load_return --- evaluate expression, return from procedure

   ipointer function load_return (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer gen_generic, load, seq

   load_return = seq (load (Tmem (expr + 1), regs),
      gen_generic (PRTN_INS))

   return
   end




# load_rshiftaa --- evaluate right shift, assign result to left operand

   ipointer function load_rshiftaa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON
   include RTR_COMMON

   ipointer l, r
   ipointer gen_generic, gen_mr, reach, ld, st, seq, rshift_a_by,
      rshift_l_by, arshift_a_by, arshift_l_by, load_field_asg_op,
      load_rtr_ip

   integer tad (ADDR_DESC_SIZE), cad (ADDR_DESC_SIZE),
      rad (ADDR_DESC_SIZE), opreg, opsize, res, rres,
      lad (ADDR_DESC_SIZE), lookup_obj, shift, junk

   regset rregs

   unsigned shift_id

   tpointer left_op, right_op

   string mesg "load_rshiftaa: "

DB call print (ERROUT, "*s*n"s, mesg)
   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   if (Tmem (left_op) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, res, tad)
            regs |= A_REG
            return (seq (l, ld (A_REG, res, tad),
               arshift_a_by (Tmem (right_op + 3)),
               st (A_REG, tad)))
            }
         opreg = A_REG
         shift_id = rt_shft_int                # object id
         shift = C$RSHFSS
         }
      when (UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, res, tad)
            regs |= A_REG
            return (seq (l, ld (A_REG, res, tad),
               rshift_a_by (Tmem (right_op + 3)),
               st (A_REG, tad)))
            }
         opreg = A_REG
         shift_id = rt_shft_uns                # object id
         shift = C$RSHFUS
         }
      when (LONG_INT_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, res, tad)
            regs |= L_REG
            return (seq (l, ld (L_REG, res, tad),
               arshift_l_by (Tmem (right_op + 3)),
               st (L_REG, tad)))
            }
         opreg = L_REG
         shift_id = rt_shft_long               # object id
         shift = C$RSHFSL
         }
      when (LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, res, tad)
            regs |= L_REG
            return (seq (l, ld (L_REG, res, tad),
               rshift_l_by (Tmem (right_op + 3)),
               st (L_REG, tad)))
            }
         opreg = L_REG
         shift_id = rt_shft_longuns               # object id
         shift = C$RSHFUL
         }
   else
      call panic ("*sbad data mode *i*n"p, mesg, Tmem (expr + 1))

   r = load_rtr_ip (shift, shift_id)

   # get shift count into X register
   r = seq (r, reach (Tmem (expr + 3), rregs, rres, rad))
#
#   r = seq (r, ld (X_REG, rres, rad))
#
   if (rres == IN_MEMORY)
      r = seq (r, gen_mr (LDX_INS, rad))
   else
      r = seq (r, gen_generic (TAX_INS))
      # assume it's in the right register

   junk = lookup_obj (shift_id, tad)

   # put the operand in register & jump to shift routine
   l = reach (Tmem (expr + 2), regs, res, lad)
   regs |= rregs
   l = seq (l, ld (opreg, res, lad), gen_mr (JSXB_INS, tad),
      st (opreg, lad))

   regs |= A_REG
   load_rshiftaa = seq (r, l)

   return
   end



# load_rshift --- evaluate right shift, leave result in accumulator

   ipointer function load_rshift (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON
   include RTR_COMMON

   ipointer l, r
   ipointer gen_generic, gen_mr, reach, ld, st, seq, load,
      rshift_a_by, rshift_l_by, arshift_a_by, arshift_l_by,
      load_rtr_ip

   integer tad (ADDR_DESC_SIZE), cad (ADDR_DESC_SIZE),
      rad (ADDR_DESC_SIZE), opreg, opsize, res, rres,
      lad (ADDR_DESC_SIZE), lookup_object, shift, junk

   unsigned shift_id

   regset rregs

   tpointer left_op, right_op

   string mesg "load_rshift: "

DB call print (ERROUT, "*s*n"s, mesg)
   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               arshift_a_by (Tmem (right_op + 3))))
         opreg = A_REG
         shift_id = rt_shft_int                # object id
         shift = C$RSHFSS
         }
      when (UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               rshift_a_by (Tmem (right_op + 3))))
         opreg = A_REG
         shift_id = rt_shft_uns                # object id
         shift = C$RSHFUS
         }
      when (LONG_INT_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               arshift_l_by (Tmem (right_op + 3))))
         opreg = L_REG
         shift_id = rt_shft_long               # object id
         shift = C$RSHFSL
         }
      when (LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               rshift_l_by (Tmem (right_op + 3))))
         opreg = L_REG
         shift_id = rt_shft_longuns            # object id
         shift = C$RSHFUL
         }
   else
      call panic ("*sbad data mode *i*n"p, mesg, Tmem (expr + 1))

   r = load_rtr_ip (shift, shift_id)

   # get shift count into X register
   r = seq (r, reach (Tmem (expr + 3), rregs, rres, rad))
#
#   r = seq (r, ld (X_REG, rres, rad))
#
   if (rres == IN_MEMORY)
      r = seq (r, gen_mr (LDX_INS, rad))
   else
      r = seq (r, gen_generic (TAX_INS))
      # assume it's in the right register

   junk = lookup_obj (shift_id, tad)

   # put the operand in register & jump to shift routine
   l = reach (Tmem (expr + 2), regs, res, lad)
   regs |= rregs
   l = seq (l, ld (opreg, res, lad), gen_mr (JSXB_INS, tad))

   regs |= A_REG
   load_rshift = seq (r, l)

   return
   end




# load_rtr_ip --- load code to build IP to external run time routine

   ipointer function load_rtr_ip (name, rtr_id)
   integer name            # table index of rtr name
   unsigned rtr_id    # initialized as large uns. int.

   include VCG_COMMON
DB include RTR_COMMON

   unsigned rsv_link

   integer ad (ADDR_DESC_SIZE), lookup_obj

   ipointer seq, gen_ext_rtr, gen_label, gen_ip_rtr, gen_generic

DB call print (ERROUT, "load_rtr_ip: *s*n"s,
DB                   rtr_text (rtr_pos (name + 1) + 1))

   # only emit this code once
   if (lookup_obj (rtr_id, ad) == NO)
      {
      AD_MODE (ad) = INDIRECT_AM
      AD_BASE (ad) = LB_REG
      AD_OFFSET (ad) = rsv_link (2)
      AD_RESOLVED (ad) = YES
DB    call print (ERROUT, "   new ip at LB%+'*,-8i*n"s, AD_OFFSET (ad))
      call enter_obj (rtr_id, ad)

      load_rtr_ip = seq ( gen_generic (LINK_INS),
         gen_ext_rtr (name),
         gen_label (rtr_id),
         gen_ip_rtr (name),
         gen_generic (PROC_INS))
      }
   else
      load_rtr_ip = 0

   return
   end


# load_sand --- evaluate sequential 'and', result in accumulator

   ipointer function load_sand (expr, regs)
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
         branch = BEQ_INS
      when (LONG_INT_MODE, LONG_UNS_MODE)
         branch = BLEQ_INS
      when (FLOAT_MODE, LONG_FLOAT_MODE)
         branch = BFEQ_INS
   else
      call panic ("load_sand: bad data mode*i*n"p, Tmem (expr + 1))

   load_sand = seq (l, gen_branch (branch, lab), r, gen_label (lab))
   regs = or (lregs, rregs)

   return
   end



# load_select --- load selected structure field

   ipointer function load_select (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer reach, seq, gen_mr

   integer res, ad (ADDR_DESC_SIZE), opins

   string mesg "load_select: "

   load_select = reach (expr, regs, res, ad)

   if (res == IN_MEMORY) {
      select (Tmem (expr + 1))
         when (INT_MODE, UNS_MODE) {
            opins = LDA_INS
            regs |= A_REG
            }
         when (LONG_INT_MODE, LONG_UNS_MODE) {
            opins = LDL_INS
            regs |= L_REG
            }
         when (FLOAT_MODE) {
            opins = FLD_INS
            regs |= F_REG
            }
         when (LONG_FLOAT_MODE) {
            opins = DFLD_INS
            regs |= LF_REG
            }
      else {
         call warning ("*sbad data mode*i*n"p, mesg, Tmem (expr + 1))
         return (0)
         }
      load_select = seq (load_select, gen_mr (opins, ad))
      }
   else {
      call warning ("*sstruct field returned in accumulator*n"p, mesg)
      return (0)
      }

   return
   end



# load_seq --- evaluate two subexpressions in sequence

   ipointer function load_seq (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer load, void, seq

   regset lregs

   if (Tmem (expr + 2) ~= 0) {
      load_seq = void (Tmem (expr + 1), lregs)
      load_seq = seq (load_seq, load (Tmem (expr + 2), regs))
      regs |= lregs
      }
   else
      load_seq = load (Tmem (expr + 1), regs)

   return
   end
