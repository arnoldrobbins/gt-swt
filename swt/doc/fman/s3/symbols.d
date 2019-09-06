

            symbols (3) --- print cross-assembly symbol table        01/15/83


            _U_s_a_g_e

                 symbols (-6800 | -8080) <object_file>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Symbols'  prints  the symbol table placed in an object code
                 file by one of the cross-assemblers 'as6800' or 'as8080'  or
                 by  the linker 'lk'.  The mandatory first argument specifies
                 the assembler used to create the original object code file.

                 Each symbol is printed along with its (16-bit) value  and  a
                 "type"  designator,  which  is "ext" for external, "rel" for
                 relocatable,  or   "abs"   for   absolute   (8080   register
                 mnemonics).


            _E_x_a_m_p_l_e_s

                 symbols -6800 .o
                 symbols -8080 mux


            _M_e_s_s_a_g_e_s

                 "Usage:  symbols ..."  for invalid argument syntax.
                 Warnings if the object file could not be opened or if it was
                 improperly structured.


            _S_e_e _A_l_s_o

                 as6800 (3), as8080 (3), lk (3), size (3)
























            symbols (3)                   - 1 -                   symbols (3)


