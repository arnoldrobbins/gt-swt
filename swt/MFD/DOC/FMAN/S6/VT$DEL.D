

            vt$del (6) --- delay the terminal with nulls             07/11/84


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$del (delay)
                 integer delay

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$del'  is  used  to  delay  the terminal for 'delay' mil-
                 liseconds after certain operations.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The VTH common block is checked for the current baud rate of
                 the terminal.  'Delay' is then used to calculate the  number
                 of nulls to write to the terminal.


            _C_a_l_l_s

                 Primos t1ou


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)
























            vt$del (6)                    - 1 -                    vt$del (6)


