


subroutine ratfor_code (gpst)
integer gpst
include 'rp_com.i'
integer state
integer ctoi
integer num, i
procedure do_label {
  i = 1
  num = ctoi (Symtext, i)
  if (num > START_LAB)
     SYNERR ("Possible label conflict"p)
  call outnum (num, CODE)
  }
state = NOMATCH
if (Symbol == NUMBERSYM) {
   state = ACCEPT
   do_label
   call getsym
   }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
      state = NOMATCH
      if (Symbol == NUMBERSYM) {
         state = ACCEPT
         do_label
         call getsym
         }
      if (state == ACCEPT) {
         repeat {
            state = NOMATCH
            if (Symbol == NEWLINE) {
               state = ACCEPT
               call getsym
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
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call declaration (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         SYNERR ("Label not allowed on declaration"p)
         }
   if (state == NOMATCH) {
      call statement (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      if (state == NOMATCH) {
         if (Symbol == '}'c) {
            state = ACCEPT
            }
         if (state == NOMATCH) {
            if (Symbol == EOF) {
               state = ACCEPT
               SYNERR ("Unexpected EOF"p)
               }
            }
         }
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
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
   call declaration (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   if (state == NOMATCH) {
      call statement (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
      }
   if (state == ACCEPT) {
      state = NOMATCH
      if (Symbol == ';'c) {
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
      repeat {
         state = NOMATCH
         if (Symbol == NEWLINE) {
            state = ACCEPT
            call getsym
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



subroutine declaration (gpst)
integer gpst
include 'rp_com.i'
integer state
procedure check_missing_end {
   if (First_stmt == YES)
      SYNERR ("Missing 'end' statement"p)
    }
state = NOMATCH
select (Symbol)
   when (SUBROUTINESYM) {
      state = ACCEPT
      check_missing_end
      call outtab (DECL)
      call outstr (Symtext, DECL)
      call outch (' 'c, DECL)
      call getsym
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == IDSYM) {
            state = ACCEPT
            call outstr (Symtext, DECL)
            call save_module_name
            call getsym
            }
         else {
            SYNERR ("Missing subroutine name"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call decl_other (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (FUNCTIONSYM) {
      state = ACCEPT
      check_missing_end
      call outtab (DECL)
      call outstr (Symtext, DECL)
      call outch (' 'c, DECL)
      call getsym
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == IDSYM) {
            state = ACCEPT
            call outstr (Symtext, DECL)
            call save_module_name
            call getsym
            }
         else {
            SYNERR ("Missing function name"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call decl_other (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (BLOCKDATASYM) {
      state = ACCEPT
      check_missing_end
      call outtab (DECL)
      call outstr (Symtext, DECL)
      call scopy (".data."s, 1, Module_name, 1)
      call scopy (Module_name, 1, Module_long_name, 1)
      call getsym
      if (state == ACCEPT) {
         call decl_other (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (TYPESYM) {
      state = ACCEPT
      call outtab (DECL)
      call outstr (Symtext, DECL)
      call outch (' 'c, DECL)
      call getsym
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == '*'c) {
            state = ACCEPT
            call outstr ('* 's, DECL)
            call getsym
            }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == NUMBERSYM) {
               state = ACCEPT
               call outstr (Symtext, DECL)
               call outch (' 'c, DECL)
               call getsym
               }
            else {
               SYNERR ("Missing integer in type size"p)
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
         state = NOMATCH
         if (Symbol == FUNCTIONSYM) {
            state = ACCEPT
            check_missing_end
            call outstr (Symtext, DECL)
            call outch (' 'c, DECL)
            call getsym
            }
         else {
            call begin_decl
            }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == IDSYM) {
               state = ACCEPT
               call outstr (Symtext, DECL)
               call save_module_name
               call getsym
               }
            else {
               SYNERR ("Missing function name"p)
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
         call decl_other (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (MISCDECLSYM) {
      state = ACCEPT
      call begin_decl
      call outtab (DECL)
      call outstr (Symtext, DECL)
      call outch (' 'c, DECL)
      call getsym
      if (state == ACCEPT) {
         call decl_other (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (STMTFUNCSYM) {
      state = ACCEPT
      call begin_decl
      call outtab (DATA)
      call getsym
      if (state == ACCEPT) {
         call data_other (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (DATASYM) {
      state = ACCEPT
      call begin_decl
      call outtab (DATA)
      call outstr (Symtext, DATA)
      call outch (' 'c, DATA)
      call getsym
      if (state == ACCEPT) {
         call data_other (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (EQUIVALENCESYM) {
      state = ACCEPT
      call begin_decl
      call outtab (EQUIV)
      call outstr (Symtext, EQUIV)
      call outch (' 'c, EQUIV)
      call getsym
      if (state == ACCEPT) {
         call equiv_other (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (LINKAGESYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call linkage_decl (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (LOCALSYM) {
      state = ACCEPT
      call begin_decl
      call getsym
      if (state == ACCEPT) {
         call local_decl (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (PROCEDURESYM) {
      state = ACCEPT
      call begin_decl
      call getsym
      if (state == ACCEPT) {
         call procedure_decl (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               state = ACCEPT
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (DEFINESYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == '('c) {
            state = ACCEPT
            call enter_definition
            call getsym
            }
         else {
            SYNERR ("Left paren must follow 'define'"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (UNDEFINESYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == '('c) {
            state = ACCEPT
            call remove_definition
            call getsym
            }
         else {
            SYNERR ("Left paren must follow 'undefine'"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      }
   when (STRINGSYM) {
      state = ACCEPT
      call begin_decl
      call getsym
      if (state == ACCEPT) {
         call str_decl (state)
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
   when (STRINGTABLESYM) {
      state = ACCEPT
      call begin_decl
      call getsym
      if (state == ACCEPT) {
         call strtable_decl (state)
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
   when (INCLUDESYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call include_decl (state)
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
   when (ENDSYM) {
      state = ACCEPT
      call end_module
      call getsym
      if (state == ACCEPT) {
         call end_decl (state)
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



subroutine include_decl (gpst)
integer gpst
include 'rp_com.i'
integer state
file_des open
character filename (MAXTOK)
if (Level >= MAXLEVEL)
   FATAL ("Includes nested too deeply"p)
state = NOMATCH
if (Symbol == IDSYM) {
   state = ACCEPT
   call scopy (Symtext, 1, filename, 1)
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == STRCONSTANTSYM) {
      state = ACCEPT
      call scopy (Symtext, 1, filename, 1)
      call getsym
      }
   }
select (state)
   when (NOMATCH) {
      SYNERR ("Missing file name"p)
      state = ACCEPT
      }
   when (ACCEPT) {
      Level += 1
      Line_number (Level) = 0
      Infile (Level) = open (filename, READ)
      if (Infile (Level) == ERR) {
         ERROR_SYMBOL (filename)
         SYNERR ("Can't open 'include' file"p)
         Level -= 1
         }
      }
gpst = state
return
end



subroutine linkage_decl (gpst)
integer gpst
include 'rp_com.i'
integer state
state = NOMATCH
if (Symbol == IDSYM) {
   state = ACCEPT
   call getsym
   }
else {
   SYNERR ("Identifier required"p)
   state = ACCEPT
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
            call getsym
            }
         else {
            SYNERR ("Identifier required"p)
            state = ACCEPT
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



subroutine local_decl (gpst)
integer gpst
include 'rp_com.i'
integer state
state = NOMATCH
if (Symbol == IDSYM) {
   state = ACCEPT
   call setup_local_id
   call getsym
   }
else {
   SYNERR ("Identifier required"p)
   state = ACCEPT
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
            call setup_local_id
            call getsym
            }
         else {
            SYNERR ("Identifier required"p)
            state = ACCEPT
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



subroutine procedure_decl (gpst)
integer gpst
include 'rp_com.i'
integer state
integer skip_lab, i, j
integer ctoi
pointer hd
state = NOMATCH
if (Symbol == PROCIDSYM) {
   state = ACCEPT
   hd = Proc_head
   if (Mem (hd + PROCFWD) == NO) {
      SYNERR ("Procedure defined twice"p)
      Mem (hd + PROCFWD) = YES
      }
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == IDSYM) {
      state = ACCEPT
      call setup_proc_head (hd)
      call getsym
      }
   }
if (state == NOMATCH) {
   call setup_proc_head (hd)
   SYNERR ("Procedure name required"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
   if (Symbol == '('c) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      state = NOMATCH
      if (Symbol == IDSYM) {
         state = ACCEPT
         if (Mem (hd + PROCFWD) == NO)
            call enter_proc_param (hd)
         call getsym
         }
      else {
         SYNERR ("Identifier required"p)
         state = ACCEPT
         }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
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
               if (Mem (hd + PROCFWD) == NO)
                  call enter_proc_param (hd)
               call getsym
               }
            else {
               SYNERR ("Identifier required"p)
               state = ACCEPT
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
      if (Symbol == ')'c) {
         state = ACCEPT
         call getsym
         }
      else {
         SYNERR ("Missing right paren"p)
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
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
   if (Symbol == RECURSIVESYM) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      state = NOMATCH
      if (Symbol == NUMBERSYM) {
         state = ACCEPT
         i = 1
         j = ctoi (Symtext, i)
         if (Mem (hd + PROCFWD) == YES
           && Mem (hd + PROCRECURSION) ~= j)
            SYNERR ("Conflicting proc declaration"p)
         else
            Mem (hd + PROCRECURSION) = j
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
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   if (Mem (hd + PROCFWD) == NO)
      call gen_proc_control_decl (hd)
   state = NOMATCH
   if (Symbol == FORWARDSYM) {
      state = ACCEPT
      Mem (hd + PROCFWD) = YES
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == '{'c) {
         state = ACCEPT
         Mem (hd + PROCFWD) = NO
         skip_lab = 0    # let outgo generate it
         call outgo (skip_lab)
         call gen_proc_entry (hd)
         call enter_scope
         call create_proc_scope (hd)
         Brace_count += 1
         call getsym
         }
      else {
         call enter_scope
         SYNERR ("Left brace must follow procedure"p)
         state = ACCEPT
         }
      if (state == ACCEPT) {
         repeat {
            state = NOMATCH
            if (Symbol == NEWLINE) {
               state = ACCEPT
               call getsym
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
            call ratfor_code (state)
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
         state = NOMATCH
         if (Symbol == '}'c) {
            state = ACCEPT
            Brace_count -= 1
            call outgo (Mem (hd + PROCRETURN))
            call outnum (skip_lab, CODE)
            call exit_scope
            call getsym
            }
         else {
            call exit_scope
            SYNERR ("Missing right brace"p)
            state = ACCEPT
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



subroutine str_decl (gpst)
integer gpst
include 'rp_com.i'
integer state
character strname (MAXTOK)
integer i
state = NOMATCH
if (Symbol == IDSYM) {
   state = ACCEPT
   call scopy (Symtext, 1, strname, 1)
   call getsym
   }
else {
   SYNERR ("Identifier required"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == STRCONSTANTSYM) {
      state = ACCEPT
      call gen_int_decl (strname, Symlen + 1)
      for (i = 1; Symtext (i) ~= EOS; i += 1)
         call gen_char_data (strname, i, Symtext (i))
      call gen_char_data (strname, i, EOS)
      call gen_data_end
      call getsym
      }
   else {
      SYNERR ("String constant required"p)
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



subroutine strtable_decl (gpst)
integer gpst
include 'rp_com.i'
integer state
character n1 (MAXTOK), n2 (MAXTOK)
integer spos (MAXSTABLE)
integer ln1, ln2, i, num
integer gctoi
procedure putstr {
   for (i = 1; Symtext (i) ~= EOS; i += 1) {
      call gen_char_data (n2, ln2+1, Symtext (i))
      ln2 += 1
      }
   call gen_char_data (n2, ln2+1, EOS)
   ln2 += 1
   }
procedure putnum {
   call gen_data_item (n2, ln2+1, num)
   ln2 += 1
   }
procedure strsep {
   if (ln1 < MAXSTABLE) {
      ln1 += 1
      spos (ln1) = ln2 + 1
      }
   else
      SYNERR ("Too many string table elements"p)
   }
ln1 = 1; spos (1) = 1
ln2 = 0
state = NOMATCH
if (Symbol == IDSYM) {
   state = ACCEPT
   call scopy (Symtext, 1, n1, 1)
   call getsym
   }
else {
   n1 (1) = EOS
   SYNERR ("Identifier required"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == ','c) {
      state = ACCEPT
      call getsym
      }
   else {
      SYNERR ("Comma required"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == IDSYM) {
      state = ACCEPT
      call scopy (Symtext, 1, n2, 1)
      call getsym
      }
   else {
      n2 (1) = EOS
      SYNERR ("Identifier required"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
   if (Symbol == ','c) {
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
   state = NOMATCH
   if (Symbol == '/'c) {
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
   repeat {
      state = NOMATCH
      if (Symbol == '/'c) {
         state = ACCEPT
         strsep
         call getsym
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
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
   if (Symbol == STRCONSTANTSYM) {
      state = ACCEPT
      putstr
      call getsym
      }
   if (state == NOMATCH) {
      if (Symbol == '-'c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == NUMBERSYM) {
            state = ACCEPT
            i = 1
            num = -gctoi (Symtext, i, 10)
            putnum
            call getsym
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (Symbol == ':'c) {
            state = ACCEPT
            call getsym
            }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == NUMBERSYM) {
               state = ACCEPT
               i = 1
               num = gctoi (Symtext, i, 8)
               putnum
               call getsym
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         if (state == NOMATCH) {
            if (Symbol == NUMBERSYM) {
               state = ACCEPT
               i = 1
               num = gctoi (Symtext, i, 10)
               putnum
               call getsym
               }
            }
         }
      }
   if (state == NOMATCH) {
      SYNERR ("Integer or string required"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == ','c) {
         state = ACCEPT
         call getsym
         }
      if (state == NOMATCH) {
         if (Symbol == '/'c) {
            state = ACCEPT
            strsep
            call getsym
            }
         }
      if (state == ACCEPT) {
         repeat {
            state = NOMATCH
            if (Symbol == NEWLINE) {
               state = ACCEPT
               call getsym
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
            state = NOMATCH
            if (Symbol == '/'c) {
               state = ACCEPT
               strsep
               call getsym
               }
            if (state == ACCEPT) {
               repeat {
                  state = NOMATCH
                  if (Symbol == NEWLINE) {
                     state = ACCEPT
                     call getsym
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
            } until (state ~= ACCEPT)
         select (state)
            when (NOMATCH)
               state = ACCEPT
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         state = NOMATCH
         if (Symbol == '-'c) {
            state = ACCEPT
            call getsym
            }
         if (state == ACCEPT) {
            state = NOMATCH
            if (Symbol == NUMBERSYM) {
               state = ACCEPT
               i = 1
               num = -gctoi (Symtext, i, 10)
               putnum
               call getsym
               }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         if (state == NOMATCH) {
            if (Symbol == ':'c) {
               state = ACCEPT
               call getsym
               }
            if (state == ACCEPT) {
               state = NOMATCH
               if (Symbol == NUMBERSYM) {
                  state = ACCEPT
                  i = 1
                  num = gctoi (Symtext, i, 8)
                  putnum
                  call getsym
                  }
               if (state ~= ACCEPT) {
                  gpst = FAILURE
                  return
                  }
               }
            if (state == NOMATCH) {
               if (Symbol == NUMBERSYM) {
                  state = ACCEPT
                  i = 1
                  num = gctoi (Symtext, i, 10)
                  putnum
                  call getsym
                  }
               if (state == NOMATCH) {
                  if (Symbol == STRCONSTANTSYM) {
                     state = ACCEPT
                     putstr
                     call getsym
                     }
                  }
               }
            }
         if (state == NOMATCH) {
            SYNERR ("Integer or string required"p)
            state = ACCEPT
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
call gen_data_end
call gen_data_item (n1, 1, ln1)
for (i = 1; i <= ln1; i += 1)
   call gen_data_item (n1, i+1, spos (i))
call gen_data_end
call gen_int_decl (n1, ln1 + 1)
call gen_int_decl (n2, ln2)
gpst = state
return
end



subroutine end_decl (gpst)
integer gpst
include 'rp_com.i'
integer state
call gen_proc_return
Dispatch_flag = NO # Don't suppress code
call outtab (CODE)
call outstr ("END"s, CODE)
call outdon (CODE)
if (Brace_count > 0)
   SYNERR ("Missing right brace"p)
Brace_count = 0
call rewind (Outfile (EQUIV))
call fcopy (Outfile (EQUIV), Fortfile)
call rewind (Outfile (EQUIV))
call trunc (Outfile (EQUIV))
call rewind (Outfile (DATA))
call fcopy (Outfile (DATA), Fortfile)
call rewind (Outfile (DATA))
call trunc (Outfile (DATA))
call rewind (Outfile (CODE))
if (ARG_PRESENT (g))
   call cleanup_gotos
else
   call fcopy (Outfile (CODE), Fortfile)
call rewind (Outfile (CODE))
call trunc (Outfile (CODE))
call code_other (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
gpst = state
return
end



subroutine statement (gpst)
integer gpst
include 'rp_com.i'
integer state
state = NOMATCH
select (Symbol)
   when (IFSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call if_stmt (state)
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
         call for_stmt (state)
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
         call while_stmt (state)
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
   when (REPEATSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call repeat_stmt (state)
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
      call getsym
      if (state == ACCEPT) {
         call case_stmt (state)
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
   when (SELECTSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call select_stmt (state)
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
   when (PROCIDSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call procedure_stmt (state)
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
         call do_stmt (state)
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
   when ('{'c) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call compound_stmt (state)
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
   when (RETURNSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call return_stmt (state)
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
   when (BREAKSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call break_stmt (state)
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
   when (NEXTSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call next_stmt (state)
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
   when (STOPSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call stop_stmt (state)
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
   when (GOTOSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call goto_stmt (state)
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
   when (CALLSYM) {
      state = ACCEPT
      call getsym
      if (state == ACCEPT) {
         call call_stmt (state)
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
   when ('%'c) {
      state = ACCEPT
      if (state == ACCEPT) {
         call escape_stmt (state)
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
   when (';'c) {
      state = ACCEPT
      call begin_stmt
      }
   when (ELSESYM) {
      state = ACCEPT
      SYNERR ("'else' without matching 'if' or 'select'"p)
      call getsym
      }
   when (UNTILSYM) {
      state = ACCEPT
      SYNERR ("'until' without matching 'repeat'"p)
      call getsym
      }
   when (')'c) {
      state = ACCEPT
      SYNERR ("Unbalanced parentheses"p)
      call getsym
      }
   when (WHENSYM) {
      state = ACCEPT
      SYNERR ("'when' without matching 'select'"p)
      call getsym
      }
   when (IFANYSYM) {
      state = ACCEPT
      SYNERR ("'ifany' without matching 'select'"p)
      call getsym
      }
if (state == NOMATCH) {
   call other_stmt (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
   }
gpst = state
return
end



subroutine if_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer lab, neglab
integer labgen
call begin_stmt
neglab = labgen (1)
False_branch = neglab
call par_bool_expr (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (NOMATCH) {
      SYNERR ("Missing condition"p)
      state = ACCEPT
      }
   when (ACCEPT) {
      Indent += 1
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call ratfor_code (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Improper conditional statement"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         Indent -= 1
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == ELSESYM) {
      state = ACCEPT
      Indent += 1
      lab = 0
      call outgo (lab)   # outgo will make label
      call outnum (neglab, CODE)
      call getsym
      }
   else {
      call outnum (neglab, CODE)
      }
   if (state == ACCEPT) {
      repeat {
         state = NOMATCH
         if (Symbol == NEWLINE) {
            state = ACCEPT
            call getsym
            }
         } until (state ~= ACCEPT)
      select (state)
         when (NOMATCH)
            state = ACCEPT
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call ratfor_code (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            Indent -= 1
            call outnum (lab, CODE)
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
gpst = state
return
end



subroutine for_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer test_lab
integer labgen
pointer expr
pointer expr_stack_pop
Loop_sp += 1
if (Loop_sp > MAXLOOPS)
   FATAL ("loops nested too deeply"p)
Next_lab (Loop_sp) = labgen (1)
Break_lab (Loop_sp) = labgen (1)
test_lab = labgen (1)
state = NOMATCH
if (Symbol == '('c) {
   state = ACCEPT
   call getsym
   }
else {
   SYNERR ("Missing ( in for clause"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call ratfor_code (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Illegal statement in 'for'"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         call outgo (test_lab)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == ';'c) {
      state = ACCEPT
      expr = 0
      }
   if (state == NOMATCH) {
      call bool_expr (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            expr = expr_stack_pop (expr)
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
   if (Symbol == ';'c) {
      state = ACCEPT
      call outnum (Next_lab (Loop_sp), CODE)
      call getsym
      }
   else {
      SYNERR ("Missing ; after condition"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
   if (Symbol == ')'c) {
      state = ACCEPT
      }
   if (state == NOMATCH) {
      call ratfor_code (state)
      select (state)
         when (FAILURE) {
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
      call outnum (test_lab, CODE)
      if (expr ~= 0) {
         call expr_stack_push (expr)
         call generate_expr_code _
             (Break_lab (Loop_sp))
          }
      Indent += 1
      call getsym
      }
   else {
      SYNERR ("Missing ) in for clause"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call ratfor_code (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         Indent -= 1
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
call outgo (Next_lab (Loop_sp))
call outnum (Break_lab (Loop_sp), CODE)
Loop_sp -= 1
gpst = state
return
end



subroutine while_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer labgen
call begin_stmt
Loop_sp += 1
if (Loop_sp > MAXLOOPS)
   FATAL ("loops nested too deeply"p)
Next_lab (Loop_sp) = labgen (1)
Break_lab (Loop_sp) = labgen (1)
False_branch = Break_lab (Loop_sp)
call outnum (Next_lab (Loop_sp), CODE)
call par_bool_expr (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (NOMATCH) {
      SYNERR ("Missing condition"p)
      state = ACCEPT
      }
   when (ACCEPT) {
      Indent += 1
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call ratfor_code (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         Indent -= 1
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
call outgo (Next_lab (Loop_sp))
call outnum (Break_lab (Loop_sp), CODE)
Loop_sp -= 1
gpst = state
return
end



subroutine repeat_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer loop_lab
integer labgen
call begin_stmt
Loop_sp += 1
if (Loop_sp > MAXLOOPS)
   FATAL ("loops nested too deeply"p)
Next_lab (Loop_sp) = 0
Break_lab (Loop_sp) = 0
loop_lab = labgen (1)
call outnum (loop_lab, CODE)
Indent += 1
repeat {
   state = NOMATCH
   if (Symbol == NEWLINE) {
      state = ACCEPT
      call getsym
      }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   call ratfor_code (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         Indent -= 1
         call outnum (Next_lab (Loop_sp), CODE)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == UNTILSYM) {
      state = ACCEPT
      call begin_stmt
      False_branch = loop_lab
      call getsym
      }
   else {
      call outgo (loop_lab)
      }
   if (state == ACCEPT) {
      repeat {
         state = NOMATCH
         if (Symbol == NEWLINE) {
            state = ACCEPT
            call getsym
            }
         } until (state ~= ACCEPT)
      select (state)
         when (NOMATCH)
            state = ACCEPT
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call par_bool_expr (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            SYNERR ("Missing condition"p)
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
   }
call outnum (Break_lab (Loop_sp), CODE)
Loop_sp -= 1
gpst = state
return
end



subroutine par_bool_expr (gpst)
integer gpst
include 'rp_com.i'
integer state
state = NOMATCH
if (Symbol == '('c) {
   state = ACCEPT
   call getsym
   }
else {
   SYNERR ("Left parenthesis required"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   call bool_expr (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Illegal condition"p)
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
      SYNERR ("Missing right parenthesis"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
call generate_expr_code (False_branch)
gpst = state
return
end



subroutine bool_expr (gpst)
integer gpst
include 'rp_com.i'
integer state
call bool_term (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
      state = NOMATCH
      if (Symbol == ORIFSYM) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call bool_term (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call enter_operator (ORIFSYM)
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (Symbol == '|'c) {
            state = ACCEPT
            call getsym
            }
         if (state == ACCEPT) {
            call bool_term (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  if (ARG_PRESENT (s))
                     call enter_operator (ORIFSYM)
                  else
                     call enter_operator ('|'c)
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
   }
gpst = state
return
end



subroutine bool_term (gpst)
integer gpst
include 'rp_com.i'
integer state
call bool_factor (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
      state = NOMATCH
      if (Symbol == ANDIFSYM) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call bool_factor (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call enter_operator (ANDIFSYM)
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (Symbol == '&'c) {
            state = ACCEPT
            call getsym
            }
         if (state == ACCEPT) {
            call bool_factor (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  if ARG_PRESENT (s)
                     call enter_operator (ANDIFSYM)
                  else
                     call enter_operator ('&'c)
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
   }
gpst = state
return
end



subroutine bool_factor (gpst)
integer gpst
include 'rp_com.i'
integer state
repeat {
   state = NOMATCH
   if (Symbol == NEWLINE) {
      state = ACCEPT
      call getsym
      }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == NOTSYM) {
      state = ACCEPT
      call getsym
      }
   if (state == ACCEPT) {
      call bool_factor (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call enter_operator (NOTSYM)
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      call bool_primary (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
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



subroutine bool_primary (gpst)
integer gpst
include 'rp_com.i'
integer state
call bool_operand (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
      state = NOMATCH
      if (Symbol == EQSYM) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call bool_operand (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (ACCEPT) {
               call enter_operator (EQSYM)
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         }
      if (state == NOMATCH) {
         if (Symbol == NESYM) {
            state = ACCEPT
            call getsym
            }
         if (state == ACCEPT) {
            call bool_operand (state)
            select (state)
               when (FAILURE) {
                  gpst = FAILURE
                  return
                  }
               when (ACCEPT) {
                  call enter_operator (NESYM)
                  }
            if (state ~= ACCEPT) {
               gpst = FAILURE
               return
               }
            }
         if (state == NOMATCH) {
            if (Symbol == GTSYM) {
               state = ACCEPT
               call getsym
               }
            if (state == ACCEPT) {
               call bool_operand (state)
               select (state)
                  when (FAILURE) {
                     gpst = FAILURE
                     return
                     }
                  when (ACCEPT) {
                     call enter_operator (GTSYM)
                     }
               if (state ~= ACCEPT) {
                  gpst = FAILURE
                  return
                  }
               }
            if (state == NOMATCH) {
               if (Symbol == LTSYM) {
                  state = ACCEPT
                  call getsym
                  }
               if (state == ACCEPT) {
                  call bool_operand (state)
                  select (state)
                     when (FAILURE) {
                        gpst = FAILURE
                        return
                        }
                     when (ACCEPT) {
                        call enter_operator (LTSYM)
                        }
                  if (state ~= ACCEPT) {
                     gpst = FAILURE
                     return
                     }
                  }
               if (state == NOMATCH) {
                  if (Symbol == GESYM) {
                     state = ACCEPT
                     call getsym
                     }
                  if (state == ACCEPT) {
                     call bool_operand (state)
                     select (state)
                        when (FAILURE) {
                           gpst = FAILURE
                           return
                           }
                        when (ACCEPT) {
                           call enter_operator (GESYM)
                           }
                     if (state ~= ACCEPT) {
                        gpst = FAILURE
                        return
                        }
                     }
                  if (state == NOMATCH) {
                     if (Symbol == LESYM) {
                        state = ACCEPT
                        call getsym
                        }
                     if (state == ACCEPT) {
                        call bool_operand (state)
                        select (state)
                           when (FAILURE) {
                              gpst = FAILURE
                              return
                              }
                           when (ACCEPT) {
                              call enter_operator (LESYM)
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



subroutine bool_operand (gpst)
integer gpst
include 'rp_com.i'
integer state
repeat {
   state = NOMATCH
   if (Symbol == NEWLINE) {
      state = ACCEPT
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
      call getsym
      }
   if (state == ACCEPT) {
      call bool_expr (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            SYNERR ("Improper Boolean expression"p)
            state = ACCEPT
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      repeat {
         state = NOMATCH
         if (Symbol == NEWLINE) {
            state = ACCEPT
            call getsym
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
      if (Symbol == ')'c) {
         state = ACCEPT
         call getsym        # do this for stacc
         call check_last_for_boolean
         }
      else {
         SYNERR ("Missing right parenthesis"p)
         state = ACCEPT
         }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      call simple_bool_expr (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            SYNERR ("Improper Boolean expression"p)
            state = ACCEPT
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



subroutine select_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer int_select, sc, l, outlab, testlab
integer slab (MAXSEL), stext (MAXSEL)
integer stype (MAXSEL)
integer labgen
character tempvar (10)
pointer p
pointer expr_stack_pop
call begin_stmt
sc = 0
outlab = 0
testlab = labgen (1)
state = NOMATCH
if (Symbol == '('c) {
   state = ACCEPT
   int_select = YES
   call vargen (tempvar)
   call gen_int_decl (tempvar, 0)
   call outtab (CODE)
   call outstr (tempvar, CODE)
   call outch ('='c, CODE)
   call getsym
   }
else {
   int_select = NO
   tempvar (1) = EOS  # just in case
   }
if (state == ACCEPT) {
   call simple_bool_expr (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Illegal expression"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         call gen_expr (expr_stack_pop (p))
         call outdon (CODE)
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
      SYNERR ("Missing right parenthesis"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
select (state)
   when (NOMATCH) {
      state = ACCEPT
      call outgo (testlab)
      }
   when (ACCEPT) {
      call outgo (testlab)
      }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
      state = NOMATCH
      if (Symbol == WHENSYM) {
         state = ACCEPT
         l = labgen (1)
         call outnum (l, CODE)
         call getsym
         }
      if (state == ACCEPT) {
         state = NOMATCH
         if (Symbol == '('c) {
            state = ACCEPT
            call getsym
            }
         else {
            SYNERR ("Missing left paren after 'when'"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call bool_expr (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal expression"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               if (sc >= MAXSEL)
                  FATAL ("Too many 'select' alternatives"p)
               sc += 1
               slab (sc) = l
               stext (sc) = expr_stack_pop (p)
               if (int_select == YES)
                  call setup_when (stext (sc),
                            stype (sc), tempvar)
               else
                  stype (sc) = IDSYM
               }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         repeat {
            state = NOMATCH
            if (Symbol == NEWLINE) {
               state = ACCEPT
               call getsym
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
            state = NOMATCH
            if (Symbol == ','c) {
               state = ACCEPT
               call getsym
               }
            if (state == ACCEPT) {
               call bool_expr (state)
               select (state)
                  when (FAILURE) {
                     gpst = FAILURE
                     return
                     }
                  when (NOMATCH) {
                     SYNERR ("Illegal expression"p)
                     state = ACCEPT
                     }
                  when (ACCEPT) {
                     if (sc >= MAXSEL)
                        FATAL ("Too many SELECT alternatives"p)
                     sc += 1
                     slab (sc) = l
                     stext (sc) = expr_stack_pop (p)
                     if (int_select == YES)
                        call setup_when (stext (sc),
                                  stype (sc), tempvar)
                     else
                        stype (sc) = IDSYM
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
         if (Symbol == ')'c) {
            state = ACCEPT
            Indent += 1
            call getsym
            }
         else {
            SYNERR ("Missing right parenthesis"p)
            state = ACCEPT
            }
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         repeat {
            state = NOMATCH
            if (Symbol == NEWLINE) {
               state = ACCEPT
               call getsym
               }
            } until (state ~= ACCEPT)
         select (state)
            when (NOMATCH)
               state = ACCEPT
         if (state ~= ACCEPT) {
            gpst = FAILURE
            return
            }
         call ratfor_code (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Illegal statement"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               Indent -= 1
               call outgo (outlab)
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
   if (Symbol == IFANYSYM) {
      state = ACCEPT
      call outnum (outlab, CODE)
      outlab = 0
      Indent += 1
      call getsym
      }
   if (state == ACCEPT) {
      repeat {
         state = NOMATCH
         if (Symbol == NEWLINE) {
            state = ACCEPT
            call getsym
            }
         } until (state ~= ACCEPT)
      select (state)
         when (NOMATCH)
            state = ACCEPT
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call ratfor_code (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            SYNERR ("Illegal statement after 'ifany'"p)
            }
         when (ACCEPT) {
            Indent -= 1
            call outgo (outlab)
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
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call outnum (testlab, CODE)
   call gen_select_code (sc, slab, stext,
          stype, tempvar)
   state = NOMATCH
   if (Symbol == ELSESYM) {
      state = ACCEPT
      Indent += 1
      call getsym
      }
   if (state == ACCEPT) {
      repeat {
         state = NOMATCH
         if (Symbol == NEWLINE) {
            state = ACCEPT
            call getsym
            }
         } until (state ~= ACCEPT)
      select (state)
         when (NOMATCH)
            state = ACCEPT
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call ratfor_code (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            SYNERR ("Illegal statement"p)
            state = ACCEPT
            }
         when (ACCEPT) {
            Indent -= 1
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
call outnum (outlab, CODE)
gpst = state
return
end



subroutine procedure_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
pointer hd, p
call begin_stmt
hd = Proc_head
p = Mem (hd + PROCPARAMS)
state = NOMATCH
if (Symbol == '('c) {
   state = ACCEPT
   call getsym
   }
if (state == ACCEPT) {
   call simple_bool_expr (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         SYNERR ("Expression required"p)
         state = ACCEPT
         }
      when (ACCEPT) {
         call gen_param (p)
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == ','c) {
         state = ACCEPT
         call getsym
         }
      if (state == ACCEPT) {
         call simple_bool_expr (state)
         select (state)
            when (FAILURE) {
               gpst = FAILURE
               return
               }
            when (NOMATCH) {
               SYNERR ("Expression required"p)
               state = ACCEPT
               }
            when (ACCEPT) {
               call gen_param (p)
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
   if (Symbol == ')'c) {
      state = ACCEPT
      call getsym
      }
   else {
      SYNERR ("Missing right paren"p)
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
if (p ~= 0)
   SYNERR ("Too many parameters specified"p)
call gen_proc_call (hd)
gpst = state
return
end



subroutine case_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer range_lab, start_lab, num_stmts
integer esc_lab, i
integer labgen
character casevar (MAXTOK)
call begin_stmt
state = NOMATCH
if (Symbol == IDSYM) {
   state = ACCEPT
   call scopy (Symtext, 1, casevar, 1)
   range_lab = labgen (1)
   esc_lab = labgen (1)
   call outgo (range_lab)
   start_lab = labgen (MAXCASEALTS) - 1
   num_stmts = 0
   call getsym
   }
else {
   SYNERR ("Missing variable after case"p)
   state = ACCEPT
   }
if (state == ACCEPT) {
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
   if (Symbol == '{'c) {
      state = ACCEPT
      Brace_count += 1
      Indent += 1
      call getsym
      }
   else {
      SYNERR ("Expected compound statement"p)
      state = ACCEPT
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
      call outnum (start_lab + num_stmts + 1, CODE)
      call ratfor_code (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            call outgo (esc_lab)
            num_stmts += 1
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
      Indent -= 1
      Brace_count -= 1
      call outnum (range_lab, CODE)
      call outtab (CODE)
      call outstr ("GOTO("s, CODE)
      for (i = 1; i <= num_stmts; i += 1) {
         call outgolab (start_lab + i)
         if (i < num_stmts)
            call outch (','c, CODE)
         }
      call outch (')'c, CODE)
      call outch (','c, CODE)
      call outstr (casevar, CODE)
      call outdon (CODE)
      call getsym
      }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
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
   if (Symbol == ELSESYM) {
      state = ACCEPT
      Indent += 1
      call getsym
      }
   else {
      call outnum (esc_lab, CODE)
      }
   if (state == ACCEPT) {
      repeat {
         state = NOMATCH
         if (Symbol == NEWLINE) {
            state = ACCEPT
            call getsym
            }
         } until (state ~= ACCEPT)
      select (state)
         when (NOMATCH)
            state = ACCEPT
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      call ratfor_code (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (ACCEPT) {
            Indent -= 1
            call outnum (esc_lab, CODE)
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
gpst = state
return
end



subroutine do_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer labgen
call begin_stmt
Loop_sp += 1
if (Loop_sp > MAXLOOPS)
   FATAL ("loops nested too deeply"p)
Next_lab (Loop_sp) = labgen (1)
Break_lab (Loop_sp) = labgen (1)
call outtab (CODE)
call outstr ("DO "s, CODE)
call outnum (Next_lab (Loop_sp), CODE)
call outch (' 'c, CODE)
call code_other (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (NOMATCH) {
      state = ACCEPT
      }
   when (ACCEPT) {
      Indent += 1
      }
if (state == ACCEPT) {
   state = NOMATCH
   if (Symbol == ';'c) {
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
   repeat {
      state = NOMATCH
      if (Symbol == NEWLINE) {
         state = ACCEPT
         call getsym
         }
      } until (state ~= ACCEPT)
   select (state)
      when (NOMATCH)
         state = ACCEPT
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   call ratfor_code (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (ACCEPT) {
         call outnum (Next_lab (Loop_sp), CODE)
         Indent -= 1
         call outnum (Break_lab (Loop_sp), CODE)
         Loop_sp -= 1
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine compound_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
Brace_count += 1
call enter_scope
repeat {
   state = NOMATCH
   if (Symbol == NEWLINE) {
      state = ACCEPT
      call getsym
      }
   } until (state ~= ACCEPT)
select (state)
   when (NOMATCH)
      state = ACCEPT
if (state == ACCEPT) {
   repeat {
      call ratfor_code (state)
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
   state = NOMATCH
   if (Symbol == '}'c) {
      state = ACCEPT
      call exit_scope
      Brace_count -= 1
      call getsym
      }
   else {
      SYNERR ("Missing right brace"p)
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



subroutine return_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
call begin_stmt
call return_module
state = NOMATCH
if (Symbol == '('c) {
   state = ACCEPT
   call outtab (CODE)
   call outstr (Module_name, CODE)
   call outch ('='c, CODE)
   call getsym
   }
else {
   call outtab (CODE)
   call outstr ("RETURN"s, CODE)
   }
if (state == ACCEPT) {
   call code_other (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         state = ACCEPT
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   state = NOMATCH
   if (Symbol == ')'c) {
      state = ACCEPT
      call outtab (CODE)
      call outstr ("RETURN"s, CODE)
      call getsym
      }
   else {
      SYNERR ("Missing right parenthesis"p)
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
if (state == ACCEPT) {
   call code_other (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call outdon (CODE)
         state = ACCEPT
         Dispatch_flag = YES
         }
      when (ACCEPT) {
         Dispatch_flag = YES
         }
   if (state ~= ACCEPT) {
      gpst = FAILURE
      return
      }
   }
gpst = state
return
end



subroutine break_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer num, i, j
integer ctoi
call begin_stmt
state = NOMATCH
if (Symbol == NUMBERSYM) {
   state = ACCEPT
   i = 1
   num = ctoi (Symtext, i)
   call getsym
   }
else {
   num = 1
   }
select (state)
   when (NOMATCH)
      state = ACCEPT
if (num > Loop_sp)
   SYNERR ("Illegal 'break'"p)
else {
   j = Loop_sp - num + 1
   call outgo (Break_lab (j))
   }
gpst = state
return
end



subroutine next_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer num, i, j
integer ctoi
call begin_stmt
state = NOMATCH
if (Symbol == NUMBERSYM) {
   state = ACCEPT
   i = 1
   num = ctoi (Symtext, i)
   call getsym
   }
else {
   num = 1
   }
select (state)
   when (NOMATCH)
      state = ACCEPT
if (num > Loop_sp)
  SYNERR ("Illegal 'next'"p)
else {
   j = Loop_sp - num + 1
   call outgo (Next_lab (j))
   }
gpst = state
return
end



subroutine stop_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
call begin_stmt
call stop_module
if (~ ARG_PRESENT (y)) {
   call outtab (CODE)
   call outstr ("call swt"s, CODE)
   call outdon (CODE)
   }
if (ARG_PRESENT (y) || Symbol ~= NEWLINE
    && Symbol ~= ';'c && Symbol ~= '}'c) {
   call outtab (CODE)
   call outstr ("STOP"s, CODE)
   }
call code_other (state)
select (state)
   when (FAILURE) {
      gpst = FAILURE
      return
      }
   when (NOMATCH) {
      call outdon (CODE)
      state = ACCEPT
      }
Dispatch_flag = YES
gpst = state
return
end



subroutine goto_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
integer i, n
integer ctoi
call begin_stmt
call outtab (CODE)
call outstr ("GOTO "s, CODE)
state = NOMATCH
if (Symbol == NUMBERSYM) {
   state = ACCEPT
   i = 1
   n = ctoi (Symtext, i)
   call outgolab (n)
   call outdon (CODE)
   Dispatch_flag = YES
   call getsym
   }
if (state == NOMATCH) {
   if (Symbol == '('c) {
      state = ACCEPT
      }
   if (state == ACCEPT) {
      call code_other (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            SYNERR ("Illegal computed GOTO"p)
            call outdon (CODE)
            state = ACCEPT
            }
         when (ACCEPT) {
            Dispatch_flag = NO
            }
      if (state ~= ACCEPT) {
         gpst = FAILURE
         return
         }
      }
   if (state == NOMATCH) {
      call code_other (state)
      select (state)
         when (FAILURE) {
            gpst = FAILURE
            return
            }
         when (NOMATCH) {
            call outdon (CODE)
            state = ACCEPT
            Dispatch_flag = YES
            }
         when (ACCEPT) {
            Dispatch_flag = YES
            }
      }
   }
gpst = state
return
end



subroutine call_stmt (gpst)
integer gpst
include 'rp_com.i'
integer state
state = NOMATCH
if (Symbol == PROCIDSYM) {
   state = ACCEPT
   call getsym
   }
else {
   call begin_stmt
   call outtab (CODE)
   call outstr ("CALL "s, CODE)
   }
if (state == ACCEPT) {
   call procedure_stmt (state)
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
   call code_other (state)
   select (state)
      when (FAILURE) {
         gpst = FAILURE
         return
         }
      when (NOMATCH) {
         call outdon (CODE)
         state = ACCEPT
         }
   }
gpst = state
return
end
