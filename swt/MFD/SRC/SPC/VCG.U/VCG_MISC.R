# vcg_misc --- miscellaneous routines used by the code generator

define(MISC_COMMON,"vcg_misc_com.r.i")



# initialize_labels --- initialize "next label" generator
#                       & get unique run time routine ids just in case

   subroutine initialize_labels

   include MISC_COMMON
   include VCG_COMMON


   unsigned mklabel

   Nextlab = 0

   lf_shft_int = mklabel (1)
   lf_shft_long = mklabel (1)
   rt_shft_int = mklabel (1)
   rt_shft_long = mklabel (1)
   rt_shft_uns = mklabel (1)
   rt_shft_longuns = mklabel (1)
   v$cilwb_id = mklabel (1)
   v$vilwb_id = mklabel (1)
   v$culwb_id = mklabel (1)
   v$vulwb_id = mklabel (1)
   v$cllwb_id = mklabel (1)
   v$vllwb_id = mklabel (1)
   v$cvlwb_id = mklabel (1)
   v$vvlwb_id = mklabel (1)
   v$ciupb_id = mklabel (1)
   v$viupb_id = mklabel (1)
   v$cuupb_id = mklabel (1)
   v$vuupb_id = mklabel (1)
   v$clupb_id = mklabel (1)
   v$vlupb_id = mklabel (1)
   v$cvupb_id = mklabel (1)
   v$vvupb_id = mklabel (1)
   v$cirng_id = mklabel (1)
   v$virng_id = mklabel (1)
   v$curng_id = mklabel (1)
   v$vurng_id = mklabel (1)
   v$clrng_id = mklabel (1)
   v$vlrng_id = mklabel (1)
   v$cvrng_id = mklabel (1)
   v$vvrng_id = mklabel (1)
   block_copy_id = mklabel (1)

   return
   end



# mklabel --- generate 'num' consecutive labels

   unsigned function mklabel (numlabs)
   integer numlabs

   include MISC_COMMON

   Nextlab -= numlabs
   return (Nextlab)
   end



# safe --- determine if two sets of registers conflict

   logical function safe (r1, r2)
   regset r1, r2

   regset lr1, lr2

   lr1 = r1
   lr2 = r2

   if (and (lr1, lr2) ~= 0)
      return (FALSE)

   if (and (lr1, A_REG) ~= 0)    lr1 |= L_REG
   if (and (lr1, L_REG) ~= 0)    lr1 |= A_REG
   if (and (lr1, F_REG) ~= 0)    lr1 |= LF_REG
   if (and (lr1, LF_REG) ~= 0)   lr1 |= F_REG

   if (and (lr2, A_REG) ~= 0)    lr2 |= L_REG
   if (and (lr2, L_REG) ~= 0)    lr2 |= A_REG
   if (and (lr2, F_REG) ~= 0)    lr2 |= LF_REG
   if (and (lr2, LF_REG) ~= 0)   lr2 |= F_REG

   if (and (lr1, lr2) ~= 0)
      safe = FALSE
   else
      safe = TRUE

   return
   end



# op_has_value --- true if operand is CONSTANT and has specified value

   logical function op_has_value (expr, val)
   tpointer expr
   integer val

   include VCG_COMMON

   integer j

   integer i (4)
   longint l (2)
   real r (2)
   longreal f (1)
   equivalence (i (1), l (1), r (1), f (1))

   if (Tmem (expr) ~= CONST_OP)
      return (FALSE)

   for (j = 0; j < Tmem (expr + 2); j += 1)
      i (1 + j) = Tmem (expr + 3 + j)

   select (Tmem (expr + 1))
      when (INT_MODE, UNS_MODE)
         if (i (1) == val)
            return (TRUE)

      when (LONG_INT_MODE, LONG_UNS_MODE)
         if (l (1) == val)
            return (TRUE)

      when (FLOAT_MODE)
         if (r (1) == val)
            return (TRUE)

      when (LONG_FLOAT_MODE)
         if (f (1) == val)
            return (TRUE)

   return (FALSE)
   end
