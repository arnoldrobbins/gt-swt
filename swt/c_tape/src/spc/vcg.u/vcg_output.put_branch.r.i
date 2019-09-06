# put_branch --- output particular branch instruction with given target

   subroutine put_branch (instr)
   ipointer instr

   include VCG_COMMON

   integer ins, brad (ADDR_DESC_SIZE), br_addr, br_code
   unsigned br_label

   string_table posn, text _
      / BCEQ_INS, :141602, "BCEQ",
      / BCGE_INS, :141605, "BCGE",
      / BCGT_INS, :141601, "BCGT",
      / BCLE_INS, :141600, "BCLE",
      / BCLT_INS, :141604, "BCLT",
      / BCNE_INS, :141603, "BCNE",
      / BCR_INS,  :141705, "BCR",
      / BCS_INS,  :141704, "BCS",
      / BDX_INS,  :140734, "BDX",
      / BDY_INS,  :140724, "BDY",
      / BEQ_INS,  :140612, "BEQ",
      / BFEQ_INS, :141612, "BFEQ",
      / BFGE_INS, :141615, "BFGE",
      / BFGT_INS, :141611, "BFGT",
      / BFLE_INS, :141610, "BFLE",
      / BFLT_INS, :141614, "BFLT",
      / BFNE_INS, :141613, "BFNE",
      / BGE_INS,  :140615, "BGE",
      / BGT_INS,  :140611, "BGT",
      / BIX_INS,  :141334, "BIX",
      / BIY_INS,  :141324, "BIY",
      / BLE_INS,  :140610, "BLE",
      / BLEQ_INS, :140702, "BLEQ",
      / BLGE_INS, :140615, "BLGE",
      / BLGT_INS, :140701, "BLGT",
      / BLLE_INS, :140700, "BLLE",
      / BLLT_INS, :140614, "BLLT",
      / BLNE_INS, :140703, "BLNE",
      / BLR_INS,  :141707, "BLR",
      / BLS_INS,  :141706, "BLS",
      / BLT_INS,  :140614, "BLT",
      / BMEQ_INS, :141602, "BMEQ",
      / BMGE_INS, :141606, "BMGE",
      / BMGT_INS, :141710, "BMGT",
      / BMLE_INS, :141711, "BMLE",
      / BMLT_INS, :141707, "BMLT",
      / BMNE_INS, :141603, "BMNE",
      / BNE_INS,  :140613, "BNE"

   character str (20)

   br_label = Imem (instr + 4)
   ins = Imem (instr + 3)

   if (ins < 1 || ins > LAST_BRANCH_INSTRUCTION)
      call panic ("put_branch: bad instr code *i*n"p, ins)

   if (Emit_PMA == YES)
      {
      call putch (' 'c, Outfile)
      call putlin (text (posn (ins + 1) + 2), Outfile)
      str (1) = ' 'c
      str (2) = 'L'c
      call gitoc (br_label, str (3), 18, -10)
      call putlin (str, Outfile)
      call putch ('_'c, Outfile)
      call putch (NEWLINE, Outfile)
      }

   if (Emit_Obj == YES)
      {
DB    call print (ERROUT, "put_branch: instruction = *i*n"p, ins)
      br_code = text (posn (ins + 1) + 1)
      AD_MODE (brad) = LABELED_AM
      AD_BASE (brad) = PB_REG
      AD_LABEL (brad) = br_label
      call otg (BRANCH_INSTRUCTION, brad, br_code, LONG_REACH)
      }

   return
   end
