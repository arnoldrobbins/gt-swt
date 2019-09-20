# put_label --- output label placement instructions

   subroutine put_label (instr)
   ipointer instr

   include VCG_COMMON

   character str (20)
   unsigned label_id
   integer lad (ADDR_DESC_SIZE)

   label_id = Imem (instr + 3)

   if (Emit_PMA == YES)
      {
      str (1) = 'L'c
      call gitoc (label_id, str (2), 19, -10)
      call putlin (str, Outfile)
      call putlin ("_ EQU *"s, Outfile)
      call putch (NEWLINE, Outfile)
      }

   # can't assume labels are only PB%-relative!!!
   if (Emit_Obj == YES)
      {
DB    call print (ERROUT, "put_label: label L*,-10i_*n"p, label_id)
      AD_MODE (lad) = LABELED_AM
      AD_BASE (lad) = 0        # otg takes care of picking the right base register
      AD_LABEL (lad) = label_id
      call otg (LABEL_INSTRUCTION, lad)
      }

   return
   end
