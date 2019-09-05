# vcg_otg2 --- object text generator interface & set-up routines (part 2)
#
#     This is split into 2 pieces because the number of symbols
#     used cause 'rp' to give up the ghost because of a lack
#     of symbol table space. Any extra routines should probably
#     go in a seperate file.

include OTG_DEFS

define(DB,#)


# otg_pseudo --- generate groups to take care of pseudo-ops
#
#                PROC - change load point to PB%
#                LINK - change load point to LB%
#                FIN - generate literal data declaration groups
#                      and reset flag in literal descriptor
#                END - generate final literal data declaration
#                      groups, an end block, and then clean up
#                MODULE - generate the procedure definition group
#                END_PREFIX - generate a data group

   subroutine otg_pseudo (opcode)
   integer opcode

   include OTG_COMMON

   procedure dump_data forward
   procedure switch_to_proc forward
   procedure switch_to_link forward

   integer lit (ADDR_DESC_SIZE), addr (ADDR_DESC_SIZE), resolve_lit,
           resolve_ent, base, offset

   character ext_name (PMA_NAME_LEN), ent_name (PMA_NAME_LEN)
DB character ch
   equivalence (ext_name (1), ent_name (1))

   select (opcode)

      when (PROC_INS)
         switch_to_proc

      when (LINK_INS)
         switch_to_link

      when (FIN_INS)
         {
DB       call print (ERROUT, "otg_pseudo: processing FIN*n"p)
         # jump back into PB if in LB - assumes RLIT specified
         switch_to_proc

         # dump out literal declarations and resolve fwd. refs.
         while (resolve_lit (lit, addr) == YES)
            {
            # resolve forward references
            call otg$rslv (AD_BASE (addr), AD_OFFSET (addr))
            AD_OFFSET (addr) = PB_here
            AD_RESOLVED (addr) = YES

            # emit data decls
            dump_data

            call delete_lit (lit)         # fix up entry for future use
            call enter_lit (lit, addr)
            }
         }

      when (END_INS)
         {
DB       call print (ERROUT, "otg_pseudo: processing END*n"p)
         # jump back into PB if in LB - assumes RLIT specified
         switch_to_proc

         # dump out literal declarations and resolve fwd. refs.
         while (resolve_lit (lit, addr) == YES)
            {
DB          call print (ERROUT, "otg_pseudo: literal ref. at PB%+'*,-8i*n"p,
DB                      AD_OFFSET (addr))
            # resolve forward references
            call otg$rslv (AD_BASE (addr), AD_OFFSET (addr))

            # emit data decls
            dump_data
            }

         # here's where we generate IPs for EXT names that
         # don't have IPs associated with them already
         # i.e., any EXT names left in the table - assume
         # caller only emits 1 EXT per name!!!!
         while (resolve_ext (ext_name, addr) == YES)
            {
            switch_to_link

DB          call print (ERROUT, "otg_pseudo: EXT *s*n"p, ext_name)
            call otg$rslv (AD_BASE (addr), AD_OFFSET (addr))
            call otg$xtip (ext_name)
            }
         call otg$uii (PRIME_400)

         # clean up the mess
         call clear_ext
         call clear_lit

         # fix up the proc definition block
         call otg$blk (PREFIX_BLOCK)
         # (does its own flushing)
         call otg$proc (PB_here, LB_here, 0, 0, FIXUP_PROC)

         # now we go through the table of entry points
         # get their associated object ids and fix up
         # the rest of the prefix block with correct
         # addresses - the block already has enough
         # space reserved so we just write over it
         while (resolve_ent (ent_name, base, offset) == YES)
            {
DB          if (base == PB_REG)
DB             ch = 'P'c
DB          else
DB             ch = 'L'c
DB          call print (ERROUT, "otg_pseudo: ENT *s  *cB%+'*,-8i*n"p,
DB                      ent_name, ch, offset)
            if (base == PB_REG)
               call otg$entpb (ent_name, offset)
            else if (base == LB_REG)
               call otg$entlb (ent_name, offset)
            else
               # SB% is used for locals variables only
               call panic ("otg_pseudo: bad ENT base reg*n"p)
            }
         call otg$proc (0, 0, 0, 0, RESET_PROC)

         call otg$blk (END_BLOCK)
         call otg$endpb (0)
         call flush
         call clear_lab
         }

      when (MODULE_INS)
         {
DB       call print (ERROUT, "otg_pseudo: start of module*n"p)
         call otg$blk (PREFIX_BLOCK)
         call otg$proc (0, 0, 0, 0, INIT_PROC)
         }

      when (END_PREFIX_INS)
         {
DB       call print (ERROUT, "otg_pseudo: end of prefix block*n"p)
         call otg$blk (DATA_BLOCK)
         }

   else
      call panic ("otg_pseudo: bad instr code *i*n"p, opcode)

   return

   # dump_data --- output data groups for a literal

   procedure dump_data {

      select (AD_MODE (lit))
         when (ILIT_AM)
            call otg$data (AD_LIT1 (lit), 1)
         when (LLIT_AM)
            {
            call otg$data (AD_LIT1 (lit), 1)
            call otg$data (AD_LIT2 (lit), 1)
            }
         when (FLIT_AM)
            {
            call otg$data (AD_LIT1 (lit), 1)
            call otg$data (AD_LIT2 (lit), 1)
            }
         when (DLIT_AM)
            {
            call otg$data (AD_LIT1 (lit), 1)
            call otg$data (AD_LIT2 (lit), 1)
            call otg$data (AD_LIT3 (lit), 1)
            call otg$data (AD_LIT4 (lit), 1)
            }
      }

   # switch_to_proc --- squeeze it harder

   procedure switch_to_proc   {
         if (Current_Base == LB_REG)
            {
DB          call print (ERROUT, "otg_pseudo: switching to PROC*n"p)
            Current_Base = PB_REG
            call otg$rorg (PB_here)    # relative org in PB
            }
      }

   # switch_to_link --- and harder

   procedure switch_to_link   {
         if (Current_Base == PB_REG)
            {
DB          call print (ERROUT, "otg_pseudo: switching to LINK*n"p)
            Current_Base = LB_REG
            call otg$orglb (LB_here)
            }
      }

   end


undefine (DB)
