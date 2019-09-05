

            lsextr (4) --- extract contiguous string from linked string  02/25/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function lsextr (ptr, str, max)
                 pointer ptr
                 character str (ARB)
                 integer max

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  linked  string specified by 'ptr' is copied into 'str'.
                 No more than 'max' positions of 'str' will be used.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Characters  from  the  linked  string  are  extracted  using
                 'lsgetc' and placed in consecutive positions of 'str'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _C_a_l_l_s

                 lsgetc


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsmake (4)


















            lsextr (4)                    - 1 -                    lsextr (4)


