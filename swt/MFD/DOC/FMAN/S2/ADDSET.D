

            addset (2) --- put character in a set if it fits         05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function addset (c, set, j, maxsiz)
                 character c, set (maxsiz)
                 integer j, maxsiz

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Addset'  puts the character 'c' in the array 'set' at posi-
                 tion 'j' and  increments  'j',  provided  that  'j'  is  not
                 greater  than  'maxsiz'.   The function return is YES if 'c'
                 was inserted, NO otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Trivial.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 set, j

































            addset (2)                    - 1 -                    addset (2)


