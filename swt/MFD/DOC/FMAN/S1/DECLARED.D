

            declared (1) --- test for declared variables             02/22/82


            _U_s_a_g_e

                 declared <variable_name> [<level_offset>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Declared' tests for the existence of a shell variable named
                 <variable_name>.   If the variable exists, 'declared' prints
                 "1"; otherwise it prints "0".

                 If <level_offset> is omitted, 'declared' examines all  lexic
                 levels  for  <variable_name>.   Otherwise,  only  the  level
                 specified (<current_level> -  <level_offset>)  is  searched.
                 (See   'arg'   for   a   more  complete  discussion  of  the
                 <level_offset> mechanism.)


            _E_x_a_m_p_l_e_s

                 if [declared se_params]
                    se_params
                 else
                    echo ""
                 fi


            _S_e_e _A_l_s_o

                 vars (1), arg (1), set (1), forget  (1),  save  (1),  _U_s_e_r_'_s
                 _G_u_i_d_e _f_o_r _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r



























            declared (1)                  - 1 -                  declared (1)


