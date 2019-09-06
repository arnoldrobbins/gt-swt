# put_generic --- output PMA representation of a generic instruction

   subroutine put_generic (instr)
   ipointer instr

   include VCG_COMMON

   integer ins, gen_opcode, dummy_ad (ADDR_DESC_SIZE)

   string_table posn, text _

      / A1A_INS,  :141206,   "A1A",
      / A2A_INS,  :140304,   "A2A",
      / ARGT_INS, :000605,   "ARGT",
      / CAL_INS,  :141050,   "CAL",
      / CAR_INS,  :141044,   "CAR",
      / CHS_INS,  :140024,   "CHS",
      / CGT_INS,  :1314,     "CGT",
      / CMA_INS,  :140401,   "CMA",
      / CRA_INS,  :140040,   "CRA",
      / CRB_INS,  :140015,   "CRB",
      / CRE_INS,  :141404,   "CRE",
      / CRL_INS,  :140010,   "CRL",
      / CRLE_INS, :141410,   "CRLE",
      / CSA_INS,  :140320,   "CSA",
      / DFCM_INS, :140574,   "DFCM",
      / DRX_INS,  :140210,   "DRX",
      / FCM_INS,  :140574,   "FCM",
      / FDBL_INS, :140016,   "FDBL",
      / FIN_INS,  :000003,   "FIN",    # special code for otg
      / FLTA_INS, :140532,   "FLTA",
      / FLTL_INS, :140535,   "FLTL",
      / FRN_INS,  :140534,   "FRN",
      / FSGT_INS, :140515,   "FSGT",
      / FSLE_INS, :140514,   "FSLE",
      / FSMI_INS, :140512,   "FSMI",
      / FSNZ_INS, :140511,   "FSNZ",
      / FSPL_INS, :140513,   "FSPL",
      / FSZE_INS, :140510,   "FSZE",
      / IAB_INS,  :000201,   "IAB",
      / ICA_INS,  :141340,   "ICA",
      / ICL_INS,  :141140,   "ICL",
      / ICR_INS,  :141240,   "ICR",
      / ILE_INS,  :141414,   "ILE",
      / INTA_INS, :140531,   "INTA",
      / INTL_INS, :140533,   "INTL",
      / IRX_INS,  :140114,   "IRX",
      / LCEQ_INS, :141503,   "LCEQ",
      / LCGE_INS, :141504,   "LCGE",
      / LCGT_INS, :141505,   "LCGT",
      / LCLE_INS, :141501,   "LCLE",
      / LCLT_INS, :141500,   "LCLT",
      / LCNE_INS, :141502,   "LCNE",
      / LEQ_INS,  :140413,   "LEQ",
      / LF_INS,   :140416,   "LF",
      / LFEQ_INS, :141113,   "LFEQ",
      / LFGE_INS, :141114,   "LFGE",
      / LFGT_INS, :141115,   "LFGT",
      / LFLE_INS, :141111,   "LFLE",
      / LFLT_INS, :141110,   "LFLT",
      / LFNE_INS, :141112,   "LFNE",
      / LGE_INS,  :140414,   "LGE",
      / LGT_INS,  :140415,   "LGT",
      / LINK_INS, :000001,   "LINK",    # special code for otg
      / LLE_INS,  :140411,   "LLE",
      / LLEQ_INS, :141513,   "LLEQ",
      / LLGE_INS, :140414,   "LLGE",
      / LLGT_INS, :141515,   "LLGT",
      / LLLE_INS, :141511,   "LLLE",
      / LLLT_INS, :140410,   "LLLT",
      / LLNE_INS, :141512,   "LLNE",
      / LLT_INS,  :140410,   "LLT",
      / LNE_INS,  :140412,   "LNE",
      / LT_INS,   :140417,   "LT",
      / NOP_INS,  :000001,   "NOP",
      / PIDA_INS, :000115,   "PIDA",
      / PIDL_INS, :000305,   "PIDL",
      / PIMA_INS, :000205,   "PIMA",
      / PIML_INS, :000301,   "PIML",
      / PROC_INS, :000002,   "PROC",    # special code for otg
      / PRTN_INS, :000611,   "PRTN",
      / RCB_INS,  :140200,   "RCB",
      / S1A_INS,  :140110,   "S1A",
      / S2A_INS,  :140310,   "S2A",
      / SAR_INS,  :100260,   "SAR",
      / SAS_INS,  :101260,   "SAS",
      / SCB_INS,  :140600,   "SCB",
      / SGT_INS,  :100220,   "SGT",
      / SKP_INS,  :100000,   "SKP",
      / SLE_INS,  :101220,   "SLE",
      / SLN_INS,  :101100,   "SLN",
      / SLZ_INS,  :100100,   "SLZ",
      / SMI_INS,  :101400,   "SMI",
      / SNZ_INS,  :101040,   "SNZ",
      / SPL_INS,  :100400,   "SPL",
      / SRC_INS,  :100001,   "SRC",
      / SSC_INS,  :101001,   "SSC",
      / SSM_INS,  :140500,   "SSM",
      / SSP_INS,  :140100,   "SSP",
      / STEX_INS, :001315,   "STEX",
      / STPM_INS, :000024,   "STPM",
      / SVC_INS,  :000505,   "SVC",
      / SZE_INS,  :100040,   "SZE",
      / TAB_INS,  :140314,   "TAB",
      / TAK_INS,  :001015,   "TAK",
      / TAX_INS,  :140504,   "TAX",
      / TAY_INS,  :140505,   "TAY",
      / TBA_INS,  :140604,   "TBA",
      / TCA_INS,  :140407,   "TCA",
      / TCL_INS,  :141210,   "TCL",
      / TFLL_INS, :1323,     "TFLL",
      / TKA_INS,  :001005,   "TKA",
      / TLFL_INS, :1321,     "TLFL",
      / TXA_INS,  :141034,   "TXA",
      / TYA_INS,  :141124,   "TYA",
      / XCA_INS,  :140104,   "XCA",
      / XCB_INS,  :140204,   "XCB"

   ins = Imem (instr + 3)
   if (ins < 1 || ins > LAST_GENERIC_INSTRUCTION)
      call panic ("put_generic: bad instr code *i*n"p, ins)

   if (Emit_PMA == YES)
      {
      call putch (' 'c, Outfile)
      call putlin (text (posn (ins + 1) + 2), Outfile)
      call putch (NEWLINE, Outfile)
      }

   if (Emit_Obj == YES)
      {
DB    call print (ERROUT, "put_generic: instruction = *i*n"p, ins)
      gen_opcode = text (posn (ins + 1) + 1)

      select (ins)

         when (PROC_INS, LINK_INS, FIN_INS)
            # special treatment for these pseudo ops
            call otg (PSEUDO_INSTRUCTION, dummy_ad, gen_opcode)

      else
         call otg (GENERIC_INSTRUCTION, dummy_ad, gen_opcode)
      }

   return
   end
