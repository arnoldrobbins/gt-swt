

            sh (1) --- Subsystem Command Interpreter (Shell)         07/18/84


          | _U_s_a_g_e

                 sh


            _D_e_s_c_r_i_p_t_i_o_n

                 'Sh'  is  an  entry  into the Subsystem command interpreter.
                 When invoked, it reads  commands  from  standard  input  one
                 until  it  encounters  end-of-file, thus making it useful in
                 pipelines.

                 The functions of the command interpreter are far too complex
                 to describe here; see the  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e  _S_o_f_t_w_a_r_e
                 _T_o_o_l_s  _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r for a tutorial and more
                 detailed information.


            _E_x_a_m_p_l_e_s

                 files .r$ | change % "ar -u arch " | sh
                 command_file> sh >command_output


            _F_i_l_e_s

                 =temp=/t?* for pipe temporaries, function returns, etc.
                 =gossip=/<login_name> for 'to' messages
                 =temp=/cn<line><sequence_number> for compound nodes


            _M_e_s_s_a_g_e_s

          *      Many.  See the User's Guide.


            _S_e_e _A_l_s_o

                 _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m  _C_o_m_m_a_n_d
                 _I_n_t_e_r_p_r_e_t_e_r, _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _T_u_t_o_r_i_a_l


















            sh (1)                        - 1 -                        sh (1)


