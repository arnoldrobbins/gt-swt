

            args (1) --- print command file arguments                03/20/80


            _U_s_a_g_e

                 args <first_argument> [ <last_argument> [ <level_offset> ] ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Args'  is  similar in function to the 'arg' command, except
                 that multiple arguments are  printed.   The  first  argument
                 printed    is    specified    by    <first_argument>.     If
                 <last_argument> is specified, all succeeding arguments up to
                 and including it are printed, separated from each  other  by
                 newlines.   Otherwise,  all remaining arguments are printed,
                 again, separated from each other by newlines.

                 Unlike 'arg', a newline is printed  only  if  at  least  one
                 argument was printed.


            _E_x_a_m_p_l_e_s

                 print [args 1]
                 pr [args 3 5]


            _B_u_g_s

                 There is no way to specify a <level_offset> without specify-
                 ing a <last_argument>.


            _S_e_e _A_l_s_o

                 arg  (1),  nargs  (1),  getarg  (2),  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r























            args (1)                      - 1 -                      args (1)


