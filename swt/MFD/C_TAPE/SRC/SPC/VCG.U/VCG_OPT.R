# vcg_opt --- simplistic optimizer for code generator

define(KNOWN,0)
define(UNKNOWN,1)

define(FWD(i),Imem(i+1))
define(REV(i),Imem(i+2))

define(UTOL(u),rt(intl(u),16))

# optimize --- optimize procedure definition code
#              This code is NOT general purpose; skip instructions,
#              jumps without label targets, and use of exotic instructions
#              like STLR may cause it to fail.
#              However, it will work on the code presently generated.

   subroutine optimize (code)
   ipointer code

   include VCG_COMMON

   ipointer i, new_i
   ipointer gen_generic

   integer a_state, l_state, f_state, lf_state, x_state, xb_state
   integer aad (ADDR_DESC_SIZE), lad (ADDR_DESC_SIZE),
      fad (ADDR_DESC_SIZE), lfad (ADDR_DESC_SIZE), xad (ADDR_DESC_SIZE),
      xbad (ADDR_DESC_SIZE), frame_state

   logical ad_equal, overlap, link_instr_emitted, proc_instr_emitted

   procedure trash forward
   procedure kill_indexed forward
   procedure kill_xb_rel forward
   procedure kill_address (width) forward
   procedure discard_inst forward

DB call print (ERROUT, "optimize:*n"s)

   frame_state = PROC_INS
   link_instr_emitted = FALSE
   proc_instr_emitted = FALSE

   trash
  # We depend here on the fact that code points to a PROC_INS
  # that will never be changed
   for (i = FWD (code); i ~= code; i = FWD (i)) {

      call simplify (i)    # may change i

      if (Imem (i) == GENERIC_INSTRUCTION){
         if (Imem (i + 3) == LINK_INS) {
            if (frame_state == LINK_INS)
               # delete redundant LINK
               discard_inst
            else if (~proc_instr_emitted) {
               if (Imem (REV (i)) == GENERIC_INSTRUCTION
                  && Imem (REV (i) + 3) == PROC_INS) {
                  # take out preceding PROC & current LINK
                  FWD (REV (REV (i))) = FWD (REV (i))
                  REV (i) = REV (REV (i))
                  discard_inst
                  }
               else
                  link_instr_emitted = FALSE
               frame_state = LINK_INS
               }
            else { # just switch frames
               frame_state = LINK_INS
               link_instr_emitted = FALSE
               }
            }
         else if (Imem (i + 3) == PROC_INS) {
            if (frame_state == PROC_INS)
               # delete redundant PROC
               discard_inst
            else if (~link_instr_emitted) {
               if (Imem (REV (i)) == GENERIC_INSTRUCTION
                  && Imem (REV (i) + 3) == LINK_INS) {
                  # take out preceding LINK & current PROC
                  FWD (REV (REV (i))) = FWD (REV (i))
                  REV (i) = REV (REV (i))
                  discard_inst
                  }
               else
                  proc_instr_emitted = FALSE
               frame_state = PROC_INS
               }
            else { # just switch frames
               frame_state = PROC_INS
               proc_instr_emitted = FALSE
               }
            }
         else {
            if (frame_state == PROC_INS)
               proc_instr_emitted = TRUE
            else
               link_instr_emitted = TRUE
            }
         }
      else {
         if (frame_state == PROC_INS)
            proc_instr_emitted = TRUE
         else
            link_instr_emitted = TRUE
         }

      select (Imem (i))

         when (BRANCH_INSTRUCTION)
                ; # no effect under present conditions

         when (LABEL_INSTRUCTION)
            trash

         when (GENERIC_INSTRUCTION) {
            select (Imem (i + 3))
               when (A1A_INS, A2A_INS, CAL_INS, CAR_INS, CHS_INS,
                 CMA_INS, CSA_INS, IAB_INS, ICA_INS, ICR_INS, INTA_INS,
                 LCEQ_INS, LCGE_INS, LCGT_INS, LCLE_INS, LCLT_INS,
                 LCNE_INS, LEQ_INS, LFEQ_INS, LFGE_INS, LFGT_INS,
                 LFLE_INS, LFLT_INS, LFNE_INS, LGE_INS, LGT_INS,
                 LLE_INS, LLEQ_INS, LLGE_INS, LLGT_INS, LLLE_INS,
                 LLLT_INS, LLNE_INS, LLT_INS, LNE_INS, S1A_INS,
                 S2A_INS, SSM_INS, SSP_INS, TBA_INS, TCA_INS,
                 TKA_INS, TYA_INS, XCB_INS,
                 ICL_INS, ILE_INS, INTL_INS, PIDA_INS, PIDL_INS,
                 PIMA_INS, PIML_INS, STEX_INS, TCL_INS, TFLL_INS) {
                  a_state = UNKNOWN
                  l_state = UNKNOWN
                  }
               when (CRA_INS, LF_INS) {
                  if (a_state == KNOWN && AD_MODE (aad) == ILIT_AM
                    && AD_LIT1 (aad) == 0)
                     discard_inst
                  else {
                     a_state = KNOWN
                     AD_MODE (aad) = ILIT_AM
                     AD_LIT1 (aad) = 0
                     if (l_state == KNOWN && AD_MODE (lad) == LLIT_AM)
                        AD_LIT1 (lad) = 0
                     else
                        l_state = UNKNOWN
                     }
                  }
               when (LT_INS) {
                  if (a_state == KNOWN && AD_MODE (aad) == ILIT_AM
                    && AD_LIT1 (aad) == 1)
                     discard_inst
                  else {
                     a_state = KNOWN
                     AD_MODE (aad) = ILIT_AM
                     AD_LIT1 (aad) = 1
                     if (l_state == KNOWN && AD_MODE (lad) == LLIT_AM)
                        AD_LIT1 (lad) = 1
                     else
                        l_state = UNKNOWN
                     }
                  }
               when (CRB_INS) {
                  if (l_state == KNOWN && AD_MODE (lad) == LLIT_AM)
                     AD_LIT2 (lad) = 0
                  else
                     l_state = UNKNOWN
                  }
               when (CRL_INS, CRLE_INS) {
                  if (l_state == KNOWN && AD_MODE (lad) == LLIT_AM
                    && AD_LIT1 (lad) == 0 && AD_LIT2 (lad) == 0)
                     discard_inst
                  else {
                     l_state = KNOWN
                     AD_MODE (lad) = LLIT_AM
                     AD_LIT1 (lad) = 0
                     AD_LIT2 (lad) = 0
                     a_state = KNOWN
                     AD_MODE (aad) = ILIT_AM
                     AD_LIT1 (aad) = 0
                     }
                  }
               when (TAB_INS) {
                  if (l_state == KNOWN && AD_MODE (lad) == LLIT_AM)
                     AD_LIT2 (lad) = AD_LIT1 (lad)
                  else
                     l_state = UNKNOWN
                  }
               when (TAX_INS) {
                  x_state = a_state
                  call ad_copy (aad, xad)
                  kill_indexed
                  }
               when (TXA_INS) {
                  a_state = x_state
                  call ad_copy (xad, aad)
                  l_state = UNKNOWN
                  }
               when (XCA_INS) {
                  if (l_state == KNOWN && AD_MODE (lad) == LLIT_AM) {
                     AD_LIT2 (lad) = AD_LIT1 (lad)
                     AD_LIT1 (lad) = 0
                     }
                  else
                     l_state = UNKNOWN
                  a_state = KNOWN
                  AD_MODE (aad) = ILIT_AM
                  AD_LIT1 (aad) = 0
                  }
               when (ARGT_INS, CGT_INS, FSGT_INS, FSLE_INS, FSMI_INS,
                 FSNZ_INS, FSPL_INS, FSZE_INS, SAR_INS, SAS_INS,
                 SGT_INS, SKP_INS, SLE_INS, SLN_INS, SLZ_INS, SMI_INS,
                 SNZ_INS, SPL_INS, SRC_INS, SSC_INS, SVC_INS, SZE_INS)
                  trash
               when (CRE_INS, FIN_INS, LINK_INS, NOP_INS, PROC_INS,
                 RCB_INS, SCB_INS, STPM_INS, TAK_INS, TAY_INS)
                  ;  # no effect on code we generated
               when (PRTN_INS) {
                        # This should be replaced by a set of general
                        # routines that delete unreachable code
                  if (Imem (REV (i)) == GENERIC_INSTRUCTION
                        && Imem (REV (i) + 3) == PRTN_INS)   # Duplicate
                     discard_inst
                  }
               when (DFCM_INS, FCM_INS, FDBL_INS, FLTA_INS, FLTL_INS,
                 FRN_INS) {
                  f_state = UNKNOWN
                  lf_state = UNKNOWN
                  }
               when (DRX_INS, IRX_INS) {
                  x_state = UNKNOWN
                  kill_indexed
                  }
            else
               ;  # bad generic instruction; will be reported later.
            }  # when (GENERIC_INSTRUCTION)

         when (MISC_INSTRUCTION) {
            select (Imem (i + 3))
               when (ENT_INS, ECB_INS, IP_INS, EXT_INS, DATA_INS,
                 BSZ_INS, AP_INS, DAC_INS)
                  ;  # does nothing in presently generated code
               when (ALL_INS, LLL_INS, ARL_INS, LRL_INS, ARS_INS, LRS_INS) {
                  a_state = UNKNOWN
                  l_state = UNKNOWN
                  }
               when (SHORT_JUMP_LABEL_INS, SHORT_JUMP_AHEAD_INS)
                  trash
               when (SETUP_OWNER_INS)
                  trash
            }

         when (MR_INSTRUCTION) {
            select (Imem (i + 3))
               when (ADD_INS, ADL_INS, ANA_INS, ANL_INS,
                 DIV_INS, DVL_INS, ERA_INS, ERL_INS,
                 IMA_INS, LDLR_INS, MPL_INS, MPY_INS, ORA_INS, SBL_INS,
                 SUB_INS) {
                  a_state = UNKNOWN
                  l_state = UNKNOWN
                  }
               when (CAS_INS, CLS_INS, DFCS_INS, FCS_INS, JMP_INS,
                 JST_INS, JSX_INS, JSXB_INS, JSY_INS, PCL_INS, XEC_INS)
                  trash
               when (DFAD_INS, DFDV_INS, DFMP_INS, DFSB_INS, FAD_INS,
                 FDV_INS, FMP_INS, FSB_INS) {
                  f_state = UNKNOWN
                  lf_state = UNKNOWN
                  }
               when (LDY_INS, STY_INS, EALB_INS)
                  ;     # not used in our code (at the moment)
               when (FLX_INS, DFLX_INS) {
                  x_state = UNKNOWN
                  kill_indexed
                  }
               when (LDA_INS) {
                  # if value is already in A, delete this instruction.
                  # if prev inst is a store into our loc, delete it.
                  # if value is in X, replace with a TXA.
                  # otherwise, leave it alone and record the new state.
                  if (a_state == KNOWN && ad_equal (Imem (i + 4), aad))
                     discard_inst
                  else if (Imem (REV (i)) == MR_INSTRUCTION
                    && Imem (REV (i) + 3) == STA_INS
                    && ad_equal (Imem (i + 4), Imem (REV (i) + 4)))
                     discard_inst
                  else if (x_state == KNOWN
                    && ad_equal (Imem (i + 4), xad)) {
                     call ad_copy (xad, aad)
                     a_state = KNOWN
                     l_state = UNKNOWN
                     new_i = gen_generic (TXA_INS)
                     FWD (new_i) = FWD (i)
                     REV (new_i) = REV (i)
                     FWD (REV (i)) = new_i
                     REV (FWD (i)) = new_i
                     i = new_i
                     a_state = KNOWN
                     call ad_copy (xad, aad)
                     }
                  else {
                     a_state = KNOWN
                     l_state = UNKNOWN
                     call ad_copy (Imem (i + 4), aad)
                     }
                  }
               when (LDL_INS) {
                  # if value is already in L, delete instruction;
                  # if previous inst stores into our addr, delete instruction;
                  # otherwise, leave it alone
                  if (l_state == KNOWN && ad_equal (Imem (i + 4), lad))
                     discard_inst
                  else if (Imem (REV (i)) == MR_INSTRUCTION
                    && Imem (REV (i) + 3) == STL_INS
                    && ad_equal (Imem (i + 4), Imem (REV (i) + 4)))
                     discard_inst
                  else {
                     l_state = KNOWN
                     call ad_copy (Imem (i + 4), lad)
                     call ad_copy (lad, aad)
                     if (AD_MODE (lad) == LLIT_AM)
                        AD_MODE (aad) = ILIT_AM
                     a_state = KNOWN
                     }
                  }
               when (FLD_INS) {
                  # if value is already in F, delete the load
                  # if previous inst stores into our addr, delete the load
                  if (f_state == KNOWN && ad_equal (Imem (i + 4), fad))
                     discard_inst
                  else if (Imem (REV (i)) == MR_INSTRUCTION
                    && Imem (REV (i) + 3) == FST_INS
                    && ad_equal (Imem (i + 4), Imem (REV (i) + 4)))
                     discard_inst
                  else {
                     f_state = KNOWN
                     call ad_copy (Imem (i + 4), fad)
                     }
                  lf_state = UNKNOWN
                  }
               when (DFLD_INS) {
                  # if value is already in LF, delete the load
                  # if prev inst is store into our addr, delete the load
                  if (lf_state == KNOWN && ad_equal (Imem (i + 4), lfad))
                     discard_inst
                  else if (Imem (REV (i)) == MR_INSTRUCTION
                    && Imem (REV (i) + 3) == DFST_INS
                    && ad_equal (Imem (i + 4), Imem (REV (i) + 4)))
                     discard_inst
                  else {
                     lf_state = KNOWN
                     call ad_copy (Imem (i + 4), lfad)
                     }
                  f_state = UNKNOWN
                  }
               when (LDX_INS) {
                  # if value is already in X, delete the load.
                  # if prev inst is store into our addr, delete the load.
                  # if value is in A, generate TAX and kill indexed refs.
                  # otherwise, leave the instruction alone. Record state.
                  if (x_state == KNOWN && ad_equal (Imem (i + 4), xad))
                     discard_inst
                  else if (Imem (REV (i)) == MR_INSTRUCTION
                    && Imem (REV (i) + 3) == STX_INS
                    && ad_equal (Imem (i + 4), Imem (REV (i) + 4)))
                     discard_inst
                  else if (a_state == KNOWN
                    && ad_equal (Imem (i + 4), aad)) {
                     new_i = gen_generic (TAX_INS)
                     FWD (new_i) = FWD (i)
                     REV (new_i) = REV (i)
                     FWD (REV (i)) = new_i
                     REV (FWD (i)) = new_i
                     i = new_i
                     x_state = KNOWN
                     call ad_copy (aad, xad)
                     kill_indexed
                     }
                  else {
                     x_state = KNOWN
                     call ad_copy (Imem (i + 4), xad)
                     kill_indexed
                     }
                  }
               when (STLR_INS) {    # used only to set XB in our code
                  # kill anything based on XB
                  xb_state = l_state
                  call ad_copy (lad, xbad)
                  kill_xb_rel
                  }
               when (EAL_INS) {
                  a_state = UNKNOWN
                  l_state = UNKNOWN
                  }
               when (EAXB_INS) {
                  xb_state = UNKNOWN
                  kill_xb_rel
                  }
               when (IRS_INS)
                  kill_address (1)
               when (STA_INS)
                  {
                  kill_address (1)
                  if (a_state == UNKNOWN)
                     {
                     a_state = KNOWN
                     call ad_copy (Imem (i + 4), aad)
                     }
                  }
               when (STX_INS)
                  {
                  kill_address (1)
                  if (x_state == UNKNOWN)
                     {
                     x_state = KNOWN
                     call ad_copy (Imem (i + 4), xad)
                     }
                  }
               when (STL_INS)
                  {
                  kill_address (2)
                  if (l_state == UNKNOWN)
                     {
                     l_state = KNOWN
                     call ad_copy (Imem (i + 4), lad)
                     }
                  }
               when (FST_INS)
                  {
                  kill_address (2)
                  if (f_state == UNKNOWN)
                     {
                     f_state = KNOWN
                     call ad_copy (Imem (i + 4), fad)
                     }
                  }
               when (DFST_INS)
                  {
                  kill_address (4)
                  if (lf_state == UNKNOWN)
                     {
                     lf_state = KNOWN
                     call ad_copy (Imem (i + 4), lfad)
                     }
                  }
            }  # end of MR_INSTRUCTION case

      }  # end of code scanning loop

   return


   procedure trash {
      a_state = UNKNOWN
      l_state = UNKNOWN
      f_state = UNKNOWN
      lf_state = UNKNOWN
      x_state = UNKNOWN
      xb_state = UNKNOWN
      }


   procedure kill_indexed {      # kill any addresses based on X
      if (a_state == KNOWN && (AD_MODE (aad) == INDEXED_AM
        || AD_MODE (aad) == INDIRECT_POSTX_AM
        || AD_MODE (aad) == PREX_INDIRECT_AM)) {
         a_state = UNKNOWN
         l_state = UNKNOWN
         }
      if (l_state == KNOWN && (AD_MODE (lad) == INDEXED_AM
        || AD_MODE (lad) == INDIRECT_POSTX_AM
        || AD_MODE (lad) == PREX_INDIRECT_AM)) {
         a_state = UNKNOWN
         l_state = UNKNOWN
         }
      if (f_state == KNOWN && (AD_MODE (fad) == INDEXED_AM
        || AD_MODE (fad) == INDIRECT_POSTX_AM
        || AD_MODE (fad) == PREX_INDIRECT_AM)) {
         f_state = UNKNOWN
         lf_state = UNKNOWN
         }
      if (lf_state == KNOWN && (AD_MODE (lfad) == INDEXED_AM
        || AD_MODE (lfad) == INDIRECT_POSTX_AM
        || AD_MODE (lfad) == PREX_INDIRECT_AM)) {
         f_state = UNKNOWN
         lf_state = UNKNOWN
         }
#  We don't kill X, since it was set in the process of getting here.
#      if (x_state == KNOWN && (AD_MODE (xad) == INDEXED_AM
#        || AD_MODE (xad) == INDIRECT_POSTX_AM
#        || AD_MODE (xad) == PREX_INDIRECT_AM))
#         x_state = UNKNOWN
      if (xb_state == KNOWN && (AD_MODE (xbad) == INDEXED_AM
        || AD_MODE (xbad) == INDIRECT_POSTX_AM
        || AD_MODE (xbad) == PREX_INDIRECT_AM))
         xb_state = UNKNOWN
      }


   procedure kill_xb_rel {    # kill any addresses based on XB
      if (a_state == KNOWN)
         select (AD_MODE (aad))
            when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM, LABELED_AM)
               ;
         else
            if (AD_BASE (aad) == XB_REG) {
               a_state = UNKNOWN
               l_state = UNKNOWN
               }
      if (l_state == KNOWN)
         select (AD_MODE (lad))
            when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM, LABELED_AM)
               ;
         else
            if (AD_BASE (lad) == XB_REG) {
               a_state = UNKNOWN
               l_state = UNKNOWN
               }
      if (f_state == KNOWN)
         select (AD_MODE (fad))
            when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM, LABELED_AM)
               ;
         else
            if (AD_BASE (fad) == XB_REG) {
               f_state = UNKNOWN
               lf_state = UNKNOWN
               }
      if (lf_state == KNOWN)
         select (AD_MODE (lfad))
            when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM, LABELED_AM)
               ;
         else
            if (AD_BASE (lfad) == XB_REG) {
               f_state = UNKNOWN
               lf_state = UNKNOWN
               }
      if (x_state == KNOWN)
         select (AD_MODE (xad))
            when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM, LABELED_AM)
               ;
         else
            if (AD_BASE (xad) == XB_REG)
               x_state = UNKNOWN
#  We don't kill XB, since it was set in the process of getting here.
#      if (xb_state == KNOWN)
#         select (AD_MODE (xbad))
#            when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM, LABELED_AM)
#               ;
#         else
#            if (AD_BASE (xbad) == XB_REG)
#               xb_state = UNKNOWN
      }


   procedure kill_address (width) {
      integer width

      # Here we kill any registers whose contents originated in a
      #  word within range of the address in the current instruction.
      #  Note that registers loaded from a constant should never be
      #  killed.

      local mode, base, offset
      integer mode, base, offset

      mode = Imem (i + 4)     # secret knowledge of AD_MODE
      base = Imem (i + 5)
      offset = Imem (i + 6)

      if (mode == LABELED_AM || base == XB_REG)
         trash    # I don't feel like handling these cases now.
      else if (mode == INDEXED_AM || mode == INDIRECT_AM
        || mode == INDIRECT_POSTX_AM || mode == PREX_INDIRECT_AM) {
         # Terminate any and all aliases, with extreme prejudice.
         if (a_state == KNOWN && AD_MODE (aad) ~= ILIT_AM) {
            a_state = UNKNOWN
            l_state = UNKNOWN
            }
         if (l_state == KNOWN && AD_MODE (lad) ~= LLIT_AM) {
            a_state = UNKNOWN
            l_state = UNKNOWN
            }
         if (f_state == KNOWN && AD_MODE (fad) ~= FLIT_AM) {
            f_state = UNKNOWN
            lf_state = UNKNOWN
            }
         if (lf_state == KNOWN && AD_MODE (lfad) ~= DLIT_AM) {
            f_state = UNKNOWN
            lf_state = UNKNOWN
            }
         if (x_state == KNOWN && AD_MODE (xad) ~= ILIT_AM)
            x_state = UNKNOWN
         if (xb_state == KNOWN && AD_MODE (xbad) ~= LLIT_AM)
            xb_state = UNKNOWN
         }
      else {
         # Kill any registers whose contents overlap the address
         if (a_state == KNOWN && AD_MODE (aad) == DIRECT_AM
           && AD_BASE (aad) == base
           && overlap (AD_OFFSET (aad), 1, offset, width)) {
            a_state = UNKNOWN
            l_state = UNKNOWN
            }
         if (l_state == KNOWN && AD_MODE (lad) == DIRECT_AM
           && AD_BASE (lad) == base
           && overlap (AD_OFFSET (lad), 2, offset, width)) {
            a_state = UNKNOWN
            l_state = UNKNOWN
            }
         if (f_state == KNOWN && AD_MODE (fad) == DIRECT_AM
           && AD_BASE (fad) == base
           && overlap (AD_OFFSET (fad), 2, offset, width)) {
            f_state = UNKNOWN
            lf_state = UNKNOWN
            }
         if (lf_state == KNOWN && AD_MODE (lfad) == DIRECT_AM
           && AD_BASE (lfad) == base
           && overlap (AD_OFFSET (lfad), 4, offset, width)) {
            f_state = UNKNOWN
            lf_state = UNKNOWN
            }
         if (x_state == KNOWN && AD_MODE (xad) == DIRECT_AM
           && AD_BASE (xad) == base
           && overlap (AD_OFFSET (xad), 1, offset, width))
            x_state = UNKNOWN
         if (xb_state == KNOWN && AD_MODE (xbad) == DIRECT_AM
           && AD_BASE (xbad) == base
           && overlap (AD_OFFSET (xbad), 2, offset, width))
            xb_state = UNKNOWN
         }
      }


   procedure discard_inst {
      FWD (REV (i)) = FWD (i)
      REV (FWD (i)) = REV (i)
      i = REV (i)
      }


   end



# simplify --- replace an instruction with a simpler one

   subroutine simplify (instr)
   ipointer instr

   include VCG_COMMON

   ipointer new_instr, i
   ipointer gen_generic, gen_mr

   integer ad (ADDR_DESC_SIZE)

   procedure replace forward

   i = instr

   select (Imem (i))

      when (MR_INSTRUCTION) {
         select (Imem (i + 3))

            when (LDA_INS) {
               call ad_copy (Imem (i + 4), ad)
               if (AD_MODE (ad) == ILIT_AM && AD_LIT1 (ad) == 0) {
                  new_instr = gen_generic (CRA_INS)
                  replace
                  }
               else if (AD_MODE (ad) == ILIT_AM && AD_LIT1 (ad) == 1) {
                  new_instr = gen_generic (LT_INS)
                  replace
                  }
               }

# Commented out because it's probably not worth it, and also because
#  CAZ isn't defined:
#            when (CAS_INS) {
#               call ad_copy (Imem (i + 4), ad)
#               if (AD_MODE (ad) == ILIT_AM && AD_LIT1 (ad) == 0) {
#                  new_instr = gen_generic (CAZ_INS)
#                  replace
#                  }
#               }

            when (LDL_INS) {
               call ad_copy (Imem (i + 4), ad)
               if (AD_MODE (ad) == LLIT_AM && AD_LIT1 (ad) == 0
                 && AD_LIT2 (ad) == 0) {
                  new_instr = gen_generic (CRL_INS)
                  replace
                  }
               }

            when (EAL_INS) {
               call ad_copy (Imem (i + 4), ad)
               if (AD_MODE (ad) == INDIRECT_AM) {
                  AD_MODE (ad) = DIRECT_AM
                  new_instr = gen_mr (LDL_INS, ad)
                  replace
                  }
               }

            when (ADD_INS) {
               call ad_copy (Imem (i + 4), ad)
               if (AD_MODE (ad) == ILIT_AM)
                  select (AD_LIT1 (ad))
                     when (1)
                        new_instr = gen_generic (A1A_INS)
                     when (2)
                        new_instr = gen_generic (A2A_INS)
                     when (-1)
                        new_instr = gen_generic (S1A_INS)
                     when (-2)
                        new_instr = gen_generic (S2A_INS)
                  ifany
                     replace
               }

            when (SUB_INS) {
               call ad_copy (Imem (i + 4), ad)
               if (AD_MODE (ad) == ILIT_AM)
                  select (AD_LIT1 (ad))
                     when (1)
                        new_instr = gen_generic (S1A_INS)
                     when (2)
                        new_instr = gen_generic (S2A_INS)
                     when (-1)
                        new_instr = gen_generic (A1A_INS)
                     when (-2)
                        new_instr = gen_generic (A2A_INS)
                  ifany
                     replace
               }

         }  # end MR_INSTRUCTION case of instruction type

   else
      ; # bad instruction type, but we'll wait to complain later

   return


   procedure replace {
      FWD (REV (instr)) = new_instr
      REV (FWD (instr)) = new_instr
      FWD (new_instr) = FWD (instr)
      REV (new_instr) = REV (instr)
      instr = new_instr
      }


   end



# overlap --- determine if two address ranges overlap

   logical function overlap (start1, len1, start2, len2)
   unsigned start1, len1, start2, len2

   long_int low, high

   if (UTOL (start1) < UTOL (start2))
      low = UTOL (start1)
   else
      low = UTOL (start2)

   if (UTOL (start1 + len1) > UTOL (start2 + len2))
      high = UTOL (start1 + len1)
   else
      high = UTOL (start2 + len2)

   return (high - low < len1 + len2)
   end



# ad_copy --- copy one address descriptor into another

   subroutine ad_copy (src, dst)
   integer src (ADDR_DESC_SIZE), dst (ADDR_DESC_SIZE)

   integer i

   for (i = 1; i <= ADDR_DESC_SIZE; i += 1)
      dst (i) = src (i)

   return
   end



# ad_equal --- return TRUE if two address descriptors are identical

   logical function ad_equal (ad1, ad2)
   integer ad1 (ADDR_DESC_SIZE), ad2 (ADDR_DESC_SIZE)

   if (AD_MODE (ad1) ~= AD_MODE (ad2))
      return (FALSE)

   select (AD_MODE (ad1))
      when (ILIT_AM)
         return (AD_LIT1 (ad1) == AD_LIT1 (ad2))
      when (LLIT_AM, FLIT_AM)
         return (AD_LIT1 (ad1) == AD_LIT1 (ad2) _
            & AD_LIT2 (ad1) == AD_LIT2 (ad2))
      when (DLIT_AM)
         return (AD_LIT1 (ad1) == AD_LIT1 (ad2) _
            & AD_LIT2 (ad1) == AD_LIT2 (ad2) _
            & AD_LIT3 (ad1) == AD_LIT3 (ad2) _
            & AD_LIT4 (ad1) == AD_LIT4 (ad2))
      when (LABELED_AM)
         return (AD_LABEL (ad1) == AD_LABEL (ad2))
      when (DIRECT_AM, INDIRECT_AM, INDEXED_AM,
        INDIRECT_POSTX_AM, PREX_INDIRECT_AM)
         return (AD_BASE (ad1) == AD_BASE (ad2) _
            & AD_OFFSET (ad1) == AD_OFFSET (ad2))
   else
      call warning ("*i: bad address descriptor mode in ad_equal*n"p,
         AD_MODE (ad1))

   return (FALSE)
   end



undefine(FWD)
undefine(REV)
undefine(KNOWN)
undefine(UNKNOWN)
undefine(UTOL)
