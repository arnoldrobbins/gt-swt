

            mapup (2) --- fold character to upper case               03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function mapup (c)
                 character c

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mapup'  is the inverse of 'mapdn'.  If the character 'c' is
                 a lower case letter, the function return is the  correspond-
                 ing upper case letter; otherwise, the function return is the
                 same as 'c'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 In  'mapup',  as in 'mapdn', considerable use is made of the
                 internal ASCII character code.  If 'c' is between  'a'c  and
                 'z'c,  'c'  -  'a'c  +  'A'c  is returned; otherwise, 'c' is
                 returned.


            _B_u_g_s

                 Inordinate dependence on properties of character code.


            _S_e_e _A_l_s_o

                 mapdn (2), mapstr (2)


























            mapup (2)                     - 1 -                     mapup (2)


