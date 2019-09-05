

            goto (1) --- command file flow-of-control statement      03/20/80


            _U_s_a_g_e

                 goto <label>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Goto'  provides  a means of altering the flow of control in
                 command files.  After the execution of a 'goto' command, the
                 command interpreter will resume processing  of  the  command
                 file  at the first command (network, to be precise) labelled
                 with the given identifier.  A node (and thus a network)  may
                 be  labelled by preceding it with a colon and an identifier,
                 e.g.

                      :exit echo Done.

                 'Goto' is normally used only within command files;  however,
                 it  may be used from the terminal, with the restriction that
                 control can only be transferred forward, never back.


            _E_x_a_m_p_l_e_s

                 goto exit


            _M_e_s_s_a_g_e_s

                 "goto could not find target label" for a missing label.
                 "Usage:  goto <label>" if used without an argument.


            _B_u_g_s

                 'Goto' does not understand compound nodes, so  jumping  into
                 the  middle  of  one may have unpredictable results.  If the
                 target label is preceded by any I/O redirectors, it will not
                 be recognized.


            _S_e_e _A_l_s_o

                 if (1), case  (1),  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s
                 _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r













            goto (1)                      - 1 -                      goto (1)


