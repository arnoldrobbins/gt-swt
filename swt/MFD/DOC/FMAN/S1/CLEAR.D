

            clear (1) --- clear terminal screen                      02/22/82


            _U_s_a_g_e

                 clear


            _D_e_s_c_r_i_p_t_i_o_n

                 'Clear'  outputs  the correct characters to clear a terminal
                 screen.  It  calls  'vtinit'  to  get  the  user's  terminal
                 characteristics.   If the terminal type is found, the screen
                 is updated with the blank screen to clear it,  otherwise  25
                 blank lines are output to clear the screen.


            _E_x_a_m_p_l_e_s

                 clear


            _F_i_l_e_s

                 =vth=/<terminal_type>


            _S_e_e _A_l_s_o

                 vtinit (2), vtupd (2), and other VTH routines (vt?*) (2)































            clear (1)                     - 1 -                     clear (1)


