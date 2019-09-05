# setup_local_id --- enter a local identifier into the proper table

   subroutine setup_local_id

   include "rp_com.i"

   character str1 (MAXTOK), str2 (10)
   pointer sdupl, mktabl
   untyped info (SYMINFOSIZE)

   if (Scope_sp <= 0)
      return

   call get_long_name (str1)
   call vargen (str2)

   info (SYMBOLDATA) = sdupl (str2)

   if (Scope_table (Scope_sp) == 0)
      Scope_table (Scope_sp) = mktabl (SYMINFOSIZE)

   call enter (str1, info, Scope_table (Scope_sp))

DEBUG call print (ERROUT, "setup_local_id: '*s', '*s'*n"p, str1, str2)

   return
   end



# setup_proc_head --- build a Ratfor procedure head in dynamic storage

   subroutine setup_proc_head (hd)
   pointer hd

   include "rp_com.i"

   integer labgen
   character str (MAXTOK)
   pointer dsget, mktabl, sdupl
   untyped info (SYMINFOSIZE)

   call get_long_name (str)

   hd = dsget (PROCINFOSIZE)
   Mem (hd + PROCLABELS) = 0
   Mem (hd + PROCPARAMS) = 0
   Mem (hd + PROCRETURN) = 0
   Mem (hd + PROCSTART) = labgen (1)
   Mem (hd + PROCRECURSION) = 0
   Mem (hd + PROCSTACKP) = 0
   Mem (hd + PROCSTACKV) = 0
   Mem (hd + PROCFWD) = NO
   Mem (hd + PROCNAME) = sdupl (str)

   info (SYMBOLDATA) = hd
   if (Proc_table == 0)
      Proc_table = mktabl (SYMINFOSIZE)
   call enter (str, info, Proc_table)

DEBUG call print (ERROUT, "setup_proc_head: *i '*s'*n"p, hd, str)
DEBUG call dump_proc_head (hd)

   return
   end



# enter_proc_param --- enter a procedure parameter on the list

   subroutine enter_proc_param (hd)
   integer hd

   include "rp_com.i"

   character str (MAXTOK)
   pointer p, q
   pointer sdupl, dsget

DEBUG call print (ERROUT, "enter_proc_param: hd=*i*n"p, hd)

   call get_long_name (str)
   q = dsget (PARAMINFOSIZE)
   Mem (q + PARAMNEXT) = 0
   Mem (q + PARAMTEXT1) = sdupl (str)  # save the long name
   call vargen (str)
   Mem (q + PARAMTEXT2) = sdupl (str)  # save the short name

   p = Mem (hd + PROCPARAMS)
   if (p == 0)
      Mem (hd + PROCPARAMS) = q
   else {
      while (Mem (p + PARAMNEXT) ~= 0)
         p = Mem (p + PARAMNEXT)
      Mem (p + PARAMNEXT) = q
      }

DEBUG call print (ERROUT, "enter_proc_param: *i, *i, '*s'*n"p, q, p, str)
DEBUG call dump_proc_head (hd)

   return
   end



# create_proc_scope --- enter all the parameters into the current scope

   subroutine create_proc_scope (hd)
   pointer hd

   include "rp_com.i"

   pointer p
   pointer mktabl, sdupl

   untyped info (SYMINFOSIZE)

DEBUG call print (ERROUT, "create_proc_scope: hd=*i*n"p, hd)

   for (p = Mem (hd + PROCPARAMS); p ~= 0; p = Mem (p + PARAMNEXT)) {
      info (SYMBOLDATA) = sdupl (Mem (Mem (p + PARAMTEXT2)))
      if (Scope_table (Scope_sp) == 0)
         Scope_table (Scope_sp) = mktabl (SYMINFOSIZE)
      call enter (Mem (Mem (p + PARAMTEXT1)), info, Scope_table (Scope_sp))
DEBUG call print (ERROUT, "create_proc_scope: *i, '*s', '*s'*n"p,
DEBUG    p, Mem (Mem (p + PARAMTEXT1)),Mem (Mem (p + PARAMTEXT2)))
      }

DEBUG call dump_proc_head (hd)

   return
   end



# gen_proc_control_decl --- generate declarations for proc control

   subroutine gen_proc_control_decl (hd)
   pointer hd

   include "rp_com.i"

   character var (10)
   pointer sdupl

DEBUG call print (ERROUT, "gen_proc_control_decl: hd=*i*n"p, hd)

   call vargen (var)

   if (Mem (hd + PROCRECURSION) == 0) {   # not a recursive procedure
      Mem (hd + PROCSTACKP) = sdupl (var)
      call gen_int_decl (var, 0)
      }
   else {
      Mem (hd + PROCSTACKV) = sdupl (var)
      call gen_int_decl (var, Mem (hd + PROCRECURSION))
      call vargen (var)
      Mem (hd + PROCSTACKP) = sdupl (var)
      call gen_int_decl (var, 0)

      call outtab (CODE)
      call outstr (var, CODE)
      call outstr ("=1"s, CODE)
      call outdon (CODE)
      }

DEBUG call dump_proc_head (hd)

   return
   end



# enter_scope --- bump scope pointer and check bounds

   subroutine enter_scope

   include "rp_com.i"

   if (Scope_sp >= MAXSCOPE)
      FATAL ("Scopes nested too deeply"p)

   Scope_sp += 1
   Scope_table (Scope_sp) = 0

DEBUG call print (ERROUT, "enter_scope: *i*n"p, Scope_sp)

   return
   end



# exit_scope --- destroy the scope's symbol table & decrement

   subroutine exit_scope

   include "rp_com.i"

   integer pos
   integer sctabl
   character str (MAXTOK)
   untyped info (SYMINFOSIZE)

   if (Scope_sp <= 0)
      FATAL ("Scope stack underflow"p)

   if (Scope_table (Scope_sp) ~= 0) {  # We have to clean up
      pos = 0
      while (sctabl (Scope_table (Scope_sp), str, info, pos) ~= EOF) {
DEBUG    call print (ERROUT, "exit_scope: '*s', '*s'*n"p,
DEBUG                str, Mem (info (SYMBOLDATA)))
         call dsfree (info (SYMBOLDATA))
         }
      call rmtabl (Scope_table (Scope_sp))
      }

   Scope_sp -= 1

   return
   end



# gen_param --- generate code for pass-by-value parameter

   subroutine gen_param (p)
   pointer p

   include "rp_com.i"

   pointer q
   pointer expr_stack_pop

   if (p == 0) {
      SYNERR ("Not enough parameters"p)
      return
      }

   call outtab (CODE)
   call outstr (Mem (Mem (p + PARAMTEXT2)), CODE)
   call outch ('='c, CODE)
   call gen_expr (expr_stack_pop (q))
   call outdon (CODE)

   p = Mem (p + PARAMNEXT)

   return
   end



# gen_proc_call --- generate an internal procedure call

   subroutine gen_proc_call (hd)
   pointer hd

   include "rp_com.i"

   integer l, c
   integer labgen
   pointer p, q
   pointer dsget

   l = labgen (1)

   p = dsget (LABELINFOSIZE)
   Mem (p + LABELVAL) = l
   Mem (p + LABELNEXT) = 0

   c = 1
   if (Mem (hd + PROCLABELS) == 0)
      Mem (hd + PROCLABELS) = p
   else {
      q = Mem (hd + PROCLABELS)
      c += 1
      while (Mem (q + LABELNEXT) ~= 0) {
         q = Mem (q + LABELNEXT)
         c += 1
         }
      Mem (q + LABELNEXT) = p
      }

   call outtab (CODE)
   if (Mem (hd + PROCRECURSION) == 0)
      call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
   else {
      call outstr (Mem (Mem (hd + PROCSTACKV)), CODE)
      call outch ('('c, CODE)
      call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
      call outch (')'c, CODE)
      }
   call outch ('='c, CODE)
   call outnum (c, CODE)
   call outdon (CODE)

   call outgo (Mem (hd + PROCSTART))

   call outnum (l, CODE)

DEBUG call dump_proc_head (hd)

   return
   end



# gen_proc_return --- generate code for all the internal procedure returns

   subroutine gen_proc_return

   include "rp_com.i"

   integer pos
   integer sctabl
   character str (MAXTOK)
   pointer p, q
   pointer hd
   untyped info (SYMINFOSIZE)

   if (Proc_table == 0)
      return

   pos = 0
   while (sctabl (Proc_table, str, info, pos) ~= EOF) {

      hd = info (SYMBOLDATA)
DEBUG call dump_proc_head (hd)

      if (Mem (hd + PROCFWD) == YES) {
         ERROR_SYMBOL (Mem (Mem (hd + PROCNAME)))
         SYNERR ("Procedure body not defined"p)
         }

      call gen_proc_goto (hd)

      for (p = Mem (hd + PROCLABELS); p ~= 0; p = q) {
         q = Mem (p + LABELNEXT)
         call dsfree (p)
         }

      for (p = Mem (hd + PROCPARAMS); p ~= 0; p = q) {
         q = Mem (p + PARAMNEXT)
         call dsfree (Mem (p + PARAMTEXT1))
         call dsfree (Mem (p + PARAMTEXT2))
         call dsfree (p)
         }

      if (Mem (hd + PROCRECURSION) ~= 0)
         call dsfree (Mem (hd + PROCSTACKV))
      call dsfree (Mem (hd + PROCSTACKP))

      call dsfree (Mem (hd + PROCNAME))

      call dsfree (hd)
      }

   call rmtabl (Proc_table)
   Proc_table = 0

   return
   end



# gen_proc_goto --- if there were any calls, generate a computed goto

   subroutine gen_proc_goto (hd)
   pointer hd

   include "rp_com.i"

   integer labgen
   pointer p
   character var (MAXTOK)

   if (Mem (hd + PROCRETURN) == 0)     # never returns; generate it anyway
      Mem (hd + PROCRETURN) = labgen (1)

   call outnum (Mem (hd + PROCRETURN), CODE)

   if (Mem (hd + PROCLABELS) == 0) {   # no calls, just output a stop
      call outtab (CODE)
      call outstr ("stop"s, CODE)
      call outdon (CODE)
      return
      }

   if (Mem (hd + PROCRECURSION) ~= 0) {
      call outtab (CODE)
      call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
      call outch ('='c, CODE)
      call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
      call outstr ("-1"s, CODE)
      call outdon (CODE)

      call outtab (CODE)
      call outstr ("if ("s, CODE)
      call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
      call outstr (".le.0)call error(24hcontrol stack underflow.)"s, CODE)
      call outdon (CODE)
      }

   call outtab (CODE)
   p = Mem (hd + PROCLABELS)
   if (Mem (p + LABELNEXT) == 0)       # only called from one place
      call outgo (Mem (p + LABELVAL))
   else {
      if (ARG_PRESENT (v) && Mem (hd + PROCRECURSION) ~= 0) {
         call vargen (var)
         call outstr (var, CODE)
         call outch ('='c, CODE)
         call outstr (Mem (Mem (hd + PROCSTACKV)), CODE)
         call outch ('('c, CODE)
         call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
         call outch (')'c, CODE)
         call outdon (CODE)
         call outtab (CODE)
         }
      call outstr ("goto("s, CODE)
      call outgolab (Mem (p + LABELVAL))
      for (p = Mem (p + LABELNEXT); p ~= 0; p = Mem (p + LABELNEXT)) {
         call outch (','c, CODE)
         call outgolab (Mem (p + LABELVAL))
         }
      call outstr ("),"s, CODE)

      if (Mem (hd + PROCRECURSION) == 0)
         call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
      else if (ARG_PRESENT (v))
         call outstr (var, CODE)
      else {
         call outstr (Mem (Mem (hd + PROCSTACKV)), CODE)
         call outch ('('c, CODE)
         call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
         call outch (')'c, CODE)
         }
      call outdon (CODE)
      call outgo (Mem (hd + PROCRETURN))  # add a bogus goto to reference
      }                                   # the return label

   return
   end



# gen_proc_entry --- generate code necessary for procedure entry

   subroutine gen_proc_entry (hd)
   pointer hd

   include "rp_com.i"

   call outnum (Mem (hd + PROCSTART), CODE)
   if (Mem (hd + PROCRECURSION) ~= 0) {
      call outtab (CODE)
      call outstr ("if("s, CODE)
      call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
      call outstr (".ge."s, CODE)
      call outnum (Mem (hd + PROCRECURSION), CODE)
      call outstr (")call error(23hControl stack overflow.)"s, CODE)
      call outdon (CODE)

      call outtab (CODE)
      call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
      call outch ('='c, CODE)
      call outstr (Mem (Mem (hd + PROCSTACKP)), CODE)
      call outstr ("+1"s, CODE)
      call outdon (CODE)
      }

DEBUG call dump_proc_head (hd)

   return
   end



# dump_proc_head --- debugging proc to dump procedure structure

DEBUG subroutine dump_proc_head (hd)
DEBUG pointer hd

DEBUG include "rp_com.i"

DEBUG pointer p

DEBUG call print (ERROUT, "*nProcedure head *i for "p, hd)
DEBUG call print (ERROUT, "*s:*n"p, Mem (Mem (hd + PROCNAME)))
DEBUG call print (ERROUT, "  rec=*i"p, Mem (hd + PROCRECURSION))
DEBUG call print (ERROUT, "  strt=*i"p, Mem (hd + PROCSTART))
DEBUG call print (ERROUT, "  ret=*i"p, Mem (hd + PROCRETURN))
DEBUG call print (ERROUT, "  fwd=*i*n"p, Mem (hd + PROCFWD))
DEBUG if (Mem (hd + PROCSTACKV) ~= 0)
DEBUG    call print (ERROUT, "  sv='*s'*n"p, Mem (Mem (hd + PROCSTACKV)) )
DEBUG if (Mem (hd + PROCSTACKP) ~= 0)
DEBUG    call print (ERROUT, "  sp='*s'*n"p, Mem (Mem (hd + PROCSTACKP)) )
DEBUG call print (ERROUT, "  labels:  (*i)*n"p, Mem (hd + PROCLABELS))
DEBUG for (p = Mem (hd + PROCLABELS); p ~= 0; p = Mem (p + LABELNEXT))
DEBUG    call print (ERROUT, "           (*i) *i*n"p,
DEBUG       Mem (p + LABELNEXT), Mem (p + LABELVAL))
DEBUG call print (ERROUT, "  params:  (*i)*n"p, Mem (hd + PROCPARAMS))
DEBUG for (p = Mem (hd + PROCPARAMS); p ~= 0; p = Mem (p + PARAMNEXT))
DEBUG    call print (ERROUT, "           (*i) '*s' '*s'*n"p,
DEBUG       Mem (p + PARAMNEXT), Mem (Mem (p + PARAMTEXT1)),
DEBUG       Mem (Mem (p + PARAMTEXT2)))

DEBUG return
DEBUG end
