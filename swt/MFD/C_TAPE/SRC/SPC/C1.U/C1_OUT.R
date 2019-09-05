# out_stmt --- output a seq node and an operator node

   subroutine out_stmt (op)
   integer op

   call out_oper (SEQ_OP)
   call out_oper (op)

   return
   end



# out_size --- output the size of a mode in word

   subroutine out_size (mp)
   pointer mp

   integer wsize
   longint sizeof_mode

   call out_num (wsize (sizeof_mode (mp)))

   return
   end



# out_var --- output a seq node and then declare variable

   subroutine out_var (p)
   pointer p

   include "c1_com.r.i"

   call out_oper (SEQ_OP)

   select (SYMSC (p))
      when (DEFAULT_SC) {
         call out_oper (DEFINE_STAT_OP)
         call out_num (SYMOBJ (p))
         }
      when (AUTO_SC, REGISTER_SC) {
         call out_oper (DEFINE_DYNM_OP)
         call out_num (SYMOBJ (p))
         }
      when (EXTERN_SC) {
            call out_oper (DECLARE_STAT_OP)
            call out_num (SYMOBJ (p))
            call out_name (Mem (SYMTEXT (p)))
         }
      when (STATIC_SC) {
         call out_oper (DEFINE_STAT_OP)
         call out_num (SYMOBJ (p))
         }
      when (TYPEDEF_SC)
         ;
   else {
      call print (ERROUT, "p=*i sc=*i*n"s, p, SYMSC (p))
      FATAL ("in out_var: bogus sc"p)
      }

   return
   end



# out_proc --- output a seq node and then declare a procedure

   subroutine out_proc (p, nargs)
   pointer p
   integer nargs

   include "c1_com.r.i"

   call out_oper (SEQ_OP)

   call out_oper (PROC_DEFN_OP)
   call out_num (SYMOBJ (p))
   call out_num (nargs)
   call out_name (Mem (SYMTEXT (p)))

   return
   end



# out_arg --- declare a formal parameter

   subroutine out_arg (p)
   pointer p

   include "c1_com.r.i"

   integer wsize
   longint sizeof_mode

   pointer mp

   call out_oper (PROC_DEFN_ARG_OP)
   call out_num (SYMOBJ (p))

   mp = SYMMODE (p)
   if (MODETYPE (mp) == POINTER_MODE) {
      call out_mode (mp)
      call out_num (REF_DISP)
      }
   else {
      call out_mode (mp)
      call out_num (VALUE_DISP)
      }
   call out_num (wsize (sizeof_mode (mp)))

   return
   end



# out_lab --- output a seq node and then declare a label

   subroutine out_lab (p)
   pointer p

   include "c1_com.r.i"

   call out_oper (SEQ_OP)
   call out_oper (LABEL_OP)
   call out_num (SYMOBJ (p))

   return
   end



# out_goto --- output a seq node and then output a 'goto'

   subroutine out_goto (p)
   pointer p

   include "c1_com.r.i"

   call out_oper (SEQ_OP)
   call out_oper (GOTO_OP)
   call out_num (SYMOBJ (p))

   return
   end



# out_expr --- convert and output an expression tree

   subroutine out_expr

   include "c1_com.r.i"

   pointer p
   pointer es_pop

   p = es_pop (p)

   DBG (30, call dump_expr (p))

   call out_exprtree (p)

   return
   end



# out_exprtree --- output an expression tree in prefix form and deallocate

   subroutine out_exprtree (p)
   pointer p

   include "c1_com.r.i"

   integer i, j, r (MAXTOK)
   integer wsize, get_lit_val, is_null_conv
   longint sizeof_mode, get_long

   procedure out_operator forward

   select (SYMTYPE (p))
      when (EXPSYMTYPE)
         call out_operator
      when (IDSYMTYPE, SMSYMTYPE) {
         call out_oper (OBJECT_OP)
         call out_mode (SYMMODE (p))
         call out_num (SYMOBJ (p))
         }
      when (LITSYMTYPE) {
         call out_oper (CONST_OP)
         call out_mode (SYMMODE (p))
         j = get_lit_val (p, r, MAXTOK)
         call out_num (j)
         do i = 1, j
            call writef (r (i), 1, OUTFILE)
         call drop_lit_val (p)
         call dsfree (p)
         }
   else
      call print (ERROUT, "in out_exprtree: bogus node (*i) *i*n"s,
            p, SYMTYPE (p))

   return


   # out_operator --- convert and output an expression operator

      procedure out_operator {

      select (EXPOP (p))
         when (COND1_OP) {
            if (EXPOP (EXPRIGHT (p)) ~= COND2_OP)
               FATAL ("COND1_OP without COND2_OP"p)
            call out_oper (IF_OP)
            call out_mode (EXPMODE (p))
            call out_exprtree (EXPLEFT (p))
            call out_exprtree (EXPLEFT (EXPRIGHT (p)))
            call out_exprtree (EXPRIGHT (EXPRIGHT (p)))
            call dsfree (EXPRIGHT (p))
            }
         when (CONVERT_OP) {
            if (is_null_conv (p) == YES)
               call out_exprtree (EXPLEFT (p))
            else if (MODETYPE (EXPMODE (EXPLEFT (p))) == ARRAY_MODE
                   || MODETYPE (EXPMODE (EXPLEFT (p))) == FUNCTION_MODE) {
               call out_oper (REFTO_OP)
               call out_mode (EXPMODE (p))
               call out_exprtree (EXPLEFT (p))
               }
            else if (MODETYPE (EXPMODE (p)) == ARRAY_MODE) {
               call out_oper (DEREF_OP)
               call out_mode (EXPMODE (p))
               call out_exprtree (EXPLEFT (p))
               }
            else {
               call out_oper (CONVERT_OP)
               call out_mode (EXPMODE (EXPLEFT (p)))
               call out_mode (EXPMODE (p))
               call out_exprtree (EXPLEFT (p))
               }
            }
         when (SELECT_OP) {
            if (SYMTYPE (EXPRIGHT (p)) ~= SMSYMTYPE)
               FATAL ("in out_exprtree: attempt to select non-SM"p)
            call out_oper (SELECT_OP)
            call out_mode (EXPMODE (p))
            call out_num (ints (get_long (SYMOFFS (EXPRIGHT (p))) / 16))
            call out_exprtree (EXPLEFT (p))
            }
         when (INDEX_OP) {
            call out_oper (INDEX_OP)
            call out_mode (EXPMODE (p))
            call out_exprtree (EXPLEFT (p))
            call out_exprtree (EXPRIGHT (p))
            call out_size (EXPMODE (p))
            }
         when (PROC_CALL_OP) {
            call out_oper (PROC_CALL_OP)
            call out_mode (EXPMODE (p))
            call out_exprtree (EXPLEFT (p))
            call out_proc_call_arg (EXPRIGHT (p))
            call out_oper (NULL_OP)
            }
         when (EQ_OP, NE_OP, GE_OP, GT_OP, LT_OP, LE_OP, SAND_OP, SOR_OP) {
            call out_oper (EXPOP (p))
            call out_mode (EXPMODE (EXPLEFT (p)))
            call out_exprtree (EXPLEFT (p))
            call out_exprtree (EXPRIGHT (p))
            }
         when (NOT_OP) {
            call out_oper (NOT_OP)
            call out_mode (EXPMODE (EXPLEFT (p)))
            call out_exprtree (EXPLEFT (p))
            }
         when (FIELD_OP) {
            call out_oper (FIELD_OP)
            call out_mode (EXPMODE (p))
            if (SYMTYPE (EXPLEFT (p)) ~= EXPSYMTYPE
                  || EXPOP (EXPLEFT (p)) ~= SELECT_OP)
               FATAL ("FIELD_OP without a SELECT_OP"p)
            call out_num (ints (mod ( _
                           get_long (SYMOFFS (EXPRIGHT (EXPLEFT (p)))),
                           16)))
            call out_num (ints (sizeof_mode (EXPMODE (EXPLEFT (p)))))
            call out_exprtree (EXPLEFT (p))
            }
         when (SEQ_OP) {
            call out_oper (SEQ_OP)
            call out_exprtree (EXPLEFT (p))
            call out_exprtree (EXPRIGHT (p))
            }
         when (ASSIGN_OP) {
            call out_oper (ASSIGN_OP)
            call out_mode (EXPMODE (p))
            call out_exprtree (EXPLEFT (p))
            call out_exprtree (EXPRIGHT (p))
            call out_num (wsize (sizeof_mode (EXPMODE (p))))
            }
      else {
         call out_oper (EXPOP (p))
         call out_mode (EXPMODE (p))
         if (EXPLEFT (p) ~= LAMBDA)
            call out_exprtree (EXPLEFT (p))
         if (EXPRIGHT (p) ~= LAMBDA)
            call out_exprtree (EXPRIGHT (p))
         }

      call dsfree (p)
      }

   end



# out_proc_call_arg --- output an argument to a procedure call

   subroutine out_proc_call_arg (p)
   pointer p

   include "c1_com.r.i"

   if (SYMTYPE (p) ~= EXPSYMTYPE) {
      call out_oper (PROC_CALL_ARG_OP)
      call out_mode (EXPMODE (p))
      call out_exprtree (p)
      }
   else if (EXPOP (p) == PROC_CALL_ARG_OP) {
      call out_proc_call_arg (EXPLEFT (p))
      call out_proc_call_arg (EXPRIGHT (p))
      call dsfree (p)
      }
   else if (EXPOP (p) == NULL_OP)
      call dsfree (p)
   else {
      call out_oper (PROC_CALL_ARG_OP)
      call out_mode (EXPMODE (p))
      call out_exprtree (p)
      }

   return
   end



# out_num --- output a 16-bit integer

   subroutine out_num (n)
   integer n

   include "c1_com.r.i"

   call writef (n, 1, OUTFILE)

   return
   end



# out_oper --- output an operator node

   subroutine out_oper (n)
   integer n

   include "c1_com.r.i"

   DBG (31, call display_oper (n, OUTFILE); call print (OUTFILE, " "s))

   call writef (n, 1, OUTFILE)

   return
   end



# out_name --- output the name of a symbol

   subroutine out_name (str)
   character str (ARB)

   include "c1_com.r.i"

   integer length
   integer i

DB for (i = 1; i <= 50 && str (i) ~= EOS; i += 1)
DB    if (str (i) < ' 'c || str (i) >= DEL) {
DB       call print (OUTFILE, " %%%%"s)
DB       return
DB       }

   DBG (31, call print (OUTFILE, "'*s' "s, str))

   i = length (str)
#
#  if first character of a name is '_', make it 'z$_....'
#  so PMA won't croak     EJH 02/04/83
#
   if (str (1) == '_'c) {
      call writef (i+2, 1, OUTFILE)
      call writef ("z$"s, 2, OUTFILE)
      }
   else
      call writef (i, 1, OUTFILE)
#
   call writef (str (1), i, OUTFILE)

   return
   end



# out_mode --- output the mode of an object

   subroutine out_mode (mp)
   pointer mp

   include "c1_com.r.i"

   define(SHORTMODE_CCG,1)
   define(LONGMODE_CCG,2)
   define(SHORTUNSMODE_CCG,3)
   define(LONGUNSMODE_CCG,4)
   define(FLOATMODE_CCG,5)
   define(DOUBLEMODE_CCG,6)
   define(STRUCTMODE_CCG,7)

   integer mt

   select (MODETYPE (mp))
      when (INTMODE, CHARMODE, SHORTMODE, ENUMMODE)
         mt = SHORTMODE_CCG
      when (LONGMODE)
         mt = LONGMODE_CCG
      when (UNSIGNEDMODE, SHORTUNSMODE, CHARUNSMODE)
         mt = SHORTUNSMODE_CCG
      when (LONGUNSMODE, POINTERMODE)
         mt = LONGUNSMODE_CCG
      when (FLOATMODE)
         mt = FLOATMODE_CCG
      when (DOUBLEMODE)
         mt = DOUBLEMODE_CCG
      when (ARRAYMODE, STRUCTMODE, UNIONMODE)
         mt = STRUCTMODE_CCG
      when (FIELDMODE)
         mt = SHORTMODE_CCG
      when (FUNCTIONMODE)
         mt = 0
   else
      call print (ERROUT, "in out_mode: bogus mode (*i) *i*n"s, mp, mt)

   call out_num (mt)

   return

   undefine(SHORTMODE_CCG)
   undefine(LONGMODE_CCG)
   undefine(SHORTUNSMODE_CCG)
   undefine(LONGUNSMODE_CCG)
   undefine(FLOATMODE_CCG)
   undefine(DOUBLEMODE_CCG)
   undefine(STRUCTMODE_CCG)

   end



# out_declarations --- output necessary ext. and ent. declarations

   subroutine out_declarations

   include "c1_com.r.i"

   pointer p, id
   character name (MAXTOK)
   integer accesssym

   DBG (40, call print (ERROUT, "*nEntry points: *n"s))

   SETSTREAM (ENTSTREAM)
   p = LAMBDA
   for (id = accesssym (1, name, p, IDCLASS); id ~= LAMBDA;
                           id = accesssym (1, name, p, IDCLASS))
      if (SYMSC (id) ~= STATIC_SC && SYMSC (id) ~= TYPEDEF_SC
#                       && SYMSC (id) ~= EXTERN_SC
                        && SYMISDEF (id) == YES) {
         # assume that all EXTERNS are undefined - those
         # with SYMISDEF = YES or SYMISDEF = STATIC_SC
         # have been redeclared from some other sc -
         # should be an ENT for it except if it was a STATIC
         call out_oper (SEQ_OP)
         call out_num (SYMOBJ (id))
         call out_name (name)
         DBG (40, call print (ERROUT, "   '*10s' "s, name)
         DB       call dump_sym_entry (id)
         DB       call print (ERROUT, "*n"s))
         }


   DBG (40, call print (ERROUT, "*nExternal references: *n"s))

   SETSTREAM (EXTDEFSTREAM)
   p = LAMBDA
   for (id = accesssym (1, name, p, IDCLASS); id ~= LAMBDA;
                           id = accesssym (1, name, p, IDCLASS))
      if (SYMISDEF (id) == NO && SYMOBJ (id) ~= 0) {

         if (SYMSC (id) == DEFAULT_SC)
            SYMSC (id) = EXTERN_SC
         else if (SYMSC (id) == STATIC_SC) { # can't happen
            ERROR_SYMBOL (name)
            SYNERR ("Static symbol declared but not defined"p)
            SYMSC (id) = EXTERN_SC
            }

         call out_var (id)
         DBG (40, call print (ERROUT, "   '*10s' "s, name)
         DB       call dump_sym_entry (id)
         DB       call print (ERROUT, "*n"s))
         }

   return
   end



# out_initstart --- start collecting an initializer

   subroutine out_initstart

   include "c1_com.r.i"

   Zinit_len = 0

   return
   end



# out_initend --- end the collection of an identifier

   subroutine out_initend

   include "c1_com.r.i"

   if (Zinit_len > 0) {
      call out_oper (ZERO_INIT_OP)
      call out_num (ints (Zinit_len))
      Zinit_len = 0
      }

   return
   end



# out_init --- put out an element of an initializer

   subroutine out_init (mode)
   pointer mode

   include "c1_com.r.i"

   integer i, j, iszero, r (MAXTOK)
   integer get_lit_val
   pointer p

   call es_top (p)

   iszero = NO
   if (SYMTYPE (p) == LITSYMTYPE) {
      j = get_lit_val (p, r, MAXTOK)
      for (i = 1; i <= j; i += 1)
         if (r (i) ~= 0)
            break
      if (i > j)
         iszero = YES
      }

   if (iszero == YES) {
      Zinit_len += j
      call es_pop (p)
      call dealloc_expr (p)
      }
   else {
      if (Zinit_len > 0) {
         call out_oper (ZERO_INIT_OP)
         call out_num (ints (Zinit_len))
         Zinit_len = 0
         }
      call out_oper (INIT_OP)
      call out_mode (mode)
      call out_expr
      }

   return
   end
