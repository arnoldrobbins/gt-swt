

            save (1) --- save shell variables                        03/20/80


            _U_s_a_g_e

                 save


            _D_e_s_c_r_i_p_t_i_o_n

                 'Save'  saves the lexic level 1 shell variables, causing the
                 same action as exiting and reentering the Subsystem.

                 Its primary use is to save the current values of  the  shell
                 variables, so that if the Subsystem crashes they will not be
                 lost.


            _E_x_a_m_p_l_e_s

                    if [nargs]
                       set f = [arg 1 | quote]
                       save
                    fi


            _S_e_e _A_l_s_o

                 declare (1), forget (1), vars (1), set (1)
































            save (1)                      - 1 -                      save (1)


