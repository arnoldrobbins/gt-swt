include "otd_def.r.i"

# otd --- interpret binary output from Prime language translators

   include OTD_COMMON

   integer inf, inbuf (BLOCKSZ), count, block_type, block_size
   integer rdbin, getarg, open
   character name (MAXARG)

   string_table bt_pos, bt_txt
      / "Prefix" / "Data" / "End"

   if (getarg (1, name, MAXARG) == EOF)
      call error ("usage: otd <object_file>"s)

   inf = open (name, READ)
   if (inf == ERR)
      call cant (name)

   Force_load = TRUE
   Link_offset = 0
   Stack_offset = 0
   Mode = 4
   Default_mode = 4
   Location = 0
   Frame = PROC

   for (count = rdbin (inf, inbuf, BLOCKSZ); count ~= EOF && count ~= 0;
            count = rdbin (inf, inbuf, BLOCKSZ)) {

      if (count < 0) {     # bad object file
         call close (inf)
         call error ("bad object file"s)
         }

      block_type = rs (inbuf (1), 12)
      block_size = rt (inbuf (1), 8)
      if (count ~= block_size) {
         call close (inf)
         call print (ERROUT, "inconsistent block size*n"s)
         call print (ERROUT, "   record header: *i, block header: *i*n"s,
               block_size, count)
         call error (""s)
         }

      if (block_type ~= PREFIX_TYPE
            && block_type ~= DATA_TYPE
            && block_type ~= END_TYPE) {
         call close (inf)
         call print (ERROUT, "unrecognized block type (*i)*n"s,
               block_type)
         }
      else {
         call print (STDOUT, "** *s Block containing *i words*n"s,
            bt_txt (bt_pos (block_type - PREFIX_TYPE + 2)), block_size)
         call interpret_block (inbuf, block_size)
         }
      }

   call close (inf)

   stop
   end


# interpret_block --- interpret an object block, return status

   integer function interpret_block (buf, count)
   integer buf (ARB), count

   integer group_type, group_size, i
   integer interpret_group

   for (i = 2; i <= count; i += group_size + 1) {
      group_type = rs (buf (i), 8)
      group_size = rt (buf (i), 8)
      if (interpret_group (group_type, buf (i + 1), group_size) == EOF)
         break
      }

   return (OK)
   end


# rdbin --- Subsystem-compatible binary input driver

   integer function rdbin (fd, buf, count)
   integer fd, buf (ARB), count

   integer ct
   longint pos
   integer readf, seekf

   rdbin = EOF
   if (readf (ct, 1, fd) ~= 1)
      return
   if (ct > count) {
      pos = ct - count
      call print (ERROUT, "block size (*i) exceeds buffer space*n"s, ct)
      ct = count
      }
   else
      pos = 0
   if (readf (buf, ct, fd) ~= ct)
      return
   if (pos ~= 0 && seekf (pos, fd, REL) ~= OK)
      return

   return (ct)
   end


# wrbin --- Subsystem-compatible binary output driver

   integer function wrbin (fd, buf, count)
   integer fd, buf (ARB), count

   integer f, nwr, code
   integer mapsu

   wrbin = ERR
   if (writef (count, 1, fd) ~= 1
         || writef (buf, count, fd) ~= count)
      return

   return (OK)
   end


# interpret_group --- interpret a single obuject group

   integer function interpret_group (gt, buf, gs)
   integer gt, buf (ARB), gs

   include OTD_COMMON

   integer i, j
   integer find_label

   select (gt)    # branch on group type

      when (ENDBLK)
         return (EOF)

      when (COMDEF, LCOMDEF)
         call common_definition (gt, buf, gs)

      when (ENTABS, ENTREL, ENTLB, ENTLBA, DYNT)
         call entry_point (gt, buf, gs)

      when (ORGABS, ORGREL, ORGCOM, ORGLB, ORGLBA)
         call set_origin (gt, buf, gs)

      when (SETBABS, SETBREL)
         call set_base (gt, buf, gs)

      when (DATAGRP)
         call data_group (gt, buf, gs)

      when (GENERIC)
         call generics (gt, buf, gs)

      when (DATARPT)
         for (i = 1; i <= gs; i = i + 2) {
            call print_location
            call print (STDOUT, "data  *,-10i(*,-8i)*n"s,
                  buf (i + 1), buf (i))
            Location += buf (i + 1)
            }

      when (MEMREF, MEMREFCOM, MEMREFEXT, COMREFSP)
         call memory_reference (gt, buf, gs)

      when (ENDABS, ENDREL, ENDLB)
         call end_group (gt, buf, gs)

      when (SFL) {
         call print (STDOUT, "*9xsfl*n"s)
         Force_load = TRUE
         }

      when (RFL) {
         call print (STDOUT, "*9xrfl*n"s)
         Force_load = FALSE
         }

      when (DDM) {
         call print (STDOUT, "*9xddm   "s)
         call print_mode (Default_mode)
         call putch (NEWLINE, STDOUT)
         Mode = Default_mode
         }

      when (ELM) {
         call print_location
         call print (STDOUT, "elm   "s)
         call print_mode (Mode)
         Location += 1
         }

      when (SDM, LINKMODE)
         call linkmode (gt, buf)

      when (MBR)
         call print (STDOUT, "*9xmbr*n"s)

      when (N64R)
         call print (STDOUT, "*9xn64r*n"s)

      when (UIIREQ, UIIDEF, LIR)
         call uii_group (gt, buf, gs)

      when (FWDDEF)
         for (i = 1; i <= gs; i += 1) {
            call print_location
            call print (STDOUT, "link  pr(*,-8i)*n"s, buf (i))
            }

      when (SKIPGR) {
         call print (STDOUT, "** Skip *,-10i words "s, buf (2))
         if (buf (1) == 0)
            call print (STDOUT, "not "s)
         call print (STDOUT, "including end group*n"s)
         }

      when (PROCDEF) {
         call print (STDOUT, "*2n** Procedure Definition:*n"s)
         call print (STDOUT, "**    proc size:    *6,-8i*n"s, buf (1))
         if (gs > 1) {
            call print (STDOUT, "**    link size:    *6,-8i*n"s, buf (2))
            call print (STDOUT, "**    link offset:  *6,-8i*n"s, buf (3))
            call print (STDOUT, "**    stack offset: *6,-8i*2n"s, buf (4))
            Link_offset = buf (3)
            Stack_offset = buf (4)
            }
         Location = 0
         Frame = PROC
         }

      when (EXTREF32, COMREF32, PBIP, LBIP, LCOMREF)
         call indirect_ptr (gt, buf, gs)

      when (ECBDEF) {
         call print_location
         call print (STDOUT,
            "ecb   proc=*,-8iP, link=*,-8iL, *i args at *,-8iS, " _
            "frame=*,-8i, keys=*6,-8,0i*n"s,
            buf (1), buf (5), buf (4), buf (3), buf (2), buf (6))
         Location += 16
         }


   else {
      call print (STDOUT, "** Unrecognized Group Type (*i)*n"s, gt)
      call data_group (DATAGRP, buf, gs)
      }

   return (OK)
   end


# entry_point --- interpret entry point definitions

   subroutine entry_point (gt, buf, gs)
   integer gt, buf (ARB), gs

   include OTD_COMMON

   integer offset
   character name (MAXNAME)

   if (gt == DYNT)
      call ptoc (buf, ' 'c, name, min0 (gs * 2 + 1, MAXNAME))
   else
      call ptoc (buf (2), ' 'c, name, min0 ((gs - 1) * 2 + 1, MAXNAME))

   if (gt == DYNT)
      call print (STDOUT, "*9xdynt  *s*n"s, name)
   else {
      call print (STDOUT, "*9xsubr  *s at "s, name)
      select (gt)
         when (ENTLBA)
            call print (STDOUT, "lb(*,-8i)"s, buf (1) + Link_offset)
         when (ENTLB)
            call print (STDOUT, "lb(*,-8i)"s, buf (1))
         when (ENTABS)
            call print (STDOUT, "pb(*,-8i)"s, buf (1))
         when (ENTREL)
            call print (STDOUT, "pr(*,-8i)"s, buf (1))

      call putch (NEWLINE, STDOUT)
      }

   return
   end


# common_definition --- interpret common block definition

   subroutine common_definition (gt, buf, gs)
   integer gt, buf (ARB), gs

   character name (MAXNAME)

   if (gt == LCOMDEF) {
      call ptoc (buf (3), ' 'c, name, min0 ((gs - 2) * 2 + 1, MAXNAME))
      call print (STDOUT, "*9xcomm  *s (*,-8l)*n"s, name, buf (1))
      }
   else {
      call ptoc (buf (2), ' 'c, name, min0 ((gs - 1) * 2 + 1, MAXNAME))
      call print (STDOUT, "*9xcomm  *s (*,-8i)*n"s, name, buf (1))
      }

   return
   end


# set_origin --- interpret change of origin

   subroutine set_origin (gt, buf, gs)
   integer gt, buf (ARB), gs

   include OTD_COMMON

   integer offset
   character name (MAXNAME)

   call print (STDOUT, "*9xorg   "s)
   offset = buf (1)
   select (gt)
      when (ORGLBA, ORGLB) {
         call ctoc ("lb"s, name, MAXNAME)
         Frame = LINK
         if (gt == ORGLBA)
            offset += Link_offset
         else
            offset += 8r400
         }
      when (ORGREL) {
         call ctoc ("pr"s, name, MAXNAME)
         Frame = PROC
         }
      when (ORGABS) {
         call ctoc ("pb"s, name, MAXNAME)
         Frame = PABS
         }
      when (ORGCOM) {
         call ptoc (buf (2), ' 'c, name, min0 ((gs - 1) * 2 + 1, MAXNAME))
         Frame = COMM
         }

   call print (STDOUT, "*s(*,-8i)*n"s, name, offset)
   Location = offset

   return
   end


# data_group --- interpret data groups

   subroutine data_group (gt, buf, gs)
   integer gt, buf (ARB), gs

   include OTD_COMMON

   integer i, col, state

   call print_location
   call print (STDOUT, "data  "s)
   col = 1
   state = 0

   for (i = 1; i <= gs; {i += 1; Location += 1}) {
      if (col >= 60) {
         if (state == 2)   # last item was a string; close quote
            call putch ("'"c, STDOUT)
         if (state ~= 0)   # not at beginning of line
            call putch (','c, STDOUT)
         call putch (NEWLINE, STDOUT)
         call print_location
         call print (STDOUT, "data  "s)
         state = 0
         col = 1
         }
      if (' 'c <= rs (buf (i), 8) && rs (buf (i), 8) < DEL
            && ' 'c <= rt (buf (i), 8) && rt (buf (i), 8) < DEL) {
         if (state == 1) {    # last item was a number
            call putlin (", "s, STDOUT)
            col += 2
            }
         if (state ~= 2) {    # last item wasn't a string; open quote
            call putch ("'"c, STDOUT)
            col += 1
            }
         call print (STDOUT, "*,2h"s, buf (i))
         state = 2
         col += 2
         }
      else {
         if (state == 2) {    # last item was a string; close quote
            call putch ("'"c, STDOUT)
            col += 1
            }
         if (state ~= 0) {    # not the beginning of a line
            call putlin (", "s, STDOUT)
            col += 2
            }
         call print (STDOUT, "*6,-8i"s, buf (i))
         state = 1
         col += 6
         }
      }

   if (state == 2)
      call putch ("'"c, STDOUT)
   call putch (NEWLINE, STDOUT)


   return
   end


# generics --- interpret generic instructions

   subroutine generics (gt, buf, gs)
   integer gt, buf (ARB), gs

   include OTD_COMMON

   integer i
   character mnemonic (MAXLINE)

   for (i = 1; i <= gs; {i += 1; Location += 1}) {
      call print_location
      if (and (buf (i), 8r36000) ~= 0)
         call print_memref (-1, buf (i), 0, ""s)
      else {
         call lookup_generic (buf (i), mnemonic)
         call print (STDOUT, "*s*n"s, mnemonic)
         }
      }

   return
   end


# lookup_generic --- map a generic opcode into its mnemonic

   subroutine lookup_generic (opcode, mnemonic)
   integer opcode
   character mnemonic (MAXLINE)

   include "op_tbl.r.i"

   integer i
   integer intbsr

   i = intbsr (opos, otxt, 0, opcode)
   if (i ~= EOF)
      call ctoc (otxt (opos (i) + 1), mnemonic, MAXLINE)
   else
      call encode (mnemonic, MAXLINE, "*6,-8,0i"s, opcode)

   return
   end


# end_group --- interpret end group

   subroutine end_group (gt, buf, gs)
   integer gt, buf (ARB), gs

   call print (STDOUT, "*9xend   "s)

   select (gt)
      when (ENDLB)
         call print (STDOUT, "lb(*,-8i)"s, buf (1))

      when (ENDABS)
         call print (STDOUT, "pb(*,-8i)"s, buf (1))

      when (ENDREL)
         call print (STDOUT, "pr(*,-8i)"s, buf (1))

   call putch (NEWLINE, STDOUT)

   return
   end


# set_base --- interpret set base groups

   subroutine set_base (gt, buf, gs)
   integer gt, buf (ARB), gs

   call print (STDOUT, "*9xsetb  "s)

   select (gt)
      when (SETBABS)
         call print (STDOUT, "pb(*,-8i)"s, buf (1))
      when (SETBREL)
         call print (STDOUT, "pr(*,-8i)"s, buf (1))

   if (gs >= 2)
      call print (STDOUT, "(*,-8i)"s, buf (2))

   call putch (NEWLINE, STDOUT)

   return
   end


# memory_reference --- interpret memory reference groups

   subroutine memory_reference (gt, buf, gs)
   integer gt, buf (ARB), gs

   include OTD_COMMON

   integer i
   character name (MAXNAME), str (MAXLINE)

   select (gt)
      when (MEMREF)
         for (i = 1; i <= gs; i += 2) {
            call print_location
            call print_memref (buf (i), buf (i + 1), buf (i + 2), ""s)
            if (and (buf (i), 8r100) ~= 0) { # 3 word entry
               i += 1
               Location += 2
               }
            else
               Location += 1
            }
      when (MEMREFCOM) {
         call print_location
         call ptoc (buf (3), ' 'c, name, min0 ((gs - 2) * 2 + 1, MAXNAME))
         call print_memref (buf (1), buf (2), 0, name)
         Location += 1
         }
      when (MEMREFEXT) {
         call print_location
         call ptoc (buf (2), ' 'c, name, min0 ((gs - 1) * 2 + 1, MAXNAME))
         call print_memref (buf (1), 0, 0, name)
         Location += 1
         }
      when (COMREFSP) {
         call print_location
         call ptoc (buf (5), ' 'c, name, min0 ((gs - 4) * 2 + 1, MAXNAME))
         call encode (str, MAXLINE, "  [*s(*,-8i)]"s, name, buf (4))
         call print_memref (buf (1), buf (2), buf (3), str)
         Location += 2
         }

   return
   end



# print_memref --- interpret a memory reference instruction

   subroutine print_memref (mask, w1, w2, extern)
   integer mask, w1, w2
   character extern (ARB)

   include OTD_COMMON

   character mnemonic (MAXLINE)
   integer a, i, x, op, s, d, y, opx, br, base (5)
   longint mnem (16, 4)

   data base / "pb", "sb", "lb", "xb", "pr" /
   data mnem / _
      "jmp.", "lda.", "ana.", "sta.", "era.", "add.", "sub.", "jst.",
      "cas.", "irs.", "ima.", "jsy.", "stx.", "mpy.", "div.", "ldx.",

      "eal.", "fld.", "stlr", "fst.", "ldlr", "fad.", "fsb.", "110.",
      "fcs.", "mia.", "mib.", "eio.", "flx.", "fmp.", "fdv.", "ldy.",

      "xec.", "dfld", "ora.", "dfst", "205.", "dfad", "dfsb", "pcl.",
      "dfcs", "eaxb", "ealb", "jsxb", "dflx", "dfmp", "dfdv", "sty.",

      "301.", "ldl.", "anl.", "stl.", "erl.", "adl.", "sbl.", "310.",
      "cls.", "312.", "313.", "314.", "315.", "mpl.", "dvl.", "jsx." /

   if (mask == -1) {       # single word instruction in w1
      i = rs (w1, 15)               # indirect bit
      x = rt (rs (w1, 14), 1)       # index bit
      op = rt (rs (w1, 10), 4)      # op code
      s = rt (rs (w1, 9), 1)        # sector bit
      d = rt (w1, 9)                # displacement
      if (and (d, 8r400) ~= 0)      # sign-extend the displacement
         d |= 8r177000
      if (op == 2r1101 && x == 1) {
         x = 0
         op = 2r10000
         }
      if (s == 0 || (-224 <= d && d <= 255))
         call print (STDOUT, "*,4p#*7t"s, mnem (op, 1))
      else
         call print (STDOUT, "*6,-8,0i"s, w1)
      if (s == 0) {        # short base register relative
         select (ls (i, 1) + x)
            when (2r00) {
               select
                  when (d < 0)
                     call print (STDOUT, "lb(*,-8i)"s, and (d, 8r777))
                  when (d <= 7)
                     call print (STDOUT, "r*i"s, d)
                  when (d <= 8r377)
                     call print (STDOUT, "sb(*,-8i)"s, d)
               }
            when (2r01)
               if (d < 0)
                  call print (STDOUT, "lb(*,-8i),x"s, and (d, 8r777))
               else
                  call print (STDOUT, "sb(*,-8i),x"s, d)
            when (2r10)
               if (0 <= d && d <= 7)
                  call print (STDOUT, "r*i,**"s, d)
               else
                  call print (STDOUT, "sb(*,-8i),**"s, and (d, 8r777))
            when (2r11)
               if (0 <= d && d <= 8r77)
                  call print (STDOUT, "pb(*,-8i),x**"s, d)
               else
                  call print (STDOUT, "pb(*,-8i),**x"s, and (d, 8r777))
         }  # if (s == 0)

      elif (-224 <= d && d <= 255) {   # short procedure relative
         call putch ('.', STDOUT)
         if (d >= 0)
            call putch ('+'c, STDOUT)
         if (d ~= -1)
            call print (STDOUT, "*i"s, d + 1)
         if (i + x ~= 0)   # indirect or indexed
            call putch (','c, STDOUT)
         if (i ~= 0)
            call putch ('*'c, STDOUT)
         if (x ~= 0)
            call putch ('x'c, STDOUT)
         }
      }

   elif (and (mask, 8r300) == 0) {  # 2 word object group
      i = rs (mask, 15)                # indirect bit
      x = rt (rs (mask, 14), 1)        # index bit
      op = rt (rs (mask, 10), 4)       # op code
      if (op == 2r1101 && x == 1) {
         x = 0
         op = 2r10000
         }
      if (and (mask, 1) ~= 0)       # this is an address constant
         call print (STDOUT, "dac#*7t"s)
      elif (op == 0)
         call print (STDOUT, "???#*7t"s)
      else
         call print (STDOUT, "*,4p#*7t"s, mnem (op, 1))
      if (and (mask, 4) ~= 0)       # forward reference
         call print (STDOUT, "fwd "s)
      if (extern (1) ~= EOS)        # common or external reference
         call print (STDOUT, "*s(*,-8i)"s, extern, w1)
      elif (and (mask, 2) ~= 0)     # relative to start of module
         call print (STDOUT, "pr(*,-8i)"s, w1)
      else                          # absolute procedure
         call print (STDOUT, "pb(*,-8i)"s, w1)
      if (i + x ~= 0)   # indirect or indexed
         call putch (','c, STDOUT)
      if (i ~= 0)
         call putch ('*'c, STDOUT)
      if (x ~= 0)
         call putch ('x'c, STDOUT)
      }

   else {   # 3 word object group; 2 word instruction
      i = rs (w1, 15)                  # indirect bit
      x = rt (rs (w1, 14), 1)          # index bit
      op = rt (rs (w1, 10), 4)         # op code
      y = rt (rs (w1, 4), 1)           # alternate index bit
      opx = rt (rs (w1, 2), 2)         # op code extension
      br = rt (w1, 2)                  # base register
      if (op == 2r1101 && x == 1) {
         x = 0
         op = 2r10000
         }
      if (op == 0) {    # probably a branch instruction
         i = 0; x = 0; y = 0; br = 0
         call lookup_generic (w1, mnemonic)
         call print (STDOUT, "*s*7t"s, mnemonic)
         }
      else
         call print (STDOUT, "*,4p%*7t"s, mnem (op, opx + 1))
      a = w2
      if (and (mask, 8r40) ~= 0)    # link_offset relative
         a += Link_offset
      if (and (mask, 8r20) ~= 0)    # stack_offset relative
         a += Stack_offset
      if (and (mask, 2) ~= 0 && br == 0)
         br = 4                     # relative to current procedure
      if (and (mask, 4) ~= 0)       # forward reference
         call print (STDOUT, "fwd "s)
      call print (STDOUT, "*,2h(*,-8i)"s, base (br + 1), a)
      select (ls (i, 2) + ls (x, 1) + y)
         when (2r001)
            call putlin (",y"s, STDOUT)
         when (2r010)
            call putlin (",x"s, STDOUT)
         when (2r011)
            call putlin (",*"s, STDOUT)
         when (2r100)
            call putlin (",y*"s, STDOUT)
         when (2r101)
            call putlin (",*y"s, STDOUT)
         when (2r110)
            call putlin (",x*"s, STDOUT)
         when (2r111)
            call putlin (",*x"s, STDOUT)
      call putlin (extern, STDOUT)
      }

   call putch (NEWLINE, STDOUT)

   return
   end


# indirect_ptr --- interpret IP groups

   subroutine indirect_ptr (gt, buf, gs)
   integer gt, buf (ARB), gs

   include OTD_COMMON

   integer i
   character name (MAXNAME)

   if (gt == PBIP || gt == LBIP) {
      for (i = 1; i <= gs; i += 1) {
         call print_location
         call print (STDOUT, "ip    "s)
         if (gt == PBIP)
            call print (STDOUT, "pr("s)
         else
            call print (STDOUT, "lb("s)
         call print (STDOUT, "*,-8i)*n"s, buf (i))
         Location += 2
         }
      }
   else {
      call print_location
      call print (STDOUT, "ip    "s)
      if (gt == EXTREF32) {
         call ptoc (buf, ' 'c, name, min0 (gs * 2 + 1, MAXNAME))
         call print (STDOUT, "*s*n"s, name)
         }
      elif (gt == COMREF32) {
         call ptoc (buf (2), ' 'c, name, min0 ((gs - 1) * 2 + 1, MAXNAME))
         call print (STDOUT, "*s(*,-8i)*n"s, name, buf (1))
         }
      elif (gt == LCOMREF) {
         call ptoc (buf (3), ' 'c, name, min0 ((gs - 2) * 2 + 1, MAXNAME))
         call print (STDOUT, "*s(*,-8l)*n"s, name, buf (1))
         }
      else
         call print (STDOUT, "?*n"s)
      Location += 2
      }

   return
   end


# uii_group --- interpret uii-related groups

   subroutine uii_group (gt, buf, gs)
   integer gt, buf (ARB), gs

   integer i, mask

   procedure interpret_uii forward

   if (gt == UIIDEF) {
      call print (STDOUT, "** Module Simulates"s)
      mask = ls (buf (1), 8)
      interpret_uii
      call putch (NEWLINE, STDOUT)
      mask = ls (buf (2), 8)
      }
   else
      mask = ls (buf (1), 8)


   if (gt == LIR)
      call print (STDOUT, "** Load if Any Previous "s)
   else
      call print (STDOUT, "** "s)

   call print (STDOUT, "Module Requires"s)
   interpret_uii
   call putch (NEWLINE, STDOUT)

   return


   # interpret_uii --- print symbolic representation of uii bits

      procedure interpret_uii {

      if (mask == 0)
         call putlin (" No UII Handlers"s, STDOUT)
      else
         for (i = 1; i <= 7; i += 1) {
            mask = ls (mask, 1)
            if (mask < 0) {
               select (i)
                  when (1)
                     call putlin (" p500"s, STDOUT)
                  when (2)
                     call putlin (" p400"s, STDOUT)
                  when (4)
                     call putlin (" dpfp"s, STDOUT)
                  when (5)
                     call putlin (" spfp"s, STDOUT)
                  when (6)
                     call putlin (" p300"s, STDOUT)
                  when (7)
                     call putlin (" hsa"s, STDOUT)
               }
            }

         }

   end


# linkmode --- interpret desectorization-related groups

   subroutine linkmode (gt, buf)
   integer gt, buf (ARB)

   include OTD_COMMON

   integer i

   select (gt)
      when (LINKMODE) {
         call print (STDOUT, "*9xd"s)
         Mode = buf (1)
         }
      when (SDM) {
         call print (STDOUT, "*9xsdm  d"s)
         Default_mode = buf (1)
         }

   call print_mode (buf (1))
   call putch (NEWLINE, STDOUT)

   return
   end


# print_mode --- print symbolic addressing mode

   subroutine print_mode (mode)
   integer mode

   select (mode)
      when (0)
         call print (STDOUT, "16s"s)
      when (1)
         call print (STDOUT, "32s"s)
      when (2)
         call print (STDOUT, "64r"s)
      when (3)
         call print (STDOUT, "32r"s)
      when (4)
         call print (STDOUT, "64v"s)
      when (5)
         call print (STDOUT, "32i"s)
   else
      call print (STDOUT, "???"s)

   return
   end


# intbsr --- perform a binary search of a string table

   integer function intbsr (pos, tab, offs, object)
   integer pos (ARB), offs, object
   character tab (ARB)

   integer i, j, k

   i = 2
   j = pos (1) + 1            # length is first entry in position array
   repeat {
      k = (i + j) / 2
      select
         when (rt (intl (tab (pos (k) + offs)), 16) <
               rt (intl (object), 16))
            i = k + 1
         when (rt (intl (tab (pos (k) + offs)), 16) ==
               rt (intl (object), 16))
            return (k)
      else
         j = k - 1
      } until (i > j)

   return (EOF)
   end


# print_location --- put out the current location counter

   subroutine print_location

   include OTD_COMMON

   character c

   select (Frame)
      when (PROC)
         c = 'P'c
      when (PABS)
         c = ' 'c
      when (LINK)
         c = 'L'c
      when (COMM)
         c = 'C'c

   call print (STDOUT, "*6,-8,0i*c  "s, Location, c)

   return
   end
