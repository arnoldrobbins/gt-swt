

            tip (1) --- check if terminal input is pending           02/25/82


            _U_s_a_g_e

                 tip


            _D_e_s_c_r_i_p_t_i_o_n

                 'Tip'  checks to see if there is any terminal input pending.
                 If terminal input is waiting to be  read,  'tip'  outputs  a
                 "1".  If no terminal input is waiting to be read, 'tip' out-
                 puts a "0".

                 'Tip' is most commonly used with the 'if' command.


            _E_x_a_m_p_l_e_s

                 if [tip]
                    [set =]
                 fi


            _B_u_g_s

                 Should  probably  be able to check an assigned terminal line
                 for pending input.


            _S_e_e _A_l_s_o

                 if (1), chkinp (2)



























            tip (1)                       - 1 -                       tip (1)


