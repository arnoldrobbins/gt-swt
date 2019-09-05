

            as6800 (3) --- Motorola 6800 cross-assembler             02/23/82


            _U_s_a_g_e

                 as6800 [-{l | d}]


            _D_e_s_c_r_i_p_t_i_o_n

                 'As6800'  is an extremely simplified cross-assembler for the
                 Motorola 6800 microprocessor.

                 It is designed to assemble the output of the  SSPL  compiler
                 in  a  single  pass,  producing a file of relocatable object
                 code with a symbol table (suitable for later  processing  by
                 'mot'  or  'lk').   It is also suitable for limited assembly
                 language coding by hand (allowing the SSPL run-time  package
                 to be assembled).

                 'As6800'  takes a source program on its first standard input
                 and produces an object program on the file ".o".  The assem-
                 bler differs from Motorola's standard in the following ways:

                 1.   Instruction mnemonics that make use of  an  accumulator
                      symbol  ("a"  or  "b")  may  not  be separated from the
                      accumulator symbol.  Thus, "add a #5" is  illegal;  the
                      correct form is "adda #5".
                 2.   Labels  may  appear  in  any mixture of upper and lower
                      case.   Character  case  is  significant.   Instruction
                      mnemonics  must  appear  in  lower  case.   Labels  may
                      include the underscore (_) and  the  grave  accent  (`)
                      characters;  those labels beginning with underscore are
                      not written to the object file symbol table and may  be
                      used  freely  as temporaries.  All characters in labels
                      are significant.
                 3.   Binary and octal number representations  are  not  sup-
                      ported.   Decimal  integers may be used, or hexadecimal
                      integers preceded by a dollar sign ($).
                 4.   The  following  pseudo-operations  are  totally  unsup-
                      ported:   end,  pag, opt, equ.  The fcb and fdb pseudo-
                      ops have been replaced by the 'byte' and 'word' pseudo-
                      ops (otherwise identical in function).  The rmb pseudo-
                      op has been  replaced  by  the  'res'  pseudo-op,  with
                      identical  function.   The  'org'  pseudo-op may not be
                      used to decrease the  location  counter;  only  forward
                      origins are allowed.
                 5.   Arithmetic expressions more complex than labels or sim-
                      ple   integers  are  not  supported.   (SSPL  does  not
                      generate them.)
                 6.   Comments are indicated  by  preceding  commentary  text
                      with  a percent sign (%).  This rule applies uniformly;
                      all comments must be preceded by a percent sign.
                 7.   Unless the "-l" option is specified, 'as6800' does  not
                      produce  an  assembly  listing.  When "-l" is used, the
                      assembly listing is produced on standard output one.
                 8.   Multiple statements may be place on one  line  provided
                      they are separated by semicolons (;).
                 9.   Unless  the  "-d"  option  is  specified,  the 'direct'


            as6800 (3)                    - 1 -                    as6800 (3)




            as6800 (3) --- Motorola 6800 cross-assembler             02/23/82


                      (page-zero) addressing mode is not used (since instruc-
                      tions using it cannot be  relocated).   When  the  "-d"
                      option is used, the user must take care that no direct-
                      address forward references are made.

                 The  object  file  produced by 'as6800' contains a number of
                 "segments," each consisting of a  one-byte  segment  header,
                 two  bytes  of  segment  size,  and the text of the segment.
                 Each byte of the object file occupies one 16-bit word in the
                 physical file.


            _E_x_a_m_p_l_e_s

                 rtr.as> as6800
                 mux.s> lex | sspl | opt6800 | as6800


            _F_i_l_e_s

                 ".o" for the object code file


            _M_e_s_s_a_g_e_s

                 Many error messages,  hopefully  some  of  which  are  self-
                 explanatory.


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 sspl (3), opt6800 (3), as8080 (3), as11 (3), mot (3), lk (3)





















            as6800 (3)                    - 2 -                    as6800 (3)


