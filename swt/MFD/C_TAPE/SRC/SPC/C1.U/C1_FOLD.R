  # type conversion definitions

   define(D2F,1)              # Double to Float
   define(D2L,2)              # Double to Long Int
   define(D2S,3)              # Double to Short Int
   define(D2U,4)              # Double to Short Unsigned
   define(D2V,5)              # Double to Long Unsigned
   define(F2D,6)              # Float to Double
   define(F2L,7)              # Float to Long Int
   define(F2S,8)              # Float to Short Int
   define(F2U,9)              # Float to Short Unsigned
   define(F2V,10)             # Float to Long Unsigned
   define(L2D,11)             # Long Int to Double
   define(L2F,12)             # Long Int to Float
   define(L2S,13)             # Long Int to Short Int
   define(S2D,14)             # Short Int to Double
   define(S2F,15)             # Short Int to Float
   define(S2L,16)             # Short Int to Long Int
   define(S2V,17)             # Short Int to Long Unsigned
   define(U2D,18)             # Short Unsigned to Double
   define(U2F,19)             # Short Unsigned to Float
   define(U2L,20)             # Short Unsigned to Long Int
   define(U2V,21)             # Short Unsigned to Long Unsigned
   define(V2D,22)             # Long Unsigned to Double
   define(V2F,23)             # Long Unsigned to Float
   define(NCV,0)              # No need to convert
   define(XCV,-1)             # Conversion is illegal
   define(NFC,-2)             # No foldable conversion


# is_null_conv --- tell whether a conversion operator takes no action

   integer function is_null_conv (p)
   pointer p

   include "c1_com.r.i"

   integer conv_type

   if (conv_type (EXPMODE (EXPLEFT (p)), EXPMODE (p)) == NCV)
      return (YES)

   return (NO)
   end


# gen_cast --- generate a conversion for an explicit type cast

   subroutine gen_cast (mp)
   pointer mp

   include "c1_com.r.i"

   call gen_make_arith     # give the expression an arithmetic mode
   call conv_oper (mp)

   return
   end



# gen_convert --- generate an implicit mode conversion operator

   subroutine gen_convert (m2)
   pointer m2

   include "c1_com.r.i"

   integer mt
   pointer v

   mt = MODETYPE (m2)

   call es_top (v)
   select (MODETYPE (SYMMODE (v)))
      when (POINTER_MODE) {
         if (mt == INT_MODE || mt == CHAR_MODE || mt == UNSIGNED_MODE
                 || mt == SHORT_MODE || mt == SHORT_UNS_MODE)
            WARNING ("Pointer will be truncated in conversion"p)
         }
      when (DOUBLE_MODE) {
         if (mt ~= FLOAT_MODE && mt ~= DOUBLE_MODE)
            WARNING ("'Double' will be truncated in conversion"p)
         }

   call conv_oper (m2)

   return
   end

# conv_oper --- do what's necessary to generate a CONVERT operator

   subroutine conv_oper (m2)
   pointer m2

   include "c1_com.r.i"

   integer ctype, ci (4), ri (4), i
   integer conv_type
   pointer p, q, m1
   pointer es_pop, dsget

   p = es_pop (p)
   m1 = EXPMODE (p)

   ctype = conv_type (m1, m2)

   DBG (35, call print (ERROUT, "in conv_oper: m1=*i, m2=*i, ct=*i*n"s,
   DB    m1, m2, ctype))

   if (ctype == XCV)
      SYNERR ("Illegal type conversion"p)

   if (ctype == NCV && SYMTYPE (p) == LITSYMTYPE) {
      EXPMODE (p) = m2
      call es_push (p)
      }
   else if (SYMTYPE (p) ~= LITSYMTYPE || ctype == NFC || ctype == XCV) {
      q = dsget (EXPSIZE)
      EXPTYPE (q) = EXPSYMTYPE
      EXPRIGHT (q) = LAMBDA
      EXPLEFT (q) = p
      EXPMODE (q) = m2
      EXPOP (q) = CONVERT_OP
      call es_push (q)
      }
   else {

      for (i = 1; i <= Mem (SYMTEXT (p)); i += 1)
         ci (i) = Mem (SYMTEXT (p) + i)

      call conv_const (ctype, ci, ri)

      SYMMODE (p) = m2
      call drop_lit_val (p)
      call put_lit_val (p, m2, ri)

      call es_push (p)
      }

   return


   end



# conv_type --- return the type of conversion needed between two modes

   integer function conv_type (m1, m2)
   pointer m1, m2

   include "c1_com.r.i"

   integer ctype
   integer is_aggregate
   longint sizeof_mode

   integer conv_tbl (15, 15)

   data conv_tbl /_
   ###############################################################
   #                     U   S                               F   #
   #     C               N   H   L               P           U   #
   #     H               S   O   O       D       O           N   #
   #     A       S       I   R   N   F   O   F   I   A       C   #
   # C   R       H   L   G   T   G   L   U   I   N   R   E   T   #
   # H   U   I   O   O   N   U   U   O   B   E   T   R   N   I   #
   # A   N   N   R   N   E   N   N   A   L   L   E   A   U   O   #
   # R   S   T   T   G   D   S   S   T   E   D   R   Y   M   N   #
   #######################################################################
    NCV,NCV,NCV,NCV,L2S,NCV,NCV,L2S,F2S,D2S,XCV,L2S,XCV,NCV,XCV, # CHAR
    NCV,NCV,NCV,NCV,L2S,NCV,NCV,L2S,F2U,D2U,XCV,L2S,XCV,NCV,XCV, # CHARUNS
    NCV,NCV,NCV,NCV,L2S,NCV,NCV,L2S,F2S,D2S,XCV,L2S,XCV,NCV,XCV, # INT
    NCV,NCV,NCV,NCV,L2S,NCV,NCV,L2S,F2S,D2S,XCV,L2S,XCV,NCV,XCV, # SHORT
    S2L,U2L,S2L,S2L,NCV,U2L,U2L,NCV,F2L,D2L,XCV,NCV,XCV,S2L,XCV, # LONG
    NCV,NCV,NCV,NCV,L2S,NCV,NCV,L2S,F2U,D2U,XCV,L2S,XCV,NCV,XCV, # UNSIGNED
    NCV,NCV,NCV,NCV,L2S,NCV,NCV,L2S,F2U,D2U,XCV,L2S,XCV,NCV,XCV, # SHORTUNS
    S2V,U2V,S2V,S2V,NCV,U2V,U2V,NCV,F2V,D2V,XCV,NCV,XCV,S2V,XCV, # LONGUNS
    S2F,U2F,S2F,S2F,L2F,U2F,U2F,V2F,NCV,D2F,XCV,V2F,XCV,S2F,XCV, # FLOAT
    S2D,U2D,S2D,S2D,L2D,U2D,U2D,V2D,F2D,NCV,XCV,V2D,XCV,S2D,XCV, # DOUBLE
    XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV, # FIELD
    S2V,U2V,S2V,S2V,NCV,U2V,U2V,NCV,XCV,XCV,XCV,NCV,NFC,S2V,NFC, # POINTER
    XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,NFC,NCV,XCV,XCV, # ARRAY
    NCV,NCV,NCV,NCV,L2S,NCV,NCV,L2S,F2S,D2S,XCV,L2S,XCV,NCV,XCV, # ENUM
    XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,XCV,NFC,XCV,XCV,NCV/ # FUNCTION
   #######################################################################

   if (m1 == m2)
      ctype = NCV

   else if (is_aggregate (m1) == YES && is_aggregate (m2) == YES
            && sizeof_mode (m1) == sizeof_mode (m2))
      ctype = NCV

   else if (MODETYPE (m1) < 1 || MODETYPE (m1) > 15
         || MODETYPE (m2) < 1 || MODETYPE (m2) > 15)
      ctype = XCV

   else
      ctype = conv_tbl (MODETYPE (m1), MODETYPE (m2))

   return (ctype)
   end



# conv_const --- convert a constant from one type to another

   subroutine conv_const (ctype, cp, rp)
   integer ctype, cp (4), rp (4)

   integer i

   integer ci (4), ri (4)
   longint cl (2), rl (2)
   real cf (2), rf (2)
   longreal cd (1), rd (1)
   equivalence (ci, cl, cf, cd), (ri, rl, rf, rd)

   shortcall mkonu$ (18)
   external arith_excep

   call mkonu$ ("ARITH$"v, loc (arith_excep))

   do i = 1, 4
      ci (i) = cp (i)

   select (ctype)
      when (D2F)
         rf (1) = cd (1)
      when (D2L)
         rl (1) = cd (1)
      when (D2S)
         ri (1) = cd (1)
      when (D2U) {
         rl (1) = dabs (cd (1))
         ri (1) = ri (2)
         }
      when (D2V)
         rl (1) = dabs (cd (1))
      when (F2D)
         rd (1) = cf (1)
      when (F2L)
         rl (1) = cf (1)
      when (F2S)
         ri (1) = cf (1)
      when (F2U) {
         rl (1) = abs (cf (1))
         ri (1) = ri (2)
         }
      when (F2V)
         rl (1) = abs (cf (1))
      when (L2D)
         rd (1) = cl (1)
      when (L2F)
         rf (1) = cl (1)
      when (L2S)
         ri (1) = cl (1)
      when (S2D)
         rd (1) = ci (1)
      when (S2F)
         rf (1) = ci (1)
      when (S2L)
         rl (1) = ci (1)
      when (S2V) {
         ri (1) = 0
         ri (2) = ci (1)
         }
      when (U2D) {
         ci (2) = ci (1)
         ci (1) = 0
         rd (1) = cl (1)
         }
      when (U2F) {
         ci (2) = ci (1)
         ci (1) = 0
         rf (1) = cl (1)
         }
      when (U2L) {
         ri (1) = 0
         ri (2) = ci (1)
         }
      when (U2V) {
         ri (1) = 0
         ri (2) = ci (1)
         }
      when (V2D)
         rd (1) = iabs (cl (1))
      when (V2F)
         rf (1) = iabs (cl (1))
   else {
      call print (ERROUT, "ctype=*i*n"s, ctype)
      FATAL ("in conv_const: bogus value in conv_tbl"p)
      }

   do i = 1, 4
      rp (i) = ri (i)

   return
   end



   undefine(D2F)
   undefine(D2L)
   undefine(D2S)
   undefine(D2U)
   undefine(D2V)
   undefine(F2D)
   undefine(F2L)
   undefine(F2S)
   undefine(F2U)
   undefine(F2V)
   undefine(L2D)
   undefine(L2F)
   undefine(L2S)
   undefine(S2D)
   undefine(S2F)
   undefine(S2L)
   undefine(S2V)
   undefine(U2D)
   undefine(U2F)
   undefine(U2L)
   undefine(U2V)
   undefine(V2D)
   undefine(V2F)



# get_lit_val --- get the value of a literal

   integer function get_lit_val (p, v, maxv)
   pointer p
   integer v (ARB), maxv

   include "c1_com.r.i"

   integer i

   for (i = 1; i <= maxv && i <= Mem (SYMTEXT (p)); i += 1)
      v (i) = Mem (SYMTEXT (p) + i)

   return (i - 1)
   end



# put_lit_val --- give a literal a value

   subroutine put_lit_val (p, mp, v)
   pointer p, mp
   integer v (4)

   include "c1_com.r.i"

   integer len, i
   integer wsize
   pointer dsget
   longint sizeof_mode

   len = wsize (sizeof_mode (mp))

   SYMTEXT (p) = dsget (len + 1)
   Mem (SYMTEXT (p)) = len
   do i = 1, len
      Mem (SYMTEXT (p) + i) = v (i)

   return
   end


# drop_lit_val --- delete the value of a literal

   subroutine drop_lit_val (p)
   pointer p

   include "c1_com.r.i"

   if (SYMTEXT (p) ~= LAMBDA)
      call dsfree (SYMTEXT (p))

   return
   end



# fold_const --- fold a constant expression

   subroutine fold_const (v, le, re)
   pointer v, le, re

   include "c1_com.r.i"

   logical vb
   integer vi, li, ri
   longint vl, ll, rl
   longreal vd, ld, rd
   equivalence (vb, vi, vl, vd), (li, ll, ld), (ri, rl, rd)

   shortcall mkonu$ (18)
   external arith_excep

   procedure bogus_op forward

   call mkonu$ ("ARITH$"v, loc (arith_excep))

   call get_lit_val (le, li, 4)
   if (re ~= LAMBDA)
      call get_lit_val (re, ri, 4)

   select (MODETYPE (EXPMODE (v)))
      when (INTMODE, SHORTMODE, CHARMODE, ENUMMODE, CHARUNSMODE) {
         select (EXPOP (v))
            when (ADD_OP)
               vi = li + ri
            when (AND_OP)
               vi = and (li, ri)
            when (COMPL_OP)
               vi = not (li)
            when (DIV_OP)
               vi = li / ri
            when (EQ_OP)
               vb = li == ri
            when (GE_OP)
               vb = li >= ri
            when (GT_OP)
               vb = li > ri
            when (LE_OP)
               vb = li <= ri
            when (LSHIFT_OP)
               vi = ls (li, ri)
            when (LT_OP)
               vb = li < ri
            when (MUL_OP)
               vi = li * ri
            when (NEG_OP)
               vi = -li
            when (NE_OP)
               vb = li ~= ri
            when (NOT_OP) {
               vb = .false.
               if (li == 0)
                  vb = .true.
               }
            when (OR_OP)
               vi = or (li, ri)
            when (REM_OP)
               vi = mod (li, ri)
            when (RSHIFT_OP)
               vi = rs (li, ri)
            when (SAND_OP) {
               vb = .false.
               if (li ~= 0 && ri ~= 0)
                  vb = .true.
               }
            when (SOR_OP) {
               vb = .true.
               if (li == 0 && ri == 0)
                  vb = .false.
               }
            when (SUB_OP)
               vi = li - ri
            when (XOR_OP)
               vi = xor (li, ri)
         else
            bogus_op
         }
      when (UNSIGNEDMODE, SHORTUNSMODE) {
         select (EXPOP (v))
            when (ADD_OP)
               vi = li + ri
            when (AND_OP)
               vi = and (li, ri)
            when (COMPL_OP)
               vi = not (li)
            when (DIV_OP)
               vi = rt (intl (li), 16) / ri
            when (EQ_OP)
               vb = li == ri
            when (GE_OP)
               vb = rt (intl (li), 16) >= rt (intl (ri), 16)
            when (GT_OP)
               vb = rt (intl (li), 16) > rt (intl (ri), 16)
            when (LE_OP)
               vb = rt (intl (li), 16) <= rt (intl (ri), 16)
            when (LSHIFT_OP)
               vi = ls (li, ri)
            when (LT_OP)
               vb = rt (intl (li), 16) < rt (intl (ri), 16)
            when (MUL_OP)
               vi = li * ri
            when (NEG_OP)
               vi = -li
            when (NE_OP)
               vb = li ~= ri
            when (NOT_OP) {
               vb = .false.
               if (li == 0)
                  vb = .true.
               }
            when (OR_OP)
               vi = or (li, ri)
            when (REM_OP)
               vi = mod (rt (intl (li), 16), ri)
            when (RSHIFT_OP)
               vi = rs (li, ri)
            when (SAND_OP) {
               vb = .false.
               if (li ~= 0 && ri ~= 0)
                  vb = .true.
               }
            when (SOR_OP) {
               vb = .true.
               if (li == 0 && ri == 0)
                  vb = .false.
               }
            when (SUB_OP)
               vi = li - ri
            when (XOR_OP)
               vi = xor (li, ri)
         else
            bogus_op
         }
      when (LONGMODE) {
         select (EXPOP (v))
            when (ADD_OP)
               vl = ll + rl
            when (AND_OP)
               vl = and (ll, rl)
            when (COMPL_OP)
               vl = not (ll)
            when (DIV_OP)
               vl = ll / rl
            when (EQ_OP)
               vb = ll == rl
            when (GE_OP)
               vb = ll >= rl
            when (GT_OP)
               vb = ll > rl
            when (LE_OP)
               vb = ll <= rl
            when (LSHIFT_OP)
               vl = ls (ll, ri)
            when (LT_OP)
               vb = ll < rl
            when (MUL_OP)
               vl = ll * rl
            when (NEG_OP)
               vl = -ll
            when (NE_OP)
               vb = ll ~= rl
            when (NOT_OP) {
               vb = .false.
               if (ll == 0)
                  vb = .true.
               }
            when (OR_OP)
               vl = or (ll, rl)
            when (REM_OP)
               vl = mod (ll, rl)
            when (RSHIFT_OP)
               vl = rs (ll, ri)
            when (SAND_OP) {
               vb = .false.
               if (ll ~= 0 && rl ~= 0)
                  vb = .true.
               }
            when (SOR_OP) {
               vb = .true.
               if (ll == 0 && rl == 0)
                  vb = .false.
               }
            when (SUB_OP)
               vl = ll - rl
            when (XOR_OP)
               vl = xor (ll, rl)
         else
            bogus_op
         }
      when (LONGUNSMODE, POINTERMODE) {
         select (EXPOP (v))
            when (ADD_OP)
               vl = ll + rl
            when (AND_OP)
               vl = and (ll, rl)
            when (COMPL_OP)
               vl = not (ll)
            when (DIV_OP)
               vl = ll / rl
            when (EQ_OP)
               vb = ll == rl
            when (GE_OP)
               vb = ll >= rl
            when (GT_OP)
               vb = ll > rl
            when (LE_OP)
               vb = ll <= rl
            when (LSHIFT_OP)
               vl = ls (ll, ri)
            when (LT_OP)
               vb = ll < rl
            when (MUL_OP)
               vl = ll * rl
            when (NEG_OP)
               vl = -ll
            when (NE_OP)
               vb = ll ~= rl
            when (NOT_OP) {
               vb = .false.
               if (ll == 0)
                  vb = .true.
               }
            when (OR_OP)
               vl = or (ll, rl)
            when (REM_OP)
               vl = mod (ll, rl)
            when (RSHIFT_OP)
               vl = rs (ll, ri)
            when (SAND_OP) {
               vb = .false.
               if (ll ~= 0 && rl ~= 0)
                  vb = .true.
               }
            when (SOR_OP) {
               vb = .true.
               if (ll == 0 && rl == 0)
                  vb = .false.
               }
            when (SUB_OP)
               vl = ll - rl
            when (XOR_OP)
               vl = xor (ll, rl)
         else
            bogus_op
         }
      when (DOUBLEMODE) {
         select (EXPOP (v))
            when (ADD_OP)
               vd = ld + rd
            when (DIV_OP)
               vd = ld / rd
            when (EQ_OP)
               vb = ld == rd
            when (GE_OP)
               vb = ld >= rd
            when (GT_OP)
               vb = ld > rd
            when (LE_OP)
               vb = ld <= rd
            when (LT_OP)
               vb = ld < rd
            when (MUL_OP)
               vd = ld * rd
            when (NEG_OP)
               vd = -ld
            when (NE_OP)
               vb = ld ~= rd
            when (NOT_OP) {
               vb = .false.
               if (ld == 0)
                  vb = .true.
               }
            when (REM_OP)
               vd = amod (ld, rd)
            when (SAND_OP) {
               vb = .false.
               if (ld ~= 0 && rd ~= 0)
                  vb = .true.
               }
            when (SOR_OP) {
               vb = .true.
               if (ld == 0 && rd == 0)
                  vb = .false.
               }
            when (SUB_OP)
               vd = ld - rd
         else
            bogus_op
         }
      else {
         call print (ERROUT, "p=*i, m=*i*n"s, v, EXPMODE (v))
         FATAL ("in fold_const: bogus mode encountered"p)
         }

   call drop_lit_val (le)
   call put_lit_val (le, EXPMODE (v), vi)
   SYMMODE (le) = EXPMODE (v)

   return


   # bogus_op --- print a message indicating an illegal operator

      procedure bogus_op {

      SYNERR ("Operation is not legal on specified data types"p)
      }

   end



# arith_excep --- pick up and diagnose an arithmetic exception

   subroutine arith_excep (x)
   integer x

   SYNERR ("Arithmetic exception occured in constant operation"p)

   return
   end
