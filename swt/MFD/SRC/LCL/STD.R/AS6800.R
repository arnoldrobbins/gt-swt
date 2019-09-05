#     Copyright (c) 1979 by Allen Akin and Tom Chappell.

# These programs were developed by Allen Akin and Tom Chappell
# for  use  with  the  Software Tools Subsystem at the Georgia
# Institute of Technology.  General permission is  granted  to
# copy  and  use  this  software  product,  provided that this
# notice is included in full with each copy.



# as6800 --- 6800 assembler for SSPL output

   include PRIMOS_KEYS
   include "as6800_def.r.i"

define(MAXINSTRUCTIONS,108)
define(DEBUG, #)
# symbols recognized by the assembler:
define(BUSSYM,0)
define(CONSTSYM,1)
define(EOFSYM,2)
define(EOLSYM,3)
define(IDSYM,4)
define(IMMSYM,5)
define(LABELSYM,6)
define(SUBSYM,7)

# pseudo-ops:
define(BYTE_OP,0)
define(DEF_OP,1)
define(WORD_OP,2)
define(RES_OP,3)
define(ORG_OP,4)

# opcode calculation offsets and addressing masks:
define(EXT_OFFSET,48)
define(DIR_OFFSET,16)
define(IMM_OFFSET,0)
define(INH_OFFSET,0)
define(INX_OFFSET,32)
define(LIM_OFFSET,0)
define(REL_OFFSET,0)
define(EXT_ADDR,:10)
define(DIR_ADDR,:40)
define(IMM_ADDR,:200)
define(INH_ADDR,:4)
define(INX_ADDR,:20)
define(LIM_ADDR,:100)
define(REL_ADDR,:2)

   include "as6800_com.r.i"

   call initialize
   while (symbol ~= EOFSYM)
      if (symbol == EOLSYM)
         call getsym
      else if (symbol == LABELSYM) {
DEBUG    call print (ERROUT, "label '*s' := *i*n"s, token, lc)
         call enter (token, RELOCATABLE, lc)
         call getsym
         }
      else
         call instruction
   call cleanup

   stop
   end



# alpha --- return .true. if c is an alpha character

   logical function alpha (c)
   character c

   alpha = c == '`'c | c == '_'c | _
           ('a'c <= c & c <= 'z'c) | _
           ('A'c <= c & c <= 'Z'c)

   return
   end



# brexpr --- parse and evaluate relative address for a branch

   subroutine brexpr (val)
   integer val

   include "as6800_com.r.i"

   integer l, p
   integer location

   pointer dsget

   if (symbol ~= IDSYM)
      call errmsg ("target of branch must be a label.")
   else {
      l = location (token)
      if (sym_typ (l) ~= UNDEFINED) {
         val = sym_val (l) - lc - 1
         if (val > 127 | val < -128)
            call errmsg ("branch out of range.")
         }
      else {
         p = dsget (2)  # words
         mem (p + LINK) = sym_brlist (l)
         mem (p + ADDR) = lc
         sym_brlist (l) = p
         val = 0
         }
      call getsym
      }

   return
   end



# chainback --- resolve word-length forward references

   subroutine chainback (addr, val, type)
   integer addr, val, type

   integer p, next

   p = addr
   while (p ~= LAMBDA) {
      call putrel (type, p)
      call xseek (p)
      call getword (next)
      call xseek (p)
      call putword (val)
      p = next
      }

   if (addr ~= LAMBDA)
      call seekend
   return
   end



# cleanup --- terminate process of assembly

   subroutine cleanup

   include "as6800_com.r.i"

   integer i, j, maplen
   integer length, ctoa

   # relocation map:
   call putbyte (RMAPCODE)
   maplen = (lc + 7) / 8
   call putword (maplen)
   for (i = 1; i <= maplen; i = i + 1)
      call putbyte (rmap (i))

   # important symbol table entries:
   for (i = 1; i <= symtop; i = i + 1)
      if (mem (sym_sym (i)) ~= '_'c) {  # throw away temporary symbols
         call putbyte (SYMBOLCODE)
         call putword (length (mem (sym_sym (i))) + 5)
         call putword (sym_typ (i))
         call putword (sym_val (i))
         for (j = sym_sym (i); mem (j) ~= EOS; j = j + 1)
            call putbyte (ctoa (mem (j)))
         call putbyte (0)     # end-of-string
         }

   call seek (1)       # put in code length
   call putword (lc)

   if (Listing == YES) {
      call build_listing
      call close (list)
      call close (lsource)
      }

   call close (code)

   return
   end



# compare --- compare two strings, return -1 if <, 0 if =, 1 if >
   integer function compare (str1, str2)
   character str1 (ARB), str2 (ARB)

   integer i

   for (i = 1; str1 (i) == str2 (i); i = i + 1)
      if (str1 (i) == EOS) {
         compare = 0
         return
         }

   if (str1 (i) > str2 (i))
      compare = 1
   else
      compare = -1

   return
   end



# completebr --- complete forward-referencing branches

   subroutine completebr (mlink, val)
   integer mlink, val

   include "as6800_com.r.i"

   integer p, offset, address

   p = mlink
   while (p ~= LAMBDA) {
      address = mem (p + ADDR)
      call xseek (address)
      offset = val - address - 1
      if (offset > 127 | offset < -128)
         call errmsg ("a branch to this label is out of range.")
      call putbyte (offset)
      address = p
      p = mem (p + LINK)
      call dsfree (address)
      }

   if (mlink ~= LAMBDA)
      call seekend
   return
   end



# cputbyte --- do most-common "putbyte" operation

   subroutine cputbyte (val, reloc)
   integer val, reloc

   include "as6800_com.r.i"

   call putbyte (val)
   call putrel (reloc, lc)
   lc = lc + 1

   return
   end



# cputword --- do most-common "putword" operation

   subroutine cputword (val, reloc)
   integer val, reloc

   call cputbyte (rs (val, 8), reloc)
   call cputbyte (rt (val, 8), ABSOLUTE)

   return
   end



# ctoa --- convert Prime characters to real ASCII

   integer function ctoa (c)
   character c

   ctoa = rt (c, 7)

   return
   end



# do_mach --- emit code for a machine instruction

   subroutine do_mach (op)
   integer op

   include "as6800_com.r.i"

   integer val, reloc, base, mask, base_op (MAXINSTRUCTIONS),
      addr_mask (MAXINSTRUCTIONS)

   data base_op / _
      :33, :211, :311,         # aba, adca, adcb
      :213, :313, :204, :304,  # adda, addb, anda, andb
      72, 72, 88, 71, 71, 87,  # asl, asla, aslb, asr, asra, asrb
      _
      36, 37, 39, 44, 46, 34,  # bcc, bcs, beq, bge, bgt, bhi
      133, 197, 47, 35, 45, 43,# bita, bitb, ble, bls, blt, bmi
      38, 42, 32, 141, 40, 41, # bne, bpl, bra, bsr, bvc, bvs
      _
      17, 12, 14, 79, 79, 95,  # cba, clc, cli, clr, clra, clrb
      10, 129, 193, 67, 67, 83,# clv, cmpa, cmpb, com, coma, comb
      140,                     # cpx
      _
      25, 74, 74, 90, 52, 9,   # daa, dec, deca, decb, des, dex
      _
      136, 200,                # eora, eorb
      _
      76, 76, 92, 49, 8,       # inc, inca, incb, ins, inx
      _
      78, 141,                 # jmp, jsr
      _
      134, 198, 142, 206,      # ldaa, ldab, lds, ldx
      68, 68, 84,              # lsr, lsra, lsrb
      _
      64, 64, 80, 1,           # neg, nega, negb, nop
      _
      138, 202,                # oraa, orab
      _
      54, 55, 50, 51,          # psha, pshb, pula, pulb
      _
      73, 73, 89, 70, 70, 86,  # rol, rola, rolb, ror, rora, rorb
      59, 57,                  # rti, rts
      _
      16, 130, 194, 13, 15, 11,# sba, sbca, sbcb, sec, sei, sev
      135, 199, 143, 207,      # staa, stab, sts, stx
      128, 192, 63, 15,        # suba, subb, swi, sys
      _
      22, 6, 23, 7, 77, 77, 93,# tab, tap, tba, tpa, tst, tsta, tstb
      48, 53,                  # tsx, txs
      _
      62/                      # wai

   data addr_mask / _
      :4, :270, :270,          # aba, adca, adcb
      :270, :270, :270, :270,  # adda, addb, anda, andb
      :30, :4, :4, :30, :4, :4,# asl, asla, aslb, asr, asra, asrb
      _
      :2, :2, :2, :2, :2, :2,  # bcc, bcs, beq, bge, bgt, bhi
      :270, :270, :2, :2, :2,  # bita, bitb, ble, bls, blt
      :2, :2, :2, :2, :2, :2, :2, # bmi, bne, bpl, bra, bsr, bvc, bvs
      _
      :4, :4, :4, :30, :4, :4, # cba, clc, cli, clr, clra, clrb
      :4, :270, :270,          # clv, cmpa, cmpb,
      :30, :4, :4, :170,       # com, coma, comb, cpx
      _
      :4, :30, :4, :4, :4, :4, # daa, dec, deca, decb, des, dex
      _
      :270, :270,              # eora, eorb
      _
      :30, :4, :4, :4, :4,     # inc, inca, incb, ins, inx
      _
      :30, :30,                # jmp, jsr
      _
      :270, :270, :170, :170,  # ldaa, ldab, lds, ldx
      :30, :4, :4,             # lsr, lsra, lsrb
      _
      :30, :4, :4, :4,         # neg, nega, negb, nop
      _
      :270, :270,              # oraa, orab
      _
      :4, :4, :4, :4,          # psha, pshb, pula, pulb
      _
      :30, :4, :4, :30, :4, :4,# rol, rola, rolb, ror, rora, rorb
      :4, :4,                  # rti, rts
      _
      :4, :270, :270, :4, :4,  # sba, sbca, sbcb, sec, sei
      :4, :70, :70, :70, :70,  # sev, staa, stab, sts, stx
      :270, :270, :4, :10,     # suba, subb, swi, sys
      _
      :4, :4, :4, :4,          # tab, tap, tba, tpa
      :30, :4, :4, :4, :4,     # tst, tsta, tstb, tsx, txs
      _
      :4/                      # wai

   base = base_op (op)
   mask = addr_mask (op)

   call getsym
   if (symbol == IMMSYM) {
      call getsym
      if (and (mask, IMM_ADDR) ~= 0) {
         call cputbyte (base + IMM_OFFSET, ABSOLUTE)
         call expr (val, reloc)
         if (reloc == RELOCATABLE | val < -128 | val > 255)
            call errmsg ("value relocatable or larger than 1 byte.")
         call cputbyte (val, ABSOLUTE)
         }
      else if (and (mask, LIM_ADDR) ~= 0) {
         call cputbyte (base + LIM_OFFSET, ABSOLUTE)
         call expr (val, reloc)
         call cputword (val, reloc)
         }
      else
         call errmsg ("immediate addressing not allowed.")
      }
   else if (symbol == SUBSYM) {
      call getsym
      if (and (mask, INX_ADDR) ~= 0) {
         call cputbyte (base + INX_OFFSET, ABSOLUTE)
         call expr (val, reloc)
         if (reloc == RELOCATABLE | val < 0 | val > 255)
            call errmsg ("value is not a valid index.")
         call cputbyte (val, ABSOLUTE)
         if (symbol == BUSSYM)
            call getsym
         else
            call errmsg ("missing ']'.")
         }
      else
         call errmsg ("indexed addressing not permissible.")
      }
   else if (and (mask, INH_ADDR) ~= 0) {
      call cputbyte (base + INH_OFFSET, ABSOLUTE)
      }
   else if (and (mask, REL_ADDR) ~= 0) {
      call cputbyte (base + REL_OFFSET, ABSOLUTE)
      call brexpr (val)
      call cputbyte (val, ABSOLUTE)
      }
   else if (and (mask, EXT_ADDR) ~= 0) {
#     Problems with code following; do not attempt to use!
#        (expr. evaluates before opcode byte is output, causing
#        improper chainback addresses)
#      call expr (val, reloc)
#      if (and (mask, DIR_ADDR) ~= 0
#       && direct_enabled && val >= 0 && val <= 255) {
#         call cputbyte (base + DIR_OFFSET, ABSOLUTE)
#         call cputbyte (val, ABSOLUTE)
#         }
#      else {
#         call cputbyte (base + EXT_OFFSET, ABSOLUTE)
#         call cputword (val, reloc)
#         }
      call cputbyte (base + EXT_OFFSET, ABSOLUTE)
      call expr (val, reloc)
      call cputword (val, reloc)
      }
   else
      call errmsg ("in do_mach: can't happen.")

   return
   end



# do_pseudo --- perform assembler pseudo-ops

   subroutine do_pseudo (op)
   integer op

   include "as6800_com.r.i"

   integer val, reloc, i
   integer location

   character subst (MAXTOK)

   call getsym
   if (op == BYTE_OP) {
      call expr (val, reloc)
      if (reloc == RELOCATABLE | val > 255 | val < -128)
         call errmsg ("value relocatable or larger than 1 byte.")
      call cputbyte (val, ABSOLUTE)
      }
   else if (op == DEF_OP) {
      if (symbol ~= IDSYM)
         call errmsg ("def usage is 'def alias real'.")
      else {
         call scopy (token, 1, subst, 1)
         call getsym
         if (symbol ~= IDSYM)
            call errmsg ("def usage is 'def alias real'.")
         else {
            call enter (subst, ALIAS, location (token))
            call getsym
            }
         }
      }
   else if (op == WORD_OP) {
      call expr (val, reloc)
      call cputword (val, reloc)
      }
   else if (op == RES_OP) {
      call expr (val, reloc)
      if (reloc == RELOCATABLE)
         call errmsg ("value must not be relocatable.")
      for (i = 1; i <= val; i = i + 1)
         call cputbyte (0, ABSOLUTE)
      }
   else if (op == ORG_OP) {
      call expr (val, reloc)
      if (reloc == RELOCATABLE)
         call errmsg ("value must not be relocatable.")
      if (val < lc)
         call errmsg ("backward origin not permitted.")
      while (lc < val)
         call cputbyte (0, ABSOLUTE)
      }

   return
   end



# enter --- enter symbol, type, and value in symbol table

   subroutine enter (sym, type, val)
   character sym (ARB)
   integer type, val

   include "as6800_com.r.i"

   integer l
   integer location

   l = location (sym)
   if (sym_typ (l) ~= UNDEFINED)
      call errmsg ("symbol redefined.")
   else {
DEBUG call print (ERROUT, "chaining back '*s' from *i*n"s, sym, sym_val (l))
      call chainback (sym_val (l), val, type)
      call completebr (sym_brlist (l), val)
      sym_typ (l) = type
      sym_val (l) = val
      }

   return
   end



# errmsg --- print line number and error message

   subroutine errmsg (msg)
   integer msg (ARB)

   include "as6800_com.r.i"

   call print (ERROUT, "*4i: *p*n.", lcnt, msg)

   return
   end



# expr --- parse and evaluate a non-branch expression

   subroutine expr (val, reloc)
   integer val, reloc

   include "as6800_com.r.i"

   integer l
   integer location

   if (symbol == CONSTSYM) {
      val = constval
      reloc = ABSOLUTE
      call getsym
      }
   else if (symbol == IDSYM) {
      l = location (token)
      if (sym_typ (l) == UNDEFINED) {
         val = sym_val (l)          # make forward-ref chain
         sym_val (l) = lc
         reloc = ABSOLUTE
         }
      else {
         val = sym_val (l)
         reloc = sym_typ (l)
         }
DEBUG call print (ERROUT, "sym = '*s', val = *i, type = *i*n"s,
DEBUG    token, val, reloc)
      call getsym
      }
   else {
      call errmsg ("missing expression.")
      val = 0
      reloc = ABSOLUTE
      }

   return
   end



# getbyte --- read one byte from code file

   subroutine getbyte (b)
   integer b

   include "as6800_com.r.i"

   integer junk
   integer mapfd

   call prwf$$ (KREAD, mapfd (code), loc (b), 1, intl (0), junk, junk)

   return
   end



# getsym --- get next symbol from input stream

   subroutine getsym

   include "as6800_com.r.i"

   character c

   logical alpha

   repeat
      call inchar (c)
      until (c ~= ' 'c & c ~= TAB)
   if (alpha (c)) {
      call pushback (c)
      call scan_id
      }
   else if ('0'c <= c & c <= '9'c) {
      call pushback (c)
      call scan_dec
      }
   else if (c == '$'c)
      call scan_hex
   else if (c == '%'c)
      call scan_comment
   else if (c == '['c)
      symbol = SUBSYM
   else if (c == ']'c)
      symbol = BUSSYM
   else if (c == '#'c)
      symbol = IMMSYM
   else if (c == ';'c)
      symbol = EOLSYM
   else if (c == NEWLINE) {
      symbol = EOLSYM
      lcnt = lcnt + 1
      }
   else if (c == EOF)
      symbol = EOFSYM

   return
   end



# getword --- read word from object code file

   subroutine getword (w)
   integer w

   integer hi, lo

   call getbyte (hi)
   call getbyte (lo)
   w = or (ls (hi, 8), lo)

   return
   end



# inchar --- get a (possibly pushed back) input character

   subroutine inchar (c)
   character c

   include "as6800_com.r.i"

   character getch

   if (ibp > 0)
      c = inbuf (ibp)
   else {
      ibp = 1
      inbuf (ibp) = getch (c, STDIN)
      if (Listing == YES)
         call putch (c, lsource)
      }

   if (c ~= EOF)
      ibp = ibp - 1

   return
   end



# initialize --- set up everything for assembly

   subroutine initialize

   include "as6800_com.r.i"

   string codef ".o"

   integer i
   integer create, getarg, mktemp

   character arg (MAXARG)

   code = create (codef, READWRITE)
   if (code == ERR)
      call error ("can't open output file.")

   Listing = NO
   direct_enabled = FALSE
   if (getarg(1, arg, MAXARG) ~= EOF && arg (1) == '-'c)
      for (i = 2; arg (i) ~= EOS; i += 1)
         if (arg (i) == 'l'c || arg (i) == 'L'c) {
            Listing = YES
            list = mktemp (READWRITE)
            if (list == ERR)
               call error ("can't open listing temporary file.")
            lsource = mktemp (READWRITE)
            if (lsource == ERR)
               call error ("can't open source temporary file.")
            }
         else if (arg (i) == 'd'c || arg (i) == 'D'c)
            direct_enabled = TRUE
         else
            call error ("Usage: as6800 [-{l|d}]"p)


   lcnt = 1
   lc = 0
   symtop = 0
   ibp = 0

   call dsinit (MEMSIZE)
   call getsym

   call putbyte (TEXTCODE)
   for (i = 2; i <= HEADER_LENGTH; i = i + 1)
      call putbyte (0)

   return
   end



# instruction --- handle op and pseudo-op distinction

   subroutine instruction

   include "as6800_com.r.i"

   integer op
   integer pseudo_op, mach_op

   if (Listing == YES) {
      call print (list, "*8,i*8,i*n.", lc, lcnt)
      }

   if (pseudo_op (token, op) == YES)
      call do_pseudo (op)
   else if (mach_op (token, op) == YES)
      call do_mach (op)
   else {
      call errmsg ("unrecognized symbol in op field.")
      call getsym
      }

   return
   end



# location --- find proper location for a symbol in the sym table

   integer function location (sym)
   character sym (ARB)

   include "as6800_com.r.i"

   integer i
   integer equal

   pointer sdup

   for (i = 1; i <= symtop; i = i + 1)
      if (equal (sym, mem (sym_sym (i))) == YES) {
         if (sym_typ (i) == ALIAS)
            location = sym_val (i)
         else
            location = i
         return
         }

   if (symtop >= MAXSYMTOP) {
      call errmsg ("too many symbols --- assembly stopped.")
      stop
      }

   symtop = symtop + 1
   sym_sym (symtop) = sdup (sym)
   sym_typ (symtop) = UNDEFINED
   sym_val (symtop) = LAMBDA
   sym_brlist (symtop) = LAMBDA

   location = symtop
   return
   end



# mach_op --- is token a machine operator?
   integer function mach_op (token, op)
   character token (ARB)
   integer op

   character instructions (5, MAXINSTRUCTIONS)

   integer top, bottom, middle, comp
   integer compare

   data instructions /_
      'a'c, 'b'c, 'a'c, 2 * EOS,     # aba
      'a'c, 'd'c, 'c'c, 'a'c, EOS,   # adca
      'a'c, 'd'c, 'c'c, 'b'c, EOS,   # adcb
      'a'c, 'd'c, 'd'c, 'a'c, EOS,   # adda
      'a'c, 'd'c, 'd'c, 'b'c, EOS,   # addb
      'a'c, 'n'c, 'd'c, 'a'c, EOS,   # anda
      'a'c, 'n'c, 'd'c, 'b'c, EOS,   # andb
      'a'c, 's'c, 'l'c, 2 * EOS,     # asl
      'a'c, 's'c, 'l'c, 'a'c, EOS,   # asla
      'a'c, 's'c, 'l'c, 'b'c, EOS,   # aslb
      'a'c, 's'c, 'r'c, 2 * EOS,     # asr
      'a'c, 's'c, 'r'c, 'a'c, EOS,   # asra
      'a'c, 's'c, 'r'c, 'b'c, EOS,   # asrb
      _
      'b'c, 'c'c, 'c'c, 2 * EOS,     # bcc
      'b'c, 'c'c, 's'c, 2 * EOS,     # bcs
      'b'c, 'e'c, 'q'c, 2 * EOS,     # beq
      'b'c, 'g'c, 'e'c, 2 * EOS,     # bge
      'b'c, 'g'c, 't'c, 2 * EOS,     # bgt
      'b'c, 'h'c, 'i'c, 2 * EOS,     # bhi
      'b'c, 'i'c, 't'c, 'a'c, EOS,   # bita
      'b'c, 'i'c, 't'c, 'b'c, EOS,   # bitb
      'b'c, 'l'c, 'e'c, 2 * EOS,     # ble
      'b'c, 'l'c, 's'c, 2 * EOS,     # bls
      'b'c, 'l'c, 't'c, 2 * EOS,     # blt
      'b'c, 'm'c, 'i'c, 2 * EOS,     # bmi
      'b'c, 'n'c, 'e'c, 2 * EOS,     # bne
      'b'c, 'p'c, 'l'c, 2 * EOS,     # bpl
      'b'c, 'r'c, 'a'c, 2 * EOS,     # bra
      'b'c, 's'c, 'r'c, 2 * EOS,     # bsr
      'b'c, 'v'c, 'c'c, 2 * EOS,     # bvc
      'b'c, 'v'c, 's'c, 2 * EOS,     # bvs
      _
      'c'c, 'b'c, 'a'c, 2 * EOS,     # cba
      'c'c, 'l'c, 'c'c, 2 * EOS,     # clc
      'c'c, 'l'c, 'i'c, 2 * EOS,     # cli
      'c'c, 'l'c, 'r'c, 2 * EOS,     # clr
      'c'c, 'l'c, 'r'c, 'a'c, EOS,   # clra
      'c'c, 'l'c, 'r'c, 'b'c, EOS,   # clrb
      'c'c, 'l'c, 'v'c, 2 * EOS,     # clv
      'c'c, 'm'c, 'p'c, 'a'c, EOS,   # cmpa
      'c'c, 'm'c, 'p'c, 'b'c, EOS,   # cmpb
      'c'c, 'o'c, 'm'c, 2 * EOS,     # com
      'c'c, 'o'c, 'm'c, 'a'c, EOS,   # coma
      'c'c, 'o'c, 'm'c, 'b'c, EOS,   # comb
      'c'c, 'p'c, 'x'c, 2 * EOS,     # cpx
      _
      'd'c, 'a'c, 'a'c, 2 * EOS,     # daa
      'd'c, 'e'c, 'c'c, 2 * EOS,     # dec
      'd'c, 'e'c, 'c'c, 'a'c, EOS,   # deca
      'd'c, 'e'c, 'c'c, 'b'c, EOS,   # decb
      'd'c, 'e'c, 's'c, 2 * EOS,     # des
      'd'c, 'e'c, 'x'c, 2 * EOS,     # dex
      _
      'e'c, 'o'c, 'r'c, 'a'c, EOS,   # eora
      'e'c, 'o'c, 'r'c, 'b'c, EOS,   # eorb
      _
      'i'c, 'n'c, 'c'c, 2 * EOS,     # inc
      'i'c, 'n'c, 'c'c, 'a'c, EOS,   # inca
      'i'c, 'n'c, 'c'c, 'b'c, EOS,   # incb
      'i'c, 'n'c, 's'c, 2 * EOS,     # ins
      'i'c, 'n'c, 'x'c, 2 * EOS,     # inx
      _
      'j'c, 'm'c, 'p'c, 2 * EOS,     # jmp
      'j'c, 's'c, 'r'c, 2 * EOS,     # jsr
      _
      'l'c, 'd'c, 'a'c, 'a'c, EOS,   # ldaa
      'l'c, 'd'c, 'a'c, 'b'c, EOS,   # ldab
      'l'c, 'd'c, 's'c, 2 * EOS,     # lds
      'l'c, 'd'c, 'x'c, 2 * EOS,     # ldx
      'l'c, 's'c, 'r'c, 2 * EOS,     # lsr
      'l'c, 's'c, 'r'c, 'a'c, EOS,   # lsra
      'l'c, 's'c, 'r'c, 'b'c, EOS,   # lsrb
      _
      'n'c, 'e'c, 'g'c, 2 * EOS,     # neg
      'n'c, 'e'c, 'g'c, 'a'c, EOS,   # nega
      'n'c, 'e'c, 'g'c, 'b'c, EOS,   # negb
      'n'c, 'o'c, 'p'c, 2 * EOS,     # nop
      _
      'o'c, 'r'c, 'a'c, 'a'c, EOS,   # oraa
      'o'c, 'r'c, 'a'c, 'b'c, EOS,   # orab
      _
      'p'c, 's'c, 'h'c, 'a'c, EOS,   # psha
      'p'c, 's'c, 'h'c, 'b'c, EOS,   # pshb
      'p'c, 'u'c, 'l'c, 'a'c, EOS,   # pula
      'p'c, 'u'c, 'l'c, 'b'c, EOS,   # pulb
      _
      'r'c, 'o'c, 'l'c, 2 * EOS,     # rol
      'r'c, 'o'c, 'l'c, 'a'c, EOS,   # rola
      'r'c, 'o'c, 'l'c, 'b'c, EOS,   # rolb
      'r'c, 'o'c, 'r'c, 2 * EOS,     # ror
      'r'c, 'o'c, 'r'c, 'a'c, EOS,   # rora
      'r'c, 'o'c, 'r'c, 'b'c, EOS,   # rorb
      'r'c, 't'c, 'i'c, 2 * EOS,     # rti
      'r'c, 't'c, 's'c, 2 * EOS,     # rts
      _
      's'c, 'b'c, 'a'c, 2 * EOS,     # sba
      's'c, 'b'c, 'c'c, 'a'c, EOS,   # sbca
      's'c, 'b'c, 'c'c, 'b'c, EOS,   # sbcb
      's'c, 'e'c, 'c'c, 2 * EOS,     # sec
      's'c, 'e'c, 'i'c, 2 * EOS,     # sei
      's'c, 'e'c, 'v'c, 2 * EOS,     # sev
      's'c, 't'c, 'a'c, 'a'c, EOS,   # staa
      's'c, 't'c, 'a'c, 'b'c, EOS,   # stab
      's'c, 't'c, 's'c, 2 * EOS,     # sts
      's'c, 't'c, 'x'c, 2 * EOS,     # stx
      's'c, 'u'c, 'b'c, 'a'c, EOS,   # suba
      's'c, 'u'c, 'b'c, 'b'c, EOS,   # subb
      's'c, 'w'c, 'i'c, 2 * EOS,     # swi
      's'c, 'y'c, 's'c, 2 * EOS,     # sys
      _
      't'c, 'a'c, 'b'c, 2 * EOS,     # tab
      't'c, 'a'c, 'p'c, 2 * EOS,     # tap
      't'c, 'b'c, 'a'c, 2 * EOS,     # tba
      't'c, 'p'c, 'a'c, 2 * EOS,     # tpa
      't'c, 's'c, 't'c, 2 * EOS,     # tst
      't'c, 's'c, 't'c, 'a'c, EOS,   # tsta
      't'c, 's'c, 't'c, 'b'c, EOS,   # tstb
      't'c, 's'c, 'x'c, 2 * EOS,     # tsx
      't'c, 'x'c, 's'c, 2 * EOS,     # txs
      _
      'w'c, 'a'c, 'i'c, 2 * EOS/     # wai

   top = 1
   bottom = MAXINSTRUCTIONS
   repeat {                       # binary search for mnemonic
      middle = rs (top + bottom, 1)
      comp = compare (token, instructions (1, middle))
      if (comp >= 0)
         top = middle + 1
      if (comp <= 0)
         bottom = middle - 1
      } until (top > bottom)

   if (comp == 0) {              # found it
      mach_op = YES
      op = middle
      }
   else
      mach_op = NO

   return
   end



# pseudo_op --- return YES if token is a pseudo-op

   integer function pseudo_op (token, op)
   character token (ARB)
   integer op

   string byteop "byte"
   string defop  "def"
   string wordop "word"
   string resop "res"
   string orgop "org"

   integer equal

   pseudo_op = YES
   if (equal (token, byteop) == YES)
      op = BYTE_OP
   else if (equal (token, defop) == YES)
      op = DEF_OP
   else if (equal (token, wordop) == YES)
      op = WORD_OP
   else if (equal (token, resop) == YES)
      op = RES_OP
   else if (equal (token, orgop) == YES)
      op = ORG_OP
   else
      pseudo_op = NO

   return
   end



# pushback --- push character back onto input
   subroutine pushback (c)
   character c

   include "as6800_com.r.i"

   ibp = ibp + 1
   if (ibp > INBUFSIZE)
      call errmsg ("too many characters pushed back.")
   else
      inbuf (ibp) = c

   return
   end



# putbyte --- write given byte onto code file

   subroutine putbyte (b)
   integer b

   include "as6800_com.r.i"

   integer w, junk
   integer mapfd

   w = rt (b, 8)
   call prwf$$ (KWRIT, mapfd (code), loc (w), 1, intl (0), junk, junk)

   return
   end



# putrel --- set a bit in the relocation bit map

   subroutine putrel (reloc, address)
   integer reloc, address

   include "as6800_com.r.i"

   integer word, mask

   word = address / 8 + 1
   mask = ls (1, 7 - mod (address, 8))

   if (reloc == RELOCATABLE)
      rmap (word) = or (rmap (word), mask)
   else
      rmap (word) = and (rmap (word), not (mask))

   return
   end



# putword --- put word out on object code file

   subroutine putword (w)
   integer w

   call putbyte (rs (w, 8))
   call putbyte (rt (w, 8))

   return
   end



# scan_comment --- arrange for comments to be ignored

   subroutine scan_comment

   include "as6800_com.r.i"

   character c

   repeat
      call inchar (c)
      until (c == NEWLINE)

   lcnt = lcnt + 1
   symbol = EOLSYM
   return
   end



# scan_dec --- collect decimal number from input stream

   subroutine scan_dec

   include "as6800_com.r.i"

   string dec "0123456789"

   character c

   integer i
   integer index

   constval = 0
   repeat {
      call inchar (c)
      i = index (dec, c)
      if (i < 1) {
         call pushback (c)
         break
         }
      constval = 10 * constval + i - 1
      }

   symbol = CONSTSYM
   return
   end



# scan_hex --- collect hexadecimal number from input

   subroutine scan_hex

   include "as6800_com.r.i"

   string hex "0123456789abcdef"

   character c
   character mapdn

   integer i
   integer index

   constval = 0
   repeat {
      call inchar (c)
      i = index (hex, mapdn (c))
      if (i < 1) {
         call pushback (c)
         break
         }
      constval = ls (constval, 4) + i - 1
      }

   symbol = CONSTSYM
   return
   end



# scan_id --- collect tokens beginning with an identifier

   subroutine scan_id

   include "as6800_com.r.i"

   integer i

   character c

   logical alpha

   i = 1
   repeat {
      call inchar (c)
      if (~alpha (c) & (c < '0'c | c > '9'c))
         break
      token (i) = c
      i = i + 1
      }

   token (i) = EOS
   if (c == ':'c)
      symbol = LABELSYM
   else {
      call pushback (c)
      symbol = IDSYM
      }

   return
   end



# sdup --- duplicate string in dynamic memory

   pointer function sdup (str)
   character str (ARB)

   include "as6800_com.r.i"

   integer p
   integer length, dsget

   p = dsget (length (str) + 1)
   call scopy (str, 1, mem, p)

   sdup = p
   return
   end



# seekend --- seek to end of code file

   subroutine seekend

   include "as6800_com.r.i"

   integer junk
   integer mapfd

   call prwf$$ (KPOSN + KPREA, mapfd (code), loc (0), 0, intl (65536),
      junk, junk)

   return
   end



# seek --- seek to given position in code file

   subroutine seek (posn)
   integer posn

   include "as6800_com.r.i"

   integer junk
   integer mapfd

   call prwf$$ (KPOSN + KPREA, mapfd (code), loc (0), 0, intl (posn),
      junk, junk)

   return
   end



# xseek --- seek in object code file, skipping header

   subroutine xseek (posn)
   integer posn

   call seek (posn + HEADER_LENGTH)

   return
   end


# build_listing --- create a listing of the source 6800 program (pass 2)

   subroutine build_listing

   include "as6800_com.r.i"

   integer get_index, getlin
   integer last_location,
      b1, b2, b3,
      llc, nlc,
      llcnt, nlcnt,
      line(MAXLINE),
      listing_end,
      multiple,
      count

   call seek(1)   # position to read length of code file
   call get_code (b1, b2, b3, 2)    # read last position
   last_location = ls (b1, 8) + b2  # and create 16 bit int

   call xseek (0)    # rewind code file
   call rewind (list)   # rewind temp index file
   call rewind (lsource)   # rewind source temporary

   llcnt = 0
   llc   = 0
   multiple = NO
   listing_end = NO

   while (listing_end ~= EOF) {

      if (get_index (nlc, nlcnt) == EOF) {
         nlc = last_location
         nlcnt = llcnt + 1    # in order to print the last instruction
         listing_end = EOF
         }
DEBUG call print (ERROUT, "build_listing: nlc=*i, nlcnt=*i, end=*i*n"p,
DEBUG       nlc, nlcnt, listing_end)

      if ((nlcnt - llcnt) > 1) {    # comments are missing in index
DEBUG call print (ERROUT, "Found missing lines in index*n.")
         if ((nlc-llc) ~= 0) {   # single instruction awaiting output
DEBUG call print (ERROUT, "output pending instruction*n.")
            if (multiple == YES) {  # end of a multiple instruction
DEBUG call print (ERROUT, "pending instruction is end of multiple*n.")
               call get_code (b1, b2, b3, (nlc-llc), nlc)
               call listing (llcnt,llc,b1,b2,b3,(llc-nlc),line)
               multiple = NO
               }
            else {   # simple single instruction to output
DEBUG call print (ERROUT, "pending instruction is simple*n.")
               call get_code (b1, b2, b3, (nlc-llc), nlc)
               if (getlin(line, lsource) == EOF)
                  call error ("In build_listing: shouldn't happen.")
               call listing (llcnt,llc,b1,b2,b3,(nlc-llc),line)
               }
            }     # finished the cleanup, output the comment(s)
         count = nlcnt - llcnt -1     # number of comments
DEBUG call print (ERROUT, "there are *i comments*n.", count)
         for (; count > 0; count = count - 1) {
            if (EOF == getlin (line, lsource))
               call error ("in build_listing: shouldn't happen.")
            call listing (nlcnt-count, llc, 0, 0, 0, 0, line)
            }
         }

      else if (llc == nlc  && llc == 0) {    # first thing is instruction
         llcnt = nlcnt
DEBUG call print (ERROUT, "first source line is an instruction*n.")
         next
         }

      else if (nlc ~= llc && llcnt == nlcnt) {   # multiple instructions
DEBUG call print (ERROUT, "multiple instruction*n.")
         if (multiple == YES) {
DEBUG call print (ERROUT, "and continues a multiple instruction*n.")
            call get_code (b1, b2, b3, nlc-llc, nlc)# get code
            call listing (llcnt, llc, b1, b2, b3, (llc-nlc), line)
            }
         else {
            multiple = YES
            call get_code (b1, b2, b3, nlc-llc, nlc)# get next inst.
            if (EOF == getlin (line, lsource))
                  call error ("In build_listing: shouldn't happen.")
            call listing (llcnt, llc, b1, b2, b3, (nlc-llc), line)
            }
         }

      else {
DEBUG call print (ERROUT, "simple instruction will follow*n.")
         call get_code (b1, b2, b3, nlc-llc, nlc)# get code generated
         if (multiple == YES) {
DEBUG call print (ERROUT, "and terminates multiple instruction*n.")
            call listing (llcnt, llc, b1, b2, b3, (nlc-llc)*(-1), line)
            multiple = NO
            }
         else {
            if (EOF == getlin (line, lsource))
               call error ("in build_listing: can't happen.")
            call listing (llcnt, llc, b1, b2, b3, (nlc-llc), line)
            }
         }

      llc = nlc      # next is now last
      llcnt = nlcnt
      }

   while (getlin (line, lsource) ~= EOF) {   # see if a trailing comment
DEBUG call print (ERROUT, "trailing comment:*n.")
      call listing (llcnt, llc, b1,b2,b3, 0, line)
      llcnt = llcnt + 1
      }

   return
   end

# listing --- output a listing line to STDOUT

   subroutine listing (lcnt, lc, b1, b2, b3, nbytes, line)
   integer lcnt, lc, b1, b2, b3, nbytes
   character line (ARB)

   select (nbytes)

   when (-1) {
      call print (STDOUT, "         (*4,16,0j)  *2,16,0j*n.", lc, b1)
DEBUG call print (ERROUT, "single byte continuation*n.")
      }

   when (-2) {
      call print (STDOUT, "         (*4,16,0j)  *2,16,0j *2,16,0j*n.",lc,b1,b2)
DEBUG call print (ERROUT, "double byte continuation*n.")
      }

   when (-3) {
      call print (STDOUT, "         (*4,16,0j)  *2,16,0j *2,16,0j *2,16,0j*n.",
         lc, b1, b2, b3)
DEBUG call print (ERROUT, "tripple byte continuation*n.")
      }

   when (1) {
      call print (STDOUT, "*5,i    (*4,16,0j)  *2,16,0j          *s.",
         lcnt, lc, b1, line)
DEBUG call print (ERROUT, "single byte normal*n.")
      }

   when (2) {
      call print (STDOUT, "*5,i    (*4,16,0j)  *2,16,0j *2,16,0j       *s.",
         lcnt, lc, b1, b2, line)
DEBUG call print (ERROUT, "double byte normal*n.")
      }

   when (3) {
      call print (STDOUT, "*5,i    (*4,16,0j)  *2,16,0j *2,16,0j *2,16,0j    *s.",
         lcnt, lc, b1, b2, b3, line)
DEBUG call print (ERROUT, "tripple byte normal*n.")
      }

   else {
      call print (STDOUT, "*5,i                        *s.", lcnt, line)
DEBUG call print (ERROUT, "comment-type line assumed*n.")
      }

   return
   end

# get_index --- function to get next set of listing indexes

   integer function get_index (loclc, loclcnt)
   integer loclc, loclcnt

   include "as6800_com.r.i"

   integer getlin, ctoi
   integer i
   character line (MAXLINE)

   if (getlin (line, list) == EOF) {
DEBUG call print (ERROUT, "getlin (--,list) = EOF*n"p)
      get_index = EOF
      return
      }

DEBUG call print (ERROUT, "getlin: '*s'*n"p, line)
   i = 1
   loclc = ctoi (line, i)
   loclcnt = ctoi (line, i)

   return (OK)
   end

# get_code --- subroutine to fetch the next 'bytes' bytes of code

   subroutine get_code (b1, b2, b3, bytes, nlc)
   integer b1, b2, b3, bytes, nlc

   include "as6800_com.r.i"

   integer junk
   integer mapfd

   select (bytes)

   when (1)
      call prwf$$ (KREAD, mapfd(code), loc(b1), 1, intl(0), junk, junk)

   when (2) {
      call prwf$$ (KREAD, mapfd(code), loc(b1), 1, intl(0), junk, junk)
      call prwf$$ (KREAD, mapfd(code), loc(b2), 1, intl(0), junk, junk)
      }

   when (3) {
      call prwf$$ (KREAD, mapfd(code), loc(b1), 1, intl(0), junk, junk)
      call prwf$$ (KREAD, mapfd(code), loc(b2), 1, intl(0), junk, junk)
      call prwf$$ (KREAD, mapfd(code), loc(b3), 1, intl(0), junk, junk)
      }

   else {
      call xseek (nlc)
      b1 = 0
      b2 = 0
      b3 = 0
      }

   return
   end
