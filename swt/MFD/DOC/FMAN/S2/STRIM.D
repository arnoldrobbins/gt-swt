

            strim (2) --- trim trailing blanks and tabs from a string  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function strim (str)
                 character str (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Strim'  is  used  to trim trailing blanks and tabs from the
                 EOS-terminated passed as its first argument.   The  function
                 return is the length of the trimmed string, excluding EOS.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 One pass is made through the string, and the position of the
                 last  non-blank,  non-tab  character  remembered.   When the
                 entire  string  has  been  scanned,  an   EOS   is   planted
                 immediately after the last non-blank.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _S_e_e _A_l_s_o

                 stake (2), sdrop (2), substr (2)



























            strim (2)                     - 1 -                     strim (2)


