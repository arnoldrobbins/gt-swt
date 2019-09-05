# put_misc --- output miscellaneous unclassifiable instructions and pseudos

   subroutine put_misc (instr)
   ipointer instr

   define (D64V,:014000)               # 64V-mode keys for ECB

   include VCG_COMMON
   include RTR_COMMON

   integer i, ad (ADDR_DESC_SIZE), ilit, j, ins, shft_count,
           ecb_info (ADDR_DESC_SIZE), dummy (ADDR_DESC_SIZE),
           mode

   equivalence (ad (1), ecb_info (1))

   long_int llit

   real flit

   long_real dlit

   # literals are stored in 1-, 2-, 3-, or 4-word objects and
   # retrieved word by word; thus we can just output each word
   # of a literal and expect to get the correct hunk of data
   equivalence (ilit, AD_LIT1(ad)), (llit, ilit), (flit, ilit), (dlit, ilit)

   character dpstr (20)

   procedure pba forward

   define (LDA,:0002)
   define (STA,:0004)
   define (EAL,:0101)
   define (STL,:0304)

   string_table posn, text _
         / ENT_INS,
         / ECB_INS,
         / ALL_INS,               :041400,
         / IP_INS,
         / EXT_INS,
         / DATA_INS,
         / BSZ_INS,
         / LLL_INS,               :041000,
         / ARL_INS,               :040400,
         / LRL_INS,               :040000,
         / AP_INS,
         / SHORT_JUMP_AHEAD_INS,
         / SHORT_JUMP_LABEL_INS,  :0001,
         / DAC_INS,
         / ARS_INS,               :040500,
         / LRS_INS,               :040100

   ins = Imem (instr + 3)

DB call print (ERROUT, "put_misc: instruction = *i*n"p, ins)

   if (ins == ENT_INS)
      {
      call put_ent (Smem (Imem (instr + 4)), Imem (instr + 5))
      call warning ("ENT emitted in middle of output stream*n"p)
      return
      }

   if (Emit_PMA == YES)
      {
      select (ins)

         when (ECB_INS)
            {
            call print(Outfile,"L*,-10i_ ECB L*,-10i_,,SB%+'*,-8i,*i,'*,-8i*n"s,
               Imem (instr + 4),    # ecb label
               Imem (instr + 5),    # start label
               Imem (instr + 6),    # arg start
               Imem (instr + 7),    # arg count
               Imem (instr + 8))    # stacksize
            }

         when (SETUP_OWNER_INS) {
            call print (Outfile, " EAL L*,-10i_*n"s, Imem (instr + 4))
            call print (Outfile, " STL SB%+18*n LDA ='4000*n STA% SB%*n"s)
            }

         when (ALL_INS)
            call print (Outfile, " ALL *i*n"s, Imem (instr + 4))

         when (LLL_INS)
            call print (Outfile, " LLL *i*n"s, Imem (instr + 4))

         when (ARL_INS)
            call print (Outfile, " ARL *i*n"s, Imem (instr + 4))

         when (LRL_INS)
            call print (Outfile, " LRL *i*n"s, Imem (instr + 4))

         when (ARS_INS)
            call print (Outfile, " ARS *i*n"s, Imem (instr + 4))

         when (LRS_INS)
            call print (Outfile, " LRS *i*n"s, Imem (instr + 4))

         when (IP_INS) {
            if (Imem (instr + 4) == EXTERNAL)
               {
               call mapstr (Smem (Imem (instr + 5)), UPPER)
               call print (Outfile, " IP *s*n"s, Smem (Imem (instr + 5)))
               }
            else
               call print (Outfile, " IP L*,-10i_*n"s, Imem (instr + 5))
            }

         when (IP_RTR_INS)
            call print (Outfile, " IP *s*n"s,
               rtr_text (rtr_pos (Imem (instr + 4) + 1) + 1))

         when (EXT_INS) {
            call mapstr (Smem (Imem (instr + 4)), UPPER)
            call print (Outfile, " EXT *s*n"s, Smem (Imem (instr + 4)))
            }

         when (EXT_RTR_INS) {
            call print (Outfile, " EXT *s*n"s,
               rtr_text (rtr_pos (Imem (instr + 4) + 1) + 1))
            }

         when (DATA_INS)
            call print (Outfile, " DATA '*,-8i*n"s, Imem (instr + 4))

         when (BSZ_INS)
            call print (Outfile, " BSZ '*,-8i*n"s, Imem (instr + 4))

         when (DAC_INS)
            call print (Outfile, " DAC L*,-10i_*n"s, Imem (instr + 4))

         when (SHORT_JUMP_AHEAD_INS)
            call print (Outfile, " JMP# **+*i*n"s, Imem (instr + 4))

         when (SHORT_JUMP_LABEL_INS)
            call print (Outfile, " JMP# L*,-10i_*n"s, Imem (instr + 4))

         when (AP_INS) {
            call print (Outfile, " AP "s)
            for ({i = instr + 6; j = 1}; j <= ADDR_DESC_SIZE; {i += 1; j += 1})
               ad (j) = Imem (i)
            select (AD_MODE (ad))
               when (DIRECT_AM, INDIRECT_AM)
                  pba
               when (ILIT_AM)
                  call print (Outfile, "='*,-8i"s, ilit)
               when (LLIT_AM)
                  call print (Outfile, "='*,-8lL"s, llit)
               when (FLIT_AM) {
                  call rtoc (dlit, dpstr, 20, -11)
                  for (i = 1; dpstr (i) ~= EOS; i += 1)
                     if (dpstr (i) == 'e'c)
                        dpstr (i) = 'E'c
                  for (i = 1; dpstr (i) == ' 'c; i += 1)
                     ;
                  call print (Outfile, "=*s"s, dpstr (i))
                  }
               when (DLIT_AM) {
                  call dtoc (dlit, dpstr, 20, -11)
                  for (i = 1; dpstr (i) ~= EOS; i += 1)
                     if (dpstr (i) == 'e'c)
                        dpstr (i) = 'D'c
                  for (i = 1; dpstr (i) == ' 'c; i += 1)
                     ;
                  call print (Outfile, "=*s"s, dpstr (i))
                  }
               when (LABELED_AM)
                  call print (Outfile, "L*,-10i_"s, AD_LABEL (ad))
            else {
               call warning ("*i: bad ad mode for ap*n"p, AD_MODE (ad))
               return
               }
            if (AD_MODE (ad) == INDIRECT_AM
              || Imem (instr + 4) == STORE_AP
              || Imem (instr + 5) == LAST_AP)
               call putch (','c, Outfile)
            if (AD_MODE (ad) == INDIRECT_AM)
               call putch ('*'c, Outfile)
            if (Imem (instr + 4) == STORE_AP)
               call putch ('S'c, Outfile)
            if (Imem (instr + 5) == LAST_AP)
               call putch ('L'c, Outfile)
            call putch (NEWLINE, Outfile)
            }

      else
         call panic ("put_misc: bad instr code *i*n"p,
            Imem (instr + 3))
      }

   if (Emit_Obj == YES)
      {
      select (ins)

         when (ECB_INS)
            {
DB          call print (ERROUT, "put_misc: building ECB*n"p)
            # define the ecb label
            AD_MODE (ad) = LABELED_AM
            AD_BASE (ad) = LB_REG
            AD_LABEL (ad) = Imem (instr + 4)
            call otg (LABEL_INSTRUCTION, ad)
#
#           Should already know where ecb is in link frame
#           - if we lookup_obj (Imem (instr + 4)) we get the
#           right address (hopefully) - have to allow for recursion
#           so we define the label

            # we have to hack this one to pass the right info
            ecb_info (1) = Imem (instr + 5)    # start label
            ecb_info (2) = Imem (instr + 8)    # stacksize
            ecb_info (3) = Imem (instr + 6)    # arg start
            ecb_info (4) = Imem (instr + 7)    # arg count
            ecb_info (5) = -256                # initial LB% -'400
            call otg (MISC_INSTRUCTION, ecb_info, ECB_INS, D64V)

            }

         when (SETUP_OWNER_INS)
            {
DB          call print (ERROUT, "put_misc: setting up owner*n"p)
            # beat it into submission

            AD_MODE (ad) = LABELED_AM
            AD_BASE (ad) = LB_REG
            AD_LABEL (ad) = Imem (instr + 4)
            call otg (MR_INSTRUCTION, ad, EAL)

            AD_MODE (ad) = DIRECT_AM
            AD_BASE (ad) = SB_REG
            AD_OFFSET (ad) = 18
            call otg (MR_INSTRUCTION, ad, STL)

            AD_MODE (ad) = ILIT_AM
            AD_LIT1 (ad) = :04000
            call otg (MR_INSTRUCTION, ad,  LDA)

            AD_MODE (ad) = DIRECT_AM
            AD_BASE (ad) = SB_REG
            AD_OFFSET (ad) = 0
            call otg (MR_INSTRUCTION, ad, STA)
            }

         when (ALL_INS,
               LLL_INS,
               ARL_INS,
               LRL_INS,
               ARS_INS,
               LRS_INS)
            {
DB          call print (ERROUT, "put_misc: shift instruction*n"p)
            shft_count = Imem (instr + 4)
DB          call print (ERROUT, "   shift count = *i*n"s, shft_count)
            call otg (MISC_INSTRUCTION, ad,
                        text (posn (ins + 1) +1), shft_count)
            }

         when (IP_INS)
            {
            # IPs to externals are always names while
            # IPs to internal locations are ALWAYS label ids
            # both are stored in link base
            if (Imem (instr + 4) == EXTERNAL)
               {
DB             call print (ERROUT, "put_misc: external IP *s*n"p,
DB                Smem (Imem (instr + 5)))
               call mapstr (Smem (Imem (instr + 5)), UPPER)
               call otg (MISC_INSTRUCTION, Smem (Imem (instr + 5)),
                  IP_INS, EXTERNAL)
               # we can pass the IP name because it's a pointer -
               # size diffs. of name & 'ad' in otg don't matter
               }
            else
               {
DB             call print (ERROUT, "put_misc: internal IP*n"p)
               AD_MODE (ad) = LABELED_AM
               AD_BASE (ad) = LB_REG         # labelled objs in LB only
               AD_LABEL (ad) = Imem (instr + 5)
               call otg (MISC_INSTRUCTION, ad, IP_INS, INTERNAL)
               }
            }

         when (IP_RTR_INS)
            {
            # IPs to external run time routines are always
            # names stored in the rtr_name table
DB          call print (ERROUT, "put_misc: external IP *s*n"p,
DB             rtr_text (rtr_pos (Imem (instr + 4) + 1) + 1))
            call otg (MISC_INSTRUCTION,
               rtr_text (rtr_pos (Imem (instr + 4) + 1) + 1),
               IP_INS, EXTERNAL)
            # we can pass the IP name because it's a pointer -
            # size diffs. of name & 'ad' in otg don't matter
            }

         when (EXT_INS)
            {
DB          call print (ERROUT, "put_misc: define EXT*n"p)
            call mapstr (Smem (Imem (instr + 4)), UPPER)
            call otg (MISC_INSTRUCTION, Smem (Imem (instr + 4)), EXT_INS)
            }

         when (EXT_RTR_INS)
            {
DB          call print (ERROUT, "put_misc: define EXT_RTR*n"p)
            call otg (MISC_INSTRUCTION,
               rtr_text (rtr_pos (Imem (instr + 4) + 1) + 1),
               EXT_INS)
            }

         when (DATA_INS)
            {
DB          call print (ERROUT, "put_misc: DATA decl*n"p)
            call otg (MISC_INSTRUCTION, dummy, DATA_INS, Imem (instr + 4))
            }

         when (BSZ_INS)
            {
DB          call print (ERROUT, "put_misc: BSZ*n"p)
            call otg (MISC_INSTRUCTION, dummy, BSZ_INS, Imem (instr + 4))
            }

         when (DAC_INS)
            {
DB          call print (ERROUT, "put_misc: define address constant*n"p)
            AD_MODE (ad) = LABELED_AM
            AD_BASE (ad) = PB_REG
            AD_LABEL (ad) = Imem (instr + 4)
            call otg (MISC_INSTRUCTION, ad, DAC_INS)
            }

         when (SHORT_JUMP_AHEAD_INS)
            {
DB          call print (ERROUT, "put_misc: short jump ahead*n"p)
            # got to figure out an address (PB_here + Imem (instr + 4))
            call otg (MISC_INSTRUCTION, dummy, SHORT_JUMP_AHEAD_INS,
                                                   Imem (instr + 4))
            }

         when (SHORT_JUMP_LABEL_INS)
            {
DB          call print (ERROUT, "put_misc: short jump to label*n"p)
            AD_MODE (ad) = LABELED_AM
            AD_BASE (ad) = PB_REG
            AD_LABEL (ad) = Imem (instr + 4)
            call otg (BRANCH_INSTRUCTION, ad, text (posn (ins + 1) + 1),
               SHORT_REACH)
            }

         when (AP_INS)
            {
DB          call print (ERROUT, "put_misc: define AP*n"p)
            for ({i = instr + 6; j = 1}; j <= ADDR_DESC_SIZE; {i += 1; j += 1})
               ad (j) = Imem (i)

            if (AD_MODE (ad) == INDIRECT_POSTX_AM
               || AD_MODE (ad) == PREX_INDIRECT_AM)
               {
               call warning ("in put_misc: bad addr mode for ap*n"p)
               return
               }

            # figure out the mode
            if (AD_MODE (ad) == INDIRECT_AM)
               mode = AP_I
            else
               mode = AP_D
            if (Imem (instr + 4) == STORE_AP)
               mode += AP_DS
            if (Imem (instr + 5) == LAST_AP)
               mode += AP_DL

            call zero_lit (ad)

            call otg (MISC_INSTRUCTION, ad, AP_INS, mode)
            }

      else
         call panic ("put_misc: bad instr code *i*n"p,
            Imem (instr + 3))
      }

   return


   # pba --- print base address (base_reg% + offset)

   procedure pba {

      select (AD_BASE(ad))
         when (PB_REG)
            call putch ('P'c, Outfile)
         when (SB_REG)
            call putch ('S'c, Outfile)
         when (LB_REG)
            call putch ('L'c, Outfile)
         when (XB_REG)
            call putch ('X'c, Outfile)
      else
         call panic ("put_misc: bad base reg*n"p)

      call print (Outfile, "B%+'*,-8i"s, AD_OFFSET (ad))
      }
   end


# zero_lit --- make sure unused fields in literal descriptors are 0

   subroutine zero_lit (ad)
   integer ad (ADDR_DESC_SIZE)

DB call print (ERROUT, "zero_lit: zero-fill literal descriptor*n"p)
   select (AD_MODE (ad))

      when (ILIT_AM)             # one word in memory
         {
         AD_LIT2 (ad) = 0
         AD_LIT3 (ad) = 0
         AD_LIT4 (ad) = 0
         }

      when (LLIT_AM)             # two words in memory
         {
         AD_LIT3 (ad) = 0
         AD_LIT4 (ad) = 0
         }

      when (FLIT_AM)             # two words in memory
         {
         AD_LIT3 (ad) = 0
         AD_LIT4 (ad) = 0
         }

   return
   end


   undefine (LDA)
   undefine (STA)
   undefine (EAL)
   undefine (STL)
   undefine (PCL)
