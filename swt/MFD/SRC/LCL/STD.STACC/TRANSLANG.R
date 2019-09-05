# translang --- D-Machine microprogramming language translator

define(DEBUG,)

include "translang_def.r.i"

   call initialize
   call get_options
   call translate
   stop
   end



include PRODUCTIONS



# binary_op_oracle --- look ahead for a binary operator

   subroutine binary_op_oracle (state)
   integer state

   include COMMONBLOCKS

   integer sv_symbol, sv_symval, sv_ibp

   character sv_symtext (MAXLINE)

   state = NOMATCH
   if (Symbol == INT_DENOTATION && Sym_val ~= 0)
      return
   if (Symbol ~= INT_DENOTATION && Symbol ~= A1_SYM && Symbol ~= A2_SYM
    && Symbol ~= A3_SYM && Symbol ~= CTR_SYM && Symbol ~= LIT_SYM)
      return

   call scopy (Sym_text, 1, sv_symtext, 1)
   sv_symbol = Symbol
   sv_symval = Sym_val
   sv_ibp = Ibp

   call getsym
   call operator (state)
   if (state == NOMATCH)
      if (Symbol == PLUS_SYM || Symbol == MINUS_SYM)
         state = ACCEPT

   call scopy (sv_symtext, 1, Sym_text, 1)
   Symbol = sv_symbol
   Sym_val = sv_symval
   Ibp = sv_ibp

   return
   end



# bit_field --- extract a string of bits that will fit in a machine word

   integer function bit_field (start, len, struct)
   integer start, len, struct (ARB)

   integer w1, w2, bleft, res

   w1 = (start - 1) / BITS_PER_WORD + 1
   w2 = struct (w1 + 1)
   w1 = struct (w1)

   bleft = BITS_PER_WORD - mod (start - 1, BITS_PER_WORD)

   res = rt (w1, bleft)
   if (bleft >= len)
      return (rs (res, bleft - len))

   res = ls (res, len - bleft)
   w2 = rs (w2, BITS_PER_WORD - (len - bleft))
   return (or (res, w2))

   end



# bmcl --- parse B-register gating information

   subroutine bmcl (state)
   integer state

   include COMMONBLOCKS

   string gate "0tf1"

   integer mst, mid, lst
   integer index

   state = NOMATCH
   if (Symbol ~= LABEL_SYM || Sym_text (1) ~= 'b'c)
      return

   mst = index (gate, Sym_text (2))
   mid = index (gate, Sym_text (3))
   lst = index (gate, Sym_text (4))

   if (mst == 0 || mid == 0 || lst == 0 || Sym_text (5) ~= EOS)
      return

   mst -= 1
   mid -= 1
   lst -= 1

   state = ACCEPT
   Litval = or (ls (mst, 5), lst)
   if (Sym_text (3) == 't'c)
      Litval |= 2r10000
   else if (Sym_text (3) == '1'c) {
      Litval = and (not (Litval), 2r1100011)
      Comp_y = TRUE
      }
   else if (Sym_text (3) == 'f'c) {
      Litval = or (and (not (Litval), 2r1100011), 2r10000)
      Comp_y = TRUE
      }

   call getsym
   return
   end



# errmsg --- print error message, with some modicum of context

   subroutine errmsg (message)
   packed_char message (ARB)

   include COMMONBLOCKS

   integer i

   if (Listing || Binary)
      call putlin ("******  "s, STDOUT)
   else
      call print (STDOUT, "*i:  "s, Line_number)

   call print (STDOUT, '"'s)
   for (i = max0 (1, Ibp - 5); Inbuf (i) ~= NEWLINE && i <= Ibp + 5; i += 1)
      call putch (Inbuf (Ibp), STDOUT)
   call print (STDOUT, '"  *p*n's, message)

   return
   end



# find_labels --- find all the labels in a program, determine their values

   subroutine find_labels

   include COMMONBLOCKS

   integer state
   integer getlin

   Micro_lc = 0
   while (getlin (Inbuf, Infile) ~= EOF) {
      call mapstr (Inbuf, LOWER)
      Ibp = 1
      call getsym

      call label_oracle (state)
      if (state == ACCEPT) {
         call enter (Sym_text, Micro_lc, Ltab)
         call getsym    # to get the label terminator
         call getsym    # to skip it
         }

      if (Symbol ~= STMT_END)
         Micro_lc += 1
      }

   return
   end



# get_options --- get command-line options

   subroutine get_options

   include COMMONBLOCKS

   ARG_DECL

   character file (MAXPATH)

   file_des open, create

   integer i
   integer getarg, length

   string umesg "Usage: translang [-{l|b}] <input_file> [-h <hex_file>]"

   PARSE_COMMAND_LINE ("l<flag> b<flag> h<req str>"s, umesg)

   if (getarg (1, file, MAXPATH) == EOF)
      call error (umesg)
   Infile = open (file, READ)
   if (Infile == ERR)
      call cant (file)

   if (getarg (2, i, 1) ~= EOF)
      call error (umesg)

   if (ARG_PRESENT (h))
      call scopy (ARG_TEXT (h), 1, file, 1)
   else {
      for (i = length (file); i >= 1 && file (i) ~= '.'c; i -= 1)
         ;
      if (i < 1)
         call scopy (".h"s, 1, file, length (file) + 1)
      else
         call scopy (".h"s, 1, file, i)
      }
   Outfile = create (file, WRITE)
   if (Outfile == ERR)
      call cant (file)

   if (ARG_PRESENT (l))
      Listing = TRUE
   else
      Listing = FALSE

   if (ARG_PRESENT (b))
      Binary = TRUE
   else
      Binary = FALSE

   return
   end



# getsym --- get next symbol from input line

   subroutine getsym

   include COMMONBLOCKS

   string_table rwpos, rwtext _
      / A1_SYM,      "a1" _
      / A2_SYM,      "a2" _
      / A3_SYM,      "a3" _
      / AAD_SYM,     "aad" _
      / ABT_SYM,     "abt" _
      / AMPCR_SYM,   "ampcr" _
      / AND_SYM,     "and" _
      / AOV_SYM,     "aov" _
      / B_SYM,       "b" _
      / BAD_SYM,     "bad" _
      / BBA_SYM,     "bba" _
      / BBE_SYM,     "bbe" _
      / BBI_SYM,     "bbi" _
      / BEX_SYM,     "bex" _
      / BMI_SYM,     "bmi" _
      / BR1_SYM,     "br1" _
      / BR2_SYM,     "br2" _
      / C_SYM,       "c" _
      / CALL_SYM,    "call" _
      / STMT_END,    "comment" _
      / STMT_END,    "commnt" _
      / COMP_SYM,    "comp" _
      / COV_SYM,     "cov" _
      / CSAR_SYM,    "csar" _
      / CTR_SYM,     "ctr" _
      / ELSE_SYM,    "else" _
      / STMT_END,    "end" _
      / EQV_SYM,     "eqv" _
      / EXEC_SYM,    "exec" _
      / IF_SYM,      "if" _
      / IMP_SYM,     "imp" _
      / INC_SYM,     "inc" _
      / JUMP_SYM,    "jump" _
      / L_SYM,       "l" _
      / LC1_SYM,     "lc1" _
      / LC2_SYM,     "lc2" _
      / LC3_SYM,     "lc3" _
      / LCTR_SYM,    "lctr" _
      / LIT_SYM,     "lit" _
      / LMAR_SYM,    "lmar" _
      / LST_SYM,     "lst" _
      / MAR_SYM,     "mar" _
      / MAR1_SYM,    "mar1" _
      / MAR2_SYM,    "mar2" _
      / MIR_SYM,     "mir" _
      / MR1_SYM,     "mr1" _
      / MR2_SYM,     "mr2" _
      / MST_SYM,     "mst" _
      / MW1_SYM,     "mw1" _
      / MW2_SYM,     "mw2" _
      / NAN_SYM,     "nan" _
      / NIM_SYM,     "nim" _
      / NOR_SYM,     "nor" _
      / NOT_SYM,     "not" _
      / NRI_SYM,     "nri" _
      / OAD_SYM,     "oad" _
      / OR_SYM,      "or" _
      / R_SYM,       "r" _
      / RDC_SYM,     "rdc" _
      / RETN_SYM,    "retn" _
      / RIM_SYM,     "rim" _
      / SAI_SYM,     "sai" _
      / SAR_SYM,     "sar" _
      / SAVE_SYM,    "save" _
      / SET_SYM,     "set" _
      / SKIP_SYM,    "skip" _
      / SLIT_SYM,    "slit" _
      / STEP_SYM,    "step" _
      / THEN_SYM,    "then" _
      / WAIT_SYM,    "wait" _
      / WHEN_SYM,    "when" _
      / XOR_SYM,     "xor"

   integer i
   integer ctoi, strbsr

   repeat {    # until we get a legitimate symbol
      while (Inbuf (Ibp) == ' 'c)
         Ibp += 1

      select (Inbuf (Ibp))
         when (SET_OF_LOWER_CASE) {
            i = 1
            while (IS_LOWER (Inbuf (Ibp)) || IS_DIGIT (Inbuf (Ibp))) {
               Sym_text (i) = Inbuf (Ibp)
               i += 1
               Ibp += 1
               }
            Sym_text (i) = EOS
            i = strbsr (rwpos, rwtext, 1, Sym_text)
            if (i == EOF)
               Symbol = LABEL_SYM
            else
               Symbol = rwtext (rwpos (i))
            }
         when (SET_OF_DIGITS) {
            Symbol = INT_DENOTATION
            Sym_val = ctoi (Inbuf, Ibp)
            }
         when ('$'c, '%'c, NEWLINE)
            Symbol = STMT_END
         when ('+'c) {
            Symbol = PLUS_SYM
            Ibp += 1
            }
         when ('-'c) {
            Symbol = MINUS_SYM
            Ibp += 1
            if (Inbuf (Ibp) == '>'c) {
               Symbol = ASSIGN_SYM
               Ibp += 1
               }
            }
         when ('.'c, ':'c) {
            Symbol = LABEL_TERM_SYM
            Ibp += 1
            }
         when ('='c) {
            Symbol = ASSIGN_SYM
            Ibp += 1
            }
         when (','c) {
            Ibp += 1
            next
            }
      ifany
         break
      else {
         call errmsg ("illegal character encountered"p)
         next
         }
      }

   return
   end



# initialize --- initialize everything

   subroutine initialize

   include COMMONBLOCKS

   pointer mktabl

   call dsinit (MEMSIZE)
   Ltab = mktabl (LABEL_INFO_SIZE)

   return
   end



# insert_x --- insert magic 'X' bit into data destined for the SAR

   integer function insert_x (dat)
   integer dat

   return (or (ls (lt (dat, 14), 1), rt (dat, 2)))

   end



# label_oracle --- look into the future for a label terminator

   subroutine label_oracle (state)
   integer state

   include COMMONBLOCKS

   integer sv_symbol, sv_symval, sv_ibp

   character sv_symtext (MAXLINE)

   if (Symbol ~= LABEL_SYM) {
      state = NOMATCH
      return
      }

   call scopy (Sym_text, 1, sv_symtext, 1)
   sv_symbol = Symbol
   sv_symval = Sym_val
   sv_ibp = Ibp

   call getsym

   if (Symbol == LABEL_TERM_SYM)
      state = ACCEPT
   else
      state = NOMATCH

   call scopy (sv_symtext, 1, Sym_text, 1)
   Symbol = sv_symbol
   Sym_val = sv_symval
   Ibp = sv_ibp

   return
   end



# literal_lhs_oracle --- look into the future for a literal assignment

   subroutine literal_lhs_oracle (state)
   integer state

   include COMMONBLOCKS

   integer sv_symbol, sv_symval, sv_ibp, st

   character sv_symtext (MAXLINE)

   call scopy (Sym_text, 1, sv_symtext, 1)
   sv_symbol = Symbol
   sv_symval = Sym_val
   sv_ibp = Ibp

   call literal (st)
   if (st == ACCEPT)
      if (Symbol ~= ASSIGN_SYM)
         state = NOMATCH
      else {
         call getsym
         if (Symbol == AMPCR_SYM || Symbol == SAR_SYM
          || Symbol == LIT_SYM || Symbol == SLIT_SYM)
            state = ACCEPT
         else
            state = NOMATCH
         }
   else
      state = NOMATCH

   call scopy (sv_symtext, 1, Sym_text, 1)
   Symbol = sv_symbol
   Sym_val = sv_symval
   Ibp = sv_ibp

   return
   end



# micro_program --- translate a microprogram

   subroutine micro_program

   include COMMONBLOCKS

   integer state, mlc, nlc
   integer getlin, bit_field

   procedure write_hex (fd) forward

   Line_number = 0
   Micro_lc = 0
   Nano_lc = 0

   while (getlin (Inbuf, Infile) ~= EOF) {
      call mapstr (Inbuf, LOWER)
      Line_number += 1
      if (Listing || Binary)
         call print (STDOUT, "*4i|  *4,-16,0i  *s*n"s, Line_number,
            Micro_lc, Inbuf)
      mlc = Micro_lc
      nlc = Nano_lc
      Ibp = 1
      call getsym
      call instruction (state)
      if (Symbol ~= STMT_END)
         call errmsg ("unrecognizable or incomplete statement"p)
      if (Binary && mlc ~= Micro_lc)
         call print (STDOUT, "*13x*16,-2,0i*n"s, Micro_mem (mlc + 1))
      if (Binary && nlc ~= Nano_lc) {
         call print (STDOUT, "*13x*3,2,0u*4i *i *i *i *i *i *8i"s,
            bit_field (1, 4, Nano_mem (1, nlc + 1)),
            bit_field (5, 3, Nano_mem (1, nlc + 1)),
            bit_field (8, 3, Nano_mem (1, nlc + 1)),
            bit_field (11, 3, Nano_mem (1, nlc + 1)),
            bit_field (14, 3, Nano_mem (1, nlc + 1)),
            bit_field (17, 3, Nano_mem (1, nlc + 1)),
            bit_field (20, 8, Nano_mem (1, nlc + 1)) )
         call print (STDOUT, "*x*4,2,0u*i *2i *3i *i *2i *i *i *i*1n"s,
            bit_field (28, 4, Nano_mem (1, nlc + 1)),
            bit_field (32, 2, Nano_mem (1, nlc + 1)),
            bit_field (34, 3, Nano_mem (1, nlc + 1)),
            bit_field (37, 4, Nano_mem (1, nlc + 1)),
            bit_field (41, 2, Nano_mem (1, nlc + 1)),
            bit_field (43, 4, Nano_mem (1, nlc + 1)),
            bit_field (47, 4, Nano_mem (1, nlc + 1)),
            bit_field (51, 4, Nano_mem (1, nlc + 1)) )
         }
      if (Binary && (nlc ~= Nano_lc || mlc ~= Micro_lc))
         call print (STDOUT, "*n"s)
      }

   if (Listing) {
      call print (STDOUT, "*n*nHex Translation:*n*n"s)
      write_hex (STDOUT)
      }

   write_hex (Outfile)

   return

   procedure write_hex {
      local mlc, nlc
      integer mlc, nlc, fd
      for (mlc = 0; mlc < Micro_lc; mlc += 1) {
         call print (fd, "*4,-16,0u*i   *i"s, mlc, Micro_mem (mlc + 1))
         if (bit_field (1, 4, Micro_mem (mlc + 1)) == 2r1111) {
            nlc = bit_field (5, 12, Micro_mem (mlc + 1))
            call print (fd, "*4,-16,0u   *i *i *i *i"s,
               bit_field (1, 16, Nano_mem (1, nlc + 1)),
               bit_field (17, 16, Nano_mem (1, nlc + 1)),
               bit_field (33, 16, Nano_mem (1, nlc + 1)),
               bit_field (49, 16, Nano_mem (1, nlc + 1)) )
            }
         call print (fd, "*n"s)
         }
      }

   end



# setf --- place an integer into a given bit string field

   subroutine setf (start, len, dst, val)
   integer val, len, start, dst (ARB)

   integer i, mask, bleft, lval

   data mask /:177777/  # a word with all bits set

   i = (start - 1) / BITS_PER_WORD + 1
   lval = rt (val, len)

   bleft = BITS_PER_WORD - mod (start - 1, BITS_PER_WORD)

   if (bleft >= len)
      dst (i) = or (and (dst (i),
                         not (ls (rt (mask, len), bleft - len))),
                    ls (lval, bleft - len))
   else {
      dst (i) = or (and (dst (i), not (rt (mask, bleft))),
                    rs (lval, len - bleft))
      dst (i + 1) = or (and (dst (i + 1), not (lt (mask, len - bleft))),
                        ls (lval, BITS_PER_WORD - (len - bleft)))
      }

   return
   end



# translate --- convert Translang source code to hexadecimal

   subroutine translate

   include COMMONBLOCKS

   call find_labels
   call rewind (Infile)
   call micro_program

   return
   end
