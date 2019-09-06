


subroutine external_definition (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer id, params, mode, dm
integer sc, junk, is_stored
pointer q
CALL2 (sc, mode)
call decl_specifiers (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (ACCEPT) {
      RETURN2 (sc, mode)
      id = LAMBDA
      params = LAMBDA
      CALL2 (id, params)
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == ';'c) {
      state = ACCEPT
      RETURN2 (id, params)
      call getsym
      }
   if (state == NOMATCH) {
      call declarator (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            RETURN2 (id, params)
            dm = mode
            call create_saved_mode (dm)
            }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == ','c) {
            state = ACCEPT
            call enter_id_decl (id, dm, sc, params, NO, NO)
            call allocate_storage (id)
            if (is_stored (id) == YES) {
               call out_var (id)
               call out_oper (NULL_OP)
               call out_size (SYMMODE (id))
               }
            CALL3 (sc, mode, NO)
            call getsym
            }
         if (state == ACCEPT) {
            call init_declarator_list (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  RETURN3 (sc, mode, junk)
                  }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         if (state == NOMATCH) {
            if (Symbol == '='c) {
               state = ACCEPT
               call enter_id_decl (id, dm, sc, params, NO, NO)
               call out_var (id)
               CALL1 (id)
               call getsym
               }
            if (state == ACCEPT) {
               call initializer (state)
               select (state)
                  when (FAILURE) {
                     gpst = FAILURE
                     return
                     }
                  when (ACCEPT) {
                     RETURN1 (id)
                     call allocate_storage (id)
                     call out_oper (NULL_OP)
                     call out_size (SYMMODE (id))
                     }
               if (state ~= ACCEPT) {
                  gpst = FAILURE
                  return
                  }
               state = NOMATCH
               if (Symbol == ','c) {
                  state = ACCEPT
                  CALL3 (sc, mode, NO)
                  call getsym
                  }
               if (state == ACCEPT) {
                  call init_declarator_list (state)
                  select (state)
                     when (FAILURE) {
                        gpst = FAILURE
                        return
                        }
                     when (ACCEPT) {
                        RETURN3 (sc, mode, junk)
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
               if (Symbol == ';'c) {
                  state = ACCEPT
                  call enter_id_decl (id, dm, sc, params, NO, NO)
                  if (is_stored (id) == YES) {
                     call out_var (id)
                     call allocate_storage (id)
                     call out_oper (NULL_OP)
                     call out_size (SYMMODE (id))
                     }
                  }
               if (state == NOMATCH) {
                  call empty (state)
                  select (state)
                     when (FAILURE) {
                        gpst = FAILURE
                        return
                        }
                     when (ACCEPT) {
                        if (MODETYPE (dm) ~= FUNCTION_MODE) {
                           SYNERR ("Semicolon required"p)
                           }
                        else
                           state = NOMATCH
                        }
                  if (state == NOMATCH) {
                     call empty (state)
                     select (state)
                        when (FAILURE) {
                           gpst = FAILURE
                           return
                           }
                        when (ACCEPT) {
                           if (sc == TYPEDEF_SC) {
                              SYNERR ("Function may not be TYPEDEF"p)
                              sc = DEFAULT_SC
                              }
                           q = LAMBDA
                           call enter_id_decl (id, dm, sc, q, NO, YES)
                           call allocate_storage (id)
                           CALL2 (id, params)
                           }
                     if (state == ACCEPT) {
                        call function_header (state)
                        select (state)
                           when (FAILURE) {
                              gpst = FAILURE
                              return
                              }
                           when (ACCEPT) {
                              RETURN2 (id, params)
                              }
                        if (state ~= ACCEPT) {
                           gpst = FAILURE
                           return
                           }
                        }
                     }
                  }
               }
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   if (state == NOMATCH) {
      SYNERR ("Illegal element in external definition"p)
      call skip_to (','c)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine function_header (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer id, params
pointer q, mp
pointer new_sym
integer arg_ct, junk
integer findsym, new_obj, is_aggregate
ENTER2 (id, params)
SETSTREAM (INTDEFSTREAM)
call ck_fndef (id)
Proc_mode = MODEPARENT (SYMMODE (id))
call enter_ll
repeat {
   call type_or_sc_spec (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         CALL1 (YES)
         }
   if (state == ACCEPT) {
      call declarations (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            RETURN1 (junk)
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
if (state == ACCEPT) {
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         arg_ct = 0
         for (q = params; q ~= LAMBDA; q = PARAMNEXT (q))
            arg_ct += 1
         if (is_aggregate (Proc_mode) == NO) {
            call out_proc (id, arg_ct)
            arg_ct = 0
            Proc_rtnv = LAMBDA
            }
         else {
            call out_proc (id, arg_ct + 1)
            mp = Proc_mode
            call create_mode (mp, POINTER_MODE, 0)
            q = new_sym ("#rtnv"s, mp, AUTO_SC, YES,
                            Ll, new_obj (0), NO)
            SYMPARAM (q) = 1
            call out_arg (q)
            arg_ct = 1
            Proc_rtnv = q
            }
         while (params ~= LAMBDA) {
            if (PARAMTEXT (params) == LAMBDA)
               SYNERR ("Parameters must be named"s)
            else if (find_sym (Mem (PARAMTEXT (params)), q, IDCLASS) == YES
                  && SYMTYPE (q) == IDSYMTYPE
                  && SYMLL (q) == Ll) {
               arg_ct += 1
               SYMPARAM (q) = arg_ct
               call ck_fnarg (q)
               call out_arg (q)
               }
            else {
               ERROR_SYMBOL (Mem (PARAMTEXT (params)))
               SYNERR ("parameter not declared"p)
               }
            if (PARAMTEXT (params) ~= LAMBDA)
               call dsfree (PARAMTEXT (params))
            q = PARAMNEXT (params)
            call dsfree (params)
            params = q
            }
         call out_oper (NULL_OP)
         call ck_fnend
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call compound_statement (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call clean_up_ll
         call exit_ll
         call out_oper (NULL_OP)
         SETSTREAM (EXTDEFSTREAM)
         EXIT2 (id, params)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
state = NOMATCH
select (Symbol)
   when ('{'c) {
      state = ACCEPT
      call enter_ll
      if (state == ACCEPT) {
         call compound_statement (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call clean_up_ll
               call exit_ll
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (IDSYM) {
      state = ACCEPT
      if (Nsymbol ~= ':'c)
         state = NOMATCH
      if (state == ACCEPT) {
         call statement_label (state)
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
   when (IFSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call if_statement (state)
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
   when (WHILESYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call while_statement (state)
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
   when (DOSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call do_statement (state)
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
   when (FORSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call for_statement (state)
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
   when (SWITCHSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call switch_statement (state)
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
   when (CASESYM) {
      state = ACCEPT
      SYNERR ("'Case' not in scope of 'switch'"p)
      call getsym
      }
   when (DEFAULTSYM) {
      state = ACCEPT
      SYNERR ("'Default' not in scope of 'switch'"p)
      call getsym
      }
   when (';'c) {
      state = ACCEPT
      call getsym
      }
   when (BREAKSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call break_statement (state)
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
         if (Symbol == ';'c) {
            state = ACCEPT
            call getsym
            }
         else {
            SYNERR ("missing semicolon"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (CONTINUESYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call continue_statement (state)
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
         if (Symbol == ';'c) {
            state = ACCEPT
            call getsym
            }
         else {
            SYNERR ("missing semicolon"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (RETURNSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call return_statement (state)
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
         if (Symbol == ';'c) {
            state = ACCEPT
            call getsym
            }
         else {
            SYNERR ("missing semicolon"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (GOTOSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call goto_statement (state)
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
         if (Symbol == ';'c) {
            state = ACCEPT
            call getsym
            }
         else {
            SYNERR ("missing semicolon"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
if (state == NOMATCH) {
   call expression (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call out_oper (SEQ_OP)
         call gen_make_arith
         call out_expr
         }
   if (state == ACCEPT) {
      state = NOMATCH
      if (Symbol == ';'c) {
         state = ACCEPT
         call getsym
         }
      else {
         SYNERR ("missing semicolon"p)
         state = ACCEPT
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



subroutine statement_label (gpst)
integer gpst
include 'c1_com.r.i'
integer state
state = NOMATCH
if (Symbol == IDSYM) {
   state = ACCEPT
   call declare_label (YES)
   call out_lab (Symptr)
   call getsym
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == ':'c) {
      state = ACCEPT
      call getsym
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == IDSYM) {
         state = ACCEPT
         if (Nsymbol ~= ':')
            state = NOMATCH
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == IDSYM) {
            state = ACCEPT
            call declare_label (YES)
            call out_lab (Symptr)
            call getsym
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == ':'c) {
            state = ACCEPT
            call getsym
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



subroutine goto_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
state = NOMATCH
if (Symbol == IDSYM) {
   state = ACCEPT
   call declare_label (NO)
   call out_goto (Symptr)
   call getsym
   }
else {
   SYNERR ("Label required following 'goto'"p)
   state = ACCEPT
   }
gpst = state
return
end



subroutine return_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer p
call expression (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (NOMATCH) {
      call out_stmt (RETURN_OP)
      call out_oper (NULL_OP)
      state = ACCEPT
      }
   when (ACCEPT) {
      if (Proc_rtnv == LAMBDA) {
         call out_stmt (RETURN_OP)
         call gen_make_arith
         call gen_convert (Proc_mode)
         call out_expr
         }
      else {
         call es_pop (p)
         call gen_opnd (Proc_rtnv)
         call gen_oper (DEREF_OP)
         call es_push (p)
         call gen_convert (Proc_mode)
         call gen_oper (ASSIGN_OP)
         call out_oper (SEQ_OP)
         call out_expr
         call out_stmt (RETURN_OP)
         call out_oper (NULL_OP)
         }
      }
gpst = state
return
end



subroutine continue_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer nl, i
CALL1 (0)
call constant_expr (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (NOMATCH) {
      RETURN1 (nl)
      nl = 1
      state = ACCEPT
      }
   when (ACCEPT) {
      RETURN1 (nl)
      }
if (state == ACCEPT) {
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call out_stmt (NEXT_OP)
         call out_num (nl)
         for (i = Ctl_sp; i > 0 && nl > 0; i -= CSSIZE)
            if (CSTYPE (i) ~= SWITCHCS)
               nl -= 1
         if (nl > 0)
            SYNERR ("Not enough loops active"p)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine break_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer nl, i
CALL1 (0)
call constant_expr (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (NOMATCH) {
      RETURN1 (nl)
      nl = 1
      state = ACCEPT
      }
   when (ACCEPT) {
      RETURN1 (nl)
      }
if (state == ACCEPT) {
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call out_stmt (BREAK_OP)
         call out_num (nl)
         for (i = Ctl_sp; i > 0 && nl > 0; i -= CSSIZE)
            nl -= 1
         if (nl > 0)
            SYNERR ("Not enough loops active"p)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine switch_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer lstate
integer is_constant
pointer v, mp
lstate = 1
call cs_push (SWITCHCS)
call out_stmt (SWITCH_OP)
call expression (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (NOMATCH) {
      SYNERR ("Expression required after 'switch'"p)
      state = ACCEPT
      mp = Int_mode_ptr
      }
   when (ACCEPT) {
      call gen_make_arith
      call check_arith
      call es_top (v)
      mp = EXPMODE (v)
      call out_mode (mp)
      call out_expr
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == '{'c) {
      state = ACCEPT
      call getsym
      }
   else {
      SYNERR ("Left brace required after 'switch'"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == CASESYM) {
         state = ACCEPT
         if (lstate == 1)
            lstate = 2
         else
            call out_oper (NULL_OP)
         call getsym
         }
      if (state == ACCEPT) {
         call expression (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Constant expr required after 'case'"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call out_oper (CASE_OP)
               call gen_convert (mp)
               call es_top (v)
               if (is_constant (v) == NO)
                  SYNERR ("Constant expression required"p)
               call gen_make_arith
               call out_expr
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == ':'c) {
            state = ACCEPT
            call getsym
            }
         else {
            SYNERR ("Colon required after 'case'"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (Symbol == DEFAULTSYM) {
            state = ACCEPT
            if (lstate == 1)
               lstate = 3
            else if (lstate == 2) {
               lstate = 3
               call out_oper (NULL_OP)
               }
            else
               SYNERR ("Only 1 'default' allowed per 'switch'"p)
            call out_oper (DEFAULT_OP)
            call getsym
            }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == ':'c) {
               state = ACCEPT
               call getsym
               }
            else {
               SYNERR ("Colon required after 'default'"p)
               state = ACCEPT
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         if (state == NOMATCH) {
            call statement (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  if (lstate == 1)
                     SYNERR ("'Case' must follow 'switch'"p)
                  }
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
   state = NOMATCH
   if (Symbol == '}'c) {
      state = ACCEPT
      call getsym
      }
   else {
      SYNERR ("Right brace required"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call out_oper (NULL_OP)
         call out_oper (NULL_OP)
         call cs_pop
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine for_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call cs_push (FORCS)
call out_stmt (FOR_OP)
state = NOMATCH
if (Symbol == '('c) {
   state = ACCEPT
   call getsym
   }
else {
   SYNERR ("Left paren required after 'for'"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   call expression (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call out_oper (NULL_OP)
         }
      when (ACCEPT) {
         call gen_make_arith
         call out_expr
         }
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == ';'c) {
      state = ACCEPT
      call getsym
      }
   else {
      SYNERR ("Semicolon required"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call expression (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call out_oper (NULL_OP)
         }
      when (ACCEPT) {
         call gen_make_arith
         call gen_toboolean
         call out_expr
         }
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == ';'c) {
      state = ACCEPT
      call getsym
      }
   else {
      SYNERR ("Semicolon required"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call expression (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call out_oper (NULL_OP)
         }
      when (ACCEPT) {
         call gen_make_arith
         call out_expr
         }
   select (state)
      when (NOMATCH)
         state = ACCEPT
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
      SYNERR ("Right paren required after 'for'"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call statement (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Statement required after 'for'"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         call out_oper (NULL_OP)
         call cs_pop
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine do_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call cs_push (DOCS)
call out_stmt (DO_OP)
call statement (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (NOMATCH) {
      SYNERR ("Statement required after 'do'"p)
      state = ACCEPT
      }
   when (ACCEPT) {
      call out_oper (NULL_OP)
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == WHILESYM) {
      state = ACCEPT
      call getsym
      }
   else {
      SYNERR ("'While' required after 'do'"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call expression (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Expression required after 'while'"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         call gen_make_arith
         call gen_oper (NOT_OP)
         call gen_toboolean
         call out_expr
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call cs_pop
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine if_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call out_stmt (IF_OP)
call out_mode (Int_mode_ptr)
state = NOMATCH
if (Symbol == '('c) {
   state = ACCEPT
   call getsym
   }
else {
   SYNERR ("Left paren required after 'if'"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   call expression (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Expression required after 'if'"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         call gen_make_arith
         call gen_toboolean
         call out_expr
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
      SYNERR ("Right paren required after 'if'"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call statement (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Statement required after 'if'"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         call out_oper (NULL_OP)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == ELSESYM) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      call statement (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            SYNERR ("Statement required after 'else'"p)
            state = ACCEPT
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
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call out_oper (NULL_OP)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine while_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call cs_push (WHILECS)
call out_stmt (WHILE_OP)
state = NOMATCH
if (Symbol == '('c) {
   state = ACCEPT
   call getsym
   }
else {
   SYNERR ("Left paren required after 'while'"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   call expression (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Expression required after 'while'"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         call gen_make_arith
         call gen_toboolean
         call out_expr
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
      SYNERR ("Right paren required after 'while'"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call statement (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Statement required after 'while'"p)
         state = ACCEPT
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call out_oper (NULL_OP)
         call cs_pop
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine compound_statement (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer junk
state = NOMATCH
if (Symbol == '{'c) {
   state = ACCEPT
   call getsym
   }
else {
   SYNERR ("Left brace required"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   repeat {
      call not_statement_start (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            CALL1 (NO)
            }
      if (state == ACCEPT) {
         call declarations (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               RETURN1 (junk)
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
   repeat {
      call not_statement_end (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      if (state == ACCEPT) {
         call statement (state)
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
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == '}'c) {
      state = ACCEPT
      call getsym
      }
   else {
      SYNERR ("Right brace required"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine declarations (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer flag, sc
pointer mode
ENTER1 (flag)
CALL2 (sc, mode)
call decl_specifiers (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (ACCEPT) {
      RETURN2 (sc, mode)
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == ';'c) {
      state = ACCEPT
      call getsym
      }
   if (state == NOMATCH) {
      call empty (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            CALL3 (sc, mode, flag)
            }
      if (state == ACCEPT) {
         call init_declarator_list (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               RETURN3 (sc, mode, flag)
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == ';'c) {
            state = ACCEPT
            call getsym
            }
         else {
            SYNERR ("Semicolon required"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   if (state == ACCEPT) {
      EXIT1 (flag)
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine decl_specifiers (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer mode
integer sc
integer junk
integer findsym
pointer p
ENTER2 (sc, mode)
p = LAMBDA
mode = DEFAULT_MODE
sc = DEFAULT_SC
repeat {
   state = NOMATCH
   select (Symbol)
      when (AUTOSYM) {
         state = ACCEPT
         if (sc ~= DEFAULT_SC)
            SYNERR ("'Auto' is redundant"p)
         sc = AUTO_SC
         call getsym
         }
      when (EXTERNSYM) {
         state = ACCEPT
         if (sc ~= DEFAULT_SC)
            SYNERR ("'Extern' is redundant"p)
         sc = EXTERN_SC
         call getsym
         }
      when (REGISTERSYM) {
         state = ACCEPT
         if (sc ~= DEFAULT_SC)
            SYNERR ("'Register' is redundant"p)
         sc = REGISTER_SC
         call getsym
         }
      when (STATICSYM) {
         state = ACCEPT
         if (sc ~= DEFAULT_SC)
            SYNERR ("'Static' is redundant"p)
         sc = STATIC_SC
         call getsym
         }
      when (TYPEDEFSYM) {
         state = ACCEPT
         if (sc ~= DEFAULT_SC)
            SYNERR ("'Typedef' is redundant"p)
         sc = TYPEDEF_SC
         call getsym
         }
      when (CHARSYM) {
         state = ACCEPT
         if (mode == UNSIGNED_MODE) {
            mode = CHARUNS_MODE
            p = Charuns_mode_ptr
            }
         else if (mode == DEFAULT_MODE) {
            mode = CHAR_MODE
            p = Char_mode_ptr
            }
         else
            SYNERR ("'Char' is redundant"p)
         call getsym
         }
      when (SHORTSYM) {
         state = ACCEPT
         if (mode == UNSIGNED_MODE) {
            mode = SHORTUNS_MODE
            p = Shortuns_mode_ptr
            }
         else if (mode == DEFAULT_MODE
                || mode == INT_MODE) {
            mode = SHORT_MODE
            p = Short_mode_ptr
            }
         else
            SYNERR ("'Short' is redundant"p)
         call getsym
         }
      when (INTSYM) {
         state = ACCEPT
         if (mode == DEFAULT_MODE) {
            mode = INT_MODE
            p = Int_mode_ptr
            }
         else if (mode ~= SHORT_MODE
                    && mode ~= LONG_MODE
                    && mode ~= UNSIGNED_MODE
                    && mode ~= SHORTUNS_MODE
                    && mode ~= LONGUNS_MODE)
            SYNERR ("'Int' is redundant"p)
         call getsym
         }
      when (LONGSYM) {
         state = ACCEPT
         if (mode == DEFAULT_MODE || mode == INT_MODE) {
            mode = LONG_MODE
            p = Long_mode_ptr
            }
         else if (mode == UNSIGNED_MODE) {
            mode = LONGUNS_MODE
            p = Longuns_mode_ptr
            }
         else if (mode == FLOAT_MODE) {
            mode = DOUBLE_MODE
            p = Double_mode_ptr
            }
         else
            SYNERR ("'Long' is redundant"p)
         call getsym
         }
      when (UNSIGNEDSYM) {
         state = ACCEPT
         if (mode == SHORT_MODE) {
            mode = SHORTUNS_MODE
            p = Shortuns_mode_ptr
            }
         else if (mode == CHAR_MODE) {
            mode = CHARUNS_MODE
            p = Charuns_mode_ptr
            }
         else if (mode == LONG_MODE) {
            mode = LONGUNS_MODE
            p = Longuns_mode_ptr
            }
         else if (mode == DEFAULT_MODE
                     || mode == INT_MODE) {
            mode = UNSIGNED_MODE
            p = Unsigned_mode_ptr
            }
         else
            SYNERR ("'Unsigned' is redundant"p)
         call getsym
         }
      when (FLOATSYM) {
         state = ACCEPT
         if (mode == DEFAULT_MODE) {
            mode = FLOAT_MODE
            p = Float_mode_ptr
            }
         else if (mode == LONG_MODE) {
            mode = DOUBLE_MODE
            p = Double_mode_ptr
            }
         else if (mode ~= DOUBLE_MODE)
            SYNERR ("'Float' is redundant"p)
         call getsym
         }
      when (DOUBLESYM) {
         state = ACCEPT
         if (mode == DEFAULT_MODE
                     || mode == FLOAT_MODE) {
            mode = DOUBLE_MODE
            p = Double_mode_ptr
            }
         else
            SYNERR ("'Double' is redundant"p)
         call getsym
         }
      when (STRUCTSYM) {
         state = ACCEPT
         if (mode ~= DEFAULT_MODE)
            SYNERR ("'Struct' is redundant"p)
         mode = STRUCT_MODE
         CALL2 (NO, p)
         call getsym
         if (state == ACCEPT) {
            call struct_or_union_specifier (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  RETURN2 (junk, p)
                  }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         }
      when (UNIONSYM) {
         state = ACCEPT
         if (mode ~= DEFAULT_MODE)
            SYNERR ("'Union' is redundant"p)
         mode = UNION_MODE
         CALL2 (YES, p)
         call getsym
         if (state == ACCEPT) {
            call struct_or_union_specifier (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  RETURN2 (junk, p)
                  }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         }
      when (ENUMSYM) {
         state = ACCEPT
         if (mode ~= DEFAULT_MODE)
            SYNERR ("'Enum' is redundant"p)
         mode = ENUM_MODE
         CALL1 (p)
         call getsym
         if (state == ACCEPT) {
            call enum_specifier (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  RETURN1 (p)
                  }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         }
      when (IDSYM) {
         state = ACCEPT
         if (findsym (Symtext, Symptr, IDCLASS) == NO
               || SYMSC (Symptr) ~= TYPEDEFSC)
            state = NOMATCH
         else if (mode ~= DEFAULT_MODE) {
            if (SYMLL (Symptr) == Ll)
               SYNERR ("Mode and typedef name cannot " _
                      "appear together"p)
            state = NOMATCH
            }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == IDSYM) {
               state = ACCEPT
               mode = TYPEDEF_MODE
               p = SYMMODE (Symptr)
               call getsym
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         if (mode == DEFAULT_MODE)
            p = Int_mode_ptr
         EXIT2 (sc, p)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine init_declarator_list (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call init_declarator (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == ','c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call init_declarator (state)
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



subroutine init_declarator (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer dm, id, params
pointer mode
integer sc, arg
integer is_stored
ENTER3 (sc, mode, arg)
id = LAMBDA
params = LAMBDA
CALL2 (id, params)
call declarator (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (ACCEPT) {
      RETURN2 (id, params)
      dm = mode
      call create_saved_mode (dm)
      call enter_id_decl (id, dm, sc, params, arg, NO)
      if (is_stored (id) == YES)
         call out_var (id)
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == '='c) {
      state = ACCEPT
      if (arg == YES) {
         SYNERR ("Parameters cannot be initialized"p)
         state = NOMATCH
         call skip_to (","c)
         }
      call getsym
      }
   if (state == ACCEPT) {
      call empty (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            CALL1 (id)
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call initializer (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            RETURN1 (id)
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
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call allocate_storage (id)
         if (is_stored (id) == YES) {
            call out_oper (NULL_OP)
            call out_size (SYMMODE (id))
            }
         EXIT3 (sc, mode, arg)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine declarator (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer params, id
integer scnt, v
pointer q, tail, tp, mp
pointer sdupl, dsget
ENTER2 (id, params)
scnt = 0
repeat {
   state = NOMATCH
   if (Symbol == '*'c) {
      state = ACCEPT
      scnt += 1
      call getsym
      }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == '('c) {
      state = ACCEPT
      CALL2 (id, params)
      call getsym
      }
   if (state == ACCEPT) {
      call declarator (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            RETURN2 (id, params)
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
         SYNERR ("right paren required"p)
         state = ACCEPT
         }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      if (Symbol == IDSYM) {
         state = ACCEPT
         id = sdupl (Symtext)
         call getsym
         }
      }
   if (state == NOMATCH) {
      SYNERR ("Identifier required in declarator"p)
      call getsym
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == '('c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == IDSYM) {
            state = ACCEPT
            tp = sdupl (Symtext)
            mp = LAMBDA
            call getsym
            }
         else {
            CALL1 (mp)
            }
         if (state == NOMATCH) {
            call type_name (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (NOMATCH) {
                  RETURN1 (mp)
                  }
               when (ACCEPT) {
                  RETURN1 (mp)
                  tp = LAMBDA
                  }
            if (state == NOMATCH) {
               if (Symbol == ','c) {
                  state = ACCEPT
                  tp = LAMBDA
                  mp = LAMBDA
                  }
               }
            }
         if (state == ACCEPT) {
            if (params ~= LAMBDA)
               SYNERR ("Only 1 parameter list allowed"p)
            tail = dsget (PARAMSIZE)
            params = tail
            PARAMTEXT (tail) = tp
            PARAMMODE (tail) = mp
            PARAMNEXT (tail) = LAMBDA
            }
         if (state == ACCEPT) {
            repeat {
               state = NOMATCH
               if (Symbol == ','c) {
                  state = ACCEPT
                  call getsym
                  }
               if (state == ACCEPT) {
                  state = NOMATCH
                  if (Symbol == IDSYM) {
                     state = ACCEPT
                     tp = sdupl (Symtext)
                     mp = LAMBDA
                     call getsym
                     }
                  else {
                     CALL1 (mp)
                     }
                  if (state == NOMATCH) {
                     call type_name (state)
                     select (state)
                        when (FAILURE) {
                           gpst = FAILURE
                           return
                           }
                        when (NOMATCH) {
                           RETURN1 (mp)
                           }
                        when (ACCEPT) {
                           RETURN1 (mp)
                           tp = LAMBDA
                           }
                     if (state == NOMATCH) {
                        if (Symbol == ','c) {
                           state = ACCEPT
                           tp = LAMBDA
                           mp = LAMBDA
                           }
                        }
                     }
                  select (state)
                     when (NOMATCH) {
                        SYNERR ("Parameters must be identifiers"p)
                        state = ACCEPT
                        }
                     when (ACCEPT) {
                        q = dsget (PARAMSIZE)
                        PARAMTEXT (q) = tp
                        PARAMMODE (q) = mp
                        PARAMNEXT (q) = LAMBDA
                        PARAMNEXT (tail) = q
                        tail = q
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
         select (state)
            when (NOMATCH)
               state = ACCEPT
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == ')'c) {
            state = ACCEPT
            call save_mode (FUNCTION_MODE, 0)
            call getsym
            }
         else {
            SYNERR ("Parameters must be identifiers"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (Symbol == '['c) {
            state = ACCEPT
            CALL1 (0)
            call getsym
            }
         if (state == ACCEPT) {
            call constant_expr (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (NOMATCH) {
                  RETURN1 (v)
                  v = 0
                  }
               when (ACCEPT) {
                  RETURN1 (v)
                  }
            select (state)
               when (NOMATCH)
                  state = ACCEPT
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            state = NOMATCH
            if (Symbol == ']'c) {
               state = ACCEPT
               call save_mode (ARRAY_MODE, v)
               call getsym
               }
            else {
               SYNERR ("Right bracket required"p)
               state = ACCEPT
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
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
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         for (; scnt > 0; scnt -= 1)
            call save_mode (POINTER_MODE, 0)
         EXIT2 (id, params)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine struct_or_union_specifier (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer union
pointer mp, tail, id
pointer findsym, makesym, enter_sibling_mode
integer mt
ENTER2 (union, mp)
if (union == NO)
   mt = STRUCT_MODE
else
   mt = UNION_MODE
state = NOMATCH
if (Symbol == '{'c) {
   state = ACCEPT
   mp = enter_sibling_mode (Modetable, mt, 0)
   }
if (state == NOMATCH) {
   if (Symbol == IDSYM) {
      state = ACCEPT
      if (find_sym (Symtext, id, SMCLASS) == NO
            || SYMLL (id) ~= Ll && Nsymbol == '{'c) {
         id = makesym (Symtext, STSYMTYPE, Ll)
         mp = enter_sibling_mode (Modetable, mt, 0)
         SYMMODE (id) = mp
         }
      else if (SYMTYPE (id) ~= STSYMTYPE) {
         SYNERR ("Struct tag already declared as struct member"p)
         mp = enter_sibling_mode (Modetable, mt, 0)
         }
      else if (Nsymbol == '{'c
           && SYMMODE (id) ~= LAMBDA
           && MODESMLIST (SYMMODE (id)) ~= LAMBDA) {
         SYNERR ("Struct already defined"p)
         mp = enter_sibling_mode (Modetable, mt, 0)
         }
      else
         mp = SYMMODE (id)
      call getsym
      }
   }
if (state == NOMATCH) {
   SYNERR ("Name or left brace must follow 'struct'"p)
   state = ACCEPT
   mp = enter_sibling_mode (Modetable, mt, 0)
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == '{'c) {
      state = ACCEPT
      MODESMLIST (mp) = LAMBDA
      call put_long (MODELEN (mp), intl (0))
      tail = LAMBDA
      CALL2 (mp, tail)
      call getsym
      }
   if (state == ACCEPT) {
      call struct_decl_list (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            RETURN2 (mp, tail)
            call align_mode (Int_mode_ptr, MODELEN (mp))
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      state = NOMATCH
      if (Symbol == '}'c) {
         state = ACCEPT
         call getsym
         }
      else {
         SYNERR ("Right brace required"p)
         state = ACCEPT
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
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         if (mp == LAMBDA)        # something wrong here!
            mp = Int_mode_ptr
         EXIT2 (union, mp)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine struct_decl_list (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call struct_declaration (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      call type_or_sc_spec (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      if (state == ACCEPT) {
         call struct_declaration (state)
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



subroutine struct_declaration (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer mp, tail, id
integer sc, size
pointer mode
ENTER2 (mp, tail)
CALL2 (sc, mode)
call decl_specifiers (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (ACCEPT) {
      RETURN2 (sc, mode)
      if (sc ~= DEFAULT_SC) {
         SYNERR ("Storage class cannot appear in 'struct'"p)
         sc = DEFAULT_SC
         }
      CALL3 (mp, tail, mode)
      }
if (state == ACCEPT) {
   call struct_declarator_list (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         RETURN3 (mp, tail, mode)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == ';'c) {
      state = ACCEPT
      call getsym
      }
   else {
      SYNERR ("Semicolon required"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         EXIT2 (mp, tail)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine struct_declarator_list (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call struct_declarator (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == ','c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call struct_declarator (state)
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



subroutine struct_declarator (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer id, tail, mode, mp
pointer params, dm
pointer dsget
integer v, size
longint sizeof_mode
ENTER3 (mp, tail, mode)
state = NOMATCH
if (Symbol == ':'c) {
   state = ACCEPT
   CALL1 (0)
   call getsym
   }
if (state == ACCEPT) {
   call constant_expr (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         RETURN1 (v)
         v = 0
         SYNERR ("Constant expression required"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         RETURN1 (v)
         if (v < 0)
            SYNERR ("Field size must be >= 0"p)
         else if (v == 0)
            call align_mode (Short_mode_ptr, MODELEN (mp))
         else {
            if (v > 16)
               dm = Long_uns_mode_ptr
            else
               dm = Short_uns_mode_ptr
            call create_mode (dm, FIELD_MODE, v)
            call align_mode (dm, MODELEN (mp))
            call alloc_struct (mp, sizeof_mode (dm))
            }
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
if (state == NOMATCH) {
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         id = LAMBDA
         params = LAMBDA
         CALL2 (id, params)
         }
   if (state == ACCEPT) {
      call declarator (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            RETURN2 (id, params)
            dm = mode
            call create_saved_mode (dm)
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      state = NOMATCH
      if (Symbol == ':'c) {
         state = ACCEPT
         CALL1 (0)
         call getsym
         }
      if (state == ACCEPT) {
         call constant_expr (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               RETURN1 (v)
               SYNERR ("Constant expression required"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               RETURN1 (v)
               if (v <= 0) {
                  SYNERR ("Field size must be > 0"p)
                  v = 1
                  }
               if (v > 32) {
                  SYNERR ("Field size must be <= 32"p)
                  v = 32
                  }
               if (dm ~= Int_mode_ptr
                    && dm ~= Short_mode_ptr
                    && dm ~= Long_mode_ptr
                    && dm ~= Unsigned_mode_ptr
                    && dm ~= Long_uns_mode_ptr
                    && dm ~= Short_uns_mode_ptr
                    && dm ~= Char_mode_ptr)
                  SYNERR ("Only fields of integers are allowed"p)
               if (v > 16)
                  dm = Long_uns_mode_ptr
               else
                  dm = Short_uns_mode_ptr
               call create_mode (dm, FIELD_MODE, v)
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
      call empty (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call align_mode (dm, MODELEN (mp))
            if (MODETYPE (mp) == UNION_MODE)
               call enter_sm_decl (id, dm, params, intl (0))
            else
               call enter_sm_decl (id, dm, params, MODELEN (mp))
            call alloc_struct (mp, sizeof_mode (dm))
            if (MODESMLIST (mp) == LAMBDA) {
                MODESMLIST (mp) = dsget (SMSIZE)
                tail = MODESMLIST (mp)
                }
            else {
                SMSIBLING (tail) = dsget (SMSIZE)
                tail = SMSIBLING (tail)
                }
            SMSIBLING (tail) = LAMBDA
            SMSYM (tail) = id
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   }
if (state == ACCEPT) {
   EXIT3 (mp, tail, mode)
   }
gpst = state
return
end



subroutine enum_specifier (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer mp
integer v
integer findsym
pointer id
pointer makesym, enter_sibling_mode
ENTER1 (mp)
state = NOMATCH
if (Symbol == '{'c) {
   state = ACCEPT
   mp = enter_sibling_mode (Modetable, ENUM_MODE, 0)
   }
if (state == NOMATCH) {
   if (Symbol == IDSYM) {
      state = ACCEPT
      if (findsym (Symtext, id, IDCLASS) == NO
            || SYMLL (id) ~= Ll && Nsymbol == '{'c) {
         id = makesym (Symtext, ENSYMTYPE, Ll)
         mp = enter_sibling_mode (Modetable, ENUM_MODE, 0)
         SYMMODE (id) = mp
         }
      else if (SYMTYPE (id) ~= ENSYMTYPE) {
         SYNERR ("Already defined, but not as 'enum'"p)
         mp = enter_sibling_mode (Modetable, ENUM_MODE, 0)
         }
      else if (Nsymbol == '{'c
         && SYMMODE (id) ~= LAMBDA
         && MODESMLIST (SYMMODE (id)) ~= LAMBDA) {
         SYNERR ("Enum already defined"p)
         mp = enter_sibling_mode (Modetable, ENUM_MODE, 0)
         }
      else
         mp = SYMMODE (id)
      call getsym
      }
   }
if (state == NOMATCH) {
   SYNERR ("Name or left brace must follow 'enum'"p)
   state = ACCEPT
   mp = enter_sibling_mode (Modetable, ENUM_MODE, 0)
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == '{'c) {
      state = ACCEPT
      MODESMLIST (mp) = 1    # record mode as 'defined'
      v = 0
      CALL2 (mp, v)
      call getsym
      }
   if (state == ACCEPT) {
      call enum_declarator (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            RETURN2 (mp, v)
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      repeat {
         state = NOMATCH
         if (Symbol == ','c) {
            state = ACCEPT
            CALL2 (mp, v)
            call getsym
            }
         if (state == ACCEPT) {
            call enum_declarator (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  RETURN2 (mp, v)
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
      state = NOMATCH
      if (Symbol == '}'c) {
         state = ACCEPT
         call getsym
         }
      else {
         SYNERR ("Right brace required"p)
         state = ACCEPT
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
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         if (mp == LAMBDA)     #Something's wrong somewhere
            mp = Int_mode_ptr
         EXIT1 (mp)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine enum_declarator (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer mp
integer v
pointer id
pointer sdupl, new_sym
ENTER2 (mp, v)
state = NOMATCH
if (Symbol == IDSYM) {
   state = ACCEPT
   id = new_sym (Symtext, mp, STATIC_SC, NO,
                 Ll, 0, YES, COSYMTYPE)
   call getsym
   }
else {
   SYNERR ("Identifier expected"p)
   state = ACCEPT
   id = LAMBDA
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == '='c) {
      state = ACCEPT
      CALL1 (v)
      call getsym
      }
   if (state == ACCEPT) {
      call constant_expr (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            RETURN1 (v)
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
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         SYMOBJ (id) = v
         v += 1
         EXIT2 (mp, v)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine type_name (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer mode
integer sc
ENTER1 (mode)
call type_or_sc_spec (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (ACCEPT) {
      CALL2 (sc, mode)
      }
if (state == ACCEPT) {
   call decl_specifiers (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         RETURN2 (sc, mode)
         if (sc ~= DEFAULT_SC)
            SYNERR ("Storage class specifier illegal"p)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call abstract_declarator (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call create_saved_mode (mode)
         EXIT1 (mode)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine abstract_declarator (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer scnt, v
scnt = 0
repeat {
   state = NOMATCH
   if (Symbol == '*'c) {
      state = ACCEPT
      scnt += 1
      call getsym
      }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == '('c) {
      state = ACCEPT
      if (Nsymbol == ')'c)
         state = NOMATCH
      }
   if (state == ACCEPT) {
      state = NOMATCH
      if (Symbol == '('c) {
         state = ACCEPT
         call getsym
         }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call abstract_declarator (state)
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
      if (Symbol == ')'c) {
         state = ACCEPT
         call getsym
         }
      else {
         SYNERR ("Right paren required"p)
         state = ACCEPT
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
   repeat {
      state = NOMATCH
      if (Symbol == '('c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == ')'c) {
            state = ACCEPT
            call save_mode (FUNCTION_MODE, 0)
            call getsym
            }
         else {
            SYNERR ("Parameters not allowed"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (Symbol == '['c) {
            state = ACCEPT
            CALL1 (0)
            call getsym
            }
         if (state == ACCEPT) {
            call constant_expr (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (NOMATCH) {
                  RETURN1 (v)
                  v = 0
                  }
               when (ACCEPT) {
                  RETURN1 (v)
                  }
            select (state)
               when (NOMATCH)
                  state = ACCEPT
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            state = NOMATCH
            if (Symbol == ']'c) {
               state = ACCEPT
               call save_mode (ARRAY_MODE, v)
               call getsym
               }
            else {
               SYNERR ("Right bracket required"p)
               state = ACCEPT
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
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
   call empty (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         for (; scnt > 0; scnt -= 1)
            call save_mode (POINTER_MODE, 0)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine constant_expr (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer value
pointer p
ENTER1 (value)
call expr0 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (ACCEPT) {
      call gen_convert (Short_mode_ptr)
      call es_pop (p)
      if (SYMTYPE (p) == LITSYMTYPE)
         call get_lit_val (p, value, 1)
      else {
         SYNERR ("Constant expression required"p)
         value = 1
         }
      call dealloc_expr (p)
      EXIT1 (value)
      }
gpst = state
return
end



subroutine expression (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call expr0 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == ','c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call expr0 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element following ','"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (SEQ_OP)
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



subroutine expr0 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer op
call expr1 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      select (Symbol)
         when ('='c) {
            state = ACCEPT
            op = ASSIGN_OP
            call getsym
            }
         when (ANDAASYM) {
            state = ACCEPT
            op = ANDAA_OP
            call getsym
            }
         when (DIVAASYM) {
            state = ACCEPT
            op = DIVAA_OP
            call getsym
            }
         when (SUBAASYM) {
            state = ACCEPT
            op = SUBAA_OP
            call getsym
            }
         when (REMAASYM) {
            state = ACCEPT
            op = REMAA_OP
            call getsym
            }
         when (ORAASYM) {
            state = ACCEPT
            op = ORAA_OP
            call getsym
            }
         when (ADDAASYM) {
            state = ACCEPT
            op = ADDAA_OP
            call getsym
            }
         when (LSHIFTAASYM) {
            state = ACCEPT
            op = LSHIFTAA_OP
            call getsym
            }
         when (RSHIFTAASYM) {
            state = ACCEPT
            op = RSHIFTAA_OP
            call getsym
            }
         when (MULAASYM) {
            state = ACCEPT
            op = MULAA_OP
            call getsym
            }
         when (XORAASYM) {
            state = ACCEPT
            op = XORAA_OP
            call getsym
            }
      if (state == ACCEPT) {
         call expr0 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element following assignment"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (op)
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



subroutine expr1 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call expr2 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == '?'c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call expression (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element following '?'"p)
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == ':'c) {
            state = ACCEPT
            call getsym
            }
         else {
            SYNERR ("Colon required after '?'"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call expr2 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element following ':'"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (COND2_OP)
               call gen_oper (COND1_OP)
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



subroutine expr2 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call expr3 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == SORSYM) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call expr3 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element following '||'"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (SOR_OP)
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



subroutine expr3 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call expr4 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == SANDSYM) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call expr4 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element following '&&'"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (SAND_OP)
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



subroutine expr4 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call expr5 (state)
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
         call expr5 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element following '|'"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (OR_OP)
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



subroutine expr5 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call expr6 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == '^'c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call expr6 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element following '^'"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (XOR_OP)
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



subroutine expr6 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
call expr7 (state)
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
         call expr7 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element following '&'"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (AND_OP)
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



subroutine expr7 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer op
call expr8 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == EQSYM) {
         state = ACCEPT
         op = EQ_OP
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == NESYM) {
            state = ACCEPT
            op = NE_OP
            call getsym
            }
         }
      if (state == ACCEPT) {
         call expr8 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element in expression"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (op)
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



subroutine expr8 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer op
call expr9 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == '>'c) {
         state = ACCEPT
         op = GT_OP
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == '<'c) {
            state = ACCEPT
            op = LT_OP
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == GESYM) {
               state = ACCEPT
               op = GE_OP
               call getsym
               }
            if (state == NOMATCH) {
               if (Symbol == LESYM) {
                  state = ACCEPT
                  op = LE_OP
                  call getsym
                  }
               }
            }
         }
      if (state == ACCEPT) {
         call expr9 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element in expression"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (op)
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



subroutine expr9 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer op
call expr10 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == RSHIFTSYM) {
         state = ACCEPT
         op = RSHIFT_OP
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == LSHIFTSYM) {
            state = ACCEPT
            op = LSHIFT_OP
            call getsym
            }
         }
      if (state == ACCEPT) {
         call expr10 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element in expression"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (op)
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



subroutine expr10 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer op
call expr11 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == '+'c) {
         state = ACCEPT
         op = ADD_OP
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == '-'c) {
            state = ACCEPT
            op = SUB_OP
            call getsym
            }
         }
      if (state == ACCEPT) {
         call expr11 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element in expression"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (op)
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



subroutine expr11 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
integer op
call expr12 (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == '*'c) {
         state = ACCEPT
         op = MUL_OP
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == '/'c) {
            state = ACCEPT
            op = DIV_OP
            call getsym
            }
         if (state == NOMATCH) {
            if (Symbol == '%'c) {
               state = ACCEPT
               op = REM_OP
               call getsym
               }
            }
         }
      if (state == ACCEPT) {
         call expr12 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element in expression"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_oper (op)
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



subroutine expr12 (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer p
integer op, kluge
integer next_is_type, es_pop
integer wsize
pointer mode
longint sizeof_mode
state = NOMATCH
select (Symbol)
   when ('*'c) {
      state = ACCEPT
      op = DEREF_OP
      call getsym
      }
   when ('&'c) {
      state = ACCEPT
      op = REFTO_OP
      call getsym
      }
   when ('-'c) {
      state = ACCEPT
      op = NEG_OP
      call getsym
      }
   when ('!'c) {
      state = ACCEPT
      op = NOT_OP
      call getsym
      }
   when (INCSYM) {
      state = ACCEPT
      op = PREINC_OP
      call getsym
      }
   when (DECSYM) {
      state = ACCEPT
      op = PREDEC_OP
      call getsym
      }
   when ('~'c) {
      state = ACCEPT
      op = COMPL_OP
      call getsym
      }
if (state == ACCEPT) {
   call expr12 (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Illegal element in expression"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         call gen_oper (op)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
if (state == NOMATCH) {
   if (Symbol == SIZEOFSYM) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      state = NOMATCH
      if (Symbol == '('c) {
         state = ACCEPT
         if (next_is_type (0) == NO)
            state = NOMATCH
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == '('c) {
            state = ACCEPT
            CALL1 (mode)
            call getsym
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call type_name (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               RETURN1 (mode)
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == ')'c) {
            state = ACCEPT
            call gen_int (wsize (sizeof_mode (mode)))
            call getsym
            }
         else {
            SYNERR ("Right paren required"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         call expr12 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal 'sizeof' operand"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               p = es_pop (p)
               call gen_int (wsize (sizeof_mode (EXPMODE (p))))
               call dealloc_expr (p)
               }
         }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      if (Symbol == '('c) {
         state = ACCEPT
         if (next_is_type (0) == NO)
            state = NOMATCH
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == '('c) {
            state = ACCEPT
            kluge = NO
            CALL1 (mode)
            call getsym
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call type_name (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               RETURN1 (mode)
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
            SYNERR ("Right paren required"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == '?'c) {
            state = ACCEPT
            if (MODETYPE (SYMMODE (mode)) ~= POINTER_MODE
                  && MODETYPE (SYMMODE (mode)) ~= ARRAY_MODE
                  && MODETYPE (SYMMODE (mode)) ~= FUNCTION_MODE)
               kluge = YES
            call getsym
            }
         select (state)
            when (NOMATCH)
               state = ACCEPT
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call expr12 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element in expression"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               if (kluge == NO)
                  call gen_cast (mode)
               else
                  {
                  call create_mode (mode, POINTER_MODE, 0)
                  call gen_cast (mode)
                  call gen_oper (DEREF_OP)
                  }
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         call primary (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
         if (state == ACCEPT) {
            repeat {
               state = NOMATCH
               if (Symbol == INCSYM) {
                  state = ACCEPT
                  call gen_oper (POSTINC_OP)
                  call getsym
                  }
               if (state == NOMATCH) {
                  if (Symbol == DECSYM) {
                     state = ACCEPT
                     call gen_oper (POSTDEC_OP)
                     call getsym
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
         }
      }
   }
gpst = state
return
end



subroutine primary (gpst)
integer gpst
include 'c1_com.r.i'
integer state
pointer p, v, mp, plist
pointer alloc_temp, es_top
integer is_aggregate
state = NOMATCH
select (Symbol)
   when (IDSYM) {
      state = ACCEPT
      if (Nsymbol == '('c)
         call check_function_declaration
      else
         call check_declaration (IDCLASS)
      call getsym
      }
   when (CHARLITSYM) {
      state = ACCEPT
      call gen_lit (CHARLITSYM, Symtext, Symlen)
      call getsym
      }
   when (STRLITSYM) {
      state = ACCEPT
      call gen_lit (STRLITSYM, Symtext, Symlen)
      call getsym
      }
   when (SHORTLITSYM) {
      state = ACCEPT
      call gen_lit (SHORTLITSYM, Symtext, 0)
      call getsym
      }
   when (LONGLITSYM) {
      state = ACCEPT
      call gen_lit (LONGLITSYM, Symtext, 0)
      call getsym
      }
   when (DOUBLELITSYM) {
      state = ACCEPT
      call gen_lit (DOUBLELITSYM, Symtext, 0)
      call getsym
      }
   when ('('c) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call expression (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal element in expression"p)
               state = ACCEPT
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
            SYNERR ("Right paren required"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == '('c) {
         state = ACCEPT
         call es_top (v)
         if (SYMTYPE (v) == IDSYMTYPE)
            plist = SYMPLIST (v)
         else
            plist = LAMBDA
         call ck_fncall (v)
         call gen_oper (NULL_OP)
         if (MODETYPE (EXPMODE (v)) ~= FUNCTION_MODE)
            SYNERR ("Only functions can be called"p)
         mp = MODEPARENT (EXPMODE (v))
         if (mp ~= LAMBDA && is_aggregate (mp) == YES) {
            p = alloc_temp (mp)
            call gen_opnd (p)
            call gen_oper (PROC_CALL_ARG_OP)
            }
         call getsym
         }
      if (state == ACCEPT) {
         call expr0 (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call ck_fnarg (es_top (v))
               if (plist ~= LAMBDA) {
                  if (PARAMMODE (plist) ~= LAMBDA)
                     call gen_convert (PARAMMODE (plist))
                  plist = PARAMNEXT (plist)
                  }
               call gen_oper (PROC_CALL_ARG_OP)
               }
         if (state == ACCEPT) {
            repeat {
               state = NOMATCH
               if (Symbol == ','c) {
                  state = ACCEPT
                  call getsym
                  }
               if (state == ACCEPT) {
                  call expr0 (state)
                  select (state)
                     when (FAILURE) {
                        gpst = FAILURE
                        return
                        }
                     when (NOMATCH) {
                        SYNERR ("Illegal element in expression"p)
                        state = ACCEPT
                        }
                     when (ACCEPT) {
                        call ck_fnarg (es_top (v))
                        if (plist ~= LAMBDA) {
                           if (PARAMMODE (plist) ~= LAMBDA)
                              call gen_convert (PARAMMODE (plist))
                           plist = PARAMNEXT (plist)
                           }
                        call gen_oper (PROC_CALL_ARG_OP)
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
         select (state)
            when (NOMATCH)
               state = ACCEPT
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == ')'c) {
            state = ACCEPT
            call ck_fnend
            call gen_oper (PROC_CALL_OP)
            if (mp ~= LAMBDA && is_aggregate (mp) == YES) {
               call gen_opnd (p)
               call gen_oper (SEQ_OP)
               }
            call getsym
            }
         else {
            SYNERR ("Right paren required"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (Symbol == '['c) {
            state = ACCEPT
            call getsym
            }
         if (state == ACCEPT) {
            call expression (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (NOMATCH) {
                  SYNERR ("Illegal element in expression"p)
                  state = ACCEPT
                  }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            state = NOMATCH
            if (Symbol == ']'c) {
               state = ACCEPT
               call gen_index
               call getsym
               }
            else {
               SYNERR ("Right bracket required"p)
               state = ACCEPT
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         if (state == NOMATCH) {
            if (Symbol == '.'c) {
               state = ACCEPT
               call getsym
               }
            if (state == ACCEPT) {
               state = NOMATCH
               if (Symbol == IDSYM) {
                  state = ACCEPT
                  call check_declaration (SMCLASS)
                  call gen_oper (SELECT_OP)
                  call getsym
                  }
               else {
                  SYNERR ("'Struct' member required"p)
                  state = ACCEPT
                  }
               if (state ~= ACCEPT) {
                  gpst = FAILURE
                  return
                  }
               }
            if (state == NOMATCH) {
               if (Symbol == POINTSTOSYM) {
                  state = ACCEPT
                  call getsym
                  }
               if (state == ACCEPT) {
                  state = NOMATCH
                  if (Symbol == IDSYM) {
                     state = ACCEPT
                     call gen_oper (DEREF_OP)
                     call check_declaration (SMCLASS)
                     call gen_oper (SELECT_OP)
                     call getsym
                     }
                  else {
                     SYNERR ("'Struct' member required"p)
                     state = ACCEPT
                     }
                  if (state ~= ACCEPT) {
                     gpst = FAILURE
                     return
                     }
                  }
               }
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
