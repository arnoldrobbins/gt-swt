

            lspos (4) --- find position in linked string             03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function lspos (ptr, pos)
                 pointer ptr
                 integer pos

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 'Ptr' is updated to point to the string starting at position
                 'pos'.   'Ptr'  will not be updated past the EOS.  The value
                 returned by the function is the character in position 'pos'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The string is traversed until 'pos' - 1 characters have been
                 skipped.  The new pointer is then returned in 'ptr'  and  as
                 the function value.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr


            _B_u_g_s

                 Locally supported.



























            lspos (4)                     - 1 -                     lspos (4)


