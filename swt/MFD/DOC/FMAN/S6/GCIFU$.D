

            gcifu$ (6) --- return the current value of the command unit  10/15/81


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gcifu$ (funit)
                 integer funit

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gcifu$'  returns  the  file unit which is providing command
                 input for the shell both in the argument 'funit' and as  the
                 value of the function.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gcifu$'  returns  the  value  contained in 'Comunit' in the
                 Subsystem common block.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 funit


            _S_e_e _A_l_s_o

                 sh (1)





























            gcifu$ (6)                    - 1 -                    gcifu$ (6)


