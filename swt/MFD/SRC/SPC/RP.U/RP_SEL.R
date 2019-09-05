
# setup_when --- set up the table entry for a 'when' expression

   subroutine setup_when (text, type, tempvar)
   pointer text
   integer type
   character tempvar (ARB)

   include "rp_com.i"

   integer i
   integer length
   pointer q, r
   pointer expr_stack_pop, dsget, make_tree_node
   longint n
   longint gctol

   if (Mem (text + TREETYPE) == IDSYM) {  # see if we have just a number
      q = Mem (text + TREEVALUE)
      if (q ~= 0) {
         r = Mem (q + SAVELINK)
         select
            when (Mem (q + SAVETYPE) == NUMBERSYM && r == 0) { # It's decimal
               i = 1
               n = gctol (Mem (q + SAVETEXT), i, 10)
               }
            when (Mem (q + SAVETYPE) == ':'c &&            # It's octal
                  Mem (r + SAVETYPE) == NUMBERSYM &&
                  Mem (r + SAVELINK) == 0) {
               i = 1
               n = gctol (Mem (r + SAVETEXT), i, 8)
               if (n > 32767 && n < 65536)
                  n -= 65536
               call dsfree (r)
               }
            when (Mem (q + SAVETYPE) == '-'c &&               # It's negative
                  Mem (r + SAVETYPE) == NUMBERSYM &&
                  Mem (r + SAVELINK) == 0) {
               i = 1
               n = -gctol (Mem (r + SAVETEXT), i, 10)
               call dsfree (r)
               }
         if_any {
            call dsfree (q)
            call dsfree (text)
            text = n
            if (n ~= text)
               SYNERR ("Select alternative must be a short integer"p)
            type = NUMBERSYM
            return
            }
         }
      }

  # It's an expression
   type = IDSYM

   q = dsget (SAVESIZE + length (tempvar))
   Mem (q + SAVELINK) = 0
   Mem (q + SAVETYPE) = IDSYM
   call scopy (tempvar, 1, Mem, q + SAVETEXT)

   call expr_stack_push (text)
   call expr_stack_push (make_tree_node (0, 0, IDSYM, q))
   call enter_operator (EQSYM)
   text = expr_stack_pop (text)

   return
   end



# gen_select_code --- generate code for a select statement

   subroutine gen_select_code (sc, slab, stext, stype, tempvar)
   integer sc, slab (ARB), stype (ARB)
   pointer stext (ARB)
   character tempvar (ARB)

   include "rp_com.i"

   integer i, j, k, jg, gap, slb, good_alts, elselab
   character str (10)
   longint ln

   DEBUG call print (ERROUT, "gen_select_code: *n"p)
   DEBUG for (i = 1; i <= sc; i += 1)
   DEBUG    call print (ERROUT, "*3i *4i *5i *5i*n"p,
   DEBUG       i, stype (i), slab (i), stext (i))

   elselab = 0       # no else label yet

  # Pick off and generate the expressions; record the constants
   Slt = 0
   for (i = 1; i <= sc; i += 1) {
      select (stype (i))
      when (IDSYM)
         call gen_if (stext (i), slab (i))
      when (NUMBERSYM) {
         Slt += 1
         Sclabel (Slt) = slab (i)
         Scvalue (Slt) = stext (i)
         }
      else
         FATAL ("in gen_select_code: can't happen.")
      }

   DEBUG call print (ERROUT, "  Slt=*i*n.", Slt)
   DEBUG call print (ERROUT, "  after select:*n"p)
   DEBUG for (i = 1; i <= Slt; i += 1)
   DEBUG    call print (ERROUT, "  *3i  *5i  *5i*n"p,
   DEBUG               i, Scvalue (i), Sclabel (i))

  # Give up if less that 2 alternatives
   if (Slt < 2) {
      call gen_sel_goto (1, Slt, tempvar, elselab)
      call outnum (elselab, CODE)
      return
      }

  # Sort by Scvalue (Shell sort; swiped from Software Tools)
   for (gap = Slt / 2; gap > 0; gap /= 2)
      for (i = gap + 1; i <= Slt; i += 1)
         for (j = i - gap; j > 0; j -= gap) {
            jg = j + gap
            if (Scvalue (j) <= Scvalue (jg))
               break
            k = Scvalue (j)
            Scvalue (j) = Scvalue (jg)
            Scvalue (jg) = k
            k = Sclabel (j)
            Sclabel (j) = Sclabel (jg)
            Sclabel (jg) = k
            }

   DEBUG call print (ERROUT, "  after sort:*n"p)
   DEBUG for (i = 1; i <= Slt; i += 1)
   DEBUG    call print (ERROUT, "  *3i  *5i  *5i*n"p,
   DEBUG               i, Scvalue (i), Sclabel (i))

  # Check for any duplicate entries
   for (i = 1; i < Slt; i += 1)
      if (Scvalue (i) == Scvalue (i + 1)) {
         call itoc (Scvalue (i), str, 10)
         ERROR_SYMBOL (str)
         SYNERR ("Identical constants in 'select' alternatives"p)
         }

  # Throw away the outer branches until size is acceptable
   Result (1) = EOS               # Just one variable for this 'select'
   for (slb = 1; slb <= Slt; slb = i + 1) {
      good_alts = 1
      for (i = slb; i < Slt; i += 1) {
         ln = intl (Scvalue (i + 1)) - intl (Scvalue (slb))
         if (ln > good_alts * SELRATIO || ln > MAXCGOTO)
            break
         good_alts += 1
         }
      call gen_sel_goto (slb, i, tempvar, elselab)
      }

   call outnum (elselab, CODE)

   return
   end



# gen_sel_goto --- generate a computed 'goto' or 'if' for 'select'

   subroutine gen_sel_goto (lo, hi, tempvar, outlab)
   integer lo, hi, outlab
   character tempvar (ARB)

   include "rp_com.i"

   integer j
   integer labgen
   character var (10)

   select
   when (hi - lo < 0)           # no alternatives
      ;
   when (hi - lo < 1) {         # only one alternative
      call outtab (CODE)
      call outstr ("IF("s, CODE)
      call outstr (tempvar, CODE)
      call outstr (".EQ."s, CODE)
      call outnum (Scvalue (lo), CODE)
      call outstr (")GOTO "s, CODE)
      call outgolab (Sclabel (lo))
      call outdon (CODE)
      }
   else {
      if (Scvalue (lo) == 1)
         call scopy (tempvar, 1, var, 1)
      else {
         if (Result (1) == EOS) {       # calculate offset value
            call vargen (Result)
            call gen_int_decl (Result, 0)
            }
         call outtab (CODE)
         call outstr (Result, CODE)
         call outch ('='c, CODE)
         call outstr (tempvar, CODE)
         if (Scvalue (lo) < 1) {
            call outch ('+'c, CODE)
            call outnum (1 - Scvalue (lo), CODE)
            }
         else {
            call outch ('-'c, CODE)
            call outnum (Scvalue (lo) - 1, CODE)
            }
         call outdon (CODE)
         call scopy (Result, 1, var, 1)
         }

      call outtab (CODE)
      if (ARG_PRESENT (v)) {
         call outstr ("IF("s, CODE)
         call outstr (var, CODE)
         call outstr (".GT.0.AND."s, CODE)
         call outstr (var, CODE)
         call outstr (".LE."s, CODE)
         call outnum (Scvalue (hi) - Scvalue (lo) + 1, CODE)
         call outch (')'c, CODE)
         }
      call outstr ("GOTO("s, CODE)
      call outgolab (Sclabel (lo))
      lo += 1
      for (j = Scvalue (lo - 1) + 1; j <= Scvalue (hi); j += 1) {
         call outch (','c, CODE)
         if (j >= Scvalue (lo)) {
            call outgolab (Sclabel (lo))
            lo += 1
            }
         else {
            if (outlab == 0)
               outlab = labgen (1)
            call outgolab (outlab)
            }
         }
      call outch (')'c, CODE)
      call outch (','c, CODE)
      call outstr (var, CODE)
      call outdon (CODE)
      }

   return
   end



