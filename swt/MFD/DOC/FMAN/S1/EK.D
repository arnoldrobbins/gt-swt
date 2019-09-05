

            ek (1) --- select erase and kill characters              12/16/81


            _U_s_a_g_e

                 ek [ <erase character> <kill character> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Ek'  allows the user to select his erase (character delete)
                 and kill (line delete) characters.  If 'ek' is  called  with
                 two  arguments, the erase and kill characters are set.  Each
                 of the arguments may be a  single  character,  or  an  ASCII
                 mnemonic  for  an  unprintable character.  If 'ek' is called
                 without arguments, the current erase and kill characters are
                 printed.

                 Erase and kill characters are part of the  user's  permanent
                 profile, and so will be remembered from session to session.


            _E_x_a_m_p_l_e_s

                 ek 1 2
                 ek BS DEL
                 ek


            _M_e_s_s_a_g_e_s

                 "Usage:  ek ..."  for improper number of arguments


            _B_u_g_s

                 "ek e k" will produce extremely undesirable effects.


            _S_e_e _A_l_s_o

                 term  (1),  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m
                 _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r


















            ek (1)                        - 1 -                        ek (1)


