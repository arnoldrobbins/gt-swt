

            dsfree (2) --- free a block of dynamic storage           01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine dsfree (block)
                 pointer block

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dsfree'  returns a block of storage allocated by 'dsget' to
                 the available space list.  The argument must  be  a  pointer
                 returned by 'dsget'.

                 See  the  remarks  under 'dsget' for required initialization
                 measures.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dsfree' is an implementation of Algorithm B on page 440  of
                 Volume  1  of  _T_h_e _A_r_t _o_f _C_o_m_p_u_t_e_r _P_r_o_g_r_a_m_m_i_n_g, by Donald E.
                 Knuth.  The reader is referred to that source  for  detailed
                 information.

                 'Dsfree' and 'dsget' maintain a list of free storage blocks,
                 ordered  by address.  'Dsfree' searches the list to find the
                 proper location for the block being  returned,  and  inserts
                 the  block  into  the  list  at that location.  If blocks on
                 either side of the newly-returned block are available,  they
                 are coalesced with the new block.  If the block address does
                 not  correspond  to  the  address  of  any  allocated block,
                 'dsfree' remarks "attempt to  free  unallocated  block"  and
                 waits for the user to type a letter "c" to continue.  If any
                 other character is typed, the program is terminated.


            _C_a_l_l_s

                 getlin, remark


            _B_u_g_s

                 The algorithm itself is not the best.


            _S_e_e _A_l_s_o

                 dsget (2), dsinit (2), dsdump (2), dsdbiu (6)








            dsfree (2)                    - 1 -                    dsfree (2)


