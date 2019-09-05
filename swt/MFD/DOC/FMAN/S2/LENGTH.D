

            length (2) --- find length of a string                   03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function length (str)
                 character str (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Length'  returns  the  length  of  the string passed as its
                 first parameter.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A simple loop is used to count characters until  an  EOS  is
                 encountered.


            _B_u_g_s

                 Slow.



































            length (2)                    - 1 -                    length (2)


