


subroutine rdp (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
repeat {
   call declaration (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state == NOMATCH) {
      call production (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            if (symbol ~= EOF)
               call errmsg ("production expected"s, state)
            while (symbol ~= EOF && symbol ~= ';'c)
               call getsym     # skip middle of prod
            if (symbol == ';'c)
               call getsym     # advance to next prod
            }
      }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   state = NOMATCH
   if (symbol == EOF) {
      state = ACCEPT
      }
   else {
      call errmsg ("EOF expected"s, state)
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine declaration (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
state = NOMATCH
if (symbol == '.'c) {
   state = ACCEPT
   call getsym
   }
if (state == ACCEPT) {
   state = NOMATCH
   select (symbol)
      when (TERMIDSYM) {
         state = ACCEPT
         call decl_tail (state)
         }
      when (NONTERMIDSYM) {
         state = ACCEPT
         call decl_tail (state)
         }
      when (EPSILONSYM) {
         state = ACCEPT
         call decl_tail (state)
         }
   if (state == NOMATCH) {
      call errmsg ("missing declarator"s, state)
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (symbol == ';'c) {
      state = ACCEPT
      call getsym
      }
   else {
      call errmsg ("missing semicolon"s, state)
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine termlist (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
integer i
integer ctoi
repeat {
   state = NOMATCH
   select (symbol)
      when (NONTERMIDSYM) {
         state = ACCEPT
         call o_defn (symboltext, next_term_val)
         last_term_val = next_term_val
         next_term_val = next_term_val + 1
         call enter (symboltext, 0, term_table)
         call getsym
         }
      when (INTSYM) {
         state = ACCEPT
         i = 1
         next_term_val = ctoi (symboltext, i)
         last_term_val = next_term_val
         call getsym
         }
      when ('='c) {
         state = ACCEPT
         next_term_val = last_term_val
         call getsym
         }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
gpst = state
return
end



subroutine extlist (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
repeat {
   state = NOMATCH
   if (symbol == NONTERMIDSYM) {
      state = ACCEPT
      call enter (symboltext, 0, term_table)
      call getsym
      }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
gpst = state
return
end



subroutine production (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
character name (MAXLINE)
state = NOMATCH
if (symbol == NONTERMIDSYM) {
   state = ACCEPT
   call scopy (symboltext, 1, name, 1)
   call getsym
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (symbol == ISSYM) {
      state = ACCEPT
      call getsym
      }
   else {
      call errmsg ("missing '->'"s, state)
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call actions (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call o_begin_routine (name)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call rhs (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call errmsg ("missing right-hand-side"s, state)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (symbol == ';'c) {
      state = ACCEPT
      call getsym
      }
   else {
      call errmsg ("missing semicolon"s, state)
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call actions (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call o_accept_actions
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
if (state == ACCEPT)
   call o_end_routine
gpst = state
return
end



subroutine rhs (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
integer numalts
numalts = 0
call actions (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (ACCEPT) {
      call o_accept_actions
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (symbol == '$'c) {
      state = ACCEPT
      call o_selection_start
      call getsym
      }
   if (state == ACCEPT) {
      call actions (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            if (num_actions > 0 || num_erractions > 0)
               call print (ERROUT,
                "*i:  actions are illegal here*n"s,
                linenumber)
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call choice (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            call errmsg ("missing choice"s, state)
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      repeat {
         state = NOMATCH
         if (symbol == '|'c) {
            state = ACCEPT
            call getsym
            }
         if (state == ACCEPT) {
            call choice (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (NOMATCH) {
                  call errmsg ("missing choice"s, state)
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
      state = ACCEPT
      call o_selection_end
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      call alternative (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      if (state == ACCEPT) {
         repeat {
            state = NOMATCH
            if (symbol == '|'c) {
               state = ACCEPT
               call o_alt
               numalts = numalts + 1
               call getsym
               }
            if (state == ACCEPT) {
               call alternative (state)
               select (state)
                  when (FAILURE) {
                     gpst = FAILURE
                     return
                     }
                  when (NOMATCH) {
                     call errmsg ("missing alternative"s, state)
                     }
               if (state ~= ACCEPT) {
                  gpst = FAILURE
                  return
                  }
               }
            } until (state ~= ACCEPT)
         select (state)
            when (NOMATCH) {
               state = ACCEPT
               for (; numalts > 0; numalts = numalts - 1)
                  call o_endalt
               }
            when (ACCEPT) {
               for (; numalts > 0; numalts = numalts - 1)
                  call o_endalt
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
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



subroutine choice (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
logical more_than_one
state = NOMATCH
if (symbol == TERMIDSYM) {
   state = ACCEPT
   call o_choice_start (symboltext)
   call getsym
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (symbol == '.'c) {
      state = ACCEPT
      advance = NO
      call getsym
      }
   else {
      advance = YES
      }
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call actions (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call o_choice_actions
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call eltpresent (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         more_than_one = FALSE
         }
      when (ACCEPT) {
         call o_begin_seq
         more_than_one = TRUE
         }
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      call term (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call o_test_seq_failure
            }
      if (state == NOMATCH) {
         call nonterm (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call o_test_seq_failure
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
if (more_than_one)
   call o_end_seq
call o_choice_end
gpst = state
return
end



subroutine alternative (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
logical more_than_one
call term (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == NOMATCH) {
   call nonterm (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call errmsg ("illegal term/nonterm"s, state)
         }
   }
if (state == ACCEPT) {
   call eltpresent (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         more_than_one = FALSE
         }
      when (ACCEPT) {
         call o_begin_seq
         more_than_one = TRUE
         }
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      call term (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call o_test_seq_failure
            }
      if (state == NOMATCH) {
         call nonterm (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call o_test_seq_failure
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
if (more_than_one)
   call o_end_seq
gpst = state
return
end



subroutine eltpresent (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
state = NOMATCH
select (symbol)
   when (NONTERMIDSYM) {
      state = ACCEPT
      }
   when (TERMIDSYM) {
      state = ACCEPT
      }
   when (EPSILONSYM) {
      state = ACCEPT
      }
   when ('('c) {
      state = ACCEPT
      }
   when ('['c) {
      state = ACCEPT
      }
   when ('{'c) {
      state = ACCEPT
      }
gpst = state
return
end



subroutine term (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
character termbuf (MAXLINE)
state = NOMATCH
if (symbol == TERMIDSYM) {
   state = ACCEPT
   call scopy (symboltext, 1, termbuf, 1)
   call getsym
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (symbol == ':'c) {
      state = ACCEPT
      call getsym
      }
   else {
      call o_match (termbuf)
      }
   if (state == ACCEPT) {
      state = NOMATCH
      if (symbol == TERMIDSYM) {
         state = ACCEPT
         call o_match_range (termbuf, symboltext)
         call getsym
         }
      else {
         call errmsg ("missing upper bound"s, state)
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
   state = NOMATCH
   if (symbol == '.'c) {
      state = ACCEPT
      advance = NO
      call getsym
      }
   else {
      advance = YES
      }
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call actions (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call o_end_term
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
if (state == NOMATCH) {
   if (symbol == EPSILONSYM) {
      state = ACCEPT
      call o_epsilon
      call getsym
      }
   if (state == ACCEPT) {
      call actions (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call o_accept_actions
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



subroutine nonterm (gpst)
integer gpst
include 'stacc_com.r.i'
integer state
state = NOMATCH
if (symbol == NONTERMIDSYM) {
   state = ACCEPT
   call o_call_nonterm (symboltext)
   call getsym
   }
if (state == ACCEPT) {
   call actions (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call o_end_nonterm
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
if (state == NOMATCH) {
   if (symbol == '('c) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      call rhs (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            call errmsg ("missing rhs in parentheses"s, state)
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      state = NOMATCH
      if (symbol == ')'c) {
         state = ACCEPT
         call getsym
         }
      else {
         call errmsg ("missing right parenthesis"s, state)
         }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call actions (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call o_end_par
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      if (symbol == '['c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call rhs (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               call errmsg ("missing optional rhs"s, state)
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (symbol == ']'c) {
            state = ACCEPT
            call getsym
            }
         else {
            call errmsg ("missing right bracket"s, state)
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call actions (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call o_end_opt
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (symbol == '{'c) {
            state = ACCEPT
            call o_begin_rept
            call getsym
            }
         if (state == ACCEPT) {
            call rhs (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (NOMATCH) {
                  call errmsg ("missing repeated rhs"s, state)
                  }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            state = NOMATCH
            if (symbol == '}'c) {
               state = ACCEPT
               call getsym
               }
            else {
               call errmsg ("missing right brace"s, state)
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            call actions (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  call o_end_rept
                  }
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
