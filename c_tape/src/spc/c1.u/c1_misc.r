# synerr --- report syntax error

   subroutine synerr (message, warnflag)
   packed_char message (ARB)
   integer warnflag

   include "c1_com.r.i"

   integer i, j, nl, el, ml
   integer encode, ctoc, ptoc
   character nums (MAXLINE), msg (MAXLINE)

  # Build error location string
   nl = 1
   for (i = 1; i < Level; i = i + 1)
      nl += encode (nums (nl), MAXLINE - nl, "*5i"s, Line_number (i))
   nl += encode (nums (nl), MAXLINE - nl, "*5i"s, Symline)
   nl += encode (nums (nl), MAXLINE - nl, " (*s): "s, Module_name)

  # Unpack message
   if (warnflag == YES)
      ml = encode (msg, MAXLINE, "Warning: *p"s, message)
   else
      ml = ptoc (message, '.'c, msg, MAXLINE)

  # Try to get the error context
   el = length (Error_sym)
   if (el == 0)
      if (Symbol == NEWLINE)
         el = ctoc ("<NEWLINE>"s, Error_sym, MAXTOK)
      else if (Symbol == EOF)
         el = ctoc ("<EOF>"s, Error_sym, MAXTOK)
      else if (Symtext (Symlen + 1) == EOS)
         el = ctoc (Symtext, Error_sym, MAXTOK)

  # Try to print the message
   if (el == 0)
      call print (ERROUT, "*s*s.*n"s, nums, msg)
   else if (el + nl + ml <= 73)
      call print (ERROUT, "*s'*s' *s.*n"s, nums, Error_sym, msg)
   else
      call print (ERROUT, "*s'*s'*n*10x*s.*n"s, nums, Error_sym, msg)

  # Check the error count
   if (warnflag == NO)
      Nerrs += 1
   if (Nerrs > MAXERRS)
      call error ("Too many errors -- giving up."s)

   Error_sym (1) = EOS

   return
   end



# fatalerr --- report fatal error and die

   subroutine fatalerr (msg)
   integer msg (ARB)

   SYNERR (msg)
   call remark ("Compilation terminated"p)

DB call comlv$
DB return
DB 10
   call seterr (1000)
   stop

   end



# sdupl --- duplicate a string in dynamic storage space

   pointer function sdupl (str)
   character str (ARB)

   include "c1_com.r.i"

   integer length

   pointer dsget

   sdupl = dsget (length (str) + 1)
   call scopy (str, 1, Mem, sdupl)

   return
   end



# ss_alloc --- allocate frame on semantic stack

   subroutine ss_alloc (size)
   integer size

   include "c1_com.r.i"

DB integer i

   Sem_sp += size
   if (Sem_sp > MAXSEMSTACK)
      FATAL ("Semantic stack overflow"p)
DB for (i = 1; i <= size; i += 1)
DB    SS (i) = -9999

   return
   end



# ss_dealloc --- deallocate frame on semantic stack

   subroutine ss_dealloc (size)
   integer size

   include "c1_com.r.i"

DB integer i

   DBG (3,for (i = 1; i <= size; i += 1)
   DB        call print (ERROUT, "SS(*i)=*i  "s, i, SS (i))
   DB     call print (ERROUT, "*n"s)
   DB     )

   Sem_sp -= size
   if (Sem_sp < 1)
      FATAL ("Semantic stack underflow"p)

   return
   end



# cs_push --- allocate frame on control stack

   subroutine cs_push (type)
   integer type

   include "c1_com.r.i"

   Ctl_sp += CSSIZE
   if (Ctl_sp > MAXCTLSTACK - CSSIZE)
      FATAL ("Control stack overflow"p)

   CSTYPE (Ctl_sp) = type

   DBG (22, call print (ERROUT, "cs_push: (*2i) t=*i*n"s,
   DB    Ctl_sp, CSTYPE (Ctl_sp)))

   return
   end



# cs_pop --- deallocate frame on semantic stack

   subroutine cs_pop

   include "c1_com.r.i"

   DBG (22, call print (ERROUT, "cs_pop: (*2i) t=*i*n"s,
   DB    Ctl_sp, CSTYPE (Ctl_sp)))

   Ctl_sp -= CSSIZE
   if (Ctl_sp < 1)
      FATAL ("Control stack underflow"p)

   return
   end



# skip_to --- skip to a delimiting token for error recovery

   subroutine skip_to (token)
   integer token

   include "c1_com.r.i"

   while (Symbol ~= token && Symbol ~= ';'c && Symbol ~= EOF)
      call getsym

   return
   end



# es_push --- push an expression on the expression stack

   subroutine es_push (p)
   pointer p

   include "c1_com.r.i"

   if (Exp_sp > MAXEXPRSTACK)
      FATAL ("Expression stack overflow"p)

   Exp_sk (Exp_sp) = p
   Exp_sp += 1

   DBG (23, call print (ERROUT, "es_push:  (*3i) *5i*n"s, Exp_sp, p))
   DBG (24, call dump_expr (p))

   return
   end



# es_pop --- pop an expresson of the expression stack

   pointer function es_pop (p)
   pointer p

   include "c1_com.r.i"

   Exp_sp -= 1
   if (Exp_sp < 1) {
      SYNERR ("Expression stack underflow"p)
      p = LAMBDA
      Exp_sp = 1
      }
   else
      p = Exp_sk (Exp_sp)

   DBG (23, call print (ERROUT, "es_pop:   (*3i) *5i*n"s, Exp_sp, p))
   DBG (24, call dump_expr (p))

   return (p)
   end



# es_top --- return the top element of the expression stack

   integer function es_top (p)
   pointer p

   include "c1_com.r.i"

   p = Exp_sk (Exp_sp - 1)

   return (p)
   end



# new_obj --- allocate a new object number

   integer function new_obj (dummy)
   integer dummy

   include "c1_com.r.i"

   new_obj = Obj_no
   Obj_no += 1

   return
   end



# is_stored --- true if a variable is allocated storage space

   integer function  is_stored (p)
   pointer p

   include "c1_com.r.i"

   if (SYMSC (p) == TYPEDEF_SC || SYMSC (p) == EXTERN_SC
         || MODETYPE (SYMMODE (p)) == FUNCTION_MODE
         || SYMPARAM (p) ~= -1)
      return (NO)

   return (YES)
   end



# is_lvalue --- true if a structure is an lvalue

   integer function  is_lvalue (p)
   pointer p

   include "c1_com.r.i"

   if (SYMTYPE (p) == EXPSYMTYPE && EXPLVALUE (p) == YES
         || SYMTYPE (p) == IDSYMTYPE && MODETYPE (SYMMODE (p)) ~= ARRAY_MODE)
      return (YES)

   return (NO)
   end



# is_arith --- true if a structure has an arithmetic mode

   integer function is_arith (p)
   pointer p

   include "c1_com.r.i"

   select (MODETYPE (SYMMODE (p)))
      when (INT_MODE, SHORT_MODE, LONG_MODE, CHAR_MODE, ENUM_MODE,
            LONG_UNS_MODE, SHORT_UNS_MODE, DOUBLE_MODE, FLOAT_MODE,
            UNSIGNED_MODE, CHAR_UNS_MODE)
         return (YES)

   return (NO)
   end



# is_int --- true if a structure has an integer mode

   integer function is_int (p)
   pointer p

   include "c1_com.r.i"

   select (MODETYPE (SYMMODE (p)))
      when (INT_MODE, SHORT_MODE, LONG_MODE, ENUM_MODE, CHAR_UNS_MODE,
            UNSIGNED_MODE, LONG_UNS_MODE, SHORT_UNS_MODE, CHAR_MODE)
         return (YES)

   return (NO)
   end



# is_pointer --- true if a structure has a pointer mode

   integer function is_pointer (p)
   pointer p

   include "c1_com.r.i"

   if (MODETYPE (SYMMODE (p)) == POINTER_MODE)
      return (YES)

   return (NO)
   end



# is_constant --- true if the expression is a just a constant

   integer function is_constant (v)
   pointer v

   include "c1_com.r.i"

   if (SYMTYPE (v) == LITSYMTYPE)
      return (YES)

   return (NO)
   end



# is_aggregate --- true if a mode is a STRUCT or UNION

   integer function is_aggregate (mp)
   pointer mp

   include "c1_com.r.i"

   if (MODETYPE (mp) == STRUCT_MODE || MODETYPE (mp) == UNION_MODE)
      return (YES)

   return (NO)
   end



# put_long --- assign a long integer in a structure

   subroutine put_long (d, s)
   longint d, s

   d = s

   return
   end



# get_long --- retrieve a long integer from a structure

   longint function get_long (s)
   longint s

   return (s)
   end
