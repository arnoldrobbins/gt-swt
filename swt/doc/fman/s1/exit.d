

            exit (1) --- terminate execution of command files        03/20/80


            _U_s_a_g_e

                 exit  [ <levels> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Exit' causes execution of one or more currently active com-
                 mand  files  to  cease.   It is somewhat similar to the PL/I
                 "return" statement in that it simulates a normal termination
                 of at least one environment (scope).

                 When invoked, 'exit' positions the  <levels>  most  recently
                 activated command files to end-of-file and dumps the command
                 interpreter's  internal command buffer.  Thus, when the com-
                 mand interpreter next attempts to fetch a command,  it  sees
                 <levels>   successive   ends-of-file   and   cleans  up  the
                 associated environments.  If <levels> is omitted,  only  one
                 level is terminated.

                 'Exit'  is  most often used to terminate a command file when
                 some error condition defined by the user occurs  (for  exam-
                 ple,  an  attempt to use the command file by an unauthorized
                 user).


            _E_x_a_m_p_l_e_s

                 if 1
                    echo "Sorry, you are not allowed to use this program."
                    exit
                 fi


            _B_u_g_s

                 May behave irrationally if <levels> is too large.


            _S_e_e _A_l_s_o

                 error (1), if (1), sh (1), goto (1), _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r















            exit (1)                      - 1 -                      exit (1)


