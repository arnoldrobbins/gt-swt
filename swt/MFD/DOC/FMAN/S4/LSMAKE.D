

            lsmake (4) --- convert contiguous string to linked string  01/03/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function lsmake (ptr, str)
                 pointer ptr
                 character str (ARB)

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  contiguous  string  in  'str' is copied into the linked
                 string space and a pointer to the string is returned both in
                 'ptr' and as the function value.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A new string is allocated with the same length as 'str'  via
                 a  call  to  'lsallo'.   Characters are then copied into the
                 string using 'lsputc'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr


            _C_a_l_l_s

                 length, lsallo, lsputc


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsextr (4)

















            lsmake (4)                    - 1 -                    lsmake (4)


