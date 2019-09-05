

            forget (1) --- destroy shell variables                   03/20/80


            _U_s_a_g_e

                 forget { <identifier> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Forget'  is  used  to  destroy  shell  variables  that were
                 created by 'declare' or 'set'.  The arguments supplied  must
                 be  names  of shell variables that are active at the current
                 lexical level.  The named variables will be removed from the
                 command interpreter's symbol table.

                 Note that it is not necessary to  explicitly  destroy  shell
                 variables  that  are  declared local to a command file; when
                 the execution of the command file is completed, they will be
                 destroyed automatically.


            _E_x_a_m_p_l_e_s

                 forget name address telephone_number
                 forget face


            _S_e_e _A_l_s_o

                 declare (1), set (1), vars (1), save (1), _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r
                 _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r





























            forget (1)                    - 1 -                    forget (1)


