# vcg_load1 --- load expression values for code generator (part 1)



# load --- load natural register with expression value

   ipointer function load (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer _
      load_addaa, load_add, load_andaa, load_and,
      load_assign, load_break, load_compl, load_const,
      load_convert, load_declare_stat, load_define_dynm, load_define_stat,
      load_deref, load_divaa, load_div, load_do_loop,
      load_eq, load_field, load_for_loop, load_ge, load_goto,
      load_gt, load_if, load_index, load_label,
      load_le, load_lshiftaa, load_lshift, load_lt,
      load_mulaa, load_mul, load_neg, load_next,
      load_not, load_ne, load_null, load_object, load_oraa,
      load_or, load_postdec, load_postinc, load_predec,
      load_preinc, load_proc_call, load_refto, load_remaa,
      load_rem, load_return, load_rshiftaa, load_rshift,
      load_sand, load_select, load_seq, load_sor,
      load_subaa, load_sub, load_switch, load_undefine_dynm,
      load_while_loop, load_xoraa, load_xor,
      load_check_range, load_check_upper, load_check_lower

   if (expr == 0) {
      load = 0
      regs = 0
      return
      }

   select (Tmem (expr))
      when (ADDAA_OP)
         {
DB       call print (ERROUT, "load: ADDAA_OP*n"s)
         load = load_addaa (expr, regs)
         }
      when (ADD_OP)
         {
DB       call print (ERROUT, "load: ADD_OP*n"s)
         load = load_add (expr, regs)
         }
      when (ANDAA_OP)
         {
DB       call print (ERROUT, "load: ANDAA_OP*n"s)
         load = load_andaa (expr, regs)
         }
      when (AND_OP)
         {
DB       call print (ERROUT, "load: AND_OP*n"s)
         load = load_and (expr, regs)
         }
      when (ASSIGN_OP)
         {
DB       call print (ERROUT, "load: ASSIGN_OP*n"s)
         load = load_assign (expr, regs)
         }
      when (BREAK_OP)
         {
DB       call print (ERROUT, "load: BREAK_OP*n"s)
         load = load_break (expr, regs)
         }
      when (COMPL_OP)
         {
DB       call print (ERROUT, "load: COMPL_OP*n"s)
         load = load_compl (expr, regs)
         }
      when (CONST_OP)
         {
DB       call print (ERROUT, "load: CONST_OP*n"s)
         load = load_const (expr, regs)
         }
      when (CONVERT_OP)
         {
DB       call print (ERROUT, "load: CONVERT_OP*n"s)
         load = load_convert (expr, regs)
         }
      when (DECLARE_STAT_OP)
         {
DB       call print (ERROUT, "load: DECLARE_STAT_OP*n"s)
         load = load_declare_stat (expr, regs)
         }
      when (DEFINE_DYNM_OP)
         {
DB       call print (ERROUT, "load: DEFINE_DYNM_OP*n"s)
         load = load_define_dynm (expr, regs)
         }
      when (DEFINE_STAT_OP)
         {
DB       call print (ERROUT, "load: DEFINE_STAT_OP*n"s)
         load = load_define_stat (expr, regs)
         }
      when (DEREF_OP)
         {
DB       call print (ERROUT, "load: DEREF_OP*n"s)
         load = load_deref (expr, regs)
         }
      when (DIVAA_OP)
         {
DB       call print (ERROUT, "load: DIVAA_OP*n"s)
         load = load_divaa (expr, regs)
         }
      when (DIV_OP)
         {
DB       call print (ERROUT, "load: DIV_OP*n"s)
         load = load_div (expr, regs)
         }
      when (DO_LOOP_OP)
         {
DB       call print (ERROUT, "load: DO_LOOP_OP*n"s)
         load = load_do_loop (expr, regs)
         }
      when (EQ_OP)
         {
DB       call print (ERROUT, "load: EQ_OP*n"s)
         load = load_eq (expr, regs)
         }
      when (FIELD_OP)
         {
DB       call print (ERROUT, "load: FIELD_OP*n"s)
         load = load_field (expr, regs)
         }
      when (FOR_LOOP_OP)
         {
DB       call print (ERROUT, "load: FOR_LOOP_OP*n"s)
         load = load_for_loop (expr, regs)
         }
      when (GE_OP)
         {
DB       call print (ERROUT, "load: GE_OP*n"s)
         load = load_ge (expr, regs)
         }
      when (GOTO_OP)
         {
DB       call print (ERROUT, "load: GOTO_OP*n"s)
         load = load_goto (expr, regs)
         }
      when (GT_OP)
         {
DB       call print (ERROUT, "load: GT_OP*n"s)
         load = load_gt (expr, regs)
         }
      when (IF_OP)
         {
DB       call print (ERROUT, "load: IF_OP*n"s)
         load = load_if (expr, regs)
         }
      when (INDEX_OP)
         {
DB       call print (ERROUT, "load: INDEX_OP*n"s)
         load = load_index (expr, regs)
         }
      when (LABEL_OP)
         {
DB       call print (ERROUT, "load: LABEL_OP*n"s)
         load = load_label (expr, regs)
         }
      when (LE_OP)
         {
DB       call print (ERROUT, "load: LE_OP*n"s)
         load = load_le (expr, regs)
         }
      when (LSHIFTAA_OP)
         {
DB       call print (ERROUT, "load: LSHIFTAA_OP*n"s)
         load = load_lshiftaa (expr, regs)
         }
      when (LSHIFT_OP)
         {
DB       call print (ERROUT, "load: LSHIFT_OP*n"s)
         load = load_lshift (expr, regs)
         }
      when (LT_OP)
         {
DB       call print (ERROUT, "load: LT_OP*n"s)
         load = load_lt (expr, regs)
         }
      when (MULAA_OP)
         {
DB       call print (ERROUT, "load: MULAA_OP*n"s)
         load = load_mulaa (expr, regs)
         }
      when (MUL_OP)
         {
DB       call print (ERROUT, "load: MUL_OP*n"s)
         load = load_mul (expr, regs)
         }
      when (NEG_OP)
         {
DB       call print (ERROUT, "load: NEG_OP*n"s)
         load = load_neg (expr, regs)
         }
      when (NEXT_OP)
         {
DB       call print (ERROUT, "load: NEXT_OP*n"s)
         load = load_next (expr, regs)
         }
      when (NE_OP)
         {
DB       call print (ERROUT, "load: NE_OP*n"s)
         load = load_ne (expr, regs)
         }
      when (NOT_OP)
         {
DB       call print (ERROUT, "load: NOT_OP*n"s)
         load = load_not (expr, regs)
         }
      when (NULL_OP, 0)
         {
DB       call print (ERROUT, "load: NULL_OP*n"s)
         load = load_null (expr, regs)
         }
      when (OBJECT_OP)
         {
DB       call print (ERROUT, "load: OBJECT_OP*n"s)
         load = load_object (expr, regs)
         }
      when (ORAA_OP)
         {
DB       call print (ERROUT, "load: ORAA_OP*n"s)
         load = load_oraa (expr, regs)
         }
      when (OR_OP)
         {
DB       call print (ERROUT, "load: OR_OP*n"s)
         load = load_or (expr, regs)
         }
      when (POSTDEC_OP)
         {
DB       call print (ERROUT, "load: POSTDEC_OP*n"s)
         load = load_postdec (expr, regs)
         }
      when (POSTINC_OP)
         {
DB       call print (ERROUT, "load: POSTINC_OP*n"s)
         load = load_postinc (expr, regs)
         }
      when (PREDEC_OP)
         {
DB       call print (ERROUT, "load: PREDEC_OP*n"s)
         load = load_predec (expr, regs)
         }
      when (PREINC_OP)
         {
DB       call print (ERROUT, "load: PREINC_OP*n"s)
         load = load_preinc (expr, regs)
         }
      when (PROC_CALL_OP)
         {
DB       call print (ERROUT, "load: PROC_CALL_OP*n"s)
         load = load_proc_call (expr, regs)
         }
      when (REFTO_OP)
         {
DB       call print (ERROUT, "load: REFTO_OP*n"s)
         load = load_refto (expr, regs)
         }
      when (REMAA_OP)
         {
DB       call print (ERROUT, "load: REMAA_OP*n"s)
         load = load_remaa (expr, regs)
         }
      when (REM_OP)
         {
DB       call print (ERROUT, "load: REM_OP*n"s)
         load = load_rem (expr, regs)
         }
      when (RETURN_OP)
         {
DB       call print (ERROUT, "load: RETURN_OP*n"s)
         load = load_return (expr, regs)
         }
      when (RSHIFTAA_OP)
         {
DB       call print (ERROUT, "load: RSHIFTAA_OP*n"s)
         load = load_rshiftaa (expr, regs)
         }
      when (RSHIFT_OP)
         {
DB       call print (ERROUT, "load: RSHIFT_OP*n"s)
         load = load_rshift (expr, regs)
         }
      when (SAND_OP)
         {
DB       call print (ERROUT, "load: SAND_OP*n"s)
         load = load_sand (expr, regs)
         }
      when (SELECT_OP)
         {
DB       call print (ERROUT, "load: SELECT_OP*n"s)
         load = load_select (expr, regs)
         }
      when (SEQ_OP)
         {
DB       call print (ERROUT, "load: SEQ_OP*n"s)
         load = load_seq (expr, regs)
         }
      when (SOR_OP)
         {
DB       call print (ERROUT, "load: SOR_OP*n"s)
         load = load_sor (expr, regs)
         }
      when (SUBAA_OP)
         {
DB       call print (ERROUT, "load: SUBAA_OP*n"s)
         load = load_subaa (expr, regs)
         }
      when (SUB_OP)
         {
DB       call print (ERROUT, "load: SUB_OP*n"s)
         load = load_sub (expr, regs)
         }
      when (SWITCH_OP)
         {
DB       call print (ERROUT, "load: SWITCH_OP*n"s)
         load = load_switch (expr, regs)
         }
      when (UNDEFINE_DYNM_OP)
         {
DB       call print (ERROUT, "load: UNDEFINE_DYNM_OP*n"s)
         load = load_undefine_dynm (expr, regs)
         }
      when (WHILE_LOOP_OP)
         {
DB       call print (ERROUT, "load: WHILE_LOOP_OP*n"s)
         load = load_while_loop (expr, regs)
         }
      when (XORAA_OP)
         {
DB       call print (ERROUT, "load: XORAA_OP*n"s)
         load = load_xoraa (expr, regs)
         }
      when (XOR_OP)
         {
DB       call print (ERROUT, "load: XOR_OP*n"s)
         load = load_xor (expr, regs)
         }
      when (CHECK_RANGE_OP)
         {
DB       call print (ERROUT, "load: CHECK_RANGE_OP*n"s)
         load = load_check_range (expr, regs)
         }
      when (CHECK_UPPER_OP)
         {
DB       call print (ERROUT, "load: CHECK_UPPER_OP*n"s)
         load = load_check_upper (expr, regs)
         }
      when (CHECK_LOWER_OP)
         {
DB       call print (ERROUT, "load: CHECK_LOWER_OP*n"s)
         load = load_check_lower (expr, regs)
         }
   else
      call panic ("load: bad IMF op: *i*n"p, Tmem (expr))

   return
   end



# load_addaa --- load value of sum, store sum in left operand

   ipointer function load_addaa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, load_field_asg_op

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opsize, opins, tad (ADDR_DESC_SIZE)

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   tpointer left_op, right_op

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   if (Tmem (left_op) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opsize = 1
         opins = ADD_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opsize = 2
         opins = ADL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         opsize = 2
         opins = FAD_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         opsize = 4
         opins = DFAD_INS
         }
   else
      call panic ("load_addaa: bad data mode *i*n"p, Tmem (expr + 1))

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
      load_addaa = seq (l, ld (opreg, lres, lad), r, gen_mr (opins, rad),
         st (opreg, lad))
      }


   procedure p2 {
      load_addaa = seq (r, ld (opreg, rres, rad), l, gen_mr (opins, lad),
         st (opreg, lad))
      }


   procedure p3 {
      load_addaa = seq (r, ld (opreg, rres, rad))
      load_addaa = seq (load_addaa, st (opreg, tad), l,
         ld (opreg, lres, lad), gen_mr (opins, tad), st (opreg, lad))
      }


   end



# load_add --- load value of sum of two subexpressions

   ipointer function load_add (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe, op_has_value

   regset lregs, rregs, opreg

   ipointer l, r
   ipointer seq, ld, st, gen_mr, reach, load

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opsize, opins, tad (ADDR_DESC_SIZE), i

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         opreg = A_REG
         opsize = 1
         opins = ADD_INS
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         opreg = L_REG
         opsize = 2
         opins = ADL_INS
         }
      when (FLOAT_MODE) {
         opreg = F_REG
         opsize = 2
         opins = FAD_INS
         }
      when (LONG_FLOAT_MODE) {
         opreg = LF_REG
         opsize = 4
         opins = DFAD_INS
         }
   else
      call panic ("load_add: bad data mode *i*n"p, Tmem (expr + 1))

   if (op_has_value (Tmem (expr + 3), 0))
      return (load (Tmem (expr + 2), regs))

   if (op_has_value (Tmem (expr + 2), 0))
      return (load (Tmem (expr + 3), regs))

   r = reach (Tmem (expr + 3), rregs, rres, rad)

   call alloc_temp (opsize, tad)

   l = reach (Tmem (expr + 2), lregs, lres, lad)

   select
      when (safe (opreg, lregs) && safe (opreg, rregs))
         load_add = seq (l, ld (opreg, lres, lad), r, gen_mr (opins, rad))
      when (~safe (opreg, rregs) && safe (opreg, lregs))
         load_add = seq (r, ld (opreg, rres, rad), l, gen_mr (opins, lad))
      when (safe (opreg, rregs) && ~safe (opreg, lregs))
         load_add = seq (l, ld (opreg, lres, lad), r, gen_mr (opins, rad))
   else {
      load_add = seq (r, ld (opreg, rres, rad))
      load_add = seq (load_add, st (opreg, tad), l, ld (opreg, lres, lad),
         gen_mr (opins, tad))
      }

   call free_temp (tad)

   regs = or (opreg, or (lregs, rregs))
   return
   end



# load_andaa --- evaluate logical and, store product in left operand

   ipointer function load_andaa (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   regset lregs, rregs, opreg

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins, opsize, tad (ADDR_DESC_SIZE)

   ipointer l, r, c, o
   ipointer seq, gen_mr, ld, st, reach, and_a_with, and_l_with,
      load_field_asg_op

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   tpointer left_op, right_op

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   if (Tmem (left_op) == FIELD_OP)
      return (load_field_asg_op (expr, regs))

   select (Tmem (expr + 1))

      when (INT_MODE, UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, lres, lad)
            regs |= A_REG
            return (seq (l,
               ld (A_REG, lres, lad),
               and_a_with (Tmem (right_op + 3)),
               st (A_REG, lad)))
            }
         opreg = A_REG
         opins = ANA_INS
         opsize = 1
         }

      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP) {
            l = reach (left_op, regs, lres, lad)
            regs |= L_REG
            return (seq (l,
               ld (L_REG, lres, lad),
               and_l_with (Tmem (right_op + 3)),
               st (L_REG, lad)))
            }
         opreg = L_REG
         opins = ANL_INS
         opsize = 2
         }
   else
      call panic ("load_andaa: bad data mode *i*n"p, Tmem (expr + 1))

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
      load_andaa = seq (l, ld (opreg, lres, lad), r,
         gen_mr (opins, rad), st (opreg, lad))
      }


   procedure p2 {
      load_andaa = seq (r, ld (opreg, rres, rad), l,
         gen_mr (opins, lad), st (opreg, lad))
      }


   procedure p3 {
      load_andaa = seq (r, ld (opreg, rres, rad))
      load_andaa = seq (load_andaa, st (opreg, tad), l,
         ld (opreg, lres, lad), gen_mr (opins, tad), st (opreg, lad))
      }


   end



# load_and --- evaluate logical and, place value in accumulator

   ipointer function load_and (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   regset lregs, rregs, opreg

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      opins, opsize, tad (ADDR_DESC_SIZE)

   ipointer l, r
   ipointer seq, gen_mr, ld, st, reach, load, and_a_with, and_l_with

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   tpointer left_op, right_op

   left_op = Tmem (expr + 2)
   right_op = Tmem (expr + 3)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               and_a_with (Tmem (right_op + 3))))
         if (Tmem (left_op) == CONST_OP)
            return (seq (load (right_op, regs),
               and_a_with (Tmem (left_op + 3))))
         opreg = A_REG
         opins = ANA_INS
         opsize = 1
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         if (Tmem (right_op) == CONST_OP)
            return (seq (load (left_op, regs),
               and_l_with (Tmem (right_op + 3))))
         if (Tmem (left_op) == CONST_OP)
            return (seq (load (right_op, regs),
               and_l_with (Tmem (left_op + 3))))
         opreg = L_REG
         opins = ANL_INS
         opsize = 2
         }
   else
      call panic ("load_and: bad data mode *i*n"p, Tmem (expr + 1))

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
      load_and = seq (l, ld (opreg, lres, lad), r, gen_mr (opins, rad))
      }


   procedure p2 {
      load_and = seq (r, ld (opreg, rres, rad), l, gen_mr (opins, lad))
      }


   procedure p3 {
      load_and = seq (r, ld (opreg, rres, rad))
      load_and = seq (load_and, st (opreg, tad), l,
         ld (opreg, lres, lad), gen_mr (opins, tad))
      }


   end



# load_assign --- perform assignment operation, leave value in accumulator

   ipointer function load_assign (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   logical safe

   regset lregs, rregs, opreg

   integer lres, rres, lad (ADDR_DESC_SIZE), rad (ADDR_DESC_SIZE),
      tad (ADDR_DESC_SIZE), opsize, l_is_temp, r_is_temp,
      l_temp_ad (ADDR_DESC_SIZE), r_temp_ad (ADDR_DESC_SIZE)

   ipointer l, r
   ipointer seq, ld, st, reach, load, st_field, gen_mr, gen_copy

   procedure p1 forward
   procedure p2 forward
   procedure p3 forward

   if (Tmem (Tmem (expr + 2)) == FIELD_OP) {    # sigh...case bit fields
      load_assign = load (Tmem (expr + 3), rregs)
      select (Tmem (expr + 1))
         when (INT_MODE, UNS_MODE) {
            call alloc_temp (1, tad)
            load_assign = seq (load_assign,
               gen_mr (STA_INS, tad),
               st_field (Tmem (expr + 2), lregs),
               gen_mr (LDA_INS, tad))
            call free_temp (tad)
            regs = or (lregs, rregs)
            return
            }
         when (LONG_INT_MODE, LONG_UNS_MODE) {
            call alloc_temp (2, tad)
            load_assign = seq (load_assign,
               gen_mr (STL_INS, tad),
               st_field (Tmem (expr + 2), lregs),
               gen_mr (LDL_INS, tad))
            call free_temp (tad)
            regs = or (lregs, rregs)
            return
            }
      else {
         call warning ("*i:  bad data mode used with bit field*n"p,
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
               call warning ("struct asg left operand not an lvalue*n"p)
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
               call warning ("*i:  bad left operand address mode*n"p,
                  AD_MODE (lad))
               return (0)
               }

            r = reach (Tmem (expr + 3), rregs, rres, rad)
            if (rres ~= IN_MEMORY) {
               call warning ("struct asg right operand not an lvalue*n"p)
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
               call warning ("*i:  bad right operand address mode *n"p,
                  AD_MODE (rad))
               return (0)
               }

            regs = ALL_REGS
            load_assign = seq (l,
               r,
               gen_copy (rad, lad, Tmem (expr + 4)))

            call free_temp (l_temp_ad)
            call free_temp (r_temp_ad)

            return
            }
         }

   else
      call panic ("load_assign: bad data mode *i*n"p, Tmem (expr + 1))

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
   return


   procedure p1 {
      load_assign = seq (r, ld (opreg, rres, rad), l, st (opreg, lad))
      }


   procedure p2 {
      load_assign = seq (l, r, ld (opreg, rres, rad), st (opreg, lad))
      }


   procedure p3 {
      load_assign = seq (r, ld (opreg, rres, rad))
      load_assign = seq (load_assign, st (opreg, tad), l,
         ld (opreg, IN_MEMORY, tad), st (opreg, lad))
      }


   end



# load_break --- generate code to break out of a loop or switch

   ipointer function load_break (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer level, lad (ADDR_DESC_SIZE)

   ipointer seq, gen_generic, gen_mr

   load_break = 0
   regs = 0

   level = Tmem (expr + 1)
   if (level > Break_sp || level < 1)
      call warning ("load_break: improper break level *i*n"p, level)
   else {
      level = Break_sp - level + 1
      AD_MODE (lad) = LABELED_AM
      AD_LABEL (lad) = Break_stack (level)
      load_break = seq (gen_mr (JMP_INS, lad), gen_generic (FIN_INS))
      }

   return
   end



# load_compl --- evaluate bitwise complement

   ipointer function load_compl (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   regset opreg

   integer ad (ADDR_DESC_SIZE), res

   ipointer seq, reach, ld, gen_generic, gen_mr

   load_compl = reach (Tmem (expr + 2), regs, res, ad)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE) {
         load_compl = seq (load_compl, ld (A_REG, res, ad),
            gen_generic (CMA_INS))
         regs |= A_REG
         }
      when (LONG_INT_MODE, LONG_UNS_MODE) {
         load_compl = seq (load_compl, ld (L_REG, res, ad))
         AD_MODE (ad) = LLIT_AM
         AD_LIT1 (ad) = -1
         AD_LIT2 (ad) = -1
         load_compl = seq (load_compl, gen_mr (ERL_INS, ad))
         regs |= L_REG
         }
   else
      call panic ("load_compl: bad data mode *i*n"p, Tmem (expr + 1))

   return
   end



# load_const --- load value of constant into appropriate accumulator

   ipointer function load_const (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   regset opreg

   integer res, ad (ADDR_DESC_SIZE)

   ipointer reach, ld

   load_const = reach (expr, regs, res, ad)

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
      call panic ("load_const: bad data mode *i*n"p, Tmem (expr + 1))

   load_const = ld (opreg, IN_MEMORY, ad)
   regs = opreg
   return
   end



# load_convert --- load value, convert to different data mode

   ipointer function load_convert (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer label, ad (ADDR_DESC_SIZE)
   integer mklabel

   long_real kluge
   equivalence (kluge, AD_LIT1 (ad))

   ipointer conv
   ipointer load, gen_generic, gen_branch, gen_mr, seq

   string mesg "load_convert: bad target mode"

   load_convert = load (Tmem (expr + 3), regs)
   conv = 0

   select (Tmem (expr + 1))

      when (INT_MODE) {
         select (Tmem (expr + 2))
            when (LONG_INT_MODE) {
               conv = gen_generic (PIDA_INS)
               regs |= L_REG
               }
            when (LONG_UNS_MODE) {
               conv = gen_generic (XCA_INS)
               regs |= L_REG
               }
            when (FLOAT_MODE) {
               conv = gen_generic (FLTA_INS)
               regs |= F_REG
               }
            when (LONG_FLOAT_MODE) {
               conv = seq (gen_generic (FLTA_INS), gen_generic (FDBL_INS))
               regs |= LF_REG
               }
         else
            call panic ("*s *i*n"p, mesg, Tmem (expr + 2))
         }

      when (LONG_INT_MODE) {
         select (Tmem (expr + 2))
            when (INT_MODE, UNS_MODE) {
               conv = gen_generic (TBA_INS)
               regs |= A_REG
               }
            when (FLOAT_MODE) {
               conv = gen_generic (FLTL_INS)
               regs |= F_REG
               }
            when (LONG_FLOAT_MODE) {
               conv = seq (gen_generic (FLTL_INS), gen_generic (FDBL_INS))
               regs |= LF_REG
               }
         else
            call panic ("*s *i*n"p, mesg, Tmem (expr + 2))
         }

      when (UNS_MODE) {
         select (Tmem (expr + 2))
            when (LONG_INT_MODE, LONG_UNS_MODE) {
               conv = gen_generic (XCA_INS)
               regs |= L_REG
               }
            when (FLOAT_MODE) {
               conv = seq (gen_generic (XCA_INS), gen_generic (FLTL_INS))
               regs |= F_REG
               }
            when (LONG_FLOAT_MODE) {
               conv = seq (gen_generic (XCA_INS), gen_generic (FLTL_INS),
                  gen_generic (FDBL_INS))
               regs |= LF_REG
               }
         else
            call panic ("*s *i*n"p, mesg, Tmem (expr + 2))
            }

      when (LONG_UNS_MODE) {
         select (Tmem (expr + 2))
            when (INT_MODE, UNS_MODE) {
               conv = gen_generic (TBA_INS)
               regs |= A_REG
               }
            when (FLOAT_MODE, LONG_FLOAT_MODE) {
               label = mklabel (1)
               AD_MODE (ad) = DLIT_AM
               kluge = 4294967296.0d0  # also sets AD_LIT[1-4](ad)
               conv = seq (gen_generic (FLTL_INS),
                  gen_generic (FDBL_INS),
                  gen_branch (BLGE_INS, label),
                  gen_mr (DFAD_INS, ad),
                  gen_label (label))
               regs |= or (F_REG, LF_REG)
               }
         else
            call panic ("*s *i*n"p, mesg, Tmem (expr + 2))
         }

      when (FLOAT_MODE) {
         select (Tmem (expr + 2))
            when (INT_MODE, UNS_MODE) {
               conv = gen_generic (INTA_INS)
               regs |= A_REG
               }
            when (LONG_INT_MODE, LONG_UNS_MODE) {
               conv = gen_generic (INTL_INS)
               regs |= L_REG
               }
            when (LONG_FLOAT_MODE) {
               conv = gen_generic (FDBL_INS)
               regs |= LF_REG
               }
         else
            call panic ("*s *i*n"p, mesg, Tmem (expr + 2))
         }

      when (LONG_FLOAT_MODE) {
         select (Tmem (expr + 2))
            when (INT_MODE, UNS_MODE) {
               conv = gen_generic (INTA_INS)
               regs |= A_REG
               }
            when (LONG_INT_MODE, LONG_UNS_MODE) {
               conv = gen_generic (INTL_INS)
               regs |= L_REG
               }
            when (FLOAT_MODE) {
               conv = gen_generic (FRN_INS)
               regs |= F_REG
               }
         else
            call panic ("*s *i*n"p, mesg, Tmem (expr + 2))
         }

   else
      call panic ("load_convert: bad source mode *i*n"p, Tmem (expr + 1))

   load_convert = seq (load_convert, conv)
   return
   end



# load_declare_stat --- declare existence of external static object

   ipointer function load_declare_stat (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   unsigned rsv_link

   integer ad (ADDR_DESC_SIZE)

   ipointer seq, gen_generic, gen_ext, gen_label, gen_ip

   regs = 0
#  load_declare_stat = seq (gen_generic (LINK_INS),
   load_declare_stat = seq (0,
      gen_ext (Tmem (expr + 2)),
      gen_label (Tmem (expr + 1)),
      gen_ip (Tmem (expr + 2)),
#     gen_generic (PROC_INS))
      0)

   AD_MODE (ad) = INDIRECT_AM
   AD_BASE (ad) = LB_REG
   AD_OFFSET (ad) = rsv_link (2)    # two words for the IP
   AD_RESOLVED (ad) = YES
   call enter_obj (Tmem (expr + 1), ad)

DB call print (ERROUT, "load_declare_stat: object *i at LB%+'*,-8i*n"s,
DB    Tmem (expr + 1), AD_OFFSET (ad))

   return
   end



# load_define_dynm --- reserve space for a dynamic object, initialize it

   ipointer function load_define_dynm (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   integer ad (ADDR_DESC_SIZE), wad (ADDR_DESC_SIZE), opsize, lab
   integer mklabel

   unsigned rsv_stack

   ipointer iexp
   ipointer seq, load, st, gen_generic, gen_mr, gen_label, gen_branch

   regset xregs, opreg

   AD_MODE (ad) = DIRECT_AM
   AD_BASE (ad) = SB_REG
   AD_OFFSET (ad) = rsv_stack (Tmem (expr + 3))
   AD_RESOLVED (ad) = YES
   call enter_obj (Tmem (expr + 1), ad)

DB call print (ERROUT, "load_define_dynm: object *i at SB%+'*,-8i*n"s,
DB    Tmem (expr + 1), AD_OFFSET (ad))

   regs = 0
   load_define_dynm = 0

   iexp = Tmem (expr + 2)
   while (iexp ~= 0)
      if (Tmem (iexp) == INITIALIZER_OP) {
         select (Tmem (iexp + 1))
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

         ifany {
            load_define_dynm = seq (load_define_dynm,
               load (Tmem (iexp + 2), xregs), st (opreg, ad))
            regs |= xregs
            AD_OFFSET (ad) += opsize
            }

         else {
            if (Tmem (iexp + 1) == STOWED_MODE)
              call warning ("stowed initializers have not been implemented*n"p)
            else
               call warning ("bad dynm init expr mode (*i)*n"p,
                  Tmem (iexp + 1))
            }
         iexp = Tmem (iexp + 3)
         }
      else if (Tmem (iexp) == ZERO_INITIALIZER_OP) {
         opsize = Tmem (iexp + 1)
         regs |= A_REG
         if (opsize >= 12) {  # three double floats
            regs |= or (LF_REG, X_REG)
            load_define_dynm = seq (load_define_dynm,
                                    gen_generic (CRA_INS),
                                    gen_generic (FLTA_INS),
                                    gen_generic (FDBL_INS))
            AD_MODE (wad) = ILIT_AM
            AD_LIT1 (wad) = opsize - mod (opsize, 4) - 4
            lab = mklabel (1)
            load_define_dynm = seq (load_define_dynm,
                                    gen_mr (LDA_INS, wad),
                                    gen_label (lab),
                                    gen_generic (TAX_INS))
            AD_MODE (ad) = INDEXED_AM
            AD_MODE (wad) = ILIT_AM
            AD_LIT1 (wad) = 4
            load_define_dynm = seq (load_define_dynm,
                                    gen_mr (DFST_INS, ad),
                                    gen_mr (SUB_INS, wad),
                                    gen_branch (BGE_INS, lab))
            AD_OFFSET (ad) = opsize - mod (opsize, 4)
            AD_MODE (ad) = DIRECT_AM
            opsize %= 4
            }
         if (opsize >= 4) {
            regs |= LF_REG
            load_define_dynm = seq (load_define_dynm,
                                    gen_generic (CRA_INS),
                                    gen_generic (FLTA_INS),
                                    gen_generic (FDBL_INS))
            while (opsize >= 4) {
               load_define_dynm = seq (load_define_dynm,
                                       gen_mr (DFST_INS, ad))
               AD_OFFSET (ad) += 4
               opsize -= 4
               }
            }
         if (opsize > 0) {
            load_define_dynm = seq (load_define_dynm, gen_generic (CRA_INS))
            while (opsize ~= 0) {
               load_define_dynm = seq (load_define_dynm,
                  gen_mr (STA_INS, ad))
               AD_OFFSET (ad) += 1
               opsize -= 1
               }
            }
         iexp = Tmem (iexp + 2)
         }
      else {
         call warning ("bad dynm initializer node (*i)*n"p, Tmem (iexp))
         break
         }

   return
   end



# load_define_stat --- generate code to define static object

   ipointer function load_define_stat (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer i, iexp, inode, clist, itail, rnode, label
   ipointer seq, gen_label, gen_data, gen_bsz, gen_generic,
      load, gen_ip_label

   spointer strsave

   character obj_id_str (MAXLINE)

   integer ad (ADDR_DESC_SIZE), j

   unsigned clab
   unsigned rsv_link, mklabel

   string mesg "load_define_stat: "

   i = 0

   label = gen_label (Tmem (expr + 1))

   if (Tmem (expr + 2) == 0) {      # no initializers?
DB    call print (ERROUT, "   no initializers*n"s)
      i = seq (i, label, gen_bsz (Tmem (expr + 3)))
      }
   else {   # process list of initializers
DB    call print (ERROUT, "   processing initializers*n"s)
      clist = 0
      itail = 0
      iexp = Tmem (expr + 2)
      while (iexp ~= 0)
         if (Tmem (iexp) == INITIALIZER_OP) {
DB          call print (ERROUT, "      initializer*n"s)
            inode = Tmem (iexp + 2)
            select (Tmem (inode))
               when (CONST_OP) {
DB                call print (ERROUT, "         constant:*n"s)
                  for (j = 1; j <= Tmem (inode + 2); j += 1) {
DB                   call print (ERROUT, " '*,-8i*n"s, Tmem (inode + 2 + j))
                     itail = seq (itail, gen_data (Tmem (inode + 2 + j)))
                     }
DB                call print (ERROUT, "*n"s)
                  }
               when (REFTO_OP) {
DB                call print (ERROUT, "         reference to"s)
                  rnode = Tmem (inode + 2)
                  if (Tmem (rnode) == OBJECT_OP) {
DB                   call print (ERROUT, " object *i*n", Tmem (rnode + 2))
                     itail = seq (itail, gen_ip_label (Tmem (rnode + 2)))
                     }
                  else if (Tmem (rnode) == CONST_OP) {
DB                   call print (ERROUT, " constant:*n"s)
                     clab = rsv_link (Tmem (rnode + 2))
                     clab = mklabel (1)
                     itail = seq (itail, gen_ip_label (clab))
                     clist = seq (clist, gen_label (clab))
                     for (j = 1; j <= Tmem (rnode + 2); j += 1) {
DB                      call print (ERROUT, " '*,-8i*n"s, Tmem (rnode + 2 + j))
                        clist = seq (clist,
                           gen_data (Tmem (rnode + 2 + j)))
                        }
DB                   call print (ERROUT, "*n"s)
                     }
                  else
                     call warning ("*sbad REFTO initializer*n"p, mesg)
                  }
            else
               call warning ("*sbad initializer node*n"p, mesg)
            iexp = Tmem (iexp + 3)
            }
         else if (Tmem (iexp) == ZERO_INITIALIZER_OP) {
DB          call print (ERROUT, "      zero initializer*n"s)
            itail = seq (itail, gen_bsz (Tmem (iexp + 1)))
            iexp = Tmem (iexp + 2)
            }
         else {
            call warning ("*sbad node type *i*n"p, mesg, Tmem (iexp))
            break
            }
      i = seq (i, clist, label, itail)
      }

   AD_MODE (ad) = DIRECT_AM
   AD_BASE (ad) = LB_REG
   AD_OFFSET (ad) = rsv_link (Tmem (expr + 3))
   AD_RESOLVED (ad) = YES
   call enter_obj (Tmem (expr + 1), ad)

DB call print (ERROUT, "load_define_stat: object *i at LB%+'*,-8i*n"s,
DB    Tmem (expr + 1), AD_OFFSET (ad))
DB call print (ERROUT, "   object size = *i*n"s, Tmem (expr + 3))

#  load_define_stat = seq (i, gen_generic (PROC_INS))
   regs = 0
   return (i)
   end



# load_deref --- load value referenced by a pointer

   ipointer function load_deref (expr, regs)
   tpointer expr
   regset regs

   include VCG_COMMON

   ipointer reach, ld, seq

   integer res, ad (ADDR_DESC_SIZE), opreg

   load_deref = reach (expr, regs, res, ad)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE)
         opreg = A_REG
      when (LONG_INT_MODE, LONG_UNS_MODE)
         opreg = L_REG
      when (FLOAT_MODE)
         opreg = F_REG
      when (LONG_FLOAT_MODE)
         opreg = LF_REG
   ifany
      load_deref = seq (load_deref, ld (opreg, res, ad))
   else
      call warning ("load_deref: bad data mode *i*n"p,
         Tmem (expr + 1))

   regs |= opreg

   return
   end
