

            gky$xs (4) --- get current cpu keys                      06/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine gky$xs (word)
                 shortcall gky$xs (2)

                 integer word

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 This subroutine loads the current cpu keys into 'word'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented  as  a  simple  PMA  routine  entered via a JSXB
                 (shortcall).  The subroutine uses the TKA instruction.

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 word


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 fc (1), sky$xs  (4),  _S_y_s_t_e_m  _A_r_c_h_i_t_e_c_t_u_r_e  _R_e_f_e_r_e_n_c_e  _G_u_i_d_e
                 (Prime PDR 3060)



















            gky$xs (4)                    - 1 -                    gky$xs (4)


