

            as8080 (3) --- Intel 8080 cross-assembler                02/23/82


            _U_s_a_g_e

                 as8080


            _D_e_s_c_r_i_p_t_i_o_n

                 'As8080'  is an extremely simplified cross-assembler for the
                 Intel 8080 microprocessor.

                 It is designed to assemble the output of the  SSPL  compiler
                 in  a  single  pass,  producing a file of relocatable object
                 code with a symbol table (suitable for later  processing  by
                 'intel'  or 'lk').  It is also suitable for limited assembly
                 language coding by hand (allowing the SSPL run-time  package
                 to be assembled).

                 'As8080'  takes a source program on its first standard input
                 and produces an object program on the file ".o".  The source
                 program differs from Intel's standard format in the  follow-
                 ing ways:

                 1.   Instruction mnemonics and labels may appear in any mix-
                      ture  of  upper and lower case.  Case is significant in
                      labels, but not significant in instruction mnemonics or
                      register names.  Labels must be defined  with  trailing
                      colons  (:)  and may include the underscore (_) and the
                      grave accent (`)  characters;  those  labels  beginning
                      with underscore are not written to the object file sym-
                      bol table and may be used freely as temporaries.
                 2.   Register pairs may optionally be referred to as bc, de,
                      hl, and sp.
                 3.   Binary  and  octal  number representations are not sup-
                      ported.  Decimal integers may be used,  or  hexadecimal
                      integers preceded by a dollar sign ($).
                 4.   The  following  pseudo-operations  are  totally  unsup-
                      ported:  end, equ, macro, org,  set.   The  db  and  dw
                      pseudo-ops  have been replaced by the 'byte' and 'word'
                      pseudo-ops (otherwise identical in function).
                 5.   Arithmetic expressions more complex than labels or sim-
                      ple  integers  are  not  supported.   (SSPL  does   not
                      generate them.)
                 6.   Comments  are  indicated  by  preceding commentary text
                      with a sharp sign (#).  This  rule  applies  uniformly;
                      all comments must be preceded by a sharp sign.
                 7.   'As8080' does not produce an assembly listing.
                 8.   Multiple  statements  may be place on one line provided
                      they are separated by semicolons (;).

                 The object file produced by 'as8080' contains  a  number  of
                 "segments,"  each  consisting  of a one-byte segment header,
                 two bytes of segment size, and  the  text  of  the  segment.
                 Each byte of the object file occupies one 16-bit word in the
                 physical file.




            as8080 (3)                    - 1 -                    as8080 (3)




            as8080 (3) --- Intel 8080 cross-assembler                02/23/82


            _E_x_a_m_p_l_e_s

                 rtr.as> as8080
                 mux.s> lex | sspl | opt8080 | as8080


            _F_i_l_e_s

                 ".o" for the object code file


            _M_e_s_s_a_g_e_s

                 Many  error  messages,  hopefully  some  of  which are self-
                 explanatory.


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 sspl (3), opt8080 (3), as6800 (3), as11 (3), intel  (3),  lk
                 (3)
































            as8080 (3)                    - 2 -                    as8080 (3)


