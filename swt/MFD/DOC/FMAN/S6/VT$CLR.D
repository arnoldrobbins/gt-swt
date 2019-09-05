

            vt$clr (6) --- send clear screen sequence                07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$clr (dummy)
                 integer dummy

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$clr' is used to clear the screen on the user's terminal.
                 The  return  value  is OK if the screen was cleared, and ERR
                 otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The VTH common block is checked for the existence of a clear
                 screen sequence.  If one exists, it is written out, 'vt$del'
                 is called to print out a small delay sequence, and the func-
                 tion return is OK.  If no sequence  exists,  the  return  is
                 ERR.


            _C_a_l_l_s

                 vt$del


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)





















            vt$clr (6)                    - 1 -                    vt$clr (6)


