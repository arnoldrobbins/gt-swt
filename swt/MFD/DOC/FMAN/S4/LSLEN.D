

            lslen (4) --- compute length of linked string            03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function lslen (ptr)
                 pointer ptr

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  length  of the string specified by 'ptr' is returned as
                 the function value.  'Ptr' is not modified.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The number of characters in the string is counted by calling
                 'lsgetc' until it returns EOS.  The length  is  computed  as
                 the number of calls to 'lsgetc' minus 1.


            _C_a_l_l_s

                 lsgetc


            _B_u_g_s

                 Locally supported.





























            lslen (4)                     - 1 -                     lslen (4)


