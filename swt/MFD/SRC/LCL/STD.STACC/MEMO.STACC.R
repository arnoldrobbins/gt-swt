


subroutine aprim (gpst)
integer gpst
include 'memo_com.r.i'
integer state
state = NOMATCH
if (Symbol == CONSTANT) {
   state = ACCEPT
   Sp += 1
   if (Sp > MAXSP) {
      call errmsg ("Stack overflow"s)
      gpst = FAILURE
      return
      }
   Stack (Sp) = Symval
   call getsym
   }
gpst = state
return
end



subroutine relation (gpst)
integer gpst
include 'memo_com.r.i'
integer state
logical truth
integer beauty
call aprim (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   call relop (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call errmsg ("missing relational opr"s)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call aprim (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call errmsg ("relop missing right operand"s)
         }
      when (ACCEPT) {
         select (Operator)
            when (EQ)
               truth = Stack (Sp - 1) == Stack (Sp)
            when (NE)
               truth = Stack (Sp - 1) ~= Stack (Sp)
            when (LT)
               truth = Stack (Sp - 1) < Stack (Sp)
            when (LE)
               truth = Stack (Sp - 1) <= Stack (Sp)
            when (GT)
               truth = Stack (Sp - 1) > Stack (Sp)
            when (GE)
               truth = Stack (Sp - 1) >= Stack (Sp)
         else
            call errmsg ("relation can't happen"s)
         
         Sp -= 1
         
         if (truth)
            beauty = 1
         else
            beauty = 0
         
         Stack (Sp) = beauty
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine relop (gpst)
integer gpst
include 'memo_com.r.i'
integer state
state = NOMATCH
if (Symbol == '='c) {
   state = ACCEPT
   Operator = EQ
   call getsym
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == '='c) {
      state = ACCEPT
      call getsym
      }
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
if (state == NOMATCH) {
   if (Symbol == '~'c) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      state = NOMATCH
      if (Symbol == '='c) {
         state = ACCEPT
         Operator = NE
         call getsym
         }
      else {
         call errmsg ("'~' must be monadic"s)
         }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      if (Symbol == '<'c) {
         state = ACCEPT
         Operator = LT
         call getsym
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == '>'c) {
            state = ACCEPT
            Operator = NE
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == '='c) {
               state = ACCEPT
               Operator = LE
               call getsym
               }
            }
         select (state)
            when (NOMATCH)
               state = ACCEPT
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (Symbol == '>'c) {
            state = ACCEPT
            Operator = GT
            call getsym
            }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == '='c) {
               state = ACCEPT
               Operator = GE
               call getsym
               }
            select (state)
               when (NOMATCH)
                  state = ACCEPT
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         }
      }
   }
gpst = state
return
end



subroutine bprim (gpst)
integer gpst
include 'memo_com.r.i'
integer state
state = NOMATCH
if (Symbol == '~'c) {
   state = ACCEPT
   call getsym
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == '('c) {
      state = ACCEPT
      call getsym
      }
   else {
      call errmsg ("missing parenthesized expr"s)
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call bexpr (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call errmsg ("missing expression in parens"s)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == ')'c) {
      state = ACCEPT
      if (Stack (Sp) ~= 0)
         Stack (Sp) = 0
      else
         Stack (Sp) = 1
      call getsym
      }
   else {
      call errmsg ("missing right paren"s)
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
if (state == NOMATCH) {
   if (Symbol == '('c) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      call bexpr (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            call errmsg ("missing expression in parens"s)
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      state = NOMATCH
      if (Symbol == ')'c) {
         state = ACCEPT
         call getsym
         }
      else {
         call errmsg ("missing right paren"s)
         }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      call relation (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      if (state == NOMATCH) {
         if (Symbol == ALWAYS) {
            state = ACCEPT
            Sp += 1
            if (Sp > MAXSP) {
               call errmsg ("Stack overflow"s)
               gpst = FAILURE
               return
               }
            Stack (Sp) = 1
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == NEVER) {
               state = ACCEPT
               Sp += 1
               if (Sp > MAXSP) {
                  call errmsg ("Stack overflow"s)
                  gpst = FAILURE
                  return
                  }
               Stack (Sp) = 0
               call getsym
               }
            }
         }
      }
   }
gpst = state
return
end



subroutine bsec (gpst)
integer gpst
include 'memo_com.r.i'
integer state
call bprim (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == '|'c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call bprim (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               call errmsg ("'|' missing right operand"s)
               }
            when (ACCEPT) {
               if (Stack (Sp - 1) ~= 0 || Stack (Sp) ~= 0)
                  Stack (Sp - 1) = 1
               else
                  Stack (Sp - 1) = 0
               Sp -= 1
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine bexpr (gpst)
integer gpst
include 'memo_com.r.i'
integer state
call bsec (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == '&'c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call bsec (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               call errmsg ("'&' missing right operand"s)
               }
            when (ACCEPT) {
               if (Stack (Sp - 1) ~= 0 && Stack (Sp) ~= 0)
                  Stack (Sp - 1) = 1
               else
                  Stack (Sp - 1) = 0
               Sp -= 1
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end
