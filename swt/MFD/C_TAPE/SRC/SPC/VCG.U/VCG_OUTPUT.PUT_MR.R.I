# put_mr --- output memory reference instruction

   subroutine put_mr (instr)
   ipointer instr

   include VCG_COMMON

   string_table posn, text _
      / ADD_INS,  :0006,  "ADD",
      / ADL_INS,  :0306,  "ADL",
      / ANA_INS,  :0003,  "ANA",
      / ANL_INS,  :0303,  "ANL",
      / CAS_INS,  :0011,  "CAS",
      / CLS_INS,  :0311,  "CLS",
      / DFAD_INS, :0206,  "DFAD",
      / DFCS_INS, :0211,  "DFCS",
      / DFDV_INS, :0217,  "DFDV",
      / DFLD_INS, :0202,  "DFLD",
      / DFLX_INS, :1215,  "DFLX",
      / DFMP_INS, :0216,  "DFMP",
      / DFSB_INS, :0207,  "DFSB",
      / DFST_INS, :0204,  "DFST",
      / DIV_INS,  :0017,  "DIV",
      / DVL_INS,  :0317,  "DVL",
      / EAL_INS,  :0101,  "EAL",
      / EALB_INS, :0213,  "EALB",
      / EAXB_INS, :0212,  "EAXB",
      / ERA_INS,  :0005,  "ERA",
      / ERL_INS,  :0305,  "ERL",
      / FAD_INS,  :0106,  "FAD",
      / FCS_INS,  :0111,  "FCS",
      / FDV_INS,  :0117,  "FDV",
      / FLD_INS,  :0102,  "FLD",
      / FLX_INS,  :1115,  "FLX",
      / FMP_INS,  :0116,  "FMP",
      / FSB_INS,  :0107,  "FSB",
      / FST_INS,  :0104,  "FST",
      / IMA_INS,  :0013,  "IMA",
      / IRS_INS,  :0012,  "IRS",
      / JMP_INS,  :0001,  "JMP",
      / JST_INS,  :0010,  "JST",
      / JSX_INS,  :1335,  "JSX",
      / JSXB_INS, :0214,  "JSXB",
      / JSY_INS,  :0014,  "JSY",
      / LDA_INS,  :0002,  "LDA",
      / LDL_INS,  :0302,  "LDL",
      / LDLR_INS, :0501,  "LDLR",
      / LDX_INS,  :1035,  "LDX",
      / LDY_INS,  :1135,  "LDY",
      / MPL_INS,  :0316,  "MPL",
      / MPY_INS,  :0016,  "MPY",
      / ORA_INS,  :0203,  "ORA",
      / PCL_INS,  :0210,  "PCL",
      / SBL_INS,  :0307,  "SBL",
      / STA_INS,  :0004,  "STA",
      / STL_INS,  :0304,  "STL",
      / STLR_INS, :0103,  "STLR",
      / STX_INS,  :1015,  "STX",
      / STY_INS,  :1235,  "STY",
      / SUB_INS,  :0007,  "SUB",
      / XEC_INS,  :0201,  "XEC"

   integer mr_ad (ADDR_DESC_SIZE), ins, i, ilit, mr_code
   character str (20)

   long_int llit

   real flit

   long_real dlit

   equivalence (AD_LIT1(mr_ad), ilit), (AD_LIT1(mr_ad), llit),
               (AD_LIT1(mr_ad), flit), (AD_LIT1(mr_ad), dlit)

   character dpstr (20)

   ipointer j

   procedure pba forward

   ins = Imem (instr + 3)

   if (ins < 1 || ins > LAST_MR_INSTRUCTION)
      call panic ("put_mr: bad instr code *i*n"p, ins)

   # copy address descriptor into something we can pass as a chunk
   for ({j = instr + 4; i = 1}; i <= ADDR_DESC_SIZE; {i += 1; j += 1})
      mr_ad (i) = Imem (j)

   if (Emit_PMA == YES)
      {
      call putch (' 'c, Outfile)
      call putlin (text (posn (ins + 1) + 2), Outfile)
      call putch (' 'c, Outfile)

      select (AD_MODE (mr_ad))

         when (DIRECT_AM) {                     # address is base%+offset
            pba
            }

         when (INDEXED_AM) {                    # address is base%+offset,X
            pba
            call putlin (",X"s, Outfile)
            }

         when (INDIRECT_AM) {                   # address is base%+offset,*
            pba
            call putlin (",*"s, Outfile)
            }

         when (INDIRECT_POSTX_AM) {             # address is base%+offset,*X
            pba
            call putlin (",*X"s, Outfile)
            }

         when (PREX_INDIRECT_AM) {              # address is base%+offset,X*
            pba
            call putlin (",X*"s, Outfile)
            }

         when (ILIT_AM) {                       # int or uns literal operand
            str (1) = '='c
            str (2) = "'"c
            call gitoc (ilit, str (3), 18, -8)
            call putlin (str, Outfile)
            }

         when (LLIT_AM) {                       # long int or uns literal
            str (1) = '='c
            str (2) = "'"c
            call gltoc (llit, str (3), 18, -8)
            call putlin (str, Outfile)
            call putch ('L'c, Outfile)
            }

         when (FLIT_AM) {                       # single prec. fp literal
            call rtoc (dlit, dpstr, 20, -11)
            for (i = 1; dpstr (i) ~= EOS; i += 1)
               if (dpstr (i) == 'e'c)
                  dpstr (i) = 'E'c
            for (i = 1; dpstr (i) == ' 'c; i += 1)
               ;
            call putch ('='c, Outfile)
            call putlin (dpstr (i), Outfile)
            }

         when (DLIT_AM) {                       # double prec. fp literal
            call dtoc (dlit, dpstr, 20, -11)
            for (i = 1; dpstr (i) ~= EOS; i += 1)
               if (dpstr (i) == 'e'c)
                  dpstr (i) = 'D'c
            for (i = 1; dpstr (i) == ' 'c; i += 1)
               ;
            call putch ('='c, Outfile)
            call putlin (dpstr (i), Outfile)
            }

         when (LABELED_AM) {
            str (1) = 'L'c
            call gitoc (AD_LABEL (mr_ad), str (2), 19, -10)
            call putlin (str, Outfile)
            call putch ('_'c, Outfile)
            }

      ifany
         call putch (NEWLINE, Outfile)

      else
         call panic ("put_mr: bad instr operand *i*n"p, AD_MODE (mr_ad))
      }


   if (Emit_Obj == YES)
      {
DB    call print (ERROUT, "put_mr: instruction = *i*n"p, ins)
DB    call print (ERROUT, "   AD_MODE = *i*n   AD_BASE = *i*n   AD(3) = *i*n"s,
DB          AD_MODE (mr_ad), AD_BASE (mr_ad), AD_OFFSET (mr_ad))
DB    call print (ERROUT, "   AD(4) = *i*n   AD(5) = *i*n"s,
DB          AD_LIT3 (mr_ad), AD_LIT4 (mr_ad))
      call zero_lit (mr_ad)
      mr_code = text (posn (ins + 1) + 1)

      select (ins)

         when (JMP_INS, JST_INS, JSX_INS, JSXB_INS, JSY_INS)
            if (AD_MODE (mr_ad) == LABELED_AM)
               AD_BASE (mr_ad) = PB_REG   # always for a jump or branch
                                          # to a label

         # as for SETUP_OWNER_INS, we have to trick the loader
         # into stuffing the right address into the instruction for
         # fwd refs.  We start out hoping that we will know where
         # the procedure is located.  If it's a fwd. ref, then we
         # switch the base register to the PB% so the loader will
         # resolve the address correctly.
         when (PCL_INS)
            AD_BASE (mr_ad) = LB_REG

         # for EAL, EALB, EAXB we have to assume that either we
         # already know the address or somebody kludged the address
         # descriptor for the special case of a fwd ref label (e.g.,
         # for the location of the ecb)

      call otg (MR_INSTRUCTION, mr_ad, mr_code)
      }

   return


   # pba --- print base address (base_reg% + offset)

   procedure pba {

      local str; character str (20)

      select (AD_BASE(mr_ad))
         when (PB_REG)
            str (1) = 'P'c
         when (SB_REG)
            str (1) = 'S'c
         when (LB_REG)
            str (1) = 'L'c
         when (XB_REG)
            str (1) = 'X'c

      str (2) = 'B'c
      str (3) = '%'c
      str (4) = '+'c
      str (5) = "'"c
      call gitoc (AD_OFFSET (mr_ad), str (6), 15, -8)
      call putlin (str, Outfile)
      }

   end
