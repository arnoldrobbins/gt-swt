#     Copyright (c) 1979 by Allen Akin and Tom Chappell.

# These programs were developed by Allen Akin and Tom Chappell
# for  use  with  the  Software Tools Subsystem at the Georgia
# Institute of Technology.  General permission is  granted  to
# copy  and  use  this  software  product,  provided that this
# notice is included in full with each copy.



# as8080 --- 8080 assembler for SSPL output

   include PRIMOS_KEYS
   include "as6800_def.r.i"

# defines affecting size:
define(MAXINSTRUCTIONS,83)

# symbols recognized by the assembler:
define(CONSTSYM,1)
define(EOFSYM,2)
define(EOLSYM,3)
define(IDSYM,4)
define(LABELSYM,5)
define(ORSYM,6)
define(ANDSYM,7)

# pseudo-ops:
define(BYTE_OP,0)
define(DEF_OP,1)
define(WORD_OP,2)

   include "as8080_com.r.i"

   call initialize
   while (symbol ~= EOFSYM)
      if (symbol == EOLSYM)
         call getsym
      else if (symbol == LABELSYM) {
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

   include "as8080_com.r.i"

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
      if (mem (sym_sym (i)) ~= '_'c
        & sym_typ (i) ~= REGISTER) {  # throw away temporary symbols
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



# cputbyte --- do most-common "putbyte" operation

   subroutine cputbyte (val, reloc)
   integer val, reloc

   include "as8080_com.r.i"

   call putbyte (val)
   call putrel (reloc, lc)
   lc = lc + 1

   return
   end



# cputword --- do most-common "putword" operation

   subroutine cputword (val, reloc)
   integer val, reloc

   call cputbyte (rt (val, 8), reloc)
   call cputbyte (rs (val, 8), ABSOLUTE)

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
   integer op, expr

   include "as8080_com.r.i"

   integer reloc, v (MAXINSTRUCTIONS)
   integer iov1, iov2, ityp, mcode, i, junk

   data v/ _
      8011, # (empty)
      _
      5206, # aci
      2136, # adc
      2128, # add
      5198, # adi
      2160, # ana
      5230, # ani
      _
      _
      7205, # call
      7220, # cc
      0047, # cma
      0063, # cmc
      2184, # cmp
      7252, # cm
      7212, # cnc
      7196, # cnz
      7244, # cp
      7236, # cpe
      5254, # cpi
      7228, # cpo
      7204, # cz
      _
      0039, # daa
      1009, # dad
      1005, # dcr
      1011, # dcx
      0243, # di
      _
      0251, # ei
      _
      _
      _
      8013, # hex
      0118, # hlt
      _
      5219, # in
      1004, # inr
      1003, # inx
      _
      7218, # jc
      7250, # jm
      7195, # jmp
      7210, # jnc
      7194, # jnz
      7242, # jp
      7234, # jpe
      7226, # jpo
      7202, # jz
      _
      _
      7058, # lda
      1010, # ldax
      7042, # lhld
      6001, # lxi
      _
      3064, # mov
      4006, # mvi
      _
      0000, # nop
      _
      2176, # ora
      8000, # org
      5246, # ori
      5211, # out
      _
      0233, # pchl
      1193, # pop
      1197, # push
      _
      _
      0023, # ral
      0031, # rar
      0216, # rc
      0201, # ret
      0007, # rlc
      0248, # rm
      0208, # rnc
      0192, # rnz
      0240, # rp
      0232, # rpe
      0224, # rpo
      0015, # rrc
      1199, # rst
      0200, # rz
      _
      2152, # sbb
      5222, # sbi
      8002, # set
      7034, # shld
      0249, # sphl
      7050, # sta
      1002, # stax
      0055, # stc
      2144, # sub
      5214, # sui
      _
      _
      _
      _
      _
      0235, # xchg
      2168, # xra
      5238, # xri
      0227, # xthl
      _
      _
      _
      EOF/  # EOF

   ityp  = v(op) / 1000
   mcode = v(op) - ityp*1000

   i = ityp + 1
   case i {

   # ityp = 0
         {
         call cputbyte (mcode, ABSOLUTE)
         call getsym
         }

   # ityp = 1
         {
         if (expr (iov1, junk) == ERR)
            return
         call cputbyte (mcode+mod(iabs(iov1), 8)*8, ABSOLUTE)
         }

   # ityp = 2
         {
         if (expr (iov1, junk) == ERR)
            return
         call cputbyte (mcode+mod(iabs(iov1), 8), ABSOLUTE)
         }

   # ityp = 3
         {
         if (expr (iov1, junk) == ERR)
            return
         if (expr (iov2, reloc) == ERR)
            return
         call cputbyte (mcode+mod(iabs(iov1), 8)*8+mod(iov2, 8), ABSOLUTE)
         }

   # ityp = 4
         {
         if (expr (iov1, junk) == ERR)
            return
         call cputbyte (mcode+mod(iabs(iov1), 8)*8, ABSOLUTE)
         if (expr (iov2, reloc) == ERR)
            return
         call cputbyte (rt (iov2, 8), reloc)
         }

   # ityp = 5
         {
         call cputbyte (mcode, ABSOLUTE)
         if (expr (iov1, reloc) == ERR)
            return
         call cputbyte (rt (iov1, 8), reloc)
         }

   # ityp = 6
         {
         if (expr (iov1, junk) == ERR)
            return
         call cputbyte (mcode+mod(iabs(iov1), 8)*8, ABSOLUTE)
         if (expr (iov2, reloc) == ERR)
            return
         call cputword (iov2, reloc)
         }

   # ityp = 7
         {
         call cputbyte (mcode, ABSOLUTE)
         if (expr (iov1, reloc) == ERR)
            return
         call cputword (iov1, reloc)
         }

      }  # end case

   if (symbol ~= EOLSYM) {
      call errmsg("end of line expected.")
      while (symbol ~= EOLSYM)
         call getsym
      }
   return
   end



# do_pseudo --- perform assembler pseudo-ops

   subroutine do_pseudo (op)
   integer op, expr

   include "as8080_com.r.i"

   integer val, reloc
   integer location

   character subst (MAXTOK)

   if (op == BYTE_OP) {
      if (expr (val, reloc) == ERR)
         return
      if (reloc == RELOCATABLE | val > 255 | val < -128)
         call print (STDOUT, "reloc = *i; val = *i*n.", reloc, val)
      call cputbyte (val, ABSOLUTE)
      }
   else if (op == DEF_OP) {
      call getsym
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
   else {      # op is WORD_OP
      if (expr (val, reloc) == ERR)
         return
      call cputword (val, reloc)
      }

   return
   end



# enter --- enter symbol, type, and value in symbol table

   subroutine enter (sym, type, val)
   character sym (ARB)
   integer type, val

   include "as8080_com.r.i"

   integer l
   integer location

   l = location (sym)
   if (sym_typ (l) ~= EXTERNAL)
      call errmsg ("symbol redefined.")
   else {
      call chainback (sym_val (l), val, type)
      sym_typ (l) = type
      sym_val (l) = val
      }

   return
   end



# errmsg --- print line number and error message

   subroutine errmsg (msg)
   integer msg (ARB)

   include "as8080_com.r.i"

   call print (ERROUT, "*4i: *p*n.", lcnt, msg)

   return
   end



# expr --- parse and evaluate a non-branch expression

   integer function expr (val, reloc)
   integer val, reloc

   include "as8080_com.r.i"

   integer l, val2, operator
   integer location, call_expr

   if (symbol == EOLSYM) {
      expr = ERR
      call errmsg ("expression expected.")
      val = 0
      reloc = ABSOLUTE
      return
      }

   expr = OK
   call getsym
   if (symbol == CONSTSYM) {        # constant expression
      val = constval
      call getsym
      if (symbol >= ORSYM & symbol <= ANDSYM) { # expression
         operator = symbol
         expr = call_expr (val2, reloc)
         if (operator == ORSYM)
            val = or (val, val2)
         else if (operator == ANDSYM)
            val = and (val, val2)
         }
      reloc = ABSOLUTE
      }
   else if (symbol == IDSYM) {
      l = location (token)
      if (sym_typ (l) == EXTERNAL) {
         val = sym_val (l)          # make forward-ref chain
         sym_val (l) = lc
         reloc = ABSOLUTE
         }
      else {
         val = sym_val (l)
         reloc = sym_typ (l)
         }
      call getsym
      }
   else {
      expr = ERR
      call errmsg ("missing expression.")
      val = 0
      reloc = ABSOLUTE
      while (symbol ~= EOLSYM)
         call getsym
      }

   return
   end



# call_expr --- kludge to subvert FORTRAN

   integer function call_expr (val, reloc)
   integer val, reloc

   integer expr

   call_expr = expr (val, reloc)

   return
   end



# getbyte --- read one byte from code file

   subroutine getbyte (b)
   integer b

   include "as8080_com.r.i"

   integer junk
   integer mapfd

   call prwf$$ (KREAD, mapfd (code), loc (b), 1, intl (0), junk, junk)

   return
   end



# getsym --- get next symbol from input stream

   subroutine getsym

   include "as8080_com.r.i"

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
   else if (c == '#'c)
      call scan_comment
   else if (c == ';'c | c == NEWLINE) {
      if (c == NEWLINE)
         lcnt = lcnt + 1
      symbol = EOLSYM
      }
   else if (c == '|'c)
      symbol = ORSYM
   else if (c == '&'c)
      symbol = ANDSYM
   else if (c == EOF)
      symbol = EOFSYM

   return
   end



# getword --- read word from object code file

   subroutine getword (w)
   integer w

   integer hi, lo

   call getbyte (lo)
   call getbyte (hi)
   w = or (ls (hi, 8), lo)

   return
   end



# inchar --- get a (possibly pushed back) input character

   subroutine inchar (c)
   character c

   include "as8080_com.r.i"

   character getch

   if (ibp > 0)
      c = inbuf (ibp)
   else {
      ibp = 1
      inbuf (ibp) = getch (c, STDIN)
      }

   if (c ~= EOF)
      ibp = ibp - 1

   return
   end



# initialize --- set up everything for assembly

   subroutine initialize

   integer create

   character s(4, 26)
   integer i, v(26)

   include "as8080_com.r.i"

   string codef ".o"

   data s /'a'c, EOS,  EOS,  EOS,
           'b'c, 'c'c, EOS,  EOS,
           'b'c, EOS,  EOS,  EOS,
           'c'c, EOS,  EOS,  EOS,
           'd'c, 'e'c, EOS,  EOS,
           'd'c, EOS,  EOS,  EOS,
           'e'c, EOS,  EOS,  EOS,
           'h'c, 'l'c, EOS,  EOS,
           'h'c, EOS,  EOS,  EOS,
           'l'c, EOS,  EOS,  EOS,
           'm'c, EOS,  EOS,  EOS,
           'p'c, 's'c, 'w'c, EOS,
           's'c, 'p'c, EOS,  EOS,
                     _
           'A'c, EOS,  EOS,  EOS,
           'B'c, 'C'c, EOS,  EOS,
           'B'c, EOS,  EOS,  EOS,
           'C'c, EOS,  EOS,  EOS,
           'D'c, 'E'c, EOS,  EOS,
           'D'c, EOS,  EOS,  EOS,
           'E'c, EOS,  EOS,  EOS,
           'H'c, 'L'c, EOS,  EOS,
           'H'c, EOS,  EOS,  EOS,
           'L'c, EOS,  EOS,  EOS,
           'M'c, EOS,  EOS,  EOS,
           'P'c, 'S'c, 'W'c, EOS,
           'S'c, 'P'c, EOS,  EOS/

   data v /7, 0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6, 6, _ # values for above
           7, 0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6, 6/

   code = create (codef, READWRITE)
   if (code == ERR)
      call error ("can't open output file.")

   lcnt = 1
   lc = 0
   symtop = 0
   ibp = 0

   call dsinit (MEMSIZE)
   call getsym

   call putbyte (TEXTCODE)
   for (i = 2; i <= HEADER_LENGTH; i = i + 1)
      call putbyte (0)

   for (i = 1; i <= 26; i = i + 1)      # define register values
      call enter (s(1, i), REGISTER, v(i))

   return
   end



# instruction --- handle op and pseudo-op distinction

   subroutine instruction

   include "as8080_com.r.i"

   character mapdn

   integer op, i
   integer pseudo_op, mach_op

   for (i = 1; token (i) ~= EOS; i = i + 1)
      token (i) = mapdn (token (i))

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

   include "as8080_com.r.i"

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
   sym_typ (symtop) = EXTERNAL
   sym_val (symtop) = LAMBDA

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
      EOS,  EOS,  EOS,  EOS,  EOS,  # (empty)
      _
      'a'c, 'c'c, 'i'c, EOS,  EOS,  # aci
      'a'c, 'd'c, 'c'c, EOS,  EOS,  # adc
      'a'c, 'd'c, 'd'c, EOS,  EOS,  # add
      'a'c, 'd'c, 'i'c, EOS,  EOS,  # adi
      'a'c, 'n'c, 'a'c, EOS,  EOS,  # ana
      'a'c, 'n'c, 'i'c, EOS,  EOS,  # ani
      _
      _
      'c'c, 'a'c, 'l'c, 'l'c, EOS,  # call
      'c'c, 'c'c, EOS,  EOS,  EOS,  # cc
      'c'c, 'm'c, 'a'c, EOS,  EOS,  # cma
      'c'c, 'm'c, 'c'c, EOS,  EOS,  # cmc
      'c'c, 'm'c, 'p'c, EOS,  EOS,  # cmp
      'c'c, 'm'c, EOS,  EOS,  EOS,  # cm
      'c'c, 'n'c, 'c'c, EOS,  EOS,  # cnc
      'c'c, 'n'c, 'z'c, EOS,  EOS,  # cnz
      'c'c, 'p'c, EOS,  EOS,  EOS,  # cp
      'c'c, 'p'c, 'e'c, EOS,  EOS,  # cpe
      'c'c, 'p'c, 'i'c, EOS,  EOS,  # cpi
      'c'c, 'p'c, 'o'c, EOS,  EOS,  # cpo
      'c'c, 'z'c, EOS,  EOS,  EOS,  # cz
      _
      'd'c, 'a'c, 'a'c, EOS,  EOS,  # daa
      'd'c, 'a'c, 'd'c, EOS,  EOS,  # dad
      'd'c, 'c'c, 'r'c, EOS,  EOS,  # dcr
      'd'c, 'c'c, 'x'c, EOS,  EOS,  # dcx
      'd'c, 'i'c, EOS,  EOS,  EOS,  # di
      _
      'e'c, 'i'c, EOS,  EOS,  EOS,  # ei
      _
      _
      _
      'h'c, 'e'c, 'x'c, EOS,  EOS,  # hex
      'h'c, 'l'c, 't'c, EOS,  EOS,  # hlt
      _
      'i'c, 'n'c, EOS,  EOS,  EOS,  # in
      'i'c, 'n'c, 'r'c, EOS,  EOS,  # inr
      'i'c, 'n'c, 'x'c, EOS,  EOS,  # inx
      _
      'j'c, 'c'c, EOS,  EOS,  EOS,  # jc
      'j'c, 'm'c, EOS,  EOS,  EOS,  # jm
      'j'c, 'm'c, 'p'c, EOS,  EOS,  # jmp
      'j'c, 'n'c, 'c'c, EOS,  EOS,  # jnc
      'j'c, 'n'c, 'z'c, EOS,  EOS,  # jnz
      'j'c, 'p'c, EOS,  EOS,  EOS,  # jp
      'j'c, 'p'c, 'e'c, EOS,  EOS,  # jpe
      'j'c, 'p'c, 'o'c, EOS,  EOS,  # jpo
      'j'c, 'z'c, EOS,  EOS,  EOS,  # jz
      _
      _
      'l'c, 'd'c, 'a'c, EOS,  EOS,  # lda
      'l'c, 'd'c, 'a'c, 'x'c, EOS,  # ldax
      'l'c, 'h'c, 'l'c, 'd'c, EOS,  # lhld
      'l'c, 'x'c, 'i'c, EOS,  EOS,  # lxi
      _
      'm'c, 'o'c, 'v'c, EOS,  EOS,  # mov
      'm'c, 'v'c, 'i'c, EOS,  EOS,  # mvi
      _
      'n'c, 'o'c, 'p'c, EOS,  EOS,  # nop
      _
      'o'c, 'r'c, 'a'c, EOS,  EOS,  # ora
      'o'c, 'r'c, 'g'c, EOS,  EOS,  # org
      'o'c, 'r'c, 'i'c, EOS,  EOS,  # ori
      'o'c, 'u'c, 't'c, EOS,  EOS,  # out
      _
      'p'c, 'c'c, 'h'c, 'l'c, EOS,  # pchl
      'p'c, 'o'c, 'p'c, EOS,  EOS,  # pop
      'p'c, 'u'c, 's'c, 'h'c, EOS,  # push
      _
      _
      'r'c, 'a'c, 'l'c, EOS,  EOS,  # ral
      'r'c, 'a'c, 'r'c, EOS,  EOS,  # rar
      'r'c, 'c'c, EOS,  EOS,  EOS,  # rc
      'r'c, 'e'c, 't'c, EOS,  EOS,  # ret
      'r'c, 'l'c, 'c'c, EOS,  EOS,  # rlc
      'r'c, 'm'c, EOS,  EOS,  EOS,  # rm
      'r'c, 'n'c, 'c'c, EOS,  EOS,  # rnc
      'r'c, 'n'c, 'z'c, EOS,  EOS,  # rnz
      'r'c, 'p'c, EOS,  EOS,  EOS,  # rp
      'r'c, 'p'c, 'e'c, EOS,  EOS,  # rpe
      'r'c, 'p'c, 'o'c, EOS,  EOS,  # rpo
      'r'c, 'r'c, 'c'c, EOS,  EOS,  # rrc
      'r'c, 's'c, 't'c, EOS,  EOS,  # rst
      'r'c, 'z'c, EOS,  EOS,  EOS,  # rz
      _
      's'c, 'b'c, 'b'c, EOS,  EOS,  # sbb
      's'c, 'b'c, 'i'c, EOS,  EOS,  # sbi
      's'c, 'e'c, 't'c, EOS,  EOS,  # set
      's'c, 'h'c, 'l'c, 'd'c, EOS,  # shld
      's'c, 'p'c, 'h'c, 'l'c, EOS,  # sphl
      's'c, 't'c, 'a'c, EOS,  EOS,  # sta
      's'c, 't'c, 'a'c, 'x'c, EOS,  # stax
      's'c, 't'c, 'c'c, EOS,  EOS,  # stc
      's'c, 'u'c, 'b'c, EOS,  EOS,  # sub
      's'c, 'u'c, 'i'c, EOS,  EOS,  # sui
      _
      _
      _
      _
      _
      'x'c, 'c'c, 'h'c, 'g'c, EOS,  # xchg
      'x'c, 'r'c, 'a'c, EOS,  EOS,  # xra
      'x'c, 'r'c, 'i'c, EOS,  EOS,  # xri
      'x'c, 't'c, 'h'c, 'l'c, EOS,  # xthl
      _
      _
      _
      EOF,  EOF,  EOF,  EOF,  EOF/  # EOF

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

   integer equal

   pseudo_op = YES
   if (equal (token, byteop) == YES)
      op = BYTE_OP
   else if (equal (token, defop) == YES)
      op = DEF_OP
   else if (equal (token, wordop) == YES)
      op = WORD_OP
   else
      pseudo_op = NO

   return
   end



# pushback --- push character back onto input
   subroutine pushback (c)
   character c

   include "as8080_com.r.i"

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

   include "as8080_com.r.i"

   integer w, junk
   integer mapfd

   w = rt (b, 8)
   call prwf$$ (KWRIT, mapfd (code), loc (w), 1, intl (0), junk, junk)

   return
   end



# putrel --- set a bit in the relocation bit map

   subroutine putrel (reloc, address)
   integer reloc, address

   include "as8080_com.r.i"

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

   call putbyte (rt (w, 8))
   call putbyte (rs (w, 8))

   return
   end



# scan_comment --- arrange for comments to be ignored

   subroutine scan_comment

   include "as8080_com.r.i"

   character c

   repeat
      call inchar (c)
      until (c == NEWLINE)

   symbol = EOLSYM
   return
   end



# scan_dec --- collect decimal number from input stream

   subroutine scan_dec

   include "as8080_com.r.i"

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

   include "as8080_com.r.i"

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

   include "as8080_com.r.i"

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

   include "as8080_com.r.i"

   integer p
   integer length, dsget

   p = dsget (length (str) + 1)
   call scopy (str, 1, mem, p)

   sdup = p
   return
   end



# seekend --- seek to end of code file

   subroutine seekend

   include "as8080_com.r.i"

   integer junk
   integer mapfd

   call prwf$$ (KPOSN + KPREA, mapfd (code), loc (0), 0, intl (65536),
      junk, junk)

   return
   end



# seek --- seek to given position in code file

   subroutine seek (posn)
   integer posn

   include "as8080_com.r.i"

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
