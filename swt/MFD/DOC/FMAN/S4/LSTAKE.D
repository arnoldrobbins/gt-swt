

            lstake (4) --- take characters from a linked string      03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function lstake (ptr, len)
                 pointer ptr
                 integer len

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  value of the function is a pointer to a string consist-
                 ing of the first 'len' characters of the string specified by
                 'ptr'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A string of length 'len' is allocated, and the  first  'len'
                 characters  of the string specified by 'ptr' are copied into
                 it using 'lsgetc' and 'lsputc'.


            _C_a_l_l_s

                 lsallo, lsgetc, lsputc


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsdrop (4), lssubs (4)






















            lstake (4)                    - 1 -                    lstake (4)


