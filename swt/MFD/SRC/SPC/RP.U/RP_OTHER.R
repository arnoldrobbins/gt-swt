# other_stmt --- parse an unknown statement

   subroutine other_stmt (state)
   parse_state state

   include "rp_com.i"

   character lhs (MAXLHS)
   integer lhslen, string_seen

   if (Symbol == ';'c || Symbol == '}'c || Symbol == EOF) {
      state = NOMATCH
      return
      }

   if (Symbol ~= NEWLINE)
      call begin_stmt

   call copy_left_hand_side (lhs, lhslen, string_seen)

   select (Symbol)
      when (PLUSABSYM, MINUSABSYM, TIMESABSYM, DIVABSYM) {
         call outch ('='c, CODE)
         call outstr (lhs, CODE)
         select (Symbol)
            when (PLUSABSYM)
               call outch ('+'c, CODE)
            when (MINUSABSYM)
               call outch ('-'c, CODE)
            when (TIMESABSYM)
               call outch ('*'c, CODE)
            when (DIVABSYM)
               call outch ('/'c, CODE)
         call outch ('('c, CODE)
         }
      when (ANDABSYM, ORABSYM, XORABSYM, MODABSYM) {
         call outch ('='c, CODE)
         select (Symbol)
            when (ANDABSYM)
               call outstr ("AND("s, CODE)
            when (ORABSYM)
               call outstr ("OR("s, CODE)
            when (XORABSYM)
               call outstr ("XOR("s, CODE)
            when (MODABSYM)
               call outstr ("MOD("s, CODE)
         call outstr (lhs, CODE)
         call outch (','c, CODE)
         }
      ifany {
         call getsym
         call other (state, CODE)
         call outch (')'c, CODE)
         if (state == NOMATCH)
            SYNERR ("Missing right-hand side of assignment"p)
         if (lhslen >= MAXLHS)
            SYNERR ("left-hand side of assignment too long"p)
         if (string_seen == YES)
            SYNERR ("String illegal on left-hand side of assignment"p)
         }

   call outdon (CODE)

   state = ACCEPT

   return
   end



# decl_other --- eat up the rest of a declaration

   subroutine decl_other (state)
   integer state

   include "rp_com.i"

   if (Symbol == ';'c || Symbol == '}'c || Symbol == EOF) {
      state = NOMATCH
      return
      }

   call other (state, DECL)
   call outdon (DECL)

   return
   end



# equiv_other --- eat up the rest of a equivaration

   subroutine equiv_other (state)
   integer state

   include "rp_com.i"

   if (Symbol == ';'c || Symbol == '}'c || Symbol == EOF) {
      state = NOMATCH
      return
      }

   call other (state, EQUIV)
   call outdon (EQUIV)

   return
   end



# data_other --- eat up the rest of a data statement

   subroutine data_other (state)
   integer state

   include "rp_com.i"

   if (Symbol == ';'c || Symbol == '}'c || Symbol == EOF) {
      state = NOMATCH
      return
      }

   call other (state, DATA)
   call outdon (DATA)

   return
   end



# code_other --- eat up the rest of a code statement

   subroutine code_other (state)
   integer state

   include "rp_com.i"

   if (Symbol == ';'c || Symbol == '}'c || Symbol == EOF) {
      state = NOMATCH
      return
      }

   call other (state, CODE)
   call outdon (CODE)

   return
   end



# other --- eat up the rest of a statement

   subroutine other (state, stream)
   parse_state state
   integer stream

   include "rp_com.i"

   integer nlpar

   nlpar = 0

   repeat {    # for all symbols left in this statement

      select (Symbol)
      when (NEWLINE, ';'c, '}'c)
         break
      when (EOF) {
         SYNERR ("unexpected EOF"p)
         break
         }
      when ('('c)
         nlpar += 1
      when (')'c) {
         nlpar -= 1
         if (nlpar < 0)
            break
         }

      call outtab (stream)
      if (Symbol == STRCONSTANTSYM)
         call outlit (Symtext, Symlen, stream)
      else
         call outstr (Symtext, stream)

      call getsym

      } until (nlpar < 0)

   if (nlpar > 0)
      SYNERR ("missing right parenthesis"p)

   state = ACCEPT

   return
   end



# copy_left_hand_side --- translate left-hand-side of assignment,
#                          return translated text

   subroutine copy_left_hand_side (lhs, lhslen, string_seen)
   character lhs (ARB)
   integer lhslen, string_seen

   include "rp_com.i"

   integer nlpar
   integer scopy

   nlpar = 0
   lhslen = 0
   string_seen = NO

   repeat {    # for all symbols up to an assignment operator

      select (Symbol)
         when (NEWLINE, ';'c, '}'c, PLUSABSYM, MINUSABSYM, TIMESABSYM,
               DIVABSYM, ANDABSYM, ORABSYM, XORABSYM, MODABSYM)
            break
         when (EOF) {
            SYNERR ("unexpected EOF"p)
            break
            }
         when ('('c)
            nlpar += 1
         when (')'c) {
            nlpar -= 1
            if (nlpar < 0)
               break
            }

      call outtab (CODE)

      if (Symbol == STRCONSTANTSYM) {
         call outlit (Symtext, Symlen, CODE)
         string_seen = YES
         }
      else
         call outstr (Symtext, CODE)

      if (Symlen < MAXLHS - lhslen)
         lhslen += scopy (Symtext, 1, lhs, lhslen + 1)
      else
         lhslen = MAXLHS

      call getsym

      } until (nlpar < 0)

   if (lhslen < MAXLHS)
      lhs (lhslen + 1) = EOS
   else
      lhs (1) = EOS

   if (nlpar > 0)
      SYNERR ("unbalanced parentheses"p)

   return
   end



# escape_stmt --- pass through stuff to Fortran without change

   subroutine escape_stmt (state)
   integer state

   include "rp_com.i"

   integer stream, i
   integer dgetsym
   character text (MAXLINE)

   select (dgetsym (text))
      when ('1'c)
         stream = DECL
      when ('2'c)
         stream = DATA
      when ('3'c)
         stream = CODE
   ifany
      call dgetsym (text)
   else
      stream = CODE

   if (stream == CODE)
      call begin_stmt
   else
      call begin_decl

   call outnum (0, stream)          # output any pending statement number

   if (text (1) == '%'c) {
      while (dgetsym (text) ~= NEWLINE)
         for (i = 1; text (i) ~= EOS; i += 1)
            call outch (text (i), stream)
      }
   else {
      call outtab (stream)          #######################################
      if (text (1) == '&'c) {       ### WARNING --- this code knows too ###
         Outbuf (6, stream) = '$'c  ###  much about the output buffering###
         call dgetsym (text)        #######################################
         }
      Outp (stream) = 6       # don't indent

      while (text (1) == ' 'c)
         call dgetsym (text)

      while (text (1) ~= NEWLINE) {
         call outstr (text, stream)
         call dgetsym (text)
         }
      }

   call outdon (stream)

   state = ACCEPT
   call getsym

   return
   end
