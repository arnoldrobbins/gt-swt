# enter_id_decl --- given a pointer to an identifer name, a
#                   a storage class, mode, and parameter list,
#                   enter an identifier in the symbol table

   subroutine enter_id_decl (id, mode, xsc, params, arg, body)
   pointer id     # text pointer in, pointer to SYM entry out
   pointer mode   # pointer to the mode of the identifier
   integer xsc    # storage class of the identifier
   pointer params # for functions: parameter list in declaration;
                  #    LAMBDA for function decls with body
   integer arg    # YES when declaration a formal parameter
   integer body   # YES when declaring a function with a body

   include "c1_com.r.i"

   integer sc, obj
   integer findsym, compare_mode, new_obj, new_sym, old_sym
   pointer q, np
   pointer makesym
   untyped info (IDSIZE)


   if (id == LAMBDA)          # in case of someone else's error
      return

   for (q = params; q ~= LAMBDA; q = PARAMNEXT (q))
      if (PARAMTEXT (q) ~= LAMBDA) {
         ERROR_SYMBOL (Mem (PARAMTEXT (q)))
         SYNERR ("Named parameters not allowed in this declaration"p)
         }

   sc = xsc
   np = id

   if (arg == YES) {
      if (sc ~= DEFAULT_SC && sc ~= REGISTER_SC) {
         ERROR_SYMBOL (Mem (id))
         SYNERR ("Illegal storage class for a parameter"p)
         sc = DEFAULT_SC
         }
      if (MODETYPE (mode) == FUNCTION_MODE) {
         ERROR_SYMBOL (Mem (id))
         SYNERR ("Functions cannot be passed as parameters"p)
         call create_mode (mode, POINTER_MODE, 0)
         }
      call modify_param_mode (mode)
      }

   if (MODETYPE (mode) == FUNCTION_MODE) {
      mode = MODEPARENT (mode)
      call modify_param_mode (mode)
      call create_mode (mode, FUNCTION_MODE, 0)
      }

   if (sc == TYPEDEF_SC) {
      if (findsym (Mem (np), q, IDCLASS) == YES && SYMLL (q) == Ll)
         SYNERR ("Identifier defined twice"p)
      id = new_sym (Mem (np), mode, sc, arg, Ll, 0, YES)
      }

   else if (Ll == 1)  {      # It's an external definition


      if (MODETYPE (mode) == FUNCTION_MODE && body == YES) {

         if (sc == REGISTER_SC || sc == AUTO_SC || sc == EXTERN_SC) {
            ERROR_SYMBOL (Mem (np))
            SYNERR ("Invalid storage class on a function definition"p)
            sc = DEFAULT_SC
            }

         if (findsym (Mem (np), q, IDCLASS) == NO)
            id = new_sym (Mem (np), mode, sc, arg, Ll, new_obj (0), YES)
         else if (SYMISDEF (q) == YES) {
            ERROR_SYMBOL (Mem (np))
            SYNERR ("Function defined twice in this file"p)
            id = old_sym (q, sc, mode, YES)
            }
         else {        # Function is previously declared
            if (compare_mode (mode, SYMMODE (q)) == NO)
               WARNING ("Declaration conflicts with previous declaration"p)
            if (sc == DEFAULT_SC)            # use the previous declaration
               sc = SYMSC (q)
            else if (SYMSC (q) == EXTERN_SC) # sc must be STATIC
               WARNING ("EXTERN function may not be redeclared STATIC"p)
            if (SYMOBJ (q) == 0)
               SYMOBJ (q) = new_obj (0)
            id = old_sym (q, sc, mode, YES)
            }
         }

      else if (MODETYPE (mode) == FUNCTION_MODE) {

         if (sc == REGISTER_SC || sc == AUTO_SC || sc == STATIC_SC) {
            ERROR_SYMBOL (Mem (np))
            SYNERR ("Invalid storage class on a function declaration"p)
            sc = DEFAULT_SC
            }

         if (findsym (Mem (np), q, IDCLASS) == NO) {
            id = new_sym (Mem (np), mode, sc, arg, Ll, 0, NO)
            SYMPLIST (id) = params
            params = LAMBDA
            }
         else if (SYMISDEF (q) == YES) {
            ERROR_SYMBOL (Mem (np))
            SYNERR ("Function defined twice in this file"p)
            id = old_sym (q, sc, mode, YES)
            }
         else { # Function is previously declared
            if (compare_mode (mode, SYMMODE (q)) == NO)
               WARNING ("Declaration conflicts with previous declaration"p)
            if (sc == DEFAULT_SC)
               sc = SYMSC (q)
            id = old_sym (q, sc, mode, SYMISDEF (q))
            if (SYMPLIST (id) == LAMBDA) {
               SYMPLIST (id) = params
               params = LAMBDA
               }
            }
         }

      else {   # It's not a function

         if (sc == REGISTER_SC || sc == AUTO_SC) {
            ERROR_SYMBOL (Mem (np))
            WARNING ("Invalid storage class on an external declaration"p)
            sc = DEFAULT_SC
            }

         if (findsym (Mem (np), q, IDCLASS) == NO)
            if (sc == EXTERN_SC)
               id = new_sym (Mem (np), mode, sc, arg, Ll, 0, NO)
            else if (sc == STATIC_SC)
               # kludge so we can remember if obj was static & not emit
               # ENT for it - only when static is redecl extern
               id = new_sym (Mem (np), mode, sc, arg, Ll, new_obj (0), STATIC_SC)
            else
               id = new_sym (Mem (np), mode, sc, arg, Ll, new_obj (0), YES)

         else { # Identifier previously declared at Ll 1
            if (compare_mode (mode, SYMMODE (q)) == NO) {
               ERROR_SYMBOL (Mem (np))
               WARNING ("Declaration conflicts with previous declaration"p)
               }
            if (sc == EXTERN_SC) {
               # ignore redefinition as EXTERN - won't define
               # more storage if 'is_stored' thinks sc = EXTERN
               # if the old object was static, then SYMISDEF =
               # STATIC_SC, otherwise it's YES - & we keep track
               # of redefinitions

               id = old_sym (q, sc, mode, SYMISDEF (q))
               }

            else {   # new symbol not EXTERN
               # if old symbol is EXTERN, new sc supercedes it;
               # otherwise, squawk & redefine old symbol

               if ((SYMSC (q) ~= EXTERN_SC) ||
                  # if sc = EXTERN && the symbol is already defined,
                  # then we can't allocate more space for it - for
                  # really bizarre things like
                  #
                  #          int gorf;
                  #          extern gorf;
                  #          static gorf;

                  (SYMSC (q) == EXTERN_SC && SYMISDEF (q) ~= NO)) {

                  ERROR_SYMBOL (Mem (np))
                  SYNERR ("Identifier defined twice"p)
                  }

               if (SYMOBJ (q) == 0)    # take care of undef EXTERN
                  SYMOBJ (q) = new_obj (0)
               if (sc == STATIC_SC)
                  id = old_sym (q, sc, mode, STATIC_SC)  # you never know
               else
                  id = old_sym (q, sc, mode, YES)
               # use most recent definition
               }
            }
         }
      }

   else { # Ll > 1      It's an internal definition


      if (MODETYPE (mode) == FUNCTION_MODE) {

         if (sc == REGISTER_SC || sc == AUTO_SC || sc == STATIC_SC) {
            ERROR_SYMBOL (Mem (np))
            SYNERR ("Invalid storage class on a function declaration"p)
            sc = DEFAULT_SC
            }

         if (findsym (Mem (np), q, IDCLASS) == NO) {
            id = new_sym (Mem (np), mode, sc, arg, 1, 0, NO)
            id = new_sym (Mem (np), mode, sc, arg, Ll, 0, NO)
            SYMPLIST (id) = params
            params = LAMBDA
            }
         else if (SYMLL (q) == Ll) {
            ERROR_SYMBOL (Mem (np))
            SYNERR ("Function defined twice"p)
            }
         else if (findsym (Mem (np), q, IDCLASS, 1) == YES) {
            if (compare_mode (mode, SYMMODE (q)) == NO)
               WARNING ("Declaration conflicts with previous declaration"p)
            if (sc == DEFAULT_SC)
               sc = SYMSC (q)
            else if (SYMSC (q) == STATIC_SC)
               WARNING ("STATIC function may not be redeclared EXTERN"p)
            id = old_sym (q, sc, mode, SYMISDEF (q))
            if (SYMPLIST (id) == LAMBDA) {
               SYMPLIST (id) = params
               params = LAMBDA
               }
            }
         else   # Function is declared at another LL, but not 1
            FATAL ("Function declared at level other than 1"p)
         }

      else { # It's not a function

         if (sc == DEFAULT_SC)      # put it on the stack
            sc = AUTO_SC

         if (findsym (Mem (np), q, IDCLASS) == NO) {
            if (sc == EXTERN_SC) {
               id = new_sym (Mem (np), mode, sc, arg, 1, 0, NO)
               id = new_sym (Mem (np), mode, sc, arg, Ll, 0, NO)
               }
            else
               id = new_sym (Mem (np), mode, sc, arg, Ll, new_obj (0), NO)
            }
         else if (SYMLL (q) == Ll) {
            ERROR_SYMBOL (Mem (np))
            SYNERR ("Identifier defined twice at current level"p)
            }
         else if (sc == EXTERN_SC && findsym (Mem (np), q, IDCLASS, 1) == YES) {
            # defined at lexical level 1 - don't need new def

            if (compare_mode (mode, SYMMODE (q)) == NO) {
               ERROR_SYMBOL (Mem (np))
               WARNING ("Declaration conflicts with previous declaration"p)
               }

            # I don't know why this works!
#           id = old_sym (q, sc, mode, SYMISDEF (q))
            }
         else { # Identifier is declared at another LL
            if (sc == EXTERN_SC) {

               # it's either a forward definition or a *real*
               # external (defined outside of this file)

               id = new_sym (Mem (np), mode, sc, arg, 1, 0, NO)
               id = new_sym (Mem (np), mode, sc, arg, Ll, 0, NO)
               }
            else
               id = new_sym (Mem (np), mode, sc, arg, Ll, new_obj (0), NO)
            }
         }

      }

   call dsfree (np)              # free the saved text space
   while (params ~= LAMBDA) {    # free the parameter list if it wasn't used
      if (PARAMTEXT (params) ~= LAMBDA)
         call dsfree (PARAMTEXT (params))
      q = PARAMNEXT (params)
      call dsfree (params)
      params = q
      }

   return
   end



# enter_sm_decl --- given a pointer to an identifer name, a mode,
#                   and parameter list, enter a stucture member
#                   into the symbol table

   subroutine enter_sm_decl (id, mode, params, loc)
   pointer id, mode, params
   longint loc

   include "c1_com.r.i"

   integer findsym, compare_mode
   pointer q
   pointer makesym
   longint get_long
   untyped info (IDSIZE)

   if (id == LAMBDA)          # in case of someone else's error
      return

   if (MODETYPE (mode) == FUNCTION_MODE) {
      SYNERR ("Functions cannot be part of a 'struct'"p)
      call create_mode (mode, POINTER_MODE, 0)
      }

   if (params ~= LAMBDA) {
      SYNERR ("Parameters not allowed in struct member"p)
      while (params ~= LAMBDA) {
         q = PARAMNEXT (params)
         call dsfree (params)
         params = q
         }
      }

   if (findsym (Mem (id), q, SMCLASS) == YES && SYMLL (q) == Ll) {
      select (SYMTYPE (q))
         when (STSYMTYPE) {
            ERROR_SYMBOL (Mem (id))
            SYNERR ("Identifier already defined as struct tag"p)
            }
         when (SMSYMTYPE)
            if (get_long (loc) ~= get_long (SYMOFFS (q))
                  || compare_mode (mode, SYMMODE (q)) == NO) {
               ERROR_SYMBOL (Mem (id))
               SYNERR ("Struct member conflicts with previous definition"p)
               }

      call dsfree (id)
      id = q
      return
      }

   q = id
   id = makesym (Mem (id), SMSYMTYPE, Ll)
   call dsfree (q)      # free the saved text space

   SYMMODE (id) = mode
   SYMPARAM (id) = -1
   SYMSC (id) = DEFAULT_SC
   SYMOBJ (id) = 0
   call put_long (SYMOFFS (id), loc)

   return
   end



# declare_label --- declare the current symbol as a label

   subroutine declare_label (flag)
   integer flag

   include "c1_com.r.i"

   integer findsym, makesym, new_obj

   if (findsym (Symtext, Symptr, IDCLASS) == NO
               || SYMLL (Symptr) <= 1) {
      Symptr = makesym (Symtext, IDSYMTYPE, 2)
      SYMSC (Symptr) = STATIC_SC
      SYMMODE (Symptr) = Label_mode_ptr
      SYMPARAM (Symptr) = flag
      SYMOBJ (Symptr) = new_obj (0)
      return
      }

   if (SYMMODE (Symptr) ~= Label_mode_ptr) {
      SYNERR ("Label already declared but not as label"p)
      return
      }

   if (SYMPARAM (Symptr) == YES && flag == YES)
      SYNERR ("Label already declared"p)

   if (flag == YES)
      SYMPARAM (Symptr) = YES

   return
   end



# check_declaration --- check if current symbol has been declared;
#                       if not, create a dummy symbol

   subroutine check_declaration (class)
   integer class

   include "c1_com.r.i"

   integer findsym, new_obj
   pointer q

   if (findsym (Symtext, Symptr, class) == NO) {
      SYNERR ("Identifier not declared"p)
      call gen_int (0)
      }
   else if (SYMTYPE (Symptr) == COSYMTYPE)
      call gen_int (SYMOBJ (Symptr))
   else if (SYMTYPE (Symptr) ~= IDSYMTYPE && SYMTYPE (Symptr) ~= SMSYMTYPE) {
      SYNERR ("Identifier is not a variable"p)
      call gen_int (0)
      }
   else {
      if (SYMTYPE (Symptr) == IDSYMTYPE
            && SYMOBJ (Symptr) == 0) {      # Add an object number on reference
         SYMOBJ (Symptr) = new_obj (0)
         if (SYMLL (Symptr) > 1 && findsym (Symtext, q, class, 1) == YES
               && SYMOBJ (q) == 0)
            SYMOBJ (q) = SYMOBJ (Symptr)
         DBG (42, call print (ERROUT, "check_declaration: '*s' first ref*n"s,
         DB          Symtext))
         }
      call gen_opnd (Symptr)
      }

   return
   end



# clean_up_ll --- check for undefined symbols and labels

   subroutine clean_up_ll

   include "c1_com.r.i"

   pointer p, q
   pointer accesssym
   character str (MAXTOK)

   p = LAMBDA
   for (q = accesssym (Ll, str, p, IDCLASS); q ~= LAMBDA;
               q = accesssym (Ll, str, p, IDCLASS)) {
      DBG (42, if (SYMOBJ (q) == 0) {
      DB          call print (ERROUT, "Unref: '*s' "s, str)
      DB          call dump_sym_entry (q); call print (ERROUT, "*n"s)})
      if (SYMMODE (q) == Label_mode_ptr && SYMPARAM (q) == NO) {
         ERROR_SYMBOL (str)
         SYNERR ("Undefined label"p)
         }
      if (SYMPARAM (q) == 0) {
         ERROR_SYMBOL (str)
         SYNERR ("Declared as parameter but not in parameter list"p)
         }
      if (SYMTYPE (q) == ENSYMTYPE && MODESMLIST (SYMMODE (q)) == LAMBDA) {
         ERROR_SYMBOL (str)
         SYNERR ("'Enum' referenced but not defined"p)
         }
      }

   p = LAMBDA
   for (q = accesssym (Ll, str, p, SMCLASS); q ~= LAMBDA;
               q = accesssym (Ll, str, p, SMCLASS)) {
      if (SYMTYPE (q) == STSYMTYPE && MODESMLIST (SYMMODE (q)) == LAMBDA) {
         ERROR_SYMBOL (str)
         SYNERR ("'Struct' referenced but not defined"p)
         }
      }

   return
   end



# check_function_declaration --- handle default function declarations)

   subroutine check_function_declaration

   include "c1_com.r.i"

   integer findsym, new_obj
   pointer q
   pointer mode
   pointer sdupl

   mode = Int_mode_ptr
   call create_mode (mode, FUNCTION_MODE, 0)

   if (findsym (Symtext, Symptr, IDCLASS) == NO) {
      Symptr = sdupl (Symtext)
      call enter_id_decl (Symptr, mode, EXTERN_SC, LAMBDA, NO, NO)
      }
   else if (MODETYPE (SYMMODE (Symptr)) == FUNCTION_MODE)
      ;
   else if (SYMLL (Symptr) == Ll)
      SYNERR ("Usage conflicts with previous declaration"p)
   else {
      Symptr = sdupl (Symtext)
      call enter_id_decl (Symptr, mode, EXTERN_SC, LAMBDA, NO, NO)
      }

   if (SYMOBJ (Symptr) == 0) {      # Add an object number on reference
      SYMOBJ (Symptr) = new_obj (0)
      if (SYMLL (Symptr) > 1 && findsym (Symtext, q, IDCLASS, 1) == YES
            && SYMOBJ (q) == 0)
         SYMOBJ (q) = SYMOBJ (Symptr)
      DBG (42, call print (ERROUT, "check_function_declaration: '*s' first ref*n"s,
      DB          Symtext))
      }

   call gen_opnd (Symptr)

   return
   end



# allocate_storage --- perform storage allocation

   subroutine allocate_storage (id)
   pointer id

   include "c1_com.r.i"

   integer is_stored
   longint sz
   longint sizeof_mode

   if (is_stored (id) == NO)
      return

   sz = sizeof_mode (SYMMODE (id))
   if (sz == 0)
      SYNERR ("Data object may not have zero size"p)
   else if (sz >= (intl (MAXUNSIGNED) + 1) * 8)
      SYNERR ("Data object may not be larger than 65535 words"p)

   DBG (29, call print (ERROUT, "in allocate_storage: id=*i sz=*l l=*i*n"s,
   DB       id, sz, SYMOBJ (id)))

   return
   end



# alloc_struct --- increment the size of a structure or union by the
#                 specified size

   subroutine alloc_struct (mp, len)
   pointer mp
   longint len

   include "c1_com.r.i"

   longint get_long

   if (MODETYPE (mp) == STRUCT_MODE)
      call put_long (MODELEN (mp), get_long (MODELEN (mp)) + len)
   else if (get_long (MODELEN (mp)) < len)
      call put_long (MODELEN (mp), len)

   return
   end



# wsize --- compute the size in words given the size in bits

   integer function wsize (b)
   longint b

   include "c1_com.r.i"

   wsize = (b + 15) / 16

   DBG (38, call print (ERROUT, "in wsize: b=*l, w=*i*n"s, b, wsize))

   return
   end



# alloc_temp --- allocate a temporary variable

   pointer function alloc_temp (mp)
   pointer mp

   include "c1_com.r.i"

   integer obj
   integer new_obj
   character str (20)
   pointer p
   pointer new_sym

   obj = new_obj (0)
   call encode (str, 20, "#temp*i"s, obj)
   p = new_sym (str, mp, AUTO_SC, NO, Ll, obj, NO)

   call out_var (p)
   call out_oper (NULL_OP)
   call out_size (SYMMODE (p))

   return (p)
   end



