

            delete (2) --- remove a symbol from a symbol table       03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine delete (symbol, table)
                 character symbol (ARB)
                 pointer table

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Delete'  removes  the  character-string symbol given as its
                 first argument from the symbol table  given  as  its  second
                 argument.   All  information  associated  with the symbol is
                 lost.

                 The symbol table specified must have been generated  by  the
                 routine 'mktabl'.

                 If  the  given  symbol  is  not present in the symbol table,
                 'delete' does nothing; this condition is not  considered  an
                 error.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Delete'  calls  'st$lu'  to  determine  the location of the
                 given symbol in the symbol table.  If present, it is  unlin-
                 ked   from  its  hash  chain.   The  dynamic  storage  space
                 allocated to the symbol's node is returned to the system  by
                 a call to 'dsfree'.


            _C_a_l_l_s

                 st$lu, dsfree


            _S_e_e _A_l_s_o

                 enter  (2),  lookup  (2), mktabl (2), rmtabl (2), st$lu (6),
                 dsget (2), dsfree (2), dsinit (2), sctabl (2)
















            delete (2)                    - 1 -                    delete (2)


