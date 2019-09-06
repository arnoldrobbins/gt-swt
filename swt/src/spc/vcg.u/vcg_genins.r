# vcg_genins --- internal-form instruction generators for code generator

define(FWD(i),Imem(i+1))
define(REV(i),Imem(i+2))

define(MAX_SPARSENESS,3)



# gen_generic --- generate generic machine instruction or pseudo-op

   ipointer function gen_generic (instr)
   integer instr

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   # Format of generic instruction is as follows:
   #  Offset      Contents
   #     0        GENERIC_INSTRUCTION
   #     1        forward link, to next instruction in sequence
   #     2        reverse link, to previous instruction in sequence
   #     3        internal code for the instruction

DB call print (ERROUT, "gen_generic: *i*n"s, instr)
   i = ialloc (4)
   Imem (i) = GENERIC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = instr

   return (i)
   end



# gen_branch --- generate branch to a given label

   ipointer function gen_branch (instr, label)
   integer instr, label

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   # Format of a branch instruction is as follows:
   #  Offset      Contents
   #     0        BRANCH_INSTRUCTION
   #     1        forward link, to next instruction in sequence
   #     2        reverse link, to previous instruction in sequence
   #     3        instruction code for the type of branch desired
   #     4        number of the target label

   i = ialloc (5)
   Imem (i) = BRANCH_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = instr
   Imem (i + 4) = label

   return (i)
   end



# gen_mr --- generate memory-reference instruction

   ipointer function gen_mr (instr, ad)
   integer instr, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   integer j

   # Format of memory-reference instruction is as follows:
   #  Offset      Contents
   #     0        MR_INSTRUCTION
   #     1        forward link, to next instruction in sequence
   #     2        reverse link, to previous instruction in sequence
   #     3        instruction code
   #    4-8       address descriptor for operand

   i = ialloc (ADDR_DESC_SIZE + 4)
   gen_mr = i
   Imem (i) = MR_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = instr
   for ({i += 4; j = 1}; j <= ADDR_DESC_SIZE; {i += 1; j += 1})
      Imem (i) = ad (j)

   return
   end



# gen_label --- generate pseudo-op for label placement

   ipointer function gen_label (label)
   integer label

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   # Format of label placement instruction is as follows:
   #  Offset      Contents
   #     0        LABEL_INSTRUCTION
   #     1        forward link, to next instruction in sequence
   #     2        reverse link, to previous instruction in sequence
   #     3        label number

DB call print (ERROUT, "gen_label: L*,-8i_*n"s, label)
   i = ialloc (4)
   Imem (i) = LABEL_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = label

   return (i)
   end



# seq --- combine two instruction sequences to form a new sequence

   ipointer function seq (i1, i2, i3, i4, i5, i6, i7, i8, i9)
   ipointer i1, i2, i3, i4, i5, i6, i7, i8, i9

   include VCG_COMMON

   ipointer first (9), last (9)

   integer i, n

   logical missin

   n = 0
   if (i1 ~= 0) {             # first arg should always be present
      n += 1
      first (n) = i1
      last (n) = REV (i1)
      }
   if (i2 ~= 0) {             # second arg also should be present
      n += 1
      first (n) = i2
      last (n) = REV (i2)
      }
   if (~missin (i3)) {        # other args might be absent
      if (i3 ~= 0) {
         n += 1
         first (n) = i3
         last (n) = REV (i3)
         }
      if (~missin (i4)) {
         if (i4 ~= 0) {
            n += 1
            first (n) = i4
            last (n) = REV (i4)
            }
         if (~missin (i5)) {
            if (i5 ~= 0) {
               n += 1
               first (n) = i5
               last (n) = REV (i5)
               }
            if (~missin (i6)) {
               if (i6 ~= 0) {
                  n += 1
                  first (n) = i6
                  last (n) = REV (i6)
                  }
               if (~missin (i7)) {
                  if (i7 ~= 0) {
                     n += 1
                     first (n) = i7
                     last (n) = REV (i7)
                     }
                  if (~missin (i8)) {
                     if (i8 ~= 0) {
                        n += 1
                        first (n) = i8
                        last (n) = REV (i8)
                        }
                     if (~missin (i9)) {
                        if (i9 ~= 0) {
                           n += 1
                           first (n) = i9
                           last (n) = REV (i9)
                           }
                        }  # i9
                     }  # i8
                  }  # i7
               }  # i6
            }  # i5
         }  # i4
      }  # i3

   if (n == 0)
      return (0)

   for (i = 1; i < n; i += 1) {
      FWD (last (i)) = first (i + 1)
      REV (first (i + 1)) = last (i)
      }

   FWD (last (n)) = first (1)
   REV (first (1)) = last (n)

#   call print (ERROUT, "-----------seq:*n"s)
#   for (i = 1; i <= n; i += 1) {
#      call print (ERROUT, "*i: *i->, <-*i, *i*n"s,
#         first (i), FWD (first (i)), REV (first (i)), Imem (first (i)))
#      }
#   call exit

   return (first (1))
   end



# gen_ent --- generate ENT pseudo-op for procs with exportable names

   ipointer function gen_ent (extnam, obj)
   spointer extnam
   integer obj

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (6)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = ENT_INS
   Imem (i + 4) = extnam
   Imem (i + 5) = obj

   return (i)
   end



# gen_ecb --- generate entry control block for a procedure

   ipointer function gen_ecb (proc, start, displ, nargs, ssize)
   integer proc, start, displ, nargs, ssize

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (9)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = ECB_INS
   Imem (i + 4) = proc
   Imem (i + 5) = start
   Imem (i + 6) = displ
   Imem (i + 7) = nargs
   Imem (i + 8) = ssize

   return (i)
   end



# gen_shift --- generate a SHIFT instruction

   ipointer function gen_shift (instr, amount)
   integer instr, amount

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = instr
   Imem (i + 4) = amount

   return (i)
   end



# gen_ip --- generate IP to named external symbol

   ipointer function gen_ip (name)
   spointer name

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   if (Smem (name) == EOS)
      return (0)

   i = ialloc (6)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = IP_INS
   Imem (i + 4) = EXTERNAL
   Imem (i + 5) = name

   return (i)
   end



# gen_ip_rtr --- generate IP to external run time routine name

   ipointer function gen_ip_rtr (name)
   integer name               # index into rtr name table

   include VCG_COMMON

   ipointer i
   ipointer ialloc

DB call print (ERROUT, "gen_ip_rtr:*n"s)
   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = IP_RTR_INS
   Imem (i + 4) = name

   return (i)
   end



# gen_ip_label--- generate IP to an internal label

   ipointer function gen_ip_label(label)
   unsigned label

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (6)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = IP_INS
   Imem (i + 4) = INTERNAL
   Imem (i + 5) = label

   return (i)
   end



# gen_ext --- generate declaration of external name

   ipointer function gen_ext (name)
   spointer name

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   if (Smem (name) == EOS)
      return (0)

   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = EXT_INS
   Imem (i + 4) = name

   return (i)
   end



# gen_ext_rtr --- generate declaration of external run time routine name

   ipointer function gen_ext_rtr (name)
   integer name            # index into rtr name table

   include VCG_COMMON

   ipointer i
   ipointer ialloc

DB call print (ERROUT, "gen_ext_rtr:*n"s)
   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = EXT_RTR_INS
   Imem (i + 4) = name

   return (i)
   end



# gen_data --- generate DATA pseudo-operation

   ipointer function gen_data (datum)
   integer datum

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = DATA_INS
   Imem (i + 4) = datum

   return (i)
   end



# gen_bsz --- generate BSZ pseudo-op to zero-out storage space

   ipointer function gen_bsz (size)
   unsigned size

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = BSZ_INS
   Imem (i + 4) = size

   return (i)
   end



# ld --- generate code to load an accumulator

   ipointer function ld (acc, res, ad)
   regset acc
   integer res, ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   ipointer gen_mr

   if (res == IN_MEMORY) {
      select (acc)
         when (A_REG)
            ld = gen_mr (LDA_INS, ad)
         when (L_REG)
            ld = gen_mr (LDL_INS, ad)
         when (F_REG)
            ld = gen_mr (FLD_INS, ad)
         when (LF_REG)
            ld = gen_mr (DFLD_INS, ad)
      else
         call panic ("*i: bad accumulator specified in ld*n"p, acc)
      }
   else
      ld = 0   # for now, we'll assume it's in the right register

   return
   end



# st --- generate code to store an accumulator

   ipointer function st (acc, ad)
   regset acc
   integer ad (ADDR_DESC_SIZE)

   include VCG_COMMON

   ipointer gen_mr

   select (acc)
      when (A_REG)
         st = gen_mr (STA_INS, ad)
      when (L_REG)
         st = gen_mr (STL_INS, ad)
      when (F_REG)
         st = gen_mr (FST_INS, ad)
      when (LF_REG)
         st = gen_mr (DFST_INS, ad)
   else
      call panic ("*i:  bad accumulator specified in st*n"p, acc)

   return
   end



# gen_ap --- generate an AP pseudo-op

   ipointer function gen_ap (ad, store, last)
   integer ad (ADDR_DESC_SIZE), store, last

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   integer j

   i = ialloc (6 + ADDR_DESC_SIZE)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = AP_INS
   Imem (i + 4) = store
   Imem (i + 5) = last
   gen_ap = i

   for ({i += 6; j = 1}; j <= ADDR_DESC_SIZE; {i += 1; j += 1})
      Imem (i) = ad (j)

   return
   end



# gen_copy --- generate call to block copy routine
#     Address descriptors are assumed to be usable in AP pseudo-ops,
#     i.e., they contain no indexing

   ipointer function gen_copy (srcad, dstad, len)
   integer srcad (ADDR_DESC_SIZE), dstad (ADDR_DESC_SIZE), len

   include VCG_COMMON

   ipointer i
   ipointer ialloc, seq, gen_ap, gen_mr, load_rtr_ip

   integer lenad (ADDR_DESC_SIZE), rtr_ad (ADDR_DESC_SIZE), junk,
      lookup_obj

DB call print (ERROUT, "gen_copy:*n"s)

   # make sure we have an IP to the MOVE routine
   i = load_rtr_ip (V$MOVE$, block_copy_id)

   junk = lookup_obj (block_copy_id, rtr_ad)

   AD_MODE (lenad) = ILIT_AM
   AD_LIT1 (lenad) = len

   i = seq (i, gen_mr (PCL_INS, rtr_ad),
      gen_ap (srcad, STORE_AP, NOT_LAST_AP),
      gen_ap (dstad, STORE_AP, NOT_LAST_AP),
      gen_ap (lenad, STORE_AP, LAST_AP))

   return (i)
   end



# gen_switch --- generate transfer-of-control code for a 'switch'

   ipointer function gen_switch (node, clabs, deflab, regs)
   tpointer node
   unsigned clabs (MAXCASES), deflab
   regset regs

   include VCG_COMMON

   integer ival (MAXCASES)
   long_int lval (MAXCASES)
   real rval (MAXCASES)
   long_real dval (MAXCASES)
   equivalence (ival (1), lval (1)), (ival (1), rval (1)),
      (ival (1), dval (1))       # done only to save space

   integer ad (ADDR_DESC_SIZE), ilit
   long_int llit
   real rlit
   long_real dlit
   equivalence (ilit, AD_LIT1 (ad)), (ilit, llit), (ilit, rlit), (ilit, dlit)

   unsigned labs (MAXCASES)
   unsigned mklabel

   integer mode, res, i, j, gap, jg, ncases

   tpointer cc

   ipointer load, seq, setup_switch

   regset cregs

   mode = Tmem (node + 1)                    # selection expression mode
   gen_switch = load (Tmem (node + 2), regs) # selection expression itself

   ncases = 0
   deflab = 0
   cc = Tmem (node + 3)
   while (cc ~= 0) {

      if (Tmem (cc) == CASE_OP) {
         ncases += 1
         call reach (Tmem (cc + 1), cregs, res, ad)
         if (res ~= IN_MEMORY) {
            call warning ("case value is not a constant*n"p)
            return (0)
            }
         mode = AD_MODE (ad)     # kluge for later use

         select (mode)
            when (ILIT_AM)
               ival (ncases) = ilit
            when (LLIT_AM)
               lval (ncases) = llit
            when (FLIT_AM)
               rval (ncases) = rlit
            when (DLIT_AM)
               dval (ncases) = dlit
         else {
            call warning ("*i: unacceptable switch mode*n"p, mode)
            return (0)
            }

         labs (ncases) = mklabel (1)
         clabs (ncases) = labs (ncases)
         cc = Tmem (cc + 3)
         }        # end of 'case'

      else if (Tmem (cc) == DEFAULT_OP) {
         if (deflab ~= 0) {
            call warning ("multiple defaults in switch*n"p)
            return (0)
            }
         deflab = mklabel (1)
         cc = Tmem (cc + 2)
         }

      else {
         call warning ("*i: bad entry in switch case list*n"p, Tmem (cc))
         return (0)
         }

      }  # end of case-traversing 'while' loop


   # At this point, all case values have been placed in
   #  ival, lval, rval, or dval, and the labels for the
   #  corresponding chunks of code are in clabs and labs.
   #  We'll sort them, then call setup_switch to do the
   #  work of generating the control transfers.
   #  Note that the switch exit label will be present on
   #  the top of the Break_stack, and must be popped by
   #  the caller of gen_switch.

   select (mode)

      when (ILIT_AM) {
         for (gap = ncases / 2; gap > 0; gap /= 2)
            for (i = gap + 1; i <= ncases; i += 1)
               for (j = i - gap; j > 0; j -= gap) {
                  jg = j + gap
                  if (ival (j) <= ival (jg))
                     break
                  ilit = ival (j)
                  ival (j) = ival (jg)
                  ival (jg) = ilit
                  ilit = labs (j)
                  labs (j) = labs (jg)
                  labs (jg) = ilit
                  }
         }

      when (LLIT_AM) {
         for (gap = ncases / 2; gap > 0; gap /= 2)
            for (i = gap + 1; i <= ncases; i += 1)
               for (j = i - gap; j > 0; j -= gap) {
                  jg = j + gap
                  if (lval (j) <= lval (jg))
                     break
                  llit = lval (j)
                  lval (j) = lval (jg)
                  lval (jg) = llit
                  ilit = labs (j)
                  labs (j) = labs (jg)
                  labs (jg) = ilit
                  }
         }

      when (FLIT_AM) {
         for (gap = ncases / 2; gap > 0; gap /= 2)
            for (i = gap + 1; i <= ncases; i += 1)
               for (j = i - gap; j > 0; j -= gap) {
                  jg = j + gap
                  if (rval (j) <= rval (jg))
                     break
                  rlit = rval (j)
                  rval (j) = rval (jg)
                  rval (jg) = rlit
                  ilit = labs (j)
                  labs (j) = labs (jg)
                  labs (jg) = ilit
                  }
         }

      when (DLIT_AM) {
         for (gap = ncases / 2; gap > 0; gap /= 2)
            for (i = gap + 1; i <= ncases; i += 1)
               for (j = i - gap; j > 0; j -= gap) {
                  jg = j + gap
                  if (dval (j) <= dval (jg))
                     break
                  dlit = dval (j)
                  dval (j) = dval (jg)
                  dval (jg) = dlit
                  ilit = labs (j)
                  labs (j) = labs (jg)
                  labs (jg) = ilit
                  }
         }

   if (Break_sp >= MAX_BREAK_SP) {
      call warning ("switch nested too deeply to record break label*n"p)
      return
      }
   Break_sp += 1
   Break_stack (Break_sp) = mklabel (1)

   gen_switch = seq (gen_switch,
      setup_switch (mode, ival, lval, rval, dval, labs, ncases, deflab))

   return
   end



# setup_switch --- generate code to do multiway control transfer

   ipointer function setup_switch (mode, ival, lval, rval, dval, labs,
      ncases, deflab)
   integer mode, ival (MAXCASES), ncases
   long_int lval (MAXCASES)
   real rval (MAXCASES)
   long_real dval (MAXCASES)
   unsigned labs (MAXCASES), deflab

   include VCG_COMMON

   integer ad (ADDR_DESC_SIZE), ilit
   long_int llit
   real rlit
   long_real dlit
   equivalence (ilit, AD_LIT1 (ad)), (ilit, llit), (ilit, rlit), (ilit, dlit)

   ipointer seq, gen_mr, gen_sj_forward, gen_sj_to_lab, gen_generic,
      gen_dac, gen_data

   integer c, lb, ub, i

   unsigned escape_lab

   if (deflab == 0)
      escape_lab = Break_stack (Break_sp)
   else
      escape_lab = deflab

   setup_switch = 0

   select (mode)

      when (ILIT_AM) {
         AD_MODE (ad) = ILIT_AM
         c = 1
         for (lb = 1; lb <= ncases; lb = ub + 1) {
            ub = ncases
            while ((ival(ub)-ival(lb)+1) / (ub-lb+1) > MAX_SPARSENESS)
               ub -= 1
            if (lb == ub) {   # one-element subgroup
               ilit = ival (lb) - c + 1   # side effect sets AD_LIT1
               setup_switch = seq (setup_switch,
                  gen_mr (CAS_INS, ad),
                  gen_sj_forward (3),
                  gen_sj_to_lab (labs (lb)),
                  gen_sj_to_lab (escape_lab))
               }
            else {            # multi-element subgroup; use computed goto
               ilit = ival (lb) - c # side effect sets AD_LIT1
               if (ilit ~= 0)
                  setup_switch = seq (setup_switch, gen_mr (SUB_INS, ad))
               setup_switch = seq (setup_switch,
                  gen_generic (CGT_INS),
                  gen_data (ival (ub) - ival (lb) + 2))
               c = ival (lb)
               for (i = ival (lb); i <= ival (ub); i += 1)
                  if (ival (lb) == i) {
                     setup_switch = seq (setup_switch,
                        gen_dac (labs (lb)))
                     lb += 1
                     }
                  else
                     setup_switch = seq (setup_switch,
                        gen_dac (escape_lab))
               }
            }
         }

      when (LLIT_AM) {
         AD_MODE (ad) = LLIT_AM
         for (c = 1; c <= ncases; c += 1) {
            llit = lval (c)         # side effect sets AD_LIT1,2
            setup_switch = seq (setup_switch,
               gen_mr (CLS_INS, ad),
               gen_sj_forward (3),
               gen_sj_to_lab (labs (c)),
               gen_sj_to_lab (escape_lab))
            }
         }

      when (FLIT_AM) {
         AD_MODE (ad) = FLIT_AM
         for (c = 1; c <= ncases; c += 1) {
            rlit = rval (c)         # side effect sets AD_LIT1,2
            setup_switch = seq (setup_switch,
               gen_mr (FCS_INS, ad),
               gen_sj_forward (3),
               gen_sj_to_lab (labs (c)),
               gen_sj_to_lab (escape_lab))
            }
         }

      when (DLIT_AM) {
         AD_MODE (ad) = DLIT_AM
         for (c = 1; c <= ncases; c += 1) {
            dlit = dval (c)         # side effect sets AD_LIT1,2,3,4
            setup_switch = seq (setup_switch,
               gen_mr (DFCS_INS, ad),
               gen_sj_forward (3),
               gen_sj_to_lab (labs (c)),
               gen_sj_to_lab (escape_lab))
            }
         }

   setup_switch = seq (setup_switch,
      gen_sj_to_lab (escape_lab), gen_generic (FIN_INS))
   return
   end



# gen_dac --- generate "DAC label" pseudo-op for CGT instructions

   ipointer function gen_dac (label)
   integer label

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = DAC_INS
   Imem (i + 4) = label

   return (i)
   end



# gen_sj_forward --- generate short jump forward 'w' words

   ipointer function gen_sj_forward (w)
   integer w

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = SHORT_JUMP_AHEAD_INS
   Imem (i + 4) = w

   return (i)
   end



# gen_sj_to_lab --- generate short jump to a label

   ipointer function gen_sj_to_lab (label)
   unsigned label

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = SHORT_JUMP_LABEL_INS
   Imem (i + 4) = label

   return (i)
   end



# setup_frame_owner --- gen. code to associate stack frame with a proc

   ipointer function setup_frame_owner (proc_obj_id)
   unsigned proc_obj_id

   include VCG_COMMON

   ipointer i
   ipointer ialloc

   i = ialloc (5)
   Imem (i) = MISC_INSTRUCTION
   Imem (i + 1) = i
   Imem (i + 2) = i
   Imem (i + 3) = SETUP_OWNER_INS
   Imem (i + 4) = proc_obj_id
   return (i)
   end


undefine(FWD)
undefine(REV)
