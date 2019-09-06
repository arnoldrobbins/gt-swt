


subroutine instruction (gpst)
integer gpst
include 'translang_com.r.i'
integer state
call label_part (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == STMT_END) {
      state = ACCEPT
      call getsym
      }
   if (state == NOMATCH) {
      call literal_assignment (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            Micro_lc += 1
            }
      if (state == NOMATCH) {
         call nanoinstruction (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               Micro_lc += 1
               Nano_lc += 1
               }
         }
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine label_part (gpst)
integer gpst
include 'translang_com.r.i'
integer state
call label_oracle (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == LABEL_SYM) {
      state = ACCEPT
      call getsym
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == LABEL_TERM_SYM) {
      state = ACCEPT
      call getsym
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine literal_assignment (gpst)
integer gpst
include 'translang_com.r.i'
integer state
MWORD = 0
call literal_lhs (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == AMPCR_SYM) {
      state = ACCEPT
      call setf (1, 4, MWORD, 2r1100)
      call setf (5, 12, MWORD, Litval)
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == SAR_SYM) {
         state = ACCEPT
         call setf (3, 6, MWORD, Shiftval)
         call setf (1, 2, MWORD, 2r00) # SAR only
         call getsym
         }
      if (state == ACCEPT) {
         call literal_lhs (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call setf (1, 2, MWORD, 2r10) # LIT and SAR
               }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == LIT_SYM) {
               state = ACCEPT
               call setf (9, 8, MWORD, Litval)
               call getsym
               }
            if (state == NOMATCH) {
               if (Symbol == SLIT_SYM) {
                  state = ACCEPT
                  call setf (9, 8, MWORD, Shiftval)
                  call getsym
                  }
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
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
         if (Symbol == LIT_SYM) {
            state = ACCEPT
            call setf (9, 8, MWORD, Litval)
            call setf (1, 4, MWORD, 2r1110)
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == SLIT_SYM) {
               state = ACCEPT
               call setf (9, 8, MWORD, Shiftval)
               call setf (1, 4, MWORD, 2r1110)
               call getsym
               }
            }
         if (state == ACCEPT) {
            call literal_lhs (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  call setf (1, 2, MWORD, 2r10)
                  }
            if (state == ACCEPT) {
               state = NOMATCH
               if (Symbol == SAR_SYM) {
                  state = ACCEPT
                  call setf (3, 6, MWORD, Shiftval)
                  call getsym
                  }
               if (state ~= ACCEPT) {
                  gpst = FAILURE
                  return
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
         }
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine literal_lhs (gpst)
integer gpst
include 'translang_com.r.i'
integer state
call literal_lhs_oracle (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   call literal (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == ASSIGN_SYM) {
      state = ACCEPT
      call getsym
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine literal (gpst)
integer gpst
include 'translang_com.r.i'
integer state
integer insert_x, lookup
state = NOMATCH
if (Symbol == INT_DENOTATION) {
   state = ACCEPT
   Litval = Sym_val
   Shiftval = insert_x (Sym_val)
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == COMP_SYM) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      state = NOMATCH
      if (Symbol == INT_DENOTATION) {
         state = ACCEPT
         Litval = not (Sym_val)
         Shiftval = insert_x (-Sym_val)
         call getsym
         }
      else {
         SAY ("missing constant after COMP"p)
         }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      if (Symbol == LABEL_SYM) {
         state = ACCEPT
         if (lookup (Sym_text, Litval, Ltab) == NO)
            SAY ("undefined label"p)
         Shiftval = insert_x (Litval)
         call getsym
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == MINUS_SYM) {
            state = ACCEPT
            call getsym
            }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == INT_DENOTATION) {
               state = ACCEPT
               Litval -= Sym_val
               Shift_val = insert_x (Litval)
               call getsym
               }
            else {
               SAY ("missing constant after '-'"p)
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
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
      }
   }
gpst = state
return
end



subroutine nanoinstruction (gpst)
integer gpst
include 'translang_com.r.i'
integer state
Nano_mem (1, Nano_lc + 1) = 0
Nano_mem (2, Nano_lc + 1) = 0
Nano_mem (3, Nano_lc + 1) = 0
Nano_mem (4, Nano_lc + 1) = 0
call setf (1, 4, MWORD, 2r1111)
call setf (5, 12, MWORD, Nano_lc)
call unconditional_part (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   call conditional_part (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
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



subroutine unconditional_part (gpst)
integer gpst
include 'translang_com.r.i'
integer state
Successor_context = UNCONDITIONAL
Mdop_used = FALSE
Caj_used = FALSE
Lunit_used = FALSE
call setf (11, 3, NWORD, 2r001)
call setf (14, 3, NWORD, 2r001)
call component (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      call component (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
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



subroutine component (gpst)
integer gpst
include 'translang_com.r.i'
integer state
call external_op (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == NOMATCH) {
   call successor (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call setf (11, 3, NWORD, Litval)
         if (Successor_context == UNCONDITIONAL)
            call setf (14, 3, NWORD, Litval)
         }
   if (state == NOMATCH) {
      call logic_op (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            if (Successor_context ~= UNCONDITIONAL) {
               if (Lunit_used)
                  SAY ("adder may not be used twice"p)
               call setf (6, 1, NWORD, 2r1)
               }
            else
               Lunit_used = TRUE
            }
      }
   }
gpst = state
return
end



subroutine external_op (gpst)
integer gpst
include 'translang_com.r.i'
integer state
call memory_device_op (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (ACCEPT) {
      call setf (51, 4, NWORD, Litval)
      if (Mdop_used)
         SAY ("mem dev op may not be used twice"p)
      if (Successor_context ~= UNCONDITIONAL)
         call setf (7, 1, NWORD, 2r1)
      Mdop_used = TRUE
      }
if (state == ACCEPT) {
   call set_op (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call setf (8, 3, NWORD, Litval)
         if (Caj_used)
            SAY ("cond. adj. may not be used twice"p)
         if (Successor_context ~= UNCONDITIONAL)
            call setf (7, 1, NWORD, 2r1)
         Caj_used = TRUE
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
   call set_op (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call setf (8, 3, NWORD, Litval)
         if (Caj_used)
            SAY ("cond. adj. may not be used twice"p)
         if (Successor_context ~= UNCONDITIONAL)
            call setf (7, 1, NWORD, 2r1)
         Caj_used = TRUE
         }
   if (state == ACCEPT) {
      call memory_device_op (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call setf (51, 4, NWORD, Litval)
            if (Mdop_used)
               SAY ("mem dev op may not be used twice"p)
            if (Successor_context ~= UNCONDITIONAL)
               call setf (7, 1, NWORD, 2r1)
            Mdop_used = TRUE
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
gpst = state
return
end



subroutine memory_device_op (gpst)
integer gpst
include 'translang_com.r.i'
integer state
Litval = 2r0000   # the default
state = NOMATCH
if (Symbol == MR1_SYM) {
   state = ACCEPT
   Litval = 2r0010
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == MR2_SYM) {
      state = ACCEPT
      Litval = 2r0011
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == MW1_SYM) {
         state = ACCEPT
         Litval = 2r0110
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == MW2_SYM) {
            state = ACCEPT
            Litval = 2r0111
            call getsym
            }
         }
      }
   }
gpst = state
return
end



subroutine set_op (gpst)
integer gpst
include 'translang_com.r.i'
integer state
integer setval (3)
data setval /2r111, 2r001, 2r101/
Litval = 0  # the default
state = NOMATCH
if (Symbol == SET_SYM) {
   state = ACCEPT
   call getsym
   }
if (state == ACCEPT) {
   call condition_adjust_bit (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SAY ("missing condition bit after SET"p)
         }
      when (ACCEPT) {
         Litval = setval (Litval)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine condition_adjust_bit (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == LC1_SYM) {
   state = ACCEPT
   Litval = 1
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == LC2_SYM) {
      state = ACCEPT
      Litval = 2
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == LC3_SYM) {
         state = ACCEPT
         Litval = 3
         call getsym
         }
      }
   }
gpst = state
return
end



subroutine logic_op (gpst)
integer gpst
include 'translang_com.r.i'
integer state
call adder_op (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   call shift_op (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call setf (32, 2, NWORD, Litval)
         }
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call destination_list (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
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
   call shift_op (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call setf (32, 2, NWORD, Litval)
         }
   if (state == ACCEPT) {
      call destination_list (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
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
      call destination_list (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      }
   }
gpst = state
return
end



subroutine adder_op (gpst)
integer gpst
include 'translang_com.r.i'
integer state
call binary_op_oracle (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   call binary_op (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
if (state == NOMATCH) {
   call unary_op (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state == NOMATCH) {
      if (Symbol == INT_DENOTATION) {
         state = ACCEPT
         call setf (17, 3, NWORD, 0) # X = 0
         call setf (28, 4, NWORD, 0) # X+Y
         if (Sym_val == 0)
            call setf (20, 7, NWORD, 0) # Y = 0
         else if (Sym_val == 1)
            call setf (20, 7, NWORD, 2r0000011) # Y=1
         else
            SAY ("constant must be 0 or 1"p)
         call getsym
         }
      }
   }
gpst = state
return
end



subroutine unary_op (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == NOT_SYM) {
   state = ACCEPT
   call getsym
   }
if (state == ACCEPT) {
   call y_select (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call setf (17, 3, NWORD, 0)
         call setf (20, 7, NWORD, Litval)
         if (Comp_y)
            call setf (28, 4, NWORD, 2r0000)
         else
            call setf (28, 4, NWORD, 2r1100)
         }
   if (state == NOMATCH) {
      call x_select (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call setf (17, 3, NWORD, Litval)
            call setf (20, 7, NWORD, 0)
            call setf (28, 4, NWORD, 2r0001)
            }
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
if (state == NOMATCH) {
   call y_select (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call setf (17, 3, NWORD, 0)
         call setf (20, 7, NWORD, Litval)
         if (Comp_y)
            call setf (28, 4, NWORD, 2r1100)
         else
            call setf (28, 4, NWORD, 2r0000)
         }
   if (state == NOMATCH) {
      call x_select (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call setf (17, 3, NWORD, Litval)
            call setf (20, 8, NWORD, 0)
            call setf (28, 4, NWORD, 2r0000)
            }
      }
   }
gpst = state
return
end



subroutine x_select (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == INT_DENOTATION) {
   state = ACCEPT
   if (Sym_val ~= 0)
      SAY ("X input must be 0"p)
   Litval = 2r000
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == A1_SYM) {
      state = ACCEPT
      Litval = 2r101
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == A2_SYM) {
         state = ACCEPT
         Litval = 2r110
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == A3_SYM) {
            state = ACCEPT
            Litval = 2r111
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == CTR_SYM) {
               state = ACCEPT
               Litval = 2r011
               call getsym
               }
            if (state == NOMATCH) {
               if (Symbol == LIT_SYM) {
                  state = ACCEPT
                  Litval = 2r001
                  call getsym
                  }
               }
            }
         }
      }
   }
gpst = state
return
end



subroutine y_select (gpst)
integer gpst
include 'translang_com.r.i'
integer state
Comp_y = FALSE
state = NOMATCH
if (Symbol == INT_DENOTATION) {
   state = ACCEPT
   if (Sym_val == 0)
      Litval = 2r0000000
   else if (Sym_val == 1)
      Litval = 2r0000011
   else
      SAY ("Y-select must be 0 or 1"p)
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == B_SYM) {
      state = ACCEPT
      Litval = 2r0110001
      call getsym
      }
   if (state == NOMATCH) {
      call bmcl (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      if (state == NOMATCH) {
         if (Symbol == CTR_SYM) {
            state = ACCEPT
            Litval = 2r0101100
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == LIT_SYM) {
               state = ACCEPT
               Litval = 2r0000101
               call getsym
               }
            if (state == NOMATCH) {
               if (Symbol == AMPCR_SYM) {
                  state = ACCEPT
                  Litval = 2r0011001
                  call getsym
                  }
               }
            }
         }
      }
   }
gpst = state
return
end



subroutine binary_op (gpst)
integer gpst
include 'translang_com.r.i'
integer state
bool negated
integer op
integer op_repl (16)
data op_repl /2r1100, 2r0010, 2r0001,
   2r1111, 2r1000, 2r1010, 2r1001,
   2r1011, 2r0100, 2r0110, 2r0101,
   2r0111, 2r0000, 2r1110, 2r1101, 2r0011/
call x_select (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (ACCEPT) {
      call setf (17, 3, NWORD, Litval)
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == PLUS_SYM) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      state = NOMATCH
      if (Symbol == NOT_SYM) {
         state = ACCEPT
         negated = TRUE
         call getsym
         }
      else {
         negated = FALSE
         }
      select (state)
         when (NOMATCH)
            state = ACCEPT
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call y_select (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call setf (20, 7, NWORD, Litval)
            if (Comp_y)
               negated = ~negated
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      state = NOMATCH
      if (Symbol == PLUS_SYM) {
         state = ACCEPT
         if (negated)
            call setf (28, 4, NWORD, 2r1111)
         else
            call setf (28, 4, NWORD, 2r0011)
         call getsym
         }
      else {
         if (negated)
            call setf (28, 4, NWORD, 2r1100)
         else
            call setf (28, 4, NWORD, 2r0000)
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == INT_DENOTATION) {
            state = ACCEPT
            if (Sym_val ~= 1)
               SAY ("adder op must be 'x+y+1'"p)
            call getsym
            }
         else {
            SAY ("adder op must be 'x+y+1'"p)
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
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
      if (Symbol == MINUS_SYM) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == NOT_SYM) {
            state = ACCEPT
            negated = TRUE
            call getsym
            }
         else {
            negated = FALSE
            }
         select (state)
            when (NOMATCH)
               state = ACCEPT
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call y_select (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call setf (20, 7, NWORD, Litval)
               if (Comp_y)
                  negated = ~negated
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == MINUS_SYM) {
            state = ACCEPT
            if (negated)
               call setf (28, 4, NWORD, 2r0000)
            else
               call setf (28, 4, NWORD, 2r1100)
            call getsym
            }
         else {
            if (negated)
               call setf (28, 4, NWORD, 2r0011)
            else
               call setf (28, 4, NWORD, 2r1111)
            }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == INT_DENOTATION) {
               state = ACCEPT
               if (Sym_val ~= 1)
                  SAY ("adder op must be 'x-y-1'"p)
               call getsym
               }
            else {
               SAY ("adder op must be 'x-y-1'"p)
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
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
         call operator (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               op = Litval
               }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == NOT_SYM) {
               state = ACCEPT
               negated = TRUE
               call getsym
               }
            else {
               negated = FALSE
               }
            select (state)
               when (NOMATCH)
                  state = ACCEPT
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            call y_select (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  call setf (20, 7, NWORD, Litval)
                  if (Comp_y)
                     negated = ~negated
                  if (negated)
                     op = op_repl (op + 1)
                  call setf (28, 4, NWORD, op)
                  }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         }
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine operator (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == AND_SYM) {
   state = ACCEPT
   Litval = 2r1011
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == OR_SYM) {
      state = ACCEPT
      Litval = 2r1110
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == NAN_SYM) {
         state = ACCEPT
         Litval = 2r0100
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == NOR_SYM) {
            state = ACCEPT
            Litval = 2r0001
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == IMP_SYM) {
               state = ACCEPT
               Litval = 2r1000
               call getsym
               }
            if (state == NOMATCH) {
               if (Symbol == NIM_SYM) {
                  state = ACCEPT
                  Litval = 2r0111
                  call getsym
                  }
               if (state == NOMATCH) {
                  if (Symbol == RIM_SYM) {
                     state = ACCEPT
                     Litval = 2r1101
                     call getsym
                     }
                  if (state == NOMATCH) {
                     if (Symbol == NRI_SYM) {
                        state = ACCEPT
                        Litval = 2r0010
                        call getsym
                        }
                     if (state == NOMATCH) {
                        if (Symbol == XOR_SYM) {
                           state = ACCEPT
                           Litval = 2r0110
                           call getsym
                           }
                        if (state == NOMATCH) {
                           if (Symbol == EQV_SYM) {
                              state = ACCEPT
                              Litval = 2r1001
                              call getsym
                              }
                           if (state == NOMATCH) {
                              if (Symbol == OAD_SYM) {
                                state = ACCEPT
                                Litval = 2r0101
                                call getsym
                                }
                              if (state == NOMATCH) {
                                if (Symbol == AAD_SYM) {
                                state = ACCEPT
                                Litval = 2r1010
                                call getsym
                                }
                                }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
gpst = state
return
end



subroutine shift_op (gpst)
integer gpst
include 'translang_com.r.i'
integer state
Litval = 2r00  # the default
state = NOMATCH
if (Symbol == R_SYM) {
   state = ACCEPT
   Litval = 2r01
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == L_SYM) {
      state = ACCEPT
      Litval = 2r10
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == C_SYM) {
         state = ACCEPT
         Litval = 2r11
         call getsym
         }
      }
   }
gpst = state
return
end



subroutine destination_list (gpst)
integer gpst
include 'translang_com.r.i'
integer state
Mar_used = FALSE
Ctr_used = FALSE
Br_used = FALSE
state = NOMATCH
if (Symbol == ASSIGN_SYM) {
   state = ACCEPT
   call getsym
   }
if (state == ACCEPT) {
   repeat {
      call destination (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
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
if (state == NOMATCH) {
   call destination (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state == ACCEPT) {
      repeat {
         call destination (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
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
   }
gpst = state
return
end



subroutine destination (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == A1_SYM) {
   state = ACCEPT
   call setf (34, 1, NWORD, 2r1)
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == A2_SYM) {
      state = ACCEPT
      call setf (35, 1, NWORD, 2r1)
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == A3_SYM) {
         state = ACCEPT
         call setf (36, 1, NWORD, 2r1)
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == MIR_SYM) {
            state = ACCEPT
            call setf (41, 1, NWORD, 2r1)
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == BR1_SYM) {
               state = ACCEPT
               if (Mar_used)
                  SAY ("BR may not be used with MAR"p)
               call setf (43, 1, NWORD, 2r1)
               call setf (45, 1, NWORD, 2r0)
               Br_used = TRUE
               call getsym
               }
            if (state == NOMATCH) {
               if (Symbol == BR2_SYM) {
                  state = ACCEPT
                  if (Mar_used)
                     SAY ("BR may not be used with MAR"p)
                  call setf (44, 1, NWORD, 2r1)
                  call setf (45, 1, NWORD, 2r0)
                  Br_used = TRUE
                  call getsym
                  }
               if (state == NOMATCH) {
                  if (Symbol == AMPCR_SYM) {
                     state = ACCEPT
                     call setf (42, 1, NWORD, 2r1)
                     call getsym
                     }
                  if (state == NOMATCH) {
                     call input_b (state)
                     select (state)
                        when (FAILURE) {
                           gpst = FAILURE
                           return
                           }
                        when (ACCEPT) {
                           call setf (37, 4, NWORD, Litval)
                           }
                     if (state == NOMATCH) {
                        call input_ctr (state)
                        select (state)
                           when (FAILURE) {
                              gpst = FAILURE
                              return
                              }
                        if (state == NOMATCH) {
                           call input_mar (state)
                           select (state)
                              when (FAILURE) {
                                gpst = FAILURE
                                return
                                }
                           if (state == NOMATCH) {
                              call input_sar (state)
                              select (state)
                                when (FAILURE) {
                                gpst = FAILURE
                                return
                                }
                                when (ACCEPT) {
                                call setf (49, 2, NWORD, Litval)
                                }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
gpst = state
return
end



subroutine input_b (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == B_SYM) {
   state = ACCEPT
   Litval = 2r1011
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == BEX_SYM) {
      state = ACCEPT
      Litval = 2r1100
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == BAD_SYM) {
         state = ACCEPT
         Litval = 2r1000
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == BMI_SYM) {
            state = ACCEPT
            Litval = 2r1101
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == BBE_SYM) {
               state = ACCEPT
               Litval = 2r1110
               call getsym
               }
            if (state == NOMATCH) {
               if (Symbol == BBA_SYM) {
                  state = ACCEPT
                  Litval = 2r1010
                  call getsym
                  }
               if (state == NOMATCH) {
                  if (Symbol == BBI_SYM) {
                     state = ACCEPT
                     Litval = 2r1111
                     call getsym
                     }
                  }
               }
            }
         }
      }
   }
gpst = state
return
end



subroutine input_ctr (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == CTR_SYM) {
   state = ACCEPT
   if (Mar_used)
      SAY ("CTR may not be used with a MAR"p)
   call setf (46, 3, NWORD, 2r101)
   Ctr_used = TRUE
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == LCTR_SYM) {
      state = ACCEPT
      if (Mar_used)
         SAY ("LCTR may not be used with a MAR"p)
      call setf (46, 3, NWORD, 2r001)
      Ctr_used = TRUE
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == INC_SYM) {
         state = ACCEPT
         if (Ctr_used)
            SAY ("INC may not be used with CTR or LCTR"p)
         call setf (47, 2, NWORD, 2r10)
         call getsym
         }
      }
   }
gpst = state
return
end



subroutine input_mar (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == MAR_SYM) {
   state = ACCEPT
   if (Ctr_used)
      SAY ("MAR may not be used with CTR"p)
   if (Br_used)
      SAY ("MAR may not be used with BR"p)
   Mar_used = TRUE
   call setf (45, 2, NWORD, 2r11)
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == MAR1_SYM) {
      state = ACCEPT
      if (Ctr_used)
         SAY ("MAR may not be used with CTR"p)
      if (Br_used)
         SAY ("MAR may not be used with BR"p)
      Mar_used = TRUE
      call setf (43, 1, NWORD, 2r1)
      call setf (45, 2, NWORD, 2r11)
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == MAR2_SYM) {
         state = ACCEPT
         if (Ctr_used)
            SAY ("MAR may not be used with CTR"p)
         if (Br_used)
            SAY ("MAR may not be used with BR"p)
         Mar_used = TRUE
         call setf (44, 3, NWORD, 2r111)
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == LMAR_SYM) {
            state = ACCEPT
            if (Ctr_used)
               SAY ("MAR may not be used with CTR"p)
            if (Br_used)
               SAY ("MAR may not be used with BR"p)
            Mar_used = TRUE
            call setf (45, 2, NWORD, 2r10)
            call getsym
            }
         }
      }
   }
gpst = state
return
end



subroutine input_sar (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == SAR_SYM) {
   state = ACCEPT
   Litval = 2r10
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == CSAR_SYM) {
      state = ACCEPT
      Litval = 2r01
      call getsym
      }
   }
gpst = state
return
end



subroutine successor (gpst)
integer gpst
include 'translang_com.r.i'
integer state
Litval = 2r001 # STEP is the default
state = NOMATCH
if (Symbol == WAIT_SYM) {
   state = ACCEPT
   Litval = 2r000
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == STEP_SYM) {
      state = ACCEPT
      Litval = 2r001
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == SAVE_SYM) {
         state = ACCEPT
         Litval = 2r010
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == SKIP_SYM) {
            state = ACCEPT
            Litval = 2r011
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == JUMP_SYM) {
               state = ACCEPT
               Litval = 2r100
               call getsym
               }
            if (state == NOMATCH) {
               if (Symbol == EXEC_SYM) {
                  state = ACCEPT
                  Litval = 2r101
                  call getsym
                  }
               if (state == NOMATCH) {
                  if (Symbol == CALL_SYM) {
                     state = ACCEPT
                     Litval = 2r110
                     call getsym
                     }
                  if (state == NOMATCH) {
                     if (Symbol == RETN_SYM) {
                        state = ACCEPT
                        Litval = 2r111
                        call getsym
                        }
                     }
                  }
               }
            }
         }
      }
   }
gpst = state
return
end



subroutine conditional_part (gpst)
integer gpst
include 'translang_com.r.i'
integer state
call if_clause (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   call then_clause (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call else_clause (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
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
   call when_clause (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state == ACCEPT) {
      call then_clause (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   }
gpst = state
return
end



subroutine if_clause (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == IF_SYM) {
   state = ACCEPT
   call getsym
   }
if (state == ACCEPT) {
   call condition (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine condition (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == NOT_SYM) {
   state = ACCEPT
   call setf (5, 1, NWORD, 2r0)
   call getsym
   }
else {
   call setf (5, 1, NWORD, 2r1)
   }
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   call basic_condition (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SAY ("missing condition"p)
         }
      when (ACCEPT) {
         call setf (1, 4, NWORD, Litval)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine basic_condition (gpst)
integer gpst
include 'translang_com.r.i'
integer state
integer caj_repl (3)
data caj_repl /2r0010, 2r0011, 2r1011/
state = NOMATCH
if (Symbol == LST_SYM) {
   state = ACCEPT
   Litval = 2r0101
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == MST_SYM) {
      state = ACCEPT
      Litval = 2r0100
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == AOV_SYM) {
         state = ACCEPT
         Litval = 2r0111
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == ABT_SYM) {
            state = ACCEPT
            Litval = 2r0110
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == COV_SYM) {
               state = ACCEPT
               Litval = 2r1000
               call getsym
               }
            if (state == NOMATCH) {
               if (Symbol == SAI_SYM) {
                  state = ACCEPT
                  Litval = 2r1001
                  call getsym
                  }
               if (state == NOMATCH) {
                  if (Symbol == RDC_SYM) {
                     state = ACCEPT
                     Litval = 2r1010
                     call getsym
                     }
                  if (state == NOMATCH) {
                     call condition_adjust_bit (state)
                     select (state)
                        when (FAILURE) {
                           gpst = FAILURE
                           return
                           }
                        when (ACCEPT) {
                           Litval = caj_repl (Litval)
                           }
                     }
                  }
               }
            }
         }
      }
   }
gpst = state
return
end



subroutine then_clause (gpst)
integer gpst
include 'translang_com.r.i'
integer state
Successor_context = THEN_PART
state = NOMATCH
if (Symbol == THEN_SYM) {
   state = ACCEPT
   call getsym
   }
if (state == ACCEPT) {
   repeat {
      call component (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
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



subroutine else_clause (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == ELSE_SYM) {
   state = ACCEPT
   call getsym
   }
if (state == ACCEPT) {
   call successor (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call setf (14, 3, NWORD, Litval)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine when_clause (gpst)
integer gpst
include 'translang_com.r.i'
integer state
state = NOMATCH
if (Symbol == WHEN_SYM) {
   state = ACCEPT
   call setf (14, 3, NWORD, 2r000)
   call getsym
   }
if (state == ACCEPT) {
   call condition (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end
