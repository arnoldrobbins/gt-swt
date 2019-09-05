# put_ent --- output an ENT pseudo-op

   subroutine put_ent (extname, obj_id)
   character extname (ARB)
   integer obj_id

   include VCG_COMMON

   integer addr (ADDR_DESC_SIZE), lookup_obj

   if (Emit_PMA == YES)
      call print (Outfile, " ENT *s,L*,-10i_*n"s, extname, obj_id)

   if (Emit_Obj == YES)
      {
DB    call print ("put_ent: ENT *s*n"p, extname)
      # 'vcg' emits all ENTs prior to any defining code
      # so we don't know where they are -- 'otg'
      # fills in a dummy prefix block and puts the right
      # addresses into it after processing the procedure.

      call otg (MISC_INSTRUCTION, extname, ENT_INS, obj_id)
      }

   return
   end
