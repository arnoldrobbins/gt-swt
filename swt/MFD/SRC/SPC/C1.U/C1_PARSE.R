# empty --- parse an empty production, since stacc can't handle it

   subroutine empty (state)
   integer state

   state = ACCEPT

   return
   end



# type_or_sc_spec --- accept a type or storage class specifier

   subroutine type_or_sc_spec (state)
   integer state

   include "c1_com.r.i"

   integer findsym

   select (Symbol)
      when (AUTOSYM,
            CHARSYM,
            DOUBLESYM,
            ENUMSYM,
            EXTERNSYM,
            FLOATSYM,
            INTSYM,
            LONGSYM,
            REGISTERSYM,
            SHORTSYM,
            STATICSYM,
            STRUCTSYM,
            TYPEDEFSYM,
            UNIONSYM,
            UNSIGNEDSYM)
         state = ACCEPT
   else if (Symbol == IDSYM
                  && findsym (Symtext, Symptr, IDCLASS) == YES
                  && SYMSC (Symptr) == TYPEDEF_SC)
      state = ACCEPT
   else
      state = NOMATCH

   return
   end



# not_statement_start --- does the current token not begin a statement

   subroutine not_statement_start (state)
   integer state

   include "c1_com.r.i"

   integer findsym

   select (Symbol)
      when (IFSYM,
            WHILESYM,
            DOSYM,
            FORSYM,
            SWITCHSYM,
            CASESYM,
            DEFAULTSYM,
            BREAKSYM,
            CONTINUESYM,
            RETURNSYM,
            GOTOSYM,
            '('c,
            '{'c,
            '*'c,
            '&'c,
            '-'c,
            '+'c,
            '!'c,
            DECSYM,
            INCSYM,
            '~'c,
            '}'c,
            EOF)
         state = NOMATCH
   else if (Symbol == IDSYM) {
      if (findsym (Symtext, Symptr, IDCLASS) == YES
               && SYMSC (Symptr) == TYPEDEF_SC)
         state = ACCEPT
      else
         state = NOMATCH
      }
   else
      state = ACCEPT

   return
   end



# not_statement_end --- does the current symbol end a compound statement

   subroutine not_statement_end (state)
   integer state

   include "c1_com.r.i"

   if (Symbol == '}'c || Symbol == EOF)
      state = NOMATCH
   else
      state = ACCEPT

   return
   end



# initializer --- parse and generate code for an initializer

   subroutine initializer (state)
   integer state

   include "c1_com.r.i"

   integer bc, rc, sflag
   integer is_stored
   pointer id

   id = SS (1)
   if (SYMSC (id) == STATIC_SC || SYMSC (id) == EXTERN_SC
         || SYMSC (id) == DEFAULT_SC && SYMLL (id) == 1)
      sflag = YES # Only constant and "&object" initializers allowed
   else
      sflag = NO

   bc = 0
   rc = 0

   if (is_stored (id) == NO) {
      ERROR_SYMBOL (Mem (SYMTEXT (id)))
      SYNERR ("Identifier cannot be initalized"p)
      }

   call out_initstart
   call initr (SYMMODE (id), bc, rc, sflag) # The mode pointer may be changed
   call out_initend

    ### The ending NULL for the INIT list must be supplied by the caller

   state = ACCEPT
   return
   end




# initr --- recursively generate code for an initializer

   subroutine initr (mode, bc, rc, sflag)
   pointer mode
   integer bc, rc, sflag

   include "c1_com.r.i"

   integer state, ldiff
   integer wsize
   pointer t
   longint sizeof_mode

   rc += 1
   if (MODETYPE (mode) == ARRAY_MODE) {

      if (Symbol == '{'c) {
         call getsym
         bc += 1
         call array_init (mode, bc, rc, sflag)
         if (Symbol ~= '}'c)
            SYNERR ("Right brace required"p)
         else
            call getsym
         bc -= 1
         }
      else
         call array_init (mode, bc, rc, sflag)
      }

   else if (MODETYPE (mode) == STRUCT_MODE) {


      if (Symbol == '{'c) {
         call getsym
         bc += 1
         call struct_init (mode, bc, rc, sflag)
         if (Symbol ~= '}'c)
            SYNERR ("Right brace required"p)
         else
            call getsym
         bc -= 1
         }
      else
         call struct_init (mode, bc, rc, sflag)
      }

   else if (MODETYPE (mode) == UNION_MODE) {
      t = MODESMLIST (mode)
      if (t == LAMBDA)
         SYNERR ("Can't initialize union with no members"p)
      else {
         call initr (SYMMODE (SMSYM (t)), bc, rc, sflag)
         ldiff = wsize (sizeof_mode (mode)) _
                     - wsize (sizeof_mode (SYMMODE (SMSYM (t))))
         while (ldiff > 0)
            {
            call gen_lit (SHORTLITSYM, "0"s, 0)
            call out_init (Short_mode_ptr)
            ldiff -= 1
            }
         }
      }

   else if (MODETYPE (mode) == FIELD_MODE)
      SYNERR ("Fields cannot be initialized"p)
   else if (MODETYPE (mode) == FUNCTION_MODE)
      SYNERR ("Functions cannot be initialized"p)

   else {

      if (Symbol == '{'c) {
         call getsym
         bc += 1
         call scalar_init (mode, bc, rc, sflag)
         if (Symbol ~= '}'c)
            SYNERR ("Right brace required"p)
         else
            call getsym
         bc -= 1
         }
      else
         call scalar_init (mode, bc, rc, sflag)
      }

   if (Symbol == ','c && bc > 0)
      call getsym

   rc -= 1
   return
   end



# scalar_init --- generate code to initialize a scalar

   subroutine scalar_init (mode, bc, rc, sflag)
   pointer mode
   integer bc, rc, sflag

   include "c1_com.r.i"

   integer state, p
   integer is_constant

   if (Symbol == '}'c)
      call gen_lit (SHORTLITSYM, "0"s, 0)
   else {
      call expr0 (state)
      if (state ~= ACCEPT
         || Symbol ~= ','c && Symbol ~= '}'c && Symbol ~= ';'c)
         SYNERR ("Illegal token in initializer"p)
      if (state ~= ACCEPT)       # error recovery
         call gen_lit (SHORTLITSYM, "0"s, 0)
      }

   call gen_make_arith
   call gen_convert (mode)
   if (sflag == YES) {  # Static initializer restrictions
      call es_top (p)
      # CONVERT_OP of an array or function resulting in an integer
      # acts like a REFTO_OP.
      while (SYMTYPE (p) == EXPSYMTYPE && EXPOP (p) == CONVERT_OP
            && (MODETYPE (SYMMODE (p)) ~= POINTER_MODE
               || (MODETYPE (SYMMODE (EXPLEFT (p))) ~= ARRAY_MODE
                  && MODETYPE (SYMMODE (EXPLEFT (p))) ~= FUNCTION_MODE)
               ))
         p = EXPLEFT (p)
      if (is_constant (p) == NO)
         if (SYMTYPE (p) == EXPSYMTYPE && EXPOP (p) == CONVERT_OP
               && MODETYPE (SYMMODE (p)) == POINTER_MODE
               && (MODETYPE (SYMMODE (EXPLEFT (p))) == ARRAY_MODE
                  || MODETYPE (SYMMODE (EXPLEFT (p))) == FUNCTION_MODE)
               && (SYMTYPE (EXPLEFT (p)) == IDSYMTYPE
                  || SYMTYPE (EXPLEFT (p)) == LITSYMTYPE)
               )
            ;  # It's a CONVERT_OP in a REFTO_OP's guise (see above)
         else if (SYMTYPE (p) ~= EXPSYMTYPE || EXPOP (p) ~= REFTO_OP
               || (SYMTYPE (EXPLEFT (p)) ~= IDSYMTYPE
                     && SYMTYPE (EXPLEFT (p)) ~= LITSYMTYPE))
            SYNERR ("SEG only allows '&object' and const exprs as static inits"p)
      }
   call out_init (mode)

   return
   end




# array_init --- generate code to initialize an array

   subroutine array_init (mode, bc, rc, sflag)
   pointer mode
   integer bc, rc, sflag

   include "c1_com.r.i"

   pointer p, q
   integer ic, llen, flen, i
   integer ctop, ctoc, wsize
   character cbuf (MAXTOK)
   longint ml
   longint sizeof_mode, get_long

#  Warning:  'array_init' must modify the 'mode' pointer it is
#            passed to fill in unspecified array dimensions (mode
#            table entries themselves cannot be modified).  However,
#            if it changes the pointer when 'initr' and 'initializer'
#            are not its immediate callers, the mode table will get
#            screwed up (because by definition, another mode entry
#            parent pointer, not a symbol's pointer, is being passed).
#            The value 'rc' (recursion count) will be 1 if and only
#            'mode' can be changed.

   ml = get_long (MODELEN (mode))

   if (ml == 0 && rc > 1)
      SYNERR ("Only the first array bound may be omitted"p)

   p = MODEPARENT (mode)
   if ((MODETYPE (p) == CHAR_MODE || MODETYPE (p) == INT_MODE
          || MODETYPE (p) == CHAR_UNS_MODE || MODETYPE (p) == SHORT_UNS_MODE
          || MODETYPE (p) == SHORT_MODE || MODETYPE (p) == UNSIGNED_MODE)
      && (Symbol == CHARLITSYM && Symlen > 1 || Symbol == STRLITSYM)) {

      call gen_lit (Symbol, Symtext, Symlen)
      call es_top (q)
      llen = wsize (sizeof_mode (SYMMODE (q)))

      if (ml == 0 && rc <= 1) {
         mode = MODEPARENT (mode)
         call create_mode (mode, ARRAY_MODE, llen)
         }
      else if (ml < llen)
         SYNERR ("String constant too large for array"p)

      call out_init (mode)

      flen = wsize (sizeof_mode (mode))
      while (flen > llen) {         # In case the literal is too short
         call gen_lit (SHORTLITSYM, "0"s, 0)
         call out_init (Short_mode_ptr)
         llen += wsize (sizeof_mode (Short_mode_ptr))
         }
      call getsym
      }

   else {
      for (ic = 0; ic < ml || ml == 0
                    && Symbol ~= '}'c && Symbol ~= ';'c; ic += 1)
         call initr (MODEPARENT (mode), bc, rc, sflag)
      if (ml == 0 && rc <= 1) {
         mode = MODEPARENT (mode)
         call create_mode (mode, ARRAY_MODE, ic)
         }
      }

   return
   end




# struct_init --- generate code to initialize a structure

   subroutine struct_init (mode, bc, rc, sflag)
   pointer mode
   integer bc, rc, sflag

   include "c1_com.r.i"

   pointer t

   for (t = MODESMLIST (mode); t ~= LAMBDA; t = SMSIBLING (t))
      call initr (SYMMODE (SMSYM (t)), bc, rc, sflag)  #  check this !!

   return
   end



# next_is_type --- the "next" symbol is a type name

   integer function next_is_type (d)
   integer d

   include "c1_com.r.i"

   integer findsym

   select (Nsymbol)
      when (CHARSYM,
            DOUBLESYM,
            ENUMSYM,
            FLOATSYM,
            INTSYM,
            LONGSYM,
            SHORTSYM,
            STRUCTSYM,
            UNIONSYM,
            UNSIGNEDSYM)
         return (YES)
   else if (Nsymbol == IDSYM
                  && findsym (Nsymtext, Nsymptr, IDCLASS) == YES
                  && SYMSC (Nsymptr) == TYPEDEF_SC)
      return (YES)

   return (NO)
   end
