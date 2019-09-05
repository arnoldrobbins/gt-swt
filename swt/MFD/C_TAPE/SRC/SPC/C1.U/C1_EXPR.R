# gen_opnd --- push an operand on the expression stack

   subroutine gen_opnd (p)
   pointer p

   include "c1_com.r.i"

   call es_push (p)

   return
   end



# gen_int --- push an integer on the expression stack

   subroutine gen_int (i)
   integer i

   include "c1_com.r.i"

   character str (20)

   call itoc (i, str, 20)
   call gen_lit (SHORTLITSYM, str, 0)

   DBG (39, call print (ERROUT, "in gen_lit: i=*i, s='*s'*n"s, i, str))

   return
   end



# gen_lit --- push a literal on the expression stack

   subroutine gen_lit (type, text, tlen)
   integer type
   character text (ARB)
   integer tlen  # only valid when type = STRLITSYM or CHARLITSYM

   include "c1_com.r.i"

   integer i
   pointer p, q, r
   pointer dsget

   integer gctoi, ctoc, ctop
   longint gctol
   longreal ctod

   integer cbuf (MAXTOK)
   character cc (MAXTOK)
   integer ci
   longint cl
   longreal cd
   equivalence (cbuf, cc, ci, cl, cd)

   p = dsget (SYMSIZE)

   SYMTYPE (p) = LITSYMTYPE
   SYMSC (p) = STATIC_SC
   SYMLL (p) = 1
   SYMPARAM (p) = -1
   SYMOBJ (p) = 0
   SYMTEXT (p) = LAMBDA

   i = 1

   select (type)
      when (SHORTLITSYM) {
         SYMMODE (p) = Short_mode_ptr
         ci = gctoi (text, i, 10)
         }
      when (LONGLITSYM) {
         SYMMODE (p) = Long_mode_ptr
         cl = gctol (text, i, 10)
         }
      when (DOUBLELITSYM) {
         SYMMODE (p) = Double_mode_ptr
         cd = ctod (text, i)
         }
      when (STRLITSYM) {
         if (ARG_PRESENT (u))
            for (i = 1; i <= tlen; i += 1)
               text (i) &= 8r177
         for (i = 1; i <= tlen && i <= MAXTOK - 1; i += 1)
            cc (i) = text (i)
         cc (i) = 0
         SYMMODE (p) = Char_mode_ptr
         call create_mode (SYMMODE (p), ARRAY_MODE, i)
         }
      when (CHARLITSYM) {
         if (ARG_PRESENT (u))
            for (i = 1; i <= tlen; i += 1)
               text (i) &= 8r177
         if (tlen <= 0) {
            SYMMODE (p) = Int_mode_ptr
            SYNERR ("Character literal must have at least 1 character"p)
            cc (1) = 0
            }
         else if (tlen == 1) {
            SYMMODE (p) = Int_mode_ptr
            cc (1) = text (1)
            }
         else {
            for (i = 0; i < tlen; )
               spchar (cc, i, text (i + 1))
            if (mod (i, 2) == 1)
               spchar (cc, i, ' 'c)
            SYMMODE (p) = Int_mode_ptr
            call create_mode (SYMMODE (p), ARRAY_MODE, i / 2)
            }
         }
   else
      FATAL ("in gen_lit: bogus type passed"p)

   call put_lit_val (p, SYMMODE (p), cbuf)
   call es_push (p)

   return
   end



# gen_index --- generate an array indexing operator

   subroutine gen_index

   include "c1_com.r.i"

   integer mt1, mt2
   pointer p, q, mp, t
   pointer es_pop
   longint sizeof_mode

   p = es_pop (p)
   q = es_pop (q)
   mt1 = MODETYPE (EXPMODE (q))
   mt2 = MODETYPE (EXPMODE (p))

   if (mt1 == POINTER_MODE || mt1 == ARRAY_MODE) {
      if (mt2 == POINTER_MODE || mt2 == ARRAY_MODE)
         SYNERR ("Arrays may not be indexed by pointers"p)
      }
   else if (mt2 == POINTER_MODE || mt2 == ARRAY_MODE)
      SYNERR ("Only arrays and pointers can be indexed"p)
   else {
      t = q; q = p; p = t
      t = mt1; mt1 = mt2; mt2 = t
      }

   if (mt2 == LONG_MODE || mt2 == LONG_UNS_MODE) {
      call es_push (p)
      call es_push (q)
      call gen_oper (ADD_OP)
      call gen_oper (DEREF_OP)
      }

   else if (mt1 == POINTER_MODE || SYMTYPE (q) ~= EXPSYMTYPE
             || EXPOP (q) ~= INDEX_OP) {
      call es_push (q)

      if (mt1 == POINTER_MODE) {
         t = MODEPARENT (EXPMODE (q))
         call create_mode (t, ARRAY_MODE, 0)
         call gen_convert (t)
         }

      call es_push (p)
      call gen_oper (INDEX_OP)

      call es_top (t)
      EXPMODE (t) = MODEPARENT (EXPMODE (q))
      }
   else {
      call es_push (EXPLEFT (q))
      call es_push (EXPRIGHT (q))
      call gen_int (ints (sizeof_mode (EXPMODE (q)) _
             / sizeof_mode (MODEPARENT (EXPMODE (q)))))
      call gen_oper (MUL_OP)
      call es_push (p)
      call gen_oper (ADD_OP)
      call gen_oper (INDEX_OP)

      call es_top (t)
      EXPMODE (t) = MODEPARENT (EXPMODE (q))

      call dsfree (q)
      }

   return
   end



# gen_oper --- generate a node for an operator in an expression tree

   subroutine gen_oper (op)
   integer op

   include "c1_com.r.i"

   integer i, bt, et, l
   integer bogus_division_required, bogus_divisor
   integer is_lvalue, is_arith, is_int, is_pointer, wsize
   pointer ls, rs, m, v, lm, rm, t
   pointer dsget, es_pop
   longint sizeof_mode

   define(DYADIC_FC,3)        # Set up a dyadic operator node
   define(FOLD1_FC,4)         # Try to fold out a monadic operator
   define(FOLD2_FC,11)        # Try to fold out a dyadic operator
   define(LCV_RESULTMODE_FC,5)# Coerce left mode to the result mode
   define(LCV_TOARITHMODE_FC,31)# Convert functions, arrays, and fields
   define(LCV_TOBOOLEAN_FC,36)# Coerce the left mode to 0 or 1
   define(LMB_ARITHMODE_FC,23)# The left mode must be arithmetic
   define(LMB_ARITHPTR_FC,29) # The left mode must be arithmetic or pointer
   define(LMB_GENERIC_INT_FC,6)# The left mode must be a generic integer
   define(LMB_LVALUE_FC,7)    # The left mode must a an lvalue
   define(LMB_POINTABLE_FC,33)# We must be able to point to the left mode
   define(LMB_POINTERMODE_FC,8)# The left mode must be a pointer
   define(MONADIC_FC,9)       # Set up a monadic operator node
   define(NILADIC_FC,10)      # Set up a niladic operator node
   define(RCV_DEREFRESULT_FC,25)# Deref the right, if it's a pointer
   define(RCV_INTMODE_FC,1)   # Convert the right mode to 'int'
   define(RCV_PARAMMODE_FC,35)# Convert to a proper parameter mode
   define(RCV_RESULTMODE_FC,12)# Coerce right mode to the result mode
   define(RCV_TOARITHMODE_FC,34)# Convert functions, arrays, and fields
   define(RCV_TOBOOLEAN_FC,37)# Coerce the right mode to 0 or 1
   define(RIS_PUSH1_FC,28)    # Always push 1 as the right operand
   define(RMB_ARITHMODE_FC,24)# The right mode must be arithmetic
   define(RMB_ARITHPTR_FC,30) # The right mode must be arithmetic or pointer
   define(RMB_GENERIC_INT_FC,13)# The right mode must be a generic integer
   define(RMB_LVALUE_FC,14)   # The right mode must be an lvalue
   define(SETUPADD_FC,26)     # Check for and set up pointer addition
   define(SETUPCMP_FC,38)     # Mask out ring bits for pointer comparison
   define(SETUPSUB_FC,27)     # Check for and set up pointer subtraction
   define(VIS_INTMODE_FC,15)  # The result mode is 'int'
   define(VIS_LEFTFIELDOF_FC,32)# Result mode is that of the field
   define(VIS_LEFTFNRETMODE_FC,2)# The result mode is that of the function
   define(VIS_LEFTMODE_FC,17) # The result mode is the same as the left mode
   define(VIS_LEFTPOINTEDMODE_FC,18)# The result mode is what the left
                              #      mode points to
   define(VIS_LVALUE_FC,19)   # The result is an lvalue
   define(VIS_LEFTPOINTER_FC,20)# The result mode is a pointer to the left mode
   define(VIS_RIGHTMODE_FC,21)# The result mode is the same as the right mode
   define(VIS_WORSTMODE_FC,22)# The result mode is the worst of the left
                              #   and right modes

   string_table opos, otxt,
      / ADDAA_OP,             DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_ARITHPTR_FC,
                              RMB_ARITHPTR_FC,
                              SETUPADD_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / ADD_OP,               DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_ARITHPTR_FC,
                              RMB_ARITHPTR_FC,
                              SETUPADD_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              FOLD2_FC,
      / ANDAA_OP,             DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_GENERIC_INT_FC,
                              RMB_GENERIC_INT_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / AND_OP,               DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_GENERIC_INT_FC,
                              RMB_GENERIC_INT_FC,
                              VIS_WORSTMODE_FC,
                              LCV_RESULTMODE_FC,
                              RCV_RESULTMODE_FC,
                              FOLD2_FC,
      / ASSIGN_OP,            DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / BREAK_OP,
      / CASE_OP,
      / COMPL_OP,             MONADIC_FC,
                              LCV_TOARITHMODE_FC,
                              LMB_GENERIC_INT_FC,
                              VIS_LEFTMODE_FC,
                              FOLD1_FC,
      / CONST_OP,
      / CONVERT_OP,
      / DECLARE_STAT_OP,
      / DEFAULT_OP,
      / DEFINE_DYNM_OP,
      / DEFINE_STAT_OP,
      / DEREF_OP,             MONADIC_FC,
                              LCV_TOARITHMODE_FC,
                              VIS_LVALUE_FC,
                              LMB_POINTERMODE_FC,
                              VIS_LEFTPOINTEDMODE_FC,
      / DIVAA_OP,             DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_ARITHMODE_FC,
                              RMB_ARITHMODE_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / DIV_OP,               DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_ARITHMODE_FC,
                              RMB_ARITHMODE_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              FOLD2_FC,
      / DO_OP,
      / EQ_OP,                DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              VIS_INTMODE_FC,
                              SETUPCMP_FC,
                              FOLD2_FC,
      / FOR_OP,
      / GE_OP,                DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              VIS_INTMODE_FC,
                              SETUPCMP_FC,
                              FOLD2_FC,
      / GOTO_OP,
      / GT_OP,                DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              VIS_INTMODE_FC,
                              SETUPCMP_FC,
                              FOLD2_FC,
      / IF_OP,
      / INDEX_OP,             DYADIC_FC,
                              VIS_LVALUE_FC,
                              RCV_INTMODE_FC,
      / INIT_OP,
      / LABEL_OP,
      / LE_OP,                DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              VIS_INTMODE_FC,
                              SETUPCMP_FC,
                              FOLD2_FC,
      / LSHIFTAA_OP,          DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_GENERIC_INT_FC,
                              RMB_GENERIC_INT_FC,
                              VIS_LEFTMODE_FC,
                              RCV_INTMODE_FC,
      / LSHIFT_OP,            DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_GENERIC_INT_FC,
                              RMB_GENERIC_INT_FC,
                              VIS_LEFTMODE_FC,
                              RCV_INTMODE_FC,
                              FOLD2_FC,
      / LT_OP,                DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              VIS_INTMODE_FC,
                              SETUPCMP_FC,
                              FOLD2_FC,
      / MODULE_OP,
      / MULAA_OP,             DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_ARITHMODE_FC,
                              RMB_ARITHMODE_FC,
                              LMB_LVALUE_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / MUL_OP,               DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_ARITHMODE_FC,
                              RMB_ARITHMODE_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              FOLD2_FC,
      / NEG_OP,               MONADIC_FC,
                              LCV_TOARITHMODE_FC,
                              LMB_ARITHMODE_FC,
                              VIS_LEFTMODE_FC,
                              FOLD1_FC,
      / NEXT_OP,
      / NE_OP,                DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              VIS_INTMODE_FC,
                              SETUPCMP_FC,
                              FOLD2_FC,
      / NOT_OP,               MONADIC_FC,
                              LCV_TOARITHMODE_FC,
                              LMB_ARITHPTR_FC,
                              LCV_TOBOOLEAN_FC,
                              VIS_INTMODE_FC,
                              FOLD1_FC,
      / NULL_OP,              NILADIC_FC,
      / OBJECT_OP,
      / ORAA_OP,              DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              RMB_GENERIC_INT_FC,
                              LMB_GENERIC_INT_FC,
                              VIS_LEFTMODE_FC,
      / OR_OP,                DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_GENERIC_INT_FC,
                              RMB_GENERIC_INT_FC,
                              VIS_WORSTMODE_FC,
                              LCV_RESULTMODE_FC,
                              RCV_RESULTMODE_FC,
                              FOLD2_FC,
      / POSTDEC_OP,           MONADIC_FC,
                              RIS_PUSH1_FC,
                              LCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_ARITHPTR_FC,
                              RMB_ARITHMODE_FC,
                              SETUPSUB_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / POSTINC_OP,           MONADIC_FC,
                              RIS_PUSH1_FC,
                              LCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_ARITHPTR_FC,
                              RMB_ARITHMODE_FC,
                              SETUPADD_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / PREDEC_OP,            MONADIC_FC,
                              RIS_PUSH1_FC,
                              LCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_ARITHPTR_FC,
                              RMB_ARITHMODE_FC,
                              SETUPSUB_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / PREINC_OP,            MONADIC_FC,
                              RIS_PUSH1_FC,
                              LCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_ARITHPTR_FC,
                              RMB_ARITHMODE_FC,
                              SETUPADD_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / PROC_CALL_ARG_OP,     DYADIC_FC,
                              RCV_TOARITHMODE_FC,
                              RCV_PARAMMODE_FC,
                              VIS_RIGHTMODE_FC,
                              RCV_RESULTMODE_FC,
                              RCV_DEREFRESULT_FC,
      / PROC_CALL_OP,         DYADIC_FC,
                              VIS_LEFTFNRETMODE_FC,
      / PROC_DEFN_ARG_OP,
      / PROC_DEFN_OP,
      / REFTO_OP,             MONADIC_FC,
                              LMB_LVALUE_FC,
                              LMB_POINTABLE_FC,
                              VIS_LEFTPOINTER_FC,
      / REMAA_OP,             DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_GENERIC_INT_FC,
                              RMB_GENERIC_INT_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / REM_OP,               DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_GENERIC_INT_FC,
                              RMB_GENERIC_INT_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              FOLD2_FC,
      / RETURN_OP,
      / RSHIFTAA_OP,          DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              RMB_GENERIC_INT_FC,
                              LMB_GENERIC_INT_FC,
                              VIS_LEFTMODE_FC,
                              LCV_RESULTMODE_FC,
                              RCV_INTMODE_FC,
      / RSHIFT_OP,            DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_GENERIC_INT_FC,
                              RMB_GENERIC_INT_FC,
                              VIS_LEFTMODE_FC,
                              LCV_RESULTMODE_FC,
                              RCV_INTMODE_FC,
                              FOLD2_FC,
      / SAND_OP,              DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              RMB_ARITHPTR_FC,
                              LMB_ARITHPTR_FC,
                              LCV_TOBOOLEAN_FC,
                              RCV_TOBOOLEAN_FC,
                              VIS_INTMODE_FC,
                              FOLD2_FC,
      / SELECT_OP,            DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              VIS_LVALUE_FC,
                              VIS_RIGHTMODE_FC,
      / SEQ_OP,               DYADIC_FC,
                              VIS_RIGHTMODE_FC,
      / SOR_OP,               DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              RMB_ARITHPTR_FC,
                              LMB_ARITHPTR_FC,
                              LCV_TOBOOLEAN_FC,
                              RCV_TOBOOLEAN_FC,
                              VIS_INTMODE_FC,
                              FOLD2_FC,
      / SUBAA_OP,             DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              LMB_ARITHPTR_FC,
                              RMB_ARITHPTR_FC,
                              SETUPSUB_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / SUB_OP,               DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_ARITHPTR_FC,
                              RMB_ARITHPTR_FC,
                              SETUPSUB_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
                              FOLD2_FC,
      / SWITCH_OP,
      / UNDEFINE_OP,
      / WHILE_OP,
      / XORAA_OP,             DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LMB_LVALUE_FC,
                              RMB_GENERIC_INT_FC,
                              LMB_GENERIC_INT_FC,
                              VIS_LEFTMODE_FC,
                              RCV_RESULTMODE_FC,
      / XOR_OP,               DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              RMB_GENERIC_INT_FC,
                              LMB_GENERIC_INT_FC,
                              VIS_WORSTMODE_FC,
                              LCV_RESULTMODE_FC,
                              RCV_RESULTMODE_FC,
                              FOLD2_FC,
      / ZERO_INIT_OP,
      / FIELD_OP,             MONADIC_FC,
                              VIS_LEFTFIELDOF_FC,
                              VIS_LVALUE_FC,
      / COND1_OP,             DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              LMB_ARITHPTR_FC,
                              LCV_TOBOOLEAN_FC,
                              VIS_RIGHTMODE_FC,
                              LMB_GENERIC_INT_FC,
      / COND2_OP,             DYADIC_FC,
                              LCV_TOARITHMODE_FC,
                              RCV_TOARITHMODE_FC,
                              VIS_WORSTMODE_FC,
                              RCV_RESULTMODE_FC,
                              LCV_RESULTMODE_FC,
      / 0                                # dummy entry is required here!!

   bogus_division_required = NO     # This is set only for pointer subtraction!

   i = op + 1

DB if (otxt (opos (i)) ~= op) {
DB    call print (ERROUT, "in gen_oper: bad entry in tbl for *i*n"s, op)
DB    for (i = 2; i <= opos (1) + 1; i += 1)
DB       if (otxt (opos (i)) == op)
DB          break
DB    }

   bt = opos (i)
   et = opos (i + 1)

   DBG (34, call print (ERROUT, "in gen_oper: i=*i, bt=*i, et=*i*n"s,
   DB       i, bt, et))

   v = dsget (EXPSIZE)
   EXPTYPE (v) = EXPSYMTYPE
   EXPLVALUE (v) = NO
   EXPLEFT (v) = LAMBDA
   EXPRIGHT (v) = LAMBDA
   EXPMODE (v) = LAMBDA
   EXPOP (v) = op

   for (i = bt + 1; i < et; i += 1) {

      DBG (34, call print (ERROUT,
      DB    "  fc=*i  op=*i  lv=*i  md=*i  ls= *i  lm=*i  rs=*i  rm=*i*n"s,
      DB    otxt (i), EXPOP (v), EXPLVALUE (v), EXPMODE (v),
      DB    ls, lm, rs, rm))

      select (otxt (i))
         when (DYADIC_FC) {
            EXPRIGHT (v) = es_pop (rs)
            rm = SYMMODE (rs)

            EXPLEFT (v) = es_pop (ls)
            lm = SYMMODE (ls)

            call es_push (v)
            }
         when (MONADIC_FC) {
            rs = LAMBDA
            rm = LAMBDA

            EXPLEFT (v) = es_pop (ls)
            lm = SYMMODE (ls)

            call es_push (v)
            }
         when (NILADIC_FC) {
            rs = LAMBDA
            rm = LAMBDA

            ls = LAMBDA
            lm = LAMBDA

            call es_push (v)
            }
         when (FOLD1_FC) {
            if (SYMTYPE (ls) == LITSYMTYPE) {
               call es_pop (v)
               call fold_const (v, ls, LAMBDA)
               call dsfree (v)
               call es_push (ls)    # warning: does not reset 'lm' & 'rm'
               }
            }
         when (FOLD2_FC) {
            if (SYMTYPE (ls) == LITSYMTYPE && SYMTYPE (rs) == LITSYMTYPE) {
               call es_pop (v)
               call fold_const (v, ls, rs)
               call dealloc_expr (rs)
               call dsfree (v)
               call es_push (ls)    # warning: does not reset 'lm' & 'rm'
               }
            }
         when (LCV_RESULTMODE_FC) {
            if (lm ~= EXPMODE (v)) {
               call es_push (ls)
               call gen_convert (EXPMODE (v))
               EXPLEFT (v) = es_pop (ls)
               lm = EXPMODE (v)
               }
            }
         when (LCV_TOARITHMODE_FC) {
            if (is_arith (ls) == NO) {
               call es_push (ls)
               call gen_make_arith
               EXPLEFT (v) = es_pop (ls)
               lm = SYMMODE (ls)
               }
            }
         when (LCV_TOBOOLEAN_FC) {
            call es_push (ls)
            call gen_toboolean
            EXPLEFT (v) = es_pop (ls)
            lm = SYMMODE (ls)
            }
         when (LMB_ARITHMODE_FC) {
            if (is_arith (ls) == NO)
               SYNERR ("Left operand must have an arithmetic mode"p)
            }
         when (LMB_ARITHPTR_FC) {
            if (is_pointer (ls) == NO && is_arith (ls) == NO)
               SYNERR ("Left operand must be a pointer or arithmetic mode"p)
            }
         when (LMB_GENERIC_INT_FC) {
            if (is_int (ls) == NO)
               SYNERR ("Left operand must be an integer type"p)
            }
         when (LMB_LVALUE_FC) {
            if (is_lvalue (ls) == NO)
               SYNERR ("Left operand must be an lvalue"p)
            }
         when (LMB_POINTABLE_FC) {
            if (MODETYPE (ls) == ARRAY_MODE)
               SYNERR ("& of array is not allowed"p)
            else if (MODETYPE (ls) == FUNCTION_MODE)
               SYNERR ("& of function is not allowed"p)
            else if (SYMTYPE (ls) == IDSYMTYPE && SYMSC (ls) == REGISTER_SC)
               SYNERR ("& of register variable not allowed"p)
            else if (MODETYPE (ls) == FIELD_MODE)
               SYNERR ("& of field is not allowed"p)
            else if (MODETYPE (ls) == LABEL_MODE)
               SYNERR ("& of label is not allowed"p)
            }
         when (LMB_POINTERMODE_FC) {
            if (is_pointer (ls) == NO)
               SYNERR ("Left operand must be a pointer"p)
            }
         when (RCV_DEREFRESULT_FC) {
            if (MODETYPE (rm) == POINTER_MODE) {
               call es_push (rs)
               call gen_oper (DEREF_OP)
               EXPRIGHT (v) = es_pop (rs)
               rm = EXPMODE (rs)
               }
            }
         when (RCV_INTMODE_FC) {
            if (rm ~= Int_mode_ptr) {
               call es_push (rs)
               call gen_convert (Int_mode_ptr)
               EXPRIGHT (v) = es_pop (rs)
               rm = EXPMODE (rs)
               }
            }
         when (RCV_PARAMMODE_FC) {
            m = rm
            call modify_param_mode (m)
            if (m ~= rm) {
               call es_push (rs)
               call gen_convert (m)
               EXPRIGHT (v) = es_pop (rs)
               rm = EXPMODE (rs)
               }
            }
         when (RCV_RESULTMODE_FC) {
            if (rm ~= EXPMODE (v)) {
               call es_push (rs)
               call gen_convert (EXPMODE (v))
               EXPRIGHT (v) = es_pop (rs)
               rm = EXPMODE (v)
               }
            }
         when (RCV_TOARITHMODE_FC) {
            if (is_arith (rs) == NO) {
               call es_push (rs)
               call gen_make_arith
               EXPRIGHT (v) = es_pop (rs)
               rm = SYMMODE (rs)
               }
            }
         when (RCV_TOBOOLEAN_FC) {
            call es_push (rs)
            call gen_toboolean
            EXPRIGHT (v) = es_pop (rs)
            rm = SYMMODE (rs)
            }
         when (RIS_PUSH1_FC) {
            call gen_int (1)
            EXPRIGHT (v) = es_pop (rs)
            rm = EXPMODE (rs)
            }
         when (RMB_ARITHMODE_FC) {
            if (is_arith (rs) == NO)
               SYNERR ("Right operand must have an arithmetic mode"p)
            }
         when (RMB_ARITHPTR_FC) {
            if (is_pointer (rs) == NO && is_arith (rs) == NO)
               SYNERR ("Right operand must be a pointer or arithmetic mode"p)
            }
         when (RMB_GENERIC_INT_FC) {
            if (is_int (rs) == NO)
               SYNERR ("Right operand must be an integer type"p)
            }
         when (RMB_LVALUE_FC) {
            if (is_lvalue (rs) == NO)
               SYNERR ("Right operand must be an lvalue"p)
            }
         when (SETUPADD_FC) {
            if (is_pointer (ls) == YES && is_pointer (rs) == YES)
               SYNERR ("Addition of two pointers is not defined"p)
            else if (is_pointer (ls) == YES) {
               call es_push (rs)
               call gen_convert (Long_mode_ptr)
               call gen_int (wsize (sizeof_mode (MODEPARENT (lm))))
               call gen_convert (Long_mode_ptr)
               call gen_oper (MUL_OP)
               EXPRIGHT (v) = es_pop (rs)
               rm = EXPMODE (rs)
               }
            else if (is_pointer (rs) == YES) {
               call es_push (ls)
               call gen_convert (Long_mode_ptr)
               call gen_int (wsize (sizeof_mode (MODEPARENT (rm))))
               call gen_convert (Long_mode_ptr)
               call gen_oper (MUL_OP)
               EXPLEFT (v) = es_pop (ls)
               lm = EXPMODE (ls)
               }
            }
         when (SETUPCMP_FC) {
            if (is_pointer (rs) == YES && is_pointer (ls) == YES) {
               if (EXPOP (v) == EQ_OP || EXPOP (v) == NE_OP) {
                  call es_push (ls)
                  call gen_convert (Longuns_mode_ptr)
                  call es_push (rs)
                  call gen_convert (Longuns_mode_ptr)
                  call gen_oper (SUB_OP)
                  call gen_lit (LONGLITSYM, "16r0fffffff"s, 0)
                  call gen_convert (Longuns_mode_ptr)
                  call gen_oper (AND_OP)
                  }
               else {
                  call es_push (ls)
                  call gen_convert (Long_mode_ptr)
                  call gen_lit (LONGLITSYM, "16r0fffffff"s, 0)
                  call gen_oper (AND_OP)
                  call es_push (rs)
                  call gen_convert (Long_mode_ptr)
                  call gen_lit (LONGLITSYM, "16r0fffffff"s, 0)
                  call gen_oper (AND_OP)
                  call gen_oper (SUB_OP)
                  }
               EXPLEFT (v) = es_pop (ls)
               lm = EXPMODE (ls)
               call gen_lit (LONGLITSYM, "0"s, 0)
               EXPRIGHT (v) = es_pop (rs)
               rm = EXPMODE (rs)
               }
            }
         when (SETUPSUB_FC) {
            if (is_pointer (ls) == YES && is_pointer (rs) == YES) {
               bogus_division_required = YES  # do the division later
               bogus_divisor = wsize (sizeof_mode (MODEPARENT (lm)))
               }
            else if (is_pointer (ls) == YES) {
               call es_push (rs)
               call gen_convert (Long_mode_ptr)
               call gen_int (wsize (sizeof_mode (MODEPARENT (lm))))
               call gen_convert (Long_mode_ptr)
               call gen_oper (MUL_OP)
               EXPRIGHT (v) = es_pop (rs)
               rm = EXPMODE (rs)
               }
            else if (is_pointer (rs) == YES)
               SYNERR ("Pointers may not be subtracted from integers"p)
            }
         when (VIS_LEFTFNRETMODE_FC) {
            if (MODETYPE (lm) == FUNCTION_MODE)
               EXPMODE (v) = MODEPARENT (lm)
            else
               EXPMODE (v) = lm     # error case
            }
         when (VIS_INTMODE_FC) {
            EXPMODE (v) = Int_mode_ptr
            }
         when (VIS_LEFTFIELDOF_FC) {
            if (MODETYPE (lm) == FIELD_MODE)
               EXPMODE (v) = MODEPARENT (lm)
            else
               EXPMODE (v) = lm     # Error case
            }
         when (VIS_LEFTMODE_FC) {
            if (is_pointer (ls) == YES) {
               EXPMODE (v) = MODEPARENT (lm)
               call create_mode (EXPMODE (v), POINTER_MODE, 0)
               }
            else
               EXPMODE (v) = lm
            }
         when (VIS_LEFTPOINTEDMODE_FC) {
            if (is_pointer (ls) == YES)
               EXPMODE (v) = MODEPARENT (lm)
            else
               EXPMODE (v) = lm     # error case
            }
         when (VIS_LVALUE_FC) {
            EXPLVALUE (v) = YES
            }
         when (VIS_LEFTPOINTER_FC) {
            m = lm
            call create_mode (m, POINTER_MODE, 0)
            EXPMODE (v) = m
            }
         when (VIS_RIGHTMODE_FC) {
            if (is_pointer (rs) == YES) {
               EXPMODE (v) = MODEPARENT (rm)
               call create_mode (EXPMODE (v), POINTER_MODE, 0)
               }
            else
               EXPMODE (v) = rm
            }
         when (VIS_WORSTMODE_FC) {
            if (lm == Float_mode_ptr || lm == Double_mode_ptr
                   || rm == Float_mode_ptr || rm == Double_mode_ptr)
               EXPMODE (v) = Double_mode_ptr
            else if (MODETYPE (lm) == POINTER_MODE)
               EXPMODE (v) = lm
            else if (MODETYPE (rm) == POINTER_MODE)
               EXPMODE (v) = rm
            else if (lm == Long_uns_mode_ptr || rm == Long_uns_mode_ptr)
               EXPMODE (v) = Long_uns_mode_ptr
            else if (lm == Long_mode_ptr || rm == Long_mode_ptr)
               EXPMODE (v) = Long_mode_ptr
            else if (lm == Unsigned_mode_ptr || rm == Unsigned_mode_ptr)
               EXPMODE (v) = Unsigned_mode_ptr
            else if (lm == Int_mode_ptr || rm == Int_mode_ptr)
               EXPMODE (v) = Int_mode_ptr
            else if (lm == Short_uns_mode_ptr || rm == Short_uns_mode_ptr
                  || lm == Char_uns_mode_ptr || rm == Char_uns_mode_ptr)
               EXPMODE (v) = Short_uns_mode_ptr
            else
               EXPMODE (v) = Short_mode_ptr
            }
      else
         call print (ERROUT, "Bogus entry in otab: *i*n"s, otxt (i))
      }

  # This code is entered only when two pointers are subtracted
   if (bogus_division_required == YES) {
      call gen_convert (Long_uns_mode_ptr)
      call gen_int (bogus_divisor)
      call gen_oper (DIV_OP)
      }

   DBG (33, call dump_expr (Exp_sk (Exp_sp - 1)))

   return

   undefine(DYADIC_FC)
   undefine(FOLD1_FC)
   undefine(FOLD2_FC)
   undefine(LCV_RESULTMODE_FC)
   undefine(LCV_TOARITHMODE_FC)
   undefine(LMB_ARITHMODE_FC)
   undefine(LMB_ARITHPTR_FC)
   undefine(LMB_GENERIC_INT_FC)
   undefine(LMB_LVALUE_FC)
   undefine(LMB_POINTABLE_FC)
   undefine(LMB_POINTERMODE_FC)
   undefine(MONADIC_FC)
   undefine(NILADIC_FC)
   undefine(RCV_DEREFRESULT_FC)
   undefine(RCV_INTMODE_FC)
   undefine(RCV_PARAMMODE_FC)
   undefine(RCV_RESULTMODE_FC)
   undefine(RCV_TOARITHMODE_FC)
   undefine(RIS_PUSH1_FC)
   undefine(RMB_ARITHMODE_FC)
   undefine(RMB_ARITHPTR_FC)
   undefine(RMB_GENERIC_INT_FC)
   undefine(RMB_LVALUE_FC)
   undefine(SETUPADD_FC)
   undefine(SETUPCMP_FC)
   undefine(SETUPSUB_FC)
   undefine(VIS_INTMODE_FC)
   undefine(VIS_LEFTFIELDOF_FC)
   undefine(VIS_LEFTFNRETMODE_FC)
   undefine(VIS_LEFTMODE_FC)
   undefine(VIS_LEFTPOINTEDMODE_FC)
   undefine(VIS_LVALUE_FC)
   undefine(VIS_LEFTPOINTER_FC)
   undefine(VIS_RIGHTMODE_FC)
   undefine(VIS_WORSTMODE_FC)

   end



# gen_make_arith --- make the expression have an arithmetic mode

   subroutine gen_make_arith

   include "c1_com.r.i"

   pointer v, m

   call es_top (v)
   select (MODETYPE (SYMMODE (v)))       # This code appears twice in gen_oper
      when (ARRAY_MODE) {
         m = MODEPARENT (SYMMODE (v))
         call create_mode (m, POINTER_MODE, 0)
         call conv_oper (m)
         }
      when (FUNCTION_MODE) {
         m = SYMMODE (v)
         call create_mode (m, POINTER_MODE,  0)
         call conv_oper (m)
         }
      when (FIELD_MODE) {
         call gen_oper (FIELD_OP)
         }

   return
   end



# check_arith --- make sure the top of the stack is an arithmetic mode

   subroutine check_arith

   include "c1_com.r.i"

   integer v
   integer is_arith

   call es_top (v)
   if (is_arith (v) == NO)
      SYNERR ("Expression must have an arithmetic mode"p)

   return
   end



# gen_toboolean --- make sure top of stack is an integer type

   subroutine gen_toboolean

   include "c1_com.r.i"

   integer is_int
   pointer p

   call es_top (p)
   if (is_int (p) == NO
         || SYMTYPE (p) ~= EXPSYMTYPE
         || EXPOP (p) ~= NE_OP && EXPOP (p) ~= EQ_OP
            && EXPOP (p) ~= GT_OP && EXPOP (p) ~= LE_OP
            && EXPOP (p) ~= GE_OP && EXPOP (p) ~= LT_OP
            && EXPOP (p) ~= NOT_OP && EXPOP (p) ~= SAND_OP
            && EXPOP (p) ~= SOR_OP) {
      call gen_int (0)
      call gen_oper (NE_OP)
      }

   return
   end



# dealloc_expr --- deallocate the expression tree passed

   subroutine dealloc_expr (p)
   pointer p

   include "c1_com.r.i"

   if (p == LAMBDA)
      return

   DBG (25, call dump_sym_entry (p))

   select (SYMTYPE (p))
      when (EXPSYMTYPE) {
         call dealloc_expr (EXPLEFT (p))
         call dealloc_expr (EXPRIGHT (p))
         call dsfree (p)
         }
      when (IDSYMTYPE, SMSYMTYPE)
         ;
      when (LITSYMTYPE) {
         if (SYMTEXT (p) ~= LAMBDA)
            call dsfree (SYMTEXT (p))
         call dsfree (p)
         }
   else
      call print (ERROUT, "in dealloc_expr: bogus node (*i) *i*n"s,
            p, SYMTYPE (p))

   return
   end



