

            lsdump (4) --- dump linked string space for debugging    01/03/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine lsdump

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The linked string space is dumped in semi-readable format to
                 ERROUT.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  string  space  is printed with various calls to 'print'
                 and 'putch'.  Long sequences of 'empty' space  are  compres-
                 sed.   Unprintable  characters  are  printed as octal values
                 enclosed in angle brackets.


            _C_a_l_l_s

                 print, putch


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 dump (1)
























            lsdump (4)                    - 1 -                    lsdump (4)


