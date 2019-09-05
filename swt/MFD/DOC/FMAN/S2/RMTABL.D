

            rmtabl (2) --- remove a symbol table                     03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine rmtabl (table)
                 pointer table

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Rmtabl'  is  used  to  remove  a  symbol  table  created by
                 'mktabl'.  The sole argument is  the  address  of  a  symbol
                 table in dynamic storage space, as returned by 'mktabl'.

                 'Rmtabl'  deletes  each symbol still in the symbol table, so
                 it is not necessary to empty a symbol table before  deleting
                 it  (unless  symbol table nodes contain a pointer to dynamic
                 or linked-string storage, which cannot be reclaimed).

                 Please see the manual entry for 'dsinit' for instructions on
                 initializing the dynamic storage space used  by  the  symbol
                 table routines.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Rmtabl'  traverses  each  chain  headed  by  the hash table
                 created by 'mktabl'.  Each  symbol  table  node  encountered
                 along  the  way  is  returned  to  free storage by a call to
                 'dsfree'.  Once all symbols  are  removed,  the  hash  table
                 itself is returned by a similar call.


            _C_a_l_l_s

                 dsfree


            _S_e_e _A_l_s_o

                 mktabl  (2),  enter  (2), lookup (2), delete (2), dsget (2),
                 dsfree (2), dsinit (2), sctabl (2)
















            rmtabl (2)                    - 1 -                    rmtabl (2)


