

            vt$db3 (6) --- dump macro definition table               07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$db3

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$db3'  prints  the  actual  definition  sequences for the
                 keyboard macros.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 After printing out  a  heading,  'vt$db3'  prints  out  each
                 character   in   the   macro  definition  sequence,  mapping
                 unprintable characters to their corresponding mnemonic.


            _C_a_l_l_s

                 ctomn, print


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)

























            vt$db3 (6)                    - 1 -                    vt$db3 (6)


