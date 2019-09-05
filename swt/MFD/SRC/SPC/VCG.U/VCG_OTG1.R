# vcg_otg1 --- object text generator interface & set-up routines
#
#     This is split into 2 pieces because the number of symbols
#     used cause 'rp' to give up the ghost because of a lack
#     of symbol table space. Any extra routines should probably
#     go in a seperate file.

include OTG_DEFS

define (DB,#)

#  init_otg --- initialize the otg common blocks

   subroutine init_otg (fd)
   file_des fd

   include OTG_COMMON

DB call print (ERROUT, "initializing otg*n"p)
   Fd = fd
   Data_ptr = 0
   PB_here = 0
   LB_here = 0
   Current_Base = PB_REG    # start out in PB% as PMA does
   Resolve_proc = NO
   call clear_lab
   call clear_lit
   call clear_ext
   call clear_ent

   return
   end


# otg --- produce object text groups

   subroutine otg (instr_class, addr_desc, opcode, extra)
   integer instr_class, addr_desc (ADDR_DESC_SIZE), opcode, extra

   bool missin

   select  (instr_class)
      when (BRANCH_INSTRUCTION)
         {
         if (missin (extra))
            call panic ("otg: missin parm*n"p)
DB       call print (ERROUT, "otg: BRANCH_INSTRUCTION *,-8i*n"s, opcode)
         call otg_branch (opcode, addr_desc, extra)
         }
      when (MR_INSTRUCTION)
         {
DB       call print (ERROUT, "otg: MR_INSTRUCTION *,-8i*n"s, opcode)
         call otg_mr (opcode, addr_desc)
         }
      when (LABEL_INSTRUCTION)
         {
DB       call print (ERROUT, "otg: LABEL_INSTRUCTION*n"p)
         call otg_label (addr_desc)
         }
      when (GENERIC_INSTRUCTION)
         {
         if (missin (opcode))
            call panic ("otg: missin parm*n"p)
DB       call print (ERROUT, "otg: GENERIC_INSTRUCTION *,-8i*n"s, opcode)
         call otg$gen (opcode)         # don't mess around
         }
      when (MISC_INSTRUCTION)
         {
DB       call print (ERROUT, "otg: MISC_INSTRUCTION *,-8i*n"s, opcode)
         if (missin (extra))
            call otg_misc (opcode, addr_desc)
         else
            call otg_misc (opcode, addr_desc, extra)
         }
      when (PSEUDO_INSTRUCTION)
         # PROC, LINK, FIN, END, MODULE
         {
DB       call print (ERROUT, "otg: PSEUDO_INSTRUCTION*n"p)
         if (missin (opcode))
            call panic ("otg: missin parm*n"p)
         call otg_pseudo (opcode)
         }
   else
      call panic ("otg: bad instr type *i*n"p, instr_class)

   return
   end



# otg_branch --- output particular branch instruction with given target:
#                hook onto a forward reference chain if target is
#                as yet undefined / unresolved
#
#                'br_code' is the opcode of the particular branch instr
#                while 'addr' is an address descriptor with AD_MODE =
#                LABELED_AM.  'reach' signals SHORT or LONG instruction.
#
#                The branch instruction is built as a generic opcode
#                followed by a DAC.  This is necessary because forward
#                references must apparently be one-word instructions.
#                (see otg$brnch)

   subroutine otg_branch (br_code, addr, reach)
   integer br_code, addr (ADDR_DESC_SIZE), reach

   include OTG_COMMON

   integer brad (ADDR_DESC_SIZE), br_offset
   bool fwd_ref

DB call print (ERROUT, "otg_branch: opcode = *,-8i*n"s, br_code)
DB call print (ERROUT, "   mode = *i, base = *i*n"s, AD_MODE (addr), AD_BASE (addr))

   if (AD_MODE (addr) ~= LABELED_AM || AD_BASE (addr) ~= PB_REG)
      call panic ("otg_branch: bad addr descr*n"p)

   if (reach == SHORT_REACH)
      # for now, all of these are direct, PB%-relative
      {
      call get_label_addr (addr, brad, fwd_ref, YES)
DB    call print (ERROUT, "   short mref: "s)
DB    if (fwd_ref)
DB       call print (ERROUT, "   fwd ref"s)
DB    call print (ERROUT, "*n"s)
      call otg$mref (br_code, MR_DS, PB_REG, AD_OFFSET (brad), fwd_ref)
      }
   else
      {
      call get_label_addr (addr, brad, fwd_ref)
      call otg$brnch (br_code, AD_OFFSET (brad), fwd_ref)
      }

   return
   end


# otg_label --- output a resolve-fwd-references group if
#               a label has been referenced but not defined.
#               save label & its address in object table for
#               future reference
#
#               'addr' is an address descriptor with AD_MODE =
#               LABELED_AM.  Assume that a LINK or PROC pseudo
#               op  has been emitted to throw us into the right mode.
#
#               For now,
#               we can assume that any forward (or other kind of)
#               reference is made to the proc base exclusively.
#               Thus, we don't need to specify the base register
#               of the referencing instructions to the resolution
#               group (I hope).

   subroutine otg_label (addr)
   integer addr (ADDR_DESC_SIZE)

   include OTG_COMMON

   unsigned label_id
   integer lad (ADDR_DESC_SIZE), lookup_lab, label_base
DB character base

   procedure get_offset forward

   if (AD_MODE (addr) ~= LABELED_AM)
      call panic ("otg_label: bad addr descr*n"p)

   label_id = AD_LABEL (addr)
   label_base = Current_Base

   # label never referenced in a forward manner -
   # define for future references
   if (lookup_lab (label_id, lad) == NO)
      {
DB    call print (ERROUT, "otg_label: new label*n"p)
      AD_MODE (lad) = DIRECT_AM
      AD_BASE (lad) = label_base

      get_offset

      AD_RESOLVED (lad) = YES

      call enter_lab (label_id, lad)
      }

   # label has been referenced but not defined -
   # need to output group to resolve all forward references
   else if (AD_RESOLVED (lad) == NO)
      {
DB    call print (ERROUT, "otg_label: fwd referenced label*n"p)
      call otg$rslv (AD_BASE (lad), AD_OFFSET (lad))

      # now reset the offset to the current location and
      # set the flag word so we know we saw the label already
      call delete_lab (label_id)

      get_offset

      AD_RESOLVED (lad) = YES

      call enter_lab (label_id, lad)
      }

   # label already in table - we trust the calling
   # program to make sure label names are unique
   else
      {
DB    call print (ERROUT, "otg_label: L*,-10i_ defined*n"p, label_id)
      }

DB if (AD_BASE (lad) == PB_REG)
DB    base = 'P'c
DB else
DB    base = 'L'c
DB call print (ERROUT, "otg_label: L*,-10i_ at *cB% + '*,-8i*n"p,
DB                   label_id, base, AD_OFFSET (lad))

   return

   procedure get_offset {     # squeeze this sucker!!

      # assume we can't have labels anywhere else
      if (label_base == PB_REG)
         AD_OFFSET (lad) = PB_here
      else
         AD_OFFSET (lad) = LB_here
         # if vcg knows where a label in the LINK frame
         # is, it sends us the right address.  The only time
         # it won't know the object location is for
         # an ECB, so it always sends us a label.  Here
         # we have to add the '400 offset to square
         # things with anybody calling the procedure.
      }

   end


# otg_mr --- output memory reference group
#
#            'opcode' is the instruction opcode, of course.
#            'addr' is an address descriptor that tells where
#            the instruction references.
#
###          For mem refs to literals, we force the instruction
###          to be short.  We could test to see if the instr
###          is in range & only generate shorts if it is, but
###          we can let the loader generate sector 0 links
###          as needed (& hope it doesn't run out of space).
###          If the loader does run out of space, change the
###          MR_DS flag to MR_D (otg$mref won't check these)
###          and fix 'get_lit_addr' to add 1 to the offset.
#
#            For mem refs to the stack, we *always* know where
#            the reference will be so we can generate short instrs
#            if possible.  Should be the same for LB% refs if they
#            aren't fwd refs. (hidden in otg$mref)
#
#            Any other mr instructions are output in long format.

   subroutine otg_mr (opcode, addr)
   integer opcode, addr (ADDR_DESC_SIZE)

   include OTG_COMMON

   integer mr_offset, mr_base, mode, lookup_lit, mrad (ADDR_DESC_SIZE)

   bool fwd_ref

DB call print (ERROUT, "otg_mr: opcode = *i*n"p, opcode)

   # set up defaults
   mr_offset = AD_OFFSET (addr)

   mr_base = AD_BASE (addr)

   fwd_ref = FALSE

   select (AD_MODE (addr))

      when (DIRECT_AM)                    # address is base%+offset
         mode = MR_D

      when (INDEXED_AM)                   # address is base%+offset,X
         mode = MR_X

      when (INDIRECT_AM)                  # address is base%+offset,*
         mode = MR_I

      when (INDIRECT_POSTX_AM)            # address is base%+offset,*X
         mode = MR_IX

      when (PREX_INDIRECT_AM)             # address is base%+offset,X*
         mode = MR_XI

      when (ILIT_AM,                      # int or uns literal operand
            LLIT_AM,                      # long int or uns literal
            FLIT_AM,                      # single prec. fp literal
            DLIT_AM)                      # double prec. fp literal
         {
         mode = MR_D                      # force it to be short
         mr_base = PB_REG                 # always

         # have to look this one up in the literal table -
         call zero_lit (addr)
         call get_lit_addr (addr, mrad, fwd_ref, LONG)
         mr_offset = AD_OFFSET (mrad)
         }

      when (LABELED_AM)
         {
         mode = MR_D

         call get_label_addr (addr, mrad, fwd_ref)
         mr_base = AD_BASE (mrad)
         mr_offset = AD_OFFSET (mrad)
         }

#  mr_base = fixup_base (mr_base)

DB call print (ERROUT, "   opcode = *,-8i*n   base = *i*n   offset = '*,-8i*n"s,
DB                         opcode, mr_base, mr_offset)

   # The loader is too stupid to give us the right LB%
   # offset when we give it a fwd ref from the PB% to an
   # object in the LB%; instead it calculates the actual
   # PB%-rel address of the object (not the offset in the LB%).
   # Here we trick loader into sticking the right
   # address into instruction... eg., for a PCL, the ECB
   # follows any static data areas which the loader stuffs
   # right after the end of the procedure code; so, we reference
   # the ECB directly rather than trying to go thru the LB% reg.
   # This strategy depends on the fact that the only objects
   # in the link frame we don't know about are the ECB's
   # (such as in the case of calling a module defined later
   # in the same "file").  We never get fwd refs to any other
   # kind of object in the LB% (or we're in *bad* trouble).

   if (fwd_ref && mr_base == LB_REG)
      mr_base = PB_REG

   call otg$mref (opcode, mode, mr_base, mr_offset, fwd_ref)


   return
   end



# otg_misc --- produce object text groups for miscellaneous instructions
#
#              The instructions covered here include:
#
#                 IP_INS
#                 ECB_INS
#                 shift instructions with known shift counts
#                    (ALL, ARL, ARS, LLL, LRL, LRS)
#                 ENT_INS
#                 EXT_INS
#                 AP_INS
#                 DATA_INS
#                 BSZ_INS
#                 DAC_INS
#                 SHORT_JUMP_AHEAD_INS
#                 PCL to EXTernal name
#

   subroutine otg_misc (opcode, instr_info, extra)
   integer opcode, instr_info (ADDR_DESC_SIZE), extra

   include OTG_COMMON

   integer ad (ADDR_DESC_SIZE), lookup_ext, lookup_lab, base,
      lad (ADDR_DESC_SIZE)
   bool fwd_ref

   select (opcode)

      when (IP_INS)
         # If 'extra' signals an external name, look in
         # the external name table to see if it's there.
         # Expects 'instr_info' to be a pointer to the
         # first character of an EOS-terminated string.
         # We always try to put external ip's in the LINK
         # frame (this could get messy if the calling routine
         # doesn't enforce the convention)
         # If 'extra' signals an internal name then we treat
         # 'instr_info' as an address descriptor with AD_MODE
         # LABELED_AM & look it up in the label table.
         {
DB       call print (ERROUT, "otg_misc: IP*n"p)
         if (extra == EXTERNAL)
            {
            # delete ext name since it's defined here
            # this means we know where it is already
            # if never defined, then it's a fwd ref
            # see END_INS
            if (lookup_ext (instr_info, ad, fwd_ref) == NO)
               call panic ("otg_misc: IP to undef EXT name*n"p)
            else
               call delete_ext (instr_info)

            call otg_pseudo (LINK_INS)
            call otg$xtip (instr_info)
            }

         else
            # vcg generates these to intialize static pointer variables
            {
            if (AD_MODE (instr_info) ~= LABELED_AM)
               call panic ("otg_misc: IP to bad obj descr*n"p)

            call get_label_addr (instr_info, ad, fwd_ref)

#           if (fwd_ref)
#              call panic ("in otg_misc: fwd referencing ip illegal*n"p)
#
#           may as well allow fwd refs

            if (AD_BASE (ad) == PB_REG)
               call otg$ip (AD_OFFSET (ad), IPPROC_GROUP)
            else
               call otg$ip (AD_OFFSET (ad), IPLINK_GROUP)
            }
         }

      when (ECB_INS)
         {
DB       call print (ERROUT, "otg_misc: ECB*n"p)
DB       call print (ERROUT, "   start label = L*,-10i_*n"s, instr_info (1))
DB       call print (ERROUT, "   stack size = '*,-8i*n"s, instr_info (2))
DB       call print (ERROUT, "   stack start = SB%+'*,-8i*n"s, instr_info (3))
DB       call print (ERROUT, "   arg count = *i*n"s, instr_info (4))
DB       call print (ERROUT, "   LB offset = *,8i*n"s, instr_info (5))
DB       call print (ERROUT, "   keys = *,-8i*n"s, extra)
         # for now, assume it's in the LINK frame
         ECB_start = LB_here
         AD_MODE (lad) = LABELED_AM
         AD_BASE (lad) = PB_REG
         AD_LABEL (lad) = instr_info (1)
         call get_label_addr (lad, ad, fwd_ref)
DB       call print (ERROUT, "*n      start = *,-8iP*n"s, AD_OFFSET (ad))
         call otg$ecb (AD_OFFSET (ad),       # start
                       instr_info (2),       # stack_size
                       instr_info (3),       # arg_start
                       instr_info (4),       # arg_count
                       instr_info (5),       # lb_offset
                       extra)           # keys
         }

      when (ALL, LLL, ARL, LRL, ARS, LRS)
         {
DB       call print (ERROUT, "otg_misc: shift *,-10i*n"p, extra)
         # expects 'extra' to be the shift count
         # slap two's complement into top 6 bits of instr (p.o.s.)
         call otg$gen (opcode + and (-extra, :000077))
         }

      when (ENT_INS)
         {
DB       call print (ERROUT, "otg_misc: ENT *s*n"p, instr_info)
         # Expects 'instr_info' to be a pointer to the
         # first character of an EOS-terminated string.
         # 'extra' is the associated object id - if its
         # address isn't defined, we emit a dummy group
         # to save space in the prefix block until we find
         # out the right address at the end of the module.
         #
         # There is presently no way to tell if the object
         # will be stored in the LINK or the PROC frame,
         # so we will use the LINK base for all objects
         # and expect the calling program (vcg) to enforce
         # the convention.
         # (Actually, we could fix the base reg when we do
         # address fix-ups at the end of the module.)
         if (lookup_lab (extra, ad) == NO)
            {
DB          call print (ERROUT, "   at LB%+'*,-8i*n"s, 0)
            call enter_ent (instr_info, extra)
            call otg$entlb (instr_info, 0)
            }
         else
            {
            # superfluous case - vcg can't tell us where the
            # entry point is anyway.  But, if it were smarter....
DB          call print (ERROUT, "   at LB%+*,'-8i*n"s, AD_OFFSET (ad))
            call otg$entlb (instr_info, AD_OFFSET (ad))
            }
         }

      when (EXT_INS)
         {
DB       call print (ERROUT, "otg_misc: EXT *s*n"p, instr_info)
         # stuff a name (instr_info) into external name table
         # when it's referenced in the *future* we'll know that
         # we might have defined an IP to it right after its
         # EXT declaration.
         AD_MODE (ad) = INDIRECT_AM
         AD_BASE (ad) = LB_REG       # we hope
         AD_OFFSET (ad) = LB_here    # good enough for now
         call enter_ext (instr_info, ad)  # don't care about multiple defs
         }

      when (AP_INS)
         {
DB       call print (ERROUT, "otg_misc: AP*n"p)
         # 'instr_info' has the address for the AP in it and
         # 'extra' has the mode for the AP (S, L, SL, etc.)
         # need to figure out the address if it's a label or literal
         select (AD_MODE (instr_info))

            when (ILIT_AM, LLIT_AM, FLIT_AM, DLIT_AM)
               {
               call zero_lit (instr_info)
               call get_lit_addr (instr_info, ad, fwd_ref, LONG)
               call otg$ap (extra, AD_BASE (ad), AD_OFFSET (ad), 0, fwd_ref)
               }

            when (LABELED_AM)
               {
               call get_label_addr (instr_info, ad, fwd_ref)
               call otg$ap (extra, AD_BASE (ad), AD_OFFSET (ad), 0, fwd_ref)
               }

         else
            {
            call otg$ap (extra, AD_BASE (instr_info), AD_OFFSET (instr_info))
            }
         }

      when (DATA_INS)
         {
DB       call print (ERROUT, "otg_misc: DATA '*-,8i*n"p, extra)
         call otg$data (extra, 1)
         }

      when (BSZ_INS)
         {
DB       call print (ERROUT, "otg_misc: BSZ *i*n"p, extra)
         call otg$data (0, extra)
         }

      when (DAC_INS)
         {
DB       call print (ERROUT, "otg_misc: DAC*n"p)
         call get_label_addr (instr_info, ad, fwd_ref, YES)
         if (AD_BASE (ad) ~= PB_REG)
            call panic ("otg_misc: bad DAC base*n"p)

         call otg$dac (AD_OFFSET (ad), fwd_ref)
         }

      when (SHORT_JUMP_AHEAD_INS)
         {
DB       call print (ERROUT, "otg_misc: JMP ** + *,-10i*n"p, PB_here+extra)
         call otg$mref (JMP, MR_DS, PB_REG, PB_here+extra, FALSE)
         # assume that these are always direct, PB%-relative
         # (this is slightly reasonable)
         }

      when (JSXB_EXT_INS)
         {
DB       call print (ERROUT, "otg_misc: JSXB *s*n"p, instr_info)
         # expects that instr_info is the external label name
         # have to look it up & hook it to fwd ref list if not
         # defined somewhere
         call get_ext_addr (instr_info, ad, fwd_ref)
         call otg$mref (JSXB, MR_I, AD_BASE (ad), AD_OFFSET (ad), fwd_ref)
         # we also have to convert to an indirect instruction
         }

      when (PCL)
         {
DB       call print (ERROUT, "otg_misc: PCL *s*n"p, instr_info)
         # instr_info is an external name - look up its
         # address, assuming we stuck an IP there, & PCL there, indirect
         call get_ext_addr (instr_info, ad, fwd_ref)
         call otg$mref (PCL, MR_I, AD_BASE (ad), AD_OFFSET (ad), fwd_ref)
         }

   else
      call panic ("otg_misc: bad instr opcode *,-8i*n"p, opcode)

   return
   end


undefine(DB)
