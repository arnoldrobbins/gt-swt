

            dsdbiu (6) --- dump contents of dynamic storage block    02/25/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine dsdbiu (block, form)
                 pointer block
                 character form

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dsdbiu'  is  called  by  'dsdump' to dump the contents of a
                 block of storage that has been allocated  by  'dsget'.   The
                 first  argument  is  a  pointer  to the control words of the
                 block; the second is LETTER for a character dump, DIGIT  for
                 a numeric dump.

                 This routine is technically not available for direct call by
                 the  user,  since  the  format and location of block control
                 words is subject to change.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The SIZE control word of the block is  read  to  obtain  the
                 size of the block, and that many words are written to ERROUT
                 via  'print'  in the particular format specified.  The first
                 argument is incremented to point to the end of the block.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 block


            _C_a_l_l_s

                 print


            _B_u_g_s

                 None that can be helped.


            _S_e_e _A_l_s_o

                 dsget (2), dsfree (2), dsinit (2), dsdump (2)










            dsdbiu (6)                    - 1 -                    dsdbiu (6)


