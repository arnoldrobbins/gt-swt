

            sky$xs (4) --- set current cpu keys                      06/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine sky$xs (word)
                 shortcall sky$xs (2)

                 integer word

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 This  routine  loads  bits  1  - 14 of the cpu keys with the
                 corresponding bits of 'word'.  This can change the processor
                 addressing mode (for the current process), set or clear  the
                 carry  and link bits and the condition codes, and change the
                 system's response to integer, real and decimal exceptions.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented as a simple  PMA  routine  entered  via  a  JSXB
                 (shortcall).  The subroutine uses the TAK instruction.

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.


            _B_u_g_s

                 The  user can possibly change the current program addressing
                 mode in a manner that cannot be recovered by this routine.

                 Locally supported.


            _S_e_e _A_l_s_o

                 fc (1), gky$xs  (4),  _S_y_s_t_e_m  _A_r_c_h_i_t_e_c_t_u_r_e  _R_e_f_e_r_e_n_c_e  _G_u_i_d_e
                 (Prime PDR 3060)

















            sky$xs (4)                    - 1 -                    sky$xs (4)


